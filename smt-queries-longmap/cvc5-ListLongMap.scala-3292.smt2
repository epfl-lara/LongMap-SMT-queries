; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45696 () Bool)

(assert start!45696)

(declare-fun res!305840 () Bool)

(declare-fun e!295481 () Bool)

(assert (=> start!45696 (=> (not res!305840) (not e!295481))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45696 (= res!305840 (validMask!0 mask!3524))))

(assert (=> start!45696 e!295481))

(assert (=> start!45696 true))

(declare-datatypes ((array!32452 0))(
  ( (array!32453 (arr!15606 (Array (_ BitVec 32) (_ BitVec 64))) (size!15970 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32452)

(declare-fun array_inv!11402 (array!32452) Bool)

(assert (=> start!45696 (array_inv!11402 a!3235)))

(declare-fun lt!229827 () (_ BitVec 32))

(declare-fun b!504676 () Bool)

(declare-datatypes ((SeekEntryResult!4073 0))(
  ( (MissingZero!4073 (index!18480 (_ BitVec 32))) (Found!4073 (index!18481 (_ BitVec 32))) (Intermediate!4073 (undefined!4885 Bool) (index!18482 (_ BitVec 32)) (x!47498 (_ BitVec 32))) (Undefined!4073) (MissingVacant!4073 (index!18483 (_ BitVec 32))) )
))
(declare-fun lt!229824 () SeekEntryResult!4073)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!295479 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32452 (_ BitVec 32)) SeekEntryResult!4073)

(assert (=> b!504676 (= e!295479 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229827 (index!18482 lt!229824) (select (arr!15606 a!3235) j!176) a!3235 mask!3524) (Found!4073 j!176))))))

(declare-fun b!504677 () Bool)

(declare-fun e!295485 () Bool)

(assert (=> b!504677 (= e!295485 false)))

(declare-fun b!504678 () Bool)

(declare-fun res!305839 () Bool)

(assert (=> b!504678 (=> (not res!305839) (not e!295481))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!504678 (= res!305839 (validKeyInArray!0 (select (arr!15606 a!3235) j!176)))))

(declare-fun b!504679 () Bool)

(declare-fun e!295484 () Bool)

(assert (=> b!504679 (= e!295484 true)))

(declare-fun lt!229825 () SeekEntryResult!4073)

(declare-fun lt!229828 () array!32452)

(declare-fun lt!229826 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32452 (_ BitVec 32)) SeekEntryResult!4073)

(assert (=> b!504679 (= lt!229825 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229827 lt!229826 lt!229828 mask!3524))))

(declare-fun b!504680 () Bool)

(declare-fun res!305831 () Bool)

(declare-fun e!295480 () Bool)

(assert (=> b!504680 (=> (not res!305831) (not e!295480))))

(declare-datatypes ((List!9764 0))(
  ( (Nil!9761) (Cons!9760 (h!10637 (_ BitVec 64)) (t!15992 List!9764)) )
))
(declare-fun arrayNoDuplicates!0 (array!32452 (_ BitVec 32) List!9764) Bool)

(assert (=> b!504680 (= res!305831 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9761))))

(declare-fun b!504681 () Bool)

(declare-fun e!295482 () Bool)

(assert (=> b!504681 (= e!295482 e!295484)))

(declare-fun res!305829 () Bool)

(assert (=> b!504681 (=> res!305829 e!295484)))

