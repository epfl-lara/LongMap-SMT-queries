; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48264 () Bool)

(assert start!48264)

(declare-fun b!530877 () Bool)

(declare-fun e!309202 () Bool)

(declare-datatypes ((List!10336 0))(
  ( (Nil!10333) (Cons!10332 (h!11272 (_ BitVec 64)) (t!16555 List!10336)) )
))
(declare-fun noDuplicate!218 (List!10336) Bool)

(assert (=> b!530877 (= e!309202 (not (noDuplicate!218 Nil!10333)))))

(declare-fun b!530878 () Bool)

(declare-fun res!326659 () Bool)

(assert (=> b!530878 (=> (not res!326659) (not e!309202))))

(declare-datatypes ((array!33666 0))(
  ( (array!33667 (arr!16178 (Array (_ BitVec 32) (_ BitVec 64))) (size!16543 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33666)

(assert (=> b!530878 (= res!326659 (and (bvsle #b00000000000000000000000000000000 (size!16543 a!3154)) (bvslt (size!16543 a!3154) #b01111111111111111111111111111111)))))

(declare-fun b!530879 () Bool)

(declare-fun e!309203 () Bool)

(assert (=> b!530879 (= e!309203 e!309202)))

(declare-fun res!326658 () Bool)

(assert (=> b!530879 (=> (not res!326658) (not e!309202))))

(declare-datatypes ((SeekEntryResult!4633 0))(
  ( (MissingZero!4633 (index!20756 (_ BitVec 32))) (Found!4633 (index!20757 (_ BitVec 32))) (Intermediate!4633 (undefined!5445 Bool) (index!20758 (_ BitVec 32)) (x!49746 (_ BitVec 32))) (Undefined!4633) (MissingVacant!4633 (index!20759 (_ BitVec 32))) )
))
(declare-fun lt!244660 () SeekEntryResult!4633)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530879 (= res!326658 (or (= lt!244660 (MissingZero!4633 i!1153)) (= lt!244660 (MissingVacant!4633 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33666 (_ BitVec 32)) SeekEntryResult!4633)

(assert (=> b!530879 (= lt!244660 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!530881 () Bool)

(declare-fun res!326657 () Bool)

(assert (=> b!530881 (=> (not res!326657) (not e!309203))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530881 (= res!326657 (validKeyInArray!0 k0!1998))))

(declare-fun b!530882 () Bool)

(declare-fun res!326654 () Bool)

(assert (=> b!530882 (=> (not res!326654) (not e!309202))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33666 (_ BitVec 32)) Bool)

(assert (=> b!530882 (= res!326654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!530883 () Bool)

(declare-fun res!326653 () Bool)

(assert (=> b!530883 (=> (not res!326653) (not e!309203))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!530883 (= res!326653 (validKeyInArray!0 (select (arr!16178 a!3154) j!147)))))

(declare-fun b!530884 () Bool)

(declare-fun res!326655 () Bool)

(assert (=> b!530884 (=> (not res!326655) (not e!309203))))

(assert (=> b!530884 (= res!326655 (and (= (size!16543 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16543 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16543 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!326660 () Bool)

(assert (=> start!48264 (=> (not res!326660) (not e!309203))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48264 (= res!326660 (validMask!0 mask!3216))))

(assert (=> start!48264 e!309203))

(assert (=> start!48264 true))

(declare-fun array_inv!12061 (array!33666) Bool)

(assert (=> start!48264 (array_inv!12061 a!3154)))

(declare-fun b!530880 () Bool)

(declare-fun res!326656 () Bool)

(assert (=> b!530880 (=> (not res!326656) (not e!309203))))

(declare-fun arrayContainsKey!0 (array!33666 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530880 (= res!326656 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!48264 res!326660) b!530884))

(assert (= (and b!530884 res!326655) b!530883))

(assert (= (and b!530883 res!326653) b!530881))

(assert (= (and b!530881 res!326657) b!530880))

(assert (= (and b!530880 res!326656) b!530879))

(assert (= (and b!530879 res!326658) b!530882))

(assert (= (and b!530882 res!326654) b!530878))

(assert (= (and b!530878 res!326659) b!530877))

(declare-fun m!510877 () Bool)

(assert (=> start!48264 m!510877))

(declare-fun m!510879 () Bool)

(assert (=> start!48264 m!510879))

(declare-fun m!510881 () Bool)

(assert (=> b!530877 m!510881))

(declare-fun m!510883 () Bool)

(assert (=> b!530879 m!510883))

(declare-fun m!510885 () Bool)

(assert (=> b!530880 m!510885))

(declare-fun m!510887 () Bool)

(assert (=> b!530882 m!510887))

(declare-fun m!510889 () Bool)

(assert (=> b!530883 m!510889))

(assert (=> b!530883 m!510889))

(declare-fun m!510891 () Bool)

(assert (=> b!530883 m!510891))

(declare-fun m!510893 () Bool)

(assert (=> b!530881 m!510893))

(check-sat (not b!530880) (not b!530882) (not b!530883) (not b!530881) (not start!48264) (not b!530877) (not b!530879))
(check-sat)
(get-model)

(declare-fun b!530957 () Bool)

(declare-fun e!309242 () SeekEntryResult!4633)

(assert (=> b!530957 (= e!309242 Undefined!4633)))

(declare-fun b!530958 () Bool)

(declare-fun c!62430 () Bool)

(declare-fun lt!244673 () (_ BitVec 64))

(assert (=> b!530958 (= c!62430 (= lt!244673 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!309243 () SeekEntryResult!4633)

(declare-fun e!309241 () SeekEntryResult!4633)

(assert (=> b!530958 (= e!309243 e!309241)))

(declare-fun b!530959 () Bool)

(declare-fun lt!244674 () SeekEntryResult!4633)

(assert (=> b!530959 (= e!309241 (MissingZero!4633 (index!20758 lt!244674)))))

(declare-fun d!81003 () Bool)

(declare-fun lt!244675 () SeekEntryResult!4633)

(get-info :version)

(assert (=> d!81003 (and (or ((_ is Undefined!4633) lt!244675) (not ((_ is Found!4633) lt!244675)) (and (bvsge (index!20757 lt!244675) #b00000000000000000000000000000000) (bvslt (index!20757 lt!244675) (size!16543 a!3154)))) (or ((_ is Undefined!4633) lt!244675) ((_ is Found!4633) lt!244675) (not ((_ is MissingZero!4633) lt!244675)) (and (bvsge (index!20756 lt!244675) #b00000000000000000000000000000000) (bvslt (index!20756 lt!244675) (size!16543 a!3154)))) (or ((_ is Undefined!4633) lt!244675) ((_ is Found!4633) lt!244675) ((_ is MissingZero!4633) lt!244675) (not ((_ is MissingVacant!4633) lt!244675)) (and (bvsge (index!20759 lt!244675) #b00000000000000000000000000000000) (bvslt (index!20759 lt!244675) (size!16543 a!3154)))) (or ((_ is Undefined!4633) lt!244675) (ite ((_ is Found!4633) lt!244675) (= (select (arr!16178 a!3154) (index!20757 lt!244675)) k0!1998) (ite ((_ is MissingZero!4633) lt!244675) (= (select (arr!16178 a!3154) (index!20756 lt!244675)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4633) lt!244675) (= (select (arr!16178 a!3154) (index!20759 lt!244675)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!81003 (= lt!244675 e!309242)))

(declare-fun c!62428 () Bool)

(assert (=> d!81003 (= c!62428 (and ((_ is Intermediate!4633) lt!244674) (undefined!5445 lt!244674)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33666 (_ BitVec 32)) SeekEntryResult!4633)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!81003 (= lt!244674 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1998 mask!3216) k0!1998 a!3154 mask!3216))))

(assert (=> d!81003 (validMask!0 mask!3216)))

(assert (=> d!81003 (= (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216) lt!244675)))

(declare-fun b!530960 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33666 (_ BitVec 32)) SeekEntryResult!4633)

(assert (=> b!530960 (= e!309241 (seekKeyOrZeroReturnVacant!0 (x!49746 lt!244674) (index!20758 lt!244674) (index!20758 lt!244674) k0!1998 a!3154 mask!3216))))

(declare-fun b!530961 () Bool)

(assert (=> b!530961 (= e!309242 e!309243)))

(assert (=> b!530961 (= lt!244673 (select (arr!16178 a!3154) (index!20758 lt!244674)))))

(declare-fun c!62429 () Bool)

(assert (=> b!530961 (= c!62429 (= lt!244673 k0!1998))))

(declare-fun b!530962 () Bool)

(assert (=> b!530962 (= e!309243 (Found!4633 (index!20758 lt!244674)))))

(assert (= (and d!81003 c!62428) b!530957))

(assert (= (and d!81003 (not c!62428)) b!530961))

(assert (= (and b!530961 c!62429) b!530962))

(assert (= (and b!530961 (not c!62429)) b!530958))

(assert (= (and b!530958 c!62430) b!530959))

(assert (= (and b!530958 (not c!62430)) b!530960))

(assert (=> d!81003 m!510877))

(declare-fun m!510939 () Bool)

(assert (=> d!81003 m!510939))

(declare-fun m!510941 () Bool)

(assert (=> d!81003 m!510941))

(assert (=> d!81003 m!510939))

(declare-fun m!510943 () Bool)

(assert (=> d!81003 m!510943))

(declare-fun m!510945 () Bool)

(assert (=> d!81003 m!510945))

(declare-fun m!510947 () Bool)

(assert (=> d!81003 m!510947))

(declare-fun m!510949 () Bool)

(assert (=> b!530960 m!510949))

(declare-fun m!510951 () Bool)

(assert (=> b!530961 m!510951))

(assert (=> b!530879 d!81003))

(declare-fun d!81029 () Bool)

(declare-fun res!326725 () Bool)

(declare-fun e!309248 () Bool)

(assert (=> d!81029 (=> res!326725 e!309248)))

(assert (=> d!81029 (= res!326725 (= (select (arr!16178 a!3154) #b00000000000000000000000000000000) k0!1998))))

(assert (=> d!81029 (= (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000) e!309248)))

(declare-fun b!530967 () Bool)

(declare-fun e!309249 () Bool)

(assert (=> b!530967 (= e!309248 e!309249)))

(declare-fun res!326726 () Bool)

(assert (=> b!530967 (=> (not res!326726) (not e!309249))))

(assert (=> b!530967 (= res!326726 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16543 a!3154)))))

(declare-fun b!530968 () Bool)

(assert (=> b!530968 (= e!309249 (arrayContainsKey!0 a!3154 k0!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81029 (not res!326725)) b!530967))

(assert (= (and b!530967 res!326726) b!530968))

(declare-fun m!510953 () Bool)

(assert (=> d!81029 m!510953))

(declare-fun m!510955 () Bool)

(assert (=> b!530968 m!510955))

(assert (=> b!530880 d!81029))

(declare-fun d!81031 () Bool)

(assert (=> d!81031 (= (validKeyInArray!0 k0!1998) (and (not (= k0!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!530881 d!81031))

(declare-fun bm!31918 () Bool)

(declare-fun call!31921 () Bool)

(assert (=> bm!31918 (= call!31921 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!530989 () Bool)

(declare-fun e!309264 () Bool)

(assert (=> b!530989 (= e!309264 call!31921)))

(declare-fun b!530990 () Bool)

(declare-fun e!309263 () Bool)

(assert (=> b!530990 (= e!309263 e!309264)))

(declare-fun c!62439 () Bool)

(assert (=> b!530990 (= c!62439 (validKeyInArray!0 (select (arr!16178 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!530991 () Bool)

(declare-fun e!309262 () Bool)

(assert (=> b!530991 (= e!309262 call!31921)))

(declare-fun d!81033 () Bool)

(declare-fun res!326731 () Bool)

(assert (=> d!81033 (=> res!326731 e!309263)))

(assert (=> d!81033 (= res!326731 (bvsge #b00000000000000000000000000000000 (size!16543 a!3154)))))

(assert (=> d!81033 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!309263)))

(declare-fun b!530992 () Bool)

(assert (=> b!530992 (= e!309264 e!309262)))

(declare-fun lt!244694 () (_ BitVec 64))

(assert (=> b!530992 (= lt!244694 (select (arr!16178 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16810 0))(
  ( (Unit!16811) )
))
(declare-fun lt!244693 () Unit!16810)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33666 (_ BitVec 64) (_ BitVec 32)) Unit!16810)

(assert (=> b!530992 (= lt!244693 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!244694 #b00000000000000000000000000000000))))

(assert (=> b!530992 (arrayContainsKey!0 a!3154 lt!244694 #b00000000000000000000000000000000)))

(declare-fun lt!244692 () Unit!16810)

(assert (=> b!530992 (= lt!244692 lt!244693)))

(declare-fun res!326732 () Bool)

(assert (=> b!530992 (= res!326732 (= (seekEntryOrOpen!0 (select (arr!16178 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4633 #b00000000000000000000000000000000)))))

(assert (=> b!530992 (=> (not res!326732) (not e!309262))))

(assert (= (and d!81033 (not res!326731)) b!530990))

(assert (= (and b!530990 c!62439) b!530992))

(assert (= (and b!530990 (not c!62439)) b!530989))

(assert (= (and b!530992 res!326732) b!530991))

(assert (= (or b!530991 b!530989) bm!31918))

(declare-fun m!510957 () Bool)

(assert (=> bm!31918 m!510957))

(assert (=> b!530990 m!510953))

(assert (=> b!530990 m!510953))

(declare-fun m!510959 () Bool)

(assert (=> b!530990 m!510959))

(assert (=> b!530992 m!510953))

(declare-fun m!510961 () Bool)

(assert (=> b!530992 m!510961))

(declare-fun m!510963 () Bool)

(assert (=> b!530992 m!510963))

(assert (=> b!530992 m!510953))

(declare-fun m!510965 () Bool)

(assert (=> b!530992 m!510965))

(assert (=> b!530882 d!81033))

(declare-fun d!81035 () Bool)

(assert (=> d!81035 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!48264 d!81035))

(declare-fun d!81045 () Bool)

(assert (=> d!81045 (= (array_inv!12061 a!3154) (bvsge (size!16543 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!48264 d!81045))

(declare-fun d!81047 () Bool)

(declare-fun res!326753 () Bool)

(declare-fun e!309299 () Bool)

(assert (=> d!81047 (=> res!326753 e!309299)))

(assert (=> d!81047 (= res!326753 ((_ is Nil!10333) Nil!10333))))

(assert (=> d!81047 (= (noDuplicate!218 Nil!10333) e!309299)))

(declare-fun b!531041 () Bool)

(declare-fun e!309300 () Bool)

(assert (=> b!531041 (= e!309299 e!309300)))

(declare-fun res!326754 () Bool)

(assert (=> b!531041 (=> (not res!326754) (not e!309300))))

(declare-fun contains!2765 (List!10336 (_ BitVec 64)) Bool)

(assert (=> b!531041 (= res!326754 (not (contains!2765 (t!16555 Nil!10333) (h!11272 Nil!10333))))))

(declare-fun b!531042 () Bool)

(assert (=> b!531042 (= e!309300 (noDuplicate!218 (t!16555 Nil!10333)))))

(assert (= (and d!81047 (not res!326753)) b!531041))

(assert (= (and b!531041 res!326754) b!531042))

(declare-fun m!511003 () Bool)

(assert (=> b!531041 m!511003))

(declare-fun m!511005 () Bool)

(assert (=> b!531042 m!511005))

(assert (=> b!530877 d!81047))

(declare-fun d!81049 () Bool)

(assert (=> d!81049 (= (validKeyInArray!0 (select (arr!16178 a!3154) j!147)) (and (not (= (select (arr!16178 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16178 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!530883 d!81049))

(check-sat (not d!81003) (not bm!31918) (not b!530992) (not b!531041) (not b!530990) (not b!530968) (not b!530960) (not b!531042))
(check-sat)
