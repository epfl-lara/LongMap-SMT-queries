; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130224 () Bool)

(assert start!130224)

(declare-fun b!1528586 () Bool)

(declare-fun e!851965 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101574 0))(
  ( (array!101575 (arr!49012 (Array (_ BitVec 32) (_ BitVec 64))) (size!49562 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101574)

(declare-datatypes ((SeekEntryResult!13177 0))(
  ( (MissingZero!13177 (index!55103 (_ BitVec 32))) (Found!13177 (index!55104 (_ BitVec 32))) (Intermediate!13177 (undefined!13989 Bool) (index!55105 (_ BitVec 32)) (x!136792 (_ BitVec 32))) (Undefined!13177) (MissingVacant!13177 (index!55106 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101574 (_ BitVec 32)) SeekEntryResult!13177)

(assert (=> b!1528586 (= e!851965 (= (seekEntry!0 (select (arr!49012 a!2804) j!70) a!2804 mask!2512) (Found!13177 j!70)))))

(declare-fun b!1528587 () Bool)

(declare-fun res!1046294 () Bool)

(declare-fun e!851964 () Bool)

(assert (=> b!1528587 (=> (not res!1046294) (not e!851964))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101574 (_ BitVec 32)) Bool)

(assert (=> b!1528587 (= res!1046294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1528588 () Bool)

(declare-fun res!1046302 () Bool)

(assert (=> b!1528588 (=> (not res!1046302) (not e!851964))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1528588 (= res!1046302 (validKeyInArray!0 (select (arr!49012 a!2804) i!961)))))

(declare-fun b!1528589 () Bool)

(declare-fun res!1046305 () Bool)

(assert (=> b!1528589 (=> (not res!1046305) (not e!851964))))

(declare-datatypes ((List!35495 0))(
  ( (Nil!35492) (Cons!35491 (h!36927 (_ BitVec 64)) (t!50189 List!35495)) )
))
(declare-fun arrayNoDuplicates!0 (array!101574 (_ BitVec 32) List!35495) Bool)

(assert (=> b!1528589 (= res!1046305 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35492))))

(declare-fun b!1528591 () Bool)

(declare-fun e!851962 () Bool)

(declare-fun e!851961 () Bool)

(assert (=> b!1528591 (= e!851962 e!851961)))

(declare-fun res!1046299 () Bool)

(assert (=> b!1528591 (=> res!1046299 e!851961)))

(declare-fun lt!662097 () SeekEntryResult!13177)

(assert (=> b!1528591 (= res!1046299 (not (= lt!662097 (Found!13177 j!70))))))

(declare-fun lt!662093 () SeekEntryResult!13177)

(declare-fun lt!662092 () SeekEntryResult!13177)

(assert (=> b!1528591 (= lt!662093 lt!662092)))

(declare-fun lt!662094 () array!101574)

(declare-fun lt!662101 () (_ BitVec 64))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101574 (_ BitVec 32)) SeekEntryResult!13177)

(assert (=> b!1528591 (= lt!662092 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!662101 lt!662094 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101574 (_ BitVec 32)) SeekEntryResult!13177)

(assert (=> b!1528591 (= lt!662093 (seekEntryOrOpen!0 lt!662101 lt!662094 mask!2512))))

(declare-fun lt!662098 () SeekEntryResult!13177)

(assert (=> b!1528591 (= lt!662098 lt!662097)))

(assert (=> b!1528591 (= lt!662097 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!49012 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1528591 (= lt!662098 (seekEntryOrOpen!0 (select (arr!49012 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528592 () Bool)

(declare-fun res!1046296 () Bool)

(assert (=> b!1528592 (=> (not res!1046296) (not e!851964))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1528592 (= res!1046296 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49562 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49562 a!2804))))))

(declare-fun b!1528593 () Bool)

(declare-fun res!1046301 () Bool)

(assert (=> b!1528593 (=> (not res!1046301) (not e!851964))))

(assert (=> b!1528593 (= res!1046301 (validKeyInArray!0 (select (arr!49012 a!2804) j!70)))))

(declare-fun b!1528594 () Bool)

(declare-fun e!851960 () Bool)

(assert (=> b!1528594 (= e!851964 e!851960)))

(declare-fun res!1046300 () Bool)

(assert (=> b!1528594 (=> (not res!1046300) (not e!851960))))

(declare-fun lt!662096 () SeekEntryResult!13177)

(declare-fun lt!662095 () SeekEntryResult!13177)

(assert (=> b!1528594 (= res!1046300 (= lt!662096 lt!662095))))

(assert (=> b!1528594 (= lt!662095 (Intermediate!13177 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101574 (_ BitVec 32)) SeekEntryResult!13177)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528594 (= lt!662096 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49012 a!2804) j!70) mask!2512) (select (arr!49012 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528595 () Bool)

(declare-fun e!851959 () Bool)

(assert (=> b!1528595 (= e!851960 e!851959)))

(declare-fun res!1046303 () Bool)

(assert (=> b!1528595 (=> (not res!1046303) (not e!851959))))

(assert (=> b!1528595 (= res!1046303 (= lt!662096 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!662101 mask!2512) lt!662101 lt!662094 mask!2512)))))

(assert (=> b!1528595 (= lt!662101 (select (store (arr!49012 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1528595 (= lt!662094 (array!101575 (store (arr!49012 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49562 a!2804)))))

(declare-fun b!1528596 () Bool)

(assert (=> b!1528596 (= e!851959 (not e!851962))))

(declare-fun res!1046298 () Bool)

(assert (=> b!1528596 (=> res!1046298 e!851962)))

(assert (=> b!1528596 (= res!1046298 (or (not (= (select (arr!49012 a!2804) j!70) lt!662101)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!49012 a!2804) index!487) (select (arr!49012 a!2804) j!70)) (not (= (select (arr!49012 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1528596 e!851965))

(declare-fun res!1046304 () Bool)

(assert (=> b!1528596 (=> (not res!1046304) (not e!851965))))

(assert (=> b!1528596 (= res!1046304 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51138 0))(
  ( (Unit!51139) )
))
(declare-fun lt!662099 () Unit!51138)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101574 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51138)

(assert (=> b!1528596 (= lt!662099 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1528590 () Bool)

(assert (=> b!1528590 (= e!851961 true)))

(assert (=> b!1528590 (= lt!662092 lt!662097)))

(declare-fun lt!662100 () Unit!51138)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101574 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51138)

(assert (=> b!1528590 (= lt!662100 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun res!1046295 () Bool)

(assert (=> start!130224 (=> (not res!1046295) (not e!851964))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130224 (= res!1046295 (validMask!0 mask!2512))))

(assert (=> start!130224 e!851964))

(assert (=> start!130224 true))

(declare-fun array_inv!38040 (array!101574) Bool)

(assert (=> start!130224 (array_inv!38040 a!2804)))

(declare-fun b!1528597 () Bool)

(declare-fun res!1046293 () Bool)

(assert (=> b!1528597 (=> (not res!1046293) (not e!851960))))

(assert (=> b!1528597 (= res!1046293 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49012 a!2804) j!70) a!2804 mask!2512) lt!662095))))

(declare-fun b!1528598 () Bool)

(declare-fun res!1046297 () Bool)

(assert (=> b!1528598 (=> (not res!1046297) (not e!851964))))

(assert (=> b!1528598 (= res!1046297 (and (= (size!49562 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49562 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49562 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!130224 res!1046295) b!1528598))

(assert (= (and b!1528598 res!1046297) b!1528588))

(assert (= (and b!1528588 res!1046302) b!1528593))

(assert (= (and b!1528593 res!1046301) b!1528587))

(assert (= (and b!1528587 res!1046294) b!1528589))

(assert (= (and b!1528589 res!1046305) b!1528592))

(assert (= (and b!1528592 res!1046296) b!1528594))

(assert (= (and b!1528594 res!1046300) b!1528597))

(assert (= (and b!1528597 res!1046293) b!1528595))

(assert (= (and b!1528595 res!1046303) b!1528596))

(assert (= (and b!1528596 res!1046304) b!1528586))

(assert (= (and b!1528596 (not res!1046298)) b!1528591))

(assert (= (and b!1528591 (not res!1046299)) b!1528590))

(declare-fun m!1411455 () Bool)

(assert (=> b!1528591 m!1411455))

(declare-fun m!1411457 () Bool)

(assert (=> b!1528591 m!1411457))

(assert (=> b!1528591 m!1411455))

(declare-fun m!1411459 () Bool)

(assert (=> b!1528591 m!1411459))

(declare-fun m!1411461 () Bool)

(assert (=> b!1528591 m!1411461))

(assert (=> b!1528591 m!1411455))

(declare-fun m!1411463 () Bool)

(assert (=> b!1528591 m!1411463))

(declare-fun m!1411465 () Bool)

(assert (=> b!1528595 m!1411465))

(assert (=> b!1528595 m!1411465))

(declare-fun m!1411467 () Bool)

(assert (=> b!1528595 m!1411467))

(declare-fun m!1411469 () Bool)

(assert (=> b!1528595 m!1411469))

(declare-fun m!1411471 () Bool)

(assert (=> b!1528595 m!1411471))

(assert (=> b!1528596 m!1411455))

(declare-fun m!1411473 () Bool)

(assert (=> b!1528596 m!1411473))

(declare-fun m!1411475 () Bool)

(assert (=> b!1528596 m!1411475))

(declare-fun m!1411477 () Bool)

(assert (=> b!1528596 m!1411477))

(declare-fun m!1411479 () Bool)

(assert (=> start!130224 m!1411479))

(declare-fun m!1411481 () Bool)

(assert (=> start!130224 m!1411481))

(declare-fun m!1411483 () Bool)

(assert (=> b!1528587 m!1411483))

(assert (=> b!1528586 m!1411455))

(assert (=> b!1528586 m!1411455))

(declare-fun m!1411485 () Bool)

(assert (=> b!1528586 m!1411485))

(assert (=> b!1528593 m!1411455))

(assert (=> b!1528593 m!1411455))

(declare-fun m!1411487 () Bool)

(assert (=> b!1528593 m!1411487))

(declare-fun m!1411489 () Bool)

(assert (=> b!1528589 m!1411489))

(assert (=> b!1528594 m!1411455))

(assert (=> b!1528594 m!1411455))

(declare-fun m!1411491 () Bool)

(assert (=> b!1528594 m!1411491))

(assert (=> b!1528594 m!1411491))

(assert (=> b!1528594 m!1411455))

(declare-fun m!1411493 () Bool)

(assert (=> b!1528594 m!1411493))

(declare-fun m!1411495 () Bool)

(assert (=> b!1528588 m!1411495))

(assert (=> b!1528588 m!1411495))

(declare-fun m!1411497 () Bool)

(assert (=> b!1528588 m!1411497))

(declare-fun m!1411499 () Bool)

(assert (=> b!1528590 m!1411499))

(assert (=> b!1528597 m!1411455))

(assert (=> b!1528597 m!1411455))

(declare-fun m!1411501 () Bool)

(assert (=> b!1528597 m!1411501))

(push 1)

