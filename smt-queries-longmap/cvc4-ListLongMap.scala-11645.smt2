; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135934 () Bool)

(assert start!135934)

(declare-fun res!1076630 () Bool)

(declare-fun e!878809 () Bool)

(assert (=> start!135934 (=> (not res!1076630) (not e!878809))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135934 (= res!1076630 (validMask!0 mask!898))))

(assert (=> start!135934 e!878809))

(assert (=> start!135934 true))

(declare-datatypes ((array!105439 0))(
  ( (array!105440 (arr!50856 (Array (_ BitVec 32) (_ BitVec 64))) (size!51406 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105439)

(declare-fun array_inv!39583 (array!105439) Bool)

(assert (=> start!135934 (array_inv!39583 _keys!605)))

(declare-fun b!1575640 () Bool)

(declare-fun res!1076629 () Bool)

(assert (=> b!1575640 (=> (not res!1076629) (not e!878809))))

(assert (=> b!1575640 (= res!1076629 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51406 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575641 () Bool)

(declare-fun res!1076631 () Bool)

(assert (=> b!1575641 (=> (not res!1076631) (not e!878809))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575641 (= res!1076631 (validKeyInArray!0 k!761))))

(declare-fun b!1575642 () Bool)

(assert (=> b!1575642 (= e!878809 false)))

(declare-datatypes ((SeekEntryResult!13721 0))(
  ( (MissingZero!13721 (index!57282 (_ BitVec 32))) (Found!13721 (index!57283 (_ BitVec 32))) (Intermediate!13721 (undefined!14533 Bool) (index!57284 (_ BitVec 32)) (x!142243 (_ BitVec 32))) (Undefined!13721) (MissingVacant!13721 (index!57285 (_ BitVec 32))) )
))
(declare-fun lt!675271 () SeekEntryResult!13721)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105439 (_ BitVec 32)) SeekEntryResult!13721)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575642 (= lt!675271 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135934 res!1076630) b!1575640))

(assert (= (and b!1575640 res!1076629) b!1575641))

(assert (= (and b!1575641 res!1076631) b!1575642))

(declare-fun m!1448619 () Bool)

(assert (=> start!135934 m!1448619))

(declare-fun m!1448621 () Bool)

(assert (=> start!135934 m!1448621))

(declare-fun m!1448623 () Bool)

(assert (=> b!1575641 m!1448623))

(declare-fun m!1448625 () Bool)

(assert (=> b!1575642 m!1448625))

(assert (=> b!1575642 m!1448625))

(declare-fun m!1448627 () Bool)

(assert (=> b!1575642 m!1448627))

(push 1)

(assert (not b!1575641))

(assert (not start!135934))

(assert (not b!1575642))

(check-sat)

(pop 1)

