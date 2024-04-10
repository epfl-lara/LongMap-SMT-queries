; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128374 () Bool)

(assert start!128374)

(declare-fun b!1505946 () Bool)

(declare-fun res!1026339 () Bool)

(declare-fun e!841686 () Bool)

(assert (=> b!1505946 (=> (not res!1026339) (not e!841686))))

(declare-datatypes ((array!100446 0))(
  ( (array!100447 (arr!48469 (Array (_ BitVec 32) (_ BitVec 64))) (size!49019 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100446)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100446 (_ BitVec 32)) Bool)

(assert (=> b!1505946 (= res!1026339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1505947 () Bool)

(declare-fun res!1026341 () Bool)

(assert (=> b!1505947 (=> (not res!1026341) (not e!841686))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505947 (= res!1026341 (validKeyInArray!0 (select (arr!48469 a!2804) i!961)))))

(declare-fun res!1026340 () Bool)

(assert (=> start!128374 (=> (not res!1026340) (not e!841686))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128374 (= res!1026340 (validMask!0 mask!2512))))

(assert (=> start!128374 e!841686))

(assert (=> start!128374 true))

(declare-fun array_inv!37497 (array!100446) Bool)

(assert (=> start!128374 (array_inv!37497 a!2804)))

(declare-fun b!1505948 () Bool)

(declare-fun res!1026342 () Bool)

(assert (=> b!1505948 (=> (not res!1026342) (not e!841686))))

(declare-datatypes ((List!34952 0))(
  ( (Nil!34949) (Cons!34948 (h!36345 (_ BitVec 64)) (t!49646 List!34952)) )
))
(declare-fun arrayNoDuplicates!0 (array!100446 (_ BitVec 32) List!34952) Bool)

(assert (=> b!1505948 (= res!1026342 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34949))))

(declare-fun b!1505949 () Bool)

(declare-fun res!1026338 () Bool)

(assert (=> b!1505949 (=> (not res!1026338) (not e!841686))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1505949 (= res!1026338 (and (= (size!49019 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49019 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49019 a!2804)) (not (= i!961 j!70))))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun b!1505950 () Bool)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1505950 (= e!841686 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49019 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49019 a!2804)) (bvsge mask!2512 #b00000000000000000000000000000000) (bvsgt mask!2512 #b00111111111111111111111111111111)))))

(declare-fun b!1505951 () Bool)

(declare-fun res!1026343 () Bool)

(assert (=> b!1505951 (=> (not res!1026343) (not e!841686))))

(assert (=> b!1505951 (= res!1026343 (validKeyInArray!0 (select (arr!48469 a!2804) j!70)))))

(assert (= (and start!128374 res!1026340) b!1505949))

(assert (= (and b!1505949 res!1026338) b!1505947))

(assert (= (and b!1505947 res!1026341) b!1505951))

(assert (= (and b!1505951 res!1026343) b!1505946))

(assert (= (and b!1505946 res!1026339) b!1505948))

(assert (= (and b!1505948 res!1026342) b!1505950))

(declare-fun m!1389003 () Bool)

(assert (=> b!1505947 m!1389003))

(assert (=> b!1505947 m!1389003))

(declare-fun m!1389005 () Bool)

(assert (=> b!1505947 m!1389005))

(declare-fun m!1389007 () Bool)

(assert (=> b!1505948 m!1389007))

(declare-fun m!1389009 () Bool)

(assert (=> b!1505951 m!1389009))

(assert (=> b!1505951 m!1389009))

(declare-fun m!1389011 () Bool)

(assert (=> b!1505951 m!1389011))

(declare-fun m!1389013 () Bool)

(assert (=> b!1505946 m!1389013))

(declare-fun m!1389015 () Bool)

(assert (=> start!128374 m!1389015))

(declare-fun m!1389017 () Bool)

(assert (=> start!128374 m!1389017))

(push 1)

(assert (not b!1505947))

(assert (not start!128374))

(assert (not b!1505951))

(assert (not b!1505946))

(assert (not b!1505948))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!68210 () Bool)

(declare-fun call!68213 () Bool)

(declare-fun c!139348 () Bool)

(assert (=> bm!68210 (= call!68213 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139348 (Cons!34948 (select (arr!48469 a!2804) #b00000000000000000000000000000000) Nil!34949) Nil!34949)))))

(declare-fun b!1505997 () Bool)

(declare-fun e!841724 () Bool)

(assert (=> b!1505997 (= e!841724 call!68213)))

(declare-fun b!1505998 () Bool)

(declare-fun e!841725 () Bool)

(assert (=> b!1505998 (= e!841725 e!841724)))

(assert (=> b!1505998 (= c!139348 (validKeyInArray!0 (select (arr!48469 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!158163 () Bool)

(declare-fun res!1026371 () Bool)

(declare-fun e!841723 () Bool)

(assert (=> d!158163 (=> res!1026371 e!841723)))

(assert (=> d!158163 (= res!1026371 (bvsge #b00000000000000000000000000000000 (size!49019 a!2804)))))

(assert (=> d!158163 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34949) e!841723)))

(declare-fun b!1505999 () Bool)

(assert (=> b!1505999 (= e!841724 call!68213)))

(declare-fun b!1506000 () Bool)

(assert (=> b!1506000 (= e!841723 e!841725)))

(declare-fun res!1026369 () Bool)

(assert (=> b!1506000 (=> (not res!1026369) (not e!841725))))

(declare-fun e!841726 () Bool)

(assert (=> b!1506000 (= res!1026369 (not e!841726))))

(declare-fun res!1026370 () Bool)

(assert (=> b!1506000 (=> (not res!1026370) (not e!841726))))

(assert (=> b!1506000 (= res!1026370 (validKeyInArray!0 (select (arr!48469 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1506001 () Bool)

(declare-fun contains!9962 (List!34952 (_ BitVec 64)) Bool)

(assert (=> b!1506001 (= e!841726 (contains!9962 Nil!34949 (select (arr!48469 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!158163 (not res!1026371)) b!1506000))

(assert (= (and b!1506000 res!1026370) b!1506001))

(assert (= (and b!1506000 res!1026369) b!1505998))

(assert (= (and b!1505998 c!139348) b!1505997))

(assert (= (and b!1505998 (not c!139348)) b!1505999))

(assert (= (or b!1505997 b!1505999) bm!68210))

(declare-fun m!1389035 () Bool)

