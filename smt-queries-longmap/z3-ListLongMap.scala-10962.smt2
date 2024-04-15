; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128318 () Bool)

(assert start!128318)

(declare-fun b!1505570 () Bool)

(declare-fun res!1026173 () Bool)

(declare-fun e!841460 () Bool)

(assert (=> b!1505570 (=> (not res!1026173) (not e!841460))))

(declare-datatypes ((array!100390 0))(
  ( (array!100391 (arr!48442 (Array (_ BitVec 32) (_ BitVec 64))) (size!48994 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100390)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505570 (= res!1026173 (validKeyInArray!0 (select (arr!48442 a!2804) i!961)))))

(declare-fun b!1505571 () Bool)

(declare-fun res!1026170 () Bool)

(assert (=> b!1505571 (=> (not res!1026170) (not e!841460))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1505571 (= res!1026170 (validKeyInArray!0 (select (arr!48442 a!2804) j!70)))))

(declare-fun res!1026172 () Bool)

(assert (=> start!128318 (=> (not res!1026172) (not e!841460))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128318 (= res!1026172 (validMask!0 mask!2512))))

(assert (=> start!128318 e!841460))

(assert (=> start!128318 true))

(declare-fun array_inv!37675 (array!100390) Bool)

(assert (=> start!128318 (array_inv!37675 a!2804)))

(declare-fun b!1505572 () Bool)

(declare-fun res!1026169 () Bool)

(assert (=> b!1505572 (=> (not res!1026169) (not e!841460))))

(assert (=> b!1505572 (= res!1026169 (and (= (size!48994 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!48994 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!48994 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1505573 () Bool)

(declare-fun res!1026168 () Bool)

(assert (=> b!1505573 (=> (not res!1026168) (not e!841460))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100390 (_ BitVec 32)) Bool)

(assert (=> b!1505573 (= res!1026168 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1505574 () Bool)

(declare-fun res!1026171 () Bool)

(assert (=> b!1505574 (=> (not res!1026171) (not e!841460))))

(declare-datatypes ((List!35003 0))(
  ( (Nil!35000) (Cons!34999 (h!36397 (_ BitVec 64)) (t!49689 List!35003)) )
))
(declare-fun arrayNoDuplicates!0 (array!100390 (_ BitVec 32) List!35003) Bool)

(assert (=> b!1505574 (= res!1026171 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35000))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun b!1505575 () Bool)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1505575 (= e!841460 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!48994 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!48994 a!2804)) (bvsge mask!2512 #b00000000000000000000000000000000) (bvsgt mask!2512 #b00111111111111111111111111111111)))))

(assert (= (and start!128318 res!1026172) b!1505572))

(assert (= (and b!1505572 res!1026169) b!1505570))

(assert (= (and b!1505570 res!1026173) b!1505571))

(assert (= (and b!1505571 res!1026170) b!1505573))

(assert (= (and b!1505573 res!1026168) b!1505574))

(assert (= (and b!1505574 res!1026171) b!1505575))

(declare-fun m!1388063 () Bool)

(assert (=> start!128318 m!1388063))

(declare-fun m!1388065 () Bool)

(assert (=> start!128318 m!1388065))

(declare-fun m!1388067 () Bool)

(assert (=> b!1505574 m!1388067))

(declare-fun m!1388069 () Bool)

(assert (=> b!1505570 m!1388069))

(assert (=> b!1505570 m!1388069))

(declare-fun m!1388071 () Bool)

(assert (=> b!1505570 m!1388071))

(declare-fun m!1388073 () Bool)

(assert (=> b!1505573 m!1388073))

(declare-fun m!1388075 () Bool)

(assert (=> b!1505571 m!1388075))

(assert (=> b!1505571 m!1388075))

(declare-fun m!1388077 () Bool)

(assert (=> b!1505571 m!1388077))

(check-sat (not b!1505570) (not b!1505571) (not b!1505573) (not b!1505574) (not start!128318))
(check-sat)
(get-model)

(declare-fun b!1505620 () Bool)

(declare-fun e!841481 () Bool)

(declare-fun e!841482 () Bool)

(assert (=> b!1505620 (= e!841481 e!841482)))

(declare-fun lt!653829 () (_ BitVec 64))

(assert (=> b!1505620 (= lt!653829 (select (arr!48442 a!2804) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50149 0))(
  ( (Unit!50150) )
))
(declare-fun lt!653827 () Unit!50149)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100390 (_ BitVec 64) (_ BitVec 32)) Unit!50149)

(assert (=> b!1505620 (= lt!653827 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!653829 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100390 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1505620 (arrayContainsKey!0 a!2804 lt!653829 #b00000000000000000000000000000000)))

(declare-fun lt!653828 () Unit!50149)

(assert (=> b!1505620 (= lt!653828 lt!653827)))

(declare-fun res!1026214 () Bool)

(declare-datatypes ((SeekEntryResult!12651 0))(
  ( (MissingZero!12651 (index!52999 (_ BitVec 32))) (Found!12651 (index!53000 (_ BitVec 32))) (Intermediate!12651 (undefined!13463 Bool) (index!53001 (_ BitVec 32)) (x!134720 (_ BitVec 32))) (Undefined!12651) (MissingVacant!12651 (index!53002 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100390 (_ BitVec 32)) SeekEntryResult!12651)

(assert (=> b!1505620 (= res!1026214 (= (seekEntryOrOpen!0 (select (arr!48442 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12651 #b00000000000000000000000000000000)))))

(assert (=> b!1505620 (=> (not res!1026214) (not e!841482))))

(declare-fun b!1505621 () Bool)

(declare-fun call!68168 () Bool)

(assert (=> b!1505621 (= e!841481 call!68168)))

(declare-fun d!157891 () Bool)

(declare-fun res!1026215 () Bool)

(declare-fun e!841480 () Bool)

(assert (=> d!157891 (=> res!1026215 e!841480)))

(assert (=> d!157891 (= res!1026215 (bvsge #b00000000000000000000000000000000 (size!48994 a!2804)))))

(assert (=> d!157891 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!841480)))

(declare-fun bm!68165 () Bool)

(assert (=> bm!68165 (= call!68168 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1505622 () Bool)

(assert (=> b!1505622 (= e!841480 e!841481)))

(declare-fun c!139240 () Bool)

(assert (=> b!1505622 (= c!139240 (validKeyInArray!0 (select (arr!48442 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1505623 () Bool)

(assert (=> b!1505623 (= e!841482 call!68168)))

(assert (= (and d!157891 (not res!1026215)) b!1505622))

(assert (= (and b!1505622 c!139240) b!1505620))

(assert (= (and b!1505622 (not c!139240)) b!1505621))

(assert (= (and b!1505620 res!1026214) b!1505623))

(assert (= (or b!1505623 b!1505621) bm!68165))

(declare-fun m!1388111 () Bool)

(assert (=> b!1505620 m!1388111))

(declare-fun m!1388113 () Bool)

(assert (=> b!1505620 m!1388113))

(declare-fun m!1388115 () Bool)

(assert (=> b!1505620 m!1388115))

(assert (=> b!1505620 m!1388111))

(declare-fun m!1388117 () Bool)

(assert (=> b!1505620 m!1388117))

(declare-fun m!1388119 () Bool)

(assert (=> bm!68165 m!1388119))

(assert (=> b!1505622 m!1388111))

(assert (=> b!1505622 m!1388111))

(declare-fun m!1388121 () Bool)

(assert (=> b!1505622 m!1388121))

(assert (=> b!1505573 d!157891))

(declare-fun d!157893 () Bool)

(assert (=> d!157893 (= (validKeyInArray!0 (select (arr!48442 a!2804) j!70)) (and (not (= (select (arr!48442 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48442 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1505571 d!157893))

(declare-fun d!157895 () Bool)

(assert (=> d!157895 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!128318 d!157895))

(declare-fun d!157901 () Bool)

(assert (=> d!157901 (= (array_inv!37675 a!2804) (bvsge (size!48994 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!128318 d!157901))

(declare-fun d!157903 () Bool)

(assert (=> d!157903 (= (validKeyInArray!0 (select (arr!48442 a!2804) i!961)) (and (not (= (select (arr!48442 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48442 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1505570 d!157903))

(declare-fun d!157905 () Bool)

(declare-fun res!1026235 () Bool)

(declare-fun e!841510 () Bool)

(assert (=> d!157905 (=> res!1026235 e!841510)))

(assert (=> d!157905 (= res!1026235 (bvsge #b00000000000000000000000000000000 (size!48994 a!2804)))))

(assert (=> d!157905 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35000) e!841510)))

(declare-fun b!1505658 () Bool)

(declare-fun e!841509 () Bool)

(declare-fun call!68177 () Bool)

(assert (=> b!1505658 (= e!841509 call!68177)))

(declare-fun b!1505659 () Bool)

(declare-fun e!841511 () Bool)

(assert (=> b!1505659 (= e!841511 e!841509)))

(declare-fun c!139249 () Bool)

(assert (=> b!1505659 (= c!139249 (validKeyInArray!0 (select (arr!48442 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1505660 () Bool)

(assert (=> b!1505660 (= e!841509 call!68177)))

(declare-fun b!1505661 () Bool)

(assert (=> b!1505661 (= e!841510 e!841511)))

(declare-fun res!1026236 () Bool)

(assert (=> b!1505661 (=> (not res!1026236) (not e!841511))))

(declare-fun e!841512 () Bool)

(assert (=> b!1505661 (= res!1026236 (not e!841512))))

(declare-fun res!1026234 () Bool)

(assert (=> b!1505661 (=> (not res!1026234) (not e!841512))))

(assert (=> b!1505661 (= res!1026234 (validKeyInArray!0 (select (arr!48442 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1505662 () Bool)

(declare-fun contains!9926 (List!35003 (_ BitVec 64)) Bool)

(assert (=> b!1505662 (= e!841512 (contains!9926 Nil!35000 (select (arr!48442 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68174 () Bool)

(assert (=> bm!68174 (= call!68177 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139249 (Cons!34999 (select (arr!48442 a!2804) #b00000000000000000000000000000000) Nil!35000) Nil!35000)))))

(assert (= (and d!157905 (not res!1026235)) b!1505661))

(assert (= (and b!1505661 res!1026234) b!1505662))

(assert (= (and b!1505661 res!1026236) b!1505659))

(assert (= (and b!1505659 c!139249) b!1505660))

(assert (= (and b!1505659 (not c!139249)) b!1505658))

(assert (= (or b!1505660 b!1505658) bm!68174))

(assert (=> b!1505659 m!1388111))

(assert (=> b!1505659 m!1388111))

(assert (=> b!1505659 m!1388121))

(assert (=> b!1505661 m!1388111))

(assert (=> b!1505661 m!1388111))

(assert (=> b!1505661 m!1388121))

(assert (=> b!1505662 m!1388111))

(assert (=> b!1505662 m!1388111))

(declare-fun m!1388147 () Bool)

(assert (=> b!1505662 m!1388147))

(assert (=> bm!68174 m!1388111))

(declare-fun m!1388149 () Bool)

(assert (=> bm!68174 m!1388149))

(assert (=> b!1505574 d!157905))

(check-sat (not bm!68174) (not b!1505620) (not b!1505659) (not b!1505622) (not b!1505662) (not bm!68165) (not b!1505661))
(check-sat)
