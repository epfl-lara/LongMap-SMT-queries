; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68584 () Bool)

(assert start!68584)

(declare-fun b!796446 () Bool)

(declare-fun res!540593 () Bool)

(declare-fun e!442068 () Bool)

(assert (=> b!796446 (=> (not res!540593) (not e!442068))))

(declare-datatypes ((array!43248 0))(
  ( (array!43249 (arr!20700 (Array (_ BitVec 32) (_ BitVec 64))) (size!21120 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43248)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796446 (= res!540593 (validKeyInArray!0 (select (arr!20700 a!3170) j!153)))))

(declare-fun b!796447 () Bool)

(declare-fun res!540597 () Bool)

(declare-fun e!442069 () Bool)

(assert (=> b!796447 (=> (not res!540597) (not e!442069))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43248 (_ BitVec 32)) Bool)

(assert (=> b!796447 (= res!540597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!796448 () Bool)

(declare-fun res!540598 () Bool)

(assert (=> b!796448 (=> (not res!540598) (not e!442068))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43248 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796448 (= res!540598 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796449 () Bool)

(declare-fun e!442066 () Bool)

(assert (=> b!796449 (= e!442069 e!442066)))

(declare-fun res!540592 () Bool)

(assert (=> b!796449 (=> (not res!540592) (not e!442066))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!355025 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!355026 () array!43248)

(declare-datatypes ((SeekEntryResult!8247 0))(
  ( (MissingZero!8247 (index!35356 (_ BitVec 32))) (Found!8247 (index!35357 (_ BitVec 32))) (Intermediate!8247 (undefined!9059 Bool) (index!35358 (_ BitVec 32)) (x!66424 (_ BitVec 32))) (Undefined!8247) (MissingVacant!8247 (index!35359 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43248 (_ BitVec 32)) SeekEntryResult!8247)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43248 (_ BitVec 32)) SeekEntryResult!8247)

(assert (=> b!796449 (= res!540592 (= (seekEntryOrOpen!0 lt!355025 lt!355026 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355025 lt!355026 mask!3266)))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!796449 (= lt!355025 (select (store (arr!20700 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!796449 (= lt!355026 (array!43249 (store (arr!20700 a!3170) i!1163 k!2044) (size!21120 a!3170)))))

(declare-fun res!540599 () Bool)

(assert (=> start!68584 (=> (not res!540599) (not e!442068))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68584 (= res!540599 (validMask!0 mask!3266))))

(assert (=> start!68584 e!442068))

(assert (=> start!68584 true))

(declare-fun array_inv!16559 (array!43248) Bool)

(assert (=> start!68584 (array_inv!16559 a!3170)))

(declare-fun b!796450 () Bool)

(declare-fun res!540594 () Bool)

(assert (=> b!796450 (=> (not res!540594) (not e!442069))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!796450 (= res!540594 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21120 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20700 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21120 a!3170)) (= (select (arr!20700 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!796451 () Bool)

(assert (=> b!796451 (= e!442068 e!442069)))

(declare-fun res!540600 () Bool)

(assert (=> b!796451 (=> (not res!540600) (not e!442069))))

(declare-fun lt!355024 () SeekEntryResult!8247)

(assert (=> b!796451 (= res!540600 (or (= lt!355024 (MissingZero!8247 i!1163)) (= lt!355024 (MissingVacant!8247 i!1163))))))

(assert (=> b!796451 (= lt!355024 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!796452 () Bool)

(declare-fun lt!355023 () SeekEntryResult!8247)

(declare-fun lt!355027 () SeekEntryResult!8247)

(assert (=> b!796452 (= e!442066 (and (= lt!355027 lt!355023) (= lt!355023 (Found!8247 j!153)) (= (select (arr!20700 a!3170) index!1236) (select (arr!20700 a!3170) j!153)) (bvsge mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266))))))

(assert (=> b!796452 (= lt!355023 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20700 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!796452 (= lt!355027 (seekEntryOrOpen!0 (select (arr!20700 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796453 () Bool)

(declare-fun res!540591 () Bool)

(assert (=> b!796453 (=> (not res!540591) (not e!442068))))

(assert (=> b!796453 (= res!540591 (and (= (size!21120 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21120 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21120 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!796454 () Bool)

(declare-fun res!540596 () Bool)

(assert (=> b!796454 (=> (not res!540596) (not e!442069))))

(declare-datatypes ((List!14570 0))(
  ( (Nil!14567) (Cons!14566 (h!15701 (_ BitVec 64)) (t!20877 List!14570)) )
))
(declare-fun arrayNoDuplicates!0 (array!43248 (_ BitVec 32) List!14570) Bool)

(assert (=> b!796454 (= res!540596 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14567))))

(declare-fun b!796455 () Bool)

(declare-fun res!540595 () Bool)

(assert (=> b!796455 (=> (not res!540595) (not e!442068))))

(assert (=> b!796455 (= res!540595 (validKeyInArray!0 k!2044))))

(assert (= (and start!68584 res!540599) b!796453))

(assert (= (and b!796453 res!540591) b!796446))

(assert (= (and b!796446 res!540593) b!796455))

(assert (= (and b!796455 res!540595) b!796448))

(assert (= (and b!796448 res!540598) b!796451))

(assert (= (and b!796451 res!540600) b!796447))

(assert (= (and b!796447 res!540597) b!796454))

(assert (= (and b!796454 res!540596) b!796450))

(assert (= (and b!796450 res!540594) b!796449))

(assert (= (and b!796449 res!540592) b!796452))

(declare-fun m!737573 () Bool)

(assert (=> b!796447 m!737573))

(declare-fun m!737575 () Bool)

(assert (=> b!796454 m!737575))

(declare-fun m!737577 () Bool)

(assert (=> b!796446 m!737577))

(assert (=> b!796446 m!737577))

(declare-fun m!737579 () Bool)

(assert (=> b!796446 m!737579))

(declare-fun m!737581 () Bool)

(assert (=> b!796449 m!737581))

(declare-fun m!737583 () Bool)

(assert (=> b!796449 m!737583))

(declare-fun m!737585 () Bool)

(assert (=> b!796449 m!737585))

(declare-fun m!737587 () Bool)

(assert (=> b!796449 m!737587))

(declare-fun m!737589 () Bool)

(assert (=> b!796451 m!737589))

(declare-fun m!737591 () Bool)

(assert (=> b!796452 m!737591))

(assert (=> b!796452 m!737577))

(assert (=> b!796452 m!737577))

(declare-fun m!737593 () Bool)

(assert (=> b!796452 m!737593))

(assert (=> b!796452 m!737577))

(declare-fun m!737595 () Bool)

(assert (=> b!796452 m!737595))

(declare-fun m!737597 () Bool)

(assert (=> b!796455 m!737597))

(declare-fun m!737599 () Bool)

(assert (=> start!68584 m!737599))

(declare-fun m!737601 () Bool)

(assert (=> start!68584 m!737601))

(declare-fun m!737603 () Bool)

(assert (=> b!796450 m!737603))

(declare-fun m!737605 () Bool)

(assert (=> b!796450 m!737605))

(declare-fun m!737607 () Bool)

(assert (=> b!796448 m!737607))

(push 1)

(assert (not start!68584))

(assert (not b!796455))

(assert (not b!796446))

(assert (not b!796447))

(assert (not b!796449))

(assert (not b!796454))

(assert (not b!796448))

(assert (not b!796452))

(assert (not b!796451))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

