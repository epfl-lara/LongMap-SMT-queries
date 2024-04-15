; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25952 () Bool)

(assert start!25952)

(declare-fun b!267717 () Bool)

(declare-fun res!132050 () Bool)

(declare-fun e!173034 () Bool)

(assert (=> b!267717 (=> (not res!132050) (not e!173034))))

(declare-datatypes ((array!13038 0))(
  ( (array!13039 (arr!6168 (Array (_ BitVec 32) (_ BitVec 64))) (size!6521 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13038)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13038 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267717 (= res!132050 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!267718 () Bool)

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!267718 (= e!173034 (bvslt mask!3868 #b00000000000000000000000000000000))))

(declare-fun b!267719 () Bool)

(declare-fun res!132047 () Bool)

(assert (=> b!267719 (=> (not res!132047) (not e!173034))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267719 (= res!132047 (validKeyInArray!0 k0!2581))))

(declare-fun b!267720 () Bool)

(declare-fun res!132052 () Bool)

(assert (=> b!267720 (=> (not res!132052) (not e!173034))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1325 0))(
  ( (MissingZero!1325 (index!7470 (_ BitVec 32))) (Found!1325 (index!7471 (_ BitVec 32))) (Intermediate!1325 (undefined!2137 Bool) (index!7472 (_ BitVec 32)) (x!25865 (_ BitVec 32))) (Undefined!1325) (MissingVacant!1325 (index!7473 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13038 (_ BitVec 32)) SeekEntryResult!1325)

(assert (=> b!267720 (= res!132052 (not (= (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868) (MissingZero!1325 i!1267))))))

(declare-fun b!267721 () Bool)

(declare-fun res!132051 () Bool)

(assert (=> b!267721 (=> (not res!132051) (not e!173034))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267721 (= res!132051 (and (= (size!6521 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6521 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6521 a!3325))))))

(declare-fun b!267722 () Bool)

(declare-fun res!132049 () Bool)

(assert (=> b!267722 (=> (not res!132049) (not e!173034))))

(declare-datatypes ((List!3949 0))(
  ( (Nil!3946) (Cons!3945 (h!4612 (_ BitVec 64)) (t!9022 List!3949)) )
))
(declare-fun arrayNoDuplicates!0 (array!13038 (_ BitVec 32) List!3949) Bool)

(assert (=> b!267722 (= res!132049 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3946))))

(declare-fun res!132048 () Bool)

(assert (=> start!25952 (=> (not res!132048) (not e!173034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25952 (= res!132048 (validMask!0 mask!3868))))

(assert (=> start!25952 e!173034))

(declare-fun array_inv!4140 (array!13038) Bool)

(assert (=> start!25952 (array_inv!4140 a!3325)))

(assert (=> start!25952 true))

(assert (= (and start!25952 res!132048) b!267721))

(assert (= (and b!267721 res!132051) b!267719))

(assert (= (and b!267719 res!132047) b!267722))

(assert (= (and b!267722 res!132049) b!267717))

(assert (= (and b!267717 res!132050) b!267720))

(assert (= (and b!267720 res!132052) b!267718))

(declare-fun m!283535 () Bool)

(assert (=> b!267719 m!283535))

(declare-fun m!283537 () Bool)

(assert (=> b!267717 m!283537))

(declare-fun m!283539 () Bool)

(assert (=> b!267722 m!283539))

(declare-fun m!283541 () Bool)

(assert (=> b!267720 m!283541))

(declare-fun m!283543 () Bool)

(assert (=> start!25952 m!283543))

(declare-fun m!283545 () Bool)

(assert (=> start!25952 m!283545))

(check-sat (not b!267719) (not b!267720) (not start!25952) (not b!267722) (not b!267717))
(check-sat)
