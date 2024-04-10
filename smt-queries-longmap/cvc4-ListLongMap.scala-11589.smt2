; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135090 () Bool)

(assert start!135090)

(declare-fun res!1074569 () Bool)

(declare-fun e!876973 () Bool)

(assert (=> start!135090 (=> (not res!1074569) (not e!876973))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135090 (= res!1074569 (validMask!0 mask!889))))

(assert (=> start!135090 e!876973))

(assert (=> start!135090 true))

(declare-datatypes ((array!105052 0))(
  ( (array!105053 (arr!50688 (Array (_ BitVec 32) (_ BitVec 64))) (size!51238 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105052)

(declare-fun array_inv!39415 (array!105052) Bool)

(assert (=> start!135090 (array_inv!39415 _keys!600)))

(declare-fun b!1572706 () Bool)

(declare-fun res!1074570 () Bool)

(assert (=> b!1572706 (=> (not res!1074570) (not e!876973))))

(assert (=> b!1572706 (= res!1074570 (= (size!51238 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572707 () Bool)

(declare-fun res!1074568 () Bool)

(assert (=> b!1572707 (=> (not res!1074568) (not e!876973))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572707 (= res!1074568 (validKeyInArray!0 k!754))))

(declare-fun b!1572708 () Bool)

(assert (=> b!1572708 (= e!876973 false)))

(declare-datatypes ((SeekEntryResult!13601 0))(
  ( (MissingZero!13601 (index!56802 (_ BitVec 32))) (Found!13601 (index!56803 (_ BitVec 32))) (Intermediate!13601 (undefined!14413 Bool) (index!56804 (_ BitVec 32)) (x!141579 (_ BitVec 32))) (Undefined!13601) (MissingVacant!13601 (index!56805 (_ BitVec 32))) )
))
(declare-fun lt!674092 () SeekEntryResult!13601)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105052 (_ BitVec 32)) SeekEntryResult!13601)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572708 (= lt!674092 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135090 res!1074569) b!1572706))

(assert (= (and b!1572706 res!1074570) b!1572707))

(assert (= (and b!1572707 res!1074568) b!1572708))

(declare-fun m!1446381 () Bool)

(assert (=> start!135090 m!1446381))

(declare-fun m!1446383 () Bool)

(assert (=> start!135090 m!1446383))

(declare-fun m!1446385 () Bool)

(assert (=> b!1572707 m!1446385))

(declare-fun m!1446387 () Bool)

(assert (=> b!1572708 m!1446387))

(assert (=> b!1572708 m!1446387))

(declare-fun m!1446389 () Bool)

(assert (=> b!1572708 m!1446389))

(push 1)

(assert (not start!135090))

(assert (not b!1572707))

(assert (not b!1572708))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

