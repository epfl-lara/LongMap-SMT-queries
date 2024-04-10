; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68784 () Bool)

(assert start!68784)

(declare-fun b!801615 () Bool)

(declare-fun res!546144 () Bool)

(declare-fun e!444333 () Bool)

(assert (=> b!801615 (=> (not res!546144) (not e!444333))))

(declare-datatypes ((array!43574 0))(
  ( (array!43575 (arr!20867 (Array (_ BitVec 32) (_ BitVec 64))) (size!21288 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43574)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801615 (= res!546144 (validKeyInArray!0 (select (arr!20867 a!3170) j!153)))))

(declare-fun b!801616 () Bool)

(declare-fun res!546141 () Bool)

(assert (=> b!801616 (=> (not res!546141) (not e!444333))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!801616 (= res!546141 (validKeyInArray!0 k!2044))))

(declare-fun b!801617 () Bool)

(declare-fun e!444334 () Bool)

(declare-fun e!444337 () Bool)

(assert (=> b!801617 (= e!444334 e!444337)))

(declare-fun res!546135 () Bool)

(assert (=> b!801617 (=> (not res!546135) (not e!444337))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!358336 () (_ BitVec 32))

(assert (=> b!801617 (= res!546135 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!358336 #b00000000000000000000000000000000) (bvslt lt!358336 (size!21288 a!3170))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801617 (= lt!358336 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun res!546134 () Bool)

(assert (=> start!68784 (=> (not res!546134) (not e!444333))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68784 (= res!546134 (validMask!0 mask!3266))))

(assert (=> start!68784 e!444333))

(assert (=> start!68784 true))

(declare-fun array_inv!16663 (array!43574) Bool)

(assert (=> start!68784 (array_inv!16663 a!3170)))

(declare-fun b!801618 () Bool)

(declare-fun res!546136 () Bool)

(declare-fun e!444336 () Bool)

(assert (=> b!801618 (=> (not res!546136) (not e!444336))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!801618 (= res!546136 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21288 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20867 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21288 a!3170)) (= (select (arr!20867 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!801619 () Bool)

(declare-fun res!546140 () Bool)

(assert (=> b!801619 (=> (not res!546140) (not e!444333))))

(assert (=> b!801619 (= res!546140 (and (= (size!21288 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21288 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21288 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!801620 () Bool)

(declare-fun res!546138 () Bool)

(assert (=> b!801620 (=> (not res!546138) (not e!444337))))

(declare-datatypes ((SeekEntryResult!8458 0))(
  ( (MissingZero!8458 (index!36200 (_ BitVec 32))) (Found!8458 (index!36201 (_ BitVec 32))) (Intermediate!8458 (undefined!9270 Bool) (index!36202 (_ BitVec 32)) (x!67056 (_ BitVec 32))) (Undefined!8458) (MissingVacant!8458 (index!36203 (_ BitVec 32))) )
))
(declare-fun lt!358332 () SeekEntryResult!8458)

(declare-fun lt!358333 () array!43574)

(declare-fun lt!358330 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43574 (_ BitVec 32)) SeekEntryResult!8458)

(assert (=> b!801620 (= res!546138 (= lt!358332 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358336 vacantAfter!23 lt!358330 lt!358333 mask!3266)))))

(declare-fun b!801621 () Bool)

(declare-fun res!546139 () Bool)

(assert (=> b!801621 (=> (not res!546139) (not e!444336))))

(declare-datatypes ((List!14830 0))(
  ( (Nil!14827) (Cons!14826 (h!15955 (_ BitVec 64)) (t!21145 List!14830)) )
))
(declare-fun arrayNoDuplicates!0 (array!43574 (_ BitVec 32) List!14830) Bool)

(assert (=> b!801621 (= res!546139 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14827))))

(declare-fun b!801622 () Bool)

(declare-fun e!444335 () Bool)

(assert (=> b!801622 (= e!444335 e!444334)))

(declare-fun res!546137 () Bool)

(assert (=> b!801622 (=> (not res!546137) (not e!444334))))

(declare-fun lt!358337 () SeekEntryResult!8458)

(declare-fun lt!358331 () SeekEntryResult!8458)

(assert (=> b!801622 (= res!546137 (and (= lt!358331 lt!358337) (= lt!358337 (Found!8458 j!153)) (not (= (select (arr!20867 a!3170) index!1236) (select (arr!20867 a!3170) j!153)))))))

(assert (=> b!801622 (= lt!358337 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20867 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43574 (_ BitVec 32)) SeekEntryResult!8458)

(assert (=> b!801622 (= lt!358331 (seekEntryOrOpen!0 (select (arr!20867 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801623 () Bool)

(assert (=> b!801623 (= e!444333 e!444336)))

(declare-fun res!546146 () Bool)

(assert (=> b!801623 (=> (not res!546146) (not e!444336))))

(declare-fun lt!358334 () SeekEntryResult!8458)

(assert (=> b!801623 (= res!546146 (or (= lt!358334 (MissingZero!8458 i!1163)) (= lt!358334 (MissingVacant!8458 i!1163))))))

(assert (=> b!801623 (= lt!358334 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!801624 () Bool)

(declare-fun res!546143 () Bool)

(assert (=> b!801624 (=> (not res!546143) (not e!444333))))

(declare-fun arrayContainsKey!0 (array!43574 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801624 (= res!546143 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!801625 () Bool)

(assert (=> b!801625 (= e!444336 e!444335)))

(declare-fun res!546145 () Bool)

(assert (=> b!801625 (=> (not res!546145) (not e!444335))))

(assert (=> b!801625 (= res!546145 (= lt!358332 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358330 lt!358333 mask!3266)))))

(assert (=> b!801625 (= lt!358332 (seekEntryOrOpen!0 lt!358330 lt!358333 mask!3266))))

(assert (=> b!801625 (= lt!358330 (select (store (arr!20867 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!801625 (= lt!358333 (array!43575 (store (arr!20867 a!3170) i!1163 k!2044) (size!21288 a!3170)))))

(declare-fun b!801626 () Bool)

(assert (=> b!801626 (= e!444337 false)))

(declare-fun lt!358335 () SeekEntryResult!8458)

(assert (=> b!801626 (= lt!358335 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358336 vacantBefore!23 (select (arr!20867 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801627 () Bool)

(declare-fun res!546142 () Bool)

(assert (=> b!801627 (=> (not res!546142) (not e!444336))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43574 (_ BitVec 32)) Bool)

(assert (=> b!801627 (= res!546142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68784 res!546134) b!801619))

(assert (= (and b!801619 res!546140) b!801615))

(assert (= (and b!801615 res!546144) b!801616))

(assert (= (and b!801616 res!546141) b!801624))

(assert (= (and b!801624 res!546143) b!801623))

(assert (= (and b!801623 res!546146) b!801627))

(assert (= (and b!801627 res!546142) b!801621))

(assert (= (and b!801621 res!546139) b!801618))

(assert (= (and b!801618 res!546136) b!801625))

(assert (= (and b!801625 res!546145) b!801622))

(assert (= (and b!801622 res!546137) b!801617))

(assert (= (and b!801617 res!546135) b!801620))

(assert (= (and b!801620 res!546138) b!801626))

(declare-fun m!742793 () Bool)

(assert (=> b!801618 m!742793))

(declare-fun m!742795 () Bool)

(assert (=> b!801618 m!742795))

(declare-fun m!742797 () Bool)

(assert (=> b!801621 m!742797))

(declare-fun m!742799 () Bool)

(assert (=> b!801623 m!742799))

(declare-fun m!742801 () Bool)

(assert (=> b!801616 m!742801))

(declare-fun m!742803 () Bool)

(assert (=> b!801626 m!742803))

(assert (=> b!801626 m!742803))

(declare-fun m!742805 () Bool)

(assert (=> b!801626 m!742805))

(declare-fun m!742807 () Bool)

(assert (=> start!68784 m!742807))

(declare-fun m!742809 () Bool)

(assert (=> start!68784 m!742809))

(declare-fun m!742811 () Bool)

(assert (=> b!801620 m!742811))

(assert (=> b!801615 m!742803))

(assert (=> b!801615 m!742803))

(declare-fun m!742813 () Bool)

(assert (=> b!801615 m!742813))

(declare-fun m!742815 () Bool)

(assert (=> b!801624 m!742815))

(declare-fun m!742817 () Bool)

(assert (=> b!801627 m!742817))

(declare-fun m!742819 () Bool)

(assert (=> b!801625 m!742819))

(declare-fun m!742821 () Bool)

(assert (=> b!801625 m!742821))

(declare-fun m!742823 () Bool)

(assert (=> b!801625 m!742823))

(declare-fun m!742825 () Bool)

(assert (=> b!801625 m!742825))

(declare-fun m!742827 () Bool)

(assert (=> b!801617 m!742827))

(declare-fun m!742829 () Bool)

(assert (=> b!801622 m!742829))

(assert (=> b!801622 m!742803))

(assert (=> b!801622 m!742803))

(declare-fun m!742831 () Bool)

(assert (=> b!801622 m!742831))

(assert (=> b!801622 m!742803))

(declare-fun m!742833 () Bool)

(assert (=> b!801622 m!742833))

(push 1)

(assert (not b!801627))

