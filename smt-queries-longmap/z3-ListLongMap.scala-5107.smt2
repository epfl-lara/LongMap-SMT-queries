; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69416 () Bool)

(assert start!69416)

(declare-fun b!808820 () Bool)

(declare-fun e!447846 () Bool)

(declare-fun e!447847 () Bool)

(assert (=> b!808820 (= e!447846 e!447847)))

(declare-fun res!552396 () Bool)

(assert (=> b!808820 (=> (not res!552396) (not e!447847))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((array!43948 0))(
  ( (array!43949 (arr!21046 (Array (_ BitVec 32) (_ BitVec 64))) (size!21466 (_ BitVec 32))) )
))
(declare-fun lt!362357 () array!43948)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!362359 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8593 0))(
  ( (MissingZero!8593 (index!36740 (_ BitVec 32))) (Found!8593 (index!36741 (_ BitVec 32))) (Intermediate!8593 (undefined!9405 Bool) (index!36742 (_ BitVec 32)) (x!67707 (_ BitVec 32))) (Undefined!8593) (MissingVacant!8593 (index!36743 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43948 (_ BitVec 32)) SeekEntryResult!8593)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43948 (_ BitVec 32)) SeekEntryResult!8593)

(assert (=> b!808820 (= res!552396 (= (seekEntryOrOpen!0 lt!362359 lt!362357 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362359 lt!362357 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43948)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!808820 (= lt!362359 (select (store (arr!21046 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!808820 (= lt!362357 (array!43949 (store (arr!21046 a!3170) i!1163 k0!2044) (size!21466 a!3170)))))

(declare-fun b!808821 () Bool)

(declare-fun res!552399 () Bool)

(assert (=> b!808821 (=> (not res!552399) (not e!447846))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43948 (_ BitVec 32)) Bool)

(assert (=> b!808821 (= res!552399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!808822 () Bool)

(declare-fun res!552401 () Bool)

(declare-fun e!447848 () Bool)

(assert (=> b!808822 (=> (not res!552401) (not e!447848))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!808822 (= res!552401 (validKeyInArray!0 (select (arr!21046 a!3170) j!153)))))

(declare-fun b!808823 () Bool)

(assert (=> b!808823 (= e!447848 e!447846)))

(declare-fun res!552404 () Bool)

(assert (=> b!808823 (=> (not res!552404) (not e!447846))))

(declare-fun lt!362360 () SeekEntryResult!8593)

(assert (=> b!808823 (= res!552404 (or (= lt!362360 (MissingZero!8593 i!1163)) (= lt!362360 (MissingVacant!8593 i!1163))))))

(assert (=> b!808823 (= lt!362360 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!808824 () Bool)

(declare-fun res!552397 () Bool)

(assert (=> b!808824 (=> (not res!552397) (not e!447848))))

(declare-fun arrayContainsKey!0 (array!43948 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!808824 (= res!552397 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!808825 () Bool)

(declare-fun e!447849 () Bool)

(assert (=> b!808825 (= e!447849 false)))

(declare-fun lt!362356 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!808825 (= lt!362356 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun res!552403 () Bool)

(assert (=> start!69416 (=> (not res!552403) (not e!447848))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69416 (= res!552403 (validMask!0 mask!3266))))

(assert (=> start!69416 e!447848))

(assert (=> start!69416 true))

(declare-fun array_inv!16905 (array!43948) Bool)

(assert (=> start!69416 (array_inv!16905 a!3170)))

(declare-fun b!808826 () Bool)

(assert (=> b!808826 (= e!447847 e!447849)))

(declare-fun res!552405 () Bool)

(assert (=> b!808826 (=> (not res!552405) (not e!447849))))

(declare-fun lt!362358 () SeekEntryResult!8593)

(declare-fun lt!362355 () SeekEntryResult!8593)

(assert (=> b!808826 (= res!552405 (and (= lt!362355 lt!362358) (= lt!362358 (Found!8593 j!153)) (not (= (select (arr!21046 a!3170) index!1236) (select (arr!21046 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!808826 (= lt!362358 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21046 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!808826 (= lt!362355 (seekEntryOrOpen!0 (select (arr!21046 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!808827 () Bool)

(declare-fun res!552400 () Bool)

(assert (=> b!808827 (=> (not res!552400) (not e!447846))))

(declare-datatypes ((List!14916 0))(
  ( (Nil!14913) (Cons!14912 (h!16047 (_ BitVec 64)) (t!21223 List!14916)) )
))
(declare-fun arrayNoDuplicates!0 (array!43948 (_ BitVec 32) List!14916) Bool)

(assert (=> b!808827 (= res!552400 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14913))))

(declare-fun b!808828 () Bool)

(declare-fun res!552398 () Bool)

(assert (=> b!808828 (=> (not res!552398) (not e!447848))))

(assert (=> b!808828 (= res!552398 (and (= (size!21466 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21466 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21466 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!808829 () Bool)

(declare-fun res!552395 () Bool)

(assert (=> b!808829 (=> (not res!552395) (not e!447848))))

(assert (=> b!808829 (= res!552395 (validKeyInArray!0 k0!2044))))

(declare-fun b!808830 () Bool)

(declare-fun res!552402 () Bool)

(assert (=> b!808830 (=> (not res!552402) (not e!447846))))

(assert (=> b!808830 (= res!552402 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21466 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21046 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21466 a!3170)) (= (select (arr!21046 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!69416 res!552403) b!808828))

(assert (= (and b!808828 res!552398) b!808822))

(assert (= (and b!808822 res!552401) b!808829))

(assert (= (and b!808829 res!552395) b!808824))

(assert (= (and b!808824 res!552397) b!808823))

(assert (= (and b!808823 res!552404) b!808821))

(assert (= (and b!808821 res!552399) b!808827))

(assert (= (and b!808827 res!552400) b!808830))

(assert (= (and b!808830 res!552402) b!808820))

(assert (= (and b!808820 res!552396) b!808826))

(assert (= (and b!808826 res!552405) b!808825))

(declare-fun m!751297 () Bool)

(assert (=> b!808823 m!751297))

(declare-fun m!751299 () Bool)

(assert (=> b!808827 m!751299))

(declare-fun m!751301 () Bool)

(assert (=> b!808826 m!751301))

(declare-fun m!751303 () Bool)

(assert (=> b!808826 m!751303))

(assert (=> b!808826 m!751303))

(declare-fun m!751305 () Bool)

(assert (=> b!808826 m!751305))

(assert (=> b!808826 m!751303))

(declare-fun m!751307 () Bool)

(assert (=> b!808826 m!751307))

(assert (=> b!808822 m!751303))

(assert (=> b!808822 m!751303))

(declare-fun m!751309 () Bool)

(assert (=> b!808822 m!751309))

(declare-fun m!751311 () Bool)

(assert (=> b!808825 m!751311))

(declare-fun m!751313 () Bool)

(assert (=> start!69416 m!751313))

(declare-fun m!751315 () Bool)

(assert (=> start!69416 m!751315))

(declare-fun m!751317 () Bool)

(assert (=> b!808829 m!751317))

(declare-fun m!751319 () Bool)

(assert (=> b!808824 m!751319))

(declare-fun m!751321 () Bool)

(assert (=> b!808821 m!751321))

(declare-fun m!751323 () Bool)

(assert (=> b!808820 m!751323))

(declare-fun m!751325 () Bool)

(assert (=> b!808820 m!751325))

(declare-fun m!751327 () Bool)

(assert (=> b!808820 m!751327))

(declare-fun m!751329 () Bool)

(assert (=> b!808820 m!751329))

(declare-fun m!751331 () Bool)

(assert (=> b!808830 m!751331))

(declare-fun m!751333 () Bool)

(assert (=> b!808830 m!751333))

(check-sat (not start!69416) (not b!808829) (not b!808820) (not b!808827) (not b!808826) (not b!808823) (not b!808825) (not b!808824) (not b!808822) (not b!808821))
(check-sat)
