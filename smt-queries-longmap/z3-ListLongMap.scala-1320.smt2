; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26480 () Bool)

(assert start!26480)

(declare-fun b!274755 () Bool)

(declare-fun e!175826 () Bool)

(declare-fun e!175825 () Bool)

(assert (=> b!274755 (= e!175826 e!175825)))

(declare-fun res!138800 () Bool)

(assert (=> b!274755 (=> (not res!138800) (not e!175825))))

(declare-datatypes ((SeekEntryResult!1589 0))(
  ( (MissingZero!1589 (index!8526 (_ BitVec 32))) (Found!1589 (index!8527 (_ BitVec 32))) (Intermediate!1589 (undefined!2401 Bool) (index!8528 (_ BitVec 32)) (x!26833 (_ BitVec 32))) (Undefined!1589) (MissingVacant!1589 (index!8529 (_ BitVec 32))) )
))
(declare-fun lt!137027 () SeekEntryResult!1589)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!274755 (= res!138800 (or (= lt!137027 (MissingZero!1589 i!1267)) (= lt!137027 (MissingVacant!1589 i!1267))))))

(declare-datatypes ((array!13566 0))(
  ( (array!13567 (arr!6432 (Array (_ BitVec 32) (_ BitVec 64))) (size!6785 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13566)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13566 (_ BitVec 32)) SeekEntryResult!1589)

(assert (=> b!274755 (= lt!137027 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!274756 () Bool)

(declare-fun res!138797 () Bool)

(assert (=> b!274756 (=> (not res!138797) (not e!175826))))

(declare-datatypes ((List!4213 0))(
  ( (Nil!4210) (Cons!4209 (h!4876 (_ BitVec 64)) (t!9286 List!4213)) )
))
(declare-fun arrayNoDuplicates!0 (array!13566 (_ BitVec 32) List!4213) Bool)

(assert (=> b!274756 (= res!138797 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4210))))

(declare-fun res!138799 () Bool)

(assert (=> start!26480 (=> (not res!138799) (not e!175826))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26480 (= res!138799 (validMask!0 mask!3868))))

(assert (=> start!26480 e!175826))

(declare-fun array_inv!4404 (array!13566) Bool)

(assert (=> start!26480 (array_inv!4404 a!3325)))

(assert (=> start!26480 true))

(declare-fun b!274757 () Bool)

(declare-fun res!138798 () Bool)

(assert (=> b!274757 (=> (not res!138798) (not e!175826))))

(declare-fun arrayContainsKey!0 (array!13566 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274757 (= res!138798 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274758 () Bool)

(assert (=> b!274758 (= e!175825 false)))

(declare-fun lt!137028 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13566 (_ BitVec 32)) Bool)

(assert (=> b!274758 (= lt!137028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274759 () Bool)

(declare-fun res!138802 () Bool)

(assert (=> b!274759 (=> (not res!138802) (not e!175826))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!274759 (= res!138802 (and (= (size!6785 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6785 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6785 a!3325))))))

(declare-fun b!274760 () Bool)

(declare-fun res!138801 () Bool)

(assert (=> b!274760 (=> (not res!138801) (not e!175826))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274760 (= res!138801 (validKeyInArray!0 k0!2581))))

(assert (= (and start!26480 res!138799) b!274759))

(assert (= (and b!274759 res!138802) b!274760))

(assert (= (and b!274760 res!138801) b!274756))

(assert (= (and b!274756 res!138797) b!274757))

(assert (= (and b!274757 res!138798) b!274755))

(assert (= (and b!274755 res!138800) b!274758))

(declare-fun m!289997 () Bool)

(assert (=> b!274756 m!289997))

(declare-fun m!289999 () Bool)

(assert (=> start!26480 m!289999))

(declare-fun m!290001 () Bool)

(assert (=> start!26480 m!290001))

(declare-fun m!290003 () Bool)

(assert (=> b!274755 m!290003))

(declare-fun m!290005 () Bool)

(assert (=> b!274758 m!290005))

(declare-fun m!290007 () Bool)

(assert (=> b!274760 m!290007))

(declare-fun m!290009 () Bool)

(assert (=> b!274757 m!290009))

(check-sat (not b!274757) (not b!274755) (not b!274758) (not start!26480) (not b!274760) (not b!274756))
(check-sat)
