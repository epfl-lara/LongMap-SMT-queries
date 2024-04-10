; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127200 () Bool)

(assert start!127200)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12399 0))(
  ( (MissingZero!12399 (index!51988 (_ BitVec 32))) (Found!12399 (index!51989 (_ BitVec 32))) (Intermediate!12399 (undefined!13211 Bool) (index!51990 (_ BitVec 32)) (x!133595 (_ BitVec 32))) (Undefined!12399) (MissingVacant!12399 (index!51991 (_ BitVec 32))) )
))
(declare-fun lt!651606 () SeekEntryResult!12399)

(declare-datatypes ((array!99784 0))(
  ( (array!99785 (arr!48159 (Array (_ BitVec 32) (_ BitVec 64))) (size!48709 (_ BitVec 32))) )
))
(declare-fun lt!651607 () array!99784)

(declare-fun b!1495074 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!837426 () Bool)

(declare-fun lt!651604 () (_ BitVec 32))

(declare-fun lt!651608 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99784 (_ BitVec 32)) SeekEntryResult!12399)

(assert (=> b!1495074 (= e!837426 (= lt!651606 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651604 lt!651608 lt!651607 mask!2687)))))

(declare-fun b!1495075 () Bool)

(declare-fun res!1017137 () Bool)

(declare-fun e!837425 () Bool)

(assert (=> b!1495075 (=> (not res!1017137) (not e!837425))))

(declare-fun a!2862 () array!99784)

(declare-datatypes ((List!34660 0))(
  ( (Nil!34657) (Cons!34656 (h!36048 (_ BitVec 64)) (t!49354 List!34660)) )
))
(declare-fun arrayNoDuplicates!0 (array!99784 (_ BitVec 32) List!34660) Bool)

(assert (=> b!1495075 (= res!1017137 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34657))))

(declare-fun b!1495076 () Bool)

(declare-fun e!837422 () Bool)

(assert (=> b!1495076 (= e!837422 e!837426)))

(declare-fun c!138506 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1495076 (= c!138506 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun res!1017134 () Bool)

(assert (=> start!127200 (=> (not res!1017134) (not e!837425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127200 (= res!1017134 (validMask!0 mask!2687))))

(assert (=> start!127200 e!837425))

(assert (=> start!127200 true))

(declare-fun array_inv!37187 (array!99784) Bool)

(assert (=> start!127200 (array_inv!37187 a!2862)))

(declare-fun b!1495077 () Bool)

(declare-fun res!1017127 () Bool)

(assert (=> b!1495077 (=> (not res!1017127) (not e!837425))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99784 (_ BitVec 32)) Bool)

(assert (=> b!1495077 (= res!1017127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1495078 () Bool)

(declare-fun res!1017125 () Bool)

(declare-fun e!837423 () Bool)

(assert (=> b!1495078 (=> (not res!1017125) (not e!837423))))

(declare-fun lt!651605 () SeekEntryResult!12399)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1495078 (= res!1017125 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48159 a!2862) j!93) a!2862 mask!2687) lt!651605))))

(declare-fun b!1495079 () Bool)

(declare-fun e!837430 () Bool)

(assert (=> b!1495079 (= e!837430 e!837422)))

(declare-fun res!1017141 () Bool)

(assert (=> b!1495079 (=> res!1017141 e!837422)))

