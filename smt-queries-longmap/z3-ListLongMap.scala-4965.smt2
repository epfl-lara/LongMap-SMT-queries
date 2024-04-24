; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68424 () Bool)

(assert start!68424)

(declare-fun b!794098 () Bool)

(declare-fun e!441185 () Bool)

(declare-fun e!441187 () Bool)

(assert (=> b!794098 (= e!441185 e!441187)))

(declare-fun res!538246 () Bool)

(assert (=> b!794098 (=> (not res!538246) (not e!441187))))

(declare-datatypes ((SeekEntryResult!8167 0))(
  ( (MissingZero!8167 (index!35036 (_ BitVec 32))) (Found!8167 (index!35037 (_ BitVec 32))) (Intermediate!8167 (undefined!8979 Bool) (index!35038 (_ BitVec 32)) (x!66136 (_ BitVec 32))) (Undefined!8167) (MissingVacant!8167 (index!35039 (_ BitVec 32))) )
))
(declare-fun lt!353977 () SeekEntryResult!8167)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!794098 (= res!538246 (or (= lt!353977 (MissingZero!8167 i!1163)) (= lt!353977 (MissingVacant!8167 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!43088 0))(
  ( (array!43089 (arr!20620 (Array (_ BitVec 32) (_ BitVec 64))) (size!21040 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43088)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43088 (_ BitVec 32)) SeekEntryResult!8167)

(assert (=> b!794098 (= lt!353977 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!794100 () Bool)

(declare-fun res!538245 () Bool)

(assert (=> b!794100 (=> (not res!538245) (not e!441185))))

(declare-fun arrayContainsKey!0 (array!43088 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794100 (= res!538245 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794101 () Bool)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794101 (= e!441187 (not (validKeyInArray!0 (select (store (arr!20620 a!3170) i!1163 k0!2044) j!153))))))

(declare-fun b!794102 () Bool)

(declare-fun res!538248 () Bool)

(assert (=> b!794102 (=> (not res!538248) (not e!441185))))

(assert (=> b!794102 (= res!538248 (validKeyInArray!0 k0!2044))))

(declare-fun b!794103 () Bool)

(declare-fun res!538249 () Bool)

(assert (=> b!794103 (=> (not res!538249) (not e!441187))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!794103 (= res!538249 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21040 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20620 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21040 a!3170)) (= (select (arr!20620 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23)) (bvsge mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvslt vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (= (select (store (arr!20620 a!3170) i!1163 k0!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!794104 () Bool)

(declare-fun res!538247 () Bool)

(assert (=> b!794104 (=> (not res!538247) (not e!441185))))

(assert (=> b!794104 (= res!538247 (validKeyInArray!0 (select (arr!20620 a!3170) j!153)))))

(declare-fun res!538243 () Bool)

(assert (=> start!68424 (=> (not res!538243) (not e!441185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68424 (= res!538243 (validMask!0 mask!3266))))

(assert (=> start!68424 e!441185))

(assert (=> start!68424 true))

(declare-fun array_inv!16479 (array!43088) Bool)

(assert (=> start!68424 (array_inv!16479 a!3170)))

(declare-fun b!794099 () Bool)

(declare-fun res!538251 () Bool)

(assert (=> b!794099 (=> (not res!538251) (not e!441187))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43088 (_ BitVec 32)) Bool)

(assert (=> b!794099 (= res!538251 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794105 () Bool)

(declare-fun res!538250 () Bool)

(assert (=> b!794105 (=> (not res!538250) (not e!441187))))

(declare-datatypes ((List!14490 0))(
  ( (Nil!14487) (Cons!14486 (h!15621 (_ BitVec 64)) (t!20797 List!14490)) )
))
(declare-fun arrayNoDuplicates!0 (array!43088 (_ BitVec 32) List!14490) Bool)

(assert (=> b!794105 (= res!538250 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14487))))

(declare-fun b!794106 () Bool)

(declare-fun res!538244 () Bool)

(assert (=> b!794106 (=> (not res!538244) (not e!441185))))

(assert (=> b!794106 (= res!538244 (and (= (size!21040 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21040 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21040 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68424 res!538243) b!794106))

(assert (= (and b!794106 res!538244) b!794104))

(assert (= (and b!794104 res!538247) b!794102))

(assert (= (and b!794102 res!538248) b!794100))

(assert (= (and b!794100 res!538245) b!794098))

(assert (= (and b!794098 res!538246) b!794099))

(assert (= (and b!794099 res!538251) b!794105))

(assert (= (and b!794105 res!538250) b!794103))

(assert (= (and b!794103 res!538249) b!794101))

(declare-fun m!734993 () Bool)

(assert (=> b!794104 m!734993))

(assert (=> b!794104 m!734993))

(declare-fun m!734995 () Bool)

(assert (=> b!794104 m!734995))

(declare-fun m!734997 () Bool)

(assert (=> start!68424 m!734997))

(declare-fun m!734999 () Bool)

(assert (=> start!68424 m!734999))

(declare-fun m!735001 () Bool)

(assert (=> b!794098 m!735001))

(declare-fun m!735003 () Bool)

(assert (=> b!794099 m!735003))

(declare-fun m!735005 () Bool)

(assert (=> b!794103 m!735005))

(declare-fun m!735007 () Bool)

(assert (=> b!794103 m!735007))

(declare-fun m!735009 () Bool)

(assert (=> b!794103 m!735009))

(declare-fun m!735011 () Bool)

(assert (=> b!794103 m!735011))

(assert (=> b!794101 m!735009))

(declare-fun m!735013 () Bool)

(assert (=> b!794101 m!735013))

(assert (=> b!794101 m!735013))

(declare-fun m!735015 () Bool)

(assert (=> b!794101 m!735015))

(declare-fun m!735017 () Bool)

(assert (=> b!794102 m!735017))

(declare-fun m!735019 () Bool)

(assert (=> b!794105 m!735019))

(declare-fun m!735021 () Bool)

(assert (=> b!794100 m!735021))

(check-sat (not b!794105) (not b!794102) (not b!794099) (not b!794101) (not b!794100) (not start!68424) (not b!794098) (not b!794104))
(check-sat)
