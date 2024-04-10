; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68390 () Bool)

(assert start!68390)

(declare-fun b!794727 () Bool)

(declare-fun res!539252 () Bool)

(declare-fun e!441225 () Bool)

(assert (=> b!794727 (=> (not res!539252) (not e!441225))))

(declare-datatypes ((array!43180 0))(
  ( (array!43181 (arr!20670 (Array (_ BitVec 32) (_ BitVec 64))) (size!21091 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43180)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794727 (= res!539252 (validKeyInArray!0 (select (arr!20670 a!3170) j!153)))))

(declare-fun b!794728 () Bool)

(declare-fun res!539246 () Bool)

(assert (=> b!794728 (=> (not res!539246) (not e!441225))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43180 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794728 (= res!539246 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794729 () Bool)

(declare-fun e!441227 () Bool)

(assert (=> b!794729 (= e!441225 e!441227)))

(declare-fun res!539249 () Bool)

(assert (=> b!794729 (=> (not res!539249) (not e!441227))))

(declare-datatypes ((SeekEntryResult!8261 0))(
  ( (MissingZero!8261 (index!35412 (_ BitVec 32))) (Found!8261 (index!35413 (_ BitVec 32))) (Intermediate!8261 (undefined!9073 Bool) (index!35414 (_ BitVec 32)) (x!66339 (_ BitVec 32))) (Undefined!8261) (MissingVacant!8261 (index!35415 (_ BitVec 32))) )
))
(declare-fun lt!354262 () SeekEntryResult!8261)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!794729 (= res!539249 (or (= lt!354262 (MissingZero!8261 i!1163)) (= lt!354262 (MissingVacant!8261 i!1163))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43180 (_ BitVec 32)) SeekEntryResult!8261)

(assert (=> b!794729 (= lt!354262 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun res!539247 () Bool)

(assert (=> start!68390 (=> (not res!539247) (not e!441225))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68390 (= res!539247 (validMask!0 mask!3266))))

(assert (=> start!68390 e!441225))

(assert (=> start!68390 true))

(declare-fun array_inv!16466 (array!43180) Bool)

(assert (=> start!68390 (array_inv!16466 a!3170)))

(declare-fun b!794730 () Bool)

(declare-fun res!539248 () Bool)

(assert (=> b!794730 (=> (not res!539248) (not e!441227))))

(declare-datatypes ((List!14633 0))(
  ( (Nil!14630) (Cons!14629 (h!15758 (_ BitVec 64)) (t!20948 List!14633)) )
))
(declare-fun arrayNoDuplicates!0 (array!43180 (_ BitVec 32) List!14633) Bool)

(assert (=> b!794730 (= res!539248 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14630))))

(declare-fun b!794731 () Bool)

(declare-fun res!539255 () Bool)

(assert (=> b!794731 (=> (not res!539255) (not e!441227))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43180 (_ BitVec 32)) Bool)

(assert (=> b!794731 (= res!539255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794732 () Bool)

(declare-fun e!441224 () Bool)

(assert (=> b!794732 (= e!441224 false)))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!354264 () SeekEntryResult!8261)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43180 (_ BitVec 32)) SeekEntryResult!8261)

(assert (=> b!794732 (= lt!354264 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20670 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!354265 () SeekEntryResult!8261)

(assert (=> b!794732 (= lt!354265 (seekEntryOrOpen!0 (select (arr!20670 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!794733 () Bool)

(declare-fun res!539250 () Bool)

(assert (=> b!794733 (=> (not res!539250) (not e!441225))))

(assert (=> b!794733 (= res!539250 (validKeyInArray!0 k!2044))))

(declare-fun b!794734 () Bool)

(declare-fun res!539253 () Bool)

(assert (=> b!794734 (=> (not res!539253) (not e!441227))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!794734 (= res!539253 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21091 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20670 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21091 a!3170)) (= (select (arr!20670 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794735 () Bool)

(declare-fun res!539254 () Bool)

(assert (=> b!794735 (=> (not res!539254) (not e!441225))))

(assert (=> b!794735 (= res!539254 (and (= (size!21091 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21091 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21091 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794736 () Bool)

(assert (=> b!794736 (= e!441227 e!441224)))

(declare-fun res!539251 () Bool)

(assert (=> b!794736 (=> (not res!539251) (not e!441224))))

(declare-fun lt!354266 () (_ BitVec 64))

(declare-fun lt!354263 () array!43180)

(assert (=> b!794736 (= res!539251 (= (seekEntryOrOpen!0 lt!354266 lt!354263 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354266 lt!354263 mask!3266)))))

(assert (=> b!794736 (= lt!354266 (select (store (arr!20670 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!794736 (= lt!354263 (array!43181 (store (arr!20670 a!3170) i!1163 k!2044) (size!21091 a!3170)))))

(assert (= (and start!68390 res!539247) b!794735))

(assert (= (and b!794735 res!539254) b!794727))

(assert (= (and b!794727 res!539252) b!794733))

(assert (= (and b!794733 res!539250) b!794728))

(assert (= (and b!794728 res!539246) b!794729))

(assert (= (and b!794729 res!539249) b!794731))

(assert (= (and b!794731 res!539255) b!794730))

(assert (= (and b!794730 res!539248) b!794734))

(assert (= (and b!794734 res!539253) b!794736))

(assert (= (and b!794736 res!539251) b!794732))

(declare-fun m!735287 () Bool)

(assert (=> b!794727 m!735287))

(assert (=> b!794727 m!735287))

(declare-fun m!735289 () Bool)

(assert (=> b!794727 m!735289))

(assert (=> b!794732 m!735287))

(assert (=> b!794732 m!735287))

(declare-fun m!735291 () Bool)

(assert (=> b!794732 m!735291))

(assert (=> b!794732 m!735287))

(declare-fun m!735293 () Bool)

(assert (=> b!794732 m!735293))

(declare-fun m!735295 () Bool)

(assert (=> b!794728 m!735295))

(declare-fun m!735297 () Bool)

(assert (=> b!794731 m!735297))

(declare-fun m!735299 () Bool)

(assert (=> b!794729 m!735299))

(declare-fun m!735301 () Bool)

(assert (=> b!794733 m!735301))

(declare-fun m!735303 () Bool)

(assert (=> start!68390 m!735303))

(declare-fun m!735305 () Bool)

(assert (=> start!68390 m!735305))

(declare-fun m!735307 () Bool)

(assert (=> b!794734 m!735307))

(declare-fun m!735309 () Bool)

(assert (=> b!794734 m!735309))

(declare-fun m!735311 () Bool)

(assert (=> b!794730 m!735311))

(declare-fun m!735313 () Bool)

(assert (=> b!794736 m!735313))

(declare-fun m!735315 () Bool)

(assert (=> b!794736 m!735315))

(declare-fun m!735317 () Bool)

(assert (=> b!794736 m!735317))

(declare-fun m!735319 () Bool)

(assert (=> b!794736 m!735319))

(push 1)

