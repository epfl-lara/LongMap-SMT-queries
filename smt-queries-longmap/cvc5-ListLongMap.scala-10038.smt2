; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118548 () Bool)

(assert start!118548)

(declare-fun b!1385368 () Bool)

(declare-datatypes ((Unit!46067 0))(
  ( (Unit!46068) )
))
(declare-fun e!785176 () Unit!46067)

(declare-fun lt!609244 () Unit!46067)

(assert (=> b!1385368 (= e!785176 lt!609244)))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94749 0))(
  ( (array!94750 (arr!45750 (Array (_ BitVec 32) (_ BitVec 64))) (size!46301 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94749)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun lt!609246 () Unit!46067)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94749 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46067)

(assert (=> b!1385368 (= lt!609246 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10046 0))(
  ( (MissingZero!10046 (index!42555 (_ BitVec 32))) (Found!10046 (index!42556 (_ BitVec 32))) (Intermediate!10046 (undefined!10858 Bool) (index!42557 (_ BitVec 32)) (x!124213 (_ BitVec 32))) (Undefined!10046) (MissingVacant!10046 (index!42558 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94749 (_ BitVec 32)) SeekEntryResult!10046)

(assert (=> b!1385368 (= (seekEntryOrOpen!0 (select (arr!45750 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45750 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94750 (store (arr!45750 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46301 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94749 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46067)

(assert (=> b!1385368 (= lt!609244 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94749 (_ BitVec 32)) Bool)

(assert (=> b!1385368 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun res!926103 () Bool)

(declare-fun e!785179 () Bool)

(assert (=> start!118548 (=> (not res!926103) (not e!785179))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118548 (= res!926103 (validMask!0 mask!2987))))

(assert (=> start!118548 e!785179))

(assert (=> start!118548 true))

(declare-fun array_inv!35031 (array!94749) Bool)

(assert (=> start!118548 (array_inv!35031 a!2938)))

(declare-fun b!1385369 () Bool)

(declare-fun res!926106 () Bool)

(assert (=> b!1385369 (=> (not res!926106) (not e!785179))))

(assert (=> b!1385369 (= res!926106 (and (= (size!46301 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46301 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46301 a!2938))))))

(declare-fun b!1385370 () Bool)

(declare-fun res!926101 () Bool)

(assert (=> b!1385370 (=> (not res!926101) (not e!785179))))

(assert (=> b!1385370 (= res!926101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385371 () Bool)

(declare-fun res!926105 () Bool)

(assert (=> b!1385371 (=> (not res!926105) (not e!785179))))

(assert (=> b!1385371 (= res!926105 (and (not (= (select (arr!45750 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45750 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1385372 () Bool)

(declare-fun res!926104 () Bool)

(assert (=> b!1385372 (=> (not res!926104) (not e!785179))))

(declare-datatypes ((List!32265 0))(
  ( (Nil!32262) (Cons!32261 (h!33479 (_ BitVec 64)) (t!46951 List!32265)) )
))
(declare-fun arrayNoDuplicates!0 (array!94749 (_ BitVec 32) List!32265) Bool)

(assert (=> b!1385372 (= res!926104 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32262))))

(declare-fun b!1385373 () Bool)

(assert (=> b!1385373 (= e!785179 false)))

(declare-fun lt!609245 () Unit!46067)

(assert (=> b!1385373 (= lt!609245 e!785176)))

(declare-fun c!129081 () Bool)

(declare-fun e!785178 () Bool)

(assert (=> b!1385373 (= c!129081 e!785178)))

(declare-fun res!926107 () Bool)

(assert (=> b!1385373 (=> (not res!926107) (not e!785178))))

(assert (=> b!1385373 (= res!926107 (not (= startIndex!16 i!1065)))))

(declare-fun b!1385374 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385374 (= e!785178 (validKeyInArray!0 (select (arr!45750 a!2938) startIndex!16)))))

(declare-fun b!1385375 () Bool)

(declare-fun res!926102 () Bool)

(assert (=> b!1385375 (=> (not res!926102) (not e!785179))))

(assert (=> b!1385375 (= res!926102 (validKeyInArray!0 (select (arr!45750 a!2938) i!1065)))))

(declare-fun b!1385376 () Bool)

(declare-fun Unit!46069 () Unit!46067)

(assert (=> b!1385376 (= e!785176 Unit!46069)))

(assert (= (and start!118548 res!926103) b!1385369))

(assert (= (and b!1385369 res!926106) b!1385375))

(assert (= (and b!1385375 res!926102) b!1385372))

(assert (= (and b!1385372 res!926104) b!1385370))

(assert (= (and b!1385370 res!926101) b!1385371))

(assert (= (and b!1385371 res!926105) b!1385373))

(assert (= (and b!1385373 res!926107) b!1385374))

(assert (= (and b!1385373 c!129081) b!1385368))

(assert (= (and b!1385373 (not c!129081)) b!1385376))

(declare-fun m!1270893 () Bool)

(assert (=> b!1385372 m!1270893))

(declare-fun m!1270895 () Bool)

(assert (=> start!118548 m!1270895))

(declare-fun m!1270897 () Bool)

(assert (=> start!118548 m!1270897))

(declare-fun m!1270899 () Bool)

(assert (=> b!1385375 m!1270899))

(assert (=> b!1385375 m!1270899))

(declare-fun m!1270901 () Bool)

(assert (=> b!1385375 m!1270901))

(declare-fun m!1270903 () Bool)

(assert (=> b!1385368 m!1270903))

(declare-fun m!1270905 () Bool)

(assert (=> b!1385368 m!1270905))

(assert (=> b!1385368 m!1270905))

(declare-fun m!1270907 () Bool)

(assert (=> b!1385368 m!1270907))

(declare-fun m!1270909 () Bool)

(assert (=> b!1385368 m!1270909))

(declare-fun m!1270911 () Bool)

(assert (=> b!1385368 m!1270911))

(declare-fun m!1270913 () Bool)

(assert (=> b!1385368 m!1270913))

(declare-fun m!1270915 () Bool)

(assert (=> b!1385368 m!1270915))

(assert (=> b!1385368 m!1270913))

(declare-fun m!1270917 () Bool)

(assert (=> b!1385368 m!1270917))

(declare-fun m!1270919 () Bool)

(assert (=> b!1385370 m!1270919))

(assert (=> b!1385371 m!1270899))

(assert (=> b!1385374 m!1270913))

(assert (=> b!1385374 m!1270913))

(declare-fun m!1270921 () Bool)

(assert (=> b!1385374 m!1270921))

(push 1)

(assert (not b!1385375))

(assert (not b!1385370))

(assert (not b!1385374))

(assert (not b!1385368))

(assert (not start!118548))

(assert (not b!1385372))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

