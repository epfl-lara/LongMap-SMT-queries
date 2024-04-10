; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130972 () Bool)

(assert start!130972)

(declare-fun b!1536463 () Bool)

(declare-fun e!855191 () Bool)

(declare-fun e!855193 () Bool)

(assert (=> b!1536463 (= e!855191 e!855193)))

(declare-fun res!1053552 () Bool)

(assert (=> b!1536463 (=> (not res!1053552) (not e!855193))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102070 0))(
  ( (array!102071 (arr!49251 (Array (_ BitVec 32) (_ BitVec 64))) (size!49801 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102070)

(declare-datatypes ((SeekEntryResult!13383 0))(
  ( (MissingZero!13383 (index!55927 (_ BitVec 32))) (Found!13383 (index!55928 (_ BitVec 32))) (Intermediate!13383 (undefined!14195 Bool) (index!55929 (_ BitVec 32)) (x!137665 (_ BitVec 32))) (Undefined!13383) (MissingVacant!13383 (index!55930 (_ BitVec 32))) )
))
(declare-fun lt!664356 () SeekEntryResult!13383)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102070 (_ BitVec 32)) SeekEntryResult!13383)

(assert (=> b!1536463 (= res!1053552 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49251 a!2792) j!64) a!2792 mask!2480) lt!664356))))

(assert (=> b!1536463 (= lt!664356 (Found!13383 j!64))))

(declare-fun b!1536464 () Bool)

(declare-fun e!855189 () Bool)

(assert (=> b!1536464 (= e!855193 e!855189)))

(declare-fun res!1053553 () Bool)

(assert (=> b!1536464 (=> (not res!1053553) (not e!855189))))

(declare-fun lt!664355 () (_ BitVec 32))

