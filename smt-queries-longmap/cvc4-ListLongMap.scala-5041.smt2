; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68760 () Bool)

(assert start!68760)

(declare-fun b!801147 () Bool)

(declare-fun res!545666 () Bool)

(declare-fun e!444122 () Bool)

(assert (=> b!801147 (=> (not res!545666) (not e!444122))))

(declare-datatypes ((array!43550 0))(
  ( (array!43551 (arr!20855 (Array (_ BitVec 32) (_ BitVec 64))) (size!21276 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43550)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43550 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801147 (= res!545666 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun res!545670 () Bool)

(assert (=> start!68760 (=> (not res!545670) (not e!444122))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68760 (= res!545670 (validMask!0 mask!3266))))

(assert (=> start!68760 e!444122))

(assert (=> start!68760 true))

(declare-fun array_inv!16651 (array!43550) Bool)

(assert (=> start!68760 (array_inv!16651 a!3170)))

(declare-fun b!801148 () Bool)

(declare-fun res!545668 () Bool)

(declare-fun e!444118 () Bool)

(assert (=> b!801148 (=> (not res!545668) (not e!444118))))

(declare-datatypes ((List!14818 0))(
  ( (Nil!14815) (Cons!14814 (h!15943 (_ BitVec 64)) (t!21133 List!14818)) )
))
(declare-fun arrayNoDuplicates!0 (array!43550 (_ BitVec 32) List!14818) Bool)

(assert (=> b!801148 (= res!545668 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14815))))

(declare-fun b!801149 () Bool)

(declare-fun res!545675 () Bool)

(assert (=> b!801149 (=> (not res!545675) (not e!444122))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801149 (= res!545675 (validKeyInArray!0 k!2044))))

(declare-fun b!801150 () Bool)

(declare-fun res!545673 () Bool)

(assert (=> b!801150 (=> (not res!545673) (not e!444118))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43550 (_ BitVec 32)) Bool)

(assert (=> b!801150 (= res!545673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!801151 () Bool)

(declare-fun res!545671 () Bool)

(declare-fun e!444119 () Bool)

(assert (=> b!801151 (=> (not res!545671) (not e!444119))))

(declare-datatypes ((SeekEntryResult!8446 0))(
  ( (MissingZero!8446 (index!36152 (_ BitVec 32))) (Found!8446 (index!36153 (_ BitVec 32))) (Intermediate!8446 (undefined!9258 Bool) (index!36154 (_ BitVec 32)) (x!67012 (_ BitVec 32))) (Undefined!8446) (MissingVacant!8446 (index!36155 (_ BitVec 32))) )
))
(declare-fun lt!358045 () SeekEntryResult!8446)

(declare-fun lt!358049 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!358048 () (_ BitVec 64))

(declare-fun lt!358043 () array!43550)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43550 (_ BitVec 32)) SeekEntryResult!8446)

(assert (=> b!801151 (= res!545671 (= lt!358045 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358049 vacantAfter!23 lt!358048 lt!358043 mask!3266)))))

(declare-fun b!801152 () Bool)

(declare-fun res!545677 () Bool)

(assert (=> b!801152 (=> (not res!545677) (not e!444118))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!801152 (= res!545677 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21276 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20855 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21276 a!3170)) (= (select (arr!20855 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!801153 () Bool)

(declare-fun e!444121 () Bool)

(assert (=> b!801153 (= e!444118 e!444121)))

(declare-fun res!545674 () Bool)

(assert (=> b!801153 (=> (not res!545674) (not e!444121))))

(assert (=> b!801153 (= res!545674 (= lt!358045 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358048 lt!358043 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43550 (_ BitVec 32)) SeekEntryResult!8446)

(assert (=> b!801153 (= lt!358045 (seekEntryOrOpen!0 lt!358048 lt!358043 mask!3266))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!801153 (= lt!358048 (select (store (arr!20855 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!801153 (= lt!358043 (array!43551 (store (arr!20855 a!3170) i!1163 k!2044) (size!21276 a!3170)))))

(declare-fun b!801154 () Bool)

(declare-fun res!545669 () Bool)

(assert (=> b!801154 (=> (not res!545669) (not e!444122))))

(assert (=> b!801154 (= res!545669 (validKeyInArray!0 (select (arr!20855 a!3170) j!153)))))

(declare-fun b!801155 () Bool)

(assert (=> b!801155 (= e!444122 e!444118)))

(declare-fun res!545678 () Bool)

(assert (=> b!801155 (=> (not res!545678) (not e!444118))))

(declare-fun lt!358046 () SeekEntryResult!8446)

(assert (=> b!801155 (= res!545678 (or (= lt!358046 (MissingZero!8446 i!1163)) (= lt!358046 (MissingVacant!8446 i!1163))))))

(assert (=> b!801155 (= lt!358046 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!801156 () Bool)

(declare-fun res!545672 () Bool)

(assert (=> b!801156 (=> (not res!545672) (not e!444122))))

(assert (=> b!801156 (= res!545672 (and (= (size!21276 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21276 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21276 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!801157 () Bool)

(declare-fun e!444120 () Bool)

(assert (=> b!801157 (= e!444121 e!444120)))

(declare-fun res!545676 () Bool)

(assert (=> b!801157 (=> (not res!545676) (not e!444120))))

(declare-fun lt!358042 () SeekEntryResult!8446)

(declare-fun lt!358047 () SeekEntryResult!8446)

(assert (=> b!801157 (= res!545676 (and (= lt!358047 lt!358042) (= lt!358042 (Found!8446 j!153)) (not (= (select (arr!20855 a!3170) index!1236) (select (arr!20855 a!3170) j!153)))))))

(assert (=> b!801157 (= lt!358042 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20855 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!801157 (= lt!358047 (seekEntryOrOpen!0 (select (arr!20855 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801158 () Bool)

(assert (=> b!801158 (= e!444120 e!444119)))

(declare-fun res!545667 () Bool)

(assert (=> b!801158 (=> (not res!545667) (not e!444119))))

(assert (=> b!801158 (= res!545667 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!358049 #b00000000000000000000000000000000) (bvslt lt!358049 (size!21276 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801158 (= lt!358049 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!801159 () Bool)

(assert (=> b!801159 (= e!444119 false)))

(declare-fun lt!358044 () SeekEntryResult!8446)

(assert (=> b!801159 (= lt!358044 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358049 vacantBefore!23 (select (arr!20855 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!68760 res!545670) b!801156))

(assert (= (and b!801156 res!545672) b!801154))

(assert (= (and b!801154 res!545669) b!801149))

(assert (= (and b!801149 res!545675) b!801147))

(assert (= (and b!801147 res!545666) b!801155))

(assert (= (and b!801155 res!545678) b!801150))

(assert (= (and b!801150 res!545673) b!801148))

(assert (= (and b!801148 res!545668) b!801152))

(assert (= (and b!801152 res!545677) b!801153))

(assert (= (and b!801153 res!545674) b!801157))

(assert (= (and b!801157 res!545676) b!801158))

(assert (= (and b!801158 res!545667) b!801151))

(assert (= (and b!801151 res!545671) b!801159))

(declare-fun m!742289 () Bool)

(assert (=> b!801150 m!742289))

(declare-fun m!742291 () Bool)

(assert (=> b!801147 m!742291))

(declare-fun m!742293 () Bool)

(assert (=> b!801154 m!742293))

(assert (=> b!801154 m!742293))

(declare-fun m!742295 () Bool)

(assert (=> b!801154 m!742295))

(declare-fun m!742297 () Bool)

(assert (=> b!801157 m!742297))

(assert (=> b!801157 m!742293))

(assert (=> b!801157 m!742293))

(declare-fun m!742299 () Bool)

(assert (=> b!801157 m!742299))

(assert (=> b!801157 m!742293))

(declare-fun m!742301 () Bool)

(assert (=> b!801157 m!742301))

(declare-fun m!742303 () Bool)

(assert (=> b!801148 m!742303))

(declare-fun m!742305 () Bool)

(assert (=> b!801152 m!742305))

(declare-fun m!742307 () Bool)

(assert (=> b!801152 m!742307))

(declare-fun m!742309 () Bool)

(assert (=> b!801158 m!742309))

(assert (=> b!801159 m!742293))

(assert (=> b!801159 m!742293))

(declare-fun m!742311 () Bool)

(assert (=> b!801159 m!742311))

(declare-fun m!742313 () Bool)

(assert (=> b!801149 m!742313))

(declare-fun m!742315 () Bool)

(assert (=> start!68760 m!742315))

(declare-fun m!742317 () Bool)

(assert (=> start!68760 m!742317))

(declare-fun m!742319 () Bool)

(assert (=> b!801151 m!742319))

(declare-fun m!742321 () Bool)

(assert (=> b!801155 m!742321))

(declare-fun m!742323 () Bool)

(assert (=> b!801153 m!742323))

(declare-fun m!742325 () Bool)

(assert (=> b!801153 m!742325))

(declare-fun m!742327 () Bool)

(assert (=> b!801153 m!742327))

(declare-fun m!742329 () Bool)

(assert (=> b!801153 m!742329))

(push 1)

