; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69356 () Bool)

(assert start!69356)

(declare-fun b!807830 () Bool)

(declare-fun res!551409 () Bool)

(declare-fun e!447398 () Bool)

(assert (=> b!807830 (=> (not res!551409) (not e!447398))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807830 (= res!551409 (validKeyInArray!0 k0!2044))))

(declare-fun b!807831 () Bool)

(declare-fun e!447399 () Bool)

(declare-fun e!447397 () Bool)

(assert (=> b!807831 (= e!447399 e!447397)))

(declare-fun res!551411 () Bool)

(assert (=> b!807831 (=> (not res!551411) (not e!447397))))

(declare-datatypes ((SeekEntryResult!8563 0))(
  ( (MissingZero!8563 (index!36620 (_ BitVec 32))) (Found!8563 (index!36621 (_ BitVec 32))) (Intermediate!8563 (undefined!9375 Bool) (index!36622 (_ BitVec 32)) (x!67597 (_ BitVec 32))) (Undefined!8563) (MissingVacant!8563 (index!36623 (_ BitVec 32))) )
))
(declare-fun lt!361817 () SeekEntryResult!8563)

(declare-fun lt!361819 () SeekEntryResult!8563)

(declare-datatypes ((array!43888 0))(
  ( (array!43889 (arr!21016 (Array (_ BitVec 32) (_ BitVec 64))) (size!21436 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43888)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!807831 (= res!551411 (and (= lt!361819 lt!361817) (= lt!361817 (Found!8563 j!153)) (not (= (select (arr!21016 a!3170) index!1236) (select (arr!21016 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43888 (_ BitVec 32)) SeekEntryResult!8563)

(assert (=> b!807831 (= lt!361817 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21016 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43888 (_ BitVec 32)) SeekEntryResult!8563)

(assert (=> b!807831 (= lt!361819 (seekEntryOrOpen!0 (select (arr!21016 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!807832 () Bool)

(declare-fun res!551412 () Bool)

(assert (=> b!807832 (=> (not res!551412) (not e!447398))))

(assert (=> b!807832 (= res!551412 (validKeyInArray!0 (select (arr!21016 a!3170) j!153)))))

(declare-fun b!807834 () Bool)

(declare-fun e!447396 () Bool)

(assert (=> b!807834 (= e!447396 e!447399)))

(declare-fun res!551407 () Bool)

(assert (=> b!807834 (=> (not res!551407) (not e!447399))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!361820 () (_ BitVec 64))

(declare-fun lt!361816 () array!43888)

(assert (=> b!807834 (= res!551407 (= (seekEntryOrOpen!0 lt!361820 lt!361816 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361820 lt!361816 mask!3266)))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!807834 (= lt!361820 (select (store (arr!21016 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!807834 (= lt!361816 (array!43889 (store (arr!21016 a!3170) i!1163 k0!2044) (size!21436 a!3170)))))

(declare-fun b!807835 () Bool)

(declare-fun res!551406 () Bool)

(assert (=> b!807835 (=> (not res!551406) (not e!447398))))

(declare-fun arrayContainsKey!0 (array!43888 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807835 (= res!551406 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!807836 () Bool)

(declare-fun res!551414 () Bool)

(assert (=> b!807836 (=> (not res!551414) (not e!447396))))

(assert (=> b!807836 (= res!551414 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21436 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21016 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21436 a!3170)) (= (select (arr!21016 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!807837 () Bool)

(declare-fun res!551408 () Bool)

(assert (=> b!807837 (=> (not res!551408) (not e!447396))))

(declare-datatypes ((List!14886 0))(
  ( (Nil!14883) (Cons!14882 (h!16017 (_ BitVec 64)) (t!21193 List!14886)) )
))
(declare-fun arrayNoDuplicates!0 (array!43888 (_ BitVec 32) List!14886) Bool)

(assert (=> b!807837 (= res!551408 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14883))))

(declare-fun b!807838 () Bool)

(assert (=> b!807838 (= e!447397 false)))

(declare-fun lt!361815 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!807838 (= lt!361815 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!807839 () Bool)

(declare-fun res!551415 () Bool)

(assert (=> b!807839 (=> (not res!551415) (not e!447398))))

(assert (=> b!807839 (= res!551415 (and (= (size!21436 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21436 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21436 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!807840 () Bool)

(declare-fun res!551413 () Bool)

(assert (=> b!807840 (=> (not res!551413) (not e!447396))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43888 (_ BitVec 32)) Bool)

(assert (=> b!807840 (= res!551413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!551405 () Bool)

(assert (=> start!69356 (=> (not res!551405) (not e!447398))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69356 (= res!551405 (validMask!0 mask!3266))))

(assert (=> start!69356 e!447398))

(assert (=> start!69356 true))

(declare-fun array_inv!16875 (array!43888) Bool)

(assert (=> start!69356 (array_inv!16875 a!3170)))

(declare-fun b!807833 () Bool)

(assert (=> b!807833 (= e!447398 e!447396)))

(declare-fun res!551410 () Bool)

(assert (=> b!807833 (=> (not res!551410) (not e!447396))))

(declare-fun lt!361818 () SeekEntryResult!8563)

(assert (=> b!807833 (= res!551410 (or (= lt!361818 (MissingZero!8563 i!1163)) (= lt!361818 (MissingVacant!8563 i!1163))))))

(assert (=> b!807833 (= lt!361818 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(assert (= (and start!69356 res!551405) b!807839))

(assert (= (and b!807839 res!551415) b!807832))

(assert (= (and b!807832 res!551412) b!807830))

(assert (= (and b!807830 res!551409) b!807835))

(assert (= (and b!807835 res!551406) b!807833))

(assert (= (and b!807833 res!551410) b!807840))

(assert (= (and b!807840 res!551413) b!807837))

(assert (= (and b!807837 res!551408) b!807836))

(assert (= (and b!807836 res!551414) b!807834))

(assert (= (and b!807834 res!551407) b!807831))

(assert (= (and b!807831 res!551411) b!807838))

(declare-fun m!750157 () Bool)

(assert (=> b!807832 m!750157))

(assert (=> b!807832 m!750157))

(declare-fun m!750159 () Bool)

(assert (=> b!807832 m!750159))

(declare-fun m!750161 () Bool)

(assert (=> start!69356 m!750161))

(declare-fun m!750163 () Bool)

(assert (=> start!69356 m!750163))

(declare-fun m!750165 () Bool)

(assert (=> b!807840 m!750165))

(declare-fun m!750167 () Bool)

(assert (=> b!807834 m!750167))

(declare-fun m!750169 () Bool)

(assert (=> b!807834 m!750169))

(declare-fun m!750171 () Bool)

(assert (=> b!807834 m!750171))

(declare-fun m!750173 () Bool)

(assert (=> b!807834 m!750173))

(declare-fun m!750175 () Bool)

(assert (=> b!807830 m!750175))

(declare-fun m!750177 () Bool)

(assert (=> b!807831 m!750177))

(assert (=> b!807831 m!750157))

(assert (=> b!807831 m!750157))

(declare-fun m!750179 () Bool)

(assert (=> b!807831 m!750179))

(assert (=> b!807831 m!750157))

(declare-fun m!750181 () Bool)

(assert (=> b!807831 m!750181))

(declare-fun m!750183 () Bool)

(assert (=> b!807837 m!750183))

(declare-fun m!750185 () Bool)

(assert (=> b!807833 m!750185))

(declare-fun m!750187 () Bool)

(assert (=> b!807838 m!750187))

(declare-fun m!750189 () Bool)

(assert (=> b!807835 m!750189))

(declare-fun m!750191 () Bool)

(assert (=> b!807836 m!750191))

(declare-fun m!750193 () Bool)

(assert (=> b!807836 m!750193))

(check-sat (not start!69356) (not b!807838) (not b!807840) (not b!807837) (not b!807832) (not b!807830) (not b!807835) (not b!807834) (not b!807831) (not b!807833))
(check-sat)
