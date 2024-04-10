; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68882 () Bool)

(assert start!68882)

(declare-fun b!803297 () Bool)

(declare-fun e!445135 () Bool)

(assert (=> b!803297 (= e!445135 (not true))))

(declare-fun lt!359501 () (_ BitVec 64))

(declare-datatypes ((array!43672 0))(
  ( (array!43673 (arr!20916 (Array (_ BitVec 32) (_ BitVec 64))) (size!21337 (_ BitVec 32))) )
))
(declare-fun lt!359499 () array!43672)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun a!3170 () array!43672)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun lt!359500 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8507 0))(
  ( (MissingZero!8507 (index!36396 (_ BitVec 32))) (Found!8507 (index!36397 (_ BitVec 32))) (Intermediate!8507 (undefined!9319 Bool) (index!36398 (_ BitVec 32)) (x!67241 (_ BitVec 32))) (Undefined!8507) (MissingVacant!8507 (index!36399 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43672 (_ BitVec 32)) SeekEntryResult!8507)

(assert (=> b!803297 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359500 vacantAfter!23 lt!359501 lt!359499 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359500 vacantBefore!23 (select (arr!20916 a!3170) j!153) a!3170 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((Unit!27554 0))(
  ( (Unit!27555) )
))
(declare-fun lt!359496 () Unit!27554)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43672 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27554)

(assert (=> b!803297 (= lt!359496 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!359500 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803297 (= lt!359500 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!803298 () Bool)

(declare-fun e!445132 () Bool)

(declare-fun e!445133 () Bool)

(assert (=> b!803298 (= e!445132 e!445133)))

(declare-fun res!547826 () Bool)

(assert (=> b!803298 (=> (not res!547826) (not e!445133))))

(declare-fun lt!359498 () SeekEntryResult!8507)

(assert (=> b!803298 (= res!547826 (or (= lt!359498 (MissingZero!8507 i!1163)) (= lt!359498 (MissingVacant!8507 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43672 (_ BitVec 32)) SeekEntryResult!8507)

(assert (=> b!803298 (= lt!359498 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun res!547821 () Bool)

(assert (=> start!68882 (=> (not res!547821) (not e!445132))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68882 (= res!547821 (validMask!0 mask!3266))))

(assert (=> start!68882 e!445132))

(assert (=> start!68882 true))

(declare-fun array_inv!16712 (array!43672) Bool)

(assert (=> start!68882 (array_inv!16712 a!3170)))

(declare-fun b!803299 () Bool)

(declare-fun res!547816 () Bool)

(assert (=> b!803299 (=> (not res!547816) (not e!445133))))

(assert (=> b!803299 (= res!547816 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21337 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20916 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21337 a!3170)) (= (select (arr!20916 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!803300 () Bool)

(declare-fun res!547819 () Bool)

(assert (=> b!803300 (=> (not res!547819) (not e!445132))))

(assert (=> b!803300 (= res!547819 (and (= (size!21337 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21337 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21337 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!803301 () Bool)

(declare-fun e!445134 () Bool)

(assert (=> b!803301 (= e!445133 e!445134)))

(declare-fun res!547820 () Bool)

(assert (=> b!803301 (=> (not res!547820) (not e!445134))))

(assert (=> b!803301 (= res!547820 (= (seekEntryOrOpen!0 lt!359501 lt!359499 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359501 lt!359499 mask!3266)))))

(assert (=> b!803301 (= lt!359501 (select (store (arr!20916 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!803301 (= lt!359499 (array!43673 (store (arr!20916 a!3170) i!1163 k!2044) (size!21337 a!3170)))))

(declare-fun b!803302 () Bool)

(declare-fun res!547823 () Bool)

(assert (=> b!803302 (=> (not res!547823) (not e!445132))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803302 (= res!547823 (validKeyInArray!0 k!2044))))

(declare-fun b!803303 () Bool)

(declare-fun res!547825 () Bool)

(assert (=> b!803303 (=> (not res!547825) (not e!445133))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43672 (_ BitVec 32)) Bool)

(assert (=> b!803303 (= res!547825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!803304 () Bool)

(declare-fun res!547822 () Bool)

(assert (=> b!803304 (=> (not res!547822) (not e!445133))))

(declare-datatypes ((List!14879 0))(
  ( (Nil!14876) (Cons!14875 (h!16004 (_ BitVec 64)) (t!21194 List!14879)) )
))
(declare-fun arrayNoDuplicates!0 (array!43672 (_ BitVec 32) List!14879) Bool)

(assert (=> b!803304 (= res!547822 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14876))))

(declare-fun b!803305 () Bool)

(declare-fun res!547817 () Bool)

(assert (=> b!803305 (=> (not res!547817) (not e!445132))))

(declare-fun arrayContainsKey!0 (array!43672 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803305 (= res!547817 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!803306 () Bool)

(declare-fun res!547818 () Bool)

(assert (=> b!803306 (=> (not res!547818) (not e!445132))))

(assert (=> b!803306 (= res!547818 (validKeyInArray!0 (select (arr!20916 a!3170) j!153)))))

(declare-fun b!803307 () Bool)

(assert (=> b!803307 (= e!445134 e!445135)))

(declare-fun res!547824 () Bool)

(assert (=> b!803307 (=> (not res!547824) (not e!445135))))

(declare-fun lt!359495 () SeekEntryResult!8507)

(declare-fun lt!359497 () SeekEntryResult!8507)

(assert (=> b!803307 (= res!547824 (and (= lt!359495 lt!359497) (= lt!359497 (Found!8507 j!153)) (not (= (select (arr!20916 a!3170) index!1236) (select (arr!20916 a!3170) j!153)))))))

(assert (=> b!803307 (= lt!359497 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20916 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!803307 (= lt!359495 (seekEntryOrOpen!0 (select (arr!20916 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!68882 res!547821) b!803300))

(assert (= (and b!803300 res!547819) b!803306))

(assert (= (and b!803306 res!547818) b!803302))

(assert (= (and b!803302 res!547823) b!803305))

(assert (= (and b!803305 res!547817) b!803298))

(assert (= (and b!803298 res!547826) b!803303))

(assert (= (and b!803303 res!547825) b!803304))

(assert (= (and b!803304 res!547822) b!803299))

(assert (= (and b!803299 res!547816) b!803301))

(assert (= (and b!803301 res!547820) b!803307))

(assert (= (and b!803307 res!547824) b!803297))

(declare-fun m!744983 () Bool)

(assert (=> b!803301 m!744983))

(declare-fun m!744985 () Bool)

(assert (=> b!803301 m!744985))

(declare-fun m!744987 () Bool)

(assert (=> b!803301 m!744987))

(declare-fun m!744989 () Bool)

(assert (=> b!803301 m!744989))

(declare-fun m!744991 () Bool)

(assert (=> b!803306 m!744991))

(assert (=> b!803306 m!744991))

(declare-fun m!744993 () Bool)

(assert (=> b!803306 m!744993))

(declare-fun m!744995 () Bool)

(assert (=> start!68882 m!744995))

(declare-fun m!744997 () Bool)

(assert (=> start!68882 m!744997))

(assert (=> b!803297 m!744991))

(declare-fun m!744999 () Bool)

(assert (=> b!803297 m!744999))

(assert (=> b!803297 m!744991))

(declare-fun m!745001 () Bool)

(assert (=> b!803297 m!745001))

(declare-fun m!745003 () Bool)

(assert (=> b!803297 m!745003))

(declare-fun m!745005 () Bool)

(assert (=> b!803297 m!745005))

(declare-fun m!745007 () Bool)

(assert (=> b!803298 m!745007))

(declare-fun m!745009 () Bool)

(assert (=> b!803304 m!745009))

(declare-fun m!745011 () Bool)

(assert (=> b!803302 m!745011))

(declare-fun m!745013 () Bool)

(assert (=> b!803307 m!745013))

(assert (=> b!803307 m!744991))

(assert (=> b!803307 m!744991))

(declare-fun m!745015 () Bool)

(assert (=> b!803307 m!745015))

(assert (=> b!803307 m!744991))

(declare-fun m!745017 () Bool)

(assert (=> b!803307 m!745017))

(declare-fun m!745019 () Bool)

(assert (=> b!803305 m!745019))

(declare-fun m!745021 () Bool)

(assert (=> b!803303 m!745021))

(declare-fun m!745023 () Bool)

(assert (=> b!803299 m!745023))

(declare-fun m!745025 () Bool)

(assert (=> b!803299 m!745025))

(push 1)

