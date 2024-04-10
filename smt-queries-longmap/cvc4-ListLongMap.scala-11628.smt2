; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135682 () Bool)

(assert start!135682)

(declare-fun res!1076021 () Bool)

(declare-fun e!878278 () Bool)

(assert (=> start!135682 (=> (not res!1076021) (not e!878278))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135682 (= res!1076021 (validMask!0 mask!898))))

(assert (=> start!135682 e!878278))

(assert (=> start!135682 true))

(declare-datatypes ((array!105322 0))(
  ( (array!105323 (arr!50805 (Array (_ BitVec 32) (_ BitVec 64))) (size!51355 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105322)

(declare-fun array_inv!39532 (array!105322) Bool)

(assert (=> start!135682 (array_inv!39532 _keys!605)))

(declare-fun b!1574776 () Bool)

(declare-fun res!1076022 () Bool)

(assert (=> b!1574776 (=> (not res!1076022) (not e!878278))))

(assert (=> b!1574776 (= res!1076022 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51355 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574777 () Bool)

(declare-fun res!1076020 () Bool)

(assert (=> b!1574777 (=> (not res!1076020) (not e!878278))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574777 (= res!1076020 (validKeyInArray!0 k!761))))

(declare-fun b!1574778 () Bool)

(assert (=> b!1574778 (= e!878278 false)))

(declare-datatypes ((SeekEntryResult!13670 0))(
  ( (MissingZero!13670 (index!57078 (_ BitVec 32))) (Found!13670 (index!57079 (_ BitVec 32))) (Intermediate!13670 (undefined!14482 Bool) (index!57080 (_ BitVec 32)) (x!142026 (_ BitVec 32))) (Undefined!13670) (MissingVacant!13670 (index!57081 (_ BitVec 32))) )
))
(declare-fun lt!674938 () SeekEntryResult!13670)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105322 (_ BitVec 32)) SeekEntryResult!13670)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574778 (= lt!674938 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135682 res!1076021) b!1574776))

(assert (= (and b!1574776 res!1076022) b!1574777))

(assert (= (and b!1574777 res!1076020) b!1574778))

(declare-fun m!1447965 () Bool)

(assert (=> start!135682 m!1447965))

(declare-fun m!1447967 () Bool)

(assert (=> start!135682 m!1447967))

(declare-fun m!1447969 () Bool)

(assert (=> b!1574777 m!1447969))

(declare-fun m!1447971 () Bool)

(assert (=> b!1574778 m!1447971))

(assert (=> b!1574778 m!1447971))

(declare-fun m!1447973 () Bool)

(assert (=> b!1574778 m!1447973))

(push 1)

(assert (not b!1574777))

(assert (not start!135682))

(assert (not b!1574778))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

