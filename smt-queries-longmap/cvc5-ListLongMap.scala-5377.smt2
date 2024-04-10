; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71860 () Bool)

(assert start!71860)

(declare-fun b!835117 () Bool)

(declare-fun res!567990 () Bool)

(declare-fun e!465923 () Bool)

(assert (=> b!835117 (=> (not res!567990) (not e!465923))))

(declare-datatypes ((array!46770 0))(
  ( (array!46771 (arr!22419 (Array (_ BitVec 32) (_ BitVec 64))) (size!22840 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46770)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835117 (= res!567990 (and (bvslt (size!22840 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22840 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835118 () Bool)

(declare-fun res!567992 () Bool)

(assert (=> b!835118 (=> (not res!567992) (not e!465923))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!46770 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835118 (= res!567992 (= (arrayCountValidKeys!0 (array!46771 (store (arr!22419 a!4227) i!1466 k!2968) (size!22840 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390)))))

(declare-fun res!567989 () Bool)

(assert (=> start!71860 (=> (not res!567989) (not e!465923))))

(assert (=> start!71860 (= res!567989 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22840 a!4227))))))

(assert (=> start!71860 e!465923))

(assert (=> start!71860 true))

(declare-fun array_inv!17866 (array!46770) Bool)

(assert (=> start!71860 (array_inv!17866 a!4227)))

(declare-fun b!835119 () Bool)

(assert (=> b!835119 (= e!465923 (bvslt (bvsub (bvadd #b00000000000000000000000000000001 (size!22840 a!4227)) to!390) #b00000000000000000000000000000000))))

(declare-fun b!835120 () Bool)

(declare-fun res!567988 () Bool)

(assert (=> b!835120 (=> (not res!567988) (not e!465923))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835120 (= res!567988 (not (validKeyInArray!0 (select (arr!22419 a!4227) i!1466))))))

(declare-fun b!835121 () Bool)

(declare-fun res!567991 () Bool)

(assert (=> b!835121 (=> (not res!567991) (not e!465923))))

(assert (=> b!835121 (= res!567991 (validKeyInArray!0 k!2968))))

(assert (= (and start!71860 res!567989) b!835120))

(assert (= (and b!835120 res!567988) b!835121))

(assert (= (and b!835121 res!567991) b!835117))

(assert (= (and b!835117 res!567990) b!835118))

(assert (= (and b!835118 res!567992) b!835119))

(declare-fun m!780285 () Bool)

(assert (=> b!835118 m!780285))

(declare-fun m!780287 () Bool)

(assert (=> b!835118 m!780287))

(declare-fun m!780289 () Bool)

(assert (=> b!835118 m!780289))

(declare-fun m!780291 () Bool)

(assert (=> start!71860 m!780291))

(declare-fun m!780293 () Bool)

(assert (=> b!835120 m!780293))

(assert (=> b!835120 m!780293))

(declare-fun m!780295 () Bool)

(assert (=> b!835120 m!780295))

(declare-fun m!780297 () Bool)

(assert (=> b!835121 m!780297))

(push 1)

(assert (not start!71860))

(assert (not b!835118))

(assert (not b!835121))

(assert (not b!835120))

(check-sat)

(pop 1)

(push 1)

(check-sat)

