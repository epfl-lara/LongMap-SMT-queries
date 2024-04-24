; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130830 () Bool)

(assert start!130830)

(declare-fun b!1533326 () Bool)

(declare-fun e!854530 () Bool)

(declare-fun e!854531 () Bool)

(assert (=> b!1533326 (= e!854530 e!854531)))

(declare-fun res!1049189 () Bool)

(assert (=> b!1533326 (=> (not res!1049189) (not e!854531))))

(declare-datatypes ((SeekEntryResult!13175 0))(
  ( (MissingZero!13175 (index!55095 (_ BitVec 32))) (Found!13175 (index!55096 (_ BitVec 32))) (Intermediate!13175 (undefined!13987 Bool) (index!55097 (_ BitVec 32)) (x!136999 (_ BitVec 32))) (Undefined!13175) (MissingVacant!13175 (index!55098 (_ BitVec 32))) )
))
(declare-fun lt!663941 () SeekEntryResult!13175)

(declare-fun lt!663940 () SeekEntryResult!13175)

(assert (=> b!1533326 (= res!1049189 (= lt!663941 lt!663940))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1533326 (= lt!663940 (Intermediate!13175 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101803 0))(
  ( (array!101804 (arr!49117 (Array (_ BitVec 32) (_ BitVec 64))) (size!49668 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101803)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101803 (_ BitVec 32)) SeekEntryResult!13175)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1533326 (= lt!663941 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49117 a!2804) j!70) mask!2512) (select (arr!49117 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1533327 () Bool)

(declare-fun e!854533 () Bool)

(assert (=> b!1533327 (= e!854531 (not e!854533))))

(declare-fun res!1049191 () Bool)

(assert (=> b!1533327 (=> res!1049191 e!854533)))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1533327 (= res!1049191 (or (not (= (select (arr!49117 a!2804) j!70) (select (store (arr!49117 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!854532 () Bool)

(assert (=> b!1533327 e!854532))

(declare-fun res!1049184 () Bool)

(assert (=> b!1533327 (=> (not res!1049184) (not e!854532))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101803 (_ BitVec 32)) Bool)

(assert (=> b!1533327 (= res!1049184 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51169 0))(
  ( (Unit!51170) )
))
(declare-fun lt!663942 () Unit!51169)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101803 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51169)

(assert (=> b!1533327 (= lt!663942 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1049193 () Bool)

(assert (=> start!130830 (=> (not res!1049193) (not e!854530))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130830 (= res!1049193 (validMask!0 mask!2512))))

(assert (=> start!130830 e!854530))

(assert (=> start!130830 true))

(declare-fun array_inv!38398 (array!101803) Bool)

(assert (=> start!130830 (array_inv!38398 a!2804)))

(declare-fun lt!663939 () (_ BitVec 32))

(declare-fun e!854528 () Bool)

(declare-fun b!1533328 () Bool)

(assert (=> b!1533328 (= e!854528 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!663939 (select (arr!49117 a!2804) j!70) a!2804 mask!2512) lt!663940))))

(declare-fun b!1533329 () Bool)

(assert (=> b!1533329 (= e!854533 e!854528)))

(declare-fun res!1049183 () Bool)

(assert (=> b!1533329 (=> res!1049183 e!854528)))

(assert (=> b!1533329 (= res!1049183 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!663939 #b00000000000000000000000000000000) (bvsge lt!663939 (size!49668 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1533329 (= lt!663939 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun b!1533330 () Bool)

(declare-fun res!1049192 () Bool)

(assert (=> b!1533330 (=> (not res!1049192) (not e!854530))))

(declare-datatypes ((List!35587 0))(
  ( (Nil!35584) (Cons!35583 (h!37043 (_ BitVec 64)) (t!50273 List!35587)) )
))
(declare-fun arrayNoDuplicates!0 (array!101803 (_ BitVec 32) List!35587) Bool)

(assert (=> b!1533330 (= res!1049192 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35584))))

(declare-fun b!1533331 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101803 (_ BitVec 32)) SeekEntryResult!13175)

(assert (=> b!1533331 (= e!854532 (= (seekEntry!0 (select (arr!49117 a!2804) j!70) a!2804 mask!2512) (Found!13175 j!70)))))

(declare-fun b!1533332 () Bool)

(declare-fun res!1049181 () Bool)

(assert (=> b!1533332 (=> (not res!1049181) (not e!854530))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533332 (= res!1049181 (validKeyInArray!0 (select (arr!49117 a!2804) i!961)))))

(declare-fun b!1533333 () Bool)

(declare-fun res!1049188 () Bool)

(assert (=> b!1533333 (=> (not res!1049188) (not e!854531))))

(assert (=> b!1533333 (= res!1049188 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49117 a!2804) j!70) a!2804 mask!2512) lt!663940))))

(declare-fun b!1533334 () Bool)

(declare-fun res!1049186 () Bool)

(assert (=> b!1533334 (=> (not res!1049186) (not e!854530))))

(assert (=> b!1533334 (= res!1049186 (validKeyInArray!0 (select (arr!49117 a!2804) j!70)))))

(declare-fun b!1533335 () Bool)

(declare-fun res!1049187 () Bool)

(assert (=> b!1533335 (=> (not res!1049187) (not e!854531))))

(assert (=> b!1533335 (= res!1049187 (= lt!663941 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49117 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49117 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101804 (store (arr!49117 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49668 a!2804)) mask!2512)))))

(declare-fun b!1533336 () Bool)

(declare-fun res!1049185 () Bool)

(assert (=> b!1533336 (=> (not res!1049185) (not e!854530))))

(assert (=> b!1533336 (= res!1049185 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49668 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49668 a!2804))))))

(declare-fun b!1533337 () Bool)

(declare-fun res!1049190 () Bool)

(assert (=> b!1533337 (=> (not res!1049190) (not e!854530))))

