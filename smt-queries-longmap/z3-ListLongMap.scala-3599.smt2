; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49526 () Bool)

(assert start!49526)

(declare-fun b!545111 () Bool)

(declare-fun res!339218 () Bool)

(declare-fun e!315085 () Bool)

(assert (=> b!545111 (=> (not res!339218) (not e!315085))))

(declare-datatypes ((array!34396 0))(
  ( (array!34397 (arr!16528 (Array (_ BitVec 32) (_ BitVec 64))) (size!16892 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34396)

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34396 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!545111 (= res!339218 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!248704 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4986 0))(
  ( (MissingZero!4986 (index!22168 (_ BitVec 32))) (Found!4986 (index!22169 (_ BitVec 32))) (Intermediate!4986 (undefined!5798 Bool) (index!22170 (_ BitVec 32)) (x!51089 (_ BitVec 32))) (Undefined!4986) (MissingVacant!4986 (index!22171 (_ BitVec 32))) )
))
(declare-fun lt!248703 () SeekEntryResult!4986)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun b!545112 () Bool)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun e!315083 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34396 (_ BitVec 32)) SeekEntryResult!4986)

(assert (=> b!545112 (= e!315083 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!248704 (select (arr!16528 a!3154) j!147) a!3154 mask!3216) lt!248703)))))

(declare-fun b!545114 () Bool)

(declare-fun e!315087 () Bool)

(declare-fun e!315084 () Bool)

(assert (=> b!545114 (= e!315087 e!315084)))

(declare-fun res!339215 () Bool)

(assert (=> b!545114 (=> (not res!339215) (not e!315084))))

(declare-fun lt!248701 () SeekEntryResult!4986)

(assert (=> b!545114 (= res!339215 (= lt!248701 lt!248703))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!545114 (= lt!248703 (Intermediate!4986 false resIndex!32 resX!32))))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!545114 (= lt!248701 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16528 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545115 () Bool)

(declare-fun res!339216 () Bool)

