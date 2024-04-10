; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45648 () Bool)

(assert start!45648)

(declare-fun b!503452 () Bool)

(declare-fun e!294837 () Bool)

(declare-fun e!294829 () Bool)

(assert (=> b!503452 (= e!294837 (not e!294829))))

(declare-fun res!304755 () Bool)

(assert (=> b!503452 (=> res!304755 e!294829)))

(declare-fun lt!229042 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!229040 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4049 0))(
  ( (MissingZero!4049 (index!18384 (_ BitVec 32))) (Found!4049 (index!18385 (_ BitVec 32))) (Intermediate!4049 (undefined!4861 Bool) (index!18386 (_ BitVec 32)) (x!47410 (_ BitVec 32))) (Undefined!4049) (MissingVacant!4049 (index!18387 (_ BitVec 32))) )
))
(declare-fun lt!229032 () SeekEntryResult!4049)

(declare-datatypes ((array!32404 0))(
  ( (array!32405 (arr!15582 (Array (_ BitVec 32) (_ BitVec 64))) (size!15946 (_ BitVec 32))) )
))
(declare-fun lt!229041 () array!32404)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32404 (_ BitVec 32)) SeekEntryResult!4049)

(assert (=> b!503452 (= res!304755 (= lt!229032 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229042 lt!229040 lt!229041 mask!3524)))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!229036 () (_ BitVec 32))

(declare-fun a!3235 () array!32404)

