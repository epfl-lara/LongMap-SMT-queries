; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49354 () Bool)

(assert start!49354)

(declare-fun b!543870 () Bool)

(declare-fun res!338427 () Bool)

(declare-fun e!314444 () Bool)

(assert (=> b!543870 (=> (not res!338427) (not e!314444))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34362 0))(
  ( (array!34363 (arr!16514 (Array (_ BitVec 32) (_ BitVec 64))) (size!16878 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34362)

(assert (=> b!543870 (= res!338427 (and (not (= (select (arr!16514 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16514 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16514 a!3154) index!1177) (select (arr!16514 a!3154) j!147)))))))

(declare-fun b!543871 () Bool)

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!543871 (= e!314444 (bvsgt (bvadd #b00000000000000000000000000000001 x!1030) resX!32))))

(declare-fun lt!248279 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543871 (= lt!248279 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!543872 () Bool)

(declare-fun res!338425 () Bool)

(assert (=> b!543872 (=> (not res!338425) (not e!314444))))

(declare-datatypes ((SeekEntryResult!4972 0))(
  ( (MissingZero!4972 (index!22112 (_ BitVec 32))) (Found!4972 (index!22113 (_ BitVec 32))) (Intermediate!4972 (undefined!5784 Bool) (index!22114 (_ BitVec 32)) (x!51011 (_ BitVec 32))) (Undefined!4972) (MissingVacant!4972 (index!22115 (_ BitVec 32))) )
))
(declare-fun lt!248280 () SeekEntryResult!4972)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34362 (_ BitVec 32)) SeekEntryResult!4972)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543872 (= res!338425 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16514 a!3154) j!147) mask!3216) (select (arr!16514 a!3154) j!147) a!3154 mask!3216) lt!248280))))

(declare-fun b!543873 () Bool)

(declare-fun res!338431 () Bool)

(declare-fun e!314445 () Bool)

