; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135068 () Bool)

(assert start!135068)

(declare-fun res!1074469 () Bool)

(declare-fun e!876907 () Bool)

(assert (=> start!135068 (=> (not res!1074469) (not e!876907))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135068 (= res!1074469 (validMask!0 mask!889))))

(assert (=> start!135068 e!876907))

(assert (=> start!135068 true))

(declare-datatypes ((array!105030 0))(
  ( (array!105031 (arr!50677 (Array (_ BitVec 32) (_ BitVec 64))) (size!51227 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105030)

(declare-fun array_inv!39404 (array!105030) Bool)

(assert (=> start!135068 (array_inv!39404 _keys!600)))

(declare-fun b!1572607 () Bool)

(declare-fun res!1074470 () Bool)

(assert (=> b!1572607 (=> (not res!1074470) (not e!876907))))

(assert (=> b!1572607 (= res!1074470 (= (size!51227 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572608 () Bool)

(declare-fun res!1074471 () Bool)

(assert (=> b!1572608 (=> (not res!1074471) (not e!876907))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572608 (= res!1074471 (validKeyInArray!0 k!754))))

(declare-fun b!1572609 () Bool)

(assert (=> b!1572609 (= e!876907 false)))

(declare-datatypes ((SeekEntryResult!13590 0))(
  ( (MissingZero!13590 (index!56758 (_ BitVec 32))) (Found!13590 (index!56759 (_ BitVec 32))) (Intermediate!13590 (undefined!14402 Bool) (index!56760 (_ BitVec 32)) (x!141544 (_ BitVec 32))) (Undefined!13590) (MissingVacant!13590 (index!56761 (_ BitVec 32))) )
))
(declare-fun lt!674059 () SeekEntryResult!13590)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105030 (_ BitVec 32)) SeekEntryResult!13590)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572609 (= lt!674059 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135068 res!1074469) b!1572607))

(assert (= (and b!1572607 res!1074470) b!1572608))

(assert (= (and b!1572608 res!1074471) b!1572609))

(declare-fun m!1446271 () Bool)

(assert (=> start!135068 m!1446271))

(declare-fun m!1446273 () Bool)

(assert (=> start!135068 m!1446273))

(declare-fun m!1446275 () Bool)

(assert (=> b!1572608 m!1446275))

(declare-fun m!1446277 () Bool)

(assert (=> b!1572609 m!1446277))

(assert (=> b!1572609 m!1446277))

(declare-fun m!1446279 () Bool)

(assert (=> b!1572609 m!1446279))

(push 1)

(assert (not start!135068))

(assert (not b!1572609))

(assert (not b!1572608))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

