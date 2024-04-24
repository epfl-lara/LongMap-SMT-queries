; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68436 () Bool)

(assert start!68436)

(declare-fun b!794262 () Bool)

(declare-fun e!441242 () Bool)

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!794262 (= e!441242 (bvslt mask!3266 #b00000000000000000000000000000000))))

(declare-fun b!794263 () Bool)

(declare-fun res!538409 () Bool)

(declare-fun e!441244 () Bool)

(assert (=> b!794263 (=> (not res!538409) (not e!441244))))

(declare-datatypes ((array!43100 0))(
  ( (array!43101 (arr!20626 (Array (_ BitVec 32) (_ BitVec 64))) (size!21046 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43100)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43100 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794263 (= res!538409 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794264 () Bool)

(declare-fun res!538416 () Bool)

(declare-fun e!441243 () Bool)

(assert (=> b!794264 (=> (not res!538416) (not e!441243))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43100 (_ BitVec 32)) Bool)

(assert (=> b!794264 (= res!538416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794265 () Bool)

(declare-fun res!538414 () Bool)

(assert (=> b!794265 (=> (not res!538414) (not e!441244))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794265 (= res!538414 (validKeyInArray!0 k0!2044))))

(declare-fun b!794266 () Bool)

(declare-fun res!538415 () Bool)

(assert (=> b!794266 (=> (not res!538415) (not e!441243))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!794266 (= res!538415 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21046 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20626 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21046 a!3170)) (= (select (arr!20626 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!538412 () Bool)

(assert (=> start!68436 (=> (not res!538412) (not e!441244))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68436 (= res!538412 (validMask!0 mask!3266))))

(assert (=> start!68436 e!441244))

(assert (=> start!68436 true))

(declare-fun array_inv!16485 (array!43100) Bool)

(assert (=> start!68436 (array_inv!16485 a!3170)))

(declare-fun b!794267 () Bool)

(declare-fun res!538413 () Bool)

(assert (=> b!794267 (=> (not res!538413) (not e!441244))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!794267 (= res!538413 (validKeyInArray!0 (select (arr!20626 a!3170) j!153)))))

(declare-fun b!794268 () Bool)

(declare-fun res!538408 () Bool)

(assert (=> b!794268 (=> (not res!538408) (not e!441244))))

(assert (=> b!794268 (= res!538408 (and (= (size!21046 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21046 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21046 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794269 () Bool)

(assert (=> b!794269 (= e!441243 e!441242)))

(declare-fun res!538411 () Bool)

(assert (=> b!794269 (=> (not res!538411) (not e!441242))))

(declare-fun lt!354035 () array!43100)

(declare-fun lt!354037 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8173 0))(
  ( (MissingZero!8173 (index!35060 (_ BitVec 32))) (Found!8173 (index!35061 (_ BitVec 32))) (Intermediate!8173 (undefined!8985 Bool) (index!35062 (_ BitVec 32)) (x!66158 (_ BitVec 32))) (Undefined!8173) (MissingVacant!8173 (index!35063 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43100 (_ BitVec 32)) SeekEntryResult!8173)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43100 (_ BitVec 32)) SeekEntryResult!8173)

(assert (=> b!794269 (= res!538411 (= (seekEntryOrOpen!0 lt!354037 lt!354035 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354037 lt!354035 mask!3266)))))

(assert (=> b!794269 (= lt!354037 (select (store (arr!20626 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!794269 (= lt!354035 (array!43101 (store (arr!20626 a!3170) i!1163 k0!2044) (size!21046 a!3170)))))

(declare-fun b!794270 () Bool)

(declare-fun res!538407 () Bool)

(assert (=> b!794270 (=> (not res!538407) (not e!441243))))

(declare-datatypes ((List!14496 0))(
  ( (Nil!14493) (Cons!14492 (h!15627 (_ BitVec 64)) (t!20803 List!14496)) )
))
(declare-fun arrayNoDuplicates!0 (array!43100 (_ BitVec 32) List!14496) Bool)

(assert (=> b!794270 (= res!538407 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14493))))

(declare-fun b!794271 () Bool)

(assert (=> b!794271 (= e!441244 e!441243)))

(declare-fun res!538410 () Bool)

(assert (=> b!794271 (=> (not res!538410) (not e!441243))))

(declare-fun lt!354036 () SeekEntryResult!8173)

(assert (=> b!794271 (= res!538410 (or (= lt!354036 (MissingZero!8173 i!1163)) (= lt!354036 (MissingVacant!8173 i!1163))))))

(assert (=> b!794271 (= lt!354036 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(assert (= (and start!68436 res!538412) b!794268))

(assert (= (and b!794268 res!538408) b!794267))

(assert (= (and b!794267 res!538413) b!794265))

(assert (= (and b!794265 res!538414) b!794263))

(assert (= (and b!794263 res!538409) b!794271))

(assert (= (and b!794271 res!538410) b!794264))

(assert (= (and b!794264 res!538416) b!794270))

(assert (= (and b!794270 res!538407) b!794266))

(assert (= (and b!794266 res!538415) b!794269))

(assert (= (and b!794269 res!538411) b!794262))

(declare-fun m!735173 () Bool)

(assert (=> b!794266 m!735173))

(declare-fun m!735175 () Bool)

(assert (=> b!794266 m!735175))

(declare-fun m!735177 () Bool)

(assert (=> b!794270 m!735177))

(declare-fun m!735179 () Bool)

(assert (=> b!794264 m!735179))

(declare-fun m!735181 () Bool)

(assert (=> b!794265 m!735181))

(declare-fun m!735183 () Bool)

(assert (=> b!794263 m!735183))

(declare-fun m!735185 () Bool)

(assert (=> b!794271 m!735185))

(declare-fun m!735187 () Bool)

(assert (=> start!68436 m!735187))

(declare-fun m!735189 () Bool)

(assert (=> start!68436 m!735189))

(declare-fun m!735191 () Bool)

(assert (=> b!794269 m!735191))

(declare-fun m!735193 () Bool)

(assert (=> b!794269 m!735193))

(declare-fun m!735195 () Bool)

(assert (=> b!794269 m!735195))

(declare-fun m!735197 () Bool)

(assert (=> b!794269 m!735197))

(declare-fun m!735199 () Bool)

(assert (=> b!794267 m!735199))

(assert (=> b!794267 m!735199))

(declare-fun m!735201 () Bool)

(assert (=> b!794267 m!735201))

(check-sat (not b!794269) (not b!794271) (not b!794263) (not start!68436) (not b!794267) (not b!794264) (not b!794270) (not b!794265))
(check-sat)
