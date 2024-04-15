; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135590 () Bool)

(assert start!135590)

(declare-fun res!1075755 () Bool)

(declare-fun e!877963 () Bool)

(assert (=> start!135590 (=> (not res!1075755) (not e!877963))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135590 (= res!1075755 (validMask!0 mask!898))))

(assert (=> start!135590 e!877963))

(assert (=> start!135590 true))

(declare-datatypes ((array!105225 0))(
  ( (array!105226 (arr!50758 (Array (_ BitVec 32) (_ BitVec 64))) (size!51310 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105225)

(declare-fun array_inv!39694 (array!105225) Bool)

(assert (=> start!135590 (array_inv!39694 _keys!605)))

(declare-fun b!1574274 () Bool)

(declare-fun res!1075754 () Bool)

(assert (=> b!1574274 (=> (not res!1075754) (not e!877963))))

(assert (=> b!1574274 (= res!1075754 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51310 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574275 () Bool)

(declare-fun res!1075753 () Bool)

(assert (=> b!1574275 (=> (not res!1075753) (not e!877963))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574275 (= res!1075753 (validKeyInArray!0 k!761))))

(declare-fun b!1574276 () Bool)

(assert (=> b!1574276 (= e!877963 false)))

(declare-datatypes ((SeekEntryResult!13658 0))(
  ( (MissingZero!13658 (index!57030 (_ BitVec 32))) (Found!13658 (index!57031 (_ BitVec 32))) (Intermediate!13658 (undefined!14470 Bool) (index!57032 (_ BitVec 32)) (x!141971 (_ BitVec 32))) (Undefined!13658) (MissingVacant!13658 (index!57033 (_ BitVec 32))) )
))
(declare-fun lt!674580 () SeekEntryResult!13658)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105225 (_ BitVec 32)) SeekEntryResult!13658)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574276 (= lt!674580 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135590 res!1075755) b!1574274))

(assert (= (and b!1574274 res!1075754) b!1574275))

(assert (= (and b!1574275 res!1075753) b!1574276))

(declare-fun m!1446923 () Bool)

(assert (=> start!135590 m!1446923))

(declare-fun m!1446925 () Bool)

(assert (=> start!135590 m!1446925))

(declare-fun m!1446927 () Bool)

(assert (=> b!1574275 m!1446927))

(declare-fun m!1446929 () Bool)

(assert (=> b!1574276 m!1446929))

(assert (=> b!1574276 m!1446929))

(declare-fun m!1446931 () Bool)

(assert (=> b!1574276 m!1446931))

(push 1)

(assert (not b!1574275))

(assert (not start!135590))

(assert (not b!1574276))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

