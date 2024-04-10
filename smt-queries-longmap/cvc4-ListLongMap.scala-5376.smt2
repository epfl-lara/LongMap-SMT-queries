; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71858 () Bool)

(assert start!71858)

(declare-fun b!835104 () Bool)

(declare-fun res!567975 () Bool)

(declare-fun e!465917 () Bool)

(assert (=> b!835104 (=> (not res!567975) (not e!465917))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835104 (= res!567975 (validKeyInArray!0 k!2968))))

(declare-fun res!567976 () Bool)

(assert (=> start!71858 (=> (not res!567976) (not e!465917))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-datatypes ((array!46768 0))(
  ( (array!46769 (arr!22418 (Array (_ BitVec 32) (_ BitVec 64))) (size!22839 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46768)

(assert (=> start!71858 (= res!567976 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22839 a!4227))))))

(assert (=> start!71858 e!465917))

(assert (=> start!71858 true))

(declare-fun array_inv!17865 (array!46768) Bool)

(assert (=> start!71858 (array_inv!17865 a!4227)))

(declare-fun b!835105 () Bool)

(declare-fun res!567974 () Bool)

(assert (=> b!835105 (=> (not res!567974) (not e!465917))))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835105 (= res!567974 (and (bvslt (size!22839 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22839 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835103 () Bool)

(declare-fun res!567977 () Bool)

(assert (=> b!835103 (=> (not res!567977) (not e!465917))))

(assert (=> b!835103 (= res!567977 (not (validKeyInArray!0 (select (arr!22418 a!4227) i!1466))))))

(declare-fun b!835106 () Bool)

(assert (=> b!835106 (= e!465917 false)))

(declare-fun lt!379660 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46768 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835106 (= lt!379660 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!379659 () (_ BitVec 32))

(assert (=> b!835106 (= lt!379659 (arrayCountValidKeys!0 (array!46769 (store (arr!22418 a!4227) i!1466 k!2968) (size!22839 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (= (and start!71858 res!567976) b!835103))

(assert (= (and b!835103 res!567977) b!835104))

(assert (= (and b!835104 res!567975) b!835105))

(assert (= (and b!835105 res!567974) b!835106))

(declare-fun m!780271 () Bool)

(assert (=> b!835104 m!780271))

(declare-fun m!780273 () Bool)

(assert (=> start!71858 m!780273))

(declare-fun m!780275 () Bool)

(assert (=> b!835103 m!780275))

(assert (=> b!835103 m!780275))

(declare-fun m!780277 () Bool)

(assert (=> b!835103 m!780277))

(declare-fun m!780279 () Bool)

(assert (=> b!835106 m!780279))

(declare-fun m!780281 () Bool)

(assert (=> b!835106 m!780281))

(declare-fun m!780283 () Bool)

(assert (=> b!835106 m!780283))

(push 1)

(assert (not b!835106))

(assert (not b!835104))

(assert (not b!835103))

(assert (not start!71858))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

