; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65140 () Bool)

(assert start!65140)

(declare-datatypes ((array!41313 0))(
  ( (array!41314 (arr!19770 (Array (_ BitVec 32) (_ BitVec 64))) (size!20191 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41313)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!411671 () Bool)

(declare-fun b!735820 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7370 0))(
  ( (MissingZero!7370 (index!31848 (_ BitVec 32))) (Found!7370 (index!31849 (_ BitVec 32))) (Intermediate!7370 (undefined!8182 Bool) (index!31850 (_ BitVec 32)) (x!62856 (_ BitVec 32))) (Undefined!7370) (MissingVacant!7370 (index!31851 (_ BitVec 32))) )
))
(declare-fun lt!326238 () SeekEntryResult!7370)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41313 (_ BitVec 32)) SeekEntryResult!7370)

(assert (=> b!735820 (= e!411671 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19770 a!3186) j!159) a!3186 mask!3328) lt!326238))))

(declare-fun b!735821 () Bool)

(declare-fun res!494476 () Bool)

(declare-fun e!411664 () Bool)

(assert (=> b!735821 (=> (not res!494476) (not e!411664))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!735821 (= res!494476 (validKeyInArray!0 (select (arr!19770 a!3186) j!159)))))

(declare-fun b!735822 () Bool)

(declare-fun res!494480 () Bool)

(assert (=> b!735822 (=> (not res!494480) (not e!411664))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41313 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!735822 (= res!494480 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!735823 () Bool)

(declare-fun e!411666 () Bool)

(declare-fun e!411667 () Bool)

(assert (=> b!735823 (= e!411666 e!411667)))

(declare-fun res!494479 () Bool)

(assert (=> b!735823 (=> res!494479 e!411667)))

(declare-fun lt!326247 () (_ BitVec 32))

(assert (=> b!735823 (= res!494479 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!326247 #b00000000000000000000000000000000) (bvsge lt!326247 (size!20191 a!3186))))))

(declare-datatypes ((Unit!25076 0))(
  ( (Unit!25077) )
))
(declare-fun lt!326245 () Unit!25076)

(declare-fun e!411663 () Unit!25076)

(assert (=> b!735823 (= lt!326245 e!411663)))

(declare-fun c!81059 () Bool)

(declare-fun lt!326246 () Bool)

(assert (=> b!735823 (= c!81059 lt!326246)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!735823 (= lt!326246 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735823 (= lt!326247 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!411665 () Bool)

(declare-fun lt!326242 () SeekEntryResult!7370)

(declare-fun b!735824 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41313 (_ BitVec 32)) SeekEntryResult!7370)

(assert (=> b!735824 (= e!411665 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326247 resIntermediateIndex!5 (select (arr!19770 a!3186) j!159) a!3186 mask!3328) lt!326242)))))

(declare-fun b!735825 () Bool)

(declare-fun res!494467 () Bool)

(assert (=> b!735825 (=> res!494467 e!411667)))

(assert (=> b!735825 (= res!494467 e!411665)))

(declare-fun c!81061 () Bool)

(assert (=> b!735825 (= c!81061 lt!326246)))

(declare-fun b!735826 () Bool)

(declare-fun res!494477 () Bool)

(declare-fun e!411670 () Bool)

(assert (=> b!735826 (=> (not res!494477) (not e!411670))))

(assert (=> b!735826 (= res!494477 e!411671)))

(declare-fun c!81060 () Bool)

(assert (=> b!735826 (= c!81060 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!735827 () Bool)

(declare-fun e!411672 () Bool)

(assert (=> b!735827 (= e!411670 e!411672)))

(declare-fun res!494472 () Bool)

(assert (=> b!735827 (=> (not res!494472) (not e!411672))))

(declare-fun lt!326244 () SeekEntryResult!7370)

(declare-fun lt!326249 () SeekEntryResult!7370)

(assert (=> b!735827 (= res!494472 (= lt!326244 lt!326249))))

(declare-fun lt!326243 () array!41313)

(declare-fun lt!326236 () (_ BitVec 64))

(assert (=> b!735827 (= lt!326249 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!326236 lt!326243 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735827 (= lt!326244 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!326236 mask!3328) lt!326236 lt!326243 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!735827 (= lt!326236 (select (store (arr!19770 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!735827 (= lt!326243 (array!41314 (store (arr!19770 a!3186) i!1173 k!2102) (size!20191 a!3186)))))

(declare-fun b!735828 () Bool)

(declare-fun res!494471 () Bool)

(declare-fun e!411669 () Bool)

(assert (=> b!735828 (=> (not res!494471) (not e!411669))))

(assert (=> b!735828 (= res!494471 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20191 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20191 a!3186))))))

(declare-fun b!735830 () Bool)

(declare-fun Unit!25078 () Unit!25076)

(assert (=> b!735830 (= e!411663 Unit!25078)))

(assert (=> b!735830 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326247 (select (arr!19770 a!3186) j!159) a!3186 mask!3328) lt!326238)))

(declare-fun b!735831 () Bool)

(assert (=> b!735831 (= e!411667 true)))

(declare-fun lt!326241 () SeekEntryResult!7370)

(assert (=> b!735831 (= lt!326241 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326247 lt!326236 lt!326243 mask!3328))))

(declare-fun b!735832 () Bool)

(assert (=> b!735832 (= e!411672 (not e!411666))))

(declare-fun res!494468 () Bool)

(assert (=> b!735832 (=> res!494468 e!411666)))

(assert (=> b!735832 (= res!494468 (or (not (is-Intermediate!7370 lt!326249)) (bvsge x!1131 (x!62856 lt!326249))))))

(assert (=> b!735832 (= lt!326242 (Found!7370 j!159))))

(declare-fun e!411668 () Bool)

(assert (=> b!735832 e!411668))

(declare-fun res!494463 () Bool)

(assert (=> b!735832 (=> (not res!494463) (not e!411668))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41313 (_ BitVec 32)) Bool)

(assert (=> b!735832 (= res!494463 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!326239 () Unit!25076)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41313 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25076)

(assert (=> b!735832 (= lt!326239 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!735833 () Bool)

(assert (=> b!735833 (= e!411669 e!411670)))

(declare-fun res!494469 () Bool)

(assert (=> b!735833 (=> (not res!494469) (not e!411670))))

(assert (=> b!735833 (= res!494469 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19770 a!3186) j!159) mask!3328) (select (arr!19770 a!3186) j!159) a!3186 mask!3328) lt!326238))))

(assert (=> b!735833 (= lt!326238 (Intermediate!7370 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!735834 () Bool)

(declare-fun res!494465 () Bool)

(assert (=> b!735834 (=> (not res!494465) (not e!411664))))

(assert (=> b!735834 (= res!494465 (validKeyInArray!0 k!2102))))

(declare-fun lt!326240 () SeekEntryResult!7370)

(declare-fun e!411674 () Bool)

(declare-fun b!735835 () Bool)

(assert (=> b!735835 (= e!411674 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19770 a!3186) j!159) a!3186 mask!3328) lt!326240))))

(declare-fun b!735836 () Bool)

(declare-fun Unit!25079 () Unit!25076)

(assert (=> b!735836 (= e!411663 Unit!25079)))

(declare-fun lt!326248 () SeekEntryResult!7370)

(assert (=> b!735836 (= lt!326248 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19770 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!735836 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326247 resIntermediateIndex!5 (select (arr!19770 a!3186) j!159) a!3186 mask!3328) lt!326242)))

(declare-fun b!735837 () Bool)

(assert (=> b!735837 (= e!411665 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326247 (select (arr!19770 a!3186) j!159) a!3186 mask!3328) lt!326238)))))

