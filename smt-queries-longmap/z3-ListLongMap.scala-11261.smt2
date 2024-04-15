; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131310 () Bool)

(assert start!131310)

(declare-fun b!1539798 () Bool)

(declare-fun res!1056682 () Bool)

(declare-fun e!856389 () Bool)

(assert (=> b!1539798 (=> (not res!1056682) (not e!856389))))

(declare-datatypes ((array!102256 0))(
  ( (array!102257 (arr!49339 (Array (_ BitVec 32) (_ BitVec 64))) (size!49891 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102256)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1539798 (= res!1056682 (validKeyInArray!0 (select (arr!49339 a!2792) j!64)))))

(declare-fun b!1539799 () Bool)

(declare-fun res!1056679 () Bool)

(assert (=> b!1539799 (=> (not res!1056679) (not e!856389))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1539799 (= res!1056679 (validKeyInArray!0 (select (arr!49339 a!2792) i!951)))))

(declare-fun b!1539800 () Bool)

(declare-fun e!856392 () Bool)

(declare-fun e!856391 () Bool)

(assert (=> b!1539800 (= e!856392 e!856391)))

(declare-fun res!1056681 () Bool)

(assert (=> b!1539800 (=> (not res!1056681) (not e!856391))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!664941 () (_ BitVec 32))

(assert (=> b!1539800 (= res!1056681 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664941 #b00000000000000000000000000000000) (bvslt lt!664941 (size!49891 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1539800 (= lt!664941 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1539801 () Bool)

(declare-fun res!1056677 () Bool)

(assert (=> b!1539801 (=> (not res!1056677) (not e!856392))))

(assert (=> b!1539801 (= res!1056677 (not (= (select (arr!49339 a!2792) index!463) (select (arr!49339 a!2792) j!64))))))

(declare-fun b!1539802 () Bool)

(declare-fun res!1056673 () Bool)

(assert (=> b!1539802 (=> (not res!1056673) (not e!856389))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102256 (_ BitVec 32)) Bool)

(assert (=> b!1539802 (= res!1056673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1539803 () Bool)

(declare-fun res!1056672 () Bool)

(assert (=> b!1539803 (=> (not res!1056672) (not e!856389))))

(declare-datatypes ((List!35891 0))(
  ( (Nil!35888) (Cons!35887 (h!37333 (_ BitVec 64)) (t!50577 List!35891)) )
))
(declare-fun arrayNoDuplicates!0 (array!102256 (_ BitVec 32) List!35891) Bool)

(assert (=> b!1539803 (= res!1056672 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35888))))

(declare-fun b!1539804 () Bool)

(declare-fun e!856393 () Bool)

(assert (=> b!1539804 (= e!856391 e!856393)))

(declare-fun res!1056675 () Bool)

(assert (=> b!1539804 (=> (not res!1056675) (not e!856393))))

(declare-datatypes ((SeekEntryResult!13490 0))(
  ( (MissingZero!13490 (index!56355 (_ BitVec 32))) (Found!13490 (index!56356 (_ BitVec 32))) (Intermediate!13490 (undefined!14302 Bool) (index!56357 (_ BitVec 32)) (x!138092 (_ BitVec 32))) (Undefined!13490) (MissingVacant!13490 (index!56358 (_ BitVec 32))) )
))
(declare-fun lt!664943 () SeekEntryResult!13490)

(declare-fun lt!664944 () SeekEntryResult!13490)

(assert (=> b!1539804 (= res!1056675 (= lt!664943 lt!664944))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102256 (_ BitVec 32)) SeekEntryResult!13490)

(assert (=> b!1539804 (= lt!664943 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664941 vacantIndex!5 (select (arr!49339 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1539805 () Bool)

(assert (=> b!1539805 (= e!856389 e!856392)))

(declare-fun res!1056680 () Bool)

(assert (=> b!1539805 (=> (not res!1056680) (not e!856392))))

(assert (=> b!1539805 (= res!1056680 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49339 a!2792) j!64) a!2792 mask!2480) lt!664944))))

(assert (=> b!1539805 (= lt!664944 (Found!13490 j!64))))

(declare-fun b!1539806 () Bool)

(declare-fun res!1056676 () Bool)

(assert (=> b!1539806 (=> (not res!1056676) (not e!856389))))

(assert (=> b!1539806 (= res!1056676 (and (= (size!49891 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49891 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49891 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1539807 () Bool)

(declare-fun res!1056678 () Bool)

(assert (=> b!1539807 (=> (not res!1056678) (not e!856389))))

(assert (=> b!1539807 (= res!1056678 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49891 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49891 a!2792)) (= (select (arr!49339 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1539808 () Bool)

(assert (=> b!1539808 (= e!856393 (not true))))

(assert (=> b!1539808 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664941 vacantIndex!5 (select (store (arr!49339 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102257 (store (arr!49339 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49891 a!2792)) mask!2480) lt!664943)))

(declare-datatypes ((Unit!51251 0))(
  ( (Unit!51252) )
))
(declare-fun lt!664942 () Unit!51251)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102256 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51251)

(assert (=> b!1539808 (= lt!664942 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664941 vacantIndex!5 mask!2480))))

(declare-fun res!1056674 () Bool)

(assert (=> start!131310 (=> (not res!1056674) (not e!856389))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131310 (= res!1056674 (validMask!0 mask!2480))))

(assert (=> start!131310 e!856389))

(assert (=> start!131310 true))

(declare-fun array_inv!38572 (array!102256) Bool)

(assert (=> start!131310 (array_inv!38572 a!2792)))

(assert (= (and start!131310 res!1056674) b!1539806))

(assert (= (and b!1539806 res!1056676) b!1539799))

(assert (= (and b!1539799 res!1056679) b!1539798))

(assert (= (and b!1539798 res!1056682) b!1539802))

(assert (= (and b!1539802 res!1056673) b!1539803))

(assert (= (and b!1539803 res!1056672) b!1539807))

(assert (= (and b!1539807 res!1056678) b!1539805))

(assert (= (and b!1539805 res!1056680) b!1539801))

(assert (= (and b!1539801 res!1056677) b!1539800))

(assert (= (and b!1539800 res!1056681) b!1539804))

(assert (= (and b!1539804 res!1056675) b!1539808))

(declare-fun m!1421321 () Bool)

(assert (=> b!1539798 m!1421321))

(assert (=> b!1539798 m!1421321))

(declare-fun m!1421323 () Bool)

(assert (=> b!1539798 m!1421323))

(declare-fun m!1421325 () Bool)

(assert (=> start!131310 m!1421325))

(declare-fun m!1421327 () Bool)

(assert (=> start!131310 m!1421327))

(declare-fun m!1421329 () Bool)

(assert (=> b!1539801 m!1421329))

(assert (=> b!1539801 m!1421321))

(assert (=> b!1539805 m!1421321))

(assert (=> b!1539805 m!1421321))

(declare-fun m!1421331 () Bool)

(assert (=> b!1539805 m!1421331))

(declare-fun m!1421333 () Bool)

(assert (=> b!1539799 m!1421333))

(assert (=> b!1539799 m!1421333))

(declare-fun m!1421335 () Bool)

(assert (=> b!1539799 m!1421335))

(declare-fun m!1421337 () Bool)

(assert (=> b!1539803 m!1421337))

(declare-fun m!1421339 () Bool)

(assert (=> b!1539807 m!1421339))

(assert (=> b!1539804 m!1421321))

(assert (=> b!1539804 m!1421321))

(declare-fun m!1421341 () Bool)

(assert (=> b!1539804 m!1421341))

(declare-fun m!1421343 () Bool)

(assert (=> b!1539808 m!1421343))

(declare-fun m!1421345 () Bool)

(assert (=> b!1539808 m!1421345))

(assert (=> b!1539808 m!1421345))

(declare-fun m!1421347 () Bool)

(assert (=> b!1539808 m!1421347))

(declare-fun m!1421349 () Bool)

(assert (=> b!1539808 m!1421349))

(declare-fun m!1421351 () Bool)

(assert (=> b!1539802 m!1421351))

(declare-fun m!1421353 () Bool)

(assert (=> b!1539800 m!1421353))

(check-sat (not b!1539805) (not b!1539798) (not b!1539802) (not b!1539803) (not b!1539799) (not b!1539808) (not b!1539800) (not b!1539804) (not start!131310))
(check-sat)
