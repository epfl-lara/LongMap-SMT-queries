; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68508 () Bool)

(assert start!68508)

(declare-fun b!795281 () Bool)

(declare-fun res!539428 () Bool)

(declare-fun e!441611 () Bool)

(assert (=> b!795281 (=> (not res!539428) (not e!441611))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43172 0))(
  ( (array!43173 (arr!20662 (Array (_ BitVec 32) (_ BitVec 64))) (size!21082 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43172)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8209 0))(
  ( (MissingZero!8209 (index!35204 (_ BitVec 32))) (Found!8209 (index!35205 (_ BitVec 32))) (Intermediate!8209 (undefined!9021 Bool) (index!35206 (_ BitVec 32)) (x!66290 (_ BitVec 32))) (Undefined!8209) (MissingVacant!8209 (index!35207 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43172 (_ BitVec 32)) SeekEntryResult!8209)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43172 (_ BitVec 32)) SeekEntryResult!8209)

(assert (=> b!795281 (= res!539428 (= (seekEntryOrOpen!0 (select (arr!20662 a!3170) j!153) a!3170 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20662 a!3170) j!153) a!3170 mask!3266)))))

(declare-fun b!795282 () Bool)

(declare-fun res!539432 () Bool)

(declare-fun e!441613 () Bool)

(assert (=> b!795282 (=> (not res!539432) (not e!441613))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795282 (= res!539432 (validKeyInArray!0 (select (arr!20662 a!3170) j!153)))))

(declare-fun res!539436 () Bool)

(assert (=> start!68508 (=> (not res!539436) (not e!441613))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68508 (= res!539436 (validMask!0 mask!3266))))

(assert (=> start!68508 e!441613))

(assert (=> start!68508 true))

(declare-fun array_inv!16521 (array!43172) Bool)

(assert (=> start!68508 (array_inv!16521 a!3170)))

(declare-fun b!795283 () Bool)

(declare-fun res!539435 () Bool)

(assert (=> b!795283 (=> (not res!539435) (not e!441613))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43172 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795283 (= res!539435 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!795284 () Bool)

(declare-fun res!539427 () Bool)

(assert (=> b!795284 (=> (not res!539427) (not e!441613))))

(assert (=> b!795284 (= res!539427 (validKeyInArray!0 k0!2044))))

(declare-fun b!795285 () Bool)

(declare-fun e!441612 () Bool)

(assert (=> b!795285 (= e!441613 e!441612)))

(declare-fun res!539429 () Bool)

(assert (=> b!795285 (=> (not res!539429) (not e!441612))))

(declare-fun lt!354505 () SeekEntryResult!8209)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!795285 (= res!539429 (or (= lt!354505 (MissingZero!8209 i!1163)) (= lt!354505 (MissingVacant!8209 i!1163))))))

(assert (=> b!795285 (= lt!354505 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!795286 () Bool)

(declare-fun res!539434 () Bool)

(assert (=> b!795286 (=> (not res!539434) (not e!441613))))

(assert (=> b!795286 (= res!539434 (and (= (size!21082 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21082 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21082 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795287 () Bool)

(declare-fun res!539433 () Bool)

(assert (=> b!795287 (=> (not res!539433) (not e!441612))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!795287 (= res!539433 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21082 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20662 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21082 a!3170)) (= (select (arr!20662 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795288 () Bool)

(declare-fun res!539431 () Bool)

(assert (=> b!795288 (=> (not res!539431) (not e!441612))))

(declare-datatypes ((List!14532 0))(
  ( (Nil!14529) (Cons!14528 (h!15663 (_ BitVec 64)) (t!20839 List!14532)) )
))
(declare-fun arrayNoDuplicates!0 (array!43172 (_ BitVec 32) List!14532) Bool)

(assert (=> b!795288 (= res!539431 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14529))))

(declare-fun b!795289 () Bool)

(declare-fun res!539430 () Bool)

(assert (=> b!795289 (=> (not res!539430) (not e!441612))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43172 (_ BitVec 32)) Bool)

(assert (=> b!795289 (= res!539430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!795290 () Bool)

(assert (=> b!795290 (= e!441611 (bvslt mask!3266 #b00000000000000000000000000000000))))

(declare-fun b!795291 () Bool)

(assert (=> b!795291 (= e!441612 e!441611)))

(declare-fun res!539426 () Bool)

(assert (=> b!795291 (=> (not res!539426) (not e!441611))))

(declare-fun lt!354503 () (_ BitVec 64))

(declare-fun lt!354504 () array!43172)

(assert (=> b!795291 (= res!539426 (= (seekEntryOrOpen!0 lt!354503 lt!354504 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354503 lt!354504 mask!3266)))))

(assert (=> b!795291 (= lt!354503 (select (store (arr!20662 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!795291 (= lt!354504 (array!43173 (store (arr!20662 a!3170) i!1163 k0!2044) (size!21082 a!3170)))))

(assert (= (and start!68508 res!539436) b!795286))

(assert (= (and b!795286 res!539434) b!795282))

(assert (= (and b!795282 res!539432) b!795284))

(assert (= (and b!795284 res!539427) b!795283))

(assert (= (and b!795283 res!539435) b!795285))

(assert (= (and b!795285 res!539429) b!795289))

(assert (= (and b!795289 res!539430) b!795288))

(assert (= (and b!795288 res!539431) b!795287))

(assert (= (and b!795287 res!539433) b!795291))

(assert (= (and b!795291 res!539426) b!795281))

(assert (= (and b!795281 res!539428) b!795290))

(declare-fun m!736265 () Bool)

(assert (=> b!795291 m!736265))

(declare-fun m!736267 () Bool)

(assert (=> b!795291 m!736267))

(declare-fun m!736269 () Bool)

(assert (=> b!795291 m!736269))

(declare-fun m!736271 () Bool)

(assert (=> b!795291 m!736271))

(declare-fun m!736273 () Bool)

(assert (=> b!795281 m!736273))

(assert (=> b!795281 m!736273))

(declare-fun m!736275 () Bool)

(assert (=> b!795281 m!736275))

(assert (=> b!795281 m!736273))

(declare-fun m!736277 () Bool)

(assert (=> b!795281 m!736277))

(assert (=> b!795282 m!736273))

(assert (=> b!795282 m!736273))

(declare-fun m!736279 () Bool)

(assert (=> b!795282 m!736279))

(declare-fun m!736281 () Bool)

(assert (=> b!795285 m!736281))

(declare-fun m!736283 () Bool)

(assert (=> b!795288 m!736283))

(declare-fun m!736285 () Bool)

(assert (=> start!68508 m!736285))

(declare-fun m!736287 () Bool)

(assert (=> start!68508 m!736287))

(declare-fun m!736289 () Bool)

(assert (=> b!795284 m!736289))

(declare-fun m!736291 () Bool)

(assert (=> b!795287 m!736291))

(declare-fun m!736293 () Bool)

(assert (=> b!795287 m!736293))

(declare-fun m!736295 () Bool)

(assert (=> b!795289 m!736295))

(declare-fun m!736297 () Bool)

(assert (=> b!795283 m!736297))

(check-sat (not b!795291) (not start!68508) (not b!795288) (not b!795285) (not b!795289) (not b!795283) (not b!795281) (not b!795284) (not b!795282))
(check-sat)
