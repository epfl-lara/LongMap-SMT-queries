; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45790 () Bool)

(assert start!45790)

(declare-fun b!506818 () Bool)

(declare-fun res!307782 () Bool)

(declare-fun e!296627 () Bool)

(assert (=> b!506818 (=> (not res!307782) (not e!296627))))

(declare-datatypes ((array!32546 0))(
  ( (array!32547 (arr!15653 (Array (_ BitVec 32) (_ BitVec 64))) (size!16017 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32546)

(declare-datatypes ((List!9811 0))(
  ( (Nil!9808) (Cons!9807 (h!10684 (_ BitVec 64)) (t!16039 List!9811)) )
))
(declare-fun arrayNoDuplicates!0 (array!32546 (_ BitVec 32) List!9811) Bool)

(assert (=> b!506818 (= res!307782 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9808))))

(declare-fun b!506819 () Bool)

(declare-fun res!307777 () Bool)

(declare-fun e!296625 () Bool)

(assert (=> b!506819 (=> (not res!307777) (not e!296625))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506819 (= res!307777 (validKeyInArray!0 (select (arr!15653 a!3235) j!176)))))

(declare-fun b!506820 () Bool)

(declare-fun e!296624 () Bool)

(assert (=> b!506820 (= e!296627 (not e!296624))))

(declare-fun res!307778 () Bool)

(assert (=> b!506820 (=> res!307778 e!296624)))

(declare-fun lt!231302 () (_ BitVec 32))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4120 0))(
  ( (MissingZero!4120 (index!18668 (_ BitVec 32))) (Found!4120 (index!18669 (_ BitVec 32))) (Intermediate!4120 (undefined!4932 Bool) (index!18670 (_ BitVec 32)) (x!47665 (_ BitVec 32))) (Undefined!4120) (MissingVacant!4120 (index!18671 (_ BitVec 32))) )
))
(declare-fun lt!231300 () SeekEntryResult!4120)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32546 (_ BitVec 32)) SeekEntryResult!4120)

(assert (=> b!506820 (= res!307778 (= lt!231300 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231302 (select (store (arr!15653 a!3235) i!1204 k!2280) j!176) (array!32547 (store (arr!15653 a!3235) i!1204 k!2280) (size!16017 a!3235)) mask!3524)))))

(declare-fun lt!231301 () (_ BitVec 32))

