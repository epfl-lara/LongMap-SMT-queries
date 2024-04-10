; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48494 () Bool)

(assert start!48494)

(declare-fun b!532709 () Bool)

(declare-fun res!328063 () Bool)

(declare-fun e!310104 () Bool)

(assert (=> b!532709 (=> (not res!328063) (not e!310104))))

(declare-datatypes ((array!33757 0))(
  ( (array!33758 (arr!16219 (Array (_ BitVec 32) (_ BitVec 64))) (size!16583 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33757)

(declare-datatypes ((List!10338 0))(
  ( (Nil!10335) (Cons!10334 (h!11274 (_ BitVec 64)) (t!16566 List!10338)) )
))
(declare-fun arrayNoDuplicates!0 (array!33757 (_ BitVec 32) List!10338) Bool)

(assert (=> b!532709 (= res!328063 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10335))))

(declare-fun b!532710 () Bool)

(declare-fun res!328056 () Bool)

(declare-fun e!310103 () Bool)

(assert (=> b!532710 (=> (not res!328056) (not e!310103))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!532710 (= res!328056 (and (= (size!16583 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16583 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16583 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!532711 () Bool)

(declare-fun res!328062 () Bool)

(assert (=> b!532711 (=> (not res!328062) (not e!310103))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!532711 (= res!328062 (validKeyInArray!0 (select (arr!16219 a!3154) j!147)))))

(declare-fun b!532712 () Bool)

(declare-fun res!328058 () Bool)

(assert (=> b!532712 (=> (not res!328058) (not e!310104))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4677 0))(
  ( (MissingZero!4677 (index!20932 (_ BitVec 32))) (Found!4677 (index!20933 (_ BitVec 32))) (Intermediate!4677 (undefined!5489 Bool) (index!20934 (_ BitVec 32)) (x!49902 (_ BitVec 32))) (Undefined!4677) (MissingVacant!4677 (index!20935 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33757 (_ BitVec 32)) SeekEntryResult!4677)

(assert (=> b!532712 (= res!328058 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16219 a!3154) j!147) a!3154 mask!3216) (Intermediate!4677 false resIndex!32 resX!32)))))

(declare-fun b!532713 () Bool)

(declare-fun res!328061 () Bool)

(assert (=> b!532713 (=> (not res!328061) (not e!310103))))

(declare-fun k0!1998 () (_ BitVec 64))

(assert (=> b!532713 (= res!328061 (validKeyInArray!0 k0!1998))))

(declare-fun b!532714 () Bool)

(declare-fun res!328059 () Bool)

(assert (=> b!532714 (=> (not res!328059) (not e!310104))))

(assert (=> b!532714 (= res!328059 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16583 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16583 a!3154)) (= (select (arr!16219 a!3154) resIndex!32) (select (arr!16219 a!3154) j!147))))))

(declare-fun b!532715 () Bool)

(declare-fun lt!245265 () (_ BitVec 32))

(assert (=> b!532715 (= e!310104 (and (bvsge mask!3216 #b00000000000000000000000000000000) (or (bvslt lt!245265 #b00000000000000000000000000000000) (bvsge lt!245265 (bvadd #b00000000000000000000000000000001 mask!3216)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!532715 (= lt!245265 (toIndex!0 (select (arr!16219 a!3154) j!147) mask!3216))))

(declare-fun b!532716 () Bool)

(assert (=> b!532716 (= e!310103 e!310104)))

(declare-fun res!328057 () Bool)

(assert (=> b!532716 (=> (not res!328057) (not e!310104))))

(declare-fun lt!245266 () SeekEntryResult!4677)

(assert (=> b!532716 (= res!328057 (or (= lt!245266 (MissingZero!4677 i!1153)) (= lt!245266 (MissingVacant!4677 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33757 (_ BitVec 32)) SeekEntryResult!4677)

(assert (=> b!532716 (= lt!245266 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun res!328060 () Bool)

(assert (=> start!48494 (=> (not res!328060) (not e!310103))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48494 (= res!328060 (validMask!0 mask!3216))))

(assert (=> start!48494 e!310103))

(assert (=> start!48494 true))

(declare-fun array_inv!12015 (array!33757) Bool)

(assert (=> start!48494 (array_inv!12015 a!3154)))

(declare-fun b!532717 () Bool)

(declare-fun res!328055 () Bool)

(assert (=> b!532717 (=> (not res!328055) (not e!310103))))

(declare-fun arrayContainsKey!0 (array!33757 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!532717 (= res!328055 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!532718 () Bool)

(declare-fun res!328064 () Bool)

(assert (=> b!532718 (=> (not res!328064) (not e!310104))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33757 (_ BitVec 32)) Bool)

(assert (=> b!532718 (= res!328064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!48494 res!328060) b!532710))

(assert (= (and b!532710 res!328056) b!532711))

(assert (= (and b!532711 res!328062) b!532713))

(assert (= (and b!532713 res!328061) b!532717))

(assert (= (and b!532717 res!328055) b!532716))

(assert (= (and b!532716 res!328057) b!532718))

(assert (= (and b!532718 res!328064) b!532709))

(assert (= (and b!532709 res!328063) b!532714))

(assert (= (and b!532714 res!328059) b!532712))

(assert (= (and b!532712 res!328058) b!532715))

(declare-fun m!512805 () Bool)

(assert (=> b!532712 m!512805))

(assert (=> b!532712 m!512805))

(declare-fun m!512807 () Bool)

(assert (=> b!532712 m!512807))

(declare-fun m!512809 () Bool)

(assert (=> b!532717 m!512809))

(assert (=> b!532711 m!512805))

(assert (=> b!532711 m!512805))

(declare-fun m!512811 () Bool)

(assert (=> b!532711 m!512811))

(declare-fun m!512813 () Bool)

(assert (=> b!532718 m!512813))

(assert (=> b!532715 m!512805))

(assert (=> b!532715 m!512805))

(declare-fun m!512815 () Bool)

(assert (=> b!532715 m!512815))

(declare-fun m!512817 () Bool)

(assert (=> start!48494 m!512817))

(declare-fun m!512819 () Bool)

(assert (=> start!48494 m!512819))

(declare-fun m!512821 () Bool)

(assert (=> b!532709 m!512821))

(declare-fun m!512823 () Bool)

(assert (=> b!532713 m!512823))

(declare-fun m!512825 () Bool)

(assert (=> b!532716 m!512825))

(declare-fun m!512827 () Bool)

(assert (=> b!532714 m!512827))

(assert (=> b!532714 m!512805))

(check-sat (not b!532716) (not b!532715) (not b!532713) (not start!48494) (not b!532709) (not b!532711) (not b!532717) (not b!532712) (not b!532718))
(check-sat)
(get-model)

(declare-fun d!81397 () Bool)

(declare-fun res!328099 () Bool)

(declare-fun e!310118 () Bool)

(assert (=> d!81397 (=> res!328099 e!310118)))

(assert (=> d!81397 (= res!328099 (= (select (arr!16219 a!3154) #b00000000000000000000000000000000) k0!1998))))

(assert (=> d!81397 (= (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000) e!310118)))

(declare-fun b!532753 () Bool)

(declare-fun e!310119 () Bool)

(assert (=> b!532753 (= e!310118 e!310119)))

(declare-fun res!328100 () Bool)

(assert (=> b!532753 (=> (not res!328100) (not e!310119))))

(assert (=> b!532753 (= res!328100 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16583 a!3154)))))

(declare-fun b!532754 () Bool)

(assert (=> b!532754 (= e!310119 (arrayContainsKey!0 a!3154 k0!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81397 (not res!328099)) b!532753))

(assert (= (and b!532753 res!328100) b!532754))

(declare-fun m!512853 () Bool)

(assert (=> d!81397 m!512853))

(declare-fun m!512855 () Bool)

(assert (=> b!532754 m!512855))

(assert (=> b!532717 d!81397))

(declare-fun b!532773 () Bool)

(declare-fun e!310130 () Bool)

(declare-fun lt!245277 () SeekEntryResult!4677)

(assert (=> b!532773 (= e!310130 (bvsge (x!49902 lt!245277) #b01111111111111111111111111111110))))

(declare-fun b!532774 () Bool)

(assert (=> b!532774 (and (bvsge (index!20934 lt!245277) #b00000000000000000000000000000000) (bvslt (index!20934 lt!245277) (size!16583 a!3154)))))

(declare-fun res!328108 () Bool)

(assert (=> b!532774 (= res!328108 (= (select (arr!16219 a!3154) (index!20934 lt!245277)) (select (arr!16219 a!3154) j!147)))))

(declare-fun e!310133 () Bool)

(assert (=> b!532774 (=> res!328108 e!310133)))

(declare-fun e!310134 () Bool)

(assert (=> b!532774 (= e!310134 e!310133)))

(declare-fun b!532775 () Bool)

(declare-fun e!310132 () SeekEntryResult!4677)

(assert (=> b!532775 (= e!310132 (Intermediate!4677 false index!1177 x!1030))))

(declare-fun b!532776 () Bool)

(declare-fun e!310131 () SeekEntryResult!4677)

(assert (=> b!532776 (= e!310131 e!310132)))

(declare-fun c!62645 () Bool)

(declare-fun lt!245278 () (_ BitVec 64))

(assert (=> b!532776 (= c!62645 (or (= lt!245278 (select (arr!16219 a!3154) j!147)) (= (bvadd lt!245278 lt!245278) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!532777 () Bool)

(assert (=> b!532777 (= e!310130 e!310134)))

(declare-fun res!328109 () Bool)

(get-info :version)

(assert (=> b!532777 (= res!328109 (and ((_ is Intermediate!4677) lt!245277) (not (undefined!5489 lt!245277)) (bvslt (x!49902 lt!245277) #b01111111111111111111111111111110) (bvsge (x!49902 lt!245277) #b00000000000000000000000000000000) (bvsge (x!49902 lt!245277) x!1030)))))

(assert (=> b!532777 (=> (not res!328109) (not e!310134))))

(declare-fun d!81399 () Bool)

(assert (=> d!81399 e!310130))

(declare-fun c!62643 () Bool)

(assert (=> d!81399 (= c!62643 (and ((_ is Intermediate!4677) lt!245277) (undefined!5489 lt!245277)))))

(assert (=> d!81399 (= lt!245277 e!310131)))

(declare-fun c!62644 () Bool)

(assert (=> d!81399 (= c!62644 (bvsge x!1030 #b01111111111111111111111111111110))))

(assert (=> d!81399 (= lt!245278 (select (arr!16219 a!3154) index!1177))))

(assert (=> d!81399 (validMask!0 mask!3216)))

(assert (=> d!81399 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16219 a!3154) j!147) a!3154 mask!3216) lt!245277)))

(declare-fun b!532778 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!532778 (= e!310132 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (arr!16219 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!532779 () Bool)

(assert (=> b!532779 (= e!310131 (Intermediate!4677 true index!1177 x!1030))))

(declare-fun b!532780 () Bool)

(assert (=> b!532780 (and (bvsge (index!20934 lt!245277) #b00000000000000000000000000000000) (bvslt (index!20934 lt!245277) (size!16583 a!3154)))))

(declare-fun res!328107 () Bool)

(assert (=> b!532780 (= res!328107 (= (select (arr!16219 a!3154) (index!20934 lt!245277)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!532780 (=> res!328107 e!310133)))

(declare-fun b!532781 () Bool)

(assert (=> b!532781 (and (bvsge (index!20934 lt!245277) #b00000000000000000000000000000000) (bvslt (index!20934 lt!245277) (size!16583 a!3154)))))

(assert (=> b!532781 (= e!310133 (= (select (arr!16219 a!3154) (index!20934 lt!245277)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!81399 c!62644) b!532779))

(assert (= (and d!81399 (not c!62644)) b!532776))

(assert (= (and b!532776 c!62645) b!532775))

(assert (= (and b!532776 (not c!62645)) b!532778))

(assert (= (and d!81399 c!62643) b!532773))

(assert (= (and d!81399 (not c!62643)) b!532777))

(assert (= (and b!532777 res!328109) b!532774))

(assert (= (and b!532774 (not res!328108)) b!532780))

(assert (= (and b!532780 (not res!328107)) b!532781))

(declare-fun m!512857 () Bool)

(assert (=> b!532778 m!512857))

(assert (=> b!532778 m!512857))

(assert (=> b!532778 m!512805))

(declare-fun m!512859 () Bool)

(assert (=> b!532778 m!512859))

(declare-fun m!512861 () Bool)

(assert (=> b!532780 m!512861))

(assert (=> b!532781 m!512861))

(assert (=> b!532774 m!512861))

(declare-fun m!512863 () Bool)

(assert (=> d!81399 m!512863))

(assert (=> d!81399 m!512817))

(assert (=> b!532712 d!81399))

(declare-fun d!81405 () Bool)

(assert (=> d!81405 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!48494 d!81405))

(declare-fun d!81409 () Bool)

(assert (=> d!81409 (= (array_inv!12015 a!3154) (bvsge (size!16583 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!48494 d!81409))

(declare-fun b!532844 () Bool)

(declare-fun e!310173 () Bool)

(declare-fun e!310171 () Bool)

(assert (=> b!532844 (= e!310173 e!310171)))

(declare-fun c!62666 () Bool)

(assert (=> b!532844 (= c!62666 (validKeyInArray!0 (select (arr!16219 a!3154) #b00000000000000000000000000000000)))))

(declare-fun bm!31979 () Bool)

(declare-fun call!31982 () Bool)

(assert (=> bm!31979 (= call!31982 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!532845 () Bool)

(declare-fun e!310172 () Bool)

(assert (=> b!532845 (= e!310171 e!310172)))

(declare-fun lt!245297 () (_ BitVec 64))

(assert (=> b!532845 (= lt!245297 (select (arr!16219 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16842 0))(
  ( (Unit!16843) )
))
(declare-fun lt!245299 () Unit!16842)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33757 (_ BitVec 64) (_ BitVec 32)) Unit!16842)

(assert (=> b!532845 (= lt!245299 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!245297 #b00000000000000000000000000000000))))

(assert (=> b!532845 (arrayContainsKey!0 a!3154 lt!245297 #b00000000000000000000000000000000)))

(declare-fun lt!245298 () Unit!16842)

(assert (=> b!532845 (= lt!245298 lt!245299)))

(declare-fun res!328132 () Bool)

(assert (=> b!532845 (= res!328132 (= (seekEntryOrOpen!0 (select (arr!16219 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4677 #b00000000000000000000000000000000)))))

(assert (=> b!532845 (=> (not res!328132) (not e!310172))))

(declare-fun d!81411 () Bool)

(declare-fun res!328133 () Bool)

(assert (=> d!81411 (=> res!328133 e!310173)))

(assert (=> d!81411 (= res!328133 (bvsge #b00000000000000000000000000000000 (size!16583 a!3154)))))

(assert (=> d!81411 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!310173)))

(declare-fun b!532846 () Bool)

(assert (=> b!532846 (= e!310171 call!31982)))

(declare-fun b!532847 () Bool)

(assert (=> b!532847 (= e!310172 call!31982)))

(assert (= (and d!81411 (not res!328133)) b!532844))

(assert (= (and b!532844 c!62666) b!532845))

(assert (= (and b!532844 (not c!62666)) b!532846))

(assert (= (and b!532845 res!328132) b!532847))

(assert (= (or b!532847 b!532846) bm!31979))

(assert (=> b!532844 m!512853))

(assert (=> b!532844 m!512853))

(declare-fun m!512881 () Bool)

(assert (=> b!532844 m!512881))

(declare-fun m!512883 () Bool)

(assert (=> bm!31979 m!512883))

(assert (=> b!532845 m!512853))

(declare-fun m!512885 () Bool)

(assert (=> b!532845 m!512885))

(declare-fun m!512887 () Bool)

(assert (=> b!532845 m!512887))

(assert (=> b!532845 m!512853))

(declare-fun m!512889 () Bool)

(assert (=> b!532845 m!512889))

(assert (=> b!532718 d!81411))

(declare-fun d!81421 () Bool)

(assert (=> d!81421 (= (validKeyInArray!0 k0!1998) (and (not (= k0!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!532713 d!81421))

(declare-fun b!532862 () Bool)

(declare-fun e!310187 () Bool)

(declare-fun e!310189 () Bool)

(assert (=> b!532862 (= e!310187 e!310189)))

(declare-fun res!328146 () Bool)

(assert (=> b!532862 (=> (not res!328146) (not e!310189))))

(declare-fun e!310186 () Bool)

(assert (=> b!532862 (= res!328146 (not e!310186))))

(declare-fun res!328145 () Bool)

(assert (=> b!532862 (=> (not res!328145) (not e!310186))))

(assert (=> b!532862 (= res!328145 (validKeyInArray!0 (select (arr!16219 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!532863 () Bool)

(declare-fun e!310188 () Bool)

(declare-fun call!31985 () Bool)

(assert (=> b!532863 (= e!310188 call!31985)))

(declare-fun d!81423 () Bool)

(declare-fun res!328144 () Bool)

(assert (=> d!81423 (=> res!328144 e!310187)))

(assert (=> d!81423 (= res!328144 (bvsge #b00000000000000000000000000000000 (size!16583 a!3154)))))

(assert (=> d!81423 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10335) e!310187)))

(declare-fun b!532864 () Bool)

(assert (=> b!532864 (= e!310189 e!310188)))

(declare-fun c!62669 () Bool)

(assert (=> b!532864 (= c!62669 (validKeyInArray!0 (select (arr!16219 a!3154) #b00000000000000000000000000000000)))))

(declare-fun bm!31982 () Bool)

(assert (=> bm!31982 (= call!31985 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!62669 (Cons!10334 (select (arr!16219 a!3154) #b00000000000000000000000000000000) Nil!10335) Nil!10335)))))

(declare-fun b!532865 () Bool)

(declare-fun contains!2790 (List!10338 (_ BitVec 64)) Bool)

(assert (=> b!532865 (= e!310186 (contains!2790 Nil!10335 (select (arr!16219 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!532866 () Bool)

(assert (=> b!532866 (= e!310188 call!31985)))

(assert (= (and d!81423 (not res!328144)) b!532862))

(assert (= (and b!532862 res!328145) b!532865))

(assert (= (and b!532862 res!328146) b!532864))

(assert (= (and b!532864 c!62669) b!532863))

(assert (= (and b!532864 (not c!62669)) b!532866))

(assert (= (or b!532863 b!532866) bm!31982))

(assert (=> b!532862 m!512853))

(assert (=> b!532862 m!512853))

(assert (=> b!532862 m!512881))

(assert (=> b!532864 m!512853))

(assert (=> b!532864 m!512853))

(assert (=> b!532864 m!512881))

(assert (=> bm!31982 m!512853))

(declare-fun m!512895 () Bool)

(assert (=> bm!31982 m!512895))

(assert (=> b!532865 m!512853))

(assert (=> b!532865 m!512853))

(declare-fun m!512897 () Bool)

(assert (=> b!532865 m!512897))

(assert (=> b!532709 d!81423))

(declare-fun d!81433 () Bool)

(declare-fun lt!245309 () (_ BitVec 32))

(declare-fun lt!245308 () (_ BitVec 32))

(assert (=> d!81433 (= lt!245309 (bvmul (bvxor lt!245308 (bvlshr lt!245308 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!81433 (= lt!245308 ((_ extract 31 0) (bvand (bvxor (select (arr!16219 a!3154) j!147) (bvlshr (select (arr!16219 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!81433 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!328149 (let ((h!11276 ((_ extract 31 0) (bvand (bvxor (select (arr!16219 a!3154) j!147) (bvlshr (select (arr!16219 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49907 (bvmul (bvxor h!11276 (bvlshr h!11276 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49907 (bvlshr x!49907 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!328149 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!328149 #b00000000000000000000000000000000))))))

(assert (=> d!81433 (= (toIndex!0 (select (arr!16219 a!3154) j!147) mask!3216) (bvand (bvxor lt!245309 (bvlshr lt!245309 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> b!532715 d!81433))

(declare-fun b!532942 () Bool)

(declare-fun e!310242 () SeekEntryResult!4677)

(declare-fun e!310243 () SeekEntryResult!4677)

(assert (=> b!532942 (= e!310242 e!310243)))

(declare-fun lt!245344 () (_ BitVec 64))

(declare-fun lt!245343 () SeekEntryResult!4677)

(assert (=> b!532942 (= lt!245344 (select (arr!16219 a!3154) (index!20934 lt!245343)))))

(declare-fun c!62695 () Bool)

(assert (=> b!532942 (= c!62695 (= lt!245344 k0!1998))))

(declare-fun b!532943 () Bool)

(declare-fun e!310244 () SeekEntryResult!4677)

(assert (=> b!532943 (= e!310244 (MissingZero!4677 (index!20934 lt!245343)))))

(declare-fun d!81435 () Bool)

(declare-fun lt!245342 () SeekEntryResult!4677)

(assert (=> d!81435 (and (or ((_ is Undefined!4677) lt!245342) (not ((_ is Found!4677) lt!245342)) (and (bvsge (index!20933 lt!245342) #b00000000000000000000000000000000) (bvslt (index!20933 lt!245342) (size!16583 a!3154)))) (or ((_ is Undefined!4677) lt!245342) ((_ is Found!4677) lt!245342) (not ((_ is MissingZero!4677) lt!245342)) (and (bvsge (index!20932 lt!245342) #b00000000000000000000000000000000) (bvslt (index!20932 lt!245342) (size!16583 a!3154)))) (or ((_ is Undefined!4677) lt!245342) ((_ is Found!4677) lt!245342) ((_ is MissingZero!4677) lt!245342) (not ((_ is MissingVacant!4677) lt!245342)) (and (bvsge (index!20935 lt!245342) #b00000000000000000000000000000000) (bvslt (index!20935 lt!245342) (size!16583 a!3154)))) (or ((_ is Undefined!4677) lt!245342) (ite ((_ is Found!4677) lt!245342) (= (select (arr!16219 a!3154) (index!20933 lt!245342)) k0!1998) (ite ((_ is MissingZero!4677) lt!245342) (= (select (arr!16219 a!3154) (index!20932 lt!245342)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4677) lt!245342) (= (select (arr!16219 a!3154) (index!20935 lt!245342)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!81435 (= lt!245342 e!310242)))

(declare-fun c!62693 () Bool)

(assert (=> d!81435 (= c!62693 (and ((_ is Intermediate!4677) lt!245343) (undefined!5489 lt!245343)))))

(assert (=> d!81435 (= lt!245343 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1998 mask!3216) k0!1998 a!3154 mask!3216))))

(assert (=> d!81435 (validMask!0 mask!3216)))

(assert (=> d!81435 (= (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216) lt!245342)))

(declare-fun b!532944 () Bool)

(assert (=> b!532944 (= e!310243 (Found!4677 (index!20934 lt!245343)))))

(declare-fun b!532945 () Bool)

(declare-fun c!62694 () Bool)

(assert (=> b!532945 (= c!62694 (= lt!245344 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!532945 (= e!310243 e!310244)))

(declare-fun b!532946 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33757 (_ BitVec 32)) SeekEntryResult!4677)

(assert (=> b!532946 (= e!310244 (seekKeyOrZeroReturnVacant!0 (x!49902 lt!245343) (index!20934 lt!245343) (index!20934 lt!245343) k0!1998 a!3154 mask!3216))))

(declare-fun b!532947 () Bool)

(assert (=> b!532947 (= e!310242 Undefined!4677)))

(assert (= (and d!81435 c!62693) b!532947))

(assert (= (and d!81435 (not c!62693)) b!532942))

(assert (= (and b!532942 c!62695) b!532944))

(assert (= (and b!532942 (not c!62695)) b!532945))

(assert (= (and b!532945 c!62694) b!532943))

(assert (= (and b!532945 (not c!62694)) b!532946))

(declare-fun m!512931 () Bool)

(assert (=> b!532942 m!512931))

(declare-fun m!512933 () Bool)

(assert (=> d!81435 m!512933))

(declare-fun m!512935 () Bool)

(assert (=> d!81435 m!512935))

(declare-fun m!512937 () Bool)

(assert (=> d!81435 m!512937))

(declare-fun m!512939 () Bool)

(assert (=> d!81435 m!512939))

(assert (=> d!81435 m!512817))

(assert (=> d!81435 m!512933))

(declare-fun m!512941 () Bool)

(assert (=> d!81435 m!512941))

(declare-fun m!512943 () Bool)

(assert (=> b!532946 m!512943))

(assert (=> b!532716 d!81435))

(declare-fun d!81451 () Bool)

(assert (=> d!81451 (= (validKeyInArray!0 (select (arr!16219 a!3154) j!147)) (and (not (= (select (arr!16219 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16219 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!532711 d!81451))

(check-sat (not b!532778) (not d!81435) (not bm!31979) (not b!532865) (not b!532946) (not b!532844) (not b!532862) (not b!532864) (not d!81399) (not b!532845) (not b!532754) (not bm!31982))
(check-sat)
