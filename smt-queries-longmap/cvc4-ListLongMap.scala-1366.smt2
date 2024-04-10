; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26854 () Bool)

(assert start!26854)

(declare-fun b!278586 () Bool)

(declare-fun e!177687 () Bool)

(assert (=> b!278586 (= e!177687 false)))

(declare-fun lt!138427 () Bool)

(declare-datatypes ((array!13858 0))(
  ( (array!13859 (arr!6577 (Array (_ BitVec 32) (_ BitVec 64))) (size!6929 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13858)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13858 (_ BitVec 32)) Bool)

(assert (=> b!278586 (= lt!138427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!278587 () Bool)

(declare-fun e!177688 () Bool)

(assert (=> b!278587 (= e!177688 e!177687)))

(declare-fun res!142019 () Bool)

(assert (=> b!278587 (=> (not res!142019) (not e!177687))))

(declare-datatypes ((SeekEntryResult!1735 0))(
  ( (MissingZero!1735 (index!9110 (_ BitVec 32))) (Found!1735 (index!9111 (_ BitVec 32))) (Intermediate!1735 (undefined!2547 Bool) (index!9112 (_ BitVec 32)) (x!27357 (_ BitVec 32))) (Undefined!1735) (MissingVacant!1735 (index!9113 (_ BitVec 32))) )
))
(declare-fun lt!138426 () SeekEntryResult!1735)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!278587 (= res!142019 (or (= lt!138426 (MissingZero!1735 i!1267)) (= lt!138426 (MissingVacant!1735 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13858 (_ BitVec 32)) SeekEntryResult!1735)

(assert (=> b!278587 (= lt!138426 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!278588 () Bool)

(declare-fun res!142018 () Bool)

(assert (=> b!278588 (=> (not res!142018) (not e!177688))))

(declare-datatypes ((List!4385 0))(
  ( (Nil!4382) (Cons!4381 (h!5051 (_ BitVec 64)) (t!9467 List!4385)) )
))
(declare-fun arrayNoDuplicates!0 (array!13858 (_ BitVec 32) List!4385) Bool)

(assert (=> b!278588 (= res!142018 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4382))))

(declare-fun b!278590 () Bool)

(declare-fun res!142015 () Bool)

(assert (=> b!278590 (=> (not res!142015) (not e!177688))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!278590 (= res!142015 (and (= (size!6929 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6929 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6929 a!3325))))))

(declare-fun b!278591 () Bool)

(declare-fun res!142016 () Bool)

(assert (=> b!278591 (=> (not res!142016) (not e!177688))))

(declare-fun arrayContainsKey!0 (array!13858 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!278591 (= res!142016 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!278589 () Bool)

(declare-fun res!142020 () Bool)

(assert (=> b!278589 (=> (not res!142020) (not e!177688))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!278589 (= res!142020 (validKeyInArray!0 k!2581))))

(declare-fun res!142017 () Bool)

(assert (=> start!26854 (=> (not res!142017) (not e!177688))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26854 (= res!142017 (validMask!0 mask!3868))))

(assert (=> start!26854 e!177688))

(declare-fun array_inv!4540 (array!13858) Bool)

(assert (=> start!26854 (array_inv!4540 a!3325)))

(assert (=> start!26854 true))

(assert (= (and start!26854 res!142017) b!278590))

(assert (= (and b!278590 res!142015) b!278589))

(assert (= (and b!278589 res!142020) b!278588))

(assert (= (and b!278588 res!142018) b!278591))

(assert (= (and b!278591 res!142016) b!278587))

(assert (= (and b!278587 res!142019) b!278586))

(declare-fun m!293623 () Bool)

(assert (=> b!278591 m!293623))

(declare-fun m!293625 () Bool)

(assert (=> start!26854 m!293625))

(declare-fun m!293627 () Bool)

(assert (=> start!26854 m!293627))

(declare-fun m!293629 () Bool)

(assert (=> b!278586 m!293629))

(declare-fun m!293631 () Bool)

(assert (=> b!278587 m!293631))

(declare-fun m!293633 () Bool)

(assert (=> b!278588 m!293633))

(declare-fun m!293635 () Bool)

(assert (=> b!278589 m!293635))

(push 1)

(assert (not b!278587))

(assert (not b!278589))

(assert (not b!278588))

(assert (not b!278586))

(assert (not start!26854))

(assert (not b!278591))

(check-sat)

