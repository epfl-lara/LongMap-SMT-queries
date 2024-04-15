; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26594 () Bool)

(assert start!26594)

(declare-fun b!275931 () Bool)

(declare-fun res!139973 () Bool)

(declare-fun e!176338 () Bool)

(assert (=> b!275931 (=> (not res!139973) (not e!176338))))

(declare-datatypes ((array!13680 0))(
  ( (array!13681 (arr!6489 (Array (_ BitVec 32) (_ BitVec 64))) (size!6842 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13680)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275931 (= res!139973 (not (validKeyInArray!0 (select (arr!6489 a!3325) startIndex!26))))))

(declare-fun b!275932 () Bool)

(assert (=> b!275932 (= e!176338 (and (bvsge startIndex!26 (bvsub (size!6842 a!3325) #b00000000000000000000000000000001)) (bvsgt startIndex!26 (size!6842 a!3325))))))

(declare-fun res!139978 () Bool)

(declare-fun e!176339 () Bool)

(assert (=> start!26594 (=> (not res!139978) (not e!176339))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26594 (= res!139978 (validMask!0 mask!3868))))

(assert (=> start!26594 e!176339))

(declare-fun array_inv!4461 (array!13680) Bool)

(assert (=> start!26594 (array_inv!4461 a!3325)))

(assert (=> start!26594 true))

(declare-fun b!275933 () Bool)

(declare-fun res!139974 () Bool)

(assert (=> b!275933 (=> (not res!139974) (not e!176339))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!275933 (= res!139974 (and (= (size!6842 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6842 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6842 a!3325))))))

(declare-fun b!275934 () Bool)

(declare-fun res!139980 () Bool)

(assert (=> b!275934 (=> (not res!139980) (not e!176338))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13680 (_ BitVec 32)) Bool)

(assert (=> b!275934 (= res!139980 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275935 () Bool)

(declare-fun res!139979 () Bool)

(assert (=> b!275935 (=> (not res!139979) (not e!176339))))

(declare-fun k0!2581 () (_ BitVec 64))

(assert (=> b!275935 (= res!139979 (validKeyInArray!0 k0!2581))))

(declare-fun b!275936 () Bool)

(assert (=> b!275936 (= e!176339 e!176338)))

(declare-fun res!139976 () Bool)

(assert (=> b!275936 (=> (not res!139976) (not e!176338))))

(declare-datatypes ((SeekEntryResult!1646 0))(
  ( (MissingZero!1646 (index!8754 (_ BitVec 32))) (Found!1646 (index!8755 (_ BitVec 32))) (Intermediate!1646 (undefined!2458 Bool) (index!8756 (_ BitVec 32)) (x!27042 (_ BitVec 32))) (Undefined!1646) (MissingVacant!1646 (index!8757 (_ BitVec 32))) )
))
(declare-fun lt!137367 () SeekEntryResult!1646)

(assert (=> b!275936 (= res!139976 (or (= lt!137367 (MissingZero!1646 i!1267)) (= lt!137367 (MissingVacant!1646 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13680 (_ BitVec 32)) SeekEntryResult!1646)

(assert (=> b!275936 (= lt!137367 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!275937 () Bool)

(declare-fun res!139977 () Bool)

(assert (=> b!275937 (=> (not res!139977) (not e!176339))))

(declare-fun arrayContainsKey!0 (array!13680 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275937 (= res!139977 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275938 () Bool)

(declare-fun res!139975 () Bool)

(assert (=> b!275938 (=> (not res!139975) (not e!176339))))

(declare-datatypes ((List!4270 0))(
  ( (Nil!4267) (Cons!4266 (h!4933 (_ BitVec 64)) (t!9343 List!4270)) )
))
(declare-fun arrayNoDuplicates!0 (array!13680 (_ BitVec 32) List!4270) Bool)

(assert (=> b!275938 (= res!139975 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4267))))

(declare-fun b!275939 () Bool)

(declare-fun res!139981 () Bool)

(assert (=> b!275939 (=> (not res!139981) (not e!176338))))

(assert (=> b!275939 (= res!139981 (not (= startIndex!26 i!1267)))))

(assert (= (and start!26594 res!139978) b!275933))

(assert (= (and b!275933 res!139974) b!275935))

(assert (= (and b!275935 res!139979) b!275938))

(assert (= (and b!275938 res!139975) b!275937))

(assert (= (and b!275937 res!139977) b!275936))

(assert (= (and b!275936 res!139976) b!275934))

(assert (= (and b!275934 res!139980) b!275939))

(assert (= (and b!275939 res!139981) b!275931))

(assert (= (and b!275931 res!139973) b!275932))

(declare-fun m!290915 () Bool)

(assert (=> b!275938 m!290915))

(declare-fun m!290917 () Bool)

(assert (=> b!275935 m!290917))

(declare-fun m!290919 () Bool)

(assert (=> b!275934 m!290919))

(declare-fun m!290921 () Bool)

(assert (=> start!26594 m!290921))

(declare-fun m!290923 () Bool)

(assert (=> start!26594 m!290923))

(declare-fun m!290925 () Bool)

(assert (=> b!275937 m!290925))

(declare-fun m!290927 () Bool)

(assert (=> b!275936 m!290927))

(declare-fun m!290929 () Bool)

(assert (=> b!275931 m!290929))

(assert (=> b!275931 m!290929))

(declare-fun m!290931 () Bool)

(assert (=> b!275931 m!290931))

(check-sat (not b!275937) (not b!275938) (not b!275931) (not b!275935) (not b!275934) (not b!275936) (not start!26594))
(check-sat)
