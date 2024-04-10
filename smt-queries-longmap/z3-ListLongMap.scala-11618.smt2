; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135566 () Bool)

(assert start!135566)

(declare-fun res!1075709 () Bool)

(declare-fun e!878048 () Bool)

(assert (=> start!135566 (=> (not res!1075709) (not e!878048))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135566 (= res!1075709 (validMask!0 mask!898))))

(assert (=> start!135566 e!878048))

(assert (=> start!135566 true))

(declare-datatypes ((array!105254 0))(
  ( (array!105255 (arr!50774 (Array (_ BitVec 32) (_ BitVec 64))) (size!51324 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105254)

(declare-fun array_inv!39501 (array!105254) Bool)

(assert (=> start!135566 (array_inv!39501 _keys!605)))

(declare-fun b!1574416 () Bool)

(declare-fun res!1075710 () Bool)

(assert (=> b!1574416 (=> (not res!1075710) (not e!878048))))

(assert (=> b!1574416 (= res!1075710 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51324 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574417 () Bool)

(declare-fun res!1075708 () Bool)

(assert (=> b!1574417 (=> (not res!1075708) (not e!878048))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574417 (= res!1075708 (validKeyInArray!0 k0!761))))

(declare-fun b!1574418 () Bool)

(assert (=> b!1574418 (= e!878048 false)))

(declare-fun lt!674791 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574418 (= lt!674791 (toIndex!0 k0!761 mask!898))))

(assert (= (and start!135566 res!1075709) b!1574416))

(assert (= (and b!1574416 res!1075710) b!1574417))

(assert (= (and b!1574417 res!1075708) b!1574418))

(declare-fun m!1447653 () Bool)

(assert (=> start!135566 m!1447653))

(declare-fun m!1447655 () Bool)

(assert (=> start!135566 m!1447655))

(declare-fun m!1447657 () Bool)

(assert (=> b!1574417 m!1447657))

(declare-fun m!1447659 () Bool)

(assert (=> b!1574418 m!1447659))

(check-sat (not b!1574418) (not start!135566) (not b!1574417))
