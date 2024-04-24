; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131262 () Bool)

(assert start!131262)

(declare-fun b!1536929 () Bool)

(declare-fun e!856023 () Bool)

(assert (=> b!1536929 (= e!856023 false)))

(declare-datatypes ((SeekEntryResult!13267 0))(
  ( (MissingZero!13267 (index!55463 (_ BitVec 32))) (Found!13267 (index!55464 (_ BitVec 32))) (Intermediate!13267 (undefined!14079 Bool) (index!55465 (_ BitVec 32)) (x!137431 (_ BitVec 32))) (Undefined!13267) (MissingVacant!13267 (index!55466 (_ BitVec 32))) )
))
(declare-fun lt!664781 () SeekEntryResult!13267)

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102064 0))(
  ( (array!102065 (arr!49240 (Array (_ BitVec 32) (_ BitVec 64))) (size!49791 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102064)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun lt!664782 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102064 (_ BitVec 32)) SeekEntryResult!13267)

(assert (=> b!1536929 (= lt!664781 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664782 vacantIndex!5 (select (arr!49240 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1536930 () Bool)

(declare-fun res!1052442 () Bool)

(declare-fun e!856022 () Bool)

(assert (=> b!1536930 (=> (not res!1052442) (not e!856022))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536930 (= res!1052442 (validKeyInArray!0 (select (arr!49240 a!2792) j!64)))))

(declare-fun res!1052445 () Bool)

(assert (=> start!131262 (=> (not res!1052445) (not e!856022))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131262 (= res!1052445 (validMask!0 mask!2480))))

(assert (=> start!131262 e!856022))

(assert (=> start!131262 true))

(declare-fun array_inv!38521 (array!102064) Bool)

(assert (=> start!131262 (array_inv!38521 a!2792)))

(declare-fun b!1536931 () Bool)

(declare-fun res!1052447 () Bool)

(assert (=> b!1536931 (=> (not res!1052447) (not e!856022))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1536931 (= res!1052447 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49791 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49791 a!2792)) (= (select (arr!49240 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536932 () Bool)

(declare-fun res!1052441 () Bool)

(assert (=> b!1536932 (=> (not res!1052441) (not e!856022))))

(declare-datatypes ((List!35701 0))(
  ( (Nil!35698) (Cons!35697 (h!37160 (_ BitVec 64)) (t!50387 List!35701)) )
))
(declare-fun arrayNoDuplicates!0 (array!102064 (_ BitVec 32) List!35701) Bool)

(assert (=> b!1536932 (= res!1052441 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35698))))

(declare-fun b!1536933 () Bool)

(declare-fun res!1052443 () Bool)

(assert (=> b!1536933 (=> (not res!1052443) (not e!856022))))

(assert (=> b!1536933 (= res!1052443 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49240 a!2792) j!64) a!2792 mask!2480) (Found!13267 j!64)))))

(declare-fun b!1536934 () Bool)

(declare-fun res!1052444 () Bool)

(assert (=> b!1536934 (=> (not res!1052444) (not e!856022))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102064 (_ BitVec 32)) Bool)

(assert (=> b!1536934 (= res!1052444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1536935 () Bool)

(declare-fun res!1052446 () Bool)

(assert (=> b!1536935 (=> (not res!1052446) (not e!856022))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1536935 (= res!1052446 (and (= (size!49791 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49791 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49791 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536936 () Bool)

(assert (=> b!1536936 (= e!856022 e!856023)))

(declare-fun res!1052448 () Bool)

(assert (=> b!1536936 (=> (not res!1052448) (not e!856023))))

(assert (=> b!1536936 (= res!1052448 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664782 #b00000000000000000000000000000000) (bvslt lt!664782 (size!49791 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1536936 (= lt!664782 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1536937 () Bool)

(declare-fun res!1052440 () Bool)

(assert (=> b!1536937 (=> (not res!1052440) (not e!856022))))

(assert (=> b!1536937 (= res!1052440 (validKeyInArray!0 (select (arr!49240 a!2792) i!951)))))

(declare-fun b!1536938 () Bool)

(declare-fun res!1052439 () Bool)

(assert (=> b!1536938 (=> (not res!1052439) (not e!856022))))

(assert (=> b!1536938 (= res!1052439 (not (= (select (arr!49240 a!2792) index!463) (select (arr!49240 a!2792) j!64))))))

(assert (= (and start!131262 res!1052445) b!1536935))

(assert (= (and b!1536935 res!1052446) b!1536937))

(assert (= (and b!1536937 res!1052440) b!1536930))

(assert (= (and b!1536930 res!1052442) b!1536934))

(assert (= (and b!1536934 res!1052444) b!1536932))

(assert (= (and b!1536932 res!1052441) b!1536931))

(assert (= (and b!1536931 res!1052447) b!1536933))

(assert (= (and b!1536933 res!1052443) b!1536938))

(assert (= (and b!1536938 res!1052439) b!1536936))

(assert (= (and b!1536936 res!1052448) b!1536929))

(declare-fun m!1419373 () Bool)

(assert (=> b!1536932 m!1419373))

(declare-fun m!1419375 () Bool)

(assert (=> b!1536938 m!1419375))

(declare-fun m!1419377 () Bool)

(assert (=> b!1536938 m!1419377))

(assert (=> b!1536930 m!1419377))

(assert (=> b!1536930 m!1419377))

(declare-fun m!1419379 () Bool)

(assert (=> b!1536930 m!1419379))

(assert (=> b!1536933 m!1419377))

(assert (=> b!1536933 m!1419377))

(declare-fun m!1419381 () Bool)

(assert (=> b!1536933 m!1419381))

(declare-fun m!1419383 () Bool)

(assert (=> b!1536934 m!1419383))

(declare-fun m!1419385 () Bool)

(assert (=> b!1536931 m!1419385))

(declare-fun m!1419387 () Bool)

(assert (=> b!1536937 m!1419387))

(assert (=> b!1536937 m!1419387))

(declare-fun m!1419389 () Bool)

(assert (=> b!1536937 m!1419389))

(declare-fun m!1419391 () Bool)

(assert (=> b!1536936 m!1419391))

(declare-fun m!1419393 () Bool)

(assert (=> start!131262 m!1419393))

(declare-fun m!1419395 () Bool)

(assert (=> start!131262 m!1419395))

(assert (=> b!1536929 m!1419377))

(assert (=> b!1536929 m!1419377))

(declare-fun m!1419397 () Bool)

(assert (=> b!1536929 m!1419397))

(check-sat (not b!1536930) (not b!1536936) (not b!1536933) (not start!131262) (not b!1536934) (not b!1536929) (not b!1536937) (not b!1536932))
(check-sat)
