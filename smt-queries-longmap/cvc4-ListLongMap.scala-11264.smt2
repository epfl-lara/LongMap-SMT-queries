; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131382 () Bool)

(assert start!131382)

(declare-fun b!1540474 () Bool)

(declare-fun res!1057173 () Bool)

(declare-fun e!856755 () Bool)

(assert (=> b!1540474 (=> (not res!1057173) (not e!856755))))

(declare-datatypes ((array!102330 0))(
  ( (array!102331 (arr!49375 (Array (_ BitVec 32) (_ BitVec 64))) (size!49925 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102330)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102330 (_ BitVec 32)) Bool)

(assert (=> b!1540474 (= res!1057173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1540475 () Bool)

(declare-fun e!856753 () Bool)

(declare-fun e!856756 () Bool)

(assert (=> b!1540475 (= e!856753 e!856756)))

(declare-fun res!1057164 () Bool)

(assert (=> b!1540475 (=> (not res!1057164) (not e!856756))))

(declare-datatypes ((SeekEntryResult!13501 0))(
  ( (MissingZero!13501 (index!56399 (_ BitVec 32))) (Found!13501 (index!56400 (_ BitVec 32))) (Intermediate!13501 (undefined!14313 Bool) (index!56401 (_ BitVec 32)) (x!138132 (_ BitVec 32))) (Undefined!13501) (MissingVacant!13501 (index!56402 (_ BitVec 32))) )
))
(declare-fun lt!665362 () SeekEntryResult!13501)

(declare-fun lt!665360 () SeekEntryResult!13501)

(assert (=> b!1540475 (= res!1057164 (= lt!665362 lt!665360))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!665361 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102330 (_ BitVec 32)) SeekEntryResult!13501)

(assert (=> b!1540475 (= lt!665362 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665361 vacantIndex!5 (select (arr!49375 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1540476 () Bool)

(declare-fun res!1057166 () Bool)

(assert (=> b!1540476 (=> (not res!1057166) (not e!856755))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1540476 (= res!1057166 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49925 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49925 a!2792)) (= (select (arr!49375 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1540477 () Bool)

(declare-fun res!1057167 () Bool)

(assert (=> b!1540477 (=> (not res!1057167) (not e!856755))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1540477 (= res!1057167 (validKeyInArray!0 (select (arr!49375 a!2792) j!64)))))

(declare-fun b!1540478 () Bool)

(declare-fun res!1057168 () Bool)

(assert (=> b!1540478 (=> (not res!1057168) (not e!856755))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1540478 (= res!1057168 (validKeyInArray!0 (select (arr!49375 a!2792) i!951)))))

(declare-fun b!1540479 () Bool)

(declare-fun res!1057174 () Bool)

(declare-fun e!856752 () Bool)

(assert (=> b!1540479 (=> (not res!1057174) (not e!856752))))

(assert (=> b!1540479 (= res!1057174 (not (= (select (arr!49375 a!2792) index!463) (select (arr!49375 a!2792) j!64))))))

(declare-fun b!1540480 () Bool)

(assert (=> b!1540480 (= e!856755 e!856752)))

(declare-fun res!1057165 () Bool)

(assert (=> b!1540480 (=> (not res!1057165) (not e!856752))))

(assert (=> b!1540480 (= res!1057165 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49375 a!2792) j!64) a!2792 mask!2480) lt!665360))))

(assert (=> b!1540480 (= lt!665360 (Found!13501 j!64))))

(declare-fun b!1540481 () Bool)

(assert (=> b!1540481 (= e!856756 (not true))))

(assert (=> b!1540481 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665361 vacantIndex!5 (select (store (arr!49375 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102331 (store (arr!49375 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49925 a!2792)) mask!2480) lt!665362)))

(declare-datatypes ((Unit!51442 0))(
  ( (Unit!51443) )
))
(declare-fun lt!665359 () Unit!51442)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102330 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51442)

(assert (=> b!1540481 (= lt!665359 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!665361 vacantIndex!5 mask!2480))))

(declare-fun b!1540482 () Bool)

(assert (=> b!1540482 (= e!856752 e!856753)))

(declare-fun res!1057171 () Bool)

(assert (=> b!1540482 (=> (not res!1057171) (not e!856753))))

(assert (=> b!1540482 (= res!1057171 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!665361 #b00000000000000000000000000000000) (bvslt lt!665361 (size!49925 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1540482 (= lt!665361 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1540483 () Bool)

(declare-fun res!1057170 () Bool)

(assert (=> b!1540483 (=> (not res!1057170) (not e!856755))))

(declare-datatypes ((List!35849 0))(
  ( (Nil!35846) (Cons!35845 (h!37290 (_ BitVec 64)) (t!50543 List!35849)) )
))
(declare-fun arrayNoDuplicates!0 (array!102330 (_ BitVec 32) List!35849) Bool)

(assert (=> b!1540483 (= res!1057170 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35846))))

(declare-fun b!1540484 () Bool)

(declare-fun res!1057172 () Bool)

(assert (=> b!1540484 (=> (not res!1057172) (not e!856755))))

(assert (=> b!1540484 (= res!1057172 (and (= (size!49925 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49925 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49925 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1057169 () Bool)

(assert (=> start!131382 (=> (not res!1057169) (not e!856755))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131382 (= res!1057169 (validMask!0 mask!2480))))

(assert (=> start!131382 e!856755))

(assert (=> start!131382 true))

(declare-fun array_inv!38403 (array!102330) Bool)

(assert (=> start!131382 (array_inv!38403 a!2792)))

(assert (= (and start!131382 res!1057169) b!1540484))

(assert (= (and b!1540484 res!1057172) b!1540478))

(assert (= (and b!1540478 res!1057168) b!1540477))

(assert (= (and b!1540477 res!1057167) b!1540474))

(assert (= (and b!1540474 res!1057173) b!1540483))

(assert (= (and b!1540483 res!1057170) b!1540476))

(assert (= (and b!1540476 res!1057166) b!1540480))

(assert (= (and b!1540480 res!1057165) b!1540479))

(assert (= (and b!1540479 res!1057174) b!1540482))

(assert (= (and b!1540482 res!1057171) b!1540475))

(assert (= (and b!1540475 res!1057164) b!1540481))

(declare-fun m!1422587 () Bool)

(assert (=> b!1540474 m!1422587))

(declare-fun m!1422589 () Bool)

(assert (=> b!1540477 m!1422589))

(assert (=> b!1540477 m!1422589))

(declare-fun m!1422591 () Bool)

(assert (=> b!1540477 m!1422591))

(assert (=> b!1540475 m!1422589))

(assert (=> b!1540475 m!1422589))

(declare-fun m!1422593 () Bool)

(assert (=> b!1540475 m!1422593))

(declare-fun m!1422595 () Bool)

(assert (=> b!1540483 m!1422595))

(declare-fun m!1422597 () Bool)

(assert (=> start!131382 m!1422597))

(declare-fun m!1422599 () Bool)

(assert (=> start!131382 m!1422599))

(declare-fun m!1422601 () Bool)

(assert (=> b!1540482 m!1422601))

(declare-fun m!1422603 () Bool)

(assert (=> b!1540479 m!1422603))

(assert (=> b!1540479 m!1422589))

(declare-fun m!1422605 () Bool)

(assert (=> b!1540481 m!1422605))

(declare-fun m!1422607 () Bool)

(assert (=> b!1540481 m!1422607))

(assert (=> b!1540481 m!1422607))

(declare-fun m!1422609 () Bool)

(assert (=> b!1540481 m!1422609))

(declare-fun m!1422611 () Bool)

(assert (=> b!1540481 m!1422611))

(declare-fun m!1422613 () Bool)

(assert (=> b!1540476 m!1422613))

(declare-fun m!1422615 () Bool)

(assert (=> b!1540478 m!1422615))

(assert (=> b!1540478 m!1422615))

(declare-fun m!1422617 () Bool)

(assert (=> b!1540478 m!1422617))

(assert (=> b!1540480 m!1422589))

(assert (=> b!1540480 m!1422589))

(declare-fun m!1422619 () Bool)

(assert (=> b!1540480 m!1422619))

(push 1)

(assert (not b!1540483))

(assert (not start!131382))

(assert (not b!1540475))

(assert (not b!1540474))

