; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64668 () Bool)

(assert start!64668)

(declare-fun b!728794 () Bool)

(declare-fun res!489273 () Bool)

(declare-fun e!407944 () Bool)

(assert (=> b!728794 (=> (not res!489273) (not e!407944))))

(declare-datatypes ((array!41117 0))(
  ( (array!41118 (arr!19678 (Array (_ BitVec 32) (_ BitVec 64))) (size!20099 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41117)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!728794 (= res!489273 (validKeyInArray!0 (select (arr!19678 a!3186) j!159)))))

(declare-fun b!728795 () Bool)

(declare-fun res!489282 () Bool)

(assert (=> b!728795 (=> (not res!489282) (not e!407944))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!728795 (= res!489282 (and (= (size!20099 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20099 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20099 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!489284 () Bool)

(assert (=> start!64668 (=> (not res!489284) (not e!407944))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64668 (= res!489284 (validMask!0 mask!3328))))

(assert (=> start!64668 e!407944))

(assert (=> start!64668 true))

(declare-fun array_inv!15474 (array!41117) Bool)

(assert (=> start!64668 (array_inv!15474 a!3186)))

(declare-fun b!728796 () Bool)

(declare-fun e!407941 () Bool)

(declare-fun e!407940 () Bool)

(assert (=> b!728796 (= e!407941 (not e!407940))))

(declare-fun res!489279 () Bool)

(assert (=> b!728796 (=> res!489279 e!407940)))

(declare-datatypes ((SeekEntryResult!7278 0))(
  ( (MissingZero!7278 (index!31480 (_ BitVec 32))) (Found!7278 (index!31481 (_ BitVec 32))) (Intermediate!7278 (undefined!8090 Bool) (index!31482 (_ BitVec 32)) (x!62468 (_ BitVec 32))) (Undefined!7278) (MissingVacant!7278 (index!31483 (_ BitVec 32))) )
))
(declare-fun lt!322840 () SeekEntryResult!7278)

(declare-fun x!1131 () (_ BitVec 32))

(get-info :version)

(assert (=> b!728796 (= res!489279 (or (not ((_ is Intermediate!7278) lt!322840)) (bvsge x!1131 (x!62468 lt!322840))))))

(declare-fun e!407942 () Bool)

(assert (=> b!728796 e!407942))

(declare-fun res!489270 () Bool)

(assert (=> b!728796 (=> (not res!489270) (not e!407942))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41117 (_ BitVec 32)) Bool)

(assert (=> b!728796 (= res!489270 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24874 0))(
  ( (Unit!24875) )
))
(declare-fun lt!322842 () Unit!24874)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41117 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24874)

(assert (=> b!728796 (= lt!322842 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun lt!322843 () SeekEntryResult!7278)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!728797 () Bool)

(declare-fun e!407943 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41117 (_ BitVec 32)) SeekEntryResult!7278)

(assert (=> b!728797 (= e!407943 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19678 a!3186) j!159) a!3186 mask!3328) lt!322843))))

(declare-fun b!728798 () Bool)

(declare-fun res!489272 () Bool)

(declare-fun e!407945 () Bool)

(assert (=> b!728798 (=> (not res!489272) (not e!407945))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!728798 (= res!489272 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19678 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!728799 () Bool)

(declare-fun res!489269 () Bool)

(assert (=> b!728799 (=> (not res!489269) (not e!407945))))

(assert (=> b!728799 (= res!489269 e!407943)))

(declare-fun c!80137 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!728799 (= c!80137 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!728800 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41117 (_ BitVec 32)) SeekEntryResult!7278)

(assert (=> b!728800 (= e!407943 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19678 a!3186) j!159) a!3186 mask!3328) (Found!7278 j!159)))))

(declare-fun lt!322847 () SeekEntryResult!7278)

(declare-fun b!728801 () Bool)

(declare-fun e!407947 () Bool)

(assert (=> b!728801 (= e!407947 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19678 a!3186) j!159) a!3186 mask!3328) lt!322847))))