(assert (=> b!545115 (=> (not res!339216) (not e!315085))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!545115 (= res!339216 (and (= (size!16892 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16892 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16892 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!545116 () Bool)

(assert (=> b!545116 (= e!315085 e!315087)))

(declare-fun res!339221 () Bool)

(assert (=> b!545116 (=> (not res!339221) (not e!315087))))

(declare-fun lt!248702 () SeekEntryResult!4986)

(assert (=> b!545116 (= res!339221 (or (= lt!248702 (MissingZero!4986 i!1153)) (= lt!248702 (MissingVacant!4986 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34396 (_ BitVec 32)) SeekEntryResult!4986)

(assert (=> b!545116 (= lt!248702 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!545117 () Bool)

(declare-fun res!339224 () Bool)

(assert (=> b!545117 (=> (not res!339224) (not e!315087))))

(assert (=> b!545117 (= res!339224 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16892 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16892 a!3154)) (= (select (arr!16528 a!3154) resIndex!32) (select (arr!16528 a!3154) j!147))))))

(declare-fun b!545118 () Bool)

(declare-fun res!339227 () Bool)

(assert (=> b!545118 (=> (not res!339227) (not e!315085))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!545118 (= res!339227 (validKeyInArray!0 (select (arr!16528 a!3154) j!147)))))

(declare-fun b!545119 () Bool)

(declare-fun res!339217 () Bool)

(assert (=> b!545119 (=> (not res!339217) (not e!315087))))

(declare-datatypes ((List!10647 0))(
  ( (Nil!10644) (Cons!10643 (h!11604 (_ BitVec 64)) (t!16875 List!10647)) )
))
(declare-fun arrayNoDuplicates!0 (array!34396 (_ BitVec 32) List!10647) Bool)

(assert (=> b!545119 (= res!339217 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10644))))

(declare-fun b!545113 () Bool)

(declare-fun res!339222 () Bool)

(assert (=> b!545113 (=> (not res!339222) (not e!315084))))

(assert (=> b!545113 (= res!339222 (and (not (= (select (arr!16528 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16528 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16528 a!3154) index!1177) (select (arr!16528 a!3154) j!147)))))))

(declare-fun res!339226 () Bool)

(assert (=> start!49526 (=> (not res!339226) (not e!315085))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49526 (= res!339226 (validMask!0 mask!3216))))

(assert (=> start!49526 e!315085))

(assert (=> start!49526 true))

(declare-fun array_inv!12324 (array!34396) Bool)

(assert (=> start!49526 (array_inv!12324 a!3154)))

(declare-fun b!545120 () Bool)

(assert (=> b!545120 (= e!315084 e!315083)))

(declare-fun res!339219 () Bool)

(assert (=> b!545120 (=> (not res!339219) (not e!315083))))

(assert (=> b!545120 (= res!339219 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!248704 #b00000000000000000000000000000000) (bvslt lt!248704 (size!16892 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545120 (= lt!248704 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!545121 () Bool)

(declare-fun res!339223 () Bool)

(assert (=> b!545121 (=> (not res!339223) (not e!315087))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34396 (_ BitVec 32)) Bool)

(assert (=> b!545121 (= res!339223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!545122 () Bool)

(declare-fun res!339220 () Bool)

(assert (=> b!545122 (=> (not res!339220) (not e!315084))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545122 (= res!339220 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16528 a!3154) j!147) mask!3216) (select (arr!16528 a!3154) j!147) a!3154 mask!3216) lt!248701))))

(declare-fun b!545123 () Bool)

(declare-fun res!339225 () Bool)

(assert (=> b!545123 (=> (not res!339225) (not e!315085))))

(assert (=> b!545123 (= res!339225 (validKeyInArray!0 k0!1998))))

(assert (= (and start!49526 res!339226) b!545115))

(assert (= (and b!545115 res!339216) b!545118))

(assert (= (and b!545118 res!339227) b!545123))

(assert (= (and b!545123 res!339225) b!545111))

(assert (= (and b!545111 res!339218) b!545116))

(assert (= (and b!545116 res!339221) b!545121))

(assert (= (and b!545121 res!339223) b!545119))

(assert (= (and b!545119 res!339217) b!545117))

(assert (= (and b!545117 res!339224) b!545114))

(assert (= (and b!545114 res!339215) b!545122))

(assert (= (and b!545122 res!339220) b!545113))

(assert (= (and b!545113 res!339222) b!545120))

(assert (= (and b!545120 res!339219) b!545112))

(declare-fun m!522815 () Bool)

(assert (=> b!545114 m!522815))

(assert (=> b!545114 m!522815))

(declare-fun m!522817 () Bool)

(assert (=> b!545114 m!522817))

(declare-fun m!522819 () Bool)

(assert (=> b!545123 m!522819))

(declare-fun m!522821 () Bool)

(assert (=> start!49526 m!522821))

(declare-fun m!522823 () Bool)

(assert (=> start!49526 m!522823))

(assert (=> b!545118 m!522815))

(assert (=> b!545118 m!522815))

(declare-fun m!522825 () Bool)

(assert (=> b!545118 m!522825))

(declare-fun m!522827 () Bool)

(assert (=> b!545113 m!522827))

(assert (=> b!545113 m!522815))

(assert (=> b!545112 m!522815))

(assert (=> b!545112 m!522815))

(declare-fun m!522829 () Bool)

(assert (=> b!545112 m!522829))

(declare-fun m!522831 () Bool)

(assert (=> b!545116 m!522831))

(assert (=> b!545122 m!522815))

(assert (=> b!545122 m!522815))

(declare-fun m!522833 () Bool)

(assert (=> b!545122 m!522833))

(assert (=> b!545122 m!522833))

(assert (=> b!545122 m!522815))

(declare-fun m!522835 () Bool)

(assert (=> b!545122 m!522835))

(declare-fun m!522837 () Bool)

(assert (=> b!545121 m!522837))

(declare-fun m!522839 () Bool)

(assert (=> b!545117 m!522839))

(assert (=> b!545117 m!522815))

(declare-fun m!522841 () Bool)

(assert (=> b!545120 m!522841))

(declare-fun m!522843 () Bool)

(assert (=> b!545119 m!522843))

(declare-fun m!522845 () Bool)

(assert (=> b!545111 m!522845))

(check-sat (not b!545118) (not b!545120) (not b!545114) (not b!545119) (not b!545122) (not b!545111) (not b!545116) (not b!545121) (not b!545112) (not start!49526) (not b!545123))
(check-sat)
(get-model)

(declare-fun bm!32111 () Bool)

(declare-fun call!32114 () Bool)

(declare-fun c!63275 () Bool)

(assert (=> bm!32111 (= call!32114 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63275 (Cons!10643 (select (arr!16528 a!3154) #b00000000000000000000000000000000) Nil!10644) Nil!10644)))))

(declare-fun b!545173 () Bool)

(declare-fun e!315113 () Bool)

(declare-fun contains!2810 (List!10647 (_ BitVec 64)) Bool)

(assert (=> b!545173 (= e!315113 (contains!2810 Nil!10644 (select (arr!16528 a!3154) #b00000000000000000000000000000000)))))

(declare-fun d!82167 () Bool)

(declare-fun res!339275 () Bool)

(declare-fun e!315112 () Bool)

(assert (=> d!82167 (=> res!339275 e!315112)))

(assert (=> d!82167 (= res!339275 (bvsge #b00000000000000000000000000000000 (size!16892 a!3154)))))

(assert (=> d!82167 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10644) e!315112)))

(declare-fun b!545174 () Bool)

(declare-fun e!315111 () Bool)

(declare-fun e!315114 () Bool)

(assert (=> b!545174 (= e!315111 e!315114)))

(assert (=> b!545174 (= c!63275 (validKeyInArray!0 (select (arr!16528 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!545175 () Bool)

(assert (=> b!545175 (= e!315114 call!32114)))

(declare-fun b!545176 () Bool)

(assert (=> b!545176 (= e!315114 call!32114)))

(declare-fun b!545177 () Bool)

(assert (=> b!545177 (= e!315112 e!315111)))

(declare-fun res!339273 () Bool)

(assert (=> b!545177 (=> (not res!339273) (not e!315111))))

(assert (=> b!545177 (= res!339273 (not e!315113))))

(declare-fun res!339274 () Bool)

(assert (=> b!545177 (=> (not res!339274) (not e!315113))))

(assert (=> b!545177 (= res!339274 (validKeyInArray!0 (select (arr!16528 a!3154) #b00000000000000000000000000000000)))))

(assert (= (and d!82167 (not res!339275)) b!545177))

(assert (= (and b!545177 res!339274) b!545173))

(assert (= (and b!545177 res!339273) b!545174))

(assert (= (and b!545174 c!63275) b!545175))

(assert (= (and b!545174 (not c!63275)) b!545176))

(assert (= (or b!545175 b!545176) bm!32111))

(declare-fun m!522879 () Bool)

(assert (=> bm!32111 m!522879))

(declare-fun m!522881 () Bool)

(assert (=> bm!32111 m!522881))

(assert (=> b!545173 m!522879))

(assert (=> b!545173 m!522879))

(declare-fun m!522883 () Bool)

(assert (=> b!545173 m!522883))

(assert (=> b!545174 m!522879))

(assert (=> b!545174 m!522879))

(declare-fun m!522885 () Bool)

(assert (=> b!545174 m!522885))

(assert (=> b!545177 m!522879))

(assert (=> b!545177 m!522879))

(assert (=> b!545177 m!522885))

(assert (=> b!545119 d!82167))

(declare-fun d!82169 () Bool)

(declare-fun lt!248719 () (_ BitVec 32))

(assert (=> d!82169 (and (bvsge lt!248719 #b00000000000000000000000000000000) (bvslt lt!248719 (bvadd mask!3216 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!82169 (= lt!248719 (choose!52 index!1177 x!1030 mask!3216))))

(assert (=> d!82169 (validMask!0 mask!3216)))

(assert (=> d!82169 (= (nextIndex!0 index!1177 x!1030 mask!3216) lt!248719)))

(declare-fun bs!17002 () Bool)

(assert (= bs!17002 d!82169))

(declare-fun m!522887 () Bool)

(assert (=> bs!17002 m!522887))

(assert (=> bs!17002 m!522821))

(assert (=> b!545120 d!82169))

(declare-fun d!82171 () Bool)

(declare-fun lt!248728 () SeekEntryResult!4986)

(get-info :version)

(assert (=> d!82171 (and (or ((_ is Undefined!4986) lt!248728) (not ((_ is Found!4986) lt!248728)) (and (bvsge (index!22169 lt!248728) #b00000000000000000000000000000000) (bvslt (index!22169 lt!248728) (size!16892 a!3154)))) (or ((_ is Undefined!4986) lt!248728) ((_ is Found!4986) lt!248728) (not ((_ is MissingZero!4986) lt!248728)) (and (bvsge (index!22168 lt!248728) #b00000000000000000000000000000000) (bvslt (index!22168 lt!248728) (size!16892 a!3154)))) (or ((_ is Undefined!4986) lt!248728) ((_ is Found!4986) lt!248728) ((_ is MissingZero!4986) lt!248728) (not ((_ is MissingVacant!4986) lt!248728)) (and (bvsge (index!22171 lt!248728) #b00000000000000000000000000000000) (bvslt (index!22171 lt!248728) (size!16892 a!3154)))) (or ((_ is Undefined!4986) lt!248728) (ite ((_ is Found!4986) lt!248728) (= (select (arr!16528 a!3154) (index!22169 lt!248728)) k0!1998) (ite ((_ is MissingZero!4986) lt!248728) (= (select (arr!16528 a!3154) (index!22168 lt!248728)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4986) lt!248728) (= (select (arr!16528 a!3154) (index!22171 lt!248728)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!315123 () SeekEntryResult!4986)

(assert (=> d!82171 (= lt!248728 e!315123)))

(declare-fun c!63283 () Bool)

(declare-fun lt!248726 () SeekEntryResult!4986)

(assert (=> d!82171 (= c!63283 (and ((_ is Intermediate!4986) lt!248726) (undefined!5798 lt!248726)))))

(assert (=> d!82171 (= lt!248726 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1998 mask!3216) k0!1998 a!3154 mask!3216))))

(assert (=> d!82171 (validMask!0 mask!3216)))

(assert (=> d!82171 (= (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216) lt!248728)))

(declare-fun b!545190 () Bool)

(declare-fun c!63284 () Bool)

(declare-fun lt!248727 () (_ BitVec 64))

(assert (=> b!545190 (= c!63284 (= lt!248727 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!315122 () SeekEntryResult!4986)

(declare-fun e!315121 () SeekEntryResult!4986)

(assert (=> b!545190 (= e!315122 e!315121)))

(declare-fun b!545191 () Bool)

(assert (=> b!545191 (= e!315123 e!315122)))

(assert (=> b!545191 (= lt!248727 (select (arr!16528 a!3154) (index!22170 lt!248726)))))

(declare-fun c!63282 () Bool)

(assert (=> b!545191 (= c!63282 (= lt!248727 k0!1998))))

(declare-fun b!545192 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34396 (_ BitVec 32)) SeekEntryResult!4986)

(assert (=> b!545192 (= e!315121 (seekKeyOrZeroReturnVacant!0 (x!51089 lt!248726) (index!22170 lt!248726) (index!22170 lt!248726) k0!1998 a!3154 mask!3216))))

(declare-fun b!545193 () Bool)

(assert (=> b!545193 (= e!315121 (MissingZero!4986 (index!22170 lt!248726)))))

(declare-fun b!545194 () Bool)

(assert (=> b!545194 (= e!315123 Undefined!4986)))

(declare-fun b!545195 () Bool)

(assert (=> b!545195 (= e!315122 (Found!4986 (index!22170 lt!248726)))))

(assert (= (and d!82171 c!63283) b!545194))

(assert (= (and d!82171 (not c!63283)) b!545191))

(assert (= (and b!545191 c!63282) b!545195))

(assert (= (and b!545191 (not c!63282)) b!545190))

(assert (= (and b!545190 c!63284) b!545193))

(assert (= (and b!545190 (not c!63284)) b!545192))

(declare-fun m!522889 () Bool)

(assert (=> d!82171 m!522889))

(declare-fun m!522891 () Bool)

(assert (=> d!82171 m!522891))

(declare-fun m!522893 () Bool)

(assert (=> d!82171 m!522893))

(declare-fun m!522895 () Bool)

(assert (=> d!82171 m!522895))

(assert (=> d!82171 m!522889))

(declare-fun m!522897 () Bool)

(assert (=> d!82171 m!522897))

(assert (=> d!82171 m!522821))

(declare-fun m!522899 () Bool)

(assert (=> b!545191 m!522899))

(declare-fun m!522901 () Bool)

(assert (=> b!545192 m!522901))

(assert (=> b!545116 d!82171))

(declare-fun d!82175 () Bool)

(assert (=> d!82175 (= (validKeyInArray!0 (select (arr!16528 a!3154) j!147)) (and (not (= (select (arr!16528 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16528 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!545118 d!82175))

(declare-fun b!545253 () Bool)

(declare-fun e!315161 () Bool)

(declare-fun lt!248752 () SeekEntryResult!4986)

(assert (=> b!545253 (= e!315161 (bvsge (x!51089 lt!248752) #b01111111111111111111111111111110))))

(declare-fun b!545254 () Bool)

(declare-fun e!315158 () SeekEntryResult!4986)

(assert (=> b!545254 (= e!315158 (Intermediate!4986 false index!1177 x!1030))))

(declare-fun d!82179 () Bool)

(assert (=> d!82179 e!315161))

(declare-fun c!63305 () Bool)

(assert (=> d!82179 (= c!63305 (and ((_ is Intermediate!4986) lt!248752) (undefined!5798 lt!248752)))))

(declare-fun e!315162 () SeekEntryResult!4986)

(assert (=> d!82179 (= lt!248752 e!315162)))

(declare-fun c!63304 () Bool)

(assert (=> d!82179 (= c!63304 (bvsge x!1030 #b01111111111111111111111111111110))))

(declare-fun lt!248751 () (_ BitVec 64))

(assert (=> d!82179 (= lt!248751 (select (arr!16528 a!3154) index!1177))))

(assert (=> d!82179 (validMask!0 mask!3216)))

(assert (=> d!82179 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16528 a!3154) j!147) a!3154 mask!3216) lt!248752)))

(declare-fun b!545255 () Bool)

(assert (=> b!545255 (and (bvsge (index!22170 lt!248752) #b00000000000000000000000000000000) (bvslt (index!22170 lt!248752) (size!16892 a!3154)))))

(declare-fun res!339298 () Bool)

(assert (=> b!545255 (= res!339298 (= (select (arr!16528 a!3154) (index!22170 lt!248752)) (select (arr!16528 a!3154) j!147)))))

(declare-fun e!315160 () Bool)

(assert (=> b!545255 (=> res!339298 e!315160)))

(declare-fun e!315159 () Bool)

(assert (=> b!545255 (= e!315159 e!315160)))

(declare-fun b!545256 () Bool)

(assert (=> b!545256 (and (bvsge (index!22170 lt!248752) #b00000000000000000000000000000000) (bvslt (index!22170 lt!248752) (size!16892 a!3154)))))

(declare-fun res!339299 () Bool)

(assert (=> b!545256 (= res!339299 (= (select (arr!16528 a!3154) (index!22170 lt!248752)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!545256 (=> res!339299 e!315160)))

(declare-fun b!545257 () Bool)

(assert (=> b!545257 (and (bvsge (index!22170 lt!248752) #b00000000000000000000000000000000) (bvslt (index!22170 lt!248752) (size!16892 a!3154)))))

(assert (=> b!545257 (= e!315160 (= (select (arr!16528 a!3154) (index!22170 lt!248752)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!545258 () Bool)

(assert (=> b!545258 (= e!315161 e!315159)))

(declare-fun res!339297 () Bool)

(assert (=> b!545258 (= res!339297 (and ((_ is Intermediate!4986) lt!248752) (not (undefined!5798 lt!248752)) (bvslt (x!51089 lt!248752) #b01111111111111111111111111111110) (bvsge (x!51089 lt!248752) #b00000000000000000000000000000000) (bvsge (x!51089 lt!248752) x!1030)))))

(assert (=> b!545258 (=> (not res!339297) (not e!315159))))

(declare-fun b!545259 () Bool)

(assert (=> b!545259 (= e!315158 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (arr!16528 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545260 () Bool)

(assert (=> b!545260 (= e!315162 (Intermediate!4986 true index!1177 x!1030))))

(declare-fun b!545261 () Bool)

(assert (=> b!545261 (= e!315162 e!315158)))

(declare-fun c!63303 () Bool)

(assert (=> b!545261 (= c!63303 (or (= lt!248751 (select (arr!16528 a!3154) j!147)) (= (bvadd lt!248751 lt!248751) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!82179 c!63304) b!545260))

(assert (= (and d!82179 (not c!63304)) b!545261))

(assert (= (and b!545261 c!63303) b!545254))

(assert (= (and b!545261 (not c!63303)) b!545259))

(assert (= (and d!82179 c!63305) b!545253))

(assert (= (and d!82179 (not c!63305)) b!545258))

(assert (= (and b!545258 res!339297) b!545255))

(assert (= (and b!545255 (not res!339298)) b!545256))

(assert (= (and b!545256 (not res!339299)) b!545257))

(assert (=> b!545259 m!522841))

(assert (=> b!545259 m!522841))

(assert (=> b!545259 m!522815))

(declare-fun m!522921 () Bool)

(assert (=> b!545259 m!522921))

(declare-fun m!522923 () Bool)

(assert (=> b!545257 m!522923))

(assert (=> b!545256 m!522923))

(assert (=> d!82179 m!522827))

(assert (=> d!82179 m!522821))

(assert (=> b!545255 m!522923))

(assert (=> b!545114 d!82179))

(declare-fun d!82193 () Bool)

(assert (=> d!82193 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!49526 d!82193))

(declare-fun d!82203 () Bool)

(assert (=> d!82203 (= (array_inv!12324 a!3154) (bvsge (size!16892 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!49526 d!82203))

(declare-fun d!82205 () Bool)

(declare-fun res!339310 () Bool)

(declare-fun e!315175 () Bool)

(assert (=> d!82205 (=> res!339310 e!315175)))

(assert (=> d!82205 (= res!339310 (= (select (arr!16528 a!3154) #b00000000000000000000000000000000) k0!1998))))

(assert (=> d!82205 (= (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000) e!315175)))

(declare-fun b!545276 () Bool)

(declare-fun e!315176 () Bool)

(assert (=> b!545276 (= e!315175 e!315176)))

(declare-fun res!339311 () Bool)

(assert (=> b!545276 (=> (not res!339311) (not e!315176))))

(assert (=> b!545276 (= res!339311 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16892 a!3154)))))

(declare-fun b!545277 () Bool)

(assert (=> b!545277 (= e!315176 (arrayContainsKey!0 a!3154 k0!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82205 (not res!339310)) b!545276))

(assert (= (and b!545276 res!339311) b!545277))

(assert (=> d!82205 m!522879))

(declare-fun m!522925 () Bool)

(assert (=> b!545277 m!522925))

(assert (=> b!545111 d!82205))

(declare-fun b!545278 () Bool)

(declare-fun e!315180 () Bool)

(declare-fun lt!248754 () SeekEntryResult!4986)

(assert (=> b!545278 (= e!315180 (bvsge (x!51089 lt!248754) #b01111111111111111111111111111110))))

(declare-fun b!545279 () Bool)

(declare-fun e!315177 () SeekEntryResult!4986)

(assert (=> b!545279 (= e!315177 (Intermediate!4986 false (toIndex!0 (select (arr!16528 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun d!82207 () Bool)

(assert (=> d!82207 e!315180))

(declare-fun c!63310 () Bool)

(assert (=> d!82207 (= c!63310 (and ((_ is Intermediate!4986) lt!248754) (undefined!5798 lt!248754)))))

(declare-fun e!315181 () SeekEntryResult!4986)

(assert (=> d!82207 (= lt!248754 e!315181)))

(declare-fun c!63309 () Bool)

(assert (=> d!82207 (= c!63309 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!248753 () (_ BitVec 64))

(assert (=> d!82207 (= lt!248753 (select (arr!16528 a!3154) (toIndex!0 (select (arr!16528 a!3154) j!147) mask!3216)))))

(assert (=> d!82207 (validMask!0 mask!3216)))

(assert (=> d!82207 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16528 a!3154) j!147) mask!3216) (select (arr!16528 a!3154) j!147) a!3154 mask!3216) lt!248754)))

(declare-fun b!545280 () Bool)

(assert (=> b!545280 (and (bvsge (index!22170 lt!248754) #b00000000000000000000000000000000) (bvslt (index!22170 lt!248754) (size!16892 a!3154)))))

(declare-fun res!339313 () Bool)

(assert (=> b!545280 (= res!339313 (= (select (arr!16528 a!3154) (index!22170 lt!248754)) (select (arr!16528 a!3154) j!147)))))

(declare-fun e!315179 () Bool)

(assert (=> b!545280 (=> res!339313 e!315179)))

(declare-fun e!315178 () Bool)

(assert (=> b!545280 (= e!315178 e!315179)))

(declare-fun b!545281 () Bool)

(assert (=> b!545281 (and (bvsge (index!22170 lt!248754) #b00000000000000000000000000000000) (bvslt (index!22170 lt!248754) (size!16892 a!3154)))))

(declare-fun res!339314 () Bool)

(assert (=> b!545281 (= res!339314 (= (select (arr!16528 a!3154) (index!22170 lt!248754)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!545281 (=> res!339314 e!315179)))

(declare-fun b!545282 () Bool)

(assert (=> b!545282 (and (bvsge (index!22170 lt!248754) #b00000000000000000000000000000000) (bvslt (index!22170 lt!248754) (size!16892 a!3154)))))

(assert (=> b!545282 (= e!315179 (= (select (arr!16528 a!3154) (index!22170 lt!248754)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!545283 () Bool)

(assert (=> b!545283 (= e!315180 e!315178)))

(declare-fun res!339312 () Bool)

(assert (=> b!545283 (= res!339312 (and ((_ is Intermediate!4986) lt!248754) (not (undefined!5798 lt!248754)) (bvslt (x!51089 lt!248754) #b01111111111111111111111111111110) (bvsge (x!51089 lt!248754) #b00000000000000000000000000000000) (bvsge (x!51089 lt!248754) #b00000000000000000000000000000000)))))

(assert (=> b!545283 (=> (not res!339312) (not e!315178))))

(declare-fun b!545284 () Bool)

(assert (=> b!545284 (= e!315177 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16528 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (select (arr!16528 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545285 () Bool)

(assert (=> b!545285 (= e!315181 (Intermediate!4986 true (toIndex!0 (select (arr!16528 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!545286 () Bool)

(assert (=> b!545286 (= e!315181 e!315177)))

(declare-fun c!63308 () Bool)

(assert (=> b!545286 (= c!63308 (or (= lt!248753 (select (arr!16528 a!3154) j!147)) (= (bvadd lt!248753 lt!248753) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!82207 c!63309) b!545285))

(assert (= (and d!82207 (not c!63309)) b!545286))

(assert (= (and b!545286 c!63308) b!545279))

(assert (= (and b!545286 (not c!63308)) b!545284))

(assert (= (and d!82207 c!63310) b!545278))

(assert (= (and d!82207 (not c!63310)) b!545283))

(assert (= (and b!545283 res!339312) b!545280))

(assert (= (and b!545280 (not res!339313)) b!545281))

(assert (= (and b!545281 (not res!339314)) b!545282))

(assert (=> b!545284 m!522833))

(declare-fun m!522927 () Bool)

(assert (=> b!545284 m!522927))

(assert (=> b!545284 m!522927))

(assert (=> b!545284 m!522815))

(declare-fun m!522929 () Bool)

(assert (=> b!545284 m!522929))

(declare-fun m!522931 () Bool)

(assert (=> b!545282 m!522931))

(assert (=> b!545281 m!522931))

(assert (=> d!82207 m!522833))

(declare-fun m!522933 () Bool)

(assert (=> d!82207 m!522933))

(assert (=> d!82207 m!522821))

(assert (=> b!545280 m!522931))

(assert (=> b!545122 d!82207))

(declare-fun d!82209 () Bool)

(declare-fun lt!248764 () (_ BitVec 32))

(declare-fun lt!248763 () (_ BitVec 32))

(assert (=> d!82209 (= lt!248764 (bvmul (bvxor lt!248763 (bvlshr lt!248763 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!82209 (= lt!248763 ((_ extract 31 0) (bvand (bvxor (select (arr!16528 a!3154) j!147) (bvlshr (select (arr!16528 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!82209 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!339315 (let ((h!11606 ((_ extract 31 0) (bvand (bvxor (select (arr!16528 a!3154) j!147) (bvlshr (select (arr!16528 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51096 (bvmul (bvxor h!11606 (bvlshr h!11606 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51096 (bvlshr x!51096 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!339315 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!339315 #b00000000000000000000000000000000))))))

(assert (=> d!82209 (= (toIndex!0 (select (arr!16528 a!3154) j!147) mask!3216) (bvand (bvxor lt!248764 (bvlshr lt!248764 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> b!545122 d!82209))

(declare-fun d!82213 () Bool)

(declare-fun res!339339 () Bool)

(declare-fun e!315217 () Bool)

(assert (=> d!82213 (=> res!339339 e!315217)))

(assert (=> d!82213 (= res!339339 (bvsge #b00000000000000000000000000000000 (size!16892 a!3154)))))

(assert (=> d!82213 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!315217)))

(declare-fun b!545337 () Bool)

(declare-fun e!315216 () Bool)

(declare-fun call!32125 () Bool)

(assert (=> b!545337 (= e!315216 call!32125)))

(declare-fun b!545338 () Bool)

(declare-fun e!315215 () Bool)

(assert (=> b!545338 (= e!315215 call!32125)))

(declare-fun bm!32122 () Bool)

(assert (=> bm!32122 (= call!32125 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!545339 () Bool)

(assert (=> b!545339 (= e!315216 e!315215)))

(declare-fun lt!248777 () (_ BitVec 64))

(assert (=> b!545339 (= lt!248777 (select (arr!16528 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16918 0))(
  ( (Unit!16919) )
))
(declare-fun lt!248776 () Unit!16918)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34396 (_ BitVec 64) (_ BitVec 32)) Unit!16918)

(assert (=> b!545339 (= lt!248776 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!248777 #b00000000000000000000000000000000))))

(assert (=> b!545339 (arrayContainsKey!0 a!3154 lt!248777 #b00000000000000000000000000000000)))

(declare-fun lt!248778 () Unit!16918)

(assert (=> b!545339 (= lt!248778 lt!248776)))

(declare-fun res!339338 () Bool)

(assert (=> b!545339 (= res!339338 (= (seekEntryOrOpen!0 (select (arr!16528 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4986 #b00000000000000000000000000000000)))))

(assert (=> b!545339 (=> (not res!339338) (not e!315215))))

(declare-fun b!545340 () Bool)

(assert (=> b!545340 (= e!315217 e!315216)))

(declare-fun c!63325 () Bool)

(assert (=> b!545340 (= c!63325 (validKeyInArray!0 (select (arr!16528 a!3154) #b00000000000000000000000000000000)))))

(assert (= (and d!82213 (not res!339339)) b!545340))

(assert (= (and b!545340 c!63325) b!545339))

(assert (= (and b!545340 (not c!63325)) b!545337))

(assert (= (and b!545339 res!339338) b!545338))

(assert (= (or b!545338 b!545337) bm!32122))

(declare-fun m!522949 () Bool)

(assert (=> bm!32122 m!522949))

(assert (=> b!545339 m!522879))

(declare-fun m!522951 () Bool)

(assert (=> b!545339 m!522951))

(declare-fun m!522953 () Bool)

(assert (=> b!545339 m!522953))

(assert (=> b!545339 m!522879))

(declare-fun m!522955 () Bool)

(assert (=> b!545339 m!522955))

(assert (=> b!545340 m!522879))

(assert (=> b!545340 m!522879))

(assert (=> b!545340 m!522885))

(assert (=> b!545121 d!82213))

(declare-fun d!82219 () Bool)

(assert (=> d!82219 (= (validKeyInArray!0 k0!1998) (and (not (= k0!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!545123 d!82219))

(declare-fun b!545341 () Bool)

(declare-fun e!315221 () Bool)

(declare-fun lt!248780 () SeekEntryResult!4986)

(assert (=> b!545341 (= e!315221 (bvsge (x!51089 lt!248780) #b01111111111111111111111111111110))))

(declare-fun b!545342 () Bool)

(declare-fun e!315218 () SeekEntryResult!4986)

(assert (=> b!545342 (= e!315218 (Intermediate!4986 false lt!248704 (bvadd #b00000000000000000000000000000001 x!1030)))))

(declare-fun d!82221 () Bool)

(assert (=> d!82221 e!315221))

(declare-fun c!63328 () Bool)

(assert (=> d!82221 (= c!63328 (and ((_ is Intermediate!4986) lt!248780) (undefined!5798 lt!248780)))))

(declare-fun e!315222 () SeekEntryResult!4986)

(assert (=> d!82221 (= lt!248780 e!315222)))

(declare-fun c!63327 () Bool)

(assert (=> d!82221 (= c!63327 (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b01111111111111111111111111111110))))

(declare-fun lt!248779 () (_ BitVec 64))

(assert (=> d!82221 (= lt!248779 (select (arr!16528 a!3154) lt!248704))))

(assert (=> d!82221 (validMask!0 mask!3216)))

(assert (=> d!82221 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!248704 (select (arr!16528 a!3154) j!147) a!3154 mask!3216) lt!248780)))

(declare-fun b!545343 () Bool)

(assert (=> b!545343 (and (bvsge (index!22170 lt!248780) #b00000000000000000000000000000000) (bvslt (index!22170 lt!248780) (size!16892 a!3154)))))

(declare-fun res!339341 () Bool)

(assert (=> b!545343 (= res!339341 (= (select (arr!16528 a!3154) (index!22170 lt!248780)) (select (arr!16528 a!3154) j!147)))))

(declare-fun e!315220 () Bool)

(assert (=> b!545343 (=> res!339341 e!315220)))

(declare-fun e!315219 () Bool)

(assert (=> b!545343 (= e!315219 e!315220)))

(declare-fun b!545344 () Bool)

(assert (=> b!545344 (and (bvsge (index!22170 lt!248780) #b00000000000000000000000000000000) (bvslt (index!22170 lt!248780) (size!16892 a!3154)))))

(declare-fun res!339342 () Bool)

(assert (=> b!545344 (= res!339342 (= (select (arr!16528 a!3154) (index!22170 lt!248780)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!545344 (=> res!339342 e!315220)))

(declare-fun b!545345 () Bool)

(assert (=> b!545345 (and (bvsge (index!22170 lt!248780) #b00000000000000000000000000000000) (bvslt (index!22170 lt!248780) (size!16892 a!3154)))))

(assert (=> b!545345 (= e!315220 (= (select (arr!16528 a!3154) (index!22170 lt!248780)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!545346 () Bool)

(assert (=> b!545346 (= e!315221 e!315219)))

(declare-fun res!339340 () Bool)

(assert (=> b!545346 (= res!339340 (and ((_ is Intermediate!4986) lt!248780) (not (undefined!5798 lt!248780)) (bvslt (x!51089 lt!248780) #b01111111111111111111111111111110) (bvsge (x!51089 lt!248780) #b00000000000000000000000000000000) (bvsge (x!51089 lt!248780) (bvadd #b00000000000000000000000000000001 x!1030))))))

(assert (=> b!545346 (=> (not res!339340) (not e!315219))))

(declare-fun b!545347 () Bool)

(assert (=> b!545347 (= e!315218 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030 #b00000000000000000000000000000001) (nextIndex!0 lt!248704 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216) (select (arr!16528 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545348 () Bool)

(assert (=> b!545348 (= e!315222 (Intermediate!4986 true lt!248704 (bvadd #b00000000000000000000000000000001 x!1030)))))

(declare-fun b!545349 () Bool)

(assert (=> b!545349 (= e!315222 e!315218)))

(declare-fun c!63326 () Bool)

(assert (=> b!545349 (= c!63326 (or (= lt!248779 (select (arr!16528 a!3154) j!147)) (= (bvadd lt!248779 lt!248779) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!82221 c!63327) b!545348))

(assert (= (and d!82221 (not c!63327)) b!545349))

(assert (= (and b!545349 c!63326) b!545342))

(assert (= (and b!545349 (not c!63326)) b!545347))

(assert (= (and d!82221 c!63328) b!545341))

(assert (= (and d!82221 (not c!63328)) b!545346))

(assert (= (and b!545346 res!339340) b!545343))

(assert (= (and b!545343 (not res!339341)) b!545344))

(assert (= (and b!545344 (not res!339342)) b!545345))

(declare-fun m!522957 () Bool)

(assert (=> b!545347 m!522957))

(assert (=> b!545347 m!522957))

(assert (=> b!545347 m!522815))

(declare-fun m!522959 () Bool)

(assert (=> b!545347 m!522959))

(declare-fun m!522961 () Bool)

(assert (=> b!545345 m!522961))

(assert (=> b!545344 m!522961))

(declare-fun m!522963 () Bool)

(assert (=> d!82221 m!522963))

(assert (=> d!82221 m!522821))

(assert (=> b!545343 m!522961))

(assert (=> b!545112 d!82221))

(check-sat (not b!545284) (not d!82221) (not b!545192) (not b!545177) (not bm!32122) (not b!545173) (not d!82179) (not b!545347) (not b!545277) (not b!545339) (not bm!32111) (not d!82171) (not b!545340) (not d!82207) (not b!545174) (not d!82169) (not b!545259))
(check-sat)
