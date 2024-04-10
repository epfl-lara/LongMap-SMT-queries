; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44792 () Bool)

(assert start!44792)

(declare-fun b!491807 () Bool)

(declare-fun res!294745 () Bool)

(declare-fun e!288929 () Bool)

(assert (=> b!491807 (=> (not res!294745) (not e!288929))))

(declare-datatypes ((array!31851 0))(
  ( (array!31852 (arr!15313 (Array (_ BitVec 32) (_ BitVec 64))) (size!15677 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31851)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31851 (_ BitVec 32)) Bool)

(assert (=> b!491807 (= res!294745 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491808 () Bool)

(declare-fun e!288928 () Bool)

(assert (=> b!491808 (= e!288928 (bvsge mask!3524 #b00000000000000000000000000000000))))

(declare-fun b!491809 () Bool)

(assert (=> b!491809 (= e!288929 (not e!288928))))

(declare-fun res!294752 () Bool)

(assert (=> b!491809 (=> res!294752 e!288928)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3780 0))(
  ( (MissingZero!3780 (index!17299 (_ BitVec 32))) (Found!3780 (index!17300 (_ BitVec 32))) (Intermediate!3780 (undefined!4592 Bool) (index!17301 (_ BitVec 32)) (x!46382 (_ BitVec 32))) (Undefined!3780) (MissingVacant!3780 (index!17302 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31851 (_ BitVec 32)) SeekEntryResult!3780)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491809 (= res!294752 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15313 a!3235) j!176) mask!3524) (select (arr!15313 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!15313 a!3235) i!1204 k0!2280) j!176) mask!3524) (select (store (arr!15313 a!3235) i!1204 k0!2280) j!176) (array!31852 (store (arr!15313 a!3235) i!1204 k0!2280) (size!15677 a!3235)) mask!3524)))))

(declare-fun e!288926 () Bool)

(assert (=> b!491809 e!288926))

(declare-fun res!294747 () Bool)

(assert (=> b!491809 (=> (not res!294747) (not e!288926))))

(assert (=> b!491809 (= res!294747 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14506 0))(
  ( (Unit!14507) )
))
(declare-fun lt!222369 () Unit!14506)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31851 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14506)

(assert (=> b!491809 (= lt!222369 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!491810 () Bool)

(declare-fun res!294748 () Bool)

(declare-fun e!288930 () Bool)

(assert (=> b!491810 (=> (not res!294748) (not e!288930))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491810 (= res!294748 (validKeyInArray!0 (select (arr!15313 a!3235) j!176)))))

(declare-fun b!491811 () Bool)

(assert (=> b!491811 (= e!288930 e!288929)))

(declare-fun res!294743 () Bool)

(assert (=> b!491811 (=> (not res!294743) (not e!288929))))

(declare-fun lt!222370 () SeekEntryResult!3780)

(assert (=> b!491811 (= res!294743 (or (= lt!222370 (MissingZero!3780 i!1204)) (= lt!222370 (MissingVacant!3780 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31851 (_ BitVec 32)) SeekEntryResult!3780)

(assert (=> b!491811 (= lt!222370 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!491812 () Bool)

(declare-fun res!294750 () Bool)

(assert (=> b!491812 (=> (not res!294750) (not e!288929))))

(declare-datatypes ((List!9471 0))(
  ( (Nil!9468) (Cons!9467 (h!10329 (_ BitVec 64)) (t!15699 List!9471)) )
))
(declare-fun arrayNoDuplicates!0 (array!31851 (_ BitVec 32) List!9471) Bool)

(assert (=> b!491812 (= res!294750 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9468))))

(declare-fun b!491813 () Bool)

(assert (=> b!491813 (= e!288926 (= (seekEntryOrOpen!0 (select (arr!15313 a!3235) j!176) a!3235 mask!3524) (Found!3780 j!176)))))

(declare-fun b!491814 () Bool)

(declare-fun res!294744 () Bool)

(assert (=> b!491814 (=> (not res!294744) (not e!288930))))

(declare-fun arrayContainsKey!0 (array!31851 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491814 (= res!294744 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!491815 () Bool)

(declare-fun res!294746 () Bool)

(assert (=> b!491815 (=> (not res!294746) (not e!288930))))

(assert (=> b!491815 (= res!294746 (and (= (size!15677 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15677 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15677 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491816 () Bool)

(declare-fun res!294749 () Bool)

(assert (=> b!491816 (=> (not res!294749) (not e!288930))))

(assert (=> b!491816 (= res!294749 (validKeyInArray!0 k0!2280))))

(declare-fun res!294751 () Bool)

(assert (=> start!44792 (=> (not res!294751) (not e!288930))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44792 (= res!294751 (validMask!0 mask!3524))))

(assert (=> start!44792 e!288930))

(assert (=> start!44792 true))

(declare-fun array_inv!11109 (array!31851) Bool)

(assert (=> start!44792 (array_inv!11109 a!3235)))

(assert (= (and start!44792 res!294751) b!491815))

(assert (= (and b!491815 res!294746) b!491810))

(assert (= (and b!491810 res!294748) b!491816))

(assert (= (and b!491816 res!294749) b!491814))

(assert (= (and b!491814 res!294744) b!491811))

(assert (= (and b!491811 res!294743) b!491807))

(assert (= (and b!491807 res!294745) b!491812))

(assert (= (and b!491812 res!294750) b!491809))

(assert (= (and b!491809 res!294747) b!491813))

(assert (= (and b!491809 (not res!294752)) b!491808))

(declare-fun m!472545 () Bool)

(assert (=> b!491816 m!472545))

(declare-fun m!472547 () Bool)

(assert (=> start!44792 m!472547))

(declare-fun m!472549 () Bool)

(assert (=> start!44792 m!472549))

(declare-fun m!472551 () Bool)

(assert (=> b!491813 m!472551))

(assert (=> b!491813 m!472551))

(declare-fun m!472553 () Bool)

(assert (=> b!491813 m!472553))

(declare-fun m!472555 () Bool)

(assert (=> b!491811 m!472555))

(declare-fun m!472557 () Bool)

(assert (=> b!491812 m!472557))

(declare-fun m!472559 () Bool)

(assert (=> b!491809 m!472559))

(declare-fun m!472561 () Bool)

(assert (=> b!491809 m!472561))

(declare-fun m!472563 () Bool)

(assert (=> b!491809 m!472563))

(declare-fun m!472565 () Bool)

(assert (=> b!491809 m!472565))

(assert (=> b!491809 m!472551))

(declare-fun m!472567 () Bool)

(assert (=> b!491809 m!472567))

(assert (=> b!491809 m!472551))

(assert (=> b!491809 m!472565))

(declare-fun m!472569 () Bool)

(assert (=> b!491809 m!472569))

(assert (=> b!491809 m!472563))

(declare-fun m!472571 () Bool)

(assert (=> b!491809 m!472571))

(assert (=> b!491809 m!472551))

(declare-fun m!472573 () Bool)

(assert (=> b!491809 m!472573))

(assert (=> b!491809 m!472563))

(assert (=> b!491809 m!472569))

(declare-fun m!472575 () Bool)

(assert (=> b!491814 m!472575))

(declare-fun m!472577 () Bool)

(assert (=> b!491807 m!472577))

(assert (=> b!491810 m!472551))

(assert (=> b!491810 m!472551))

(declare-fun m!472579 () Bool)

(assert (=> b!491810 m!472579))

(check-sat (not b!491811) (not b!491807) (not b!491810) (not b!491809) (not start!44792) (not b!491812) (not b!491814) (not b!491813) (not b!491816))
(check-sat)
