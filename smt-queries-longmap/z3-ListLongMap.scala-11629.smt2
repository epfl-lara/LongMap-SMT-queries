; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135686 () Bool)

(assert start!135686)

(declare-fun res!1076038 () Bool)

(declare-fun e!878291 () Bool)

(assert (=> start!135686 (=> (not res!1076038) (not e!878291))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135686 (= res!1076038 (validMask!0 mask!898))))

(assert (=> start!135686 e!878291))

(assert (=> start!135686 true))

(declare-datatypes ((array!105326 0))(
  ( (array!105327 (arr!50807 (Array (_ BitVec 32) (_ BitVec 64))) (size!51357 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105326)

(declare-fun array_inv!39534 (array!105326) Bool)

(assert (=> start!135686 (array_inv!39534 _keys!605)))

(declare-fun b!1574794 () Bool)

(declare-fun res!1076040 () Bool)

(assert (=> b!1574794 (=> (not res!1076040) (not e!878291))))

(assert (=> b!1574794 (= res!1076040 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51357 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574795 () Bool)

(declare-fun res!1076039 () Bool)

(assert (=> b!1574795 (=> (not res!1076039) (not e!878291))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574795 (= res!1076039 (validKeyInArray!0 k0!761))))

(declare-fun b!1574796 () Bool)

(assert (=> b!1574796 (= e!878291 false)))

(declare-datatypes ((SeekEntryResult!13672 0))(
  ( (MissingZero!13672 (index!57086 (_ BitVec 32))) (Found!13672 (index!57087 (_ BitVec 32))) (Intermediate!13672 (undefined!14484 Bool) (index!57088 (_ BitVec 32)) (x!142036 (_ BitVec 32))) (Undefined!13672) (MissingVacant!13672 (index!57089 (_ BitVec 32))) )
))
(declare-fun lt!674944 () SeekEntryResult!13672)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105326 (_ BitVec 32)) SeekEntryResult!13672)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574796 (= lt!674944 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(assert (= (and start!135686 res!1076038) b!1574794))

(assert (= (and b!1574794 res!1076040) b!1574795))

(assert (= (and b!1574795 res!1076039) b!1574796))

(declare-fun m!1447985 () Bool)

(assert (=> start!135686 m!1447985))

(declare-fun m!1447987 () Bool)

(assert (=> start!135686 m!1447987))

(declare-fun m!1447989 () Bool)

(assert (=> b!1574795 m!1447989))

(declare-fun m!1447991 () Bool)

(assert (=> b!1574796 m!1447991))

(assert (=> b!1574796 m!1447991))

(declare-fun m!1447993 () Bool)

(assert (=> b!1574796 m!1447993))

(check-sat (not b!1574796) (not b!1574795) (not start!135686))