(declare-fun b!728802 () Bool)

(declare-fun e!407948 () Bool)

(assert (=> b!728802 (= e!407948 e!407945)))

(declare-fun res!489275 () Bool)

(assert (=> b!728802 (=> (not res!489275) (not e!407945))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728802 (= res!489275 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19678 a!3186) j!159) mask!3328) (select (arr!19678 a!3186) j!159) a!3186 mask!3328) lt!322843))))

(assert (=> b!728802 (= lt!322843 (Intermediate!7278 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!728803 () Bool)

(declare-fun res!489281 () Bool)

(assert (=> b!728803 (=> (not res!489281) (not e!407948))))

(assert (=> b!728803 (= res!489281 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20099 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20099 a!3186))))))

(declare-fun b!728804 () Bool)

(assert (=> b!728804 (= e!407940 true)))

(declare-fun lt!322841 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728804 (= lt!322841 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!728805 () Bool)

(declare-fun res!489283 () Bool)

(assert (=> b!728805 (=> (not res!489283) (not e!407944))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41117 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!728805 (= res!489283 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!728806 () Bool)

(assert (=> b!728806 (= e!407942 e!407947)))

(declare-fun res!489280 () Bool)

(assert (=> b!728806 (=> (not res!489280) (not e!407947))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41117 (_ BitVec 32)) SeekEntryResult!7278)

(assert (=> b!728806 (= res!489280 (= (seekEntryOrOpen!0 (select (arr!19678 a!3186) j!159) a!3186 mask!3328) lt!322847))))

(assert (=> b!728806 (= lt!322847 (Found!7278 j!159))))

(declare-fun b!728807 () Bool)

(assert (=> b!728807 (= e!407944 e!407948)))

(declare-fun res!489278 () Bool)

(assert (=> b!728807 (=> (not res!489278) (not e!407948))))

(declare-fun lt!322844 () SeekEntryResult!7278)

(assert (=> b!728807 (= res!489278 (or (= lt!322844 (MissingZero!7278 i!1173)) (= lt!322844 (MissingVacant!7278 i!1173))))))

(assert (=> b!728807 (= lt!322844 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!728808 () Bool)

(declare-fun res!489276 () Bool)

(assert (=> b!728808 (=> (not res!489276) (not e!407948))))

(assert (=> b!728808 (= res!489276 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!728809 () Bool)

(declare-fun res!489274 () Bool)

(assert (=> b!728809 (=> (not res!489274) (not e!407948))))

(declare-datatypes ((List!13680 0))(
  ( (Nil!13677) (Cons!13676 (h!14736 (_ BitVec 64)) (t!19995 List!13680)) )
))
(declare-fun arrayNoDuplicates!0 (array!41117 (_ BitVec 32) List!13680) Bool)

(assert (=> b!728809 (= res!489274 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13677))))

(declare-fun b!728810 () Bool)

(declare-fun res!489271 () Bool)

(assert (=> b!728810 (=> (not res!489271) (not e!407944))))

(assert (=> b!728810 (= res!489271 (validKeyInArray!0 k0!2102))))

(declare-fun b!728811 () Bool)

(assert (=> b!728811 (= e!407945 e!407941)))

(declare-fun res!489277 () Bool)

(assert (=> b!728811 (=> (not res!489277) (not e!407941))))

(declare-fun lt!322839 () SeekEntryResult!7278)

(assert (=> b!728811 (= res!489277 (= lt!322839 lt!322840))))

(declare-fun lt!322846 () (_ BitVec 64))

(declare-fun lt!322845 () array!41117)

(assert (=> b!728811 (= lt!322840 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322846 lt!322845 mask!3328))))

(assert (=> b!728811 (= lt!322839 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322846 mask!3328) lt!322846 lt!322845 mask!3328))))

(assert (=> b!728811 (= lt!322846 (select (store (arr!19678 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!728811 (= lt!322845 (array!41118 (store (arr!19678 a!3186) i!1173 k0!2102) (size!20099 a!3186)))))

(assert (= (and start!64668 res!489284) b!728795))

(assert (= (and b!728795 res!489282) b!728794))

(assert (= (and b!728794 res!489273) b!728810))

(assert (= (and b!728810 res!489271) b!728805))

(assert (= (and b!728805 res!489283) b!728807))

(assert (= (and b!728807 res!489278) b!728808))

(assert (= (and b!728808 res!489276) b!728809))

(assert (= (and b!728809 res!489274) b!728803))

(assert (= (and b!728803 res!489281) b!728802))

(assert (= (and b!728802 res!489275) b!728798))

(assert (= (and b!728798 res!489272) b!728799))

(assert (= (and b!728799 c!80137) b!728797))

(assert (= (and b!728799 (not c!80137)) b!728800))

(assert (= (and b!728799 res!489269) b!728811))

(assert (= (and b!728811 res!489277) b!728796))

(assert (= (and b!728796 res!489270) b!728806))

(assert (= (and b!728806 res!489280) b!728801))

(assert (= (and b!728796 (not res!489279)) b!728804))

(declare-fun m!682507 () Bool)

(assert (=> b!728806 m!682507))

(assert (=> b!728806 m!682507))

(declare-fun m!682509 () Bool)

(assert (=> b!728806 m!682509))

(declare-fun m!682511 () Bool)

(assert (=> b!728811 m!682511))

(declare-fun m!682513 () Bool)

(assert (=> b!728811 m!682513))

(declare-fun m!682515 () Bool)

(assert (=> b!728811 m!682515))

(assert (=> b!728811 m!682511))

(declare-fun m!682517 () Bool)

(assert (=> b!728811 m!682517))

(declare-fun m!682519 () Bool)

(assert (=> b!728811 m!682519))

(declare-fun m!682521 () Bool)

(assert (=> b!728807 m!682521))

(declare-fun m!682523 () Bool)

(assert (=> start!64668 m!682523))

(declare-fun m!682525 () Bool)

(assert (=> start!64668 m!682525))

(declare-fun m!682527 () Bool)

(assert (=> b!728805 m!682527))

(declare-fun m!682529 () Bool)

(assert (=> b!728808 m!682529))

(assert (=> b!728794 m!682507))

(assert (=> b!728794 m!682507))

(declare-fun m!682531 () Bool)

(assert (=> b!728794 m!682531))

(assert (=> b!728801 m!682507))

(assert (=> b!728801 m!682507))

(declare-fun m!682533 () Bool)

(assert (=> b!728801 m!682533))

(declare-fun m!682535 () Bool)

(assert (=> b!728796 m!682535))

(declare-fun m!682537 () Bool)

(assert (=> b!728796 m!682537))

(assert (=> b!728802 m!682507))

(assert (=> b!728802 m!682507))

(declare-fun m!682539 () Bool)

(assert (=> b!728802 m!682539))

(assert (=> b!728802 m!682539))

(assert (=> b!728802 m!682507))

(declare-fun m!682541 () Bool)

(assert (=> b!728802 m!682541))

(declare-fun m!682543 () Bool)

(assert (=> b!728798 m!682543))

(assert (=> b!728800 m!682507))

(assert (=> b!728800 m!682507))

(declare-fun m!682545 () Bool)

(assert (=> b!728800 m!682545))

(declare-fun m!682547 () Bool)

(assert (=> b!728804 m!682547))

(assert (=> b!728797 m!682507))

(assert (=> b!728797 m!682507))

(declare-fun m!682549 () Bool)

(assert (=> b!728797 m!682549))

(declare-fun m!682551 () Bool)

(assert (=> b!728810 m!682551))

(declare-fun m!682553 () Bool)

(assert (=> b!728809 m!682553))

(check-sat (not b!728801) (not b!728796) (not start!64668) (not b!728802) (not b!728810) (not b!728794) (not b!728811) (not b!728808) (not b!728805) (not b!728800) (not b!728804) (not b!728807) (not b!728806) (not b!728809) (not b!728797))
(check-sat)
