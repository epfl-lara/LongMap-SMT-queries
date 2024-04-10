; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25462 () Bool)

(assert start!25462)

(declare-fun b!265026 () Bool)

(declare-fun res!129539 () Bool)

(declare-fun e!171641 () Bool)

(assert (=> b!265026 (=> (not res!129539) (not e!171641))))

(declare-datatypes ((array!12758 0))(
  ( (array!12759 (arr!6038 (Array (_ BitVec 32) (_ BitVec 64))) (size!6390 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12758)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12758 (_ BitVec 32)) Bool)

(assert (=> b!265026 (= res!129539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!265027 () Bool)

(declare-fun res!129543 () Bool)

(declare-fun e!171640 () Bool)

(assert (=> b!265027 (=> (not res!129543) (not e!171640))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265027 (= res!129543 (and (= (size!6390 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6390 a!3436))))))

(declare-fun res!129542 () Bool)

(assert (=> start!25462 (=> (not res!129542) (not e!171640))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25462 (= res!129542 (validMask!0 mask!4002))))

(assert (=> start!25462 e!171640))

(assert (=> start!25462 true))

(declare-fun array_inv!4001 (array!12758) Bool)

(assert (=> start!25462 (array_inv!4001 a!3436)))

(declare-fun b!265028 () Bool)

(declare-fun res!129540 () Bool)

(assert (=> b!265028 (=> (not res!129540) (not e!171640))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265028 (= res!129540 (validKeyInArray!0 k!2698))))

(declare-fun b!265029 () Bool)

(assert (=> b!265029 (= e!171640 e!171641)))

(declare-fun res!129538 () Bool)

(assert (=> b!265029 (=> (not res!129538) (not e!171641))))

(declare-datatypes ((SeekEntryResult!1229 0))(
  ( (MissingZero!1229 (index!7086 (_ BitVec 32))) (Found!1229 (index!7087 (_ BitVec 32))) (Intermediate!1229 (undefined!2041 Bool) (index!7088 (_ BitVec 32)) (x!25410 (_ BitVec 32))) (Undefined!1229) (MissingVacant!1229 (index!7089 (_ BitVec 32))) )
))
(declare-fun lt!133960 () SeekEntryResult!1229)

(assert (=> b!265029 (= res!129538 (or (= lt!133960 (MissingZero!1229 i!1355)) (= lt!133960 (MissingVacant!1229 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12758 (_ BitVec 32)) SeekEntryResult!1229)

(assert (=> b!265029 (= lt!133960 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!265030 () Bool)

(declare-fun res!129541 () Bool)

(assert (=> b!265030 (=> (not res!129541) (not e!171640))))

(declare-fun arrayContainsKey!0 (array!12758 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265030 (= res!129541 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265031 () Bool)

(assert (=> b!265031 (= e!171641 (and (bvsle #b00000000000000000000000000000000 (size!6390 a!3436)) (bvsge (size!6390 a!3436) #b01111111111111111111111111111111)))))

(assert (= (and start!25462 res!129542) b!265027))

(assert (= (and b!265027 res!129543) b!265028))

(assert (= (and b!265028 res!129540) b!265030))

(assert (= (and b!265030 res!129541) b!265029))

(assert (= (and b!265029 res!129538) b!265026))

(assert (= (and b!265026 res!129539) b!265031))

(declare-fun m!281961 () Bool)

(assert (=> b!265029 m!281961))

(declare-fun m!281963 () Bool)

(assert (=> b!265030 m!281963))

(declare-fun m!281965 () Bool)

(assert (=> b!265026 m!281965))

(declare-fun m!281967 () Bool)

(assert (=> b!265028 m!281967))

(declare-fun m!281969 () Bool)

(assert (=> start!25462 m!281969))

(declare-fun m!281971 () Bool)

(assert (=> start!25462 m!281971))

(push 1)

(assert (not b!265030))

(assert (not b!265026))

(assert (not b!265029))

(assert (not b!265028))

(assert (not start!25462))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

