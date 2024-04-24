; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25706 () Bool)

(assert start!25706)

(declare-fun b!266591 () Bool)

(declare-fun res!130861 () Bool)

(declare-fun e!172462 () Bool)

(assert (=> b!266591 (=> (not res!130861) (not e!172462))))

(declare-datatypes ((array!12880 0))(
  ( (array!12881 (arr!6094 (Array (_ BitVec 32) (_ BitVec 64))) (size!6446 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12880)

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12880 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266591 (= res!130861 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266592 () Bool)

(declare-fun e!172463 () Bool)

(assert (=> b!266592 (= e!172462 e!172463)))

(declare-fun res!130864 () Bool)

(assert (=> b!266592 (=> (not res!130864) (not e!172463))))

(declare-datatypes ((SeekEntryResult!1250 0))(
  ( (MissingZero!1250 (index!7170 (_ BitVec 32))) (Found!1250 (index!7171 (_ BitVec 32))) (Intermediate!1250 (undefined!2062 Bool) (index!7172 (_ BitVec 32)) (x!25583 (_ BitVec 32))) (Undefined!1250) (MissingVacant!1250 (index!7173 (_ BitVec 32))) )
))
(declare-fun lt!134510 () SeekEntryResult!1250)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266592 (= res!130864 (or (= lt!134510 (MissingZero!1250 i!1355)) (= lt!134510 (MissingVacant!1250 i!1355))))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12880 (_ BitVec 32)) SeekEntryResult!1250)

(assert (=> b!266592 (= lt!134510 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!266593 () Bool)

(assert (=> b!266593 (= e!172463 false)))

(declare-fun lt!134511 () Bool)

(declare-datatypes ((List!3821 0))(
  ( (Nil!3818) (Cons!3817 (h!4484 (_ BitVec 64)) (t!8895 List!3821)) )
))
(declare-fun arrayNoDuplicates!0 (array!12880 (_ BitVec 32) List!3821) Bool)

(assert (=> b!266593 (= lt!134511 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3818))))

(declare-fun b!266595 () Bool)

(declare-fun res!130862 () Bool)

(assert (=> b!266595 (=> (not res!130862) (not e!172462))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266595 (= res!130862 (validKeyInArray!0 k0!2698))))

(declare-fun b!266596 () Bool)

(declare-fun res!130866 () Bool)

(assert (=> b!266596 (=> (not res!130866) (not e!172462))))

(assert (=> b!266596 (= res!130866 (and (= (size!6446 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6446 a!3436))))))

(declare-fun res!130865 () Bool)

(assert (=> start!25706 (=> (not res!130865) (not e!172462))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25706 (= res!130865 (validMask!0 mask!4002))))

(assert (=> start!25706 e!172462))

(assert (=> start!25706 true))

(declare-fun array_inv!4044 (array!12880) Bool)

(assert (=> start!25706 (array_inv!4044 a!3436)))

(declare-fun b!266594 () Bool)

(declare-fun res!130863 () Bool)

(assert (=> b!266594 (=> (not res!130863) (not e!172463))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12880 (_ BitVec 32)) Bool)

(assert (=> b!266594 (= res!130863 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(assert (= (and start!25706 res!130865) b!266596))

(assert (= (and b!266596 res!130866) b!266595))

(assert (= (and b!266595 res!130862) b!266591))

(assert (= (and b!266591 res!130861) b!266592))

(assert (= (and b!266592 res!130864) b!266594))

(assert (= (and b!266594 res!130863) b!266593))

(declare-fun m!283325 () Bool)

(assert (=> b!266595 m!283325))

(declare-fun m!283327 () Bool)

(assert (=> b!266592 m!283327))

(declare-fun m!283329 () Bool)

(assert (=> b!266593 m!283329))

(declare-fun m!283331 () Bool)

(assert (=> b!266591 m!283331))

(declare-fun m!283333 () Bool)

(assert (=> start!25706 m!283333))

(declare-fun m!283335 () Bool)

(assert (=> start!25706 m!283335))

(declare-fun m!283337 () Bool)

(assert (=> b!266594 m!283337))

(check-sat (not b!266593) (not b!266595) (not b!266594) (not b!266591) (not start!25706) (not b!266592))
(check-sat)
