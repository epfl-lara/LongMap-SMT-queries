; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69204 () Bool)

(assert start!69204)

(declare-fun b!807206 () Bool)

(declare-fun res!551339 () Bool)

(declare-fun e!446947 () Bool)

(assert (=> b!807206 (=> (not res!551339) (not e!446947))))

(declare-datatypes ((array!43904 0))(
  ( (array!43905 (arr!21029 (Array (_ BitVec 32) (_ BitVec 64))) (size!21450 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43904)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43904 (_ BitVec 32)) Bool)

(assert (=> b!807206 (= res!551339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!807207 () Bool)

(declare-fun res!551336 () Bool)

(assert (=> b!807207 (=> (not res!551336) (not e!446947))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!807207 (= res!551336 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21450 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21029 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21450 a!3170)) (= (select (arr!21029 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!807208 () Bool)

(declare-fun e!446944 () Bool)

(assert (=> b!807208 (= e!446944 e!446947)))

(declare-fun res!551329 () Bool)

(assert (=> b!807208 (=> (not res!551329) (not e!446947))))

(declare-datatypes ((SeekEntryResult!8620 0))(
  ( (MissingZero!8620 (index!36848 (_ BitVec 32))) (Found!8620 (index!36849 (_ BitVec 32))) (Intermediate!8620 (undefined!9432 Bool) (index!36850 (_ BitVec 32)) (x!67656 (_ BitVec 32))) (Undefined!8620) (MissingVacant!8620 (index!36851 (_ BitVec 32))) )
))
(declare-fun lt!361607 () SeekEntryResult!8620)

(assert (=> b!807208 (= res!551329 (or (= lt!361607 (MissingZero!8620 i!1163)) (= lt!361607 (MissingVacant!8620 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43904 (_ BitVec 32)) SeekEntryResult!8620)

(assert (=> b!807208 (= lt!361607 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!807209 () Bool)

(declare-fun res!551334 () Bool)

(assert (=> b!807209 (=> (not res!551334) (not e!446944))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807209 (= res!551334 (validKeyInArray!0 (select (arr!21029 a!3170) j!153)))))

(declare-fun b!807210 () Bool)

(declare-fun e!446945 () Bool)

(declare-fun e!446946 () Bool)

(assert (=> b!807210 (= e!446945 e!446946)))

(declare-fun res!551337 () Bool)

(assert (=> b!807210 (=> (not res!551337) (not e!446946))))

(declare-fun lt!361605 () SeekEntryResult!8620)

(declare-fun lt!361603 () SeekEntryResult!8620)

(assert (=> b!807210 (= res!551337 (and (= lt!361605 lt!361603) (= lt!361603 (Found!8620 j!153)) (not (= (select (arr!21029 a!3170) index!1236) (select (arr!21029 a!3170) j!153)))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43904 (_ BitVec 32)) SeekEntryResult!8620)

(assert (=> b!807210 (= lt!361603 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21029 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!807210 (= lt!361605 (seekEntryOrOpen!0 (select (arr!21029 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!551332 () Bool)

(assert (=> start!69204 (=> (not res!551332) (not e!446944))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69204 (= res!551332 (validMask!0 mask!3266))))

(assert (=> start!69204 e!446944))

(assert (=> start!69204 true))

(declare-fun array_inv!16825 (array!43904) Bool)

(assert (=> start!69204 (array_inv!16825 a!3170)))

(declare-fun b!807211 () Bool)

(declare-fun res!551330 () Bool)

(assert (=> b!807211 (=> (not res!551330) (not e!446944))))

(assert (=> b!807211 (= res!551330 (and (= (size!21450 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21450 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21450 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!807212 () Bool)

(assert (=> b!807212 (= e!446947 e!446945)))

(declare-fun res!551335 () Bool)

(assert (=> b!807212 (=> (not res!551335) (not e!446945))))

(declare-fun lt!361606 () (_ BitVec 64))

(declare-fun lt!361604 () array!43904)

(assert (=> b!807212 (= res!551335 (= (seekEntryOrOpen!0 lt!361606 lt!361604 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361606 lt!361604 mask!3266)))))

(assert (=> b!807212 (= lt!361606 (select (store (arr!21029 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!807212 (= lt!361604 (array!43905 (store (arr!21029 a!3170) i!1163 k!2044) (size!21450 a!3170)))))

(declare-fun b!807213 () Bool)

(declare-fun res!551331 () Bool)

(assert (=> b!807213 (=> (not res!551331) (not e!446944))))

(declare-fun arrayContainsKey!0 (array!43904 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807213 (= res!551331 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!807214 () Bool)

(declare-fun res!551333 () Bool)

(assert (=> b!807214 (=> (not res!551333) (not e!446944))))

(assert (=> b!807214 (= res!551333 (validKeyInArray!0 k!2044))))

(declare-fun b!807215 () Bool)

(declare-fun res!551338 () Bool)

(assert (=> b!807215 (=> (not res!551338) (not e!446947))))

(declare-datatypes ((List!14992 0))(
  ( (Nil!14989) (Cons!14988 (h!16117 (_ BitVec 64)) (t!21307 List!14992)) )
))
(declare-fun arrayNoDuplicates!0 (array!43904 (_ BitVec 32) List!14992) Bool)

(assert (=> b!807215 (= res!551338 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14989))))

(declare-fun b!807216 () Bool)

(assert (=> b!807216 (= e!446946 false)))

(declare-fun lt!361602 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!807216 (= lt!361602 (nextIndex!0 index!1236 x!1077 mask!3266))))

(assert (= (and start!69204 res!551332) b!807211))

(assert (= (and b!807211 res!551330) b!807209))

(assert (= (and b!807209 res!551334) b!807214))

(assert (= (and b!807214 res!551333) b!807213))

(assert (= (and b!807213 res!551331) b!807208))

(assert (= (and b!807208 res!551329) b!807206))

(assert (= (and b!807206 res!551339) b!807215))

(assert (= (and b!807215 res!551338) b!807207))

(assert (= (and b!807207 res!551336) b!807212))

(assert (= (and b!807212 res!551335) b!807210))

(assert (= (and b!807210 res!551337) b!807216))

(declare-fun m!749205 () Bool)

(assert (=> b!807215 m!749205))

(declare-fun m!749207 () Bool)

(assert (=> b!807216 m!749207))

(declare-fun m!749209 () Bool)

(assert (=> start!69204 m!749209))

(declare-fun m!749211 () Bool)

(assert (=> start!69204 m!749211))

(declare-fun m!749213 () Bool)

(assert (=> b!807207 m!749213))

(declare-fun m!749215 () Bool)

(assert (=> b!807207 m!749215))

(declare-fun m!749217 () Bool)

(assert (=> b!807209 m!749217))

(assert (=> b!807209 m!749217))

(declare-fun m!749219 () Bool)

(assert (=> b!807209 m!749219))

(declare-fun m!749221 () Bool)

(assert (=> b!807214 m!749221))

(declare-fun m!749223 () Bool)

(assert (=> b!807212 m!749223))

(declare-fun m!749225 () Bool)

(assert (=> b!807212 m!749225))

(declare-fun m!749227 () Bool)

(assert (=> b!807212 m!749227))

(declare-fun m!749229 () Bool)

(assert (=> b!807212 m!749229))

(declare-fun m!749231 () Bool)

(assert (=> b!807206 m!749231))

(declare-fun m!749233 () Bool)

(assert (=> b!807213 m!749233))

(declare-fun m!749235 () Bool)

(assert (=> b!807208 m!749235))

(declare-fun m!749237 () Bool)

(assert (=> b!807210 m!749237))

(assert (=> b!807210 m!749217))

(assert (=> b!807210 m!749217))

(declare-fun m!749239 () Bool)

(assert (=> b!807210 m!749239))

(assert (=> b!807210 m!749217))

(declare-fun m!749241 () Bool)

(assert (=> b!807210 m!749241))

(push 1)

(assert (not b!807212))

(assert (not b!807214))

(assert (not 