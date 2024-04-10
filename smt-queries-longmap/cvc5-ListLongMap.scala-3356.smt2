; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46128 () Bool)

(assert start!46128)

(declare-fun b!511026 () Bool)

(declare-fun res!311877 () Bool)

(declare-fun e!298628 () Bool)

(assert (=> b!511026 (=> (not res!311877) (not e!298628))))

(declare-datatypes ((array!32839 0))(
  ( (array!32840 (arr!15798 (Array (_ BitVec 32) (_ BitVec 64))) (size!16162 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32839)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32839 (_ BitVec 32)) Bool)

(assert (=> b!511026 (= res!311877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!511027 () Bool)

(declare-fun res!311878 () Bool)

(declare-fun e!298627 () Bool)

(assert (=> b!511027 (=> (not res!311878) (not e!298627))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!511027 (= res!311878 (validKeyInArray!0 k!2280))))

(declare-fun b!511028 () Bool)

(declare-fun res!311874 () Bool)

(assert (=> b!511028 (=> (not res!311874) (not e!298627))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!511028 (= res!311874 (validKeyInArray!0 (select (arr!15798 a!3235) j!176)))))

(declare-fun b!511029 () Bool)

(declare-fun e!298626 () Bool)

(declare-datatypes ((SeekEntryResult!4265 0))(
  ( (MissingZero!4265 (index!19248 (_ BitVec 32))) (Found!4265 (index!19249 (_ BitVec 32))) (Intermediate!4265 (undefined!5077 Bool) (index!19250 (_ BitVec 32)) (x!48202 (_ BitVec 32))) (Undefined!4265) (MissingVacant!4265 (index!19251 (_ BitVec 32))) )
))
(declare-fun lt!233779 () SeekEntryResult!4265)

(declare-fun lt!233776 () SeekEntryResult!4265)

(assert (=> b!511029 (= e!298626 (or (not (is-Intermediate!4265 lt!233779)) (not (undefined!5077 lt!233779)) (= lt!233776 Undefined!4265)))))

(declare-fun b!511030 () Bool)

(declare-fun res!311875 () Bool)

(assert (=> b!511030 (=> (not res!311875) (not e!298627))))

(declare-fun arrayContainsKey!0 (array!32839 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!511030 (= res!311875 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!511032 () Bool)

(declare-fun res!311873 () Bool)

(assert (=> b!511032 (=> (not res!311873) (not e!298628))))

(declare-datatypes ((List!9956 0))(
  ( (Nil!9953) (Cons!9952 (h!10829 (_ BitVec 64)) (t!16184 List!9956)) )
))
(declare-fun arrayNoDuplicates!0 (array!32839 (_ BitVec 32) List!9956) Bool)

(assert (=> b!511032 (= res!311873 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9953))))

(declare-fun b!511033 () Bool)

(assert (=> b!511033 (= e!298628 (not e!298626))))

(declare-fun res!311872 () Bool)

(assert (=> b!511033 (=> res!311872 e!298626)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!233777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32839 (_ BitVec 32)) SeekEntryResult!4265)

(assert (=> b!511033 (= res!311872 (= lt!233779 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233777 (select (store (arr!15798 a!3235) i!1204 k!2280) j!176) (array!32840 (store (arr!15798 a!3235) i!1204 k!2280) (size!16162 a!3235)) mask!3524)))))

(declare-fun lt!233775 () (_ BitVec 32))

(assert (=> b!511033 (= lt!233779 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233775 (select (arr!15798 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511033 (= lt!233777 (toIndex!0 (select (store (arr!15798 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!511033 (= lt!233775 (toIndex!0 (select (arr!15798 a!3235) j!176) mask!3524))))

(assert (=> b!511033 (= lt!233776 (Found!4265 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32839 (_ BitVec 32)) SeekEntryResult!4265)

(assert (=> b!511033 (= lt!233776 (seekEntryOrOpen!0 (select (arr!15798 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!511033 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15788 0))(
  ( (Unit!15789) )
))
(declare-fun lt!233774 () Unit!15788)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32839 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15788)

(assert (=> b!511033 (= lt!233774 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!511034 () Bool)

(declare-fun res!311876 () Bool)

(assert (=> b!511034 (=> (not res!311876) (not e!298627))))

(assert (=> b!511034 (= res!311876 (and (= (size!16162 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16162 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16162 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!311879 () Bool)

(assert (=> start!46128 (=> (not res!311879) (not e!298627))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46128 (= res!311879 (validMask!0 mask!3524))))

(assert (=> start!46128 e!298627))

(assert (=> start!46128 true))

(declare-fun array_inv!11594 (array!32839) Bool)

(assert (=> start!46128 (array_inv!11594 a!3235)))

(declare-fun b!511031 () Bool)

(assert (=> b!511031 (= e!298627 e!298628)))

(declare-fun res!311871 () Bool)

(assert (=> b!511031 (=> (not res!311871) (not e!298628))))

(declare-fun lt!233778 () SeekEntryResult!4265)

(assert (=> b!511031 (= res!311871 (or (= lt!233778 (MissingZero!4265 i!1204)) (= lt!233778 (MissingVacant!4265 i!1204))))))

(assert (=> b!511031 (= lt!233778 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!46128 res!311879) b!511034))

(assert (= (and b!511034 res!311876) b!511028))

(assert (= (and b!511028 res!311874) b!511027))

(assert (= (and b!511027 res!311878) b!511030))

(assert (= (and b!511030 res!311875) b!511031))

(assert (= (and b!511031 res!311871) b!511026))

(assert (= (and b!511026 res!311877) b!511032))

(assert (= (and b!511032 res!311873) b!511033))

(assert (= (and b!511033 (not res!311872)) b!511029))

(declare-fun m!492537 () Bool)

(assert (=> start!46128 m!492537))

(declare-fun m!492539 () Bool)

(assert (=> start!46128 m!492539))

(declare-fun m!492541 () Bool)

(assert (=> b!511027 m!492541))

(declare-fun m!492543 () Bool)

(assert (=> b!511032 m!492543))

(declare-fun m!492545 () Bool)

(assert (=> b!511028 m!492545))

(assert (=> b!511028 m!492545))

(declare-fun m!492547 () Bool)

(assert (=> b!511028 m!492547))

(declare-fun m!492549 () Bool)

(assert (=> b!511030 m!492549))

(declare-fun m!492551 () Bool)

(assert (=> b!511026 m!492551))

(declare-fun m!492553 () Bool)

(assert (=> b!511033 m!492553))

(declare-fun m!492555 () Bool)

(assert (=> b!511033 m!492555))

(declare-fun m!492557 () Bool)

(assert (=> b!511033 m!492557))

(assert (=> b!511033 m!492545))

(declare-fun m!492559 () Bool)

(assert (=> b!511033 m!492559))

(assert (=> b!511033 m!492545))

(assert (=> b!511033 m!492557))

(declare-fun m!492561 () Bool)

(assert (=> b!511033 m!492561))

(declare-fun m!492563 () Bool)

(assert (=> b!511033 m!492563))

(assert (=> b!511033 m!492557))

(declare-fun m!492565 () Bool)

(assert (=> b!511033 m!492565))

(assert (=> b!511033 m!492545))

(declare-fun m!492567 () Bool)

(assert (=> b!511033 m!492567))

(assert (=> b!511033 m!492545))

(declare-fun m!492569 () Bool)

(assert (=> b!511033 m!492569))

(declare-fun m!492571 () Bool)

(assert (=> b!511031 m!492571))

(push 1)

(assert (not b!511032))

(assert (not b!511033))

(assert (not b!511028))

(assert (not b!511031))

(assert (not b!511027))

(assert (not b!511030))

(assert (not start!46128))

(assert (not b!511026))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!78875 () Bool)

(assert (=> d!78875 (= (validKeyInArray!0 (select (arr!15798 a!3235) j!176)) (and (not (= (select (arr!15798 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15798 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!511028 d!78875))

(declare-fun d!78877 () Bool)

(declare-fun lt!233839 () (_ BitVec 32))

(declare-fun lt!233838 () (_ BitVec 32))

(assert (=> d!78877 (= lt!233839 (bvmul (bvxor lt!233838 (bvlshr lt!233838 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78877 (= lt!233838 ((_ extract 31 0) (bvand (bvxor (select (arr!15798 a!3235) j!176) (bvlshr (select (arr!15798 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78877 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!311947 (let ((h!10832 ((_ extract 31 0) (bvand (bvxor (select (arr!15798 a!3235) j!176) (bvlshr (select (arr!15798 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48205 (bvmul (bvxor h!10832 (bvlshr h!10832 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48205 (bvlshr x!48205 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!311947 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!311947 #b00000000000000000000000000000000))))))

(assert (=> d!78877 (= (toIndex!0 (select (arr!15798 a!3235) j!176) mask!3524) (bvand (bvxor lt!233839 (bvlshr lt!233839 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!511033 d!78877))

(declare-fun b!511204 () Bool)

(declare-fun e!298725 () SeekEntryResult!4265)

(declare-fun e!298727 () SeekEntryResult!4265)

(assert (=> b!511204 (= e!298725 e!298727)))

(declare-fun lt!233877 () (_ BitVec 64))

(declare-fun lt!233875 () SeekEntryResult!4265)

(assert (=> b!511204 (= lt!233877 (select (arr!15798 a!3235) (index!19250 lt!233875)))))

(declare-fun c!59898 () Bool)

(assert (=> b!511204 (= c!59898 (= lt!233877 (select (arr!15798 a!3235) j!176)))))

(declare-fun b!511205 () Bool)

(declare-fun e!298726 () SeekEntryResult!4265)

(assert (=> b!511205 (= e!298726 (MissingZero!4265 (index!19250 lt!233875)))))

(declare-fun d!78889 () Bool)

(declare-fun lt!233876 () SeekEntryResult!4265)

(assert (=> d!78889 (and (or (is-Undefined!4265 lt!233876) (not (is-Found!4265 lt!233876)) (and (bvsge (index!19249 lt!233876) #b00000000000000000000000000000000) (bvslt (index!19249 lt!233876) (size!16162 a!3235)))) (or (is-Undefined!4265 lt!233876) (is-Found!4265 lt!233876) (not (is-MissingZero!4265 lt!233876)) (and (bvsge (index!19248 lt!233876) #b00000000000000000000000000000000) (bvslt (index!19248 lt!233876) (size!16162 a!3235)))) (or (is-Undefined!4265 lt!233876) (is-Found!4265 lt!233876) (is-MissingZero!4265 lt!233876) (not (is-MissingVacant!4265 lt!233876)) (and (bvsge (index!19251 lt!233876) #b00000000000000000000000000000000) (bvslt (index!19251 lt!233876) (size!16162 a!3235)))) (or (is-Undefined!4265 lt!233876) (ite (is-Found!4265 lt!233876) (= (select (arr!15798 a!3235) (index!19249 lt!233876)) (select (arr!15798 a!3235) j!176)) (ite (is-MissingZero!4265 lt!233876) (= (select (arr!15798 a!3235) (index!19248 lt!233876)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4265 lt!233876) (= (select (arr!15798 a!3235) (index!19251 lt!233876)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!78889 (= lt!233876 e!298725)))

(declare-fun c!59897 () Bool)

(assert (=> d!78889 (= c!59897 (and (is-Intermediate!4265 lt!233875) (undefined!5077 lt!233875)))))

(assert (=> d!78889 (= lt!233875 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15798 a!3235) j!176) mask!3524) (select (arr!15798 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!78889 (validMask!0 mask!3524)))

(assert (=> d!78889 (= (seekEntryOrOpen!0 (select (arr!15798 a!3235) j!176) a!3235 mask!3524) lt!233876)))

(declare-fun b!511206 () Bool)

(assert (=> b!511206 (= e!298725 Undefined!4265)))

(declare-fun b!511207 () Bool)

(assert (=> b!511207 (= e!298727 (Found!4265 (index!19250 lt!233875)))))

(declare-fun b!511208 () Bool)

(declare-fun c!59896 () Bool)

(assert (=> b!511208 (= c!59896 (= lt!233877 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!511208 (= e!298727 e!298726)))

(declare-fun b!511209 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32839 (_ BitVec 32)) SeekEntryResult!4265)

(assert (=> b!511209 (= e!298726 (seekKeyOrZeroReturnVacant!0 (x!48202 lt!233875) (index!19250 lt!233875) (index!19250 lt!233875) (select (arr!15798 a!3235) j!176) a!3235 mask!3524))))

(assert (= (and d!78889 c!59897) b!511206))

(assert (= (and d!78889 (not c!59897)) b!511204))

(assert (= (and b!511204 c!59898) b!511207))

(assert (= (and b!511204 (not c!59898)) b!511208))

(assert (= (and b!511208 c!59896) b!511205))

(assert (= (and b!511208 (not c!59896)) b!511209))

(declare-fun m!492721 () Bool)

(assert (=> b!511204 m!492721))

(declare-fun m!492723 () Bool)

(assert (=> d!78889 m!492723))

(assert (=> d!78889 m!492537))

(assert (=> d!78889 m!492545))

(assert (=> d!78889 m!492559))

(declare-fun m!492725 () Bool)

(assert (=> d!78889 m!492725))

(declare-fun m!492727 () Bool)

(assert (=> d!78889 m!492727))

(assert (=> d!78889 m!492559))

(assert (=> d!78889 m!492545))

(declare-fun m!492729 () Bool)

(assert (=> d!78889 m!492729))

(assert (=> b!511209 m!492545))

(declare-fun m!492731 () Bool)

(assert (=> b!511209 m!492731))

(assert (=> b!511033 d!78889))

(declare-fun b!511236 () Bool)

(declare-fun e!298744 () Bool)

(declare-fun e!298746 () Bool)

(assert (=> b!511236 (= e!298744 e!298746)))

(declare-fun c!59907 () Bool)

(assert (=> b!511236 (= c!59907 (validKeyInArray!0 (select (arr!15798 a!3235) j!176)))))

(declare-fun b!511237 () Bool)

(declare-fun e!298745 () Bool)

(assert (=> b!511237 (= e!298746 e!298745)))

(declare-fun lt!233895 () (_ BitVec 64))

(assert (=> b!511237 (= lt!233895 (select (arr!15798 a!3235) j!176))))

(declare-fun lt!233894 () Unit!15788)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32839 (_ BitVec 64) (_ BitVec 32)) Unit!15788)

(assert (=> b!511237 (= lt!233894 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!233895 j!176))))

(assert (=> b!511237 (arrayContainsKey!0 a!3235 lt!233895 #b00000000000000000000000000000000)))

(declare-fun lt!233896 () Unit!15788)

(assert (=> b!511237 (= lt!233896 lt!233894)))

(declare-fun res!311983 () Bool)

(assert (=> b!511237 (= res!311983 (= (seekEntryOrOpen!0 (select (arr!15798 a!3235) j!176) a!3235 mask!3524) (Found!4265 j!176)))))

(assert (=> b!511237 (=> (not res!311983) (not e!298745))))

(declare-fun b!511238 () Bool)

(declare-fun call!31506 () Bool)

(assert (=> b!511238 (= e!298746 call!31506)))

(declare-fun bm!31503 () Bool)

(assert (=> bm!31503 (= call!31506 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!511239 () Bool)

(assert (=> b!511239 (= e!298745 call!31506)))

(declare-fun d!78903 () Bool)

(declare-fun res!311982 () Bool)

(assert (=> d!78903 (=> res!311982 e!298744)))

(assert (=> d!78903 (= res!311982 (bvsge j!176 (size!16162 a!3235)))))

(assert (=> d!78903 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!298744)))

(assert (= (and d!78903 (not res!311982)) b!511236))

(assert (= (and b!511236 c!59907) b!511237))

(assert (= (and b!511236 (not c!59907)) b!511238))

(assert (= (and b!511237 res!311983) b!511239))

(assert (= (or b!511239 b!511238) bm!31503))

(assert (=> b!511236 m!492545))

(assert (=> b!511236 m!492545))

(assert (=> b!511236 m!492547))

(assert (=> b!511237 m!492545))

(declare-fun m!492733 () Bool)

(assert (=> b!511237 m!492733))

(declare-fun m!492735 () Bool)

(assert (=> b!511237 m!492735))

(assert (=> b!511237 m!492545))

(assert (=> b!511237 m!492567))

(declare-fun m!492737 () Bool)

(assert (=> bm!31503 m!492737))

(assert (=> b!511033 d!78903))

(declare-fun b!511304 () Bool)

(declare-fun e!298785 () Bool)

(declare-fun e!298788 () Bool)

(assert (=> b!511304 (= e!298785 e!298788)))

(declare-fun res!312006 () Bool)

(declare-fun lt!233925 () SeekEntryResult!4265)

(assert (=> b!511304 (= res!312006 (and (is-Intermediate!4265 lt!233925) (not (undefined!5077 lt!233925)) (bvslt (x!48202 lt!233925) #b01111111111111111111111111111110) (bvsge (x!48202 lt!233925) #b00000000000000000000000000000000) (bvsge (x!48202 lt!233925) #b00000000000000000000000000000000)))))

(assert (=> b!511304 (=> (not res!312006) (not e!298788))))

(declare-fun b!511305 () Bool)

(declare-fun e!298787 () SeekEntryResult!4265)

(assert (=> b!511305 (= e!298787 (Intermediate!4265 true lt!233775 #b00000000000000000000000000000000))))

(declare-fun d!78907 () Bool)

(assert (=> d!78907 e!298785))

(declare-fun c!59932 () Bool)

(assert (=> d!78907 (= c!59932 (and (is-Intermediate!4265 lt!233925) (undefined!5077 lt!233925)))))

(assert (=> d!78907 (= lt!233925 e!298787)))

(declare-fun c!59930 () Bool)

(assert (=> d!78907 (= c!59930 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!233926 () (_ BitVec 64))

(assert (=> d!78907 (= lt!233926 (select (arr!15798 a!3235) lt!233775))))

(assert (=> d!78907 (validMask!0 mask!3524)))

(assert (=> d!78907 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233775 (select (arr!15798 a!3235) j!176) a!3235 mask!3524) lt!233925)))

(declare-fun b!511306 () Bool)

(declare-fun e!298786 () SeekEntryResult!4265)

(assert (=> b!511306 (= e!298787 e!298786)))

(declare-fun c!59931 () Bool)

(assert (=> b!511306 (= c!59931 (or (= lt!233926 (select (arr!15798 a!3235) j!176)) (= (bvadd lt!233926 lt!233926) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!511307 () Bool)

(assert (=> b!511307 (and (bvsge (index!19250 lt!233925) #b00000000000000000000000000000000) (bvslt (index!19250 lt!233925) (size!16162 a!3235)))))

(declare-fun res!312004 () Bool)

(assert (=> b!511307 (= res!312004 (= (select (arr!15798 a!3235) (index!19250 lt!233925)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!298789 () Bool)

(assert (=> b!511307 (=> res!312004 e!298789)))

(declare-fun b!511308 () Bool)

(assert (=> b!511308 (and (bvsge (index!19250 lt!233925) #b00000000000000000000000000000000) (bvslt (index!19250 lt!233925) (size!16162 a!3235)))))

(assert (=> b!511308 (= e!298789 (= (select (arr!15798 a!3235) (index!19250 lt!233925)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!511309 () Bool)

(assert (=> b!511309 (= e!298786 (Intermediate!4265 false lt!233775 #b00000000000000000000000000000000))))

(declare-fun b!511310 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511310 (= e!298786 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!233775 #b00000000000000000000000000000000 mask!3524) (select (arr!15798 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!511311 () Bool)

(assert (=> b!511311 (and (bvsge (index!19250 lt!233925) #b00000000000000000000000000000000) (bvslt (index!19250 lt!233925) (size!16162 a!3235)))))

(declare-fun res!312005 () Bool)

(assert (=> b!511311 (= res!312005 (= (select (arr!15798 a!3235) (index!19250 lt!233925)) (select (arr!15798 a!3235) j!176)))))

(assert (=> b!511311 (=> res!312005 e!298789)))

(assert (=> b!511311 (= e!298788 e!298789)))

(declare-fun b!511312 () Bool)

(assert (=> b!511312 (= e!298785 (bvsge (x!48202 lt!233925) #b01111111111111111111111111111110))))

(assert (= (and d!78907 c!59930) b!511305))

(assert (= (and d!78907 (not c!59930)) b!511306))

(assert (= (and b!511306 c!59931) b!511309))

(assert (= (and b!511306 (not c!59931)) b!511310))

(assert (= (and d!78907 c!59932) b!511312))

(assert (= (and d!78907 (not c!59932)) b!511304))

(assert (= (and b!511304 res!312006) b!511311))

(assert (= (and b!511311 (not res!312005)) b!511307))

(assert (= (and b!511307 (not res!312004)) b!511308))

(declare-fun m!492779 () Bool)

(assert (=> b!511308 m!492779))

(declare-fun m!492781 () Bool)

(assert (=> d!78907 m!492781))

(assert (=> d!78907 m!492537))

(assert (=> b!511307 m!492779))

(assert (=> b!511311 m!492779))

(declare-fun m!492783 () Bool)

(assert (=> b!511310 m!492783))

(assert (=> b!511310 m!492783))

(assert (=> b!511310 m!492545))

(declare-fun m!492785 () Bool)

(assert (=> b!511310 m!492785))

(assert (=> b!511033 d!78907))

(declare-fun b!511313 () Bool)

(declare-fun e!298790 () Bool)

(declare-fun e!298793 () Bool)

(assert (=> b!511313 (= e!298790 e!298793)))

(declare-fun res!312009 () Bool)

(declare-fun lt!233929 () SeekEntryResult!4265)

(assert (=> b!511313 (= res!312009 (and (is-Intermediate!4265 lt!233929) (not (undefined!5077 lt!233929)) (bvslt (x!48202 lt!233929) #b01111111111111111111111111111110) (bvsge (x!48202 lt!233929) #b00000000000000000000000000000000) (bvsge (x!48202 lt!233929) #b00000000000000000000000000000000)))))

(assert (=> b!511313 (=> (not res!312009) (not e!298793))))

(declare-fun b!511314 () Bool)

(declare-fun e!298792 () SeekEntryResult!4265)

(assert (=> b!511314 (= e!298792 (Intermediate!4265 true lt!233777 #b00000000000000000000000000000000))))

(declare-fun d!78927 () Bool)

(assert (=> d!78927 e!298790))

(declare-fun c!59935 () Bool)

(assert (=> d!78927 (= c!59935 (and (is-Intermediate!4265 lt!233929) (undefined!5077 lt!233929)))))

(assert (=> d!78927 (= lt!233929 e!298792)))

(declare-fun c!59933 () Bool)

(assert (=> d!78927 (= c!59933 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!233930 () (_ BitVec 64))

(assert (=> d!78927 (= lt!233930 (select (arr!15798 (array!32840 (store (arr!15798 a!3235) i!1204 k!2280) (size!16162 a!3235))) lt!233777))))

(assert (=> d!78927 (validMask!0 mask!3524)))

(assert (=> d!78927 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233777 (select (store (arr!15798 a!3235) i!1204 k!2280) j!176) (array!32840 (store (arr!15798 a!3235) i!1204 k!2280) (size!16162 a!3235)) mask!3524) lt!233929)))

(declare-fun b!511315 () Bool)

(declare-fun e!298791 () SeekEntryResult!4265)

(assert (=> b!511315 (= e!298792 e!298791)))

(declare-fun c!59934 () Bool)

(assert (=> b!511315 (= c!59934 (or (= lt!233930 (select (store (arr!15798 a!3235) i!1204 k!2280) j!176)) (= (bvadd lt!233930 lt!233930) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!511316 () Bool)

(assert (=> b!511316 (and (bvsge (index!19250 lt!233929) #b00000000000000000000000000000000) (bvslt (index!19250 lt!233929) (size!16162 (array!32840 (store (arr!15798 a!3235) i!1204 k!2280) (size!16162 a!3235)))))))

(declare-fun res!312007 () Bool)

(assert (=> b!511316 (= res!312007 (= (select (arr!15798 (array!32840 (store (arr!15798 a!3235) i!1204 k!2280) (size!16162 a!3235))) (index!19250 lt!233929)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!298794 () Bool)

(assert (=> b!511316 (=> res!312007 e!298794)))

(declare-fun b!511317 () Bool)

(assert (=> b!511317 (and (bvsge (index!19250 lt!233929) #b00000000000000000000000000000000) (bvslt (index!19250 lt!233929) (size!16162 (array!32840 (store (arr!15798 a!3235) i!1204 k!2280) (size!16162 a!3235)))))))

(assert (=> b!511317 (= e!298794 (= (select (arr!15798 (array!32840 (store (arr!15798 a!3235) i!1204 k!2280) (size!16162 a!3235))) (index!19250 lt!233929)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!511318 () Bool)

(assert (=> b!511318 (= e!298791 (Intermediate!4265 false lt!233777 #b00000000000000000000000000000000))))

(declare-fun b!511319 () Bool)

(assert (=> b!511319 (= e!298791 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!233777 #b00000000000000000000000000000000 mask!3524) (select (store (arr!15798 a!3235) i!1204 k!2280) j!176) (array!32840 (store (arr!15798 a!3235) i!1204 k!2280) (size!16162 a!3235)) mask!3524))))

(declare-fun b!511320 () Bool)

(assert (=> b!511320 (and (bvsge (index!19250 lt!233929) #b00000000000000000000000000000000) (bvslt (index!19250 lt!233929) (size!16162 (array!32840 (store (arr!15798 a!3235) i!1204 k!2280) (size!16162 a!3235)))))))

(declare-fun res!312008 () Bool)

(assert (=> b!511320 (= res!312008 (= (select (arr!15798 (array!32840 (store (arr!15798 a!3235) i!1204 k!2280) (size!16162 a!3235))) (index!19250 lt!233929)) (select (store (arr!15798 a!3235) i!1204 k!2280) j!176)))))

(assert (=> b!511320 (=> res!312008 e!298794)))

(assert (=> b!511320 (= e!298793 e!298794)))

(declare-fun b!511321 () Bool)

(assert (=> b!511321 (= e!298790 (bvsge (x!48202 lt!233929) #b01111111111111111111111111111110))))

(assert (= (and d!78927 c!59933) b!511314))

(assert (= (and d!78927 (not c!59933)) b!511315))

(assert (= (and b!511315 c!59934) b!511318))

(assert (= (and b!511315 (not c!59934)) b!511319))

(assert (= (and d!78927 c!59935) b!511321))

(assert (= (and d!78927 (not c!59935)) b!511313))

(assert (= (and b!511313 res!312009) b!511320))

(assert (= (and b!511320 (not res!312008)) b!511316))

(assert (= (and b!511316 (not res!312007)) b!511317))

(declare-fun m!492787 () Bool)

(assert (=> b!511317 m!492787))

(declare-fun m!492789 () Bool)

(assert (=> d!78927 m!492789))

(assert (=> d!78927 m!492537))

(assert (=> b!511316 m!492787))

(assert (=> b!511320 m!492787))

(declare-fun m!492791 () Bool)

(assert (=> b!511319 m!492791))

(assert (=> b!511319 m!492791))

(assert (=> b!511319 m!492557))

(declare-fun m!492793 () Bool)

(assert (=> b!511319 m!492793))

(assert (=> b!511033 d!78927))

(declare-fun d!78931 () Bool)

(assert (=> d!78931 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!233933 () Unit!15788)

(declare-fun choose!38 (array!32839 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15788)

(assert (=> d!78931 (= lt!233933 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!78931 (validMask!0 mask!3524)))

(assert (=> d!78931 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!233933)))

(declare-fun bs!16194 () Bool)

(assert (= bs!16194 d!78931))

(assert (=> bs!16194 m!492563))

(declare-fun m!492795 () Bool)

(assert (=> bs!16194 m!492795))

(assert (=> bs!16194 m!492537))

(assert (=> b!511033 d!78931))

(declare-fun d!78933 () Bool)

(declare-fun lt!233935 () (_ BitVec 32))

(declare-fun lt!233934 () (_ BitVec 32))

(assert (=> d!78933 (= lt!233935 (bvmul (bvxor lt!233934 (bvlshr lt!233934 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78933 (= lt!233934 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15798 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15798 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78933 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!311947 (let ((h!10832 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15798 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15798 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48205 (bvmul (bvxor h!10832 (bvlshr h!10832 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48205 (bvlshr x!48205 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!311947 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!311947 #b00000000000000000000000000000000))))))

(assert (=> d!78933 (= (toIndex!0 (select (store (arr!15798 a!3235) i!1204 k!2280) j!176) mask!3524) (bvand (bvxor lt!233935 (bvlshr lt!233935 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!511033 d!78933))

(declare-fun b!511322 () Bool)

(declare-fun e!298795 () SeekEntryResult!4265)

(declare-fun e!298797 () SeekEntryResult!4265)

(assert (=> b!511322 (= e!298795 e!298797)))

(declare-fun lt!233938 () (_ BitVec 64))

(declare-fun lt!233936 () SeekEntryResult!4265)

(assert (=> b!511322 (= lt!233938 (select (arr!15798 a!3235) (index!19250 lt!233936)))))

(declare-fun c!59938 () Bool)

(assert (=> b!511322 (= c!59938 (= lt!233938 k!2280))))

(declare-fun b!511323 () Bool)

(declare-fun e!298796 () SeekEntryResult!4265)

(assert (=> b!511323 (= e!298796 (MissingZero!4265 (index!19250 lt!233936)))))

(declare-fun d!78935 () Bool)

(declare-fun lt!233937 () SeekEntryResult!4265)

(assert (=> d!78935 (and (or (is-Undefined!4265 lt!233937) (not (is-Found!4265 lt!233937)) (and (bvsge (index!19249 lt!233937) #b00000000000000000000000000000000) (bvslt (index!19249 lt!233937) (size!16162 a!3235)))) (or (is-Undefined!4265 lt!233937) (is-Found!4265 lt!233937) (not (is-MissingZero!4265 lt!233937)) (and (bvsge (index!19248 lt!233937) #b00000000000000000000000000000000) (bvslt (index!19248 lt!233937) (size!16162 a!3235)))) (or (is-Undefined!4265 lt!233937) (is-Found!4265 lt!233937) (is-MissingZero!4265 lt!233937) (not (is-MissingVacant!4265 lt!233937)) (and (bvsge (index!19251 lt!233937) #b00000000000000000000000000000000) (bvslt (index!19251 lt!233937) (size!16162 a!3235)))) (or (is-Undefined!4265 lt!233937) (ite (is-Found!4265 lt!233937) (= (select (arr!15798 a!3235) (index!19249 lt!233937)) k!2280) (ite (is-MissingZero!4265 lt!233937) (= (select (arr!15798 a!3235) (index!19248 lt!233937)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4265 lt!233937) (= (select (arr!15798 a!3235) (index!19251 lt!233937)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!78935 (= lt!233937 e!298795)))

(declare-fun c!59937 () Bool)

(assert (=> d!78935 (= c!59937 (and (is-Intermediate!4265 lt!233936) (undefined!5077 lt!233936)))))

(assert (=> d!78935 (= lt!233936 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!78935 (validMask!0 mask!3524)))

(assert (=> d!78935 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!233937)))

(declare-fun b!511324 () Bool)

(assert (=> b!511324 (= e!298795 Undefined!4265)))

(declare-fun b!511325 () Bool)

(assert (=> b!511325 (= e!298797 (Found!4265 (index!19250 lt!233936)))))

(declare-fun b!511326 () Bool)

(declare-fun c!59936 () Bool)

(assert (=> b!511326 (= c!59936 (= lt!233938 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!511326 (= e!298797 e!298796)))

(declare-fun b!511327 () Bool)

(assert (=> b!511327 (= e!298796 (seekKeyOrZeroReturnVacant!0 (x!48202 lt!233936) (index!19250 lt!233936) (index!19250 lt!233936) k!2280 a!3235 mask!3524))))

(assert (= (and d!78935 c!59937) b!511324))

(assert (= (and d!78935 (not c!59937)) b!511322))

(assert (= (and b!511322 c!59938) b!511325))

(assert (= (and b!511322 (not c!59938)) b!511326))

(assert (= (and b!511326 c!59936) b!511323))

(assert (= (and b!511326 (not c!59936)) b!511327))

(declare-fun m!492797 () Bool)

(assert (=> b!511322 m!492797))

(declare-fun m!492799 () Bool)

(assert (=> d!78935 m!492799))

(assert (=> d!78935 m!492537))

(declare-fun m!492801 () Bool)

(assert (=> d!78935 m!492801))

(declare-fun m!492803 () Bool)

(assert (=> d!78935 m!492803))

(declare-fun m!492805 () Bool)

(assert (=> d!78935 m!492805))

(assert (=> d!78935 m!492801))

(declare-fun m!492807 () Bool)

(assert (=> d!78935 m!492807))

(declare-fun m!492809 () Bool)

(assert (=> b!511327 m!492809))

(assert (=> b!511031 d!78935))

(declare-fun d!78937 () Bool)

(declare-fun res!312014 () Bool)

(declare-fun e!298802 () Bool)

(assert (=> d!78937 (=> res!312014 e!298802)))

(assert (=> d!78937 (= res!312014 (= (select (arr!15798 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!78937 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!298802)))

(declare-fun b!511332 () Bool)

(declare-fun e!298803 () Bool)

(assert (=> b!511332 (= e!298802 e!298803)))

(declare-fun res!312015 () Bool)

(assert (=> b!511332 (=> (not res!312015) (not e!298803))))

(assert (=> b!511332 (= res!312015 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16162 a!3235)))))

(declare-fun b!511333 () Bool)

(assert (=> b!511333 (= e!298803 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!78937 (not res!312014)) b!511332))

(assert (= (and b!511332 res!312015) b!511333))

(declare-fun m!492811 () Bool)

(assert (=> d!78937 m!492811))

(declare-fun m!492813 () Bool)

(assert (=> b!511333 m!492813))

(assert (=> b!511030 d!78937))

(declare-fun d!78945 () Bool)

(assert (=> d!78945 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46128 d!78945))

(declare-fun d!78949 () Bool)

(assert (=> d!78949 (= (array_inv!11594 a!3235) (bvsge (size!16162 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46128 d!78949))

(declare-fun b!511371 () Bool)

(declare-fun e!298834 () Bool)

(declare-fun call!31513 () Bool)

(assert (=> b!511371 (= e!298834 call!31513)))

(declare-fun b!511372 () Bool)

(assert (=> b!511372 (= e!298834 call!31513)))

(declare-fun bm!31510 () Bool)

(declare-fun c!59947 () Bool)

(assert (=> bm!31510 (= call!31513 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!59947 (Cons!9952 (select (arr!15798 a!3235) #b00000000000000000000000000000000) Nil!9953) Nil!9953)))))

(declare-fun d!78953 () Bool)

(declare-fun res!312037 () Bool)

(declare-fun e!298833 () Bool)

(assert (=> d!78953 (=> res!312037 e!298833)))

(assert (=> d!78953 (= res!312037 (bvsge #b00000000000000000000000000000000 (size!16162 a!3235)))))

(assert (=> d!78953 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9953) e!298833)))

(declare-fun b!511373 () Bool)

(declare-fun e!298836 () Bool)

(assert (=> b!511373 (= e!298836 e!298834)))

(assert (=> b!511373 (= c!59947 (validKeyInArray!0 (select (arr!15798 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!511374 () Bool)

(declare-fun e!298835 () Bool)

(declare-fun contains!2723 (List!9956 (_ BitVec 64)) Bool)

(assert (=> b!511374 (= e!298835 (contains!2723 Nil!9953 (select (arr!15798 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!511375 () Bool)

(assert (=> b!511375 (= e!298833 e!298836)))

(declare-fun res!312039 () Bool)

(assert (=> b!511375 (=> (not res!312039) (not e!298836))))

(assert (=> b!511375 (= res!312039 (not e!298835))))

(declare-fun res!312038 () Bool)

(assert (=> b!511375 (=> (not res!312038) (not e!298835))))

(assert (=> b!511375 (= res!312038 (validKeyInArray!0 (select (arr!15798 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!78953 (not res!312037)) b!511375))

(assert (= (and b!511375 res!312038) b!511374))

(assert (= (and b!511375 res!312039) b!511373))

(assert (= (and b!511373 c!59947) b!511372))

(assert (= (and b!511373 (not c!59947)) b!511371))

(assert (= (or b!511372 b!511371) bm!31510))

(assert (=> bm!31510 m!492811))

(declare-fun m!492835 () Bool)

(assert (=> bm!31510 m!492835))

(assert (=> b!511373 m!492811))

(assert (=> b!511373 m!492811))

(declare-fun m!492837 () Bool)

(assert (=> b!511373 m!492837))

(assert (=> b!511374 m!492811))

(assert (=> b!511374 m!492811))

(declare-fun m!492839 () Bool)

(assert (=> b!511374 m!492839))

(assert (=> b!511375 m!492811))

(assert (=> b!511375 m!492811))

(assert (=> b!511375 m!492837))

(assert (=> b!511032 d!78953))

(declare-fun d!78955 () Bool)

(assert (=> d!78955 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!511027 d!78955))

(declare-fun b!511376 () Bool)

(declare-fun e!298837 () Bool)

(declare-fun e!298839 () Bool)

(assert (=> b!511376 (= e!298837 e!298839)))

(declare-fun c!59948 () Bool)

(assert (=> b!511376 (= c!59948 (validKeyInArray!0 (select (arr!15798 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!511377 () Bool)

(declare-fun e!298838 () Bool)

(assert (=> b!511377 (= e!298839 e!298838)))

(declare-fun lt!233943 () (_ BitVec 64))

(assert (=> b!511377 (= lt!233943 (select (arr!15798 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!233942 () Unit!15788)

(assert (=> b!511377 (= lt!233942 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!233943 #b00000000000000000000000000000000))))

(assert (=> b!511377 (arrayContainsKey!0 a!3235 lt!233943 #b00000000000000000000000000000000)))

(declare-fun lt!233944 () Unit!15788)

(assert (=> b!511377 (= lt!233944 lt!233942)))

(declare-fun res!312041 () Bool)

(assert (=> b!511377 (= res!312041 (= (seekEntryOrOpen!0 (select (arr!15798 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4265 #b00000000000000000000000000000000)))))

(assert (=> b!511377 (=> (not res!312041) (not e!298838))))

(declare-fun b!511378 () Bool)

(declare-fun call!31514 () Bool)

(assert (=> b!511378 (= e!298839 call!31514)))

(declare-fun bm!31511 () Bool)

(assert (=> bm!31511 (= call!31514 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!511379 () Bool)

(assert (=> b!511379 (= e!298838 call!31514)))

(declare-fun d!78957 () Bool)

(declare-fun res!312040 () Bool)

(assert (=> d!78957 (=> res!312040 e!298837)))

(assert (=> d!78957 (= res!312040 (bvsge #b00000000000000000000000000000000 (size!16162 a!3235)))))

(assert (=> d!78957 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!298837)))

(assert (= (and d!78957 (not res!312040)) b!511376))

(assert (= (and b!511376 c!59948) b!511377))

(assert (= (and b!511376 (not c!59948)) b!511378))

(assert (= (and b!511377 res!312041) b!511379))

(assert (= (or b!511379 b!511378) bm!31511))

(assert (=> b!511376 m!492811))

(assert (=> b!511376 m!492811))

(assert (=> b!511376 m!492837))

(assert (=> b!511377 m!492811))

(declare-fun m!492841 () Bool)

(assert (=> b!511377 m!492841))

(declare-fun m!492843 () Bool)

(assert (=> b!511377 m!492843))

(assert (=> b!511377 m!492811))

(declare-fun m!492845 () Bool)

(assert (=> b!511377 m!492845))

(declare-fun m!492847 () Bool)

(assert (=> bm!31511 m!492847))

(assert (=> b!511026 d!78957))

(push 1)