(assert (=> b!1533337 (= res!1049190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1533338 () Bool)

(declare-fun res!1049182 () Bool)

(assert (=> b!1533338 (=> (not res!1049182) (not e!854530))))

(assert (=> b!1533338 (= res!1049182 (and (= (size!49668 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49668 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49668 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!130830 res!1049193) b!1533338))

(assert (= (and b!1533338 res!1049182) b!1533332))

(assert (= (and b!1533332 res!1049181) b!1533334))

(assert (= (and b!1533334 res!1049186) b!1533337))

(assert (= (and b!1533337 res!1049190) b!1533330))

(assert (= (and b!1533330 res!1049192) b!1533336))

(assert (= (and b!1533336 res!1049185) b!1533326))

(assert (= (and b!1533326 res!1049189) b!1533333))

(assert (= (and b!1533333 res!1049188) b!1533335))

(assert (= (and b!1533335 res!1049187) b!1533327))

(assert (= (and b!1533327 res!1049184) b!1533331))

(assert (= (and b!1533327 (not res!1049191)) b!1533329))

(assert (= (and b!1533329 (not res!1049183)) b!1533328))

(declare-fun m!1415959 () Bool)

(assert (=> b!1533335 m!1415959))

(declare-fun m!1415961 () Bool)

(assert (=> b!1533335 m!1415961))

(assert (=> b!1533335 m!1415961))

(declare-fun m!1415963 () Bool)

(assert (=> b!1533335 m!1415963))

(assert (=> b!1533335 m!1415963))

(assert (=> b!1533335 m!1415961))

(declare-fun m!1415965 () Bool)

(assert (=> b!1533335 m!1415965))

(declare-fun m!1415967 () Bool)

(assert (=> b!1533327 m!1415967))

(declare-fun m!1415969 () Bool)

(assert (=> b!1533327 m!1415969))

(assert (=> b!1533327 m!1415959))

(assert (=> b!1533327 m!1415961))

(declare-fun m!1415971 () Bool)

(assert (=> b!1533327 m!1415971))

(assert (=> b!1533334 m!1415967))

(assert (=> b!1533334 m!1415967))

(declare-fun m!1415973 () Bool)

(assert (=> b!1533334 m!1415973))

(assert (=> b!1533331 m!1415967))

(assert (=> b!1533331 m!1415967))

(declare-fun m!1415975 () Bool)

(assert (=> b!1533331 m!1415975))

(declare-fun m!1415977 () Bool)

(assert (=> start!130830 m!1415977))

(declare-fun m!1415979 () Bool)

(assert (=> start!130830 m!1415979))

(declare-fun m!1415981 () Bool)

(assert (=> b!1533332 m!1415981))

(assert (=> b!1533332 m!1415981))

(declare-fun m!1415983 () Bool)

(assert (=> b!1533332 m!1415983))

(declare-fun m!1415985 () Bool)

(assert (=> b!1533337 m!1415985))

(assert (=> b!1533328 m!1415967))

(assert (=> b!1533328 m!1415967))

(declare-fun m!1415987 () Bool)

(assert (=> b!1533328 m!1415987))

(declare-fun m!1415989 () Bool)

(assert (=> b!1533329 m!1415989))

(assert (=> b!1533326 m!1415967))

(assert (=> b!1533326 m!1415967))

(declare-fun m!1415991 () Bool)

(assert (=> b!1533326 m!1415991))

(assert (=> b!1533326 m!1415991))

(assert (=> b!1533326 m!1415967))

(declare-fun m!1415993 () Bool)

(assert (=> b!1533326 m!1415993))

(declare-fun m!1415995 () Bool)

(assert (=> b!1533330 m!1415995))

(assert (=> b!1533333 m!1415967))

(assert (=> b!1533333 m!1415967))

(declare-fun m!1415997 () Bool)

(assert (=> b!1533333 m!1415997))

(check-sat (not start!130830) (not b!1533334) (not b!1533335) (not b!1533329) (not b!1533326) (not b!1533332) (not b!1533331) (not b!1533327) (not b!1533337) (not b!1533328) (not b!1533330) (not b!1533333))
(check-sat)
(get-model)

(declare-fun b!1533435 () Bool)

(declare-fun e!854583 () SeekEntryResult!13175)

(assert (=> b!1533435 (= e!854583 (Intermediate!13175 true (toIndex!0 (select (store (arr!49117 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1533436 () Bool)

(declare-fun e!854580 () Bool)

(declare-fun e!854582 () Bool)

(assert (=> b!1533436 (= e!854580 e!854582)))

(declare-fun res!1049278 () Bool)

(declare-fun lt!663971 () SeekEntryResult!13175)

(get-info :version)

(assert (=> b!1533436 (= res!1049278 (and ((_ is Intermediate!13175) lt!663971) (not (undefined!13987 lt!663971)) (bvslt (x!136999 lt!663971) #b01111111111111111111111111111110) (bvsge (x!136999 lt!663971) #b00000000000000000000000000000000) (bvsge (x!136999 lt!663971) #b00000000000000000000000000000000)))))

(assert (=> b!1533436 (=> (not res!1049278) (not e!854582))))

(declare-fun d!160593 () Bool)

(assert (=> d!160593 e!854580))

(declare-fun c!141649 () Bool)

(assert (=> d!160593 (= c!141649 (and ((_ is Intermediate!13175) lt!663971) (undefined!13987 lt!663971)))))

(assert (=> d!160593 (= lt!663971 e!854583)))

(declare-fun c!141648 () Bool)

(assert (=> d!160593 (= c!141648 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!663972 () (_ BitVec 64))

(assert (=> d!160593 (= lt!663972 (select (arr!49117 (array!101804 (store (arr!49117 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49668 a!2804))) (toIndex!0 (select (store (arr!49117 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512)))))

(assert (=> d!160593 (validMask!0 mask!2512)))

(assert (=> d!160593 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49117 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49117 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101804 (store (arr!49117 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49668 a!2804)) mask!2512) lt!663971)))

(declare-fun b!1533437 () Bool)

(declare-fun e!854581 () SeekEntryResult!13175)

(assert (=> b!1533437 (= e!854583 e!854581)))

(declare-fun c!141647 () Bool)

(assert (=> b!1533437 (= c!141647 (or (= lt!663972 (select (store (arr!49117 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!663972 lt!663972) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533438 () Bool)

(assert (=> b!1533438 (and (bvsge (index!55097 lt!663971) #b00000000000000000000000000000000) (bvslt (index!55097 lt!663971) (size!49668 (array!101804 (store (arr!49117 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49668 a!2804)))))))

(declare-fun e!854584 () Bool)

(assert (=> b!1533438 (= e!854584 (= (select (arr!49117 (array!101804 (store (arr!49117 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49668 a!2804))) (index!55097 lt!663971)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1533439 () Bool)

(assert (=> b!1533439 (= e!854581 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!49117 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (select (store (arr!49117 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101804 (store (arr!49117 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49668 a!2804)) mask!2512))))

(declare-fun b!1533440 () Bool)

(assert (=> b!1533440 (and (bvsge (index!55097 lt!663971) #b00000000000000000000000000000000) (bvslt (index!55097 lt!663971) (size!49668 (array!101804 (store (arr!49117 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49668 a!2804)))))))

(declare-fun res!1049280 () Bool)

(assert (=> b!1533440 (= res!1049280 (= (select (arr!49117 (array!101804 (store (arr!49117 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49668 a!2804))) (index!55097 lt!663971)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1533440 (=> res!1049280 e!854584)))

(declare-fun b!1533441 () Bool)

(assert (=> b!1533441 (and (bvsge (index!55097 lt!663971) #b00000000000000000000000000000000) (bvslt (index!55097 lt!663971) (size!49668 (array!101804 (store (arr!49117 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49668 a!2804)))))))

(declare-fun res!1049279 () Bool)

(assert (=> b!1533441 (= res!1049279 (= (select (arr!49117 (array!101804 (store (arr!49117 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49668 a!2804))) (index!55097 lt!663971)) (select (store (arr!49117 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(assert (=> b!1533441 (=> res!1049279 e!854584)))

(assert (=> b!1533441 (= e!854582 e!854584)))

(declare-fun b!1533442 () Bool)

(assert (=> b!1533442 (= e!854580 (bvsge (x!136999 lt!663971) #b01111111111111111111111111111110))))

(declare-fun b!1533443 () Bool)

(assert (=> b!1533443 (= e!854581 (Intermediate!13175 false (toIndex!0 (select (store (arr!49117 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(assert (= (and d!160593 c!141648) b!1533435))

(assert (= (and d!160593 (not c!141648)) b!1533437))

(assert (= (and b!1533437 c!141647) b!1533443))

(assert (= (and b!1533437 (not c!141647)) b!1533439))

(assert (= (and d!160593 c!141649) b!1533442))

(assert (= (and d!160593 (not c!141649)) b!1533436))

(assert (= (and b!1533436 res!1049278) b!1533441))

(assert (= (and b!1533441 (not res!1049279)) b!1533440))

(assert (= (and b!1533440 (not res!1049280)) b!1533438))

(assert (=> b!1533439 m!1415963))

(declare-fun m!1416079 () Bool)

(assert (=> b!1533439 m!1416079))

(assert (=> b!1533439 m!1416079))

(assert (=> b!1533439 m!1415961))

(declare-fun m!1416081 () Bool)

(assert (=> b!1533439 m!1416081))

(declare-fun m!1416083 () Bool)

(assert (=> b!1533438 m!1416083))

(assert (=> d!160593 m!1415963))

(declare-fun m!1416085 () Bool)

(assert (=> d!160593 m!1416085))

(assert (=> d!160593 m!1415977))

(assert (=> b!1533440 m!1416083))

(assert (=> b!1533441 m!1416083))

(assert (=> b!1533335 d!160593))

(declare-fun d!160597 () Bool)

(declare-fun lt!663978 () (_ BitVec 32))

(declare-fun lt!663977 () (_ BitVec 32))

(assert (=> d!160597 (= lt!663978 (bvmul (bvxor lt!663977 (bvlshr lt!663977 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!160597 (= lt!663977 ((_ extract 31 0) (bvand (bvxor (select (store (arr!49117 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!49117 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!160597 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1049281 (let ((h!37046 ((_ extract 31 0) (bvand (bvxor (select (store (arr!49117 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!49117 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!137003 (bvmul (bvxor h!37046 (bvlshr h!37046 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!137003 (bvlshr x!137003 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1049281 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1049281 #b00000000000000000000000000000000))))))

(assert (=> d!160597 (= (toIndex!0 (select (store (arr!49117 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!663978 (bvlshr lt!663978 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1533335 d!160597))

(declare-fun d!160603 () Bool)

(assert (=> d!160603 (= (validKeyInArray!0 (select (arr!49117 a!2804) j!70)) (and (not (= (select (arr!49117 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49117 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1533334 d!160603))

(declare-fun b!1533444 () Bool)

(declare-fun e!854588 () SeekEntryResult!13175)

(assert (=> b!1533444 (= e!854588 (Intermediate!13175 true index!487 x!534))))

(declare-fun b!1533445 () Bool)

(declare-fun e!854585 () Bool)

(declare-fun e!854587 () Bool)

(assert (=> b!1533445 (= e!854585 e!854587)))

(declare-fun res!1049282 () Bool)

(declare-fun lt!663979 () SeekEntryResult!13175)

(assert (=> b!1533445 (= res!1049282 (and ((_ is Intermediate!13175) lt!663979) (not (undefined!13987 lt!663979)) (bvslt (x!136999 lt!663979) #b01111111111111111111111111111110) (bvsge (x!136999 lt!663979) #b00000000000000000000000000000000) (bvsge (x!136999 lt!663979) x!534)))))

(assert (=> b!1533445 (=> (not res!1049282) (not e!854587))))

(declare-fun d!160605 () Bool)

(assert (=> d!160605 e!854585))

(declare-fun c!141652 () Bool)

(assert (=> d!160605 (= c!141652 (and ((_ is Intermediate!13175) lt!663979) (undefined!13987 lt!663979)))))

(assert (=> d!160605 (= lt!663979 e!854588)))

(declare-fun c!141651 () Bool)

(assert (=> d!160605 (= c!141651 (bvsge x!534 #b01111111111111111111111111111110))))

(declare-fun lt!663980 () (_ BitVec 64))

(assert (=> d!160605 (= lt!663980 (select (arr!49117 a!2804) index!487))))

(assert (=> d!160605 (validMask!0 mask!2512)))

(assert (=> d!160605 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49117 a!2804) j!70) a!2804 mask!2512) lt!663979)))

(declare-fun b!1533446 () Bool)

(declare-fun e!854586 () SeekEntryResult!13175)

(assert (=> b!1533446 (= e!854588 e!854586)))

(declare-fun c!141650 () Bool)

(assert (=> b!1533446 (= c!141650 (or (= lt!663980 (select (arr!49117 a!2804) j!70)) (= (bvadd lt!663980 lt!663980) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533447 () Bool)

(assert (=> b!1533447 (and (bvsge (index!55097 lt!663979) #b00000000000000000000000000000000) (bvslt (index!55097 lt!663979) (size!49668 a!2804)))))

(declare-fun e!854589 () Bool)

(assert (=> b!1533447 (= e!854589 (= (select (arr!49117 a!2804) (index!55097 lt!663979)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1533448 () Bool)

(assert (=> b!1533448 (= e!854586 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 (bvadd x!534 #b00000000000000000000000000000001) mask!2512) (select (arr!49117 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1533449 () Bool)

(assert (=> b!1533449 (and (bvsge (index!55097 lt!663979) #b00000000000000000000000000000000) (bvslt (index!55097 lt!663979) (size!49668 a!2804)))))

(declare-fun res!1049284 () Bool)

(assert (=> b!1533449 (= res!1049284 (= (select (arr!49117 a!2804) (index!55097 lt!663979)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1533449 (=> res!1049284 e!854589)))

(declare-fun b!1533450 () Bool)

(assert (=> b!1533450 (and (bvsge (index!55097 lt!663979) #b00000000000000000000000000000000) (bvslt (index!55097 lt!663979) (size!49668 a!2804)))))

(declare-fun res!1049283 () Bool)

(assert (=> b!1533450 (= res!1049283 (= (select (arr!49117 a!2804) (index!55097 lt!663979)) (select (arr!49117 a!2804) j!70)))))

(assert (=> b!1533450 (=> res!1049283 e!854589)))

(assert (=> b!1533450 (= e!854587 e!854589)))

(declare-fun b!1533451 () Bool)

(assert (=> b!1533451 (= e!854585 (bvsge (x!136999 lt!663979) #b01111111111111111111111111111110))))

(declare-fun b!1533452 () Bool)

(assert (=> b!1533452 (= e!854586 (Intermediate!13175 false index!487 x!534))))

(assert (= (and d!160605 c!141651) b!1533444))

(assert (= (and d!160605 (not c!141651)) b!1533446))

(assert (= (and b!1533446 c!141650) b!1533452))

(assert (= (and b!1533446 (not c!141650)) b!1533448))

(assert (= (and d!160605 c!141652) b!1533451))

(assert (= (and d!160605 (not c!141652)) b!1533445))

(assert (= (and b!1533445 res!1049282) b!1533450))

(assert (= (and b!1533450 (not res!1049283)) b!1533449))

(assert (= (and b!1533449 (not res!1049284)) b!1533447))

(declare-fun m!1416087 () Bool)

(assert (=> b!1533448 m!1416087))

(assert (=> b!1533448 m!1416087))

(assert (=> b!1533448 m!1415967))

(declare-fun m!1416089 () Bool)

(assert (=> b!1533448 m!1416089))

(declare-fun m!1416091 () Bool)

(assert (=> b!1533447 m!1416091))

(declare-fun m!1416093 () Bool)

(assert (=> d!160605 m!1416093))

(assert (=> d!160605 m!1415977))

(assert (=> b!1533449 m!1416091))

(assert (=> b!1533450 m!1416091))

(assert (=> b!1533333 d!160605))

(declare-fun d!160607 () Bool)

(assert (=> d!160607 (= (validKeyInArray!0 (select (arr!49117 a!2804) i!961)) (and (not (= (select (arr!49117 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49117 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1533332 d!160607))

(declare-fun b!1533495 () Bool)

(declare-fun e!854614 () SeekEntryResult!13175)

(declare-fun e!854616 () SeekEntryResult!13175)

(assert (=> b!1533495 (= e!854614 e!854616)))

(declare-fun lt!664010 () (_ BitVec 64))

(declare-fun lt!664013 () SeekEntryResult!13175)

(assert (=> b!1533495 (= lt!664010 (select (arr!49117 a!2804) (index!55097 lt!664013)))))

(declare-fun c!141673 () Bool)

(assert (=> b!1533495 (= c!141673 (= lt!664010 (select (arr!49117 a!2804) j!70)))))

(declare-fun b!1533497 () Bool)

(declare-fun c!141672 () Bool)

(assert (=> b!1533497 (= c!141672 (= lt!664010 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!854615 () SeekEntryResult!13175)

(assert (=> b!1533497 (= e!854616 e!854615)))

(declare-fun b!1533498 () Bool)

(declare-fun lt!664011 () SeekEntryResult!13175)

(assert (=> b!1533498 (= e!854615 (ite ((_ is MissingVacant!13175) lt!664011) (MissingZero!13175 (index!55098 lt!664011)) lt!664011))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101803 (_ BitVec 32)) SeekEntryResult!13175)

(assert (=> b!1533498 (= lt!664011 (seekKeyOrZeroReturnVacant!0 (x!136999 lt!664013) (index!55097 lt!664013) (index!55097 lt!664013) (select (arr!49117 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1533499 () Bool)

(assert (=> b!1533499 (= e!854615 (MissingZero!13175 (index!55097 lt!664013)))))

(declare-fun b!1533500 () Bool)

(assert (=> b!1533500 (= e!854616 (Found!13175 (index!55097 lt!664013)))))

(declare-fun b!1533496 () Bool)

(assert (=> b!1533496 (= e!854614 Undefined!13175)))

(declare-fun d!160609 () Bool)

(declare-fun lt!664012 () SeekEntryResult!13175)

(assert (=> d!160609 (and (or ((_ is MissingVacant!13175) lt!664012) (not ((_ is Found!13175) lt!664012)) (and (bvsge (index!55096 lt!664012) #b00000000000000000000000000000000) (bvslt (index!55096 lt!664012) (size!49668 a!2804)))) (not ((_ is MissingVacant!13175) lt!664012)) (or (not ((_ is Found!13175) lt!664012)) (= (select (arr!49117 a!2804) (index!55096 lt!664012)) (select (arr!49117 a!2804) j!70))))))

(assert (=> d!160609 (= lt!664012 e!854614)))

(declare-fun c!141671 () Bool)

(assert (=> d!160609 (= c!141671 (and ((_ is Intermediate!13175) lt!664013) (undefined!13987 lt!664013)))))

(assert (=> d!160609 (= lt!664013 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49117 a!2804) j!70) mask!2512) (select (arr!49117 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!160609 (validMask!0 mask!2512)))

(assert (=> d!160609 (= (seekEntry!0 (select (arr!49117 a!2804) j!70) a!2804 mask!2512) lt!664012)))

(assert (= (and d!160609 c!141671) b!1533496))

(assert (= (and d!160609 (not c!141671)) b!1533495))

(assert (= (and b!1533495 c!141673) b!1533500))

(assert (= (and b!1533495 (not c!141673)) b!1533497))

(assert (= (and b!1533497 c!141672) b!1533499))

(assert (= (and b!1533497 (not c!141672)) b!1533498))

(declare-fun m!1416113 () Bool)

(assert (=> b!1533495 m!1416113))

(assert (=> b!1533498 m!1415967))

(declare-fun m!1416115 () Bool)

(assert (=> b!1533498 m!1416115))

(declare-fun m!1416117 () Bool)

(assert (=> d!160609 m!1416117))

(assert (=> d!160609 m!1415967))

(assert (=> d!160609 m!1415991))

(assert (=> d!160609 m!1415991))

(assert (=> d!160609 m!1415967))

(assert (=> d!160609 m!1415993))

(assert (=> d!160609 m!1415977))

(assert (=> b!1533331 d!160609))

(declare-fun b!1533519 () Bool)

(declare-fun e!854629 () Bool)

(declare-fun e!854632 () Bool)

(assert (=> b!1533519 (= e!854629 e!854632)))

(declare-fun c!141680 () Bool)

(assert (=> b!1533519 (= c!141680 (validKeyInArray!0 (select (arr!49117 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!160615 () Bool)

(declare-fun res!1049299 () Bool)

(declare-fun e!854631 () Bool)

(assert (=> d!160615 (=> res!1049299 e!854631)))

(assert (=> d!160615 (= res!1049299 (bvsge #b00000000000000000000000000000000 (size!49668 a!2804)))))

(assert (=> d!160615 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35584) e!854631)))

(declare-fun b!1533520 () Bool)

(assert (=> b!1533520 (= e!854631 e!854629)))

(declare-fun res!1049297 () Bool)

(assert (=> b!1533520 (=> (not res!1049297) (not e!854629))))

(declare-fun e!854630 () Bool)

(assert (=> b!1533520 (= res!1049297 (not e!854630))))

(declare-fun res!1049298 () Bool)

(assert (=> b!1533520 (=> (not res!1049298) (not e!854630))))

(assert (=> b!1533520 (= res!1049298 (validKeyInArray!0 (select (arr!49117 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68667 () Bool)

(declare-fun call!68670 () Bool)

(assert (=> bm!68667 (= call!68670 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!141680 (Cons!35583 (select (arr!49117 a!2804) #b00000000000000000000000000000000) Nil!35584) Nil!35584)))))

(declare-fun b!1533521 () Bool)

(assert (=> b!1533521 (= e!854632 call!68670)))

(declare-fun b!1533522 () Bool)

(declare-fun contains!10051 (List!35587 (_ BitVec 64)) Bool)

(assert (=> b!1533522 (= e!854630 (contains!10051 Nil!35584 (select (arr!49117 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1533523 () Bool)

(assert (=> b!1533523 (= e!854632 call!68670)))

(assert (= (and d!160615 (not res!1049299)) b!1533520))

(assert (= (and b!1533520 res!1049298) b!1533522))

(assert (= (and b!1533520 res!1049297) b!1533519))

(assert (= (and b!1533519 c!141680) b!1533521))

(assert (= (and b!1533519 (not c!141680)) b!1533523))

(assert (= (or b!1533521 b!1533523) bm!68667))

(declare-fun m!1416119 () Bool)

(assert (=> b!1533519 m!1416119))

(assert (=> b!1533519 m!1416119))

(declare-fun m!1416121 () Bool)

(assert (=> b!1533519 m!1416121))

(assert (=> b!1533520 m!1416119))

(assert (=> b!1533520 m!1416119))

(assert (=> b!1533520 m!1416121))

(assert (=> bm!68667 m!1416119))

(declare-fun m!1416123 () Bool)

(assert (=> bm!68667 m!1416123))

(assert (=> b!1533522 m!1416119))

(assert (=> b!1533522 m!1416119))

(declare-fun m!1416125 () Bool)

(assert (=> b!1533522 m!1416125))

(assert (=> b!1533330 d!160615))

(declare-fun d!160617 () Bool)

(declare-fun lt!664024 () (_ BitVec 32))

(assert (=> d!160617 (and (bvsge lt!664024 #b00000000000000000000000000000000) (bvslt lt!664024 (bvadd mask!2512 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!160617 (= lt!664024 (choose!52 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(assert (=> d!160617 (validMask!0 mask!2512)))

(assert (=> d!160617 (= (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512) lt!664024)))

(declare-fun bs!43919 () Bool)

(assert (= bs!43919 d!160617))

(declare-fun m!1416127 () Bool)

(assert (=> bs!43919 m!1416127))

(assert (=> bs!43919 m!1415977))

(assert (=> b!1533329 d!160617))

(declare-fun b!1533552 () Bool)

(declare-fun e!854652 () SeekEntryResult!13175)

(assert (=> b!1533552 (= e!854652 (Intermediate!13175 true lt!663939 (bvadd #b00000000000000000000000000000001 x!534)))))

(declare-fun b!1533553 () Bool)

(declare-fun e!854649 () Bool)

(declare-fun e!854651 () Bool)

(assert (=> b!1533553 (= e!854649 e!854651)))

(declare-fun res!1049312 () Bool)

(declare-fun lt!664025 () SeekEntryResult!13175)

(assert (=> b!1533553 (= res!1049312 (and ((_ is Intermediate!13175) lt!664025) (not (undefined!13987 lt!664025)) (bvslt (x!136999 lt!664025) #b01111111111111111111111111111110) (bvsge (x!136999 lt!664025) #b00000000000000000000000000000000) (bvsge (x!136999 lt!664025) (bvadd #b00000000000000000000000000000001 x!534))))))

(assert (=> b!1533553 (=> (not res!1049312) (not e!854651))))

(declare-fun d!160619 () Bool)

(assert (=> d!160619 e!854649))

(declare-fun c!141691 () Bool)

(assert (=> d!160619 (= c!141691 (and ((_ is Intermediate!13175) lt!664025) (undefined!13987 lt!664025)))))

(assert (=> d!160619 (= lt!664025 e!854652)))

(declare-fun c!141690 () Bool)

(assert (=> d!160619 (= c!141690 (bvsge (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110))))

(declare-fun lt!664026 () (_ BitVec 64))

(assert (=> d!160619 (= lt!664026 (select (arr!49117 a!2804) lt!663939))))

(assert (=> d!160619 (validMask!0 mask!2512)))

(assert (=> d!160619 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!663939 (select (arr!49117 a!2804) j!70) a!2804 mask!2512) lt!664025)))

(declare-fun b!1533554 () Bool)

(declare-fun e!854650 () SeekEntryResult!13175)

(assert (=> b!1533554 (= e!854652 e!854650)))

(declare-fun c!141689 () Bool)

(assert (=> b!1533554 (= c!141689 (or (= lt!664026 (select (arr!49117 a!2804) j!70)) (= (bvadd lt!664026 lt!664026) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533555 () Bool)

(assert (=> b!1533555 (and (bvsge (index!55097 lt!664025) #b00000000000000000000000000000000) (bvslt (index!55097 lt!664025) (size!49668 a!2804)))))

(declare-fun e!854653 () Bool)

(assert (=> b!1533555 (= e!854653 (= (select (arr!49117 a!2804) (index!55097 lt!664025)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1533556 () Bool)

(assert (=> b!1533556 (= e!854650 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534 #b00000000000000000000000000000001) (nextIndex!0 lt!663939 (bvadd #b00000000000000000000000000000001 x!534 #b00000000000000000000000000000001) mask!2512) (select (arr!49117 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1533557 () Bool)

(assert (=> b!1533557 (and (bvsge (index!55097 lt!664025) #b00000000000000000000000000000000) (bvslt (index!55097 lt!664025) (size!49668 a!2804)))))

(declare-fun res!1049314 () Bool)

(assert (=> b!1533557 (= res!1049314 (= (select (arr!49117 a!2804) (index!55097 lt!664025)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1533557 (=> res!1049314 e!854653)))

(declare-fun b!1533558 () Bool)

(assert (=> b!1533558 (and (bvsge (index!55097 lt!664025) #b00000000000000000000000000000000) (bvslt (index!55097 lt!664025) (size!49668 a!2804)))))

(declare-fun res!1049313 () Bool)

(assert (=> b!1533558 (= res!1049313 (= (select (arr!49117 a!2804) (index!55097 lt!664025)) (select (arr!49117 a!2804) j!70)))))

(assert (=> b!1533558 (=> res!1049313 e!854653)))

(assert (=> b!1533558 (= e!854651 e!854653)))

(declare-fun b!1533559 () Bool)

(assert (=> b!1533559 (= e!854649 (bvsge (x!136999 lt!664025) #b01111111111111111111111111111110))))

(declare-fun b!1533560 () Bool)

(assert (=> b!1533560 (= e!854650 (Intermediate!13175 false lt!663939 (bvadd #b00000000000000000000000000000001 x!534)))))

(assert (= (and d!160619 c!141690) b!1533552))

(assert (= (and d!160619 (not c!141690)) b!1533554))

(assert (= (and b!1533554 c!141689) b!1533560))

(assert (= (and b!1533554 (not c!141689)) b!1533556))

(assert (= (and d!160619 c!141691) b!1533559))

(assert (= (and d!160619 (not c!141691)) b!1533553))

(assert (= (and b!1533553 res!1049312) b!1533558))

(assert (= (and b!1533558 (not res!1049313)) b!1533557))

(assert (= (and b!1533557 (not res!1049314)) b!1533555))

(declare-fun m!1416129 () Bool)

(assert (=> b!1533556 m!1416129))

(assert (=> b!1533556 m!1416129))

(assert (=> b!1533556 m!1415967))

(declare-fun m!1416131 () Bool)

(assert (=> b!1533556 m!1416131))

(declare-fun m!1416133 () Bool)

(assert (=> b!1533555 m!1416133))

(declare-fun m!1416135 () Bool)

(assert (=> d!160619 m!1416135))

(assert (=> d!160619 m!1415977))

(assert (=> b!1533557 m!1416133))

(assert (=> b!1533558 m!1416133))

(assert (=> b!1533328 d!160619))

(declare-fun d!160621 () Bool)

(declare-fun res!1049327 () Bool)

(declare-fun e!854671 () Bool)

(assert (=> d!160621 (=> res!1049327 e!854671)))

(assert (=> d!160621 (= res!1049327 (bvsge j!70 (size!49668 a!2804)))))

(assert (=> d!160621 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!854671)))

(declare-fun b!1533587 () Bool)

(declare-fun e!854672 () Bool)

(declare-fun call!68673 () Bool)

(assert (=> b!1533587 (= e!854672 call!68673)))

(declare-fun b!1533588 () Bool)

(declare-fun e!854670 () Bool)

(assert (=> b!1533588 (= e!854671 e!854670)))

(declare-fun c!141700 () Bool)

(assert (=> b!1533588 (= c!141700 (validKeyInArray!0 (select (arr!49117 a!2804) j!70)))))

(declare-fun b!1533589 () Bool)

(assert (=> b!1533589 (= e!854670 call!68673)))

(declare-fun b!1533590 () Bool)

(assert (=> b!1533590 (= e!854670 e!854672)))

(declare-fun lt!664044 () (_ BitVec 64))

(assert (=> b!1533590 (= lt!664044 (select (arr!49117 a!2804) j!70))))

(declare-fun lt!664045 () Unit!51169)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101803 (_ BitVec 64) (_ BitVec 32)) Unit!51169)

(assert (=> b!1533590 (= lt!664045 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!664044 j!70))))

(declare-fun arrayContainsKey!0 (array!101803 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1533590 (arrayContainsKey!0 a!2804 lt!664044 #b00000000000000000000000000000000)))

(declare-fun lt!664043 () Unit!51169)

(assert (=> b!1533590 (= lt!664043 lt!664045)))

(declare-fun res!1049326 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101803 (_ BitVec 32)) SeekEntryResult!13175)

(assert (=> b!1533590 (= res!1049326 (= (seekEntryOrOpen!0 (select (arr!49117 a!2804) j!70) a!2804 mask!2512) (Found!13175 j!70)))))

(assert (=> b!1533590 (=> (not res!1049326) (not e!854672))))

(declare-fun bm!68670 () Bool)

(assert (=> bm!68670 (= call!68673 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(assert (= (and d!160621 (not res!1049327)) b!1533588))

(assert (= (and b!1533588 c!141700) b!1533590))

(assert (= (and b!1533588 (not c!141700)) b!1533589))

(assert (= (and b!1533590 res!1049326) b!1533587))

(assert (= (or b!1533587 b!1533589) bm!68670))

(assert (=> b!1533588 m!1415967))

(assert (=> b!1533588 m!1415967))

(assert (=> b!1533588 m!1415973))

(assert (=> b!1533590 m!1415967))

(declare-fun m!1416153 () Bool)

(assert (=> b!1533590 m!1416153))

(declare-fun m!1416155 () Bool)

(assert (=> b!1533590 m!1416155))

(assert (=> b!1533590 m!1415967))

(declare-fun m!1416157 () Bool)

(assert (=> b!1533590 m!1416157))

(declare-fun m!1416159 () Bool)

(assert (=> bm!68670 m!1416159))

(assert (=> b!1533327 d!160621))

(declare-fun d!160629 () Bool)

(assert (=> d!160629 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!664056 () Unit!51169)

(declare-fun choose!38 (array!101803 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51169)

(assert (=> d!160629 (= lt!664056 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!160629 (validMask!0 mask!2512)))

(assert (=> d!160629 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!664056)))

(declare-fun bs!43920 () Bool)

(assert (= bs!43920 d!160629))

(assert (=> bs!43920 m!1415971))

(declare-fun m!1416161 () Bool)

(assert (=> bs!43920 m!1416161))

(assert (=> bs!43920 m!1415977))

(assert (=> b!1533327 d!160629))

(declare-fun d!160631 () Bool)

(assert (=> d!160631 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!130830 d!160631))

(declare-fun d!160645 () Bool)

(assert (=> d!160645 (= (array_inv!38398 a!2804) (bvsge (size!49668 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!130830 d!160645))

(declare-fun b!1533618 () Bool)

(declare-fun e!854690 () SeekEntryResult!13175)

(assert (=> b!1533618 (= e!854690 (Intermediate!13175 true (toIndex!0 (select (arr!49117 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1533619 () Bool)

(declare-fun e!854687 () Bool)

(declare-fun e!854689 () Bool)

(assert (=> b!1533619 (= e!854687 e!854689)))

(declare-fun res!1049331 () Bool)

(declare-fun lt!664066 () SeekEntryResult!13175)

(assert (=> b!1533619 (= res!1049331 (and ((_ is Intermediate!13175) lt!664066) (not (undefined!13987 lt!664066)) (bvslt (x!136999 lt!664066) #b01111111111111111111111111111110) (bvsge (x!136999 lt!664066) #b00000000000000000000000000000000) (bvsge (x!136999 lt!664066) #b00000000000000000000000000000000)))))

(assert (=> b!1533619 (=> (not res!1049331) (not e!854689))))

(declare-fun d!160647 () Bool)

(assert (=> d!160647 e!854687))

(declare-fun c!141715 () Bool)

(assert (=> d!160647 (= c!141715 (and ((_ is Intermediate!13175) lt!664066) (undefined!13987 lt!664066)))))

(assert (=> d!160647 (= lt!664066 e!854690)))

(declare-fun c!141714 () Bool)

(assert (=> d!160647 (= c!141714 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!664067 () (_ BitVec 64))

(assert (=> d!160647 (= lt!664067 (select (arr!49117 a!2804) (toIndex!0 (select (arr!49117 a!2804) j!70) mask!2512)))))

(assert (=> d!160647 (validMask!0 mask!2512)))

(assert (=> d!160647 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49117 a!2804) j!70) mask!2512) (select (arr!49117 a!2804) j!70) a!2804 mask!2512) lt!664066)))

(declare-fun b!1533620 () Bool)

(declare-fun e!854688 () SeekEntryResult!13175)

(assert (=> b!1533620 (= e!854690 e!854688)))

(declare-fun c!141713 () Bool)

(assert (=> b!1533620 (= c!141713 (or (= lt!664067 (select (arr!49117 a!2804) j!70)) (= (bvadd lt!664067 lt!664067) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533621 () Bool)

(assert (=> b!1533621 (and (bvsge (index!55097 lt!664066) #b00000000000000000000000000000000) (bvslt (index!55097 lt!664066) (size!49668 a!2804)))))

(declare-fun e!854691 () Bool)

(assert (=> b!1533621 (= e!854691 (= (select (arr!49117 a!2804) (index!55097 lt!664066)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1533622 () Bool)

(assert (=> b!1533622 (= e!854688 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!49117 a!2804) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (select (arr!49117 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1533623 () Bool)

(assert (=> b!1533623 (and (bvsge (index!55097 lt!664066) #b00000000000000000000000000000000) (bvslt (index!55097 lt!664066) (size!49668 a!2804)))))

(declare-fun res!1049333 () Bool)

(assert (=> b!1533623 (= res!1049333 (= (select (arr!49117 a!2804) (index!55097 lt!664066)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1533623 (=> res!1049333 e!854691)))

(declare-fun b!1533624 () Bool)

(assert (=> b!1533624 (and (bvsge (index!55097 lt!664066) #b00000000000000000000000000000000) (bvslt (index!55097 lt!664066) (size!49668 a!2804)))))

(declare-fun res!1049332 () Bool)

(assert (=> b!1533624 (= res!1049332 (= (select (arr!49117 a!2804) (index!55097 lt!664066)) (select (arr!49117 a!2804) j!70)))))

(assert (=> b!1533624 (=> res!1049332 e!854691)))

(assert (=> b!1533624 (= e!854689 e!854691)))

(declare-fun b!1533625 () Bool)

(assert (=> b!1533625 (= e!854687 (bvsge (x!136999 lt!664066) #b01111111111111111111111111111110))))

(declare-fun b!1533626 () Bool)

(assert (=> b!1533626 (= e!854688 (Intermediate!13175 false (toIndex!0 (select (arr!49117 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(assert (= (and d!160647 c!141714) b!1533618))

(assert (= (and d!160647 (not c!141714)) b!1533620))

(assert (= (and b!1533620 c!141713) b!1533626))

(assert (= (and b!1533620 (not c!141713)) b!1533622))

(assert (= (and d!160647 c!141715) b!1533625))

(assert (= (and d!160647 (not c!141715)) b!1533619))

(assert (= (and b!1533619 res!1049331) b!1533624))

(assert (= (and b!1533624 (not res!1049332)) b!1533623))

(assert (= (and b!1533623 (not res!1049333)) b!1533621))

(assert (=> b!1533622 m!1415991))

(declare-fun m!1416179 () Bool)

(assert (=> b!1533622 m!1416179))

(assert (=> b!1533622 m!1416179))

(assert (=> b!1533622 m!1415967))

(declare-fun m!1416181 () Bool)

(assert (=> b!1533622 m!1416181))

(declare-fun m!1416183 () Bool)

(assert (=> b!1533621 m!1416183))

(assert (=> d!160647 m!1415991))

(declare-fun m!1416185 () Bool)

(assert (=> d!160647 m!1416185))

(assert (=> d!160647 m!1415977))

(assert (=> b!1533623 m!1416183))

(assert (=> b!1533624 m!1416183))

(assert (=> b!1533326 d!160647))

(declare-fun d!160649 () Bool)

(declare-fun lt!664075 () (_ BitVec 32))

(declare-fun lt!664074 () (_ BitVec 32))

(assert (=> d!160649 (= lt!664075 (bvmul (bvxor lt!664074 (bvlshr lt!664074 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!160649 (= lt!664074 ((_ extract 31 0) (bvand (bvxor (select (arr!49117 a!2804) j!70) (bvlshr (select (arr!49117 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!160649 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1049281 (let ((h!37046 ((_ extract 31 0) (bvand (bvxor (select (arr!49117 a!2804) j!70) (bvlshr (select (arr!49117 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!137003 (bvmul (bvxor h!37046 (bvlshr h!37046 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!137003 (bvlshr x!137003 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1049281 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1049281 #b00000000000000000000000000000000))))))

(assert (=> d!160649 (= (toIndex!0 (select (arr!49117 a!2804) j!70) mask!2512) (bvand (bvxor lt!664075 (bvlshr lt!664075 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1533326 d!160649))

(declare-fun d!160651 () Bool)

(declare-fun res!1049339 () Bool)

(declare-fun e!854699 () Bool)

(assert (=> d!160651 (=> res!1049339 e!854699)))

(assert (=> d!160651 (= res!1049339 (bvsge #b00000000000000000000000000000000 (size!49668 a!2804)))))

(assert (=> d!160651 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!854699)))

(declare-fun b!1533635 () Bool)

(declare-fun e!854700 () Bool)

(declare-fun call!68676 () Bool)

(assert (=> b!1533635 (= e!854700 call!68676)))

(declare-fun b!1533636 () Bool)

(declare-fun e!854698 () Bool)

(assert (=> b!1533636 (= e!854699 e!854698)))

(declare-fun c!141718 () Bool)

(assert (=> b!1533636 (= c!141718 (validKeyInArray!0 (select (arr!49117 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1533637 () Bool)

(assert (=> b!1533637 (= e!854698 call!68676)))

(declare-fun b!1533638 () Bool)

(assert (=> b!1533638 (= e!854698 e!854700)))

(declare-fun lt!664077 () (_ BitVec 64))

(assert (=> b!1533638 (= lt!664077 (select (arr!49117 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!664078 () Unit!51169)

(assert (=> b!1533638 (= lt!664078 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!664077 #b00000000000000000000000000000000))))

(assert (=> b!1533638 (arrayContainsKey!0 a!2804 lt!664077 #b00000000000000000000000000000000)))

(declare-fun lt!664076 () Unit!51169)

(assert (=> b!1533638 (= lt!664076 lt!664078)))

(declare-fun res!1049338 () Bool)

(assert (=> b!1533638 (= res!1049338 (= (seekEntryOrOpen!0 (select (arr!49117 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13175 #b00000000000000000000000000000000)))))

(assert (=> b!1533638 (=> (not res!1049338) (not e!854700))))

(declare-fun bm!68673 () Bool)

(assert (=> bm!68673 (= call!68676 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(assert (= (and d!160651 (not res!1049339)) b!1533636))

(assert (= (and b!1533636 c!141718) b!1533638))

(assert (= (and b!1533636 (not c!141718)) b!1533637))

(assert (= (and b!1533638 res!1049338) b!1533635))

(assert (= (or b!1533635 b!1533637) bm!68673))

(assert (=> b!1533636 m!1416119))

(assert (=> b!1533636 m!1416119))

(assert (=> b!1533636 m!1416121))

(assert (=> b!1533638 m!1416119))

(declare-fun m!1416187 () Bool)

(assert (=> b!1533638 m!1416187))

(declare-fun m!1416189 () Bool)

(assert (=> b!1533638 m!1416189))

(assert (=> b!1533638 m!1416119))

(declare-fun m!1416191 () Bool)

(assert (=> b!1533638 m!1416191))

(declare-fun m!1416193 () Bool)

(assert (=> bm!68673 m!1416193))

(assert (=> b!1533337 d!160651))

(check-sat (not d!160605) (not bm!68667) (not d!160619) (not d!160609) (not b!1533636) (not b!1533590) (not b!1533638) (not bm!68673) (not d!160647) (not d!160617) (not d!160593) (not d!160629) (not b!1533439) (not b!1533520) (not bm!68670) (not b!1533556) (not b!1533588) (not b!1533519) (not b!1533448) (not b!1533498) (not b!1533522) (not b!1533622))
(check-sat)
