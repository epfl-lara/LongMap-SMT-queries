; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65250 () Bool)

(assert start!65250)

(declare-fun b!739780 () Bool)

(declare-fun res!497437 () Bool)

(declare-fun e!413648 () Bool)

(assert (=> b!739780 (=> (not res!497437) (not e!413648))))

(declare-datatypes ((array!41423 0))(
  ( (array!41424 (arr!19825 (Array (_ BitVec 32) (_ BitVec 64))) (size!20246 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41423)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!739780 (= res!497437 (and (= (size!20246 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20246 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20246 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!739781 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!413651 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7425 0))(
  ( (MissingZero!7425 (index!32068 (_ BitVec 32))) (Found!7425 (index!32069 (_ BitVec 32))) (Intermediate!7425 (undefined!8237 Bool) (index!32070 (_ BitVec 32)) (x!63055 (_ BitVec 32))) (Undefined!7425) (MissingVacant!7425 (index!32071 (_ BitVec 32))) )
))
(declare-fun lt!328557 () SeekEntryResult!7425)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41423 (_ BitVec 32)) SeekEntryResult!7425)

(assert (=> b!739781 (= e!413651 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19825 a!3186) j!159) a!3186 mask!3328) lt!328557))))

(declare-fun b!739782 () Bool)

(declare-fun res!497446 () Bool)

(assert (=> b!739782 (=> (not res!497446) (not e!413648))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41423 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!739782 (= res!497446 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!739783 () Bool)

(declare-fun res!497444 () Bool)

(declare-fun e!413650 () Bool)

(assert (=> b!739783 (=> (not res!497444) (not e!413650))))

(declare-fun e!413643 () Bool)

(assert (=> b!739783 (= res!497444 e!413643)))

(declare-fun c!81554 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!739783 (= c!81554 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!739785 () Bool)

(declare-fun e!413646 () Bool)

(declare-fun lt!328552 () (_ BitVec 32))

(declare-fun lt!328555 () SeekEntryResult!7425)

(assert (=> b!739785 (= e!413646 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328552 resIntermediateIndex!5 (select (arr!19825 a!3186) j!159) a!3186 mask!3328) lt!328555)))))

(declare-fun b!739786 () Bool)

(declare-fun e!413644 () Bool)

(assert (=> b!739786 (= e!413648 e!413644)))

(declare-fun res!497443 () Bool)

(assert (=> b!739786 (=> (not res!497443) (not e!413644))))

(declare-fun lt!328551 () SeekEntryResult!7425)

(assert (=> b!739786 (= res!497443 (or (= lt!328551 (MissingZero!7425 i!1173)) (= lt!328551 (MissingVacant!7425 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41423 (_ BitVec 32)) SeekEntryResult!7425)

(assert (=> b!739786 (= lt!328551 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!739787 () Bool)

(declare-fun res!497433 () Bool)

(assert (=> b!739787 (=> (not res!497433) (not e!413644))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!739787 (= res!497433 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20246 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20246 a!3186))))))

(declare-fun lt!328550 () SeekEntryResult!7425)

(declare-fun b!739788 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41423 (_ BitVec 32)) SeekEntryResult!7425)

(assert (=> b!739788 (= e!413643 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19825 a!3186) j!159) a!3186 mask!3328) lt!328550))))

(declare-fun b!739789 () Bool)

(declare-fun e!413647 () Bool)

(declare-fun e!413654 () Bool)

(assert (=> b!739789 (= e!413647 (not e!413654))))

(declare-fun res!497445 () Bool)

(assert (=> b!739789 (=> res!497445 e!413654)))

(declare-fun lt!328554 () SeekEntryResult!7425)

(get-info :version)

(assert (=> b!739789 (= res!497445 (or (not ((_ is Intermediate!7425) lt!328554)) (bvsge x!1131 (x!63055 lt!328554))))))

(assert (=> b!739789 (= lt!328555 (Found!7425 j!159))))

(declare-fun e!413645 () Bool)

