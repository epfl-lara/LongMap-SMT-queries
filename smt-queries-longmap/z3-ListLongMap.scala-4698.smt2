; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65376 () Bool)

(assert start!65376)

(declare-fun b!740453 () Bool)

(declare-fun res!497690 () Bool)

(declare-fun e!414094 () Bool)

(assert (=> b!740453 (=> (not res!497690) (not e!414094))))

(declare-datatypes ((array!41419 0))(
  ( (array!41420 (arr!19819 (Array (_ BitVec 32) (_ BitVec 64))) (size!20239 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41419)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!740453 (= res!497690 (validKeyInArray!0 (select (arr!19819 a!3186) j!159)))))

(declare-fun b!740454 () Bool)

(declare-fun e!414092 () Bool)

(declare-fun e!414091 () Bool)

(assert (=> b!740454 (= e!414092 e!414091)))

(declare-fun res!497686 () Bool)

(assert (=> b!740454 (=> res!497686 e!414091)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!328827 () (_ BitVec 32))

(assert (=> b!740454 (= res!497686 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!328827 #b00000000000000000000000000000000) (bvsge lt!328827 (size!20239 a!3186))))))

(declare-datatypes ((Unit!25273 0))(
  ( (Unit!25274) )
))
(declare-fun lt!328824 () Unit!25273)

(declare-fun e!414085 () Unit!25273)

(assert (=> b!740454 (= lt!328824 e!414085)))

(declare-fun c!81769 () Bool)

(declare-fun lt!328826 () Bool)

(assert (=> b!740454 (= c!81769 lt!328826)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!740454 (= lt!328826 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740454 (= lt!328827 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!740455 () Bool)

(declare-fun e!414089 () Bool)

(declare-fun e!414088 () Bool)

(assert (=> b!740455 (= e!414089 e!414088)))

(declare-fun res!497691 () Bool)

(assert (=> b!740455 (=> (not res!497691) (not e!414088))))

(declare-datatypes ((SeekEntryResult!7375 0))(
  ( (MissingZero!7375 (index!31868 (_ BitVec 32))) (Found!7375 (index!31869 (_ BitVec 32))) (Intermediate!7375 (undefined!8187 Bool) (index!31870 (_ BitVec 32)) (x!63017 (_ BitVec 32))) (Undefined!7375) (MissingVacant!7375 (index!31871 (_ BitVec 32))) )
))
(declare-fun lt!328822 () SeekEntryResult!7375)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41419 (_ BitVec 32)) SeekEntryResult!7375)

(assert (=> b!740455 (= res!497691 (= (seekEntryOrOpen!0 (select (arr!19819 a!3186) j!159) a!3186 mask!3328) lt!328822))))

(assert (=> b!740455 (= lt!328822 (Found!7375 j!159))))

(declare-fun b!740456 () Bool)

(declare-fun res!497696 () Bool)

(declare-fun e!414093 () Bool)

(assert (=> b!740456 (=> (not res!497696) (not e!414093))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!740456 (= res!497696 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19819 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!740457 () Bool)

(declare-fun res!497689 () Bool)

(assert (=> b!740457 (=> (not res!497689) (not e!414094))))

(assert (=> b!740457 (= res!497689 (and (= (size!20239 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20239 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20239 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!740459 () Bool)

(declare-fun res!497695 () Bool)

(assert (=> b!740459 (=> (not res!497695) (not e!414094))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41419 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!740459 (= res!497695 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun e!414090 () Bool)

(declare-fun b!740460 () Bool)

(declare-fun lt!328820 () SeekEntryResult!7375)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41419 (_ BitVec 32)) SeekEntryResult!7375)

(assert (=> b!740460 (= e!414090 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328827 (select (arr!19819 a!3186) j!159) a!3186 mask!3328) lt!328820)))))

(declare-fun b!740461 () Bool)

(assert (=> b!740461 (= e!414091 true)))

(declare-fun lt!328821 () array!41419)

(declare-fun lt!328823 () (_ BitVec 64))

(declare-fun lt!328830 () SeekEntryResult!7375)

(assert (=> b!740461 (= lt!328830 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328827 lt!328823 lt!328821 mask!3328))))

(declare-fun b!740462 () Bool)

(declare-fun res!497694 () Bool)

(declare-fun e!414087 () Bool)

(assert (=> b!740462 (=> (not res!497694) (not e!414087))))

(assert (=> b!740462 (= res!497694 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20239 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20239 a!3186))))))

(declare-fun b!740463 () Bool)

(assert (=> b!740463 (= e!414094 e!414087)))

(declare-fun res!497697 () Bool)

(assert (=> b!740463 (=> (not res!497697) (not e!414087))))

(declare-fun lt!328828 () SeekEntryResult!7375)

(assert (=> b!740463 (= res!497697 (or (= lt!328828 (MissingZero!7375 i!1173)) (= lt!328828 (MissingVacant!7375 i!1173))))))

(assert (=> b!740463 (= lt!328828 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!740464 () Bool)

(declare-fun res!497693 () Bool)

(assert (=> b!740464 (=> (not res!497693) (not e!414093))))

(declare-fun e!414096 () Bool)

(assert (=> b!740464 (= res!497693 e!414096)))

(declare-fun c!81770 () Bool)

(assert (=> b!740464 (= c!81770 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!740465 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41419 (_ BitVec 32)) SeekEntryResult!7375)

(assert (=> b!740465 (= e!414088 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19819 a!3186) j!159) a!3186 mask!3328) lt!328822))))

(declare-fun b!740466 () Bool)

(assert (=> b!740466 (= e!414087 e!414093)))

(declare-fun res!497685 () Bool)

(assert (=> b!740466 (=> (not res!497685) (not e!414093))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740466 (= res!497685 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19819 a!3186) j!159) mask!3328) (select (arr!19819 a!3186) j!159) a!3186 mask!3328) lt!328820))))

(assert (=> b!740466 (= lt!328820 (Intermediate!7375 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!497692 () Bool)

(assert (=> start!65376 (=> (not res!497692) (not e!414094))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65376 (= res!497692 (validMask!0 mask!3328))))

(assert (=> start!65376 e!414094))

(assert (=> start!65376 true))

(declare-fun array_inv!15678 (array!41419) Bool)

(assert (=> start!65376 (array_inv!15678 a!3186)))

(declare-fun b!740458 () Bool)

(assert (=> b!740458 (= e!414096 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19819 a!3186) j!159) a!3186 mask!3328) (Found!7375 j!159)))))