(assert (=> b!504681 (= res!305829 (or (bvsgt (x!47498 lt!229824) #b01111111111111111111111111111110) (bvslt lt!229827 #b00000000000000000000000000000000) (bvsge lt!229827 (size!15970 a!3235)) (bvslt (index!18482 lt!229824) #b00000000000000000000000000000000) (bvsge (index!18482 lt!229824) (size!15970 a!3235)) (not (= lt!229824 (Intermediate!4073 false (index!18482 lt!229824) (x!47498 lt!229824))))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!504681 (= (index!18482 lt!229824) i!1204)))

(declare-datatypes ((Unit!15368 0))(
  ( (Unit!15369) )
))
(declare-fun lt!229829 () Unit!15368)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32452 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15368)

(assert (=> b!504681 (= lt!229829 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!229827 #b00000000000000000000000000000000 (index!18482 lt!229824) (x!47498 lt!229824) mask!3524))))

(assert (=> b!504681 (and (or (= (select (arr!15606 a!3235) (index!18482 lt!229824)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15606 a!3235) (index!18482 lt!229824)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15606 a!3235) (index!18482 lt!229824)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15606 a!3235) (index!18482 lt!229824)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229834 () Unit!15368)

(declare-fun e!295483 () Unit!15368)

(assert (=> b!504681 (= lt!229834 e!295483)))

(declare-fun c!59702 () Bool)

(assert (=> b!504681 (= c!59702 (= (select (arr!15606 a!3235) (index!18482 lt!229824)) (select (arr!15606 a!3235) j!176)))))

(assert (=> b!504681 (and (bvslt (x!47498 lt!229824) #b01111111111111111111111111111110) (or (= (select (arr!15606 a!3235) (index!18482 lt!229824)) (select (arr!15606 a!3235) j!176)) (= (select (arr!15606 a!3235) (index!18482 lt!229824)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15606 a!3235) (index!18482 lt!229824)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!504682 () Bool)

(assert (=> b!504682 (= e!295481 e!295480)))

(declare-fun res!305843 () Bool)

(assert (=> b!504682 (=> (not res!305843) (not e!295480))))

(declare-fun lt!229831 () SeekEntryResult!4073)

(assert (=> b!504682 (= res!305843 (or (= lt!229831 (MissingZero!4073 i!1204)) (= lt!229831 (MissingVacant!4073 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32452 (_ BitVec 32)) SeekEntryResult!4073)

(assert (=> b!504682 (= lt!229831 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!504683 () Bool)

(declare-fun res!305832 () Bool)

(assert (=> b!504683 (=> (not res!305832) (not e!295481))))

(declare-fun arrayContainsKey!0 (array!32452 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!504683 (= res!305832 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!504684 () Bool)

(declare-fun res!305841 () Bool)

(assert (=> b!504684 (=> res!305841 e!295482)))

(assert (=> b!504684 (= res!305841 (or (undefined!4885 lt!229824) (not (is-Intermediate!4073 lt!229824))))))

(declare-fun b!504685 () Bool)

(declare-fun Unit!15370 () Unit!15368)

(assert (=> b!504685 (= e!295483 Unit!15370)))

(declare-fun b!504686 () Bool)

(declare-fun res!305837 () Bool)

(assert (=> b!504686 (=> (not res!305837) (not e!295480))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32452 (_ BitVec 32)) Bool)

(assert (=> b!504686 (= res!305837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!504687 () Bool)

(declare-fun res!305838 () Bool)

(assert (=> b!504687 (=> (not res!305838) (not e!295481))))

(assert (=> b!504687 (= res!305838 (validKeyInArray!0 k!2280))))

(declare-fun b!504688 () Bool)

(declare-fun Unit!15371 () Unit!15368)

(assert (=> b!504688 (= e!295483 Unit!15371)))

(declare-fun lt!229830 () Unit!15368)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32452 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15368)

(assert (=> b!504688 (= lt!229830 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!229827 #b00000000000000000000000000000000 (index!18482 lt!229824) (x!47498 lt!229824) mask!3524))))

(declare-fun res!305836 () Bool)

(assert (=> b!504688 (= res!305836 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229827 lt!229826 lt!229828 mask!3524) (Intermediate!4073 false (index!18482 lt!229824) (x!47498 lt!229824))))))

(assert (=> b!504688 (=> (not res!305836) (not e!295485))))

(assert (=> b!504688 e!295485))

(declare-fun b!504689 () Bool)

(declare-fun res!305834 () Bool)

(assert (=> b!504689 (=> res!305834 e!295484)))

(assert (=> b!504689 (= res!305834 e!295479)))

(declare-fun res!305842 () Bool)

(assert (=> b!504689 (=> (not res!305842) (not e!295479))))

(assert (=> b!504689 (= res!305842 (bvsgt #b00000000000000000000000000000000 (x!47498 lt!229824)))))

(declare-fun b!504690 () Bool)

(assert (=> b!504690 (= e!295480 (not e!295482))))

(declare-fun res!305835 () Bool)

(assert (=> b!504690 (=> res!305835 e!295482)))

(declare-fun lt!229833 () (_ BitVec 32))

(assert (=> b!504690 (= res!305835 (= lt!229824 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229833 lt!229826 lt!229828 mask!3524)))))

(assert (=> b!504690 (= lt!229824 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229827 (select (arr!15606 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!504690 (= lt!229833 (toIndex!0 lt!229826 mask!3524))))

(assert (=> b!504690 (= lt!229826 (select (store (arr!15606 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!504690 (= lt!229827 (toIndex!0 (select (arr!15606 a!3235) j!176) mask!3524))))

(assert (=> b!504690 (= lt!229828 (array!32453 (store (arr!15606 a!3235) i!1204 k!2280) (size!15970 a!3235)))))

(declare-fun e!295477 () Bool)

(assert (=> b!504690 e!295477))

(declare-fun res!305833 () Bool)

(assert (=> b!504690 (=> (not res!305833) (not e!295477))))

(assert (=> b!504690 (= res!305833 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!229832 () Unit!15368)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32452 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15368)

(assert (=> b!504690 (= lt!229832 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!504691 () Bool)

(declare-fun res!305830 () Bool)

(assert (=> b!504691 (=> (not res!305830) (not e!295481))))

(assert (=> b!504691 (= res!305830 (and (= (size!15970 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15970 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15970 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!504692 () Bool)

(assert (=> b!504692 (= e!295477 (= (seekEntryOrOpen!0 (select (arr!15606 a!3235) j!176) a!3235 mask!3524) (Found!4073 j!176)))))

(assert (= (and start!45696 res!305840) b!504691))

(assert (= (and b!504691 res!305830) b!504678))

(assert (= (and b!504678 res!305839) b!504687))

(assert (= (and b!504687 res!305838) b!504683))

(assert (= (and b!504683 res!305832) b!504682))

(assert (= (and b!504682 res!305843) b!504686))

(assert (= (and b!504686 res!305837) b!504680))

(assert (= (and b!504680 res!305831) b!504690))

(assert (= (and b!504690 res!305833) b!504692))

(assert (= (and b!504690 (not res!305835)) b!504684))

(assert (= (and b!504684 (not res!305841)) b!504681))

(assert (= (and b!504681 c!59702) b!504688))

(assert (= (and b!504681 (not c!59702)) b!504685))

(assert (= (and b!504688 res!305836) b!504677))

(assert (= (and b!504681 (not res!305829)) b!504689))

(assert (= (and b!504689 res!305842) b!504676))

(assert (= (and b!504689 (not res!305834)) b!504679))

(declare-fun m!485391 () Bool)

(assert (=> b!504686 m!485391))

(declare-fun m!485393 () Bool)

(assert (=> b!504678 m!485393))

(assert (=> b!504678 m!485393))

(declare-fun m!485395 () Bool)

(assert (=> b!504678 m!485395))

(declare-fun m!485397 () Bool)

(assert (=> b!504687 m!485397))

(assert (=> b!504692 m!485393))

(assert (=> b!504692 m!485393))

(declare-fun m!485399 () Bool)

(assert (=> b!504692 m!485399))

(declare-fun m!485401 () Bool)

(assert (=> b!504690 m!485401))

(declare-fun m!485403 () Bool)

(assert (=> b!504690 m!485403))

(declare-fun m!485405 () Bool)

(assert (=> b!504690 m!485405))

(declare-fun m!485407 () Bool)

(assert (=> b!504690 m!485407))

(assert (=> b!504690 m!485393))

(declare-fun m!485409 () Bool)

(assert (=> b!504690 m!485409))

(declare-fun m!485411 () Bool)

(assert (=> b!504690 m!485411))

(assert (=> b!504690 m!485393))

(declare-fun m!485413 () Bool)

(assert (=> b!504690 m!485413))

(assert (=> b!504690 m!485393))

(declare-fun m!485415 () Bool)

(assert (=> b!504690 m!485415))

(declare-fun m!485417 () Bool)

(assert (=> b!504679 m!485417))

(declare-fun m!485419 () Bool)

(assert (=> b!504681 m!485419))

(declare-fun m!485421 () Bool)

(assert (=> b!504681 m!485421))

(assert (=> b!504681 m!485393))

(declare-fun m!485423 () Bool)

(assert (=> start!45696 m!485423))

(declare-fun m!485425 () Bool)

(assert (=> start!45696 m!485425))

(declare-fun m!485427 () Bool)

(assert (=> b!504680 m!485427))

(declare-fun m!485429 () Bool)

(assert (=> b!504682 m!485429))

(declare-fun m!485431 () Bool)

(assert (=> b!504683 m!485431))

(assert (=> b!504676 m!485393))

(assert (=> b!504676 m!485393))

(declare-fun m!485433 () Bool)

(assert (=> b!504676 m!485433))

(declare-fun m!485435 () Bool)

(assert (=> b!504688 m!485435))

(assert (=> b!504688 m!485417))

(push 1)