(assert (=> b!739789 e!413645))

(declare-fun res!497447 () Bool)

(assert (=> b!739789 (=> (not res!497447) (not e!413645))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41423 (_ BitVec 32)) Bool)

(assert (=> b!739789 (= res!497447 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25296 0))(
  ( (Unit!25297) )
))
(declare-fun lt!328548 () Unit!25296)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41423 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25296)

(assert (=> b!739789 (= lt!328548 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!739790 () Bool)

(declare-fun res!497440 () Bool)

(assert (=> b!739790 (=> (not res!497440) (not e!413648))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!739790 (= res!497440 (validKeyInArray!0 k0!2102))))

(declare-fun b!739791 () Bool)

(declare-fun res!497442 () Bool)

(assert (=> b!739791 (=> (not res!497442) (not e!413650))))

(assert (=> b!739791 (= res!497442 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19825 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!739784 () Bool)

(declare-fun res!497448 () Bool)

(assert (=> b!739784 (=> (not res!497448) (not e!413644))))

(declare-datatypes ((List!13827 0))(
  ( (Nil!13824) (Cons!13823 (h!14895 (_ BitVec 64)) (t!20142 List!13827)) )
))
(declare-fun arrayNoDuplicates!0 (array!41423 (_ BitVec 32) List!13827) Bool)

(assert (=> b!739784 (= res!497448 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13824))))

(declare-fun res!497438 () Bool)

(assert (=> start!65250 (=> (not res!497438) (not e!413648))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65250 (= res!497438 (validMask!0 mask!3328))))

(assert (=> start!65250 e!413648))

(assert (=> start!65250 true))

(declare-fun array_inv!15621 (array!41423) Bool)

(assert (=> start!65250 (array_inv!15621 a!3186)))

(declare-fun b!739792 () Bool)

(assert (=> b!739792 (= e!413645 e!413651)))

(declare-fun res!497449 () Bool)

(assert (=> b!739792 (=> (not res!497449) (not e!413651))))

(assert (=> b!739792 (= res!497449 (= (seekEntryOrOpen!0 (select (arr!19825 a!3186) j!159) a!3186 mask!3328) lt!328557))))

(assert (=> b!739792 (= lt!328557 (Found!7425 j!159))))

(declare-fun b!739793 () Bool)

(declare-fun e!413652 () Bool)

(assert (=> b!739793 (= e!413652 true)))

(declare-fun lt!328559 () array!41423)

(declare-fun lt!328546 () (_ BitVec 64))

(declare-fun lt!328549 () SeekEntryResult!7425)

(assert (=> b!739793 (= lt!328549 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328552 lt!328546 lt!328559 mask!3328))))

(declare-fun b!739794 () Bool)

(declare-fun res!497435 () Bool)

(assert (=> b!739794 (=> (not res!497435) (not e!413648))))

(assert (=> b!739794 (= res!497435 (validKeyInArray!0 (select (arr!19825 a!3186) j!159)))))

(declare-fun b!739795 () Bool)

(assert (=> b!739795 (= e!413644 e!413650)))

(declare-fun res!497441 () Bool)

(assert (=> b!739795 (=> (not res!497441) (not e!413650))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739795 (= res!497441 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19825 a!3186) j!159) mask!3328) (select (arr!19825 a!3186) j!159) a!3186 mask!3328) lt!328550))))

