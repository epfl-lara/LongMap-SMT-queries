; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127270 () Bool)

(assert start!127270)

(declare-fun b!1495661 () Bool)

(declare-fun res!1017375 () Bool)

(declare-fun e!837746 () Bool)

(assert (=> b!1495661 (=> res!1017375 e!837746)))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12401 0))(
  ( (MissingZero!12401 (index!51996 (_ BitVec 32))) (Found!12401 (index!51997 (_ BitVec 32))) (Intermediate!12401 (undefined!13213 Bool) (index!51998 (_ BitVec 32)) (x!133617 (_ BitVec 32))) (Undefined!12401) (MissingVacant!12401 (index!51999 (_ BitVec 32))) )
))
(declare-fun lt!651827 () SeekEntryResult!12401)

(declare-fun lt!651828 () (_ BitVec 32))

(declare-datatypes ((array!99791 0))(
  ( (array!99792 (arr!48161 (Array (_ BitVec 32) (_ BitVec 64))) (size!48711 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99791)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99791 (_ BitVec 32)) SeekEntryResult!12401)

(assert (=> b!1495661 (= res!1017375 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651828 (select (arr!48161 a!2862) j!93) a!2862 mask!2687) lt!651827)))))

(declare-fun b!1495662 () Bool)

(declare-fun res!1017376 () Bool)

(assert (=> b!1495662 (=> res!1017376 e!837746)))

(declare-fun e!837755 () Bool)

(assert (=> b!1495662 (= res!1017376 e!837755)))

(declare-fun c!138683 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1495662 (= c!138683 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1495663 () Bool)

(declare-fun res!1017368 () Bool)

(declare-fun e!837747 () Bool)

(assert (=> b!1495663 (=> (not res!1017368) (not e!837747))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1495663 (= res!1017368 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1495664 () Bool)

(declare-fun res!1017364 () Bool)

(declare-fun e!837754 () Bool)

(assert (=> b!1495664 (=> (not res!1017364) (not e!837754))))

(declare-datatypes ((List!34662 0))(
  ( (Nil!34659) (Cons!34658 (h!36053 (_ BitVec 64)) (t!49356 List!34662)) )
))
(declare-fun arrayNoDuplicates!0 (array!99791 (_ BitVec 32) List!34662) Bool)

(assert (=> b!1495664 (= res!1017364 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34659))))

(declare-fun lt!651826 () SeekEntryResult!12401)

(declare-fun b!1495665 () Bool)

(declare-fun lt!651829 () (_ BitVec 64))

(declare-fun lt!651831 () array!99791)

(assert (=> b!1495665 (= e!837755 (not (= lt!651826 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651828 lt!651829 lt!651831 mask!2687))))))

(declare-fun b!1495666 () Bool)

(declare-fun e!837749 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1495666 (= e!837749 (or (= (select (arr!48161 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48161 a!2862) intermediateBeforeIndex!19) (select (arr!48161 a!2862) j!93))))))

(declare-fun b!1495668 () Bool)

(declare-fun res!1017374 () Bool)

(assert (=> b!1495668 (=> (not res!1017374) (not e!837754))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99791 (_ BitVec 32)) Bool)

