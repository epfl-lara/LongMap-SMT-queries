; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68558 () Bool)

(assert start!68558)

(declare-fun b!797440 () Bool)

(declare-fun res!541968 () Bool)

(declare-fun e!442412 () Bool)

(assert (=> b!797440 (=> (not res!541968) (not e!442412))))

(declare-datatypes ((array!43348 0))(
  ( (array!43349 (arr!20754 (Array (_ BitVec 32) (_ BitVec 64))) (size!21175 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43348)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43348 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797440 (= res!541968 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!797441 () Bool)

(declare-fun e!442410 () Bool)

(declare-fun e!442407 () Bool)

(assert (=> b!797441 (= e!442410 e!442407)))

(declare-fun res!541966 () Bool)

(assert (=> b!797441 (=> (not res!541966) (not e!442407))))

(declare-datatypes ((SeekEntryResult!8345 0))(
  ( (MissingZero!8345 (index!35748 (_ BitVec 32))) (Found!8345 (index!35749 (_ BitVec 32))) (Intermediate!8345 (undefined!9157 Bool) (index!35750 (_ BitVec 32)) (x!66647 (_ BitVec 32))) (Undefined!8345) (MissingVacant!8345 (index!35751 (_ BitVec 32))) )
))
(declare-fun lt!355771 () SeekEntryResult!8345)

(declare-fun lt!355772 () SeekEntryResult!8345)

(assert (=> b!797441 (= res!541966 (= lt!355771 lt!355772))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!355778 () (_ BitVec 64))

(declare-fun lt!355776 () array!43348)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43348 (_ BitVec 32)) SeekEntryResult!8345)

(assert (=> b!797441 (= lt!355772 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355778 lt!355776 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43348 (_ BitVec 32)) SeekEntryResult!8345)

(assert (=> b!797441 (= lt!355771 (seekEntryOrOpen!0 lt!355778 lt!355776 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!797441 (= lt!355778 (select (store (arr!20754 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!797441 (= lt!355776 (array!43349 (store (arr!20754 a!3170) i!1163 k!2044) (size!21175 a!3170)))))

(declare-fun b!797442 () Bool)

(assert (=> b!797442 (= e!442412 e!442410)))

(declare-fun res!541960 () Bool)

(assert (=> b!797442 (=> (not res!541960) (not e!442410))))

(declare-fun lt!355775 () SeekEntryResult!8345)

(assert (=> b!797442 (= res!541960 (or (= lt!355775 (MissingZero!8345 i!1163)) (= lt!355775 (MissingVacant!8345 i!1163))))))

(assert (=> b!797442 (= lt!355775 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!797443 () Bool)

(declare-fun e!442409 () Bool)

(assert (=> b!797443 (= e!442407 e!442409)))

(declare-fun res!541961 () Bool)

(assert (=> b!797443 (=> (not res!541961) (not e!442409))))

(declare-fun lt!355777 () SeekEntryResult!8345)

(declare-fun lt!355773 () SeekEntryResult!8345)

(assert (=> b!797443 (= res!541961 (= lt!355777 lt!355773))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!797443 (= lt!355773 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20754 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!797443 (= lt!355777 (seekEntryOrOpen!0 (select (arr!20754 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!797444 () Bool)

(declare-fun res!541969 () Bool)

(assert (=> b!797444 (=> (not res!541969) (not e!442410))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43348 (_ BitVec 32)) Bool)

(assert (=> b!797444 (= res!541969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!541962 () Bool)

(assert (=> start!68558 (=> (not res!541962) (not e!442412))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68558 (= res!541962 (validMask!0 mask!3266))))

(assert (=> start!68558 e!442412))

(assert (=> start!68558 true))

(declare-fun array_inv!16550 (array!43348) Bool)

(assert (=> start!68558 (array_inv!16550 a!3170)))

(declare-fun b!797445 () Bool)

(declare-fun res!541959 () Bool)

(assert (=> b!797445 (=> (not res!541959) (not e!442412))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797445 (= res!541959 (validKeyInArray!0 (select (arr!20754 a!3170) j!153)))))

(declare-fun b!797446 () Bool)

(declare-fun res!541964 () Bool)

(assert (=> b!797446 (=> (not res!541964) (not e!442410))))

(assert (=> b!797446 (= res!541964 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21175 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20754 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21175 a!3170)) (= (select (arr!20754 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!797447 () Bool)

(declare-fun res!541967 () Bool)

(assert (=> b!797447 (=> (not res!541967) (not e!442412))))

(assert (=> b!797447 (= res!541967 (and (= (size!21175 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21175 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21175 a!3170)) (not (= i!1163 j!153))))))

(declare-fun lt!355774 () SeekEntryResult!8345)

(declare-fun b!797448 () Bool)

(declare-fun e!442411 () Bool)

(assert (=> b!797448 (= e!442411 (not (or (not (= lt!355772 lt!355774)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (= (select (store (arr!20754 a!3170) i!1163 k!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!797448 (= lt!355772 (Found!8345 index!1236))))

(declare-fun b!797449 () Bool)

(assert (=> b!797449 (= e!442409 e!442411)))

(declare-fun res!541965 () Bool)

(assert (=> b!797449 (=> (not res!541965) (not e!442411))))

(assert (=> b!797449 (= res!541965 (and (= lt!355773 lt!355774) (= (select (arr!20754 a!3170) index!1236) (select (arr!20754 a!3170) j!153))))))

(assert (=> b!797449 (= lt!355774 (Found!8345 j!153))))

(declare-fun b!797450 () Bool)

(declare-fun res!541970 () Bool)

(assert (=> b!797450 (=> (not res!541970) (not e!442412))))

(assert (=> b!797450 (= res!541970 (validKeyInArray!0 k!2044))))

(declare-fun b!797451 () Bool)

(declare-fun res!541963 () Bool)

(assert (=> b!797451 (=> (not res!541963) (not e!442410))))

(declare-datatypes ((List!14717 0))(
  ( (Nil!14714) (Cons!14713 (h!15842 (_ BitVec 64)) (t!21032 List!14717)) )
))
(declare-fun arrayNoDuplicates!0 (array!43348 (_ BitVec 32) List!14717) Bool)

(assert (=> b!797451 (= res!541963 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14714))))

(assert (= (and start!68558 res!541962) b!797447))

(assert (= (and b!797447 res!541967) b!797445))

(assert (= (and b!797445 res!541959) b!797450))

(assert (= (and b!797450 res!541970) b!797440))

(assert (= (and b!797440 res!541968) b!797442))

(assert (= (and b!797442 res!541960) b!797444))

(assert (= (and b!797444 res!541969) b!797451))

(assert (= (and b!797451 res!541963) b!797446))

(assert (= (and b!797446 res!541964) b!797441))

(assert (= (and b!797441 res!541966) b!797443))

(assert (= (and b!797443 res!541961) b!797449))

(assert (= (and b!797449 res!541965) b!797448))

(declare-fun m!738293 () Bool)

(assert (=> b!797442 m!738293))

(declare-fun m!738295 () Bool)

(assert (=> b!797443 m!738295))

(assert (=> b!797443 m!738295))

(declare-fun m!738297 () Bool)

(assert (=> b!797443 m!738297))

(assert (=> b!797443 m!738295))

(declare-fun m!738299 () Bool)

(assert (=> b!797443 m!738299))

(assert (=> b!797445 m!738295))

(assert (=> b!797445 m!738295))

(declare-fun m!738301 () Bool)

(assert (=> b!797445 m!738301))

(declare-fun m!738303 () Bool)

(assert (=> b!797446 m!738303))

(declare-fun m!738305 () Bool)

(assert (=> b!797446 m!738305))

(declare-fun m!738307 () Bool)

(assert (=> b!797448 m!738307))

(declare-fun m!738309 () Bool)

(assert (=> b!797448 m!738309))

(declare-fun m!738311 () Bool)

(assert (=> b!797449 m!738311))

(assert (=> b!797449 m!738295))

(declare-fun m!738313 () Bool)

(assert (=> b!797444 m!738313))

(declare-fun m!738315 () Bool)

(assert (=> b!797450 m!738315))

(declare-fun m!738317 () Bool)

(assert (=> b!797451 m!738317))

(declare-fun m!738319 () Bool)

(assert (=> b!797440 m!738319))

(declare-fun m!738321 () Bool)

(assert (=> start!68558 m!738321))

(declare-fun m!738323 () Bool)

(assert (=> start!68558 m!738323))

(declare-fun m!738325 () Bool)

(assert (=> b!797441 m!738325))

(declare-fun m!738327 () Bool)

(assert (=> b!797441 m!738327))

(assert (=> b!797441 m!738307))

(declare-fun m!738329 () Bool)

(assert (=> b!797441 m!738329))

(push 1)

