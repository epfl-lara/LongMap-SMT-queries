; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135688 () Bool)

(assert start!135688)

(declare-fun res!1076047 () Bool)

(declare-fun e!878297 () Bool)

(assert (=> start!135688 (=> (not res!1076047) (not e!878297))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135688 (= res!1076047 (validMask!0 mask!898))))

(assert (=> start!135688 e!878297))

(assert (=> start!135688 true))

(declare-datatypes ((array!105328 0))(
  ( (array!105329 (arr!50808 (Array (_ BitVec 32) (_ BitVec 64))) (size!51358 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105328)

(declare-fun array_inv!39535 (array!105328) Bool)

(assert (=> start!135688 (array_inv!39535 _keys!605)))

(declare-fun b!1574803 () Bool)

(declare-fun res!1076049 () Bool)

(assert (=> b!1574803 (=> (not res!1076049) (not e!878297))))

(assert (=> b!1574803 (= res!1076049 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51358 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574804 () Bool)

(declare-fun res!1076048 () Bool)

(assert (=> b!1574804 (=> (not res!1076048) (not e!878297))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574804 (= res!1076048 (validKeyInArray!0 k!761))))

(declare-fun b!1574805 () Bool)

(assert (=> b!1574805 (= e!878297 false)))

(declare-datatypes ((SeekEntryResult!13673 0))(
  ( (MissingZero!13673 (index!57090 (_ BitVec 32))) (Found!13673 (index!57091 (_ BitVec 32))) (Intermediate!13673 (undefined!14485 Bool) (index!57092 (_ BitVec 32)) (x!142037 (_ BitVec 32))) (Undefined!13673) (MissingVacant!13673 (index!57093 (_ BitVec 32))) )
))
(declare-fun lt!674947 () SeekEntryResult!13673)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105328 (_ BitVec 32)) SeekEntryResult!13673)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574805 (= lt!674947 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135688 res!1076047) b!1574803))

(assert (= (and b!1574803 res!1076049) b!1574804))

(assert (= (and b!1574804 res!1076048) b!1574805))

(declare-fun m!1447995 () Bool)

(assert (=> start!135688 m!1447995))

(declare-fun m!1447997 () Bool)

(assert (=> start!135688 m!1447997))

(declare-fun m!1447999 () Bool)

(assert (=> b!1574804 m!1447999))

(declare-fun m!1448001 () Bool)

(assert (=> b!1574805 m!1448001))

(assert (=> b!1574805 m!1448001))

(declare-fun m!1448003 () Bool)

(assert (=> b!1574805 m!1448003))

(push 1)

(assert (not b!1574805))

(assert (not b!1574804))

(assert (not start!135688))

(check-sat)

