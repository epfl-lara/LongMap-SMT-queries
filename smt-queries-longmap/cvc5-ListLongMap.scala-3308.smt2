; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45792 () Bool)

(assert start!45792)

(declare-fun b!506851 () Bool)

(declare-fun e!296645 () Bool)

(declare-fun e!296646 () Bool)

(assert (=> b!506851 (= e!296645 e!296646)))

(declare-fun res!307812 () Bool)

(assert (=> b!506851 (=> (not res!307812) (not e!296646))))

(declare-datatypes ((SeekEntryResult!4121 0))(
  ( (MissingZero!4121 (index!18672 (_ BitVec 32))) (Found!4121 (index!18673 (_ BitVec 32))) (Intermediate!4121 (undefined!4933 Bool) (index!18674 (_ BitVec 32)) (x!47674 (_ BitVec 32))) (Undefined!4121) (MissingVacant!4121 (index!18675 (_ BitVec 32))) )
))
(declare-fun lt!231322 () SeekEntryResult!4121)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!506851 (= res!307812 (or (= lt!231322 (MissingZero!4121 i!1204)) (= lt!231322 (MissingVacant!4121 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32548 0))(
  ( (array!32549 (arr!15654 (Array (_ BitVec 32) (_ BitVec 64))) (size!16018 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32548)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32548 (_ BitVec 32)) SeekEntryResult!4121)

(assert (=> b!506851 (= lt!231322 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!506852 () Bool)

(declare-fun e!296641 () Bool)

(assert (=> b!506852 (= e!296646 (not e!296641))))

(declare-fun res!307813 () Bool)

(assert (=> b!506852 (=> res!307813 e!296641)))

(declare-fun lt!231317 () SeekEntryResult!4121)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!231319 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32548 (_ BitVec 32)) SeekEntryResult!4121)

(assert (=> b!506852 (= res!307813 (= lt!231317 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231319 (select (store (arr!15654 a!3235) i!1204 k!2280) j!176) (array!32549 (store (arr!15654 a!3235) i!1204 k!2280) (size!16018 a!3235)) mask!3524)))))

(declare-fun lt!231318 () (_ BitVec 32))

(assert (=> b!506852 (= lt!231317 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231318 (select (arr!15654 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506852 (= lt!231319 (toIndex!0 (select (store (arr!15654 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!506852 (= lt!231318 (toIndex!0 (select (arr!15654 a!3235) j!176) mask!3524))))

(declare-fun e!296643 () Bool)

(assert (=> b!506852 e!296643))

(declare-fun res!307810 () Bool)

(assert (=> b!506852 (=> (not res!307810) (not e!296643))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32548 (_ BitVec 32)) Bool)

(assert (=> b!506852 (= res!307810 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15530 0))(
  ( (Unit!15531) )
))
(declare-fun lt!231321 () Unit!15530)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32548 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15530)

(assert (=> b!506852 (= lt!231321 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!506853 () Bool)

(declare-fun res!307818 () Bool)

(assert (=> b!506853 (=> (not res!307818) (not e!296645))))

(assert (=> b!506853 (= res!307818 (and (= (size!16018 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16018 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16018 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506854 () Bool)

(assert (=> b!506854 (= e!296643 (= (seekEntryOrOpen!0 (select (arr!15654 a!3235) j!176) a!3235 mask!3524) (Found!4121 j!176)))))

(declare-fun b!506855 () Bool)

(declare-fun res!307814 () Bool)

(assert (=> b!506855 (=> (not res!307814) (not e!296646))))

(declare-datatypes ((List!9812 0))(
  ( (Nil!9809) (Cons!9808 (h!10685 (_ BitVec 64)) (t!16040 List!9812)) )
))
(declare-fun arrayNoDuplicates!0 (array!32548 (_ BitVec 32) List!9812) Bool)

(assert (=> b!506855 (= res!307814 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9809))))

(declare-fun b!506856 () Bool)

(declare-fun res!307817 () Bool)

(assert (=> b!506856 (=> (not res!307817) (not e!296646))))

(assert (=> b!506856 (= res!307817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!506857 () Bool)

(declare-fun res!307816 () Bool)

(assert (=> b!506857 (=> (not res!307816) (not e!296645))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506857 (= res!307816 (validKeyInArray!0 (select (arr!15654 a!3235) j!176)))))

(declare-fun b!506858 () Bool)

(declare-fun res!307811 () Bool)

(assert (=> b!506858 (=> (not res!307811) (not e!296645))))

(declare-fun arrayContainsKey!0 (array!32548 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506858 (= res!307811 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!506859 () Bool)

(declare-fun e!296644 () Bool)

(assert (=> b!506859 (= e!296641 e!296644)))

(declare-fun res!307815 () Bool)

(assert (=> b!506859 (=> res!307815 e!296644)))

(declare-fun lt!231320 () Bool)

(assert (=> b!506859 (= res!307815 (or (and (not lt!231320) (undefined!4933 lt!231317)) (and (not lt!231320) (not (undefined!4933 lt!231317)))))))

(assert (=> b!506859 (= lt!231320 (not (is-Intermediate!4121 lt!231317)))))

(declare-fun res!307819 () Bool)

(assert (=> start!45792 (=> (not res!307819) (not e!296645))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45792 (= res!307819 (validMask!0 mask!3524))))

(assert (=> start!45792 e!296645))

(assert (=> start!45792 true))

(declare-fun array_inv!11450 (array!32548) Bool)

(assert (=> start!45792 (array_inv!11450 a!3235)))

(declare-fun b!506860 () Bool)

(assert (=> b!506860 (= e!296644 true)))

(assert (=> b!506860 false))

(declare-fun b!506861 () Bool)

(declare-fun res!307820 () Bool)

(assert (=> b!506861 (=> (not res!307820) (not e!296645))))

(assert (=> b!506861 (= res!307820 (validKeyInArray!0 k!2280))))

(assert (= (and start!45792 res!307819) b!506853))

(assert (= (and b!506853 res!307818) b!506857))

(assert (= (and b!506857 res!307816) b!506861))

(assert (= (and b!506861 res!307820) b!506858))

(assert (= (and b!506858 res!307811) b!506851))

(assert (= (and b!506851 res!307812) b!506856))

(assert (= (and b!506856 res!307817) b!506855))

(assert (= (and b!506855 res!307814) b!506852))

(assert (= (and b!506852 res!307810) b!506854))

(assert (= (and b!506852 (not res!307813)) b!506859))

(assert (= (and b!506859 (not res!307815)) b!506860))

(declare-fun m!487551 () Bool)

(assert (=> b!506852 m!487551))

(declare-fun m!487553 () Bool)

(assert (=> b!506852 m!487553))

(declare-fun m!487555 () Bool)

(assert (=> b!506852 m!487555))

(declare-fun m!487557 () Bool)

(assert (=> b!506852 m!487557))

(declare-fun m!487559 () Bool)

(assert (=> b!506852 m!487559))

(assert (=> b!506852 m!487557))

(assert (=> b!506852 m!487555))

(declare-fun m!487561 () Bool)

(assert (=> b!506852 m!487561))

(assert (=> b!506852 m!487557))

(declare-fun m!487563 () Bool)

(assert (=> b!506852 m!487563))

(declare-fun m!487565 () Bool)

(assert (=> b!506852 m!487565))

(assert (=> b!506852 m!487555))

(declare-fun m!487567 () Bool)

(assert (=> b!506852 m!487567))

(declare-fun m!487569 () Bool)

(assert (=> b!506851 m!487569))

(declare-fun m!487571 () Bool)

(assert (=> b!506861 m!487571))

(assert (=> b!506854 m!487557))

(assert (=> b!506854 m!487557))

(declare-fun m!487573 () Bool)

(assert (=> b!506854 m!487573))

(declare-fun m!487575 () Bool)

(assert (=> b!506855 m!487575))

(declare-fun m!487577 () Bool)

(assert (=> b!506856 m!487577))

(declare-fun m!487579 () Bool)

(assert (=> start!45792 m!487579))

(declare-fun m!487581 () Bool)

(assert (=> start!45792 m!487581))

(assert (=> b!506857 m!487557))

(assert (=> b!506857 m!487557))

(declare-fun m!487583 () Bool)

(assert (=> b!506857 m!487583))

(declare-fun m!487585 () Bool)

(assert (=> b!506858 m!487585))

(push 1)

