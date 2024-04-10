; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119684 () Bool)

(assert start!119684)

(declare-fun b!1394147 () Bool)

(declare-fun res!933560 () Bool)

(declare-fun e!789374 () Bool)

(assert (=> b!1394147 (=> (not res!933560) (not e!789374))))

(declare-datatypes ((array!95366 0))(
  ( (array!95367 (arr!46041 (Array (_ BitVec 32) (_ BitVec 64))) (size!46591 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95366)

(declare-datatypes ((List!32560 0))(
  ( (Nil!32557) (Cons!32556 (h!33789 (_ BitVec 64)) (t!47254 List!32560)) )
))
(declare-fun arrayNoDuplicates!0 (array!95366 (_ BitVec 32) List!32560) Bool)

(assert (=> b!1394147 (= res!933560 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32557))))

(declare-fun res!933558 () Bool)

(assert (=> start!119684 (=> (not res!933558) (not e!789374))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119684 (= res!933558 (validMask!0 mask!2840))))

(assert (=> start!119684 e!789374))

(assert (=> start!119684 true))

(declare-fun array_inv!35069 (array!95366) Bool)

(assert (=> start!119684 (array_inv!35069 a!2901)))

(declare-fun b!1394148 () Bool)

(declare-fun res!933557 () Bool)

(assert (=> b!1394148 (=> (not res!933557) (not e!789374))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394148 (= res!933557 (validKeyInArray!0 (select (arr!46041 a!2901) i!1037)))))

(declare-fun b!1394149 () Bool)

(declare-fun res!933556 () Bool)

(assert (=> b!1394149 (=> (not res!933556) (not e!789374))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1394149 (= res!933556 (validKeyInArray!0 (select (arr!46041 a!2901) j!112)))))

(declare-fun b!1394150 () Bool)

(declare-fun res!933559 () Bool)

(assert (=> b!1394150 (=> (not res!933559) (not e!789374))))

(assert (=> b!1394150 (= res!933559 (and (= (size!46591 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46591 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46591 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394151 () Bool)

(declare-fun e!789373 () Bool)

(assert (=> b!1394151 (= e!789374 (not e!789373))))

(declare-fun res!933562 () Bool)

(assert (=> b!1394151 (=> res!933562 e!789373)))

(declare-datatypes ((SeekEntryResult!10358 0))(
  ( (MissingZero!10358 (index!43803 (_ BitVec 32))) (Found!10358 (index!43804 (_ BitVec 32))) (Intermediate!10358 (undefined!11170 Bool) (index!43805 (_ BitVec 32)) (x!125474 (_ BitVec 32))) (Undefined!10358) (MissingVacant!10358 (index!43806 (_ BitVec 32))) )
))
(declare-fun lt!612257 () SeekEntryResult!10358)

(get-info :version)

(assert (=> b!1394151 (= res!933562 (or (not ((_ is Intermediate!10358) lt!612257)) (undefined!11170 lt!612257)))))

(declare-fun e!789372 () Bool)

(assert (=> b!1394151 e!789372))

(declare-fun res!933555 () Bool)

(assert (=> b!1394151 (=> (not res!933555) (not e!789372))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95366 (_ BitVec 32)) Bool)

(assert (=> b!1394151 (= res!933555 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46720 0))(
  ( (Unit!46721) )
))
(declare-fun lt!612256 () Unit!46720)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95366 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46720)

(assert (=> b!1394151 (= lt!612256 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95366 (_ BitVec 32)) SeekEntryResult!10358)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394151 (= lt!612257 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46041 a!2901) j!112) mask!2840) (select (arr!46041 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1394152 () Bool)

(assert (=> b!1394152 (= e!789373 true)))

(declare-fun lt!612258 () SeekEntryResult!10358)

(assert (=> b!1394152 (= lt!612258 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46041 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46041 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95367 (store (arr!46041 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46591 a!2901)) mask!2840))))

(declare-fun b!1394153 () Bool)

(declare-fun res!933561 () Bool)

(assert (=> b!1394153 (=> (not res!933561) (not e!789374))))

(assert (=> b!1394153 (= res!933561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394154 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95366 (_ BitVec 32)) SeekEntryResult!10358)

(assert (=> b!1394154 (= e!789372 (= (seekEntryOrOpen!0 (select (arr!46041 a!2901) j!112) a!2901 mask!2840) (Found!10358 j!112)))))

(assert (= (and start!119684 res!933558) b!1394150))

(assert (= (and b!1394150 res!933559) b!1394148))

(assert (= (and b!1394148 res!933557) b!1394149))

(assert (= (and b!1394149 res!933556) b!1394153))

(assert (= (and b!1394153 res!933561) b!1394147))

(assert (= (and b!1394147 res!933560) b!1394151))

(assert (= (and b!1394151 res!933555) b!1394154))

(assert (= (and b!1394151 (not res!933562)) b!1394152))

(declare-fun m!1280353 () Bool)

(assert (=> b!1394148 m!1280353))

(assert (=> b!1394148 m!1280353))

(declare-fun m!1280355 () Bool)

(assert (=> b!1394148 m!1280355))

(declare-fun m!1280357 () Bool)

(assert (=> start!119684 m!1280357))

(declare-fun m!1280359 () Bool)

(assert (=> start!119684 m!1280359))

(declare-fun m!1280361 () Bool)

(assert (=> b!1394152 m!1280361))

(declare-fun m!1280363 () Bool)

(assert (=> b!1394152 m!1280363))

(assert (=> b!1394152 m!1280363))

(declare-fun m!1280365 () Bool)

(assert (=> b!1394152 m!1280365))

(assert (=> b!1394152 m!1280365))

(assert (=> b!1394152 m!1280363))

(declare-fun m!1280367 () Bool)

(assert (=> b!1394152 m!1280367))

(declare-fun m!1280369 () Bool)

(assert (=> b!1394154 m!1280369))

(assert (=> b!1394154 m!1280369))

(declare-fun m!1280371 () Bool)

(assert (=> b!1394154 m!1280371))

(declare-fun m!1280373 () Bool)

(assert (=> b!1394153 m!1280373))

(declare-fun m!1280375 () Bool)

(assert (=> b!1394147 m!1280375))

(assert (=> b!1394151 m!1280369))

(declare-fun m!1280377 () Bool)

(assert (=> b!1394151 m!1280377))

(assert (=> b!1394151 m!1280369))

(declare-fun m!1280379 () Bool)

(assert (=> b!1394151 m!1280379))

(assert (=> b!1394151 m!1280377))

(assert (=> b!1394151 m!1280369))

(declare-fun m!1280381 () Bool)

(assert (=> b!1394151 m!1280381))

(declare-fun m!1280383 () Bool)

(assert (=> b!1394151 m!1280383))

(assert (=> b!1394149 m!1280369))

(assert (=> b!1394149 m!1280369))

(declare-fun m!1280385 () Bool)

(assert (=> b!1394149 m!1280385))

(check-sat (not b!1394149) (not b!1394152) (not b!1394148) (not b!1394151) (not start!119684) (not b!1394153) (not b!1394154) (not b!1394147))
