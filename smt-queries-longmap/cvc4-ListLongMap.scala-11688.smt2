; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137106 () Bool)

(assert start!137106)

(declare-fun b!1580819 () Bool)

(declare-fun res!1079289 () Bool)

(declare-fun e!881897 () Bool)

(assert (=> b!1580819 (=> (not res!1079289) (not e!881897))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun k!772 () (_ BitVec 64))

(declare-fun ee!18 () (_ BitVec 32))

(declare-datatypes ((array!105868 0))(
  ( (array!105869 (arr!51038 (Array (_ BitVec 32) (_ BitVec 64))) (size!51589 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105868)

(assert (=> b!1580819 (= res!1079289 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!51038 _keys!614) ee!18) k!772)) (not (= (select (arr!51038 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1580818 () Bool)

(declare-fun res!1079290 () Bool)

(assert (=> b!1580818 (=> (not res!1079290) (not e!881897))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1580818 (= res!1079290 (validKeyInArray!0 k!772))))

(declare-fun res!1079291 () Bool)

(assert (=> start!137106 (=> (not res!1079291) (not e!881897))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!137106 (= res!1079291 (validMask!0 mask!918))))

(assert (=> start!137106 e!881897))

(assert (=> start!137106 true))

(declare-fun array_inv!39993 (array!105868) Bool)

(assert (=> start!137106 (array_inv!39993 _keys!614)))

(declare-fun b!1580820 () Bool)

(declare-datatypes ((SeekEntryResult!13713 0))(
  ( (MissingZero!13713 (index!57250 (_ BitVec 32))) (Found!13713 (index!57251 (_ BitVec 32))) (Intermediate!13713 (undefined!14525 Bool) (index!57252 (_ BitVec 32)) (x!142732 (_ BitVec 32))) (Undefined!13713) (MissingVacant!13713 (index!57253 (_ BitVec 32))) )
))
(declare-fun lt!677130 () SeekEntryResult!13713)

(assert (=> b!1580820 (= e!881897 (and (not (is-Undefined!13713 lt!677130)) (is-Found!13713 lt!677130) (or (bvslt (index!57251 lt!677130) #b00000000000000000000000000000000) (bvsge (index!57251 lt!677130) (size!51589 _keys!614)))))))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105868 (_ BitVec 32)) SeekEntryResult!13713)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1580820 (= lt!677130 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!466) (nextIndex!0 ee!18 (bvadd #b00000000000000000000000000000001 x!466) mask!918) vacantSpotIndex!10 k!772 _keys!614 mask!918))))

(declare-fun b!1580817 () Bool)

(declare-fun res!1079288 () Bool)

(assert (=> b!1580817 (=> (not res!1079288) (not e!881897))))

(assert (=> b!1580817 (= res!1079288 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51589 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!51038 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!137106 res!1079291) b!1580817))

(assert (= (and b!1580817 res!1079288) b!1580818))

(assert (= (and b!1580818 res!1079290) b!1580819))

(assert (= (and b!1580819 res!1079289) b!1580820))

(declare-fun m!1452743 () Bool)

(assert (=> start!137106 m!1452743))

(declare-fun m!1452745 () Bool)

(assert (=> start!137106 m!1452745))

(declare-fun m!1452747 () Bool)

(assert (=> b!1580818 m!1452747))

(declare-fun m!1452749 () Bool)

(assert (=> b!1580817 m!1452749))

(declare-fun m!1452751 () Bool)

(assert (=> b!1580819 m!1452751))

(declare-fun m!1452753 () Bool)

(assert (=> b!1580820 m!1452753))

(assert (=> b!1580820 m!1452753))

(declare-fun m!1452755 () Bool)

(assert (=> b!1580820 m!1452755))

(push 1)

(assert (not start!137106))

(assert (not b!1580820))

(assert (not b!1580818))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166773 () Bool)

(assert (=> d!166773 (= (validMask!0 mask!918) (and (or (= mask!918 #b00000000000000000000000000000111) (= mask!918 #b00000000000000000000000000001111) (= mask!918 #b00000000000000000000000000011111) (= mask!918 #b00000000000000000000000000111111) (= mask!918 #b00000000000000000000000001111111) (= mask!918 #b00000000000000000000000011111111) (= mask!918 #b00000000000000000000000111111111) (= mask!918 #b00000000000000000000001111111111) (= mask!918 #b00000000000000000000011111111111) (= mask!918 #b00000000000000000000111111111111) (= mask!918 #b00000000000000000001111111111111) (= mask!918 #b00000000000000000011111111111111) (= mask!918 #b00000000000000000111111111111111) (= mask!918 #b00000000000000001111111111111111) (= mask!918 #b00000000000000011111111111111111) (= mask!918 #b00000000000000111111111111111111) (= mask!918 #b00000000000001111111111111111111) (= mask!918 #b00000000000011111111111111111111) (= mask!918 #b00000000000111111111111111111111) (= mask!918 #b00000000001111111111111111111111) (= mask!918 #b00000000011111111111111111111111) (= mask!918 #b00000000111111111111111111111111) (= mask!918 #b00000001111111111111111111111111) (= mask!918 #b00000011111111111111111111111111) (= mask!918 #b00000111111111111111111111111111) (= mask!918 #b00001111111111111111111111111111) (= mask!918 #b00011111111111111111111111111111) (= mask!918 #b00111111111111111111111111111111)) (bvsle mask!918 #b00111111111111111111111111111111)))))

(assert (=> start!137106 d!166773))

(declare-fun d!166783 () Bool)

(assert (=> d!166783 (= (array_inv!39993 _keys!614) (bvsge (size!51589 _keys!614) #b00000000000000000000000000000000))))

(assert (=> start!137106 d!166783))

(declare-fun b!1580881 () Bool)

(declare-fun e!881930 () SeekEntryResult!13713)

(assert (=> b!1580881 (= e!881930 (MissingVacant!13713 vacantSpotIndex!10))))

(declare-fun b!1580882 () Bool)

(assert (=> b!1580882 (= e!881930 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!466 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 ee!18 (bvadd #b00000000000000000000000000000001 x!466) mask!918) (bvadd #b00000000000000000000000000000001 x!466 #b00000000000000000000000000000001) mask!918) vacantSpotIndex!10 k!772 _keys!614 mask!918))))

(declare-fun lt!677157 () SeekEntryResult!13713)

(declare-fun d!166785 () Bool)

(assert (=> d!166785 (and (or (is-Undefined!13713 lt!677157) (not (is-Found!13713 lt!677157)) (and (bvsge (index!57251 lt!677157) #b00000000000000000000000000000000) (bvslt (index!57251 lt!677157) (size!51589 _keys!614)))) (or (is-Undefined!13713 lt!677157) (is-Found!13713 lt!677157) (not (is-MissingVacant!13713 lt!677157)) (not (= (index!57253 lt!677157) vacantSpotIndex!10)) (and (bvsge (index!57253 lt!677157) #b00000000000000000000000000000000) (bvslt (index!57253 lt!677157) (size!51589 _keys!614)))) (or (is-Undefined!13713 lt!677157) (ite (is-Found!13713 lt!677157) (= (select (arr!51038 _keys!614) (index!57251 lt!677157)) k!772) (and (is-MissingVacant!13713 lt!677157) (= (index!57253 lt!677157) vacantSpotIndex!10) (= (select (arr!51038 _keys!614) (index!57253 lt!677157)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!881929 () SeekEntryResult!13713)

(assert (=> d!166785 (= lt!677157 e!881929)))

(declare-fun c!147086 () Bool)

(assert (=> d!166785 (= c!147086 (bvsge (bvadd #b00000000000000000000000000000001 x!466) #b01111111111111111111111111111110))))

(declare-fun lt!677156 () (_ BitVec 64))

(assert (=> d!166785 (= lt!677156 (select (arr!51038 _keys!614) (nextIndex!0 ee!18 (bvadd #b00000000000000000000000000000001 x!466) mask!918)))))

(assert (=> d!166785 (validMask!0 mask!918)))

(assert (=> d!166785 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!466) (nextIndex!0 ee!18 (bvadd #b00000000000000000000000000000001 x!466) mask!918) vacantSpotIndex!10 k!772 _keys!614 mask!918) lt!677157)))

(declare-fun b!1580883 () Bool)

(declare-fun e!881928 () SeekEntryResult!13713)

(assert (=> b!1580883 (= e!881928 (Found!13713 (nextIndex!0 ee!18 (bvadd #b00000000000000000000000000000001 x!466) mask!918)))))

(declare-fun b!1580884 () Bool)

(assert (=> b!1580884 (= e!881929 Undefined!13713)))

(declare-fun b!1580885 () Bool)

(declare-fun c!147084 () Bool)

(assert (=> b!1580885 (= c!147084 (= lt!677156 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1580885 (= e!881928 e!881930)))

(declare-fun b!1580886 () Bool)

(assert (=> b!1580886 (= e!881929 e!881928)))

(declare-fun c!147085 () Bool)

(assert (=> b!1580886 (= c!147085 (= lt!677156 k!772))))

(assert (= (and d!166785 c!147086) b!1580884))

(assert (= (and d!166785 (not c!147086)) b!1580886))

(assert (= (and b!1580886 c!147085) b!1580883))

(assert (= (and b!1580886 (not c!147085)) b!1580885))

(assert (= (and b!1580885 c!147084) b!1580881))

(assert (= (and b!1580885 (not c!147084)) b!1580882))

(assert (=> b!1580882 m!1452753))

(declare-fun m!1452795 () Bool)

(assert (=> b!1580882 m!1452795))

(assert (=> b!1580882 m!1452795))

(declare-fun m!1452797 () Bool)

(assert (=> b!1580882 m!1452797))

(declare-fun m!1452799 () Bool)

(assert (=> d!166785 m!1452799))

(declare-fun m!1452801 () Bool)

(assert (=> d!166785 m!1452801))

(assert (=> d!166785 m!1452753))

(declare-fun m!1452803 () Bool)

(assert (=> d!166785 m!1452803))

(assert (=> d!166785 m!1452743))

(assert (=> b!1580820 d!166785))

(declare-fun d!166789 () Bool)

(declare-fun lt!677160 () (_ BitVec 32))

(assert (=> d!166789 (and (bvsge lt!677160 #b00000000000000000000000000000000) (bvslt lt!677160 (bvadd mask!918 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!166789 (= lt!677160 (choose!52 ee!18 (bvadd #b00000000000000000000000000000001 x!466) mask!918))))

(assert (=> d!166789 (validMask!0 mask!918)))

(assert (=> d!166789 (= (nextIndex!0 ee!18 (bvadd #b00000000000000000000000000000001 x!466) mask!918) lt!677160)))

(declare-fun bs!45678 () Bool)

(assert (= bs!45678 d!166789))

(declare-fun m!1452805 () Bool)

(assert (=> bs!45678 m!1452805))

(assert (=> bs!45678 m!1452743))

(assert (=> b!1580820 d!166789))

(declare-fun d!166791 () Bool)

(assert (=> d!166791 (= (validKeyInArray!0 k!772) (and (not (= k!772 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!772 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1580818 d!166791))

(push 1)

(assert (not d!166789))

(assert (not b!1580882))

(assert (not d!166785))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

