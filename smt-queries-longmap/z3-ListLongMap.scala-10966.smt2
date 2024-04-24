; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128726 () Bool)

(assert start!128726)

(declare-fun b!1508068 () Bool)

(declare-fun res!1027250 () Bool)

(declare-fun e!842946 () Bool)

(assert (=> b!1508068 (=> (not res!1027250) (not e!842946))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100585 0))(
  ( (array!100586 (arr!48532 (Array (_ BitVec 32) (_ BitVec 64))) (size!49083 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100585)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1508068 (= res!1027250 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49083 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49083 a!2804))))))

(declare-fun res!1027253 () Bool)

(assert (=> start!128726 (=> (not res!1027253) (not e!842946))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128726 (= res!1027253 (validMask!0 mask!2512))))

(assert (=> start!128726 e!842946))

(assert (=> start!128726 true))

(declare-fun array_inv!37813 (array!100585) Bool)

(assert (=> start!128726 (array_inv!37813 a!2804)))

(declare-fun b!1508069 () Bool)

(declare-fun res!1027251 () Bool)

(assert (=> b!1508069 (=> (not res!1027251) (not e!842946))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508069 (= res!1027251 (validKeyInArray!0 (select (arr!48532 a!2804) j!70)))))

(declare-fun b!1508070 () Bool)

(declare-fun lt!654835 () (_ BitVec 32))

