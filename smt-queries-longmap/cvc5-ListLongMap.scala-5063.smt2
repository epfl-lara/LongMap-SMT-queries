; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68888 () Bool)

(assert start!68888)

(declare-fun b!803398 () Bool)

(declare-fun res!547918 () Bool)

(declare-fun e!445181 () Bool)

(assert (=> b!803398 (=> (not res!547918) (not e!445181))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43678 0))(
  ( (array!43679 (arr!20919 (Array (_ BitVec 32) (_ BitVec 64))) (size!21340 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43678)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!803398 (= res!547918 (and (= (size!21340 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21340 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21340 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!803399 () Bool)

(declare-fun res!547917 () Bool)

(assert (=> b!803399 (=> (not res!547917) (not e!445181))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43678 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803399 (= res!547917 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!803400 () Bool)

(declare-fun res!547922 () Bool)

(declare-fun e!445182 () Bool)

(assert (=> b!803400 (=> (not res!547922) (not e!445182))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43678 (_ BitVec 32)) Bool)

(assert (=> b!803400 (= res!547922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!803401 () Bool)

(declare-fun res!547923 () Bool)

(assert (=> b!803401 (=> (not res!547923) (not e!445181))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803401 (= res!547923 (validKeyInArray!0 (select (arr!20919 a!3170) j!153)))))

(declare-fun b!803402 () Bool)

(declare-fun res!547921 () Bool)

(assert (=> b!803402 (=> (not res!547921) (not e!445182))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!803402 (= res!547921 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21340 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20919 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21340 a!3170)) (= (select (arr!20919 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!803403 () Bool)

(declare-fun e!445184 () Bool)

(declare-fun e!445179 () Bool)

(assert (=> b!803403 (= e!445184 e!445179)))

(declare-fun res!547919 () Bool)

(assert (=> b!803403 (=> (not res!547919) (not e!445179))))

(declare-datatypes ((SeekEntryResult!8510 0))(
  ( (MissingZero!8510 (index!36408 (_ BitVec 32))) (Found!8510 (index!36409 (_ BitVec 32))) (Intermediate!8510 (undefined!9322 Bool) (index!36410 (_ BitVec 32)) (x!67252 (_ BitVec 32))) (Undefined!8510) (MissingVacant!8510 (index!36411 (_ BitVec 32))) )
))
(declare-fun lt!359565 () SeekEntryResult!8510)

(declare-fun lt!359571 () SeekEntryResult!8510)

(assert (=> b!803403 (= res!547919 (and (= lt!359571 lt!359565) (not (= (select (arr!20919 a!3170) index!1236) (select (arr!20919 a!3170) j!153)))))))

(assert (=> b!803403 (= lt!359565 (Found!8510 j!153))))

(declare-fun b!803404 () Bool)

(assert (=> b!803404 (= e!445181 e!445182)))

(declare-fun res!547927 () Bool)

(assert (=> b!803404 (=> (not res!547927) (not e!445182))))

(declare-fun lt!359569 () SeekEntryResult!8510)

(assert (=> b!803404 (= res!547927 (or (= lt!359569 (MissingZero!8510 i!1163)) (= lt!359569 (MissingVacant!8510 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43678 (_ BitVec 32)) SeekEntryResult!8510)

(assert (=> b!803404 (= lt!359569 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!803405 () Bool)

(declare-fun e!445180 () Bool)

(assert (=> b!803405 (= e!445180 e!445184)))

(declare-fun res!547925 () Bool)

(assert (=> b!803405 (=> (not res!547925) (not e!445184))))

(declare-fun lt!359568 () SeekEntryResult!8510)

(assert (=> b!803405 (= res!547925 (= lt!359568 lt!359571))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43678 (_ BitVec 32)) SeekEntryResult!8510)

(assert (=> b!803405 (= lt!359571 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20919 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!803405 (= lt!359568 (seekEntryOrOpen!0 (select (arr!20919 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!803406 () Bool)

(declare-fun res!547928 () Bool)

(assert (=> b!803406 (=> (not res!547928) (not e!445182))))

(declare-datatypes ((List!14882 0))(
  ( (Nil!14879) (Cons!14878 (h!16007 (_ BitVec 64)) (t!21197 List!14882)) )
))
(declare-fun arrayNoDuplicates!0 (array!43678 (_ BitVec 32) List!14882) Bool)

(assert (=> b!803406 (= res!547928 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14879))))

(declare-fun b!803407 () Bool)

(assert (=> b!803407 (= e!445182 e!445180)))

(declare-fun res!547924 () Bool)

(assert (=> b!803407 (=> (not res!547924) (not e!445180))))

(declare-fun lt!359567 () SeekEntryResult!8510)

(declare-fun lt!359573 () SeekEntryResult!8510)

(assert (=> b!803407 (= res!547924 (= lt!359567 lt!359573))))

(declare-fun lt!359566 () array!43678)

(declare-fun lt!359564 () (_ BitVec 64))

(assert (=> b!803407 (= lt!359573 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359564 lt!359566 mask!3266))))

(assert (=> b!803407 (= lt!359567 (seekEntryOrOpen!0 lt!359564 lt!359566 mask!3266))))

(assert (=> b!803407 (= lt!359564 (select (store (arr!20919 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!803407 (= lt!359566 (array!43679 (store (arr!20919 a!3170) i!1163 k!2044) (size!21340 a!3170)))))

(declare-fun b!803409 () Bool)

(declare-fun res!547926 () Bool)

(assert (=> b!803409 (=> (not res!547926) (not e!445181))))

(assert (=> b!803409 (= res!547926 (validKeyInArray!0 k!2044))))

(declare-fun b!803408 () Bool)

(assert (=> b!803408 (= e!445179 (not (or (not (= lt!359573 lt!359565)) (bvsge mask!3266 #b00000000000000000000000000000000))))))

(declare-fun lt!359570 () (_ BitVec 32))

(assert (=> b!803408 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359570 vacantAfter!23 lt!359564 lt!359566 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359570 vacantBefore!23 (select (arr!20919 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27560 0))(
  ( (Unit!27561) )
))
(declare-fun lt!359572 () Unit!27560)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43678 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27560)

(assert (=> b!803408 (= lt!359572 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!359570 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803408 (= lt!359570 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun res!547920 () Bool)

(assert (=> start!68888 (=> (not res!547920) (not e!445181))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68888 (= res!547920 (validMask!0 mask!3266))))

(assert (=> start!68888 e!445181))

(assert (=> start!68888 true))

(declare-fun array_inv!16715 (array!43678) Bool)

(assert (=> start!68888 (array_inv!16715 a!3170)))

(assert (= (and start!68888 res!547920) b!803398))

(assert (= (and b!803398 res!547918) b!803401))

(assert (= (and b!803401 res!547923) b!803409))

(assert (= (and b!803409 res!547926) b!803399))

(assert (= (and b!803399 res!547917) b!803404))

(assert (= (and b!803404 res!547927) b!803400))

(assert (= (and b!803400 res!547922) b!803406))

(assert (= (and b!803406 res!547928) b!803402))

(assert (= (and b!803402 res!547921) b!803407))

(assert (= (and b!803407 res!547924) b!803405))

(assert (= (and b!803405 res!547925) b!803403))

(assert (= (and b!803403 res!547919) b!803408))

(declare-fun m!745115 () Bool)

(assert (=> b!803409 m!745115))

(declare-fun m!745117 () Bool)

(assert (=> b!803403 m!745117))

(declare-fun m!745119 () Bool)

(assert (=> b!803403 m!745119))

(assert (=> b!803405 m!745119))

(assert (=> b!803405 m!745119))

(declare-fun m!745121 () Bool)

(assert (=> b!803405 m!745121))

(assert (=> b!803405 m!745119))

(declare-fun m!745123 () Bool)

(assert (=> b!803405 m!745123))

(declare-fun m!745125 () Bool)

(assert (=> b!803404 m!745125))

(assert (=> b!803408 m!745119))

(declare-fun m!745127 () Bool)

(assert (=> b!803408 m!745127))

(declare-fun m!745129 () Bool)

(assert (=> b!803408 m!745129))

(declare-fun m!745131 () Bool)

(assert (=> b!803408 m!745131))

(assert (=> b!803408 m!745119))

(declare-fun m!745133 () Bool)

(assert (=> b!803408 m!745133))

(declare-fun m!745135 () Bool)

(assert (=> start!68888 m!745135))

(declare-fun m!745137 () Bool)

(assert (=> start!68888 m!745137))

(declare-fun m!745139 () Bool)

(assert (=> b!803402 m!745139))

(declare-fun m!745141 () Bool)

(assert (=> b!803402 m!745141))

(declare-fun m!745143 () Bool)

(assert (=> b!803406 m!745143))

(declare-fun m!745145 () Bool)

(assert (=> b!803400 m!745145))

(declare-fun m!745147 () Bool)

(assert (=> b!803399 m!745147))

(assert (=> b!803401 m!745119))

(assert (=> b!803401 m!745119))

(declare-fun m!745149 () Bool)

(assert (=> b!803401 m!745149))

(declare-fun m!745151 () Bool)

(assert (=> b!803407 m!745151))

(declare-fun m!745153 () Bool)

(assert (=> b!803407 m!745153))

(declare-fun m!745155 () Bool)

(assert (=> b!803407 m!745155))

(declare-fun m!745157 () Bool)

(assert (=> b!803407 m!745157))

(push 1)

