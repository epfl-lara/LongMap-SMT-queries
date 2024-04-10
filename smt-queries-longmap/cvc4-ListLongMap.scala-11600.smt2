; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135352 () Bool)

(assert start!135352)

(declare-fun b!1573725 () Bool)

(declare-fun e!877593 () Bool)

(declare-datatypes ((SeekEntryResult!13634 0))(
  ( (MissingZero!13634 (index!56934 (_ BitVec 32))) (Found!13634 (index!56935 (_ BitVec 32))) (Intermediate!13634 (undefined!14446 Bool) (index!56936 (_ BitVec 32)) (x!141745 (_ BitVec 32))) (Undefined!13634) (MissingVacant!13634 (index!56937 (_ BitVec 32))) )
))
(declare-fun lt!674558 () SeekEntryResult!13634)

(assert (=> b!1573725 (= e!877593 (and (not (is-MissingVacant!13634 lt!674558)) (not (is-Found!13634 lt!674558)) (not (is-MissingZero!13634 lt!674558)) (not (is-Undefined!13634 lt!674558))))))

(declare-fun err!158 () SeekEntryResult!13634)

(assert (=> b!1573725 (= lt!674558 err!158)))

(assert (=> b!1573725 true))

(declare-fun res!1075118 () Bool)

(declare-fun e!877594 () Bool)

(assert (=> start!135352 (=> (not res!1075118) (not e!877594))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135352 (= res!1075118 (validMask!0 mask!889))))

(assert (=> start!135352 e!877594))

(assert (=> start!135352 true))

(declare-datatypes ((array!105136 0))(
  ( (array!105137 (arr!50721 (Array (_ BitVec 32) (_ BitVec 64))) (size!51271 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105136)

(declare-fun array_inv!39448 (array!105136) Bool)

(assert (=> start!135352 (array_inv!39448 _keys!600)))

(declare-fun b!1573723 () Bool)

(declare-fun res!1075117 () Bool)

(assert (=> b!1573723 (=> (not res!1075117) (not e!877594))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573723 (= res!1075117 (validKeyInArray!0 k!754))))

(declare-fun b!1573724 () Bool)

(assert (=> b!1573724 (= e!877594 e!877593)))

(declare-fun res!1075119 () Bool)

(assert (=> b!1573724 (=> (not res!1075119) (not e!877593))))

(declare-fun lt!674560 () Bool)

(declare-fun lt!674559 () SeekEntryResult!13634)

(assert (=> b!1573724 (= res!1075119 (and (or lt!674560 (not (undefined!14446 lt!674559))) (or lt!674560 (undefined!14446 lt!674559))))))

(assert (=> b!1573724 (= lt!674560 (not (is-Intermediate!13634 lt!674559)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105136 (_ BitVec 32)) SeekEntryResult!13634)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573724 (= lt!674559 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(declare-fun b!1573722 () Bool)

(declare-fun res!1075116 () Bool)

(assert (=> b!1573722 (=> (not res!1075116) (not e!877594))))

(assert (=> b!1573722 (= res!1075116 (= (size!51271 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(assert (= (and start!135352 res!1075118) b!1573722))

(assert (= (and b!1573722 res!1075116) b!1573723))

(assert (= (and b!1573723 res!1075117) b!1573724))

(assert (= (and b!1573724 res!1075119) b!1573725))

(declare-fun m!1447011 () Bool)

(assert (=> start!135352 m!1447011))

(declare-fun m!1447013 () Bool)

(assert (=> start!135352 m!1447013))

(declare-fun m!1447015 () Bool)

(assert (=> b!1573723 m!1447015))

(declare-fun m!1447017 () Bool)

(assert (=> b!1573724 m!1447017))

(assert (=> b!1573724 m!1447017))

(declare-fun m!1447019 () Bool)

(assert (=> b!1573724 m!1447019))

(push 1)

(assert (not start!135352))

(assert (not b!1573723))

(assert (not b!1573724))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!165077 () Bool)

(assert (=> d!165077 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!135352 d!165077))

(declare-fun d!165083 () Bool)

(assert (=> d!165083 (= (array_inv!39448 _keys!600) (bvsge (size!51271 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!135352 d!165083))

(declare-fun d!165087 () Bool)

(assert (=> d!165087 (= (validKeyInArray!0 k!754) (and (not (= k!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1573723 d!165087))

(declare-fun b!1573798 () Bool)

(declare-fun lt!674583 () SeekEntryResult!13634)

