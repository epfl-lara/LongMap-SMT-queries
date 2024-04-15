; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128204 () Bool)

(assert start!128204)

(declare-fun b!1505175 () Bool)

(declare-fun res!1025828 () Bool)

(declare-fun e!841238 () Bool)

(assert (=> b!1505175 (=> (not res!1025828) (not e!841238))))

(declare-datatypes ((array!100357 0))(
  ( (array!100358 (arr!48430 (Array (_ BitVec 32) (_ BitVec 64))) (size!48982 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100357)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505175 (= res!1025828 (validKeyInArray!0 (select (arr!48430 a!2804) i!961)))))

(declare-fun res!1025829 () Bool)

(assert (=> start!128204 (=> (not res!1025829) (not e!841238))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128204 (= res!1025829 (validMask!0 mask!2512))))

(assert (=> start!128204 e!841238))

(assert (=> start!128204 true))

(declare-fun array_inv!37663 (array!100357) Bool)

(assert (=> start!128204 (array_inv!37663 a!2804)))

(declare-fun b!1505176 () Bool)

(declare-fun res!1025831 () Bool)

(assert (=> b!1505176 (=> (not res!1025831) (not e!841238))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100357 (_ BitVec 32)) Bool)

(assert (=> b!1505176 (= res!1025831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1505177 () Bool)

(declare-fun res!1025830 () Bool)

(assert (=> b!1505177 (=> (not res!1025830) (not e!841238))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1505177 (= res!1025830 (validKeyInArray!0 (select (arr!48430 a!2804) j!70)))))

(declare-fun b!1505178 () Bool)

(assert (=> b!1505178 (= e!841238 (and (bvsle #b00000000000000000000000000000000 (size!48982 a!2804)) (bvsge (size!48982 a!2804) #b01111111111111111111111111111111)))))

(declare-fun b!1505179 () Bool)

(declare-fun res!1025827 () Bool)

(assert (=> b!1505179 (=> (not res!1025827) (not e!841238))))

(assert (=> b!1505179 (= res!1025827 (and (= (size!48982 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!48982 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!48982 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!128204 res!1025829) b!1505179))

(assert (= (and b!1505179 res!1025827) b!1505175))

(assert (= (and b!1505175 res!1025828) b!1505177))

(assert (= (and b!1505177 res!1025830) b!1505176))

(assert (= (and b!1505176 res!1025831) b!1505178))

(declare-fun m!1387703 () Bool)

(assert (=> b!1505175 m!1387703))

(assert (=> b!1505175 m!1387703))

(declare-fun m!1387705 () Bool)

(assert (=> b!1505175 m!1387705))

(declare-fun m!1387707 () Bool)

(assert (=> start!128204 m!1387707))

(declare-fun m!1387709 () Bool)

(assert (=> start!128204 m!1387709))

(declare-fun m!1387711 () Bool)

(assert (=> b!1505176 m!1387711))

(declare-fun m!1387713 () Bool)

(assert (=> b!1505177 m!1387713))

(assert (=> b!1505177 m!1387713))

(declare-fun m!1387715 () Bool)

(assert (=> b!1505177 m!1387715))

(check-sat (not b!1505175) (not start!128204) (not b!1505176) (not b!1505177))
(check-sat)
(get-model)

(declare-fun d!157769 () Bool)

(assert (=> d!157769 (= (validKeyInArray!0 (select (arr!48430 a!2804) i!961)) (and (not (= (select (arr!48430 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48430 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1505175 d!157769))

(declare-fun d!157771 () Bool)

(assert (=> d!157771 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!128204 d!157771))

(declare-fun d!157781 () Bool)

(assert (=> d!157781 (= (array_inv!37663 a!2804) (bvsge (size!48982 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!128204 d!157781))

(declare-fun bm!68144 () Bool)

(declare-fun call!68147 () Bool)

(assert (=> bm!68144 (= call!68147 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1505243 () Bool)

(declare-fun e!841277 () Bool)

(assert (=> b!1505243 (= e!841277 call!68147)))

(declare-fun b!1505242 () Bool)

(declare-fun e!841278 () Bool)

(declare-fun e!841276 () Bool)

(assert (=> b!1505242 (= e!841278 e!841276)))

(declare-fun c!139219 () Bool)

(assert (=> b!1505242 (= c!139219 (validKeyInArray!0 (select (arr!48430 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!157783 () Bool)

(declare-fun res!1025879 () Bool)

(assert (=> d!157783 (=> res!1025879 e!841278)))

(assert (=> d!157783 (= res!1025879 (bvsge #b00000000000000000000000000000000 (size!48982 a!2804)))))

(assert (=> d!157783 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!841278)))

(declare-fun b!1505244 () Bool)

(assert (=> b!1505244 (= e!841276 call!68147)))

(declare-fun b!1505245 () Bool)

(assert (=> b!1505245 (= e!841276 e!841277)))

(declare-fun lt!653752 () (_ BitVec 64))

(assert (=> b!1505245 (= lt!653752 (select (arr!48430 a!2804) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50131 0))(
  ( (Unit!50132) )
))
(declare-fun lt!653753 () Unit!50131)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100357 (_ BitVec 64) (_ BitVec 32)) Unit!50131)

(assert (=> b!1505245 (= lt!653753 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!653752 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100357 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1505245 (arrayContainsKey!0 a!2804 lt!653752 #b00000000000000000000000000000000)))

(declare-fun lt!653754 () Unit!50131)

(assert (=> b!1505245 (= lt!653754 lt!653753)))

(declare-fun res!1025878 () Bool)

(declare-datatypes ((SeekEntryResult!12643 0))(
  ( (MissingZero!12643 (index!52967 (_ BitVec 32))) (Found!12643 (index!52968 (_ BitVec 32))) (Intermediate!12643 (undefined!13455 Bool) (index!52969 (_ BitVec 32)) (x!134680 (_ BitVec 32))) (Undefined!12643) (MissingVacant!12643 (index!52970 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100357 (_ BitVec 32)) SeekEntryResult!12643)

(assert (=> b!1505245 (= res!1025878 (= (seekEntryOrOpen!0 (select (arr!48430 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12643 #b00000000000000000000000000000000)))))

(assert (=> b!1505245 (=> (not res!1025878) (not e!841277))))

(assert (= (and d!157783 (not res!1025879)) b!1505242))

(assert (= (and b!1505242 c!139219) b!1505245))

(assert (= (and b!1505242 (not c!139219)) b!1505244))

(assert (= (and b!1505245 res!1025878) b!1505243))

(assert (= (or b!1505243 b!1505244) bm!68144))

(declare-fun m!1387769 () Bool)

(assert (=> bm!68144 m!1387769))

(declare-fun m!1387771 () Bool)

(assert (=> b!1505242 m!1387771))

(assert (=> b!1505242 m!1387771))

(declare-fun m!1387773 () Bool)

(assert (=> b!1505242 m!1387773))

(assert (=> b!1505245 m!1387771))

(declare-fun m!1387775 () Bool)

(assert (=> b!1505245 m!1387775))

(declare-fun m!1387777 () Bool)

(assert (=> b!1505245 m!1387777))

(assert (=> b!1505245 m!1387771))

(declare-fun m!1387779 () Bool)

(assert (=> b!1505245 m!1387779))

(assert (=> b!1505176 d!157783))

(declare-fun d!157791 () Bool)

(assert (=> d!157791 (= (validKeyInArray!0 (select (arr!48430 a!2804) j!70)) (and (not (= (select (arr!48430 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48430 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1505177 d!157791))

(check-sat (not b!1505245) (not bm!68144) (not b!1505242))
(check-sat)
