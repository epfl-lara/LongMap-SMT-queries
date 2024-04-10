; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68580 () Bool)

(assert start!68580)

(declare-fun b!797836 () Bool)

(declare-fun e!442608 () Bool)

(declare-fun e!442606 () Bool)

(assert (=> b!797836 (= e!442608 e!442606)))

(declare-fun res!542359 () Bool)

(assert (=> b!797836 (=> (not res!542359) (not e!442606))))

(declare-datatypes ((SeekEntryResult!8356 0))(
  ( (MissingZero!8356 (index!35792 (_ BitVec 32))) (Found!8356 (index!35793 (_ BitVec 32))) (Intermediate!8356 (undefined!9168 Bool) (index!35794 (_ BitVec 32)) (x!66682 (_ BitVec 32))) (Undefined!8356) (MissingVacant!8356 (index!35795 (_ BitVec 32))) )
))
(declare-fun lt!356033 () SeekEntryResult!8356)

(declare-fun lt!356031 () SeekEntryResult!8356)

(assert (=> b!797836 (= res!542359 (= lt!356033 lt!356031))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43370 0))(
  ( (array!43371 (arr!20765 (Array (_ BitVec 32) (_ BitVec 64))) (size!21186 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43370)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43370 (_ BitVec 32)) SeekEntryResult!8356)

(assert (=> b!797836 (= lt!356031 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20765 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43370 (_ BitVec 32)) SeekEntryResult!8356)

(assert (=> b!797836 (= lt!356033 (seekEntryOrOpen!0 (select (arr!20765 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!797837 () Bool)

(declare-fun e!442607 () Bool)

(assert (=> b!797837 (= e!442607 e!442608)))

(declare-fun res!542366 () Bool)

(assert (=> b!797837 (=> (not res!542366) (not e!442608))))

(declare-fun lt!356028 () SeekEntryResult!8356)

(declare-fun lt!356030 () SeekEntryResult!8356)

(assert (=> b!797837 (= res!542366 (= lt!356028 lt!356030))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!356032 () (_ BitVec 64))

(declare-fun lt!356026 () array!43370)

(assert (=> b!797837 (= lt!356030 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356032 lt!356026 mask!3266))))

(assert (=> b!797837 (= lt!356028 (seekEntryOrOpen!0 lt!356032 lt!356026 mask!3266))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!797837 (= lt!356032 (select (store (arr!20765 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!797837 (= lt!356026 (array!43371 (store (arr!20765 a!3170) i!1163 k!2044) (size!21186 a!3170)))))

(declare-fun b!797838 () Bool)

(declare-fun res!542362 () Bool)

(assert (=> b!797838 (=> (not res!542362) (not e!442607))))

(declare-datatypes ((List!14728 0))(
  ( (Nil!14725) (Cons!14724 (h!15853 (_ BitVec 64)) (t!21043 List!14728)) )
))
(declare-fun arrayNoDuplicates!0 (array!43370 (_ BitVec 32) List!14728) Bool)

(assert (=> b!797838 (= res!542362 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14725))))

(declare-fun b!797839 () Bool)

(declare-fun res!542360 () Bool)

(declare-fun e!442610 () Bool)

(assert (=> b!797839 (=> (not res!542360) (not e!442610))))

(declare-fun arrayContainsKey!0 (array!43370 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797839 (= res!542360 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!797840 () Bool)

(declare-fun e!442605 () Bool)

(assert (=> b!797840 (= e!442606 e!442605)))

(declare-fun res!542365 () Bool)

(assert (=> b!797840 (=> (not res!542365) (not e!442605))))

(declare-fun lt!356029 () SeekEntryResult!8356)

(assert (=> b!797840 (= res!542365 (and (= lt!356031 lt!356029) (= (select (arr!20765 a!3170) index!1236) (select (arr!20765 a!3170) j!153))))))

(assert (=> b!797840 (= lt!356029 (Found!8356 j!153))))

(declare-fun res!542356 () Bool)

(assert (=> start!68580 (=> (not res!542356) (not e!442610))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68580 (= res!542356 (validMask!0 mask!3266))))

(assert (=> start!68580 e!442610))

(assert (=> start!68580 true))

(declare-fun array_inv!16561 (array!43370) Bool)

(assert (=> start!68580 (array_inv!16561 a!3170)))

(declare-fun b!797841 () Bool)

(declare-fun res!542358 () Bool)

(assert (=> b!797841 (=> (not res!542358) (not e!442610))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797841 (= res!542358 (validKeyInArray!0 k!2044))))

(declare-fun b!797842 () Bool)

(assert (=> b!797842 (= e!442605 (not (or (not (= lt!356030 lt!356029)) (bvsge mask!3266 #b00000000000000000000000000000000))))))

(assert (=> b!797842 (= lt!356030 (Found!8356 index!1236))))

(declare-fun b!797843 () Bool)

(assert (=> b!797843 (= e!442610 e!442607)))

(declare-fun res!542355 () Bool)

(assert (=> b!797843 (=> (not res!542355) (not e!442607))))

(declare-fun lt!356027 () SeekEntryResult!8356)

(assert (=> b!797843 (= res!542355 (or (= lt!356027 (MissingZero!8356 i!1163)) (= lt!356027 (MissingVacant!8356 i!1163))))))

(assert (=> b!797843 (= lt!356027 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!797844 () Bool)

(declare-fun res!542363 () Bool)

(assert (=> b!797844 (=> (not res!542363) (not e!442610))))

(assert (=> b!797844 (= res!542363 (and (= (size!21186 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21186 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21186 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!797845 () Bool)

(declare-fun res!542364 () Bool)

(assert (=> b!797845 (=> (not res!542364) (not e!442607))))

(assert (=> b!797845 (= res!542364 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21186 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20765 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21186 a!3170)) (= (select (arr!20765 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!797846 () Bool)

(declare-fun res!542357 () Bool)

(assert (=> b!797846 (=> (not res!542357) (not e!442607))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43370 (_ BitVec 32)) Bool)

(assert (=> b!797846 (= res!542357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!797847 () Bool)

(declare-fun res!542361 () Bool)

(assert (=> b!797847 (=> (not res!542361) (not e!442610))))

(assert (=> b!797847 (= res!542361 (validKeyInArray!0 (select (arr!20765 a!3170) j!153)))))

(assert (= (and start!68580 res!542356) b!797844))

(assert (= (and b!797844 res!542363) b!797847))

(assert (= (and b!797847 res!542361) b!797841))

(assert (= (and b!797841 res!542358) b!797839))

(assert (= (and b!797839 res!542360) b!797843))

(assert (= (and b!797843 res!542355) b!797846))

(assert (= (and b!797846 res!542357) b!797838))

(assert (= (and b!797838 res!542362) b!797845))

(assert (= (and b!797845 res!542364) b!797837))

(assert (= (and b!797837 res!542366) b!797836))

(assert (= (and b!797836 res!542359) b!797840))

(assert (= (and b!797840 res!542365) b!797842))

(declare-fun m!738707 () Bool)

(assert (=> b!797846 m!738707))

(declare-fun m!738709 () Bool)

(assert (=> b!797836 m!738709))

(assert (=> b!797836 m!738709))

(declare-fun m!738711 () Bool)

(assert (=> b!797836 m!738711))

(assert (=> b!797836 m!738709))

(declare-fun m!738713 () Bool)

(assert (=> b!797836 m!738713))

(declare-fun m!738715 () Bool)

(assert (=> b!797845 m!738715))

(declare-fun m!738717 () Bool)

(assert (=> b!797845 m!738717))

(declare-fun m!738719 () Bool)

(assert (=> b!797838 m!738719))

(declare-fun m!738721 () Bool)

(assert (=> b!797841 m!738721))

(declare-fun m!738723 () Bool)

(assert (=> b!797843 m!738723))

(declare-fun m!738725 () Bool)

(assert (=> b!797837 m!738725))

(declare-fun m!738727 () Bool)

(assert (=> b!797837 m!738727))

(declare-fun m!738729 () Bool)

(assert (=> b!797837 m!738729))

(declare-fun m!738731 () Bool)

(assert (=> b!797837 m!738731))

(assert (=> b!797847 m!738709))

(assert (=> b!797847 m!738709))

(declare-fun m!738733 () Bool)

(assert (=> b!797847 m!738733))

(declare-fun m!738735 () Bool)

(assert (=> start!68580 m!738735))

(declare-fun m!738737 () Bool)

(assert (=> start!68580 m!738737))

(declare-fun m!738739 () Bool)

(assert (=> b!797839 m!738739))

(declare-fun m!738741 () Bool)

(assert (=> b!797840 m!738741))

(assert (=> b!797840 m!738709))

(push 1)

(assert (not b!797837))

(assert (not start!68580))

(assert (not b!797841))

(assert (not b!797847))

(assert (not b!797843))

(assert (not b!797839))

(assert (not b!797838))

(assert (not b!797836))

(assert (not b!797846))

(check-sat)

(pop 1)

(push 1)

(check-sat)

