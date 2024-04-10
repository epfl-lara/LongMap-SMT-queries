; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130970 () Bool)

(assert start!130970)

(declare-fun b!1536430 () Bool)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun e!855176 () Bool)

(assert (=> b!1536430 (= e!855176 (not (or (bvslt mask!2480 #b00000000000000000000000000000000) (bvsge index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvslt vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480)))))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102068 0))(
  ( (array!102069 (arr!49250 (Array (_ BitVec 32) (_ BitVec 64))) (size!49800 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102068)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun lt!664342 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13382 0))(
  ( (MissingZero!13382 (index!55923 (_ BitVec 32))) (Found!13382 (index!55924 (_ BitVec 32))) (Intermediate!13382 (undefined!14194 Bool) (index!55925 (_ BitVec 32)) (x!137664 (_ BitVec 32))) (Undefined!13382) (MissingVacant!13382 (index!55926 (_ BitVec 32))) )
))
(declare-fun lt!664345 () SeekEntryResult!13382)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102068 (_ BitVec 32)) SeekEntryResult!13382)

(assert (=> b!1536430 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664342 vacantIndex!5 (select (store (arr!49250 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102069 (store (arr!49250 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49800 a!2792)) mask!2480) lt!664345)))

(declare-datatypes ((Unit!51336 0))(
  ( (Unit!51337) )
))
(declare-fun lt!664343 () Unit!51336)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102068 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51336)

(assert (=> b!1536430 (= lt!664343 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664342 vacantIndex!5 mask!2480))))

(declare-fun b!1536431 () Bool)

(declare-fun res!1053518 () Bool)

(declare-fun e!855177 () Bool)

(assert (=> b!1536431 (=> (not res!1053518) (not e!855177))))

(declare-datatypes ((List!35724 0))(
  ( (Nil!35721) (Cons!35720 (h!37165 (_ BitVec 64)) (t!50418 List!35724)) )
))
(declare-fun arrayNoDuplicates!0 (array!102068 (_ BitVec 32) List!35724) Bool)

(assert (=> b!1536431 (= res!1053518 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35721))))

(declare-fun b!1536432 () Bool)

(declare-fun res!1053517 () Bool)

(assert (=> b!1536432 (=> (not res!1053517) (not e!855177))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536432 (= res!1053517 (validKeyInArray!0 (select (arr!49250 a!2792) j!64)))))

(declare-fun b!1536433 () Bool)

(declare-fun res!1053520 () Bool)

(declare-fun e!855178 () Bool)

(assert (=> b!1536433 (=> (not res!1053520) (not e!855178))))

(assert (=> b!1536433 (= res!1053520 (not (= (select (arr!49250 a!2792) index!463) (select (arr!49250 a!2792) j!64))))))

(declare-fun b!1536434 () Bool)

(declare-fun res!1053523 () Bool)

(assert (=> b!1536434 (=> (not res!1053523) (not e!855177))))

(assert (=> b!1536434 (= res!1053523 (and (= (size!49800 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49800 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49800 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536435 () Bool)

(declare-fun res!1053516 () Bool)

(assert (=> b!1536435 (=> (not res!1053516) (not e!855177))))

(assert (=> b!1536435 (= res!1053516 (validKeyInArray!0 (select (arr!49250 a!2792) i!951)))))

(declare-fun b!1536436 () Bool)

(declare-fun res!1053526 () Bool)

(assert (=> b!1536436 (=> (not res!1053526) (not e!855177))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102068 (_ BitVec 32)) Bool)

(assert (=> b!1536436 (= res!1053526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1536437 () Bool)

(assert (=> b!1536437 (= e!855177 e!855178)))

(declare-fun res!1053519 () Bool)

(assert (=> b!1536437 (=> (not res!1053519) (not e!855178))))

(declare-fun lt!664344 () SeekEntryResult!13382)

(assert (=> b!1536437 (= res!1053519 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49250 a!2792) j!64) a!2792 mask!2480) lt!664344))))

(assert (=> b!1536437 (= lt!664344 (Found!13382 j!64))))

(declare-fun res!1053522 () Bool)

(assert (=> start!130970 (=> (not res!1053522) (not e!855177))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130970 (= res!1053522 (validMask!0 mask!2480))))

(assert (=> start!130970 e!855177))

(assert (=> start!130970 true))

(declare-fun array_inv!38278 (array!102068) Bool)

(assert (=> start!130970 (array_inv!38278 a!2792)))

(declare-fun b!1536438 () Bool)

(declare-fun e!855174 () Bool)

(assert (=> b!1536438 (= e!855174 e!855176)))

(declare-fun res!1053524 () Bool)

(assert (=> b!1536438 (=> (not res!1053524) (not e!855176))))

(assert (=> b!1536438 (= res!1053524 (= lt!664345 lt!664344))))

(assert (=> b!1536438 (= lt!664345 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664342 vacantIndex!5 (select (arr!49250 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1536439 () Bool)

(assert (=> b!1536439 (= e!855178 e!855174)))

(declare-fun res!1053525 () Bool)

(assert (=> b!1536439 (=> (not res!1053525) (not e!855174))))

(assert (=> b!1536439 (= res!1053525 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664342 #b00000000000000000000000000000000) (bvslt lt!664342 (size!49800 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1536439 (= lt!664342 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1536440 () Bool)

(declare-fun res!1053521 () Bool)

(assert (=> b!1536440 (=> (not res!1053521) (not e!855177))))

(assert (=> b!1536440 (= res!1053521 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49800 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49800 a!2792)) (= (select (arr!49250 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!130970 res!1053522) b!1536434))

(assert (= (and b!1536434 res!1053523) b!1536435))

(assert (= (and b!1536435 res!1053516) b!1536432))

(assert (= (and b!1536432 res!1053517) b!1536436))

(assert (= (and b!1536436 res!1053526) b!1536431))

(assert (= (and b!1536431 res!1053518) b!1536440))

(assert (= (and b!1536440 res!1053521) b!1536437))

(assert (= (and b!1536437 res!1053519) b!1536433))

(assert (= (and b!1536433 res!1053520) b!1536439))

(assert (= (and b!1536439 res!1053525) b!1536438))

(assert (= (and b!1536438 res!1053524) b!1536430))

(declare-fun m!1418895 () Bool)

(assert (=> b!1536436 m!1418895))

(declare-fun m!1418897 () Bool)

(assert (=> b!1536435 m!1418897))

(assert (=> b!1536435 m!1418897))

(declare-fun m!1418899 () Bool)

(assert (=> b!1536435 m!1418899))

(declare-fun m!1418901 () Bool)

(assert (=> b!1536431 m!1418901))

(declare-fun m!1418903 () Bool)

(assert (=> b!1536437 m!1418903))

(assert (=> b!1536437 m!1418903))

(declare-fun m!1418905 () Bool)

(assert (=> b!1536437 m!1418905))

(declare-fun m!1418907 () Bool)

(assert (=> b!1536439 m!1418907))

(declare-fun m!1418909 () Bool)

(assert (=> b!1536430 m!1418909))

(declare-fun m!1418911 () Bool)

(assert (=> b!1536430 m!1418911))

(assert (=> b!1536430 m!1418911))

(declare-fun m!1418913 () Bool)

(assert (=> b!1536430 m!1418913))

(declare-fun m!1418915 () Bool)

(assert (=> b!1536430 m!1418915))

(declare-fun m!1418917 () Bool)

(assert (=> start!130970 m!1418917))

(declare-fun m!1418919 () Bool)

(assert (=> start!130970 m!1418919))

(declare-fun m!1418921 () Bool)

(assert (=> b!1536440 m!1418921))

(assert (=> b!1536432 m!1418903))

(assert (=> b!1536432 m!1418903))

(declare-fun m!1418923 () Bool)

(assert (=> b!1536432 m!1418923))

(declare-fun m!1418925 () Bool)

(assert (=> b!1536433 m!1418925))

(assert (=> b!1536433 m!1418903))

(assert (=> b!1536438 m!1418903))

(assert (=> b!1536438 m!1418903))

(declare-fun m!1418927 () Bool)

(assert (=> b!1536438 m!1418927))

(push 1)

(assert (not b!1536438))

(assert (not b!1536432))

(assert (not b!1536436))

(assert (not b!1536431))

(assert (not start!130970))

(assert (not b!1536435))

(assert (not b!1536437))

(assert (not b!1536439))

(assert (not b!1536430))

(check-sat)

(pop 1)

(push 1)

(check-sat)

