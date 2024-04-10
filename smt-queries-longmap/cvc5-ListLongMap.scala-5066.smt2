; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68906 () Bool)

(assert start!68906)

(declare-fun b!803711 () Bool)

(declare-fun res!548234 () Bool)

(declare-fun e!445333 () Bool)

(assert (=> b!803711 (=> (not res!548234) (not e!445333))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43696 0))(
  ( (array!43697 (arr!20928 (Array (_ BitVec 32) (_ BitVec 64))) (size!21349 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43696)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!803711 (= res!548234 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21349 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20928 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21349 a!3170)) (= (select (arr!20928 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!803712 () Bool)

(declare-fun e!445331 () Bool)

(assert (=> b!803712 (= e!445331 (not true))))

(declare-fun lt!359807 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!359802 () array!43696)

(declare-fun lt!359805 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8519 0))(
  ( (MissingZero!8519 (index!36444 (_ BitVec 32))) (Found!8519 (index!36445 (_ BitVec 32))) (Intermediate!8519 (undefined!9331 Bool) (index!36446 (_ BitVec 32)) (x!67285 (_ BitVec 32))) (Undefined!8519) (MissingVacant!8519 (index!36447 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43696 (_ BitVec 32)) SeekEntryResult!8519)

(assert (=> b!803712 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359807 vacantAfter!23 lt!359805 lt!359802 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359807 vacantBefore!23 (select (arr!20928 a!3170) j!153) a!3170 mask!3266))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-datatypes ((Unit!27578 0))(
  ( (Unit!27579) )
))
(declare-fun lt!359801 () Unit!27578)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43696 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27578)

(assert (=> b!803712 (= lt!359801 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!359807 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803712 (= lt!359807 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!803713 () Bool)

(declare-fun res!548233 () Bool)

(declare-fun e!445334 () Bool)

(assert (=> b!803713 (=> (not res!548233) (not e!445334))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803713 (= res!548233 (validKeyInArray!0 (select (arr!20928 a!3170) j!153)))))

(declare-fun res!548240 () Bool)

(assert (=> start!68906 (=> (not res!548240) (not e!445334))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68906 (= res!548240 (validMask!0 mask!3266))))

(assert (=> start!68906 e!445334))

(assert (=> start!68906 true))

(declare-fun array_inv!16724 (array!43696) Bool)

(assert (=> start!68906 (array_inv!16724 a!3170)))

(declare-fun b!803714 () Bool)

(declare-fun res!548231 () Bool)

(assert (=> b!803714 (=> (not res!548231) (not e!445334))))

(assert (=> b!803714 (= res!548231 (and (= (size!21349 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21349 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21349 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!803715 () Bool)

(declare-fun res!548239 () Bool)

(assert (=> b!803715 (=> (not res!548239) (not e!445334))))

(declare-fun arrayContainsKey!0 (array!43696 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803715 (= res!548239 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!803716 () Bool)

(assert (=> b!803716 (= e!445334 e!445333)))

(declare-fun res!548232 () Bool)

(assert (=> b!803716 (=> (not res!548232) (not e!445333))))

(declare-fun lt!359806 () SeekEntryResult!8519)

(assert (=> b!803716 (= res!548232 (or (= lt!359806 (MissingZero!8519 i!1163)) (= lt!359806 (MissingVacant!8519 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43696 (_ BitVec 32)) SeekEntryResult!8519)

(assert (=> b!803716 (= lt!359806 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!803717 () Bool)

(declare-fun e!445330 () Bool)

(assert (=> b!803717 (= e!445333 e!445330)))

(declare-fun res!548238 () Bool)

(assert (=> b!803717 (=> (not res!548238) (not e!445330))))

(assert (=> b!803717 (= res!548238 (= (seekEntryOrOpen!0 lt!359805 lt!359802 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359805 lt!359802 mask!3266)))))

(assert (=> b!803717 (= lt!359805 (select (store (arr!20928 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!803717 (= lt!359802 (array!43697 (store (arr!20928 a!3170) i!1163 k!2044) (size!21349 a!3170)))))

(declare-fun b!803718 () Bool)

(assert (=> b!803718 (= e!445330 e!445331)))

(declare-fun res!548237 () Bool)

(assert (=> b!803718 (=> (not res!548237) (not e!445331))))

(declare-fun lt!359803 () SeekEntryResult!8519)

(declare-fun lt!359804 () SeekEntryResult!8519)

(assert (=> b!803718 (= res!548237 (and (= lt!359803 lt!359804) (= lt!359804 (Found!8519 j!153)) (not (= (select (arr!20928 a!3170) index!1236) (select (arr!20928 a!3170) j!153)))))))

(assert (=> b!803718 (= lt!359804 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20928 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!803718 (= lt!359803 (seekEntryOrOpen!0 (select (arr!20928 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!803719 () Bool)

(declare-fun res!548230 () Bool)

(assert (=> b!803719 (=> (not res!548230) (not e!445333))))

(declare-datatypes ((List!14891 0))(
  ( (Nil!14888) (Cons!14887 (h!16016 (_ BitVec 64)) (t!21206 List!14891)) )
))
(declare-fun arrayNoDuplicates!0 (array!43696 (_ BitVec 32) List!14891) Bool)

(assert (=> b!803719 (= res!548230 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14888))))

(declare-fun b!803720 () Bool)

(declare-fun res!548236 () Bool)

(assert (=> b!803720 (=> (not res!548236) (not e!445334))))

(assert (=> b!803720 (= res!548236 (validKeyInArray!0 k!2044))))

(declare-fun b!803721 () Bool)

(declare-fun res!548235 () Bool)

(assert (=> b!803721 (=> (not res!548235) (not e!445333))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43696 (_ BitVec 32)) Bool)

(assert (=> b!803721 (= res!548235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68906 res!548240) b!803714))

(assert (= (and b!803714 res!548231) b!803713))

(assert (= (and b!803713 res!548233) b!803720))

(assert (= (and b!803720 res!548236) b!803715))

(assert (= (and b!803715 res!548239) b!803716))

(assert (= (and b!803716 res!548232) b!803721))

(assert (= (and b!803721 res!548235) b!803719))

(assert (= (and b!803719 res!548230) b!803711))

(assert (= (and b!803711 res!548234) b!803717))

(assert (= (and b!803717 res!548238) b!803718))

(assert (= (and b!803718 res!548237) b!803712))

(declare-fun m!745511 () Bool)

(assert (=> b!803718 m!745511))

(declare-fun m!745513 () Bool)

(assert (=> b!803718 m!745513))

(assert (=> b!803718 m!745513))

(declare-fun m!745515 () Bool)

(assert (=> b!803718 m!745515))

(assert (=> b!803718 m!745513))

(declare-fun m!745517 () Bool)

(assert (=> b!803718 m!745517))

(declare-fun m!745519 () Bool)

(assert (=> b!803717 m!745519))

(declare-fun m!745521 () Bool)

(assert (=> b!803717 m!745521))

(declare-fun m!745523 () Bool)

(assert (=> b!803717 m!745523))

(declare-fun m!745525 () Bool)

(assert (=> b!803717 m!745525))

(assert (=> b!803712 m!745513))

(declare-fun m!745527 () Bool)

(assert (=> b!803712 m!745527))

(assert (=> b!803712 m!745513))

(declare-fun m!745529 () Bool)

(assert (=> b!803712 m!745529))

(declare-fun m!745531 () Bool)

(assert (=> b!803712 m!745531))

(declare-fun m!745533 () Bool)

(assert (=> b!803712 m!745533))

(declare-fun m!745535 () Bool)

(assert (=> b!803719 m!745535))

(declare-fun m!745537 () Bool)

(assert (=> b!803720 m!745537))

(declare-fun m!745539 () Bool)

(assert (=> b!803715 m!745539))

(declare-fun m!745541 () Bool)

(assert (=> start!68906 m!745541))

(declare-fun m!745543 () Bool)

(assert (=> start!68906 m!745543))

(declare-fun m!745545 () Bool)

(assert (=> b!803721 m!745545))

(declare-fun m!745547 () Bool)

(assert (=> b!803716 m!745547))

(declare-fun m!745549 () Bool)

(assert (=> b!803711 m!745549))

(declare-fun m!745551 () Bool)

(assert (=> b!803711 m!745551))

(assert (=> b!803713 m!745513))

(assert (=> b!803713 m!745513))

(declare-fun m!745553 () Bool)

(assert (=> b!803713 m!745553))

(push 1)

