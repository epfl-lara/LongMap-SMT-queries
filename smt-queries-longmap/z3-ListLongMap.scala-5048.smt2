; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68800 () Bool)

(assert start!68800)

(declare-fun b!801881 () Bool)

(declare-fun res!546408 () Bool)

(declare-fun e!444454 () Bool)

(assert (=> b!801881 (=> (not res!546408) (not e!444454))))

(declare-datatypes ((array!43590 0))(
  ( (array!43591 (arr!20875 (Array (_ BitVec 32) (_ BitVec 64))) (size!21296 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43590)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43590 (_ BitVec 32)) Bool)

(assert (=> b!801881 (= res!546408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!801882 () Bool)

(declare-fun e!444455 () Bool)

(assert (=> b!801882 (= e!444454 e!444455)))

(declare-fun res!546400 () Bool)

(assert (=> b!801882 (=> (not res!546400) (not e!444455))))

(declare-fun lt!358500 () array!43590)

(declare-fun lt!358505 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8466 0))(
  ( (MissingZero!8466 (index!36232 (_ BitVec 32))) (Found!8466 (index!36233 (_ BitVec 32))) (Intermediate!8466 (undefined!9278 Bool) (index!36234 (_ BitVec 32)) (x!67088 (_ BitVec 32))) (Undefined!8466) (MissingVacant!8466 (index!36235 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43590 (_ BitVec 32)) SeekEntryResult!8466)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43590 (_ BitVec 32)) SeekEntryResult!8466)

(assert (=> b!801882 (= res!546400 (= (seekEntryOrOpen!0 lt!358505 lt!358500 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358505 lt!358500 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!801882 (= lt!358505 (select (store (arr!20875 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!801882 (= lt!358500 (array!43591 (store (arr!20875 a!3170) i!1163 k0!2044) (size!21296 a!3170)))))

(declare-fun b!801883 () Bool)

(declare-fun e!444458 () Bool)

(assert (=> b!801883 (= e!444458 (not true))))

(declare-fun lt!358503 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!801883 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358503 vacantAfter!23 lt!358505 lt!358500 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358503 vacantBefore!23 (select (arr!20875 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27472 0))(
  ( (Unit!27473) )
))
(declare-fun lt!358502 () Unit!27472)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43590 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27472)

(assert (=> b!801883 (= lt!358502 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!358503 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801883 (= lt!358503 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!801884 () Bool)

(declare-fun res!546406 () Bool)

(declare-fun e!444457 () Bool)

(assert (=> b!801884 (=> (not res!546406) (not e!444457))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801884 (= res!546406 (validKeyInArray!0 k0!2044))))

(declare-fun b!801885 () Bool)

(assert (=> b!801885 (= e!444457 e!444454)))

(declare-fun res!546409 () Bool)

(assert (=> b!801885 (=> (not res!546409) (not e!444454))))

(declare-fun lt!358504 () SeekEntryResult!8466)

(assert (=> b!801885 (= res!546409 (or (= lt!358504 (MissingZero!8466 i!1163)) (= lt!358504 (MissingVacant!8466 i!1163))))))

(assert (=> b!801885 (= lt!358504 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!801886 () Bool)

(assert (=> b!801886 (= e!444455 e!444458)))

(declare-fun res!546410 () Bool)

(assert (=> b!801886 (=> (not res!546410) (not e!444458))))

(declare-fun lt!358501 () SeekEntryResult!8466)

(declare-fun lt!358499 () SeekEntryResult!8466)

(assert (=> b!801886 (= res!546410 (and (= lt!358499 lt!358501) (= lt!358501 (Found!8466 j!153)) (not (= (select (arr!20875 a!3170) index!1236) (select (arr!20875 a!3170) j!153)))))))

(assert (=> b!801886 (= lt!358501 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20875 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!801886 (= lt!358499 (seekEntryOrOpen!0 (select (arr!20875 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801887 () Bool)

(declare-fun res!546404 () Bool)

(assert (=> b!801887 (=> (not res!546404) (not e!444454))))

(assert (=> b!801887 (= res!546404 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21296 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20875 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21296 a!3170)) (= (select (arr!20875 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!546407 () Bool)

(assert (=> start!68800 (=> (not res!546407) (not e!444457))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68800 (= res!546407 (validMask!0 mask!3266))))

(assert (=> start!68800 e!444457))

(assert (=> start!68800 true))

(declare-fun array_inv!16671 (array!43590) Bool)

(assert (=> start!68800 (array_inv!16671 a!3170)))

(declare-fun b!801888 () Bool)

(declare-fun res!546403 () Bool)

(assert (=> b!801888 (=> (not res!546403) (not e!444454))))

(declare-datatypes ((List!14838 0))(
  ( (Nil!14835) (Cons!14834 (h!15963 (_ BitVec 64)) (t!21153 List!14838)) )
))
(declare-fun arrayNoDuplicates!0 (array!43590 (_ BitVec 32) List!14838) Bool)

(assert (=> b!801888 (= res!546403 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14835))))

(declare-fun b!801889 () Bool)

(declare-fun res!546402 () Bool)

(assert (=> b!801889 (=> (not res!546402) (not e!444457))))

(assert (=> b!801889 (= res!546402 (validKeyInArray!0 (select (arr!20875 a!3170) j!153)))))

(declare-fun b!801890 () Bool)

(declare-fun res!546401 () Bool)

(assert (=> b!801890 (=> (not res!546401) (not e!444457))))

(assert (=> b!801890 (= res!546401 (and (= (size!21296 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21296 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21296 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!801891 () Bool)

(declare-fun res!546405 () Bool)

(assert (=> b!801891 (=> (not res!546405) (not e!444457))))

(declare-fun arrayContainsKey!0 (array!43590 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801891 (= res!546405 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68800 res!546407) b!801890))

(assert (= (and b!801890 res!546401) b!801889))

(assert (= (and b!801889 res!546402) b!801884))

(assert (= (and b!801884 res!546406) b!801891))

(assert (= (and b!801891 res!546405) b!801885))

(assert (= (and b!801885 res!546409) b!801881))

(assert (= (and b!801881 res!546408) b!801888))

(assert (= (and b!801888 res!546403) b!801887))

(assert (= (and b!801887 res!546404) b!801882))

(assert (= (and b!801882 res!546400) b!801886))

(assert (= (and b!801886 res!546410) b!801883))

(declare-fun m!743143 () Bool)

(assert (=> b!801882 m!743143))

(declare-fun m!743145 () Bool)

(assert (=> b!801882 m!743145))

(declare-fun m!743147 () Bool)

(assert (=> b!801882 m!743147))

(declare-fun m!743149 () Bool)

(assert (=> b!801882 m!743149))

(declare-fun m!743151 () Bool)

(assert (=> b!801891 m!743151))

(declare-fun m!743153 () Bool)

(assert (=> b!801881 m!743153))

(declare-fun m!743155 () Bool)

(assert (=> b!801887 m!743155))

(declare-fun m!743157 () Bool)

(assert (=> b!801887 m!743157))

(declare-fun m!743159 () Bool)

(assert (=> b!801885 m!743159))

(declare-fun m!743161 () Bool)

(assert (=> b!801886 m!743161))

(declare-fun m!743163 () Bool)

(assert (=> b!801886 m!743163))

(assert (=> b!801886 m!743163))

(declare-fun m!743165 () Bool)

(assert (=> b!801886 m!743165))

(assert (=> b!801886 m!743163))

(declare-fun m!743167 () Bool)

(assert (=> b!801886 m!743167))

(declare-fun m!743169 () Bool)

(assert (=> start!68800 m!743169))

(declare-fun m!743171 () Bool)

(assert (=> start!68800 m!743171))

(assert (=> b!801889 m!743163))

(assert (=> b!801889 m!743163))

(declare-fun m!743173 () Bool)

(assert (=> b!801889 m!743173))

(declare-fun m!743175 () Bool)

(assert (=> b!801884 m!743175))

(assert (=> b!801883 m!743163))

(declare-fun m!743177 () Bool)

(assert (=> b!801883 m!743177))

(assert (=> b!801883 m!743163))

(declare-fun m!743179 () Bool)

(assert (=> b!801883 m!743179))

(declare-fun m!743181 () Bool)

(assert (=> b!801883 m!743181))

(declare-fun m!743183 () Bool)

(assert (=> b!801883 m!743183))

(declare-fun m!743185 () Bool)

(assert (=> b!801888 m!743185))

(check-sat (not b!801881) (not b!801891) (not b!801885) (not b!801889) (not b!801883) (not b!801886) (not b!801882) (not b!801888) (not start!68800) (not b!801884))
(check-sat)
