; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68430 () Bool)

(assert start!68430)

(declare-fun b!795345 () Bool)

(declare-fun e!441464 () Bool)

(assert (=> b!795345 (= e!441464 false)))

(declare-datatypes ((SeekEntryResult!8281 0))(
  ( (MissingZero!8281 (index!35492 (_ BitVec 32))) (Found!8281 (index!35493 (_ BitVec 32))) (Intermediate!8281 (undefined!9093 Bool) (index!35494 (_ BitVec 32)) (x!66407 (_ BitVec 32))) (Undefined!8281) (MissingVacant!8281 (index!35495 (_ BitVec 32))) )
))
(declare-fun lt!354529 () SeekEntryResult!8281)

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43220 0))(
  ( (array!43221 (arr!20690 (Array (_ BitVec 32) (_ BitVec 64))) (size!21111 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43220)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43220 (_ BitVec 32)) SeekEntryResult!8281)

(assert (=> b!795345 (= lt!354529 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20690 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!354527 () SeekEntryResult!8281)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43220 (_ BitVec 32)) SeekEntryResult!8281)

(assert (=> b!795345 (= lt!354527 (seekEntryOrOpen!0 (select (arr!20690 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!795346 () Bool)

(declare-fun res!539868 () Bool)

(declare-fun e!441467 () Bool)

(assert (=> b!795346 (=> (not res!539868) (not e!441467))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795346 (= res!539868 (validKeyInArray!0 k!2044))))

(declare-fun b!795347 () Bool)

(declare-fun e!441465 () Bool)

(assert (=> b!795347 (= e!441465 e!441464)))

(declare-fun res!539871 () Bool)

(assert (=> b!795347 (=> (not res!539871) (not e!441464))))

(declare-fun lt!354526 () array!43220)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!354530 () (_ BitVec 64))

(assert (=> b!795347 (= res!539871 (= (seekEntryOrOpen!0 lt!354530 lt!354526 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354530 lt!354526 mask!3266)))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!795347 (= lt!354530 (select (store (arr!20690 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!795347 (= lt!354526 (array!43221 (store (arr!20690 a!3170) i!1163 k!2044) (size!21111 a!3170)))))

(declare-fun b!795348 () Bool)

(declare-fun res!539867 () Bool)

(assert (=> b!795348 (=> (not res!539867) (not e!441467))))

(assert (=> b!795348 (= res!539867 (validKeyInArray!0 (select (arr!20690 a!3170) j!153)))))

(declare-fun b!795350 () Bool)

(declare-fun res!539866 () Bool)

(assert (=> b!795350 (=> (not res!539866) (not e!441465))))

(declare-datatypes ((List!14653 0))(
  ( (Nil!14650) (Cons!14649 (h!15778 (_ BitVec 64)) (t!20968 List!14653)) )
))
(declare-fun arrayNoDuplicates!0 (array!43220 (_ BitVec 32) List!14653) Bool)

(assert (=> b!795350 (= res!539866 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14650))))

(declare-fun b!795351 () Bool)

(declare-fun res!539869 () Bool)

(assert (=> b!795351 (=> (not res!539869) (not e!441467))))

(assert (=> b!795351 (= res!539869 (and (= (size!21111 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21111 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21111 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795352 () Bool)

(assert (=> b!795352 (= e!441467 e!441465)))

(declare-fun res!539864 () Bool)

(assert (=> b!795352 (=> (not res!539864) (not e!441465))))

(declare-fun lt!354528 () SeekEntryResult!8281)

(assert (=> b!795352 (= res!539864 (or (= lt!354528 (MissingZero!8281 i!1163)) (= lt!354528 (MissingVacant!8281 i!1163))))))

(assert (=> b!795352 (= lt!354528 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!795353 () Bool)

(declare-fun res!539865 () Bool)

(assert (=> b!795353 (=> (not res!539865) (not e!441465))))

(assert (=> b!795353 (= res!539865 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21111 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20690 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21111 a!3170)) (= (select (arr!20690 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795354 () Bool)

(declare-fun res!539872 () Bool)

(assert (=> b!795354 (=> (not res!539872) (not e!441467))))

(declare-fun arrayContainsKey!0 (array!43220 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795354 (= res!539872 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun res!539870 () Bool)

(assert (=> start!68430 (=> (not res!539870) (not e!441467))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68430 (= res!539870 (validMask!0 mask!3266))))

(assert (=> start!68430 e!441467))

(assert (=> start!68430 true))

(declare-fun array_inv!16486 (array!43220) Bool)

(assert (=> start!68430 (array_inv!16486 a!3170)))

(declare-fun b!795349 () Bool)

(declare-fun res!539873 () Bool)

(assert (=> b!795349 (=> (not res!539873) (not e!441465))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43220 (_ BitVec 32)) Bool)

(assert (=> b!795349 (= res!539873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68430 res!539870) b!795351))

(assert (= (and b!795351 res!539869) b!795348))

(assert (= (and b!795348 res!539867) b!795346))

(assert (= (and b!795346 res!539868) b!795354))

(assert (= (and b!795354 res!539872) b!795352))

(assert (= (and b!795352 res!539864) b!795349))

(assert (= (and b!795349 res!539873) b!795350))

(assert (= (and b!795350 res!539866) b!795353))

(assert (= (and b!795353 res!539865) b!795347))

(assert (= (and b!795347 res!539871) b!795345))

(declare-fun m!735967 () Bool)

(assert (=> b!795349 m!735967))

(declare-fun m!735969 () Bool)

(assert (=> b!795354 m!735969))

(declare-fun m!735971 () Bool)

(assert (=> b!795346 m!735971))

(declare-fun m!735973 () Bool)

(assert (=> b!795347 m!735973))

(declare-fun m!735975 () Bool)

(assert (=> b!795347 m!735975))

(declare-fun m!735977 () Bool)

(assert (=> b!795347 m!735977))

(declare-fun m!735979 () Bool)

(assert (=> b!795347 m!735979))

(declare-fun m!735981 () Bool)

(assert (=> b!795352 m!735981))

(declare-fun m!735983 () Bool)

(assert (=> start!68430 m!735983))

(declare-fun m!735985 () Bool)

(assert (=> start!68430 m!735985))

(declare-fun m!735987 () Bool)

(assert (=> b!795345 m!735987))

(assert (=> b!795345 m!735987))

(declare-fun m!735989 () Bool)

(assert (=> b!795345 m!735989))

(assert (=> b!795345 m!735987))

(declare-fun m!735991 () Bool)

(assert (=> b!795345 m!735991))

(declare-fun m!735993 () Bool)

(assert (=> b!795353 m!735993))

(declare-fun m!735995 () Bool)

(assert (=> b!795353 m!735995))

(declare-fun m!735997 () Bool)

(assert (=> b!795350 m!735997))

(assert (=> b!795348 m!735987))

(assert (=> b!795348 m!735987))

(declare-fun m!735999 () Bool)

(assert (=> b!795348 m!735999))

(push 1)

(assert (not b!795354))

(assert (not b!795346))

(assert (not b!795350))