(assert (=> b!506820 (= lt!231300 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231301 (select (arr!15653 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506820 (= lt!231302 (toIndex!0 (select (store (arr!15653 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!506820 (= lt!231301 (toIndex!0 (select (arr!15653 a!3235) j!176) mask!3524))))

(declare-fun e!296628 () Bool)

(assert (=> b!506820 e!296628))

(declare-fun res!307781 () Bool)

(assert (=> b!506820 (=> (not res!307781) (not e!296628))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32546 (_ BitVec 32)) Bool)

(assert (=> b!506820 (= res!307781 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15528 0))(
  ( (Unit!15529) )
))
(declare-fun lt!231299 () Unit!15528)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32546 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15528)

(assert (=> b!506820 (= lt!231299 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!506821 () Bool)

(declare-fun res!307779 () Bool)

(assert (=> b!506821 (=> (not res!307779) (not e!296625))))

(assert (=> b!506821 (= res!307779 (and (= (size!16017 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16017 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16017 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506822 () Bool)

(declare-fun res!307784 () Bool)

(assert (=> b!506822 (=> (not res!307784) (not e!296627))))

(assert (=> b!506822 (= res!307784 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!506823 () Bool)

(assert (=> b!506823 (= e!296625 e!296627)))

(declare-fun res!307786 () Bool)

(assert (=> b!506823 (=> (not res!307786) (not e!296627))))

(declare-fun lt!231303 () SeekEntryResult!4120)

(assert (=> b!506823 (= res!307786 (or (= lt!231303 (MissingZero!4120 i!1204)) (= lt!231303 (MissingVacant!4120 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32546 (_ BitVec 32)) SeekEntryResult!4120)

(assert (=> b!506823 (= lt!231303 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!506824 () Bool)

(declare-fun e!296623 () Bool)

(assert (=> b!506824 (= e!296623 true)))

(assert (=> b!506824 false))

(declare-fun res!307787 () Bool)

(assert (=> start!45790 (=> (not res!307787) (not e!296625))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45790 (= res!307787 (validMask!0 mask!3524))))

(assert (=> start!45790 e!296625))

(assert (=> start!45790 true))

(declare-fun array_inv!11449 (array!32546) Bool)

(assert (=> start!45790 (array_inv!11449 a!3235)))

(declare-fun b!506825 () Bool)

(declare-fun res!307783 () Bool)

(assert (=> b!506825 (=> (not res!307783) (not e!296625))))

(assert (=> b!506825 (= res!307783 (validKeyInArray!0 k!2280))))

(declare-fun b!506826 () Bool)

(assert (=> b!506826 (= e!296628 (= (seekEntryOrOpen!0 (select (arr!15653 a!3235) j!176) a!3235 mask!3524) (Found!4120 j!176)))))

(declare-fun b!506827 () Bool)

(assert (=> b!506827 (= e!296624 e!296623)))

(declare-fun res!307785 () Bool)

(assert (=> b!506827 (=> res!307785 e!296623)))

(declare-fun lt!231304 () Bool)

(assert (=> b!506827 (= res!307785 (or (and (not lt!231304) (undefined!4932 lt!231300)) (and (not lt!231304) (not (undefined!4932 lt!231300)))))))

(assert (=> b!506827 (= lt!231304 (not (is-Intermediate!4120 lt!231300)))))

(declare-fun b!506828 () Bool)

(declare-fun res!307780 () Bool)

(assert (=> b!506828 (=> (not res!307780) (not e!296625))))

(declare-fun arrayContainsKey!0 (array!32546 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506828 (= res!307780 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45790 res!307787) b!506821))

(assert (= (and b!506821 res!307779) b!506819))

(assert (= (and b!506819 res!307777) b!506825))

(assert (= (and b!506825 res!307783) b!506828))

(assert (= (and b!506828 res!307780) b!506823))

(assert (= (and b!506823 res!307786) b!506822))

(assert (= (and b!506822 res!307784) b!506818))

(assert (= (and b!506818 res!307782) b!506820))

(assert (= (and b!506820 res!307781) b!506826))

(assert (= (and b!506820 (not res!307778)) b!506827))

(assert (= (and b!506827 (not res!307785)) b!506824))

(declare-fun m!487515 () Bool)

(assert (=> b!506825 m!487515))

(declare-fun m!487517 () Bool)

(assert (=> start!45790 m!487517))

(declare-fun m!487519 () Bool)

(assert (=> start!45790 m!487519))

(declare-fun m!487521 () Bool)

(assert (=> b!506828 m!487521))

(declare-fun m!487523 () Bool)

(assert (=> b!506818 m!487523))

(declare-fun m!487525 () Bool)

(assert (=> b!506822 m!487525))

(declare-fun m!487527 () Bool)

(assert (=> b!506820 m!487527))

(declare-fun m!487529 () Bool)

(assert (=> b!506820 m!487529))

(declare-fun m!487531 () Bool)

(assert (=> b!506820 m!487531))

(declare-fun m!487533 () Bool)

(assert (=> b!506820 m!487533))

(declare-fun m!487535 () Bool)

(assert (=> b!506820 m!487535))

(assert (=> b!506820 m!487531))

(declare-fun m!487537 () Bool)

(assert (=> b!506820 m!487537))

(assert (=> b!506820 m!487533))

(declare-fun m!487539 () Bool)

(assert (=> b!506820 m!487539))

(assert (=> b!506820 m!487533))

(declare-fun m!487541 () Bool)

(assert (=> b!506820 m!487541))

(assert (=> b!506820 m!487531))

(declare-fun m!487543 () Bool)

(assert (=> b!506820 m!487543))

(assert (=> b!506826 m!487533))

(assert (=> b!506826 m!487533))

(declare-fun m!487545 () Bool)

(assert (=> b!506826 m!487545))

(assert (=> b!506819 m!487533))

(assert (=> b!506819 m!487533))

(declare-fun m!487547 () Bool)

(assert (=> b!506819 m!487547))

(declare-fun m!487549 () Bool)

(assert (=> b!506823 m!487549))

(push 1)

