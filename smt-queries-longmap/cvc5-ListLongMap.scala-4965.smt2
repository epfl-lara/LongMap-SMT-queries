; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68300 () Bool)

(assert start!68300)

(declare-fun res!537966 () Bool)

(declare-fun e!440763 () Bool)

(assert (=> start!68300 (=> (not res!537966) (not e!440763))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68300 (= res!537966 (validMask!0 mask!3266))))

(assert (=> start!68300 e!440763))

(assert (=> start!68300 true))

(declare-datatypes ((array!43090 0))(
  ( (array!43091 (arr!20625 (Array (_ BitVec 32) (_ BitVec 64))) (size!21046 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43090)

(declare-fun array_inv!16421 (array!43090) Bool)

(assert (=> start!68300 (array_inv!16421 a!3170)))

(declare-fun b!793447 () Bool)

(declare-fun res!537972 () Bool)

(assert (=> b!793447 (=> (not res!537972) (not e!440763))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!793447 (= res!537972 (and (= (size!21046 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21046 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21046 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793448 () Bool)

(declare-fun res!537968 () Bool)

(assert (=> b!793448 (=> (not res!537968) (not e!440763))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43090 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793448 (= res!537968 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793449 () Bool)

(declare-fun res!537970 () Bool)

(assert (=> b!793449 (=> (not res!537970) (not e!440763))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793449 (= res!537970 (validKeyInArray!0 (select (arr!20625 a!3170) j!153)))))

(declare-fun b!793450 () Bool)

(declare-fun res!537974 () Bool)

(declare-fun e!440764 () Bool)

(assert (=> b!793450 (=> (not res!537974) (not e!440764))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43090 (_ BitVec 32)) Bool)

(assert (=> b!793450 (= res!537974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!793451 () Bool)

(declare-fun res!537973 () Bool)

(assert (=> b!793451 (=> (not res!537973) (not e!440764))))

(declare-datatypes ((List!14588 0))(
  ( (Nil!14585) (Cons!14584 (h!15713 (_ BitVec 64)) (t!20903 List!14588)) )
))
(declare-fun arrayNoDuplicates!0 (array!43090 (_ BitVec 32) List!14588) Bool)

(assert (=> b!793451 (= res!537973 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14585))))

(declare-fun b!793452 () Bool)

(assert (=> b!793452 (= e!440763 e!440764)))

(declare-fun res!537969 () Bool)

(assert (=> b!793452 (=> (not res!537969) (not e!440764))))

(declare-datatypes ((SeekEntryResult!8216 0))(
  ( (MissingZero!8216 (index!35232 (_ BitVec 32))) (Found!8216 (index!35233 (_ BitVec 32))) (Intermediate!8216 (undefined!9028 Bool) (index!35234 (_ BitVec 32)) (x!66174 (_ BitVec 32))) (Undefined!8216) (MissingVacant!8216 (index!35235 (_ BitVec 32))) )
))
(declare-fun lt!353705 () SeekEntryResult!8216)

(assert (=> b!793452 (= res!537969 (or (= lt!353705 (MissingZero!8216 i!1163)) (= lt!353705 (MissingVacant!8216 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43090 (_ BitVec 32)) SeekEntryResult!8216)

(assert (=> b!793452 (= lt!353705 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!793453 () Bool)

(declare-fun res!537967 () Bool)

(assert (=> b!793453 (=> (not res!537967) (not e!440764))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!793453 (= res!537967 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21046 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20625 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21046 a!3170)) (= (select (arr!20625 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23)) (bvsge mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvslt vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (= (select (store (arr!20625 a!3170) i!1163 k!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!793454 () Bool)

(declare-fun res!537971 () Bool)

(assert (=> b!793454 (=> (not res!537971) (not e!440763))))

(assert (=> b!793454 (= res!537971 (validKeyInArray!0 k!2044))))

(declare-fun b!793455 () Bool)

(assert (=> b!793455 (= e!440764 (not (validKeyInArray!0 (select (store (arr!20625 a!3170) i!1163 k!2044) j!153))))))

(assert (= (and start!68300 res!537966) b!793447))

(assert (= (and b!793447 res!537972) b!793449))

(assert (= (and b!793449 res!537970) b!793454))

(assert (= (and b!793454 res!537971) b!793448))

(assert (= (and b!793448 res!537968) b!793452))

(assert (= (and b!793452 res!537969) b!793450))

(assert (= (and b!793450 res!537974) b!793451))

(assert (= (and b!793451 res!537973) b!793453))

(assert (= (and b!793453 res!537967) b!793455))

(declare-fun m!733913 () Bool)

(assert (=> start!68300 m!733913))

(declare-fun m!733915 () Bool)

(assert (=> start!68300 m!733915))

(declare-fun m!733917 () Bool)

(assert (=> b!793453 m!733917))

(declare-fun m!733919 () Bool)

(assert (=> b!793453 m!733919))

(declare-fun m!733921 () Bool)

(assert (=> b!793453 m!733921))

(declare-fun m!733923 () Bool)

(assert (=> b!793453 m!733923))

(declare-fun m!733925 () Bool)

(assert (=> b!793451 m!733925))

(declare-fun m!733927 () Bool)

(assert (=> b!793449 m!733927))

(assert (=> b!793449 m!733927))

(declare-fun m!733929 () Bool)

(assert (=> b!793449 m!733929))

(declare-fun m!733931 () Bool)

(assert (=> b!793454 m!733931))

(assert (=> b!793455 m!733921))

(declare-fun m!733933 () Bool)

(assert (=> b!793455 m!733933))

(assert (=> b!793455 m!733933))

(declare-fun m!733935 () Bool)

(assert (=> b!793455 m!733935))

(declare-fun m!733937 () Bool)

(assert (=> b!793452 m!733937))

(declare-fun m!733939 () Bool)

(assert (=> b!793448 m!733939))

(declare-fun m!733941 () Bool)

(assert (=> b!793450 m!733941))

(push 1)

(assert (not b!793449))

(assert (not b!793448))

(assert (not b!793452))

(assert (not b!793451))

(assert (not b!793454))

(assert (not start!68300))

(assert (not b!793455))

(assert (not b!793450))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