(declare-fun b!740467 () Bool)

(assert (=> b!740467 (= e!414096 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19819 a!3186) j!159) a!3186 mask!3328) lt!328820))))

(declare-fun b!740468 () Bool)

(declare-fun Unit!25275 () Unit!25273)

(assert (=> b!740468 (= e!414085 Unit!25275)))

(declare-fun lt!328817 () SeekEntryResult!7375)

(assert (=> b!740468 (= lt!328817 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19819 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!328819 () SeekEntryResult!7375)

(assert (=> b!740468 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328827 resIntermediateIndex!5 (select (arr!19819 a!3186) j!159) a!3186 mask!3328) lt!328819)))

(declare-fun b!740469 () Bool)

(assert (=> b!740469 (= e!414090 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328827 resIntermediateIndex!5 (select (arr!19819 a!3186) j!159) a!3186 mask!3328) lt!328819)))))

(declare-fun b!740470 () Bool)

(declare-fun res!497688 () Bool)

(assert (=> b!740470 (=> (not res!497688) (not e!414087))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41419 (_ BitVec 32)) Bool)

(assert (=> b!740470 (= res!497688 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!740471 () Bool)

(declare-fun res!497684 () Bool)

(assert (=> b!740471 (=> res!497684 e!414091)))

(assert (=> b!740471 (= res!497684 e!414090)))

(declare-fun c!81768 () Bool)

(assert (=> b!740471 (= c!81768 lt!328826)))

(declare-fun b!740472 () Bool)

(declare-fun e!414086 () Bool)

(assert (=> b!740472 (= e!414093 e!414086)))

(declare-fun res!497698 () Bool)

(assert (=> b!740472 (=> (not res!497698) (not e!414086))))

(declare-fun lt!328818 () SeekEntryResult!7375)

(declare-fun lt!328829 () SeekEntryResult!7375)

(assert (=> b!740472 (= res!497698 (= lt!328818 lt!328829))))

(assert (=> b!740472 (= lt!328829 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!328823 lt!328821 mask!3328))))

(assert (=> b!740472 (= lt!328818 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!328823 mask!3328) lt!328823 lt!328821 mask!3328))))

