; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131328 () Bool)

(assert start!131328)

(declare-fun b!1537919 () Bool)

(declare-fun res!1053431 () Bool)

(declare-fun e!856320 () Bool)

(assert (=> b!1537919 (=> (not res!1053431) (not e!856320))))

(declare-datatypes ((array!102130 0))(
  ( (array!102131 (arr!49273 (Array (_ BitVec 32) (_ BitVec 64))) (size!49824 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102130)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1537919 (= res!1053431 (not (= (select (arr!49273 a!2792) index!463) (select (arr!49273 a!2792) j!64))))))

(declare-fun b!1537920 () Bool)

(declare-fun res!1053436 () Bool)

(assert (=> b!1537920 (=> (not res!1053436) (not e!856320))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537920 (= res!1053436 (validKeyInArray!0 (select (arr!49273 a!2792) j!64)))))

(declare-fun b!1537921 () Bool)

(declare-fun res!1053435 () Bool)

(assert (=> b!1537921 (=> (not res!1053435) (not e!856320))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1537921 (= res!1053435 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49824 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49824 a!2792)) (= (select (arr!49273 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537923 () Bool)

(declare-fun res!1053429 () Bool)

(assert (=> b!1537923 (=> (not res!1053429) (not e!856320))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537923 (= res!1053429 (validKeyInArray!0 (select (arr!49273 a!2792) i!951)))))

(declare-fun b!1537924 () Bool)

(declare-fun res!1053434 () Bool)

(assert (=> b!1537924 (=> (not res!1053434) (not e!856320))))

(declare-fun mask!2480 () (_ BitVec 32))

(assert (=> b!1537924 (= res!1053434 (and (= (size!49824 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49824 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49824 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537925 () Bool)

(declare-fun e!856319 () Bool)

(assert (=> b!1537925 (= e!856320 e!856319)))

(declare-fun res!1053438 () Bool)

(assert (=> b!1537925 (=> (not res!1053438) (not e!856319))))

(declare-fun lt!664979 () (_ BitVec 32))

(assert (=> b!1537925 (= res!1053438 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664979 #b00000000000000000000000000000000) (bvslt lt!664979 (size!49824 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1537925 (= lt!664979 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1537926 () Bool)

(assert (=> b!1537926 (= e!856319 false)))

(declare-datatypes ((SeekEntryResult!13300 0))(
  ( (MissingZero!13300 (index!55595 (_ BitVec 32))) (Found!13300 (index!55596 (_ BitVec 32))) (Intermediate!13300 (undefined!14112 Bool) (index!55597 (_ BitVec 32)) (x!137552 (_ BitVec 32))) (Undefined!13300) (MissingVacant!13300 (index!55598 (_ BitVec 32))) )
))
(declare-fun lt!664980 () SeekEntryResult!13300)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102130 (_ BitVec 32)) SeekEntryResult!13300)

(assert (=> b!1537926 (= lt!664980 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664979 vacantIndex!5 (select (arr!49273 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537927 () Bool)

(declare-fun res!1053433 () Bool)

(assert (=> b!1537927 (=> (not res!1053433) (not e!856320))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102130 (_ BitVec 32)) Bool)

(assert (=> b!1537927 (= res!1053433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537928 () Bool)

(declare-fun res!1053430 () Bool)

(assert (=> b!1537928 (=> (not res!1053430) (not e!856320))))

(declare-datatypes ((List!35734 0))(
  ( (Nil!35731) (Cons!35730 (h!37193 (_ BitVec 64)) (t!50420 List!35734)) )
))
(declare-fun arrayNoDuplicates!0 (array!102130 (_ BitVec 32) List!35734) Bool)

(assert (=> b!1537928 (= res!1053430 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35731))))

(declare-fun res!1053432 () Bool)

(assert (=> start!131328 (=> (not res!1053432) (not e!856320))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131328 (= res!1053432 (validMask!0 mask!2480))))

(assert (=> start!131328 e!856320))

(assert (=> start!131328 true))

(declare-fun array_inv!38554 (array!102130) Bool)

(assert (=> start!131328 (array_inv!38554 a!2792)))

(declare-fun b!1537922 () Bool)

(declare-fun res!1053437 () Bool)

(assert (=> b!1537922 (=> (not res!1053437) (not e!856320))))

(assert (=> b!1537922 (= res!1053437 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49273 a!2792) j!64) a!2792 mask!2480) (Found!13300 j!64)))))

(assert (= (and start!131328 res!1053432) b!1537924))

(assert (= (and b!1537924 res!1053434) b!1537923))

(assert (= (and b!1537923 res!1053429) b!1537920))

(assert (= (and b!1537920 res!1053436) b!1537927))

(assert (= (and b!1537927 res!1053433) b!1537928))

(assert (= (and b!1537928 res!1053430) b!1537921))

(assert (= (and b!1537921 res!1053435) b!1537922))

(assert (= (and b!1537922 res!1053437) b!1537919))

(assert (= (and b!1537919 res!1053431) b!1537925))

(assert (= (and b!1537925 res!1053438) b!1537926))

(declare-fun m!1420231 () Bool)

(assert (=> b!1537919 m!1420231))

(declare-fun m!1420233 () Bool)

(assert (=> b!1537919 m!1420233))

(declare-fun m!1420235 () Bool)

(assert (=> start!131328 m!1420235))

(declare-fun m!1420237 () Bool)

(assert (=> start!131328 m!1420237))

(assert (=> b!1537922 m!1420233))

(assert (=> b!1537922 m!1420233))

(declare-fun m!1420239 () Bool)

(assert (=> b!1537922 m!1420239))

(assert (=> b!1537920 m!1420233))

(assert (=> b!1537920 m!1420233))

(declare-fun m!1420241 () Bool)

(assert (=> b!1537920 m!1420241))

(declare-fun m!1420243 () Bool)

(assert (=> b!1537925 m!1420243))

(declare-fun m!1420245 () Bool)

(assert (=> b!1537921 m!1420245))

(declare-fun m!1420247 () Bool)

(assert (=> b!1537927 m!1420247))

(declare-fun m!1420249 () Bool)

(assert (=> b!1537928 m!1420249))

(declare-fun m!1420251 () Bool)

(assert (=> b!1537923 m!1420251))

(assert (=> b!1537923 m!1420251))

(declare-fun m!1420253 () Bool)

(assert (=> b!1537923 m!1420253))

(assert (=> b!1537926 m!1420233))

(assert (=> b!1537926 m!1420233))

(declare-fun m!1420255 () Bool)

(assert (=> b!1537926 m!1420255))

(check-sat (not b!1537920) (not b!1537926) (not b!1537923) (not b!1537925) (not start!131328) (not b!1537922) (not b!1537927) (not b!1537928))
(check-sat)