(assert (=> b!739795 (= lt!328550 (Intermediate!7425 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!739796 () Bool)

(declare-fun e!413649 () Unit!25296)

(declare-fun Unit!25298 () Unit!25296)

(assert (=> b!739796 (= e!413649 Unit!25298)))

(assert (=> b!739796 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328552 (select (arr!19825 a!3186) j!159) a!3186 mask!3328) lt!328550)))

(declare-fun b!739797 () Bool)

(declare-fun res!497439 () Bool)

(assert (=> b!739797 (=> res!497439 e!413652)))

(assert (=> b!739797 (= res!497439 e!413646)))

(declare-fun c!81556 () Bool)

(declare-fun lt!328547 () Bool)

(assert (=> b!739797 (= c!81556 lt!328547)))

(declare-fun b!739798 () Bool)

(assert (=> b!739798 (= e!413650 e!413647)))

(declare-fun res!497450 () Bool)

(assert (=> b!739798 (=> (not res!497450) (not e!413647))))

(declare-fun lt!328553 () SeekEntryResult!7425)

(assert (=> b!739798 (= res!497450 (= lt!328553 lt!328554))))

(assert (=> b!739798 (= lt!328554 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!328546 lt!328559 mask!3328))))

(assert (=> b!739798 (= lt!328553 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!328546 mask!3328) lt!328546 lt!328559 mask!3328))))

(assert (=> b!739798 (= lt!328546 (select (store (arr!19825 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!739798 (= lt!328559 (array!41424 (store (arr!19825 a!3186) i!1173 k0!2102) (size!20246 a!3186)))))

(declare-fun b!739799 () Bool)

(assert (=> b!739799 (= e!413646 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328552 (select (arr!19825 a!3186) j!159) a!3186 mask!3328) lt!328550)))))

(declare-fun b!739800 () Bool)

(declare-fun Unit!25299 () Unit!25296)

(assert (=> b!739800 (= e!413649 Unit!25299)))

(declare-fun lt!328558 () SeekEntryResult!7425)

(assert (=> b!739800 (= lt!328558 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19825 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!739800 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328552 resIntermediateIndex!5 (select (arr!19825 a!3186) j!159) a!3186 mask!3328) lt!328555)))

(declare-fun b!739801 () Bool)

(assert (=> b!739801 (= e!413643 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19825 a!3186) j!159) a!3186 mask!3328) (Found!7425 j!159)))))

(declare-fun b!739802 () Bool)

(assert (=> b!739802 (= e!413654 e!413652)))

(declare-fun res!497434 () Bool)

(assert (=> b!739802 (=> res!497434 e!413652)))

