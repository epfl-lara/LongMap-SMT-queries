; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68112 () Bool)

(assert start!68112)

(declare-fun b!792001 () Bool)

(declare-fun res!536806 () Bool)

(declare-fun e!440047 () Bool)

(assert (=> b!792001 (=> (not res!536806) (not e!440047))))

(declare-datatypes ((array!43003 0))(
  ( (array!43004 (arr!20585 (Array (_ BitVec 32) (_ BitVec 64))) (size!21006 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43003)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43003 (_ BitVec 32)) Bool)

(assert (=> b!792001 (= res!536806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!792002 () Bool)

(declare-fun res!536808 () Bool)

(declare-fun e!440046 () Bool)

(assert (=> b!792002 (=> (not res!536808) (not e!440046))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!792002 (= res!536808 (and (= (size!21006 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21006 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21006 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!792003 () Bool)

(assert (=> b!792003 (= e!440046 e!440047)))

(declare-fun res!536805 () Bool)

(assert (=> b!792003 (=> (not res!536805) (not e!440047))))

(declare-datatypes ((SeekEntryResult!8173 0))(
  ( (MissingZero!8173 (index!35060 (_ BitVec 32))) (Found!8173 (index!35061 (_ BitVec 32))) (Intermediate!8173 (undefined!8985 Bool) (index!35062 (_ BitVec 32)) (x!66022 (_ BitVec 32))) (Undefined!8173) (MissingVacant!8173 (index!35063 (_ BitVec 32))) )
))
(declare-fun lt!353183 () SeekEntryResult!8173)

(assert (=> b!792003 (= res!536805 (or (= lt!353183 (MissingZero!8173 i!1163)) (= lt!353183 (MissingVacant!8173 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43003 (_ BitVec 32)) SeekEntryResult!8173)

(assert (=> b!792003 (= lt!353183 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!792004 () Bool)

(declare-fun res!536810 () Bool)

(assert (=> b!792004 (=> (not res!536810) (not e!440047))))

(assert (=> b!792004 (= res!536810 (and (bvsle #b00000000000000000000000000000000 (size!21006 a!3170)) (bvslt (size!21006 a!3170) #b01111111111111111111111111111111)))))

(declare-fun b!792005 () Bool)

(declare-datatypes ((List!14587 0))(
  ( (Nil!14584) (Cons!14583 (h!15712 (_ BitVec 64)) (t!20893 List!14587)) )
))
(declare-fun noDuplicate!1289 (List!14587) Bool)

(assert (=> b!792005 (= e!440047 (not (noDuplicate!1289 Nil!14584)))))

(declare-fun b!792006 () Bool)

(declare-fun res!536809 () Bool)

(assert (=> b!792006 (=> (not res!536809) (not e!440046))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792006 (= res!536809 (validKeyInArray!0 (select (arr!20585 a!3170) j!153)))))

(declare-fun b!792007 () Bool)

(declare-fun res!536807 () Bool)

(assert (=> b!792007 (=> (not res!536807) (not e!440046))))

(declare-fun arrayContainsKey!0 (array!43003 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792007 (= res!536807 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!536811 () Bool)

(assert (=> start!68112 (=> (not res!536811) (not e!440046))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68112 (= res!536811 (validMask!0 mask!3266))))

(assert (=> start!68112 e!440046))

(assert (=> start!68112 true))

(declare-fun array_inv!16468 (array!43003) Bool)

(assert (=> start!68112 (array_inv!16468 a!3170)))

(declare-fun b!792008 () Bool)

(declare-fun res!536804 () Bool)

(assert (=> b!792008 (=> (not res!536804) (not e!440046))))

(assert (=> b!792008 (= res!536804 (validKeyInArray!0 k0!2044))))

(assert (= (and start!68112 res!536811) b!792002))

(assert (= (and b!792002 res!536808) b!792006))

(assert (= (and b!792006 res!536809) b!792008))

(assert (= (and b!792008 res!536804) b!792007))

(assert (= (and b!792007 res!536807) b!792003))

(assert (= (and b!792003 res!536805) b!792001))

(assert (= (and b!792001 res!536806) b!792004))

(assert (= (and b!792004 res!536810) b!792005))

(declare-fun m!732133 () Bool)

(assert (=> start!68112 m!732133))

(declare-fun m!732135 () Bool)

(assert (=> start!68112 m!732135))

(declare-fun m!732137 () Bool)

(assert (=> b!792005 m!732137))

(declare-fun m!732139 () Bool)

(assert (=> b!792008 m!732139))

(declare-fun m!732141 () Bool)

(assert (=> b!792001 m!732141))

(declare-fun m!732143 () Bool)

(assert (=> b!792006 m!732143))

(assert (=> b!792006 m!732143))

(declare-fun m!732145 () Bool)

(assert (=> b!792006 m!732145))

(declare-fun m!732147 () Bool)

(assert (=> b!792003 m!732147))

(declare-fun m!732149 () Bool)

(assert (=> b!792007 m!732149))

(check-sat (not b!792005) (not start!68112) (not b!792003) (not b!792006) (not b!792007) (not b!792008) (not b!792001))
(check-sat)
(get-model)

(declare-fun d!102979 () Bool)

(assert (=> d!102979 (= (validKeyInArray!0 (select (arr!20585 a!3170) j!153)) (and (not (= (select (arr!20585 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20585 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!792006 d!102979))

(declare-fun b!792065 () Bool)

(declare-fun e!440072 () Bool)

(declare-fun call!35305 () Bool)

(assert (=> b!792065 (= e!440072 call!35305)))

(declare-fun b!792066 () Bool)

(declare-fun e!440073 () Bool)

(assert (=> b!792066 (= e!440073 e!440072)))

(declare-fun c!88011 () Bool)

(assert (=> b!792066 (= c!88011 (validKeyInArray!0 (select (arr!20585 a!3170) #b00000000000000000000000000000000)))))

(declare-fun bm!35302 () Bool)

(assert (=> bm!35302 (= call!35305 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(declare-fun b!792068 () Bool)

(declare-fun e!440074 () Bool)

(assert (=> b!792068 (= e!440074 call!35305)))

(declare-fun d!102981 () Bool)

(declare-fun res!536865 () Bool)

(assert (=> d!102981 (=> res!536865 e!440073)))

(assert (=> d!102981 (= res!536865 (bvsge #b00000000000000000000000000000000 (size!21006 a!3170)))))

(assert (=> d!102981 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!440073)))

(declare-fun b!792067 () Bool)

(assert (=> b!792067 (= e!440072 e!440074)))

(declare-fun lt!353196 () (_ BitVec 64))

(assert (=> b!792067 (= lt!353196 (select (arr!20585 a!3170) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27414 0))(
  ( (Unit!27415) )
))
(declare-fun lt!353198 () Unit!27414)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!43003 (_ BitVec 64) (_ BitVec 32)) Unit!27414)

(assert (=> b!792067 (= lt!353198 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!353196 #b00000000000000000000000000000000))))

(assert (=> b!792067 (arrayContainsKey!0 a!3170 lt!353196 #b00000000000000000000000000000000)))

(declare-fun lt!353197 () Unit!27414)

(assert (=> b!792067 (= lt!353197 lt!353198)))

(declare-fun res!536864 () Bool)

(assert (=> b!792067 (= res!536864 (= (seekEntryOrOpen!0 (select (arr!20585 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8173 #b00000000000000000000000000000000)))))

(assert (=> b!792067 (=> (not res!536864) (not e!440074))))

(assert (= (and d!102981 (not res!536865)) b!792066))

(assert (= (and b!792066 c!88011) b!792067))

(assert (= (and b!792066 (not c!88011)) b!792065))

(assert (= (and b!792067 res!536864) b!792068))

(assert (= (or b!792068 b!792065) bm!35302))

(declare-fun m!732187 () Bool)

(assert (=> b!792066 m!732187))

(assert (=> b!792066 m!732187))

(declare-fun m!732189 () Bool)

(assert (=> b!792066 m!732189))

(declare-fun m!732191 () Bool)

(assert (=> bm!35302 m!732191))

(assert (=> b!792067 m!732187))

(declare-fun m!732193 () Bool)

(assert (=> b!792067 m!732193))

(declare-fun m!732195 () Bool)

(assert (=> b!792067 m!732195))

(assert (=> b!792067 m!732187))

(declare-fun m!732197 () Bool)

(assert (=> b!792067 m!732197))

(assert (=> b!792001 d!102981))

(declare-fun d!102985 () Bool)

(declare-fun res!536874 () Bool)

(declare-fun e!440083 () Bool)

(assert (=> d!102985 (=> res!536874 e!440083)))

(get-info :version)

(assert (=> d!102985 (= res!536874 ((_ is Nil!14584) Nil!14584))))

(assert (=> d!102985 (= (noDuplicate!1289 Nil!14584) e!440083)))

(declare-fun b!792075 () Bool)

(declare-fun e!440084 () Bool)

(assert (=> b!792075 (= e!440083 e!440084)))

(declare-fun res!536875 () Bool)

(assert (=> b!792075 (=> (not res!536875) (not e!440084))))

(declare-fun contains!4094 (List!14587 (_ BitVec 64)) Bool)

(assert (=> b!792075 (= res!536875 (not (contains!4094 (t!20893 Nil!14584) (h!15712 Nil!14584))))))

(declare-fun b!792076 () Bool)

(assert (=> b!792076 (= e!440084 (noDuplicate!1289 (t!20893 Nil!14584)))))

(assert (= (and d!102985 (not res!536874)) b!792075))

(assert (= (and b!792075 res!536875) b!792076))

(declare-fun m!732199 () Bool)

(assert (=> b!792075 m!732199))

(declare-fun m!732201 () Bool)

(assert (=> b!792076 m!732201))

(assert (=> b!792005 d!102985))

(declare-fun d!102989 () Bool)

(assert (=> d!102989 (= (validKeyInArray!0 k0!2044) (and (not (= k0!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!792008 d!102989))

(declare-fun d!102991 () Bool)

(declare-fun lt!353221 () SeekEntryResult!8173)

(assert (=> d!102991 (and (or ((_ is Undefined!8173) lt!353221) (not ((_ is Found!8173) lt!353221)) (and (bvsge (index!35061 lt!353221) #b00000000000000000000000000000000) (bvslt (index!35061 lt!353221) (size!21006 a!3170)))) (or ((_ is Undefined!8173) lt!353221) ((_ is Found!8173) lt!353221) (not ((_ is MissingZero!8173) lt!353221)) (and (bvsge (index!35060 lt!353221) #b00000000000000000000000000000000) (bvslt (index!35060 lt!353221) (size!21006 a!3170)))) (or ((_ is Undefined!8173) lt!353221) ((_ is Found!8173) lt!353221) ((_ is MissingZero!8173) lt!353221) (not ((_ is MissingVacant!8173) lt!353221)) (and (bvsge (index!35063 lt!353221) #b00000000000000000000000000000000) (bvslt (index!35063 lt!353221) (size!21006 a!3170)))) (or ((_ is Undefined!8173) lt!353221) (ite ((_ is Found!8173) lt!353221) (= (select (arr!20585 a!3170) (index!35061 lt!353221)) k0!2044) (ite ((_ is MissingZero!8173) lt!353221) (= (select (arr!20585 a!3170) (index!35060 lt!353221)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8173) lt!353221) (= (select (arr!20585 a!3170) (index!35063 lt!353221)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!440110 () SeekEntryResult!8173)

(assert (=> d!102991 (= lt!353221 e!440110)))

(declare-fun c!88035 () Bool)

(declare-fun lt!353220 () SeekEntryResult!8173)

(assert (=> d!102991 (= c!88035 (and ((_ is Intermediate!8173) lt!353220) (undefined!8985 lt!353220)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43003 (_ BitVec 32)) SeekEntryResult!8173)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!102991 (= lt!353220 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2044 mask!3266) k0!2044 a!3170 mask!3266))))

(assert (=> d!102991 (validMask!0 mask!3266)))

(assert (=> d!102991 (= (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266) lt!353221)))

(declare-fun b!792123 () Bool)

(declare-fun e!440108 () SeekEntryResult!8173)

(assert (=> b!792123 (= e!440110 e!440108)))

(declare-fun lt!353222 () (_ BitVec 64))

(assert (=> b!792123 (= lt!353222 (select (arr!20585 a!3170) (index!35062 lt!353220)))))

(declare-fun c!88033 () Bool)

(assert (=> b!792123 (= c!88033 (= lt!353222 k0!2044))))

(declare-fun b!792124 () Bool)

(declare-fun c!88034 () Bool)

(assert (=> b!792124 (= c!88034 (= lt!353222 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!440109 () SeekEntryResult!8173)

(assert (=> b!792124 (= e!440108 e!440109)))

(declare-fun b!792125 () Bool)

(assert (=> b!792125 (= e!440108 (Found!8173 (index!35062 lt!353220)))))

(declare-fun b!792126 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43003 (_ BitVec 32)) SeekEntryResult!8173)

(assert (=> b!792126 (= e!440109 (seekKeyOrZeroReturnVacant!0 (x!66022 lt!353220) (index!35062 lt!353220) (index!35062 lt!353220) k0!2044 a!3170 mask!3266))))

(declare-fun b!792127 () Bool)

(assert (=> b!792127 (= e!440110 Undefined!8173)))

(declare-fun b!792128 () Bool)

(assert (=> b!792128 (= e!440109 (MissingZero!8173 (index!35062 lt!353220)))))

(assert (= (and d!102991 c!88035) b!792127))

(assert (= (and d!102991 (not c!88035)) b!792123))

(assert (= (and b!792123 c!88033) b!792125))

(assert (= (and b!792123 (not c!88033)) b!792124))

(assert (= (and b!792124 c!88034) b!792128))

(assert (= (and b!792124 (not c!88034)) b!792126))

(declare-fun m!732221 () Bool)

(assert (=> d!102991 m!732221))

(declare-fun m!732223 () Bool)

(assert (=> d!102991 m!732223))

(declare-fun m!732225 () Bool)

(assert (=> d!102991 m!732225))

(assert (=> d!102991 m!732133))

(declare-fun m!732227 () Bool)

(assert (=> d!102991 m!732227))

(assert (=> d!102991 m!732223))

(declare-fun m!732229 () Bool)

(assert (=> d!102991 m!732229))

(declare-fun m!732231 () Bool)

(assert (=> b!792123 m!732231))

(declare-fun m!732233 () Bool)

(assert (=> b!792126 m!732233))

(assert (=> b!792003 d!102991))

(declare-fun d!102999 () Bool)

(assert (=> d!102999 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!68112 d!102999))

(declare-fun d!103007 () Bool)

(assert (=> d!103007 (= (array_inv!16468 a!3170) (bvsge (size!21006 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!68112 d!103007))

(declare-fun d!103009 () Bool)

(declare-fun res!536888 () Bool)

(declare-fun e!440127 () Bool)

(assert (=> d!103009 (=> res!536888 e!440127)))

(assert (=> d!103009 (= res!536888 (= (select (arr!20585 a!3170) #b00000000000000000000000000000000) k0!2044))))

(assert (=> d!103009 (= (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000) e!440127)))

(declare-fun b!792151 () Bool)

(declare-fun e!440128 () Bool)

(assert (=> b!792151 (= e!440127 e!440128)))

(declare-fun res!536889 () Bool)

(assert (=> b!792151 (=> (not res!536889) (not e!440128))))

(assert (=> b!792151 (= res!536889 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!21006 a!3170)))))

(declare-fun b!792152 () Bool)

(assert (=> b!792152 (= e!440128 (arrayContainsKey!0 a!3170 k0!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!103009 (not res!536888)) b!792151))

(assert (= (and b!792151 res!536889) b!792152))

(assert (=> d!103009 m!732187))

(declare-fun m!732261 () Bool)

(assert (=> b!792152 m!732261))

(assert (=> b!792007 d!103009))

(check-sat (not b!792126) (not b!792066) (not b!792152) (not d!102991) (not b!792076) (not b!792075) (not b!792067) (not bm!35302))
(check-sat)
