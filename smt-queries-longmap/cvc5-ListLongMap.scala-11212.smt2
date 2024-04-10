; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130904 () Bool)

(assert start!130904)

(declare-fun b!1535393 () Bool)

(declare-fun res!1052481 () Bool)

(declare-fun e!854784 () Bool)

(assert (=> b!1535393 (=> (not res!1052481) (not e!854784))))

(declare-datatypes ((array!102002 0))(
  ( (array!102003 (arr!49217 (Array (_ BitVec 32) (_ BitVec 64))) (size!49767 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102002)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535393 (= res!1052481 (validKeyInArray!0 (select (arr!49217 a!2792) i!951)))))

(declare-fun b!1535394 () Bool)

(declare-fun res!1052483 () Bool)

(assert (=> b!1535394 (=> (not res!1052483) (not e!854784))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102002 (_ BitVec 32)) Bool)

(assert (=> b!1535394 (= res!1052483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535395 () Bool)

(declare-fun e!854785 () Bool)

(assert (=> b!1535395 (= e!854785 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13349 0))(
  ( (MissingZero!13349 (index!55791 (_ BitVec 32))) (Found!13349 (index!55792 (_ BitVec 32))) (Intermediate!13349 (undefined!14161 Bool) (index!55793 (_ BitVec 32)) (x!137543 (_ BitVec 32))) (Undefined!13349) (MissingVacant!13349 (index!55794 (_ BitVec 32))) )
))
(declare-fun lt!664050 () SeekEntryResult!13349)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun lt!664051 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102002 (_ BitVec 32)) SeekEntryResult!13349)

(assert (=> b!1535395 (= lt!664050 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664051 vacantIndex!5 (select (arr!49217 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1535396 () Bool)

(declare-fun res!1052486 () Bool)

(assert (=> b!1535396 (=> (not res!1052486) (not e!854784))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1535396 (= res!1052486 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49767 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49767 a!2792)) (= (select (arr!49217 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1535397 () Bool)

(declare-fun res!1052479 () Bool)

(assert (=> b!1535397 (=> (not res!1052479) (not e!854784))))

(assert (=> b!1535397 (= res!1052479 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49217 a!2792) j!64) a!2792 mask!2480) (Found!13349 j!64)))))

(declare-fun b!1535398 () Bool)

(declare-fun res!1052487 () Bool)

(assert (=> b!1535398 (=> (not res!1052487) (not e!854784))))

(assert (=> b!1535398 (= res!1052487 (and (= (size!49767 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49767 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49767 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535399 () Bool)

(assert (=> b!1535399 (= e!854784 e!854785)))

(declare-fun res!1052485 () Bool)

(assert (=> b!1535399 (=> (not res!1052485) (not e!854785))))

(assert (=> b!1535399 (= res!1052485 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664051 #b00000000000000000000000000000000) (bvslt lt!664051 (size!49767 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535399 (= lt!664051 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun res!1052484 () Bool)

(assert (=> start!130904 (=> (not res!1052484) (not e!854784))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130904 (= res!1052484 (validMask!0 mask!2480))))

(assert (=> start!130904 e!854784))

(assert (=> start!130904 true))

(declare-fun array_inv!38245 (array!102002) Bool)

(assert (=> start!130904 (array_inv!38245 a!2792)))

(declare-fun b!1535400 () Bool)

(declare-fun res!1052480 () Bool)

(assert (=> b!1535400 (=> (not res!1052480) (not e!854784))))

(assert (=> b!1535400 (= res!1052480 (validKeyInArray!0 (select (arr!49217 a!2792) j!64)))))

(declare-fun b!1535401 () Bool)

(declare-fun res!1052488 () Bool)

(assert (=> b!1535401 (=> (not res!1052488) (not e!854784))))

(declare-datatypes ((List!35691 0))(
  ( (Nil!35688) (Cons!35687 (h!37132 (_ BitVec 64)) (t!50385 List!35691)) )
))
(declare-fun arrayNoDuplicates!0 (array!102002 (_ BitVec 32) List!35691) Bool)

(assert (=> b!1535401 (= res!1052488 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35688))))

(declare-fun b!1535402 () Bool)

(declare-fun res!1052482 () Bool)

(assert (=> b!1535402 (=> (not res!1052482) (not e!854784))))

(assert (=> b!1535402 (= res!1052482 (not (= (select (arr!49217 a!2792) index!463) (select (arr!49217 a!2792) j!64))))))

(assert (= (and start!130904 res!1052484) b!1535398))

(assert (= (and b!1535398 res!1052487) b!1535393))

(assert (= (and b!1535393 res!1052481) b!1535400))

(assert (= (and b!1535400 res!1052480) b!1535394))

(assert (= (and b!1535394 res!1052483) b!1535401))

(assert (= (and b!1535401 res!1052488) b!1535396))

(assert (= (and b!1535396 res!1052486) b!1535397))

(assert (= (and b!1535397 res!1052479) b!1535402))

(assert (= (and b!1535402 res!1052482) b!1535399))

(assert (= (and b!1535399 res!1052485) b!1535395))

(declare-fun m!1417917 () Bool)

(assert (=> start!130904 m!1417917))

(declare-fun m!1417919 () Bool)

(assert (=> start!130904 m!1417919))

(declare-fun m!1417921 () Bool)

(assert (=> b!1535401 m!1417921))

(declare-fun m!1417923 () Bool)

(assert (=> b!1535400 m!1417923))

(assert (=> b!1535400 m!1417923))

(declare-fun m!1417925 () Bool)

(assert (=> b!1535400 m!1417925))

(declare-fun m!1417927 () Bool)

(assert (=> b!1535399 m!1417927))

(declare-fun m!1417929 () Bool)

(assert (=> b!1535394 m!1417929))

(declare-fun m!1417931 () Bool)

(assert (=> b!1535396 m!1417931))

(assert (=> b!1535395 m!1417923))

(assert (=> b!1535395 m!1417923))

(declare-fun m!1417933 () Bool)

(assert (=> b!1535395 m!1417933))

(assert (=> b!1535397 m!1417923))

(assert (=> b!1535397 m!1417923))

(declare-fun m!1417935 () Bool)

(assert (=> b!1535397 m!1417935))

(declare-fun m!1417937 () Bool)

(assert (=> b!1535402 m!1417937))

(assert (=> b!1535402 m!1417923))

(declare-fun m!1417939 () Bool)

(assert (=> b!1535393 m!1417939))

(assert (=> b!1535393 m!1417939))

(declare-fun m!1417941 () Bool)

(assert (=> b!1535393 m!1417941))

(push 1)

