; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45060 () Bool)

(assert start!45060)

(declare-fun b!494546 () Bool)

(declare-fun e!290227 () Bool)

(declare-fun e!290226 () Bool)

(assert (=> b!494546 (= e!290227 e!290226)))

(declare-fun res!297125 () Bool)

(assert (=> b!494546 (=> (not res!297125) (not e!290226))))

(declare-datatypes ((SeekEntryResult!3854 0))(
  ( (MissingZero!3854 (index!17595 (_ BitVec 32))) (Found!3854 (index!17596 (_ BitVec 32))) (Intermediate!3854 (undefined!4666 Bool) (index!17597 (_ BitVec 32)) (x!46668 (_ BitVec 32))) (Undefined!3854) (MissingVacant!3854 (index!17598 (_ BitVec 32))) )
))
(declare-fun lt!223840 () SeekEntryResult!3854)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!494546 (= res!297125 (or (= lt!223840 (MissingZero!3854 i!1204)) (= lt!223840 (MissingVacant!3854 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32005 0))(
  ( (array!32006 (arr!15387 (Array (_ BitVec 32) (_ BitVec 64))) (size!15751 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32005)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32005 (_ BitVec 32)) SeekEntryResult!3854)

(assert (=> b!494546 (= lt!223840 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!494547 () Bool)

(declare-fun res!297123 () Bool)

(assert (=> b!494547 (=> (not res!297123) (not e!290226))))

(declare-datatypes ((List!9545 0))(
  ( (Nil!9542) (Cons!9541 (h!10409 (_ BitVec 64)) (t!15773 List!9545)) )
))
(declare-fun arrayNoDuplicates!0 (array!32005 (_ BitVec 32) List!9545) Bool)

(assert (=> b!494547 (= res!297123 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9542))))

(declare-fun res!297120 () Bool)

(assert (=> start!45060 (=> (not res!297120) (not e!290227))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45060 (= res!297120 (validMask!0 mask!3524))))

(assert (=> start!45060 e!290227))

(assert (=> start!45060 true))

(declare-fun array_inv!11183 (array!32005) Bool)

(assert (=> start!45060 (array_inv!11183 a!3235)))

(declare-fun b!494548 () Bool)

(declare-fun e!290229 () Bool)

(assert (=> b!494548 (= e!290229 true)))

(declare-fun lt!223837 () SeekEntryResult!3854)

(assert (=> b!494548 (= lt!223837 Undefined!3854)))

(declare-fun b!494549 () Bool)

(declare-fun res!297118 () Bool)

(assert (=> b!494549 (=> (not res!297118) (not e!290226))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32005 (_ BitVec 32)) Bool)

(assert (=> b!494549 (= res!297118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!494550 () Bool)

(declare-fun res!297124 () Bool)

(assert (=> b!494550 (=> (not res!297124) (not e!290227))))

(declare-fun arrayContainsKey!0 (array!32005 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494550 (= res!297124 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!494551 () Bool)

(declare-fun res!297117 () Bool)

(assert (=> b!494551 (=> (not res!297117) (not e!290227))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494551 (= res!297117 (validKeyInArray!0 k!2280))))

(declare-fun b!494552 () Bool)

(assert (=> b!494552 (= e!290226 (not e!290229))))

(declare-fun res!297122 () Bool)

(assert (=> b!494552 (=> res!297122 e!290229)))

(declare-fun lt!223836 () SeekEntryResult!3854)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!223839 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32005 (_ BitVec 32)) SeekEntryResult!3854)

(assert (=> b!494552 (= res!297122 (= lt!223836 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223839 (select (store (arr!15387 a!3235) i!1204 k!2280) j!176) (array!32006 (store (arr!15387 a!3235) i!1204 k!2280) (size!15751 a!3235)) mask!3524)))))

(declare-fun lt!223838 () (_ BitVec 32))

(assert (=> b!494552 (= lt!223836 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223838 (select (arr!15387 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494552 (= lt!223839 (toIndex!0 (select (store (arr!15387 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!494552 (= lt!223838 (toIndex!0 (select (arr!15387 a!3235) j!176) mask!3524))))

(assert (=> b!494552 (= lt!223837 (Found!3854 j!176))))

(assert (=> b!494552 (= lt!223837 (seekEntryOrOpen!0 (select (arr!15387 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!494552 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14654 0))(
  ( (Unit!14655) )
))
(declare-fun lt!223835 () Unit!14654)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32005 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14654)

(assert (=> b!494552 (= lt!223835 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!494553 () Bool)

(declare-fun res!297119 () Bool)

(assert (=> b!494553 (=> res!297119 e!290229)))

(assert (=> b!494553 (= res!297119 (or (not (is-Intermediate!3854 lt!223836)) (not (undefined!4666 lt!223836))))))

(declare-fun b!494554 () Bool)

(declare-fun res!297116 () Bool)

(assert (=> b!494554 (=> (not res!297116) (not e!290227))))

(assert (=> b!494554 (= res!297116 (and (= (size!15751 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15751 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15751 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!494555 () Bool)

(declare-fun res!297121 () Bool)

(assert (=> b!494555 (=> (not res!297121) (not e!290227))))

(assert (=> b!494555 (= res!297121 (validKeyInArray!0 (select (arr!15387 a!3235) j!176)))))

(assert (= (and start!45060 res!297120) b!494554))

(assert (= (and b!494554 res!297116) b!494555))

(assert (= (and b!494555 res!297121) b!494551))

(assert (= (and b!494551 res!297117) b!494550))

(assert (= (and b!494550 res!297124) b!494546))

(assert (= (and b!494546 res!297125) b!494549))

(assert (= (and b!494549 res!297118) b!494547))

(assert (= (and b!494547 res!297123) b!494552))

(assert (= (and b!494552 (not res!297122)) b!494553))

(assert (= (and b!494553 (not res!297119)) b!494548))

(declare-fun m!475611 () Bool)

(assert (=> b!494550 m!475611))

(declare-fun m!475613 () Bool)

(assert (=> b!494552 m!475613))

(declare-fun m!475615 () Bool)

(assert (=> b!494552 m!475615))

(declare-fun m!475617 () Bool)

(assert (=> b!494552 m!475617))

(declare-fun m!475619 () Bool)

(assert (=> b!494552 m!475619))

(assert (=> b!494552 m!475613))

(declare-fun m!475621 () Bool)

(assert (=> b!494552 m!475621))

(assert (=> b!494552 m!475613))

(declare-fun m!475623 () Bool)

(assert (=> b!494552 m!475623))

(assert (=> b!494552 m!475613))

(declare-fun m!475625 () Bool)

(assert (=> b!494552 m!475625))

(assert (=> b!494552 m!475619))

(declare-fun m!475627 () Bool)

(assert (=> b!494552 m!475627))

(assert (=> b!494552 m!475619))

(declare-fun m!475629 () Bool)

(assert (=> b!494552 m!475629))

(declare-fun m!475631 () Bool)

(assert (=> b!494552 m!475631))

(declare-fun m!475633 () Bool)

(assert (=> b!494551 m!475633))

(assert (=> b!494555 m!475613))

(assert (=> b!494555 m!475613))

(declare-fun m!475635 () Bool)

(assert (=> b!494555 m!475635))

(declare-fun m!475637 () Bool)

(assert (=> b!494549 m!475637))

(declare-fun m!475639 () Bool)

(assert (=> b!494546 m!475639))

(declare-fun m!475641 () Bool)

(assert (=> b!494547 m!475641))

(declare-fun m!475643 () Bool)

(assert (=> start!45060 m!475643))

(declare-fun m!475645 () Bool)

(assert (=> start!45060 m!475645))

(push 1)

