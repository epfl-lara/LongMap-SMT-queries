; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135680 () Bool)

(assert start!135680)

(declare-fun res!1076013 () Bool)

(declare-fun e!878273 () Bool)

(assert (=> start!135680 (=> (not res!1076013) (not e!878273))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135680 (= res!1076013 (validMask!0 mask!898))))

(assert (=> start!135680 e!878273))

(assert (=> start!135680 true))

(declare-datatypes ((array!105320 0))(
  ( (array!105321 (arr!50804 (Array (_ BitVec 32) (_ BitVec 64))) (size!51354 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105320)

(declare-fun array_inv!39531 (array!105320) Bool)

(assert (=> start!135680 (array_inv!39531 _keys!605)))

(declare-fun b!1574767 () Bool)

(declare-fun res!1076012 () Bool)

(assert (=> b!1574767 (=> (not res!1076012) (not e!878273))))

(assert (=> b!1574767 (= res!1076012 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51354 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574768 () Bool)

(declare-fun res!1076011 () Bool)

(assert (=> b!1574768 (=> (not res!1076011) (not e!878273))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574768 (= res!1076011 (validKeyInArray!0 k0!761))))

(declare-fun b!1574769 () Bool)

(assert (=> b!1574769 (= e!878273 false)))

(declare-datatypes ((SeekEntryResult!13669 0))(
  ( (MissingZero!13669 (index!57074 (_ BitVec 32))) (Found!13669 (index!57075 (_ BitVec 32))) (Intermediate!13669 (undefined!14481 Bool) (index!57076 (_ BitVec 32)) (x!142025 (_ BitVec 32))) (Undefined!13669) (MissingVacant!13669 (index!57077 (_ BitVec 32))) )
))
(declare-fun lt!674935 () SeekEntryResult!13669)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105320 (_ BitVec 32)) SeekEntryResult!13669)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574769 (= lt!674935 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(assert (= (and start!135680 res!1076013) b!1574767))

(assert (= (and b!1574767 res!1076012) b!1574768))

(assert (= (and b!1574768 res!1076011) b!1574769))

(declare-fun m!1447955 () Bool)

(assert (=> start!135680 m!1447955))

(declare-fun m!1447957 () Bool)

(assert (=> start!135680 m!1447957))

(declare-fun m!1447959 () Bool)

(assert (=> b!1574768 m!1447959))

(declare-fun m!1447961 () Bool)

(assert (=> b!1574769 m!1447961))

(assert (=> b!1574769 m!1447961))

(declare-fun m!1447963 () Bool)

(assert (=> b!1574769 m!1447963))

(check-sat (not b!1574768) (not start!135680) (not b!1574769))
(check-sat)
