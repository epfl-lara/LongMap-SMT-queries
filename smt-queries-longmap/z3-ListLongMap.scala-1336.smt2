; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26574 () Bool)

(assert start!26574)

(declare-fun b!275957 () Bool)

(declare-fun res!139923 () Bool)

(declare-fun e!176383 () Bool)

(assert (=> b!275957 (=> (not res!139923) (not e!176383))))

(declare-datatypes ((array!13670 0))(
  ( (array!13671 (arr!6484 (Array (_ BitVec 32) (_ BitVec 64))) (size!6836 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13670)

(declare-datatypes ((List!4205 0))(
  ( (Nil!4202) (Cons!4201 (h!4868 (_ BitVec 64)) (t!9279 List!4205)) )
))
(declare-fun arrayNoDuplicates!0 (array!13670 (_ BitVec 32) List!4205) Bool)

(assert (=> b!275957 (= res!139923 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4202))))

(declare-fun b!275958 () Bool)

(declare-fun e!176384 () Bool)

(assert (=> b!275958 (= e!176384 false)))

(declare-fun lt!137556 () Bool)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13670 (_ BitVec 32)) Bool)

(assert (=> b!275958 (= lt!137556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275959 () Bool)

(declare-fun res!139926 () Bool)

(assert (=> b!275959 (=> (not res!139926) (not e!176383))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!275959 (= res!139926 (and (= (size!6836 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6836 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6836 a!3325))))))

(declare-fun b!275960 () Bool)

(assert (=> b!275960 (= e!176383 e!176384)))

(declare-fun res!139924 () Bool)

(assert (=> b!275960 (=> (not res!139924) (not e!176384))))

(declare-datatypes ((SeekEntryResult!1607 0))(
  ( (MissingZero!1607 (index!8598 (_ BitVec 32))) (Found!1607 (index!8599 (_ BitVec 32))) (Intermediate!1607 (undefined!2419 Bool) (index!8600 (_ BitVec 32)) (x!26980 (_ BitVec 32))) (Undefined!1607) (MissingVacant!1607 (index!8601 (_ BitVec 32))) )
))
(declare-fun lt!137555 () SeekEntryResult!1607)

(assert (=> b!275960 (= res!139924 (or (= lt!137555 (MissingZero!1607 i!1267)) (= lt!137555 (MissingVacant!1607 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13670 (_ BitVec 32)) SeekEntryResult!1607)

(assert (=> b!275960 (= lt!137555 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!275961 () Bool)

(declare-fun res!139922 () Bool)

(assert (=> b!275961 (=> (not res!139922) (not e!176383))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275961 (= res!139922 (validKeyInArray!0 k0!2581))))

(declare-fun b!275962 () Bool)

(declare-fun res!139921 () Bool)

(assert (=> b!275962 (=> (not res!139921) (not e!176383))))

(declare-fun arrayContainsKey!0 (array!13670 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275962 (= res!139921 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!139925 () Bool)

(assert (=> start!26574 (=> (not res!139925) (not e!176383))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26574 (= res!139925 (validMask!0 mask!3868))))

(assert (=> start!26574 e!176383))

(declare-fun array_inv!4434 (array!13670) Bool)

(assert (=> start!26574 (array_inv!4434 a!3325)))

(assert (=> start!26574 true))

(assert (= (and start!26574 res!139925) b!275959))

(assert (= (and b!275959 res!139926) b!275961))

(assert (= (and b!275961 res!139922) b!275957))

(assert (= (and b!275957 res!139923) b!275962))

(assert (= (and b!275962 res!139921) b!275960))

(assert (= (and b!275960 res!139924) b!275958))

(declare-fun m!291587 () Bool)

(assert (=> start!26574 m!291587))

(declare-fun m!291589 () Bool)

(assert (=> start!26574 m!291589))

(declare-fun m!291591 () Bool)

(assert (=> b!275961 m!291591))

(declare-fun m!291593 () Bool)

(assert (=> b!275962 m!291593))

(declare-fun m!291595 () Bool)

(assert (=> b!275960 m!291595))

(declare-fun m!291597 () Bool)

(assert (=> b!275958 m!291597))

(declare-fun m!291599 () Bool)

(assert (=> b!275957 m!291599))

(check-sat (not b!275957) (not b!275961) (not start!26574) (not b!275962) (not b!275958) (not b!275960))
(check-sat)
