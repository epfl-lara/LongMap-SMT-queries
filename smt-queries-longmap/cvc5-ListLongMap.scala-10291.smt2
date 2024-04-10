; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120960 () Bool)

(assert start!120960)

(declare-fun b!1407082 () Bool)

(declare-fun e!796389 () Bool)

(declare-fun e!796391 () Bool)

(assert (=> b!1407082 (= e!796389 (not e!796391))))

(declare-fun res!945141 () Bool)

(assert (=> b!1407082 (=> res!945141 e!796391)))

(declare-datatypes ((SeekEntryResult!10765 0))(
  ( (MissingZero!10765 (index!45437 (_ BitVec 32))) (Found!10765 (index!45438 (_ BitVec 32))) (Intermediate!10765 (undefined!11577 Bool) (index!45439 (_ BitVec 32)) (x!127042 (_ BitVec 32))) (Undefined!10765) (MissingVacant!10765 (index!45440 (_ BitVec 32))) )
))
(declare-fun lt!619636 () SeekEntryResult!10765)

(assert (=> b!1407082 (= res!945141 (or (not (is-Intermediate!10765 lt!619636)) (undefined!11577 lt!619636)))))

(declare-fun e!796388 () Bool)

(assert (=> b!1407082 e!796388))

(declare-fun res!945142 () Bool)

(assert (=> b!1407082 (=> (not res!945142) (not e!796388))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96216 0))(
  ( (array!96217 (arr!46454 (Array (_ BitVec 32) (_ BitVec 64))) (size!47004 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96216)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96216 (_ BitVec 32)) Bool)

(assert (=> b!1407082 (= res!945142 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47504 0))(
  ( (Unit!47505) )
))
(declare-fun lt!619638 () Unit!47504)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96216 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47504)

