; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135752 () Bool)

(assert start!135752)

(declare-fun res!1076169 () Bool)

(declare-fun e!878314 () Bool)

(assert (=> start!135752 (=> (not res!1076169) (not e!878314))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135752 (= res!1076169 (validMask!0 mask!898))))

(assert (=> start!135752 e!878314))

(assert (=> start!135752 true))

(declare-datatypes ((array!105306 0))(
  ( (array!105307 (arr!50794 (Array (_ BitVec 32) (_ BitVec 64))) (size!51346 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105306)

(declare-fun array_inv!39730 (array!105306) Bool)

(assert (=> start!135752 (array_inv!39730 _keys!605)))

(declare-fun b!1574841 () Bool)

(declare-fun res!1076167 () Bool)

(assert (=> b!1574841 (=> (not res!1076167) (not e!878314))))

(assert (=> b!1574841 (= res!1076167 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51346 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574842 () Bool)

(declare-fun res!1076168 () Bool)

(assert (=> b!1574842 (=> (not res!1076168) (not e!878314))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574842 (= res!1076168 (validKeyInArray!0 k!761))))

(declare-fun b!1574843 () Bool)

(assert (=> b!1574843 (= e!878314 false)))

(declare-datatypes ((SeekEntryResult!13694 0))(
  ( (MissingZero!13694 (index!57174 (_ BitVec 32))) (Found!13694 (index!57175 (_ BitVec 32))) (Intermediate!13694 (undefined!14506 Bool) (index!57176 (_ BitVec 32)) (x!142121 (_ BitVec 32))) (Undefined!13694) (MissingVacant!13694 (index!57177 (_ BitVec 32))) )
))
(declare-fun lt!674796 () SeekEntryResult!13694)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105306 (_ BitVec 32)) SeekEntryResult!13694)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574843 (= lt!674796 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135752 res!1076169) b!1574841))

(assert (= (and b!1574841 res!1076167) b!1574842))

(assert (= (and b!1574842 res!1076168) b!1574843))

(declare-fun m!1447373 () Bool)

(assert (=> start!135752 m!1447373))

(declare-fun m!1447375 () Bool)

(assert (=> start!135752 m!1447375))

(declare-fun m!1447377 () Bool)

(assert (=> b!1574842 m!1447377))

(declare-fun m!1447379 () Bool)

(assert (=> b!1574843 m!1447379))

(assert (=> b!1574843 m!1447379))

(declare-fun m!1447381 () Bool)

(assert (=> b!1574843 m!1447381))

(push 1)

(assert (not start!135752))

(assert (not b!1574843))

(assert (not b!1574842))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

