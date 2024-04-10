; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68804 () Bool)

(assert start!68804)

(declare-fun b!801947 () Bool)

(declare-fun e!444487 () Bool)

(declare-fun e!444486 () Bool)

(assert (=> b!801947 (= e!444487 e!444486)))

(declare-fun res!546469 () Bool)

(assert (=> b!801947 (=> (not res!546469) (not e!444486))))

(declare-fun lt!358546 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((array!43594 0))(
  ( (array!43595 (arr!20877 (Array (_ BitVec 32) (_ BitVec 64))) (size!21298 (_ BitVec 32))) )
))
(declare-fun lt!358542 () array!43594)

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8468 0))(
  ( (MissingZero!8468 (index!36240 (_ BitVec 32))) (Found!8468 (index!36241 (_ BitVec 32))) (Intermediate!8468 (undefined!9280 Bool) (index!36242 (_ BitVec 32)) (x!67098 (_ BitVec 32))) (Undefined!8468) (MissingVacant!8468 (index!36243 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43594 (_ BitVec 32)) SeekEntryResult!8468)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43594 (_ BitVec 32)) SeekEntryResult!8468)

(assert (=> b!801947 (= res!546469 (= (seekEntryOrOpen!0 lt!358546 lt!358542 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358546 lt!358542 mask!3266)))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43594)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!801947 (= lt!358546 (select (store (arr!20877 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!801947 (= lt!358542 (array!43595 (store (arr!20877 a!3170) i!1163 k!2044) (size!21298 a!3170)))))

(declare-fun b!801948 () Bool)

(declare-fun res!546467 () Bool)

(assert (=> b!801948 (=> (not res!546467) (not e!444487))))

(declare-datatypes ((List!14840 0))(
  ( (Nil!14837) (Cons!14836 (h!15965 (_ BitVec 64)) (t!21155 List!14840)) )
))
(declare-fun arrayNoDuplicates!0 (array!43594 (_ BitVec 32) List!14840) Bool)

(assert (=> b!801948 (= res!546467 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14837))))

(declare-fun b!801949 () Bool)

(declare-fun e!444488 () Bool)

(assert (=> b!801949 (= e!444486 e!444488)))

(declare-fun res!546476 () Bool)

(assert (=> b!801949 (=> (not res!546476) (not e!444488))))

(declare-fun lt!358541 () SeekEntryResult!8468)

(declare-fun lt!358545 () SeekEntryResult!8468)

(assert (=> b!801949 (= res!546476 (and (= lt!358541 lt!358545) (= lt!358545 (Found!8468 j!153)) (not (= (select (arr!20877 a!3170) index!1236) (select (arr!20877 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!801949 (= lt!358545 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20877 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!801949 (= lt!358541 (seekEntryOrOpen!0 (select (arr!20877 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!546468 () Bool)

(declare-fun e!444484 () Bool)

(assert (=> start!68804 (=> (not res!546468) (not e!444484))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68804 (= res!546468 (validMask!0 mask!3266))))

(assert (=> start!68804 e!444484))

(assert (=> start!68804 true))

(declare-fun array_inv!16673 (array!43594) Bool)

(assert (=> start!68804 (array_inv!16673 a!3170)))

(declare-fun b!801950 () Bool)

(assert (=> b!801950 (= e!444488 (not (or (bvslt mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(declare-fun lt!358543 () (_ BitVec 32))

(assert (=> b!801950 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358543 vacantAfter!23 lt!358546 lt!358542 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358543 vacantBefore!23 (select (arr!20877 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27476 0))(
  ( (Unit!27477) )
))
(declare-fun lt!358544 () Unit!27476)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43594 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27476)

(assert (=> b!801950 (= lt!358544 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!358543 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801950 (= lt!358543 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!801951 () Bool)

(assert (=> b!801951 (= e!444484 e!444487)))

(declare-fun res!546475 () Bool)

(assert (=> b!801951 (=> (not res!546475) (not e!444487))))

(declare-fun lt!358547 () SeekEntryResult!8468)

(assert (=> b!801951 (= res!546475 (or (= lt!358547 (MissingZero!8468 i!1163)) (= lt!358547 (MissingVacant!8468 i!1163))))))

(assert (=> b!801951 (= lt!358547 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!801952 () Bool)

(declare-fun res!546471 () Bool)

(assert (=> b!801952 (=> (not res!546471) (not e!444484))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801952 (= res!546471 (validKeyInArray!0 k!2044))))

(declare-fun b!801953 () Bool)

(declare-fun res!546472 () Bool)

(assert (=> b!801953 (=> (not res!546472) (not e!444487))))

(assert (=> b!801953 (= res!546472 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21298 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20877 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21298 a!3170)) (= (select (arr!20877 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!801954 () Bool)

(declare-fun res!546473 () Bool)

(assert (=> b!801954 (=> (not res!546473) (not e!444484))))

(assert (=> b!801954 (= res!546473 (validKeyInArray!0 (select (arr!20877 a!3170) j!153)))))

(declare-fun b!801955 () Bool)

(declare-fun res!546470 () Bool)

(assert (=> b!801955 (=> (not res!546470) (not e!444484))))

(declare-fun arrayContainsKey!0 (array!43594 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801955 (= res!546470 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!801956 () Bool)

(declare-fun res!546474 () Bool)

(assert (=> b!801956 (=> (not res!546474) (not e!444484))))

(assert (=> b!801956 (= res!546474 (and (= (size!21298 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21298 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21298 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!801957 () Bool)

(declare-fun res!546466 () Bool)

(assert (=> b!801957 (=> (not res!546466) (not e!444487))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43594 (_ BitVec 32)) Bool)

(assert (=> b!801957 (= res!546466 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68804 res!546468) b!801956))

(assert (= (and b!801956 res!546474) b!801954))

(assert (= (and b!801954 res!546473) b!801952))

(assert (= (and b!801952 res!546471) b!801955))

(assert (= (and b!801955 res!546470) b!801951))

(assert (= (and b!801951 res!546475) b!801957))

(assert (= (and b!801957 res!546466) b!801948))

(assert (= (and b!801948 res!546467) b!801953))

(assert (= (and b!801953 res!546472) b!801947))

(assert (= (and b!801947 res!546469) b!801949))

(assert (= (and b!801949 res!546476) b!801950))

(declare-fun m!743231 () Bool)

(assert (=> b!801950 m!743231))

(declare-fun m!743233 () Bool)

(assert (=> b!801950 m!743233))

(declare-fun m!743235 () Bool)

(assert (=> b!801950 m!743235))

(declare-fun m!743237 () Bool)

(assert (=> b!801950 m!743237))

(declare-fun m!743239 () Bool)

(assert (=> b!801950 m!743239))

(assert (=> b!801950 m!743235))

(declare-fun m!743241 () Bool)

(assert (=> b!801955 m!743241))

(declare-fun m!743243 () Bool)

(assert (=> b!801949 m!743243))

(assert (=> b!801949 m!743235))

(assert (=> b!801949 m!743235))

(declare-fun m!743245 () Bool)

(assert (=> b!801949 m!743245))

(assert (=> b!801949 m!743235))

(declare-fun m!743247 () Bool)

(assert (=> b!801949 m!743247))

(declare-fun m!743249 () Bool)

(assert (=> b!801948 m!743249))

(declare-fun m!743251 () Bool)

(assert (=> b!801953 m!743251))

(declare-fun m!743253 () Bool)

(assert (=> b!801953 m!743253))

(declare-fun m!743255 () Bool)

(assert (=> b!801951 m!743255))

(declare-fun m!743257 () Bool)

(assert (=> b!801952 m!743257))

(declare-fun m!743259 () Bool)

(assert (=> b!801957 m!743259))

(assert (=> b!801954 m!743235))

(assert (=> b!801954 m!743235))

(declare-fun m!743261 () Bool)

(assert (=> b!801954 m!743261))

(declare-fun m!743263 () Bool)

(assert (=> start!68804 m!743263))

(declare-fun m!743265 () Bool)

(assert (=> start!68804 m!743265))

(declare-fun m!743267 () Bool)

(assert (=> b!801947 m!743267))

(declare-fun m!743269 () Bool)

(assert (=> b!801947 m!743269))

(declare-fun m!743271 () Bool)

(assert (=> b!801947 m!743271))

(declare-fun m!743273 () Bool)

(assert (=> b!801947 m!743273))

(push 1)

(assert (not b!801951))

(assert (not b!801947))

(assert (not b!801952))

(assert (not b!801957))

(assert (not b!801955))

(assert (not b!801949))

(assert (not b!801948))

(assert (not start!68804))

(assert (not b!801954))

(assert (not b!801950))

(check-sat)

(pop 1)

(push 1)

(check-sat)

