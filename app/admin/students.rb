ActiveAdmin.register Student do

  permit_params :bnc_student_id, :du_student_id, :program, :institution_name, :session, :length_of_program,
                :program_completion_length, :date_of_program_admission, :program_start_date, :quota,
                :program_completion_date, :payment_method, :name, :full_name, :sex, :father_name, :mother_name,
                :date_of_birth, :national_id_number, :passport_number, :guardian_name, :relation_with_guardian,
                :nationality, :religion, :marital_status, :email_address, :mobile_number, :avatar, :blood_group,
                addresses_attributes: [:village_house_road, :post_office, :postal_code, :union, :district,
                                     :division, :type],
                educational_qualifications_attributes: [:level_of_education, :institution, :roll, :result,
                                                        :year, :duration, :country_name],
                leaves_attributes: [:start_date, :end_date, :reason, :duration]

  form do |f|
    f.inputs do
      f.input :bnc_student_id, label: 'BNC Student ID'
      f.input :du_student_id, label: 'DU Student ID'
      f.input :program, label: 'Program/ Course Type'
      f.input :institution_name
      f.input :session
      f.input :length_of_program, label: 'Length of Program/Course'
      f.input :program_completion_length, label: 'Student Program Completion Length'
      f.input :date_of_program_admission, label: 'Date of Program/ Course Admission'
      f.input :program_start_date, label: 'Program/ Course Starting Date'
      f.input :program_completion_date, label: 'Program/ Course Completion Date'
      f.input :payment_method
      f.input :name, label: 'Name (Bangla)'
      f.input :full_name, label: 'Full Name (English)'
      f.input :sex
      f.input :father_name, label: 'Father\'s Name(English)'
      f.input :mother_name, label: 'Mother\'s Name (English)'
      f.input :date_of_birth
      f.input :blood_group
      f.input :national_id_number, label: 'National ID No.'
      f.input :passport_number, label: 'Passport No'
      f.input :guardian_name
      f.input :relation_with_guardian
      f.input :quota, label: 'Quota(Grand Daughter/ Son or Great GrandDaughter/ Son of Freedom Fighter)'
      f.input :nationality
      f.input :religion
      f.input :marital_status
      f.input :email_address, label: 'E-mail Address'
      f.input :mobile_number
      f.input :avatar, as: :file, label: 'Image'
    end
    f.has_many :addresses do  |address|
      address.inputs do
        address.input :type
        address.input :village_house_road, label: 'Village/ House/ Road'
        address.input :post_office
        address.input :postal_code
        address.input :union, label: 'Thana / Upazila'
        address.input :district
        address.input :division
      end
    end
    f.has_many :educational_qualifications do |educational_qualification|
      educational_qualification.inputs do
        educational_qualification.input :level_of_education
        educational_qualification.input :institution
        educational_qualification.input :roll
        educational_qualification.input :result, label: 'Class/ CGPA'
        educational_qualification.input :year
        educational_qualification.input :duration
        educational_qualification.input :country_name, label: 'Country', value: 'Bangladesh'
      end
    end
    f.has_many :leaves do |leave|
      leave.inputs do
        leave.input :start_date
        leave.input :end_date
        leave.input :reason
        leave.input :duration
      end
    end
    f.actions
  end

end
