; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69268 () Bool)

(assert start!69268)

(declare-fun res!552395 () Bool)

(declare-fun e!447424 () Bool)

(assert (=> start!69268 (=> (not res!552395) (not e!447424))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69268 (= res!552395 (validMask!0 mask!3266))))

(assert (=> start!69268 e!447424))

(assert (=> start!69268 true))

(declare-datatypes ((array!43968 0))(
  ( (array!43969 (arr!21061 (Array (_ BitVec 32) (_ BitVec 64))) (size!21482 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43968)

(declare-fun array_inv!16857 (array!43968) Bool)

(assert (=> start!69268 (array_inv!16857 a!3170)))

(declare-fun b!808262 () Bool)

(declare-fun e!447427 () Bool)

(assert (=> b!808262 (= e!447424 e!447427)))

(declare-fun res!552392 () Bool)

(assert (=> b!808262 (=> (not res!552392) (not e!447427))))

(declare-datatypes ((SeekEntryResult!8652 0))(
  ( (MissingZero!8652 (index!36976 (_ BitVec 32))) (Found!8652 (index!36977 (_ BitVec 32))) (Intermediate!8652 (undefined!9464 Bool) (index!36978 (_ BitVec 32)) (x!67776 (_ BitVec 32))) (Undefined!8652) (MissingVacant!8652 (index!36979 (_ BitVec 32))) )
))
(declare-fun lt!362180 () SeekEntryResult!8652)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!808262 (= res!552392 (or (= lt!362180 (MissingZero!8652 i!1163)) (= lt!362180 (MissingVacant!8652 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43968 (_ BitVec 32)) SeekEntryResult!8652)

(assert (=> b!808262 (= lt!362180 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!808263 () Bool)

(declare-fun res!552391 () Bool)

(assert (=> b!808263 (=> (not res!552391) (not e!447427))))

(declare-datatypes ((List!15024 0))(
  ( (Nil!15021) (Cons!15020 (h!16149 (_ BitVec 64)) (t!21339 List!15024)) )
))
(declare-fun arrayNoDuplicates!0 (array!43968 (_ BitVec 32) List!15024) Bool)

(assert (=> b!808263 (= res!552391 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15021))))

(declare-fun b!808264 () Bool)

(declare-fun res!552394 () Bool)

(assert (=> b!808264 (=> (not res!552394) (not e!447424))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!808264 (= res!552394 (and (= (size!21482 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21482 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21482 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!808265 () Bool)

(declare-fun res!552386 () Bool)

(assert (=> b!808265 (=> (not res!552386) (not e!447427))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43968 (_ BitVec 32)) Bool)

(assert (=> b!808265 (= res!552386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!808266 () Bool)

(declare-fun res!552385 () Bool)

(assert (=> b!808266 (=> (not res!552385) (not e!447424))))

(declare-fun arrayContainsKey!0 (array!43968 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!808266 (= res!552385 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!808267 () Bool)

(declare-fun res!552388 () Bool)

(assert (=> b!808267 (=> (not res!552388) (not e!447424))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!808267 (= res!552388 (validKeyInArray!0 (select (arr!21061 a!3170) j!153)))))

(declare-fun b!808268 () Bool)

(declare-fun res!552390 () Bool)

(assert (=> b!808268 (=> (not res!552390) (not e!447427))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!808268 (= res!552390 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21482 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21061 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21482 a!3170)) (= (select (arr!21061 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!808269 () Bool)

(declare-fun e!447426 () Bool)

(assert (=> b!808269 (= e!447427 e!447426)))

(declare-fun res!552393 () Bool)

(assert (=> b!808269 (=> (not res!552393) (not e!447426))))

(declare-fun lt!362182 () array!43968)

(declare-fun lt!362183 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43968 (_ BitVec 32)) SeekEntryResult!8652)

(assert (=> b!808269 (= res!552393 (= (seekEntryOrOpen!0 lt!362183 lt!362182 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362183 lt!362182 mask!3266)))))

(assert (=> b!808269 (= lt!362183 (select (store (arr!21061 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!808269 (= lt!362182 (array!43969 (store (arr!21061 a!3170) i!1163 k0!2044) (size!21482 a!3170)))))

(declare-fun b!808270 () Bool)

(declare-fun e!447428 () Bool)

(assert (=> b!808270 (= e!447428 (bvsgt (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110))))

(declare-fun lt!362181 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!808270 (= lt!362181 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!808271 () Bool)

(assert (=> b!808271 (= e!447426 e!447428)))

(declare-fun res!552387 () Bool)

(assert (=> b!808271 (=> (not res!552387) (not e!447428))))

(declare-fun lt!362179 () SeekEntryResult!8652)

(declare-fun lt!362178 () SeekEntryResult!8652)

(assert (=> b!808271 (= res!552387 (and (= lt!362178 lt!362179) (= lt!362179 (Found!8652 j!153)) (not (= (select (arr!21061 a!3170) index!1236) (select (arr!21061 a!3170) j!153)))))))

(assert (=> b!808271 (= lt!362179 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21061 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!808271 (= lt!362178 (seekEntryOrOpen!0 (select (arr!21061 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!808272 () Bool)

(declare-fun res!552389 () Bool)

(assert (=> b!808272 (=> (not res!552389) (not e!447424))))

(assert (=> b!808272 (= res!552389 (validKeyInArray!0 k0!2044))))

(assert (= (and start!69268 res!552395) b!808264))

(assert (= (and b!808264 res!552394) b!808267))

(assert (= (and b!808267 res!552388) b!808272))

(assert (= (and b!808272 res!552389) b!808266))

(assert (= (and b!808266 res!552385) b!808262))

(assert (= (and b!808262 res!552392) b!808265))

(assert (= (and b!808265 res!552386) b!808263))

(assert (= (and b!808263 res!552391) b!808268))

(assert (= (and b!808268 res!552390) b!808269))

(assert (= (and b!808269 res!552393) b!808271))

(assert (= (and b!808271 res!552387) b!808270))

(declare-fun m!750421 () Bool)

(assert (=> b!808272 m!750421))

(declare-fun m!750423 () Bool)

(assert (=> b!808265 m!750423))

(declare-fun m!750425 () Bool)

(assert (=> b!808268 m!750425))

(declare-fun m!750427 () Bool)

(assert (=> b!808268 m!750427))

(declare-fun m!750429 () Bool)

(assert (=> b!808271 m!750429))

(declare-fun m!750431 () Bool)

(assert (=> b!808271 m!750431))

(assert (=> b!808271 m!750431))

(declare-fun m!750433 () Bool)

(assert (=> b!808271 m!750433))

(assert (=> b!808271 m!750431))

(declare-fun m!750435 () Bool)

(assert (=> b!808271 m!750435))

(declare-fun m!750437 () Bool)

(assert (=> b!808263 m!750437))

(declare-fun m!750439 () Bool)

(assert (=> b!808269 m!750439))

(declare-fun m!750441 () Bool)

(assert (=> b!808269 m!750441))

(declare-fun m!750443 () Bool)

(assert (=> b!808269 m!750443))

(declare-fun m!750445 () Bool)

(assert (=> b!808269 m!750445))

(declare-fun m!750447 () Bool)

(assert (=> b!808266 m!750447))

(declare-fun m!750449 () Bool)

(assert (=> b!808270 m!750449))

(declare-fun m!750451 () Bool)

(assert (=> b!808262 m!750451))

(assert (=> b!808267 m!750431))

(assert (=> b!808267 m!750431))

(declare-fun m!750453 () Bool)

(assert (=> b!808267 m!750453))

(declare-fun m!750455 () Bool)

(assert (=> start!69268 m!750455))

(declare-fun m!750457 () Bool)

(assert (=> start!69268 m!750457))

(check-sat (not b!808265) (not b!808266) (not b!808271) (not b!808272) (not start!69268) (not b!808262) (not b!808270) (not b!808269) (not b!808267) (not b!808263))
(check-sat)
(get-model)

(declare-fun b!808318 () Bool)

(declare-fun e!447451 () SeekEntryResult!8652)

(declare-fun lt!362209 () SeekEntryResult!8652)

(assert (=> b!808318 (= e!447451 (MissingZero!8652 (index!36978 lt!362209)))))

(declare-fun b!808319 () Bool)

(declare-fun c!88355 () Bool)

(declare-fun lt!362210 () (_ BitVec 64))

(assert (=> b!808319 (= c!88355 (= lt!362210 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!447452 () SeekEntryResult!8652)

(assert (=> b!808319 (= e!447452 e!447451)))

(declare-fun b!808320 () Bool)

(assert (=> b!808320 (= e!447451 (seekKeyOrZeroReturnVacant!0 (x!67776 lt!362209) (index!36978 lt!362209) (index!36978 lt!362209) lt!362183 lt!362182 mask!3266))))

(declare-fun b!808321 () Bool)

(declare-fun e!447450 () SeekEntryResult!8652)

(assert (=> b!808321 (= e!447450 Undefined!8652)))

(declare-fun b!808322 () Bool)

(assert (=> b!808322 (= e!447452 (Found!8652 (index!36978 lt!362209)))))

(declare-fun d!103741 () Bool)

(declare-fun lt!362208 () SeekEntryResult!8652)

(get-info :version)

(assert (=> d!103741 (and (or ((_ is Undefined!8652) lt!362208) (not ((_ is Found!8652) lt!362208)) (and (bvsge (index!36977 lt!362208) #b00000000000000000000000000000000) (bvslt (index!36977 lt!362208) (size!21482 lt!362182)))) (or ((_ is Undefined!8652) lt!362208) ((_ is Found!8652) lt!362208) (not ((_ is MissingZero!8652) lt!362208)) (and (bvsge (index!36976 lt!362208) #b00000000000000000000000000000000) (bvslt (index!36976 lt!362208) (size!21482 lt!362182)))) (or ((_ is Undefined!8652) lt!362208) ((_ is Found!8652) lt!362208) ((_ is MissingZero!8652) lt!362208) (not ((_ is MissingVacant!8652) lt!362208)) (and (bvsge (index!36979 lt!362208) #b00000000000000000000000000000000) (bvslt (index!36979 lt!362208) (size!21482 lt!362182)))) (or ((_ is Undefined!8652) lt!362208) (ite ((_ is Found!8652) lt!362208) (= (select (arr!21061 lt!362182) (index!36977 lt!362208)) lt!362183) (ite ((_ is MissingZero!8652) lt!362208) (= (select (arr!21061 lt!362182) (index!36976 lt!362208)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8652) lt!362208) (= (select (arr!21061 lt!362182) (index!36979 lt!362208)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103741 (= lt!362208 e!447450)))

(declare-fun c!88357 () Bool)

(assert (=> d!103741 (= c!88357 (and ((_ is Intermediate!8652) lt!362209) (undefined!9464 lt!362209)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43968 (_ BitVec 32)) SeekEntryResult!8652)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103741 (= lt!362209 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!362183 mask!3266) lt!362183 lt!362182 mask!3266))))

(assert (=> d!103741 (validMask!0 mask!3266)))

(assert (=> d!103741 (= (seekEntryOrOpen!0 lt!362183 lt!362182 mask!3266) lt!362208)))

(declare-fun b!808323 () Bool)

(assert (=> b!808323 (= e!447450 e!447452)))

(assert (=> b!808323 (= lt!362210 (select (arr!21061 lt!362182) (index!36978 lt!362209)))))

(declare-fun c!88356 () Bool)

(assert (=> b!808323 (= c!88356 (= lt!362210 lt!362183))))

(assert (= (and d!103741 c!88357) b!808321))

(assert (= (and d!103741 (not c!88357)) b!808323))

(assert (= (and b!808323 c!88356) b!808322))

(assert (= (and b!808323 (not c!88356)) b!808319))

(assert (= (and b!808319 c!88355) b!808318))

(assert (= (and b!808319 (not c!88355)) b!808320))

(declare-fun m!750497 () Bool)

(assert (=> b!808320 m!750497))

(declare-fun m!750499 () Bool)

(assert (=> d!103741 m!750499))

(declare-fun m!750501 () Bool)

(assert (=> d!103741 m!750501))

(declare-fun m!750503 () Bool)

(assert (=> d!103741 m!750503))

(assert (=> d!103741 m!750499))

(declare-fun m!750505 () Bool)

(assert (=> d!103741 m!750505))

(assert (=> d!103741 m!750455))

(declare-fun m!750507 () Bool)

(assert (=> d!103741 m!750507))

(declare-fun m!750509 () Bool)

(assert (=> b!808323 m!750509))

(assert (=> b!808269 d!103741))

(declare-fun b!808344 () Bool)

(declare-fun e!447467 () SeekEntryResult!8652)

(assert (=> b!808344 (= e!447467 Undefined!8652)))

(declare-fun b!808345 () Bool)

(declare-fun c!88368 () Bool)

(declare-fun lt!362221 () (_ BitVec 64))

(assert (=> b!808345 (= c!88368 (= lt!362221 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!447466 () SeekEntryResult!8652)

(declare-fun e!447465 () SeekEntryResult!8652)

(assert (=> b!808345 (= e!447466 e!447465)))

(declare-fun lt!362222 () SeekEntryResult!8652)

(declare-fun d!103743 () Bool)

(assert (=> d!103743 (and (or ((_ is Undefined!8652) lt!362222) (not ((_ is Found!8652) lt!362222)) (and (bvsge (index!36977 lt!362222) #b00000000000000000000000000000000) (bvslt (index!36977 lt!362222) (size!21482 lt!362182)))) (or ((_ is Undefined!8652) lt!362222) ((_ is Found!8652) lt!362222) (not ((_ is MissingVacant!8652) lt!362222)) (not (= (index!36979 lt!362222) vacantAfter!23)) (and (bvsge (index!36979 lt!362222) #b00000000000000000000000000000000) (bvslt (index!36979 lt!362222) (size!21482 lt!362182)))) (or ((_ is Undefined!8652) lt!362222) (ite ((_ is Found!8652) lt!362222) (= (select (arr!21061 lt!362182) (index!36977 lt!362222)) lt!362183) (and ((_ is MissingVacant!8652) lt!362222) (= (index!36979 lt!362222) vacantAfter!23) (= (select (arr!21061 lt!362182) (index!36979 lt!362222)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!103743 (= lt!362222 e!447467)))

(declare-fun c!88366 () Bool)

(assert (=> d!103743 (= c!88366 (bvsge x!1077 #b01111111111111111111111111111110))))

(assert (=> d!103743 (= lt!362221 (select (arr!21061 lt!362182) index!1236))))

(assert (=> d!103743 (validMask!0 mask!3266)))

(assert (=> d!103743 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362183 lt!362182 mask!3266) lt!362222)))

(declare-fun b!808346 () Bool)

(assert (=> b!808346 (= e!447465 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantAfter!23 lt!362183 lt!362182 mask!3266))))

(declare-fun b!808347 () Bool)

(assert (=> b!808347 (= e!447466 (Found!8652 index!1236))))

(declare-fun b!808348 () Bool)

(assert (=> b!808348 (= e!447467 e!447466)))

(declare-fun c!88367 () Bool)

(assert (=> b!808348 (= c!88367 (= lt!362221 lt!362183))))

(declare-fun b!808349 () Bool)

(assert (=> b!808349 (= e!447465 (MissingVacant!8652 vacantAfter!23))))

(assert (= (and d!103743 c!88366) b!808344))

(assert (= (and d!103743 (not c!88366)) b!808348))

(assert (= (and b!808348 c!88367) b!808347))

(assert (= (and b!808348 (not c!88367)) b!808345))

(assert (= (and b!808345 c!88368) b!808349))

(assert (= (and b!808345 (not c!88368)) b!808346))

(declare-fun m!750511 () Bool)

(assert (=> d!103743 m!750511))

(declare-fun m!750513 () Bool)

(assert (=> d!103743 m!750513))

(declare-fun m!750515 () Bool)

(assert (=> d!103743 m!750515))

(assert (=> d!103743 m!750455))

(assert (=> b!808346 m!750449))

(assert (=> b!808346 m!750449))

(declare-fun m!750517 () Bool)

(assert (=> b!808346 m!750517))

(assert (=> b!808269 d!103743))

(declare-fun d!103751 () Bool)

(assert (=> d!103751 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!69268 d!103751))

(declare-fun d!103759 () Bool)

(assert (=> d!103759 (= (array_inv!16857 a!3170) (bvsge (size!21482 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!69268 d!103759))

(declare-fun b!808400 () Bool)

(declare-fun e!447503 () Bool)

(declare-fun e!447501 () Bool)

(assert (=> b!808400 (= e!447503 e!447501)))

(declare-fun c!88387 () Bool)

(assert (=> b!808400 (= c!88387 (validKeyInArray!0 (select (arr!21061 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!808401 () Bool)

(declare-fun e!447502 () Bool)

(assert (=> b!808401 (= e!447502 e!447503)))

(declare-fun res!552447 () Bool)

(assert (=> b!808401 (=> (not res!552447) (not e!447503))))

(declare-fun e!447500 () Bool)

(assert (=> b!808401 (= res!552447 (not e!447500))))

(declare-fun res!552448 () Bool)

(assert (=> b!808401 (=> (not res!552448) (not e!447500))))

(assert (=> b!808401 (= res!552448 (validKeyInArray!0 (select (arr!21061 a!3170) #b00000000000000000000000000000000)))))

(declare-fun d!103761 () Bool)

(declare-fun res!552449 () Bool)

(assert (=> d!103761 (=> res!552449 e!447502)))

(assert (=> d!103761 (= res!552449 (bvsge #b00000000000000000000000000000000 (size!21482 a!3170)))))

(assert (=> d!103761 (= (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15021) e!447502)))

(declare-fun b!808402 () Bool)

(declare-fun call!35388 () Bool)

(assert (=> b!808402 (= e!447501 call!35388)))

(declare-fun b!808403 () Bool)

(declare-fun contains!4125 (List!15024 (_ BitVec 64)) Bool)

(assert (=> b!808403 (= e!447500 (contains!4125 Nil!15021 (select (arr!21061 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!808404 () Bool)

(assert (=> b!808404 (= e!447501 call!35388)))

(declare-fun bm!35385 () Bool)

(assert (=> bm!35385 (= call!35388 (arrayNoDuplicates!0 a!3170 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88387 (Cons!15020 (select (arr!21061 a!3170) #b00000000000000000000000000000000) Nil!15021) Nil!15021)))))

(assert (= (and d!103761 (not res!552449)) b!808401))

(assert (= (and b!808401 res!552448) b!808403))

(assert (= (and b!808401 res!552447) b!808400))

(assert (= (and b!808400 c!88387) b!808404))

(assert (= (and b!808400 (not c!88387)) b!808402))

(assert (= (or b!808404 b!808402) bm!35385))

(declare-fun m!750539 () Bool)

(assert (=> b!808400 m!750539))

(assert (=> b!808400 m!750539))

(declare-fun m!750541 () Bool)

(assert (=> b!808400 m!750541))

(assert (=> b!808401 m!750539))

(assert (=> b!808401 m!750539))

(assert (=> b!808401 m!750541))

(assert (=> b!808403 m!750539))

(assert (=> b!808403 m!750539))

(declare-fun m!750543 () Bool)

(assert (=> b!808403 m!750543))

(assert (=> bm!35385 m!750539))

(declare-fun m!750545 () Bool)

(assert (=> bm!35385 m!750545))

(assert (=> b!808263 d!103761))

(declare-fun b!808411 () Bool)

(declare-fun e!447508 () SeekEntryResult!8652)

(declare-fun lt!362242 () SeekEntryResult!8652)

(assert (=> b!808411 (= e!447508 (MissingZero!8652 (index!36978 lt!362242)))))

(declare-fun b!808412 () Bool)

(declare-fun c!88391 () Bool)

(declare-fun lt!362243 () (_ BitVec 64))

(assert (=> b!808412 (= c!88391 (= lt!362243 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!447509 () SeekEntryResult!8652)

(assert (=> b!808412 (= e!447509 e!447508)))

(declare-fun b!808413 () Bool)

(assert (=> b!808413 (= e!447508 (seekKeyOrZeroReturnVacant!0 (x!67776 lt!362242) (index!36978 lt!362242) (index!36978 lt!362242) k0!2044 a!3170 mask!3266))))

(declare-fun b!808414 () Bool)

(declare-fun e!447507 () SeekEntryResult!8652)

(assert (=> b!808414 (= e!447507 Undefined!8652)))

(declare-fun b!808415 () Bool)

(assert (=> b!808415 (= e!447509 (Found!8652 (index!36978 lt!362242)))))

(declare-fun d!103765 () Bool)

(declare-fun lt!362241 () SeekEntryResult!8652)

(assert (=> d!103765 (and (or ((_ is Undefined!8652) lt!362241) (not ((_ is Found!8652) lt!362241)) (and (bvsge (index!36977 lt!362241) #b00000000000000000000000000000000) (bvslt (index!36977 lt!362241) (size!21482 a!3170)))) (or ((_ is Undefined!8652) lt!362241) ((_ is Found!8652) lt!362241) (not ((_ is MissingZero!8652) lt!362241)) (and (bvsge (index!36976 lt!362241) #b00000000000000000000000000000000) (bvslt (index!36976 lt!362241) (size!21482 a!3170)))) (or ((_ is Undefined!8652) lt!362241) ((_ is Found!8652) lt!362241) ((_ is MissingZero!8652) lt!362241) (not ((_ is MissingVacant!8652) lt!362241)) (and (bvsge (index!36979 lt!362241) #b00000000000000000000000000000000) (bvslt (index!36979 lt!362241) (size!21482 a!3170)))) (or ((_ is Undefined!8652) lt!362241) (ite ((_ is Found!8652) lt!362241) (= (select (arr!21061 a!3170) (index!36977 lt!362241)) k0!2044) (ite ((_ is MissingZero!8652) lt!362241) (= (select (arr!21061 a!3170) (index!36976 lt!362241)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8652) lt!362241) (= (select (arr!21061 a!3170) (index!36979 lt!362241)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103765 (= lt!362241 e!447507)))

(declare-fun c!88393 () Bool)

(assert (=> d!103765 (= c!88393 (and ((_ is Intermediate!8652) lt!362242) (undefined!9464 lt!362242)))))

(assert (=> d!103765 (= lt!362242 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2044 mask!3266) k0!2044 a!3170 mask!3266))))

(assert (=> d!103765 (validMask!0 mask!3266)))

(assert (=> d!103765 (= (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266) lt!362241)))

(declare-fun b!808416 () Bool)

(assert (=> b!808416 (= e!447507 e!447509)))

(assert (=> b!808416 (= lt!362243 (select (arr!21061 a!3170) (index!36978 lt!362242)))))

(declare-fun c!88392 () Bool)

(assert (=> b!808416 (= c!88392 (= lt!362243 k0!2044))))

(assert (= (and d!103765 c!88393) b!808414))

(assert (= (and d!103765 (not c!88393)) b!808416))

(assert (= (and b!808416 c!88392) b!808415))

(assert (= (and b!808416 (not c!88392)) b!808412))

(assert (= (and b!808412 c!88391) b!808411))

(assert (= (and b!808412 (not c!88391)) b!808413))

(declare-fun m!750561 () Bool)

(assert (=> b!808413 m!750561))

(declare-fun m!750563 () Bool)

(assert (=> d!103765 m!750563))

(declare-fun m!750565 () Bool)

(assert (=> d!103765 m!750565))

(declare-fun m!750567 () Bool)

(assert (=> d!103765 m!750567))

(assert (=> d!103765 m!750563))

(declare-fun m!750569 () Bool)

(assert (=> d!103765 m!750569))

(assert (=> d!103765 m!750455))

(declare-fun m!750571 () Bool)

(assert (=> d!103765 m!750571))

(declare-fun m!750573 () Bool)

(assert (=> b!808416 m!750573))

(assert (=> b!808262 d!103765))

(declare-fun d!103769 () Bool)

(assert (=> d!103769 (= (validKeyInArray!0 (select (arr!21061 a!3170) j!153)) (and (not (= (select (arr!21061 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!21061 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!808267 d!103769))

(declare-fun d!103771 () Bool)

(assert (=> d!103771 (= (validKeyInArray!0 k0!2044) (and (not (= k0!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!808272 d!103771))

(declare-fun d!103773 () Bool)

(declare-fun res!552460 () Bool)

(declare-fun e!447522 () Bool)

(assert (=> d!103773 (=> res!552460 e!447522)))

(assert (=> d!103773 (= res!552460 (= (select (arr!21061 a!3170) #b00000000000000000000000000000000) k0!2044))))

(assert (=> d!103773 (= (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000) e!447522)))

(declare-fun b!808431 () Bool)

(declare-fun e!447523 () Bool)

(assert (=> b!808431 (= e!447522 e!447523)))

(declare-fun res!552461 () Bool)

(assert (=> b!808431 (=> (not res!552461) (not e!447523))))

(assert (=> b!808431 (= res!552461 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!21482 a!3170)))))

(declare-fun b!808432 () Bool)

(assert (=> b!808432 (= e!447523 (arrayContainsKey!0 a!3170 k0!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!103773 (not res!552460)) b!808431))

(assert (= (and b!808431 res!552461) b!808432))

(assert (=> d!103773 m!750539))

(declare-fun m!750575 () Bool)

(assert (=> b!808432 m!750575))

(assert (=> b!808266 d!103773))

(declare-fun b!808433 () Bool)

(declare-fun e!447526 () SeekEntryResult!8652)

(assert (=> b!808433 (= e!447526 Undefined!8652)))

(declare-fun b!808434 () Bool)

(declare-fun c!88398 () Bool)

(declare-fun lt!362244 () (_ BitVec 64))

(assert (=> b!808434 (= c!88398 (= lt!362244 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!447525 () SeekEntryResult!8652)

(declare-fun e!447524 () SeekEntryResult!8652)

(assert (=> b!808434 (= e!447525 e!447524)))

(declare-fun d!103775 () Bool)

(declare-fun lt!362245 () SeekEntryResult!8652)

(assert (=> d!103775 (and (or ((_ is Undefined!8652) lt!362245) (not ((_ is Found!8652) lt!362245)) (and (bvsge (index!36977 lt!362245) #b00000000000000000000000000000000) (bvslt (index!36977 lt!362245) (size!21482 a!3170)))) (or ((_ is Undefined!8652) lt!362245) ((_ is Found!8652) lt!362245) (not ((_ is MissingVacant!8652) lt!362245)) (not (= (index!36979 lt!362245) vacantBefore!23)) (and (bvsge (index!36979 lt!362245) #b00000000000000000000000000000000) (bvslt (index!36979 lt!362245) (size!21482 a!3170)))) (or ((_ is Undefined!8652) lt!362245) (ite ((_ is Found!8652) lt!362245) (= (select (arr!21061 a!3170) (index!36977 lt!362245)) (select (arr!21061 a!3170) j!153)) (and ((_ is MissingVacant!8652) lt!362245) (= (index!36979 lt!362245) vacantBefore!23) (= (select (arr!21061 a!3170) (index!36979 lt!362245)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!103775 (= lt!362245 e!447526)))

(declare-fun c!88396 () Bool)

(assert (=> d!103775 (= c!88396 (bvsge x!1077 #b01111111111111111111111111111110))))

(assert (=> d!103775 (= lt!362244 (select (arr!21061 a!3170) index!1236))))

(assert (=> d!103775 (validMask!0 mask!3266)))

(assert (=> d!103775 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21061 a!3170) j!153) a!3170 mask!3266) lt!362245)))

(declare-fun b!808435 () Bool)

(assert (=> b!808435 (= e!447524 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantBefore!23 (select (arr!21061 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!808436 () Bool)

(assert (=> b!808436 (= e!447525 (Found!8652 index!1236))))

(declare-fun b!808437 () Bool)

(assert (=> b!808437 (= e!447526 e!447525)))

(declare-fun c!88397 () Bool)

(assert (=> b!808437 (= c!88397 (= lt!362244 (select (arr!21061 a!3170) j!153)))))

(declare-fun b!808438 () Bool)

(assert (=> b!808438 (= e!447524 (MissingVacant!8652 vacantBefore!23))))

(assert (= (and d!103775 c!88396) b!808433))

(assert (= (and d!103775 (not c!88396)) b!808437))

(assert (= (and b!808437 c!88397) b!808436))

(assert (= (and b!808437 (not c!88397)) b!808434))

(assert (= (and b!808434 c!88398) b!808438))

(assert (= (and b!808434 (not c!88398)) b!808435))

(declare-fun m!750577 () Bool)

(assert (=> d!103775 m!750577))

(declare-fun m!750579 () Bool)

(assert (=> d!103775 m!750579))

(assert (=> d!103775 m!750429))

(assert (=> d!103775 m!750455))

(assert (=> b!808435 m!750449))

(assert (=> b!808435 m!750449))

(assert (=> b!808435 m!750431))

(declare-fun m!750581 () Bool)

(assert (=> b!808435 m!750581))

(assert (=> b!808271 d!103775))

(declare-fun b!808451 () Bool)

(declare-fun e!447534 () SeekEntryResult!8652)

(declare-fun lt!362253 () SeekEntryResult!8652)

(assert (=> b!808451 (= e!447534 (MissingZero!8652 (index!36978 lt!362253)))))

(declare-fun b!808452 () Bool)

(declare-fun c!88405 () Bool)

(declare-fun lt!362254 () (_ BitVec 64))

(assert (=> b!808452 (= c!88405 (= lt!362254 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!447535 () SeekEntryResult!8652)

(assert (=> b!808452 (= e!447535 e!447534)))

(declare-fun b!808453 () Bool)

(assert (=> b!808453 (= e!447534 (seekKeyOrZeroReturnVacant!0 (x!67776 lt!362253) (index!36978 lt!362253) (index!36978 lt!362253) (select (arr!21061 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!808454 () Bool)

(declare-fun e!447533 () SeekEntryResult!8652)

(assert (=> b!808454 (= e!447533 Undefined!8652)))

(declare-fun b!808455 () Bool)

(assert (=> b!808455 (= e!447535 (Found!8652 (index!36978 lt!362253)))))

(declare-fun d!103777 () Bool)

(declare-fun lt!362252 () SeekEntryResult!8652)

(assert (=> d!103777 (and (or ((_ is Undefined!8652) lt!362252) (not ((_ is Found!8652) lt!362252)) (and (bvsge (index!36977 lt!362252) #b00000000000000000000000000000000) (bvslt (index!36977 lt!362252) (size!21482 a!3170)))) (or ((_ is Undefined!8652) lt!362252) ((_ is Found!8652) lt!362252) (not ((_ is MissingZero!8652) lt!362252)) (and (bvsge (index!36976 lt!362252) #b00000000000000000000000000000000) (bvslt (index!36976 lt!362252) (size!21482 a!3170)))) (or ((_ is Undefined!8652) lt!362252) ((_ is Found!8652) lt!362252) ((_ is MissingZero!8652) lt!362252) (not ((_ is MissingVacant!8652) lt!362252)) (and (bvsge (index!36979 lt!362252) #b00000000000000000000000000000000) (bvslt (index!36979 lt!362252) (size!21482 a!3170)))) (or ((_ is Undefined!8652) lt!362252) (ite ((_ is Found!8652) lt!362252) (= (select (arr!21061 a!3170) (index!36977 lt!362252)) (select (arr!21061 a!3170) j!153)) (ite ((_ is MissingZero!8652) lt!362252) (= (select (arr!21061 a!3170) (index!36976 lt!362252)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8652) lt!362252) (= (select (arr!21061 a!3170) (index!36979 lt!362252)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103777 (= lt!362252 e!447533)))

(declare-fun c!88407 () Bool)

(assert (=> d!103777 (= c!88407 (and ((_ is Intermediate!8652) lt!362253) (undefined!9464 lt!362253)))))

(assert (=> d!103777 (= lt!362253 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!21061 a!3170) j!153) mask!3266) (select (arr!21061 a!3170) j!153) a!3170 mask!3266))))

(assert (=> d!103777 (validMask!0 mask!3266)))

(assert (=> d!103777 (= (seekEntryOrOpen!0 (select (arr!21061 a!3170) j!153) a!3170 mask!3266) lt!362252)))

(declare-fun b!808456 () Bool)

(assert (=> b!808456 (= e!447533 e!447535)))

(assert (=> b!808456 (= lt!362254 (select (arr!21061 a!3170) (index!36978 lt!362253)))))

(declare-fun c!88406 () Bool)

(assert (=> b!808456 (= c!88406 (= lt!362254 (select (arr!21061 a!3170) j!153)))))

(assert (= (and d!103777 c!88407) b!808454))

(assert (= (and d!103777 (not c!88407)) b!808456))

(assert (= (and b!808456 c!88406) b!808455))

(assert (= (and b!808456 (not c!88406)) b!808452))

(assert (= (and b!808452 c!88405) b!808451))

(assert (= (and b!808452 (not c!88405)) b!808453))

(assert (=> b!808453 m!750431))

(declare-fun m!750583 () Bool)

(assert (=> b!808453 m!750583))

(declare-fun m!750585 () Bool)

(assert (=> d!103777 m!750585))

(assert (=> d!103777 m!750431))

(declare-fun m!750587 () Bool)

(assert (=> d!103777 m!750587))

(declare-fun m!750589 () Bool)

(assert (=> d!103777 m!750589))

(assert (=> d!103777 m!750431))

(assert (=> d!103777 m!750585))

(declare-fun m!750591 () Bool)

(assert (=> d!103777 m!750591))

(assert (=> d!103777 m!750455))

(declare-fun m!750593 () Bool)

(assert (=> d!103777 m!750593))

(declare-fun m!750595 () Bool)

(assert (=> b!808456 m!750595))

(assert (=> b!808271 d!103777))

(declare-fun d!103779 () Bool)

(declare-fun res!552483 () Bool)

(declare-fun e!447577 () Bool)

(assert (=> d!103779 (=> res!552483 e!447577)))

(assert (=> d!103779 (= res!552483 (bvsge #b00000000000000000000000000000000 (size!21482 a!3170)))))

(assert (=> d!103779 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!447577)))

(declare-fun b!808517 () Bool)

(declare-fun e!447578 () Bool)

(assert (=> b!808517 (= e!447577 e!447578)))

(declare-fun c!88428 () Bool)

(assert (=> b!808517 (= c!88428 (validKeyInArray!0 (select (arr!21061 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!808518 () Bool)

(declare-fun e!447576 () Bool)

(declare-fun call!35399 () Bool)

(assert (=> b!808518 (= e!447576 call!35399)))

(declare-fun bm!35396 () Bool)

(assert (=> bm!35396 (= call!35399 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(declare-fun b!808519 () Bool)

(assert (=> b!808519 (= e!447578 call!35399)))

(declare-fun b!808520 () Bool)

(assert (=> b!808520 (= e!447578 e!447576)))

(declare-fun lt!362278 () (_ BitVec 64))

(assert (=> b!808520 (= lt!362278 (select (arr!21061 a!3170) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27616 0))(
  ( (Unit!27617) )
))
(declare-fun lt!362280 () Unit!27616)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!43968 (_ BitVec 64) (_ BitVec 32)) Unit!27616)

(assert (=> b!808520 (= lt!362280 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!362278 #b00000000000000000000000000000000))))

(assert (=> b!808520 (arrayContainsKey!0 a!3170 lt!362278 #b00000000000000000000000000000000)))

(declare-fun lt!362279 () Unit!27616)

(assert (=> b!808520 (= lt!362279 lt!362280)))

(declare-fun res!552482 () Bool)

(assert (=> b!808520 (= res!552482 (= (seekEntryOrOpen!0 (select (arr!21061 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8652 #b00000000000000000000000000000000)))))

(assert (=> b!808520 (=> (not res!552482) (not e!447576))))

(assert (= (and d!103779 (not res!552483)) b!808517))

(assert (= (and b!808517 c!88428) b!808520))

(assert (= (and b!808517 (not c!88428)) b!808519))

(assert (= (and b!808520 res!552482) b!808518))

(assert (= (or b!808518 b!808519) bm!35396))

(assert (=> b!808517 m!750539))

(assert (=> b!808517 m!750539))

(assert (=> b!808517 m!750541))

(declare-fun m!750661 () Bool)

(assert (=> bm!35396 m!750661))

(assert (=> b!808520 m!750539))

(declare-fun m!750663 () Bool)

(assert (=> b!808520 m!750663))

(declare-fun m!750665 () Bool)

(assert (=> b!808520 m!750665))

(assert (=> b!808520 m!750539))

(declare-fun m!750669 () Bool)

(assert (=> b!808520 m!750669))

(assert (=> b!808265 d!103779))

(declare-fun d!103793 () Bool)

(declare-fun lt!362289 () (_ BitVec 32))

(assert (=> d!103793 (and (bvsge lt!362289 #b00000000000000000000000000000000) (bvslt lt!362289 (bvadd mask!3266 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103793 (= lt!362289 (choose!52 index!1236 x!1077 mask!3266))))

(assert (=> d!103793 (validMask!0 mask!3266)))

(assert (=> d!103793 (= (nextIndex!0 index!1236 x!1077 mask!3266) lt!362289)))

(declare-fun bs!22393 () Bool)

(assert (= bs!22393 d!103793))

(declare-fun m!750689 () Bool)

(assert (=> bs!22393 m!750689))

(assert (=> bs!22393 m!750455))

(assert (=> b!808270 d!103793))

(check-sat (not d!103741) (not b!808432) (not d!103777) (not b!808320) (not bm!35385) (not d!103793) (not d!103765) (not b!808400) (not b!808435) (not b!808453) (not b!808401) (not b!808517) (not b!808413) (not b!808346) (not d!103743) (not bm!35396) (not d!103775) (not b!808520) (not b!808403))
(check-sat)
