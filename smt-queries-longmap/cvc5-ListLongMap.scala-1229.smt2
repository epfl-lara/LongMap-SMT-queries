; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25938 () Bool)

(assert start!25938)

(declare-fun res!131962 () Bool)

(declare-fun e!172992 () Bool)

(assert (=> start!25938 (=> (not res!131962) (not e!172992))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25938 (= res!131962 (validMask!0 mask!3868))))

(assert (=> start!25938 e!172992))

(declare-datatypes ((array!13024 0))(
  ( (array!13025 (arr!6161 (Array (_ BitVec 32) (_ BitVec 64))) (size!6514 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13024)

(declare-fun array_inv!4133 (array!13024) Bool)

(assert (=> start!25938 (array_inv!4133 a!3325)))

(assert (=> start!25938 true))

(declare-fun b!267630 () Bool)

(declare-fun res!131960 () Bool)

(assert (=> b!267630 (=> (not res!131960) (not e!172992))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267630 (= res!131960 (and (= (size!6514 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6514 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6514 a!3325))))))

(declare-fun b!267631 () Bool)

(declare-fun res!131961 () Bool)

(assert (=> b!267631 (=> (not res!131961) (not e!172992))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267631 (= res!131961 (validKeyInArray!0 k!2581))))

(declare-fun b!267632 () Bool)

(assert (=> b!267632 (= e!172992 false)))

(declare-fun lt!134547 () Bool)

(declare-datatypes ((List!3942 0))(
  ( (Nil!3939) (Cons!3938 (h!4605 (_ BitVec 64)) (t!9015 List!3942)) )
))
(declare-fun arrayNoDuplicates!0 (array!13024 (_ BitVec 32) List!3942) Bool)

(assert (=> b!267632 (= lt!134547 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3939))))

(assert (= (and start!25938 res!131962) b!267630))

(assert (= (and b!267630 res!131960) b!267631))

(assert (= (and b!267631 res!131961) b!267632))

(declare-fun m!283467 () Bool)

(assert (=> start!25938 m!283467))

(declare-fun m!283469 () Bool)

(assert (=> start!25938 m!283469))

(declare-fun m!283471 () Bool)

(assert (=> b!267631 m!283471))

(declare-fun m!283473 () Bool)

(assert (=> b!267632 m!283473))

(push 1)

(assert (not b!267632))

(assert (not b!267631))

(assert (not start!25938))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

