; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135622 () Bool)

(assert start!135622)

(declare-fun res!1075855 () Bool)

(declare-fun e!878144 () Bool)

(assert (=> start!135622 (=> (not res!1075855) (not e!878144))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135622 (= res!1075855 (validMask!0 mask!898))))

(assert (=> start!135622 e!878144))

(assert (=> start!135622 true))

(declare-datatypes ((array!105289 0))(
  ( (array!105290 (arr!50790 (Array (_ BitVec 32) (_ BitVec 64))) (size!51340 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105289)

(declare-fun array_inv!39517 (array!105289) Bool)

(assert (=> start!135622 (array_inv!39517 _keys!605)))

(declare-fun b!1574560 () Bool)

(declare-fun res!1075856 () Bool)

(assert (=> b!1574560 (=> (not res!1075856) (not e!878144))))

(assert (=> b!1574560 (= res!1075856 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51340 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574561 () Bool)

(declare-fun res!1075857 () Bool)

(assert (=> b!1574561 (=> (not res!1075857) (not e!878144))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574561 (= res!1075857 (validKeyInArray!0 k!761))))

(declare-fun b!1574562 () Bool)

(assert (=> b!1574562 (= e!878144 false)))

(declare-datatypes ((SeekEntryResult!13655 0))(
  ( (MissingZero!13655 (index!57018 (_ BitVec 32))) (Found!13655 (index!57019 (_ BitVec 32))) (Intermediate!13655 (undefined!14467 Bool) (index!57020 (_ BitVec 32)) (x!141965 (_ BitVec 32))) (Undefined!13655) (MissingVacant!13655 (index!57021 (_ BitVec 32))) )
))
(declare-fun lt!674857 () SeekEntryResult!13655)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105289 (_ BitVec 32)) SeekEntryResult!13655)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574562 (= lt!674857 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135622 res!1075855) b!1574560))

(assert (= (and b!1574560 res!1075856) b!1574561))

(assert (= (and b!1574561 res!1075857) b!1574562))

(declare-fun m!1447785 () Bool)

(assert (=> start!135622 m!1447785))

(declare-fun m!1447787 () Bool)

(assert (=> start!135622 m!1447787))

(declare-fun m!1447789 () Bool)

(assert (=> b!1574561 m!1447789))

(declare-fun m!1447791 () Bool)

(assert (=> b!1574562 m!1447791))

(assert (=> b!1574562 m!1447791))

(declare-fun m!1447793 () Bool)

(assert (=> b!1574562 m!1447793))

(push 1)

(assert (not start!135622))

(assert (not b!1574562))

(assert (not b!1574561))

