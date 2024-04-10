; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71768 () Bool)

(assert start!71768)

(declare-fun b!834165 () Bool)

(declare-fun e!465394 () Bool)

(assert (=> b!834165 (= e!465394 (not true))))

(declare-datatypes ((array!46678 0))(
  ( (array!46679 (arr!22373 (Array (_ BitVec 32) (_ BitVec 64))) (size!22794 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46678)

(declare-fun lt!378803 () (_ BitVec 32))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46678 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!834165 (= (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (bvadd #b00000000000000000000000000000001 lt!378803))))

(declare-datatypes ((Unit!28645 0))(
  ( (Unit!28646) )
))
(declare-fun lt!378804 () Unit!28645)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46678 (_ BitVec 32) (_ BitVec 32)) Unit!28645)

(assert (=> b!834165 (= lt!378804 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!834167 () Bool)

(declare-fun res!567203 () Bool)

(declare-fun e!465396 () Bool)

(assert (=> b!834167 (=> (not res!567203) (not e!465396))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834167 (= res!567203 (not (validKeyInArray!0 (select (arr!22373 a!4227) i!1466))))))

(declare-fun b!834168 () Bool)

(assert (=> b!834168 (= e!465396 e!465394)))

(declare-fun res!567199 () Bool)

(assert (=> b!834168 (=> (not res!567199) (not e!465394))))

(declare-fun lt!378805 () (_ BitVec 32))

(assert (=> b!834168 (= res!567199 (and (= lt!378805 lt!378803) (not (= to!390 (size!22794 a!4227)))))))

(assert (=> b!834168 (= lt!378803 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k!2968 () (_ BitVec 64))

(assert (=> b!834168 (= lt!378805 (arrayCountValidKeys!0 (array!46679 (store (arr!22373 a!4227) i!1466 k!2968) (size!22794 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!834169 () Bool)

(declare-fun res!567201 () Bool)

(assert (=> b!834169 (=> (not res!567201) (not e!465394))))

(assert (=> b!834169 (= res!567201 (validKeyInArray!0 (select (arr!22373 a!4227) to!390)))))

(declare-fun b!834170 () Bool)

(declare-fun res!567198 () Bool)

(assert (=> b!834170 (=> (not res!567198) (not e!465396))))

(assert (=> b!834170 (= res!567198 (and (bvslt (size!22794 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22794 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!834166 () Bool)

(declare-fun res!567200 () Bool)

(assert (=> b!834166 (=> (not res!567200) (not e!465396))))

(assert (=> b!834166 (= res!567200 (validKeyInArray!0 k!2968))))

(declare-fun res!567202 () Bool)

(assert (=> start!71768 (=> (not res!567202) (not e!465396))))

(assert (=> start!71768 (= res!567202 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22794 a!4227))))))

(assert (=> start!71768 e!465396))

(assert (=> start!71768 true))

(declare-fun array_inv!17820 (array!46678) Bool)

(assert (=> start!71768 (array_inv!17820 a!4227)))

(assert (= (and start!71768 res!567202) b!834167))

(assert (= (and b!834167 res!567203) b!834166))

(assert (= (and b!834166 res!567200) b!834170))

(assert (= (and b!834170 res!567198) b!834168))

(assert (= (and b!834168 res!567199) b!834169))

(assert (= (and b!834169 res!567201) b!834165))

(declare-fun m!779097 () Bool)

(assert (=> b!834169 m!779097))

(assert (=> b!834169 m!779097))

(declare-fun m!779099 () Bool)

(assert (=> b!834169 m!779099))

(declare-fun m!779101 () Bool)

(assert (=> b!834167 m!779101))

(assert (=> b!834167 m!779101))

(declare-fun m!779103 () Bool)

(assert (=> b!834167 m!779103))

(declare-fun m!779105 () Bool)

(assert (=> b!834166 m!779105))

(declare-fun m!779107 () Bool)

(assert (=> start!71768 m!779107))

(declare-fun m!779109 () Bool)

(assert (=> b!834168 m!779109))

(declare-fun m!779111 () Bool)

(assert (=> b!834168 m!779111))

(declare-fun m!779113 () Bool)

(assert (=> b!834168 m!779113))

(declare-fun m!779115 () Bool)

(assert (=> b!834165 m!779115))

(declare-fun m!779117 () Bool)

(assert (=> b!834165 m!779117))

(push 1)

(assert (not b!834169))

(assert (not b!834165))

(assert (not b!834167))

(assert (not b!834168))

(assert (not b!834166))

(assert (not start!71768))

(check-sat)

(pop 1)

