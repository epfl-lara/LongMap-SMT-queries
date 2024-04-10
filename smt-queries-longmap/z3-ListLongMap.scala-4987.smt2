; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68434 () Bool)

(assert start!68434)

(declare-fun b!795405 () Bool)

(declare-fun res!539928 () Bool)

(declare-fun e!441488 () Bool)

(assert (=> b!795405 (=> (not res!539928) (not e!441488))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795405 (= res!539928 (validKeyInArray!0 k0!2044))))

(declare-fun b!795406 () Bool)

(declare-fun e!441489 () Bool)

(declare-fun e!441490 () Bool)

(assert (=> b!795406 (= e!441489 e!441490)))

(declare-fun res!539926 () Bool)

(assert (=> b!795406 (=> (not res!539926) (not e!441490))))

(declare-fun lt!354559 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43224 0))(
  ( (array!43225 (arr!20692 (Array (_ BitVec 32) (_ BitVec 64))) (size!21113 (_ BitVec 32))) )
))
(declare-fun lt!354556 () array!43224)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8283 0))(
  ( (MissingZero!8283 (index!35500 (_ BitVec 32))) (Found!8283 (index!35501 (_ BitVec 32))) (Intermediate!8283 (undefined!9095 Bool) (index!35502 (_ BitVec 32)) (x!66417 (_ BitVec 32))) (Undefined!8283) (MissingVacant!8283 (index!35503 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43224 (_ BitVec 32)) SeekEntryResult!8283)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43224 (_ BitVec 32)) SeekEntryResult!8283)

(assert (=> b!795406 (= res!539926 (= (seekEntryOrOpen!0 lt!354559 lt!354556 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354559 lt!354556 mask!3266)))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43224)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!795406 (= lt!354559 (select (store (arr!20692 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!795406 (= lt!354556 (array!43225 (store (arr!20692 a!3170) i!1163 k0!2044) (size!21113 a!3170)))))

(declare-fun b!795407 () Bool)

(declare-fun res!539924 () Bool)

(assert (=> b!795407 (=> (not res!539924) (not e!441488))))

(assert (=> b!795407 (= res!539924 (validKeyInArray!0 (select (arr!20692 a!3170) j!153)))))

(declare-fun lt!354557 () SeekEntryResult!8283)

(declare-fun b!795408 () Bool)

(declare-fun lt!354560 () SeekEntryResult!8283)

(assert (=> b!795408 (= e!441490 (and (= lt!354560 lt!354557) (= lt!354557 (Found!8283 j!153)) (= (select (arr!20692 a!3170) index!1236) (select (arr!20692 a!3170) j!153)) (bvslt mask!3266 #b00000000000000000000000000000000)))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!795408 (= lt!354557 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20692 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!795408 (= lt!354560 (seekEntryOrOpen!0 (select (arr!20692 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!539925 () Bool)

(assert (=> start!68434 (=> (not res!539925) (not e!441488))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68434 (= res!539925 (validMask!0 mask!3266))))

(assert (=> start!68434 e!441488))

(assert (=> start!68434 true))

(declare-fun array_inv!16488 (array!43224) Bool)

(assert (=> start!68434 (array_inv!16488 a!3170)))

(declare-fun b!795409 () Bool)

(declare-fun res!539927 () Bool)

(assert (=> b!795409 (=> (not res!539927) (not e!441489))))

(declare-datatypes ((List!14655 0))(
  ( (Nil!14652) (Cons!14651 (h!15780 (_ BitVec 64)) (t!20970 List!14655)) )
))
(declare-fun arrayNoDuplicates!0 (array!43224 (_ BitVec 32) List!14655) Bool)

(assert (=> b!795409 (= res!539927 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14652))))

(declare-fun b!795410 () Bool)

(declare-fun res!539930 () Bool)

(assert (=> b!795410 (=> (not res!539930) (not e!441489))))

(assert (=> b!795410 (= res!539930 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21113 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20692 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21113 a!3170)) (= (select (arr!20692 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795411 () Bool)

(declare-fun res!539931 () Bool)

(assert (=> b!795411 (=> (not res!539931) (not e!441488))))

(assert (=> b!795411 (= res!539931 (and (= (size!21113 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21113 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21113 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795412 () Bool)

(declare-fun res!539932 () Bool)

(assert (=> b!795412 (=> (not res!539932) (not e!441489))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43224 (_ BitVec 32)) Bool)

(assert (=> b!795412 (= res!539932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!795413 () Bool)

(assert (=> b!795413 (= e!441488 e!441489)))

(declare-fun res!539929 () Bool)

(assert (=> b!795413 (=> (not res!539929) (not e!441489))))

(declare-fun lt!354558 () SeekEntryResult!8283)

(assert (=> b!795413 (= res!539929 (or (= lt!354558 (MissingZero!8283 i!1163)) (= lt!354558 (MissingVacant!8283 i!1163))))))

(assert (=> b!795413 (= lt!354558 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!795414 () Bool)

(declare-fun res!539933 () Bool)

(assert (=> b!795414 (=> (not res!539933) (not e!441488))))

(declare-fun arrayContainsKey!0 (array!43224 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795414 (= res!539933 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68434 res!539925) b!795411))

(assert (= (and b!795411 res!539931) b!795407))

(assert (= (and b!795407 res!539924) b!795405))

(assert (= (and b!795405 res!539928) b!795414))

(assert (= (and b!795414 res!539933) b!795413))

(assert (= (and b!795413 res!539929) b!795412))

(assert (= (and b!795412 res!539932) b!795409))

(assert (= (and b!795409 res!539927) b!795410))

(assert (= (and b!795410 res!539930) b!795406))

(assert (= (and b!795406 res!539926) b!795408))

(declare-fun m!736037 () Bool)

(assert (=> b!795414 m!736037))

(declare-fun m!736039 () Bool)

(assert (=> b!795413 m!736039))

(declare-fun m!736041 () Bool)

(assert (=> b!795410 m!736041))

(declare-fun m!736043 () Bool)

(assert (=> b!795410 m!736043))

(declare-fun m!736045 () Bool)

(assert (=> b!795408 m!736045))

(declare-fun m!736047 () Bool)

(assert (=> b!795408 m!736047))

(assert (=> b!795408 m!736047))

(declare-fun m!736049 () Bool)

(assert (=> b!795408 m!736049))

(assert (=> b!795408 m!736047))

(declare-fun m!736051 () Bool)

(assert (=> b!795408 m!736051))

(declare-fun m!736053 () Bool)

(assert (=> b!795405 m!736053))

(declare-fun m!736055 () Bool)

(assert (=> b!795406 m!736055))

(declare-fun m!736057 () Bool)

(assert (=> b!795406 m!736057))

(declare-fun m!736059 () Bool)

(assert (=> b!795406 m!736059))

(declare-fun m!736061 () Bool)

(assert (=> b!795406 m!736061))

(declare-fun m!736063 () Bool)

(assert (=> b!795409 m!736063))

(assert (=> b!795407 m!736047))

(assert (=> b!795407 m!736047))

(declare-fun m!736065 () Bool)

(assert (=> b!795407 m!736065))

(declare-fun m!736067 () Bool)

(assert (=> start!68434 m!736067))

(declare-fun m!736069 () Bool)

(assert (=> start!68434 m!736069))

(declare-fun m!736071 () Bool)

(assert (=> b!795412 m!736071))

(check-sat (not b!795412) (not b!795407) (not start!68434) (not b!795413) (not b!795414) (not b!795406) (not b!795405) (not b!795409) (not b!795408))
(check-sat)
