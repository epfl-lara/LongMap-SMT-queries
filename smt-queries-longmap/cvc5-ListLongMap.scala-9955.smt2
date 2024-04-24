; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117824 () Bool)

(assert start!117824)

(declare-fun res!923198 () Bool)

(declare-fun e!783341 () Bool)

(assert (=> start!117824 (=> (not res!923198) (not e!783341))))

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((array!94226 0))(
  ( (array!94227 (arr!45501 (Array (_ BitVec 32) (_ BitVec 64))) (size!46052 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94226)

(assert (=> start!117824 (= res!923198 (and (bvslt (size!46052 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!46052 a!3931)) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) to!105)))))

(assert (=> start!117824 e!783341))

(declare-fun array_inv!34782 (array!94226) Bool)

(assert (=> start!117824 (array_inv!34782 a!3931)))

(assert (=> start!117824 true))

(declare-fun b!1382053 () Bool)

(declare-fun res!923199 () Bool)

(assert (=> b!1382053 (=> (not res!923199) (not e!783341))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382053 (= res!923199 (not (validKeyInArray!0 (select (arr!45501 a!3931) (bvsub to!105 #b00000000000000000000000000000001)))))))

(declare-fun b!1382054 () Bool)

(assert (=> b!1382054 (= e!783341 (bvsgt (bvsub to!105 #b00000000000000000000000000000001) (size!46052 a!3931)))))

(assert (= (and start!117824 res!923198) b!1382053))

(assert (= (and b!1382053 res!923199) b!1382054))

(declare-fun m!1267609 () Bool)

(assert (=> start!117824 m!1267609))

(declare-fun m!1267611 () Bool)

(assert (=> b!1382053 m!1267611))

(assert (=> b!1382053 m!1267611))

(declare-fun m!1267613 () Bool)

(assert (=> b!1382053 m!1267613))

(push 1)

(assert (not b!1382053))

(assert (not start!117824))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

