; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131004 () Bool)

(assert start!131004)

(declare-fun b!1537000 () Bool)

(declare-fun res!1054089 () Bool)

(declare-fun e!855439 () Bool)

(assert (=> b!1537000 (=> (not res!1054089) (not e!855439))))

(declare-datatypes ((array!102102 0))(
  ( (array!102103 (arr!49267 (Array (_ BitVec 32) (_ BitVec 64))) (size!49817 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102102)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537000 (= res!1054089 (validKeyInArray!0 (select (arr!49267 a!2792) i!951)))))

(declare-fun b!1537001 () Bool)

(declare-fun e!855442 () Bool)

(assert (=> b!1537001 (= e!855442 (not true))))

(declare-datatypes ((SeekEntryResult!13399 0))(
  ( (MissingZero!13399 (index!55991 (_ BitVec 32))) (Found!13399 (index!55992 (_ BitVec 32))) (Intermediate!13399 (undefined!14211 Bool) (index!55993 (_ BitVec 32)) (x!137721 (_ BitVec 32))) (Undefined!13399) (MissingVacant!13399 (index!55994 (_ BitVec 32))) )
))
(declare-fun lt!664557 () SeekEntryResult!13399)

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!664555 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102102 (_ BitVec 32)) SeekEntryResult!13399)

(assert (=> b!1537001 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664555 vacantIndex!5 (select (store (arr!49267 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102103 (store (arr!49267 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49817 a!2792)) mask!2480) lt!664557)))

(declare-datatypes ((Unit!51370 0))(
  ( (Unit!51371) )
))
(declare-fun lt!664556 () Unit!51370)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102102 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51370)

(assert (=> b!1537001 (= lt!664556 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664555 vacantIndex!5 mask!2480))))

(declare-fun b!1537002 () Bool)

(declare-fun res!1054088 () Bool)

