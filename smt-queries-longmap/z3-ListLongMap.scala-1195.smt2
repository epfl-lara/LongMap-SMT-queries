; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25640 () Bool)

(assert start!25640)

(declare-fun b!265731 () Bool)

(declare-fun res!130082 () Bool)

(declare-fun e!172041 () Bool)

(assert (=> b!265731 (=> (not res!130082) (not e!172041))))

(declare-datatypes ((array!12807 0))(
  ( (array!12808 (arr!6057 (Array (_ BitVec 32) (_ BitVec 64))) (size!6410 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12807)

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12807 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265731 (= res!130082 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun res!130080 () Bool)

(assert (=> start!25640 (=> (not res!130080) (not e!172041))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25640 (= res!130080 (validMask!0 mask!4002))))

(assert (=> start!25640 e!172041))

(assert (=> start!25640 true))

(declare-fun array_inv!4029 (array!12807) Bool)

(assert (=> start!25640 (array_inv!4029 a!3436)))

(declare-fun b!265732 () Bool)

(declare-fun e!172039 () Bool)

(assert (=> b!265732 (= e!172039 false)))

(declare-fun lt!134072 () Bool)

(declare-datatypes ((List!3844 0))(
  ( (Nil!3841) (Cons!3840 (h!4507 (_ BitVec 64)) (t!8917 List!3844)) )
))
(declare-fun arrayNoDuplicates!0 (array!12807 (_ BitVec 32) List!3844) Bool)

(assert (=> b!265732 (= lt!134072 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3841))))

(declare-fun b!265733 () Bool)

(declare-fun res!130084 () Bool)

(assert (=> b!265733 (=> (not res!130084) (not e!172041))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265733 (= res!130084 (validKeyInArray!0 k0!2698))))

(declare-fun b!265734 () Bool)

(assert (=> b!265734 (= e!172041 e!172039)))

(declare-fun res!130079 () Bool)

(assert (=> b!265734 (=> (not res!130079) (not e!172039))))

(declare-datatypes ((SeekEntryResult!1247 0))(
  ( (MissingZero!1247 (index!7158 (_ BitVec 32))) (Found!1247 (index!7159 (_ BitVec 32))) (Intermediate!1247 (undefined!2059 Bool) (index!7160 (_ BitVec 32)) (x!25491 (_ BitVec 32))) (Undefined!1247) (MissingVacant!1247 (index!7161 (_ BitVec 32))) )
))
(declare-fun lt!134073 () SeekEntryResult!1247)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265734 (= res!130079 (or (= lt!134073 (MissingZero!1247 i!1355)) (= lt!134073 (MissingVacant!1247 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12807 (_ BitVec 32)) SeekEntryResult!1247)

(assert (=> b!265734 (= lt!134073 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!265735 () Bool)

(declare-fun res!130083 () Bool)

(assert (=> b!265735 (=> (not res!130083) (not e!172041))))

(assert (=> b!265735 (= res!130083 (and (= (size!6410 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6410 a!3436))))))

(declare-fun b!265736 () Bool)

(declare-fun res!130081 () Bool)

(assert (=> b!265736 (=> (not res!130081) (not e!172039))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12807 (_ BitVec 32)) Bool)

(assert (=> b!265736 (= res!130081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(assert (= (and start!25640 res!130080) b!265735))

(assert (= (and b!265735 res!130083) b!265733))

(assert (= (and b!265733 res!130084) b!265731))

(assert (= (and b!265731 res!130082) b!265734))

(assert (= (and b!265734 res!130079) b!265736))

(assert (= (and b!265736 res!130081) b!265732))

(declare-fun m!281993 () Bool)

(assert (=> b!265734 m!281993))

(declare-fun m!281995 () Bool)

(assert (=> b!265736 m!281995))

(declare-fun m!281997 () Bool)

(assert (=> b!265733 m!281997))

(declare-fun m!281999 () Bool)

(assert (=> start!25640 m!281999))

(declare-fun m!282001 () Bool)

(assert (=> start!25640 m!282001))

(declare-fun m!282003 () Bool)

(assert (=> b!265732 m!282003))

(declare-fun m!282005 () Bool)

(assert (=> b!265731 m!282005))

(check-sat (not b!265733) (not b!265736) (not start!25640) (not b!265731) (not b!265734) (not b!265732))
(check-sat)
