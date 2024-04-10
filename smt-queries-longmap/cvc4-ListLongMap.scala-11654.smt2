; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136250 () Bool)

(assert start!136250)

(declare-fun res!1077177 () Bool)

(declare-fun e!879503 () Bool)

(assert (=> start!136250 (=> (not res!1077177) (not e!879503))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136250 (= res!1077177 (validMask!0 mask!898))))

(assert (=> start!136250 e!879503))

(assert (=> start!136250 true))

(declare-datatypes ((array!105516 0))(
  ( (array!105517 (arr!50883 (Array (_ BitVec 32) (_ BitVec 64))) (size!51433 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105516)

(declare-fun array_inv!39610 (array!105516) Bool)

(assert (=> start!136250 (array_inv!39610 _keys!605)))

(declare-fun b!1576811 () Bool)

(declare-fun e!879502 () Bool)

(assert (=> b!1576811 (= e!879503 e!879502)))

(declare-fun res!1077174 () Bool)

(assert (=> b!1576811 (=> (not res!1077174) (not e!879502))))

(declare-fun lt!675810 () Bool)

(declare-datatypes ((SeekEntryResult!13748 0))(
  ( (MissingZero!13748 (index!57390 (_ BitVec 32))) (Found!13748 (index!57391 (_ BitVec 32))) (Intermediate!13748 (undefined!14560 Bool) (index!57392 (_ BitVec 32)) (x!142402 (_ BitVec 32))) (Undefined!13748) (MissingVacant!13748 (index!57393 (_ BitVec 32))) )
))
(declare-fun lt!675811 () SeekEntryResult!13748)

(assert (=> b!1576811 (= res!1077174 (and (or lt!675810 (not (undefined!14560 lt!675811))) (or lt!675810 (undefined!14560 lt!675811))))))

(assert (=> b!1576811 (= lt!675810 (not (is-Intermediate!13748 lt!675811)))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105516 (_ BitVec 32)) SeekEntryResult!13748)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576811 (= lt!675811 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1576810 () Bool)

(declare-fun res!1077175 () Bool)

(assert (=> b!1576810 (=> (not res!1077175) (not e!879503))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576810 (= res!1077175 (validKeyInArray!0 k!761))))

(declare-fun b!1576809 () Bool)

(declare-fun res!1077176 () Bool)

(assert (=> b!1576809 (=> (not res!1077176) (not e!879503))))

(assert (=> b!1576809 (= res!1077176 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51433 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1576812 () Bool)

(declare-fun lt!675809 () SeekEntryResult!13748)

(assert (=> b!1576812 (= e!879502 (and (not (is-Undefined!13748 lt!675809)) (not (is-Found!13748 lt!675809)) (not (is-MissingZero!13748 lt!675809)) (is-MissingVacant!13748 lt!675809) (or (bvslt (index!57393 lt!675809) #b00000000000000000000000000000000) (bvsge (index!57393 lt!675809) (size!51433 _keys!605)))))))

(declare-fun err!206 () SeekEntryResult!13748)

(assert (=> b!1576812 (= lt!675809 err!206)))

(assert (=> b!1576812 true))

(assert (= (and start!136250 res!1077177) b!1576809))

(assert (= (and b!1576809 res!1077176) b!1576810))

(assert (= (and b!1576810 res!1077175) b!1576811))

(assert (= (and b!1576811 res!1077174) b!1576812))

(declare-fun m!1449249 () Bool)

(assert (=> start!136250 m!1449249))

(declare-fun m!1449251 () Bool)

(assert (=> start!136250 m!1449251))

(declare-fun m!1449253 () Bool)

(assert (=> b!1576811 m!1449253))

(assert (=> b!1576811 m!1449253))

(declare-fun m!1449255 () Bool)

(assert (=> b!1576811 m!1449255))

(declare-fun m!1449257 () Bool)

(assert (=> b!1576810 m!1449257))

(push 1)

(assert (not start!136250))

(assert (not b!1576810))

(assert (not b!1576811))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!165761 () Bool)

(assert (=> d!165761 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136250 d!165761))

(declare-fun d!165769 () Bool)

(assert (=> d!165769 (= (array_inv!39610 _keys!605) (bvsge (size!51433 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136250 d!165769))

