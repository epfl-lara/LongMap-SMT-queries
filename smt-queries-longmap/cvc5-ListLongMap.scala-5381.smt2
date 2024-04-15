; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71868 () Bool)

(assert start!71868)

(declare-fun b!835128 () Bool)

(declare-fun res!568139 () Bool)

(declare-fun e!465885 () Bool)

(assert (=> b!835128 (=> (not res!568139) (not e!465885))))

(declare-datatypes ((array!46767 0))(
  ( (array!46768 (arr!22418 (Array (_ BitVec 32) (_ BitVec 64))) (size!22839 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46767)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835128 (= res!568139 (and (bvslt (size!22839 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22839 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835129 () Bool)

(declare-fun res!568137 () Bool)

(assert (=> b!835129 (=> (not res!568137) (not e!465885))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835129 (= res!568137 (not (validKeyInArray!0 (select (arr!22418 a!4227) i!1466))))))

(declare-fun b!835130 () Bool)

(declare-fun res!568136 () Bool)

(declare-fun e!465887 () Bool)

(assert (=> b!835130 (=> (not res!568136) (not e!465887))))

(assert (=> b!835130 (= res!568136 (validKeyInArray!0 (select (arr!22418 a!4227) to!390)))))

(declare-fun e!465884 () Bool)

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun b!835131 () Bool)

(assert (=> b!835131 (= e!465884 (validKeyInArray!0 (select (store (arr!22418 a!4227) i!1466 k!2968) to!390)))))

(declare-fun b!835132 () Bool)

(assert (=> b!835132 (= e!465885 e!465887)))

(declare-fun res!568140 () Bool)

(assert (=> b!835132 (=> (not res!568140) (not e!465887))))

(declare-fun lt!379475 () (_ BitVec 32))

(declare-fun lt!379474 () (_ BitVec 32))

(assert (=> b!835132 (= res!568140 (and (= lt!379474 lt!379475) (not (= to!390 (size!22839 a!4227)))))))

(declare-fun arrayCountValidKeys!0 (array!46767 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835132 (= lt!379475 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835132 (= lt!379474 (arrayCountValidKeys!0 (array!46768 (store (arr!22418 a!4227) i!1466 k!2968) (size!22839 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun res!568138 () Bool)

(assert (=> start!71868 (=> (not res!568138) (not e!465885))))

(assert (=> start!71868 (= res!568138 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22839 a!4227))))))

(assert (=> start!71868 e!465885))

(assert (=> start!71868 true))

(declare-fun array_inv!17930 (array!46767) Bool)

(assert (=> start!71868 (array_inv!17930 a!4227)))

(declare-fun b!835133 () Bool)

(assert (=> b!835133 (= e!465887 (not e!465884))))

(declare-fun res!568141 () Bool)

(assert (=> b!835133 (=> (not res!568141) (not e!465884))))

(assert (=> b!835133 (= res!568141 (and (bvsge (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000) (bvslt to!390 (size!22839 a!4227))))))

(assert (=> b!835133 (= (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (bvadd #b00000000000000000000000000000001 lt!379475))))

(declare-datatypes ((Unit!28665 0))(
  ( (Unit!28666) )
))
(declare-fun lt!379473 () Unit!28665)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46767 (_ BitVec 32) (_ BitVec 32)) Unit!28665)

(assert (=> b!835133 (= lt!379473 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!835134 () Bool)

(declare-fun res!568135 () Bool)

(assert (=> b!835134 (=> (not res!568135) (not e!465885))))

(assert (=> b!835134 (= res!568135 (validKeyInArray!0 k!2968))))

(assert (= (and start!71868 res!568138) b!835129))

(assert (= (and b!835129 res!568137) b!835134))

(assert (= (and b!835134 res!568135) b!835128))

(assert (= (and b!835128 res!568139) b!835132))

(assert (= (and b!835132 res!568140) b!835130))

(assert (= (and b!835130 res!568136) b!835133))

(assert (= (and b!835133 res!568141) b!835131))

(declare-fun m!779789 () Bool)

(assert (=> b!835133 m!779789))

(declare-fun m!779791 () Bool)

(assert (=> b!835133 m!779791))

(declare-fun m!779793 () Bool)

(assert (=> b!835134 m!779793))

(declare-fun m!779795 () Bool)

(assert (=> b!835129 m!779795))

(assert (=> b!835129 m!779795))

(declare-fun m!779797 () Bool)

(assert (=> b!835129 m!779797))

(declare-fun m!779799 () Bool)

(assert (=> start!71868 m!779799))

(declare-fun m!779801 () Bool)

(assert (=> b!835132 m!779801))

(declare-fun m!779803 () Bool)

(assert (=> b!835132 m!779803))

(declare-fun m!779805 () Bool)

(assert (=> b!835132 m!779805))

(assert (=> b!835131 m!779803))

(declare-fun m!779807 () Bool)

(assert (=> b!835131 m!779807))

(assert (=> b!835131 m!779807))

(declare-fun m!779809 () Bool)

(assert (=> b!835131 m!779809))

(declare-fun m!779811 () Bool)

(assert (=> b!835130 m!779811))

(assert (=> b!835130 m!779811))

(declare-fun m!779813 () Bool)

(assert (=> b!835130 m!779813))

(push 1)

(assert (not b!835129))

(assert (not b!835131))

(assert (not b!835133))

(assert (not start!71868))

(assert (not b!835132))

(assert (not b!835134))

(assert (not b!835130))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

