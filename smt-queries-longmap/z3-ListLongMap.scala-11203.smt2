; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131268 () Bool)

(assert start!131268)

(declare-fun b!1537019 () Bool)

(declare-fun res!1052536 () Bool)

(declare-fun e!856050 () Bool)

(assert (=> b!1537019 (=> (not res!1052536) (not e!856050))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102070 0))(
  ( (array!102071 (arr!49243 (Array (_ BitVec 32) (_ BitVec 64))) (size!49794 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102070)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13270 0))(
  ( (MissingZero!13270 (index!55475 (_ BitVec 32))) (Found!13270 (index!55476 (_ BitVec 32))) (Intermediate!13270 (undefined!14082 Bool) (index!55477 (_ BitVec 32)) (x!137442 (_ BitVec 32))) (Undefined!13270) (MissingVacant!13270 (index!55478 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102070 (_ BitVec 32)) SeekEntryResult!13270)

(assert (=> b!1537019 (= res!1052536 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49243 a!2792) j!64) a!2792 mask!2480) (Found!13270 j!64)))))

(declare-fun b!1537020 () Bool)

(declare-fun res!1052532 () Bool)

(assert (=> b!1537020 (=> (not res!1052532) (not e!856050))))

(assert (=> b!1537020 (= res!1052532 (not (= (select (arr!49243 a!2792) index!463) (select (arr!49243 a!2792) j!64))))))

(declare-fun b!1537021 () Bool)

(declare-fun res!1052534 () Bool)

(assert (=> b!1537021 (=> (not res!1052534) (not e!856050))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537021 (= res!1052534 (and (= (size!49794 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49794 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49794 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537022 () Bool)

(declare-fun res!1052529 () Bool)

(assert (=> b!1537022 (=> (not res!1052529) (not e!856050))))

(declare-datatypes ((List!35704 0))(
  ( (Nil!35701) (Cons!35700 (h!37163 (_ BitVec 64)) (t!50390 List!35704)) )
))
(declare-fun arrayNoDuplicates!0 (array!102070 (_ BitVec 32) List!35704) Bool)

(assert (=> b!1537022 (= res!1052529 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35701))))

(declare-fun b!1537023 () Bool)

(declare-fun res!1052537 () Bool)

(assert (=> b!1537023 (=> (not res!1052537) (not e!856050))))

(assert (=> b!1537023 (= res!1052537 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49794 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49794 a!2792)) (= (select (arr!49243 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537024 () Bool)

(declare-fun e!856051 () Bool)

(assert (=> b!1537024 (= e!856051 false)))

(declare-fun lt!664799 () SeekEntryResult!13270)

(declare-fun lt!664800 () (_ BitVec 32))

(assert (=> b!1537024 (= lt!664799 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664800 vacantIndex!5 (select (arr!49243 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537025 () Bool)

(declare-fun res!1052535 () Bool)

(assert (=> b!1537025 (=> (not res!1052535) (not e!856050))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537025 (= res!1052535 (validKeyInArray!0 (select (arr!49243 a!2792) i!951)))))

(declare-fun b!1537026 () Bool)

(assert (=> b!1537026 (= e!856050 e!856051)))

(declare-fun res!1052538 () Bool)

(assert (=> b!1537026 (=> (not res!1052538) (not e!856051))))

(assert (=> b!1537026 (= res!1052538 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664800 #b00000000000000000000000000000000) (bvslt lt!664800 (size!49794 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1537026 (= lt!664800 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1537027 () Bool)

(declare-fun res!1052533 () Bool)

(assert (=> b!1537027 (=> (not res!1052533) (not e!856050))))

(assert (=> b!1537027 (= res!1052533 (validKeyInArray!0 (select (arr!49243 a!2792) j!64)))))

(declare-fun b!1537028 () Bool)

(declare-fun res!1052531 () Bool)

(assert (=> b!1537028 (=> (not res!1052531) (not e!856050))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102070 (_ BitVec 32)) Bool)

(assert (=> b!1537028 (= res!1052531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun res!1052530 () Bool)

(assert (=> start!131268 (=> (not res!1052530) (not e!856050))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131268 (= res!1052530 (validMask!0 mask!2480))))

(assert (=> start!131268 e!856050))

(assert (=> start!131268 true))

(declare-fun array_inv!38524 (array!102070) Bool)

(assert (=> start!131268 (array_inv!38524 a!2792)))

(assert (= (and start!131268 res!1052530) b!1537021))

(assert (= (and b!1537021 res!1052534) b!1537025))

(assert (= (and b!1537025 res!1052535) b!1537027))

(assert (= (and b!1537027 res!1052533) b!1537028))

(assert (= (and b!1537028 res!1052531) b!1537022))

(assert (= (and b!1537022 res!1052529) b!1537023))

(assert (= (and b!1537023 res!1052537) b!1537019))

(assert (= (and b!1537019 res!1052536) b!1537020))

(assert (= (and b!1537020 res!1052532) b!1537026))

(assert (= (and b!1537026 res!1052538) b!1537024))

(declare-fun m!1419451 () Bool)

(assert (=> b!1537027 m!1419451))

(assert (=> b!1537027 m!1419451))

(declare-fun m!1419453 () Bool)

(assert (=> b!1537027 m!1419453))

(declare-fun m!1419455 () Bool)

(assert (=> b!1537023 m!1419455))

(assert (=> b!1537019 m!1419451))

(assert (=> b!1537019 m!1419451))

(declare-fun m!1419457 () Bool)

(assert (=> b!1537019 m!1419457))

(declare-fun m!1419459 () Bool)

(assert (=> b!1537026 m!1419459))

(declare-fun m!1419461 () Bool)

(assert (=> b!1537022 m!1419461))

(declare-fun m!1419463 () Bool)

(assert (=> b!1537020 m!1419463))

(assert (=> b!1537020 m!1419451))

(declare-fun m!1419465 () Bool)

(assert (=> b!1537025 m!1419465))

(assert (=> b!1537025 m!1419465))

(declare-fun m!1419467 () Bool)

(assert (=> b!1537025 m!1419467))

(declare-fun m!1419469 () Bool)

(assert (=> b!1537028 m!1419469))

(declare-fun m!1419471 () Bool)

(assert (=> start!131268 m!1419471))

(declare-fun m!1419473 () Bool)

(assert (=> start!131268 m!1419473))

(assert (=> b!1537024 m!1419451))

(assert (=> b!1537024 m!1419451))

(declare-fun m!1419475 () Bool)

(assert (=> b!1537024 m!1419475))

(check-sat (not b!1537022) (not b!1537025) (not b!1537019) (not b!1537027) (not b!1537028) (not b!1537026) (not start!131268) (not b!1537024))
(check-sat)
