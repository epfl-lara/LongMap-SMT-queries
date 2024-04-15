; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49812 () Bool)

(assert start!49812)

(declare-fun b!546999 () Bool)

(declare-fun res!340789 () Bool)

(declare-fun e!316042 () Bool)

(assert (=> b!546999 (=> (not res!340789) (not e!316042))))

(declare-datatypes ((array!34526 0))(
  ( (array!34527 (arr!16588 (Array (_ BitVec 32) (_ BitVec 64))) (size!16953 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34526)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546999 (= res!340789 (validKeyInArray!0 (select (arr!16588 a!3118) j!142)))))

(declare-fun b!547000 () Bool)

(declare-fun res!340783 () Bool)

(assert (=> b!547000 (=> (not res!340783) (not e!316042))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!547000 (= res!340783 (validKeyInArray!0 k!1914))))

(declare-fun b!547001 () Bool)

(declare-fun res!340785 () Bool)

(assert (=> b!547001 (=> (not res!340785) (not e!316042))))

(declare-fun arrayContainsKey!0 (array!34526 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!547001 (= res!340785 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun res!340786 () Bool)

(assert (=> start!49812 (=> (not res!340786) (not e!316042))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49812 (= res!340786 (validMask!0 mask!3119))))

(assert (=> start!49812 e!316042))

(assert (=> start!49812 true))

(declare-fun array_inv!12471 (array!34526) Bool)

(assert (=> start!49812 (array_inv!12471 a!3118)))

(declare-fun b!547002 () Bool)

(declare-fun res!340788 () Bool)

(declare-fun e!316043 () Bool)

(assert (=> b!547002 (=> (not res!340788) (not e!316043))))

(assert (=> b!547002 (= res!340788 (and (bvsle #b00000000000000000000000000000000 (size!16953 a!3118)) (bvslt (size!16953 a!3118) #b01111111111111111111111111111111)))))

(declare-fun b!547003 () Bool)

(declare-datatypes ((List!10707 0))(
  ( (Nil!10704) (Cons!10703 (h!11670 (_ BitVec 64)) (t!16926 List!10707)) )
))
(declare-fun noDuplicate!226 (List!10707) Bool)

(assert (=> b!547003 (= e!316043 (not (noDuplicate!226 Nil!10704)))))

(declare-fun b!547004 () Bool)

(declare-fun res!340787 () Bool)

(assert (=> b!547004 (=> (not res!340787) (not e!316042))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!547004 (= res!340787 (and (= (size!16953 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16953 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16953 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!547005 () Bool)

(declare-fun res!340790 () Bool)

(assert (=> b!547005 (=> (not res!340790) (not e!316043))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34526 (_ BitVec 32)) Bool)

(assert (=> b!547005 (= res!340790 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!547006 () Bool)

(assert (=> b!547006 (= e!316042 e!316043)))

(declare-fun res!340784 () Bool)

(assert (=> b!547006 (=> (not res!340784) (not e!316043))))

(declare-datatypes ((SeekEntryResult!5034 0))(
  ( (MissingZero!5034 (index!22363 (_ BitVec 32))) (Found!5034 (index!22364 (_ BitVec 32))) (Intermediate!5034 (undefined!5846 Bool) (index!22365 (_ BitVec 32)) (x!51313 (_ BitVec 32))) (Undefined!5034) (MissingVacant!5034 (index!22366 (_ BitVec 32))) )
))
(declare-fun lt!249247 () SeekEntryResult!5034)

(assert (=> b!547006 (= res!340784 (or (= lt!249247 (MissingZero!5034 i!1132)) (= lt!249247 (MissingVacant!5034 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34526 (_ BitVec 32)) SeekEntryResult!5034)

(assert (=> b!547006 (= lt!249247 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!49812 res!340786) b!547004))

(assert (= (and b!547004 res!340787) b!546999))

(assert (= (and b!546999 res!340789) b!547000))

(assert (= (and b!547000 res!340783) b!547001))

(assert (= (and b!547001 res!340785) b!547006))

(assert (= (and b!547006 res!340784) b!547005))

(assert (= (and b!547005 res!340790) b!547002))

(assert (= (and b!547002 res!340788) b!547003))

(declare-fun m!523825 () Bool)

(assert (=> start!49812 m!523825))

(declare-fun m!523827 () Bool)

(assert (=> start!49812 m!523827))

(declare-fun m!523829 () Bool)

(assert (=> b!547006 m!523829))

(declare-fun m!523831 () Bool)

(assert (=> b!547000 m!523831))

(declare-fun m!523833 () Bool)

(assert (=> b!546999 m!523833))

(assert (=> b!546999 m!523833))

(declare-fun m!523835 () Bool)

(assert (=> b!546999 m!523835))

(declare-fun m!523837 () Bool)

(assert (=> b!547001 m!523837))

(declare-fun m!523839 () Bool)

(assert (=> b!547005 m!523839))

(declare-fun m!523841 () Bool)

(assert (=> b!547003 m!523841))

(push 1)

(assert (not b!547003))

(assert (not b!547001))

(assert (not b!547000))

(assert (not b!547005))

(assert (not b!547006))

(assert (not b!546999))

(assert (not start!49812))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!82239 () Bool)

(assert (=> d!82239 (= (validKeyInArray!0 (select (arr!16588 a!3118) j!142)) (and (not (= (select (arr!16588 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16588 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!546999 d!82239))

(declare-fun d!82241 () Bool)

(assert (=> d!82241 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!49812 d!82241))

(declare-fun d!82247 () Bool)

(assert (=> d!82247 (= (array_inv!12471 a!3118) (bvsge (size!16953 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!49812 d!82247))

(declare-fun b!547045 () Bool)

(declare-fun e!316077 () Bool)

(declare-fun e!316076 () Bool)

(assert (=> b!547045 (= e!316077 e!316076)))

(declare-fun c!63444 () Bool)

(assert (=> b!547045 (= c!63444 (validKeyInArray!0 (select (arr!16588 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32137 () Bool)

(declare-fun call!32140 () Bool)

(assert (=> bm!32137 (= call!32140 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!547046 () Bool)

(declare-fun e!316075 () Bool)

(assert (=> b!547046 (= e!316076 e!316075)))

(declare-fun lt!249273 () (_ BitVec 64))

(assert (=> b!547046 (= lt!249273 (select (arr!16588 a!3118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16934 0))(
  ( (Unit!16935) )
))
(declare-fun lt!249272 () Unit!16934)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34526 (_ BitVec 64) (_ BitVec 32)) Unit!16934)

(assert (=> b!547046 (= lt!249272 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!249273 #b00000000000000000000000000000000))))

(assert (=> b!547046 (arrayContainsKey!0 a!3118 lt!249273 #b00000000000000000000000000000000)))

(declare-fun lt!249274 () Unit!16934)

(assert (=> b!547046 (= lt!249274 lt!249272)))

(declare-fun res!340814 () Bool)

(assert (=> b!547046 (= res!340814 (= (seekEntryOrOpen!0 (select (arr!16588 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5034 #b00000000000000000000000000000000)))))

(assert (=> b!547046 (=> (not res!340814) (not e!316075))))

(declare-fun b!547047 () Bool)

(assert (=> b!547047 (= e!316075 call!32140)))

(declare-fun b!547048 () Bool)

(assert (=> b!547048 (= e!316076 call!32140)))

(declare-fun d!82249 () Bool)

(declare-fun res!340813 () Bool)

(assert (=> d!82249 (=> res!340813 e!316077)))

(assert (=> d!82249 (= res!340813 (bvsge #b00000000000000000000000000000000 (size!16953 a!3118)))))

(assert (=> d!82249 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!316077)))

(assert (= (and d!82249 (not res!340813)) b!547045))

(assert (= (and b!547045 c!63444) b!547046))

(assert (= (and b!547045 (not c!63444)) b!547048))

(assert (= (and b!547046 res!340814) b!547047))

(assert (= (or b!547047 b!547048) bm!32137))

(declare-fun m!523871 () Bool)

(assert (=> b!547045 m!523871))

(assert (=> b!547045 m!523871))

(declare-fun m!523873 () Bool)

(assert (=> b!547045 m!523873))

(declare-fun m!523875 () Bool)

(assert (=> bm!32137 m!523875))

(assert (=> b!547046 m!523871))

(declare-fun m!523877 () Bool)

(assert (=> b!547046 m!523877))

(declare-fun m!523879 () Bool)

(assert (=> b!547046 m!523879))

(assert (=> b!547046 m!523871))

(declare-fun m!523881 () Bool)

(assert (=> b!547046 m!523881))

(assert (=> b!547005 d!82249))

(declare-fun d!82259 () Bool)

(assert (=> d!82259 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!547000 d!82259))

(declare-fun e!316096 () SeekEntryResult!5034)

(declare-fun lt!249281 () SeekEntryResult!5034)

(declare-fun b!547073 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34526 (_ BitVec 32)) SeekEntryResult!5034)

(assert (=> b!547073 (= e!316096 (seekKeyOrZeroReturnVacant!0 (x!51313 lt!249281) (index!22365 lt!249281) (index!22365 lt!249281) k!1914 a!3118 mask!3119))))

(declare-fun b!547074 () Bool)

(declare-fun c!63451 () Bool)

(declare-fun lt!249282 () (_ BitVec 64))

(assert (=> b!547074 (= c!63451 (= lt!249282 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!316097 () SeekEntryResult!5034)

(assert (=> b!547074 (= e!316097 e!316096)))

(declare-fun b!547075 () Bool)

(declare-fun e!316098 () SeekEntryResult!5034)

(assert (=> b!547075 (= e!316098 Undefined!5034)))

(declare-fun d!82261 () Bool)

(declare-fun lt!249283 () SeekEntryResult!5034)

(assert (=> d!82261 (and (or (is-Undefined!5034 lt!249283) (not (is-Found!5034 lt!249283)) (and (bvsge (index!22364 lt!249283) #b00000000000000000000000000000000) (bvslt (index!22364 lt!249283) (size!16953 a!3118)))) (or (is-Undefined!5034 lt!249283) (is-Found!5034 lt!249283) (not (is-MissingZero!5034 lt!249283)) (and (bvsge (index!22363 lt!249283) #b00000000000000000000000000000000) (bvslt (index!22363 lt!249283) (size!16953 a!3118)))) (or (is-Undefined!5034 lt!249283) (is-Found!5034 lt!249283) (is-MissingZero!5034 lt!249283) (not (is-MissingVacant!5034 lt!249283)) (and (bvsge (index!22366 lt!249283) #b00000000000000000000000000000000) (bvslt (index!22366 lt!249283) (size!16953 a!3118)))) (or (is-Undefined!5034 lt!249283) (ite (is-Found!5034 lt!249283) (= (select (arr!16588 a!3118) (index!22364 lt!249283)) k!1914) (ite (is-MissingZero!5034 lt!249283) (= (select (arr!16588 a!3118) (index!22363 lt!249283)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5034 lt!249283) (= (select (arr!16588 a!3118) (index!22366 lt!249283)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!82261 (= lt!249283 e!316098)))

(declare-fun c!63452 () Bool)

(assert (=> d!82261 (= c!63452 (and (is-Intermediate!5034 lt!249281) (undefined!5846 lt!249281)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34526 (_ BitVec 32)) SeekEntryResult!5034)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!82261 (= lt!249281 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!82261 (validMask!0 mask!3119)))

(assert (=> d!82261 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!249283)))

(declare-fun b!547076 () Bool)

(assert (=> b!547076 (= e!316098 e!316097)))

(assert (=> b!547076 (= lt!249282 (select (arr!16588 a!3118) (index!22365 lt!249281)))))

(declare-fun c!63453 () Bool)

(assert (=> b!547076 (= c!63453 (= lt!249282 k!1914))))

(declare-fun b!547077 () Bool)

(assert (=> b!547077 (= e!316096 (MissingZero!5034 (index!22365 lt!249281)))))

(declare-fun b!547078 () Bool)

(assert (=> b!547078 (= e!316097 (Found!5034 (index!22365 lt!249281)))))

(assert (= (and d!82261 c!63452) b!547075))

(assert (= (and d!82261 (not c!63452)) b!547076))

(assert (= (and b!547076 c!63453) b!547078))

(assert (= (and b!547076 (not c!63453)) b!547074))

(assert (= (and b!547074 c!63451) b!547077))

(assert (= (and b!547074 (not c!63451)) b!547073))

(declare-fun m!523889 () Bool)

(assert (=> b!547073 m!523889))

(declare-fun m!523891 () Bool)

(assert (=> d!82261 m!523891))

(declare-fun m!523893 () Bool)

(assert (=> d!82261 m!523893))

(assert (=> d!82261 m!523891))

(declare-fun m!523895 () Bool)

(assert (=> d!82261 m!523895))

(assert (=> d!82261 m!523825))

(declare-fun m!523897 () Bool)

(assert (=> d!82261 m!523897))

(declare-fun m!523899 () Bool)

(assert (=> d!82261 m!523899))

(declare-fun m!523901 () Bool)

(assert (=> b!547076 m!523901))

(assert (=> b!547006 d!82261))

(declare-fun d!82269 () Bool)

(declare-fun res!340831 () Bool)

(declare-fun e!316103 () Bool)

(assert (=> d!82269 (=> res!340831 e!316103)))

(assert (=> d!82269 (= res!340831 (= (select (arr!16588 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!82269 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!316103)))

(declare-fun b!547083 () Bool)

(declare-fun e!316104 () Bool)

(assert (=> b!547083 (= e!316103 e!316104)))

(declare-fun res!340832 () Bool)

(assert (=> b!547083 (=> (not res!340832) (not e!316104))))

(assert (=> b!547083 (= res!340832 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16953 a!3118)))))

(declare-fun b!547084 () Bool)

(assert (=> b!547084 (= e!316104 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82269 (not res!340831)) b!547083))

(assert (= (and b!547083 res!340832) b!547084))

(assert (=> d!82269 m!523871))

(declare-fun m!523903 () Bool)

(assert (=> b!547084 m!523903))

(assert (=> b!547001 d!82269))

(declare-fun d!82271 () Bool)

(declare-fun res!340837 () Bool)

(declare-fun e!316115 () Bool)

(assert (=> d!82271 (=> res!340837 e!316115)))

(assert (=> d!82271 (= res!340837 (is-Nil!10704 Nil!10704))))

(assert (=> d!82271 (= (noDuplicate!226 Nil!10704) e!316115)))

(declare-fun b!547101 () Bool)

(declare-fun e!316116 () Bool)

(assert (=> b!547101 (= e!316115 e!316116)))

(declare-fun res!340838 () Bool)

(assert (=> b!547101 (=> (not res!340838) (not e!316116))))

(declare-fun contains!2797 (List!10707 (_ BitVec 64)) Bool)

(assert (=> b!547101 (= res!340838 (not (contains!2797 (t!16926 Nil!10704) (h!11670 Nil!10704))))))

(declare-fun b!547102 () Bool)

(assert (=> b!547102 (= e!316116 (noDuplicate!226 (t!16926 Nil!10704)))))

(assert (= (and d!82271 (not res!340837)) b!547101))

(assert (= (and b!547101 res!340838) b!547102))

(declare-fun m!523905 () Bool)

(assert (=> b!547101 m!523905))

(declare-fun m!523907 () Bool)

(assert (=> b!547102 m!523907))

(assert (=> b!547003 d!82271))

(push 1)

(assert (not bm!32137))

(assert (not b!547073))

(assert (not d!82261))

(assert (not b!547101))

(assert (not b!547045))

(assert (not b!547046))

(assert (not b!547102))

(assert (not b!547084))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

