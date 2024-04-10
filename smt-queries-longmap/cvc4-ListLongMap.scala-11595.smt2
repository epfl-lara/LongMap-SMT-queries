; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135156 () Bool)

(assert start!135156)

(declare-fun b!1572984 () Bool)

(declare-fun res!1074798 () Bool)

(declare-fun e!877163 () Bool)

(assert (=> b!1572984 (=> (not res!1074798) (not e!877163))))

(declare-datatypes ((array!105091 0))(
  ( (array!105092 (arr!50706 (Array (_ BitVec 32) (_ BitVec 64))) (size!51256 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105091)

(declare-fun mask!889 () (_ BitVec 32))

(assert (=> b!1572984 (= res!1074798 (= (size!51256 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572987 () Bool)

(declare-fun e!877162 () Bool)

(declare-datatypes ((SeekEntryResult!13619 0))(
  ( (MissingZero!13619 (index!56874 (_ BitVec 32))) (Found!13619 (index!56875 (_ BitVec 32))) (Intermediate!13619 (undefined!14431 Bool) (index!56876 (_ BitVec 32)) (x!141651 (_ BitVec 32))) (Undefined!13619) (MissingVacant!13619 (index!56877 (_ BitVec 32))) )
))
(declare-fun lt!674217 () SeekEntryResult!13619)

(assert (=> b!1572987 (= e!877162 (and (not (is-MissingVacant!13619 lt!674217)) (is-Found!13619 lt!674217) (or (bvslt (index!56875 lt!674217) #b00000000000000000000000000000000) (bvsge (index!56875 lt!674217) (size!51256 _keys!600)))))))

(declare-fun lt!674218 () SeekEntryResult!13619)

(declare-fun k!754 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105091 (_ BitVec 32)) SeekEntryResult!13619)

(assert (=> b!1572987 (= lt!674217 (seekKeyOrZeroReturnVacant!0 (x!141651 lt!674218) (index!56876 lt!674218) (index!56876 lt!674218) k!754 _keys!600 mask!889))))

(declare-fun res!1074796 () Bool)

(assert (=> start!135156 (=> (not res!1074796) (not e!877163))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135156 (= res!1074796 (validMask!0 mask!889))))

(assert (=> start!135156 e!877163))

(assert (=> start!135156 true))

(declare-fun array_inv!39433 (array!105091) Bool)

(assert (=> start!135156 (array_inv!39433 _keys!600)))

(declare-fun b!1572986 () Bool)

(assert (=> b!1572986 (= e!877163 e!877162)))

(declare-fun res!1074795 () Bool)

(assert (=> b!1572986 (=> (not res!1074795) (not e!877162))))

(assert (=> b!1572986 (= res!1074795 (and (not (undefined!14431 lt!674218)) (is-Intermediate!13619 lt!674218) (not (= (select (arr!50706 _keys!600) (index!56876 lt!674218)) k!754)) (not (= (select (arr!50706 _keys!600) (index!56876 lt!674218)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50706 _keys!600) (index!56876 lt!674218)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!56876 lt!674218) #b00000000000000000000000000000000) (bvslt (index!56876 lt!674218) (bvadd #b00000000000000000000000000000001 mask!889))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105091 (_ BitVec 32)) SeekEntryResult!13619)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572986 (= lt!674218 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(declare-fun b!1572985 () Bool)

(declare-fun res!1074797 () Bool)

(assert (=> b!1572985 (=> (not res!1074797) (not e!877163))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572985 (= res!1074797 (validKeyInArray!0 k!754))))

(assert (= (and start!135156 res!1074796) b!1572984))

(assert (= (and b!1572984 res!1074798) b!1572985))

(assert (= (and b!1572985 res!1074797) b!1572986))

(assert (= (and b!1572986 res!1074795) b!1572987))

(declare-fun m!1446635 () Bool)

(assert (=> b!1572987 m!1446635))

(declare-fun m!1446637 () Bool)

(assert (=> start!135156 m!1446637))

(declare-fun m!1446639 () Bool)

(assert (=> start!135156 m!1446639))

(declare-fun m!1446641 () Bool)

(assert (=> b!1572986 m!1446641))

(declare-fun m!1446643 () Bool)

(assert (=> b!1572986 m!1446643))

(assert (=> b!1572986 m!1446643))

(declare-fun m!1446645 () Bool)

(assert (=> b!1572986 m!1446645))

(declare-fun m!1446647 () Bool)

(assert (=> b!1572985 m!1446647))

(push 1)

(assert (not b!1572985))

(assert (not start!135156))

(assert (not b!1572986))

(assert (not b!1572987))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!164899 () Bool)

(assert (=> d!164899 (= (validKeyInArray!0 k!754) (and (not (= k!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1572985 d!164899))

(declare-fun d!164901 () Bool)

(assert (=> d!164901 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!135156 d!164901))

(declare-fun d!164911 () Bool)

(assert (=> d!164911 (= (array_inv!39433 _keys!600) (bvsge (size!51256 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!135156 d!164911))

(declare-fun b!1573032 () Bool)

(declare-fun lt!674233 () SeekEntryResult!13619)

(assert (=> b!1573032 (and (bvsge (index!56876 lt!674233) #b00000000000000000000000000000000) (bvslt (index!56876 lt!674233) (size!51256 _keys!600)))))

(declare-fun e!877189 () Bool)

(assert (=> b!1573032 (= e!877189 (= (select (arr!50706 _keys!600) (index!56876 lt!674233)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1573033 () Bool)

(declare-fun e!877188 () Bool)

(assert (=> b!1573033 (= e!877188 (bvsge (x!141651 lt!674233) #b01111111111111111111111111111110))))

(declare-fun d!164913 () Bool)

(assert (=> d!164913 e!877188))

(declare-fun c!145362 () Bool)

(assert (=> d!164913 (= c!145362 (and (is-Intermediate!13619 lt!674233) (undefined!14431 lt!674233)))))

(declare-fun e!877190 () SeekEntryResult!13619)

(assert (=> d!164913 (= lt!674233 e!877190)))

(declare-fun c!145361 () Bool)

(assert (=> d!164913 (= c!145361 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!674234 () (_ BitVec 64))

(assert (=> d!164913 (= lt!674234 (select (arr!50706 _keys!600) (toIndex!0 k!754 mask!889)))))

(assert (=> d!164913 (validMask!0 mask!889)))

(assert (=> d!164913 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889) lt!674233)))

(declare-fun e!877187 () SeekEntryResult!13619)

(declare-fun b!1573034 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573034 (= e!877187 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000 mask!889) k!754 _keys!600 mask!889))))

(declare-fun b!1573035 () Bool)

(assert (=> b!1573035 (= e!877187 (Intermediate!13619 false (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1573036 () Bool)

(assert (=> b!1573036 (and (bvsge (index!56876 lt!674233) #b00000000000000000000000000000000) (bvslt (index!56876 lt!674233) (size!51256 _keys!600)))))

(declare-fun res!1074807 () Bool)

(assert (=> b!1573036 (= res!1074807 (= (select (arr!50706 _keys!600) (index!56876 lt!674233)) k!754))))

(assert (=> b!1573036 (=> res!1074807 e!877189)))

(declare-fun e!877191 () Bool)

(assert (=> b!1573036 (= e!877191 e!877189)))

(declare-fun b!1573037 () Bool)

(assert (=> b!1573037 (= e!877190 e!877187)))

(declare-fun c!145363 () Bool)

(assert (=> b!1573037 (= c!145363 (or (= lt!674234 k!754) (= (bvadd lt!674234 lt!674234) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1573038 () Bool)

(assert (=> b!1573038 (= e!877188 e!877191)))

(declare-fun res!1074806 () Bool)

(assert (=> b!1573038 (= res!1074806 (and (is-Intermediate!13619 lt!674233) (not (undefined!14431 lt!674233)) (bvslt (x!141651 lt!674233) #b01111111111111111111111111111110) (bvsge (x!141651 lt!674233) #b00000000000000000000000000000000) (bvsge (x!141651 lt!674233) #b00000000000000000000000000000000)))))

(assert (=> b!1573038 (=> (not res!1074806) (not e!877191))))

(declare-fun b!1573039 () Bool)

(assert (=> b!1573039 (= e!877190 (Intermediate!13619 true (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1573040 () Bool)

(assert (=> b!1573040 (and (bvsge (index!56876 lt!674233) #b00000000000000000000000000000000) (bvslt (index!56876 lt!674233) (size!51256 _keys!600)))))

(declare-fun res!1074805 () Bool)

(assert (=> b!1573040 (= res!1074805 (= (select (arr!50706 _keys!600) (index!56876 lt!674233)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1573040 (=> res!1074805 e!877189)))

(assert (= (and d!164913 c!145361) b!1573039))

(assert (= (and d!164913 (not c!145361)) b!1573037))

(assert (= (and b!1573037 c!145363) b!1573035))

(assert (= (and b!1573037 (not c!145363)) b!1573034))

(assert (= (and d!164913 c!145362) b!1573033))

(assert (= (and d!164913 (not c!145362)) b!1573038))

(assert (= (and b!1573038 res!1074806) b!1573036))

(assert (= (and b!1573036 (not res!1074807)) b!1573040))

(assert (= (and b!1573040 (not res!1074805)) b!1573032))

(declare-fun m!1446657 () Bool)

(assert (=> b!1573036 m!1446657))

(assert (=> b!1573034 m!1446643))

(declare-fun m!1446659 () Bool)

(assert (=> b!1573034 m!1446659))

(assert (=> b!1573034 m!1446659))

(declare-fun m!1446661 () Bool)

(assert (=> b!1573034 m!1446661))

(assert (=> b!1573040 m!1446657))

(assert (=> d!164913 m!1446643))

(declare-fun m!1446663 () Bool)

(assert (=> d!164913 m!1446663))

(assert (=> d!164913 m!1446637))

(assert (=> b!1573032 m!1446657))

(assert (=> b!1572986 d!164913))

(declare-fun d!164919 () Bool)

(declare-fun lt!674240 () (_ BitVec 32))

(declare-fun lt!674239 () (_ BitVec 32))

(assert (=> d!164919 (= lt!674240 (bvmul (bvxor lt!674239 (bvlshr lt!674239 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!164919 (= lt!674239 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!164919 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1074812 (let ((h!38228 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141655 (bvmul (bvxor h!38228 (bvlshr h!38228 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141655 (bvlshr x!141655 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1074812 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1074812 #b00000000000000000000000000000000))))))

(assert (=> d!164919 (= (toIndex!0 k!754 mask!889) (bvand (bvxor lt!674240 (bvlshr lt!674240 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1572986 d!164919))

(declare-fun b!1573090 () Bool)

(declare-fun e!877221 () SeekEntryResult!13619)

(assert (=> b!1573090 (= e!877221 (Found!13619 (index!56876 lt!674218)))))

(declare-fun lt!674258 () SeekEntryResult!13619)

(declare-fun d!164921 () Bool)

(assert (=> d!164921 (and (or (is-Undefined!13619 lt!674258) (not (is-Found!13619 lt!674258)) (and (bvsge (index!56875 lt!674258) #b00000000000000000000000000000000) (bvslt (index!56875 lt!674258) (size!51256 _keys!600)))) (or (is-Undefined!13619 lt!674258) (is-Found!13619 lt!674258) (not (is-MissingVacant!13619 lt!674258)) (not (= (index!56877 lt!674258) (index!56876 lt!674218))) (and (bvsge (index!56877 lt!674258) #b00000000000000000000000000000000) (bvslt (index!56877 lt!674258) (size!51256 _keys!600)))) (or (is-Undefined!13619 lt!674258) (ite (is-Found!13619 lt!674258) (= (select (arr!50706 _keys!600) (index!56875 lt!674258)) k!754) (and (is-MissingVacant!13619 lt!674258) (= (index!56877 lt!674258) (index!56876 lt!674218)) (= (select (arr!50706 _keys!600) (index!56877 lt!674258)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!877219 () SeekEntryResult!13619)

(assert (=> d!164921 (= lt!674258 e!877219)))

(declare-fun c!145382 () Bool)

(assert (=> d!164921 (= c!145382 (bvsge (x!141651 lt!674218) #b01111111111111111111111111111110))))

(declare-fun lt!674257 () (_ BitVec 64))

(assert (=> d!164921 (= lt!674257 (select (arr!50706 _keys!600) (index!56876 lt!674218)))))

(assert (=> d!164921 (validMask!0 mask!889)))

(assert (=> d!164921 (= (seekKeyOrZeroReturnVacant!0 (x!141651 lt!674218) (index!56876 lt!674218) (index!56876 lt!674218) k!754 _keys!600 mask!889) lt!674258)))

(declare-fun b!1573091 () Bool)

(assert (=> b!1573091 (= e!877219 Undefined!13619)))

(declare-fun e!877220 () SeekEntryResult!13619)

(declare-fun b!1573092 () Bool)

(assert (=> b!1573092 (= e!877220 (seekKeyOrZeroReturnVacant!0 (bvadd (x!141651 lt!674218) #b00000000000000000000000000000001) (nextIndex!0 (index!56876 lt!674218) (x!141651 lt!674218) mask!889) (index!56876 lt!674218) k!754 _keys!600 mask!889))))

(declare-fun b!1573093 () Bool)

(assert (=> b!1573093 (= e!877220 (MissingVacant!13619 (index!56876 lt!674218)))))

(declare-fun b!1573094 () Bool)

(declare-fun c!145381 () Bool)

(assert (=> b!1573094 (= c!145381 (= lt!674257 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1573094 (= e!877221 e!877220)))

(declare-fun b!1573095 () Bool)

(assert (=> b!1573095 (= e!877219 e!877221)))

(declare-fun c!145383 () Bool)

(assert (=> b!1573095 (= c!145383 (= lt!674257 k!754))))

(assert (= (and d!164921 c!145382) b!1573091))

(assert (= (and d!164921 (not c!145382)) b!1573095))

(assert (= (and b!1573095 c!145383) b!1573090))

(assert (= (and b!1573095 (not c!145383)) b!1573094))

(assert (= (and b!1573094 c!145381) b!1573093))

(assert (= (and b!1573094 (not c!145381)) b!1573092))

(declare-fun m!1446673 () Bool)

(assert (=> d!164921 m!1446673))

(declare-fun m!1446675 () Bool)

(assert (=> d!164921 m!1446675))

(assert (=> d!164921 m!1446641))

(assert (=> d!164921 m!1446637))

(declare-fun m!1446677 () Bool)

(assert (=> b!1573092 m!1446677))

(assert (=> b!1573092 m!1446677))

(declare-fun m!1446679 () Bool)

(assert (=> b!1573092 m!1446679))

(assert (=> b!1572987 d!164921))

(push 1)

(assert (not b!1573034))

(assert (not b!1573092))

(assert (not d!164921))

(assert (not d!164913))

(check-sat)

(pop 1)

(push 1)

(check-sat)

