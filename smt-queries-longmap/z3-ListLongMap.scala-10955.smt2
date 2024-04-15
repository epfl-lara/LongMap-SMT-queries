; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128138 () Bool)

(assert start!128138)

(declare-fun res!1025600 () Bool)

(declare-fun e!841039 () Bool)

(assert (=> start!128138 (=> (not res!1025600) (not e!841039))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128138 (= res!1025600 (validMask!0 mask!2661))))

(assert (=> start!128138 e!841039))

(assert (=> start!128138 true))

(declare-datatypes ((array!100336 0))(
  ( (array!100337 (arr!48421 (Array (_ BitVec 32) (_ BitVec 64))) (size!48973 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100336)

(declare-fun array_inv!37654 (array!100336) Bool)

(assert (=> start!128138 (array_inv!37654 a!2850)))

(declare-fun b!1504802 () Bool)

(declare-fun res!1025605 () Bool)

(assert (=> b!1504802 (=> (not res!1025605) (not e!841039))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100336 (_ BitVec 32)) Bool)

(assert (=> b!1504802 (= res!1025605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1504803 () Bool)

(declare-fun res!1025602 () Bool)

(declare-fun e!841040 () Bool)

(assert (=> b!1504803 (=> (not res!1025602) (not e!841040))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1504803 (= res!1025602 (not (= (select (arr!48421 a!2850) index!625) (select (arr!48421 a!2850) j!87))))))

(declare-fun b!1504804 () Bool)

(declare-fun res!1025604 () Bool)

(assert (=> b!1504804 (=> (not res!1025604) (not e!841039))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1504804 (= res!1025604 (validKeyInArray!0 (select (arr!48421 a!2850) i!996)))))

(declare-fun e!841038 () Bool)

(declare-fun lt!653613 () (_ BitVec 64))

(declare-fun lt!653616 () array!100336)

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun b!1504805 () Bool)

(declare-datatypes ((SeekEntryResult!12640 0))(
  ( (MissingZero!12640 (index!52952 (_ BitVec 32))) (Found!12640 (index!52953 (_ BitVec 32))) (Intermediate!12640 (undefined!13452 Bool) (index!52954 (_ BitVec 32)) (x!134644 (_ BitVec 32))) (Undefined!12640) (MissingVacant!12640 (index!52955 (_ BitVec 32))) )
))
(declare-fun lt!653614 () SeekEntryResult!12640)

(declare-fun x!647 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100336 (_ BitVec 32)) SeekEntryResult!12640)

(assert (=> b!1504805 (= e!841038 (not (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantAfter!10 lt!653613 lt!653616 mask!2661) lt!653614)))))

(declare-fun lt!653615 () (_ BitVec 32))

(assert (=> b!1504805 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653615 vacantAfter!10 lt!653613 lt!653616 mask!2661) lt!653614)))

(assert (=> b!1504805 (= lt!653613 (select (store (arr!48421 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-datatypes ((Unit!50125 0))(
  ( (Unit!50126) )
))
(declare-fun lt!653612 () Unit!50125)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100336 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50125)

(assert (=> b!1504805 (= lt!653612 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653615 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1504806 () Bool)

(declare-fun res!1025606 () Bool)

(assert (=> b!1504806 (=> (not res!1025606) (not e!841039))))

(assert (=> b!1504806 (= res!1025606 (and (= (size!48973 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48973 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48973 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1504807 () Bool)

(declare-fun res!1025598 () Bool)

(assert (=> b!1504807 (=> (not res!1025598) (not e!841039))))

(assert (=> b!1504807 (= res!1025598 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48973 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48973 a!2850)) (= (select (arr!48421 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1504808 () Bool)

(assert (=> b!1504808 (= e!841040 e!841038)))

(declare-fun res!1025607 () Bool)

(assert (=> b!1504808 (=> (not res!1025607) (not e!841038))))

(assert (=> b!1504808 (= res!1025607 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653615 #b00000000000000000000000000000000) (bvslt lt!653615 (size!48973 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1504808 (= lt!653615 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1504809 () Bool)

(declare-fun res!1025608 () Bool)

(assert (=> b!1504809 (=> (not res!1025608) (not e!841039))))

(declare-datatypes ((List!34991 0))(
  ( (Nil!34988) (Cons!34987 (h!36385 (_ BitVec 64)) (t!49677 List!34991)) )
))
(declare-fun arrayNoDuplicates!0 (array!100336 (_ BitVec 32) List!34991) Bool)

(assert (=> b!1504809 (= res!1025608 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34988))))

(declare-fun b!1504810 () Bool)

(declare-fun res!1025599 () Bool)

(assert (=> b!1504810 (=> (not res!1025599) (not e!841038))))

(assert (=> b!1504810 (= res!1025599 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653615 vacantBefore!10 (select (arr!48421 a!2850) j!87) a!2850 mask!2661) lt!653614))))

(declare-fun b!1504811 () Bool)

(declare-fun res!1025603 () Bool)

(assert (=> b!1504811 (=> (not res!1025603) (not e!841039))))

(assert (=> b!1504811 (= res!1025603 (validKeyInArray!0 (select (arr!48421 a!2850) j!87)))))

(declare-fun b!1504812 () Bool)

(declare-fun e!841037 () Bool)

(assert (=> b!1504812 (= e!841039 e!841037)))

(declare-fun res!1025601 () Bool)

(assert (=> b!1504812 (=> (not res!1025601) (not e!841037))))

(assert (=> b!1504812 (= res!1025601 (and (= (select (store (arr!48421 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48973 a!2850))))))

(assert (=> b!1504812 (= lt!653616 (array!100337 (store (arr!48421 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48973 a!2850)))))

(declare-fun b!1504813 () Bool)

(assert (=> b!1504813 (= e!841037 e!841040)))

(declare-fun res!1025609 () Bool)

(assert (=> b!1504813 (=> (not res!1025609) (not e!841040))))

(assert (=> b!1504813 (= res!1025609 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48421 a!2850) j!87) a!2850 mask!2661) lt!653614))))

(assert (=> b!1504813 (= lt!653614 (Found!12640 j!87))))

(assert (= (and start!128138 res!1025600) b!1504806))

(assert (= (and b!1504806 res!1025606) b!1504804))

(assert (= (and b!1504804 res!1025604) b!1504811))

(assert (= (and b!1504811 res!1025603) b!1504802))

(assert (= (and b!1504802 res!1025605) b!1504809))

(assert (= (and b!1504809 res!1025608) b!1504807))

(assert (= (and b!1504807 res!1025598) b!1504812))

(assert (= (and b!1504812 res!1025601) b!1504813))

(assert (= (and b!1504813 res!1025609) b!1504803))

(assert (= (and b!1504803 res!1025602) b!1504808))

(assert (= (and b!1504808 res!1025607) b!1504810))

(assert (= (and b!1504810 res!1025599) b!1504805))

(declare-fun m!1387349 () Bool)

(assert (=> b!1504811 m!1387349))

(assert (=> b!1504811 m!1387349))

(declare-fun m!1387351 () Bool)

(assert (=> b!1504811 m!1387351))

(declare-fun m!1387353 () Bool)

(assert (=> b!1504808 m!1387353))

(declare-fun m!1387355 () Bool)

(assert (=> b!1504804 m!1387355))

(assert (=> b!1504804 m!1387355))

(declare-fun m!1387357 () Bool)

(assert (=> b!1504804 m!1387357))

(declare-fun m!1387359 () Bool)

(assert (=> b!1504802 m!1387359))

(assert (=> b!1504810 m!1387349))

(assert (=> b!1504810 m!1387349))

(declare-fun m!1387361 () Bool)

(assert (=> b!1504810 m!1387361))

(declare-fun m!1387363 () Bool)

(assert (=> b!1504805 m!1387363))

(declare-fun m!1387365 () Bool)

(assert (=> b!1504805 m!1387365))

(declare-fun m!1387367 () Bool)

(assert (=> b!1504805 m!1387367))

(declare-fun m!1387369 () Bool)

(assert (=> b!1504805 m!1387369))

(declare-fun m!1387371 () Bool)

(assert (=> b!1504805 m!1387371))

(declare-fun m!1387373 () Bool)

(assert (=> b!1504807 m!1387373))

(declare-fun m!1387375 () Bool)

(assert (=> b!1504809 m!1387375))

(declare-fun m!1387377 () Bool)

(assert (=> b!1504803 m!1387377))

(assert (=> b!1504803 m!1387349))

(declare-fun m!1387379 () Bool)

(assert (=> start!128138 m!1387379))

(declare-fun m!1387381 () Bool)

(assert (=> start!128138 m!1387381))

(assert (=> b!1504813 m!1387349))

(assert (=> b!1504813 m!1387349))

(declare-fun m!1387383 () Bool)

(assert (=> b!1504813 m!1387383))

(assert (=> b!1504812 m!1387369))

(declare-fun m!1387385 () Bool)

(assert (=> b!1504812 m!1387385))

(check-sat (not b!1504809) (not b!1504811) (not b!1504805) (not b!1504810) (not b!1504804) (not b!1504802) (not b!1504813) (not start!128138) (not b!1504808))
(check-sat)
(get-model)

(declare-fun d!157691 () Bool)

(assert (=> d!157691 (= (validKeyInArray!0 (select (arr!48421 a!2850) j!87)) (and (not (= (select (arr!48421 a!2850) j!87) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48421 a!2850) j!87) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1504811 d!157691))

(declare-fun b!1504898 () Bool)

(declare-fun e!841079 () SeekEntryResult!12640)

(assert (=> b!1504898 (= e!841079 (Found!12640 lt!653615))))

(declare-fun b!1504899 () Bool)

(declare-fun e!841080 () SeekEntryResult!12640)

(assert (=> b!1504899 (= e!841080 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647 #b00000000000000000000000000000001) (nextIndex!0 lt!653615 (bvadd #b00000000000000000000000000000001 x!647) mask!2661) vacantBefore!10 (select (arr!48421 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1504900 () Bool)

(declare-fun c!139145 () Bool)

(declare-fun lt!653651 () (_ BitVec 64))

(assert (=> b!1504900 (= c!139145 (= lt!653651 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1504900 (= e!841079 e!841080)))

(declare-fun b!1504901 () Bool)

(declare-fun e!841078 () SeekEntryResult!12640)

(assert (=> b!1504901 (= e!841078 e!841079)))

(declare-fun c!139147 () Bool)

(assert (=> b!1504901 (= c!139147 (= lt!653651 (select (arr!48421 a!2850) j!87)))))

(declare-fun d!157693 () Bool)

(declare-fun lt!653652 () SeekEntryResult!12640)

(get-info :version)

(assert (=> d!157693 (and (or ((_ is Undefined!12640) lt!653652) (not ((_ is Found!12640) lt!653652)) (and (bvsge (index!52953 lt!653652) #b00000000000000000000000000000000) (bvslt (index!52953 lt!653652) (size!48973 a!2850)))) (or ((_ is Undefined!12640) lt!653652) ((_ is Found!12640) lt!653652) (not ((_ is MissingVacant!12640) lt!653652)) (not (= (index!52955 lt!653652) vacantBefore!10)) (and (bvsge (index!52955 lt!653652) #b00000000000000000000000000000000) (bvslt (index!52955 lt!653652) (size!48973 a!2850)))) (or ((_ is Undefined!12640) lt!653652) (ite ((_ is Found!12640) lt!653652) (= (select (arr!48421 a!2850) (index!52953 lt!653652)) (select (arr!48421 a!2850) j!87)) (and ((_ is MissingVacant!12640) lt!653652) (= (index!52955 lt!653652) vacantBefore!10) (= (select (arr!48421 a!2850) (index!52955 lt!653652)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157693 (= lt!653652 e!841078)))

(declare-fun c!139146 () Bool)

(assert (=> d!157693 (= c!139146 (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110))))

(assert (=> d!157693 (= lt!653651 (select (arr!48421 a!2850) lt!653615))))

(assert (=> d!157693 (validMask!0 mask!2661)))

(assert (=> d!157693 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653615 vacantBefore!10 (select (arr!48421 a!2850) j!87) a!2850 mask!2661) lt!653652)))

(declare-fun b!1504902 () Bool)

(assert (=> b!1504902 (= e!841080 (MissingVacant!12640 vacantBefore!10))))

(declare-fun b!1504903 () Bool)

(assert (=> b!1504903 (= e!841078 Undefined!12640)))

(assert (= (and d!157693 c!139146) b!1504903))

(assert (= (and d!157693 (not c!139146)) b!1504901))

(assert (= (and b!1504901 c!139147) b!1504898))

(assert (= (and b!1504901 (not c!139147)) b!1504900))

(assert (= (and b!1504900 c!139145) b!1504902))

(assert (= (and b!1504900 (not c!139145)) b!1504899))

(declare-fun m!1387463 () Bool)

(assert (=> b!1504899 m!1387463))

(assert (=> b!1504899 m!1387463))

(assert (=> b!1504899 m!1387349))

(declare-fun m!1387465 () Bool)

(assert (=> b!1504899 m!1387465))

(declare-fun m!1387467 () Bool)

(assert (=> d!157693 m!1387467))

(declare-fun m!1387469 () Bool)

(assert (=> d!157693 m!1387469))

(declare-fun m!1387471 () Bool)

(assert (=> d!157693 m!1387471))

(assert (=> d!157693 m!1387379))

(assert (=> b!1504810 d!157693))

(declare-fun b!1504904 () Bool)

(declare-fun e!841082 () SeekEntryResult!12640)

(assert (=> b!1504904 (= e!841082 (Found!12640 index!625))))

(declare-fun e!841083 () SeekEntryResult!12640)

(declare-fun b!1504905 () Bool)

(assert (=> b!1504905 (= e!841083 (seekKeyOrZeroReturnVacant!0 (bvadd x!647 #b00000000000000000000000000000001) (nextIndex!0 index!625 x!647 mask!2661) vacantAfter!10 lt!653613 lt!653616 mask!2661))))

(declare-fun b!1504906 () Bool)

(declare-fun c!139148 () Bool)

(declare-fun lt!653653 () (_ BitVec 64))

(assert (=> b!1504906 (= c!139148 (= lt!653653 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1504906 (= e!841082 e!841083)))

(declare-fun b!1504907 () Bool)

(declare-fun e!841081 () SeekEntryResult!12640)

(assert (=> b!1504907 (= e!841081 e!841082)))

(declare-fun c!139150 () Bool)

(assert (=> b!1504907 (= c!139150 (= lt!653653 lt!653613))))

(declare-fun lt!653654 () SeekEntryResult!12640)

(declare-fun d!157695 () Bool)

(assert (=> d!157695 (and (or ((_ is Undefined!12640) lt!653654) (not ((_ is Found!12640) lt!653654)) (and (bvsge (index!52953 lt!653654) #b00000000000000000000000000000000) (bvslt (index!52953 lt!653654) (size!48973 lt!653616)))) (or ((_ is Undefined!12640) lt!653654) ((_ is Found!12640) lt!653654) (not ((_ is MissingVacant!12640) lt!653654)) (not (= (index!52955 lt!653654) vacantAfter!10)) (and (bvsge (index!52955 lt!653654) #b00000000000000000000000000000000) (bvslt (index!52955 lt!653654) (size!48973 lt!653616)))) (or ((_ is Undefined!12640) lt!653654) (ite ((_ is Found!12640) lt!653654) (= (select (arr!48421 lt!653616) (index!52953 lt!653654)) lt!653613) (and ((_ is MissingVacant!12640) lt!653654) (= (index!52955 lt!653654) vacantAfter!10) (= (select (arr!48421 lt!653616) (index!52955 lt!653654)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157695 (= lt!653654 e!841081)))

(declare-fun c!139149 () Bool)

(assert (=> d!157695 (= c!139149 (bvsge x!647 #b01111111111111111111111111111110))))

(assert (=> d!157695 (= lt!653653 (select (arr!48421 lt!653616) index!625))))

(assert (=> d!157695 (validMask!0 mask!2661)))

(assert (=> d!157695 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantAfter!10 lt!653613 lt!653616 mask!2661) lt!653654)))

(declare-fun b!1504908 () Bool)

(assert (=> b!1504908 (= e!841083 (MissingVacant!12640 vacantAfter!10))))

(declare-fun b!1504909 () Bool)

(assert (=> b!1504909 (= e!841081 Undefined!12640)))

(assert (= (and d!157695 c!139149) b!1504909))

(assert (= (and d!157695 (not c!139149)) b!1504907))

(assert (= (and b!1504907 c!139150) b!1504904))

(assert (= (and b!1504907 (not c!139150)) b!1504906))

(assert (= (and b!1504906 c!139148) b!1504908))

(assert (= (and b!1504906 (not c!139148)) b!1504905))

(assert (=> b!1504905 m!1387353))

(assert (=> b!1504905 m!1387353))

(declare-fun m!1387473 () Bool)

(assert (=> b!1504905 m!1387473))

(declare-fun m!1387475 () Bool)

(assert (=> d!157695 m!1387475))

(declare-fun m!1387477 () Bool)

(assert (=> d!157695 m!1387477))

(declare-fun m!1387479 () Bool)

(assert (=> d!157695 m!1387479))

(assert (=> d!157695 m!1387379))

(assert (=> b!1504805 d!157695))

(declare-fun b!1504910 () Bool)

(declare-fun e!841085 () SeekEntryResult!12640)

(assert (=> b!1504910 (= e!841085 (Found!12640 lt!653615))))

(declare-fun e!841086 () SeekEntryResult!12640)

(declare-fun b!1504911 () Bool)

(assert (=> b!1504911 (= e!841086 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647 #b00000000000000000000000000000001) (nextIndex!0 lt!653615 (bvadd #b00000000000000000000000000000001 x!647) mask!2661) vacantAfter!10 lt!653613 lt!653616 mask!2661))))

(declare-fun b!1504912 () Bool)

(declare-fun c!139151 () Bool)

(declare-fun lt!653655 () (_ BitVec 64))

(assert (=> b!1504912 (= c!139151 (= lt!653655 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1504912 (= e!841085 e!841086)))

(declare-fun b!1504913 () Bool)

(declare-fun e!841084 () SeekEntryResult!12640)

(assert (=> b!1504913 (= e!841084 e!841085)))

(declare-fun c!139153 () Bool)

(assert (=> b!1504913 (= c!139153 (= lt!653655 lt!653613))))

(declare-fun lt!653656 () SeekEntryResult!12640)

(declare-fun d!157697 () Bool)

(assert (=> d!157697 (and (or ((_ is Undefined!12640) lt!653656) (not ((_ is Found!12640) lt!653656)) (and (bvsge (index!52953 lt!653656) #b00000000000000000000000000000000) (bvslt (index!52953 lt!653656) (size!48973 lt!653616)))) (or ((_ is Undefined!12640) lt!653656) ((_ is Found!12640) lt!653656) (not ((_ is MissingVacant!12640) lt!653656)) (not (= (index!52955 lt!653656) vacantAfter!10)) (and (bvsge (index!52955 lt!653656) #b00000000000000000000000000000000) (bvslt (index!52955 lt!653656) (size!48973 lt!653616)))) (or ((_ is Undefined!12640) lt!653656) (ite ((_ is Found!12640) lt!653656) (= (select (arr!48421 lt!653616) (index!52953 lt!653656)) lt!653613) (and ((_ is MissingVacant!12640) lt!653656) (= (index!52955 lt!653656) vacantAfter!10) (= (select (arr!48421 lt!653616) (index!52955 lt!653656)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157697 (= lt!653656 e!841084)))

(declare-fun c!139152 () Bool)

(assert (=> d!157697 (= c!139152 (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110))))

(assert (=> d!157697 (= lt!653655 (select (arr!48421 lt!653616) lt!653615))))

(assert (=> d!157697 (validMask!0 mask!2661)))

(assert (=> d!157697 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653615 vacantAfter!10 lt!653613 lt!653616 mask!2661) lt!653656)))

(declare-fun b!1504914 () Bool)

(assert (=> b!1504914 (= e!841086 (MissingVacant!12640 vacantAfter!10))))

(declare-fun b!1504915 () Bool)

(assert (=> b!1504915 (= e!841084 Undefined!12640)))

(assert (= (and d!157697 c!139152) b!1504915))

(assert (= (and d!157697 (not c!139152)) b!1504913))

(assert (= (and b!1504913 c!139153) b!1504910))

(assert (= (and b!1504913 (not c!139153)) b!1504912))

(assert (= (and b!1504912 c!139151) b!1504914))

(assert (= (and b!1504912 (not c!139151)) b!1504911))

(assert (=> b!1504911 m!1387463))

(assert (=> b!1504911 m!1387463))

(declare-fun m!1387481 () Bool)

(assert (=> b!1504911 m!1387481))

(declare-fun m!1387483 () Bool)

(assert (=> d!157697 m!1387483))

(declare-fun m!1387485 () Bool)

(assert (=> d!157697 m!1387485))

(declare-fun m!1387487 () Bool)

(assert (=> d!157697 m!1387487))

(assert (=> d!157697 m!1387379))

(assert (=> b!1504805 d!157697))

(declare-fun d!157699 () Bool)

(declare-fun e!841089 () Bool)

(assert (=> d!157699 e!841089))

(declare-fun res!1025684 () Bool)

(assert (=> d!157699 (=> (not res!1025684) (not e!841089))))

(assert (=> d!157699 (= res!1025684 (and (or (bvslt i!996 #b00000000000000000000000000000000) (bvsge i!996 (size!48973 a!2850)) (and (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48973 a!2850)))) (or (bvslt i!996 #b00000000000000000000000000000000) (bvsge i!996 (size!48973 a!2850)) (and (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48973 a!2850)))) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48973 a!2850))))))

(declare-fun lt!653659 () Unit!50125)

(declare-fun choose!27 (array!100336 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50125)

(assert (=> d!157699 (= lt!653659 (choose!27 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653615 vacantBefore!10 vacantAfter!10 mask!2661))))

(assert (=> d!157699 (validMask!0 mask!2661)))

(assert (=> d!157699 (= (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653615 vacantBefore!10 vacantAfter!10 mask!2661) lt!653659)))

(declare-fun b!1504918 () Bool)

(assert (=> b!1504918 (= e!841089 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653615 vacantAfter!10 (select (store (arr!48421 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100337 (store (arr!48421 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48973 a!2850)) mask!2661) (Found!12640 j!87)))))

(assert (= (and d!157699 res!1025684) b!1504918))

(declare-fun m!1387489 () Bool)

(assert (=> d!157699 m!1387489))

(assert (=> d!157699 m!1387379))

(assert (=> b!1504918 m!1387369))

(assert (=> b!1504918 m!1387363))

(assert (=> b!1504918 m!1387363))

(declare-fun m!1387491 () Bool)

(assert (=> b!1504918 m!1387491))

(assert (=> b!1504805 d!157699))

(declare-fun d!157701 () Bool)

(assert (=> d!157701 (= (validMask!0 mask!2661) (and (or (= mask!2661 #b00000000000000000000000000000111) (= mask!2661 #b00000000000000000000000000001111) (= mask!2661 #b00000000000000000000000000011111) (= mask!2661 #b00000000000000000000000000111111) (= mask!2661 #b00000000000000000000000001111111) (= mask!2661 #b00000000000000000000000011111111) (= mask!2661 #b00000000000000000000000111111111) (= mask!2661 #b00000000000000000000001111111111) (= mask!2661 #b00000000000000000000011111111111) (= mask!2661 #b00000000000000000000111111111111) (= mask!2661 #b00000000000000000001111111111111) (= mask!2661 #b00000000000000000011111111111111) (= mask!2661 #b00000000000000000111111111111111) (= mask!2661 #b00000000000000001111111111111111) (= mask!2661 #b00000000000000011111111111111111) (= mask!2661 #b00000000000000111111111111111111) (= mask!2661 #b00000000000001111111111111111111) (= mask!2661 #b00000000000011111111111111111111) (= mask!2661 #b00000000000111111111111111111111) (= mask!2661 #b00000000001111111111111111111111) (= mask!2661 #b00000000011111111111111111111111) (= mask!2661 #b00000000111111111111111111111111) (= mask!2661 #b00000001111111111111111111111111) (= mask!2661 #b00000011111111111111111111111111) (= mask!2661 #b00000111111111111111111111111111) (= mask!2661 #b00001111111111111111111111111111) (= mask!2661 #b00011111111111111111111111111111) (= mask!2661 #b00111111111111111111111111111111)) (bvsle mask!2661 #b00111111111111111111111111111111)))))

(assert (=> start!128138 d!157701))

(declare-fun d!157705 () Bool)

(assert (=> d!157705 (= (array_inv!37654 a!2850) (bvsge (size!48973 a!2850) #b00000000000000000000000000000000))))

(assert (=> start!128138 d!157705))

(declare-fun d!157709 () Bool)

(declare-fun lt!653671 () (_ BitVec 32))

(assert (=> d!157709 (and (bvsge lt!653671 #b00000000000000000000000000000000) (bvslt lt!653671 (bvadd mask!2661 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!157709 (= lt!653671 (choose!52 index!625 x!647 mask!2661))))

(assert (=> d!157709 (validMask!0 mask!2661)))

(assert (=> d!157709 (= (nextIndex!0 index!625 x!647 mask!2661) lt!653671)))

(declare-fun bs!43173 () Bool)

(assert (= bs!43173 d!157709))

(declare-fun m!1387505 () Bool)

(assert (=> bs!43173 m!1387505))

(assert (=> bs!43173 m!1387379))

(assert (=> b!1504808 d!157709))

(declare-fun b!1504939 () Bool)

(declare-fun e!841106 () Bool)

(declare-fun call!68126 () Bool)

(assert (=> b!1504939 (= e!841106 call!68126)))

(declare-fun b!1504940 () Bool)

(declare-fun e!841107 () Bool)

(assert (=> b!1504940 (= e!841107 call!68126)))

(declare-fun bm!68123 () Bool)

(assert (=> bm!68123 (= call!68126 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2850 mask!2661))))

(declare-fun d!157715 () Bool)

(declare-fun res!1025696 () Bool)

(declare-fun e!841105 () Bool)

(assert (=> d!157715 (=> res!1025696 e!841105)))

(assert (=> d!157715 (= res!1025696 (bvsge #b00000000000000000000000000000000 (size!48973 a!2850)))))

(assert (=> d!157715 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661) e!841105)))

(declare-fun b!1504941 () Bool)

(assert (=> b!1504941 (= e!841105 e!841106)))

(declare-fun c!139159 () Bool)

(assert (=> b!1504941 (= c!139159 (validKeyInArray!0 (select (arr!48421 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1504942 () Bool)

(assert (=> b!1504942 (= e!841106 e!841107)))

(declare-fun lt!653680 () (_ BitVec 64))

(assert (=> b!1504942 (= lt!653680 (select (arr!48421 a!2850) #b00000000000000000000000000000000))))

(declare-fun lt!653679 () Unit!50125)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100336 (_ BitVec 64) (_ BitVec 32)) Unit!50125)

(assert (=> b!1504942 (= lt!653679 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2850 lt!653680 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100336 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1504942 (arrayContainsKey!0 a!2850 lt!653680 #b00000000000000000000000000000000)))

(declare-fun lt!653678 () Unit!50125)

(assert (=> b!1504942 (= lt!653678 lt!653679)))

(declare-fun res!1025695 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100336 (_ BitVec 32)) SeekEntryResult!12640)

(assert (=> b!1504942 (= res!1025695 (= (seekEntryOrOpen!0 (select (arr!48421 a!2850) #b00000000000000000000000000000000) a!2850 mask!2661) (Found!12640 #b00000000000000000000000000000000)))))

(assert (=> b!1504942 (=> (not res!1025695) (not e!841107))))

(assert (= (and d!157715 (not res!1025696)) b!1504941))

(assert (= (and b!1504941 c!139159) b!1504942))

(assert (= (and b!1504941 (not c!139159)) b!1504939))

(assert (= (and b!1504942 res!1025695) b!1504940))

(assert (= (or b!1504940 b!1504939) bm!68123))

(declare-fun m!1387507 () Bool)

(assert (=> bm!68123 m!1387507))

(declare-fun m!1387509 () Bool)

(assert (=> b!1504941 m!1387509))

(assert (=> b!1504941 m!1387509))

(declare-fun m!1387511 () Bool)

(assert (=> b!1504941 m!1387511))

(assert (=> b!1504942 m!1387509))

(declare-fun m!1387513 () Bool)

(assert (=> b!1504942 m!1387513))

(declare-fun m!1387515 () Bool)

(assert (=> b!1504942 m!1387515))

(assert (=> b!1504942 m!1387509))

(declare-fun m!1387517 () Bool)

(assert (=> b!1504942 m!1387517))

(assert (=> b!1504802 d!157715))

(declare-fun b!1504955 () Bool)

(declare-fun e!841115 () SeekEntryResult!12640)

(assert (=> b!1504955 (= e!841115 (Found!12640 index!625))))

(declare-fun b!1504956 () Bool)

(declare-fun e!841116 () SeekEntryResult!12640)

(assert (=> b!1504956 (= e!841116 (seekKeyOrZeroReturnVacant!0 (bvadd x!647 #b00000000000000000000000000000001) (nextIndex!0 index!625 x!647 mask!2661) vacantBefore!10 (select (arr!48421 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1504957 () Bool)

(declare-fun c!139166 () Bool)

(declare-fun lt!653685 () (_ BitVec 64))

(assert (=> b!1504957 (= c!139166 (= lt!653685 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1504957 (= e!841115 e!841116)))

(declare-fun b!1504958 () Bool)

(declare-fun e!841114 () SeekEntryResult!12640)

(assert (=> b!1504958 (= e!841114 e!841115)))

(declare-fun c!139168 () Bool)

(assert (=> b!1504958 (= c!139168 (= lt!653685 (select (arr!48421 a!2850) j!87)))))

(declare-fun d!157717 () Bool)

(declare-fun lt!653686 () SeekEntryResult!12640)

(assert (=> d!157717 (and (or ((_ is Undefined!12640) lt!653686) (not ((_ is Found!12640) lt!653686)) (and (bvsge (index!52953 lt!653686) #b00000000000000000000000000000000) (bvslt (index!52953 lt!653686) (size!48973 a!2850)))) (or ((_ is Undefined!12640) lt!653686) ((_ is Found!12640) lt!653686) (not ((_ is MissingVacant!12640) lt!653686)) (not (= (index!52955 lt!653686) vacantBefore!10)) (and (bvsge (index!52955 lt!653686) #b00000000000000000000000000000000) (bvslt (index!52955 lt!653686) (size!48973 a!2850)))) (or ((_ is Undefined!12640) lt!653686) (ite ((_ is Found!12640) lt!653686) (= (select (arr!48421 a!2850) (index!52953 lt!653686)) (select (arr!48421 a!2850) j!87)) (and ((_ is MissingVacant!12640) lt!653686) (= (index!52955 lt!653686) vacantBefore!10) (= (select (arr!48421 a!2850) (index!52955 lt!653686)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157717 (= lt!653686 e!841114)))

(declare-fun c!139167 () Bool)

(assert (=> d!157717 (= c!139167 (bvsge x!647 #b01111111111111111111111111111110))))

(assert (=> d!157717 (= lt!653685 (select (arr!48421 a!2850) index!625))))

(assert (=> d!157717 (validMask!0 mask!2661)))

(assert (=> d!157717 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48421 a!2850) j!87) a!2850 mask!2661) lt!653686)))

(declare-fun b!1504959 () Bool)

(assert (=> b!1504959 (= e!841116 (MissingVacant!12640 vacantBefore!10))))

(declare-fun b!1504960 () Bool)

(assert (=> b!1504960 (= e!841114 Undefined!12640)))

(assert (= (and d!157717 c!139167) b!1504960))

(assert (= (and d!157717 (not c!139167)) b!1504958))

(assert (= (and b!1504958 c!139168) b!1504955))

(assert (= (and b!1504958 (not c!139168)) b!1504957))

(assert (= (and b!1504957 c!139166) b!1504959))

(assert (= (and b!1504957 (not c!139166)) b!1504956))

(assert (=> b!1504956 m!1387353))

(assert (=> b!1504956 m!1387353))

(assert (=> b!1504956 m!1387349))

(declare-fun m!1387519 () Bool)

(assert (=> b!1504956 m!1387519))

(declare-fun m!1387521 () Bool)

(assert (=> d!157717 m!1387521))

(declare-fun m!1387523 () Bool)

(assert (=> d!157717 m!1387523))

(assert (=> d!157717 m!1387377))

(assert (=> d!157717 m!1387379))

(assert (=> b!1504813 d!157717))

(declare-fun d!157719 () Bool)

(assert (=> d!157719 (= (validKeyInArray!0 (select (arr!48421 a!2850) i!996)) (and (not (= (select (arr!48421 a!2850) i!996) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48421 a!2850) i!996) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1504804 d!157719))

(declare-fun b!1505001 () Bool)

(declare-fun e!841140 () Bool)

(declare-fun e!841142 () Bool)

(assert (=> b!1505001 (= e!841140 e!841142)))

(declare-fun c!139186 () Bool)

(assert (=> b!1505001 (= c!139186 (validKeyInArray!0 (select (arr!48421 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1505002 () Bool)

(declare-fun e!841141 () Bool)

(declare-fun contains!9918 (List!34991 (_ BitVec 64)) Bool)

(assert (=> b!1505002 (= e!841141 (contains!9918 Nil!34988 (select (arr!48421 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1505003 () Bool)

(declare-fun call!68129 () Bool)

(assert (=> b!1505003 (= e!841142 call!68129)))

(declare-fun bm!68126 () Bool)

(assert (=> bm!68126 (= call!68129 (arrayNoDuplicates!0 a!2850 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139186 (Cons!34987 (select (arr!48421 a!2850) #b00000000000000000000000000000000) Nil!34988) Nil!34988)))))

(declare-fun d!157721 () Bool)

(declare-fun res!1025703 () Bool)

(declare-fun e!841143 () Bool)

(assert (=> d!157721 (=> res!1025703 e!841143)))

(assert (=> d!157721 (= res!1025703 (bvsge #b00000000000000000000000000000000 (size!48973 a!2850)))))

(assert (=> d!157721 (= (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34988) e!841143)))

(declare-fun b!1505004 () Bool)

(assert (=> b!1505004 (= e!841143 e!841140)))

(declare-fun res!1025704 () Bool)

(assert (=> b!1505004 (=> (not res!1025704) (not e!841140))))

(assert (=> b!1505004 (= res!1025704 (not e!841141))))

(declare-fun res!1025705 () Bool)

(assert (=> b!1505004 (=> (not res!1025705) (not e!841141))))

(assert (=> b!1505004 (= res!1025705 (validKeyInArray!0 (select (arr!48421 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1505005 () Bool)

(assert (=> b!1505005 (= e!841142 call!68129)))

(assert (= (and d!157721 (not res!1025703)) b!1505004))

(assert (= (and b!1505004 res!1025705) b!1505002))

(assert (= (and b!1505004 res!1025704) b!1505001))

(assert (= (and b!1505001 c!139186) b!1505005))

(assert (= (and b!1505001 (not c!139186)) b!1505003))

(assert (= (or b!1505005 b!1505003) bm!68126))

(assert (=> b!1505001 m!1387509))

(assert (=> b!1505001 m!1387509))

(assert (=> b!1505001 m!1387511))

(assert (=> b!1505002 m!1387509))

(assert (=> b!1505002 m!1387509))

(declare-fun m!1387553 () Bool)

(assert (=> b!1505002 m!1387553))

(assert (=> bm!68126 m!1387509))

(declare-fun m!1387555 () Bool)

(assert (=> bm!68126 m!1387555))

(assert (=> b!1505004 m!1387509))

(assert (=> b!1505004 m!1387509))

(assert (=> b!1505004 m!1387511))

(assert (=> b!1504809 d!157721))

(check-sat (not d!157699) (not b!1504956) (not b!1504899) (not d!157717) (not b!1504918) (not b!1504942) (not b!1505002) (not d!157697) (not d!157709) (not b!1505001) (not b!1504941) (not bm!68123) (not b!1505004) (not b!1504911) (not d!157693) (not d!157695) (not bm!68126) (not b!1504905))
(check-sat)
