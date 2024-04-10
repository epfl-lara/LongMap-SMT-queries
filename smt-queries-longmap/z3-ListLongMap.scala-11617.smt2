; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135560 () Bool)

(assert start!135560)

(declare-fun res!1075682 () Bool)

(declare-fun e!878029 () Bool)

(assert (=> start!135560 (=> (not res!1075682) (not e!878029))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135560 (= res!1075682 (validMask!0 mask!898))))

(assert (=> start!135560 e!878029))

(assert (=> start!135560 true))

(declare-datatypes ((array!105248 0))(
  ( (array!105249 (arr!50771 (Array (_ BitVec 32) (_ BitVec 64))) (size!51321 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105248)

(declare-fun array_inv!39498 (array!105248) Bool)

(assert (=> start!135560 (array_inv!39498 _keys!605)))

(declare-fun b!1574389 () Bool)

(declare-fun res!1075681 () Bool)

(assert (=> b!1574389 (=> (not res!1075681) (not e!878029))))

(assert (=> b!1574389 (= res!1075681 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51321 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574390 () Bool)

(declare-fun res!1075683 () Bool)

(assert (=> b!1574390 (=> (not res!1075683) (not e!878029))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574390 (= res!1075683 (validKeyInArray!0 k0!761))))

(declare-fun b!1574391 () Bool)

(assert (=> b!1574391 (= e!878029 false)))

(declare-fun lt!674782 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574391 (= lt!674782 (toIndex!0 k0!761 mask!898))))

(assert (= (and start!135560 res!1075682) b!1574389))

(assert (= (and b!1574389 res!1075681) b!1574390))

(assert (= (and b!1574390 res!1075683) b!1574391))

(declare-fun m!1447629 () Bool)

(assert (=> start!135560 m!1447629))

(declare-fun m!1447631 () Bool)

(assert (=> start!135560 m!1447631))

(declare-fun m!1447633 () Bool)

(assert (=> b!1574390 m!1447633))

(declare-fun m!1447635 () Bool)

(assert (=> b!1574391 m!1447635))

(check-sat (not start!135560) (not b!1574391) (not b!1574390))
