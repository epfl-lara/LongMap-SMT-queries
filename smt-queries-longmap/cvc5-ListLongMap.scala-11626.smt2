; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135636 () Bool)

(assert start!135636)

(declare-fun res!1075920 () Bool)

(declare-fun e!878185 () Bool)

(assert (=> start!135636 (=> (not res!1075920) (not e!878185))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135636 (= res!1075920 (validMask!0 mask!898))))

(assert (=> start!135636 e!878185))

(assert (=> start!135636 true))

(declare-datatypes ((array!105303 0))(
  ( (array!105304 (arr!50797 (Array (_ BitVec 32) (_ BitVec 64))) (size!51347 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105303)

(declare-fun array_inv!39524 (array!105303) Bool)

(assert (=> start!135636 (array_inv!39524 _keys!605)))

(declare-fun b!1574623 () Bool)

(declare-fun res!1075918 () Bool)

(assert (=> b!1574623 (=> (not res!1075918) (not e!878185))))

(assert (=> b!1574623 (= res!1075918 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51347 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574624 () Bool)

(declare-fun res!1075919 () Bool)

(assert (=> b!1574624 (=> (not res!1075919) (not e!878185))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574624 (= res!1075919 (validKeyInArray!0 k!761))))

(declare-fun b!1574625 () Bool)

(assert (=> b!1574625 (= e!878185 false)))

(declare-datatypes ((SeekEntryResult!13662 0))(
  ( (MissingZero!13662 (index!57046 (_ BitVec 32))) (Found!13662 (index!57047 (_ BitVec 32))) (Intermediate!13662 (undefined!14474 Bool) (index!57048 (_ BitVec 32)) (x!141996 (_ BitVec 32))) (Undefined!13662) (MissingVacant!13662 (index!57049 (_ BitVec 32))) )
))
(declare-fun lt!674878 () SeekEntryResult!13662)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105303 (_ BitVec 32)) SeekEntryResult!13662)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574625 (= lt!674878 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135636 res!1075920) b!1574623))

(assert (= (and b!1574623 res!1075918) b!1574624))

(assert (= (and b!1574624 res!1075919) b!1574625))

(declare-fun m!1447855 () Bool)

(assert (=> start!135636 m!1447855))

(declare-fun m!1447857 () Bool)

(assert (=> start!135636 m!1447857))

(declare-fun m!1447859 () Bool)

(assert (=> b!1574624 m!1447859))

(declare-fun m!1447861 () Bool)

(assert (=> b!1574625 m!1447861))

(assert (=> b!1574625 m!1447861))

(declare-fun m!1447863 () Bool)

(assert (=> b!1574625 m!1447863))

(push 1)

(assert (not start!135636))

(assert (not b!1574625))

(assert (not b!1574624))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