(assert (=> b!1537002 (=> (not res!1054088) (not e!855439))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1537002 (= res!1054088 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49817 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49817 a!2792)) (= (select (arr!49267 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537003 () Bool)

(declare-fun res!1054087 () Bool)

(assert (=> b!1537003 (=> (not res!1054087) (not e!855439))))

(assert (=> b!1537003 (= res!1054087 (and (= (size!49817 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49817 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49817 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537004 () Bool)

(declare-fun res!1054086 () Bool)

(declare-fun e!855441 () Bool)

(assert (=> b!1537004 (=> (not res!1054086) (not e!855441))))

(assert (=> b!1537004 (= res!1054086 (not (= (select (arr!49267 a!2792) index!463) (select (arr!49267 a!2792) j!64))))))

(declare-fun b!1537005 () Bool)

(assert (=> b!1537005 (= e!855439 e!855441)))

(declare-fun res!1054096 () Bool)

(assert (=> b!1537005 (=> (not res!1054096) (not e!855441))))

(declare-fun lt!664558 () SeekEntryResult!13399)

(assert (=> b!1537005 (= res!1054096 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49267 a!2792) j!64) a!2792 mask!2480) lt!664558))))

(assert (=> b!1537005 (= lt!664558 (Found!13399 j!64))))

(declare-fun b!1537006 () Bool)

(declare-fun res!1054090 () Bool)

(assert (=> b!1537006 (=> (not res!1054090) (not e!855439))))

(assert (=> b!1537006 (= res!1054090 (validKeyInArray!0 (select (arr!49267 a!2792) j!64)))))

(declare-fun res!1054091 () Bool)

(assert (=> start!131004 (=> (not res!1054091) (not e!855439))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131004 (= res!1054091 (validMask!0 mask!2480))))

(assert (=> start!131004 e!855439))

(assert (=> start!131004 true))

(declare-fun array_inv!38295 (array!102102) Bool)

(assert (=> start!131004 (array_inv!38295 a!2792)))

(declare-fun b!1537007 () Bool)

(declare-fun res!1054092 () Bool)

(assert (=> b!1537007 (=> (not res!1054092) (not e!855439))))

(declare-datatypes ((List!35741 0))(
  ( (Nil!35738) (Cons!35737 (h!37182 (_ BitVec 64)) (t!50435 List!35741)) )
))
(declare-fun arrayNoDuplicates!0 (array!102102 (_ BitVec 32) List!35741) Bool)

(assert (=> b!1537007 (= res!1054092 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35738))))

(declare-fun b!1537008 () Bool)

(declare-fun e!855440 () Bool)

(assert (=> b!1537008 (= e!855440 e!855442)))

(declare-fun res!1054093 () Bool)

(assert (=> b!1537008 (=> (not res!1054093) (not e!855442))))

(assert (=> b!1537008 (= res!1054093 (= lt!664557 lt!664558))))

(assert (=> b!1537008 (= lt!664557 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664555 vacantIndex!5 (select (arr!49267 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537009 () Bool)

(assert (=> b!1537009 (= e!855441 e!855440)))

(declare-fun res!1054094 () Bool)

(assert (=> b!1537009 (=> (not res!1054094) (not e!855440))))

(assert (=> b!1537009 (= res!1054094 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664555 #b00000000000000000000000000000000) (bvslt lt!664555 (size!49817 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1537009 (= lt!664555 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1537010 () Bool)

(declare-fun res!1054095 () Bool)

(assert (=> b!1537010 (=> (not res!1054095) (not e!855439))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102102 (_ BitVec 32)) Bool)

(assert (=> b!1537010 (= res!1054095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!131004 res!1054091) b!1537003))

(assert (= (and b!1537003 res!1054087) b!1537000))

(assert (= (and b!1537000 res!1054089) b!1537006))

(assert (= (and b!1537006 res!1054090) b!1537010))

(assert (= (and b!1537010 res!1054095) b!1537007))

(assert (= (and b!1537007 res!1054092) b!1537002))

(assert (= (and b!1537002 res!1054088) b!1537005))

(assert (= (and b!1537005 res!1054096) b!1537004))

(assert (= (and b!1537004 res!1054086) b!1537009))

(assert (= (and b!1537009 res!1054094) b!1537008))

(assert (= (and b!1537008 res!1054093) b!1537001))

(declare-fun m!1419491 () Bool)

(assert (=> b!1537002 m!1419491))

(declare-fun m!1419493 () Bool)

(assert (=> b!1537000 m!1419493))

(assert (=> b!1537000 m!1419493))

(declare-fun m!1419495 () Bool)

(assert (=> b!1537000 m!1419495))

(declare-fun m!1419497 () Bool)

(assert (=> b!1537001 m!1419497))

(declare-fun m!1419499 () Bool)

(assert (=> b!1537001 m!1419499))

(assert (=> b!1537001 m!1419499))

(declare-fun m!1419501 () Bool)

(assert (=> b!1537001 m!1419501))

(declare-fun m!1419503 () Bool)

(assert (=> b!1537001 m!1419503))

(declare-fun m!1419505 () Bool)

(assert (=> start!131004 m!1419505))

(declare-fun m!1419507 () Bool)

(assert (=> start!131004 m!1419507))

(declare-fun m!1419509 () Bool)

(assert (=> b!1537008 m!1419509))

(assert (=> b!1537008 m!1419509))

(declare-fun m!1419511 () Bool)

(assert (=> b!1537008 m!1419511))

(declare-fun m!1419513 () Bool)

(assert (=> b!1537007 m!1419513))

(declare-fun m!1419515 () Bool)

(assert (=> b!1537010 m!1419515))

(assert (=> b!1537006 m!1419509))

(assert (=> b!1537006 m!1419509))

(declare-fun m!1419517 () Bool)

(assert (=> b!1537006 m!1419517))

(declare-fun m!1419519 () Bool)

(assert (=> b!1537009 m!1419519))

(declare-fun m!1419521 () Bool)

(assert (=> b!1537004 m!1419521))

(assert (=> b!1537004 m!1419509))

(assert (=> b!1537005 m!1419509))

(assert (=> b!1537005 m!1419509))

(declare-fun m!1419523 () Bool)

(assert (=> b!1537005 m!1419523))

(push 1)

(assert (not b!1537000))

(assert (not start!131004))

(assert (not b!1537006))

