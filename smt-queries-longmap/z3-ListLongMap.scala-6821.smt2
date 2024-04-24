; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85924 () Bool)

(assert start!85924)

(declare-fun b!995860 () Bool)

(declare-fun res!665804 () Bool)

(declare-fun e!562021 () Bool)

(assert (=> b!995860 (=> (not res!665804) (not e!562021))))

(declare-datatypes ((array!63000 0))(
  ( (array!63001 (arr!30334 (Array (_ BitVec 32) (_ BitVec 64))) (size!30837 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63000)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!995860 (= res!665804 (and (= (size!30837 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30837 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30837 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!995861 () Bool)

(declare-fun res!665805 () Bool)

(assert (=> b!995861 (=> (not res!665805) (not e!562021))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!995861 (= res!665805 (validKeyInArray!0 k0!2224))))

(declare-fun b!995862 () Bool)

(declare-fun res!665803 () Bool)

(assert (=> b!995862 (=> (not res!665803) (not e!562021))))

(assert (=> b!995862 (= res!665803 (validKeyInArray!0 (select (arr!30334 a!3219) j!170)))))

(declare-fun res!665802 () Bool)

(assert (=> start!85924 (=> (not res!665802) (not e!562021))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85924 (= res!665802 (validMask!0 mask!3464))))

(assert (=> start!85924 e!562021))

(declare-fun array_inv!23470 (array!63000) Bool)

(assert (=> start!85924 (array_inv!23470 a!3219)))

(assert (=> start!85924 true))

(declare-fun b!995863 () Bool)

(declare-fun e!562022 () Bool)

(assert (=> b!995863 (= e!562021 e!562022)))

(declare-fun res!665801 () Bool)

(assert (=> b!995863 (=> (not res!665801) (not e!562022))))

(declare-datatypes ((SeekEntryResult!9202 0))(
  ( (MissingZero!9202 (index!39179 (_ BitVec 32))) (Found!9202 (index!39180 (_ BitVec 32))) (Intermediate!9202 (undefined!10014 Bool) (index!39181 (_ BitVec 32)) (x!86777 (_ BitVec 32))) (Undefined!9202) (MissingVacant!9202 (index!39182 (_ BitVec 32))) )
))
(declare-fun lt!441155 () SeekEntryResult!9202)

(assert (=> b!995863 (= res!665801 (or (= lt!441155 (MissingVacant!9202 i!1194)) (= lt!441155 (MissingZero!9202 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63000 (_ BitVec 32)) SeekEntryResult!9202)

(assert (=> b!995863 (= lt!441155 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!995864 () Bool)

(declare-fun res!665806 () Bool)

(assert (=> b!995864 (=> (not res!665806) (not e!562021))))

(declare-fun arrayContainsKey!0 (array!63000 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!995864 (= res!665806 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!995865 () Bool)

(declare-fun res!665807 () Bool)

(assert (=> b!995865 (=> (not res!665807) (not e!562022))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63000 (_ BitVec 32)) Bool)

(assert (=> b!995865 (= res!665807 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!995866 () Bool)

(assert (=> b!995866 (= e!562022 (and (bvsle #b00000000000000000000000000000000 (size!30837 a!3219)) (bvsge (size!30837 a!3219) #b01111111111111111111111111111111)))))

(assert (= (and start!85924 res!665802) b!995860))

(assert (= (and b!995860 res!665804) b!995862))

(assert (= (and b!995862 res!665803) b!995861))

(assert (= (and b!995861 res!665805) b!995864))

(assert (= (and b!995864 res!665806) b!995863))

(assert (= (and b!995863 res!665801) b!995865))

(assert (= (and b!995865 res!665807) b!995866))

(declare-fun m!923789 () Bool)

(assert (=> b!995864 m!923789))

(declare-fun m!923791 () Bool)

(assert (=> b!995862 m!923791))

(assert (=> b!995862 m!923791))

(declare-fun m!923793 () Bool)

(assert (=> b!995862 m!923793))

(declare-fun m!923795 () Bool)

(assert (=> b!995865 m!923795))

(declare-fun m!923797 () Bool)

(assert (=> b!995863 m!923797))

(declare-fun m!923799 () Bool)

(assert (=> start!85924 m!923799))

(declare-fun m!923801 () Bool)

(assert (=> start!85924 m!923801))

(declare-fun m!923803 () Bool)

(assert (=> b!995861 m!923803))

(check-sat (not b!995861) (not start!85924) (not b!995864) (not b!995862) (not b!995865) (not b!995863))
(check-sat)
(get-model)

(declare-fun d!119093 () Bool)

(declare-fun lt!441169 () SeekEntryResult!9202)

(get-info :version)

(assert (=> d!119093 (and (or ((_ is Undefined!9202) lt!441169) (not ((_ is Found!9202) lt!441169)) (and (bvsge (index!39180 lt!441169) #b00000000000000000000000000000000) (bvslt (index!39180 lt!441169) (size!30837 a!3219)))) (or ((_ is Undefined!9202) lt!441169) ((_ is Found!9202) lt!441169) (not ((_ is MissingZero!9202) lt!441169)) (and (bvsge (index!39179 lt!441169) #b00000000000000000000000000000000) (bvslt (index!39179 lt!441169) (size!30837 a!3219)))) (or ((_ is Undefined!9202) lt!441169) ((_ is Found!9202) lt!441169) ((_ is MissingZero!9202) lt!441169) (not ((_ is MissingVacant!9202) lt!441169)) (and (bvsge (index!39182 lt!441169) #b00000000000000000000000000000000) (bvslt (index!39182 lt!441169) (size!30837 a!3219)))) (or ((_ is Undefined!9202) lt!441169) (ite ((_ is Found!9202) lt!441169) (= (select (arr!30334 a!3219) (index!39180 lt!441169)) k0!2224) (ite ((_ is MissingZero!9202) lt!441169) (= (select (arr!30334 a!3219) (index!39179 lt!441169)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9202) lt!441169) (= (select (arr!30334 a!3219) (index!39182 lt!441169)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!562050 () SeekEntryResult!9202)

(assert (=> d!119093 (= lt!441169 e!562050)))

(declare-fun c!101182 () Bool)

(declare-fun lt!441168 () SeekEntryResult!9202)

(assert (=> d!119093 (= c!101182 (and ((_ is Intermediate!9202) lt!441168) (undefined!10014 lt!441168)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63000 (_ BitVec 32)) SeekEntryResult!9202)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!119093 (= lt!441168 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!119093 (validMask!0 mask!3464)))

(assert (=> d!119093 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!441169)))

(declare-fun b!995921 () Bool)

(declare-fun c!101180 () Bool)

(declare-fun lt!441170 () (_ BitVec 64))

(assert (=> b!995921 (= c!101180 (= lt!441170 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!562049 () SeekEntryResult!9202)

(declare-fun e!562048 () SeekEntryResult!9202)

(assert (=> b!995921 (= e!562049 e!562048)))

(declare-fun b!995922 () Bool)

(assert (=> b!995922 (= e!562050 Undefined!9202)))

(declare-fun b!995923 () Bool)

(assert (=> b!995923 (= e!562048 (MissingZero!9202 (index!39181 lt!441168)))))

(declare-fun b!995924 () Bool)

(assert (=> b!995924 (= e!562049 (Found!9202 (index!39181 lt!441168)))))

(declare-fun b!995925 () Bool)

(assert (=> b!995925 (= e!562050 e!562049)))

(assert (=> b!995925 (= lt!441170 (select (arr!30334 a!3219) (index!39181 lt!441168)))))

(declare-fun c!101181 () Bool)

(assert (=> b!995925 (= c!101181 (= lt!441170 k0!2224))))

(declare-fun b!995926 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63000 (_ BitVec 32)) SeekEntryResult!9202)

(assert (=> b!995926 (= e!562048 (seekKeyOrZeroReturnVacant!0 (x!86777 lt!441168) (index!39181 lt!441168) (index!39181 lt!441168) k0!2224 a!3219 mask!3464))))

(assert (= (and d!119093 c!101182) b!995922))

(assert (= (and d!119093 (not c!101182)) b!995925))

(assert (= (and b!995925 c!101181) b!995924))

(assert (= (and b!995925 (not c!101181)) b!995921))

(assert (= (and b!995921 c!101180) b!995923))

(assert (= (and b!995921 (not c!101180)) b!995926))

(assert (=> d!119093 m!923799))

(declare-fun m!923837 () Bool)

(assert (=> d!119093 m!923837))

(declare-fun m!923839 () Bool)

(assert (=> d!119093 m!923839))

(declare-fun m!923841 () Bool)

(assert (=> d!119093 m!923841))

(declare-fun m!923843 () Bool)

(assert (=> d!119093 m!923843))

(assert (=> d!119093 m!923843))

(declare-fun m!923845 () Bool)

(assert (=> d!119093 m!923845))

(declare-fun m!923847 () Bool)

(assert (=> b!995925 m!923847))

(declare-fun m!923849 () Bool)

(assert (=> b!995926 m!923849))

(assert (=> b!995863 d!119093))

(declare-fun d!119099 () Bool)

(assert (=> d!119099 (= (validKeyInArray!0 (select (arr!30334 a!3219) j!170)) (and (not (= (select (arr!30334 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30334 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!995862 d!119099))

(declare-fun d!119101 () Bool)

(assert (=> d!119101 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!85924 d!119101))

(declare-fun d!119113 () Bool)

(assert (=> d!119113 (= (array_inv!23470 a!3219) (bvsge (size!30837 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!85924 d!119113))

(declare-fun d!119115 () Bool)

(assert (=> d!119115 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!995861 d!119115))

(declare-fun d!119117 () Bool)

(declare-fun res!665866 () Bool)

(declare-fun e!562070 () Bool)

(assert (=> d!119117 (=> res!665866 e!562070)))

(assert (=> d!119117 (= res!665866 (= (select (arr!30334 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!119117 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!562070)))

(declare-fun b!995949 () Bool)

(declare-fun e!562071 () Bool)

(assert (=> b!995949 (= e!562070 e!562071)))

(declare-fun res!665867 () Bool)

(assert (=> b!995949 (=> (not res!665867) (not e!562071))))

(assert (=> b!995949 (= res!665867 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30837 a!3219)))))

(declare-fun b!995950 () Bool)

(assert (=> b!995950 (= e!562071 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119117 (not res!665866)) b!995949))

(assert (= (and b!995949 res!665867) b!995950))

(declare-fun m!923865 () Bool)

(assert (=> d!119117 m!923865))

(declare-fun m!923867 () Bool)

(assert (=> b!995950 m!923867))

(assert (=> b!995864 d!119117))

(declare-fun b!995971 () Bool)

(declare-fun e!562088 () Bool)

(declare-fun call!42232 () Bool)

(assert (=> b!995971 (= e!562088 call!42232)))

(declare-fun b!995972 () Bool)

(declare-fun e!562087 () Bool)

(declare-fun e!562089 () Bool)

(assert (=> b!995972 (= e!562087 e!562089)))

(declare-fun c!101191 () Bool)

(assert (=> b!995972 (= c!101191 (validKeyInArray!0 (select (arr!30334 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!995973 () Bool)

(assert (=> b!995973 (= e!562089 e!562088)))

(declare-fun lt!441195 () (_ BitVec 64))

(assert (=> b!995973 (= lt!441195 (select (arr!30334 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32935 0))(
  ( (Unit!32936) )
))
(declare-fun lt!441196 () Unit!32935)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63000 (_ BitVec 64) (_ BitVec 32)) Unit!32935)

(assert (=> b!995973 (= lt!441196 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!441195 #b00000000000000000000000000000000))))

(assert (=> b!995973 (arrayContainsKey!0 a!3219 lt!441195 #b00000000000000000000000000000000)))

(declare-fun lt!441197 () Unit!32935)

(assert (=> b!995973 (= lt!441197 lt!441196)))

(declare-fun res!665878 () Bool)

(assert (=> b!995973 (= res!665878 (= (seekEntryOrOpen!0 (select (arr!30334 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9202 #b00000000000000000000000000000000)))))

(assert (=> b!995973 (=> (not res!665878) (not e!562088))))

(declare-fun d!119119 () Bool)

(declare-fun res!665879 () Bool)

(assert (=> d!119119 (=> res!665879 e!562087)))

(assert (=> d!119119 (= res!665879 (bvsge #b00000000000000000000000000000000 (size!30837 a!3219)))))

(assert (=> d!119119 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!562087)))

(declare-fun b!995974 () Bool)

(assert (=> b!995974 (= e!562089 call!42232)))

(declare-fun bm!42229 () Bool)

(assert (=> bm!42229 (= call!42232 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(assert (= (and d!119119 (not res!665879)) b!995972))

(assert (= (and b!995972 c!101191) b!995973))

(assert (= (and b!995972 (not c!101191)) b!995974))

(assert (= (and b!995973 res!665878) b!995971))

(assert (= (or b!995971 b!995974) bm!42229))

(assert (=> b!995972 m!923865))

(assert (=> b!995972 m!923865))

(declare-fun m!923881 () Bool)

(assert (=> b!995972 m!923881))

(assert (=> b!995973 m!923865))

(declare-fun m!923883 () Bool)

(assert (=> b!995973 m!923883))

(declare-fun m!923885 () Bool)

(assert (=> b!995973 m!923885))

(assert (=> b!995973 m!923865))

(declare-fun m!923887 () Bool)

(assert (=> b!995973 m!923887))

(declare-fun m!923889 () Bool)

(assert (=> bm!42229 m!923889))

(assert (=> b!995865 d!119119))

(check-sat (not bm!42229) (not b!995926) (not b!995973) (not b!995972) (not d!119093) (not b!995950))
(check-sat)
