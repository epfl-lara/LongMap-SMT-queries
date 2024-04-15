; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135852 () Bool)

(assert start!135852)

(declare-fun res!1076407 () Bool)

(declare-fun e!878525 () Bool)

(assert (=> start!135852 (=> (not res!1076407) (not e!878525))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135852 (= res!1076407 (validMask!0 mask!898))))

(assert (=> start!135852 e!878525))

(assert (=> start!135852 true))

(declare-datatypes ((array!105352 0))(
  ( (array!105353 (arr!50814 (Array (_ BitVec 32) (_ BitVec 64))) (size!51366 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105352)

(declare-fun array_inv!39750 (array!105352) Bool)

(assert (=> start!135852 (array_inv!39750 _keys!605)))

(declare-fun b!1575183 () Bool)

(declare-fun res!1076409 () Bool)

(assert (=> b!1575183 (=> (not res!1076409) (not e!878525))))

(assert (=> b!1575183 (= res!1076409 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51366 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575184 () Bool)

(declare-fun res!1076408 () Bool)

(assert (=> b!1575184 (=> (not res!1076408) (not e!878525))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575184 (= res!1076408 (validKeyInArray!0 k!761))))

(declare-datatypes ((SeekEntryResult!13714 0))(
  ( (MissingZero!13714 (index!57254 (_ BitVec 32))) (Found!13714 (index!57255 (_ BitVec 32))) (Intermediate!13714 (undefined!14526 Bool) (index!57256 (_ BitVec 32)) (x!142209 (_ BitVec 32))) (Undefined!13714) (MissingVacant!13714 (index!57257 (_ BitVec 32))) )
))
(declare-fun lt!674928 () SeekEntryResult!13714)

(declare-fun b!1575185 () Bool)

(assert (=> b!1575185 (= e!878525 (and (is-Intermediate!13714 lt!674928) (not (undefined!14526 lt!674928)) (not (= (select (arr!50814 _keys!605) (index!57256 lt!674928)) k!761)) (= (select (arr!50814 _keys!605) (index!57256 lt!674928)) #b0000000000000000000000000000000000000000000000000000000000000000) (or (bvslt (index!57256 lt!674928) #b00000000000000000000000000000000) (bvsge (index!57256 lt!674928) (size!51366 _keys!605)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105352 (_ BitVec 32)) SeekEntryResult!13714)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575185 (= lt!674928 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135852 res!1076407) b!1575183))

(assert (= (and b!1575183 res!1076409) b!1575184))

(assert (= (and b!1575184 res!1076408) b!1575185))

(declare-fun m!1447629 () Bool)

(assert (=> start!135852 m!1447629))

(declare-fun m!1447631 () Bool)

(assert (=> start!135852 m!1447631))

(declare-fun m!1447633 () Bool)

(assert (=> b!1575184 m!1447633))

(declare-fun m!1447635 () Bool)

(assert (=> b!1575185 m!1447635))

(declare-fun m!1447637 () Bool)

(assert (=> b!1575185 m!1447637))

(assert (=> b!1575185 m!1447637))

(declare-fun m!1447639 () Bool)

(assert (=> b!1575185 m!1447639))

(push 1)

(assert (not b!1575184))

(assert (not b!1575185))

(assert (not start!135852))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!165201 () Bool)

(assert (=> d!165201 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1575184 d!165201))

(declare-fun b!1575267 () Bool)

(declare-fun lt!674960 () SeekEntryResult!13714)

(assert (=> b!1575267 (and (bvsge (index!57256 lt!674960) #b00000000000000000000000000000000) (bvslt (index!57256 lt!674960) (size!51366 _keys!605)))))

(declare-fun res!1076446 () Bool)

(assert (=> b!1575267 (= res!1076446 (= (select (arr!50814 _keys!605) (index!57256 lt!674960)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!878572 () Bool)

(assert (=> b!1575267 (=> res!1076446 e!878572)))

(declare-fun b!1575268 () Bool)

(assert (=> b!1575268 (and (bvsge (index!57256 lt!674960) #b00000000000000000000000000000000) (bvslt (index!57256 lt!674960) (size!51366 _keys!605)))))

(assert (=> b!1575268 (= e!878572 (= (select (arr!50814 _keys!605) (index!57256 lt!674960)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1575269 () Bool)

(declare-fun e!878573 () SeekEntryResult!13714)

(declare-fun e!878576 () SeekEntryResult!13714)

(assert (=> b!1575269 (= e!878573 e!878576)))

(declare-fun c!145683 () Bool)

(declare-fun lt!674961 () (_ BitVec 64))

(assert (=> b!1575269 (= c!145683 (or (= lt!674961 k!761) (= (bvadd lt!674961 lt!674961) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!165203 () Bool)

(declare-fun e!878574 () Bool)

(assert (=> d!165203 e!878574))

(declare-fun c!145682 () Bool)

(assert (=> d!165203 (= c!145682 (and (is-Intermediate!13714 lt!674960) (undefined!14526 lt!674960)))))

(assert (=> d!165203 (= lt!674960 e!878573)))

(declare-fun c!145684 () Bool)

(assert (=> d!165203 (= c!145684 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!165203 (= lt!674961 (select (arr!50814 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!165203 (validMask!0 mask!898)))

(assert (=> d!165203 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!674960)))

(declare-fun b!1575270 () Bool)

(assert (=> b!1575270 (and (bvsge (index!57256 lt!674960) #b00000000000000000000000000000000) (bvslt (index!57256 lt!674960) (size!51366 _keys!605)))))

(declare-fun res!1076445 () Bool)

(assert (=> b!1575270 (= res!1076445 (= (select (arr!50814 _keys!605) (index!57256 lt!674960)) k!761))))

(assert (=> b!1575270 (=> res!1076445 e!878572)))

(declare-fun e!878575 () Bool)

(assert (=> b!1575270 (= e!878575 e!878572)))

(declare-fun b!1575271 () Bool)

(assert (=> b!1575271 (= e!878574 e!878575)))

(declare-fun res!1076447 () Bool)

(assert (=> b!1575271 (= res!1076447 (and (is-Intermediate!13714 lt!674960) (not (undefined!14526 lt!674960)) (bvslt (x!142209 lt!674960) #b01111111111111111111111111111110) (bvsge (x!142209 lt!674960) #b00000000000000000000000000000000) (bvsge (x!142209 lt!674960) #b00000000000000000000000000000000)))))

(assert (=> b!1575271 (=> (not res!1076447) (not e!878575))))

(declare-fun b!1575272 () Bool)

(assert (=> b!1575272 (= e!878576 (Intermediate!13714 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575273 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575273 (= e!878576 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000 mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1575274 () Bool)

(assert (=> b!1575274 (= e!878573 (Intermediate!13714 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575275 () Bool)

(assert (=> b!1575275 (= e!878574 (bvsge (x!142209 lt!674960) #b01111111111111111111111111111110))))

(assert (= (and d!165203 c!145684) b!1575274))

(assert (= (and d!165203 (not c!145684)) b!1575269))

(assert (= (and b!1575269 c!145683) b!1575272))

(assert (= (and b!1575269 (not c!145683)) b!1575273))

(assert (= (and d!165203 c!145682) b!1575275))

(assert (= (and d!165203 (not c!145682)) b!1575271))

(assert (= (and b!1575271 res!1076447) b!1575270))

(assert (= (and b!1575270 (not res!1076445)) b!1575267))

(assert (= (and b!1575267 (not res!1076446)) b!1575268))

(assert (=> d!165203 m!1447637))

(declare-fun m!1447669 () Bool)

(assert (=> d!165203 m!1447669))

(assert (=> d!165203 m!1447629))

(declare-fun m!1447671 () Bool)

(assert (=> b!1575270 m!1447671))

(assert (=> b!1575267 m!1447671))

(assert (=> b!1575273 m!1447637))

(declare-fun m!1447673 () Bool)

(assert (=> b!1575273 m!1447673))

(assert (=> b!1575273 m!1447673))

(declare-fun m!1447675 () Bool)

(assert (=> b!1575273 m!1447675))

(assert (=> b!1575268 m!1447671))

(assert (=> b!1575185 d!165203))

(declare-fun d!165213 () Bool)

(declare-fun lt!674967 () (_ BitVec 32))

(declare-fun lt!674966 () (_ BitVec 32))

(assert (=> d!165213 (= lt!674967 (bvmul (bvxor lt!674966 (bvlshr lt!674966 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165213 (= lt!674966 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165213 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1076448 (let ((h!38311 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142216 (bvmul (bvxor h!38311 (bvlshr h!38311 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142216 (bvlshr x!142216 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1076448 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1076448 #b00000000000000000000000000000000))))))

(assert (=> d!165213 (= (toIndex!0 k!761 mask!898) (bvand (bvxor lt!674967 (bvlshr lt!674967 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1575185 d!165213))

(declare-fun d!165221 () Bool)

(assert (=> d!165221 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!135852 d!165221))

(declare-fun d!165223 () Bool)

(assert (=> d!165223 (= (array_inv!39750 _keys!605) (bvsge (size!51366 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!135852 d!165223))

(push 1)

(assert (not b!1575273))

(assert (not d!165203))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

