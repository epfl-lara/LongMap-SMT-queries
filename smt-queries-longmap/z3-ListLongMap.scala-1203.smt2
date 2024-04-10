; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25686 () Bool)

(assert start!25686)

(declare-fun b!266356 () Bool)

(declare-fun res!130656 () Bool)

(declare-fun e!172367 () Bool)

(assert (=> b!266356 (=> (not res!130656) (not e!172367))))

(declare-datatypes ((array!12865 0))(
  ( (array!12866 (arr!6087 (Array (_ BitVec 32) (_ BitVec 64))) (size!6439 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12865)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12865 (_ BitVec 32)) Bool)

(assert (=> b!266356 (= res!130656 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266357 () Bool)

(assert (=> b!266357 (= e!172367 (not true))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12866 (store (arr!6087 a!3436) i!1355 k0!2698) (size!6439 a!3436)) mask!4002)))

(declare-datatypes ((Unit!8277 0))(
  ( (Unit!8278) )
))
(declare-fun lt!134403 () Unit!8277)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!12865 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8277)

(assert (=> b!266357 (= lt!134403 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3436 i!1355 k0!2698 #b00000000000000000000000000000000 mask!4002))))

(declare-fun b!266358 () Bool)

(declare-fun res!130657 () Bool)

(assert (=> b!266358 (=> (not res!130657) (not e!172367))))

(assert (=> b!266358 (= res!130657 (bvslt #b00000000000000000000000000000000 (size!6439 a!3436)))))

(declare-fun b!266359 () Bool)

(declare-fun res!130654 () Bool)

(declare-fun e!172365 () Bool)

(assert (=> b!266359 (=> (not res!130654) (not e!172365))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266359 (= res!130654 (validKeyInArray!0 k0!2698))))

(declare-fun b!266360 () Bool)

(declare-fun res!130653 () Bool)

(assert (=> b!266360 (=> (not res!130653) (not e!172365))))

(assert (=> b!266360 (= res!130653 (and (= (size!6439 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6439 a!3436))))))

(declare-fun res!130658 () Bool)

(assert (=> start!25686 (=> (not res!130658) (not e!172365))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25686 (= res!130658 (validMask!0 mask!4002))))

(assert (=> start!25686 e!172365))

(assert (=> start!25686 true))

(declare-fun array_inv!4050 (array!12865) Bool)

(assert (=> start!25686 (array_inv!4050 a!3436)))

(declare-fun b!266361 () Bool)

(assert (=> b!266361 (= e!172365 e!172367)))

(declare-fun res!130655 () Bool)

(assert (=> b!266361 (=> (not res!130655) (not e!172367))))

(declare-datatypes ((SeekEntryResult!1278 0))(
  ( (MissingZero!1278 (index!7282 (_ BitVec 32))) (Found!1278 (index!7283 (_ BitVec 32))) (Intermediate!1278 (undefined!2090 Bool) (index!7284 (_ BitVec 32)) (x!25587 (_ BitVec 32))) (Undefined!1278) (MissingVacant!1278 (index!7285 (_ BitVec 32))) )
))
(declare-fun lt!134404 () SeekEntryResult!1278)

(assert (=> b!266361 (= res!130655 (or (= lt!134404 (MissingZero!1278 i!1355)) (= lt!134404 (MissingVacant!1278 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12865 (_ BitVec 32)) SeekEntryResult!1278)

(assert (=> b!266361 (= lt!134404 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!266362 () Bool)

(declare-fun res!130659 () Bool)

(assert (=> b!266362 (=> (not res!130659) (not e!172365))))

(declare-fun arrayContainsKey!0 (array!12865 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266362 (= res!130659 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266363 () Bool)

(declare-fun res!130652 () Bool)

(assert (=> b!266363 (=> (not res!130652) (not e!172367))))

(declare-datatypes ((List!3901 0))(
  ( (Nil!3898) (Cons!3897 (h!4564 (_ BitVec 64)) (t!8983 List!3901)) )
))
(declare-fun arrayNoDuplicates!0 (array!12865 (_ BitVec 32) List!3901) Bool)

(assert (=> b!266363 (= res!130652 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3898))))

(assert (= (and start!25686 res!130658) b!266360))

(assert (= (and b!266360 res!130653) b!266359))

(assert (= (and b!266359 res!130654) b!266362))

(assert (= (and b!266362 res!130659) b!266361))

(assert (= (and b!266361 res!130655) b!266356))

(assert (= (and b!266356 res!130656) b!266363))

(assert (= (and b!266363 res!130652) b!266358))

(assert (= (and b!266358 res!130657) b!266357))

(declare-fun m!282959 () Bool)

(assert (=> b!266363 m!282959))

(declare-fun m!282961 () Bool)

(assert (=> start!25686 m!282961))

(declare-fun m!282963 () Bool)

(assert (=> start!25686 m!282963))

(declare-fun m!282965 () Bool)

(assert (=> b!266359 m!282965))

(declare-fun m!282967 () Bool)

(assert (=> b!266356 m!282967))

(declare-fun m!282969 () Bool)

(assert (=> b!266357 m!282969))

(declare-fun m!282971 () Bool)

(assert (=> b!266357 m!282971))

(declare-fun m!282973 () Bool)

(assert (=> b!266357 m!282973))

(declare-fun m!282975 () Bool)

(assert (=> b!266361 m!282975))

(declare-fun m!282977 () Bool)

(assert (=> b!266362 m!282977))

(check-sat (not b!266361) (not b!266363) (not start!25686) (not b!266356) (not b!266362) (not b!266357) (not b!266359))
