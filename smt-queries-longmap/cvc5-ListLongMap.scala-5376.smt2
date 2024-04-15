; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71838 () Bool)

(assert start!71838)

(declare-fun b!834861 () Bool)

(declare-fun res!567870 () Bool)

(declare-fun e!465770 () Bool)

(assert (=> b!834861 (=> (not res!567870) (not e!465770))))

(declare-datatypes ((array!46737 0))(
  ( (array!46738 (arr!22403 (Array (_ BitVec 32) (_ BitVec 64))) (size!22824 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46737)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834861 (= res!567870 (not (validKeyInArray!0 (select (arr!22403 a!4227) i!1466))))))

(declare-fun b!834863 () Bool)

(declare-fun res!567868 () Bool)

(assert (=> b!834863 (=> (not res!567868) (not e!465770))))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!834863 (= res!567868 (and (bvslt (size!22824 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22824 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun res!567871 () Bool)

(assert (=> start!71838 (=> (not res!567871) (not e!465770))))

(assert (=> start!71838 (= res!567871 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22824 a!4227))))))

(assert (=> start!71838 e!465770))

(assert (=> start!71838 true))

(declare-fun array_inv!17915 (array!46737) Bool)

(assert (=> start!71838 (array_inv!17915 a!4227)))

(declare-fun b!834864 () Bool)

(assert (=> b!834864 (= e!465770 false)))

(declare-fun lt!379420 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46737 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!834864 (= lt!379420 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!379421 () (_ BitVec 32))

(declare-fun k!2968 () (_ BitVec 64))

(assert (=> b!834864 (= lt!379421 (arrayCountValidKeys!0 (array!46738 (store (arr!22403 a!4227) i!1466 k!2968) (size!22824 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!834862 () Bool)

(declare-fun res!567869 () Bool)

(assert (=> b!834862 (=> (not res!567869) (not e!465770))))

(assert (=> b!834862 (= res!567869 (validKeyInArray!0 k!2968))))

(assert (= (and start!71838 res!567871) b!834861))

(assert (= (and b!834861 res!567870) b!834862))

(assert (= (and b!834862 res!567869) b!834863))

(assert (= (and b!834863 res!567868) b!834864))

(declare-fun m!779519 () Bool)

(assert (=> b!834861 m!779519))

(assert (=> b!834861 m!779519))

(declare-fun m!779521 () Bool)

(assert (=> b!834861 m!779521))

(declare-fun m!779523 () Bool)

(assert (=> start!71838 m!779523))

(declare-fun m!779525 () Bool)

(assert (=> b!834864 m!779525))

(declare-fun m!779527 () Bool)

(assert (=> b!834864 m!779527))

(declare-fun m!779529 () Bool)

(assert (=> b!834864 m!779529))

(declare-fun m!779531 () Bool)

(assert (=> b!834862 m!779531))

(push 1)

(assert (not b!834861))

(assert (not start!71838))

(assert (not b!834864))

(assert (not b!834862))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

