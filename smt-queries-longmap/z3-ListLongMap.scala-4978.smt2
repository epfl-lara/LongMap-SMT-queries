; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68502 () Bool)

(assert start!68502)

(declare-fun b!795189 () Bool)

(declare-fun res!539335 () Bool)

(declare-fun e!441577 () Bool)

(assert (=> b!795189 (=> (not res!539335) (not e!441577))))

(declare-datatypes ((array!43166 0))(
  ( (array!43167 (arr!20659 (Array (_ BitVec 32) (_ BitVec 64))) (size!21079 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43166)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795189 (= res!539335 (validKeyInArray!0 (select (arr!20659 a!3170) j!153)))))

(declare-fun b!795190 () Bool)

(declare-fun res!539340 () Bool)

(declare-fun e!441575 () Bool)

(assert (=> b!795190 (=> (not res!539340) (not e!441575))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!795190 (= res!539340 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21079 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20659 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21079 a!3170)) (= (select (arr!20659 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795191 () Bool)

(declare-fun res!539337 () Bool)

(assert (=> b!795191 (=> (not res!539337) (not e!441577))))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!795191 (= res!539337 (and (= (size!21079 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21079 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21079 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795192 () Bool)

(declare-fun res!539336 () Bool)

(assert (=> b!795192 (=> (not res!539336) (not e!441577))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!795192 (= res!539336 (validKeyInArray!0 k0!2044))))

(declare-fun b!795193 () Bool)

(declare-fun res!539341 () Bool)

(assert (=> b!795193 (=> (not res!539341) (not e!441577))))

(declare-fun arrayContainsKey!0 (array!43166 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795193 (= res!539341 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!795194 () Bool)

(declare-fun e!441574 () Bool)

(assert (=> b!795194 (= e!441574 false)))

(declare-datatypes ((SeekEntryResult!8206 0))(
  ( (MissingZero!8206 (index!35192 (_ BitVec 32))) (Found!8206 (index!35193 (_ BitVec 32))) (Intermediate!8206 (undefined!9018 Bool) (index!35194 (_ BitVec 32)) (x!66279 (_ BitVec 32))) (Undefined!8206) (MissingVacant!8206 (index!35195 (_ BitVec 32))) )
))
(declare-fun lt!354465 () SeekEntryResult!8206)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43166 (_ BitVec 32)) SeekEntryResult!8206)

(assert (=> b!795194 (= lt!354465 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20659 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!354466 () SeekEntryResult!8206)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43166 (_ BitVec 32)) SeekEntryResult!8206)

(assert (=> b!795194 (= lt!354466 (seekEntryOrOpen!0 (select (arr!20659 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!795195 () Bool)

(declare-fun res!539343 () Bool)

(assert (=> b!795195 (=> (not res!539343) (not e!441575))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43166 (_ BitVec 32)) Bool)

(assert (=> b!795195 (= res!539343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!795196 () Bool)

(declare-fun res!539338 () Bool)

(assert (=> b!795196 (=> (not res!539338) (not e!441575))))

(declare-datatypes ((List!14529 0))(
  ( (Nil!14526) (Cons!14525 (h!15660 (_ BitVec 64)) (t!20836 List!14529)) )
))
(declare-fun arrayNoDuplicates!0 (array!43166 (_ BitVec 32) List!14529) Bool)

(assert (=> b!795196 (= res!539338 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14526))))

(declare-fun b!795197 () Bool)

(assert (=> b!795197 (= e!441577 e!441575)))

(declare-fun res!539339 () Bool)

(assert (=> b!795197 (=> (not res!539339) (not e!441575))))

(declare-fun lt!354463 () SeekEntryResult!8206)

(assert (=> b!795197 (= res!539339 (or (= lt!354463 (MissingZero!8206 i!1163)) (= lt!354463 (MissingVacant!8206 i!1163))))))

(assert (=> b!795197 (= lt!354463 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!539334 () Bool)

(assert (=> start!68502 (=> (not res!539334) (not e!441577))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68502 (= res!539334 (validMask!0 mask!3266))))

(assert (=> start!68502 e!441577))

(assert (=> start!68502 true))

(declare-fun array_inv!16518 (array!43166) Bool)

(assert (=> start!68502 (array_inv!16518 a!3170)))

(declare-fun b!795198 () Bool)

(assert (=> b!795198 (= e!441575 e!441574)))

(declare-fun res!539342 () Bool)

(assert (=> b!795198 (=> (not res!539342) (not e!441574))))

(declare-fun lt!354462 () array!43166)

(declare-fun lt!354464 () (_ BitVec 64))

(assert (=> b!795198 (= res!539342 (= (seekEntryOrOpen!0 lt!354464 lt!354462 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354464 lt!354462 mask!3266)))))

(assert (=> b!795198 (= lt!354464 (select (store (arr!20659 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!795198 (= lt!354462 (array!43167 (store (arr!20659 a!3170) i!1163 k0!2044) (size!21079 a!3170)))))

(assert (= (and start!68502 res!539334) b!795191))

(assert (= (and b!795191 res!539337) b!795189))

(assert (= (and b!795189 res!539335) b!795192))

(assert (= (and b!795192 res!539336) b!795193))

(assert (= (and b!795193 res!539341) b!795197))

(assert (= (and b!795197 res!539339) b!795195))

(assert (= (and b!795195 res!539343) b!795196))

(assert (= (and b!795196 res!539338) b!795190))

(assert (= (and b!795190 res!539340) b!795198))

(assert (= (and b!795198 res!539342) b!795194))

(declare-fun m!736163 () Bool)

(assert (=> b!795196 m!736163))

(declare-fun m!736165 () Bool)

(assert (=> b!795198 m!736165))

(declare-fun m!736167 () Bool)

(assert (=> b!795198 m!736167))

(declare-fun m!736169 () Bool)

(assert (=> b!795198 m!736169))

(declare-fun m!736171 () Bool)

(assert (=> b!795198 m!736171))

(declare-fun m!736173 () Bool)

(assert (=> b!795197 m!736173))

(declare-fun m!736175 () Bool)

(assert (=> b!795190 m!736175))

(declare-fun m!736177 () Bool)

(assert (=> b!795190 m!736177))

(declare-fun m!736179 () Bool)

(assert (=> b!795192 m!736179))

(declare-fun m!736181 () Bool)

(assert (=> b!795195 m!736181))

(declare-fun m!736183 () Bool)

(assert (=> start!68502 m!736183))

(declare-fun m!736185 () Bool)

(assert (=> start!68502 m!736185))

(declare-fun m!736187 () Bool)

(assert (=> b!795193 m!736187))

(declare-fun m!736189 () Bool)

(assert (=> b!795194 m!736189))

(assert (=> b!795194 m!736189))

(declare-fun m!736191 () Bool)

(assert (=> b!795194 m!736191))

(assert (=> b!795194 m!736189))

(declare-fun m!736193 () Bool)

(assert (=> b!795194 m!736193))

(assert (=> b!795189 m!736189))

(assert (=> b!795189 m!736189))

(declare-fun m!736195 () Bool)

(assert (=> b!795189 m!736195))

(check-sat (not b!795193) (not b!795192) (not b!795196) (not b!795198) (not b!795197) (not b!795195) (not start!68502) (not b!795189) (not b!795194))
(check-sat)
