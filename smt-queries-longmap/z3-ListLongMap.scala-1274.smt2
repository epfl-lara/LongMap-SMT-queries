; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26202 () Bool)

(assert start!26202)

(declare-fun b!270913 () Bool)

(declare-fun res!134880 () Bool)

(declare-fun e!174448 () Bool)

(assert (=> b!270913 (=> (not res!134880) (not e!174448))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!270913 (= res!134880 (not (= startIndex!26 i!1267)))))

(declare-fun b!270914 () Bool)

(declare-fun res!134882 () Bool)

(declare-fun e!174447 () Bool)

(assert (=> b!270914 (=> (not res!134882) (not e!174447))))

(declare-datatypes ((array!13298 0))(
  ( (array!13299 (arr!6298 (Array (_ BitVec 32) (_ BitVec 64))) (size!6650 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13298)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13298 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270914 (= res!134882 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!270915 () Bool)

(declare-fun res!134878 () Bool)

(assert (=> b!270915 (=> (not res!134878) (not e!174448))))

(declare-datatypes ((List!4019 0))(
  ( (Nil!4016) (Cons!4015 (h!4682 (_ BitVec 64)) (t!9093 List!4019)) )
))
(declare-fun noDuplicate!128 (List!4019) Bool)

(assert (=> b!270915 (= res!134878 (noDuplicate!128 Nil!4016))))

(declare-fun b!270916 () Bool)

(declare-fun res!134881 () Bool)

(assert (=> b!270916 (=> (not res!134881) (not e!174448))))

(declare-fun contains!1912 (List!4019 (_ BitVec 64)) Bool)

(assert (=> b!270916 (= res!134881 (not (contains!1912 Nil!4016 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!270917 () Bool)

(assert (=> b!270917 (= e!174448 false)))

(declare-fun lt!135774 () Bool)

(assert (=> b!270917 (= lt!135774 (contains!1912 Nil!4016 k0!2581))))

(declare-fun b!270918 () Bool)

(declare-fun res!134883 () Bool)

(assert (=> b!270918 (=> (not res!134883) (not e!174448))))

(assert (=> b!270918 (= res!134883 (not (contains!1912 Nil!4016 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!270919 () Bool)

(declare-fun res!134885 () Bool)

(assert (=> b!270919 (=> (not res!134885) (not e!174448))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13298 (_ BitVec 32)) Bool)

(assert (=> b!270919 (= res!134885 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!270920 () Bool)

(declare-fun res!134879 () Bool)

(assert (=> b!270920 (=> (not res!134879) (not e!174448))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270920 (= res!134879 (validKeyInArray!0 (select (arr!6298 a!3325) startIndex!26)))))

(declare-fun b!270921 () Bool)

(declare-fun res!134884 () Bool)

(assert (=> b!270921 (=> (not res!134884) (not e!174447))))

(assert (=> b!270921 (= res!134884 (and (= (size!6650 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6650 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6650 a!3325))))))

(declare-fun b!270922 () Bool)

(declare-fun res!134877 () Bool)

(assert (=> b!270922 (=> (not res!134877) (not e!174447))))

(declare-fun arrayNoDuplicates!0 (array!13298 (_ BitVec 32) List!4019) Bool)

(assert (=> b!270922 (= res!134877 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4016))))

(declare-fun b!270923 () Bool)

(declare-fun res!134888 () Bool)

(assert (=> b!270923 (=> (not res!134888) (not e!174447))))

(assert (=> b!270923 (= res!134888 (validKeyInArray!0 k0!2581))))

(declare-fun res!134886 () Bool)

(assert (=> start!26202 (=> (not res!134886) (not e!174447))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26202 (= res!134886 (validMask!0 mask!3868))))

(assert (=> start!26202 e!174447))

(declare-fun array_inv!4248 (array!13298) Bool)

(assert (=> start!26202 (array_inv!4248 a!3325)))

(assert (=> start!26202 true))

(declare-fun b!270924 () Bool)

(assert (=> b!270924 (= e!174447 e!174448)))

(declare-fun res!134889 () Bool)

(assert (=> b!270924 (=> (not res!134889) (not e!174448))))

(declare-datatypes ((SeekEntryResult!1421 0))(
  ( (MissingZero!1421 (index!7854 (_ BitVec 32))) (Found!1421 (index!7855 (_ BitVec 32))) (Intermediate!1421 (undefined!2233 Bool) (index!7856 (_ BitVec 32)) (x!26298 (_ BitVec 32))) (Undefined!1421) (MissingVacant!1421 (index!7857 (_ BitVec 32))) )
))
(declare-fun lt!135773 () SeekEntryResult!1421)

(assert (=> b!270924 (= res!134889 (or (= lt!135773 (MissingZero!1421 i!1267)) (= lt!135773 (MissingVacant!1421 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13298 (_ BitVec 32)) SeekEntryResult!1421)

(assert (=> b!270924 (= lt!135773 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!270925 () Bool)

(declare-fun res!134887 () Bool)

(assert (=> b!270925 (=> (not res!134887) (not e!174448))))

(assert (=> b!270925 (= res!134887 (and (bvslt (size!6650 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6650 a!3325))))))

(assert (= (and start!26202 res!134886) b!270921))

(assert (= (and b!270921 res!134884) b!270923))

(assert (= (and b!270923 res!134888) b!270922))

(assert (= (and b!270922 res!134877) b!270914))

(assert (= (and b!270914 res!134882) b!270924))

(assert (= (and b!270924 res!134889) b!270919))

(assert (= (and b!270919 res!134885) b!270913))

(assert (= (and b!270913 res!134880) b!270920))

(assert (= (and b!270920 res!134879) b!270925))

(assert (= (and b!270925 res!134887) b!270915))

(assert (= (and b!270915 res!134878) b!270918))

(assert (= (and b!270918 res!134883) b!270916))

(assert (= (and b!270916 res!134881) b!270917))

(declare-fun m!286547 () Bool)

(assert (=> b!270919 m!286547))

(declare-fun m!286549 () Bool)

(assert (=> b!270922 m!286549))

(declare-fun m!286551 () Bool)

(assert (=> start!26202 m!286551))

(declare-fun m!286553 () Bool)

(assert (=> start!26202 m!286553))

(declare-fun m!286555 () Bool)

(assert (=> b!270914 m!286555))

(declare-fun m!286557 () Bool)

(assert (=> b!270923 m!286557))

(declare-fun m!286559 () Bool)

(assert (=> b!270916 m!286559))

(declare-fun m!286561 () Bool)

(assert (=> b!270917 m!286561))

(declare-fun m!286563 () Bool)

(assert (=> b!270924 m!286563))

(declare-fun m!286565 () Bool)

(assert (=> b!270920 m!286565))

(assert (=> b!270920 m!286565))

(declare-fun m!286567 () Bool)

(assert (=> b!270920 m!286567))

(declare-fun m!286569 () Bool)

(assert (=> b!270915 m!286569))

(declare-fun m!286571 () Bool)

(assert (=> b!270918 m!286571))

(check-sat (not b!270920) (not b!270922) (not b!270916) (not b!270918) (not b!270919) (not start!26202) (not b!270915) (not b!270924) (not b!270923) (not b!270917) (not b!270914))
(check-sat)
