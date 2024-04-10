; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68444 () Bool)

(assert start!68444)

(declare-fun b!795555 () Bool)

(declare-fun res!540078 () Bool)

(declare-fun e!441548 () Bool)

(assert (=> b!795555 (=> (not res!540078) (not e!441548))))

(declare-datatypes ((array!43234 0))(
  ( (array!43235 (arr!20697 (Array (_ BitVec 32) (_ BitVec 64))) (size!21118 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43234)

(declare-datatypes ((List!14660 0))(
  ( (Nil!14657) (Cons!14656 (h!15785 (_ BitVec 64)) (t!20975 List!14660)) )
))
(declare-fun arrayNoDuplicates!0 (array!43234 (_ BitVec 32) List!14660) Bool)

(assert (=> b!795555 (= res!540078 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14657))))

(declare-fun b!795556 () Bool)

(declare-fun res!540081 () Bool)

(declare-fun e!441549 () Bool)

(assert (=> b!795556 (=> (not res!540081) (not e!441549))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43234 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795556 (= res!540081 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!795557 () Bool)

(declare-fun res!540074 () Bool)

(assert (=> b!795557 (=> (not res!540074) (not e!441549))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795557 (= res!540074 (validKeyInArray!0 k!2044))))

(declare-fun b!795558 () Bool)

(assert (=> b!795558 (= e!441549 e!441548)))

(declare-fun res!540077 () Bool)

(assert (=> b!795558 (=> (not res!540077) (not e!441548))))

(declare-datatypes ((SeekEntryResult!8288 0))(
  ( (MissingZero!8288 (index!35520 (_ BitVec 32))) (Found!8288 (index!35521 (_ BitVec 32))) (Intermediate!8288 (undefined!9100 Bool) (index!35522 (_ BitVec 32)) (x!66438 (_ BitVec 32))) (Undefined!8288) (MissingVacant!8288 (index!35523 (_ BitVec 32))) )
))
(declare-fun lt!354635 () SeekEntryResult!8288)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!795558 (= res!540077 (or (= lt!354635 (MissingZero!8288 i!1163)) (= lt!354635 (MissingVacant!8288 i!1163))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43234 (_ BitVec 32)) SeekEntryResult!8288)

(assert (=> b!795558 (= lt!354635 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!795559 () Bool)

(declare-fun res!540079 () Bool)

(assert (=> b!795559 (=> (not res!540079) (not e!441549))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!795559 (= res!540079 (validKeyInArray!0 (select (arr!20697 a!3170) j!153)))))

(declare-fun res!540076 () Bool)

(assert (=> start!68444 (=> (not res!540076) (not e!441549))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68444 (= res!540076 (validMask!0 mask!3266))))

(assert (=> start!68444 e!441549))

(assert (=> start!68444 true))

(declare-fun array_inv!16493 (array!43234) Bool)

(assert (=> start!68444 (array_inv!16493 a!3170)))

(declare-fun b!795560 () Bool)

(declare-fun res!540082 () Bool)

(assert (=> b!795560 (=> (not res!540082) (not e!441548))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!795560 (= res!540082 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21118 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20697 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21118 a!3170)) (= (select (arr!20697 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795561 () Bool)

(declare-fun e!441551 () Bool)

(assert (=> b!795561 (= e!441548 e!441551)))

(declare-fun res!540083 () Bool)

(assert (=> b!795561 (=> (not res!540083) (not e!441551))))

(declare-fun lt!354631 () array!43234)

(declare-fun lt!354633 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43234 (_ BitVec 32)) SeekEntryResult!8288)

(assert (=> b!795561 (= res!540083 (= (seekEntryOrOpen!0 lt!354633 lt!354631 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354633 lt!354631 mask!3266)))))

(assert (=> b!795561 (= lt!354633 (select (store (arr!20697 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!795561 (= lt!354631 (array!43235 (store (arr!20697 a!3170) i!1163 k!2044) (size!21118 a!3170)))))

(declare-fun b!795562 () Bool)

(declare-fun res!540080 () Bool)

(assert (=> b!795562 (=> (not res!540080) (not e!441549))))

(assert (=> b!795562 (= res!540080 (and (= (size!21118 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21118 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21118 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795563 () Bool)

(declare-fun lt!354634 () SeekEntryResult!8288)

(declare-fun lt!354632 () SeekEntryResult!8288)

(assert (=> b!795563 (= e!441551 (and (= lt!354634 lt!354632) (= lt!354632 (Found!8288 j!153)) (= (select (arr!20697 a!3170) index!1236) (select (arr!20697 a!3170) j!153)) (bvsge mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266))))))

(assert (=> b!795563 (= lt!354632 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20697 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!795563 (= lt!354634 (seekEntryOrOpen!0 (select (arr!20697 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!795564 () Bool)

(declare-fun res!540075 () Bool)

(assert (=> b!795564 (=> (not res!540075) (not e!441548))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43234 (_ BitVec 32)) Bool)

(assert (=> b!795564 (= res!540075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68444 res!540076) b!795562))

(assert (= (and b!795562 res!540080) b!795559))

(assert (= (and b!795559 res!540079) b!795557))

(assert (= (and b!795557 res!540074) b!795556))

(assert (= (and b!795556 res!540081) b!795558))

(assert (= (and b!795558 res!540077) b!795564))

(assert (= (and b!795564 res!540075) b!795555))

(assert (= (and b!795555 res!540078) b!795560))

(assert (= (and b!795560 res!540082) b!795561))

(assert (= (and b!795561 res!540083) b!795563))

(declare-fun m!736211 () Bool)

(assert (=> b!795557 m!736211))

(declare-fun m!736213 () Bool)

(assert (=> start!68444 m!736213))

(declare-fun m!736215 () Bool)

(assert (=> start!68444 m!736215))

(declare-fun m!736217 () Bool)

(assert (=> b!795564 m!736217))

(declare-fun m!736219 () Bool)

(assert (=> b!795561 m!736219))

(declare-fun m!736221 () Bool)

(assert (=> b!795561 m!736221))

(declare-fun m!736223 () Bool)

(assert (=> b!795561 m!736223))

(declare-fun m!736225 () Bool)

(assert (=> b!795561 m!736225))

(declare-fun m!736227 () Bool)

(assert (=> b!795555 m!736227))

(declare-fun m!736229 () Bool)

(assert (=> b!795560 m!736229))

(declare-fun m!736231 () Bool)

(assert (=> b!795560 m!736231))

(declare-fun m!736233 () Bool)

(assert (=> b!795558 m!736233))

(declare-fun m!736235 () Bool)

(assert (=> b!795556 m!736235))

(declare-fun m!736237 () Bool)

(assert (=> b!795559 m!736237))

(assert (=> b!795559 m!736237))

(declare-fun m!736239 () Bool)

(assert (=> b!795559 m!736239))

(declare-fun m!736241 () Bool)

(assert (=> b!795563 m!736241))

(assert (=> b!795563 m!736237))

(assert (=> b!795563 m!736237))

(declare-fun m!736243 () Bool)

(assert (=> b!795563 m!736243))

(assert (=> b!795563 m!736237))

(declare-fun m!736245 () Bool)

(assert (=> b!795563 m!736245))

(push 1)

(assert (not start!68444))

(assert (not b!795555))

(assert (not b!795559))

(assert (not b!795561))

(assert (not b!795558))

(assert (not b!795556))

(assert (not b!795557))

(assert (not b!795563))

(assert (not b!795564))

(check-sat)

(pop 1)

(push 1)

(check-sat)

