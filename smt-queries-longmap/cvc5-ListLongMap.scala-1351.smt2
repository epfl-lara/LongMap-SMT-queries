; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26664 () Bool)

(assert start!26664)

(declare-fun b!276765 () Bool)

(declare-fun e!176763 () Bool)

(assert (=> b!276765 (= e!176763 false)))

(declare-fun lt!137739 () Bool)

(declare-datatypes ((array!13761 0))(
  ( (array!13762 (arr!6530 (Array (_ BitVec 32) (_ BitVec 64))) (size!6882 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13761)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13761 (_ BitVec 32)) Bool)

(assert (=> b!276765 (= lt!137739 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!140755 () Bool)

(declare-fun e!176764 () Bool)

(assert (=> start!26664 (=> (not res!140755) (not e!176764))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26664 (= res!140755 (validMask!0 mask!3868))))

(assert (=> start!26664 e!176764))

(declare-fun array_inv!4493 (array!13761) Bool)

(assert (=> start!26664 (array_inv!4493 a!3325)))

(assert (=> start!26664 true))

(declare-fun b!276766 () Bool)

(declare-fun res!140756 () Bool)

(assert (=> b!276766 (=> (not res!140756) (not e!176764))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276766 (= res!140756 (and (= (size!6882 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6882 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6882 a!3325))))))

(declare-fun b!276767 () Bool)

(declare-fun res!140757 () Bool)

(assert (=> b!276767 (=> (not res!140757) (not e!176764))))

(declare-datatypes ((List!4338 0))(
  ( (Nil!4335) (Cons!4334 (h!5001 (_ BitVec 64)) (t!9420 List!4338)) )
))
(declare-fun arrayNoDuplicates!0 (array!13761 (_ BitVec 32) List!4338) Bool)

(assert (=> b!276767 (= res!140757 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4335))))

(declare-fun b!276768 () Bool)

(assert (=> b!276768 (= e!176764 e!176763)))

(declare-fun res!140760 () Bool)

(assert (=> b!276768 (=> (not res!140760) (not e!176763))))

(declare-datatypes ((SeekEntryResult!1688 0))(
  ( (MissingZero!1688 (index!8922 (_ BitVec 32))) (Found!1688 (index!8923 (_ BitVec 32))) (Intermediate!1688 (undefined!2500 Bool) (index!8924 (_ BitVec 32)) (x!27181 (_ BitVec 32))) (Undefined!1688) (MissingVacant!1688 (index!8925 (_ BitVec 32))) )
))
(declare-fun lt!137740 () SeekEntryResult!1688)

(assert (=> b!276768 (= res!140760 (or (= lt!137740 (MissingZero!1688 i!1267)) (= lt!137740 (MissingVacant!1688 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13761 (_ BitVec 32)) SeekEntryResult!1688)

(assert (=> b!276768 (= lt!137740 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!276769 () Bool)

(declare-fun res!140758 () Bool)

(assert (=> b!276769 (=> (not res!140758) (not e!176764))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276769 (= res!140758 (validKeyInArray!0 k!2581))))

(declare-fun b!276770 () Bool)

(declare-fun res!140759 () Bool)

(assert (=> b!276770 (=> (not res!140759) (not e!176764))))

(declare-fun arrayContainsKey!0 (array!13761 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276770 (= res!140759 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26664 res!140755) b!276766))

(assert (= (and b!276766 res!140756) b!276769))

(assert (= (and b!276769 res!140758) b!276767))

(assert (= (and b!276767 res!140757) b!276770))

(assert (= (and b!276770 res!140759) b!276768))

(assert (= (and b!276768 res!140760) b!276765))

(declare-fun m!292023 () Bool)

(assert (=> b!276767 m!292023))

(declare-fun m!292025 () Bool)

(assert (=> b!276770 m!292025))

(declare-fun m!292027 () Bool)

(assert (=> start!26664 m!292027))

(declare-fun m!292029 () Bool)

(assert (=> start!26664 m!292029))

(declare-fun m!292031 () Bool)

(assert (=> b!276765 m!292031))

(declare-fun m!292033 () Bool)

(assert (=> b!276769 m!292033))

(declare-fun m!292035 () Bool)

(assert (=> b!276768 m!292035))

(push 1)

