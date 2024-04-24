; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131286 () Bool)

(assert start!131286)

(declare-fun b!1537289 () Bool)

(declare-fun res!1052799 () Bool)

(declare-fun e!856131 () Bool)

(assert (=> b!1537289 (=> (not res!1052799) (not e!856131))))

(declare-datatypes ((array!102088 0))(
  ( (array!102089 (arr!49252 (Array (_ BitVec 32) (_ BitVec 64))) (size!49803 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102088)

(declare-datatypes ((List!35713 0))(
  ( (Nil!35710) (Cons!35709 (h!37172 (_ BitVec 64)) (t!50399 List!35713)) )
))
(declare-fun arrayNoDuplicates!0 (array!102088 (_ BitVec 32) List!35713) Bool)

(assert (=> b!1537289 (= res!1052799 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35710))))

(declare-fun b!1537290 () Bool)

(declare-fun res!1052801 () Bool)

(assert (=> b!1537290 (=> (not res!1052801) (not e!856131))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13279 0))(
  ( (MissingZero!13279 (index!55511 (_ BitVec 32))) (Found!13279 (index!55512 (_ BitVec 32))) (Intermediate!13279 (undefined!14091 Bool) (index!55513 (_ BitVec 32)) (x!137475 (_ BitVec 32))) (Undefined!13279) (MissingVacant!13279 (index!55514 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102088 (_ BitVec 32)) SeekEntryResult!13279)

(assert (=> b!1537290 (= res!1052801 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49252 a!2792) j!64) a!2792 mask!2480) (Found!13279 j!64)))))

(declare-fun b!1537291 () Bool)

(declare-fun res!1052807 () Bool)

(assert (=> b!1537291 (=> (not res!1052807) (not e!856131))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537291 (= res!1052807 (validKeyInArray!0 (select (arr!49252 a!2792) i!951)))))

(declare-fun b!1537292 () Bool)

(declare-fun e!856130 () Bool)

(assert (=> b!1537292 (= e!856131 e!856130)))

(declare-fun res!1052808 () Bool)

(assert (=> b!1537292 (=> (not res!1052808) (not e!856130))))

(declare-fun lt!664853 () (_ BitVec 32))

(assert (=> b!1537292 (= res!1052808 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664853 #b00000000000000000000000000000000) (bvslt lt!664853 (size!49803 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1537292 (= lt!664853 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1537293 () Bool)

(declare-fun res!1052803 () Bool)

(assert (=> b!1537293 (=> (not res!1052803) (not e!856131))))

(assert (=> b!1537293 (= res!1052803 (validKeyInArray!0 (select (arr!49252 a!2792) j!64)))))

(declare-fun b!1537294 () Bool)

(declare-fun res!1052800 () Bool)

(assert (=> b!1537294 (=> (not res!1052800) (not e!856131))))

(assert (=> b!1537294 (= res!1052800 (and (= (size!49803 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49803 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49803 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537295 () Bool)

(declare-fun res!1052805 () Bool)

(assert (=> b!1537295 (=> (not res!1052805) (not e!856131))))

(assert (=> b!1537295 (= res!1052805 (not (= (select (arr!49252 a!2792) index!463) (select (arr!49252 a!2792) j!64))))))

(declare-fun b!1537297 () Bool)

(declare-fun res!1052804 () Bool)

(assert (=> b!1537297 (=> (not res!1052804) (not e!856131))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102088 (_ BitVec 32)) Bool)

(assert (=> b!1537297 (= res!1052804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537298 () Bool)

(declare-fun res!1052806 () Bool)

(assert (=> b!1537298 (=> (not res!1052806) (not e!856131))))

(assert (=> b!1537298 (= res!1052806 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49803 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49803 a!2792)) (= (select (arr!49252 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537296 () Bool)

(assert (=> b!1537296 (= e!856130 false)))

(declare-fun lt!664854 () SeekEntryResult!13279)

(assert (=> b!1537296 (= lt!664854 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664853 vacantIndex!5 (select (arr!49252 a!2792) j!64) a!2792 mask!2480))))

(declare-fun res!1052802 () Bool)

(assert (=> start!131286 (=> (not res!1052802) (not e!856131))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131286 (= res!1052802 (validMask!0 mask!2480))))

(assert (=> start!131286 e!856131))

(assert (=> start!131286 true))

(declare-fun array_inv!38533 (array!102088) Bool)

(assert (=> start!131286 (array_inv!38533 a!2792)))

(assert (= (and start!131286 res!1052802) b!1537294))

(assert (= (and b!1537294 res!1052800) b!1537291))

(assert (= (and b!1537291 res!1052807) b!1537293))

(assert (= (and b!1537293 res!1052803) b!1537297))

(assert (= (and b!1537297 res!1052804) b!1537289))

(assert (= (and b!1537289 res!1052799) b!1537298))

(assert (= (and b!1537298 res!1052806) b!1537290))

(assert (= (and b!1537290 res!1052801) b!1537295))

(assert (= (and b!1537295 res!1052805) b!1537292))

(assert (= (and b!1537292 res!1052808) b!1537296))

(declare-fun m!1419685 () Bool)

(assert (=> b!1537293 m!1419685))

(assert (=> b!1537293 m!1419685))

(declare-fun m!1419687 () Bool)

(assert (=> b!1537293 m!1419687))

(assert (=> b!1537290 m!1419685))

(assert (=> b!1537290 m!1419685))

(declare-fun m!1419689 () Bool)

(assert (=> b!1537290 m!1419689))

(declare-fun m!1419691 () Bool)

(assert (=> b!1537295 m!1419691))

(assert (=> b!1537295 m!1419685))

(declare-fun m!1419693 () Bool)

(assert (=> start!131286 m!1419693))

(declare-fun m!1419695 () Bool)

(assert (=> start!131286 m!1419695))

(declare-fun m!1419697 () Bool)

(assert (=> b!1537291 m!1419697))

(assert (=> b!1537291 m!1419697))

(declare-fun m!1419699 () Bool)

(assert (=> b!1537291 m!1419699))

(declare-fun m!1419701 () Bool)

(assert (=> b!1537298 m!1419701))

(assert (=> b!1537296 m!1419685))

(assert (=> b!1537296 m!1419685))

(declare-fun m!1419703 () Bool)

(assert (=> b!1537296 m!1419703))

(declare-fun m!1419705 () Bool)

(assert (=> b!1537292 m!1419705))

(declare-fun m!1419707 () Bool)

(assert (=> b!1537297 m!1419707))

(declare-fun m!1419709 () Bool)

(assert (=> b!1537289 m!1419709))

(check-sat (not b!1537296) (not b!1537297) (not start!131286) (not b!1537289) (not b!1537292) (not b!1537291) (not b!1537290) (not b!1537293))
(check-sat)
