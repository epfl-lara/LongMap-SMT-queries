; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69362 () Bool)

(assert start!69362)

(declare-fun b!807930 () Bool)

(declare-fun e!447445 () Bool)

(assert (=> b!807930 (= e!447445 false)))

(declare-fun lt!361873 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!807930 (= lt!361873 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!807931 () Bool)

(declare-fun e!447442 () Bool)

(declare-fun e!447443 () Bool)

(assert (=> b!807931 (= e!447442 e!447443)))

(declare-fun res!551513 () Bool)

(assert (=> b!807931 (=> (not res!551513) (not e!447443))))

(declare-datatypes ((SeekEntryResult!8566 0))(
  ( (MissingZero!8566 (index!36632 (_ BitVec 32))) (Found!8566 (index!36633 (_ BitVec 32))) (Intermediate!8566 (undefined!9378 Bool) (index!36634 (_ BitVec 32)) (x!67608 (_ BitVec 32))) (Undefined!8566) (MissingVacant!8566 (index!36635 (_ BitVec 32))) )
))
(declare-fun lt!361874 () SeekEntryResult!8566)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!807931 (= res!551513 (or (= lt!361874 (MissingZero!8566 i!1163)) (= lt!361874 (MissingVacant!8566 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!43894 0))(
  ( (array!43895 (arr!21019 (Array (_ BitVec 32) (_ BitVec 64))) (size!21439 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43894)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43894 (_ BitVec 32)) SeekEntryResult!8566)

(assert (=> b!807931 (= lt!361874 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!807932 () Bool)

(declare-fun res!551512 () Bool)

(assert (=> b!807932 (=> (not res!551512) (not e!447442))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!807932 (= res!551512 (and (= (size!21439 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21439 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21439 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!807933 () Bool)

(declare-fun res!551508 () Bool)

(assert (=> b!807933 (=> (not res!551508) (not e!447442))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807933 (= res!551508 (validKeyInArray!0 k0!2044))))

(declare-fun b!807934 () Bool)

(declare-fun res!551505 () Bool)

(assert (=> b!807934 (=> (not res!551505) (not e!447442))))

(assert (=> b!807934 (= res!551505 (validKeyInArray!0 (select (arr!21019 a!3170) j!153)))))

(declare-fun b!807935 () Bool)

(declare-fun res!551504 () Bool)

(assert (=> b!807935 (=> (not res!551504) (not e!447443))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43894 (_ BitVec 32)) Bool)

(assert (=> b!807935 (= res!551504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!807936 () Bool)

(declare-fun e!447441 () Bool)

(assert (=> b!807936 (= e!447443 e!447441)))

(declare-fun res!551514 () Bool)

(assert (=> b!807936 (=> (not res!551514) (not e!447441))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!361869 () (_ BitVec 64))

(declare-fun lt!361872 () array!43894)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43894 (_ BitVec 32)) SeekEntryResult!8566)

(assert (=> b!807936 (= res!551514 (= (seekEntryOrOpen!0 lt!361869 lt!361872 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361869 lt!361872 mask!3266)))))

(assert (=> b!807936 (= lt!361869 (select (store (arr!21019 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!807936 (= lt!361872 (array!43895 (store (arr!21019 a!3170) i!1163 k0!2044) (size!21439 a!3170)))))

(declare-fun b!807937 () Bool)

(declare-fun res!551511 () Bool)

(assert (=> b!807937 (=> (not res!551511) (not e!447443))))

(declare-datatypes ((List!14889 0))(
  ( (Nil!14886) (Cons!14885 (h!16020 (_ BitVec 64)) (t!21196 List!14889)) )
))
(declare-fun arrayNoDuplicates!0 (array!43894 (_ BitVec 32) List!14889) Bool)

(assert (=> b!807937 (= res!551511 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14886))))

(declare-fun b!807929 () Bool)

(declare-fun res!551509 () Bool)

(assert (=> b!807929 (=> (not res!551509) (not e!447443))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!807929 (= res!551509 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21439 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21019 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21439 a!3170)) (= (select (arr!21019 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!551506 () Bool)

(assert (=> start!69362 (=> (not res!551506) (not e!447442))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69362 (= res!551506 (validMask!0 mask!3266))))

(assert (=> start!69362 e!447442))

(assert (=> start!69362 true))

(declare-fun array_inv!16878 (array!43894) Bool)

(assert (=> start!69362 (array_inv!16878 a!3170)))

(declare-fun b!807938 () Bool)

(declare-fun res!551507 () Bool)

(assert (=> b!807938 (=> (not res!551507) (not e!447442))))

(declare-fun arrayContainsKey!0 (array!43894 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807938 (= res!551507 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!807939 () Bool)

(assert (=> b!807939 (= e!447441 e!447445)))

(declare-fun res!551510 () Bool)

(assert (=> b!807939 (=> (not res!551510) (not e!447445))))

(declare-fun lt!361871 () SeekEntryResult!8566)

(declare-fun lt!361870 () SeekEntryResult!8566)

(assert (=> b!807939 (= res!551510 (and (= lt!361870 lt!361871) (= lt!361871 (Found!8566 j!153)) (not (= (select (arr!21019 a!3170) index!1236) (select (arr!21019 a!3170) j!153)))))))

(assert (=> b!807939 (= lt!361871 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21019 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!807939 (= lt!361870 (seekEntryOrOpen!0 (select (arr!21019 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!69362 res!551506) b!807932))

(assert (= (and b!807932 res!551512) b!807934))

(assert (= (and b!807934 res!551505) b!807933))

(assert (= (and b!807933 res!551508) b!807938))

(assert (= (and b!807938 res!551507) b!807931))

(assert (= (and b!807931 res!551513) b!807935))

(assert (= (and b!807935 res!551504) b!807937))

(assert (= (and b!807937 res!551511) b!807929))

(assert (= (and b!807929 res!551509) b!807936))

(assert (= (and b!807936 res!551514) b!807939))

(assert (= (and b!807939 res!551510) b!807930))

(declare-fun m!750271 () Bool)

(assert (=> start!69362 m!750271))

(declare-fun m!750273 () Bool)

(assert (=> start!69362 m!750273))

(declare-fun m!750275 () Bool)

(assert (=> b!807929 m!750275))

(declare-fun m!750277 () Bool)

(assert (=> b!807929 m!750277))

(declare-fun m!750279 () Bool)

(assert (=> b!807931 m!750279))

(declare-fun m!750281 () Bool)

(assert (=> b!807936 m!750281))

(declare-fun m!750283 () Bool)

(assert (=> b!807936 m!750283))

(declare-fun m!750285 () Bool)

(assert (=> b!807936 m!750285))

(declare-fun m!750287 () Bool)

(assert (=> b!807936 m!750287))

(declare-fun m!750289 () Bool)

(assert (=> b!807939 m!750289))

(declare-fun m!750291 () Bool)

(assert (=> b!807939 m!750291))

(assert (=> b!807939 m!750291))

(declare-fun m!750293 () Bool)

(assert (=> b!807939 m!750293))

(assert (=> b!807939 m!750291))

(declare-fun m!750295 () Bool)

(assert (=> b!807939 m!750295))

(declare-fun m!750297 () Bool)

(assert (=> b!807930 m!750297))

(declare-fun m!750299 () Bool)

(assert (=> b!807935 m!750299))

(declare-fun m!750301 () Bool)

(assert (=> b!807938 m!750301))

(declare-fun m!750303 () Bool)

(assert (=> b!807937 m!750303))

(declare-fun m!750305 () Bool)

(assert (=> b!807933 m!750305))

(assert (=> b!807934 m!750291))

(assert (=> b!807934 m!750291))

(declare-fun m!750307 () Bool)

(assert (=> b!807934 m!750307))

(check-sat (not b!807937) (not b!807931) (not b!807939) (not b!807933) (not b!807938) (not b!807934) (not b!807935) (not b!807930) (not start!69362) (not b!807936))
(check-sat)
