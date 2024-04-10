; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71766 () Bool)

(assert start!71766)

(declare-fun b!834147 () Bool)

(declare-fun res!567180 () Bool)

(declare-fun e!465386 () Bool)

(assert (=> b!834147 (=> (not res!567180) (not e!465386))))

(declare-fun k0!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834147 (= res!567180 (validKeyInArray!0 k0!2968))))

(declare-fun res!567183 () Bool)

(assert (=> start!71766 (=> (not res!567183) (not e!465386))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-datatypes ((array!46676 0))(
  ( (array!46677 (arr!22372 (Array (_ BitVec 32) (_ BitVec 64))) (size!22793 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46676)

(assert (=> start!71766 (= res!567183 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22793 a!4227))))))

(assert (=> start!71766 e!465386))

(assert (=> start!71766 true))

(declare-fun array_inv!17819 (array!46676) Bool)

(assert (=> start!71766 (array_inv!17819 a!4227)))

(declare-fun b!834148 () Bool)

(declare-fun res!567181 () Bool)

(declare-fun e!465385 () Bool)

(assert (=> b!834148 (=> (not res!567181) (not e!465385))))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!834148 (= res!567181 (validKeyInArray!0 (select (arr!22372 a!4227) to!390)))))

(declare-fun b!834149 () Bool)

(declare-fun res!567182 () Bool)

(assert (=> b!834149 (=> (not res!567182) (not e!465386))))

(assert (=> b!834149 (= res!567182 (and (bvslt (size!22793 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22793 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!834150 () Bool)

(assert (=> b!834150 (= e!465386 e!465385)))

(declare-fun res!567184 () Bool)

(assert (=> b!834150 (=> (not res!567184) (not e!465385))))

(declare-fun lt!378796 () (_ BitVec 32))

(declare-fun lt!378794 () (_ BitVec 32))

(assert (=> b!834150 (= res!567184 (and (= lt!378794 lt!378796) (not (= to!390 (size!22793 a!4227)))))))

(declare-fun arrayCountValidKeys!0 (array!46676 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!834150 (= lt!378796 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834150 (= lt!378794 (arrayCountValidKeys!0 (array!46677 (store (arr!22372 a!4227) i!1466 k0!2968) (size!22793 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!834151 () Bool)

(declare-fun res!567185 () Bool)

(assert (=> b!834151 (=> (not res!567185) (not e!465386))))

(assert (=> b!834151 (= res!567185 (not (validKeyInArray!0 (select (arr!22372 a!4227) i!1466))))))

(declare-fun b!834152 () Bool)

(assert (=> b!834152 (= e!465385 (not true))))

(assert (=> b!834152 (= (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (bvadd #b00000000000000000000000000000001 lt!378796))))

(declare-datatypes ((Unit!28643 0))(
  ( (Unit!28644) )
))
(declare-fun lt!378795 () Unit!28643)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46676 (_ BitVec 32) (_ BitVec 32)) Unit!28643)

(assert (=> b!834152 (= lt!378795 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (= (and start!71766 res!567183) b!834151))

(assert (= (and b!834151 res!567185) b!834147))

(assert (= (and b!834147 res!567180) b!834149))

(assert (= (and b!834149 res!567182) b!834150))

(assert (= (and b!834150 res!567184) b!834148))

(assert (= (and b!834148 res!567181) b!834152))

(declare-fun m!779075 () Bool)

(assert (=> b!834151 m!779075))

(assert (=> b!834151 m!779075))

(declare-fun m!779077 () Bool)

(assert (=> b!834151 m!779077))

(declare-fun m!779079 () Bool)

(assert (=> b!834148 m!779079))

(assert (=> b!834148 m!779079))

(declare-fun m!779081 () Bool)

(assert (=> b!834148 m!779081))

(declare-fun m!779083 () Bool)

(assert (=> b!834152 m!779083))

(declare-fun m!779085 () Bool)

(assert (=> b!834152 m!779085))

(declare-fun m!779087 () Bool)

(assert (=> start!71766 m!779087))

(declare-fun m!779089 () Bool)

(assert (=> b!834150 m!779089))

(declare-fun m!779091 () Bool)

(assert (=> b!834150 m!779091))

(declare-fun m!779093 () Bool)

(assert (=> b!834150 m!779093))

(declare-fun m!779095 () Bool)

(assert (=> b!834147 m!779095))

(check-sat (not start!71766) (not b!834152) (not b!834148) (not b!834147) (not b!834150) (not b!834151))
(check-sat)
