; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68514 () Bool)

(assert start!68514)

(declare-fun b!795378 () Bool)

(declare-fun res!539523 () Bool)

(declare-fun e!441646 () Bool)

(assert (=> b!795378 (=> (not res!539523) (not e!441646))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43178 0))(
  ( (array!43179 (arr!20665 (Array (_ BitVec 32) (_ BitVec 64))) (size!21085 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43178)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!795378 (= res!539523 (and (= (size!21085 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21085 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21085 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795379 () Bool)

(declare-fun res!539531 () Bool)

(assert (=> b!795379 (=> (not res!539531) (not e!441646))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795379 (= res!539531 (validKeyInArray!0 (select (arr!20665 a!3170) j!153)))))

(declare-fun b!795380 () Bool)

(declare-fun res!539530 () Bool)

(assert (=> b!795380 (=> (not res!539530) (not e!441646))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!795380 (= res!539530 (validKeyInArray!0 k0!2044))))

(declare-fun b!795381 () Bool)

(declare-fun res!539528 () Bool)

(declare-fun e!441647 () Bool)

(assert (=> b!795381 (=> (not res!539528) (not e!441647))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43178 (_ BitVec 32)) Bool)

(assert (=> b!795381 (= res!539528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!795382 () Bool)

(declare-fun res!539532 () Bool)

(assert (=> b!795382 (=> (not res!539532) (not e!441646))))

(declare-fun arrayContainsKey!0 (array!43178 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795382 (= res!539532 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!795383 () Bool)

(declare-fun res!539524 () Bool)

(assert (=> b!795383 (=> (not res!539524) (not e!441647))))

(declare-datatypes ((List!14535 0))(
  ( (Nil!14532) (Cons!14531 (h!15666 (_ BitVec 64)) (t!20842 List!14535)) )
))
(declare-fun arrayNoDuplicates!0 (array!43178 (_ BitVec 32) List!14535) Bool)

(assert (=> b!795383 (= res!539524 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14532))))

(declare-fun res!539527 () Bool)

(assert (=> start!68514 (=> (not res!539527) (not e!441646))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68514 (= res!539527 (validMask!0 mask!3266))))

(assert (=> start!68514 e!441646))

(assert (=> start!68514 true))

(declare-fun array_inv!16524 (array!43178) Bool)

(assert (=> start!68514 (array_inv!16524 a!3170)))

(declare-fun b!795384 () Bool)

(declare-fun res!539526 () Bool)

(assert (=> b!795384 (=> (not res!539526) (not e!441647))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!795384 (= res!539526 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21085 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20665 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21085 a!3170)) (= (select (arr!20665 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795385 () Bool)

(declare-fun e!441649 () Bool)

(assert (=> b!795385 (= e!441649 false)))

(declare-datatypes ((SeekEntryResult!8212 0))(
  ( (MissingZero!8212 (index!35216 (_ BitVec 32))) (Found!8212 (index!35217 (_ BitVec 32))) (Intermediate!8212 (undefined!9024 Bool) (index!35218 (_ BitVec 32)) (x!66301 (_ BitVec 32))) (Undefined!8212) (MissingVacant!8212 (index!35219 (_ BitVec 32))) )
))
(declare-fun lt!354538 () SeekEntryResult!8212)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43178 (_ BitVec 32)) SeekEntryResult!8212)

(assert (=> b!795385 (= lt!354538 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20665 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!354534 () SeekEntryResult!8212)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43178 (_ BitVec 32)) SeekEntryResult!8212)

(assert (=> b!795385 (= lt!354534 (seekEntryOrOpen!0 (select (arr!20665 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!795386 () Bool)

(assert (=> b!795386 (= e!441647 e!441649)))

(declare-fun res!539525 () Bool)

(assert (=> b!795386 (=> (not res!539525) (not e!441649))))

(declare-fun lt!354536 () (_ BitVec 64))

(declare-fun lt!354535 () array!43178)

(assert (=> b!795386 (= res!539525 (= (seekEntryOrOpen!0 lt!354536 lt!354535 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354536 lt!354535 mask!3266)))))

(assert (=> b!795386 (= lt!354536 (select (store (arr!20665 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!795386 (= lt!354535 (array!43179 (store (arr!20665 a!3170) i!1163 k0!2044) (size!21085 a!3170)))))

(declare-fun b!795387 () Bool)

(assert (=> b!795387 (= e!441646 e!441647)))

(declare-fun res!539529 () Bool)

(assert (=> b!795387 (=> (not res!539529) (not e!441647))))

(declare-fun lt!354537 () SeekEntryResult!8212)

(assert (=> b!795387 (= res!539529 (or (= lt!354537 (MissingZero!8212 i!1163)) (= lt!354537 (MissingVacant!8212 i!1163))))))

(assert (=> b!795387 (= lt!354537 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(assert (= (and start!68514 res!539527) b!795378))

(assert (= (and b!795378 res!539523) b!795379))

(assert (= (and b!795379 res!539531) b!795380))

(assert (= (and b!795380 res!539530) b!795382))

(assert (= (and b!795382 res!539532) b!795387))

(assert (= (and b!795387 res!539529) b!795381))

(assert (= (and b!795381 res!539528) b!795383))

(assert (= (and b!795383 res!539524) b!795384))

(assert (= (and b!795384 res!539526) b!795386))

(assert (= (and b!795386 res!539525) b!795385))

(declare-fun m!736367 () Bool)

(assert (=> b!795386 m!736367))

(declare-fun m!736369 () Bool)

(assert (=> b!795386 m!736369))

(declare-fun m!736371 () Bool)

(assert (=> b!795386 m!736371))

(declare-fun m!736373 () Bool)

(assert (=> b!795386 m!736373))

(declare-fun m!736375 () Bool)

(assert (=> b!795381 m!736375))

(declare-fun m!736377 () Bool)

(assert (=> b!795384 m!736377))

(declare-fun m!736379 () Bool)

(assert (=> b!795384 m!736379))

(declare-fun m!736381 () Bool)

(assert (=> b!795383 m!736381))

(declare-fun m!736383 () Bool)

(assert (=> b!795385 m!736383))

(assert (=> b!795385 m!736383))

(declare-fun m!736385 () Bool)

(assert (=> b!795385 m!736385))

(assert (=> b!795385 m!736383))

(declare-fun m!736387 () Bool)

(assert (=> b!795385 m!736387))

(declare-fun m!736389 () Bool)

(assert (=> b!795387 m!736389))

(assert (=> b!795379 m!736383))

(assert (=> b!795379 m!736383))

(declare-fun m!736391 () Bool)

(assert (=> b!795379 m!736391))

(declare-fun m!736393 () Bool)

(assert (=> b!795382 m!736393))

(declare-fun m!736395 () Bool)

(assert (=> b!795380 m!736395))

(declare-fun m!736397 () Bool)

(assert (=> start!68514 m!736397))

(declare-fun m!736399 () Bool)

(assert (=> start!68514 m!736399))

(check-sat (not b!795380) (not b!795381) (not b!795386) (not start!68514) (not b!795385) (not b!795383) (not b!795379) (not b!795382) (not b!795387))
(check-sat)
