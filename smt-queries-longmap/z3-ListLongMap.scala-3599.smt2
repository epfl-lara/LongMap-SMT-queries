; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49512 () Bool)

(assert start!49512)

(declare-fun b!544801 () Bool)

(declare-fun e!314895 () Bool)

(declare-fun e!314897 () Bool)

(assert (=> b!544801 (= e!314895 e!314897)))

(declare-fun res!339047 () Bool)

(assert (=> b!544801 (=> (not res!339047) (not e!314897))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-datatypes ((array!34392 0))(
  ( (array!34393 (arr!16526 (Array (_ BitVec 32) (_ BitVec 64))) (size!16891 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34392)

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun lt!248457 () (_ BitVec 32))

(assert (=> b!544801 (= res!339047 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!248457 #b00000000000000000000000000000000) (bvslt lt!248457 (size!16891 a!3154))))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!544801 (= lt!248457 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!544802 () Bool)

(declare-fun res!339057 () Bool)

(declare-fun e!314896 () Bool)

(assert (=> b!544802 (=> (not res!339057) (not e!314896))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34392 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!544802 (= res!339057 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!544803 () Bool)

(declare-fun res!339058 () Bool)

(assert (=> b!544803 (=> (not res!339058) (not e!314895))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!544803 (= res!339058 (and (not (= (select (arr!16526 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16526 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16526 a!3154) index!1177) (select (arr!16526 a!3154) j!147)))))))

(declare-fun b!544804 () Bool)

(declare-fun res!339059 () Bool)

(assert (=> b!544804 (=> (not res!339059) (not e!314896))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!544804 (= res!339059 (validKeyInArray!0 k0!1998))))

(declare-fun b!544805 () Bool)

(declare-fun res!339048 () Bool)

(assert (=> b!544805 (=> (not res!339048) (not e!314896))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!544805 (= res!339048 (and (= (size!16891 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16891 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16891 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!544806 () Bool)

(declare-fun res!339052 () Bool)

(assert (=> b!544806 (=> (not res!339052) (not e!314896))))

(assert (=> b!544806 (= res!339052 (validKeyInArray!0 (select (arr!16526 a!3154) j!147)))))

(declare-fun res!339051 () Bool)

(assert (=> start!49512 (=> (not res!339051) (not e!314896))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49512 (= res!339051 (validMask!0 mask!3216))))

(assert (=> start!49512 e!314896))

(assert (=> start!49512 true))

(declare-fun array_inv!12409 (array!34392) Bool)

(assert (=> start!49512 (array_inv!12409 a!3154)))

(declare-fun b!544807 () Bool)

(declare-fun res!339056 () Bool)

(declare-fun e!314894 () Bool)

(assert (=> b!544807 (=> (not res!339056) (not e!314894))))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!544807 (= res!339056 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16891 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16891 a!3154)) (= (select (arr!16526 a!3154) resIndex!32) (select (arr!16526 a!3154) j!147))))))

(declare-fun b!544808 () Bool)

(declare-fun res!339049 () Bool)

(assert (=> b!544808 (=> (not res!339049) (not e!314894))))

(declare-datatypes ((List!10684 0))(
  ( (Nil!10681) (Cons!10680 (h!11641 (_ BitVec 64)) (t!16903 List!10684)) )
))
(declare-fun arrayNoDuplicates!0 (array!34392 (_ BitVec 32) List!10684) Bool)

(assert (=> b!544808 (= res!339049 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10681))))

(declare-fun b!544809 () Bool)

(declare-datatypes ((SeekEntryResult!4981 0))(
  ( (MissingZero!4981 (index!22148 (_ BitVec 32))) (Found!4981 (index!22149 (_ BitVec 32))) (Intermediate!4981 (undefined!5793 Bool) (index!22150 (_ BitVec 32)) (x!51079 (_ BitVec 32))) (Undefined!4981) (MissingVacant!4981 (index!22151 (_ BitVec 32))) )
))
(declare-fun lt!248455 () SeekEntryResult!4981)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34392 (_ BitVec 32)) SeekEntryResult!4981)

(assert (=> b!544809 (= e!314897 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!248457 (select (arr!16526 a!3154) j!147) a!3154 mask!3216) lt!248455)))))

(declare-fun b!544810 () Bool)

(declare-fun res!339053 () Bool)

(assert (=> b!544810 (=> (not res!339053) (not e!314895))))

(declare-fun lt!248456 () SeekEntryResult!4981)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!544810 (= res!339053 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16526 a!3154) j!147) mask!3216) (select (arr!16526 a!3154) j!147) a!3154 mask!3216) lt!248456))))

(declare-fun b!544811 () Bool)

(declare-fun res!339050 () Bool)

(assert (=> b!544811 (=> (not res!339050) (not e!314894))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34392 (_ BitVec 32)) Bool)

