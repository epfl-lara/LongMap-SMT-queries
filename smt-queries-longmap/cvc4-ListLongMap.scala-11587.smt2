; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135078 () Bool)

(assert start!135078)

(declare-fun res!1074516 () Bool)

(declare-fun e!876937 () Bool)

(assert (=> start!135078 (=> (not res!1074516) (not e!876937))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135078 (= res!1074516 (validMask!0 mask!889))))

(assert (=> start!135078 e!876937))

(assert (=> start!135078 true))

(declare-datatypes ((array!105040 0))(
  ( (array!105041 (arr!50682 (Array (_ BitVec 32) (_ BitVec 64))) (size!51232 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105040)

(declare-fun array_inv!39409 (array!105040) Bool)

(assert (=> start!135078 (array_inv!39409 _keys!600)))

(declare-fun b!1572652 () Bool)

(declare-fun res!1074514 () Bool)

(assert (=> b!1572652 (=> (not res!1074514) (not e!876937))))

(assert (=> b!1572652 (= res!1074514 (= (size!51232 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572653 () Bool)

(declare-fun res!1074515 () Bool)

(assert (=> b!1572653 (=> (not res!1074515) (not e!876937))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572653 (= res!1074515 (validKeyInArray!0 k!754))))

(declare-fun b!1572654 () Bool)

(assert (=> b!1572654 (= e!876937 false)))

(declare-datatypes ((SeekEntryResult!13595 0))(
  ( (MissingZero!13595 (index!56778 (_ BitVec 32))) (Found!13595 (index!56779 (_ BitVec 32))) (Intermediate!13595 (undefined!14407 Bool) (index!56780 (_ BitVec 32)) (x!141557 (_ BitVec 32))) (Undefined!13595) (MissingVacant!13595 (index!56781 (_ BitVec 32))) )
))
(declare-fun lt!674074 () SeekEntryResult!13595)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105040 (_ BitVec 32)) SeekEntryResult!13595)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572654 (= lt!674074 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135078 res!1074516) b!1572652))

(assert (= (and b!1572652 res!1074514) b!1572653))

(assert (= (and b!1572653 res!1074515) b!1572654))

(declare-fun m!1446321 () Bool)

(assert (=> start!135078 m!1446321))

(declare-fun m!1446323 () Bool)

(assert (=> start!135078 m!1446323))

(declare-fun m!1446325 () Bool)

(assert (=> b!1572653 m!1446325))

(declare-fun m!1446327 () Bool)

(assert (=> b!1572654 m!1446327))

(assert (=> b!1572654 m!1446327))

(declare-fun m!1446329 () Bool)

(assert (=> b!1572654 m!1446329))

(push 1)

(assert (not start!135078))

(assert (not b!1572654))

(assert (not b!1572653))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

