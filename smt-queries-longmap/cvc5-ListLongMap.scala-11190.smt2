; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131158 () Bool)

(assert start!131158)

(declare-fun b!1536020 () Bool)

(declare-fun res!1051621 () Bool)

(declare-fun e!855727 () Bool)

(assert (=> b!1536020 (=> (not res!1051621) (not e!855727))))

(declare-datatypes ((array!101993 0))(
  ( (array!101994 (arr!49206 (Array (_ BitVec 32) (_ BitVec 64))) (size!49757 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101993)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101993 (_ BitVec 32)) Bool)

(assert (=> b!1536020 (= res!1051621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1536021 () Bool)

(assert (=> b!1536021 (= e!855727 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13233 0))(
  ( (MissingZero!13233 (index!55327 (_ BitVec 32))) (Found!13233 (index!55328 (_ BitVec 32))) (Intermediate!13233 (undefined!14045 Bool) (index!55329 (_ BitVec 32)) (x!137298 (_ BitVec 32))) (Undefined!13233) (MissingVacant!13233 (index!55330 (_ BitVec 32))) )
))
(declare-fun lt!664686 () SeekEntryResult!13233)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101993 (_ BitVec 32)) SeekEntryResult!13233)

(assert (=> b!1536021 (= lt!664686 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49206 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1536023 () Bool)

(declare-fun res!1051622 () Bool)

(assert (=> b!1536023 (=> (not res!1051622) (not e!855727))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536023 (= res!1051622 (validKeyInArray!0 (select (arr!49206 a!2792) i!951)))))

(declare-fun b!1536024 () Bool)

(declare-fun res!1051620 () Bool)

(assert (=> b!1536024 (=> (not res!1051620) (not e!855727))))

(assert (=> b!1536024 (= res!1051620 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49757 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49757 a!2792)) (= (select (arr!49206 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536025 () Bool)

(declare-fun res!1051625 () Bool)

(assert (=> b!1536025 (=> (not res!1051625) (not e!855727))))

(assert (=> b!1536025 (= res!1051625 (and (= (size!49757 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49757 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49757 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536026 () Bool)

(declare-fun res!1051623 () Bool)

(assert (=> b!1536026 (=> (not res!1051623) (not e!855727))))

(declare-datatypes ((List!35667 0))(
  ( (Nil!35664) (Cons!35663 (h!37126 (_ BitVec 64)) (t!50353 List!35667)) )
))
(declare-fun arrayNoDuplicates!0 (array!101993 (_ BitVec 32) List!35667) Bool)

(assert (=> b!1536026 (= res!1051623 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35664))))

(declare-fun res!1051624 () Bool)

(assert (=> start!131158 (=> (not res!1051624) (not e!855727))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131158 (= res!1051624 (validMask!0 mask!2480))))

(assert (=> start!131158 e!855727))

(assert (=> start!131158 true))

(declare-fun array_inv!38487 (array!101993) Bool)

(assert (=> start!131158 (array_inv!38487 a!2792)))

(declare-fun b!1536022 () Bool)

(declare-fun res!1051626 () Bool)

(assert (=> b!1536022 (=> (not res!1051626) (not e!855727))))

(assert (=> b!1536022 (= res!1051626 (validKeyInArray!0 (select (arr!49206 a!2792) j!64)))))

(assert (= (and start!131158 res!1051624) b!1536025))

(assert (= (and b!1536025 res!1051625) b!1536023))

(assert (= (and b!1536023 res!1051622) b!1536022))

(assert (= (and b!1536022 res!1051626) b!1536020))

(assert (= (and b!1536020 res!1051621) b!1536026))

(assert (= (and b!1536026 res!1051623) b!1536024))

(assert (= (and b!1536024 res!1051620) b!1536021))

(declare-fun m!1418585 () Bool)

(assert (=> b!1536021 m!1418585))

(assert (=> b!1536021 m!1418585))

(declare-fun m!1418587 () Bool)

(assert (=> b!1536021 m!1418587))

(assert (=> b!1536022 m!1418585))

(assert (=> b!1536022 m!1418585))

(declare-fun m!1418589 () Bool)

(assert (=> b!1536022 m!1418589))

(declare-fun m!1418591 () Bool)

(assert (=> b!1536020 m!1418591))

(declare-fun m!1418593 () Bool)

(assert (=> b!1536023 m!1418593))

(assert (=> b!1536023 m!1418593))

(declare-fun m!1418595 () Bool)

(assert (=> b!1536023 m!1418595))

(declare-fun m!1418597 () Bool)

(assert (=> b!1536026 m!1418597))

(declare-fun m!1418599 () Bool)

(assert (=> start!131158 m!1418599))

(declare-fun m!1418601 () Bool)

(assert (=> start!131158 m!1418601))

(declare-fun m!1418603 () Bool)

(assert (=> b!1536024 m!1418603))

(push 1)

(assert (not b!1536020))

(assert (not b!1536022))

(assert (not b!1536026))

(assert (not b!1536021))

(assert (not start!131158))

(assert (not b!1536023))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

