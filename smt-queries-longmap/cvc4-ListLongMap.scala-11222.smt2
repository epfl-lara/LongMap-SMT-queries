; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130968 () Bool)

(assert start!130968)

(declare-fun b!1536397 () Bool)

(declare-fun res!1053490 () Bool)

(declare-fun e!855159 () Bool)

(assert (=> b!1536397 (=> (not res!1053490) (not e!855159))))

(declare-datatypes ((array!102066 0))(
  ( (array!102067 (arr!49249 (Array (_ BitVec 32) (_ BitVec 64))) (size!49799 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102066)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536397 (= res!1053490 (validKeyInArray!0 (select (arr!49249 a!2792) i!951)))))

(declare-fun b!1536398 () Bool)

(declare-fun res!1053488 () Bool)

(assert (=> b!1536398 (=> (not res!1053488) (not e!855159))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(assert (=> b!1536398 (= res!1053488 (and (= (size!49799 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49799 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49799 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1053493 () Bool)

(assert (=> start!130968 (=> (not res!1053493) (not e!855159))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130968 (= res!1053493 (validMask!0 mask!2480))))

(assert (=> start!130968 e!855159))

(assert (=> start!130968 true))

(declare-fun array_inv!38277 (array!102066) Bool)

(assert (=> start!130968 (array_inv!38277 a!2792)))

(declare-fun b!1536399 () Bool)

(declare-fun res!1053487 () Bool)

(assert (=> b!1536399 (=> (not res!1053487) (not e!855159))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102066 (_ BitVec 32)) Bool)

(assert (=> b!1536399 (= res!1053487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1536400 () Bool)

(declare-fun e!855160 () Bool)

(assert (=> b!1536400 (= e!855159 e!855160)))

(declare-fun res!1053484 () Bool)

(assert (=> b!1536400 (=> (not res!1053484) (not e!855160))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13381 0))(
  ( (MissingZero!13381 (index!55919 (_ BitVec 32))) (Found!13381 (index!55920 (_ BitVec 32))) (Intermediate!13381 (undefined!14193 Bool) (index!55921 (_ BitVec 32)) (x!137655 (_ BitVec 32))) (Undefined!13381) (MissingVacant!13381 (index!55922 (_ BitVec 32))) )
))
(declare-fun lt!664331 () SeekEntryResult!13381)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102066 (_ BitVec 32)) SeekEntryResult!13381)

(assert (=> b!1536400 (= res!1053484 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49249 a!2792) j!64) a!2792 mask!2480) lt!664331))))

(assert (=> b!1536400 (= lt!664331 (Found!13381 j!64))))

(declare-fun b!1536401 () Bool)

(declare-fun e!855163 () Bool)

(declare-fun e!855162 () Bool)

(assert (=> b!1536401 (= e!855163 e!855162)))

(declare-fun res!1053491 () Bool)

(assert (=> b!1536401 (=> (not res!1053491) (not e!855162))))

(declare-fun lt!664332 () SeekEntryResult!13381)

(assert (=> b!1536401 (= res!1053491 (= lt!664332 lt!664331))))

(declare-fun lt!664330 () (_ BitVec 32))

(assert (=> b!1536401 (= lt!664332 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664330 vacantIndex!5 (select (arr!49249 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1536402 () Bool)

(declare-fun res!1053485 () Bool)

(assert (=> b!1536402 (=> (not res!1053485) (not e!855159))))

(declare-datatypes ((List!35723 0))(
  ( (Nil!35720) (Cons!35719 (h!37164 (_ BitVec 64)) (t!50417 List!35723)) )
))
(declare-fun arrayNoDuplicates!0 (array!102066 (_ BitVec 32) List!35723) Bool)

(assert (=> b!1536402 (= res!1053485 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35720))))

(declare-fun b!1536403 () Bool)

(declare-fun res!1053489 () Bool)

(assert (=> b!1536403 (=> (not res!1053489) (not e!855160))))

(assert (=> b!1536403 (= res!1053489 (not (= (select (arr!49249 a!2792) index!463) (select (arr!49249 a!2792) j!64))))))

(declare-fun b!1536404 () Bool)

(assert (=> b!1536404 (= e!855160 e!855163)))

(declare-fun res!1053492 () Bool)

(assert (=> b!1536404 (=> (not res!1053492) (not e!855163))))

(assert (=> b!1536404 (= res!1053492 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664330 #b00000000000000000000000000000000) (bvslt lt!664330 (size!49799 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1536404 (= lt!664330 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1536405 () Bool)

(declare-fun res!1053483 () Bool)

(assert (=> b!1536405 (=> (not res!1053483) (not e!855159))))

(assert (=> b!1536405 (= res!1053483 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49799 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49799 a!2792)) (= (select (arr!49249 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536406 () Bool)

(declare-fun res!1053486 () Bool)

(assert (=> b!1536406 (=> (not res!1053486) (not e!855159))))

(assert (=> b!1536406 (= res!1053486 (validKeyInArray!0 (select (arr!49249 a!2792) j!64)))))

(declare-fun b!1536407 () Bool)

(assert (=> b!1536407 (= e!855162 (not true))))

(assert (=> b!1536407 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664330 vacantIndex!5 (select (store (arr!49249 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102067 (store (arr!49249 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49799 a!2792)) mask!2480) lt!664332)))

(declare-datatypes ((Unit!51334 0))(
  ( (Unit!51335) )
))
(declare-fun lt!664333 () Unit!51334)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102066 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51334)

(assert (=> b!1536407 (= lt!664333 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664330 vacantIndex!5 mask!2480))))

(assert (= (and start!130968 res!1053493) b!1536398))

(assert (= (and b!1536398 res!1053488) b!1536397))

(assert (= (and b!1536397 res!1053490) b!1536406))

(assert (= (and b!1536406 res!1053486) b!1536399))

(assert (= (and b!1536399 res!1053487) b!1536402))

(assert (= (and b!1536402 res!1053485) b!1536405))

(assert (= (and b!1536405 res!1053483) b!1536400))

(assert (= (and b!1536400 res!1053484) b!1536403))

(assert (= (and b!1536403 res!1053489) b!1536404))

(assert (= (and b!1536404 res!1053492) b!1536401))

(assert (= (and b!1536401 res!1053491) b!1536407))

(declare-fun m!1418861 () Bool)

(assert (=> b!1536406 m!1418861))

(assert (=> b!1536406 m!1418861))

(declare-fun m!1418863 () Bool)

(assert (=> b!1536406 m!1418863))

(assert (=> b!1536401 m!1418861))

(assert (=> b!1536401 m!1418861))

(declare-fun m!1418865 () Bool)

(assert (=> b!1536401 m!1418865))

(declare-fun m!1418867 () Bool)

(assert (=> b!1536404 m!1418867))

(declare-fun m!1418869 () Bool)

(assert (=> b!1536407 m!1418869))

(declare-fun m!1418871 () Bool)

(assert (=> b!1536407 m!1418871))

(assert (=> b!1536407 m!1418871))

(declare-fun m!1418873 () Bool)

(assert (=> b!1536407 m!1418873))

(declare-fun m!1418875 () Bool)

(assert (=> b!1536407 m!1418875))

(declare-fun m!1418877 () Bool)

(assert (=> b!1536397 m!1418877))

(assert (=> b!1536397 m!1418877))

(declare-fun m!1418879 () Bool)

(assert (=> b!1536397 m!1418879))

(declare-fun m!1418881 () Bool)

(assert (=> b!1536402 m!1418881))

(declare-fun m!1418883 () Bool)

(assert (=> b!1536403 m!1418883))

(assert (=> b!1536403 m!1418861))

(declare-fun m!1418885 () Bool)

(assert (=> b!1536399 m!1418885))

(assert (=> b!1536400 m!1418861))

(assert (=> b!1536400 m!1418861))

(declare-fun m!1418887 () Bool)

(assert (=> b!1536400 m!1418887))

(declare-fun m!1418889 () Bool)

(assert (=> b!1536405 m!1418889))

(declare-fun m!1418891 () Bool)

(assert (=> start!130968 m!1418891))

(declare-fun m!1418893 () Bool)

(assert (=> start!130968 m!1418893))

(push 1)

(assert (not b!1536407))

(assert (not b!1536406))

