; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135198 () Bool)

(assert start!135198)

(declare-fun b!1573157 () Bool)

(declare-fun e!877262 () Bool)

(declare-fun e!877261 () Bool)

(assert (=> b!1573157 (= e!877262 e!877261)))

(declare-fun res!1074864 () Bool)

(assert (=> b!1573157 (=> (not res!1074864) (not e!877261))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun mask!889 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13622 0))(
  ( (MissingZero!13622 (index!56886 (_ BitVec 32))) (Found!13622 (index!56887 (_ BitVec 32))) (Intermediate!13622 (undefined!14434 Bool) (index!56888 (_ BitVec 32)) (x!141671 (_ BitVec 32))) (Undefined!13622) (MissingVacant!13622 (index!56889 (_ BitVec 32))) )
))
(declare-fun lt!674290 () SeekEntryResult!13622)

(declare-datatypes ((array!105100 0))(
  ( (array!105101 (arr!50709 (Array (_ BitVec 32) (_ BitVec 64))) (size!51259 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105100)

(assert (=> b!1573157 (= res!1074864 (and (not (undefined!14434 lt!674290)) (is-Intermediate!13622 lt!674290) (not (= (select (arr!50709 _keys!600) (index!56888 lt!674290)) k!754)) (not (= (select (arr!50709 _keys!600) (index!56888 lt!674290)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50709 _keys!600) (index!56888 lt!674290)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!56888 lt!674290) #b00000000000000000000000000000000) (bvslt (index!56888 lt!674290) (bvadd #b00000000000000000000000000000001 mask!889))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105100 (_ BitVec 32)) SeekEntryResult!13622)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573157 (= lt!674290 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(declare-fun res!1074863 () Bool)

(assert (=> start!135198 (=> (not res!1074863) (not e!877262))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135198 (= res!1074863 (validMask!0 mask!889))))

(assert (=> start!135198 e!877262))

(assert (=> start!135198 true))

(declare-fun array_inv!39436 (array!105100) Bool)

(assert (=> start!135198 (array_inv!39436 _keys!600)))

(declare-fun b!1573155 () Bool)

(declare-fun res!1074862 () Bool)

(assert (=> b!1573155 (=> (not res!1074862) (not e!877262))))

(assert (=> b!1573155 (= res!1074862 (= (size!51259 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1573158 () Bool)

(declare-fun lt!674289 () SeekEntryResult!13622)

(assert (=> b!1573158 (= e!877261 (and (not (is-MissingVacant!13622 lt!674289)) (not (is-Found!13622 lt!674289)) (not (is-MissingZero!13622 lt!674289)) (not (is-Undefined!13622 lt!674289))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105100 (_ BitVec 32)) SeekEntryResult!13622)

(assert (=> b!1573158 (= lt!674289 (seekKeyOrZeroReturnVacant!0 (x!141671 lt!674290) (index!56888 lt!674290) (index!56888 lt!674290) k!754 _keys!600 mask!889))))

(declare-fun b!1573156 () Bool)

(declare-fun res!1074861 () Bool)

(assert (=> b!1573156 (=> (not res!1074861) (not e!877262))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573156 (= res!1074861 (validKeyInArray!0 k!754))))

(assert (= (and start!135198 res!1074863) b!1573155))

(assert (= (and b!1573155 res!1074862) b!1573156))

(assert (= (and b!1573156 res!1074861) b!1573157))

(assert (= (and b!1573157 res!1074864) b!1573158))

(declare-fun m!1446725 () Bool)

(assert (=> b!1573157 m!1446725))

(declare-fun m!1446727 () Bool)

(assert (=> b!1573157 m!1446727))

(assert (=> b!1573157 m!1446727))

(declare-fun m!1446729 () Bool)

(assert (=> b!1573157 m!1446729))

(declare-fun m!1446731 () Bool)

(assert (=> start!135198 m!1446731))

(declare-fun m!1446733 () Bool)

(assert (=> start!135198 m!1446733))

(declare-fun m!1446735 () Bool)

(assert (=> b!1573158 m!1446735))

(declare-fun m!1446737 () Bool)

(assert (=> b!1573156 m!1446737))

(push 1)

(assert (not b!1573156))

(assert (not start!135198))

(assert (not b!1573157))

(assert (not b!1573158))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!164937 () Bool)

(assert (=> d!164937 (= (validKeyInArray!0 k!754) (and (not (= k!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1573156 d!164937))

(declare-fun d!164939 () Bool)

(assert (=> d!164939 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!135198 d!164939))

(declare-fun d!164947 () Bool)

(assert (=> d!164947 (= (array_inv!39436 _keys!600) (bvsge (size!51259 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!135198 d!164947))

(declare-fun b!1573249 () Bool)

(declare-fun e!877314 () Bool)

(declare-fun e!877312 () Bool)

(assert (=> b!1573249 (= e!877314 e!877312)))

(declare-fun res!1074891 () Bool)

(declare-fun lt!674325 () SeekEntryResult!13622)

(assert (=> b!1573249 (= res!1074891 (and (is-Intermediate!13622 lt!674325) (not (undefined!14434 lt!674325)) (bvslt (x!141671 lt!674325) #b01111111111111111111111111111110) (bvsge (x!141671 lt!674325) #b00000000000000000000000000000000) (bvsge (x!141671 lt!674325) #b00000000000000000000000000000000)))))

(assert (=> b!1573249 (=> (not res!1074891) (not e!877312))))

(declare-fun b!1573250 () Bool)

(declare-fun e!877313 () SeekEntryResult!13622)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573250 (= e!877313 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000 mask!889) k!754 _keys!600 mask!889))))

(declare-fun b!1573251 () Bool)

(assert (=> b!1573251 (= e!877313 (Intermediate!13622 false (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1573252 () Bool)

(assert (=> b!1573252 (and (bvsge (index!56888 lt!674325) #b00000000000000000000000000000000) (bvslt (index!56888 lt!674325) (size!51259 _keys!600)))))

(declare-fun res!1074893 () Bool)

(assert (=> b!1573252 (= res!1074893 (= (select (arr!50709 _keys!600) (index!56888 lt!674325)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!877316 () Bool)

(assert (=> b!1573252 (=> res!1074893 e!877316)))

(declare-fun b!1573253 () Bool)

(declare-fun e!877315 () SeekEntryResult!13622)

(assert (=> b!1573253 (= e!877315 e!877313)))

(declare-fun c!145431 () Bool)

(declare-fun lt!674326 () (_ BitVec 64))

(assert (=> b!1573253 (= c!145431 (or (= lt!674326 k!754) (= (bvadd lt!674326 lt!674326) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!164949 () Bool)

(assert (=> d!164949 e!877314))

(declare-fun c!145430 () Bool)

(assert (=> d!164949 (= c!145430 (and (is-Intermediate!13622 lt!674325) (undefined!14434 lt!674325)))))

(assert (=> d!164949 (= lt!674325 e!877315)))

(declare-fun c!145429 () Bool)

(assert (=> d!164949 (= c!145429 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!164949 (= lt!674326 (select (arr!50709 _keys!600) (toIndex!0 k!754 mask!889)))))

(assert (=> d!164949 (validMask!0 mask!889)))

(assert (=> d!164949 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889) lt!674325)))

(declare-fun b!1573254 () Bool)

(assert (=> b!1573254 (= e!877314 (bvsge (x!141671 lt!674325) #b01111111111111111111111111111110))))

(declare-fun b!1573255 () Bool)

(assert (=> b!1573255 (and (bvsge (index!56888 lt!674325) #b00000000000000000000000000000000) (bvslt (index!56888 lt!674325) (size!51259 _keys!600)))))

(assert (=> b!1573255 (= e!877316 (= (select (arr!50709 _keys!600) (index!56888 lt!674325)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1573256 () Bool)

(assert (=> b!1573256 (and (bvsge (index!56888 lt!674325) #b00000000000000000000000000000000) (bvslt (index!56888 lt!674325) (size!51259 _keys!600)))))

(declare-fun res!1074892 () Bool)

(assert (=> b!1573256 (= res!1074892 (= (select (arr!50709 _keys!600) (index!56888 lt!674325)) k!754))))

(assert (=> b!1573256 (=> res!1074892 e!877316)))

(assert (=> b!1573256 (= e!877312 e!877316)))

(declare-fun b!1573257 () Bool)

(assert (=> b!1573257 (= e!877315 (Intermediate!13622 true (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(assert (= (and d!164949 c!145429) b!1573257))

(assert (= (and d!164949 (not c!145429)) b!1573253))

(assert (= (and b!1573253 c!145431) b!1573251))

(assert (= (and b!1573253 (not c!145431)) b!1573250))

(assert (= (and d!164949 c!145430) b!1573254))