(assert (=> b!1495668 (= res!1017374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1495669 () Bool)

(declare-fun res!1017365 () Bool)

(assert (=> b!1495669 (=> (not res!1017365) (not e!837754))))

(assert (=> b!1495669 (= res!1017365 (and (= (size!48711 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48711 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48711 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1495670 () Bool)

(declare-fun e!837753 () Bool)

(assert (=> b!1495670 (= e!837753 e!837747)))

(declare-fun res!1017370 () Bool)

(assert (=> b!1495670 (=> (not res!1017370) (not e!837747))))

(assert (=> b!1495670 (= res!1017370 (= lt!651826 (Intermediate!12401 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1495670 (= lt!651826 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651829 mask!2687) lt!651829 lt!651831 mask!2687))))

(assert (=> b!1495670 (= lt!651829 (select (store (arr!48161 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1495671 () Bool)

(declare-fun e!837748 () Bool)

(assert (=> b!1495671 (= e!837748 e!837753)))

(declare-fun res!1017362 () Bool)

(assert (=> b!1495671 (=> (not res!1017362) (not e!837753))))

(assert (=> b!1495671 (= res!1017362 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48161 a!2862) j!93) mask!2687) (select (arr!48161 a!2862) j!93) a!2862 mask!2687) lt!651827))))

(assert (=> b!1495671 (= lt!651827 (Intermediate!12401 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1495672 () Bool)

(assert (=> b!1495672 (= e!837754 e!837748)))

(declare-fun res!1017378 () Bool)

(assert (=> b!1495672 (=> (not res!1017378) (not e!837748))))

(assert (=> b!1495672 (= res!1017378 (= (select (store (arr!48161 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495672 (= lt!651831 (array!99792 (store (arr!48161 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48711 a!2862)))))

(declare-fun b!1495673 () Bool)

(declare-fun e!837750 () Bool)

(assert (=> b!1495673 (= e!837747 (not e!837750))))

(declare-fun res!1017363 () Bool)

(assert (=> b!1495673 (=> res!1017363 e!837750)))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1495673 (= res!1017363 (or (and (= (select (arr!48161 a!2862) index!646) (select (store (arr!48161 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48161 a!2862) index!646) (select (arr!48161 a!2862) j!93))) (= (select (arr!48161 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1495673 e!837749))

(declare-fun res!1017373 () Bool)

(assert (=> b!1495673 (=> (not res!1017373) (not e!837749))))

(assert (=> b!1495673 (= res!1017373 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50142 0))(
  ( (Unit!50143) )
))
(declare-fun lt!651830 () Unit!50142)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99791 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50142)

(assert (=> b!1495673 (= lt!651830 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1495674 () Bool)

(declare-fun res!1017371 () Bool)

(assert (=> b!1495674 (=> (not res!1017371) (not e!837754))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1495674 (= res!1017371 (validKeyInArray!0 (select (arr!48161 a!2862) j!93)))))

(declare-fun b!1495675 () Bool)

(assert (=> b!1495675 (= e!837750 e!837746)))

(declare-fun res!1017367 () Bool)

(assert (=> b!1495675 (=> res!1017367 e!837746)))

(assert (=> b!1495675 (= res!1017367 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!651828 #b00000000000000000000000000000000) (bvsge lt!651828 (size!48711 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1495675 (= lt!651828 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun e!837751 () Bool)

(declare-fun b!1495676 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99791 (_ BitVec 32)) SeekEntryResult!12401)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99791 (_ BitVec 32)) SeekEntryResult!12401)

(assert (=> b!1495676 (= e!837751 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651829 lt!651831 mask!2687) (seekEntryOrOpen!0 lt!651829 lt!651831 mask!2687)))))

(declare-fun b!1495667 () Bool)

(declare-fun res!1017369 () Bool)

(assert (=> b!1495667 (=> (not res!1017369) (not e!837754))))

(assert (=> b!1495667 (= res!1017369 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48711 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48711 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48711 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!1017379 () Bool)

(assert (=> start!127270 (=> (not res!1017379) (not e!837754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127270 (= res!1017379 (validMask!0 mask!2687))))

(assert (=> start!127270 e!837754))

(assert (=> start!127270 true))

(declare-fun array_inv!37189 (array!99791) Bool)

(assert (=> start!127270 (array_inv!37189 a!2862)))

(declare-fun b!1495677 () Bool)

(assert (=> b!1495677 (= e!837746 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1495678 () Bool)

(assert (=> b!1495678 (= e!837751 (= lt!651826 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651829 lt!651831 mask!2687)))))

(declare-fun b!1495679 () Bool)

(declare-fun res!1017377 () Bool)

(assert (=> b!1495679 (=> (not res!1017377) (not e!837747))))

(assert (=> b!1495679 (= res!1017377 e!837751)))

(declare-fun c!138684 () Bool)

(assert (=> b!1495679 (= c!138684 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1495680 () Bool)

(declare-fun res!1017366 () Bool)

(assert (=> b!1495680 (=> (not res!1017366) (not e!837753))))

(assert (=> b!1495680 (= res!1017366 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48161 a!2862) j!93) a!2862 mask!2687) lt!651827))))

(declare-fun b!1495681 () Bool)

(assert (=> b!1495681 (= e!837755 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651828 intermediateAfterIndex!19 lt!651829 lt!651831 mask!2687) (seekEntryOrOpen!0 lt!651829 lt!651831 mask!2687))))))

(declare-fun b!1495682 () Bool)

(declare-fun res!1017361 () Bool)

(assert (=> b!1495682 (=> (not res!1017361) (not e!837754))))

(assert (=> b!1495682 (= res!1017361 (validKeyInArray!0 (select (arr!48161 a!2862) i!1006)))))

(declare-fun b!1495683 () Bool)

(declare-fun res!1017372 () Bool)

(assert (=> b!1495683 (=> (not res!1017372) (not e!837749))))

(assert (=> b!1495683 (= res!1017372 (= (seekEntryOrOpen!0 (select (arr!48161 a!2862) j!93) a!2862 mask!2687) (Found!12401 j!93)))))

(assert (= (and start!127270 res!1017379) b!1495669))

(assert (= (and b!1495669 res!1017365) b!1495682))

(assert (= (and b!1495682 res!1017361) b!1495674))

(assert (= (and b!1495674 res!1017371) b!1495668))

(assert (= (and b!1495668 res!1017374) b!1495664))

(assert (= (and b!1495664 res!1017364) b!1495667))

(assert (= (and b!1495667 res!1017369) b!1495672))

(assert (= (and b!1495672 res!1017378) b!1495671))

(assert (= (and b!1495671 res!1017362) b!1495680))

(assert (= (and b!1495680 res!1017366) b!1495670))

(assert (= (and b!1495670 res!1017370) b!1495679))

(assert (= (and b!1495679 c!138684) b!1495678))

(assert (= (and b!1495679 (not c!138684)) b!1495676))

(assert (= (and b!1495679 res!1017377) b!1495663))

(assert (= (and b!1495663 res!1017368) b!1495673))

(assert (= (and b!1495673 res!1017373) b!1495683))

(assert (= (and b!1495683 res!1017372) b!1495666))

(assert (= (and b!1495673 (not res!1017363)) b!1495675))

(assert (= (and b!1495675 (not res!1017367)) b!1495661))

(assert (= (and b!1495661 (not res!1017375)) b!1495662))

(assert (= (and b!1495662 c!138683) b!1495665))

(assert (= (and b!1495662 (not c!138683)) b!1495681))

(assert (= (and b!1495662 (not res!1017376)) b!1495677))

(declare-fun m!1379053 () Bool)

(assert (=> b!1495678 m!1379053))

(declare-fun m!1379055 () Bool)

(assert (=> b!1495680 m!1379055))

(assert (=> b!1495680 m!1379055))

(declare-fun m!1379057 () Bool)

(assert (=> b!1495680 m!1379057))

(declare-fun m!1379059 () Bool)

(assert (=> b!1495676 m!1379059))

(declare-fun m!1379061 () Bool)

(assert (=> b!1495676 m!1379061))

(assert (=> b!1495671 m!1379055))

(assert (=> b!1495671 m!1379055))

(declare-fun m!1379063 () Bool)

(assert (=> b!1495671 m!1379063))

(assert (=> b!1495671 m!1379063))

(assert (=> b!1495671 m!1379055))

(declare-fun m!1379065 () Bool)

(assert (=> b!1495671 m!1379065))

(declare-fun m!1379067 () Bool)

(assert (=> b!1495675 m!1379067))

(declare-fun m!1379069 () Bool)

(assert (=> b!1495681 m!1379069))

(assert (=> b!1495681 m!1379061))

(assert (=> b!1495683 m!1379055))

(assert (=> b!1495683 m!1379055))

(declare-fun m!1379071 () Bool)

(assert (=> b!1495683 m!1379071))

(declare-fun m!1379073 () Bool)

(assert (=> b!1495668 m!1379073))

(declare-fun m!1379075 () Bool)

(assert (=> start!127270 m!1379075))

(declare-fun m!1379077 () Bool)

(assert (=> start!127270 m!1379077))

(declare-fun m!1379079 () Bool)

(assert (=> b!1495673 m!1379079))

(declare-fun m!1379081 () Bool)

(assert (=> b!1495673 m!1379081))

(declare-fun m!1379083 () Bool)

(assert (=> b!1495673 m!1379083))

(declare-fun m!1379085 () Bool)

(assert (=> b!1495673 m!1379085))

(declare-fun m!1379087 () Bool)

(assert (=> b!1495673 m!1379087))

(assert (=> b!1495673 m!1379055))

(assert (=> b!1495672 m!1379081))

(declare-fun m!1379089 () Bool)

(assert (=> b!1495672 m!1379089))

(declare-fun m!1379091 () Bool)

(assert (=> b!1495666 m!1379091))

(assert (=> b!1495666 m!1379055))

(declare-fun m!1379093 () Bool)

(assert (=> b!1495670 m!1379093))

(assert (=> b!1495670 m!1379093))

(declare-fun m!1379095 () Bool)

(assert (=> b!1495670 m!1379095))

(assert (=> b!1495670 m!1379081))

(declare-fun m!1379097 () Bool)

(assert (=> b!1495670 m!1379097))

(declare-fun m!1379099 () Bool)

(assert (=> b!1495665 m!1379099))

(declare-fun m!1379101 () Bool)

(assert (=> b!1495664 m!1379101))

(declare-fun m!1379103 () Bool)

(assert (=> b!1495682 m!1379103))

(assert (=> b!1495682 m!1379103))

(declare-fun m!1379105 () Bool)

(assert (=> b!1495682 m!1379105))

(assert (=> b!1495661 m!1379055))

(assert (=> b!1495661 m!1379055))

(declare-fun m!1379107 () Bool)

(assert (=> b!1495661 m!1379107))

(assert (=> b!1495674 m!1379055))

(assert (=> b!1495674 m!1379055))

(declare-fun m!1379109 () Bool)

(assert (=> b!1495674 m!1379109))

(push 1)

(assert (not b!1495676))

(assert (not b!1495674))

(assert (not b!1495661))

(assert (not b!1495681))

(assert (not b!1495683))

(assert (not b!1495671))

(assert (not start!127270))

(assert (not b!1495665))

(assert (not b!1495680))

(assert (not b!1495668))

(assert (not b!1495682))

(assert (not b!1495678))

(assert (not b!1495675))

(assert (not b!1495664))

(assert (not b!1495673))

(assert (not b!1495670))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

