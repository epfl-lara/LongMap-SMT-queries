; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71764 () Bool)

(assert start!71764)

(declare-fun b!834129 () Bool)

(declare-fun res!567166 () Bool)

(declare-fun e!465378 () Bool)

(assert (=> b!834129 (=> (not res!567166) (not e!465378))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834129 (= res!567166 (validKeyInArray!0 k!2968))))

(declare-fun b!834130 () Bool)

(declare-fun res!567163 () Bool)

(assert (=> b!834130 (=> (not res!567163) (not e!465378))))

(declare-datatypes ((array!46674 0))(
  ( (array!46675 (arr!22371 (Array (_ BitVec 32) (_ BitVec 64))) (size!22792 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46674)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!834130 (= res!567163 (and (bvslt (size!22792 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22792 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!834131 () Bool)

(declare-fun e!465376 () Bool)

(assert (=> b!834131 (= e!465378 e!465376)))

(declare-fun res!567164 () Bool)

(assert (=> b!834131 (=> (not res!567164) (not e!465376))))

(declare-fun lt!378785 () (_ BitVec 32))

(declare-fun lt!378787 () (_ BitVec 32))

(assert (=> b!834131 (= res!567164 (and (= lt!378785 lt!378787) (not (= to!390 (size!22792 a!4227)))))))

(declare-fun arrayCountValidKeys!0 (array!46674 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!834131 (= lt!378787 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834131 (= lt!378785 (arrayCountValidKeys!0 (array!46675 (store (arr!22371 a!4227) i!1466 k!2968) (size!22792 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!834132 () Bool)

(assert (=> b!834132 (= e!465376 (not true))))

(assert (=> b!834132 (= (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (bvadd #b00000000000000000000000000000001 lt!378787))))

(declare-datatypes ((Unit!28641 0))(
  ( (Unit!28642) )
))
(declare-fun lt!378786 () Unit!28641)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46674 (_ BitVec 32) (_ BitVec 32)) Unit!28641)

(assert (=> b!834132 (= lt!378786 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!834133 () Bool)

(declare-fun res!567162 () Bool)

(assert (=> b!834133 (=> (not res!567162) (not e!465376))))

(assert (=> b!834133 (= res!567162 (validKeyInArray!0 (select (arr!22371 a!4227) to!390)))))

(declare-fun res!567167 () Bool)

(assert (=> start!71764 (=> (not res!567167) (not e!465378))))

(assert (=> start!71764 (= res!567167 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22792 a!4227))))))

(assert (=> start!71764 e!465378))

(assert (=> start!71764 true))

(declare-fun array_inv!17818 (array!46674) Bool)

(assert (=> start!71764 (array_inv!17818 a!4227)))

(declare-fun b!834134 () Bool)

(declare-fun res!567165 () Bool)

(assert (=> b!834134 (=> (not res!567165) (not e!465378))))

(assert (=> b!834134 (= res!567165 (not (validKeyInArray!0 (select (arr!22371 a!4227) i!1466))))))

(assert (= (and start!71764 res!567167) b!834134))

(assert (= (and b!834134 res!567165) b!834129))

(assert (= (and b!834129 res!567166) b!834130))

(assert (= (and b!834130 res!567163) b!834131))

(assert (= (and b!834131 res!567164) b!834133))

(assert (= (and b!834133 res!567162) b!834132))

(declare-fun m!779053 () Bool)

(assert (=> start!71764 m!779053))

(declare-fun m!779055 () Bool)

(assert (=> b!834132 m!779055))

(declare-fun m!779057 () Bool)

(assert (=> b!834132 m!779057))

(declare-fun m!779059 () Bool)

(assert (=> b!834133 m!779059))

(assert (=> b!834133 m!779059))

(declare-fun m!779061 () Bool)

(assert (=> b!834133 m!779061))

(declare-fun m!779063 () Bool)

(assert (=> b!834129 m!779063))

(declare-fun m!779065 () Bool)

(assert (=> b!834134 m!779065))

(assert (=> b!834134 m!779065))

(declare-fun m!779067 () Bool)

(assert (=> b!834134 m!779067))

(declare-fun m!779069 () Bool)

(assert (=> b!834131 m!779069))

(declare-fun m!779071 () Bool)

(assert (=> b!834131 m!779071))

(declare-fun m!779073 () Bool)

(assert (=> b!834131 m!779073))

(push 1)

(assert (not b!834131))

(assert (not start!71764))

(assert (not b!834132))

(assert (not b!834134))

(assert (not b!834133))

(assert (not b!834129))

(check-sat)

(pop 1)