(assert (=> b!543873 (=> (not res!338431) (not e!314445))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34362 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!543873 (= res!338431 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun res!338428 () Bool)

(assert (=> start!49354 (=> (not res!338428) (not e!314445))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49354 (= res!338428 (validMask!0 mask!3216))))

(assert (=> start!49354 e!314445))

(assert (=> start!49354 true))

(declare-fun array_inv!12310 (array!34362) Bool)

(assert (=> start!49354 (array_inv!12310 a!3154)))

(declare-fun b!543874 () Bool)

(declare-fun res!338422 () Bool)

(declare-fun e!314442 () Bool)

(assert (=> b!543874 (=> (not res!338422) (not e!314442))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34362 (_ BitVec 32)) Bool)

(assert (=> b!543874 (= res!338422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!543875 () Bool)

(assert (=> b!543875 (= e!314442 e!314444)))

(declare-fun res!338424 () Bool)

(assert (=> b!543875 (=> (not res!338424) (not e!314444))))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!543875 (= res!338424 (= lt!248280 (Intermediate!4972 false resIndex!32 resX!32)))))

(assert (=> b!543875 (= lt!248280 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16514 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!543876 () Bool)

(declare-fun res!338430 () Bool)

(assert (=> b!543876 (=> (not res!338430) (not e!314442))))

(assert (=> b!543876 (= res!338430 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16878 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16878 a!3154)) (= (select (arr!16514 a!3154) resIndex!32) (select (arr!16514 a!3154) j!147))))))

(declare-fun b!543877 () Bool)

(declare-fun res!338426 () Bool)

(assert (=> b!543877 (=> (not res!338426) (not e!314445))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!543877 (= res!338426 (and (= (size!16878 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16878 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16878 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!543878 () Bool)

(declare-fun res!338421 () Bool)

(assert (=> b!543878 (=> (not res!338421) (not e!314445))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!543878 (= res!338421 (validKeyInArray!0 (select (arr!16514 a!3154) j!147)))))

(declare-fun b!543879 () Bool)

(declare-fun res!338429 () Bool)

(assert (=> b!543879 (=> (not res!338429) (not e!314442))))

(declare-datatypes ((List!10633 0))(
  ( (Nil!10630) (Cons!10629 (h!11584 (_ BitVec 64)) (t!16861 List!10633)) )
))
(declare-fun arrayNoDuplicates!0 (array!34362 (_ BitVec 32) List!10633) Bool)

(assert (=> b!543879 (= res!338429 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10630))))

(declare-fun b!543880 () Bool)

(assert (=> b!543880 (= e!314445 e!314442)))

(declare-fun res!338432 () Bool)

(assert (=> b!543880 (=> (not res!338432) (not e!314442))))

(declare-fun lt!248281 () SeekEntryResult!4972)

(assert (=> b!543880 (= res!338432 (or (= lt!248281 (MissingZero!4972 i!1153)) (= lt!248281 (MissingVacant!4972 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34362 (_ BitVec 32)) SeekEntryResult!4972)

(assert (=> b!543880 (= lt!248281 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!543881 () Bool)

(declare-fun res!338423 () Bool)

(assert (=> b!543881 (=> (not res!338423) (not e!314445))))

(assert (=> b!543881 (= res!338423 (validKeyInArray!0 k!1998))))

(assert (= (and start!49354 res!338428) b!543877))

(assert (= (and b!543877 res!338426) b!543878))

(assert (= (and b!543878 res!338421) b!543881))

(assert (= (and b!543881 res!338423) b!543873))

(assert (= (and b!543873 res!338431) b!543880))

(assert (= (and b!543880 res!338432) b!543874))

(assert (= (and b!543874 res!338422) b!543879))

(assert (= (and b!543879 res!338429) b!543876))

(assert (= (and b!543876 res!338430) b!543875))

(assert (= (and b!543875 res!338424) b!543872))

(assert (= (and b!543872 res!338425) b!543870))

(assert (= (and b!543870 res!338427) b!543871))

(declare-fun m!521889 () Bool)

(assert (=> start!49354 m!521889))

(declare-fun m!521891 () Bool)

(assert (=> start!49354 m!521891))

(declare-fun m!521893 () Bool)

(assert (=> b!543880 m!521893))

(declare-fun m!521895 () Bool)

(assert (=> b!543881 m!521895))

(declare-fun m!521897 () Bool)

(assert (=> b!543871 m!521897))

(declare-fun m!521899 () Bool)

(assert (=> b!543879 m!521899))

(declare-fun m!521901 () Bool)

(assert (=> b!543878 m!521901))

(assert (=> b!543878 m!521901))

(declare-fun m!521903 () Bool)

(assert (=> b!543878 m!521903))

(declare-fun m!521905 () Bool)

(assert (=> b!543876 m!521905))

(assert (=> b!543876 m!521901))

(declare-fun m!521907 () Bool)

(assert (=> b!543873 m!521907))

(assert (=> b!543875 m!521901))

(assert (=> b!543875 m!521901))

(declare-fun m!521909 () Bool)

(assert (=> b!543875 m!521909))

(declare-fun m!521911 () Bool)

(assert (=> b!543870 m!521911))

(assert (=> b!543870 m!521901))

(declare-fun m!521913 () Bool)

(assert (=> b!543874 m!521913))

(assert (=> b!543872 m!521901))

(assert (=> b!543872 m!521901))

(declare-fun m!521915 () Bool)

(assert (=> b!543872 m!521915))

(assert (=> b!543872 m!521915))

(assert (=> b!543872 m!521901))

(declare-fun m!521917 () Bool)

(assert (=> b!543872 m!521917))

(push 1)

(assert (not b!543872))

(assert (not b!543879))

(assert (not b!543881))

(assert (not b!543875))

(assert (not start!49354))

(assert (not b!543874))

(assert (not b!543871))

(assert (not b!543873))

(assert (not b!543878))

(assert (not b!543880))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!81937 () Bool)

(assert (=> d!81937 (= (validKeyInArray!0 k!1998) (and (not (= k!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!543881 d!81937))

(declare-fun d!81939 () Bool)

(declare-fun lt!248293 () (_ BitVec 32))

(assert (=> d!81939 (and (bvsge lt!248293 #b00000000000000000000000000000000) (bvslt lt!248293 (bvadd mask!3216 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!81939 (= lt!248293 (choose!52 index!1177 x!1030 mask!3216))))

(assert (=> d!81939 (validMask!0 mask!3216)))

(assert (=> d!81939 (= (nextIndex!0 index!1177 x!1030 mask!3216) lt!248293)))

(declare-fun bs!16975 () Bool)

(assert (= bs!16975 d!81939))

(declare-fun m!521943 () Bool)

(assert (=> bs!16975 m!521943))

(assert (=> bs!16975 m!521889))

(assert (=> b!543871 d!81939))

(declare-fun b!543984 () Bool)

(declare-fun e!314514 () SeekEntryResult!4972)

(declare-fun e!314517 () SeekEntryResult!4972)

(assert (=> b!543984 (= e!314514 e!314517)))

(declare-fun c!63076 () Bool)

(declare-fun lt!248317 () (_ BitVec 64))

(assert (=> b!543984 (= c!63076 (or (= lt!248317 (select (arr!16514 a!3154) j!147)) (= (bvadd lt!248317 lt!248317) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!543985 () Bool)

(declare-fun e!314516 () Bool)

(declare-fun lt!248316 () SeekEntryResult!4972)

(assert (=> b!543985 (= e!314516 (bvsge (x!51011 lt!248316) #b01111111111111111111111111111110))))

(declare-fun b!543986 () Bool)

(assert (=> b!543986 (= e!314517 (Intermediate!4972 false (toIndex!0 (select (arr!16514 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!543987 () Bool)

(assert (=> b!543987 (and (bvsge (index!22114 lt!248316) #b00000000000000000000000000000000) (bvslt (index!22114 lt!248316) (size!16878 a!3154)))))

(declare-fun e!314513 () Bool)

(assert (=> b!543987 (= e!314513 (= (select (arr!16514 a!3154) (index!22114 lt!248316)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!543988 () Bool)

(declare-fun e!314515 () Bool)

(assert (=> b!543988 (= e!314516 e!314515)))

(declare-fun res!338469 () Bool)

(assert (=> b!543988 (= res!338469 (and (is-Intermediate!4972 lt!248316) (not (undefined!5784 lt!248316)) (bvslt (x!51011 lt!248316) #b01111111111111111111111111111110) (bvsge (x!51011 lt!248316) #b00000000000000000000000000000000) (bvsge (x!51011 lt!248316) #b00000000000000000000000000000000)))))

(assert (=> b!543988 (=> (not res!338469) (not e!314515))))

(declare-fun d!81943 () Bool)

(assert (=> d!81943 e!314516))

(declare-fun c!63077 () Bool)

(assert (=> d!81943 (= c!63077 (and (is-Intermediate!4972 lt!248316) (undefined!5784 lt!248316)))))

(assert (=> d!81943 (= lt!248316 e!314514)))

(declare-fun c!63075 () Bool)

(assert (=> d!81943 (= c!63075 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!81943 (= lt!248317 (select (arr!16514 a!3154) (toIndex!0 (select (arr!16514 a!3154) j!147) mask!3216)))))

(assert (=> d!81943 (validMask!0 mask!3216)))

(assert (=> d!81943 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16514 a!3154) j!147) mask!3216) (select (arr!16514 a!3154) j!147) a!3154 mask!3216) lt!248316)))

(declare-fun b!543989 () Bool)

(assert (=> b!543989 (and (bvsge (index!22114 lt!248316) #b00000000000000000000000000000000) (bvslt (index!22114 lt!248316) (size!16878 a!3154)))))

(declare-fun res!338471 () Bool)

(assert (=> b!543989 (= res!338471 (= (select (arr!16514 a!3154) (index!22114 lt!248316)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!543989 (=> res!338471 e!314513)))

(declare-fun b!543990 () Bool)

(assert (=> b!543990 (and (bvsge (index!22114 lt!248316) #b00000000000000000000000000000000) (bvslt (index!22114 lt!248316) (size!16878 a!3154)))))

(declare-fun res!338470 () Bool)

(assert (=> b!543990 (= res!338470 (= (select (arr!16514 a!3154) (index!22114 lt!248316)) (select (arr!16514 a!3154) j!147)))))

(assert (=> b!543990 (=> res!338470 e!314513)))

(assert (=> b!543990 (= e!314515 e!314513)))

(declare-fun b!543991 () Bool)

(assert (=> b!543991 (= e!314514 (Intermediate!4972 true (toIndex!0 (select (arr!16514 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!543992 () Bool)

(assert (=> b!543992 (= e!314517 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16514 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (select (arr!16514 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and d!81943 c!63075) b!543991))

(assert (= (and d!81943 (not c!63075)) b!543984))

(assert (= (and b!543984 c!63076) b!543986))

(assert (= (and b!543984 (not c!63076)) b!543992))

(assert (= (and d!81943 c!63077) b!543985))

(assert (= (and d!81943 (not c!63077)) b!543988))

(assert (= (and b!543988 res!338469) b!543990))

(assert (= (and b!543990 (not res!338470)) b!543989))

(assert (= (and b!543989 (not res!338471)) b!543987))

(declare-fun m!521975 () Bool)

(assert (=> b!543989 m!521975))

(assert (=> b!543990 m!521975))

(assert (=> d!81943 m!521915))

(declare-fun m!521977 () Bool)

(assert (=> d!81943 m!521977))

(assert (=> d!81943 m!521889))

(assert (=> b!543992 m!521915))

(declare-fun m!521979 () Bool)

(assert (=> b!543992 m!521979))

(assert (=> b!543992 m!521979))

(assert (=> b!543992 m!521901))

(declare-fun m!521981 () Bool)

(assert (=> b!543992 m!521981))

(assert (=> b!543987 m!521975))

(assert (=> b!543872 d!81943))

(declare-fun d!81953 () Bool)

(declare-fun lt!248323 () (_ BitVec 32))

(declare-fun lt!248322 () (_ BitVec 32))

(assert (=> d!81953 (= lt!248323 (bvmul (bvxor lt!248322 (bvlshr lt!248322 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!81953 (= lt!248322 ((_ extract 31 0) (bvand (bvxor (select (arr!16514 a!3154) j!147) (bvlshr (select (arr!16514 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!81953 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!338472 (let ((h!11585 ((_ extract 31 0) (bvand (bvxor (select (arr!16514 a!3154) j!147) (bvlshr (select (arr!16514 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51014 (bvmul (bvxor h!11585 (bvlshr h!11585 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51014 (bvlshr x!51014 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!338472 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!338472 #b00000000000000000000000000000000))))))

(assert (=> d!81953 (= (toIndex!0 (select (arr!16514 a!3154) j!147) mask!3216) (bvand (bvxor lt!248323 (bvlshr lt!248323 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> b!543872 d!81953))

(declare-fun d!81955 () Bool)

(assert (=> d!81955 (= (validKeyInArray!0 (select (arr!16514 a!3154) j!147)) (and (not (= (select (arr!16514 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16514 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!543878 d!81955))

(declare-fun d!81957 () Bool)

(declare-fun res!338483 () Bool)

(declare-fun e!314532 () Bool)

(assert (=> d!81957 (=> res!338483 e!314532)))

(assert (=> d!81957 (= res!338483 (= (select (arr!16514 a!3154) #b00000000000000000000000000000000) k!1998))))

(assert (=> d!81957 (= (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000) e!314532)))

(declare-fun b!544015 () Bool)

(declare-fun e!314533 () Bool)

(assert (=> b!544015 (= e!314532 e!314533)))

(declare-fun res!338484 () Bool)

(assert (=> b!544015 (=> (not res!338484) (not e!314533))))

(assert (=> b!544015 (= res!338484 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16878 a!3154)))))

(declare-fun b!544016 () Bool)

(assert (=> b!544016 (= e!314533 (arrayContainsKey!0 a!3154 k!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81957 (not res!338483)) b!544015))

(assert (= (and b!544015 res!338484) b!544016))

(declare-fun m!521983 () Bool)

(assert (=> d!81957 m!521983))

(declare-fun m!521985 () Bool)

(assert (=> b!544016 m!521985))

(assert (=> b!543873 d!81957))

(declare-fun d!81959 () Bool)

(assert (=> d!81959 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!49354 d!81959))

(declare-fun d!81967 () Bool)

(assert (=> d!81967 (= (array_inv!12310 a!3154) (bvsge (size!16878 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!49354 d!81967))

(declare-fun bm!32081 () Bool)

(declare-fun call!32084 () Bool)

(declare-fun c!63099 () Bool)

(assert (=> bm!32081 (= call!32084 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63099 (Cons!10629 (select (arr!16514 a!3154) #b00000000000000000000000000000000) Nil!10630) Nil!10630)))))

(declare-fun b!544065 () Bool)

(declare-fun e!314566 () Bool)

(assert (=> b!544065 (= e!314566 call!32084)))

(declare-fun d!81969 () Bool)

(declare-fun res!338503 () Bool)

(declare-fun e!314565 () Bool)

(assert (=> d!81969 (=> res!338503 e!314565)))

(assert (=> d!81969 (= res!338503 (bvsge #b00000000000000000000000000000000 (size!16878 a!3154)))))

(assert (=> d!81969 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10630) e!314565)))

(declare-fun b!544066 () Bool)

(assert (=> b!544066 (= e!314566 call!32084)))

(declare-fun b!544067 () Bool)

(declare-fun e!314568 () Bool)

(declare-fun contains!2807 (List!10633 (_ BitVec 64)) Bool)

(assert (=> b!544067 (= e!314568 (contains!2807 Nil!10630 (select (arr!16514 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!544068 () Bool)

(declare-fun e!314567 () Bool)

(assert (=> b!544068 (= e!314567 e!314566)))

(assert (=> b!544068 (= c!63099 (validKeyInArray!0 (select (arr!16514 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!544069 () Bool)

(assert (=> b!544069 (= e!314565 e!314567)))

(declare-fun res!338505 () Bool)

(assert (=> b!544069 (=> (not res!338505) (not e!314567))))

(assert (=> b!544069 (= res!338505 (not e!314568))))

(declare-fun res!338504 () Bool)

(assert (=> b!544069 (=> (not res!338504) (not e!314568))))

(assert (=> b!544069 (= res!338504 (validKeyInArray!0 (select (arr!16514 a!3154) #b00000000000000000000000000000000)))))

(assert (= (and d!81969 (not res!338503)) b!544069))

(assert (= (and b!544069 res!338504) b!544067))

(assert (= (and b!544069 res!338505) b!544068))

(assert (= (and b!544068 c!63099) b!544065))

(assert (= (and b!544068 (not c!63099)) b!544066))

(assert (= (or b!544065 b!544066) bm!32081))

(assert (=> bm!32081 m!521983))

(declare-fun m!522003 () Bool)

(assert (=> bm!32081 m!522003))

(assert (=> b!544067 m!521983))

(assert (=> b!544067 m!521983))

(declare-fun m!522007 () Bool)

(assert (=> b!544067 m!522007))

(assert (=> b!544068 m!521983))

(assert (=> b!544068 m!521983))

(declare-fun m!522011 () Bool)

(assert (=> b!544068 m!522011))

(assert (=> b!544069 m!521983))

(assert (=> b!544069 m!521983))

(assert (=> b!544069 m!522011))

(assert (=> b!543879 d!81969))

(declare-fun b!544112 () Bool)

(declare-fun e!314597 () Bool)

(declare-fun e!314598 () Bool)

(assert (=> b!544112 (= e!314597 e!314598)))

(declare-fun c!63110 () Bool)

(assert (=> b!544112 (= c!63110 (validKeyInArray!0 (select (arr!16514 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!544113 () Bool)

(declare-fun e!314599 () Bool)

(declare-fun call!32087 () Bool)

(assert (=> b!544113 (= e!314599 call!32087)))

(declare-fun bm!32084 () Bool)

(assert (=> bm!32084 (= call!32087 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!544115 () Bool)

(assert (=> b!544115 (= e!314598 e!314599)))

(declare-fun lt!248364 () (_ BitVec 64))

(assert (=> b!544115 (= lt!248364 (select (arr!16514 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16908 0))(
  ( (Unit!16909) )
))
(declare-fun lt!248365 () Unit!16908)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34362 (_ BitVec 64) (_ BitVec 32)) Unit!16908)

(assert (=> b!544115 (= lt!248365 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!248364 #b00000000000000000000000000000000))))

(assert (=> b!544115 (arrayContainsKey!0 a!3154 lt!248364 #b00000000000000000000000000000000)))

(declare-fun lt!248366 () Unit!16908)

(assert (=> b!544115 (= lt!248366 lt!248365)))

(declare-fun res!338529 () Bool)

(assert (=> b!544115 (= res!338529 (= (seekEntryOrOpen!0 (select (arr!16514 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4972 #b00000000000000000000000000000000)))))

(assert (=> b!544115 (=> (not res!338529) (not e!314599))))

(declare-fun d!81977 () Bool)

(declare-fun res!338530 () Bool)

(assert (=> d!81977 (=> res!338530 e!314597)))

(assert (=> d!81977 (= res!338530 (bvsge #b00000000000000000000000000000000 (size!16878 a!3154)))))

(assert (=> d!81977 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!314597)))

(declare-fun b!544114 () Bool)

(assert (=> b!544114 (= e!314598 call!32087)))

(assert (= (and d!81977 (not res!338530)) b!544112))

(assert (= (and b!544112 c!63110) b!544115))

(assert (= (and b!544112 (not c!63110)) b!544114))

(assert (= (and b!544115 res!338529) b!544113))

(assert (= (or b!544113 b!544114) bm!32084))

(assert (=> b!544112 m!521983))

(assert (=> b!544112 m!521983))

(assert (=> b!544112 m!522011))

(declare-fun m!522029 () Bool)

(assert (=> bm!32084 m!522029))

(assert (=> b!544115 m!521983))

(declare-fun m!522031 () Bool)

(assert (=> b!544115 m!522031))

(declare-fun m!522033 () Bool)

(assert (=> b!544115 m!522033))

(assert (=> b!544115 m!521983))

(declare-fun m!522035 () Bool)

(assert (=> b!544115 m!522035))

(assert (=> b!543874 d!81977))

(declare-fun lt!248383 () SeekEntryResult!4972)

(declare-fun b!544128 () Bool)

(declare-fun e!314607 () SeekEntryResult!4972)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34362 (_ BitVec 32)) SeekEntryResult!4972)

(assert (=> b!544128 (= e!314607 (seekKeyOrZeroReturnVacant!0 (x!51011 lt!248383) (index!22114 lt!248383) (index!22114 lt!248383) k!1998 a!3154 mask!3216))))

(declare-fun b!544129 () Bool)

(declare-fun e!314606 () SeekEntryResult!4972)

(assert (=> b!544129 (= e!314606 Undefined!4972)))

(declare-fun b!544130 () Bool)

(assert (=> b!544130 (= e!314607 (MissingZero!4972 (index!22114 lt!248383)))))

(declare-fun d!81989 () Bool)

(declare-fun lt!248382 () SeekEntryResult!4972)

(assert (=> d!81989 (and (or (is-Undefined!4972 lt!248382) (not (is-Found!4972 lt!248382)) (and (bvsge (index!22113 lt!248382) #b00000000000000000000000000000000) (bvslt (index!22113 lt!248382) (size!16878 a!3154)))) (or (is-Undefined!4972 lt!248382) (is-Found!4972 lt!248382) (not (is-MissingZero!4972 lt!248382)) (and (bvsge (index!22112 lt!248382) #b00000000000000000000000000000000) (bvslt (index!22112 lt!248382) (size!16878 a!3154)))) (or (is-Undefined!4972 lt!248382) (is-Found!4972 lt!248382) (is-MissingZero!4972 lt!248382) (not (is-MissingVacant!4972 lt!248382)) (and (bvsge (index!22115 lt!248382) #b00000000000000000000000000000000) (bvslt (index!22115 lt!248382) (size!16878 a!3154)))) (or (is-Undefined!4972 lt!248382) (ite (is-Found!4972 lt!248382) (= (select (arr!16514 a!3154) (index!22113 lt!248382)) k!1998) (ite (is-MissingZero!4972 lt!248382) (= (select (arr!16514 a!3154) (index!22112 lt!248382)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4972 lt!248382) (= (select (arr!16514 a!3154) (index!22115 lt!248382)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!81989 (= lt!248382 e!314606)))

(declare-fun c!63119 () Bool)

(assert (=> d!81989 (= c!63119 (and (is-Intermediate!4972 lt!248383) (undefined!5784 lt!248383)))))

(assert (=> d!81989 (= lt!248383 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1998 mask!3216) k!1998 a!3154 mask!3216))))

(assert (=> d!81989 (validMask!0 mask!3216)))

(assert (=> d!81989 (= (seekEntryOrOpen!0 k!1998 a!3154 mask!3216) lt!248382)))

(declare-fun b!544131 () Bool)

(declare-fun c!63117 () Bool)

(declare-fun lt!248384 () (_ BitVec 64))

(assert (=> b!544131 (= c!63117 (= lt!248384 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!314608 () SeekEntryResult!4972)

(assert (=> b!544131 (= e!314608 e!314607)))

(declare-fun b!544132 () Bool)

(assert (=> b!544132 (= e!314606 e!314608)))

(assert (=> b!544132 (= lt!248384 (select (arr!16514 a!3154) (index!22114 lt!248383)))))

(declare-fun c!63118 () Bool)

(assert (=> b!544132 (= c!63118 (= lt!248384 k!1998))))

(declare-fun b!544133 () Bool)

(assert (=> b!544133 (= e!314608 (Found!4972 (index!22114 lt!248383)))))

(assert (= (and d!81989 c!63119) b!544129))

(assert (= (and d!81989 (not c!63119)) b!544132))

(assert (= (and b!544132 c!63118) b!544133))

(assert (= (and b!544132 (not c!63118)) b!544131))

(assert (= (and b!544131 c!63117) b!544130))

(assert (= (and b!544131 (not c!63117)) b!544128))

(declare-fun m!522039 () Bool)

(assert (=> b!544128 m!522039))

(declare-fun m!522041 () Bool)

(assert (=> d!81989 m!522041))

(assert (=> d!81989 m!521889))

(declare-fun m!522043 () Bool)

(assert (=> d!81989 m!522043))

(declare-fun m!522045 () Bool)

(assert (=> d!81989 m!522045))

(assert (=> d!81989 m!522043))

(declare-fun m!522047 () Bool)

(assert (=> d!81989 m!522047))

(declare-fun m!522049 () Bool)

(assert (=> d!81989 m!522049))

(declare-fun m!522051 () Bool)

(assert (=> b!544132 m!522051))

(assert (=> b!543880 d!81989))

(declare-fun b!544134 () Bool)

(declare-fun e!314610 () SeekEntryResult!4972)

(declare-fun e!314613 () SeekEntryResult!4972)

(assert (=> b!544134 (= e!314610 e!314613)))

(declare-fun c!63121 () Bool)

(declare-fun lt!248386 () (_ BitVec 64))

(assert (=> b!544134 (= c!63121 (or (= lt!248386 (select (arr!16514 a!3154) j!147)) (= (bvadd lt!248386 lt!248386) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!544135 () Bool)

(declare-fun e!314612 () Bool)

(declare-fun lt!248385 () SeekEntryResult!4972)

(assert (=> b!544135 (= e!314612 (bvsge (x!51011 lt!248385) #b01111111111111111111111111111110))))

(declare-fun b!544136 () Bool)

(assert (=> b!544136 (= e!314613 (Intermediate!4972 false index!1177 x!1030))))

(declare-fun b!544137 () Bool)

(assert (=> b!544137 (and (bvsge (index!22114 lt!248385) #b00000000000000000000000000000000) (bvslt (index!22114 lt!248385) (size!16878 a!3154)))))

(declare-fun e!314609 () Bool)

(assert (=> b!544137 (= e!314609 (= (select (arr!16514 a!3154) (index!22114 lt!248385)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!544138 () Bool)

(declare-fun e!314611 () Bool)

(assert (=> b!544138 (= e!314612 e!314611)))

(declare-fun res!338532 () Bool)

(assert (=> b!544138 (= res!338532 (and (is-Intermediate!4972 lt!248385) (not (undefined!5784 lt!248385)) (bvslt (x!51011 lt!248385) #b01111111111111111111111111111110) (bvsge (x!51011 lt!248385) #b00000000000000000000000000000000) (bvsge (x!51011 lt!248385) x!1030)))))

(assert (=> b!544138 (=> (not res!338532) (not e!314611))))

(declare-fun d!81993 () Bool)

(assert (=> d!81993 e!314612))

(declare-fun c!63122 () Bool)

(assert (=> d!81993 (= c!63122 (and (is-Intermediate!4972 lt!248385) (undefined!5784 lt!248385)))))

(assert (=> d!81993 (= lt!248385 e!314610)))

(declare-fun c!63120 () Bool)

(assert (=> d!81993 (= c!63120 (bvsge x!1030 #b01111111111111111111111111111110))))

(assert (=> d!81993 (= lt!248386 (select (arr!16514 a!3154) index!1177))))

(assert (=> d!81993 (validMask!0 mask!3216)))

(assert (=> d!81993 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16514 a!3154) j!147) a!3154 mask!3216) lt!248385)))

(declare-fun b!544139 () Bool)

(assert (=> b!544139 (and (bvsge (index!22114 lt!248385) #b00000000000000000000000000000000) (bvslt (index!22114 lt!248385) (size!16878 a!3154)))))

(declare-fun res!338534 () Bool)

(assert (=> b!544139 (= res!338534 (= (select (arr!16514 a!3154) (index!22114 lt!248385)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!544139 (=> res!338534 e!314609)))

(declare-fun b!544140 () Bool)

(assert (=> b!544140 (and (bvsge (index!22114 lt!248385) #b00000000000000000000000000000000) (bvslt (index!22114 lt!248385) (size!16878 a!3154)))))

(declare-fun res!338533 () Bool)

(assert (=> b!544140 (= res!338533 (= (select (arr!16514 a!3154) (index!22114 lt!248385)) (select (arr!16514 a!3154) j!147)))))

(assert (=> b!544140 (=> res!338533 e!314609)))

(assert (=> b!544140 (= e!314611 e!314609)))

(declare-fun b!544141 () Bool)

(assert (=> b!544141 (= e!314610 (Intermediate!4972 true index!1177 x!1030))))

(declare-fun b!544142 () Bool)

(assert (=> b!544142 (= e!314613 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (arr!16514 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and d!81993 c!63120) b!544141))

(assert (= (and d!81993 (not c!63120)) b!544134))

(assert (= (and b!544134 c!63121) b!544136))

(assert (= (and b!544134 (not c!63121)) b!544142))

(assert (= (and d!81993 c!63122) b!544135))

(assert (= (and d!81993 (not c!63122)) b!544138))

(assert (= (and b!544138 res!338532) b!544140))

(assert (= (and b!544140 (not res!338533)) b!544139))

(assert (= (and b!544139 (not res!338534)) b!544137))

(declare-fun m!522053 () Bool)

(assert (=> b!544139 m!522053))

(assert (=> b!544140 m!522053))

(assert (=> d!81993 m!521911))

(assert (=> d!81993 m!521889))

(assert (=> b!544142 m!521897))

(assert (=> b!544142 m!521897))

(assert (=> b!544142 m!521901))

(declare-fun m!522055 () Bool)

(assert (=> b!544142 m!522055))

(assert (=> b!544137 m!522053))

(assert (=> b!543875 d!81993))

(push 1)

(assert (not b!543992))

(assert (not d!81939))

(assert (not b!544069))

(assert (not b!544128))

(assert (not b!544068))

(assert (not bm!32081))

(assert (not d!81989))

(assert (not d!81993))

(assert (not b!544142))

(assert (not d!81943))

(assert (not bm!32084))

(assert (not b!544112))

(assert (not b!544016))

(assert (not b!544115))

(assert (not b!544067))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(assert (=> d!81993 d!81959))

(declare-fun b!544295 () Bool)

(declare-fun c!63176 () Bool)

(declare-fun lt!248445 () (_ BitVec 64))

(assert (=> b!544295 (= c!63176 (= lt!248445 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!314709 () SeekEntryResult!4972)

(declare-fun e!314708 () SeekEntryResult!4972)

(assert (=> b!544295 (= e!314709 e!314708)))

(declare-fun b!544296 () Bool)

(declare-fun e!314710 () SeekEntryResult!4972)

(assert (=> b!544296 (= e!314710 e!314709)))

(declare-fun c!63177 () Bool)

(assert (=> b!544296 (= c!63177 (= lt!248445 k!1998))))

(declare-fun b!544297 () Bool)

(assert (=> b!544297 (= e!314708 (MissingVacant!4972 (index!22114 lt!248383)))))

(declare-fun d!82055 () Bool)

(declare-fun lt!248446 () SeekEntryResult!4972)

(assert (=> d!82055 (and (or (is-Undefined!4972 lt!248446) (not (is-Found!4972 lt!248446)) (and (bvsge (index!22113 lt!248446) #b00000000000000000000000000000000) (bvslt (index!22113 lt!248446) (size!16878 a!3154)))) (or (is-Undefined!4972 lt!248446) (is-Found!4972 lt!248446) (not (is-MissingVacant!4972 lt!248446)) (not (= (index!22115 lt!248446) (index!22114 lt!248383))) (and (bvsge (index!22115 lt!248446) #b00000000000000000000000000000000) (bvslt (index!22115 lt!248446) (size!16878 a!3154)))) (or (is-Undefined!4972 lt!248446) (ite (is-Found!4972 lt!248446) (= (select (arr!16514 a!3154) (index!22113 lt!248446)) k!1998) (and (is-MissingVacant!4972 lt!248446) (= (index!22115 lt!248446) (index!22114 lt!248383)) (= (select (arr!16514 a!3154) (index!22115 lt!248446)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!82055 (= lt!248446 e!314710)))

(declare-fun c!63175 () Bool)

(assert (=> d!82055 (= c!63175 (bvsge (x!51011 lt!248383) #b01111111111111111111111111111110))))

(assert (=> d!82055 (= lt!248445 (select (arr!16514 a!3154) (index!22114 lt!248383)))))

(assert (=> d!82055 (validMask!0 mask!3216)))

(assert (=> d!82055 (= (seekKeyOrZeroReturnVacant!0 (x!51011 lt!248383) (index!22114 lt!248383) (index!22114 lt!248383) k!1998 a!3154 mask!3216) lt!248446)))

(declare-fun b!544298 () Bool)

(assert (=> b!544298 (= e!314708 (seekKeyOrZeroReturnVacant!0 (bvadd (x!51011 lt!248383) #b00000000000000000000000000000001) (nextIndex!0 (index!22114 lt!248383) (x!51011 lt!248383) mask!3216) (index!22114 lt!248383) k!1998 a!3154 mask!3216))))

(declare-fun b!544299 () Bool)

(assert (=> b!544299 (= e!314709 (Found!4972 (index!22114 lt!248383)))))

(declare-fun b!544300 () Bool)

(assert (=> b!544300 (= e!314710 Undefined!4972)))

(assert (= (and d!82055 c!63175) b!544300))

(assert (= (and d!82055 (not c!63175)) b!544296))

(assert (= (and b!544296 c!63177) b!544299))

(assert (= (and b!544296 (not c!63177)) b!544295))

(assert (= (and b!544295 c!63176) b!544297))

(assert (= (and b!544295 (not c!63176)) b!544298))

(declare-fun m!522209 () Bool)

(assert (=> d!82055 m!522209))

(declare-fun m!522211 () Bool)

(assert (=> d!82055 m!522211))

(assert (=> d!82055 m!522051))

(assert (=> d!82055 m!521889))

(declare-fun m!522213 () Bool)

(assert (=> b!544298 m!522213))

(assert (=> b!544298 m!522213))

(declare-fun m!522215 () Bool)

(assert (=> b!544298 m!522215))

(assert (=> b!544128 d!82055))

(declare-fun b!544301 () Bool)

(declare-fun e!314711 () Bool)

(declare-fun e!314712 () Bool)

(assert (=> b!544301 (= e!314711 e!314712)))

(declare-fun c!63178 () Bool)

(assert (=> b!544301 (= c!63178 (validKeyInArray!0 (select (arr!16514 a!3154) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!544302 () Bool)

(declare-fun e!314713 () Bool)

(declare-fun call!32092 () Bool)

(assert (=> b!544302 (= e!314713 call!32092)))

(declare-fun bm!32089 () Bool)

(assert (=> bm!32089 (= call!32092 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!544304 () Bool)

(assert (=> b!544304 (= e!314712 e!314713)))

(declare-fun lt!248447 () (_ BitVec 64))

(assert (=> b!544304 (= lt!248447 (select (arr!16514 a!3154) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!248448 () Unit!16908)

(assert (=> b!544304 (= lt!248448 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!248447 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!544304 (arrayContainsKey!0 a!3154 lt!248447 #b00000000000000000000000000000000)))

(declare-fun lt!248449 () Unit!16908)

(assert (=> b!544304 (= lt!248449 lt!248448)))

(declare-fun res!338589 () Bool)

(assert (=> b!544304 (= res!338589 (= (seekEntryOrOpen!0 (select (arr!16514 a!3154) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!3154 mask!3216) (Found!4972 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!544304 (=> (not res!338589) (not e!314713))))

(declare-fun d!82057 () Bool)

(declare-fun res!338590 () Bool)

(assert (=> d!82057 (=> res!338590 e!314711)))

(assert (=> d!82057 (= res!338590 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16878 a!3154)))))

(assert (=> d!82057 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216) e!314711)))

(declare-fun b!544303 () Bool)

(assert (=> b!544303 (= e!314712 call!32092)))

(assert (= (and d!82057 (not res!338590)) b!544301))

(assert (= (and b!544301 c!63178) b!544304))

(assert (= (and b!544301 (not c!63178)) b!544303))

(assert (= (and b!544304 res!338589) b!544302))

(assert (= (or b!544302 b!544303) bm!32089))

(declare-fun m!522217 () Bool)

(assert (=> b!544301 m!522217))

(assert (=> b!544301 m!522217))

(declare-fun m!522219 () Bool)

(assert (=> b!544301 m!522219))

(declare-fun m!522221 () Bool)

(assert (=> bm!32089 m!522221))

(assert (=> b!544304 m!522217))

(declare-fun m!522223 () Bool)

(assert (=> b!544304 m!522223))

(declare-fun m!522225 () Bool)

(assert (=> b!544304 m!522225))

(assert (=> b!544304 m!522217))

(declare-fun m!522227 () Bool)

(assert (=> b!544304 m!522227))

(assert (=> bm!32084 d!82057))

(declare-fun b!544305 () Bool)

(declare-fun e!314715 () SeekEntryResult!4972)

(declare-fun e!314718 () SeekEntryResult!4972)

(assert (=> b!544305 (= e!314715 e!314718)))

(declare-fun c!63180 () Bool)

(declare-fun lt!248451 () (_ BitVec 64))

(assert (=> b!544305 (= c!63180 (or (= lt!248451 k!1998) (= (bvadd lt!248451 lt!248451) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!544306 () Bool)

(declare-fun e!314717 () Bool)

(declare-fun lt!248450 () SeekEntryResult!4972)

(assert (=> b!544306 (= e!314717 (bvsge (x!51011 lt!248450) #b01111111111111111111111111111110))))

(declare-fun b!544307 () Bool)

(assert (=> b!544307 (= e!314718 (Intermediate!4972 false (toIndex!0 k!1998 mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!544308 () Bool)

(assert (=> b!544308 (and (bvsge (index!22114 lt!248450) #b00000000000000000000000000000000) (bvslt (index!22114 lt!248450) (size!16878 a!3154)))))

(declare-fun e!314714 () Bool)

(assert (=> b!544308 (= e!314714 (= (select (arr!16514 a!3154) (index!22114 lt!248450)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!544309 () Bool)

(declare-fun e!314716 () Bool)

(assert (=> b!544309 (= e!314717 e!314716)))

(declare-fun res!338591 () Bool)

(assert (=> b!544309 (= res!338591 (and (is-Intermediate!4972 lt!248450) (not (undefined!5784 lt!248450)) (bvslt (x!51011 lt!248450) #b01111111111111111111111111111110) (bvsge (x!51011 lt!248450) #b00000000000000000000000000000000) (bvsge (x!51011 lt!248450) #b00000000000000000000000000000000)))))

(assert (=> b!544309 (=> (not res!338591) (not e!314716))))

(declare-fun d!82059 () Bool)

(assert (=> d!82059 e!314717))

(declare-fun c!63181 () Bool)

(assert (=> d!82059 (= c!63181 (and (is-Intermediate!4972 lt!248450) (undefined!5784 lt!248450)))))

(assert (=> d!82059 (= lt!248450 e!314715)))

(declare-fun c!63179 () Bool)

(assert (=> d!82059 (= c!63179 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!82059 (= lt!248451 (select (arr!16514 a!3154) (toIndex!0 k!1998 mask!3216)))))

(assert (=> d!82059 (validMask!0 mask!3216)))

(assert (=> d!82059 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1998 mask!3216) k!1998 a!3154 mask!3216) lt!248450)))

(declare-fun b!544310 () Bool)

(assert (=> b!544310 (and (bvsge (index!22114 lt!248450) #b00000000000000000000000000000000) (bvslt (index!22114 lt!248450) (size!16878 a!3154)))))

(declare-fun res!338593 () Bool)

(assert (=> b!544310 (= res!338593 (= (select (arr!16514 a!3154) (index!22114 lt!248450)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!544310 (=> res!338593 e!314714)))

(declare-fun b!544311 () Bool)

(assert (=> b!544311 (and (bvsge (index!22114 lt!248450) #b00000000000000000000000000000000) (bvslt (index!22114 lt!248450) (size!16878 a!3154)))))

(declare-fun res!338592 () Bool)

(assert (=> b!544311 (= res!338592 (= (select (arr!16514 a!3154) (index!22114 lt!248450)) k!1998))))

(assert (=> b!544311 (=> res!338592 e!314714)))

(assert (=> b!544311 (= e!314716 e!314714)))

(declare-fun b!544312 () Bool)

(assert (=> b!544312 (= e!314715 (Intermediate!4972 true (toIndex!0 k!1998 mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!544313 () Bool)

(assert (=> b!544313 (= e!314718 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!1998 mask!3216) #b00000000000000000000000000000000 mask!3216) k!1998 a!3154 mask!3216))))

(assert (= (and d!82059 c!63179) b!544312))

(assert (= (and d!82059 (not c!63179)) b!544305))

(assert (= (and b!544305 c!63180) b!544307))

(assert (= (and b!544305 (not c!63180)) b!544313))

(assert (= (and d!82059 c!63181) b!544306))

(assert (= (and d!82059 (not c!63181)) b!544309))

(assert (= (and b!544309 res!338591) b!544311))

(assert (= (and b!544311 (not res!338592)) b!544310))

(assert (= (and b!544310 (not res!338593)) b!544308))

(declare-fun m!522229 () Bool)

(assert (=> b!544310 m!522229))

(assert (=> b!544311 m!522229))

(assert (=> d!82059 m!522043))

(declare-fun m!522231 () Bool)

(assert (=> d!82059 m!522231))

(assert (=> d!82059 m!521889))

(assert (=> b!544313 m!522043))

(declare-fun m!522233 () Bool)

(assert (=> b!544313 m!522233))

(assert (=> b!544313 m!522233))

(declare-fun m!522235 () Bool)

(assert (=> b!544313 m!522235))

(assert (=> b!544308 m!522229))

(assert (=> d!81989 d!82059))

(declare-fun d!82061 () Bool)

(declare-fun lt!248453 () (_ BitVec 32))

(declare-fun lt!248452 () (_ BitVec 32))

(assert (=> d!82061 (= lt!248453 (bvmul (bvxor lt!248452 (bvlshr lt!248452 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!82061 (= lt!248452 ((_ extract 31 0) (bvand (bvxor k!1998 (bvlshr k!1998 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!82061 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!338472 (let ((h!11585 ((_ extract 31 0) (bvand (bvxor k!1998 (bvlshr k!1998 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51014 (bvmul (bvxor h!11585 (bvlshr h!11585 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51014 (bvlshr x!51014 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!338472 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!338472 #b00000000000000000000000000000000))))))

(assert (=> d!82061 (= (toIndex!0 k!1998 mask!3216) (bvand (bvxor lt!248453 (bvlshr lt!248453 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> d!81989 d!82061))

(assert (=> d!81989 d!81959))

(declare-fun d!82063 () Bool)

(assert (=> d!82063 (= (validKeyInArray!0 (select (arr!16514 a!3154) #b00000000000000000000000000000000)) (and (not (= (select (arr!16514 a!3154) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16514 a!3154) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!544112 d!82063))

(assert (=> b!544069 d!82063))

(declare-fun b!544314 () Bool)

(declare-fun e!314720 () SeekEntryResult!4972)

(declare-fun e!314723 () SeekEntryResult!4972)

(assert (=> b!544314 (= e!314720 e!314723)))

(declare-fun c!63183 () Bool)

(declare-fun lt!248455 () (_ BitVec 64))

(assert (=> b!544314 (= c!63183 (or (= lt!248455 (select (arr!16514 a!3154) j!147)) (= (bvadd lt!248455 lt!248455) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!544315 () Bool)

(declare-fun e!314722 () Bool)

(declare-fun lt!248454 () SeekEntryResult!4972)

(assert (=> b!544315 (= e!314722 (bvsge (x!51011 lt!248454) #b01111111111111111111111111111110))))

(declare-fun b!544316 () Bool)

(assert (=> b!544316 (= e!314723 (Intermediate!4972 false (nextIndex!0 (toIndex!0 (select (arr!16514 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!544317 () Bool)

(assert (=> b!544317 (and (bvsge (index!22114 lt!248454) #b00000000000000000000000000000000) (bvslt (index!22114 lt!248454) (size!16878 a!3154)))))

(declare-fun e!314719 () Bool)

(assert (=> b!544317 (= e!314719 (= (select (arr!16514 a!3154) (index!22114 lt!248454)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!544318 () Bool)

(declare-fun e!314721 () Bool)

(assert (=> b!544318 (= e!314722 e!314721)))

(declare-fun res!338594 () Bool)

(assert (=> b!544318 (= res!338594 (and (is-Intermediate!4972 lt!248454) (not (undefined!5784 lt!248454)) (bvslt (x!51011 lt!248454) #b01111111111111111111111111111110) (bvsge (x!51011 lt!248454) #b00000000000000000000000000000000) (bvsge (x!51011 lt!248454) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!544318 (=> (not res!338594) (not e!314721))))

(declare-fun d!82065 () Bool)

(assert (=> d!82065 e!314722))

(declare-fun c!63184 () Bool)

(assert (=> d!82065 (= c!63184 (and (is-Intermediate!4972 lt!248454) (undefined!5784 lt!248454)))))

(assert (=> d!82065 (= lt!248454 e!314720)))

(declare-fun c!63182 () Bool)

(assert (=> d!82065 (= c!63182 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!82065 (= lt!248455 (select (arr!16514 a!3154) (nextIndex!0 (toIndex!0 (select (arr!16514 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216)))))

(assert (=> d!82065 (validMask!0 mask!3216)))

(assert (=> d!82065 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16514 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (select (arr!16514 a!3154) j!147) a!3154 mask!3216) lt!248454)))

(declare-fun b!544319 () Bool)

(assert (=> b!544319 (and (bvsge (index!22114 lt!248454) #b00000000000000000000000000000000) (bvslt (index!22114 lt!248454) (size!16878 a!3154)))))

(declare-fun res!338596 () Bool)

(assert (=> b!544319 (= res!338596 (= (select (arr!16514 a!3154) (index!22114 lt!248454)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!544319 (=> res!338596 e!314719)))

(declare-fun b!544320 () Bool)

(assert (=> b!544320 (and (bvsge (index!22114 lt!248454) #b00000000000000000000000000000000) (bvslt (index!22114 lt!248454) (size!16878 a!3154)))))

(declare-fun res!338595 () Bool)

(assert (=> b!544320 (= res!338595 (= (select (arr!16514 a!3154) (index!22114 lt!248454)) (select (arr!16514 a!3154) j!147)))))

(assert (=> b!544320 (=> res!338595 e!314719)))

(assert (=> b!544320 (= e!314721 e!314719)))

(declare-fun b!544321 () Bool)

(assert (=> b!544321 (= e!314720 (Intermediate!4972 true (nextIndex!0 (toIndex!0 (select (arr!16514 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!544322 () Bool)

(assert (=> b!544322 (= e!314723 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 (select (arr!16514 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3216) (select (arr!16514 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and d!82065 c!63182) b!544321))

(assert (= (and d!82065 (not c!63182)) b!544314))

(assert (= (and b!544314 c!63183) b!544316))

(assert (= (and b!544314 (not c!63183)) b!544322))

(assert (= (and d!82065 c!63184) b!544315))

(assert (= (and d!82065 (not c!63184)) b!544318))

(assert (= (and b!544318 res!338594) b!544320))

(assert (= (and b!544320 (not res!338595)) b!544319))

(assert (= (and b!544319 (not res!338596)) b!544317))

(declare-fun m!522237 () Bool)

(assert (=> b!544319 m!522237))

(assert (=> b!544320 m!522237))

(assert (=> d!82065 m!521979))

(declare-fun m!522239 () Bool)

(assert (=> d!82065 m!522239))

(assert (=> d!82065 m!521889))

(assert (=> b!544322 m!521979))

(declare-fun m!522241 () Bool)

(assert (=> b!544322 m!522241))

(assert (=> b!544322 m!522241))

(assert (=> b!544322 m!521901))

(declare-fun m!522243 () Bool)

(assert (=> b!544322 m!522243))

(assert (=> b!544317 m!522237))

(assert (=> b!543992 d!82065))

(declare-fun d!82067 () Bool)

(declare-fun lt!248456 () (_ BitVec 32))

(assert (=> d!82067 (and (bvsge lt!248456 #b00000000000000000000000000000000) (bvslt lt!248456 (bvadd mask!3216 #b00000000000000000000000000000001)))))

(assert (=> d!82067 (= lt!248456 (choose!52 (toIndex!0 (select (arr!16514 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216))))

(assert (=> d!82067 (validMask!0 mask!3216)))

(assert (=> d!82067 (= (nextIndex!0 (toIndex!0 (select (arr!16514 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) lt!248456)))

(declare-fun bs!16982 () Bool)

(assert (= bs!16982 d!82067))

(assert (=> bs!16982 m!521915))

(declare-fun m!522245 () Bool)

(assert (=> bs!16982 m!522245))

(assert (=> bs!16982 m!521889))

(assert (=> b!543992 d!82067))

(assert (=> d!81943 d!81959))

(assert (=> b!544068 d!82063))

(declare-fun d!82069 () Bool)

(declare-fun lt!248459 () Bool)

(declare-fun content!227 (List!10633) (Set (_ BitVec 64)))

(assert (=> d!82069 (= lt!248459 (member (select (arr!16514 a!3154) #b00000000000000000000000000000000) (content!227 Nil!10630)))))

(declare-fun e!314728 () Bool)

(assert (=> d!82069 (= lt!248459 e!314728)))

(declare-fun res!338601 () Bool)

(assert (=> d!82069 (=> (not res!338601) (not e!314728))))

(assert (=> d!82069 (= res!338601 (is-Cons!10629 Nil!10630))))

(assert (=> d!82069 (= (contains!2807 Nil!10630 (select (arr!16514 a!3154) #b00000000000000000000000000000000)) lt!248459)))

(declare-fun b!544327 () Bool)

(declare-fun e!314729 () Bool)

(assert (=> b!544327 (= e!314728 e!314729)))

(declare-fun res!338602 () Bool)

(assert (=> b!544327 (=> res!338602 e!314729)))

(assert (=> b!544327 (= res!338602 (= (h!11584 Nil!10630) (select (arr!16514 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!544328 () Bool)

(assert (=> b!544328 (= e!314729 (contains!2807 (t!16861 Nil!10630) (select (arr!16514 a!3154) #b00000000000000000000000000000000)))))

(assert (= (and d!82069 res!338601) b!544327))

(assert (= (and b!544327 (not res!338602)) b!544328))

(declare-fun m!522247 () Bool)

(assert (=> d!82069 m!522247))

(assert (=> d!82069 m!521983))

(declare-fun m!522249 () Bool)

(assert (=> d!82069 m!522249))

(assert (=> b!544328 m!521983))

(declare-fun m!522251 () Bool)

(assert (=> b!544328 m!522251))

(assert (=> b!544067 d!82069))

(declare-fun d!82071 () Bool)

(declare-fun res!338603 () Bool)

(declare-fun e!314730 () Bool)

(assert (=> d!82071 (=> res!338603 e!314730)))

(assert (=> d!82071 (= res!338603 (= (select (arr!16514 a!3154) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k!1998))))

(assert (=> d!82071 (= (arrayContainsKey!0 a!3154 k!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!314730)))

(declare-fun b!544329 () Bool)

(declare-fun e!314731 () Bool)

(assert (=> b!544329 (= e!314730 e!314731)))

(declare-fun res!338604 () Bool)

(assert (=> b!544329 (=> (not res!338604) (not e!314731))))

(assert (=> b!544329 (= res!338604 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!16878 a!3154)))))

(declare-fun b!544330 () Bool)

(assert (=> b!544330 (= e!314731 (arrayContainsKey!0 a!3154 k!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!82071 (not res!338603)) b!544329))

(assert (= (and b!544329 res!338604) b!544330))

(assert (=> d!82071 m!522217))

(declare-fun m!522253 () Bool)

(assert (=> b!544330 m!522253))

(assert (=> b!544016 d!82071))

(declare-fun c!63185 () Bool)

(declare-fun bm!32090 () Bool)

(declare-fun call!32093 () Bool)

(assert (=> bm!32090 (= call!32093 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!63185 (Cons!10629 (select (arr!16514 a!3154) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!63099 (Cons!10629 (select (arr!16514 a!3154) #b00000000000000000000000000000000) Nil!10630) Nil!10630)) (ite c!63099 (Cons!10629 (select (arr!16514 a!3154) #b00000000000000000000000000000000) Nil!10630) Nil!10630))))))

(declare-fun b!544331 () Bool)

(declare-fun e!314733 () Bool)

(assert (=> b!544331 (= e!314733 call!32093)))

(declare-fun d!82073 () Bool)

(declare-fun res!338605 () Bool)

(declare-fun e!314732 () Bool)

(assert (=> d!82073 (=> res!338605 e!314732)))

(assert (=> d!82073 (= res!338605 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16878 a!3154)))))

(assert (=> d!82073 (= (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63099 (Cons!10629 (select (arr!16514 a!3154) #b00000000000000000000000000000000) Nil!10630) Nil!10630)) e!314732)))

(declare-fun b!544332 () Bool)

(assert (=> b!544332 (= e!314733 call!32093)))

(declare-fun b!544333 () Bool)

(declare-fun e!314735 () Bool)

(assert (=> b!544333 (= e!314735 (contains!2807 (ite c!63099 (Cons!10629 (select (arr!16514 a!3154) #b00000000000000000000000000000000) Nil!10630) Nil!10630) (select (arr!16514 a!3154) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!544334 () Bool)

(declare-fun e!314734 () Bool)

(assert (=> b!544334 (= e!314734 e!314733)))

(assert (=> b!544334 (= c!63185 (validKeyInArray!0 (select (arr!16514 a!3154) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!544335 () Bool)

(assert (=> b!544335 (= e!314732 e!314734)))

(declare-fun res!338607 () Bool)

(assert (=> b!544335 (=> (not res!338607) (not e!314734))))

(assert (=> b!544335 (= res!338607 (not e!314735))))

(declare-fun res!338606 () Bool)

(assert (=> b!544335 (=> (not res!338606) (not e!314735))))

(assert (=> b!544335 (= res!338606 (validKeyInArray!0 (select (arr!16514 a!3154) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!82073 (not res!338605)) b!544335))

(assert (= (and b!544335 res!338606) b!544333))

(assert (= (and b!544335 res!338607) b!544334))

(assert (= (and b!544334 c!63185) b!544331))

(assert (= (and b!544334 (not c!63185)) b!544332))

(assert (= (or b!544331 b!544332) bm!32090))

(assert (=> bm!32090 m!522217))

(declare-fun m!522255 () Bool)

(assert (=> bm!32090 m!522255))

(assert (=> b!544333 m!522217))

(assert (=> b!544333 m!522217))

(declare-fun m!522257 () Bool)

(assert (=> b!544333 m!522257))

(assert (=> b!544334 m!522217))

(assert (=> b!544334 m!522217))

(assert (=> b!544334 m!522219))

(assert (=> b!544335 m!522217))

(assert (=> b!544335 m!522217))

(assert (=> b!544335 m!522219))

(assert (=> bm!32081 d!82073))

(declare-fun d!82075 () Bool)

(declare-fun res!338610 () (_ BitVec 32))

(assert (=> d!82075 (and (bvsge res!338610 #b00000000000000000000000000000000) (bvslt res!338610 (bvadd mask!3216 #b00000000000000000000000000000001)))))

(assert (=> d!82075 true))

(assert (=> d!82075 (= (choose!52 index!1177 x!1030 mask!3216) res!338610)))

(assert (=> d!81939 d!82075))

(assert (=> d!81939 d!81959))

(declare-fun d!82077 () Bool)

(assert (=> d!82077 (arrayContainsKey!0 a!3154 lt!248364 #b00000000000000000000000000000000)))

(declare-fun lt!248462 () Unit!16908)

(declare-fun choose!13 (array!34362 (_ BitVec 64) (_ BitVec 32)) Unit!16908)

(assert (=> d!82077 (= lt!248462 (choose!13 a!3154 lt!248364 #b00000000000000000000000000000000))))

(assert (=> d!82077 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!82077 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!248364 #b00000000000000000000000000000000) lt!248462)))

(declare-fun bs!16983 () Bool)

(assert (= bs!16983 d!82077))

(assert (=> bs!16983 m!522033))

(declare-fun m!522259 () Bool)

(assert (=> bs!16983 m!522259))

(assert (=> b!544115 d!82077))

(declare-fun d!82079 () Bool)

(declare-fun res!338611 () Bool)

(declare-fun e!314736 () Bool)

(assert (=> d!82079 (=> res!338611 e!314736)))

(assert (=> d!82079 (= res!338611 (= (select (arr!16514 a!3154) #b00000000000000000000000000000000) lt!248364))))

(assert (=> d!82079 (= (arrayContainsKey!0 a!3154 lt!248364 #b00000000000000000000000000000000) e!314736)))

(declare-fun b!544336 () Bool)

(declare-fun e!314737 () Bool)

(assert (=> b!544336 (= e!314736 e!314737)))

(declare-fun res!338612 () Bool)

(assert (=> b!544336 (=> (not res!338612) (not e!314737))))

(assert (=> b!544336 (= res!338612 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16878 a!3154)))))

(declare-fun b!544337 () Bool)

(assert (=> b!544337 (= e!314737 (arrayContainsKey!0 a!3154 lt!248364 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82079 (not res!338611)) b!544336))

(assert (= (and b!544336 res!338612) b!544337))

(assert (=> d!82079 m!521983))

(declare-fun m!522261 () Bool)

(assert (=> b!544337 m!522261))

(assert (=> b!544115 d!82079))

(declare-fun e!314739 () SeekEntryResult!4972)

(declare-fun b!544338 () Bool)

(declare-fun lt!248464 () SeekEntryResult!4972)

(assert (=> b!544338 (= e!314739 (seekKeyOrZeroReturnVacant!0 (x!51011 lt!248464) (index!22114 lt!248464) (index!22114 lt!248464) (select (arr!16514 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216))))

(declare-fun b!544339 () Bool)

(declare-fun e!314738 () SeekEntryResult!4972)

(assert (=> b!544339 (= e!314738 Undefined!4972)))

(declare-fun b!544340 () Bool)

(assert (=> b!544340 (= e!314739 (MissingZero!4972 (index!22114 lt!248464)))))

(declare-fun d!82081 () Bool)

(declare-fun lt!248463 () SeekEntryResult!4972)

(assert (=> d!82081 (and (or (is-Undefined!4972 lt!248463) (not (is-Found!4972 lt!248463)) (and (bvsge (index!22113 lt!248463) #b00000000000000000000000000000000) (bvslt (index!22113 lt!248463) (size!16878 a!3154)))) (or (is-Undefined!4972 lt!248463) (is-Found!4972 lt!248463) (not (is-MissingZero!4972 lt!248463)) (and (bvsge (index!22112 lt!248463) #b00000000000000000000000000000000) (bvslt (index!22112 lt!248463) (size!16878 a!3154)))) (or (is-Undefined!4972 lt!248463) (is-Found!4972 lt!248463) (is-MissingZero!4972 lt!248463) (not (is-MissingVacant!4972 lt!248463)) (and (bvsge (index!22115 lt!248463) #b00000000000000000000000000000000) (bvslt (index!22115 lt!248463) (size!16878 a!3154)))) (or (is-Undefined!4972 lt!248463) (ite (is-Found!4972 lt!248463) (= (select (arr!16514 a!3154) (index!22113 lt!248463)) (select (arr!16514 a!3154) #b00000000000000000000000000000000)) (ite (is-MissingZero!4972 lt!248463) (= (select (arr!16514 a!3154) (index!22112 lt!248463)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4972 lt!248463) (= (select (arr!16514 a!3154) (index!22115 lt!248463)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!82081 (= lt!248463 e!314738)))

(declare-fun c!63188 () Bool)

(assert (=> d!82081 (= c!63188 (and (is-Intermediate!4972 lt!248464) (undefined!5784 lt!248464)))))

(assert (=> d!82081 (= lt!248464 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16514 a!3154) #b00000000000000000000000000000000) mask!3216) (select (arr!16514 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216))))

(assert (=> d!82081 (validMask!0 mask!3216)))

(assert (=> d!82081 (= (seekEntryOrOpen!0 (select (arr!16514 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) lt!248463)))

(declare-fun b!544341 () Bool)

(declare-fun c!63186 () Bool)

(declare-fun lt!248465 () (_ BitVec 64))

(assert (=> b!544341 (= c!63186 (= lt!248465 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!314740 () SeekEntryResult!4972)

(assert (=> b!544341 (= e!314740 e!314739)))

(declare-fun b!544342 () Bool)

(assert (=> b!544342 (= e!314738 e!314740)))

(assert (=> b!544342 (= lt!248465 (select (arr!16514 a!3154) (index!22114 lt!248464)))))

(declare-fun c!63187 () Bool)

(assert (=> b!544342 (= c!63187 (= lt!248465 (select (arr!16514 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!544343 () Bool)

(assert (=> b!544343 (= e!314740 (Found!4972 (index!22114 lt!248464)))))

(assert (= (and d!82081 c!63188) b!544339))

(assert (= (and d!82081 (not c!63188)) b!544342))

(assert (= (and b!544342 c!63187) b!544343))

(assert (= (and b!544342 (not c!63187)) b!544341))

(assert (= (and b!544341 c!63186) b!544340))

(assert (= (and b!544341 (not c!63186)) b!544338))

(assert (=> b!544338 m!521983))

(declare-fun m!522263 () Bool)

(assert (=> b!544338 m!522263))

(declare-fun m!522265 () Bool)

(assert (=> d!82081 m!522265))

(assert (=> d!82081 m!521889))

(declare-fun m!522267 () Bool)

(assert (=> d!82081 m!522267))

(assert (=> d!82081 m!521983))

(declare-fun m!522269 () Bool)

(assert (=> d!82081 m!522269))

(assert (=> d!82081 m!521983))

(assert (=> d!82081 m!522267))

(declare-fun m!522271 () Bool)

(assert (=> d!82081 m!522271))

(declare-fun m!522273 () Bool)

(assert (=> d!82081 m!522273))

(declare-fun m!522275 () Bool)

(assert (=> b!544342 m!522275))

(assert (=> b!544115 d!82081))

(declare-fun b!544344 () Bool)

(declare-fun e!314742 () SeekEntryResult!4972)

(declare-fun e!314745 () SeekEntryResult!4972)

(assert (=> b!544344 (= e!314742 e!314745)))

(declare-fun c!63190 () Bool)

(declare-fun lt!248467 () (_ BitVec 64))

(assert (=> b!544344 (= c!63190 (or (= lt!248467 (select (arr!16514 a!3154) j!147)) (= (bvadd lt!248467 lt!248467) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!544345 () Bool)

(declare-fun e!314744 () Bool)

(declare-fun lt!248466 () SeekEntryResult!4972)

(assert (=> b!544345 (= e!314744 (bvsge (x!51011 lt!248466) #b01111111111111111111111111111110))))

(declare-fun b!544346 () Bool)

(assert (=> b!544346 (= e!314745 (Intermediate!4972 false (nextIndex!0 index!1177 x!1030 mask!3216) (bvadd x!1030 #b00000000000000000000000000000001)))))

(declare-fun b!544347 () Bool)

(assert (=> b!544347 (and (bvsge (index!22114 lt!248466) #b00000000000000000000000000000000) (bvslt (index!22114 lt!248466) (size!16878 a!3154)))))

(declare-fun e!314741 () Bool)

(assert (=> b!544347 (= e!314741 (= (select (arr!16514 a!3154) (index!22114 lt!248466)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!544348 () Bool)

(declare-fun e!314743 () Bool)

(assert (=> b!544348 (= e!314744 e!314743)))

(declare-fun res!338613 () Bool)

(assert (=> b!544348 (= res!338613 (and (is-Intermediate!4972 lt!248466) (not (undefined!5784 lt!248466)) (bvslt (x!51011 lt!248466) #b01111111111111111111111111111110) (bvsge (x!51011 lt!248466) #b00000000000000000000000000000000) (bvsge (x!51011 lt!248466) (bvadd x!1030 #b00000000000000000000000000000001))))))

(assert (=> b!544348 (=> (not res!338613) (not e!314743))))

(declare-fun d!82083 () Bool)

(assert (=> d!82083 e!314744))

(declare-fun c!63191 () Bool)

(assert (=> d!82083 (= c!63191 (and (is-Intermediate!4972 lt!248466) (undefined!5784 lt!248466)))))

(assert (=> d!82083 (= lt!248466 e!314742)))

(declare-fun c!63189 () Bool)

(assert (=> d!82083 (= c!63189 (bvsge (bvadd x!1030 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!82083 (= lt!248467 (select (arr!16514 a!3154) (nextIndex!0 index!1177 x!1030 mask!3216)))))

(assert (=> d!82083 (validMask!0 mask!3216)))

(assert (=> d!82083 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (arr!16514 a!3154) j!147) a!3154 mask!3216) lt!248466)))

(declare-fun b!544349 () Bool)

(assert (=> b!544349 (and (bvsge (index!22114 lt!248466) #b00000000000000000000000000000000) (bvslt (index!22114 lt!248466) (size!16878 a!3154)))))

(declare-fun res!338615 () Bool)

(assert (=> b!544349 (= res!338615 (= (select (arr!16514 a!3154) (index!22114 lt!248466)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!544349 (=> res!338615 e!314741)))

(declare-fun b!544350 () Bool)

(assert (=> b!544350 (and (bvsge (index!22114 lt!248466) #b00000000000000000000000000000000) (bvslt (index!22114 lt!248466) (size!16878 a!3154)))))

(declare-fun res!338614 () Bool)

(assert (=> b!544350 (= res!338614 (= (select (arr!16514 a!3154) (index!22114 lt!248466)) (select (arr!16514 a!3154) j!147)))))

(assert (=> b!544350 (=> res!338614 e!314741)))

(assert (=> b!544350 (= e!314743 e!314741)))

(declare-fun b!544351 () Bool)

(assert (=> b!544351 (= e!314742 (Intermediate!4972 true (nextIndex!0 index!1177 x!1030 mask!3216) (bvadd x!1030 #b00000000000000000000000000000001)))))

(declare-fun b!544352 () Bool)

(assert (=> b!544352 (= e!314745 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1177 x!1030 mask!3216) (bvadd x!1030 #b00000000000000000000000000000001) mask!3216) (select (arr!16514 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and d!82083 c!63189) b!544351))

(assert (= (and d!82083 (not c!63189)) b!544344))

(assert (= (and b!544344 c!63190) b!544346))

(assert (= (and b!544344 (not c!63190)) b!544352))

(assert (= (and d!82083 c!63191) b!544345))

(assert (= (and d!82083 (not c!63191)) b!544348))

(assert (= (and b!544348 res!338613) b!544350))

(assert (= (and b!544350 (not res!338614)) b!544349))

(assert (= (and b!544349 (not res!338615)) b!544347))

(declare-fun m!522277 () Bool)

(assert (=> b!544349 m!522277))

(assert (=> b!544350 m!522277))

(assert (=> d!82083 m!521897))

(declare-fun m!522279 () Bool)

(assert (=> d!82083 m!522279))

(assert (=> d!82083 m!521889))

(assert (=> b!544352 m!521897))

(declare-fun m!522281 () Bool)

(assert (=> b!544352 m!522281))

(assert (=> b!544352 m!522281))

(assert (=> b!544352 m!521901))

(declare-fun m!522283 () Bool)

(assert (=> b!544352 m!522283))

(assert (=> b!544347 m!522277))

(assert (=> b!544142 d!82083))

(assert (=> b!544142 d!81939))

(push 1)

