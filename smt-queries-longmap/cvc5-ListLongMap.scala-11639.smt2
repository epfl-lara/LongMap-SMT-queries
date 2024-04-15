; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135830 () Bool)

(assert start!135830)

(declare-fun res!1076309 () Bool)

(declare-fun e!878459 () Bool)

(assert (=> start!135830 (=> (not res!1076309) (not e!878459))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135830 (= res!1076309 (validMask!0 mask!898))))

(assert (=> start!135830 e!878459))

(assert (=> start!135830 true))

(declare-datatypes ((array!105330 0))(
  ( (array!105331 (arr!50803 (Array (_ BitVec 32) (_ BitVec 64))) (size!51355 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105330)

(declare-fun array_inv!39739 (array!105330) Bool)

(assert (=> start!135830 (array_inv!39739 _keys!605)))

(declare-fun b!1575084 () Bool)

(declare-fun res!1076308 () Bool)

(assert (=> b!1575084 (=> (not res!1076308) (not e!878459))))

(assert (=> b!1575084 (= res!1076308 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51355 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575085 () Bool)

(declare-fun res!1076310 () Bool)

(assert (=> b!1575085 (=> (not res!1076310) (not e!878459))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575085 (= res!1076310 (validKeyInArray!0 k!761))))

(declare-fun b!1575086 () Bool)

(assert (=> b!1575086 (= e!878459 false)))

(declare-datatypes ((SeekEntryResult!13703 0))(
  ( (MissingZero!13703 (index!57210 (_ BitVec 32))) (Found!13703 (index!57211 (_ BitVec 32))) (Intermediate!13703 (undefined!14515 Bool) (index!57212 (_ BitVec 32)) (x!142166 (_ BitVec 32))) (Undefined!13703) (MissingVacant!13703 (index!57213 (_ BitVec 32))) )
))
(declare-fun lt!674895 () SeekEntryResult!13703)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105330 (_ BitVec 32)) SeekEntryResult!13703)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575086 (= lt!674895 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135830 res!1076309) b!1575084))

(assert (= (and b!1575084 res!1076308) b!1575085))

(assert (= (and b!1575085 res!1076310) b!1575086))

(declare-fun m!1447517 () Bool)

(assert (=> start!135830 m!1447517))

(declare-fun m!1447519 () Bool)

(assert (=> start!135830 m!1447519))

(declare-fun m!1447521 () Bool)

(assert (=> b!1575085 m!1447521))

(declare-fun m!1447523 () Bool)

(assert (=> b!1575086 m!1447523))

(assert (=> b!1575086 m!1447523))

(declare-fun m!1447525 () Bool)

(assert (=> b!1575086 m!1447525))

(push 1)

(assert (not start!135830))

(assert (not b!1575086))

(assert (not b!1575085))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

