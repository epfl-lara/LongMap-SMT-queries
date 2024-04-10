; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135630 () Bool)

(assert start!135630)

(declare-fun res!1075892 () Bool)

(declare-fun e!878167 () Bool)

(assert (=> start!135630 (=> (not res!1075892) (not e!878167))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135630 (= res!1075892 (validMask!0 mask!898))))

(assert (=> start!135630 e!878167))

(assert (=> start!135630 true))

(declare-datatypes ((array!105297 0))(
  ( (array!105298 (arr!50794 (Array (_ BitVec 32) (_ BitVec 64))) (size!51344 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105297)

(declare-fun array_inv!39521 (array!105297) Bool)

(assert (=> start!135630 (array_inv!39521 _keys!605)))

(declare-fun b!1574596 () Bool)

(declare-fun res!1075893 () Bool)

(assert (=> b!1574596 (=> (not res!1075893) (not e!878167))))

(assert (=> b!1574596 (= res!1075893 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51344 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574597 () Bool)

(declare-fun res!1075891 () Bool)

(assert (=> b!1574597 (=> (not res!1075891) (not e!878167))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574597 (= res!1075891 (validKeyInArray!0 k!761))))

(declare-fun b!1574598 () Bool)

(assert (=> b!1574598 (= e!878167 false)))

(declare-datatypes ((SeekEntryResult!13659 0))(
  ( (MissingZero!13659 (index!57034 (_ BitVec 32))) (Found!13659 (index!57035 (_ BitVec 32))) (Intermediate!13659 (undefined!14471 Bool) (index!57036 (_ BitVec 32)) (x!141985 (_ BitVec 32))) (Undefined!13659) (MissingVacant!13659 (index!57037 (_ BitVec 32))) )
))
(declare-fun lt!674869 () SeekEntryResult!13659)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105297 (_ BitVec 32)) SeekEntryResult!13659)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574598 (= lt!674869 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135630 res!1075892) b!1574596))

(assert (= (and b!1574596 res!1075893) b!1574597))

(assert (= (and b!1574597 res!1075891) b!1574598))

(declare-fun m!1447825 () Bool)

(assert (=> start!135630 m!1447825))

(declare-fun m!1447827 () Bool)

(assert (=> start!135630 m!1447827))

(declare-fun m!1447829 () Bool)

(assert (=> b!1574597 m!1447829))

(declare-fun m!1447831 () Bool)

(assert (=> b!1574598 m!1447831))

(assert (=> b!1574598 m!1447831))

(declare-fun m!1447833 () Bool)

(assert (=> b!1574598 m!1447833))

(push 1)

(assert (not start!135630))

(assert (not b!1574598))

(assert (not b!1574597))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

