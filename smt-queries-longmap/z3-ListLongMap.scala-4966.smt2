; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68430 () Bool)

(assert start!68430)

(declare-fun b!794179 () Bool)

(declare-fun e!441213 () Bool)

(declare-fun e!441214 () Bool)

(assert (=> b!794179 (= e!441213 e!441214)))

(declare-fun res!538328 () Bool)

(assert (=> b!794179 (=> (not res!538328) (not e!441214))))

(declare-datatypes ((SeekEntryResult!8170 0))(
  ( (MissingZero!8170 (index!35048 (_ BitVec 32))) (Found!8170 (index!35049 (_ BitVec 32))) (Intermediate!8170 (undefined!8982 Bool) (index!35050 (_ BitVec 32)) (x!66147 (_ BitVec 32))) (Undefined!8170) (MissingVacant!8170 (index!35051 (_ BitVec 32))) )
))
(declare-fun lt!353997 () SeekEntryResult!8170)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!794179 (= res!538328 (or (= lt!353997 (MissingZero!8170 i!1163)) (= lt!353997 (MissingVacant!8170 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!43094 0))(
  ( (array!43095 (arr!20623 (Array (_ BitVec 32) (_ BitVec 64))) (size!21043 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43094)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43094 (_ BitVec 32)) SeekEntryResult!8170)

(assert (=> b!794179 (= lt!353997 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!794180 () Bool)

(declare-fun res!538325 () Bool)

(assert (=> b!794180 (=> (not res!538325) (not e!441213))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794180 (= res!538325 (validKeyInArray!0 (select (arr!20623 a!3170) j!153)))))

(declare-fun b!794181 () Bool)

(declare-fun res!538327 () Bool)

(assert (=> b!794181 (=> (not res!538327) (not e!441213))))

(declare-fun arrayContainsKey!0 (array!43094 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794181 (= res!538327 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794182 () Bool)

(declare-fun res!538324 () Bool)

(assert (=> b!794182 (=> (not res!538324) (not e!441213))))

(assert (=> b!794182 (= res!538324 (and (= (size!21043 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21043 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21043 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794183 () Bool)

(assert (=> b!794183 (= e!441214 false)))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!353998 () SeekEntryResult!8170)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!353995 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!353996 () array!43094)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43094 (_ BitVec 32)) SeekEntryResult!8170)

(assert (=> b!794183 (= lt!353998 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!353995 lt!353996 mask!3266))))

(declare-fun lt!353994 () SeekEntryResult!8170)

(assert (=> b!794183 (= lt!353994 (seekEntryOrOpen!0 lt!353995 lt!353996 mask!3266))))

(assert (=> b!794183 (= lt!353995 (select (store (arr!20623 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!794183 (= lt!353996 (array!43095 (store (arr!20623 a!3170) i!1163 k0!2044) (size!21043 a!3170)))))

(declare-fun b!794184 () Bool)

(declare-fun res!538331 () Bool)

(assert (=> b!794184 (=> (not res!538331) (not e!441213))))

(assert (=> b!794184 (= res!538331 (validKeyInArray!0 k0!2044))))

(declare-fun b!794185 () Bool)

(declare-fun res!538332 () Bool)

(assert (=> b!794185 (=> (not res!538332) (not e!441214))))

(declare-datatypes ((List!14493 0))(
  ( (Nil!14490) (Cons!14489 (h!15624 (_ BitVec 64)) (t!20800 List!14493)) )
))
(declare-fun arrayNoDuplicates!0 (array!43094 (_ BitVec 32) List!14493) Bool)

(assert (=> b!794185 (= res!538332 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14490))))

(declare-fun b!794186 () Bool)

(declare-fun res!538326 () Bool)

(assert (=> b!794186 (=> (not res!538326) (not e!441214))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43094 (_ BitVec 32)) Bool)

(assert (=> b!794186 (= res!538326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!538330 () Bool)

(assert (=> start!68430 (=> (not res!538330) (not e!441213))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68430 (= res!538330 (validMask!0 mask!3266))))

(assert (=> start!68430 e!441213))

(assert (=> start!68430 true))

(declare-fun array_inv!16482 (array!43094) Bool)

(assert (=> start!68430 (array_inv!16482 a!3170)))

(declare-fun b!794187 () Bool)

(declare-fun res!538329 () Bool)

(assert (=> b!794187 (=> (not res!538329) (not e!441214))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!794187 (= res!538329 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21043 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20623 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21043 a!3170)) (= (select (arr!20623 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!68430 res!538330) b!794182))

(assert (= (and b!794182 res!538324) b!794180))

(assert (= (and b!794180 res!538325) b!794184))

(assert (= (and b!794184 res!538331) b!794181))

(assert (= (and b!794181 res!538327) b!794179))

(assert (= (and b!794179 res!538328) b!794186))

(assert (= (and b!794186 res!538326) b!794185))

(assert (= (and b!794185 res!538332) b!794187))

(assert (= (and b!794187 res!538329) b!794183))

(declare-fun m!735083 () Bool)

(assert (=> b!794179 m!735083))

(declare-fun m!735085 () Bool)

(assert (=> start!68430 m!735085))

(declare-fun m!735087 () Bool)

(assert (=> start!68430 m!735087))

(declare-fun m!735089 () Bool)

(assert (=> b!794180 m!735089))

(assert (=> b!794180 m!735089))

(declare-fun m!735091 () Bool)

(assert (=> b!794180 m!735091))

(declare-fun m!735093 () Bool)

(assert (=> b!794185 m!735093))

(declare-fun m!735095 () Bool)

(assert (=> b!794181 m!735095))

(declare-fun m!735097 () Bool)

(assert (=> b!794187 m!735097))

(declare-fun m!735099 () Bool)

(assert (=> b!794187 m!735099))

(declare-fun m!735101 () Bool)

(assert (=> b!794186 m!735101))

(declare-fun m!735103 () Bool)

(assert (=> b!794184 m!735103))

(declare-fun m!735105 () Bool)

(assert (=> b!794183 m!735105))

(declare-fun m!735107 () Bool)

(assert (=> b!794183 m!735107))

(declare-fun m!735109 () Bool)

(assert (=> b!794183 m!735109))

(declare-fun m!735111 () Bool)

(assert (=> b!794183 m!735111))

(check-sat (not b!794185) (not b!794184) (not b!794180) (not start!68430) (not b!794183) (not b!794179) (not b!794186) (not b!794181))
(check-sat)