(assert (=> b!1508070 (= e!842946 (and (bvsge mask!2512 #b00000000000000000000000000000000) (or (bvslt lt!654835 #b00000000000000000000000000000000) (bvsge lt!654835 (bvadd #b00000000000000000000000000000001 mask!2512)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508070 (= lt!654835 (toIndex!0 (select (arr!48532 a!2804) j!70) mask!2512))))

(declare-fun b!1508071 () Bool)

(declare-fun res!1027247 () Bool)

(assert (=> b!1508071 (=> (not res!1027247) (not e!842946))))

(declare-datatypes ((List!35002 0))(
  ( (Nil!34999) (Cons!34998 (h!36410 (_ BitVec 64)) (t!49688 List!35002)) )
))
(declare-fun arrayNoDuplicates!0 (array!100585 (_ BitVec 32) List!35002) Bool)

(assert (=> b!1508071 (= res!1027247 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34999))))

(declare-fun b!1508072 () Bool)

(declare-fun res!1027252 () Bool)

(assert (=> b!1508072 (=> (not res!1027252) (not e!842946))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1508072 (= res!1027252 (and (= (size!49083 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49083 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49083 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1508073 () Bool)

(declare-fun res!1027248 () Bool)

(assert (=> b!1508073 (=> (not res!1027248) (not e!842946))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100585 (_ BitVec 32)) Bool)

(assert (=> b!1508073 (= res!1027248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1508074 () Bool)

(declare-fun res!1027249 () Bool)

(assert (=> b!1508074 (=> (not res!1027249) (not e!842946))))

(assert (=> b!1508074 (= res!1027249 (validKeyInArray!0 (select (arr!48532 a!2804) i!961)))))

(assert (= (and start!128726 res!1027253) b!1508072))

(assert (= (and b!1508072 res!1027252) b!1508074))

(assert (= (and b!1508074 res!1027249) b!1508069))

(assert (= (and b!1508069 res!1027251) b!1508073))

(assert (= (and b!1508073 res!1027248) b!1508071))

(assert (= (and b!1508071 res!1027247) b!1508068))

(assert (= (and b!1508068 res!1027250) b!1508070))

(declare-fun m!1391025 () Bool)

(assert (=> b!1508073 m!1391025))

(declare-fun m!1391027 () Bool)

(assert (=> start!128726 m!1391027))

(declare-fun m!1391029 () Bool)

(assert (=> start!128726 m!1391029))

(declare-fun m!1391031 () Bool)

(assert (=> b!1508074 m!1391031))

(assert (=> b!1508074 m!1391031))

(declare-fun m!1391033 () Bool)

(assert (=> b!1508074 m!1391033))

(declare-fun m!1391035 () Bool)

(assert (=> b!1508071 m!1391035))

(declare-fun m!1391037 () Bool)

(assert (=> b!1508070 m!1391037))

(assert (=> b!1508070 m!1391037))

(declare-fun m!1391039 () Bool)

(assert (=> b!1508070 m!1391039))

(assert (=> b!1508069 m!1391037))

(assert (=> b!1508069 m!1391037))

(declare-fun m!1391041 () Bool)

(assert (=> b!1508069 m!1391041))

(check-sat (not b!1508073) (not start!128726) (not b!1508074) (not b!1508069) (not b!1508071) (not b!1508070))
(check-sat)
(get-model)

(declare-fun d!158711 () Bool)

(declare-fun lt!654847 () (_ BitVec 32))

(declare-fun lt!654846 () (_ BitVec 32))

(assert (=> d!158711 (= lt!654847 (bvmul (bvxor lt!654846 (bvlshr lt!654846 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158711 (= lt!654846 ((_ extract 31 0) (bvand (bvxor (select (arr!48532 a!2804) j!70) (bvlshr (select (arr!48532 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158711 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1027296 (let ((h!36413 ((_ extract 31 0) (bvand (bvxor (select (arr!48532 a!2804) j!70) (bvlshr (select (arr!48532 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!134746 (bvmul (bvxor h!36413 (bvlshr h!36413 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!134746 (bvlshr x!134746 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1027296 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1027296 #b00000000000000000000000000000000))))))

(assert (=> d!158711 (= (toIndex!0 (select (arr!48532 a!2804) j!70) mask!2512) (bvand (bvxor lt!654847 (bvlshr lt!654847 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1508070 d!158711))

(declare-fun d!158713 () Bool)

(assert (=> d!158713 (= (validKeyInArray!0 (select (arr!48532 a!2804) j!70)) (and (not (= (select (arr!48532 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48532 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1508069 d!158713))

(declare-fun d!158715 () Bool)

(assert (=> d!158715 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!128726 d!158715))

(declare-fun d!158721 () Bool)

(assert (=> d!158721 (= (array_inv!37813 a!2804) (bvsge (size!49083 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!128726 d!158721))

(declare-fun b!1508149 () Bool)

(declare-fun e!842987 () Bool)

(declare-fun e!842986 () Bool)

(assert (=> b!1508149 (= e!842987 e!842986)))

(declare-fun c!139962 () Bool)

(assert (=> b!1508149 (= c!139962 (validKeyInArray!0 (select (arr!48532 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1508150 () Bool)

(declare-fun e!842985 () Bool)

(assert (=> b!1508150 (= e!842985 e!842987)))

(declare-fun res!1027316 () Bool)

(assert (=> b!1508150 (=> (not res!1027316) (not e!842987))))

(declare-fun e!842984 () Bool)

(assert (=> b!1508150 (= res!1027316 (not e!842984))))

(declare-fun res!1027315 () Bool)

(assert (=> b!1508150 (=> (not res!1027315) (not e!842984))))

(assert (=> b!1508150 (= res!1027315 (validKeyInArray!0 (select (arr!48532 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1508151 () Bool)

(declare-fun call!68333 () Bool)

(assert (=> b!1508151 (= e!842986 call!68333)))

(declare-fun b!1508152 () Bool)

(declare-fun contains!10006 (List!35002 (_ BitVec 64)) Bool)

(assert (=> b!1508152 (= e!842984 (contains!10006 Nil!34999 (select (arr!48532 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1508153 () Bool)

(assert (=> b!1508153 (= e!842986 call!68333)))

(declare-fun d!158723 () Bool)

(declare-fun res!1027317 () Bool)

(assert (=> d!158723 (=> res!1027317 e!842985)))

(assert (=> d!158723 (= res!1027317 (bvsge #b00000000000000000000000000000000 (size!49083 a!2804)))))

(assert (=> d!158723 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34999) e!842985)))

(declare-fun bm!68330 () Bool)

(assert (=> bm!68330 (= call!68333 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139962 (Cons!34998 (select (arr!48532 a!2804) #b00000000000000000000000000000000) Nil!34999) Nil!34999)))))

(assert (= (and d!158723 (not res!1027317)) b!1508150))

(assert (= (and b!1508150 res!1027315) b!1508152))

(assert (= (and b!1508150 res!1027316) b!1508149))

(assert (= (and b!1508149 c!139962) b!1508151))

(assert (= (and b!1508149 (not c!139962)) b!1508153))

(assert (= (or b!1508151 b!1508153) bm!68330))

(declare-fun m!1391083 () Bool)

(assert (=> b!1508149 m!1391083))

(assert (=> b!1508149 m!1391083))

(declare-fun m!1391087 () Bool)

(assert (=> b!1508149 m!1391087))

(assert (=> b!1508150 m!1391083))

(assert (=> b!1508150 m!1391083))

(assert (=> b!1508150 m!1391087))

(assert (=> b!1508152 m!1391083))

(assert (=> b!1508152 m!1391083))

(declare-fun m!1391095 () Bool)

(assert (=> b!1508152 m!1391095))

(assert (=> bm!68330 m!1391083))

(declare-fun m!1391097 () Bool)

(assert (=> bm!68330 m!1391097))

(assert (=> b!1508071 d!158723))

(declare-fun d!158729 () Bool)

(assert (=> d!158729 (= (validKeyInArray!0 (select (arr!48532 a!2804) i!961)) (and (not (= (select (arr!48532 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48532 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1508074 d!158729))

(declare-fun b!1508177 () Bool)

(declare-fun e!843007 () Bool)

(declare-fun e!843008 () Bool)

(assert (=> b!1508177 (= e!843007 e!843008)))

(declare-fun c!139968 () Bool)

(assert (=> b!1508177 (= c!139968 (validKeyInArray!0 (select (arr!48532 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1508178 () Bool)

(declare-fun e!843006 () Bool)

(declare-fun call!68339 () Bool)

(assert (=> b!1508178 (= e!843006 call!68339)))

(declare-fun b!1508179 () Bool)

(assert (=> b!1508179 (= e!843008 e!843006)))

(declare-fun lt!654869 () (_ BitVec 64))

(assert (=> b!1508179 (= lt!654869 (select (arr!48532 a!2804) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50247 0))(
  ( (Unit!50248) )
))
(declare-fun lt!654871 () Unit!50247)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100585 (_ BitVec 64) (_ BitVec 32)) Unit!50247)

(assert (=> b!1508179 (= lt!654871 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!654869 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100585 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1508179 (arrayContainsKey!0 a!2804 lt!654869 #b00000000000000000000000000000000)))

(declare-fun lt!654870 () Unit!50247)

(assert (=> b!1508179 (= lt!654870 lt!654871)))

(declare-fun res!1027332 () Bool)

(declare-datatypes ((SeekEntryResult!12602 0))(
  ( (MissingZero!12602 (index!52803 (_ BitVec 32))) (Found!12602 (index!52804 (_ BitVec 32))) (Intermediate!12602 (undefined!13414 Bool) (index!52805 (_ BitVec 32)) (x!134749 (_ BitVec 32))) (Undefined!12602) (MissingVacant!12602 (index!52806 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100585 (_ BitVec 32)) SeekEntryResult!12602)

(assert (=> b!1508179 (= res!1027332 (= (seekEntryOrOpen!0 (select (arr!48532 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12602 #b00000000000000000000000000000000)))))

(assert (=> b!1508179 (=> (not res!1027332) (not e!843006))))

(declare-fun d!158731 () Bool)

(declare-fun res!1027333 () Bool)

(assert (=> d!158731 (=> res!1027333 e!843007)))

(assert (=> d!158731 (= res!1027333 (bvsge #b00000000000000000000000000000000 (size!49083 a!2804)))))

(assert (=> d!158731 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!843007)))

(declare-fun b!1508180 () Bool)

(assert (=> b!1508180 (= e!843008 call!68339)))

(declare-fun bm!68336 () Bool)

(assert (=> bm!68336 (= call!68339 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(assert (= (and d!158731 (not res!1027333)) b!1508177))

(assert (= (and b!1508177 c!139968) b!1508179))

(assert (= (and b!1508177 (not c!139968)) b!1508180))

(assert (= (and b!1508179 res!1027332) b!1508178))

(assert (= (or b!1508178 b!1508180) bm!68336))

(assert (=> b!1508177 m!1391083))

(assert (=> b!1508177 m!1391083))

(assert (=> b!1508177 m!1391087))

(assert (=> b!1508179 m!1391083))

(declare-fun m!1391107 () Bool)

(assert (=> b!1508179 m!1391107))

(declare-fun m!1391109 () Bool)

(assert (=> b!1508179 m!1391109))

(assert (=> b!1508179 m!1391083))

(declare-fun m!1391111 () Bool)

(assert (=> b!1508179 m!1391111))

(declare-fun m!1391113 () Bool)

(assert (=> bm!68336 m!1391113))

(assert (=> b!1508073 d!158731))

(check-sat (not b!1508149) (not b!1508150) (not b!1508177) (not b!1508152) (not b!1508179) (not bm!68330) (not bm!68336))
(check-sat)
