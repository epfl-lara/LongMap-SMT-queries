; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128286 () Bool)

(assert start!128286)

(declare-fun b!1505598 () Bool)

(declare-fun res!1026026 () Bool)

(declare-fun e!841498 () Bool)

(assert (=> b!1505598 (=> (not res!1026026) (not e!841498))))

(declare-datatypes ((array!100418 0))(
  ( (array!100419 (arr!48458 (Array (_ BitVec 32) (_ BitVec 64))) (size!49008 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100418)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505598 (= res!1026026 (validKeyInArray!0 (select (arr!48458 a!2804) i!961)))))

(declare-fun b!1505599 () Bool)

(declare-datatypes ((List!34941 0))(
  ( (Nil!34938) (Cons!34937 (h!36334 (_ BitVec 64)) (t!49635 List!34941)) )
))
(declare-fun noDuplicate!2624 (List!34941) Bool)

(assert (=> b!1505599 (= e!841498 (not (noDuplicate!2624 Nil!34938)))))

(declare-fun b!1505600 () Bool)

(declare-fun res!1026029 () Bool)

(assert (=> b!1505600 (=> (not res!1026029) (not e!841498))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100418 (_ BitVec 32)) Bool)

(assert (=> b!1505600 (= res!1026029 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1505601 () Bool)

(declare-fun res!1026027 () Bool)

(assert (=> b!1505601 (=> (not res!1026027) (not e!841498))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1505601 (= res!1026027 (and (= (size!49008 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49008 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49008 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1505602 () Bool)

(declare-fun res!1026028 () Bool)

(assert (=> b!1505602 (=> (not res!1026028) (not e!841498))))

(assert (=> b!1505602 (= res!1026028 (and (bvsle #b00000000000000000000000000000000 (size!49008 a!2804)) (bvslt (size!49008 a!2804) #b01111111111111111111111111111111)))))

(declare-fun res!1026031 () Bool)

(assert (=> start!128286 (=> (not res!1026031) (not e!841498))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128286 (= res!1026031 (validMask!0 mask!2512))))

(assert (=> start!128286 e!841498))

(assert (=> start!128286 true))

(declare-fun array_inv!37486 (array!100418) Bool)

(assert (=> start!128286 (array_inv!37486 a!2804)))

(declare-fun b!1505603 () Bool)

(declare-fun res!1026030 () Bool)

(assert (=> b!1505603 (=> (not res!1026030) (not e!841498))))

(assert (=> b!1505603 (= res!1026030 (validKeyInArray!0 (select (arr!48458 a!2804) j!70)))))

(assert (= (and start!128286 res!1026031) b!1505601))

(assert (= (and b!1505601 res!1026027) b!1505598))

(assert (= (and b!1505598 res!1026026) b!1505603))

(assert (= (and b!1505603 res!1026030) b!1505600))

(assert (= (and b!1505600 res!1026029) b!1505602))

(assert (= (and b!1505602 res!1026028) b!1505599))

(declare-fun m!1388689 () Bool)

(assert (=> b!1505599 m!1388689))

(declare-fun m!1388691 () Bool)

(assert (=> b!1505603 m!1388691))

(assert (=> b!1505603 m!1388691))

(declare-fun m!1388693 () Bool)

(assert (=> b!1505603 m!1388693))

(declare-fun m!1388695 () Bool)

(assert (=> b!1505600 m!1388695))

(declare-fun m!1388697 () Bool)

(assert (=> start!128286 m!1388697))

(declare-fun m!1388699 () Bool)

(assert (=> start!128286 m!1388699))

(declare-fun m!1388701 () Bool)

(assert (=> b!1505598 m!1388701))

(assert (=> b!1505598 m!1388701))

(declare-fun m!1388703 () Bool)

(assert (=> b!1505598 m!1388703))

(push 1)

(assert (not b!1505600))

(assert (not start!128286))

(assert (not b!1505603))

(assert (not b!1505599))

(assert (not b!1505598))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!158065 () Bool)

(assert (=> d!158065 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!128286 d!158065))

(declare-fun d!158077 () Bool)

(assert (=> d!158077 (= (array_inv!37486 a!2804) (bvsge (size!49008 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!128286 d!158077))

(declare-fun d!158079 () Bool)

(assert (=> d!158079 (= (validKeyInArray!0 (select (arr!48458 a!2804) j!70)) (and (not (= (select (arr!48458 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48458 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1505603 d!158079))

(declare-fun d!158081 () Bool)

(assert (=> d!158081 (= (validKeyInArray!0 (select (arr!48458 a!2804) i!961)) (and (not (= (select (arr!48458 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48458 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1505598 d!158081))

(declare-fun b!1505666 () Bool)

(declare-fun e!841532 () Bool)

(declare-fun call!68190 () Bool)

(assert (=> b!1505666 (= e!841532 call!68190)))

(declare-fun bm!68187 () Bool)

(assert (=> bm!68187 (= call!68190 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1505667 () Bool)

(declare-fun e!841534 () Bool)

(assert (=> b!1505667 (= e!841532 e!841534)))

(declare-fun lt!654067 () (_ BitVec 64))

(assert (=> b!1505667 (= lt!654067 (select (arr!48458 a!2804) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50306 0))(
  ( (Unit!50307) )
))
(declare-fun lt!654066 () Unit!50306)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100418 (_ BitVec 64) (_ BitVec 32)) Unit!50306)

(assert (=> b!1505667 (= lt!654066 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!654067 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100418 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1505667 (arrayContainsKey!0 a!2804 lt!654067 #b00000000000000000000000000000000)))

(declare-fun lt!654065 () Unit!50306)

(assert (=> b!1505667 (= lt!654065 lt!654066)))

(declare-fun res!1026084 () Bool)

(declare-datatypes ((SeekEntryResult!12650 0))(
  ( (MissingZero!12650 (index!52995 (_ BitVec 32))) (Found!12650 (index!52996 (_ BitVec 32))) (Intermediate!12650 (undefined!13462 Bool) (index!52997 (_ BitVec 32)) (x!134701 (_ BitVec 32))) (Undefined!12650) (MissingVacant!12650 (index!52998 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100418 (_ BitVec 32)) SeekEntryResult!12650)

(assert (=> b!1505667 (= res!1026084 (= (seekEntryOrOpen!0 (select (arr!48458 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12650 #b00000000000000000000000000000000)))))

(assert (=> b!1505667 (=> (not res!1026084) (not e!841534))))

(declare-fun d!158083 () Bool)

(declare-fun res!1026085 () Bool)

(declare-fun e!841533 () Bool)

(assert (=> d!158083 (=> res!1026085 e!841533)))

(assert (=> d!158083 (= res!1026085 (bvsge #b00000000000000000000000000000000 (size!49008 a!2804)))))

(assert (=> d!158083 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!841533)))

(declare-fun b!1505668 () Bool)

(assert (=> b!1505668 (= e!841534 call!68190)))

(declare-fun b!1505669 () Bool)

(assert (=> b!1505669 (= e!841533 e!841532)))

(declare-fun c!139325 () Bool)

(assert (=> b!1505669 (= c!139325 (validKeyInArray!0 (select (arr!48458 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!158083 (not res!1026085)) b!1505669))

(assert (= (and b!1505669 c!139325) b!1505667))

(assert (= (and b!1505669 (not c!139325)) b!1505666))

(assert (= (and b!1505667 res!1026084) b!1505668))

(assert (= (or b!1505668 b!1505666) bm!68187))

(declare-fun m!1388753 () Bool)

(assert (=> bm!68187 m!1388753))

(declare-fun m!1388755 () Bool)

(assert (=> b!1505667 m!1388755))

(declare-fun m!1388757 () Bool)

(assert (=> b!1505667 m!1388757))

(declare-fun m!1388759 () Bool)

(assert (=> b!1505667 m!1388759))

(assert (=> b!1505667 m!1388755))

(declare-fun m!1388761 () Bool)

(assert (=> b!1505667 m!1388761))

(assert (=> b!1505669 m!1388755))

(assert (=> b!1505669 m!1388755))

(declare-fun m!1388763 () Bool)

(assert (=> b!1505669 m!1388763))

(assert (=> b!1505600 d!158083))

(declare-fun d!158093 () Bool)

