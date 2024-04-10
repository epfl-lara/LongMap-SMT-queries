; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86410 () Bool)

(assert start!86410)

(declare-fun b!1000151 () Bool)

(declare-fun res!669632 () Bool)

(declare-fun e!563792 () Bool)

(assert (=> b!1000151 (=> (not res!669632) (not e!563792))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000151 (= res!669632 (validKeyInArray!0 k0!2224))))

(declare-fun b!1000152 () Bool)

(declare-fun res!669635 () Bool)

(assert (=> b!1000152 (=> (not res!669635) (not e!563792))))

(declare-datatypes ((array!63211 0))(
  ( (array!63212 (arr!30431 (Array (_ BitVec 32) (_ BitVec 64))) (size!30933 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63211)

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1000152 (= res!669635 (validKeyInArray!0 (select (arr!30431 a!3219) j!170)))))

(declare-fun b!1000153 () Bool)

(declare-fun res!669633 () Bool)

(declare-fun e!563794 () Bool)

(assert (=> b!1000153 (=> (not res!669633) (not e!563794))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1000153 (= res!669633 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30933 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30933 a!3219))))))

(declare-fun b!1000154 () Bool)

(declare-fun res!669631 () Bool)

(assert (=> b!1000154 (=> (not res!669631) (not e!563792))))

(declare-fun arrayContainsKey!0 (array!63211 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000154 (= res!669631 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1000155 () Bool)

(declare-fun res!669629 () Bool)

(declare-fun e!563791 () Bool)

(assert (=> b!1000155 (=> (not res!669629) (not e!563791))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9363 0))(
  ( (MissingZero!9363 (index!39823 (_ BitVec 32))) (Found!9363 (index!39824 (_ BitVec 32))) (Intermediate!9363 (undefined!10175 Bool) (index!39825 (_ BitVec 32)) (x!87255 (_ BitVec 32))) (Undefined!9363) (MissingVacant!9363 (index!39826 (_ BitVec 32))) )
))
(declare-fun lt!442212 () SeekEntryResult!9363)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63211 (_ BitVec 32)) SeekEntryResult!9363)

(assert (=> b!1000155 (= res!669629 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30431 a!3219) j!170) a!3219 mask!3464) lt!442212))))

(declare-fun res!669637 () Bool)

(assert (=> start!86410 (=> (not res!669637) (not e!563792))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86410 (= res!669637 (validMask!0 mask!3464))))

(assert (=> start!86410 e!563792))

(declare-fun array_inv!23555 (array!63211) Bool)

(assert (=> start!86410 (array_inv!23555 a!3219)))

(assert (=> start!86410 true))

(declare-fun b!1000156 () Bool)

(declare-fun res!669634 () Bool)

(assert (=> b!1000156 (=> (not res!669634) (not e!563794))))

(declare-datatypes ((List!21107 0))(
  ( (Nil!21104) (Cons!21103 (h!22280 (_ BitVec 64)) (t!30108 List!21107)) )
))
(declare-fun arrayNoDuplicates!0 (array!63211 (_ BitVec 32) List!21107) Bool)

(assert (=> b!1000156 (= res!669634 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21104))))

(declare-fun b!1000157 () Bool)

(assert (=> b!1000157 (= e!563791 false)))

(declare-fun lt!442214 () SeekEntryResult!9363)

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000157 (= lt!442214 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30431 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30431 a!3219) i!1194 k0!2224) j!170) (array!63212 (store (arr!30431 a!3219) i!1194 k0!2224) (size!30933 a!3219)) mask!3464))))

(declare-fun b!1000158 () Bool)

(assert (=> b!1000158 (= e!563794 e!563791)))

(declare-fun res!669638 () Bool)

(assert (=> b!1000158 (=> (not res!669638) (not e!563791))))

(assert (=> b!1000158 (= res!669638 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30431 a!3219) j!170) mask!3464) (select (arr!30431 a!3219) j!170) a!3219 mask!3464) lt!442212))))

