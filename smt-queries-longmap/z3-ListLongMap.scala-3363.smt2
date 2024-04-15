; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46218 () Bool)

(assert start!46218)

(declare-fun b!511669 () Bool)

(declare-fun res!312473 () Bool)

(declare-fun e!298893 () Bool)

(assert (=> b!511669 (=> (not res!312473) (not e!298893))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!511669 (= res!312473 (validKeyInArray!0 k0!2280))))

(declare-fun b!511670 () Bool)

(declare-fun e!298890 () Bool)

(declare-fun e!298892 () Bool)

(assert (=> b!511670 (= e!298890 (not e!298892))))

(declare-fun res!312477 () Bool)

(assert (=> b!511670 (=> res!312477 e!298892)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!234049 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4282 0))(
  ( (MissingZero!4282 (index!19316 (_ BitVec 32))) (Found!4282 (index!19317 (_ BitVec 32))) (Intermediate!4282 (undefined!5094 Bool) (index!19318 (_ BitVec 32)) (x!48276 (_ BitVec 32))) (Undefined!4282) (MissingVacant!4282 (index!19319 (_ BitVec 32))) )
))
(declare-fun lt!234048 () SeekEntryResult!4282)

(declare-datatypes ((array!32882 0))(
  ( (array!32883 (arr!15818 (Array (_ BitVec 32) (_ BitVec 64))) (size!16183 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32882)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32882 (_ BitVec 32)) SeekEntryResult!4282)

(assert (=> b!511670 (= res!312477 (= lt!234048 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234049 (select (store (arr!15818 a!3235) i!1204 k0!2280) j!176) (array!32883 (store (arr!15818 a!3235) i!1204 k0!2280) (size!16183 a!3235)) mask!3524)))))

(declare-fun lt!234051 () (_ BitVec 32))

(assert (=> b!511670 (= lt!234048 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234051 (select (arr!15818 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511670 (= lt!234049 (toIndex!0 (select (store (arr!15818 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!511670 (= lt!234051 (toIndex!0 (select (arr!15818 a!3235) j!176) mask!3524))))

(declare-fun lt!234050 () SeekEntryResult!4282)

(assert (=> b!511670 (= lt!234050 (Found!4282 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32882 (_ BitVec 32)) SeekEntryResult!4282)

(assert (=> b!511670 (= lt!234050 (seekEntryOrOpen!0 (select (arr!15818 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32882 (_ BitVec 32)) Bool)

(assert (=> b!511670 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15808 0))(
  ( (Unit!15809) )
))
(declare-fun lt!234047 () Unit!15808)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32882 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15808)

(assert (=> b!511670 (= lt!234047 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!511671 () Bool)

(declare-fun res!312480 () Bool)

(assert (=> b!511671 (=> (not res!312480) (not e!298893))))

(assert (=> b!511671 (= res!312480 (and (= (size!16183 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16183 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16183 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!511672 () Bool)

(declare-fun res!312475 () Bool)

(assert (=> b!511672 (=> (not res!312475) (not e!298893))))

(assert (=> b!511672 (= res!312475 (validKeyInArray!0 (select (arr!15818 a!3235) j!176)))))

(declare-fun b!511673 () Bool)

(assert (=> b!511673 (= e!298892 true)))

(assert (=> b!511673 (= lt!234050 Undefined!4282)))

(declare-fun b!511675 () Bool)

(declare-fun res!312476 () Bool)

(assert (=> b!511675 (=> (not res!312476) (not e!298893))))

(declare-fun arrayContainsKey!0 (array!32882 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!511675 (= res!312476 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!511676 () Bool)

(declare-fun res!312479 () Bool)

(assert (=> b!511676 (=> (not res!312479) (not e!298890))))

(assert (=> b!511676 (= res!312479 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!511677 () Bool)

(assert (=> b!511677 (= e!298893 e!298890)))

(declare-fun res!312482 () Bool)

(assert (=> b!511677 (=> (not res!312482) (not e!298890))))

(declare-fun lt!234052 () SeekEntryResult!4282)

(assert (=> b!511677 (= res!312482 (or (= lt!234052 (MissingZero!4282 i!1204)) (= lt!234052 (MissingVacant!4282 i!1204))))))

(assert (=> b!511677 (= lt!234052 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!511678 () Bool)

(declare-fun res!312474 () Bool)

(assert (=> b!511678 (=> res!312474 e!298892)))

(get-info :version)

(assert (=> b!511678 (= res!312474 (or (not ((_ is Intermediate!4282) lt!234048)) (not (undefined!5094 lt!234048))))))

(declare-fun res!312478 () Bool)

(assert (=> start!46218 (=> (not res!312478) (not e!298893))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46218 (= res!312478 (validMask!0 mask!3524))))

(assert (=> start!46218 e!298893))

(assert (=> start!46218 true))

(declare-fun array_inv!11701 (array!32882) Bool)

(assert (=> start!46218 (array_inv!11701 a!3235)))

(declare-fun b!511674 () Bool)

(declare-fun res!312481 () Bool)

(assert (=> b!511674 (=> (not res!312481) (not e!298890))))

(declare-datatypes ((List!10015 0))(
  ( (Nil!10012) (Cons!10011 (h!10891 (_ BitVec 64)) (t!16234 List!10015)) )
))
(declare-fun arrayNoDuplicates!0 (array!32882 (_ BitVec 32) List!10015) Bool)

(assert (=> b!511674 (= res!312481 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10012))))

(assert (= (and start!46218 res!312478) b!511671))

(assert (= (and b!511671 res!312480) b!511672))

(assert (= (and b!511672 res!312475) b!511669))

(assert (= (and b!511669 res!312473) b!511675))

(assert (= (and b!511675 res!312476) b!511677))

(assert (= (and b!511677 res!312482) b!511676))

(assert (= (and b!511676 res!312479) b!511674))

(assert (= (and b!511674 res!312481) b!511670))

(assert (= (and b!511670 (not res!312477)) b!511678))

(assert (= (and b!511678 (not res!312474)) b!511673))

(declare-fun m!492745 () Bool)

(assert (=> b!511674 m!492745))

(declare-fun m!492747 () Bool)

(assert (=> b!511677 m!492747))

(declare-fun m!492749 () Bool)

(assert (=> start!46218 m!492749))

(declare-fun m!492751 () Bool)

(assert (=> start!46218 m!492751))

(declare-fun m!492753 () Bool)

(assert (=> b!511670 m!492753))

(declare-fun m!492755 () Bool)

(assert (=> b!511670 m!492755))

(declare-fun m!492757 () Bool)

(assert (=> b!511670 m!492757))

(declare-fun m!492759 () Bool)

(assert (=> b!511670 m!492759))

(assert (=> b!511670 m!492753))

(declare-fun m!492761 () Bool)

(assert (=> b!511670 m!492761))

(declare-fun m!492763 () Bool)

(assert (=> b!511670 m!492763))

(assert (=> b!511670 m!492761))

(declare-fun m!492765 () Bool)

(assert (=> b!511670 m!492765))

(assert (=> b!511670 m!492761))

(declare-fun m!492767 () Bool)

(assert (=> b!511670 m!492767))

(assert (=> b!511670 m!492761))

(declare-fun m!492769 () Bool)

(assert (=> b!511670 m!492769))

(assert (=> b!511670 m!492753))

(declare-fun m!492771 () Bool)

(assert (=> b!511670 m!492771))

(assert (=> b!511672 m!492761))

(assert (=> b!511672 m!492761))

(declare-fun m!492773 () Bool)

(assert (=> b!511672 m!492773))

(declare-fun m!492775 () Bool)

(assert (=> b!511675 m!492775))

(declare-fun m!492777 () Bool)

(assert (=> b!511669 m!492777))

(declare-fun m!492779 () Bool)

(assert (=> b!511676 m!492779))

(check-sat (not b!511677) (not b!511676) (not b!511670) (not b!511675) (not b!511669) (not start!46218) (not b!511672) (not b!511674))
(check-sat)