(assert (=> b!1407082 (= lt!619638 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!619637 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96216 (_ BitVec 32)) SeekEntryResult!10765)

(assert (=> b!1407082 (= lt!619636 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!619637 (select (arr!46454 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407082 (= lt!619637 (toIndex!0 (select (arr!46454 a!2901) j!112) mask!2840))))

(declare-fun b!1407083 () Bool)

(assert (=> b!1407083 (= e!796391 (or (bvslt (x!127042 lt!619636) #b00000000000000000000000000000000) (bvsgt (x!127042 lt!619636) #b01111111111111111111111111111110) (and (bvsge lt!619637 #b00000000000000000000000000000000) (bvslt lt!619637 (size!47004 a!2901)))))))

(declare-fun b!1407084 () Bool)

(declare-fun res!945138 () Bool)

(assert (=> b!1407084 (=> (not res!945138) (not e!796389))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1407084 (= res!945138 (validKeyInArray!0 (select (arr!46454 a!2901) i!1037)))))

(declare-fun b!1407085 () Bool)

(declare-fun res!945139 () Bool)

(assert (=> b!1407085 (=> (not res!945139) (not e!796389))))

(declare-datatypes ((List!32973 0))(
  ( (Nil!32970) (Cons!32969 (h!34226 (_ BitVec 64)) (t!47667 List!32973)) )
))
(declare-fun arrayNoDuplicates!0 (array!96216 (_ BitVec 32) List!32973) Bool)

(assert (=> b!1407085 (= res!945139 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32970))))

(declare-fun res!945136 () Bool)

(assert (=> start!120960 (=> (not res!945136) (not e!796389))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120960 (= res!945136 (validMask!0 mask!2840))))

(assert (=> start!120960 e!796389))

(assert (=> start!120960 true))

(declare-fun array_inv!35482 (array!96216) Bool)

(assert (=> start!120960 (array_inv!35482 a!2901)))

(declare-fun b!1407086 () Bool)

(declare-fun res!945140 () Bool)

(assert (=> b!1407086 (=> (not res!945140) (not e!796389))))

(assert (=> b!1407086 (= res!945140 (and (= (size!47004 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47004 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47004 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1407087 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96216 (_ BitVec 32)) SeekEntryResult!10765)

(assert (=> b!1407087 (= e!796388 (= (seekEntryOrOpen!0 (select (arr!46454 a!2901) j!112) a!2901 mask!2840) (Found!10765 j!112)))))

(declare-fun b!1407088 () Bool)

(declare-fun res!945137 () Bool)

(assert (=> b!1407088 (=> (not res!945137) (not e!796389))))

(assert (=> b!1407088 (= res!945137 (validKeyInArray!0 (select (arr!46454 a!2901) j!112)))))

(declare-fun b!1407089 () Bool)

(declare-fun res!945134 () Bool)

(assert (=> b!1407089 (=> (not res!945134) (not e!796389))))

(assert (=> b!1407089 (= res!945134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1407090 () Bool)

(declare-fun res!945135 () Bool)

(assert (=> b!1407090 (=> res!945135 e!796391)))

(assert (=> b!1407090 (= res!945135 (not (= lt!619636 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46454 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46454 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96217 (store (arr!46454 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47004 a!2901)) mask!2840))))))

(assert (= (and start!120960 res!945136) b!1407086))

(assert (= (and b!1407086 res!945140) b!1407084))

(assert (= (and b!1407084 res!945138) b!1407088))

(assert (= (and b!1407088 res!945137) b!1407089))

(assert (= (and b!1407089 res!945134) b!1407085))

(assert (= (and b!1407085 res!945139) b!1407082))

(assert (= (and b!1407082 res!945142) b!1407087))

(assert (= (and b!1407082 (not res!945141)) b!1407090))

(assert (= (and b!1407090 (not res!945135)) b!1407083))

(declare-fun m!1296267 () Bool)

(assert (=> b!1407088 m!1296267))

(assert (=> b!1407088 m!1296267))

(declare-fun m!1296269 () Bool)

(assert (=> b!1407088 m!1296269))

(declare-fun m!1296271 () Bool)

(assert (=> start!120960 m!1296271))

(declare-fun m!1296273 () Bool)

(assert (=> start!120960 m!1296273))

(assert (=> b!1407082 m!1296267))

(declare-fun m!1296275 () Bool)

(assert (=> b!1407082 m!1296275))

(assert (=> b!1407082 m!1296267))

(declare-fun m!1296277 () Bool)

(assert (=> b!1407082 m!1296277))

(assert (=> b!1407082 m!1296267))

(declare-fun m!1296279 () Bool)

(assert (=> b!1407082 m!1296279))

(declare-fun m!1296281 () Bool)

(assert (=> b!1407082 m!1296281))

(declare-fun m!1296283 () Bool)

(assert (=> b!1407085 m!1296283))

(declare-fun m!1296285 () Bool)

(assert (=> b!1407090 m!1296285))

(declare-fun m!1296287 () Bool)

(assert (=> b!1407090 m!1296287))

(assert (=> b!1407090 m!1296287))

(declare-fun m!1296289 () Bool)

(assert (=> b!1407090 m!1296289))

(assert (=> b!1407090 m!1296289))

(assert (=> b!1407090 m!1296287))

(declare-fun m!1296291 () Bool)

(assert (=> b!1407090 m!1296291))

(declare-fun m!1296293 () Bool)

(assert (=> b!1407084 m!1296293))

(assert (=> b!1407084 m!1296293))

(declare-fun m!1296295 () Bool)

(assert (=> b!1407084 m!1296295))

(assert (=> b!1407087 m!1296267))

(assert (=> b!1407087 m!1296267))

(declare-fun m!1296297 () Bool)

(assert (=> b!1407087 m!1296297))

(declare-fun m!1296299 () Bool)

(assert (=> b!1407089 m!1296299))

(push 1)

(assert (not b!1407089))

(assert (not b!1407084))

(assert (not b!1407088))

(assert (not start!120960))

(assert (not b!1407085))

(assert (not b!1407090))

(assert (not b!1407087))

(assert (not b!1407082))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1407190 () Bool)

(declare-fun e!796449 () SeekEntryResult!10765)

(assert (=> b!1407190 (= e!796449 (Intermediate!10765 true (toIndex!0 (select (store (arr!46454 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1407191 () Bool)

(declare-fun lt!619670 () SeekEntryResult!10765)

(assert (=> b!1407191 (and (bvsge (index!45439 lt!619670) #b00000000000000000000000000000000) (bvslt (index!45439 lt!619670) (size!47004 (array!96217 (store (arr!46454 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47004 a!2901)))))))

(declare-fun e!796450 () Bool)

(assert (=> b!1407191 (= e!796450 (= (select (arr!46454 (array!96217 (store (arr!46454 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47004 a!2901))) (index!45439 lt!619670)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1407192 () Bool)

(declare-fun e!796451 () Bool)

(declare-fun e!796448 () Bool)

(assert (=> b!1407192 (= e!796451 e!796448)))

(declare-fun res!945218 () Bool)

(assert (=> b!1407192 (= res!945218 (and (is-Intermediate!10765 lt!619670) (not (undefined!11577 lt!619670)) (bvslt (x!127042 lt!619670) #b01111111111111111111111111111110) (bvsge (x!127042 lt!619670) #b00000000000000000000000000000000) (bvsge (x!127042 lt!619670) #b00000000000000000000000000000000)))))

(assert (=> b!1407192 (=> (not res!945218) (not e!796448))))

(declare-fun e!796447 () SeekEntryResult!10765)

(declare-fun b!1407193 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407193 (= e!796447 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46454 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (store (arr!46454 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96217 (store (arr!46454 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47004 a!2901)) mask!2840))))

(declare-fun b!1407194 () Bool)

(assert (=> b!1407194 (= e!796447 (Intermediate!10765 false (toIndex!0 (select (store (arr!46454 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1407196 () Bool)

(assert (=> b!1407196 (= e!796451 (bvsge (x!127042 lt!619670) #b01111111111111111111111111111110))))

(declare-fun b!1407197 () Bool)

(assert (=> b!1407197 (and (bvsge (index!45439 lt!619670) #b00000000000000000000000000000000) (bvslt (index!45439 lt!619670) (size!47004 (array!96217 (store (arr!46454 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47004 a!2901)))))))

(declare-fun res!945220 () Bool)

(assert (=> b!1407197 (= res!945220 (= (select (arr!46454 (array!96217 (store (arr!46454 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47004 a!2901))) (index!45439 lt!619670)) (select (store (arr!46454 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(assert (=> b!1407197 (=> res!945220 e!796450)))

(assert (=> b!1407197 (= e!796448 e!796450)))

(declare-fun b!1407198 () Bool)

(assert (=> b!1407198 (and (bvsge (index!45439 lt!619670) #b00000000000000000000000000000000) (bvslt (index!45439 lt!619670) (size!47004 (array!96217 (store (arr!46454 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47004 a!2901)))))))

(declare-fun res!945219 () Bool)

(assert (=> b!1407198 (= res!945219 (= (select (arr!46454 (array!96217 (store (arr!46454 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47004 a!2901))) (index!45439 lt!619670)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1407198 (=> res!945219 e!796450)))

(declare-fun b!1407195 () Bool)

(assert (=> b!1407195 (= e!796449 e!796447)))

(declare-fun lt!619671 () (_ BitVec 64))

(declare-fun c!130451 () Bool)

(assert (=> b!1407195 (= c!130451 (or (= lt!619671 (select (store (arr!46454 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!619671 lt!619671) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!151519 () Bool)

(assert (=> d!151519 e!796451))

(declare-fun c!130452 () Bool)

(assert (=> d!151519 (= c!130452 (and (is-Intermediate!10765 lt!619670) (undefined!11577 lt!619670)))))

(assert (=> d!151519 (= lt!619670 e!796449)))

(declare-fun c!130450 () Bool)

(assert (=> d!151519 (= c!130450 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!151519 (= lt!619671 (select (arr!46454 (array!96217 (store (arr!46454 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47004 a!2901))) (toIndex!0 (select (store (arr!46454 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!151519 (validMask!0 mask!2840)))

(assert (=> d!151519 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46454 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46454 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96217 (store (arr!46454 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47004 a!2901)) mask!2840) lt!619670)))

(assert (= (and d!151519 c!130450) b!1407190))

(assert (= (and d!151519 (not c!130450)) b!1407195))

(assert (= (and b!1407195 c!130451) b!1407194))

(assert (= (and b!1407195 (not c!130451)) b!1407193))

(assert (= (and d!151519 c!130452) b!1407196))

(assert (= (and d!151519 (not c!130452)) b!1407192))

(assert (= (and b!1407192 res!945218) b!1407197))

(assert (= (and b!1407197 (not res!945220)) b!1407198))

(assert (= (and b!1407198 (not res!945219)) b!1407191))

(assert (=> d!151519 m!1296289))

(declare-fun m!1296385 () Bool)

(assert (=> d!151519 m!1296385))

(assert (=> d!151519 m!1296271))

(declare-fun m!1296387 () Bool)

(assert (=> b!1407191 m!1296387))

(assert (=> b!1407197 m!1296387))

(assert (=> b!1407193 m!1296289))

(declare-fun m!1296389 () Bool)

(assert (=> b!1407193 m!1296389))

(assert (=> b!1407193 m!1296389))

(assert (=> b!1407193 m!1296287))

(declare-fun m!1296391 () Bool)

(assert (=> b!1407193 m!1296391))

(assert (=> b!1407198 m!1296387))

(assert (=> b!1407090 d!151519))

(declare-fun d!151527 () Bool)

(declare-fun lt!619683 () (_ BitVec 32))

(declare-fun lt!619682 () (_ BitVec 32))

(assert (=> d!151527 (= lt!619683 (bvmul (bvxor lt!619682 (bvlshr lt!619682 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151527 (= lt!619682 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46454 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46454 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151527 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!945221 (let ((h!34229 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46454 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46454 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127046 (bvmul (bvxor h!34229 (bvlshr h!34229 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127046 (bvlshr x!127046 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!945221 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!945221 #b00000000000000000000000000000000))))))

(assert (=> d!151527 (= (toIndex!0 (select (store (arr!46454 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!619683 (bvlshr lt!619683 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1407090 d!151527))

(declare-fun bm!66979 () Bool)

(declare-fun call!66982 () Bool)

(declare-fun c!130458 () Bool)

(assert (=> bm!66979 (= call!66982 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130458 (Cons!32969 (select (arr!46454 a!2901) #b00000000000000000000000000000000) Nil!32970) Nil!32970)))))

(declare-fun d!151529 () Bool)

(declare-fun res!945234 () Bool)

(declare-fun e!796470 () Bool)

(assert (=> d!151529 (=> res!945234 e!796470)))

(assert (=> d!151529 (= res!945234 (bvsge #b00000000000000000000000000000000 (size!47004 a!2901)))))

(assert (=> d!151529 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32970) e!796470)))

(declare-fun b!1407221 () Bool)

(declare-fun e!796471 () Bool)

(assert (=> b!1407221 (= e!796471 call!66982)))

(declare-fun b!1407222 () Bool)

(declare-fun e!796472 () Bool)

(assert (=> b!1407222 (= e!796470 e!796472)))

(declare-fun res!945235 () Bool)

(assert (=> b!1407222 (=> (not res!945235) (not e!796472))))

(declare-fun e!796469 () Bool)

(assert (=> b!1407222 (= res!945235 (not e!796469))))

(declare-fun res!945236 () Bool)

(assert (=> b!1407222 (=> (not res!945236) (not e!796469))))

(assert (=> b!1407222 (= res!945236 (validKeyInArray!0 (select (arr!46454 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1407223 () Bool)

(assert (=> b!1407223 (= e!796471 call!66982)))

(declare-fun b!1407224 () Bool)

(assert (=> b!1407224 (= e!796472 e!796471)))

(assert (=> b!1407224 (= c!130458 (validKeyInArray!0 (select (arr!46454 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1407225 () Bool)

(declare-fun contains!9798 (List!32973 (_ BitVec 64)) Bool)

(assert (=> b!1407225 (= e!796469 (contains!9798 Nil!32970 (select (arr!46454 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!151529 (not res!945234)) b!1407222))

(assert (= (and b!1407222 res!945236) b!1407225))

(assert (= (and b!1407222 res!945235) b!1407224))

(assert (= (and b!1407224 c!130458) b!1407223))

(assert (= (and b!1407224 (not c!130458)) b!1407221))

(assert (= (or b!1407223 b!1407221) bm!66979))

(declare-fun m!1296401 () Bool)

(assert (=> bm!66979 m!1296401))

(declare-fun m!1296403 () Bool)

(assert (=> bm!66979 m!1296403))

(assert (=> b!1407222 m!1296401))

(assert (=> b!1407222 m!1296401))

(declare-fun m!1296405 () Bool)

(assert (=> b!1407222 m!1296405))

(assert (=> b!1407224 m!1296401))

(assert (=> b!1407224 m!1296401))

(assert (=> b!1407224 m!1296405))

(assert (=> b!1407225 m!1296401))

(assert (=> b!1407225 m!1296401))

(declare-fun m!1296407 () Bool)

(assert (=> b!1407225 m!1296407))

(assert (=> b!1407085 d!151529))

(declare-fun bm!66982 () Bool)

(declare-fun call!66985 () Bool)

(assert (=> bm!66982 (= call!66985 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1407261 () Bool)

(declare-fun e!796496 () Bool)

(assert (=> b!1407261 (= e!796496 call!66985)))

(declare-fun b!1407262 () Bool)

(declare-fun e!796494 () Bool)

(assert (=> b!1407262 (= e!796494 call!66985)))

(declare-fun d!151535 () Bool)

(declare-fun res!945251 () Bool)

(declare-fun e!796495 () Bool)

(assert (=> d!151535 (=> res!945251 e!796495)))

(assert (=> d!151535 (= res!945251 (bvsge #b00000000000000000000000000000000 (size!47004 a!2901)))))

(assert (=> d!151535 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!796495)))

(declare-fun b!1407263 () Bool)

(assert (=> b!1407263 (= e!796494 e!796496)))

(declare-fun lt!619702 () (_ BitVec 64))

(assert (=> b!1407263 (= lt!619702 (select (arr!46454 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!619703 () Unit!47504)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96216 (_ BitVec 64) (_ BitVec 32)) Unit!47504)

(assert (=> b!1407263 (= lt!619703 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!619702 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96216 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1407263 (arrayContainsKey!0 a!2901 lt!619702 #b00000000000000000000000000000000)))

(declare-fun lt!619704 () Unit!47504)

(assert (=> b!1407263 (= lt!619704 lt!619703)))

(declare-fun res!945252 () Bool)

(assert (=> b!1407263 (= res!945252 (= (seekEntryOrOpen!0 (select (arr!46454 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10765 #b00000000000000000000000000000000)))))

(assert (=> b!1407263 (=> (not res!945252) (not e!796496))))

(declare-fun b!1407264 () Bool)

(assert (=> b!1407264 (= e!796495 e!796494)))

(declare-fun c!130470 () Bool)

(assert (=> b!1407264 (= c!130470 (validKeyInArray!0 (select (arr!46454 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!151535 (not res!945251)) b!1407264))

(assert (= (and b!1407264 c!130470) b!1407263))

(assert (= (and b!1407264 (not c!130470)) b!1407262))

(assert (= (and b!1407263 res!945252) b!1407261))

(assert (= (or b!1407261 b!1407262) bm!66982))

(declare-fun m!1296417 () Bool)

(assert (=> bm!66982 m!1296417))

(assert (=> b!1407263 m!1296401))

(declare-fun m!1296419 () Bool)

(assert (=> b!1407263 m!1296419))

(declare-fun m!1296421 () Bool)

(assert (=> b!1407263 m!1296421))

(assert (=> b!1407263 m!1296401))

(declare-fun m!1296423 () Bool)

(assert (=> b!1407263 m!1296423))

(assert (=> b!1407264 m!1296401))

(assert (=> b!1407264 m!1296401))

(assert (=> b!1407264 m!1296405))

(assert (=> b!1407089 d!151535))

(declare-fun d!151539 () Bool)

(assert (=> d!151539 (= (validKeyInArray!0 (select (arr!46454 a!2901) i!1037)) (and (not (= (select (arr!46454 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46454 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1407084 d!151539))

(declare-fun d!151541 () Bool)

(assert (=> d!151541 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!120960 d!151541))

(declare-fun d!151545 () Bool)

(assert (=> d!151545 (= (array_inv!35482 a!2901) (bvsge (size!47004 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!120960 d!151545))

(declare-fun call!66986 () Bool)

(declare-fun bm!66983 () Bool)

(assert (=> bm!66983 (= call!66986 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1407292 () Bool)

(declare-fun e!796514 () Bool)

(assert (=> b!1407292 (= e!796514 call!66986)))

(declare-fun b!1407293 () Bool)

(declare-fun e!796512 () Bool)

(assert (=> b!1407293 (= e!796512 call!66986)))

(declare-fun d!151549 () Bool)

(declare-fun res!945263 () Bool)

(declare-fun e!796513 () Bool)

(assert (=> d!151549 (=> res!945263 e!796513)))

(assert (=> d!151549 (= res!945263 (bvsge j!112 (size!47004 a!2901)))))

(assert (=> d!151549 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!796513)))

(declare-fun b!1407294 () Bool)

(assert (=> b!1407294 (= e!796512 e!796514)))

(declare-fun lt!619717 () (_ BitVec 64))

(assert (=> b!1407294 (= lt!619717 (select (arr!46454 a!2901) j!112))))

(declare-fun lt!619718 () Unit!47504)

(assert (=> b!1407294 (= lt!619718 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!619717 j!112))))

(assert (=> b!1407294 (arrayContainsKey!0 a!2901 lt!619717 #b00000000000000000000000000000000)))

(declare-fun lt!619719 () Unit!47504)

(assert (=> b!1407294 (= lt!619719 lt!619718)))

(declare-fun res!945264 () Bool)

(assert (=> b!1407294 (= res!945264 (= (seekEntryOrOpen!0 (select (arr!46454 a!2901) j!112) a!2901 mask!2840) (Found!10765 j!112)))))

(assert (=> b!1407294 (=> (not res!945264) (not e!796514))))

(declare-fun b!1407295 () Bool)

(assert (=> b!1407295 (= e!796513 e!796512)))

(declare-fun c!130480 () Bool)

(assert (=> b!1407295 (= c!130480 (validKeyInArray!0 (select (arr!46454 a!2901) j!112)))))

(assert (= (and d!151549 (not res!945263)) b!1407295))

(assert (= (and b!1407295 c!130480) b!1407294))

(assert (= (and b!1407295 (not c!130480)) b!1407293))

(assert (= (and b!1407294 res!945264) b!1407292))

(assert (= (or b!1407292 b!1407293) bm!66983))

(declare-fun m!1296433 () Bool)

(assert (=> bm!66983 m!1296433))

(assert (=> b!1407294 m!1296267))

(declare-fun m!1296435 () Bool)

(assert (=> b!1407294 m!1296435))

(declare-fun m!1296437 () Bool)

(assert (=> b!1407294 m!1296437))

(assert (=> b!1407294 m!1296267))

(assert (=> b!1407294 m!1296297))

(assert (=> b!1407295 m!1296267))

(assert (=> b!1407295 m!1296267))

(assert (=> b!1407295 m!1296269))

(assert (=> b!1407082 d!151549))

(declare-fun d!151551 () Bool)

(assert (=> d!151551 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!619730 () Unit!47504)

(declare-fun choose!38 (array!96216 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47504)

(assert (=> d!151551 (= lt!619730 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151551 (validMask!0 mask!2840)))

(assert (=> d!151551 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!619730)))

(declare-fun bs!41016 () Bool)

(assert (= bs!41016 d!151551))

(assert (=> bs!41016 m!1296281))

(declare-fun m!1296439 () Bool)

(assert (=> bs!41016 m!1296439))

(assert (=> bs!41016 m!1296271))

(assert (=> b!1407082 d!151551))

(declare-fun b!1407305 () Bool)

(declare-fun e!796522 () SeekEntryResult!10765)

(assert (=> b!1407305 (= e!796522 (Intermediate!10765 true lt!619637 #b00000000000000000000000000000000))))

(declare-fun b!1407306 () Bool)

(declare-fun lt!619731 () SeekEntryResult!10765)

(assert (=> b!1407306 (and (bvsge (index!45439 lt!619731) #b00000000000000000000000000000000) (bvslt (index!45439 lt!619731) (size!47004 a!2901)))))

(declare-fun e!796523 () Bool)

(assert (=> b!1407306 (= e!796523 (= (select (arr!46454 a!2901) (index!45439 lt!619731)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1407307 () Bool)

(declare-fun e!796524 () Bool)

(declare-fun e!796521 () Bool)

(assert (=> b!1407307 (= e!796524 e!796521)))

(declare-fun res!945268 () Bool)

(assert (=> b!1407307 (= res!945268 (and (is-Intermediate!10765 lt!619731) (not (undefined!11577 lt!619731)) (bvslt (x!127042 lt!619731) #b01111111111111111111111111111110) (bvsge (x!127042 lt!619731) #b00000000000000000000000000000000) (bvsge (x!127042 lt!619731) #b00000000000000000000000000000000)))))

(assert (=> b!1407307 (=> (not res!945268) (not e!796521))))

(declare-fun e!796520 () SeekEntryResult!10765)

(declare-fun b!1407308 () Bool)

(assert (=> b!1407308 (= e!796520 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!619637 #b00000000000000000000000000000000 mask!2840) (select (arr!46454 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1407309 () Bool)

(assert (=> b!1407309 (= e!796520 (Intermediate!10765 false lt!619637 #b00000000000000000000000000000000))))

(declare-fun b!1407311 () Bool)

(assert (=> b!1407311 (= e!796524 (bvsge (x!127042 lt!619731) #b01111111111111111111111111111110))))

(declare-fun b!1407312 () Bool)

(assert (=> b!1407312 (and (bvsge (index!45439 lt!619731) #b00000000000000000000000000000000) (bvslt (index!45439 lt!619731) (size!47004 a!2901)))))

(declare-fun res!945270 () Bool)

(assert (=> b!1407312 (= res!945270 (= (select (arr!46454 a!2901) (index!45439 lt!619731)) (select (arr!46454 a!2901) j!112)))))

(assert (=> b!1407312 (=> res!945270 e!796523)))

(assert (=> b!1407312 (= e!796521 e!796523)))

(declare-fun b!1407313 () Bool)

(assert (=> b!1407313 (and (bvsge (index!45439 lt!619731) #b00000000000000000000000000000000) (bvslt (index!45439 lt!619731) (size!47004 a!2901)))))

(declare-fun res!945269 () Bool)

(assert (=> b!1407313 (= res!945269 (= (select (arr!46454 a!2901) (index!45439 lt!619731)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1407313 (=> res!945269 e!796523)))

(declare-fun b!1407310 () Bool)

(assert (=> b!1407310 (= e!796522 e!796520)))

(declare-fun lt!619732 () (_ BitVec 64))

(declare-fun c!130485 () Bool)

(assert (=> b!1407310 (= c!130485 (or (= lt!619732 (select (arr!46454 a!2901) j!112)) (= (bvadd lt!619732 lt!619732) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!151555 () Bool)

(assert (=> d!151555 e!796524))

(declare-fun c!130486 () Bool)

(assert (=> d!151555 (= c!130486 (and (is-Intermediate!10765 lt!619731) (undefined!11577 lt!619731)))))

(assert (=> d!151555 (= lt!619731 e!796522)))

(declare-fun c!130484 () Bool)

(assert (=> d!151555 (= c!130484 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!151555 (= lt!619732 (select (arr!46454 a!2901) lt!619637))))

(assert (=> d!151555 (validMask!0 mask!2840)))

(assert (=> d!151555 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!619637 (select (arr!46454 a!2901) j!112) a!2901 mask!2840) lt!619731)))

(assert (= (and d!151555 c!130484) b!1407305))

(assert (= (and d!151555 (not c!130484)) b!1407310))

(assert (= (and b!1407310 c!130485) b!1407309))

(assert (= (and b!1407310 (not c!130485)) b!1407308))

(assert (= (and d!151555 c!130486) b!1407311))

(assert (= (and d!151555 (not c!130486)) b!1407307))

(assert (= (and b!1407307 res!945268) b!1407312))

(assert (= (and b!1407312 (not res!945270)) b!1407313))

(assert (= (and b!1407313 (not res!945269)) b!1407306))

(declare-fun m!1296449 () Bool)

(assert (=> d!151555 m!1296449))

(assert (=> d!151555 m!1296271))

(declare-fun m!1296451 () Bool)

(assert (=> b!1407306 m!1296451))

(assert (=> b!1407312 m!1296451))

(declare-fun m!1296453 () Bool)

(assert (=> b!1407308 m!1296453))

(assert (=> b!1407308 m!1296453))

(assert (=> b!1407308 m!1296267))

(declare-fun m!1296455 () Bool)

(assert (=> b!1407308 m!1296455))

(assert (=> b!1407313 m!1296451))

(assert (=> b!1407082 d!151555))

(declare-fun d!151561 () Bool)

(declare-fun lt!619740 () (_ BitVec 32))

(declare-fun lt!619739 () (_ BitVec 32))

(assert (=> d!151561 (= lt!619740 (bvmul (bvxor lt!619739 (bvlshr lt!619739 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151561 (= lt!619739 ((_ extract 31 0) (bvand (bvxor (select (arr!46454 a!2901) j!112) (bvlshr (select (arr!46454 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151561 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!945221 (let ((h!34229 ((_ extract 31 0) (bvand (bvxor (select (arr!46454 a!2901) j!112) (bvlshr (select (arr!46454 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127046 (bvmul (bvxor h!34229 (bvlshr h!34229 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127046 (bvlshr x!127046 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!945221 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!945221 #b00000000000000000000000000000000))))))

(assert (=> d!151561 (= (toIndex!0 (select (arr!46454 a!2901) j!112) mask!2840) (bvand (bvxor lt!619740 (bvlshr lt!619740 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1407082 d!151561))

(declare-fun d!151563 () Bool)

(assert (=> d!151563 (= (validKeyInArray!0 (select (arr!46454 a!2901) j!112)) (and (not (= (select (arr!46454 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46454 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1407088 d!151563))

(declare-fun b!1407360 () Bool)

(declare-fun e!796549 () SeekEntryResult!10765)

(declare-fun e!796550 () SeekEntryResult!10765)

(assert (=> b!1407360 (= e!796549 e!796550)))

(declare-fun lt!619763 () (_ BitVec 64))

(declare-fun lt!619761 () SeekEntryResult!10765)

(assert (=> b!1407360 (= lt!619763 (select (arr!46454 a!2901) (index!45439 lt!619761)))))

(declare-fun c!130511 () Bool)

(assert (=> b!1407360 (= c!130511 (= lt!619763 (select (arr!46454 a!2901) j!112)))))

(declare-fun b!1407361 () Bool)

(declare-fun e!796551 () SeekEntryResult!10765)

(assert (=> b!1407361 (= e!796551 (MissingZero!10765 (index!45439 lt!619761)))))

(declare-fun b!1407363 () Bool)

(assert (=> b!1407363 (= e!796549 Undefined!10765)))

(declare-fun d!151565 () Bool)

(declare-fun lt!619762 () SeekEntryResult!10765)

(assert (=> d!151565 (and (or (is-Undefined!10765 lt!619762) (not (is-Found!10765 lt!619762)) (and (bvsge (index!45438 lt!619762) #b00000000000000000000000000000000) (bvslt (index!45438 lt!619762) (size!47004 a!2901)))) (or (is-Undefined!10765 lt!619762) (is-Found!10765 lt!619762) (not (is-MissingZero!10765 lt!619762)) (and (bvsge (index!45437 lt!619762) #b00000000000000000000000000000000) (bvslt (index!45437 lt!619762) (size!47004 a!2901)))) (or (is-Undefined!10765 lt!619762) (is-Found!10765 lt!619762) (is-MissingZero!10765 lt!619762) (not (is-MissingVacant!10765 lt!619762)) (and (bvsge (index!45440 lt!619762) #b00000000000000000000000000000000) (bvslt (index!45440 lt!619762) (size!47004 a!2901)))) (or (is-Undefined!10765 lt!619762) (ite (is-Found!10765 lt!619762) (= (select (arr!46454 a!2901) (index!45438 lt!619762)) (select (arr!46454 a!2901) j!112)) (ite (is-MissingZero!10765 lt!619762) (= (select (arr!46454 a!2901) (index!45437 lt!619762)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10765 lt!619762) (= (select (arr!46454 a!2901) (index!45440 lt!619762)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!151565 (= lt!619762 e!796549)))

(declare-fun c!130509 () Bool)

(assert (=> d!151565 (= c!130509 (and (is-Intermediate!10765 lt!619761) (undefined!11577 lt!619761)))))

(assert (=> d!151565 (= lt!619761 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46454 a!2901) j!112) mask!2840) (select (arr!46454 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151565 (validMask!0 mask!2840)))

(assert (=> d!151565 (= (seekEntryOrOpen!0 (select (arr!46454 a!2901) j!112) a!2901 mask!2840) lt!619762)))

(declare-fun b!1407362 () Bool)

(declare-fun c!130510 () Bool)

(assert (=> b!1407362 (= c!130510 (= lt!619763 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1407362 (= e!796550 e!796551)))

(declare-fun b!1407364 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96216 (_ BitVec 32)) SeekEntryResult!10765)

(assert (=> b!1407364 (= e!796551 (seekKeyOrZeroReturnVacant!0 (x!127042 lt!619761) (index!45439 lt!619761) (index!45439 lt!619761) (select (arr!46454 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1407365 () Bool)

(assert (=> b!1407365 (= e!796550 (Found!10765 (index!45439 lt!619761)))))

(assert (= (and d!151565 c!130509) b!1407363))

(assert (= (and d!151565 (not c!130509)) b!1407360))

(assert (= (and b!1407360 c!130511) b!1407365))

(assert (= (and b!1407360 (not c!130511)) b!1407362))

(assert (= (and b!1407362 c!130510) b!1407361))

(assert (= (and b!1407362 (not c!130510)) b!1407364))

(declare-fun m!1296475 () Bool)

(assert (=> b!1407360 m!1296475))

(assert (=> d!151565 m!1296267))

(assert (=> d!151565 m!1296275))

(declare-fun m!1296477 () Bool)

(assert (=> d!151565 m!1296477))

(declare-fun m!1296479 () Bool)

(assert (=> d!151565 m!1296479))

(declare-fun m!1296481 () Bool)

(assert (=> d!151565 m!1296481))

(assert (=> d!151565 m!1296275))

(assert (=> d!151565 m!1296267))

(declare-fun m!1296483 () Bool)

(assert (=> d!151565 m!1296483))

(assert (=> d!151565 m!1296271))

(assert (=> b!1407364 m!1296267))

(declare-fun m!1296487 () Bool)

(assert (=> b!1407364 m!1296487))

(assert (=> b!1407087 d!151565))

(push 1)

(assert (not d!151551))

(assert (not b!1407308))

(assert (not b!1407294))

(assert (not b!1407224))

(assert (not b!1407222))

(assert (not b!1407225))

(assert (not bm!66979))

(assert (not b!1407295))

(assert (not b!1407364))

(assert (not d!151555))

(assert (not d!151565))

(assert (not b!1407193))

(assert (not b!1407263))

(assert (not d!151519))

(assert (not b!1407264))

(assert (not bm!66983))

(assert (not bm!66982))

(check-sat)

(pop 1)

(push 1)

(check-sat)

