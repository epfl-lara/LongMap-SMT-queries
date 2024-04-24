; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26580 () Bool)

(assert start!26580)

(declare-fun b!276011 () Bool)

(declare-fun res!139979 () Bool)

(declare-fun e!176409 () Bool)

(assert (=> b!276011 (=> (not res!139979) (not e!176409))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276011 (= res!139979 (validKeyInArray!0 k0!2581))))

(declare-fun b!276012 () Bool)

(declare-fun e!176410 () Bool)

(assert (=> b!276012 (= e!176410 false)))

(declare-fun lt!137573 () Bool)

(declare-datatypes ((array!13676 0))(
  ( (array!13677 (arr!6487 (Array (_ BitVec 32) (_ BitVec 64))) (size!6839 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13676)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13676 (_ BitVec 32)) Bool)

(assert (=> b!276012 (= lt!137573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276013 () Bool)

(declare-fun res!139977 () Bool)

(assert (=> b!276013 (=> (not res!139977) (not e!176409))))

(declare-datatypes ((List!4208 0))(
  ( (Nil!4205) (Cons!4204 (h!4871 (_ BitVec 64)) (t!9282 List!4208)) )
))
(declare-fun arrayNoDuplicates!0 (array!13676 (_ BitVec 32) List!4208) Bool)

(assert (=> b!276013 (= res!139977 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4205))))

(declare-fun b!276014 () Bool)

(declare-fun res!139976 () Bool)

(assert (=> b!276014 (=> (not res!139976) (not e!176409))))

(declare-fun arrayContainsKey!0 (array!13676 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276014 (= res!139976 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!139978 () Bool)

(assert (=> start!26580 (=> (not res!139978) (not e!176409))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26580 (= res!139978 (validMask!0 mask!3868))))

(assert (=> start!26580 e!176409))

(declare-fun array_inv!4437 (array!13676) Bool)

(assert (=> start!26580 (array_inv!4437 a!3325)))

(assert (=> start!26580 true))

(declare-fun b!276015 () Bool)

(declare-fun res!139975 () Bool)

(assert (=> b!276015 (=> (not res!139975) (not e!176409))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276015 (= res!139975 (and (= (size!6839 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6839 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6839 a!3325))))))

(declare-fun b!276016 () Bool)

(assert (=> b!276016 (= e!176409 e!176410)))

(declare-fun res!139980 () Bool)

(assert (=> b!276016 (=> (not res!139980) (not e!176410))))

(declare-datatypes ((SeekEntryResult!1610 0))(
  ( (MissingZero!1610 (index!8610 (_ BitVec 32))) (Found!1610 (index!8611 (_ BitVec 32))) (Intermediate!1610 (undefined!2422 Bool) (index!8612 (_ BitVec 32)) (x!26991 (_ BitVec 32))) (Undefined!1610) (MissingVacant!1610 (index!8613 (_ BitVec 32))) )
))
(declare-fun lt!137574 () SeekEntryResult!1610)

(assert (=> b!276016 (= res!139980 (or (= lt!137574 (MissingZero!1610 i!1267)) (= lt!137574 (MissingVacant!1610 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13676 (_ BitVec 32)) SeekEntryResult!1610)

(assert (=> b!276016 (= lt!137574 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26580 res!139978) b!276015))

(assert (= (and b!276015 res!139975) b!276011))

(assert (= (and b!276011 res!139979) b!276013))

(assert (= (and b!276013 res!139977) b!276014))

(assert (= (and b!276014 res!139976) b!276016))

(assert (= (and b!276016 res!139980) b!276012))

(declare-fun m!291629 () Bool)

(assert (=> start!26580 m!291629))

(declare-fun m!291631 () Bool)

(assert (=> start!26580 m!291631))

(declare-fun m!291633 () Bool)

(assert (=> b!276013 m!291633))

(declare-fun m!291635 () Bool)

(assert (=> b!276016 m!291635))

(declare-fun m!291637 () Bool)

(assert (=> b!276011 m!291637))

(declare-fun m!291639 () Bool)

(assert (=> b!276012 m!291639))

(declare-fun m!291641 () Bool)

(assert (=> b!276014 m!291641))

(check-sat (not start!26580) (not b!276011) (not b!276013) (not b!276012) (not b!276016) (not b!276014))
(check-sat)
