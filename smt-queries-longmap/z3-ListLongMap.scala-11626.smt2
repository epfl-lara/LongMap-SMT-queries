; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135638 () Bool)

(assert start!135638)

(declare-fun res!1075928 () Bool)

(declare-fun e!878192 () Bool)

(assert (=> start!135638 (=> (not res!1075928) (not e!878192))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135638 (= res!1075928 (validMask!0 mask!898))))

(assert (=> start!135638 e!878192))

(assert (=> start!135638 true))

(declare-datatypes ((array!105305 0))(
  ( (array!105306 (arr!50798 (Array (_ BitVec 32) (_ BitVec 64))) (size!51348 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105305)

(declare-fun array_inv!39525 (array!105305) Bool)

(assert (=> start!135638 (array_inv!39525 _keys!605)))

(declare-fun b!1574632 () Bool)

(declare-fun res!1075929 () Bool)

(assert (=> b!1574632 (=> (not res!1075929) (not e!878192))))

(assert (=> b!1574632 (= res!1075929 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51348 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574633 () Bool)

(declare-fun res!1075927 () Bool)

(assert (=> b!1574633 (=> (not res!1075927) (not e!878192))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574633 (= res!1075927 (validKeyInArray!0 k0!761))))

(declare-fun b!1574634 () Bool)

(assert (=> b!1574634 (= e!878192 false)))

(declare-datatypes ((SeekEntryResult!13663 0))(
  ( (MissingZero!13663 (index!57050 (_ BitVec 32))) (Found!13663 (index!57051 (_ BitVec 32))) (Intermediate!13663 (undefined!14475 Bool) (index!57052 (_ BitVec 32)) (x!141997 (_ BitVec 32))) (Undefined!13663) (MissingVacant!13663 (index!57053 (_ BitVec 32))) )
))
(declare-fun lt!674881 () SeekEntryResult!13663)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105305 (_ BitVec 32)) SeekEntryResult!13663)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574634 (= lt!674881 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(assert (= (and start!135638 res!1075928) b!1574632))

(assert (= (and b!1574632 res!1075929) b!1574633))

(assert (= (and b!1574633 res!1075927) b!1574634))

(declare-fun m!1447865 () Bool)

(assert (=> start!135638 m!1447865))

(declare-fun m!1447867 () Bool)

(assert (=> start!135638 m!1447867))

(declare-fun m!1447869 () Bool)

(assert (=> b!1574633 m!1447869))

(declare-fun m!1447871 () Bool)

(assert (=> b!1574634 m!1447871))

(assert (=> b!1574634 m!1447871))

(declare-fun m!1447873 () Bool)

(assert (=> b!1574634 m!1447873))

(check-sat (not start!135638) (not b!1574634) (not b!1574633))