(assert (=> b!1536464 (= res!1053553 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664355 #b00000000000000000000000000000000) (bvslt lt!664355 (size!49801 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1536464 (= lt!664355 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun res!1053550 () Bool)

(assert (=> start!130972 (=> (not res!1053550) (not e!855191))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130972 (= res!1053550 (validMask!0 mask!2480))))

(assert (=> start!130972 e!855191))

(assert (=> start!130972 true))

(declare-fun array_inv!38279 (array!102070) Bool)

(assert (=> start!130972 (array_inv!38279 a!2792)))

(declare-fun b!1536465 () Bool)

(declare-fun res!1053557 () Bool)

(assert (=> b!1536465 (=> (not res!1053557) (not e!855191))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536465 (= res!1053557 (validKeyInArray!0 (select (arr!49251 a!2792) j!64)))))

(declare-fun b!1536466 () Bool)

(declare-fun e!855190 () Bool)

(assert (=> b!1536466 (= e!855189 e!855190)))

(declare-fun res!1053554 () Bool)

(assert (=> b!1536466 (=> (not res!1053554) (not e!855190))))

(declare-fun lt!664357 () SeekEntryResult!13383)

(assert (=> b!1536466 (= res!1053554 (= lt!664357 lt!664356))))

(assert (=> b!1536466 (= lt!664357 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664355 vacantIndex!5 (select (arr!49251 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1536467 () Bool)

(declare-fun res!1053549 () Bool)

(assert (=> b!1536467 (=> (not res!1053549) (not e!855191))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1536467 (= res!1053549 (and (= (size!49801 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49801 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49801 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536468 () Bool)

(declare-fun res!1053555 () Bool)

(assert (=> b!1536468 (=> (not res!1053555) (not e!855191))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102070 (_ BitVec 32)) Bool)

(assert (=> b!1536468 (= res!1053555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1536469 () Bool)

(declare-fun res!1053558 () Bool)

(assert (=> b!1536469 (=> (not res!1053558) (not e!855193))))

(assert (=> b!1536469 (= res!1053558 (not (= (select (arr!49251 a!2792) index!463) (select (arr!49251 a!2792) j!64))))))

(declare-fun b!1536470 () Bool)

(declare-fun res!1053556 () Bool)

(assert (=> b!1536470 (=> (not res!1053556) (not e!855191))))

(declare-datatypes ((List!35725 0))(
  ( (Nil!35722) (Cons!35721 (h!37166 (_ BitVec 64)) (t!50419 List!35725)) )
))
(declare-fun arrayNoDuplicates!0 (array!102070 (_ BitVec 32) List!35725) Bool)

(assert (=> b!1536470 (= res!1053556 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35722))))

(declare-fun b!1536471 () Bool)

(declare-fun res!1053559 () Bool)

(assert (=> b!1536471 (=> (not res!1053559) (not e!855191))))

(assert (=> b!1536471 (= res!1053559 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49801 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49801 a!2792)) (= (select (arr!49251 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536472 () Bool)

(declare-fun res!1053551 () Bool)

(assert (=> b!1536472 (=> (not res!1053551) (not e!855191))))

(assert (=> b!1536472 (= res!1053551 (validKeyInArray!0 (select (arr!49251 a!2792) i!951)))))

(declare-fun b!1536473 () Bool)

(assert (=> b!1536473 (= e!855190 (not (or (bvslt mask!2480 #b00000000000000000000000000000000) (bvsge index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvslt vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480)))))))

(assert (=> b!1536473 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664355 vacantIndex!5 (select (store (arr!49251 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102071 (store (arr!49251 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49801 a!2792)) mask!2480) lt!664357)))

(declare-datatypes ((Unit!51338 0))(
  ( (Unit!51339) )
))
(declare-fun lt!664354 () Unit!51338)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102070 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51338)

(assert (=> b!1536473 (= lt!664354 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664355 vacantIndex!5 mask!2480))))

(assert (= (and start!130972 res!1053550) b!1536467))

(assert (= (and b!1536467 res!1053549) b!1536472))

(assert (= (and b!1536472 res!1053551) b!1536465))

(assert (= (and b!1536465 res!1053557) b!1536468))

(assert (= (and b!1536468 res!1053555) b!1536470))

(assert (= (and b!1536470 res!1053556) b!1536471))

(assert (= (and b!1536471 res!1053559) b!1536463))

(assert (= (and b!1536463 res!1053552) b!1536469))

(assert (= (and b!1536469 res!1053558) b!1536464))

(assert (= (and b!1536464 res!1053553) b!1536466))

(assert (= (and b!1536466 res!1053554) b!1536473))

(declare-fun m!1418929 () Bool)

(assert (=> b!1536472 m!1418929))

(assert (=> b!1536472 m!1418929))

(declare-fun m!1418931 () Bool)

(assert (=> b!1536472 m!1418931))

(declare-fun m!1418933 () Bool)

(assert (=> b!1536465 m!1418933))

(assert (=> b!1536465 m!1418933))

(declare-fun m!1418935 () Bool)

(assert (=> b!1536465 m!1418935))

(declare-fun m!1418937 () Bool)

(assert (=> b!1536469 m!1418937))

(assert (=> b!1536469 m!1418933))

(declare-fun m!1418939 () Bool)

(assert (=> b!1536464 m!1418939))

(declare-fun m!1418941 () Bool)

(assert (=> start!130972 m!1418941))

(declare-fun m!1418943 () Bool)

(assert (=> start!130972 m!1418943))

(declare-fun m!1418945 () Bool)

(assert (=> b!1536473 m!1418945))

(declare-fun m!1418947 () Bool)

(assert (=> b!1536473 m!1418947))

(assert (=> b!1536473 m!1418947))

(declare-fun m!1418949 () Bool)

(assert (=> b!1536473 m!1418949))

(declare-fun m!1418951 () Bool)

(assert (=> b!1536473 m!1418951))

(declare-fun m!1418953 () Bool)

(assert (=> b!1536470 m!1418953))

(declare-fun m!1418955 () Bool)

(assert (=> b!1536471 m!1418955))

(declare-fun m!1418957 () Bool)

(assert (=> b!1536468 m!1418957))

(assert (=> b!1536463 m!1418933))

(assert (=> b!1536463 m!1418933))

(declare-fun m!1418959 () Bool)

(assert (=> b!1536463 m!1418959))

(assert (=> b!1536466 m!1418933))

(assert (=> b!1536466 m!1418933))

(declare-fun m!1418961 () Bool)

(assert (=> b!1536466 m!1418961))

(check-sat (not b!1536466) (not start!130972) (not b!1536470) (not b!1536464) (not b!1536465) (not b!1536468) (not b!1536473) (not b!1536463) (not b!1536472))
(check-sat)
