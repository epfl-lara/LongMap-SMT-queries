; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135400 () Bool)

(assert start!135400)

(declare-fun res!1075180 () Bool)

(declare-fun e!878266 () Bool)

(assert (=> start!135400 (=> (not res!1075180) (not e!878266))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135400 (= res!1075180 (validMask!0 mask!889))))

(assert (=> start!135400 e!878266))

(assert (=> start!135400 true))

(declare-datatypes ((array!105126 0))(
  ( (array!105127 (arr!50721 (Array (_ BitVec 32) (_ BitVec 64))) (size!51272 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105126)

(declare-fun array_inv!39676 (array!105126) Bool)

(assert (=> start!135400 (array_inv!39676 _keys!600)))

(declare-fun b!1574791 () Bool)

(declare-fun res!1075181 () Bool)

(assert (=> b!1574791 (=> (not res!1075181) (not e!878266))))

(assert (=> b!1574791 (= res!1075181 (= (size!51272 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1574792 () Bool)

(declare-fun res!1075179 () Bool)

(assert (=> b!1574792 (=> (not res!1075179) (not e!878266))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574792 (= res!1075179 (validKeyInArray!0 k!754))))

(declare-fun b!1574793 () Bool)

(assert (=> b!1574793 (= e!878266 false)))

(declare-datatypes ((SeekEntryResult!13528 0))(
  ( (MissingZero!13528 (index!56510 (_ BitVec 32))) (Found!13528 (index!56511 (_ BitVec 32))) (Intermediate!13528 (undefined!14340 Bool) (index!56512 (_ BitVec 32)) (x!141489 (_ BitVec 32))) (Undefined!13528) (MissingVacant!13528 (index!56513 (_ BitVec 32))) )
))
(declare-fun lt!674865 () SeekEntryResult!13528)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105126 (_ BitVec 32)) SeekEntryResult!13528)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574793 (= lt!674865 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135400 res!1075180) b!1574791))

(assert (= (and b!1574791 res!1075181) b!1574792))

(assert (= (and b!1574792 res!1075179) b!1574793))

(declare-fun m!1448375 () Bool)

(assert (=> start!135400 m!1448375))

(declare-fun m!1448377 () Bool)

(assert (=> start!135400 m!1448377))

(declare-fun m!1448379 () Bool)

(assert (=> b!1574792 m!1448379))

(declare-fun m!1448381 () Bool)

(assert (=> b!1574793 m!1448381))

(assert (=> b!1574793 m!1448381))

(declare-fun m!1448383 () Bool)

(assert (=> b!1574793 m!1448383))

(push 1)

(assert (not b!1574793))

(assert (not start!135400))

(assert (not b!1574792))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

