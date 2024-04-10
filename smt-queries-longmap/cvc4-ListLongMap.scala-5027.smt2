; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68676 () Bool)

(assert start!68676)

(declare-fun b!799509 () Bool)

(declare-fun res!544030 () Bool)

(declare-fun e!443361 () Bool)

(assert (=> b!799509 (=> (not res!544030) (not e!443361))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!799509 (= res!544030 (validKeyInArray!0 k!2044))))

(declare-fun b!799510 () Bool)

(declare-fun res!544037 () Bool)

(declare-fun e!443364 () Bool)

(assert (=> b!799510 (=> (not res!544037) (not e!443364))))

(declare-datatypes ((array!43466 0))(
  ( (array!43467 (arr!20813 (Array (_ BitVec 32) (_ BitVec 64))) (size!21234 (_ BitVec 32))) )
))
(declare-fun lt!357040 () array!43466)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!357037 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8404 0))(
  ( (MissingZero!8404 (index!35984 (_ BitVec 32))) (Found!8404 (index!35985 (_ BitVec 32))) (Intermediate!8404 (undefined!9216 Bool) (index!35986 (_ BitVec 32)) (x!66858 (_ BitVec 32))) (Undefined!8404) (MissingVacant!8404 (index!35987 (_ BitVec 32))) )
))
(declare-fun lt!357034 () SeekEntryResult!8404)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!357038 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43466 (_ BitVec 32)) SeekEntryResult!8404)

(assert (=> b!799510 (= res!544037 (= lt!357034 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357038 vacantAfter!23 lt!357037 lt!357040 mask!3266)))))

(declare-fun b!799511 () Bool)

(assert (=> b!799511 (= e!443364 false)))

(declare-fun a!3170 () array!43466)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun lt!357035 () SeekEntryResult!8404)

