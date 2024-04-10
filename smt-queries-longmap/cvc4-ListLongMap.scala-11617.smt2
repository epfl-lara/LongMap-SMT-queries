; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135562 () Bool)

(assert start!135562)

(declare-fun res!1075691 () Bool)

(declare-fun e!878035 () Bool)

(assert (=> start!135562 (=> (not res!1075691) (not e!878035))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135562 (= res!1075691 (validMask!0 mask!898))))

(assert (=> start!135562 e!878035))

(assert (=> start!135562 true))

(declare-datatypes ((array!105250 0))(
  ( (array!105251 (arr!50772 (Array (_ BitVec 32) (_ BitVec 64))) (size!51322 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105250)

(declare-fun array_inv!39499 (array!105250) Bool)

(assert (=> start!135562 (array_inv!39499 _keys!605)))

(declare-fun b!1574398 () Bool)

(declare-fun res!1075692 () Bool)

(assert (=> b!1574398 (=> (not res!1075692) (not e!878035))))

(assert (=> b!1574398 (= res!1075692 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51322 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574399 () Bool)

(declare-fun res!1075690 () Bool)

(assert (=> b!1574399 (=> (not res!1075690) (not e!878035))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574399 (= res!1075690 (validKeyInArray!0 k!761))))

(declare-fun b!1574400 () Bool)

(assert (=> b!1574400 (= e!878035 false)))

(declare-fun lt!674785 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574400 (= lt!674785 (toIndex!0 k!761 mask!898))))

(assert (= (and start!135562 res!1075691) b!1574398))

(assert (= (and b!1574398 res!1075692) b!1574399))

(assert (= (and b!1574399 res!1075690) b!1574400))

(declare-fun m!1447637 () Bool)

(assert (=> start!135562 m!1447637))

(declare-fun m!1447639 () Bool)

(assert (=> start!135562 m!1447639))

(declare-fun m!1447641 () Bool)

(assert (=> b!1574399 m!1447641))

(declare-fun m!1447643 () Bool)

(assert (=> b!1574400 m!1447643))

(push 1)

(assert (not b!1574399))

(assert (not start!135562))