(declare-fun b!735838 () Bool)

(declare-fun res!494464 () Bool)

(assert (=> b!735838 (=> (not res!494464) (not e!411670))))

(assert (=> b!735838 (= res!494464 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19770 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!735839 () Bool)

(declare-fun res!494474 () Bool)

(assert (=> b!735839 (=> (not res!494474) (not e!411664))))

(assert (=> b!735839 (= res!494474 (and (= (size!20191 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20191 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20191 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!735829 () Bool)

(assert (=> b!735829 (= e!411668 e!411674)))

(declare-fun res!494478 () Bool)

(assert (=> b!735829 (=> (not res!494478) (not e!411674))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41313 (_ BitVec 32)) SeekEntryResult!7370)

(assert (=> b!735829 (= res!494478 (= (seekEntryOrOpen!0 (select (arr!19770 a!3186) j!159) a!3186 mask!3328) lt!326240))))

(assert (=> b!735829 (= lt!326240 (Found!7370 j!159))))

(declare-fun res!494473 () Bool)

(assert (=> start!65140 (=> (not res!494473) (not e!411664))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65140 (= res!494473 (validMask!0 mask!3328))))

(assert (=> start!65140 e!411664))

(assert (=> start!65140 true))

(declare-fun array_inv!15566 (array!41313) Bool)

(assert (=> start!65140 (array_inv!15566 a!3186)))

(declare-fun b!735840 () Bool)

(declare-fun res!494470 () Bool)

(assert (=> b!735840 (=> (not res!494470) (not e!411669))))

(declare-datatypes ((List!13772 0))(
  ( (Nil!13769) (Cons!13768 (h!14840 (_ BitVec 64)) (t!20087 List!13772)) )
))
(declare-fun arrayNoDuplicates!0 (array!41313 (_ BitVec 32) List!13772) Bool)

(assert (=> b!735840 (= res!494470 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13769))))

(declare-fun b!735841 () Bool)

(assert (=> b!735841 (= e!411664 e!411669)))

(declare-fun res!494475 () Bool)

(assert (=> b!735841 (=> (not res!494475) (not e!411669))))

(declare-fun lt!326237 () SeekEntryResult!7370)

(assert (=> b!735841 (= res!494475 (or (= lt!326237 (MissingZero!7370 i!1173)) (= lt!326237 (MissingVacant!7370 i!1173))))))

(assert (=> b!735841 (= lt!326237 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!735842 () Bool)

(assert (=> b!735842 (= e!411671 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19770 a!3186) j!159) a!3186 mask!3328) (Found!7370 j!159)))))

(declare-fun b!735843 () Bool)

(declare-fun res!494466 () Bool)

(assert (=> b!735843 (=> (not res!494466) (not e!411669))))

(assert (=> b!735843 (= res!494466 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!65140 res!494473) b!735839))

(assert (= (and b!735839 res!494474) b!735821))

(assert (= (and b!735821 res!494476) b!735834))

(assert (= (and b!735834 res!494465) b!735822))

(assert (= (and b!735822 res!494480) b!735841))

(assert (= (and b!735841 res!494475) b!735843))

(assert (= (and b!735843 res!494466) b!735840))

(assert (= (and b!735840 res!494470) b!735828))

(assert (= (and b!735828 res!494471) b!735833))

(assert (= (and b!735833 res!494469) b!735838))

(assert (= (and b!735838 res!494464) b!735826))

(assert (= (and b!735826 c!81060) b!735820))

(assert (= (and b!735826 (not c!81060)) b!735842))

(assert (= (and b!735826 res!494477) b!735827))

(assert (= (and b!735827 res!494472) b!735832))

(assert (= (and b!735832 res!494463) b!735829))

(assert (= (and b!735829 res!494478) b!735835))

(assert (= (and b!735832 (not res!494468)) b!735823))

(assert (= (and b!735823 c!81059) b!735830))

(assert (= (and b!735823 (not c!81059)) b!735836))

(assert (= (and b!735823 (not res!494479)) b!735825))

(assert (= (and b!735825 c!81061) b!735837))

(assert (= (and b!735825 (not c!81061)) b!735824))

(assert (= (and b!735825 (not res!494467)) b!735831))

(declare-fun m!688105 () Bool)

(assert (=> b!735832 m!688105))

(declare-fun m!688107 () Bool)

(assert (=> b!735832 m!688107))

(declare-fun m!688109 () Bool)

(assert (=> b!735827 m!688109))

(assert (=> b!735827 m!688109))

(declare-fun m!688111 () Bool)

(assert (=> b!735827 m!688111))

(declare-fun m!688113 () Bool)

(assert (=> b!735827 m!688113))

(declare-fun m!688115 () Bool)

(assert (=> b!735827 m!688115))

(declare-fun m!688117 () Bool)

(assert (=> b!735827 m!688117))

(declare-fun m!688119 () Bool)

(assert (=> b!735838 m!688119))

(declare-fun m!688121 () Bool)

(assert (=> start!65140 m!688121))

(declare-fun m!688123 () Bool)

(assert (=> start!65140 m!688123))

(declare-fun m!688125 () Bool)

(assert (=> b!735820 m!688125))

(assert (=> b!735820 m!688125))

(declare-fun m!688127 () Bool)

(assert (=> b!735820 m!688127))

(assert (=> b!735842 m!688125))

(assert (=> b!735842 m!688125))

(declare-fun m!688129 () Bool)

(assert (=> b!735842 m!688129))

(assert (=> b!735837 m!688125))

(assert (=> b!735837 m!688125))

(declare-fun m!688131 () Bool)

(assert (=> b!735837 m!688131))

(declare-fun m!688133 () Bool)

(assert (=> b!735823 m!688133))

(declare-fun m!688135 () Bool)

(assert (=> b!735822 m!688135))

(assert (=> b!735830 m!688125))

(assert (=> b!735830 m!688125))

(assert (=> b!735830 m!688131))

(declare-fun m!688137 () Bool)

(assert (=> b!735840 m!688137))

(assert (=> b!735835 m!688125))

(assert (=> b!735835 m!688125))

(declare-fun m!688139 () Bool)

(assert (=> b!735835 m!688139))

(declare-fun m!688141 () Bool)

(assert (=> b!735841 m!688141))

(assert (=> b!735821 m!688125))

(assert (=> b!735821 m!688125))

(declare-fun m!688143 () Bool)

(assert (=> b!735821 m!688143))

(declare-fun m!688145 () Bool)

(assert (=> b!735831 m!688145))

(assert (=> b!735836 m!688125))

(assert (=> b!735836 m!688125))

(assert (=> b!735836 m!688129))

(assert (=> b!735836 m!688125))

(declare-fun m!688147 () Bool)

(assert (=> b!735836 m!688147))

(declare-fun m!688149 () Bool)

(assert (=> b!735843 m!688149))

(assert (=> b!735833 m!688125))

(assert (=> b!735833 m!688125))

(declare-fun m!688151 () Bool)

(assert (=> b!735833 m!688151))

(assert (=> b!735833 m!688151))

(assert (=> b!735833 m!688125))

(declare-fun m!688153 () Bool)

(assert (=> b!735833 m!688153))

(declare-fun m!688155 () Bool)

(assert (=> b!735834 m!688155))

(assert (=> b!735824 m!688125))

(assert (=> b!735824 m!688125))

(assert (=> b!735824 m!688147))

(assert (=> b!735829 m!688125))

(assert (=> b!735829 m!688125))

(declare-fun m!688157 () Bool)

(assert (=> b!735829 m!688157))

(push 1)

