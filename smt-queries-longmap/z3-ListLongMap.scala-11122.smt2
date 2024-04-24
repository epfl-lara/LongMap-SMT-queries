; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130344 () Bool)

(assert start!130344)

(declare-fun b!1527347 () Bool)

(declare-fun e!851539 () Bool)

(declare-fun e!851537 () Bool)

(assert (=> b!1527347 (= e!851539 e!851537)))

(declare-fun res!1044230 () Bool)

(assert (=> b!1527347 (=> res!1044230 e!851537)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101557 0))(
  ( (array!101558 (arr!49000 (Array (_ BitVec 32) (_ BitVec 64))) (size!49551 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101557)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1527347 (= res!1044230 (or (not (= (select (arr!49000 a!2804) j!70) (select (store (arr!49000 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!49000 a!2804) index!487) (select (arr!49000 a!2804) j!70)) (not (= (select (arr!49000 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1527348 () Bool)

(declare-fun res!1044227 () Bool)

(declare-fun e!851538 () Bool)

(assert (=> b!1527348 (=> (not res!1044227) (not e!851538))))

(declare-datatypes ((List!35470 0))(
  ( (Nil!35467) (Cons!35466 (h!36914 (_ BitVec 64)) (t!50156 List!35470)) )
))
(declare-fun arrayNoDuplicates!0 (array!101557 (_ BitVec 32) List!35470) Bool)

(assert (=> b!1527348 (= res!1044227 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35467))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun b!1527349 () Bool)

(declare-datatypes ((SeekEntryResult!13058 0))(
  ( (MissingZero!13058 (index!54627 (_ BitVec 32))) (Found!13058 (index!54628 (_ BitVec 32))) (Intermediate!13058 (undefined!13870 Bool) (index!54629 (_ BitVec 32)) (x!136534 (_ BitVec 32))) (Undefined!13058) (MissingVacant!13058 (index!54630 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101557 (_ BitVec 32)) SeekEntryResult!13058)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101557 (_ BitVec 32)) SeekEntryResult!13058)

(assert (=> b!1527349 (= e!851537 (= (seekEntryOrOpen!0 (select (arr!49000 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!49000 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1527350 () Bool)

(declare-fun e!851535 () Bool)

(assert (=> b!1527350 (= e!851538 e!851535)))

(declare-fun res!1044234 () Bool)

(assert (=> b!1527350 (=> (not res!1044234) (not e!851535))))

(declare-fun lt!661423 () SeekEntryResult!13058)

(declare-fun lt!661424 () SeekEntryResult!13058)

(assert (=> b!1527350 (= res!1044234 (= lt!661423 lt!661424))))

(assert (=> b!1527350 (= lt!661424 (Intermediate!13058 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101557 (_ BitVec 32)) SeekEntryResult!13058)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1527350 (= lt!661423 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49000 a!2804) j!70) mask!2512) (select (arr!49000 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1527351 () Bool)

(assert (=> b!1527351 (= e!851535 (not true))))

(assert (=> b!1527351 e!851539))

(declare-fun res!1044229 () Bool)

(assert (=> b!1527351 (=> (not res!1044229) (not e!851539))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101557 (_ BitVec 32)) Bool)

(assert (=> b!1527351 (= res!1044229 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50935 0))(
  ( (Unit!50936) )
))
(declare-fun lt!661425 () Unit!50935)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101557 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50935)

(assert (=> b!1527351 (= lt!661425 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1527352 () Bool)

(declare-fun res!1044232 () Bool)

(assert (=> b!1527352 (=> (not res!1044232) (not e!851535))))

(assert (=> b!1527352 (= res!1044232 (= lt!661423 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49000 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49000 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101558 (store (arr!49000 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49551 a!2804)) mask!2512)))))

(declare-fun b!1527353 () Bool)

(declare-fun res!1044226 () Bool)

(assert (=> b!1527353 (=> (not res!1044226) (not e!851535))))

(assert (=> b!1527353 (= res!1044226 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49000 a!2804) j!70) a!2804 mask!2512) lt!661424))))

(declare-fun res!1044222 () Bool)

(assert (=> start!130344 (=> (not res!1044222) (not e!851538))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130344 (= res!1044222 (validMask!0 mask!2512))))

(assert (=> start!130344 e!851538))

(assert (=> start!130344 true))

(declare-fun array_inv!38281 (array!101557) Bool)

(assert (=> start!130344 (array_inv!38281 a!2804)))

(declare-fun b!1527354 () Bool)

(declare-fun res!1044224 () Bool)

(assert (=> b!1527354 (=> (not res!1044224) (not e!851538))))

(assert (=> b!1527354 (= res!1044224 (and (= (size!49551 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49551 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49551 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1527355 () Bool)

(declare-fun res!1044225 () Bool)

(assert (=> b!1527355 (=> (not res!1044225) (not e!851538))))

(assert (=> b!1527355 (= res!1044225 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49551 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49551 a!2804))))))

(declare-fun b!1527356 () Bool)

(declare-fun res!1044233 () Bool)

(assert (=> b!1527356 (=> (not res!1044233) (not e!851538))))

(assert (=> b!1527356 (= res!1044233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1527357 () Bool)

(declare-fun res!1044228 () Bool)

(assert (=> b!1527357 (=> (not res!1044228) (not e!851538))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1527357 (= res!1044228 (validKeyInArray!0 (select (arr!49000 a!2804) i!961)))))

(declare-fun b!1527358 () Bool)

(declare-fun res!1044223 () Bool)

(assert (=> b!1527358 (=> (not res!1044223) (not e!851538))))

(assert (=> b!1527358 (= res!1044223 (validKeyInArray!0 (select (arr!49000 a!2804) j!70)))))

(declare-fun b!1527359 () Bool)

(declare-fun res!1044231 () Bool)

(assert (=> b!1527359 (=> (not res!1044231) (not e!851539))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101557 (_ BitVec 32)) SeekEntryResult!13058)

(assert (=> b!1527359 (= res!1044231 (= (seekEntry!0 (select (arr!49000 a!2804) j!70) a!2804 mask!2512) (Found!13058 j!70)))))

(assert (= (and start!130344 res!1044222) b!1527354))

(assert (= (and b!1527354 res!1044224) b!1527357))

(assert (= (and b!1527357 res!1044228) b!1527358))

(assert (= (and b!1527358 res!1044223) b!1527356))

(assert (= (and b!1527356 res!1044233) b!1527348))

(assert (= (and b!1527348 res!1044227) b!1527355))

(assert (= (and b!1527355 res!1044225) b!1527350))

(assert (= (and b!1527350 res!1044234) b!1527353))

(assert (= (and b!1527353 res!1044226) b!1527352))

(assert (= (and b!1527352 res!1044232) b!1527351))

(assert (= (and b!1527351 res!1044229) b!1527359))

(assert (= (and b!1527359 res!1044231) b!1527347))

(assert (= (and b!1527347 (not res!1044230)) b!1527349))

(declare-fun m!1410079 () Bool)

(assert (=> b!1527356 m!1410079))

(declare-fun m!1410081 () Bool)

(assert (=> b!1527349 m!1410081))

(assert (=> b!1527349 m!1410081))

(declare-fun m!1410083 () Bool)

(assert (=> b!1527349 m!1410083))

(assert (=> b!1527349 m!1410081))

(declare-fun m!1410085 () Bool)

(assert (=> b!1527349 m!1410085))

(assert (=> b!1527350 m!1410081))

(assert (=> b!1527350 m!1410081))

(declare-fun m!1410087 () Bool)

(assert (=> b!1527350 m!1410087))

(assert (=> b!1527350 m!1410087))

(assert (=> b!1527350 m!1410081))

(declare-fun m!1410089 () Bool)

(assert (=> b!1527350 m!1410089))

(declare-fun m!1410091 () Bool)

(assert (=> b!1527348 m!1410091))

(declare-fun m!1410093 () Bool)

(assert (=> start!130344 m!1410093))

(declare-fun m!1410095 () Bool)

(assert (=> start!130344 m!1410095))

(declare-fun m!1410097 () Bool)

(assert (=> b!1527357 m!1410097))

(assert (=> b!1527357 m!1410097))

(declare-fun m!1410099 () Bool)

(assert (=> b!1527357 m!1410099))

(declare-fun m!1410101 () Bool)

(assert (=> b!1527351 m!1410101))

(declare-fun m!1410103 () Bool)

(assert (=> b!1527351 m!1410103))

(assert (=> b!1527359 m!1410081))

(assert (=> b!1527359 m!1410081))

(declare-fun m!1410105 () Bool)

(assert (=> b!1527359 m!1410105))

(assert (=> b!1527347 m!1410081))

(declare-fun m!1410107 () Bool)

(assert (=> b!1527347 m!1410107))

(declare-fun m!1410109 () Bool)

(assert (=> b!1527347 m!1410109))

(declare-fun m!1410111 () Bool)

(assert (=> b!1527347 m!1410111))

(assert (=> b!1527353 m!1410081))

(assert (=> b!1527353 m!1410081))

(declare-fun m!1410113 () Bool)

(assert (=> b!1527353 m!1410113))

(assert (=> b!1527358 m!1410081))

(assert (=> b!1527358 m!1410081))

(declare-fun m!1410115 () Bool)

(assert (=> b!1527358 m!1410115))

(assert (=> b!1527352 m!1410107))

(assert (=> b!1527352 m!1410109))

(assert (=> b!1527352 m!1410109))

(declare-fun m!1410117 () Bool)

(assert (=> b!1527352 m!1410117))

(assert (=> b!1527352 m!1410117))

(assert (=> b!1527352 m!1410109))

(declare-fun m!1410119 () Bool)

(assert (=> b!1527352 m!1410119))

(check-sat (not b!1527352) (not b!1527356) (not b!1527358) (not b!1527359) (not b!1527351) (not b!1527350) (not b!1527357) (not start!130344) (not b!1527349) (not b!1527348) (not b!1527353))
(check-sat)
