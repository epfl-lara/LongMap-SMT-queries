; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71776 () Bool)

(assert start!71776)

(declare-fun b!834219 () Bool)

(declare-fun res!567252 () Bool)

(declare-fun e!465422 () Bool)

(assert (=> b!834219 (=> (not res!567252) (not e!465422))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834219 (= res!567252 (validKeyInArray!0 k!2968))))

(declare-fun b!834220 () Bool)

(declare-fun res!567255 () Bool)

(assert (=> b!834220 (=> (not res!567255) (not e!465422))))

(declare-datatypes ((array!46686 0))(
  ( (array!46687 (arr!22377 (Array (_ BitVec 32) (_ BitVec 64))) (size!22798 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46686)

(declare-fun i!1466 () (_ BitVec 32))

(assert (=> b!834220 (= res!567255 (not (validKeyInArray!0 (select (arr!22377 a!4227) i!1466))))))

(declare-fun b!834221 () Bool)

(declare-fun res!567257 () Bool)

(assert (=> b!834221 (=> (not res!567257) (not e!465422))))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!834221 (= res!567257 (and (bvslt (size!22798 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22798 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!834222 () Bool)

(declare-fun e!465421 () Bool)

(assert (=> b!834222 (= e!465422 e!465421)))

(declare-fun res!567256 () Bool)

(assert (=> b!834222 (=> (not res!567256) (not e!465421))))

(declare-fun lt!378830 () (_ BitVec 32))

(declare-fun lt!378831 () (_ BitVec 32))

(assert (=> b!834222 (= res!567256 (and (= lt!378830 lt!378831) (not (= to!390 (size!22798 a!4227)))))))

(declare-fun arrayCountValidKeys!0 (array!46686 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!834222 (= lt!378831 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834222 (= lt!378830 (arrayCountValidKeys!0 (array!46687 (store (arr!22377 a!4227) i!1466 k!2968) (size!22798 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!834223 () Bool)

(declare-fun res!567253 () Bool)

(assert (=> b!834223 (=> (not res!567253) (not e!465421))))

(assert (=> b!834223 (= res!567253 (not (validKeyInArray!0 (select (arr!22377 a!4227) to!390))))))

(declare-fun b!834224 () Bool)

(assert (=> b!834224 (= e!465421 (not true))))

(assert (=> b!834224 (= (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) lt!378831)))

(declare-datatypes ((Unit!28647 0))(
  ( (Unit!28648) )
))
(declare-fun lt!378832 () Unit!28647)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46686 (_ BitVec 32) (_ BitVec 32)) Unit!28647)

(assert (=> b!834224 (= lt!378832 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun res!567254 () Bool)

(assert (=> start!71776 (=> (not res!567254) (not e!465422))))

(assert (=> start!71776 (= res!567254 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22798 a!4227))))))

(assert (=> start!71776 e!465422))

(assert (=> start!71776 true))

(declare-fun array_inv!17824 (array!46686) Bool)

(assert (=> start!71776 (array_inv!17824 a!4227)))

(assert (= (and start!71776 res!567254) b!834220))

(assert (= (and b!834220 res!567255) b!834219))

(assert (= (and b!834219 res!567252) b!834221))

(assert (= (and b!834221 res!567257) b!834222))

(assert (= (and b!834222 res!567256) b!834223))

(assert (= (and b!834223 res!567253) b!834224))

(declare-fun m!779161 () Bool)

(assert (=> start!71776 m!779161))

(declare-fun m!779163 () Bool)

(assert (=> b!834224 m!779163))

(declare-fun m!779165 () Bool)

(assert (=> b!834224 m!779165))

(declare-fun m!779167 () Bool)

(assert (=> b!834223 m!779167))

(assert (=> b!834223 m!779167))

(declare-fun m!779169 () Bool)

(assert (=> b!834223 m!779169))

(declare-fun m!779171 () Bool)

(assert (=> b!834219 m!779171))

(declare-fun m!779173 () Bool)

(assert (=> b!834220 m!779173))

(assert (=> b!834220 m!779173))

(declare-fun m!779175 () Bool)

(assert (=> b!834220 m!779175))

(declare-fun m!779177 () Bool)

(assert (=> b!834222 m!779177))

(declare-fun m!779179 () Bool)

(assert (=> b!834222 m!779179))

(declare-fun m!779181 () Bool)

(assert (=> b!834222 m!779181))

(push 1)