(assert (=> b!1000158 (= lt!442212 (Intermediate!9363 false resIndex!38 resX!38))))

(declare-fun b!1000159 () Bool)

(declare-fun res!669636 () Bool)

(assert (=> b!1000159 (=> (not res!669636) (not e!563792))))

(assert (=> b!1000159 (= res!669636 (and (= (size!30933 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30933 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30933 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1000160 () Bool)

(declare-fun res!669630 () Bool)

(assert (=> b!1000160 (=> (not res!669630) (not e!563794))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63211 (_ BitVec 32)) Bool)

(assert (=> b!1000160 (= res!669630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1000161 () Bool)

(assert (=> b!1000161 (= e!563792 e!563794)))

(declare-fun res!669639 () Bool)

(assert (=> b!1000161 (=> (not res!669639) (not e!563794))))

(declare-fun lt!442213 () SeekEntryResult!9363)

(assert (=> b!1000161 (= res!669639 (or (= lt!442213 (MissingVacant!9363 i!1194)) (= lt!442213 (MissingZero!9363 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63211 (_ BitVec 32)) SeekEntryResult!9363)

(assert (=> b!1000161 (= lt!442213 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(assert (= (and start!86410 res!669637) b!1000159))

(assert (= (and b!1000159 res!669636) b!1000152))

(assert (= (and b!1000152 res!669635) b!1000151))

(assert (= (and b!1000151 res!669632) b!1000154))

(assert (= (and b!1000154 res!669631) b!1000161))

(assert (= (and b!1000161 res!669639) b!1000160))

(assert (= (and b!1000160 res!669630) b!1000156))

(assert (= (and b!1000156 res!669634) b!1000153))

(assert (= (and b!1000153 res!669633) b!1000158))

(assert (= (and b!1000158 res!669638) b!1000155))

(assert (= (and b!1000155 res!669629) b!1000157))

(declare-fun m!926335 () Bool)

(assert (=> b!1000155 m!926335))

(assert (=> b!1000155 m!926335))

(declare-fun m!926337 () Bool)

(assert (=> b!1000155 m!926337))

(declare-fun m!926339 () Bool)

(assert (=> b!1000160 m!926339))

(declare-fun m!926341 () Bool)

(assert (=> b!1000157 m!926341))

(declare-fun m!926343 () Bool)

(assert (=> b!1000157 m!926343))

(assert (=> b!1000157 m!926343))

(declare-fun m!926345 () Bool)

(assert (=> b!1000157 m!926345))

(assert (=> b!1000157 m!926345))

(assert (=> b!1000157 m!926343))

(declare-fun m!926347 () Bool)

(assert (=> b!1000157 m!926347))

(declare-fun m!926349 () Bool)

(assert (=> start!86410 m!926349))

(declare-fun m!926351 () Bool)

(assert (=> start!86410 m!926351))

(assert (=> b!1000152 m!926335))

(assert (=> b!1000152 m!926335))

(declare-fun m!926353 () Bool)

(assert (=> b!1000152 m!926353))

(assert (=> b!1000158 m!926335))

(assert (=> b!1000158 m!926335))

(declare-fun m!926355 () Bool)

(assert (=> b!1000158 m!926355))

(assert (=> b!1000158 m!926355))

(assert (=> b!1000158 m!926335))

(declare-fun m!926357 () Bool)

(assert (=> b!1000158 m!926357))

(declare-fun m!926359 () Bool)

(assert (=> b!1000151 m!926359))

(declare-fun m!926361 () Bool)

(assert (=> b!1000161 m!926361))

(declare-fun m!926363 () Bool)

(assert (=> b!1000156 m!926363))

(declare-fun m!926365 () Bool)

(assert (=> b!1000154 m!926365))

(check-sat (not b!1000157) (not b!1000160) (not start!86410) (not b!1000161) (not b!1000151) (not b!1000152) (not b!1000154) (not b!1000156) (not b!1000158) (not b!1000155))
(check-sat)
