; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135876 () Bool)

(assert start!135876)

(declare-fun res!1076474 () Bool)

(declare-fun e!878681 () Bool)

(assert (=> start!135876 (=> (not res!1076474) (not e!878681))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135876 (= res!1076474 (validMask!0 mask!898))))

(assert (=> start!135876 e!878681))

(assert (=> start!135876 true))

(declare-datatypes ((array!105408 0))(
  ( (array!105409 (arr!50842 (Array (_ BitVec 32) (_ BitVec 64))) (size!51392 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105408)

(declare-fun array_inv!39569 (array!105408) Bool)

(assert (=> start!135876 (array_inv!39569 _keys!605)))

(declare-fun b!1575433 () Bool)

(declare-fun res!1076473 () Bool)

(assert (=> b!1575433 (=> (not res!1076473) (not e!878681))))

(assert (=> b!1575433 (= res!1076473 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51392 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575434 () Bool)

(declare-fun res!1076475 () Bool)

(assert (=> b!1575434 (=> (not res!1076475) (not e!878681))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575434 (= res!1076475 (validKeyInArray!0 k!761))))

(declare-fun b!1575435 () Bool)

(assert (=> b!1575435 (= e!878681 false)))

(declare-datatypes ((SeekEntryResult!13707 0))(
  ( (MissingZero!13707 (index!57226 (_ BitVec 32))) (Found!13707 (index!57227 (_ BitVec 32))) (Intermediate!13707 (undefined!14519 Bool) (index!57228 (_ BitVec 32)) (x!142191 (_ BitVec 32))) (Undefined!13707) (MissingVacant!13707 (index!57229 (_ BitVec 32))) )
))
(declare-fun lt!675193 () SeekEntryResult!13707)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105408 (_ BitVec 32)) SeekEntryResult!13707)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575435 (= lt!675193 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135876 res!1076474) b!1575433))

(assert (= (and b!1575433 res!1076473) b!1575434))

(assert (= (and b!1575434 res!1076475) b!1575435))

(declare-fun m!1448449 () Bool)

(assert (=> start!135876 m!1448449))

(declare-fun m!1448451 () Bool)

(assert (=> start!135876 m!1448451))

(declare-fun m!1448453 () Bool)

(assert (=> b!1575434 m!1448453))

(declare-fun m!1448455 () Bool)

(assert (=> b!1575435 m!1448455))

(assert (=> b!1575435 m!1448455))

(declare-fun m!1448457 () Bool)

(assert (=> b!1575435 m!1448457))

(push 1)

(assert (not b!1575434))

(assert (not b!1575435))

(assert (not start!135876))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

