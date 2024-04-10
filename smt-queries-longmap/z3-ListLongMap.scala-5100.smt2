; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69208 () Bool)

(assert start!69208)

(declare-fun b!807272 () Bool)

(declare-fun e!446976 () Bool)

(declare-fun e!446978 () Bool)

(assert (=> b!807272 (= e!446976 e!446978)))

(declare-fun res!551404 () Bool)

(assert (=> b!807272 (=> (not res!551404) (not e!446978))))

(declare-datatypes ((array!43908 0))(
  ( (array!43909 (arr!21031 (Array (_ BitVec 32) (_ BitVec 64))) (size!21452 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43908)

(declare-fun j!153 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8622 0))(
  ( (MissingZero!8622 (index!36856 (_ BitVec 32))) (Found!8622 (index!36857 (_ BitVec 32))) (Intermediate!8622 (undefined!9434 Bool) (index!36858 (_ BitVec 32)) (x!67666 (_ BitVec 32))) (Undefined!8622) (MissingVacant!8622 (index!36859 (_ BitVec 32))) )
))
(declare-fun lt!361642 () SeekEntryResult!8622)

(declare-fun lt!361639 () SeekEntryResult!8622)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!807272 (= res!551404 (and (= lt!361642 lt!361639) (= lt!361639 (Found!8622 j!153)) (not (= (select (arr!21031 a!3170) index!1236) (select (arr!21031 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43908 (_ BitVec 32)) SeekEntryResult!8622)

(assert (=> b!807272 (= lt!361639 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21031 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43908 (_ BitVec 32)) SeekEntryResult!8622)

(assert (=> b!807272 (= lt!361642 (seekEntryOrOpen!0 (select (arr!21031 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!807273 () Bool)

(declare-fun res!551400 () Bool)

(declare-fun e!446975 () Bool)

(assert (=> b!807273 (=> (not res!551400) (not e!446975))))

(declare-datatypes ((List!14994 0))(
  ( (Nil!14991) (Cons!14990 (h!16119 (_ BitVec 64)) (t!21309 List!14994)) )
))
(declare-fun arrayNoDuplicates!0 (array!43908 (_ BitVec 32) List!14994) Bool)

(assert (=> b!807273 (= res!551400 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14991))))

(declare-fun b!807274 () Bool)

(declare-fun res!551399 () Bool)

(declare-fun e!446977 () Bool)

(assert (=> b!807274 (=> (not res!551399) (not e!446977))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!807274 (= res!551399 (and (= (size!21452 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21452 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21452 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!807275 () Bool)

(declare-fun res!551401 () Bool)

(assert (=> b!807275 (=> (not res!551401) (not e!446975))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!807275 (= res!551401 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21452 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21031 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21452 a!3170)) (= (select (arr!21031 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!807277 () Bool)

(assert (=> b!807277 (= e!446977 e!446975)))

(declare-fun res!551398 () Bool)

(assert (=> b!807277 (=> (not res!551398) (not e!446975))))

(declare-fun lt!361641 () SeekEntryResult!8622)

(assert (=> b!807277 (= res!551398 (or (= lt!361641 (MissingZero!8622 i!1163)) (= lt!361641 (MissingVacant!8622 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!807277 (= lt!361641 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!807278 () Bool)

(declare-fun res!551402 () Bool)

(assert (=> b!807278 (=> (not res!551402) (not e!446977))))

(declare-fun arrayContainsKey!0 (array!43908 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807278 (= res!551402 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!807276 () Bool)

(declare-fun res!551403 () Bool)

(assert (=> b!807276 (=> (not res!551403) (not e!446977))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807276 (= res!551403 (validKeyInArray!0 (select (arr!21031 a!3170) j!153)))))

(declare-fun res!551395 () Bool)

(assert (=> start!69208 (=> (not res!551395) (not e!446977))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69208 (= res!551395 (validMask!0 mask!3266))))

(assert (=> start!69208 e!446977))

(assert (=> start!69208 true))

(declare-fun array_inv!16827 (array!43908) Bool)

(assert (=> start!69208 (array_inv!16827 a!3170)))

(declare-fun b!807279 () Bool)

(declare-fun res!551397 () Bool)

(assert (=> b!807279 (=> (not res!551397) (not e!446977))))

(assert (=> b!807279 (= res!551397 (validKeyInArray!0 k0!2044))))

(declare-fun b!807280 () Bool)

(declare-fun res!551396 () Bool)

(assert (=> b!807280 (=> (not res!551396) (not e!446975))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43908 (_ BitVec 32)) Bool)

(assert (=> b!807280 (= res!551396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!807281 () Bool)

(assert (=> b!807281 (= e!446978 false)))

(declare-fun lt!361643 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!807281 (= lt!361643 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!807282 () Bool)

(assert (=> b!807282 (= e!446975 e!446976)))

(declare-fun res!551405 () Bool)

(assert (=> b!807282 (=> (not res!551405) (not e!446976))))

(declare-fun lt!361638 () array!43908)

(declare-fun lt!361640 () (_ BitVec 64))

(assert (=> b!807282 (= res!551405 (= (seekEntryOrOpen!0 lt!361640 lt!361638 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361640 lt!361638 mask!3266)))))

(assert (=> b!807282 (= lt!361640 (select (store (arr!21031 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!807282 (= lt!361638 (array!43909 (store (arr!21031 a!3170) i!1163 k0!2044) (size!21452 a!3170)))))

(assert (= (and start!69208 res!551395) b!807274))

(assert (= (and b!807274 res!551399) b!807276))

(assert (= (and b!807276 res!551403) b!807279))

(assert (= (and b!807279 res!551397) b!807278))

(assert (= (and b!807278 res!551402) b!807277))

(assert (= (and b!807277 res!551398) b!807280))

(assert (= (and b!807280 res!551396) b!807273))

(assert (= (and b!807273 res!551400) b!807275))

(assert (= (and b!807275 res!551401) b!807282))

(assert (= (and b!807282 res!551405) b!807272))

(assert (= (and b!807272 res!551404) b!807281))

(declare-fun m!749281 () Bool)

(assert (=> b!807277 m!749281))

(declare-fun m!749283 () Bool)

(assert (=> start!69208 m!749283))

(declare-fun m!749285 () Bool)

(assert (=> start!69208 m!749285))

(declare-fun m!749287 () Bool)

(assert (=> b!807281 m!749287))

(declare-fun m!749289 () Bool)

(assert (=> b!807278 m!749289))

(declare-fun m!749291 () Bool)

(assert (=> b!807282 m!749291))

(declare-fun m!749293 () Bool)

(assert (=> b!807282 m!749293))

(declare-fun m!749295 () Bool)

(assert (=> b!807282 m!749295))

(declare-fun m!749297 () Bool)

(assert (=> b!807282 m!749297))

(declare-fun m!749299 () Bool)

(assert (=> b!807273 m!749299))

(declare-fun m!749301 () Bool)

(assert (=> b!807280 m!749301))

(declare-fun m!749303 () Bool)

(assert (=> b!807276 m!749303))

(assert (=> b!807276 m!749303))

(declare-fun m!749305 () Bool)

(assert (=> b!807276 m!749305))

(declare-fun m!749307 () Bool)

(assert (=> b!807272 m!749307))

(assert (=> b!807272 m!749303))

(assert (=> b!807272 m!749303))

(declare-fun m!749309 () Bool)

(assert (=> b!807272 m!749309))

(assert (=> b!807272 m!749303))

(declare-fun m!749311 () Bool)

(assert (=> b!807272 m!749311))

(declare-fun m!749313 () Bool)

(assert (=> b!807279 m!749313))

(declare-fun m!749315 () Bool)

(assert (=> b!807275 m!749315))

(declare-fun m!749317 () Bool)

(assert (=> b!807275 m!749317))

(check-sat (not b!807282) (not b!807279) (not b!807280) (not b!807273) (not b!807276) (not b!807277) (not b!807281) (not b!807272) (not b!807278) (not start!69208))
(check-sat)
