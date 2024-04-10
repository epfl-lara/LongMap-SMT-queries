; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135616 () Bool)

(assert start!135616)

(declare-fun res!1075830 () Bool)

(declare-fun e!878126 () Bool)

(assert (=> start!135616 (=> (not res!1075830) (not e!878126))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135616 (= res!1075830 (validMask!0 mask!898))))

(assert (=> start!135616 e!878126))

(assert (=> start!135616 true))

(declare-datatypes ((array!105283 0))(
  ( (array!105284 (arr!50787 (Array (_ BitVec 32) (_ BitVec 64))) (size!51337 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105283)

(declare-fun array_inv!39514 (array!105283) Bool)

(assert (=> start!135616 (array_inv!39514 _keys!605)))

(declare-fun b!1574533 () Bool)

(declare-fun res!1075829 () Bool)

(assert (=> b!1574533 (=> (not res!1075829) (not e!878126))))

(assert (=> b!1574533 (= res!1075829 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51337 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574534 () Bool)

(declare-fun res!1075828 () Bool)

(assert (=> b!1574534 (=> (not res!1075828) (not e!878126))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574534 (= res!1075828 (validKeyInArray!0 k!761))))

(declare-fun b!1574535 () Bool)

(assert (=> b!1574535 (= e!878126 false)))

(declare-fun lt!674848 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574535 (= lt!674848 (toIndex!0 k!761 mask!898))))

(assert (= (and start!135616 res!1075830) b!1574533))

(assert (= (and b!1574533 res!1075829) b!1574534))

(assert (= (and b!1574534 res!1075828) b!1574535))

(declare-fun m!1447757 () Bool)

(assert (=> start!135616 m!1447757))

(declare-fun m!1447759 () Bool)

(assert (=> start!135616 m!1447759))

(declare-fun m!1447761 () Bool)

(assert (=> b!1574534 m!1447761))

(declare-fun m!1447763 () Bool)

(assert (=> b!1574535 m!1447763))

(push 1)

(assert (not b!1574535))

(assert (not start!135616))

(assert (not b!1574534))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