(assert (=> b!739802 (= res!497434 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!328552 #b00000000000000000000000000000000) (bvsge lt!328552 (size!20246 a!3186))))))

(declare-fun lt!328556 () Unit!25296)

(assert (=> b!739802 (= lt!328556 e!413649)))

(declare-fun c!81555 () Bool)

(assert (=> b!739802 (= c!81555 lt!328547)))

(assert (=> b!739802 (= lt!328547 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739802 (= lt!328552 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!739803 () Bool)

(declare-fun res!497436 () Bool)

(assert (=> b!739803 (=> (not res!497436) (not e!413644))))

(assert (=> b!739803 (= res!497436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!65250 res!497438) b!739780))

(assert (= (and b!739780 res!497437) b!739794))

(assert (= (and b!739794 res!497435) b!739790))

(assert (= (and b!739790 res!497440) b!739782))

(assert (= (and b!739782 res!497446) b!739786))

(assert (= (and b!739786 res!497443) b!739803))

(assert (= (and b!739803 res!497436) b!739784))

(assert (= (and b!739784 res!497448) b!739787))

(assert (= (and b!739787 res!497433) b!739795))

(assert (= (and b!739795 res!497441) b!739791))

(assert (= (and b!739791 res!497442) b!739783))

(assert (= (and b!739783 c!81554) b!739788))

(assert (= (and b!739783 (not c!81554)) b!739801))

(assert (= (and b!739783 res!497444) b!739798))

(assert (= (and b!739798 res!497450) b!739789))

(assert (= (and b!739789 res!497447) b!739792))

(assert (= (and b!739792 res!497449) b!739781))

(assert (= (and b!739789 (not res!497445)) b!739802))

(assert (= (and b!739802 c!81555) b!739796))

(assert (= (and b!739802 (not c!81555)) b!739800))

(assert (= (and b!739802 (not res!497434)) b!739797))

(assert (= (and b!739797 c!81556) b!739799))

(assert (= (and b!739797 (not c!81556)) b!739785))

(assert (= (and b!739797 (not res!497439)) b!739793))

(declare-fun m!691075 () Bool)

(assert (=> b!739795 m!691075))

(assert (=> b!739795 m!691075))

(declare-fun m!691077 () Bool)

(assert (=> b!739795 m!691077))

(assert (=> b!739795 m!691077))

(assert (=> b!739795 m!691075))

(declare-fun m!691079 () Bool)

(assert (=> b!739795 m!691079))

(assert (=> b!739792 m!691075))

(assert (=> b!739792 m!691075))

(declare-fun m!691081 () Bool)

(assert (=> b!739792 m!691081))

(declare-fun m!691083 () Bool)

(assert (=> b!739786 m!691083))

(assert (=> b!739801 m!691075))

(assert (=> b!739801 m!691075))

(declare-fun m!691085 () Bool)

(assert (=> b!739801 m!691085))

(declare-fun m!691087 () Bool)

(assert (=> b!739803 m!691087))

(declare-fun m!691089 () Bool)

(assert (=> start!65250 m!691089))

(declare-fun m!691091 () Bool)

(assert (=> start!65250 m!691091))

(assert (=> b!739781 m!691075))

(assert (=> b!739781 m!691075))

(declare-fun m!691093 () Bool)

(assert (=> b!739781 m!691093))

(assert (=> b!739800 m!691075))

(assert (=> b!739800 m!691075))

(assert (=> b!739800 m!691085))

(assert (=> b!739800 m!691075))

(declare-fun m!691095 () Bool)

(assert (=> b!739800 m!691095))

(declare-fun m!691097 () Bool)

(assert (=> b!739789 m!691097))

(declare-fun m!691099 () Bool)

(assert (=> b!739789 m!691099))

(assert (=> b!739785 m!691075))

(assert (=> b!739785 m!691075))

(assert (=> b!739785 m!691095))

(declare-fun m!691101 () Bool)

(assert (=> b!739793 m!691101))

(assert (=> b!739794 m!691075))

(assert (=> b!739794 m!691075))

(declare-fun m!691103 () Bool)

(assert (=> b!739794 m!691103))

(assert (=> b!739796 m!691075))

(assert (=> b!739796 m!691075))

(declare-fun m!691105 () Bool)

(assert (=> b!739796 m!691105))

(declare-fun m!691107 () Bool)

(assert (=> b!739802 m!691107))

(declare-fun m!691109 () Bool)

(assert (=> b!739790 m!691109))

(declare-fun m!691111 () Bool)

(assert (=> b!739784 m!691111))

(declare-fun m!691113 () Bool)

(assert (=> b!739798 m!691113))

(declare-fun m!691115 () Bool)

(assert (=> b!739798 m!691115))

(declare-fun m!691117 () Bool)

(assert (=> b!739798 m!691117))

(declare-fun m!691119 () Bool)

(assert (=> b!739798 m!691119))

(assert (=> b!739798 m!691117))

(declare-fun m!691121 () Bool)

(assert (=> b!739798 m!691121))

(declare-fun m!691123 () Bool)

(assert (=> b!739782 m!691123))

(declare-fun m!691125 () Bool)

(assert (=> b!739791 m!691125))

(assert (=> b!739799 m!691075))

(assert (=> b!739799 m!691075))

(assert (=> b!739799 m!691105))

(assert (=> b!739788 m!691075))

(assert (=> b!739788 m!691075))

(declare-fun m!691127 () Bool)

(assert (=> b!739788 m!691127))

(check-sat (not b!739798) (not b!739799) (not b!739785) (not b!739793) (not b!739796) (not b!739784) (not b!739800) (not b!739803) (not b!739792) (not b!739794) (not b!739795) (not b!739802) (not b!739786) (not b!739782) (not b!739788) (not start!65250) (not b!739781) (not b!739790) (not b!739801) (not b!739789))
(check-sat)