(assert (=> b!740472 (= lt!328823 (select (store (arr!19819 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!740472 (= lt!328821 (array!41420 (store (arr!19819 a!3186) i!1173 k0!2102) (size!20239 a!3186)))))

(declare-fun b!740473 () Bool)

(declare-fun res!497701 () Bool)

(assert (=> b!740473 (=> (not res!497701) (not e!414087))))

(declare-datatypes ((List!13728 0))(
  ( (Nil!13725) (Cons!13724 (h!14802 (_ BitVec 64)) (t!20035 List!13728)) )
))
(declare-fun arrayNoDuplicates!0 (array!41419 (_ BitVec 32) List!13728) Bool)

(assert (=> b!740473 (= res!497701 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13725))))

(declare-fun b!740474 () Bool)

(assert (=> b!740474 (= e!414086 (not e!414092))))

(declare-fun res!497700 () Bool)

(assert (=> b!740474 (=> res!497700 e!414092)))

(get-info :version)

(assert (=> b!740474 (= res!497700 (or (not ((_ is Intermediate!7375) lt!328829)) (bvsge x!1131 (x!63017 lt!328829))))))

(assert (=> b!740474 (= lt!328819 (Found!7375 j!159))))

(assert (=> b!740474 e!414089))

(declare-fun res!497687 () Bool)

(assert (=> b!740474 (=> (not res!497687) (not e!414089))))

(assert (=> b!740474 (= res!497687 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!328825 () Unit!25273)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41419 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25273)

(assert (=> b!740474 (= lt!328825 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!740475 () Bool)

(declare-fun Unit!25276 () Unit!25273)

(assert (=> b!740475 (= e!414085 Unit!25276)))

(assert (=> b!740475 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328827 (select (arr!19819 a!3186) j!159) a!3186 mask!3328) lt!328820)))

(declare-fun b!740476 () Bool)

(declare-fun res!497699 () Bool)

(assert (=> b!740476 (=> (not res!497699) (not e!414094))))

(assert (=> b!740476 (= res!497699 (validKeyInArray!0 k0!2102))))

(assert (= (and start!65376 res!497692) b!740457))

(assert (= (and b!740457 res!497689) b!740453))

(assert (= (and b!740453 res!497690) b!740476))

(assert (= (and b!740476 res!497699) b!740459))

(assert (= (and b!740459 res!497695) b!740463))

(assert (= (and b!740463 res!497697) b!740470))

(assert (= (and b!740470 res!497688) b!740473))

(assert (= (and b!740473 res!497701) b!740462))

(assert (= (and b!740462 res!497694) b!740466))

(assert (= (and b!740466 res!497685) b!740456))

(assert (= (and b!740456 res!497696) b!740464))

(assert (= (and b!740464 c!81770) b!740467))

(assert (= (and b!740464 (not c!81770)) b!740458))

(assert (= (and b!740464 res!497693) b!740472))

(assert (= (and b!740472 res!497698) b!740474))

(assert (= (and b!740474 res!497687) b!740455))

(assert (= (and b!740455 res!497691) b!740465))

(assert (= (and b!740474 (not res!497700)) b!740454))

(assert (= (and b!740454 c!81769) b!740475))

(assert (= (and b!740454 (not c!81769)) b!740468))

(assert (= (and b!740454 (not res!497686)) b!740471))

(assert (= (and b!740471 c!81768) b!740460))

(assert (= (and b!740471 (not c!81768)) b!740469))

(assert (= (and b!740471 (not res!497684)) b!740461))

(declare-fun m!692181 () Bool)

(assert (=> b!740453 m!692181))

(assert (=> b!740453 m!692181))

(declare-fun m!692183 () Bool)

(assert (=> b!740453 m!692183))

(assert (=> b!740460 m!692181))

(assert (=> b!740460 m!692181))

(declare-fun m!692185 () Bool)

(assert (=> b!740460 m!692185))

(assert (=> b!740466 m!692181))

(assert (=> b!740466 m!692181))

(declare-fun m!692187 () Bool)

(assert (=> b!740466 m!692187))

(assert (=> b!740466 m!692187))

(assert (=> b!740466 m!692181))

(declare-fun m!692189 () Bool)

(assert (=> b!740466 m!692189))

(assert (=> b!740467 m!692181))

(assert (=> b!740467 m!692181))

(declare-fun m!692191 () Bool)

(assert (=> b!740467 m!692191))

(declare-fun m!692193 () Bool)

(assert (=> b!740470 m!692193))

(declare-fun m!692195 () Bool)

(assert (=> b!740463 m!692195))

(assert (=> b!740468 m!692181))

(assert (=> b!740468 m!692181))

(declare-fun m!692197 () Bool)

(assert (=> b!740468 m!692197))

(assert (=> b!740468 m!692181))

(declare-fun m!692199 () Bool)

(assert (=> b!740468 m!692199))

(declare-fun m!692201 () Bool)

(assert (=> b!740472 m!692201))

(declare-fun m!692203 () Bool)

(assert (=> b!740472 m!692203))

(declare-fun m!692205 () Bool)

(assert (=> b!740472 m!692205))

(declare-fun m!692207 () Bool)

(assert (=> b!740472 m!692207))

(declare-fun m!692209 () Bool)

(assert (=> b!740472 m!692209))

(assert (=> b!740472 m!692205))

(declare-fun m!692211 () Bool)

(assert (=> b!740456 m!692211))

(assert (=> b!740465 m!692181))

(assert (=> b!740465 m!692181))

(declare-fun m!692213 () Bool)

(assert (=> b!740465 m!692213))

(declare-fun m!692215 () Bool)

(assert (=> b!740461 m!692215))

(declare-fun m!692217 () Bool)

(assert (=> b!740473 m!692217))

(declare-fun m!692219 () Bool)

(assert (=> b!740474 m!692219))

(declare-fun m!692221 () Bool)

(assert (=> b!740474 m!692221))

(declare-fun m!692223 () Bool)

(assert (=> b!740454 m!692223))

(declare-fun m!692225 () Bool)

(assert (=> b!740459 m!692225))

(declare-fun m!692227 () Bool)

(assert (=> start!65376 m!692227))

(declare-fun m!692229 () Bool)

(assert (=> start!65376 m!692229))

(assert (=> b!740469 m!692181))

(assert (=> b!740469 m!692181))

(assert (=> b!740469 m!692199))

(assert (=> b!740475 m!692181))

(assert (=> b!740475 m!692181))

(assert (=> b!740475 m!692185))

(assert (=> b!740455 m!692181))

(assert (=> b!740455 m!692181))

(declare-fun m!692231 () Bool)

(assert (=> b!740455 m!692231))

(assert (=> b!740458 m!692181))

(assert (=> b!740458 m!692181))

(assert (=> b!740458 m!692197))

(declare-fun m!692233 () Bool)

(assert (=> b!740476 m!692233))

(check-sat (not b!740467) (not b!740453) (not b!740466) (not b!740455) (not b!740472) (not b!740468) (not b!740460) (not b!740458) (not start!65376) (not b!740469) (not b!740454) (not b!740473) (not b!740474) (not b!740476) (not b!740465) (not b!740463) (not b!740470) (not b!740475) (not b!740459) (not b!740461))
(check-sat)
