; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135614 () Bool)

(assert start!135614)

(declare-fun res!1075821 () Bool)

(declare-fun e!878119 () Bool)

(assert (=> start!135614 (=> (not res!1075821) (not e!878119))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135614 (= res!1075821 (validMask!0 mask!898))))

(assert (=> start!135614 e!878119))

(assert (=> start!135614 true))

(declare-datatypes ((array!105281 0))(
  ( (array!105282 (arr!50786 (Array (_ BitVec 32) (_ BitVec 64))) (size!51336 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105281)

(declare-fun array_inv!39513 (array!105281) Bool)

(assert (=> start!135614 (array_inv!39513 _keys!605)))

(declare-fun b!1574524 () Bool)

(declare-fun res!1075820 () Bool)

(assert (=> b!1574524 (=> (not res!1075820) (not e!878119))))

(assert (=> b!1574524 (= res!1075820 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51336 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574525 () Bool)

(declare-fun res!1075819 () Bool)

(assert (=> b!1574525 (=> (not res!1075819) (not e!878119))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574525 (= res!1075819 (validKeyInArray!0 k0!761))))

(declare-fun b!1574526 () Bool)

(assert (=> b!1574526 (= e!878119 false)))

(declare-fun lt!674845 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574526 (= lt!674845 (toIndex!0 k0!761 mask!898))))

(assert (= (and start!135614 res!1075821) b!1574524))

(assert (= (and b!1574524 res!1075820) b!1574525))

(assert (= (and b!1574525 res!1075819) b!1574526))

(declare-fun m!1447749 () Bool)

(assert (=> start!135614 m!1447749))

(declare-fun m!1447751 () Bool)

(assert (=> start!135614 m!1447751))

(declare-fun m!1447753 () Bool)

(assert (=> b!1574525 m!1447753))

(declare-fun m!1447755 () Bool)

(assert (=> b!1574526 m!1447755))

(check-sat (not b!1574526) (not start!135614) (not b!1574525))
