; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71960 () Bool)

(assert start!71960)

(declare-fun b!836157 () Bool)

(declare-fun res!568883 () Bool)

(declare-fun e!466457 () Bool)

(assert (=> b!836157 (=> (not res!568883) (not e!466457))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!836157 (= res!568883 (validKeyInArray!0 k!2968))))

(declare-fun b!836158 () Bool)

(declare-fun res!568884 () Bool)

(assert (=> b!836158 (=> (not res!568884) (not e!466457))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-datatypes ((array!46870 0))(
  ( (array!46871 (arr!22469 (Array (_ BitVec 32) (_ BitVec 64))) (size!22890 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46870)

(assert (=> b!836158 (= res!568884 (and (bvslt (size!22890 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22890 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!836156 () Bool)

(declare-fun res!568886 () Bool)

(assert (=> b!836156 (=> (not res!568886) (not e!466457))))

(assert (=> b!836156 (= res!568886 (not (validKeyInArray!0 (select (arr!22469 a!4227) i!1466))))))

(declare-fun res!568885 () Bool)

(assert (=> start!71960 (=> (not res!568885) (not e!466457))))

(assert (=> start!71960 (= res!568885 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22890 a!4227))))))

(assert (=> start!71960 e!466457))

(assert (=> start!71960 true))

(declare-fun array_inv!17916 (array!46870) Bool)

(assert (=> start!71960 (array_inv!17916 a!4227)))

(declare-fun b!836159 () Bool)

(assert (=> b!836159 (= e!466457 false)))

(declare-fun lt!380380 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46870 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!836159 (= lt!380380 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!380379 () (_ BitVec 32))

(assert (=> b!836159 (= lt!380379 (arrayCountValidKeys!0 (array!46871 (store (arr!22469 a!4227) i!1466 k!2968) (size!22890 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (= (and start!71960 res!568885) b!836156))

(assert (= (and b!836156 res!568886) b!836157))

(assert (= (and b!836157 res!568883) b!836158))

(assert (= (and b!836158 res!568884) b!836159))

(declare-fun m!781553 () Bool)

(assert (=> b!836157 m!781553))

(declare-fun m!781555 () Bool)

(assert (=> b!836156 m!781555))

(assert (=> b!836156 m!781555))

(declare-fun m!781557 () Bool)

(assert (=> b!836156 m!781557))

(declare-fun m!781559 () Bool)

(assert (=> start!71960 m!781559))

(declare-fun m!781561 () Bool)

(assert (=> b!836159 m!781561))

(declare-fun m!781563 () Bool)

(assert (=> b!836159 m!781563))

(declare-fun m!781565 () Bool)

(assert (=> b!836159 m!781565))

(push 1)

(assert (not b!836157))

(assert (not b!836156))

(assert (not start!71960))

(assert (not b!836159))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