(assert (=> b!1495079 (= res!1017141 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!651604 #b00000000000000000000000000000000) (bvsge lt!651604 (size!48709 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1495079 (= lt!651604 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1495080 () Bool)

(declare-fun res!1017142 () Bool)

(declare-fun e!837428 () Bool)

(assert (=> b!1495080 (=> (not res!1017142) (not e!837428))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99784 (_ BitVec 32)) SeekEntryResult!12399)

(assert (=> b!1495080 (= res!1017142 (= (seekEntryOrOpen!0 (select (arr!48159 a!2862) j!93) a!2862 mask!2687) (Found!12399 j!93)))))

(declare-fun b!1495081 () Bool)

(declare-fun res!1017140 () Bool)

(assert (=> b!1495081 (=> (not res!1017140) (not e!837425))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1495081 (= res!1017140 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48709 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48709 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48709 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1495082 () Bool)

(declare-fun res!1017126 () Bool)

(assert (=> b!1495082 (=> res!1017126 e!837422)))

(assert (=> b!1495082 (= res!1017126 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651604 (select (arr!48159 a!2862) j!93) a!2862 mask!2687) lt!651605)))))

(declare-fun b!1495083 () Bool)

(declare-fun res!1017128 () Bool)

(declare-fun e!837431 () Bool)

(assert (=> b!1495083 (=> (not res!1017128) (not e!837431))))

(declare-fun e!837427 () Bool)

(assert (=> b!1495083 (= res!1017128 e!837427)))

(declare-fun c!138507 () Bool)

(assert (=> b!1495083 (= c!138507 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1495084 () Bool)

(declare-fun res!1017132 () Bool)

(assert (=> b!1495084 (=> (not res!1017132) (not e!837425))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1495084 (= res!1017132 (and (= (size!48709 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48709 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48709 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1495085 () Bool)

(assert (=> b!1495085 (= e!837423 e!837431)))

(declare-fun res!1017131 () Bool)

(assert (=> b!1495085 (=> (not res!1017131) (not e!837431))))

(assert (=> b!1495085 (= res!1017131 (= lt!651606 (Intermediate!12399 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1495085 (= lt!651606 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651608 mask!2687) lt!651608 lt!651607 mask!2687))))

(assert (=> b!1495085 (= lt!651608 (select (store (arr!48159 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1495086 () Bool)

(assert (=> b!1495086 (= e!837427 (= lt!651606 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651608 lt!651607 mask!2687)))))

(declare-fun b!1495087 () Bool)

(declare-fun res!1017133 () Bool)

(assert (=> b!1495087 (=> (not res!1017133) (not e!837425))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1495087 (= res!1017133 (validKeyInArray!0 (select (arr!48159 a!2862) i!1006)))))

(declare-fun b!1495088 () Bool)

(declare-fun res!1017135 () Bool)

(assert (=> b!1495088 (=> (not res!1017135) (not e!837425))))

(assert (=> b!1495088 (= res!1017135 (validKeyInArray!0 (select (arr!48159 a!2862) j!93)))))

(declare-fun b!1495089 () Bool)

(declare-fun res!1017129 () Bool)

(assert (=> b!1495089 (=> (not res!1017129) (not e!837431))))

(assert (=> b!1495089 (= res!1017129 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1495090 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99784 (_ BitVec 32)) SeekEntryResult!12399)

(assert (=> b!1495090 (= e!837426 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651604 intermediateAfterIndex!19 lt!651608 lt!651607 mask!2687) (seekEntryOrOpen!0 lt!651608 lt!651607 mask!2687)))))

(declare-fun b!1495091 () Bool)

(assert (=> b!1495091 (= e!837427 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651608 lt!651607 mask!2687) (seekEntryOrOpen!0 lt!651608 lt!651607 mask!2687)))))

(declare-fun b!1495092 () Bool)

(assert (=> b!1495092 (= e!837431 (not e!837430))))

(declare-fun res!1017138 () Bool)

(assert (=> b!1495092 (=> res!1017138 e!837430)))

(assert (=> b!1495092 (= res!1017138 (or (and (= (select (arr!48159 a!2862) index!646) (select (store (arr!48159 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48159 a!2862) index!646) (select (arr!48159 a!2862) j!93))) (= (select (arr!48159 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1495092 e!837428))

(declare-fun res!1017130 () Bool)

(assert (=> b!1495092 (=> (not res!1017130) (not e!837428))))

(assert (=> b!1495092 (= res!1017130 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50138 0))(
  ( (Unit!50139) )
))
(declare-fun lt!651609 () Unit!50138)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99784 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50138)

(assert (=> b!1495092 (= lt!651609 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1495093 () Bool)

(assert (=> b!1495093 (= e!837428 (or (= (select (arr!48159 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48159 a!2862) intermediateBeforeIndex!19) (select (arr!48159 a!2862) j!93))))))

(declare-fun b!1495094 () Bool)

(declare-fun e!837424 () Bool)

(assert (=> b!1495094 (= e!837424 e!837423)))

(declare-fun res!1017136 () Bool)

(assert (=> b!1495094 (=> (not res!1017136) (not e!837423))))

(assert (=> b!1495094 (= res!1017136 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48159 a!2862) j!93) mask!2687) (select (arr!48159 a!2862) j!93) a!2862 mask!2687) lt!651605))))

(assert (=> b!1495094 (= lt!651605 (Intermediate!12399 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1495095 () Bool)

(assert (=> b!1495095 (= e!837425 e!837424)))

(declare-fun res!1017139 () Bool)

(assert (=> b!1495095 (=> (not res!1017139) (not e!837424))))

(assert (=> b!1495095 (= res!1017139 (= (select (store (arr!48159 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495095 (= lt!651607 (array!99785 (store (arr!48159 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48709 a!2862)))))

(assert (= (and start!127200 res!1017134) b!1495084))

(assert (= (and b!1495084 res!1017132) b!1495087))

(assert (= (and b!1495087 res!1017133) b!1495088))

(assert (= (and b!1495088 res!1017135) b!1495077))

(assert (= (and b!1495077 res!1017127) b!1495075))

(assert (= (and b!1495075 res!1017137) b!1495081))

(assert (= (and b!1495081 res!1017140) b!1495095))

(assert (= (and b!1495095 res!1017139) b!1495094))

(assert (= (and b!1495094 res!1017136) b!1495078))

(assert (= (and b!1495078 res!1017125) b!1495085))

(assert (= (and b!1495085 res!1017131) b!1495083))

(assert (= (and b!1495083 c!138507) b!1495086))

(assert (= (and b!1495083 (not c!138507)) b!1495091))

(assert (= (and b!1495083 res!1017128) b!1495089))

(assert (= (and b!1495089 res!1017129) b!1495092))

(assert (= (and b!1495092 res!1017130) b!1495080))

(assert (= (and b!1495080 res!1017142) b!1495093))

(assert (= (and b!1495092 (not res!1017138)) b!1495079))

(assert (= (and b!1495079 (not res!1017141)) b!1495082))

(assert (= (and b!1495082 (not res!1017126)) b!1495076))

(assert (= (and b!1495076 c!138506) b!1495074))

(assert (= (and b!1495076 (not c!138506)) b!1495090))

(declare-fun m!1378643 () Bool)

(assert (=> b!1495092 m!1378643))

(declare-fun m!1378645 () Bool)

(assert (=> b!1495092 m!1378645))

(declare-fun m!1378647 () Bool)

(assert (=> b!1495092 m!1378647))

(declare-fun m!1378649 () Bool)

(assert (=> b!1495092 m!1378649))

(declare-fun m!1378651 () Bool)

(assert (=> b!1495092 m!1378651))

(declare-fun m!1378653 () Bool)

(assert (=> b!1495092 m!1378653))

(assert (=> b!1495082 m!1378653))

(assert (=> b!1495082 m!1378653))

(declare-fun m!1378655 () Bool)

(assert (=> b!1495082 m!1378655))

(assert (=> b!1495080 m!1378653))

(assert (=> b!1495080 m!1378653))

(declare-fun m!1378657 () Bool)

(assert (=> b!1495080 m!1378657))

(declare-fun m!1378659 () Bool)

(assert (=> b!1495090 m!1378659))

(declare-fun m!1378661 () Bool)

(assert (=> b!1495090 m!1378661))

(declare-fun m!1378663 () Bool)

(assert (=> b!1495074 m!1378663))

(declare-fun m!1378665 () Bool)

(assert (=> b!1495077 m!1378665))

(assert (=> b!1495078 m!1378653))

(assert (=> b!1495078 m!1378653))

(declare-fun m!1378667 () Bool)

(assert (=> b!1495078 m!1378667))

(declare-fun m!1378669 () Bool)

(assert (=> b!1495085 m!1378669))

(assert (=> b!1495085 m!1378669))

(declare-fun m!1378671 () Bool)

(assert (=> b!1495085 m!1378671))

(assert (=> b!1495085 m!1378645))

(declare-fun m!1378673 () Bool)

(assert (=> b!1495085 m!1378673))

(declare-fun m!1378675 () Bool)

(assert (=> b!1495086 m!1378675))

(declare-fun m!1378677 () Bool)

(assert (=> b!1495091 m!1378677))

(assert (=> b!1495091 m!1378661))

(assert (=> b!1495094 m!1378653))

(assert (=> b!1495094 m!1378653))

(declare-fun m!1378679 () Bool)

(assert (=> b!1495094 m!1378679))

(assert (=> b!1495094 m!1378679))

(assert (=> b!1495094 m!1378653))

(declare-fun m!1378681 () Bool)

(assert (=> b!1495094 m!1378681))

(declare-fun m!1378683 () Bool)

(assert (=> b!1495079 m!1378683))

(assert (=> b!1495088 m!1378653))

(assert (=> b!1495088 m!1378653))

(declare-fun m!1378685 () Bool)

(assert (=> b!1495088 m!1378685))

(declare-fun m!1378687 () Bool)

(assert (=> b!1495087 m!1378687))

(assert (=> b!1495087 m!1378687))

(declare-fun m!1378689 () Bool)

(assert (=> b!1495087 m!1378689))

(assert (=> b!1495095 m!1378645))

(declare-fun m!1378691 () Bool)

(assert (=> b!1495095 m!1378691))

(declare-fun m!1378693 () Bool)

(assert (=> b!1495075 m!1378693))

(declare-fun m!1378695 () Bool)

(assert (=> b!1495093 m!1378695))

(assert (=> b!1495093 m!1378653))

(declare-fun m!1378697 () Bool)

(assert (=> start!127200 m!1378697))

(declare-fun m!1378699 () Bool)

(assert (=> start!127200 m!1378699))

(check-sat (not b!1495087) (not b!1495078) (not b!1495090) (not b!1495086) (not b!1495077) (not b!1495085) (not b!1495092) (not b!1495082) (not b!1495080) (not b!1495074) (not b!1495075) (not b!1495094) (not start!127200) (not b!1495091) (not b!1495088) (not b!1495079))
(check-sat)
(get-model)

(declare-fun b!1495180 () Bool)

(declare-fun e!837472 () SeekEntryResult!12399)

(assert (=> b!1495180 (= e!837472 (Intermediate!12399 true (toIndex!0 (select (arr!48159 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1495181 () Bool)

(declare-fun e!837474 () Bool)

(declare-fun e!837473 () Bool)

(assert (=> b!1495181 (= e!837474 e!837473)))

(declare-fun res!1017205 () Bool)

(declare-fun lt!651632 () SeekEntryResult!12399)

(get-info :version)

(assert (=> b!1495181 (= res!1017205 (and ((_ is Intermediate!12399) lt!651632) (not (undefined!13211 lt!651632)) (bvslt (x!133595 lt!651632) #b01111111111111111111111111111110) (bvsge (x!133595 lt!651632) #b00000000000000000000000000000000) (bvsge (x!133595 lt!651632) #b00000000000000000000000000000000)))))

(assert (=> b!1495181 (=> (not res!1017205) (not e!837473))))

(declare-fun b!1495182 () Bool)

(assert (=> b!1495182 (and (bvsge (index!51990 lt!651632) #b00000000000000000000000000000000) (bvslt (index!51990 lt!651632) (size!48709 a!2862)))))

(declare-fun res!1017204 () Bool)

(assert (=> b!1495182 (= res!1017204 (= (select (arr!48159 a!2862) (index!51990 lt!651632)) (select (arr!48159 a!2862) j!93)))))

(declare-fun e!837475 () Bool)

(assert (=> b!1495182 (=> res!1017204 e!837475)))

(assert (=> b!1495182 (= e!837473 e!837475)))

(declare-fun b!1495183 () Bool)

(assert (=> b!1495183 (= e!837474 (bvsge (x!133595 lt!651632) #b01111111111111111111111111111110))))

(declare-fun b!1495184 () Bool)

(declare-fun e!837476 () SeekEntryResult!12399)

(assert (=> b!1495184 (= e!837472 e!837476)))

(declare-fun c!138522 () Bool)

(declare-fun lt!651633 () (_ BitVec 64))

(assert (=> b!1495184 (= c!138522 (or (= lt!651633 (select (arr!48159 a!2862) j!93)) (= (bvadd lt!651633 lt!651633) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1495185 () Bool)

(assert (=> b!1495185 (and (bvsge (index!51990 lt!651632) #b00000000000000000000000000000000) (bvslt (index!51990 lt!651632) (size!48709 a!2862)))))

(declare-fun res!1017203 () Bool)

(assert (=> b!1495185 (= res!1017203 (= (select (arr!48159 a!2862) (index!51990 lt!651632)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495185 (=> res!1017203 e!837475)))

(declare-fun b!1495187 () Bool)

(assert (=> b!1495187 (and (bvsge (index!51990 lt!651632) #b00000000000000000000000000000000) (bvslt (index!51990 lt!651632) (size!48709 a!2862)))))

(assert (=> b!1495187 (= e!837475 (= (select (arr!48159 a!2862) (index!51990 lt!651632)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1495188 () Bool)

(assert (=> b!1495188 (= e!837476 (Intermediate!12399 false (toIndex!0 (select (arr!48159 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun d!157177 () Bool)

(assert (=> d!157177 e!837474))

(declare-fun c!138521 () Bool)

(assert (=> d!157177 (= c!138521 (and ((_ is Intermediate!12399) lt!651632) (undefined!13211 lt!651632)))))

(assert (=> d!157177 (= lt!651632 e!837472)))

(declare-fun c!138520 () Bool)

(assert (=> d!157177 (= c!138520 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!157177 (= lt!651633 (select (arr!48159 a!2862) (toIndex!0 (select (arr!48159 a!2862) j!93) mask!2687)))))

(assert (=> d!157177 (validMask!0 mask!2687)))

(assert (=> d!157177 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48159 a!2862) j!93) mask!2687) (select (arr!48159 a!2862) j!93) a!2862 mask!2687) lt!651632)))

(declare-fun b!1495186 () Bool)

(assert (=> b!1495186 (= e!837476 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48159 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!48159 a!2862) j!93) a!2862 mask!2687))))

(assert (= (and d!157177 c!138520) b!1495180))

(assert (= (and d!157177 (not c!138520)) b!1495184))

(assert (= (and b!1495184 c!138522) b!1495188))

(assert (= (and b!1495184 (not c!138522)) b!1495186))

(assert (= (and d!157177 c!138521) b!1495183))

(assert (= (and d!157177 (not c!138521)) b!1495181))

(assert (= (and b!1495181 res!1017205) b!1495182))

(assert (= (and b!1495182 (not res!1017204)) b!1495185))

(assert (= (and b!1495185 (not res!1017203)) b!1495187))

(declare-fun m!1378759 () Bool)

(assert (=> b!1495182 m!1378759))

(assert (=> b!1495187 m!1378759))

(assert (=> d!157177 m!1378679))

(declare-fun m!1378761 () Bool)

(assert (=> d!157177 m!1378761))

(assert (=> d!157177 m!1378697))

(assert (=> b!1495185 m!1378759))

(assert (=> b!1495186 m!1378679))

(declare-fun m!1378763 () Bool)

(assert (=> b!1495186 m!1378763))

(assert (=> b!1495186 m!1378763))

(assert (=> b!1495186 m!1378653))

(declare-fun m!1378765 () Bool)

(assert (=> b!1495186 m!1378765))

(assert (=> b!1495094 d!157177))

(declare-fun d!157179 () Bool)

(declare-fun lt!651639 () (_ BitVec 32))

(declare-fun lt!651638 () (_ BitVec 32))

(assert (=> d!157179 (= lt!651639 (bvmul (bvxor lt!651638 (bvlshr lt!651638 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!157179 (= lt!651638 ((_ extract 31 0) (bvand (bvxor (select (arr!48159 a!2862) j!93) (bvlshr (select (arr!48159 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!157179 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1017206 (let ((h!36050 ((_ extract 31 0) (bvand (bvxor (select (arr!48159 a!2862) j!93) (bvlshr (select (arr!48159 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133598 (bvmul (bvxor h!36050 (bvlshr h!36050 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133598 (bvlshr x!133598 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1017206 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1017206 #b00000000000000000000000000000000))))))

(assert (=> d!157179 (= (toIndex!0 (select (arr!48159 a!2862) j!93) mask!2687) (bvand (bvxor lt!651639 (bvlshr lt!651639 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1495094 d!157179))

(declare-fun b!1495197 () Bool)

(declare-fun e!837485 () Bool)

(declare-fun call!68002 () Bool)

(assert (=> b!1495197 (= e!837485 call!68002)))

(declare-fun d!157181 () Bool)

(declare-fun res!1017211 () Bool)

(declare-fun e!837483 () Bool)

(assert (=> d!157181 (=> res!1017211 e!837483)))

(assert (=> d!157181 (= res!1017211 (bvsge j!93 (size!48709 a!2862)))))

(assert (=> d!157181 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!837483)))

(declare-fun b!1495198 () Bool)

(declare-fun e!837484 () Bool)

(assert (=> b!1495198 (= e!837484 call!68002)))

(declare-fun bm!67999 () Bool)

(assert (=> bm!67999 (= call!68002 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1495199 () Bool)

(assert (=> b!1495199 (= e!837484 e!837485)))

(declare-fun lt!651646 () (_ BitVec 64))

(assert (=> b!1495199 (= lt!651646 (select (arr!48159 a!2862) j!93))))

(declare-fun lt!651648 () Unit!50138)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99784 (_ BitVec 64) (_ BitVec 32)) Unit!50138)

(assert (=> b!1495199 (= lt!651648 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!651646 j!93))))

(declare-fun arrayContainsKey!0 (array!99784 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1495199 (arrayContainsKey!0 a!2862 lt!651646 #b00000000000000000000000000000000)))

(declare-fun lt!651647 () Unit!50138)

(assert (=> b!1495199 (= lt!651647 lt!651648)))

(declare-fun res!1017212 () Bool)

(assert (=> b!1495199 (= res!1017212 (= (seekEntryOrOpen!0 (select (arr!48159 a!2862) j!93) a!2862 mask!2687) (Found!12399 j!93)))))

(assert (=> b!1495199 (=> (not res!1017212) (not e!837485))))

(declare-fun b!1495200 () Bool)

(assert (=> b!1495200 (= e!837483 e!837484)))

(declare-fun c!138525 () Bool)

(assert (=> b!1495200 (= c!138525 (validKeyInArray!0 (select (arr!48159 a!2862) j!93)))))

(assert (= (and d!157181 (not res!1017211)) b!1495200))

(assert (= (and b!1495200 c!138525) b!1495199))

(assert (= (and b!1495200 (not c!138525)) b!1495198))

(assert (= (and b!1495199 res!1017212) b!1495197))

(assert (= (or b!1495197 b!1495198) bm!67999))

(declare-fun m!1378767 () Bool)

(assert (=> bm!67999 m!1378767))

(assert (=> b!1495199 m!1378653))

(declare-fun m!1378769 () Bool)

(assert (=> b!1495199 m!1378769))

(declare-fun m!1378771 () Bool)

(assert (=> b!1495199 m!1378771))

(assert (=> b!1495199 m!1378653))

(assert (=> b!1495199 m!1378657))

(assert (=> b!1495200 m!1378653))

(assert (=> b!1495200 m!1378653))

(assert (=> b!1495200 m!1378685))

(assert (=> b!1495092 d!157181))

(declare-fun d!157183 () Bool)

(assert (=> d!157183 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!651651 () Unit!50138)

(declare-fun choose!38 (array!99784 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50138)

(assert (=> d!157183 (= lt!651651 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!157183 (validMask!0 mask!2687)))

(assert (=> d!157183 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!651651)))

(declare-fun bs!42911 () Bool)

(assert (= bs!42911 d!157183))

(assert (=> bs!42911 m!1378651))

(declare-fun m!1378773 () Bool)

(assert (=> bs!42911 m!1378773))

(assert (=> bs!42911 m!1378697))

(assert (=> b!1495092 d!157183))

(declare-fun d!157185 () Bool)

(assert (=> d!157185 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!127200 d!157185))

(declare-fun d!157187 () Bool)

(assert (=> d!157187 (= (array_inv!37187 a!2862) (bvsge (size!48709 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!127200 d!157187))

(declare-fun b!1495201 () Bool)

(declare-fun e!837486 () SeekEntryResult!12399)

(assert (=> b!1495201 (= e!837486 (Intermediate!12399 true lt!651604 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1495202 () Bool)

(declare-fun e!837488 () Bool)

(declare-fun e!837487 () Bool)

(assert (=> b!1495202 (= e!837488 e!837487)))

(declare-fun res!1017215 () Bool)

(declare-fun lt!651652 () SeekEntryResult!12399)

(assert (=> b!1495202 (= res!1017215 (and ((_ is Intermediate!12399) lt!651652) (not (undefined!13211 lt!651652)) (bvslt (x!133595 lt!651652) #b01111111111111111111111111111110) (bvsge (x!133595 lt!651652) #b00000000000000000000000000000000) (bvsge (x!133595 lt!651652) (bvadd #b00000000000000000000000000000001 x!665))))))

(assert (=> b!1495202 (=> (not res!1017215) (not e!837487))))

(declare-fun b!1495203 () Bool)

(assert (=> b!1495203 (and (bvsge (index!51990 lt!651652) #b00000000000000000000000000000000) (bvslt (index!51990 lt!651652) (size!48709 a!2862)))))

(declare-fun res!1017214 () Bool)

(assert (=> b!1495203 (= res!1017214 (= (select (arr!48159 a!2862) (index!51990 lt!651652)) (select (arr!48159 a!2862) j!93)))))

(declare-fun e!837489 () Bool)

(assert (=> b!1495203 (=> res!1017214 e!837489)))

(assert (=> b!1495203 (= e!837487 e!837489)))

(declare-fun b!1495204 () Bool)

(assert (=> b!1495204 (= e!837488 (bvsge (x!133595 lt!651652) #b01111111111111111111111111111110))))

(declare-fun b!1495205 () Bool)

(declare-fun e!837490 () SeekEntryResult!12399)

(assert (=> b!1495205 (= e!837486 e!837490)))

(declare-fun lt!651653 () (_ BitVec 64))

(declare-fun c!138528 () Bool)

(assert (=> b!1495205 (= c!138528 (or (= lt!651653 (select (arr!48159 a!2862) j!93)) (= (bvadd lt!651653 lt!651653) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1495206 () Bool)

(assert (=> b!1495206 (and (bvsge (index!51990 lt!651652) #b00000000000000000000000000000000) (bvslt (index!51990 lt!651652) (size!48709 a!2862)))))

(declare-fun res!1017213 () Bool)

(assert (=> b!1495206 (= res!1017213 (= (select (arr!48159 a!2862) (index!51990 lt!651652)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495206 (=> res!1017213 e!837489)))

(declare-fun b!1495208 () Bool)

(assert (=> b!1495208 (and (bvsge (index!51990 lt!651652) #b00000000000000000000000000000000) (bvslt (index!51990 lt!651652) (size!48709 a!2862)))))

(assert (=> b!1495208 (= e!837489 (= (select (arr!48159 a!2862) (index!51990 lt!651652)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1495209 () Bool)

(assert (=> b!1495209 (= e!837490 (Intermediate!12399 false lt!651604 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun d!157189 () Bool)

(assert (=> d!157189 e!837488))

(declare-fun c!138527 () Bool)

(assert (=> d!157189 (= c!138527 (and ((_ is Intermediate!12399) lt!651652) (undefined!13211 lt!651652)))))

(assert (=> d!157189 (= lt!651652 e!837486)))

(declare-fun c!138526 () Bool)

(assert (=> d!157189 (= c!138526 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(assert (=> d!157189 (= lt!651653 (select (arr!48159 a!2862) lt!651604))))

(assert (=> d!157189 (validMask!0 mask!2687)))

(assert (=> d!157189 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651604 (select (arr!48159 a!2862) j!93) a!2862 mask!2687) lt!651652)))

(declare-fun b!1495207 () Bool)

(assert (=> b!1495207 (= e!837490 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!651604 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) (select (arr!48159 a!2862) j!93) a!2862 mask!2687))))

(assert (= (and d!157189 c!138526) b!1495201))

(assert (= (and d!157189 (not c!138526)) b!1495205))

(assert (= (and b!1495205 c!138528) b!1495209))

(assert (= (and b!1495205 (not c!138528)) b!1495207))

(assert (= (and d!157189 c!138527) b!1495204))

(assert (= (and d!157189 (not c!138527)) b!1495202))

(assert (= (and b!1495202 res!1017215) b!1495203))

(assert (= (and b!1495203 (not res!1017214)) b!1495206))

(assert (= (and b!1495206 (not res!1017213)) b!1495208))

(declare-fun m!1378775 () Bool)

(assert (=> b!1495203 m!1378775))

(assert (=> b!1495208 m!1378775))

(declare-fun m!1378777 () Bool)

(assert (=> d!157189 m!1378777))

(assert (=> d!157189 m!1378697))

(assert (=> b!1495206 m!1378775))

(declare-fun m!1378779 () Bool)

(assert (=> b!1495207 m!1378779))

(assert (=> b!1495207 m!1378779))

(assert (=> b!1495207 m!1378653))

(declare-fun m!1378781 () Bool)

(assert (=> b!1495207 m!1378781))

(assert (=> b!1495082 d!157189))

(declare-fun b!1495210 () Bool)

(declare-fun e!837491 () SeekEntryResult!12399)

(assert (=> b!1495210 (= e!837491 (Intermediate!12399 true (toIndex!0 lt!651608 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1495211 () Bool)

(declare-fun e!837493 () Bool)

(declare-fun e!837492 () Bool)

(assert (=> b!1495211 (= e!837493 e!837492)))

(declare-fun res!1017218 () Bool)

(declare-fun lt!651654 () SeekEntryResult!12399)

(assert (=> b!1495211 (= res!1017218 (and ((_ is Intermediate!12399) lt!651654) (not (undefined!13211 lt!651654)) (bvslt (x!133595 lt!651654) #b01111111111111111111111111111110) (bvsge (x!133595 lt!651654) #b00000000000000000000000000000000) (bvsge (x!133595 lt!651654) #b00000000000000000000000000000000)))))

(assert (=> b!1495211 (=> (not res!1017218) (not e!837492))))

(declare-fun b!1495212 () Bool)

(assert (=> b!1495212 (and (bvsge (index!51990 lt!651654) #b00000000000000000000000000000000) (bvslt (index!51990 lt!651654) (size!48709 lt!651607)))))

(declare-fun res!1017217 () Bool)

(assert (=> b!1495212 (= res!1017217 (= (select (arr!48159 lt!651607) (index!51990 lt!651654)) lt!651608))))

(declare-fun e!837494 () Bool)

(assert (=> b!1495212 (=> res!1017217 e!837494)))

(assert (=> b!1495212 (= e!837492 e!837494)))

(declare-fun b!1495213 () Bool)

(assert (=> b!1495213 (= e!837493 (bvsge (x!133595 lt!651654) #b01111111111111111111111111111110))))

(declare-fun b!1495214 () Bool)

(declare-fun e!837495 () SeekEntryResult!12399)

(assert (=> b!1495214 (= e!837491 e!837495)))

(declare-fun c!138531 () Bool)

(declare-fun lt!651655 () (_ BitVec 64))

(assert (=> b!1495214 (= c!138531 (or (= lt!651655 lt!651608) (= (bvadd lt!651655 lt!651655) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1495215 () Bool)

(assert (=> b!1495215 (and (bvsge (index!51990 lt!651654) #b00000000000000000000000000000000) (bvslt (index!51990 lt!651654) (size!48709 lt!651607)))))

(declare-fun res!1017216 () Bool)

(assert (=> b!1495215 (= res!1017216 (= (select (arr!48159 lt!651607) (index!51990 lt!651654)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495215 (=> res!1017216 e!837494)))

(declare-fun b!1495217 () Bool)

(assert (=> b!1495217 (and (bvsge (index!51990 lt!651654) #b00000000000000000000000000000000) (bvslt (index!51990 lt!651654) (size!48709 lt!651607)))))

(assert (=> b!1495217 (= e!837494 (= (select (arr!48159 lt!651607) (index!51990 lt!651654)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1495218 () Bool)

(assert (=> b!1495218 (= e!837495 (Intermediate!12399 false (toIndex!0 lt!651608 mask!2687) #b00000000000000000000000000000000))))

(declare-fun d!157191 () Bool)

(assert (=> d!157191 e!837493))

(declare-fun c!138530 () Bool)

(assert (=> d!157191 (= c!138530 (and ((_ is Intermediate!12399) lt!651654) (undefined!13211 lt!651654)))))

(assert (=> d!157191 (= lt!651654 e!837491)))

(declare-fun c!138529 () Bool)

(assert (=> d!157191 (= c!138529 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!157191 (= lt!651655 (select (arr!48159 lt!651607) (toIndex!0 lt!651608 mask!2687)))))

(assert (=> d!157191 (validMask!0 mask!2687)))

(assert (=> d!157191 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651608 mask!2687) lt!651608 lt!651607 mask!2687) lt!651654)))

(declare-fun b!1495216 () Bool)

(assert (=> b!1495216 (= e!837495 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!651608 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!651608 lt!651607 mask!2687))))

(assert (= (and d!157191 c!138529) b!1495210))

(assert (= (and d!157191 (not c!138529)) b!1495214))

(assert (= (and b!1495214 c!138531) b!1495218))

(assert (= (and b!1495214 (not c!138531)) b!1495216))

(assert (= (and d!157191 c!138530) b!1495213))

(assert (= (and d!157191 (not c!138530)) b!1495211))

(assert (= (and b!1495211 res!1017218) b!1495212))

(assert (= (and b!1495212 (not res!1017217)) b!1495215))

(assert (= (and b!1495215 (not res!1017216)) b!1495217))

(declare-fun m!1378783 () Bool)

(assert (=> b!1495212 m!1378783))

(assert (=> b!1495217 m!1378783))

(assert (=> d!157191 m!1378669))

(declare-fun m!1378785 () Bool)

(assert (=> d!157191 m!1378785))

(assert (=> d!157191 m!1378697))

(assert (=> b!1495215 m!1378783))

(assert (=> b!1495216 m!1378669))

(declare-fun m!1378787 () Bool)

(assert (=> b!1495216 m!1378787))

(assert (=> b!1495216 m!1378787))

(declare-fun m!1378789 () Bool)

(assert (=> b!1495216 m!1378789))

(assert (=> b!1495085 d!157191))

(declare-fun d!157193 () Bool)

(declare-fun lt!651657 () (_ BitVec 32))

(declare-fun lt!651656 () (_ BitVec 32))

(assert (=> d!157193 (= lt!651657 (bvmul (bvxor lt!651656 (bvlshr lt!651656 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!157193 (= lt!651656 ((_ extract 31 0) (bvand (bvxor lt!651608 (bvlshr lt!651608 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!157193 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1017206 (let ((h!36050 ((_ extract 31 0) (bvand (bvxor lt!651608 (bvlshr lt!651608 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133598 (bvmul (bvxor h!36050 (bvlshr h!36050 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133598 (bvlshr x!133598 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1017206 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1017206 #b00000000000000000000000000000000))))))

(assert (=> d!157193 (= (toIndex!0 lt!651608 mask!2687) (bvand (bvxor lt!651657 (bvlshr lt!651657 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1495085 d!157193))

(declare-fun b!1495219 () Bool)

(declare-fun e!837496 () SeekEntryResult!12399)

(assert (=> b!1495219 (= e!837496 (Intermediate!12399 true index!646 x!665))))

(declare-fun b!1495220 () Bool)

(declare-fun e!837498 () Bool)

(declare-fun e!837497 () Bool)

(assert (=> b!1495220 (= e!837498 e!837497)))

(declare-fun res!1017221 () Bool)

(declare-fun lt!651658 () SeekEntryResult!12399)

(assert (=> b!1495220 (= res!1017221 (and ((_ is Intermediate!12399) lt!651658) (not (undefined!13211 lt!651658)) (bvslt (x!133595 lt!651658) #b01111111111111111111111111111110) (bvsge (x!133595 lt!651658) #b00000000000000000000000000000000) (bvsge (x!133595 lt!651658) x!665)))))

(assert (=> b!1495220 (=> (not res!1017221) (not e!837497))))

(declare-fun b!1495221 () Bool)

(assert (=> b!1495221 (and (bvsge (index!51990 lt!651658) #b00000000000000000000000000000000) (bvslt (index!51990 lt!651658) (size!48709 lt!651607)))))

(declare-fun res!1017220 () Bool)

(assert (=> b!1495221 (= res!1017220 (= (select (arr!48159 lt!651607) (index!51990 lt!651658)) lt!651608))))

(declare-fun e!837499 () Bool)

(assert (=> b!1495221 (=> res!1017220 e!837499)))

(assert (=> b!1495221 (= e!837497 e!837499)))

(declare-fun b!1495222 () Bool)

(assert (=> b!1495222 (= e!837498 (bvsge (x!133595 lt!651658) #b01111111111111111111111111111110))))

(declare-fun b!1495223 () Bool)

(declare-fun e!837500 () SeekEntryResult!12399)

(assert (=> b!1495223 (= e!837496 e!837500)))

(declare-fun c!138534 () Bool)

(declare-fun lt!651659 () (_ BitVec 64))

(assert (=> b!1495223 (= c!138534 (or (= lt!651659 lt!651608) (= (bvadd lt!651659 lt!651659) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1495224 () Bool)

(assert (=> b!1495224 (and (bvsge (index!51990 lt!651658) #b00000000000000000000000000000000) (bvslt (index!51990 lt!651658) (size!48709 lt!651607)))))

(declare-fun res!1017219 () Bool)

(assert (=> b!1495224 (= res!1017219 (= (select (arr!48159 lt!651607) (index!51990 lt!651658)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495224 (=> res!1017219 e!837499)))

(declare-fun b!1495226 () Bool)

(assert (=> b!1495226 (and (bvsge (index!51990 lt!651658) #b00000000000000000000000000000000) (bvslt (index!51990 lt!651658) (size!48709 lt!651607)))))

(assert (=> b!1495226 (= e!837499 (= (select (arr!48159 lt!651607) (index!51990 lt!651658)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1495227 () Bool)

(assert (=> b!1495227 (= e!837500 (Intermediate!12399 false index!646 x!665))))

(declare-fun d!157195 () Bool)

(assert (=> d!157195 e!837498))

(declare-fun c!138533 () Bool)

(assert (=> d!157195 (= c!138533 (and ((_ is Intermediate!12399) lt!651658) (undefined!13211 lt!651658)))))

(assert (=> d!157195 (= lt!651658 e!837496)))

(declare-fun c!138532 () Bool)

(assert (=> d!157195 (= c!138532 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!157195 (= lt!651659 (select (arr!48159 lt!651607) index!646))))

(assert (=> d!157195 (validMask!0 mask!2687)))

(assert (=> d!157195 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651608 lt!651607 mask!2687) lt!651658)))

(declare-fun b!1495225 () Bool)

(assert (=> b!1495225 (= e!837500 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!651608 lt!651607 mask!2687))))

(assert (= (and d!157195 c!138532) b!1495219))

(assert (= (and d!157195 (not c!138532)) b!1495223))

(assert (= (and b!1495223 c!138534) b!1495227))

(assert (= (and b!1495223 (not c!138534)) b!1495225))

(assert (= (and d!157195 c!138533) b!1495222))

(assert (= (and d!157195 (not c!138533)) b!1495220))

(assert (= (and b!1495220 res!1017221) b!1495221))

(assert (= (and b!1495221 (not res!1017220)) b!1495224))

(assert (= (and b!1495224 (not res!1017219)) b!1495226))

(declare-fun m!1378791 () Bool)

(assert (=> b!1495221 m!1378791))

(assert (=> b!1495226 m!1378791))

(declare-fun m!1378793 () Bool)

(assert (=> d!157195 m!1378793))

(assert (=> d!157195 m!1378697))

(assert (=> b!1495224 m!1378791))

(assert (=> b!1495225 m!1378683))

(assert (=> b!1495225 m!1378683))

(declare-fun m!1378795 () Bool)

(assert (=> b!1495225 m!1378795))

(assert (=> b!1495086 d!157195))

(declare-fun b!1495238 () Bool)

(declare-fun e!837512 () Bool)

(declare-fun call!68005 () Bool)

(assert (=> b!1495238 (= e!837512 call!68005)))

(declare-fun d!157197 () Bool)

(declare-fun res!1017230 () Bool)

(declare-fun e!837511 () Bool)

(assert (=> d!157197 (=> res!1017230 e!837511)))

(assert (=> d!157197 (= res!1017230 (bvsge #b00000000000000000000000000000000 (size!48709 a!2862)))))

(assert (=> d!157197 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34657) e!837511)))

(declare-fun b!1495239 () Bool)

(declare-fun e!837509 () Bool)

(assert (=> b!1495239 (= e!837509 e!837512)))

(declare-fun c!138537 () Bool)

(assert (=> b!1495239 (= c!138537 (validKeyInArray!0 (select (arr!48159 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!68002 () Bool)

(assert (=> bm!68002 (= call!68005 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!138537 (Cons!34656 (select (arr!48159 a!2862) #b00000000000000000000000000000000) Nil!34657) Nil!34657)))))

(declare-fun b!1495240 () Bool)

(assert (=> b!1495240 (= e!837511 e!837509)))

(declare-fun res!1017229 () Bool)

(assert (=> b!1495240 (=> (not res!1017229) (not e!837509))))

(declare-fun e!837510 () Bool)

(assert (=> b!1495240 (= res!1017229 (not e!837510))))

(declare-fun res!1017228 () Bool)

(assert (=> b!1495240 (=> (not res!1017228) (not e!837510))))

(assert (=> b!1495240 (= res!1017228 (validKeyInArray!0 (select (arr!48159 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1495241 () Bool)

(assert (=> b!1495241 (= e!837512 call!68005)))

(declare-fun b!1495242 () Bool)

(declare-fun contains!9932 (List!34660 (_ BitVec 64)) Bool)

(assert (=> b!1495242 (= e!837510 (contains!9932 Nil!34657 (select (arr!48159 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!157197 (not res!1017230)) b!1495240))

(assert (= (and b!1495240 res!1017228) b!1495242))

(assert (= (and b!1495240 res!1017229) b!1495239))

(assert (= (and b!1495239 c!138537) b!1495241))

(assert (= (and b!1495239 (not c!138537)) b!1495238))

(assert (= (or b!1495241 b!1495238) bm!68002))

(declare-fun m!1378797 () Bool)

(assert (=> b!1495239 m!1378797))

(assert (=> b!1495239 m!1378797))

(declare-fun m!1378799 () Bool)

(assert (=> b!1495239 m!1378799))

(assert (=> bm!68002 m!1378797))

(declare-fun m!1378801 () Bool)

(assert (=> bm!68002 m!1378801))

(assert (=> b!1495240 m!1378797))

(assert (=> b!1495240 m!1378797))

(assert (=> b!1495240 m!1378799))

(assert (=> b!1495242 m!1378797))

(assert (=> b!1495242 m!1378797))

(declare-fun m!1378803 () Bool)

(assert (=> b!1495242 m!1378803))

(assert (=> b!1495075 d!157197))

(declare-fun b!1495243 () Bool)

(declare-fun e!837513 () SeekEntryResult!12399)

(assert (=> b!1495243 (= e!837513 (Intermediate!12399 true lt!651604 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1495244 () Bool)

(declare-fun e!837515 () Bool)

(declare-fun e!837514 () Bool)

(assert (=> b!1495244 (= e!837515 e!837514)))

(declare-fun res!1017233 () Bool)

(declare-fun lt!651660 () SeekEntryResult!12399)

(assert (=> b!1495244 (= res!1017233 (and ((_ is Intermediate!12399) lt!651660) (not (undefined!13211 lt!651660)) (bvslt (x!133595 lt!651660) #b01111111111111111111111111111110) (bvsge (x!133595 lt!651660) #b00000000000000000000000000000000) (bvsge (x!133595 lt!651660) (bvadd #b00000000000000000000000000000001 x!665))))))

(assert (=> b!1495244 (=> (not res!1017233) (not e!837514))))

(declare-fun b!1495245 () Bool)

(assert (=> b!1495245 (and (bvsge (index!51990 lt!651660) #b00000000000000000000000000000000) (bvslt (index!51990 lt!651660) (size!48709 lt!651607)))))

(declare-fun res!1017232 () Bool)

(assert (=> b!1495245 (= res!1017232 (= (select (arr!48159 lt!651607) (index!51990 lt!651660)) lt!651608))))

(declare-fun e!837516 () Bool)

(assert (=> b!1495245 (=> res!1017232 e!837516)))

(assert (=> b!1495245 (= e!837514 e!837516)))

(declare-fun b!1495246 () Bool)

(assert (=> b!1495246 (= e!837515 (bvsge (x!133595 lt!651660) #b01111111111111111111111111111110))))

(declare-fun b!1495247 () Bool)

(declare-fun e!837517 () SeekEntryResult!12399)

(assert (=> b!1495247 (= e!837513 e!837517)))

(declare-fun c!138540 () Bool)

(declare-fun lt!651661 () (_ BitVec 64))

(assert (=> b!1495247 (= c!138540 (or (= lt!651661 lt!651608) (= (bvadd lt!651661 lt!651661) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1495248 () Bool)

(assert (=> b!1495248 (and (bvsge (index!51990 lt!651660) #b00000000000000000000000000000000) (bvslt (index!51990 lt!651660) (size!48709 lt!651607)))))

(declare-fun res!1017231 () Bool)

(assert (=> b!1495248 (= res!1017231 (= (select (arr!48159 lt!651607) (index!51990 lt!651660)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495248 (=> res!1017231 e!837516)))

(declare-fun b!1495250 () Bool)

(assert (=> b!1495250 (and (bvsge (index!51990 lt!651660) #b00000000000000000000000000000000) (bvslt (index!51990 lt!651660) (size!48709 lt!651607)))))

(assert (=> b!1495250 (= e!837516 (= (select (arr!48159 lt!651607) (index!51990 lt!651660)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1495251 () Bool)

(assert (=> b!1495251 (= e!837517 (Intermediate!12399 false lt!651604 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun d!157201 () Bool)

(assert (=> d!157201 e!837515))

(declare-fun c!138539 () Bool)

(assert (=> d!157201 (= c!138539 (and ((_ is Intermediate!12399) lt!651660) (undefined!13211 lt!651660)))))

(assert (=> d!157201 (= lt!651660 e!837513)))

(declare-fun c!138538 () Bool)

(assert (=> d!157201 (= c!138538 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(assert (=> d!157201 (= lt!651661 (select (arr!48159 lt!651607) lt!651604))))

(assert (=> d!157201 (validMask!0 mask!2687)))

(assert (=> d!157201 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651604 lt!651608 lt!651607 mask!2687) lt!651660)))

(declare-fun b!1495249 () Bool)

(assert (=> b!1495249 (= e!837517 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!651604 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) lt!651608 lt!651607 mask!2687))))

(assert (= (and d!157201 c!138538) b!1495243))

(assert (= (and d!157201 (not c!138538)) b!1495247))

(assert (= (and b!1495247 c!138540) b!1495251))

(assert (= (and b!1495247 (not c!138540)) b!1495249))

(assert (= (and d!157201 c!138539) b!1495246))

(assert (= (and d!157201 (not c!138539)) b!1495244))

(assert (= (and b!1495244 res!1017233) b!1495245))

(assert (= (and b!1495245 (not res!1017232)) b!1495248))

(assert (= (and b!1495248 (not res!1017231)) b!1495250))

(declare-fun m!1378805 () Bool)

(assert (=> b!1495245 m!1378805))

(assert (=> b!1495250 m!1378805))

(declare-fun m!1378807 () Bool)

(assert (=> d!157201 m!1378807))

(assert (=> d!157201 m!1378697))

(assert (=> b!1495248 m!1378805))

(assert (=> b!1495249 m!1378779))

(assert (=> b!1495249 m!1378779))

(declare-fun m!1378809 () Bool)

(assert (=> b!1495249 m!1378809))

(assert (=> b!1495074 d!157201))

(declare-fun d!157203 () Bool)

(assert (=> d!157203 (= (validKeyInArray!0 (select (arr!48159 a!2862) j!93)) (and (not (= (select (arr!48159 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48159 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1495088 d!157203))

(declare-fun b!1495252 () Bool)

(declare-fun e!837520 () Bool)

(declare-fun call!68006 () Bool)

(assert (=> b!1495252 (= e!837520 call!68006)))

(declare-fun d!157205 () Bool)

(declare-fun res!1017234 () Bool)

(declare-fun e!837518 () Bool)

(assert (=> d!157205 (=> res!1017234 e!837518)))

(assert (=> d!157205 (= res!1017234 (bvsge #b00000000000000000000000000000000 (size!48709 a!2862)))))

(assert (=> d!157205 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!837518)))

(declare-fun b!1495253 () Bool)

(declare-fun e!837519 () Bool)

(assert (=> b!1495253 (= e!837519 call!68006)))

(declare-fun bm!68003 () Bool)

(assert (=> bm!68003 (= call!68006 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1495254 () Bool)

(assert (=> b!1495254 (= e!837519 e!837520)))

(declare-fun lt!651662 () (_ BitVec 64))

(assert (=> b!1495254 (= lt!651662 (select (arr!48159 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!651664 () Unit!50138)

(assert (=> b!1495254 (= lt!651664 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!651662 #b00000000000000000000000000000000))))

(assert (=> b!1495254 (arrayContainsKey!0 a!2862 lt!651662 #b00000000000000000000000000000000)))

(declare-fun lt!651663 () Unit!50138)

(assert (=> b!1495254 (= lt!651663 lt!651664)))

(declare-fun res!1017235 () Bool)

(assert (=> b!1495254 (= res!1017235 (= (seekEntryOrOpen!0 (select (arr!48159 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12399 #b00000000000000000000000000000000)))))

(assert (=> b!1495254 (=> (not res!1017235) (not e!837520))))

(declare-fun b!1495255 () Bool)

(assert (=> b!1495255 (= e!837518 e!837519)))

(declare-fun c!138541 () Bool)

(assert (=> b!1495255 (= c!138541 (validKeyInArray!0 (select (arr!48159 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!157205 (not res!1017234)) b!1495255))

(assert (= (and b!1495255 c!138541) b!1495254))

(assert (= (and b!1495255 (not c!138541)) b!1495253))

(assert (= (and b!1495254 res!1017235) b!1495252))

(assert (= (or b!1495252 b!1495253) bm!68003))

(declare-fun m!1378811 () Bool)

(assert (=> bm!68003 m!1378811))

(assert (=> b!1495254 m!1378797))

(declare-fun m!1378813 () Bool)

(assert (=> b!1495254 m!1378813))

(declare-fun m!1378815 () Bool)

(assert (=> b!1495254 m!1378815))

(assert (=> b!1495254 m!1378797))

(declare-fun m!1378817 () Bool)

(assert (=> b!1495254 m!1378817))

(assert (=> b!1495255 m!1378797))

(assert (=> b!1495255 m!1378797))

(assert (=> b!1495255 m!1378799))

(assert (=> b!1495077 d!157205))

(declare-fun b!1495256 () Bool)

(declare-fun e!837521 () SeekEntryResult!12399)

(assert (=> b!1495256 (= e!837521 (Intermediate!12399 true index!646 x!665))))

(declare-fun b!1495257 () Bool)

(declare-fun e!837523 () Bool)

(declare-fun e!837522 () Bool)

(assert (=> b!1495257 (= e!837523 e!837522)))

(declare-fun res!1017238 () Bool)

(declare-fun lt!651665 () SeekEntryResult!12399)

(assert (=> b!1495257 (= res!1017238 (and ((_ is Intermediate!12399) lt!651665) (not (undefined!13211 lt!651665)) (bvslt (x!133595 lt!651665) #b01111111111111111111111111111110) (bvsge (x!133595 lt!651665) #b00000000000000000000000000000000) (bvsge (x!133595 lt!651665) x!665)))))

(assert (=> b!1495257 (=> (not res!1017238) (not e!837522))))

(declare-fun b!1495258 () Bool)

(assert (=> b!1495258 (and (bvsge (index!51990 lt!651665) #b00000000000000000000000000000000) (bvslt (index!51990 lt!651665) (size!48709 a!2862)))))

(declare-fun res!1017237 () Bool)

(assert (=> b!1495258 (= res!1017237 (= (select (arr!48159 a!2862) (index!51990 lt!651665)) (select (arr!48159 a!2862) j!93)))))

(declare-fun e!837524 () Bool)

(assert (=> b!1495258 (=> res!1017237 e!837524)))

(assert (=> b!1495258 (= e!837522 e!837524)))

(declare-fun b!1495259 () Bool)

(assert (=> b!1495259 (= e!837523 (bvsge (x!133595 lt!651665) #b01111111111111111111111111111110))))

(declare-fun b!1495260 () Bool)

(declare-fun e!837525 () SeekEntryResult!12399)

(assert (=> b!1495260 (= e!837521 e!837525)))

(declare-fun lt!651666 () (_ BitVec 64))

(declare-fun c!138544 () Bool)

(assert (=> b!1495260 (= c!138544 (or (= lt!651666 (select (arr!48159 a!2862) j!93)) (= (bvadd lt!651666 lt!651666) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1495261 () Bool)

(assert (=> b!1495261 (and (bvsge (index!51990 lt!651665) #b00000000000000000000000000000000) (bvslt (index!51990 lt!651665) (size!48709 a!2862)))))

(declare-fun res!1017236 () Bool)

(assert (=> b!1495261 (= res!1017236 (= (select (arr!48159 a!2862) (index!51990 lt!651665)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495261 (=> res!1017236 e!837524)))

(declare-fun b!1495263 () Bool)

(assert (=> b!1495263 (and (bvsge (index!51990 lt!651665) #b00000000000000000000000000000000) (bvslt (index!51990 lt!651665) (size!48709 a!2862)))))

(assert (=> b!1495263 (= e!837524 (= (select (arr!48159 a!2862) (index!51990 lt!651665)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1495264 () Bool)

(assert (=> b!1495264 (= e!837525 (Intermediate!12399 false index!646 x!665))))

(declare-fun d!157207 () Bool)

(assert (=> d!157207 e!837523))

(declare-fun c!138543 () Bool)

(assert (=> d!157207 (= c!138543 (and ((_ is Intermediate!12399) lt!651665) (undefined!13211 lt!651665)))))

(assert (=> d!157207 (= lt!651665 e!837521)))

(declare-fun c!138542 () Bool)

(assert (=> d!157207 (= c!138542 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!157207 (= lt!651666 (select (arr!48159 a!2862) index!646))))

(assert (=> d!157207 (validMask!0 mask!2687)))

(assert (=> d!157207 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48159 a!2862) j!93) a!2862 mask!2687) lt!651665)))

(declare-fun b!1495262 () Bool)

(assert (=> b!1495262 (= e!837525 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!48159 a!2862) j!93) a!2862 mask!2687))))

(assert (= (and d!157207 c!138542) b!1495256))

(assert (= (and d!157207 (not c!138542)) b!1495260))

(assert (= (and b!1495260 c!138544) b!1495264))

(assert (= (and b!1495260 (not c!138544)) b!1495262))

(assert (= (and d!157207 c!138543) b!1495259))

(assert (= (and d!157207 (not c!138543)) b!1495257))

(assert (= (and b!1495257 res!1017238) b!1495258))

(assert (= (and b!1495258 (not res!1017237)) b!1495261))

(assert (= (and b!1495261 (not res!1017236)) b!1495263))

(declare-fun m!1378819 () Bool)

(assert (=> b!1495258 m!1378819))

(assert (=> b!1495263 m!1378819))

(assert (=> d!157207 m!1378649))

(assert (=> d!157207 m!1378697))

(assert (=> b!1495261 m!1378819))

(assert (=> b!1495262 m!1378683))

(assert (=> b!1495262 m!1378683))

(assert (=> b!1495262 m!1378653))

(declare-fun m!1378821 () Bool)

(assert (=> b!1495262 m!1378821))

(assert (=> b!1495078 d!157207))

(declare-fun d!157211 () Bool)

(assert (=> d!157211 (= (validKeyInArray!0 (select (arr!48159 a!2862) i!1006)) (and (not (= (select (arr!48159 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48159 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1495087 d!157211))

(declare-fun b!1495322 () Bool)

(declare-fun lt!651693 () SeekEntryResult!12399)

(declare-fun e!837556 () SeekEntryResult!12399)

(assert (=> b!1495322 (= e!837556 (seekKeyOrZeroReturnVacant!0 (x!133595 lt!651693) (index!51990 lt!651693) (index!51990 lt!651693) (select (arr!48159 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1495323 () Bool)

(assert (=> b!1495323 (= e!837556 (MissingZero!12399 (index!51990 lt!651693)))))

(declare-fun b!1495324 () Bool)

(declare-fun e!837557 () SeekEntryResult!12399)

(declare-fun e!837558 () SeekEntryResult!12399)

(assert (=> b!1495324 (= e!837557 e!837558)))

(declare-fun lt!651694 () (_ BitVec 64))

(assert (=> b!1495324 (= lt!651694 (select (arr!48159 a!2862) (index!51990 lt!651693)))))

(declare-fun c!138570 () Bool)

(assert (=> b!1495324 (= c!138570 (= lt!651694 (select (arr!48159 a!2862) j!93)))))

(declare-fun b!1495325 () Bool)

(assert (=> b!1495325 (= e!837557 Undefined!12399)))

(declare-fun b!1495326 () Bool)

(assert (=> b!1495326 (= e!837558 (Found!12399 (index!51990 lt!651693)))))

(declare-fun b!1495327 () Bool)

(declare-fun c!138569 () Bool)

(assert (=> b!1495327 (= c!138569 (= lt!651694 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495327 (= e!837558 e!837556)))

(declare-fun d!157213 () Bool)

(declare-fun lt!651692 () SeekEntryResult!12399)

(assert (=> d!157213 (and (or ((_ is Undefined!12399) lt!651692) (not ((_ is Found!12399) lt!651692)) (and (bvsge (index!51989 lt!651692) #b00000000000000000000000000000000) (bvslt (index!51989 lt!651692) (size!48709 a!2862)))) (or ((_ is Undefined!12399) lt!651692) ((_ is Found!12399) lt!651692) (not ((_ is MissingZero!12399) lt!651692)) (and (bvsge (index!51988 lt!651692) #b00000000000000000000000000000000) (bvslt (index!51988 lt!651692) (size!48709 a!2862)))) (or ((_ is Undefined!12399) lt!651692) ((_ is Found!12399) lt!651692) ((_ is MissingZero!12399) lt!651692) (not ((_ is MissingVacant!12399) lt!651692)) (and (bvsge (index!51991 lt!651692) #b00000000000000000000000000000000) (bvslt (index!51991 lt!651692) (size!48709 a!2862)))) (or ((_ is Undefined!12399) lt!651692) (ite ((_ is Found!12399) lt!651692) (= (select (arr!48159 a!2862) (index!51989 lt!651692)) (select (arr!48159 a!2862) j!93)) (ite ((_ is MissingZero!12399) lt!651692) (= (select (arr!48159 a!2862) (index!51988 lt!651692)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12399) lt!651692) (= (select (arr!48159 a!2862) (index!51991 lt!651692)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!157213 (= lt!651692 e!837557)))

(declare-fun c!138571 () Bool)

(assert (=> d!157213 (= c!138571 (and ((_ is Intermediate!12399) lt!651693) (undefined!13211 lt!651693)))))

(assert (=> d!157213 (= lt!651693 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48159 a!2862) j!93) mask!2687) (select (arr!48159 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!157213 (validMask!0 mask!2687)))

(assert (=> d!157213 (= (seekEntryOrOpen!0 (select (arr!48159 a!2862) j!93) a!2862 mask!2687) lt!651692)))

(assert (= (and d!157213 c!138571) b!1495325))

(assert (= (and d!157213 (not c!138571)) b!1495324))

(assert (= (and b!1495324 c!138570) b!1495326))

(assert (= (and b!1495324 (not c!138570)) b!1495327))

(assert (= (and b!1495327 c!138569) b!1495323))

(assert (= (and b!1495327 (not c!138569)) b!1495322))

(assert (=> b!1495322 m!1378653))

(declare-fun m!1378841 () Bool)

(assert (=> b!1495322 m!1378841))

(declare-fun m!1378843 () Bool)

(assert (=> b!1495324 m!1378843))

(assert (=> d!157213 m!1378679))

(assert (=> d!157213 m!1378653))

(assert (=> d!157213 m!1378681))

(declare-fun m!1378845 () Bool)

(assert (=> d!157213 m!1378845))

(assert (=> d!157213 m!1378653))

(assert (=> d!157213 m!1378679))

(assert (=> d!157213 m!1378697))

(declare-fun m!1378847 () Bool)

(assert (=> d!157213 m!1378847))

(declare-fun m!1378849 () Bool)

(assert (=> d!157213 m!1378849))

(assert (=> b!1495080 d!157213))

(declare-fun b!1495376 () Bool)

(declare-fun e!837587 () SeekEntryResult!12399)

(assert (=> b!1495376 (= e!837587 (MissingVacant!12399 intermediateAfterIndex!19))))

(declare-fun b!1495377 () Bool)

(declare-fun e!837585 () SeekEntryResult!12399)

(assert (=> b!1495377 (= e!837585 (Found!12399 index!646))))

(declare-fun b!1495378 () Bool)

(declare-fun e!837586 () SeekEntryResult!12399)

(assert (=> b!1495378 (= e!837586 e!837585)))

(declare-fun c!138590 () Bool)

(declare-fun lt!651715 () (_ BitVec 64))

(assert (=> b!1495378 (= c!138590 (= lt!651715 lt!651608))))

(declare-fun lt!651714 () SeekEntryResult!12399)

(declare-fun d!157221 () Bool)

(assert (=> d!157221 (and (or ((_ is Undefined!12399) lt!651714) (not ((_ is Found!12399) lt!651714)) (and (bvsge (index!51989 lt!651714) #b00000000000000000000000000000000) (bvslt (index!51989 lt!651714) (size!48709 lt!651607)))) (or ((_ is Undefined!12399) lt!651714) ((_ is Found!12399) lt!651714) (not ((_ is MissingVacant!12399) lt!651714)) (not (= (index!51991 lt!651714) intermediateAfterIndex!19)) (and (bvsge (index!51991 lt!651714) #b00000000000000000000000000000000) (bvslt (index!51991 lt!651714) (size!48709 lt!651607)))) (or ((_ is Undefined!12399) lt!651714) (ite ((_ is Found!12399) lt!651714) (= (select (arr!48159 lt!651607) (index!51989 lt!651714)) lt!651608) (and ((_ is MissingVacant!12399) lt!651714) (= (index!51991 lt!651714) intermediateAfterIndex!19) (= (select (arr!48159 lt!651607) (index!51991 lt!651714)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157221 (= lt!651714 e!837586)))

(declare-fun c!138591 () Bool)

(assert (=> d!157221 (= c!138591 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!157221 (= lt!651715 (select (arr!48159 lt!651607) index!646))))

(assert (=> d!157221 (validMask!0 mask!2687)))

(assert (=> d!157221 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651608 lt!651607 mask!2687) lt!651714)))

(declare-fun b!1495379 () Bool)

(assert (=> b!1495379 (= e!837586 Undefined!12399)))

(declare-fun b!1495380 () Bool)

(assert (=> b!1495380 (= e!837587 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!651608 lt!651607 mask!2687))))

(declare-fun b!1495381 () Bool)

(declare-fun c!138592 () Bool)

(assert (=> b!1495381 (= c!138592 (= lt!651715 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495381 (= e!837585 e!837587)))

(assert (= (and d!157221 c!138591) b!1495379))

(assert (= (and d!157221 (not c!138591)) b!1495378))

(assert (= (and b!1495378 c!138590) b!1495377))

(assert (= (and b!1495378 (not c!138590)) b!1495381))

(assert (= (and b!1495381 c!138592) b!1495376))

(assert (= (and b!1495381 (not c!138592)) b!1495380))

(declare-fun m!1378879 () Bool)

(assert (=> d!157221 m!1378879))

(declare-fun m!1378881 () Bool)

(assert (=> d!157221 m!1378881))

(assert (=> d!157221 m!1378793))

(assert (=> d!157221 m!1378697))

(assert (=> b!1495380 m!1378683))

(assert (=> b!1495380 m!1378683))

(declare-fun m!1378883 () Bool)

(assert (=> b!1495380 m!1378883))

(assert (=> b!1495091 d!157221))

(declare-fun lt!651717 () SeekEntryResult!12399)

(declare-fun b!1495382 () Bool)

(declare-fun e!837588 () SeekEntryResult!12399)

(assert (=> b!1495382 (= e!837588 (seekKeyOrZeroReturnVacant!0 (x!133595 lt!651717) (index!51990 lt!651717) (index!51990 lt!651717) lt!651608 lt!651607 mask!2687))))

(declare-fun b!1495383 () Bool)

(assert (=> b!1495383 (= e!837588 (MissingZero!12399 (index!51990 lt!651717)))))

(declare-fun b!1495384 () Bool)

(declare-fun e!837589 () SeekEntryResult!12399)

(declare-fun e!837590 () SeekEntryResult!12399)

(assert (=> b!1495384 (= e!837589 e!837590)))

(declare-fun lt!651718 () (_ BitVec 64))

(assert (=> b!1495384 (= lt!651718 (select (arr!48159 lt!651607) (index!51990 lt!651717)))))

(declare-fun c!138594 () Bool)

(assert (=> b!1495384 (= c!138594 (= lt!651718 lt!651608))))

(declare-fun b!1495385 () Bool)

(assert (=> b!1495385 (= e!837589 Undefined!12399)))

(declare-fun b!1495386 () Bool)

(assert (=> b!1495386 (= e!837590 (Found!12399 (index!51990 lt!651717)))))

(declare-fun b!1495387 () Bool)

(declare-fun c!138593 () Bool)

(assert (=> b!1495387 (= c!138593 (= lt!651718 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495387 (= e!837590 e!837588)))

(declare-fun d!157239 () Bool)

(declare-fun lt!651716 () SeekEntryResult!12399)

(assert (=> d!157239 (and (or ((_ is Undefined!12399) lt!651716) (not ((_ is Found!12399) lt!651716)) (and (bvsge (index!51989 lt!651716) #b00000000000000000000000000000000) (bvslt (index!51989 lt!651716) (size!48709 lt!651607)))) (or ((_ is Undefined!12399) lt!651716) ((_ is Found!12399) lt!651716) (not ((_ is MissingZero!12399) lt!651716)) (and (bvsge (index!51988 lt!651716) #b00000000000000000000000000000000) (bvslt (index!51988 lt!651716) (size!48709 lt!651607)))) (or ((_ is Undefined!12399) lt!651716) ((_ is Found!12399) lt!651716) ((_ is MissingZero!12399) lt!651716) (not ((_ is MissingVacant!12399) lt!651716)) (and (bvsge (index!51991 lt!651716) #b00000000000000000000000000000000) (bvslt (index!51991 lt!651716) (size!48709 lt!651607)))) (or ((_ is Undefined!12399) lt!651716) (ite ((_ is Found!12399) lt!651716) (= (select (arr!48159 lt!651607) (index!51989 lt!651716)) lt!651608) (ite ((_ is MissingZero!12399) lt!651716) (= (select (arr!48159 lt!651607) (index!51988 lt!651716)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12399) lt!651716) (= (select (arr!48159 lt!651607) (index!51991 lt!651716)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!157239 (= lt!651716 e!837589)))

(declare-fun c!138595 () Bool)

(assert (=> d!157239 (= c!138595 (and ((_ is Intermediate!12399) lt!651717) (undefined!13211 lt!651717)))))

(assert (=> d!157239 (= lt!651717 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651608 mask!2687) lt!651608 lt!651607 mask!2687))))

(assert (=> d!157239 (validMask!0 mask!2687)))

(assert (=> d!157239 (= (seekEntryOrOpen!0 lt!651608 lt!651607 mask!2687) lt!651716)))

(assert (= (and d!157239 c!138595) b!1495385))

(assert (= (and d!157239 (not c!138595)) b!1495384))

(assert (= (and b!1495384 c!138594) b!1495386))

(assert (= (and b!1495384 (not c!138594)) b!1495387))

(assert (= (and b!1495387 c!138593) b!1495383))

(assert (= (and b!1495387 (not c!138593)) b!1495382))

(declare-fun m!1378885 () Bool)

(assert (=> b!1495382 m!1378885))

(declare-fun m!1378887 () Bool)

(assert (=> b!1495384 m!1378887))

(assert (=> d!157239 m!1378669))

(assert (=> d!157239 m!1378671))

(declare-fun m!1378889 () Bool)

(assert (=> d!157239 m!1378889))

(assert (=> d!157239 m!1378669))

(assert (=> d!157239 m!1378697))

(declare-fun m!1378891 () Bool)

(assert (=> d!157239 m!1378891))

(declare-fun m!1378893 () Bool)

(assert (=> d!157239 m!1378893))

(assert (=> b!1495091 d!157239))

(declare-fun b!1495388 () Bool)

(declare-fun e!837593 () SeekEntryResult!12399)

(assert (=> b!1495388 (= e!837593 (MissingVacant!12399 intermediateAfterIndex!19))))

(declare-fun b!1495389 () Bool)

(declare-fun e!837591 () SeekEntryResult!12399)

(assert (=> b!1495389 (= e!837591 (Found!12399 lt!651604))))

(declare-fun b!1495390 () Bool)

(declare-fun e!837592 () SeekEntryResult!12399)

(assert (=> b!1495390 (= e!837592 e!837591)))

(declare-fun c!138596 () Bool)

(declare-fun lt!651720 () (_ BitVec 64))

(assert (=> b!1495390 (= c!138596 (= lt!651720 lt!651608))))

(declare-fun d!157241 () Bool)

(declare-fun lt!651719 () SeekEntryResult!12399)

(assert (=> d!157241 (and (or ((_ is Undefined!12399) lt!651719) (not ((_ is Found!12399) lt!651719)) (and (bvsge (index!51989 lt!651719) #b00000000000000000000000000000000) (bvslt (index!51989 lt!651719) (size!48709 lt!651607)))) (or ((_ is Undefined!12399) lt!651719) ((_ is Found!12399) lt!651719) (not ((_ is MissingVacant!12399) lt!651719)) (not (= (index!51991 lt!651719) intermediateAfterIndex!19)) (and (bvsge (index!51991 lt!651719) #b00000000000000000000000000000000) (bvslt (index!51991 lt!651719) (size!48709 lt!651607)))) (or ((_ is Undefined!12399) lt!651719) (ite ((_ is Found!12399) lt!651719) (= (select (arr!48159 lt!651607) (index!51989 lt!651719)) lt!651608) (and ((_ is MissingVacant!12399) lt!651719) (= (index!51991 lt!651719) intermediateAfterIndex!19) (= (select (arr!48159 lt!651607) (index!51991 lt!651719)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157241 (= lt!651719 e!837592)))

(declare-fun c!138597 () Bool)

(assert (=> d!157241 (= c!138597 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(assert (=> d!157241 (= lt!651720 (select (arr!48159 lt!651607) lt!651604))))

(assert (=> d!157241 (validMask!0 mask!2687)))

(assert (=> d!157241 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651604 intermediateAfterIndex!19 lt!651608 lt!651607 mask!2687) lt!651719)))

(declare-fun b!1495391 () Bool)

(assert (=> b!1495391 (= e!837592 Undefined!12399)))

(declare-fun b!1495392 () Bool)

(assert (=> b!1495392 (= e!837593 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!651604 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) intermediateAfterIndex!19 lt!651608 lt!651607 mask!2687))))

(declare-fun b!1495393 () Bool)

(declare-fun c!138598 () Bool)

(assert (=> b!1495393 (= c!138598 (= lt!651720 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495393 (= e!837591 e!837593)))

(assert (= (and d!157241 c!138597) b!1495391))

(assert (= (and d!157241 (not c!138597)) b!1495390))

(assert (= (and b!1495390 c!138596) b!1495389))

(assert (= (and b!1495390 (not c!138596)) b!1495393))

(assert (= (and b!1495393 c!138598) b!1495388))

(assert (= (and b!1495393 (not c!138598)) b!1495392))

(declare-fun m!1378895 () Bool)

(assert (=> d!157241 m!1378895))

(declare-fun m!1378897 () Bool)

(assert (=> d!157241 m!1378897))

(assert (=> d!157241 m!1378807))

(assert (=> d!157241 m!1378697))

(assert (=> b!1495392 m!1378779))

(assert (=> b!1495392 m!1378779))

(declare-fun m!1378899 () Bool)

(assert (=> b!1495392 m!1378899))

(assert (=> b!1495090 d!157241))

(assert (=> b!1495090 d!157239))

(declare-fun d!157243 () Bool)

(declare-fun lt!651727 () (_ BitVec 32))

(assert (=> d!157243 (and (bvsge lt!651727 #b00000000000000000000000000000000) (bvslt lt!651727 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!157243 (= lt!651727 (choose!52 index!646 x!665 mask!2687))))

(assert (=> d!157243 (validMask!0 mask!2687)))

(assert (=> d!157243 (= (nextIndex!0 index!646 x!665 mask!2687) lt!651727)))

(declare-fun bs!42913 () Bool)

(assert (= bs!42913 d!157243))

(declare-fun m!1378901 () Bool)

(assert (=> bs!42913 m!1378901))

(assert (=> bs!42913 m!1378697))

(assert (=> b!1495079 d!157243))

(check-sat (not bm!68003) (not d!157201) (not bm!67999) (not b!1495199) (not d!157177) (not d!157243) (not d!157221) (not d!157213) (not b!1495240) (not b!1495254) (not d!157195) (not b!1495239) (not d!157183) (not b!1495255) (not b!1495322) (not b!1495200) (not b!1495392) (not b!1495225) (not d!157191) (not b!1495382) (not b!1495216) (not b!1495242) (not bm!68002) (not b!1495262) (not b!1495186) (not b!1495380) (not d!157239) (not d!157241) (not b!1495249) (not b!1495207) (not d!157207) (not d!157189))
(check-sat)
