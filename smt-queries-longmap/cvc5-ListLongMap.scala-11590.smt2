; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135508 () Bool)

(assert start!135508)

(declare-fun res!1075457 () Bool)

(declare-fun e!878501 () Bool)

(assert (=> start!135508 (=> (not res!1075457) (not e!878501))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135508 (= res!1075457 (validMask!0 mask!889))))

(assert (=> start!135508 e!878501))

(assert (=> start!135508 true))

(declare-datatypes ((array!105180 0))(
  ( (array!105181 (arr!50745 (Array (_ BitVec 32) (_ BitVec 64))) (size!51296 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105180)

(declare-fun array_inv!39700 (array!105180) Bool)

(assert (=> start!135508 (array_inv!39700 _keys!600)))

(declare-fun b!1575169 () Bool)

(declare-fun res!1075455 () Bool)

(assert (=> b!1575169 (=> (not res!1075455) (not e!878501))))

(assert (=> b!1575169 (= res!1075455 (= (size!51296 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1575170 () Bool)

(declare-fun res!1075456 () Bool)

(assert (=> b!1575170 (=> (not res!1075456) (not e!878501))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575170 (= res!1075456 (validKeyInArray!0 k!754))))

(declare-fun b!1575171 () Bool)

(assert (=> b!1575171 (= e!878501 false)))

(declare-datatypes ((SeekEntryResult!13552 0))(
  ( (MissingZero!13552 (index!56606 (_ BitVec 32))) (Found!13552 (index!56607 (_ BitVec 32))) (Intermediate!13552 (undefined!14364 Bool) (index!56608 (_ BitVec 32)) (x!141589 (_ BitVec 32))) (Undefined!13552) (MissingVacant!13552 (index!56609 (_ BitVec 32))) )
))
(declare-fun lt!675009 () SeekEntryResult!13552)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105180 (_ BitVec 32)) SeekEntryResult!13552)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575171 (= lt!675009 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135508 res!1075457) b!1575169))

(assert (= (and b!1575169 res!1075455) b!1575170))

(assert (= (and b!1575170 res!1075456) b!1575171))

(declare-fun m!1448669 () Bool)

(assert (=> start!135508 m!1448669))

(declare-fun m!1448671 () Bool)

(assert (=> start!135508 m!1448671))

(declare-fun m!1448673 () Bool)

(assert (=> b!1575170 m!1448673))

(declare-fun m!1448675 () Bool)

(assert (=> b!1575171 m!1448675))

(assert (=> b!1575171 m!1448675))

(declare-fun m!1448677 () Bool)

(assert (=> b!1575171 m!1448677))

(push 1)

(assert (not b!1575170))

(assert (not start!135508))

(assert (not b!1575171))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

