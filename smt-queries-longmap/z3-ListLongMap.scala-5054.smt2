; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69002 () Bool)

(assert start!69002)

(declare-fun b!803339 () Bool)

(declare-fun res!547313 () Bool)

(declare-fun e!445292 () Bool)

(assert (=> b!803339 (=> (not res!547313) (not e!445292))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43624 0))(
  ( (array!43625 (arr!20887 (Array (_ BitVec 32) (_ BitVec 64))) (size!21307 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43624)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!803339 (= res!547313 (and (= (size!21307 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21307 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21307 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!803340 () Bool)

(declare-fun e!445294 () Bool)

(assert (=> b!803340 (= e!445292 e!445294)))

(declare-fun res!547320 () Bool)

(assert (=> b!803340 (=> (not res!547320) (not e!445294))))

(declare-datatypes ((SeekEntryResult!8434 0))(
  ( (MissingZero!8434 (index!36104 (_ BitVec 32))) (Found!8434 (index!36105 (_ BitVec 32))) (Intermediate!8434 (undefined!9246 Bool) (index!36106 (_ BitVec 32)) (x!67118 (_ BitVec 32))) (Undefined!8434) (MissingVacant!8434 (index!36107 (_ BitVec 32))) )
))
(declare-fun lt!359219 () SeekEntryResult!8434)

(assert (=> b!803340 (= res!547320 (or (= lt!359219 (MissingZero!8434 i!1163)) (= lt!359219 (MissingVacant!8434 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43624 (_ BitVec 32)) SeekEntryResult!8434)

(assert (=> b!803340 (= lt!359219 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!803341 () Bool)

(declare-fun e!445293 () Bool)

(declare-fun e!445291 () Bool)

(assert (=> b!803341 (= e!445293 e!445291)))

(declare-fun res!547318 () Bool)

(assert (=> b!803341 (=> (not res!547318) (not e!445291))))

(declare-fun lt!359214 () SeekEntryResult!8434)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!359218 () SeekEntryResult!8434)

(assert (=> b!803341 (= res!547318 (and (= lt!359214 lt!359218) (= lt!359218 (Found!8434 j!153)) (not (= (select (arr!20887 a!3170) index!1236) (select (arr!20887 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43624 (_ BitVec 32)) SeekEntryResult!8434)

(assert (=> b!803341 (= lt!359218 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20887 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!803341 (= lt!359214 (seekEntryOrOpen!0 (select (arr!20887 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!803342 () Bool)

(assert (=> b!803342 (= e!445294 e!445293)))

(declare-fun res!547316 () Bool)

(assert (=> b!803342 (=> (not res!547316) (not e!445293))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!359215 () array!43624)

(declare-fun lt!359217 () (_ BitVec 64))

(assert (=> b!803342 (= res!547316 (= (seekEntryOrOpen!0 lt!359217 lt!359215 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359217 lt!359215 mask!3266)))))

(assert (=> b!803342 (= lt!359217 (select (store (arr!20887 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!803342 (= lt!359215 (array!43625 (store (arr!20887 a!3170) i!1163 k0!2044) (size!21307 a!3170)))))

(declare-fun b!803343 () Bool)

(declare-fun res!547319 () Bool)

(assert (=> b!803343 (=> (not res!547319) (not e!445292))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803343 (= res!547319 (validKeyInArray!0 k0!2044))))

(declare-fun b!803344 () Bool)

(declare-fun res!547315 () Bool)

(assert (=> b!803344 (=> (not res!547315) (not e!445292))))

(declare-fun arrayContainsKey!0 (array!43624 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803344 (= res!547315 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!803345 () Bool)

(declare-fun res!547312 () Bool)

(assert (=> b!803345 (=> (not res!547312) (not e!445294))))

(assert (=> b!803345 (= res!547312 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21307 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20887 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21307 a!3170)) (= (select (arr!20887 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!803346 () Bool)

(declare-fun res!547311 () Bool)

(assert (=> b!803346 (=> (not res!547311) (not e!445294))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43624 (_ BitVec 32)) Bool)

(assert (=> b!803346 (= res!547311 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!547317 () Bool)

(assert (=> start!69002 (=> (not res!547317) (not e!445292))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69002 (= res!547317 (validMask!0 mask!3266))))

(assert (=> start!69002 e!445292))

(assert (=> start!69002 true))

(declare-fun array_inv!16746 (array!43624) Bool)

(assert (=> start!69002 (array_inv!16746 a!3170)))

(declare-fun b!803347 () Bool)

(declare-fun res!547310 () Bool)

(assert (=> b!803347 (=> (not res!547310) (not e!445294))))

(declare-datatypes ((List!14757 0))(
  ( (Nil!14754) (Cons!14753 (h!15888 (_ BitVec 64)) (t!21064 List!14757)) )
))
(declare-fun arrayNoDuplicates!0 (array!43624 (_ BitVec 32) List!14757) Bool)

(assert (=> b!803347 (= res!547310 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14754))))

(declare-fun b!803348 () Bool)

(declare-fun res!547314 () Bool)

(assert (=> b!803348 (=> (not res!547314) (not e!445292))))

(assert (=> b!803348 (= res!547314 (validKeyInArray!0 (select (arr!20887 a!3170) j!153)))))

(declare-fun b!803349 () Bool)

(assert (=> b!803349 (= e!445291 (not true))))

(declare-fun lt!359216 () (_ BitVec 32))

(assert (=> b!803349 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359216 vacantAfter!23 lt!359217 lt!359215 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359216 vacantBefore!23 (select (arr!20887 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27493 0))(
  ( (Unit!27494) )
))
(declare-fun lt!359213 () Unit!27493)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43624 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27493)

(assert (=> b!803349 (= lt!359213 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!359216 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803349 (= lt!359216 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(assert (= (and start!69002 res!547317) b!803339))

(assert (= (and b!803339 res!547313) b!803348))

(assert (= (and b!803348 res!547314) b!803343))

(assert (= (and b!803343 res!547319) b!803344))

(assert (= (and b!803344 res!547315) b!803340))

(assert (= (and b!803340 res!547320) b!803346))

(assert (= (and b!803346 res!547311) b!803347))

(assert (= (and b!803347 res!547310) b!803345))

(assert (= (and b!803345 res!547312) b!803342))

(assert (= (and b!803342 res!547316) b!803341))

(assert (= (and b!803341 res!547318) b!803349))

(declare-fun m!745165 () Bool)

(assert (=> start!69002 m!745165))

(declare-fun m!745167 () Bool)

(assert (=> start!69002 m!745167))

(declare-fun m!745169 () Bool)

(assert (=> b!803341 m!745169))

(declare-fun m!745171 () Bool)

(assert (=> b!803341 m!745171))

(assert (=> b!803341 m!745171))

(declare-fun m!745173 () Bool)

(assert (=> b!803341 m!745173))

(assert (=> b!803341 m!745171))

(declare-fun m!745175 () Bool)

(assert (=> b!803341 m!745175))

(declare-fun m!745177 () Bool)

(assert (=> b!803340 m!745177))

(declare-fun m!745179 () Bool)

(assert (=> b!803342 m!745179))

(declare-fun m!745181 () Bool)

(assert (=> b!803342 m!745181))

(declare-fun m!745183 () Bool)

(assert (=> b!803342 m!745183))

(declare-fun m!745185 () Bool)

(assert (=> b!803342 m!745185))

(declare-fun m!745187 () Bool)

(assert (=> b!803344 m!745187))

(assert (=> b!803349 m!745171))

(assert (=> b!803349 m!745171))

(declare-fun m!745189 () Bool)

(assert (=> b!803349 m!745189))

(declare-fun m!745191 () Bool)

(assert (=> b!803349 m!745191))

(declare-fun m!745193 () Bool)

(assert (=> b!803349 m!745193))

(declare-fun m!745195 () Bool)

(assert (=> b!803349 m!745195))

(declare-fun m!745197 () Bool)

(assert (=> b!803345 m!745197))

(declare-fun m!745199 () Bool)

(assert (=> b!803345 m!745199))

(declare-fun m!745201 () Bool)

(assert (=> b!803343 m!745201))

(declare-fun m!745203 () Bool)

(assert (=> b!803346 m!745203))

(declare-fun m!745205 () Bool)

(assert (=> b!803347 m!745205))

(assert (=> b!803348 m!745171))

(assert (=> b!803348 m!745171))

(declare-fun m!745207 () Bool)

(assert (=> b!803348 m!745207))

(check-sat (not b!803347) (not b!803344) (not b!803342) (not b!803340) (not start!69002) (not b!803343) (not b!803348) (not b!803341) (not b!803349) (not b!803346))
(check-sat)
