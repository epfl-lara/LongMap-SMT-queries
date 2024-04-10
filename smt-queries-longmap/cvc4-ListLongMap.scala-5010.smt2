; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68574 () Bool)

(assert start!68574)

(declare-fun b!797729 () Bool)

(declare-fun e!442553 () Bool)

(assert (=> b!797729 (= e!442553 (not true))))

(declare-datatypes ((SeekEntryResult!8353 0))(
  ( (MissingZero!8353 (index!35780 (_ BitVec 32))) (Found!8353 (index!35781 (_ BitVec 32))) (Intermediate!8353 (undefined!9165 Bool) (index!35782 (_ BitVec 32)) (x!66671 (_ BitVec 32))) (Undefined!8353) (MissingVacant!8353 (index!35783 (_ BitVec 32))) )
))
(declare-fun lt!355957 () SeekEntryResult!8353)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!797729 (= lt!355957 (Found!8353 index!1236))))

(declare-fun res!542257 () Bool)

(declare-fun e!442556 () Bool)

(assert (=> start!68574 (=> (not res!542257) (not e!442556))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68574 (= res!542257 (validMask!0 mask!3266))))

(assert (=> start!68574 e!442556))

(assert (=> start!68574 true))

(declare-datatypes ((array!43364 0))(
  ( (array!43365 (arr!20762 (Array (_ BitVec 32) (_ BitVec 64))) (size!21183 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43364)

(declare-fun array_inv!16558 (array!43364) Bool)

(assert (=> start!68574 (array_inv!16558 a!3170)))

(declare-fun b!797730 () Bool)

(declare-fun res!542252 () Bool)

(assert (=> b!797730 (=> (not res!542252) (not e!442556))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!797730 (= res!542252 (and (= (size!21183 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21183 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21183 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!797731 () Bool)

(declare-fun res!542258 () Bool)

(declare-fun e!442554 () Bool)

(assert (=> b!797731 (=> (not res!542258) (not e!442554))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43364 (_ BitVec 32)) Bool)

(assert (=> b!797731 (= res!542258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!797732 () Bool)

(declare-fun e!442552 () Bool)

(assert (=> b!797732 (= e!442554 e!442552)))

(declare-fun res!542248 () Bool)

(assert (=> b!797732 (=> (not res!542248) (not e!442552))))

(declare-fun lt!355960 () SeekEntryResult!8353)

(assert (=> b!797732 (= res!542248 (= lt!355960 lt!355957))))

(declare-fun lt!355956 () array!43364)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!355958 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43364 (_ BitVec 32)) SeekEntryResult!8353)

(assert (=> b!797732 (= lt!355957 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355958 lt!355956 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43364 (_ BitVec 32)) SeekEntryResult!8353)

(assert (=> b!797732 (= lt!355960 (seekEntryOrOpen!0 lt!355958 lt!355956 mask!3266))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!797732 (= lt!355958 (select (store (arr!20762 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!797732 (= lt!355956 (array!43365 (store (arr!20762 a!3170) i!1163 k!2044) (size!21183 a!3170)))))

(declare-fun b!797733 () Bool)

(assert (=> b!797733 (= e!442552 e!442553)))

(declare-fun res!542251 () Bool)

(assert (=> b!797733 (=> (not res!542251) (not e!442553))))

(declare-fun lt!355955 () SeekEntryResult!8353)

(declare-fun lt!355961 () SeekEntryResult!8353)

(assert (=> b!797733 (= res!542251 (and (= lt!355961 lt!355955) (= lt!355955 (Found!8353 j!153)) (= (select (arr!20762 a!3170) index!1236) (select (arr!20762 a!3170) j!153))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!797733 (= lt!355955 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20762 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!797733 (= lt!355961 (seekEntryOrOpen!0 (select (arr!20762 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!797734 () Bool)

(declare-fun res!542254 () Bool)

(assert (=> b!797734 (=> (not res!542254) (not e!442554))))

(assert (=> b!797734 (= res!542254 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21183 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20762 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21183 a!3170)) (= (select (arr!20762 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!797735 () Bool)

(assert (=> b!797735 (= e!442556 e!442554)))

(declare-fun res!542255 () Bool)

(assert (=> b!797735 (=> (not res!542255) (not e!442554))))

(declare-fun lt!355959 () SeekEntryResult!8353)

(assert (=> b!797735 (= res!542255 (or (= lt!355959 (MissingZero!8353 i!1163)) (= lt!355959 (MissingVacant!8353 i!1163))))))

(assert (=> b!797735 (= lt!355959 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!797736 () Bool)

(declare-fun res!542256 () Bool)

(assert (=> b!797736 (=> (not res!542256) (not e!442556))))

(declare-fun arrayContainsKey!0 (array!43364 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797736 (= res!542256 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!797737 () Bool)

(declare-fun res!542250 () Bool)

(assert (=> b!797737 (=> (not res!542250) (not e!442554))))

(declare-datatypes ((List!14725 0))(
  ( (Nil!14722) (Cons!14721 (h!15850 (_ BitVec 64)) (t!21040 List!14725)) )
))
(declare-fun arrayNoDuplicates!0 (array!43364 (_ BitVec 32) List!14725) Bool)

(assert (=> b!797737 (= res!542250 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14722))))

(declare-fun b!797738 () Bool)

(declare-fun res!542253 () Bool)

(assert (=> b!797738 (=> (not res!542253) (not e!442556))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797738 (= res!542253 (validKeyInArray!0 (select (arr!20762 a!3170) j!153)))))

(declare-fun b!797739 () Bool)

(declare-fun res!542249 () Bool)

(assert (=> b!797739 (=> (not res!542249) (not e!442556))))

(assert (=> b!797739 (= res!542249 (validKeyInArray!0 k!2044))))

(assert (= (and start!68574 res!542257) b!797730))

(assert (= (and b!797730 res!542252) b!797738))

(assert (= (and b!797738 res!542253) b!797739))

(assert (= (and b!797739 res!542249) b!797736))

(assert (= (and b!797736 res!542256) b!797735))

(assert (= (and b!797735 res!542255) b!797731))

(assert (= (and b!797731 res!542258) b!797737))

(assert (= (and b!797737 res!542250) b!797734))

(assert (= (and b!797734 res!542254) b!797732))

(assert (= (and b!797732 res!542248) b!797733))

(assert (= (and b!797733 res!542251) b!797729))

(declare-fun m!738599 () Bool)

(assert (=> b!797738 m!738599))

(assert (=> b!797738 m!738599))

(declare-fun m!738601 () Bool)

(assert (=> b!797738 m!738601))

(declare-fun m!738603 () Bool)

(assert (=> b!797739 m!738603))

(declare-fun m!738605 () Bool)

(assert (=> b!797731 m!738605))

(declare-fun m!738607 () Bool)

(assert (=> b!797732 m!738607))

(declare-fun m!738609 () Bool)

(assert (=> b!797732 m!738609))

(declare-fun m!738611 () Bool)

(assert (=> b!797732 m!738611))

(declare-fun m!738613 () Bool)

(assert (=> b!797732 m!738613))

(declare-fun m!738615 () Bool)

(assert (=> b!797734 m!738615))

(declare-fun m!738617 () Bool)

(assert (=> b!797734 m!738617))

(declare-fun m!738619 () Bool)

(assert (=> b!797736 m!738619))

(declare-fun m!738621 () Bool)

(assert (=> b!797735 m!738621))

(declare-fun m!738623 () Bool)

(assert (=> b!797733 m!738623))

(assert (=> b!797733 m!738599))

(assert (=> b!797733 m!738599))

(declare-fun m!738625 () Bool)

(assert (=> b!797733 m!738625))

(assert (=> b!797733 m!738599))

(declare-fun m!738627 () Bool)

(assert (=> b!797733 m!738627))

(declare-fun m!738629 () Bool)

(assert (=> start!68574 m!738629))

(declare-fun m!738631 () Bool)

(assert (=> start!68574 m!738631))

(declare-fun m!738633 () Bool)

(assert (=> b!797737 m!738633))

(push 1)

