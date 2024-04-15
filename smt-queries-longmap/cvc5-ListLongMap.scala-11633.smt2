; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135734 () Bool)

(assert start!135734)

(declare-fun res!1076086 () Bool)

(declare-fun e!878261 () Bool)

(assert (=> start!135734 (=> (not res!1076086) (not e!878261))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135734 (= res!1076086 (validMask!0 mask!898))))

(assert (=> start!135734 e!878261))

(assert (=> start!135734 true))

(declare-datatypes ((array!105288 0))(
  ( (array!105289 (arr!50785 (Array (_ BitVec 32) (_ BitVec 64))) (size!51337 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105288)

(declare-fun array_inv!39721 (array!105288) Bool)

(assert (=> start!135734 (array_inv!39721 _keys!605)))

(declare-fun b!1574760 () Bool)

(declare-fun res!1076088 () Bool)

(assert (=> b!1574760 (=> (not res!1076088) (not e!878261))))

(assert (=> b!1574760 (= res!1076088 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51337 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574761 () Bool)

(declare-fun res!1076087 () Bool)

(assert (=> b!1574761 (=> (not res!1076087) (not e!878261))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574761 (= res!1076087 (validKeyInArray!0 k!761))))

(declare-fun b!1574762 () Bool)

(assert (=> b!1574762 (= e!878261 false)))

(declare-datatypes ((SeekEntryResult!13685 0))(
  ( (MissingZero!13685 (index!57138 (_ BitVec 32))) (Found!13685 (index!57139 (_ BitVec 32))) (Intermediate!13685 (undefined!14497 Bool) (index!57140 (_ BitVec 32)) (x!142088 (_ BitVec 32))) (Undefined!13685) (MissingVacant!13685 (index!57141 (_ BitVec 32))) )
))
(declare-fun lt!674769 () SeekEntryResult!13685)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105288 (_ BitVec 32)) SeekEntryResult!13685)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574762 (= lt!674769 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135734 res!1076086) b!1574760))

(assert (= (and b!1574760 res!1076088) b!1574761))

(assert (= (and b!1574761 res!1076087) b!1574762))

(declare-fun m!1447283 () Bool)

(assert (=> start!135734 m!1447283))

(declare-fun m!1447285 () Bool)

(assert (=> start!135734 m!1447285))

(declare-fun m!1447287 () Bool)

(assert (=> b!1574761 m!1447287))

(declare-fun m!1447289 () Bool)

(assert (=> b!1574762 m!1447289))

(assert (=> b!1574762 m!1447289))

(declare-fun m!1447291 () Bool)

(assert (=> b!1574762 m!1447291))

(push 1)

(assert (not b!1574761))

(assert (not start!135734))

(assert (not b!1574762))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

