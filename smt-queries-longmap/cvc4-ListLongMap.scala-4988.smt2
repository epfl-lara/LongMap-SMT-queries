; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68442 () Bool)

(assert start!68442)

(declare-fun b!795525 () Bool)

(declare-fun res!540049 () Bool)

(declare-fun e!441536 () Bool)

(assert (=> b!795525 (=> (not res!540049) (not e!441536))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795525 (= res!540049 (validKeyInArray!0 k!2044))))

(declare-fun b!795527 () Bool)

(declare-fun res!540050 () Bool)

(assert (=> b!795527 (=> (not res!540050) (not e!441536))))

(declare-datatypes ((array!43232 0))(
  ( (array!43233 (arr!20696 (Array (_ BitVec 32) (_ BitVec 64))) (size!21117 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43232)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!795527 (= res!540050 (validKeyInArray!0 (select (arr!20696 a!3170) j!153)))))

(declare-fun b!795528 () Bool)

(declare-fun res!540052 () Bool)

(declare-fun e!441539 () Bool)

(assert (=> b!795528 (=> (not res!540052) (not e!441539))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43232 (_ BitVec 32)) Bool)

(assert (=> b!795528 (= res!540052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!795529 () Bool)

(declare-fun res!540051 () Bool)

(assert (=> b!795529 (=> (not res!540051) (not e!441539))))

(declare-datatypes ((List!14659 0))(
  ( (Nil!14656) (Cons!14655 (h!15784 (_ BitVec 64)) (t!20974 List!14659)) )
))
(declare-fun arrayNoDuplicates!0 (array!43232 (_ BitVec 32) List!14659) Bool)

(assert (=> b!795529 (= res!540051 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14656))))

(declare-fun b!795530 () Bool)

(declare-fun res!540047 () Bool)

(assert (=> b!795530 (=> (not res!540047) (not e!441536))))

(declare-fun arrayContainsKey!0 (array!43232 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795530 (= res!540047 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun res!540044 () Bool)

(assert (=> start!68442 (=> (not res!540044) (not e!441536))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68442 (= res!540044 (validMask!0 mask!3266))))

(assert (=> start!68442 e!441536))

(assert (=> start!68442 true))

(declare-fun array_inv!16492 (array!43232) Bool)

(assert (=> start!68442 (array_inv!16492 a!3170)))

(declare-fun b!795526 () Bool)

(declare-fun res!540046 () Bool)

(assert (=> b!795526 (=> (not res!540046) (not e!441539))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!795526 (= res!540046 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21117 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20696 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21117 a!3170)) (= (select (arr!20696 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795531 () Bool)

(assert (=> b!795531 (= e!441536 e!441539)))

(declare-fun res!540045 () Bool)

(assert (=> b!795531 (=> (not res!540045) (not e!441539))))

(declare-datatypes ((SeekEntryResult!8287 0))(
  ( (MissingZero!8287 (index!35516 (_ BitVec 32))) (Found!8287 (index!35517 (_ BitVec 32))) (Intermediate!8287 (undefined!9099 Bool) (index!35518 (_ BitVec 32)) (x!66429 (_ BitVec 32))) (Undefined!8287) (MissingVacant!8287 (index!35519 (_ BitVec 32))) )
))
(declare-fun lt!354618 () SeekEntryResult!8287)

(assert (=> b!795531 (= res!540045 (or (= lt!354618 (MissingZero!8287 i!1163)) (= lt!354618 (MissingVacant!8287 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43232 (_ BitVec 32)) SeekEntryResult!8287)

(assert (=> b!795531 (= lt!354618 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!795532 () Bool)

(declare-fun e!441537 () Bool)

(assert (=> b!795532 (= e!441537 false)))

(declare-fun lt!354617 () SeekEntryResult!8287)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43232 (_ BitVec 32)) SeekEntryResult!8287)

(assert (=> b!795532 (= lt!354617 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20696 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!354616 () SeekEntryResult!8287)

(assert (=> b!795532 (= lt!354616 (seekEntryOrOpen!0 (select (arr!20696 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!795533 () Bool)

(declare-fun res!540048 () Bool)

(assert (=> b!795533 (=> (not res!540048) (not e!441536))))

(assert (=> b!795533 (= res!540048 (and (= (size!21117 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21117 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21117 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795534 () Bool)

(assert (=> b!795534 (= e!441539 e!441537)))

(declare-fun res!540053 () Bool)

(assert (=> b!795534 (=> (not res!540053) (not e!441537))))

(declare-fun lt!354620 () (_ BitVec 64))

(declare-fun lt!354619 () array!43232)

(assert (=> b!795534 (= res!540053 (= (seekEntryOrOpen!0 lt!354620 lt!354619 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354620 lt!354619 mask!3266)))))

(assert (=> b!795534 (= lt!354620 (select (store (arr!20696 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!795534 (= lt!354619 (array!43233 (store (arr!20696 a!3170) i!1163 k!2044) (size!21117 a!3170)))))

(assert (= (and start!68442 res!540044) b!795533))

(assert (= (and b!795533 res!540048) b!795527))

(assert (= (and b!795527 res!540050) b!795525))

(assert (= (and b!795525 res!540049) b!795530))

(assert (= (and b!795530 res!540047) b!795531))

(assert (= (and b!795531 res!540045) b!795528))

(assert (= (and b!795528 res!540052) b!795529))

(assert (= (and b!795529 res!540051) b!795526))

(assert (= (and b!795526 res!540046) b!795534))

(assert (= (and b!795534 res!540053) b!795532))

(declare-fun m!736177 () Bool)

(assert (=> b!795527 m!736177))

(assert (=> b!795527 m!736177))

(declare-fun m!736179 () Bool)

(assert (=> b!795527 m!736179))

(declare-fun m!736181 () Bool)

(assert (=> b!795526 m!736181))

(declare-fun m!736183 () Bool)

(assert (=> b!795526 m!736183))

(declare-fun m!736185 () Bool)

(assert (=> b!795525 m!736185))

(declare-fun m!736187 () Bool)

(assert (=> b!795529 m!736187))

(assert (=> b!795532 m!736177))

(assert (=> b!795532 m!736177))

(declare-fun m!736189 () Bool)

(assert (=> b!795532 m!736189))

(assert (=> b!795532 m!736177))

(declare-fun m!736191 () Bool)

(assert (=> b!795532 m!736191))

(declare-fun m!736193 () Bool)

(assert (=> b!795534 m!736193))

(declare-fun m!736195 () Bool)

(assert (=> b!795534 m!736195))

(declare-fun m!736197 () Bool)

(assert (=> b!795534 m!736197))

(declare-fun m!736199 () Bool)

(assert (=> b!795534 m!736199))

(declare-fun m!736201 () Bool)

(assert (=> b!795530 m!736201))

(declare-fun m!736203 () Bool)

(assert (=> b!795528 m!736203))

(declare-fun m!736205 () Bool)

(assert (=> start!68442 m!736205))

(declare-fun m!736207 () Bool)

(assert (=> start!68442 m!736207))

(declare-fun m!736209 () Bool)

(assert (=> b!795531 m!736209))

(push 1)

