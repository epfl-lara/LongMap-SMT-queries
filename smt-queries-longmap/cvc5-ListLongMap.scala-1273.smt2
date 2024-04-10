; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26196 () Bool)

(assert start!26196)

(declare-fun b!270749 () Bool)

(declare-fun res!134747 () Bool)

(declare-fun e!174396 () Bool)

(assert (=> b!270749 (=> (not res!134747) (not e!174396))))

(declare-datatypes ((array!13293 0))(
  ( (array!13294 (arr!6296 (Array (_ BitVec 32) (_ BitVec 64))) (size!6648 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13293)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13293 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270749 (= res!134747 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!270750 () Bool)

(declare-fun res!134743 () Bool)

(assert (=> b!270750 (=> (not res!134743) (not e!174396))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!270750 (= res!134743 (and (= (size!6648 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6648 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6648 a!3325))))))

(declare-fun b!270751 () Bool)

(declare-fun res!134744 () Bool)

(declare-fun e!174397 () Bool)

(assert (=> b!270751 (=> (not res!134744) (not e!174397))))

(assert (=> b!270751 (= res!134744 (not (= startIndex!26 i!1267)))))

(declare-fun b!270752 () Bool)

(declare-fun res!134741 () Bool)

(assert (=> b!270752 (=> (not res!134741) (not e!174396))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270752 (= res!134741 (validKeyInArray!0 k!2581))))

(declare-fun b!270753 () Bool)

(declare-fun res!134750 () Bool)

(assert (=> b!270753 (=> (not res!134750) (not e!174397))))

(declare-datatypes ((List!4104 0))(
  ( (Nil!4101) (Cons!4100 (h!4767 (_ BitVec 64)) (t!9186 List!4104)) )
))
(declare-fun contains!1934 (List!4104 (_ BitVec 64)) Bool)

(assert (=> b!270753 (= res!134750 (not (contains!1934 Nil!4101 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!270754 () Bool)

(declare-fun res!134740 () Bool)

(assert (=> b!270754 (=> (not res!134740) (not e!174397))))

(assert (=> b!270754 (= res!134740 (validKeyInArray!0 (select (arr!6296 a!3325) startIndex!26)))))

(declare-fun b!270755 () Bool)

(declare-fun res!134745 () Bool)

(assert (=> b!270755 (=> (not res!134745) (not e!174397))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13293 (_ BitVec 32)) Bool)

(assert (=> b!270755 (= res!134745 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!270756 () Bool)

(declare-fun res!134739 () Bool)

(assert (=> b!270756 (=> (not res!134739) (not e!174397))))

(declare-fun noDuplicate!122 (List!4104) Bool)

(assert (=> b!270756 (= res!134739 (noDuplicate!122 Nil!4101))))

(declare-fun b!270757 () Bool)

(assert (=> b!270757 (= e!174396 e!174397)))

(declare-fun res!134751 () Bool)

(assert (=> b!270757 (=> (not res!134751) (not e!174397))))

(declare-datatypes ((SeekEntryResult!1454 0))(
  ( (MissingZero!1454 (index!7986 (_ BitVec 32))) (Found!1454 (index!7987 (_ BitVec 32))) (Intermediate!1454 (undefined!2266 Bool) (index!7988 (_ BitVec 32)) (x!26323 (_ BitVec 32))) (Undefined!1454) (MissingVacant!1454 (index!7989 (_ BitVec 32))) )
))
(declare-fun lt!135696 () SeekEntryResult!1454)

(assert (=> b!270757 (= res!134751 (or (= lt!135696 (MissingZero!1454 i!1267)) (= lt!135696 (MissingVacant!1454 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13293 (_ BitVec 32)) SeekEntryResult!1454)

(assert (=> b!270757 (= lt!135696 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!134749 () Bool)

(assert (=> start!26196 (=> (not res!134749) (not e!174396))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26196 (= res!134749 (validMask!0 mask!3868))))

(assert (=> start!26196 e!174396))

(declare-fun array_inv!4259 (array!13293) Bool)

(assert (=> start!26196 (array_inv!4259 a!3325)))

(assert (=> start!26196 true))

(declare-fun b!270758 () Bool)

(assert (=> b!270758 (= e!174397 false)))

(declare-fun lt!135697 () Bool)

(assert (=> b!270758 (= lt!135697 (contains!1934 Nil!4101 k!2581))))

(declare-fun b!270759 () Bool)

(declare-fun res!134742 () Bool)

(assert (=> b!270759 (=> (not res!134742) (not e!174397))))

(assert (=> b!270759 (= res!134742 (not (contains!1934 Nil!4101 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!270760 () Bool)

(declare-fun res!134748 () Bool)

(assert (=> b!270760 (=> (not res!134748) (not e!174396))))

(declare-fun arrayNoDuplicates!0 (array!13293 (_ BitVec 32) List!4104) Bool)

(assert (=> b!270760 (= res!134748 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4101))))

(declare-fun b!270761 () Bool)

(declare-fun res!134746 () Bool)

(assert (=> b!270761 (=> (not res!134746) (not e!174397))))

(assert (=> b!270761 (= res!134746 (and (bvslt (size!6648 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6648 a!3325))))))

(assert (= (and start!26196 res!134749) b!270750))

(assert (= (and b!270750 res!134743) b!270752))

(assert (= (and b!270752 res!134741) b!270760))

(assert (= (and b!270760 res!134748) b!270749))

(assert (= (and b!270749 res!134747) b!270757))

(assert (= (and b!270757 res!134751) b!270755))

(assert (= (and b!270755 res!134745) b!270751))

(assert (= (and b!270751 res!134744) b!270754))

(assert (= (and b!270754 res!134740) b!270761))

(assert (= (and b!270761 res!134746) b!270756))

(assert (= (and b!270756 res!134739) b!270759))

(assert (= (and b!270759 res!134742) b!270753))

(assert (= (and b!270753 res!134750) b!270758))

(declare-fun m!286263 () Bool)

(assert (=> b!270752 m!286263))

(declare-fun m!286265 () Bool)

(assert (=> b!270755 m!286265))

(declare-fun m!286267 () Bool)

(assert (=> b!270757 m!286267))

(declare-fun m!286269 () Bool)

(assert (=> b!270759 m!286269))

(declare-fun m!286271 () Bool)

(assert (=> b!270753 m!286271))

(declare-fun m!286273 () Bool)

(assert (=> b!270754 m!286273))

(assert (=> b!270754 m!286273))

(declare-fun m!286275 () Bool)

(assert (=> b!270754 m!286275))

(declare-fun m!286277 () Bool)

(assert (=> b!270758 m!286277))

(declare-fun m!286279 () Bool)

(assert (=> b!270756 m!286279))

(declare-fun m!286281 () Bool)

(assert (=> b!270749 m!286281))

(declare-fun m!286283 () Bool)

(assert (=> b!270760 m!286283))

(declare-fun m!286285 () Bool)

(assert (=> start!26196 m!286285))

(declare-fun m!286287 () Bool)

(assert (=> start!26196 m!286287))

(push 1)

