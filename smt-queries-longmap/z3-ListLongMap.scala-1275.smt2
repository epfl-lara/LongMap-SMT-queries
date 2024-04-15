; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26210 () Bool)

(assert start!26210)

(declare-fun b!270836 () Bool)

(declare-fun e!174351 () Bool)

(declare-fun e!174349 () Bool)

(assert (=> b!270836 (= e!174351 e!174349)))

(declare-fun res!134878 () Bool)

(assert (=> b!270836 (=> (not res!134878) (not e!174349))))

(declare-datatypes ((SeekEntryResult!1454 0))(
  ( (MissingZero!1454 (index!7986 (_ BitVec 32))) (Found!1454 (index!7987 (_ BitVec 32))) (Intermediate!1454 (undefined!2266 Bool) (index!7988 (_ BitVec 32)) (x!26338 (_ BitVec 32))) (Undefined!1454) (MissingVacant!1454 (index!7989 (_ BitVec 32))) )
))
(declare-fun lt!135552 () SeekEntryResult!1454)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!270836 (= res!134878 (or (= lt!135552 (MissingZero!1454 i!1267)) (= lt!135552 (MissingVacant!1454 i!1267))))))

(declare-datatypes ((array!13296 0))(
  ( (array!13297 (arr!6297 (Array (_ BitVec 32) (_ BitVec 64))) (size!6650 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13296)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13296 (_ BitVec 32)) SeekEntryResult!1454)

(assert (=> b!270836 (= lt!135552 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!270837 () Bool)

(declare-fun res!134886 () Bool)

(assert (=> b!270837 (=> (not res!134886) (not e!174349))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270837 (= res!134886 (validKeyInArray!0 (select (arr!6297 a!3325) startIndex!26)))))

(declare-fun b!270839 () Bool)

(declare-fun res!134887 () Bool)

(assert (=> b!270839 (=> (not res!134887) (not e!174351))))

(assert (=> b!270839 (= res!134887 (validKeyInArray!0 k0!2581))))

(declare-fun b!270840 () Bool)

(declare-fun res!134880 () Bool)

(assert (=> b!270840 (=> (not res!134880) (not e!174349))))

(assert (=> b!270840 (= res!134880 (not (= startIndex!26 i!1267)))))

(declare-fun b!270841 () Bool)

(assert (=> b!270841 (= e!174349 false)))

(declare-fun lt!135551 () Bool)

(declare-datatypes ((List!4078 0))(
  ( (Nil!4075) (Cons!4074 (h!4741 (_ BitVec 64)) (t!9151 List!4078)) )
))
(declare-fun contains!1916 (List!4078 (_ BitVec 64)) Bool)

(assert (=> b!270841 (= lt!135551 (contains!1916 Nil!4075 k0!2581))))

(declare-fun b!270842 () Bool)

(declare-fun res!134883 () Bool)

(assert (=> b!270842 (=> (not res!134883) (not e!174349))))

(assert (=> b!270842 (= res!134883 (and (bvslt (size!6650 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6650 a!3325))))))

(declare-fun b!270843 () Bool)

(declare-fun res!134881 () Bool)

(assert (=> b!270843 (=> (not res!134881) (not e!174349))))

(assert (=> b!270843 (= res!134881 (not (contains!1916 Nil!4075 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!270844 () Bool)

(declare-fun res!134885 () Bool)

(assert (=> b!270844 (=> (not res!134885) (not e!174351))))

(assert (=> b!270844 (= res!134885 (and (= (size!6650 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6650 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6650 a!3325))))))

(declare-fun b!270845 () Bool)

(declare-fun res!134890 () Bool)

(assert (=> b!270845 (=> (not res!134890) (not e!174349))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13296 (_ BitVec 32)) Bool)

(assert (=> b!270845 (= res!134890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!270846 () Bool)

(declare-fun res!134882 () Bool)

(assert (=> b!270846 (=> (not res!134882) (not e!174351))))

(declare-fun arrayContainsKey!0 (array!13296 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270846 (= res!134882 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!134884 () Bool)

(assert (=> start!26210 (=> (not res!134884) (not e!174351))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26210 (= res!134884 (validMask!0 mask!3868))))

(assert (=> start!26210 e!174351))

(declare-fun array_inv!4269 (array!13296) Bool)

(assert (=> start!26210 (array_inv!4269 a!3325)))

(assert (=> start!26210 true))

(declare-fun b!270838 () Bool)

(declare-fun res!134889 () Bool)

(assert (=> b!270838 (=> (not res!134889) (not e!174349))))

(assert (=> b!270838 (= res!134889 (not (contains!1916 Nil!4075 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!270847 () Bool)

(declare-fun res!134888 () Bool)

(assert (=> b!270847 (=> (not res!134888) (not e!174349))))

(declare-fun noDuplicate!130 (List!4078) Bool)

(assert (=> b!270847 (= res!134888 (noDuplicate!130 Nil!4075))))

(declare-fun b!270848 () Bool)

(declare-fun res!134879 () Bool)

(assert (=> b!270848 (=> (not res!134879) (not e!174351))))

(declare-fun arrayNoDuplicates!0 (array!13296 (_ BitVec 32) List!4078) Bool)

(assert (=> b!270848 (= res!134879 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4075))))

(assert (= (and start!26210 res!134884) b!270844))

(assert (= (and b!270844 res!134885) b!270839))

(assert (= (and b!270839 res!134887) b!270848))

(assert (= (and b!270848 res!134879) b!270846))

(assert (= (and b!270846 res!134882) b!270836))

(assert (= (and b!270836 res!134878) b!270845))

(assert (= (and b!270845 res!134890) b!270840))

(assert (= (and b!270840 res!134880) b!270837))

(assert (= (and b!270837 res!134886) b!270842))

(assert (= (and b!270842 res!134883) b!270847))

(assert (= (and b!270847 res!134888) b!270838))

(assert (= (and b!270838 res!134889) b!270843))

(assert (= (and b!270843 res!134881) b!270841))

(declare-fun m!285827 () Bool)

(assert (=> b!270838 m!285827))

(declare-fun m!285829 () Bool)

(assert (=> b!270839 m!285829))

(declare-fun m!285831 () Bool)

(assert (=> b!270846 m!285831))

(declare-fun m!285833 () Bool)

(assert (=> b!270845 m!285833))

(declare-fun m!285835 () Bool)

(assert (=> b!270841 m!285835))

(declare-fun m!285837 () Bool)

(assert (=> b!270837 m!285837))

(assert (=> b!270837 m!285837))

(declare-fun m!285839 () Bool)

(assert (=> b!270837 m!285839))

(declare-fun m!285841 () Bool)

(assert (=> b!270836 m!285841))

(declare-fun m!285843 () Bool)

(assert (=> b!270847 m!285843))

(declare-fun m!285845 () Bool)

(assert (=> start!26210 m!285845))

(declare-fun m!285847 () Bool)

(assert (=> start!26210 m!285847))

(declare-fun m!285849 () Bool)

(assert (=> b!270848 m!285849))

(declare-fun m!285851 () Bool)

(assert (=> b!270843 m!285851))

(check-sat (not b!270841) (not b!270846) (not b!270847) (not b!270839) (not b!270848) (not start!26210) (not b!270837) (not b!270845) (not b!270838) (not b!270843) (not b!270836))
(check-sat)
