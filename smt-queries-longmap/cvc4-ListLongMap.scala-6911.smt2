; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86886 () Bool)

(assert start!86886)

(declare-fun b!1007381 () Bool)

(declare-fun res!676285 () Bool)

(declare-fun e!566965 () Bool)

(assert (=> b!1007381 (=> (not res!676285) (not e!566965))))

(declare-datatypes ((array!63534 0))(
  ( (array!63535 (arr!30588 (Array (_ BitVec 32) (_ BitVec 64))) (size!31090 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63534)

(declare-datatypes ((List!21264 0))(
  ( (Nil!21261) (Cons!21260 (h!22446 (_ BitVec 64)) (t!30265 List!21264)) )
))
(declare-fun arrayNoDuplicates!0 (array!63534 (_ BitVec 32) List!21264) Bool)

(assert (=> b!1007381 (= res!676285 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21261))))

(declare-fun b!1007382 () Bool)

(declare-fun res!676278 () Bool)

(declare-fun e!566962 () Bool)

(assert (=> b!1007382 (=> (not res!676278) (not e!566962))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63534 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1007382 (= res!676278 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun res!676276 () Bool)

(assert (=> start!86886 (=> (not res!676276) (not e!566962))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86886 (= res!676276 (validMask!0 mask!3464))))

(assert (=> start!86886 e!566962))

(declare-fun array_inv!23712 (array!63534) Bool)

(assert (=> start!86886 (array_inv!23712 a!3219)))

(assert (=> start!86886 true))

(declare-fun b!1007383 () Bool)

(declare-fun res!676287 () Bool)

(declare-fun e!566960 () Bool)

(assert (=> b!1007383 (=> (not res!676287) (not e!566960))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1007383 (= res!676287 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1007384 () Bool)

(declare-fun res!676275 () Bool)

(assert (=> b!1007384 (=> (not res!676275) (not e!566962))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1007384 (= res!676275 (validKeyInArray!0 (select (arr!30588 a!3219) j!170)))))

(declare-fun b!1007385 () Bool)

(declare-fun res!676274 () Bool)

(assert (=> b!1007385 (=> (not res!676274) (not e!566960))))

(declare-fun lt!445171 () array!63534)

(declare-datatypes ((SeekEntryResult!9520 0))(
  ( (MissingZero!9520 (index!40451 (_ BitVec 32))) (Found!9520 (index!40452 (_ BitVec 32))) (Intermediate!9520 (undefined!10332 Bool) (index!40453 (_ BitVec 32)) (x!87846 (_ BitVec 32))) (Undefined!9520) (MissingVacant!9520 (index!40454 (_ BitVec 32))) )
))
(declare-fun lt!445173 () SeekEntryResult!9520)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun lt!445170 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63534 (_ BitVec 32)) SeekEntryResult!9520)

(assert (=> b!1007385 (= res!676274 (not (= lt!445173 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445170 lt!445171 mask!3464))))))

(declare-fun b!1007386 () Bool)

(declare-fun e!566961 () Bool)

(assert (=> b!1007386 (= e!566965 e!566961)))

(declare-fun res!676284 () Bool)

(assert (=> b!1007386 (=> (not res!676284) (not e!566961))))

(declare-fun lt!445169 () SeekEntryResult!9520)

(declare-fun lt!445174 () SeekEntryResult!9520)

(assert (=> b!1007386 (= res!676284 (= lt!445169 lt!445174))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1007386 (= lt!445174 (Intermediate!9520 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007386 (= lt!445169 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30588 a!3219) j!170) mask!3464) (select (arr!30588 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007387 () Bool)

(declare-fun res!676283 () Bool)

(assert (=> b!1007387 (=> (not res!676283) (not e!566962))))

(assert (=> b!1007387 (= res!676283 (and (= (size!31090 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31090 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31090 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1007388 () Bool)

(declare-fun e!566964 () Bool)

(assert (=> b!1007388 (= e!566961 e!566964)))

(declare-fun res!676286 () Bool)

(assert (=> b!1007388 (=> (not res!676286) (not e!566964))))

(assert (=> b!1007388 (= res!676286 (= lt!445173 lt!445174))))

(assert (=> b!1007388 (= lt!445173 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30588 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007389 () Bool)

(assert (=> b!1007389 (= e!566962 e!566965)))

(declare-fun res!676282 () Bool)

(assert (=> b!1007389 (=> (not res!676282) (not e!566965))))

(declare-fun lt!445172 () SeekEntryResult!9520)

(assert (=> b!1007389 (= res!676282 (or (= lt!445172 (MissingVacant!9520 i!1194)) (= lt!445172 (MissingZero!9520 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63534 (_ BitVec 32)) SeekEntryResult!9520)

(assert (=> b!1007389 (= lt!445172 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1007390 () Bool)

(assert (=> b!1007390 (= e!566960 false)))

(declare-fun lt!445175 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007390 (= lt!445175 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1007391 () Bool)

(declare-fun res!676279 () Bool)

(assert (=> b!1007391 (=> (not res!676279) (not e!566965))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63534 (_ BitVec 32)) Bool)

(assert (=> b!1007391 (= res!676279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1007392 () Bool)

(assert (=> b!1007392 (= e!566964 e!566960)))

(declare-fun res!676277 () Bool)

(assert (=> b!1007392 (=> (not res!676277) (not e!566960))))

(assert (=> b!1007392 (= res!676277 (not (= lt!445169 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445170 mask!3464) lt!445170 lt!445171 mask!3464))))))

(assert (=> b!1007392 (= lt!445170 (select (store (arr!30588 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1007392 (= lt!445171 (array!63535 (store (arr!30588 a!3219) i!1194 k!2224) (size!31090 a!3219)))))

(declare-fun b!1007393 () Bool)

(declare-fun res!676280 () Bool)

(assert (=> b!1007393 (=> (not res!676280) (not e!566962))))

(assert (=> b!1007393 (= res!676280 (validKeyInArray!0 k!2224))))

(declare-fun b!1007394 () Bool)

(declare-fun res!676281 () Bool)

(assert (=> b!1007394 (=> (not res!676281) (not e!566965))))

(assert (=> b!1007394 (= res!676281 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31090 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31090 a!3219))))))

(assert (= (and start!86886 res!676276) b!1007387))

(assert (= (and b!1007387 res!676283) b!1007384))

(assert (= (and b!1007384 res!676275) b!1007393))

(assert (= (and b!1007393 res!676280) b!1007382))

(assert (= (and b!1007382 res!676278) b!1007389))

(assert (= (and b!1007389 res!676282) b!1007391))

(assert (= (and b!1007391 res!676279) b!1007381))

(assert (= (and b!1007381 res!676285) b!1007394))

(assert (= (and b!1007394 res!676281) b!1007386))

(assert (= (and b!1007386 res!676284) b!1007388))

(assert (= (and b!1007388 res!676286) b!1007392))

(assert (= (and b!1007392 res!676277) b!1007385))

(assert (= (and b!1007385 res!676274) b!1007383))

(assert (= (and b!1007383 res!676287) b!1007390))

(declare-fun m!932279 () Bool)

(assert (=> b!1007386 m!932279))

(assert (=> b!1007386 m!932279))

(declare-fun m!932281 () Bool)

(assert (=> b!1007386 m!932281))

(assert (=> b!1007386 m!932281))

(assert (=> b!1007386 m!932279))

(declare-fun m!932283 () Bool)

(assert (=> b!1007386 m!932283))

(assert (=> b!1007388 m!932279))

(assert (=> b!1007388 m!932279))

(declare-fun m!932285 () Bool)

(assert (=> b!1007388 m!932285))

(assert (=> b!1007384 m!932279))

(assert (=> b!1007384 m!932279))

(declare-fun m!932287 () Bool)

(assert (=> b!1007384 m!932287))

(declare-fun m!932289 () Bool)

(assert (=> b!1007382 m!932289))

(declare-fun m!932291 () Bool)

(assert (=> start!86886 m!932291))

(declare-fun m!932293 () Bool)

(assert (=> start!86886 m!932293))

(declare-fun m!932295 () Bool)

(assert (=> b!1007391 m!932295))

(declare-fun m!932297 () Bool)

(assert (=> b!1007385 m!932297))

(declare-fun m!932299 () Bool)

(assert (=> b!1007390 m!932299))

(declare-fun m!932301 () Bool)

(assert (=> b!1007392 m!932301))

(assert (=> b!1007392 m!932301))

(declare-fun m!932303 () Bool)

(assert (=> b!1007392 m!932303))

(declare-fun m!932305 () Bool)

(assert (=> b!1007392 m!932305))

(declare-fun m!932307 () Bool)

(assert (=> b!1007392 m!932307))

(declare-fun m!932309 () Bool)

(assert (=> b!1007389 m!932309))

(declare-fun m!932311 () Bool)

(assert (=> b!1007381 m!932311))

(declare-fun m!932313 () Bool)

(assert (=> b!1007393 m!932313))

(push 1)

