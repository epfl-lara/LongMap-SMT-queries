; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71752 () Bool)

(assert start!71752)

(declare-fun res!567093 () Bool)

(declare-fun e!465338 () Bool)

(assert (=> start!71752 (=> (not res!567093) (not e!465338))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-datatypes ((array!46662 0))(
  ( (array!46663 (arr!22365 (Array (_ BitVec 32) (_ BitVec 64))) (size!22786 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46662)

(assert (=> start!71752 (= res!567093 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22786 a!4227))))))

(assert (=> start!71752 e!465338))

(assert (=> start!71752 true))

(declare-fun array_inv!17812 (array!46662) Bool)

(assert (=> start!71752 (array_inv!17812 a!4227)))

(declare-fun b!834060 () Bool)

(declare-fun res!567094 () Bool)

(assert (=> b!834060 (=> (not res!567094) (not e!465338))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834060 (= res!567094 (not (validKeyInArray!0 (select (arr!22365 a!4227) i!1466))))))

(declare-fun b!834061 () Bool)

(declare-fun res!567095 () Bool)

(assert (=> b!834061 (=> (not res!567095) (not e!465338))))

(declare-fun k!2968 () (_ BitVec 64))

(assert (=> b!834061 (= res!567095 (validKeyInArray!0 k!2968))))

(declare-fun b!834062 () Bool)

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!834062 (= e!465338 (and (bvslt (size!22786 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22786 a!4227)) (bvsgt to!390 i!1466) (bvslt (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000)))))

(assert (= (and start!71752 res!567093) b!834060))

(assert (= (and b!834060 res!567094) b!834061))

(assert (= (and b!834061 res!567095) b!834062))

(declare-fun m!778987 () Bool)

(assert (=> start!71752 m!778987))

(declare-fun m!778989 () Bool)

(assert (=> b!834060 m!778989))

(assert (=> b!834060 m!778989))

(declare-fun m!778991 () Bool)

(assert (=> b!834060 m!778991))

(declare-fun m!778993 () Bool)

(assert (=> b!834061 m!778993))

(push 1)

(assert (not b!834061))

(assert (not start!71752))

(assert (not b!834060))

(check-sat)

(pop 1)

(push 1)

(check-sat)