(assert (=> b!544811 (= res!339050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!544812 () Bool)

(assert (=> b!544812 (= e!314896 e!314894)))

(declare-fun res!339055 () Bool)

(assert (=> b!544812 (=> (not res!339055) (not e!314894))))

(declare-fun lt!248458 () SeekEntryResult!4981)

(assert (=> b!544812 (= res!339055 (or (= lt!248458 (MissingZero!4981 i!1153)) (= lt!248458 (MissingVacant!4981 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34392 (_ BitVec 32)) SeekEntryResult!4981)

(assert (=> b!544812 (= lt!248458 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!544813 () Bool)

(assert (=> b!544813 (= e!314894 e!314895)))

(declare-fun res!339054 () Bool)

(assert (=> b!544813 (=> (not res!339054) (not e!314895))))

(assert (=> b!544813 (= res!339054 (= lt!248456 lt!248455))))

(assert (=> b!544813 (= lt!248455 (Intermediate!4981 false resIndex!32 resX!32))))

(assert (=> b!544813 (= lt!248456 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16526 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!49512 res!339051) b!544805))

(assert (= (and b!544805 res!339048) b!544806))

(assert (= (and b!544806 res!339052) b!544804))

(assert (= (and b!544804 res!339059) b!544802))

(assert (= (and b!544802 res!339057) b!544812))

(assert (= (and b!544812 res!339055) b!544811))

(assert (= (and b!544811 res!339050) b!544808))

(assert (= (and b!544808 res!339049) b!544807))

(assert (= (and b!544807 res!339056) b!544813))

(assert (= (and b!544813 res!339054) b!544810))

(assert (= (and b!544810 res!339053) b!544803))

(assert (= (and b!544803 res!339058) b!544801))

(assert (= (and b!544801 res!339047) b!544809))

(declare-fun m!522031 () Bool)

(assert (=> b!544810 m!522031))

(assert (=> b!544810 m!522031))

(declare-fun m!522033 () Bool)

(assert (=> b!544810 m!522033))

(assert (=> b!544810 m!522033))

(assert (=> b!544810 m!522031))

(declare-fun m!522035 () Bool)

(assert (=> b!544810 m!522035))

(assert (=> b!544809 m!522031))

(assert (=> b!544809 m!522031))

(declare-fun m!522037 () Bool)

(assert (=> b!544809 m!522037))

(declare-fun m!522039 () Bool)

(assert (=> b!544804 m!522039))

(declare-fun m!522041 () Bool)

(assert (=> b!544803 m!522041))

(assert (=> b!544803 m!522031))

(declare-fun m!522043 () Bool)

(assert (=> b!544802 m!522043))

(declare-fun m!522045 () Bool)

(assert (=> start!49512 m!522045))

(declare-fun m!522047 () Bool)

(assert (=> start!49512 m!522047))

(declare-fun m!522049 () Bool)

(assert (=> b!544811 m!522049))

(declare-fun m!522051 () Bool)

(assert (=> b!544812 m!522051))

(declare-fun m!522053 () Bool)

(assert (=> b!544801 m!522053))

(assert (=> b!544806 m!522031))

(assert (=> b!544806 m!522031))

(declare-fun m!522055 () Bool)

(assert (=> b!544806 m!522055))

(declare-fun m!522057 () Bool)

(assert (=> b!544807 m!522057))

(assert (=> b!544807 m!522031))

(assert (=> b!544813 m!522031))

(assert (=> b!544813 m!522031))

(declare-fun m!522059 () Bool)

(assert (=> b!544813 m!522059))

(declare-fun m!522061 () Bool)

(assert (=> b!544808 m!522061))

(check-sat (not b!544808) (not start!49512) (not b!544810) (not b!544813) (not b!544801) (not b!544809) (not b!544804) (not b!544811) (not b!544806) (not b!544812) (not b!544802))
(check-sat)
(get-model)

(declare-fun d!81961 () Bool)

(assert (=> d!81961 (= (validKeyInArray!0 (select (arr!16526 a!3154) j!147)) (and (not (= (select (arr!16526 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16526 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!544806 d!81961))

(declare-fun d!81963 () Bool)

(declare-fun lt!248485 () (_ BitVec 32))

(assert (=> d!81963 (and (bvsge lt!248485 #b00000000000000000000000000000000) (bvslt lt!248485 (bvadd mask!3216 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!81963 (= lt!248485 (choose!52 index!1177 x!1030 mask!3216))))

(assert (=> d!81963 (validMask!0 mask!3216)))

(assert (=> d!81963 (= (nextIndex!0 index!1177 x!1030 mask!3216) lt!248485)))

(declare-fun bs!16972 () Bool)

(assert (= bs!16972 d!81963))

(declare-fun m!522127 () Bool)

(assert (=> bs!16972 m!522127))

(assert (=> bs!16972 m!522045))

(assert (=> b!544801 d!81963))

(declare-fun b!544904 () Bool)

(declare-fun e!314935 () SeekEntryResult!4981)

(declare-fun e!314937 () SeekEntryResult!4981)

(assert (=> b!544904 (= e!314935 e!314937)))

(declare-fun lt!248494 () (_ BitVec 64))

(declare-fun lt!248492 () SeekEntryResult!4981)

(assert (=> b!544904 (= lt!248494 (select (arr!16526 a!3154) (index!22150 lt!248492)))))

(declare-fun c!63208 () Bool)

(assert (=> b!544904 (= c!63208 (= lt!248494 k0!1998))))

(declare-fun b!544905 () Bool)

(assert (=> b!544905 (= e!314935 Undefined!4981)))

(declare-fun e!314936 () SeekEntryResult!4981)

(declare-fun b!544906 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34392 (_ BitVec 32)) SeekEntryResult!4981)

(assert (=> b!544906 (= e!314936 (seekKeyOrZeroReturnVacant!0 (x!51079 lt!248492) (index!22150 lt!248492) (index!22150 lt!248492) k0!1998 a!3154 mask!3216))))

(declare-fun b!544907 () Bool)

(assert (=> b!544907 (= e!314937 (Found!4981 (index!22150 lt!248492)))))

(declare-fun d!81965 () Bool)

(declare-fun lt!248493 () SeekEntryResult!4981)

(get-info :version)

(assert (=> d!81965 (and (or ((_ is Undefined!4981) lt!248493) (not ((_ is Found!4981) lt!248493)) (and (bvsge (index!22149 lt!248493) #b00000000000000000000000000000000) (bvslt (index!22149 lt!248493) (size!16891 a!3154)))) (or ((_ is Undefined!4981) lt!248493) ((_ is Found!4981) lt!248493) (not ((_ is MissingZero!4981) lt!248493)) (and (bvsge (index!22148 lt!248493) #b00000000000000000000000000000000) (bvslt (index!22148 lt!248493) (size!16891 a!3154)))) (or ((_ is Undefined!4981) lt!248493) ((_ is Found!4981) lt!248493) ((_ is MissingZero!4981) lt!248493) (not ((_ is MissingVacant!4981) lt!248493)) (and (bvsge (index!22151 lt!248493) #b00000000000000000000000000000000) (bvslt (index!22151 lt!248493) (size!16891 a!3154)))) (or ((_ is Undefined!4981) lt!248493) (ite ((_ is Found!4981) lt!248493) (= (select (arr!16526 a!3154) (index!22149 lt!248493)) k0!1998) (ite ((_ is MissingZero!4981) lt!248493) (= (select (arr!16526 a!3154) (index!22148 lt!248493)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4981) lt!248493) (= (select (arr!16526 a!3154) (index!22151 lt!248493)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!81965 (= lt!248493 e!314935)))

(declare-fun c!63210 () Bool)

(assert (=> d!81965 (= c!63210 (and ((_ is Intermediate!4981) lt!248492) (undefined!5793 lt!248492)))))

(assert (=> d!81965 (= lt!248492 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1998 mask!3216) k0!1998 a!3154 mask!3216))))

(assert (=> d!81965 (validMask!0 mask!3216)))

(assert (=> d!81965 (= (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216) lt!248493)))

(declare-fun b!544908 () Bool)

(assert (=> b!544908 (= e!314936 (MissingZero!4981 (index!22150 lt!248492)))))

(declare-fun b!544909 () Bool)

(declare-fun c!63209 () Bool)

(assert (=> b!544909 (= c!63209 (= lt!248494 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!544909 (= e!314937 e!314936)))

(assert (= (and d!81965 c!63210) b!544905))

(assert (= (and d!81965 (not c!63210)) b!544904))

(assert (= (and b!544904 c!63208) b!544907))

(assert (= (and b!544904 (not c!63208)) b!544909))

(assert (= (and b!544909 c!63209) b!544908))

(assert (= (and b!544909 (not c!63209)) b!544906))

(declare-fun m!522129 () Bool)

(assert (=> b!544904 m!522129))

(declare-fun m!522131 () Bool)

(assert (=> b!544906 m!522131))

(assert (=> d!81965 m!522045))

(declare-fun m!522133 () Bool)

(assert (=> d!81965 m!522133))

(declare-fun m!522135 () Bool)

(assert (=> d!81965 m!522135))

(declare-fun m!522137 () Bool)

(assert (=> d!81965 m!522137))

(declare-fun m!522139 () Bool)

(assert (=> d!81965 m!522139))

(assert (=> d!81965 m!522133))

(declare-fun m!522141 () Bool)

(assert (=> d!81965 m!522141))

(assert (=> b!544812 d!81965))

(declare-fun b!544946 () Bool)

(declare-fun e!314960 () SeekEntryResult!4981)

(declare-fun e!314962 () SeekEntryResult!4981)

(assert (=> b!544946 (= e!314960 e!314962)))

(declare-fun c!63224 () Bool)

(declare-fun lt!248504 () (_ BitVec 64))

(assert (=> b!544946 (= c!63224 (or (= lt!248504 (select (arr!16526 a!3154) j!147)) (= (bvadd lt!248504 lt!248504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!544947 () Bool)

(assert (=> b!544947 (= e!314960 (Intermediate!4981 true (toIndex!0 (select (arr!16526 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!544948 () Bool)

(declare-fun lt!248503 () SeekEntryResult!4981)

(assert (=> b!544948 (and (bvsge (index!22150 lt!248503) #b00000000000000000000000000000000) (bvslt (index!22150 lt!248503) (size!16891 a!3154)))))

(declare-fun e!314959 () Bool)

(assert (=> b!544948 (= e!314959 (= (select (arr!16526 a!3154) (index!22150 lt!248503)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!544949 () Bool)

(declare-fun e!314961 () Bool)

(assert (=> b!544949 (= e!314961 (bvsge (x!51079 lt!248503) #b01111111111111111111111111111110))))

(declare-fun b!544951 () Bool)

(assert (=> b!544951 (= e!314962 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16526 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (select (arr!16526 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!544952 () Bool)

(assert (=> b!544952 (and (bvsge (index!22150 lt!248503) #b00000000000000000000000000000000) (bvslt (index!22150 lt!248503) (size!16891 a!3154)))))

(declare-fun res!339152 () Bool)

(assert (=> b!544952 (= res!339152 (= (select (arr!16526 a!3154) (index!22150 lt!248503)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!544952 (=> res!339152 e!314959)))

(declare-fun b!544950 () Bool)

(assert (=> b!544950 (and (bvsge (index!22150 lt!248503) #b00000000000000000000000000000000) (bvslt (index!22150 lt!248503) (size!16891 a!3154)))))

(declare-fun res!339151 () Bool)

(assert (=> b!544950 (= res!339151 (= (select (arr!16526 a!3154) (index!22150 lt!248503)) (select (arr!16526 a!3154) j!147)))))

(assert (=> b!544950 (=> res!339151 e!314959)))

(declare-fun e!314958 () Bool)

(assert (=> b!544950 (= e!314958 e!314959)))

(declare-fun d!81967 () Bool)

(assert (=> d!81967 e!314961))

(declare-fun c!63225 () Bool)

(assert (=> d!81967 (= c!63225 (and ((_ is Intermediate!4981) lt!248503) (undefined!5793 lt!248503)))))

(assert (=> d!81967 (= lt!248503 e!314960)))

(declare-fun c!63223 () Bool)

(assert (=> d!81967 (= c!63223 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!81967 (= lt!248504 (select (arr!16526 a!3154) (toIndex!0 (select (arr!16526 a!3154) j!147) mask!3216)))))

(assert (=> d!81967 (validMask!0 mask!3216)))

(assert (=> d!81967 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16526 a!3154) j!147) mask!3216) (select (arr!16526 a!3154) j!147) a!3154 mask!3216) lt!248503)))

(declare-fun b!544953 () Bool)

(assert (=> b!544953 (= e!314961 e!314958)))

(declare-fun res!339150 () Bool)

(assert (=> b!544953 (= res!339150 (and ((_ is Intermediate!4981) lt!248503) (not (undefined!5793 lt!248503)) (bvslt (x!51079 lt!248503) #b01111111111111111111111111111110) (bvsge (x!51079 lt!248503) #b00000000000000000000000000000000) (bvsge (x!51079 lt!248503) #b00000000000000000000000000000000)))))

(assert (=> b!544953 (=> (not res!339150) (not e!314958))))

(declare-fun b!544954 () Bool)

(assert (=> b!544954 (= e!314962 (Intermediate!4981 false (toIndex!0 (select (arr!16526 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(assert (= (and d!81967 c!63223) b!544947))

(assert (= (and d!81967 (not c!63223)) b!544946))

(assert (= (and b!544946 c!63224) b!544954))

(assert (= (and b!544946 (not c!63224)) b!544951))

(assert (= (and d!81967 c!63225) b!544949))

(assert (= (and d!81967 (not c!63225)) b!544953))

(assert (= (and b!544953 res!339150) b!544950))

(assert (= (and b!544950 (not res!339151)) b!544952))

(assert (= (and b!544952 (not res!339152)) b!544948))

(declare-fun m!522143 () Bool)

(assert (=> b!544952 m!522143))

(assert (=> d!81967 m!522033))

(declare-fun m!522145 () Bool)

(assert (=> d!81967 m!522145))

(assert (=> d!81967 m!522045))

(assert (=> b!544950 m!522143))

(assert (=> b!544951 m!522033))

(declare-fun m!522147 () Bool)

(assert (=> b!544951 m!522147))

(assert (=> b!544951 m!522147))

(assert (=> b!544951 m!522031))

(declare-fun m!522149 () Bool)

(assert (=> b!544951 m!522149))

(assert (=> b!544948 m!522143))

(assert (=> b!544810 d!81967))

(declare-fun d!81973 () Bool)

(declare-fun lt!248516 () (_ BitVec 32))

(declare-fun lt!248515 () (_ BitVec 32))

(assert (=> d!81973 (= lt!248516 (bvmul (bvxor lt!248515 (bvlshr lt!248515 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!81973 (= lt!248515 ((_ extract 31 0) (bvand (bvxor (select (arr!16526 a!3154) j!147) (bvlshr (select (arr!16526 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!81973 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!339153 (let ((h!11644 ((_ extract 31 0) (bvand (bvxor (select (arr!16526 a!3154) j!147) (bvlshr (select (arr!16526 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51086 (bvmul (bvxor h!11644 (bvlshr h!11644 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51086 (bvlshr x!51086 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!339153 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!339153 #b00000000000000000000000000000000))))))

(assert (=> d!81973 (= (toIndex!0 (select (arr!16526 a!3154) j!147) mask!3216) (bvand (bvxor lt!248516 (bvlshr lt!248516 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> b!544810 d!81973))

(declare-fun b!545014 () Bool)

(declare-fun e!315002 () Bool)

(declare-fun call!32092 () Bool)

(assert (=> b!545014 (= e!315002 call!32092)))

(declare-fun b!545015 () Bool)

(declare-fun e!315003 () Bool)

(assert (=> b!545015 (= e!315003 e!315002)))

(declare-fun c!63243 () Bool)

(assert (=> b!545015 (= c!63243 (validKeyInArray!0 (select (arr!16526 a!3154) #b00000000000000000000000000000000)))))

(declare-fun bm!32089 () Bool)

(assert (=> bm!32089 (= call!32092 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun d!81977 () Bool)

(declare-fun res!339182 () Bool)

(assert (=> d!81977 (=> res!339182 e!315003)))

(assert (=> d!81977 (= res!339182 (bvsge #b00000000000000000000000000000000 (size!16891 a!3154)))))

(assert (=> d!81977 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!315003)))

(declare-fun b!545016 () Bool)

(declare-fun e!315001 () Bool)

(assert (=> b!545016 (= e!315001 call!32092)))

(declare-fun b!545017 () Bool)

(assert (=> b!545017 (= e!315002 e!315001)))

(declare-fun lt!248538 () (_ BitVec 64))

(assert (=> b!545017 (= lt!248538 (select (arr!16526 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16900 0))(
  ( (Unit!16901) )
))
(declare-fun lt!248539 () Unit!16900)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34392 (_ BitVec 64) (_ BitVec 32)) Unit!16900)

(assert (=> b!545017 (= lt!248539 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!248538 #b00000000000000000000000000000000))))

(assert (=> b!545017 (arrayContainsKey!0 a!3154 lt!248538 #b00000000000000000000000000000000)))

(declare-fun lt!248537 () Unit!16900)

(assert (=> b!545017 (= lt!248537 lt!248539)))

(declare-fun res!339181 () Bool)

(assert (=> b!545017 (= res!339181 (= (seekEntryOrOpen!0 (select (arr!16526 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4981 #b00000000000000000000000000000000)))))

(assert (=> b!545017 (=> (not res!339181) (not e!315001))))

(assert (= (and d!81977 (not res!339182)) b!545015))

(assert (= (and b!545015 c!63243) b!545017))

(assert (= (and b!545015 (not c!63243)) b!545014))

(assert (= (and b!545017 res!339181) b!545016))

(assert (= (or b!545016 b!545014) bm!32089))

(declare-fun m!522167 () Bool)

(assert (=> b!545015 m!522167))

(assert (=> b!545015 m!522167))

(declare-fun m!522171 () Bool)

(assert (=> b!545015 m!522171))

(declare-fun m!522175 () Bool)

(assert (=> bm!32089 m!522175))

(assert (=> b!545017 m!522167))

(declare-fun m!522177 () Bool)

(assert (=> b!545017 m!522177))

(declare-fun m!522181 () Bool)

(assert (=> b!545017 m!522181))

(assert (=> b!545017 m!522167))

(declare-fun m!522183 () Bool)

(assert (=> b!545017 m!522183))

(assert (=> b!544811 d!81977))

(declare-fun b!545018 () Bool)

(declare-fun e!315008 () SeekEntryResult!4981)

(declare-fun e!315010 () SeekEntryResult!4981)

(assert (=> b!545018 (= e!315008 e!315010)))

(declare-fun c!63245 () Bool)

(declare-fun lt!248541 () (_ BitVec 64))

(assert (=> b!545018 (= c!63245 (or (= lt!248541 (select (arr!16526 a!3154) j!147)) (= (bvadd lt!248541 lt!248541) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!545019 () Bool)

(assert (=> b!545019 (= e!315008 (Intermediate!4981 true lt!248457 (bvadd #b00000000000000000000000000000001 x!1030)))))

(declare-fun b!545020 () Bool)

(declare-fun lt!248540 () SeekEntryResult!4981)

(assert (=> b!545020 (and (bvsge (index!22150 lt!248540) #b00000000000000000000000000000000) (bvslt (index!22150 lt!248540) (size!16891 a!3154)))))

(declare-fun e!315007 () Bool)

(assert (=> b!545020 (= e!315007 (= (select (arr!16526 a!3154) (index!22150 lt!248540)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!545021 () Bool)

(declare-fun e!315009 () Bool)

(assert (=> b!545021 (= e!315009 (bvsge (x!51079 lt!248540) #b01111111111111111111111111111110))))

(declare-fun b!545023 () Bool)

(assert (=> b!545023 (= e!315010 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030 #b00000000000000000000000000000001) (nextIndex!0 lt!248457 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216) (select (arr!16526 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545024 () Bool)

(assert (=> b!545024 (and (bvsge (index!22150 lt!248540) #b00000000000000000000000000000000) (bvslt (index!22150 lt!248540) (size!16891 a!3154)))))

(declare-fun res!339187 () Bool)

(assert (=> b!545024 (= res!339187 (= (select (arr!16526 a!3154) (index!22150 lt!248540)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!545024 (=> res!339187 e!315007)))

(declare-fun b!545022 () Bool)

(assert (=> b!545022 (and (bvsge (index!22150 lt!248540) #b00000000000000000000000000000000) (bvslt (index!22150 lt!248540) (size!16891 a!3154)))))

(declare-fun res!339186 () Bool)

(assert (=> b!545022 (= res!339186 (= (select (arr!16526 a!3154) (index!22150 lt!248540)) (select (arr!16526 a!3154) j!147)))))

(assert (=> b!545022 (=> res!339186 e!315007)))

(declare-fun e!315005 () Bool)

(assert (=> b!545022 (= e!315005 e!315007)))

(declare-fun d!81985 () Bool)

(assert (=> d!81985 e!315009))

(declare-fun c!63246 () Bool)

(assert (=> d!81985 (= c!63246 (and ((_ is Intermediate!4981) lt!248540) (undefined!5793 lt!248540)))))

(assert (=> d!81985 (= lt!248540 e!315008)))

(declare-fun c!63244 () Bool)

(assert (=> d!81985 (= c!63244 (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b01111111111111111111111111111110))))

(assert (=> d!81985 (= lt!248541 (select (arr!16526 a!3154) lt!248457))))

(assert (=> d!81985 (validMask!0 mask!3216)))

(assert (=> d!81985 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!248457 (select (arr!16526 a!3154) j!147) a!3154 mask!3216) lt!248540)))

(declare-fun b!545025 () Bool)

(assert (=> b!545025 (= e!315009 e!315005)))

(declare-fun res!339185 () Bool)

(assert (=> b!545025 (= res!339185 (and ((_ is Intermediate!4981) lt!248540) (not (undefined!5793 lt!248540)) (bvslt (x!51079 lt!248540) #b01111111111111111111111111111110) (bvsge (x!51079 lt!248540) #b00000000000000000000000000000000) (bvsge (x!51079 lt!248540) (bvadd #b00000000000000000000000000000001 x!1030))))))

(assert (=> b!545025 (=> (not res!339185) (not e!315005))))

(declare-fun b!545026 () Bool)

(assert (=> b!545026 (= e!315010 (Intermediate!4981 false lt!248457 (bvadd #b00000000000000000000000000000001 x!1030)))))

(assert (= (and d!81985 c!63244) b!545019))

(assert (= (and d!81985 (not c!63244)) b!545018))

(assert (= (and b!545018 c!63245) b!545026))

(assert (= (and b!545018 (not c!63245)) b!545023))

(assert (= (and d!81985 c!63246) b!545021))

(assert (= (and d!81985 (not c!63246)) b!545025))

(assert (= (and b!545025 res!339185) b!545022))

(assert (= (and b!545022 (not res!339186)) b!545024))

(assert (= (and b!545024 (not res!339187)) b!545020))

(declare-fun m!522187 () Bool)

(assert (=> b!545024 m!522187))

(declare-fun m!522189 () Bool)

(assert (=> d!81985 m!522189))

(assert (=> d!81985 m!522045))

(assert (=> b!545022 m!522187))

(declare-fun m!522191 () Bool)

(assert (=> b!545023 m!522191))

(assert (=> b!545023 m!522191))

(assert (=> b!545023 m!522031))

(declare-fun m!522193 () Bool)

(assert (=> b!545023 m!522193))

(assert (=> b!545020 m!522187))

(assert (=> b!544809 d!81985))

(declare-fun d!81989 () Bool)

(assert (=> d!81989 (= (validKeyInArray!0 k0!1998) (and (not (= k0!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!544804 d!81989))

(declare-fun d!81991 () Bool)

(assert (=> d!81991 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!49512 d!81991))

(declare-fun d!81997 () Bool)

(assert (=> d!81997 (= (array_inv!12409 a!3154) (bvsge (size!16891 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!49512 d!81997))

(declare-fun d!81999 () Bool)

(declare-fun res!339199 () Bool)

(declare-fun e!315025 () Bool)

(assert (=> d!81999 (=> res!339199 e!315025)))

(assert (=> d!81999 (= res!339199 (= (select (arr!16526 a!3154) #b00000000000000000000000000000000) k0!1998))))

(assert (=> d!81999 (= (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000) e!315025)))

(declare-fun b!545046 () Bool)

(declare-fun e!315026 () Bool)

(assert (=> b!545046 (= e!315025 e!315026)))

(declare-fun res!339200 () Bool)

(assert (=> b!545046 (=> (not res!339200) (not e!315026))))

(assert (=> b!545046 (= res!339200 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16891 a!3154)))))

(declare-fun b!545047 () Bool)

(assert (=> b!545047 (= e!315026 (arrayContainsKey!0 a!3154 k0!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81999 (not res!339199)) b!545046))

(assert (= (and b!545046 res!339200) b!545047))

(assert (=> d!81999 m!522167))

(declare-fun m!522203 () Bool)

(assert (=> b!545047 m!522203))

(assert (=> b!544802 d!81999))

(declare-fun b!545048 () Bool)

(declare-fun e!315029 () SeekEntryResult!4981)

(declare-fun e!315031 () SeekEntryResult!4981)

(assert (=> b!545048 (= e!315029 e!315031)))

(declare-fun lt!248543 () (_ BitVec 64))

(declare-fun c!63251 () Bool)

(assert (=> b!545048 (= c!63251 (or (= lt!248543 (select (arr!16526 a!3154) j!147)) (= (bvadd lt!248543 lt!248543) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!545049 () Bool)

(assert (=> b!545049 (= e!315029 (Intermediate!4981 true index!1177 x!1030))))

(declare-fun b!545050 () Bool)

(declare-fun lt!248542 () SeekEntryResult!4981)

(assert (=> b!545050 (and (bvsge (index!22150 lt!248542) #b00000000000000000000000000000000) (bvslt (index!22150 lt!248542) (size!16891 a!3154)))))

(declare-fun e!315028 () Bool)

(assert (=> b!545050 (= e!315028 (= (select (arr!16526 a!3154) (index!22150 lt!248542)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!545051 () Bool)

(declare-fun e!315030 () Bool)

(assert (=> b!545051 (= e!315030 (bvsge (x!51079 lt!248542) #b01111111111111111111111111111110))))

(declare-fun b!545053 () Bool)

(assert (=> b!545053 (= e!315031 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (arr!16526 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545054 () Bool)

(assert (=> b!545054 (and (bvsge (index!22150 lt!248542) #b00000000000000000000000000000000) (bvslt (index!22150 lt!248542) (size!16891 a!3154)))))

(declare-fun res!339203 () Bool)

(assert (=> b!545054 (= res!339203 (= (select (arr!16526 a!3154) (index!22150 lt!248542)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!545054 (=> res!339203 e!315028)))

(declare-fun b!545052 () Bool)

(assert (=> b!545052 (and (bvsge (index!22150 lt!248542) #b00000000000000000000000000000000) (bvslt (index!22150 lt!248542) (size!16891 a!3154)))))

(declare-fun res!339202 () Bool)

(assert (=> b!545052 (= res!339202 (= (select (arr!16526 a!3154) (index!22150 lt!248542)) (select (arr!16526 a!3154) j!147)))))

(assert (=> b!545052 (=> res!339202 e!315028)))

(declare-fun e!315027 () Bool)

(assert (=> b!545052 (= e!315027 e!315028)))

(declare-fun d!82001 () Bool)

(assert (=> d!82001 e!315030))

(declare-fun c!63252 () Bool)

(assert (=> d!82001 (= c!63252 (and ((_ is Intermediate!4981) lt!248542) (undefined!5793 lt!248542)))))

(assert (=> d!82001 (= lt!248542 e!315029)))

(declare-fun c!63250 () Bool)

(assert (=> d!82001 (= c!63250 (bvsge x!1030 #b01111111111111111111111111111110))))

(assert (=> d!82001 (= lt!248543 (select (arr!16526 a!3154) index!1177))))

(assert (=> d!82001 (validMask!0 mask!3216)))

(assert (=> d!82001 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16526 a!3154) j!147) a!3154 mask!3216) lt!248542)))

(declare-fun b!545055 () Bool)

(assert (=> b!545055 (= e!315030 e!315027)))

(declare-fun res!339201 () Bool)

(assert (=> b!545055 (= res!339201 (and ((_ is Intermediate!4981) lt!248542) (not (undefined!5793 lt!248542)) (bvslt (x!51079 lt!248542) #b01111111111111111111111111111110) (bvsge (x!51079 lt!248542) #b00000000000000000000000000000000) (bvsge (x!51079 lt!248542) x!1030)))))

(assert (=> b!545055 (=> (not res!339201) (not e!315027))))

(declare-fun b!545056 () Bool)

(assert (=> b!545056 (= e!315031 (Intermediate!4981 false index!1177 x!1030))))

(assert (= (and d!82001 c!63250) b!545049))

(assert (= (and d!82001 (not c!63250)) b!545048))

(assert (= (and b!545048 c!63251) b!545056))

(assert (= (and b!545048 (not c!63251)) b!545053))

(assert (= (and d!82001 c!63252) b!545051))

(assert (= (and d!82001 (not c!63252)) b!545055))

(assert (= (and b!545055 res!339201) b!545052))

(assert (= (and b!545052 (not res!339202)) b!545054))

(assert (= (and b!545054 (not res!339203)) b!545050))

(declare-fun m!522205 () Bool)

(assert (=> b!545054 m!522205))

(assert (=> d!82001 m!522041))

(assert (=> d!82001 m!522045))

(assert (=> b!545052 m!522205))

(assert (=> b!545053 m!522053))

(assert (=> b!545053 m!522053))

(assert (=> b!545053 m!522031))

(declare-fun m!522207 () Bool)

(assert (=> b!545053 m!522207))

(assert (=> b!545050 m!522205))

(assert (=> b!544813 d!82001))

(declare-fun b!545091 () Bool)

(declare-fun e!315058 () Bool)

(declare-fun e!315057 () Bool)

(assert (=> b!545091 (= e!315058 e!315057)))

(declare-fun res!339217 () Bool)

(assert (=> b!545091 (=> (not res!339217) (not e!315057))))

(declare-fun e!315056 () Bool)

(assert (=> b!545091 (= res!339217 (not e!315056))))

(declare-fun res!339218 () Bool)

(assert (=> b!545091 (=> (not res!339218) (not e!315056))))

(assert (=> b!545091 (= res!339218 (validKeyInArray!0 (select (arr!16526 a!3154) #b00000000000000000000000000000000)))))

(declare-fun d!82007 () Bool)

(declare-fun res!339216 () Bool)

(assert (=> d!82007 (=> res!339216 e!315058)))

(assert (=> d!82007 (= res!339216 (bvsge #b00000000000000000000000000000000 (size!16891 a!3154)))))

(assert (=> d!82007 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10681) e!315058)))

(declare-fun b!545092 () Bool)

(declare-fun e!315055 () Bool)

(assert (=> b!545092 (= e!315057 e!315055)))

(declare-fun c!63264 () Bool)

(assert (=> b!545092 (= c!63264 (validKeyInArray!0 (select (arr!16526 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!545093 () Bool)

(declare-fun call!32098 () Bool)

(assert (=> b!545093 (= e!315055 call!32098)))

(declare-fun bm!32095 () Bool)

(assert (=> bm!32095 (= call!32098 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63264 (Cons!10680 (select (arr!16526 a!3154) #b00000000000000000000000000000000) Nil!10681) Nil!10681)))))

(declare-fun b!545094 () Bool)

(declare-fun contains!2791 (List!10684 (_ BitVec 64)) Bool)

(assert (=> b!545094 (= e!315056 (contains!2791 Nil!10681 (select (arr!16526 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!545095 () Bool)

(assert (=> b!545095 (= e!315055 call!32098)))

(assert (= (and d!82007 (not res!339216)) b!545091))

(assert (= (and b!545091 res!339218) b!545094))

(assert (= (and b!545091 res!339217) b!545092))

(assert (= (and b!545092 c!63264) b!545093))

(assert (= (and b!545092 (not c!63264)) b!545095))

(assert (= (or b!545093 b!545095) bm!32095))

(assert (=> b!545091 m!522167))

(assert (=> b!545091 m!522167))

(assert (=> b!545091 m!522171))

(assert (=> b!545092 m!522167))

(assert (=> b!545092 m!522167))

(assert (=> b!545092 m!522171))

(assert (=> bm!32095 m!522167))

(declare-fun m!522227 () Bool)

(assert (=> bm!32095 m!522227))

(assert (=> b!545094 m!522167))

(assert (=> b!545094 m!522167))

(declare-fun m!522229 () Bool)

(assert (=> b!545094 m!522229))

(assert (=> b!544808 d!82007))

(check-sat (not bm!32089) (not b!545017) (not b!544906) (not d!81965) (not bm!32095) (not d!82001) (not d!81963) (not b!545091) (not b!545053) (not b!545094) (not d!81967) (not b!545023) (not b!544951) (not b!545047) (not d!81985) (not b!545015) (not b!545092))
(check-sat)
