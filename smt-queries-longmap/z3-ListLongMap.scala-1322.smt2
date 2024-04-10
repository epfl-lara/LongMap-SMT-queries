; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26492 () Bool)

(assert start!26492)

(declare-fun b!275028 () Bool)

(declare-fun res!139023 () Bool)

(declare-fun e!175989 () Bool)

(assert (=> b!275028 (=> (not res!139023) (not e!175989))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275028 (= res!139023 (validKeyInArray!0 k0!2581))))

(declare-fun b!275029 () Bool)

(declare-fun res!139019 () Bool)

(assert (=> b!275029 (=> (not res!139019) (not e!175989))))

(declare-datatypes ((array!13589 0))(
  ( (array!13590 (arr!6444 (Array (_ BitVec 32) (_ BitVec 64))) (size!6796 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13589)

(declare-datatypes ((List!4252 0))(
  ( (Nil!4249) (Cons!4248 (h!4915 (_ BitVec 64)) (t!9334 List!4252)) )
))
(declare-fun arrayNoDuplicates!0 (array!13589 (_ BitVec 32) List!4252) Bool)

(assert (=> b!275029 (= res!139019 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4249))))

(declare-fun b!275030 () Bool)

(declare-fun res!139021 () Bool)

(assert (=> b!275030 (=> (not res!139021) (not e!175989))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!275030 (= res!139021 (and (= (size!6796 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6796 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6796 a!3325))))))

(declare-fun res!139022 () Bool)

(assert (=> start!26492 (=> (not res!139022) (not e!175989))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26492 (= res!139022 (validMask!0 mask!3868))))

(assert (=> start!26492 e!175989))

(declare-fun array_inv!4407 (array!13589) Bool)

(assert (=> start!26492 (array_inv!4407 a!3325)))

(assert (=> start!26492 true))

(declare-fun b!275031 () Bool)

(declare-fun res!139020 () Bool)

(assert (=> b!275031 (=> (not res!139020) (not e!175989))))

(declare-fun arrayContainsKey!0 (array!13589 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275031 (= res!139020 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275032 () Bool)

(declare-fun e!175990 () Bool)

(assert (=> b!275032 (= e!175989 e!175990)))

(declare-fun res!139018 () Bool)

(assert (=> b!275032 (=> (not res!139018) (not e!175990))))

(declare-datatypes ((SeekEntryResult!1602 0))(
  ( (MissingZero!1602 (index!8578 (_ BitVec 32))) (Found!1602 (index!8579 (_ BitVec 32))) (Intermediate!1602 (undefined!2414 Bool) (index!8580 (_ BitVec 32)) (x!26863 (_ BitVec 32))) (Undefined!1602) (MissingVacant!1602 (index!8581 (_ BitVec 32))) )
))
(declare-fun lt!137250 () SeekEntryResult!1602)

(assert (=> b!275032 (= res!139018 (or (= lt!137250 (MissingZero!1602 i!1267)) (= lt!137250 (MissingVacant!1602 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13589 (_ BitVec 32)) SeekEntryResult!1602)

(assert (=> b!275032 (= lt!137250 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!275033 () Bool)

(assert (=> b!275033 (= e!175990 false)))

(declare-fun lt!137251 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13589 (_ BitVec 32)) Bool)

(assert (=> b!275033 (= lt!137251 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26492 res!139022) b!275030))

(assert (= (and b!275030 res!139021) b!275028))

(assert (= (and b!275028 res!139023) b!275029))

(assert (= (and b!275029 res!139019) b!275031))

(assert (= (and b!275031 res!139020) b!275032))

(assert (= (and b!275032 res!139018) b!275033))

(declare-fun m!290687 () Bool)

(assert (=> b!275033 m!290687))

(declare-fun m!290689 () Bool)

(assert (=> b!275029 m!290689))

(declare-fun m!290691 () Bool)

(assert (=> b!275031 m!290691))

(declare-fun m!290693 () Bool)

(assert (=> b!275032 m!290693))

(declare-fun m!290695 () Bool)

(assert (=> start!26492 m!290695))

(declare-fun m!290697 () Bool)

(assert (=> start!26492 m!290697))

(declare-fun m!290699 () Bool)

(assert (=> b!275028 m!290699))

(check-sat (not b!275031) (not b!275032) (not b!275029) (not start!26492) (not b!275028) (not b!275033))
(check-sat)
