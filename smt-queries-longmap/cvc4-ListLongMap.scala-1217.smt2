; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25772 () Bool)

(assert start!25772)

(declare-fun b!267183 () Bool)

(declare-fun res!131482 () Bool)

(declare-fun e!172753 () Bool)

(assert (=> b!267183 (=> (not res!131482) (not e!172753))))

(declare-datatypes ((array!12951 0))(
  ( (array!12952 (arr!6130 (Array (_ BitVec 32) (_ BitVec 64))) (size!6482 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12951)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!267183 (= res!131482 (and (= (size!6482 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6482 a!3436))))))

(declare-fun b!267184 () Bool)

(declare-fun res!131480 () Bool)

(assert (=> b!267184 (=> (not res!131480) (not e!172753))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12951 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267184 (= res!131480 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun res!131484 () Bool)

(assert (=> start!25772 (=> (not res!131484) (not e!172753))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25772 (= res!131484 (validMask!0 mask!4002))))

(assert (=> start!25772 e!172753))

(assert (=> start!25772 true))

(declare-fun array_inv!4093 (array!12951) Bool)

(assert (=> start!25772 (array_inv!4093 a!3436)))

(declare-fun b!267185 () Bool)

(declare-fun e!172752 () Bool)

(assert (=> b!267185 (= e!172753 e!172752)))

(declare-fun res!131483 () Bool)

(assert (=> b!267185 (=> (not res!131483) (not e!172752))))

(declare-datatypes ((SeekEntryResult!1321 0))(
  ( (MissingZero!1321 (index!7454 (_ BitVec 32))) (Found!1321 (index!7455 (_ BitVec 32))) (Intermediate!1321 (undefined!2133 Bool) (index!7456 (_ BitVec 32)) (x!25742 (_ BitVec 32))) (Undefined!1321) (MissingVacant!1321 (index!7457 (_ BitVec 32))) )
))
(declare-fun lt!134652 () SeekEntryResult!1321)

(assert (=> b!267185 (= res!131483 (or (= lt!134652 (MissingZero!1321 i!1355)) (= lt!134652 (MissingVacant!1321 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12951 (_ BitVec 32)) SeekEntryResult!1321)

(assert (=> b!267185 (= lt!134652 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!267186 () Bool)

(declare-fun res!131481 () Bool)

(assert (=> b!267186 (=> (not res!131481) (not e!172753))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267186 (= res!131481 (validKeyInArray!0 k!2698))))

(declare-fun b!267187 () Bool)

(declare-fun res!131479 () Bool)

(assert (=> b!267187 (=> (not res!131479) (not e!172752))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12951 (_ BitVec 32)) Bool)

(assert (=> b!267187 (= res!131479 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!267188 () Bool)

(assert (=> b!267188 (= e!172752 false)))

(declare-fun lt!134653 () Bool)

(declare-datatypes ((List!3944 0))(
  ( (Nil!3941) (Cons!3940 (h!4607 (_ BitVec 64)) (t!9026 List!3944)) )
))
(declare-fun arrayNoDuplicates!0 (array!12951 (_ BitVec 32) List!3944) Bool)

(assert (=> b!267188 (= lt!134653 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3941))))

(assert (= (and start!25772 res!131484) b!267183))

(assert (= (and b!267183 res!131482) b!267186))

(assert (= (and b!267186 res!131481) b!267184))

(assert (= (and b!267184 res!131480) b!267185))

(assert (= (and b!267185 res!131483) b!267187))

(assert (= (and b!267187 res!131479) b!267188))

(declare-fun m!283609 () Bool)

(assert (=> b!267188 m!283609))

(declare-fun m!283611 () Bool)

(assert (=> b!267185 m!283611))

(declare-fun m!283613 () Bool)

(assert (=> b!267186 m!283613))

(declare-fun m!283615 () Bool)

(assert (=> b!267187 m!283615))

(declare-fun m!283617 () Bool)

(assert (=> b!267184 m!283617))

(declare-fun m!283619 () Bool)

(assert (=> start!25772 m!283619))

(declare-fun m!283621 () Bool)

(assert (=> start!25772 m!283621))

(push 1)

(assert (not b!267186))

(assert (not b!267187))

(assert (not b!267184))

(assert (not start!25772))

(assert (not b!267188))

(assert (not b!267185))

(check-sat)

