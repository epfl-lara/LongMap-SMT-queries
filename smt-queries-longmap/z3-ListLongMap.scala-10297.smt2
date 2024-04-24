; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121292 () Bool)

(assert start!121292)

(declare-fun b!1409200 () Bool)

(declare-fun res!946242 () Bool)

(declare-fun e!797661 () Bool)

(assert (=> b!1409200 (=> res!946242 e!797661)))

(declare-datatypes ((array!96368 0))(
  ( (array!96369 (arr!46525 (Array (_ BitVec 32) (_ BitVec 64))) (size!47076 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96368)

(declare-fun lt!620484 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10739 0))(
  ( (MissingZero!10739 (index!45333 (_ BitVec 32))) (Found!10739 (index!45334 (_ BitVec 32))) (Intermediate!10739 (undefined!11551 Bool) (index!45335 (_ BitVec 32)) (x!127095 (_ BitVec 32))) (Undefined!10739) (MissingVacant!10739 (index!45336 (_ BitVec 32))) )
))
(declare-fun lt!620483 () SeekEntryResult!10739)

(assert (=> b!1409200 (= res!946242 (or (bvslt (x!127095 lt!620483) #b00000000000000000000000000000000) (bvsgt (x!127095 lt!620483) #b01111111111111111111111111111110) (bvslt lt!620484 #b00000000000000000000000000000000) (bvsge lt!620484 (size!47076 a!2901)) (bvslt (index!45335 lt!620483) #b00000000000000000000000000000000) (bvsge (index!45335 lt!620483) (size!47076 a!2901)) (not (= lt!620483 (Intermediate!10739 false (index!45335 lt!620483) (x!127095 lt!620483))))))))

(declare-fun b!1409202 () Bool)

(declare-fun res!946243 () Bool)

(declare-fun e!797660 () Bool)

(assert (=> b!1409202 (=> (not res!946243) (not e!797660))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409202 (= res!946243 (validKeyInArray!0 (select (arr!46525 a!2901) i!1037)))))

(declare-fun b!1409203 () Bool)

(assert (=> b!1409203 (= e!797661 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!620485 () SeekEntryResult!10739)

(declare-fun lt!620482 () array!96368)

(declare-fun lt!620486 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96368 (_ BitVec 32)) SeekEntryResult!10739)

(assert (=> b!1409203 (= lt!620485 (seekEntryOrOpen!0 lt!620486 lt!620482 mask!2840))))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((Unit!47479 0))(
  ( (Unit!47480) )
))
(declare-fun lt!620481 () Unit!47479)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!96368 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47479)

(assert (=> b!1409203 (= lt!620481 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!620484 (x!127095 lt!620483) (index!45335 lt!620483) mask!2840))))

(declare-fun b!1409204 () Bool)

(declare-fun res!946246 () Bool)

(assert (=> b!1409204 (=> (not res!946246) (not e!797660))))

(assert (=> b!1409204 (= res!946246 (and (= (size!47076 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47076 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47076 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1409205 () Bool)

(declare-fun e!797662 () Bool)

(assert (=> b!1409205 (= e!797660 (not e!797662))))

(declare-fun res!946245 () Bool)

(assert (=> b!1409205 (=> res!946245 e!797662)))

(get-info :version)

(assert (=> b!1409205 (= res!946245 (or (not ((_ is Intermediate!10739) lt!620483)) (undefined!11551 lt!620483)))))

(assert (=> b!1409205 (= lt!620485 (Found!10739 j!112))))

(assert (=> b!1409205 (= lt!620485 (seekEntryOrOpen!0 (select (arr!46525 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96368 (_ BitVec 32)) Bool)

(assert (=> b!1409205 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!620480 () Unit!47479)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96368 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47479)

(assert (=> b!1409205 (= lt!620480 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96368 (_ BitVec 32)) SeekEntryResult!10739)

(assert (=> b!1409205 (= lt!620483 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!620484 (select (arr!46525 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409205 (= lt!620484 (toIndex!0 (select (arr!46525 a!2901) j!112) mask!2840))))

(declare-fun b!1409206 () Bool)

(assert (=> b!1409206 (= e!797662 e!797661)))

(declare-fun res!946239 () Bool)

(assert (=> b!1409206 (=> res!946239 e!797661)))

(assert (=> b!1409206 (= res!946239 (not (= lt!620483 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!620486 mask!2840) lt!620486 lt!620482 mask!2840))))))

(assert (=> b!1409206 (= lt!620486 (select (store (arr!46525 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1409206 (= lt!620482 (array!96369 (store (arr!46525 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47076 a!2901)))))

(declare-fun res!946241 () Bool)

(assert (=> start!121292 (=> (not res!946241) (not e!797660))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121292 (= res!946241 (validMask!0 mask!2840))))

(assert (=> start!121292 e!797660))

(assert (=> start!121292 true))

(declare-fun array_inv!35806 (array!96368) Bool)

(assert (=> start!121292 (array_inv!35806 a!2901)))

(declare-fun b!1409201 () Bool)

(declare-fun res!946244 () Bool)

(assert (=> b!1409201 (=> (not res!946244) (not e!797660))))

(assert (=> b!1409201 (= res!946244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1409207 () Bool)

(declare-fun res!946240 () Bool)

(assert (=> b!1409207 (=> (not res!946240) (not e!797660))))

(assert (=> b!1409207 (= res!946240 (validKeyInArray!0 (select (arr!46525 a!2901) j!112)))))

(declare-fun b!1409208 () Bool)

(declare-fun res!946238 () Bool)

(assert (=> b!1409208 (=> (not res!946238) (not e!797660))))

(declare-datatypes ((List!33031 0))(
  ( (Nil!33028) (Cons!33027 (h!34298 (_ BitVec 64)) (t!47717 List!33031)) )
))
(declare-fun arrayNoDuplicates!0 (array!96368 (_ BitVec 32) List!33031) Bool)

(assert (=> b!1409208 (= res!946238 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33028))))

(assert (= (and start!121292 res!946241) b!1409204))

(assert (= (and b!1409204 res!946246) b!1409202))

(assert (= (and b!1409202 res!946243) b!1409207))

(assert (= (and b!1409207 res!946240) b!1409201))

(assert (= (and b!1409201 res!946244) b!1409208))

(assert (= (and b!1409208 res!946238) b!1409205))

(assert (= (and b!1409205 (not res!946245)) b!1409206))

(assert (= (and b!1409206 (not res!946239)) b!1409200))

(assert (= (and b!1409200 (not res!946242)) b!1409203))

(declare-fun m!1298575 () Bool)

(assert (=> b!1409203 m!1298575))

(declare-fun m!1298577 () Bool)

(assert (=> b!1409203 m!1298577))

(declare-fun m!1298579 () Bool)

(assert (=> b!1409205 m!1298579))

(declare-fun m!1298581 () Bool)

(assert (=> b!1409205 m!1298581))

(assert (=> b!1409205 m!1298579))

(assert (=> b!1409205 m!1298579))

(declare-fun m!1298583 () Bool)

(assert (=> b!1409205 m!1298583))

(declare-fun m!1298585 () Bool)

(assert (=> b!1409205 m!1298585))

(assert (=> b!1409205 m!1298579))

(declare-fun m!1298587 () Bool)

(assert (=> b!1409205 m!1298587))

(declare-fun m!1298589 () Bool)

(assert (=> b!1409205 m!1298589))

(declare-fun m!1298591 () Bool)

(assert (=> b!1409206 m!1298591))

(assert (=> b!1409206 m!1298591))

(declare-fun m!1298593 () Bool)

(assert (=> b!1409206 m!1298593))

(declare-fun m!1298595 () Bool)

(assert (=> b!1409206 m!1298595))

(declare-fun m!1298597 () Bool)

(assert (=> b!1409206 m!1298597))

(declare-fun m!1298599 () Bool)

(assert (=> start!121292 m!1298599))

(declare-fun m!1298601 () Bool)

(assert (=> start!121292 m!1298601))

(declare-fun m!1298603 () Bool)

(assert (=> b!1409202 m!1298603))

(assert (=> b!1409202 m!1298603))

(declare-fun m!1298605 () Bool)

(assert (=> b!1409202 m!1298605))

(assert (=> b!1409207 m!1298579))

(assert (=> b!1409207 m!1298579))

(declare-fun m!1298607 () Bool)

(assert (=> b!1409207 m!1298607))

(declare-fun m!1298609 () Bool)

(assert (=> b!1409208 m!1298609))

(declare-fun m!1298611 () Bool)

(assert (=> b!1409201 m!1298611))

(check-sat (not start!121292) (not b!1409206) (not b!1409203) (not b!1409207) (not b!1409208) (not b!1409202) (not b!1409205) (not b!1409201))
(check-sat)