(assert (=> b!799511 (= lt!357035 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357038 vacantBefore!23 (select (arr!20813 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799512 () Bool)

(declare-fun res!544035 () Bool)

(declare-fun e!443366 () Bool)

(assert (=> b!799512 (=> (not res!544035) (not e!443366))))

(declare-datatypes ((List!14776 0))(
  ( (Nil!14773) (Cons!14772 (h!15901 (_ BitVec 64)) (t!21091 List!14776)) )
))
(declare-fun arrayNoDuplicates!0 (array!43466 (_ BitVec 32) List!14776) Bool)

(assert (=> b!799512 (= res!544035 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14773))))

(declare-fun b!799513 () Bool)

(declare-fun res!544033 () Bool)

(assert (=> b!799513 (=> (not res!544033) (not e!443366))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43466 (_ BitVec 32)) Bool)

(assert (=> b!799513 (= res!544033 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!799514 () Bool)

(declare-fun e!443362 () Bool)

(assert (=> b!799514 (= e!443366 e!443362)))

(declare-fun res!544036 () Bool)

(assert (=> b!799514 (=> (not res!544036) (not e!443362))))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!799514 (= res!544036 (= lt!357034 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357037 lt!357040 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43466 (_ BitVec 32)) SeekEntryResult!8404)

(assert (=> b!799514 (= lt!357034 (seekEntryOrOpen!0 lt!357037 lt!357040 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!799514 (= lt!357037 (select (store (arr!20813 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!799514 (= lt!357040 (array!43467 (store (arr!20813 a!3170) i!1163 k!2044) (size!21234 a!3170)))))

(declare-fun b!799515 () Bool)

(declare-fun res!544031 () Bool)

(assert (=> b!799515 (=> (not res!544031) (not e!443361))))

(assert (=> b!799515 (= res!544031 (validKeyInArray!0 (select (arr!20813 a!3170) j!153)))))

(declare-fun b!799516 () Bool)

(declare-fun res!544032 () Bool)

(assert (=> b!799516 (=> (not res!544032) (not e!443361))))

(declare-fun arrayContainsKey!0 (array!43466 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!799516 (= res!544032 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!799517 () Bool)

(declare-fun res!544034 () Bool)

(assert (=> b!799517 (=> (not res!544034) (not e!443366))))

(assert (=> b!799517 (= res!544034 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21234 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20813 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21234 a!3170)) (= (select (arr!20813 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!799518 () Bool)

(declare-fun res!544029 () Bool)

(assert (=> b!799518 (=> (not res!544029) (not e!443361))))

(assert (=> b!799518 (= res!544029 (and (= (size!21234 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21234 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21234 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!799519 () Bool)

(declare-fun e!443363 () Bool)

(assert (=> b!799519 (= e!443363 e!443364)))

(declare-fun res!544039 () Bool)

(assert (=> b!799519 (=> (not res!544039) (not e!443364))))

(assert (=> b!799519 (= res!544039 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357038 #b00000000000000000000000000000000) (bvslt lt!357038 (size!21234 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!799519 (= lt!357038 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!799520 () Bool)

(assert (=> b!799520 (= e!443362 e!443363)))

(declare-fun res!544038 () Bool)

(assert (=> b!799520 (=> (not res!544038) (not e!443363))))

(declare-fun lt!357041 () SeekEntryResult!8404)

(declare-fun lt!357039 () SeekEntryResult!8404)

(assert (=> b!799520 (= res!544038 (and (= lt!357041 lt!357039) (= lt!357039 (Found!8404 j!153)) (not (= (select (arr!20813 a!3170) index!1236) (select (arr!20813 a!3170) j!153)))))))

(assert (=> b!799520 (= lt!357039 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20813 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!799520 (= lt!357041 (seekEntryOrOpen!0 (select (arr!20813 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799521 () Bool)

(assert (=> b!799521 (= e!443361 e!443366)))

(declare-fun res!544028 () Bool)

(assert (=> b!799521 (=> (not res!544028) (not e!443366))))

(declare-fun lt!357036 () SeekEntryResult!8404)

(assert (=> b!799521 (= res!544028 (or (= lt!357036 (MissingZero!8404 i!1163)) (= lt!357036 (MissingVacant!8404 i!1163))))))

(assert (=> b!799521 (= lt!357036 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun res!544040 () Bool)

(assert (=> start!68676 (=> (not res!544040) (not e!443361))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68676 (= res!544040 (validMask!0 mask!3266))))

(assert (=> start!68676 e!443361))

(assert (=> start!68676 true))

(declare-fun array_inv!16609 (array!43466) Bool)

(assert (=> start!68676 (array_inv!16609 a!3170)))

(assert (= (and start!68676 res!544040) b!799518))

(assert (= (and b!799518 res!544029) b!799515))

(assert (= (and b!799515 res!544031) b!799509))

(assert (= (and b!799509 res!544030) b!799516))

(assert (= (and b!799516 res!544032) b!799521))

(assert (= (and b!799521 res!544028) b!799513))

(assert (= (and b!799513 res!544033) b!799512))

(assert (= (and b!799512 res!544035) b!799517))

(assert (= (and b!799517 res!544034) b!799514))

(assert (= (and b!799514 res!544036) b!799520))

(assert (= (and b!799520 res!544038) b!799519))

(assert (= (and b!799519 res!544039) b!799510))

(assert (= (and b!799510 res!544037) b!799511))

(declare-fun m!740525 () Bool)

(assert (=> b!799513 m!740525))

(declare-fun m!740527 () Bool)

(assert (=> b!799512 m!740527))

(declare-fun m!740529 () Bool)

(assert (=> b!799517 m!740529))

(declare-fun m!740531 () Bool)

(assert (=> b!799517 m!740531))

(declare-fun m!740533 () Bool)

(assert (=> b!799511 m!740533))

(assert (=> b!799511 m!740533))

(declare-fun m!740535 () Bool)

(assert (=> b!799511 m!740535))

(declare-fun m!740537 () Bool)

(assert (=> b!799520 m!740537))

(assert (=> b!799520 m!740533))

(assert (=> b!799520 m!740533))

(declare-fun m!740539 () Bool)

(assert (=> b!799520 m!740539))

(assert (=> b!799520 m!740533))

(declare-fun m!740541 () Bool)

(assert (=> b!799520 m!740541))

(declare-fun m!740543 () Bool)

(assert (=> b!799519 m!740543))

(declare-fun m!740545 () Bool)

(assert (=> start!68676 m!740545))

(declare-fun m!740547 () Bool)

(assert (=> start!68676 m!740547))

(declare-fun m!740549 () Bool)

(assert (=> b!799510 m!740549))

(declare-fun m!740551 () Bool)

(assert (=> b!799509 m!740551))

(declare-fun m!740553 () Bool)

(assert (=> b!799514 m!740553))

(declare-fun m!740555 () Bool)

(assert (=> b!799514 m!740555))

(declare-fun m!740557 () Bool)

(assert (=> b!799514 m!740557))

(declare-fun m!740559 () Bool)

(assert (=> b!799514 m!740559))

(assert (=> b!799515 m!740533))

(assert (=> b!799515 m!740533))

(declare-fun m!740561 () Bool)

(assert (=> b!799515 m!740561))

(declare-fun m!740563 () Bool)

(assert (=> b!799516 m!740563))

(declare-fun m!740565 () Bool)

(assert (=> b!799521 m!740565))

(push 1)

