; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71760 () Bool)

(assert start!71760)

(declare-fun b!834103 () Bool)

(declare-fun res!567137 () Bool)

(declare-fun e!465362 () Bool)

(assert (=> b!834103 (=> (not res!567137) (not e!465362))))

(declare-datatypes ((array!46670 0))(
  ( (array!46671 (arr!22369 (Array (_ BitVec 32) (_ BitVec 64))) (size!22790 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46670)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!834103 (= res!567137 (and (bvslt (size!22790 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22790 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!834104 () Bool)

(assert (=> b!834104 (= e!465362 false)))

(declare-fun lt!378772 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46670 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!834104 (= lt!378772 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!378771 () (_ BitVec 32))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!834104 (= lt!378771 (arrayCountValidKeys!0 (array!46671 (store (arr!22369 a!4227) i!1466 k0!2968) (size!22790 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!834101 () Bool)

(declare-fun res!567135 () Bool)

(assert (=> b!834101 (=> (not res!567135) (not e!465362))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834101 (= res!567135 (not (validKeyInArray!0 (select (arr!22369 a!4227) i!1466))))))

(declare-fun res!567134 () Bool)

(assert (=> start!71760 (=> (not res!567134) (not e!465362))))

(assert (=> start!71760 (= res!567134 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22790 a!4227))))))

(assert (=> start!71760 e!465362))

(assert (=> start!71760 true))

(declare-fun array_inv!17816 (array!46670) Bool)

(assert (=> start!71760 (array_inv!17816 a!4227)))

(declare-fun b!834102 () Bool)

(declare-fun res!567136 () Bool)

(assert (=> b!834102 (=> (not res!567136) (not e!465362))))

(assert (=> b!834102 (= res!567136 (validKeyInArray!0 k0!2968))))

(assert (= (and start!71760 res!567134) b!834101))

(assert (= (and b!834101 res!567135) b!834102))

(assert (= (and b!834102 res!567136) b!834103))

(assert (= (and b!834103 res!567137) b!834104))

(declare-fun m!779025 () Bool)

(assert (=> b!834104 m!779025))

(declare-fun m!779027 () Bool)

(assert (=> b!834104 m!779027))

(declare-fun m!779029 () Bool)

(assert (=> b!834104 m!779029))

(declare-fun m!779031 () Bool)

(assert (=> b!834101 m!779031))

(assert (=> b!834101 m!779031))

(declare-fun m!779033 () Bool)

(assert (=> b!834101 m!779033))

(declare-fun m!779035 () Bool)

(assert (=> start!71760 m!779035))

(declare-fun m!779037 () Bool)

(assert (=> b!834102 m!779037))

(check-sat (not b!834104) (not b!834102) (not b!834101) (not start!71760))
