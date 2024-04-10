; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68694 () Bool)

(assert start!68694)

(declare-fun b!799860 () Bool)

(declare-fun e!443528 () Bool)

(declare-fun e!443526 () Bool)

(assert (=> b!799860 (= e!443528 e!443526)))

(declare-fun res!544386 () Bool)

(assert (=> b!799860 (=> (not res!544386) (not e!443526))))

(declare-datatypes ((SeekEntryResult!8413 0))(
  ( (MissingZero!8413 (index!36020 (_ BitVec 32))) (Found!8413 (index!36021 (_ BitVec 32))) (Intermediate!8413 (undefined!9225 Bool) (index!36022 (_ BitVec 32)) (x!66891 (_ BitVec 32))) (Undefined!8413) (MissingVacant!8413 (index!36023 (_ BitVec 32))) )
))
(declare-fun lt!357253 () SeekEntryResult!8413)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!799860 (= res!544386 (or (= lt!357253 (MissingZero!8413 i!1163)) (= lt!357253 (MissingVacant!8413 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-datatypes ((array!43484 0))(
  ( (array!43485 (arr!20822 (Array (_ BitVec 32) (_ BitVec 64))) (size!21243 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43484)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43484 (_ BitVec 32)) SeekEntryResult!8413)

(assert (=> b!799860 (= lt!357253 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!799861 () Bool)

(declare-fun res!544389 () Bool)

(declare-fun e!443523 () Bool)

(assert (=> b!799861 (=> (not res!544389) (not e!443523))))

(declare-fun lt!357250 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!357257 () SeekEntryResult!8413)

(declare-fun lt!357254 () (_ BitVec 32))

(declare-fun lt!357255 () array!43484)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43484 (_ BitVec 32)) SeekEntryResult!8413)

(assert (=> b!799861 (= res!544389 (= lt!357257 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357254 vacantAfter!23 lt!357250 lt!357255 mask!3266)))))

(declare-fun b!799862 () Bool)

(declare-fun res!544379 () Bool)

(assert (=> b!799862 (=> (not res!544379) (not e!443528))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!799862 (= res!544379 (and (= (size!21243 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21243 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21243 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!799863 () Bool)

(declare-fun e!443525 () Bool)

(assert (=> b!799863 (= e!443525 e!443523)))

(declare-fun res!544385 () Bool)

(assert (=> b!799863 (=> (not res!544385) (not e!443523))))

(assert (=> b!799863 (= res!544385 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357254 #b00000000000000000000000000000000) (bvslt lt!357254 (size!21243 a!3170))))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!799863 (= lt!357254 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!799864 () Bool)

(declare-fun res!544391 () Bool)

(assert (=> b!799864 (=> (not res!544391) (not e!443526))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!799864 (= res!544391 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21243 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20822 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21243 a!3170)) (= (select (arr!20822 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!799865 () Bool)

(assert (=> b!799865 (= e!443523 false)))

(declare-fun lt!357256 () SeekEntryResult!8413)

(assert (=> b!799865 (= lt!357256 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357254 vacantBefore!23 (select (arr!20822 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799866 () Bool)

(declare-fun res!544388 () Bool)

(assert (=> b!799866 (=> (not res!544388) (not e!443526))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43484 (_ BitVec 32)) Bool)

(assert (=> b!799866 (= res!544388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!799867 () Bool)

(declare-fun e!443524 () Bool)

(assert (=> b!799867 (= e!443524 e!443525)))

(declare-fun res!544382 () Bool)

(assert (=> b!799867 (=> (not res!544382) (not e!443525))))

(declare-fun lt!357252 () SeekEntryResult!8413)

(declare-fun lt!357251 () SeekEntryResult!8413)

(assert (=> b!799867 (= res!544382 (and (= lt!357251 lt!357252) (= lt!357252 (Found!8413 j!153)) (not (= (select (arr!20822 a!3170) index!1236) (select (arr!20822 a!3170) j!153)))))))

(assert (=> b!799867 (= lt!357252 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20822 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!799867 (= lt!357251 (seekEntryOrOpen!0 (select (arr!20822 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799868 () Bool)

(declare-fun res!544383 () Bool)

(assert (=> b!799868 (=> (not res!544383) (not e!443526))))

(declare-datatypes ((List!14785 0))(
  ( (Nil!14782) (Cons!14781 (h!15910 (_ BitVec 64)) (t!21100 List!14785)) )
))
(declare-fun arrayNoDuplicates!0 (array!43484 (_ BitVec 32) List!14785) Bool)

(assert (=> b!799868 (= res!544383 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14782))))

(declare-fun b!799870 () Bool)

(declare-fun res!544380 () Bool)

(assert (=> b!799870 (=> (not res!544380) (not e!443528))))

(declare-fun arrayContainsKey!0 (array!43484 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!799870 (= res!544380 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!799869 () Bool)

(declare-fun res!544390 () Bool)

(assert (=> b!799869 (=> (not res!544390) (not e!443528))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!799869 (= res!544390 (validKeyInArray!0 (select (arr!20822 a!3170) j!153)))))

(declare-fun res!544384 () Bool)

(assert (=> start!68694 (=> (not res!544384) (not e!443528))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68694 (= res!544384 (validMask!0 mask!3266))))

(assert (=> start!68694 e!443528))

(assert (=> start!68694 true))

(declare-fun array_inv!16618 (array!43484) Bool)

(assert (=> start!68694 (array_inv!16618 a!3170)))

(declare-fun b!799871 () Bool)

(declare-fun res!544387 () Bool)

(assert (=> b!799871 (=> (not res!544387) (not e!443528))))

(assert (=> b!799871 (= res!544387 (validKeyInArray!0 k!2044))))

(declare-fun b!799872 () Bool)

(assert (=> b!799872 (= e!443526 e!443524)))

(declare-fun res!544381 () Bool)

(assert (=> b!799872 (=> (not res!544381) (not e!443524))))

(assert (=> b!799872 (= res!544381 (= lt!357257 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357250 lt!357255 mask!3266)))))

(assert (=> b!799872 (= lt!357257 (seekEntryOrOpen!0 lt!357250 lt!357255 mask!3266))))

(assert (=> b!799872 (= lt!357250 (select (store (arr!20822 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!799872 (= lt!357255 (array!43485 (store (arr!20822 a!3170) i!1163 k!2044) (size!21243 a!3170)))))

(assert (= (and start!68694 res!544384) b!799862))

(assert (= (and b!799862 res!544379) b!799869))

(assert (= (and b!799869 res!544390) b!799871))

(assert (= (and b!799871 res!544387) b!799870))

(assert (= (and b!799870 res!544380) b!799860))

(assert (= (and b!799860 res!544386) b!799866))

(assert (= (and b!799866 res!544388) b!799868))

(assert (= (and b!799868 res!544383) b!799864))

(assert (= (and b!799864 res!544391) b!799872))

(assert (= (and b!799872 res!544381) b!799867))

(assert (= (and b!799867 res!544382) b!799863))

(assert (= (and b!799863 res!544385) b!799861))

(assert (= (and b!799861 res!544389) b!799865))

(declare-fun m!740903 () Bool)

(assert (=> b!799872 m!740903))

(declare-fun m!740905 () Bool)

(assert (=> b!799872 m!740905))

(declare-fun m!740907 () Bool)

(assert (=> b!799872 m!740907))

(declare-fun m!740909 () Bool)

(assert (=> b!799872 m!740909))

(declare-fun m!740911 () Bool)

(assert (=> b!799864 m!740911))

(declare-fun m!740913 () Bool)

(assert (=> b!799864 m!740913))

(declare-fun m!740915 () Bool)

(assert (=> b!799866 m!740915))

(declare-fun m!740917 () Bool)

(assert (=> b!799863 m!740917))

(declare-fun m!740919 () Bool)

(assert (=> b!799870 m!740919))

(declare-fun m!740921 () Bool)

(assert (=> b!799868 m!740921))

(declare-fun m!740923 () Bool)

(assert (=> b!799867 m!740923))

(declare-fun m!740925 () Bool)

(assert (=> b!799867 m!740925))

(assert (=> b!799867 m!740925))

(declare-fun m!740927 () Bool)

(assert (=> b!799867 m!740927))

(assert (=> b!799867 m!740925))

(declare-fun m!740929 () Bool)

(assert (=> b!799867 m!740929))

(assert (=> b!799869 m!740925))

(assert (=> b!799869 m!740925))

(declare-fun m!740931 () Bool)

(assert (=> b!799869 m!740931))

(declare-fun m!740933 () Bool)

(assert (=> b!799861 m!740933))

(assert (=> b!799865 m!740925))

(assert (=> b!799865 m!740925))

(declare-fun m!740935 () Bool)

(assert (=> b!799865 m!740935))

(declare-fun m!740937 () Bool)

(assert (=> b!799860 m!740937))

(declare-fun m!740939 () Bool)

(assert (=> b!799871 m!740939))

(declare-fun m!740941 () Bool)

(assert (=> start!68694 m!740941))

(declare-fun m!740943 () Bool)

(assert (=> start!68694 m!740943))

(push 1)

