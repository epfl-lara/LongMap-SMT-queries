; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135572 () Bool)

(assert start!135572)

(declare-fun res!1075735 () Bool)

(declare-fun e!878065 () Bool)

(assert (=> start!135572 (=> (not res!1075735) (not e!878065))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135572 (= res!1075735 (validMask!0 mask!898))))

(assert (=> start!135572 e!878065))

(assert (=> start!135572 true))

(declare-datatypes ((array!105260 0))(
  ( (array!105261 (arr!50777 (Array (_ BitVec 32) (_ BitVec 64))) (size!51327 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105260)

(declare-fun array_inv!39504 (array!105260) Bool)

(assert (=> start!135572 (array_inv!39504 _keys!605)))

(declare-fun b!1574443 () Bool)

(declare-fun res!1075737 () Bool)

(assert (=> b!1574443 (=> (not res!1075737) (not e!878065))))

(assert (=> b!1574443 (= res!1075737 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51327 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574444 () Bool)

(declare-fun res!1075736 () Bool)

(assert (=> b!1574444 (=> (not res!1075736) (not e!878065))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574444 (= res!1075736 (validKeyInArray!0 k0!761))))

(declare-fun b!1574445 () Bool)

(assert (=> b!1574445 (= e!878065 false)))

(declare-fun lt!674800 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574445 (= lt!674800 (toIndex!0 k0!761 mask!898))))

(assert (= (and start!135572 res!1075735) b!1574443))

(assert (= (and b!1574443 res!1075737) b!1574444))

(assert (= (and b!1574444 res!1075736) b!1574445))

(declare-fun m!1447677 () Bool)

(assert (=> start!135572 m!1447677))

(declare-fun m!1447679 () Bool)

(assert (=> start!135572 m!1447679))

(declare-fun m!1447681 () Bool)

(assert (=> b!1574444 m!1447681))

(declare-fun m!1447683 () Bool)

(assert (=> b!1574445 m!1447683))

(check-sat (not b!1574445) (not start!135572) (not b!1574444))
