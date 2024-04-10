; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68456 () Bool)

(assert start!68456)

(declare-fun b!795735 () Bool)

(declare-fun e!441623 () Bool)

(declare-fun e!441622 () Bool)

(assert (=> b!795735 (= e!441623 e!441622)))

(declare-fun res!540261 () Bool)

(assert (=> b!795735 (=> (not res!540261) (not e!441622))))

(declare-datatypes ((SeekEntryResult!8294 0))(
  ( (MissingZero!8294 (index!35544 (_ BitVec 32))) (Found!8294 (index!35545 (_ BitVec 32))) (Intermediate!8294 (undefined!9106 Bool) (index!35546 (_ BitVec 32)) (x!66460 (_ BitVec 32))) (Undefined!8294) (MissingVacant!8294 (index!35547 (_ BitVec 32))) )
))
(declare-fun lt!354725 () SeekEntryResult!8294)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!795735 (= res!540261 (or (= lt!354725 (MissingZero!8294 i!1163)) (= lt!354725 (MissingVacant!8294 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((array!43246 0))(
  ( (array!43247 (arr!20703 (Array (_ BitVec 32) (_ BitVec 64))) (size!21124 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43246)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43246 (_ BitVec 32)) SeekEntryResult!8294)

(assert (=> b!795735 (= lt!354725 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!795736 () Bool)

(declare-fun res!540255 () Bool)

(assert (=> b!795736 (=> (not res!540255) (not e!441622))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43246 (_ BitVec 32)) Bool)

(assert (=> b!795736 (= res!540255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!795737 () Bool)

(declare-fun res!540254 () Bool)

(assert (=> b!795737 (=> (not res!540254) (not e!441623))))

(declare-fun arrayContainsKey!0 (array!43246 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795737 (= res!540254 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!795738 () Bool)

(declare-fun res!540256 () Bool)

(assert (=> b!795738 (=> (not res!540256) (not e!441622))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!795738 (= res!540256 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21124 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20703 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21124 a!3170)) (= (select (arr!20703 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795739 () Bool)

(declare-fun e!441621 () Bool)

(assert (=> b!795739 (= e!441622 e!441621)))

(declare-fun res!540263 () Bool)

(assert (=> b!795739 (=> (not res!540263) (not e!441621))))

(declare-fun lt!354723 () (_ BitVec 64))

(declare-fun lt!354722 () array!43246)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43246 (_ BitVec 32)) SeekEntryResult!8294)

(assert (=> b!795739 (= res!540263 (= (seekEntryOrOpen!0 lt!354723 lt!354722 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354723 lt!354722 mask!3266)))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!795739 (= lt!354723 (select (store (arr!20703 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!795739 (= lt!354722 (array!43247 (store (arr!20703 a!3170) i!1163 k!2044) (size!21124 a!3170)))))

(declare-fun b!795741 () Bool)

(declare-fun res!540262 () Bool)

(assert (=> b!795741 (=> (not res!540262) (not e!441623))))

(assert (=> b!795741 (= res!540262 (and (= (size!21124 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21124 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21124 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795742 () Bool)

(declare-fun res!540257 () Bool)

(assert (=> b!795742 (=> (not res!540257) (not e!441622))))

(declare-datatypes ((List!14666 0))(
  ( (Nil!14663) (Cons!14662 (h!15791 (_ BitVec 64)) (t!20981 List!14666)) )
))
(declare-fun arrayNoDuplicates!0 (array!43246 (_ BitVec 32) List!14666) Bool)

(assert (=> b!795742 (= res!540257 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14663))))

(declare-fun b!795743 () Bool)

(declare-fun res!540259 () Bool)

(assert (=> b!795743 (=> (not res!540259) (not e!441623))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795743 (= res!540259 (validKeyInArray!0 (select (arr!20703 a!3170) j!153)))))

(declare-fun lt!354724 () SeekEntryResult!8294)

(declare-fun lt!354721 () SeekEntryResult!8294)

(declare-fun b!795744 () Bool)

(assert (=> b!795744 (= e!441621 (and (= lt!354721 lt!354724) (= lt!354724 (Found!8294 j!153)) (= (select (arr!20703 a!3170) index!1236) (select (arr!20703 a!3170) j!153)) (bvsge mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266))))))

(assert (=> b!795744 (= lt!354724 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20703 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!795744 (= lt!354721 (seekEntryOrOpen!0 (select (arr!20703 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!540258 () Bool)

(assert (=> start!68456 (=> (not res!540258) (not e!441623))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68456 (= res!540258 (validMask!0 mask!3266))))

(assert (=> start!68456 e!441623))

(assert (=> start!68456 true))

(declare-fun array_inv!16499 (array!43246) Bool)

(assert (=> start!68456 (array_inv!16499 a!3170)))

(declare-fun b!795740 () Bool)

(declare-fun res!540260 () Bool)

(assert (=> b!795740 (=> (not res!540260) (not e!441623))))

(assert (=> b!795740 (= res!540260 (validKeyInArray!0 k!2044))))

(assert (= (and start!68456 res!540258) b!795741))

(assert (= (and b!795741 res!540262) b!795743))

(assert (= (and b!795743 res!540259) b!795740))

(assert (= (and b!795740 res!540260) b!795737))

(assert (= (and b!795737 res!540254) b!795735))

(assert (= (and b!795735 res!540261) b!795736))

(assert (= (and b!795736 res!540255) b!795742))

(assert (= (and b!795742 res!540257) b!795738))

(assert (= (and b!795738 res!540256) b!795739))

(assert (= (and b!795739 res!540263) b!795744))

(declare-fun m!736421 () Bool)

(assert (=> start!68456 m!736421))

(declare-fun m!736423 () Bool)

(assert (=> start!68456 m!736423))

(declare-fun m!736425 () Bool)

(assert (=> b!795739 m!736425))

(declare-fun m!736427 () Bool)

(assert (=> b!795739 m!736427))

(declare-fun m!736429 () Bool)

(assert (=> b!795739 m!736429))

(declare-fun m!736431 () Bool)

(assert (=> b!795739 m!736431))

(declare-fun m!736433 () Bool)

(assert (=> b!795743 m!736433))

(assert (=> b!795743 m!736433))

(declare-fun m!736435 () Bool)

(assert (=> b!795743 m!736435))

(declare-fun m!736437 () Bool)

(assert (=> b!795735 m!736437))

(declare-fun m!736439 () Bool)

(assert (=> b!795738 m!736439))

(declare-fun m!736441 () Bool)

(assert (=> b!795738 m!736441))

(declare-fun m!736443 () Bool)

(assert (=> b!795736 m!736443))

(declare-fun m!736445 () Bool)

(assert (=> b!795740 m!736445))

(declare-fun m!736447 () Bool)

(assert (=> b!795737 m!736447))

(declare-fun m!736449 () Bool)

(assert (=> b!795744 m!736449))

(assert (=> b!795744 m!736433))

(assert (=> b!795744 m!736433))

(declare-fun m!736451 () Bool)

(assert (=> b!795744 m!736451))

(assert (=> b!795744 m!736433))

(declare-fun m!736453 () Bool)

(assert (=> b!795744 m!736453))

(declare-fun m!736455 () Bool)

(assert (=> b!795742 m!736455))

(push 1)

(assert (not b!795739))

(assert (not b!795743))

(assert (not b!795736))

(assert (not b!795735))

(assert (not b!795740))

(assert (not b!795737))

(assert (not b!795742))

(assert (not start!68456))

(assert (not b!795744))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

