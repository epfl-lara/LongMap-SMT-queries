; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25716 () Bool)

(assert start!25716)

(declare-fun b!266670 () Bool)

(declare-fun res!130968 () Bool)

(declare-fun e!172502 () Bool)

(assert (=> b!266670 (=> (not res!130968) (not e!172502))))

(declare-datatypes ((array!12895 0))(
  ( (array!12896 (arr!6102 (Array (_ BitVec 32) (_ BitVec 64))) (size!6454 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12895)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266670 (= res!130968 (and (= (size!6454 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6454 a!3436))))))

(declare-fun b!266672 () Bool)

(declare-fun res!130971 () Bool)

(declare-fun e!172500 () Bool)

(assert (=> b!266672 (=> (not res!130971) (not e!172500))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12895 (_ BitVec 32)) Bool)

(assert (=> b!266672 (= res!130971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266673 () Bool)

(assert (=> b!266673 (= e!172500 false)))

(declare-fun lt!134494 () Bool)

(declare-datatypes ((List!3916 0))(
  ( (Nil!3913) (Cons!3912 (h!4579 (_ BitVec 64)) (t!8998 List!3916)) )
))
(declare-fun arrayNoDuplicates!0 (array!12895 (_ BitVec 32) List!3916) Bool)

(assert (=> b!266673 (= lt!134494 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3913))))

(declare-fun b!266674 () Bool)

(assert (=> b!266674 (= e!172502 e!172500)))

(declare-fun res!130969 () Bool)

(assert (=> b!266674 (=> (not res!130969) (not e!172500))))

(declare-datatypes ((SeekEntryResult!1293 0))(
  ( (MissingZero!1293 (index!7342 (_ BitVec 32))) (Found!1293 (index!7343 (_ BitVec 32))) (Intermediate!1293 (undefined!2105 Bool) (index!7344 (_ BitVec 32)) (x!25642 (_ BitVec 32))) (Undefined!1293) (MissingVacant!1293 (index!7345 (_ BitVec 32))) )
))
(declare-fun lt!134493 () SeekEntryResult!1293)

(assert (=> b!266674 (= res!130969 (or (= lt!134493 (MissingZero!1293 i!1355)) (= lt!134493 (MissingVacant!1293 i!1355))))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12895 (_ BitVec 32)) SeekEntryResult!1293)

(assert (=> b!266674 (= lt!134493 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!266675 () Bool)

(declare-fun res!130970 () Bool)

(assert (=> b!266675 (=> (not res!130970) (not e!172502))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266675 (= res!130970 (validKeyInArray!0 k0!2698))))

(declare-fun b!266671 () Bool)

(declare-fun res!130967 () Bool)

(assert (=> b!266671 (=> (not res!130967) (not e!172502))))

(declare-fun arrayContainsKey!0 (array!12895 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266671 (= res!130967 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun res!130966 () Bool)

(assert (=> start!25716 (=> (not res!130966) (not e!172502))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25716 (= res!130966 (validMask!0 mask!4002))))

(assert (=> start!25716 e!172502))

(assert (=> start!25716 true))

(declare-fun array_inv!4065 (array!12895) Bool)

(assert (=> start!25716 (array_inv!4065 a!3436)))

(assert (= (and start!25716 res!130966) b!266670))

(assert (= (and b!266670 res!130968) b!266675))

(assert (= (and b!266675 res!130970) b!266671))

(assert (= (and b!266671 res!130967) b!266674))

(assert (= (and b!266674 res!130969) b!266672))

(assert (= (and b!266672 res!130971) b!266673))

(declare-fun m!283217 () Bool)

(assert (=> b!266673 m!283217))

(declare-fun m!283219 () Bool)

(assert (=> start!25716 m!283219))

(declare-fun m!283221 () Bool)

(assert (=> start!25716 m!283221))

(declare-fun m!283223 () Bool)

(assert (=> b!266674 m!283223))

(declare-fun m!283225 () Bool)

(assert (=> b!266675 m!283225))

(declare-fun m!283227 () Bool)

(assert (=> b!266671 m!283227))

(declare-fun m!283229 () Bool)

(assert (=> b!266672 m!283229))

(check-sat (not b!266671) (not start!25716) (not b!266673) (not b!266674) (not b!266675) (not b!266672))
(check-sat)
