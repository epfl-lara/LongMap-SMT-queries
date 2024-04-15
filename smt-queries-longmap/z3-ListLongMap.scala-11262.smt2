; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131316 () Bool)

(assert start!131316)

(declare-fun b!1539897 () Bool)

(declare-fun e!856437 () Bool)

(declare-fun e!856438 () Bool)

(assert (=> b!1539897 (= e!856437 e!856438)))

(declare-fun res!1056775 () Bool)

(assert (=> b!1539897 (=> (not res!1056775) (not e!856438))))

(declare-datatypes ((SeekEntryResult!13493 0))(
  ( (MissingZero!13493 (index!56367 (_ BitVec 32))) (Found!13493 (index!56368 (_ BitVec 32))) (Intermediate!13493 (undefined!14305 Bool) (index!56369 (_ BitVec 32)) (x!138103 (_ BitVec 32))) (Undefined!13493) (MissingVacant!13493 (index!56370 (_ BitVec 32))) )
))
(declare-fun lt!664979 () SeekEntryResult!13493)

(declare-fun lt!664978 () SeekEntryResult!13493)

(assert (=> b!1539897 (= res!1056775 (= lt!664979 lt!664978))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!664977 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-datatypes ((array!102262 0))(
  ( (array!102263 (arr!49342 (Array (_ BitVec 32) (_ BitVec 64))) (size!49894 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102262)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102262 (_ BitVec 32)) SeekEntryResult!13493)

(assert (=> b!1539897 (= lt!664979 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664977 vacantIndex!5 (select (arr!49342 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1539898 () Bool)

(assert (=> b!1539898 (= e!856438 (not true))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1539898 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664977 vacantIndex!5 (select (store (arr!49342 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102263 (store (arr!49342 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49894 a!2792)) mask!2480) lt!664979)))

(declare-datatypes ((Unit!51257 0))(
  ( (Unit!51258) )
))
(declare-fun lt!664980 () Unit!51257)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102262 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51257)

(assert (=> b!1539898 (= lt!664980 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664977 vacantIndex!5 mask!2480))))

(declare-fun res!1056771 () Bool)

(declare-fun e!856435 () Bool)

(assert (=> start!131316 (=> (not res!1056771) (not e!856435))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131316 (= res!1056771 (validMask!0 mask!2480))))

(assert (=> start!131316 e!856435))

(assert (=> start!131316 true))

(declare-fun array_inv!38575 (array!102262) Bool)

(assert (=> start!131316 (array_inv!38575 a!2792)))

(declare-fun b!1539899 () Bool)

(declare-fun res!1056778 () Bool)

(assert (=> b!1539899 (=> (not res!1056778) (not e!856435))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1539899 (= res!1056778 (validKeyInArray!0 (select (arr!49342 a!2792) j!64)))))

(declare-fun b!1539900 () Bool)

(declare-fun res!1056774 () Bool)

(assert (=> b!1539900 (=> (not res!1056774) (not e!856435))))

(declare-datatypes ((List!35894 0))(
  ( (Nil!35891) (Cons!35890 (h!37336 (_ BitVec 64)) (t!50580 List!35894)) )
))
(declare-fun arrayNoDuplicates!0 (array!102262 (_ BitVec 32) List!35894) Bool)

(assert (=> b!1539900 (= res!1056774 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35891))))

(declare-fun b!1539901 () Bool)

(declare-fun res!1056776 () Bool)

(assert (=> b!1539901 (=> (not res!1056776) (not e!856435))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1539901 (= res!1056776 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49894 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49894 a!2792)) (= (select (arr!49342 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1539902 () Bool)

(declare-fun e!856434 () Bool)

(assert (=> b!1539902 (= e!856434 e!856437)))

(declare-fun res!1056779 () Bool)

(assert (=> b!1539902 (=> (not res!1056779) (not e!856437))))

(assert (=> b!1539902 (= res!1056779 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664977 #b00000000000000000000000000000000) (bvslt lt!664977 (size!49894 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1539902 (= lt!664977 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1539903 () Bool)

(assert (=> b!1539903 (= e!856435 e!856434)))

(declare-fun res!1056781 () Bool)

(assert (=> b!1539903 (=> (not res!1056781) (not e!856434))))

(assert (=> b!1539903 (= res!1056781 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49342 a!2792) j!64) a!2792 mask!2480) lt!664978))))

(assert (=> b!1539903 (= lt!664978 (Found!13493 j!64))))

(declare-fun b!1539904 () Bool)

(declare-fun res!1056772 () Bool)

(assert (=> b!1539904 (=> (not res!1056772) (not e!856435))))

(assert (=> b!1539904 (= res!1056772 (and (= (size!49894 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49894 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49894 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1539905 () Bool)

(declare-fun res!1056773 () Bool)

(assert (=> b!1539905 (=> (not res!1056773) (not e!856435))))

(assert (=> b!1539905 (= res!1056773 (validKeyInArray!0 (select (arr!49342 a!2792) i!951)))))

(declare-fun b!1539906 () Bool)

(declare-fun res!1056777 () Bool)

(assert (=> b!1539906 (=> (not res!1056777) (not e!856434))))

(assert (=> b!1539906 (= res!1056777 (not (= (select (arr!49342 a!2792) index!463) (select (arr!49342 a!2792) j!64))))))

(declare-fun b!1539907 () Bool)

(declare-fun res!1056780 () Bool)

(assert (=> b!1539907 (=> (not res!1056780) (not e!856435))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102262 (_ BitVec 32)) Bool)

(assert (=> b!1539907 (= res!1056780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!131316 res!1056771) b!1539904))

(assert (= (and b!1539904 res!1056772) b!1539905))

(assert (= (and b!1539905 res!1056773) b!1539899))

(assert (= (and b!1539899 res!1056778) b!1539907))

(assert (= (and b!1539907 res!1056780) b!1539900))

(assert (= (and b!1539900 res!1056774) b!1539901))

(assert (= (and b!1539901 res!1056776) b!1539903))

(assert (= (and b!1539903 res!1056781) b!1539906))

(assert (= (and b!1539906 res!1056777) b!1539902))

(assert (= (and b!1539902 res!1056779) b!1539897))

(assert (= (and b!1539897 res!1056775) b!1539898))

(declare-fun m!1421423 () Bool)

(assert (=> b!1539899 m!1421423))

(assert (=> b!1539899 m!1421423))

(declare-fun m!1421425 () Bool)

(assert (=> b!1539899 m!1421425))

(declare-fun m!1421427 () Bool)

(assert (=> b!1539901 m!1421427))

(declare-fun m!1421429 () Bool)

(assert (=> start!131316 m!1421429))

(declare-fun m!1421431 () Bool)

(assert (=> start!131316 m!1421431))

(declare-fun m!1421433 () Bool)

(assert (=> b!1539900 m!1421433))

(declare-fun m!1421435 () Bool)

(assert (=> b!1539905 m!1421435))

(assert (=> b!1539905 m!1421435))

(declare-fun m!1421437 () Bool)

(assert (=> b!1539905 m!1421437))

(assert (=> b!1539897 m!1421423))

(assert (=> b!1539897 m!1421423))

(declare-fun m!1421439 () Bool)

(assert (=> b!1539897 m!1421439))

(declare-fun m!1421441 () Bool)

(assert (=> b!1539902 m!1421441))

(assert (=> b!1539903 m!1421423))

(assert (=> b!1539903 m!1421423))

(declare-fun m!1421443 () Bool)

(assert (=> b!1539903 m!1421443))

(declare-fun m!1421445 () Bool)

(assert (=> b!1539906 m!1421445))

(assert (=> b!1539906 m!1421423))

(declare-fun m!1421447 () Bool)

(assert (=> b!1539898 m!1421447))

(declare-fun m!1421449 () Bool)

(assert (=> b!1539898 m!1421449))

(assert (=> b!1539898 m!1421449))

(declare-fun m!1421451 () Bool)

(assert (=> b!1539898 m!1421451))

(declare-fun m!1421453 () Bool)

(assert (=> b!1539898 m!1421453))

(declare-fun m!1421455 () Bool)

(assert (=> b!1539907 m!1421455))

(check-sat (not b!1539907) (not b!1539899) (not b!1539897) (not b!1539900) (not b!1539898) (not b!1539905) (not b!1539903) (not start!131316) (not b!1539902))
(check-sat)