(assert (=> b!503452 (= lt!229032 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229036 (select (arr!15582 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!503452 (= lt!229042 (toIndex!0 lt!229040 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!503452 (= lt!229040 (select (store (arr!15582 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!503452 (= lt!229036 (toIndex!0 (select (arr!15582 a!3235) j!176) mask!3524))))

(assert (=> b!503452 (= lt!229041 (array!32405 (store (arr!15582 a!3235) i!1204 k!2280) (size!15946 a!3235)))))

(declare-fun e!294835 () Bool)

(assert (=> b!503452 e!294835))

(declare-fun res!304759 () Bool)

(assert (=> b!503452 (=> (not res!304759) (not e!294835))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32404 (_ BitVec 32)) Bool)

(assert (=> b!503452 (= res!304759 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15272 0))(
  ( (Unit!15273) )
))
(declare-fun lt!229038 () Unit!15272)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32404 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15272)

(assert (=> b!503452 (= lt!229038 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!503453 () Bool)

(declare-fun res!304754 () Bool)

(assert (=> b!503453 (=> res!304754 e!294829)))

(assert (=> b!503453 (= res!304754 (or (undefined!4861 lt!229032) (not (is-Intermediate!4049 lt!229032))))))

(declare-fun b!503454 () Bool)

(declare-fun res!304762 () Bool)

(assert (=> b!503454 (=> (not res!304762) (not e!294837))))

(assert (=> b!503454 (= res!304762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!503455 () Bool)

(declare-fun res!304751 () Bool)

(declare-fun e!294836 () Bool)

(assert (=> b!503455 (=> (not res!304751) (not e!294836))))

(assert (=> b!503455 (= res!304751 (and (= (size!15946 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15946 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15946 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!503456 () Bool)

(declare-fun e!294833 () Bool)

(assert (=> b!503456 (= e!294833 true)))

(declare-fun lt!229034 () SeekEntryResult!4049)

(assert (=> b!503456 (= lt!229034 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229036 lt!229040 lt!229041 mask!3524))))

(declare-fun b!503457 () Bool)

(declare-fun res!304749 () Bool)

(assert (=> b!503457 (=> (not res!304749) (not e!294836))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!503457 (= res!304749 (validKeyInArray!0 k!2280))))

(declare-fun res!304757 () Bool)

(assert (=> start!45648 (=> (not res!304757) (not e!294836))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45648 (= res!304757 (validMask!0 mask!3524))))

(assert (=> start!45648 e!294836))

(assert (=> start!45648 true))

(declare-fun array_inv!11378 (array!32404) Bool)

(assert (=> start!45648 (array_inv!11378 a!3235)))

(declare-fun b!503458 () Bool)

(declare-fun e!294830 () Bool)

(assert (=> b!503458 (= e!294830 false)))

(declare-fun b!503459 () Bool)

(declare-fun e!294834 () Unit!15272)

(declare-fun Unit!15274 () Unit!15272)

(assert (=> b!503459 (= e!294834 Unit!15274)))

(declare-fun lt!229039 () Unit!15272)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32404 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15272)

(assert (=> b!503459 (= lt!229039 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!229036 #b00000000000000000000000000000000 (index!18386 lt!229032) (x!47410 lt!229032) mask!3524))))

(declare-fun res!304760 () Bool)

(assert (=> b!503459 (= res!304760 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229036 lt!229040 lt!229041 mask!3524) (Intermediate!4049 false (index!18386 lt!229032) (x!47410 lt!229032))))))

(assert (=> b!503459 (=> (not res!304760) (not e!294830))))

(assert (=> b!503459 e!294830))

(declare-fun e!294832 () Bool)

(declare-fun b!503460 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32404 (_ BitVec 32)) SeekEntryResult!4049)

(assert (=> b!503460 (= e!294832 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229036 (index!18386 lt!229032) (select (arr!15582 a!3235) j!176) a!3235 mask!3524) (Found!4049 j!176))))))

(declare-fun b!503461 () Bool)

(assert (=> b!503461 (= e!294829 e!294833)))

(declare-fun res!304758 () Bool)

(assert (=> b!503461 (=> res!304758 e!294833)))

(assert (=> b!503461 (= res!304758 (or (bvsgt (x!47410 lt!229032) #b01111111111111111111111111111110) (bvslt lt!229036 #b00000000000000000000000000000000) (bvsge lt!229036 (size!15946 a!3235)) (bvslt (index!18386 lt!229032) #b00000000000000000000000000000000) (bvsge (index!18386 lt!229032) (size!15946 a!3235)) (not (= lt!229032 (Intermediate!4049 false (index!18386 lt!229032) (x!47410 lt!229032))))))))

(assert (=> b!503461 (= (index!18386 lt!229032) i!1204)))

(declare-fun lt!229037 () Unit!15272)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32404 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15272)

(assert (=> b!503461 (= lt!229037 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!229036 #b00000000000000000000000000000000 (index!18386 lt!229032) (x!47410 lt!229032) mask!3524))))

(assert (=> b!503461 (and (or (= (select (arr!15582 a!3235) (index!18386 lt!229032)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15582 a!3235) (index!18386 lt!229032)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15582 a!3235) (index!18386 lt!229032)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15582 a!3235) (index!18386 lt!229032)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229033 () Unit!15272)

(assert (=> b!503461 (= lt!229033 e!294834)))

(declare-fun c!59630 () Bool)

(assert (=> b!503461 (= c!59630 (= (select (arr!15582 a!3235) (index!18386 lt!229032)) (select (arr!15582 a!3235) j!176)))))

(assert (=> b!503461 (and (bvslt (x!47410 lt!229032) #b01111111111111111111111111111110) (or (= (select (arr!15582 a!3235) (index!18386 lt!229032)) (select (arr!15582 a!3235) j!176)) (= (select (arr!15582 a!3235) (index!18386 lt!229032)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15582 a!3235) (index!18386 lt!229032)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!503462 () Bool)

(declare-fun Unit!15275 () Unit!15272)

(assert (=> b!503462 (= e!294834 Unit!15275)))

(declare-fun b!503463 () Bool)

(declare-fun res!304752 () Bool)

(assert (=> b!503463 (=> (not res!304752) (not e!294837))))

(declare-datatypes ((List!9740 0))(
  ( (Nil!9737) (Cons!9736 (h!10613 (_ BitVec 64)) (t!15968 List!9740)) )
))
(declare-fun arrayNoDuplicates!0 (array!32404 (_ BitVec 32) List!9740) Bool)

(assert (=> b!503463 (= res!304752 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9737))))

(declare-fun b!503464 () Bool)

(assert (=> b!503464 (= e!294836 e!294837)))

(declare-fun res!304761 () Bool)

(assert (=> b!503464 (=> (not res!304761) (not e!294837))))

(declare-fun lt!229035 () SeekEntryResult!4049)

(assert (=> b!503464 (= res!304761 (or (= lt!229035 (MissingZero!4049 i!1204)) (= lt!229035 (MissingVacant!4049 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32404 (_ BitVec 32)) SeekEntryResult!4049)

(assert (=> b!503464 (= lt!229035 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!503465 () Bool)

(declare-fun res!304750 () Bool)

(assert (=> b!503465 (=> (not res!304750) (not e!294836))))

(assert (=> b!503465 (= res!304750 (validKeyInArray!0 (select (arr!15582 a!3235) j!176)))))

(declare-fun b!503466 () Bool)

(declare-fun res!304753 () Bool)

(assert (=> b!503466 (=> (not res!304753) (not e!294836))))

(declare-fun arrayContainsKey!0 (array!32404 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!503466 (= res!304753 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!503467 () Bool)

(assert (=> b!503467 (= e!294835 (= (seekEntryOrOpen!0 (select (arr!15582 a!3235) j!176) a!3235 mask!3524) (Found!4049 j!176)))))

(declare-fun b!503468 () Bool)

(declare-fun res!304756 () Bool)

(assert (=> b!503468 (=> res!304756 e!294833)))

(assert (=> b!503468 (= res!304756 e!294832)))

(declare-fun res!304763 () Bool)

(assert (=> b!503468 (=> (not res!304763) (not e!294832))))

(assert (=> b!503468 (= res!304763 (bvsgt #b00000000000000000000000000000000 (x!47410 lt!229032)))))

(assert (= (and start!45648 res!304757) b!503455))

(assert (= (and b!503455 res!304751) b!503465))

(assert (= (and b!503465 res!304750) b!503457))

(assert (= (and b!503457 res!304749) b!503466))

(assert (= (and b!503466 res!304753) b!503464))

(assert (= (and b!503464 res!304761) b!503454))

(assert (= (and b!503454 res!304762) b!503463))

(assert (= (and b!503463 res!304752) b!503452))

(assert (= (and b!503452 res!304759) b!503467))

(assert (= (and b!503452 (not res!304755)) b!503453))

(assert (= (and b!503453 (not res!304754)) b!503461))

(assert (= (and b!503461 c!59630) b!503459))

(assert (= (and b!503461 (not c!59630)) b!503462))

(assert (= (and b!503459 res!304760) b!503458))

(assert (= (and b!503461 (not res!304758)) b!503468))

(assert (= (and b!503468 res!304763) b!503460))

(assert (= (and b!503468 (not res!304756)) b!503456))

(declare-fun m!484287 () Bool)

(assert (=> b!503460 m!484287))

(assert (=> b!503460 m!484287))

(declare-fun m!484289 () Bool)

(assert (=> b!503460 m!484289))

(declare-fun m!484291 () Bool)

(assert (=> b!503461 m!484291))

(declare-fun m!484293 () Bool)

(assert (=> b!503461 m!484293))

(assert (=> b!503461 m!484287))

(declare-fun m!484295 () Bool)

(assert (=> b!503463 m!484295))

(assert (=> b!503467 m!484287))

(assert (=> b!503467 m!484287))

(declare-fun m!484297 () Bool)

(assert (=> b!503467 m!484297))

(declare-fun m!484299 () Bool)

(assert (=> start!45648 m!484299))

(declare-fun m!484301 () Bool)

(assert (=> start!45648 m!484301))

(declare-fun m!484303 () Bool)

(assert (=> b!503456 m!484303))

(declare-fun m!484305 () Bool)

(assert (=> b!503459 m!484305))

(assert (=> b!503459 m!484303))

(assert (=> b!503465 m!484287))

(assert (=> b!503465 m!484287))

(declare-fun m!484307 () Bool)

(assert (=> b!503465 m!484307))

(declare-fun m!484309 () Bool)

(assert (=> b!503452 m!484309))

(declare-fun m!484311 () Bool)

(assert (=> b!503452 m!484311))

(declare-fun m!484313 () Bool)

(assert (=> b!503452 m!484313))

(assert (=> b!503452 m!484287))

(declare-fun m!484315 () Bool)

(assert (=> b!503452 m!484315))

(assert (=> b!503452 m!484287))

(declare-fun m!484317 () Bool)

(assert (=> b!503452 m!484317))

(assert (=> b!503452 m!484287))

(declare-fun m!484319 () Bool)

(assert (=> b!503452 m!484319))

(declare-fun m!484321 () Bool)

(assert (=> b!503452 m!484321))

(declare-fun m!484323 () Bool)

(assert (=> b!503452 m!484323))

(declare-fun m!484325 () Bool)

(assert (=> b!503466 m!484325))

(declare-fun m!484327 () Bool)

(assert (=> b!503464 m!484327))

(declare-fun m!484329 () Bool)

(assert (=> b!503457 m!484329))

(declare-fun m!484331 () Bool)

(assert (=> b!503454 m!484331))

(push 1)

