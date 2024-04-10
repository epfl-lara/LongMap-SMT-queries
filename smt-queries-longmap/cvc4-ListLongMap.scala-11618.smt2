; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135568 () Bool)

(assert start!135568)

(declare-fun res!1075718 () Bool)

(declare-fun e!878053 () Bool)

(assert (=> start!135568 (=> (not res!1075718) (not e!878053))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135568 (= res!1075718 (validMask!0 mask!898))))

(assert (=> start!135568 e!878053))

(assert (=> start!135568 true))

(declare-datatypes ((array!105256 0))(
  ( (array!105257 (arr!50775 (Array (_ BitVec 32) (_ BitVec 64))) (size!51325 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105256)

(declare-fun array_inv!39502 (array!105256) Bool)

(assert (=> start!135568 (array_inv!39502 _keys!605)))

(declare-fun b!1574425 () Bool)

(declare-fun res!1075719 () Bool)

(assert (=> b!1574425 (=> (not res!1075719) (not e!878053))))

(assert (=> b!1574425 (= res!1075719 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51325 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574426 () Bool)

(declare-fun res!1075717 () Bool)

(assert (=> b!1574426 (=> (not res!1075717) (not e!878053))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574426 (= res!1075717 (validKeyInArray!0 k!761))))

(declare-fun b!1574427 () Bool)

(assert (=> b!1574427 (= e!878053 false)))

(declare-fun lt!674794 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574427 (= lt!674794 (toIndex!0 k!761 mask!898))))

(assert (= (and start!135568 res!1075718) b!1574425))

(assert (= (and b!1574425 res!1075719) b!1574426))

(assert (= (and b!1574426 res!1075717) b!1574427))

(declare-fun m!1447661 () Bool)

(assert (=> start!135568 m!1447661))

(declare-fun m!1447663 () Bool)

(assert (=> start!135568 m!1447663))

(declare-fun m!1447665 () Bool)

(assert (=> b!1574426 m!1447665))

(declare-fun m!1447667 () Bool)

(assert (=> b!1574427 m!1447667))

(push 1)

(assert (not b!1574427))

(assert (not start!135568))

(assert (not b!1574426))

(check-sat)

