; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48156 () Bool)

(assert start!48156)

(declare-fun b!530457 () Bool)

(declare-fun res!326162 () Bool)

(declare-fun e!309069 () Bool)

(assert (=> b!530457 (=> (not res!326162) (not e!309069))))

(declare-datatypes ((array!33592 0))(
  ( (array!33593 (arr!16143 (Array (_ BitVec 32) (_ BitVec 64))) (size!16507 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33592)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530457 (= res!326162 (validKeyInArray!0 (select (arr!16143 a!3154) j!147)))))

(declare-fun b!530458 () Bool)

(declare-fun res!326164 () Bool)

(assert (=> b!530458 (=> (not res!326164) (not e!309069))))

(declare-fun k!1998 () (_ BitVec 64))

(assert (=> b!530458 (= res!326164 (validKeyInArray!0 k!1998))))

(declare-fun res!326165 () Bool)

(assert (=> start!48156 (=> (not res!326165) (not e!309069))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48156 (= res!326165 (validMask!0 mask!3216))))

(assert (=> start!48156 e!309069))

(assert (=> start!48156 true))

(declare-fun array_inv!11939 (array!33592) Bool)

(assert (=> start!48156 (array_inv!11939 a!3154)))

(declare-fun b!530459 () Bool)

(assert (=> b!530459 (= e!309069 (and (bvslt #b00000000000000000000000000000000 (size!16507 a!3154)) (bvsge (size!16507 a!3154) #b01111111111111111111111111111111)))))

(declare-fun b!530456 () Bool)

(declare-fun res!326163 () Bool)

(assert (=> b!530456 (=> (not res!326163) (not e!309069))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530456 (= res!326163 (and (= (size!16507 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16507 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16507 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48156 res!326165) b!530456))

(assert (= (and b!530456 res!326163) b!530457))

(assert (= (and b!530457 res!326162) b!530458))

(assert (= (and b!530458 res!326164) b!530459))

(declare-fun m!511047 () Bool)

(assert (=> b!530457 m!511047))

(assert (=> b!530457 m!511047))

(declare-fun m!511049 () Bool)

(assert (=> b!530457 m!511049))

(declare-fun m!511051 () Bool)

(assert (=> b!530458 m!511051))

(declare-fun m!511053 () Bool)

(assert (=> start!48156 m!511053))

(declare-fun m!511055 () Bool)

(assert (=> start!48156 m!511055))

(push 1)

(assert (not start!48156))

(assert (not b!530458))

(assert (not b!530457))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

