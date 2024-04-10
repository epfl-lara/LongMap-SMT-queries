; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130902 () Bool)

(assert start!130902)

(declare-fun b!1535363 () Bool)

(declare-fun res!1052455 () Bool)

(declare-fun e!854776 () Bool)

(assert (=> b!1535363 (=> (not res!1052455) (not e!854776))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102000 0))(
  ( (array!102001 (arr!49216 (Array (_ BitVec 32) (_ BitVec 64))) (size!49766 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102000)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13348 0))(
  ( (MissingZero!13348 (index!55787 (_ BitVec 32))) (Found!13348 (index!55788 (_ BitVec 32))) (Intermediate!13348 (undefined!14160 Bool) (index!55789 (_ BitVec 32)) (x!137534 (_ BitVec 32))) (Undefined!13348) (MissingVacant!13348 (index!55790 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102000 (_ BitVec 32)) SeekEntryResult!13348)

(assert (=> b!1535363 (= res!1052455 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49216 a!2792) j!64) a!2792 mask!2480) (Found!13348 j!64)))))

(declare-fun b!1535364 () Bool)

(declare-fun res!1052456 () Bool)

(assert (=> b!1535364 (=> (not res!1052456) (not e!854776))))

(assert (=> b!1535364 (= res!1052456 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49766 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49766 a!2792)) (= (select (arr!49216 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1535365 () Bool)

(declare-fun e!854775 () Bool)

(assert (=> b!1535365 (= e!854776 e!854775)))

(declare-fun res!1052451 () Bool)

(assert (=> b!1535365 (=> (not res!1052451) (not e!854775))))

(declare-fun lt!664044 () (_ BitVec 32))

(assert (=> b!1535365 (= res!1052451 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664044 #b00000000000000000000000000000000) (bvslt lt!664044 (size!49766 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535365 (= lt!664044 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1535366 () Bool)

(declare-fun res!1052454 () Bool)

(assert (=> b!1535366 (=> (not res!1052454) (not e!854776))))

(declare-datatypes ((List!35690 0))(
  ( (Nil!35687) (Cons!35686 (h!37131 (_ BitVec 64)) (t!50384 List!35690)) )
))
(declare-fun arrayNoDuplicates!0 (array!102000 (_ BitVec 32) List!35690) Bool)

(assert (=> b!1535366 (= res!1052454 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35687))))

(declare-fun res!1052452 () Bool)

(assert (=> start!130902 (=> (not res!1052452) (not e!854776))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130902 (= res!1052452 (validMask!0 mask!2480))))

(assert (=> start!130902 e!854776))

(assert (=> start!130902 true))

(declare-fun array_inv!38244 (array!102000) Bool)

(assert (=> start!130902 (array_inv!38244 a!2792)))

(declare-fun b!1535367 () Bool)

(declare-fun res!1052457 () Bool)

(assert (=> b!1535367 (=> (not res!1052457) (not e!854776))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1535367 (= res!1052457 (and (= (size!49766 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49766 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49766 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535368 () Bool)

(declare-fun res!1052449 () Bool)

(assert (=> b!1535368 (=> (not res!1052449) (not e!854776))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535368 (= res!1052449 (validKeyInArray!0 (select (arr!49216 a!2792) j!64)))))

(declare-fun b!1535369 () Bool)

(assert (=> b!1535369 (= e!854775 false)))

(declare-fun lt!664045 () SeekEntryResult!13348)

(assert (=> b!1535369 (= lt!664045 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664044 vacantIndex!5 (select (arr!49216 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1535370 () Bool)

(declare-fun res!1052458 () Bool)

(assert (=> b!1535370 (=> (not res!1052458) (not e!854776))))

(assert (=> b!1535370 (= res!1052458 (validKeyInArray!0 (select (arr!49216 a!2792) i!951)))))

(declare-fun b!1535371 () Bool)

(declare-fun res!1052453 () Bool)

(assert (=> b!1535371 (=> (not res!1052453) (not e!854776))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102000 (_ BitVec 32)) Bool)

(assert (=> b!1535371 (= res!1052453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535372 () Bool)

(declare-fun res!1052450 () Bool)

(assert (=> b!1535372 (=> (not res!1052450) (not e!854776))))

(assert (=> b!1535372 (= res!1052450 (not (= (select (arr!49216 a!2792) index!463) (select (arr!49216 a!2792) j!64))))))

(assert (= (and start!130902 res!1052452) b!1535367))

(assert (= (and b!1535367 res!1052457) b!1535370))

(assert (= (and b!1535370 res!1052458) b!1535368))

(assert (= (and b!1535368 res!1052449) b!1535371))

(assert (= (and b!1535371 res!1052453) b!1535366))

(assert (= (and b!1535366 res!1052454) b!1535364))

(assert (= (and b!1535364 res!1052456) b!1535363))

(assert (= (and b!1535363 res!1052455) b!1535372))

(assert (= (and b!1535372 res!1052450) b!1535365))

(assert (= (and b!1535365 res!1052451) b!1535369))

(declare-fun m!1417891 () Bool)

(assert (=> b!1535369 m!1417891))

(assert (=> b!1535369 m!1417891))

(declare-fun m!1417893 () Bool)

(assert (=> b!1535369 m!1417893))

(declare-fun m!1417895 () Bool)

(assert (=> b!1535365 m!1417895))

(declare-fun m!1417897 () Bool)

(assert (=> b!1535364 m!1417897))

(declare-fun m!1417899 () Bool)

(assert (=> b!1535371 m!1417899))

(declare-fun m!1417901 () Bool)

(assert (=> start!130902 m!1417901))

(declare-fun m!1417903 () Bool)

(assert (=> start!130902 m!1417903))

(declare-fun m!1417905 () Bool)

(assert (=> b!1535372 m!1417905))

(assert (=> b!1535372 m!1417891))

(assert (=> b!1535368 m!1417891))

(assert (=> b!1535368 m!1417891))

(declare-fun m!1417907 () Bool)

(assert (=> b!1535368 m!1417907))

(declare-fun m!1417909 () Bool)

(assert (=> b!1535366 m!1417909))

(assert (=> b!1535363 m!1417891))

(assert (=> b!1535363 m!1417891))

(declare-fun m!1417911 () Bool)

(assert (=> b!1535363 m!1417911))

(declare-fun m!1417913 () Bool)

(assert (=> b!1535370 m!1417913))

(assert (=> b!1535370 m!1417913))

(declare-fun m!1417915 () Bool)

(assert (=> b!1535370 m!1417915))

(push 1)

(assert (not b!1535363))

(assert (not b!1535371))

(assert (not b!1535370))

(assert (not start!130902))

(assert (not b!1535365))

(assert (not b!1535368))

(assert (not b!1535369))

(assert (not b!1535366))

(check-sat)

