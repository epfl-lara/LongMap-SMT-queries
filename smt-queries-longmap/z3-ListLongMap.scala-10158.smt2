; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119708 () Bool)

(assert start!119708)

(declare-fun b!1394440 () Bool)

(declare-fun res!933901 () Bool)

(declare-fun e!789500 () Bool)

(assert (=> b!1394440 (=> res!933901 e!789500)))

(declare-fun lt!612347 () (_ BitVec 32))

(declare-datatypes ((array!95343 0))(
  ( (array!95344 (arr!46030 (Array (_ BitVec 32) (_ BitVec 64))) (size!46582 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95343)

(declare-datatypes ((SeekEntryResult!10373 0))(
  ( (MissingZero!10373 (index!43863 (_ BitVec 32))) (Found!10373 (index!43864 (_ BitVec 32))) (Intermediate!10373 (undefined!11185 Bool) (index!43865 (_ BitVec 32)) (x!125526 (_ BitVec 32))) (Undefined!10373) (MissingVacant!10373 (index!43866 (_ BitVec 32))) )
))
(declare-fun lt!612348 () SeekEntryResult!10373)

(assert (=> b!1394440 (= res!933901 (or (bvslt (x!125526 lt!612348) #b00000000000000000000000000000000) (bvsgt (x!125526 lt!612348) #b01111111111111111111111111111110) (bvslt lt!612347 #b00000000000000000000000000000000) (bvsge lt!612347 (size!46582 a!2901)) (bvslt (index!43865 lt!612348) #b00000000000000000000000000000000) (bvsge (index!43865 lt!612348) (size!46582 a!2901)) (not (= lt!612348 (Intermediate!10373 false (index!43865 lt!612348) (x!125526 lt!612348))))))))

(declare-fun res!933899 () Bool)

(declare-fun e!789501 () Bool)

(assert (=> start!119708 (=> (not res!933899) (not e!789501))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119708 (= res!933899 (validMask!0 mask!2840))))

(assert (=> start!119708 e!789501))

(assert (=> start!119708 true))

(declare-fun array_inv!35263 (array!95343) Bool)

(assert (=> start!119708 (array_inv!35263 a!2901)))

(declare-fun b!1394441 () Bool)

(declare-fun res!933903 () Bool)

(assert (=> b!1394441 (=> (not res!933903) (not e!789501))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1394441 (= res!933903 (and (= (size!46582 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46582 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46582 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394442 () Bool)

(assert (=> b!1394442 (= e!789500 true)))

(declare-fun lt!612346 () array!95343)

(declare-fun lt!612349 () (_ BitVec 64))

(declare-fun lt!612350 () SeekEntryResult!10373)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95343 (_ BitVec 32)) SeekEntryResult!10373)

(assert (=> b!1394442 (= lt!612350 (seekEntryOrOpen!0 lt!612349 lt!612346 mask!2840))))

(declare-datatypes ((Unit!46593 0))(
  ( (Unit!46594) )
))
(declare-fun lt!612344 () Unit!46593)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!95343 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46593)

(assert (=> b!1394442 (= lt!612344 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!612347 (x!125526 lt!612348) (index!43865 lt!612348) mask!2840))))

(declare-fun b!1394443 () Bool)

(declare-fun res!933904 () Bool)

(assert (=> b!1394443 (=> (not res!933904) (not e!789501))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394443 (= res!933904 (validKeyInArray!0 (select (arr!46030 a!2901) j!112)))))

(declare-fun b!1394444 () Bool)

(declare-fun res!933906 () Bool)

(assert (=> b!1394444 (=> (not res!933906) (not e!789501))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95343 (_ BitVec 32)) Bool)

(assert (=> b!1394444 (= res!933906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394445 () Bool)

(declare-fun e!789503 () Bool)

(assert (=> b!1394445 (= e!789501 (not e!789503))))

(declare-fun res!933902 () Bool)

(assert (=> b!1394445 (=> res!933902 e!789503)))

(get-info :version)

(assert (=> b!1394445 (= res!933902 (or (not ((_ is Intermediate!10373) lt!612348)) (undefined!11185 lt!612348)))))

(assert (=> b!1394445 (= lt!612350 (Found!10373 j!112))))

(assert (=> b!1394445 (= lt!612350 (seekEntryOrOpen!0 (select (arr!46030 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1394445 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!612345 () Unit!46593)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95343 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46593)

(assert (=> b!1394445 (= lt!612345 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95343 (_ BitVec 32)) SeekEntryResult!10373)

(assert (=> b!1394445 (= lt!612348 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!612347 (select (arr!46030 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394445 (= lt!612347 (toIndex!0 (select (arr!46030 a!2901) j!112) mask!2840))))

(declare-fun b!1394446 () Bool)

(declare-fun res!933905 () Bool)

(assert (=> b!1394446 (=> (not res!933905) (not e!789501))))

(declare-datatypes ((List!32627 0))(
  ( (Nil!32624) (Cons!32623 (h!33856 (_ BitVec 64)) (t!47313 List!32627)) )
))
(declare-fun arrayNoDuplicates!0 (array!95343 (_ BitVec 32) List!32627) Bool)

(assert (=> b!1394446 (= res!933905 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32624))))

(declare-fun b!1394447 () Bool)

(assert (=> b!1394447 (= e!789503 e!789500)))

(declare-fun res!933907 () Bool)

(assert (=> b!1394447 (=> res!933907 e!789500)))

(assert (=> b!1394447 (= res!933907 (not (= lt!612348 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!612349 mask!2840) lt!612349 lt!612346 mask!2840))))))

(assert (=> b!1394447 (= lt!612349 (select (store (arr!46030 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1394447 (= lt!612346 (array!95344 (store (arr!46030 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46582 a!2901)))))

(declare-fun b!1394448 () Bool)

(declare-fun res!933900 () Bool)

(assert (=> b!1394448 (=> (not res!933900) (not e!789501))))

(assert (=> b!1394448 (= res!933900 (validKeyInArray!0 (select (arr!46030 a!2901) i!1037)))))

(assert (= (and start!119708 res!933899) b!1394441))

(assert (= (and b!1394441 res!933903) b!1394448))

(assert (= (and b!1394448 res!933900) b!1394443))

(assert (= (and b!1394443 res!933904) b!1394444))

(assert (= (and b!1394444 res!933906) b!1394446))

(assert (= (and b!1394446 res!933905) b!1394445))

(assert (= (and b!1394445 (not res!933902)) b!1394447))

(assert (= (and b!1394447 (not res!933907)) b!1394440))

(assert (= (and b!1394440 (not res!933901)) b!1394442))

(declare-fun m!1280341 () Bool)

(assert (=> b!1394447 m!1280341))

(assert (=> b!1394447 m!1280341))

(declare-fun m!1280343 () Bool)

(assert (=> b!1394447 m!1280343))

(declare-fun m!1280345 () Bool)

(assert (=> b!1394447 m!1280345))

(declare-fun m!1280347 () Bool)

(assert (=> b!1394447 m!1280347))

(declare-fun m!1280349 () Bool)

(assert (=> b!1394446 m!1280349))

(declare-fun m!1280351 () Bool)

(assert (=> b!1394445 m!1280351))

(declare-fun m!1280353 () Bool)

(assert (=> b!1394445 m!1280353))

(assert (=> b!1394445 m!1280351))

(assert (=> b!1394445 m!1280351))

(declare-fun m!1280355 () Bool)

(assert (=> b!1394445 m!1280355))

(declare-fun m!1280357 () Bool)

(assert (=> b!1394445 m!1280357))

(assert (=> b!1394445 m!1280351))

(declare-fun m!1280359 () Bool)

(assert (=> b!1394445 m!1280359))

(declare-fun m!1280361 () Bool)

(assert (=> b!1394445 m!1280361))

(declare-fun m!1280363 () Bool)

(assert (=> start!119708 m!1280363))

(declare-fun m!1280365 () Bool)

(assert (=> start!119708 m!1280365))

(declare-fun m!1280367 () Bool)

(assert (=> b!1394448 m!1280367))

(assert (=> b!1394448 m!1280367))

(declare-fun m!1280369 () Bool)

(assert (=> b!1394448 m!1280369))

(assert (=> b!1394443 m!1280351))

(assert (=> b!1394443 m!1280351))

(declare-fun m!1280371 () Bool)

(assert (=> b!1394443 m!1280371))

(declare-fun m!1280373 () Bool)

(assert (=> b!1394444 m!1280373))

(declare-fun m!1280375 () Bool)

(assert (=> b!1394442 m!1280375))

(declare-fun m!1280377 () Bool)

(assert (=> b!1394442 m!1280377))

(check-sat (not b!1394447) (not b!1394446) (not b!1394444) (not start!119708) (not b!1394442) (not b!1394443) (not b!1394448) (not b!1394445))
(check-sat)
