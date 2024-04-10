; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68696 () Bool)

(assert start!68696)

(declare-fun b!799899 () Bool)

(declare-fun res!544429 () Bool)

(declare-fun e!443545 () Bool)

(assert (=> b!799899 (=> (not res!544429) (not e!443545))))

(declare-datatypes ((array!43486 0))(
  ( (array!43487 (arr!20823 (Array (_ BitVec 32) (_ BitVec 64))) (size!21244 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43486)

(declare-datatypes ((List!14786 0))(
  ( (Nil!14783) (Cons!14782 (h!15911 (_ BitVec 64)) (t!21101 List!14786)) )
))
(declare-fun arrayNoDuplicates!0 (array!43486 (_ BitVec 32) List!14786) Bool)

(assert (=> b!799899 (= res!544429 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14783))))

(declare-fun b!799900 () Bool)

(declare-fun e!443543 () Bool)

(assert (=> b!799900 (= e!443543 e!443545)))

(declare-fun res!544420 () Bool)

(assert (=> b!799900 (=> (not res!544420) (not e!443545))))

(declare-datatypes ((SeekEntryResult!8414 0))(
  ( (MissingZero!8414 (index!36024 (_ BitVec 32))) (Found!8414 (index!36025 (_ BitVec 32))) (Intermediate!8414 (undefined!9226 Bool) (index!36026 (_ BitVec 32)) (x!66900 (_ BitVec 32))) (Undefined!8414) (MissingVacant!8414 (index!36027 (_ BitVec 32))) )
))
(declare-fun lt!357278 () SeekEntryResult!8414)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!799900 (= res!544420 (or (= lt!357278 (MissingZero!8414 i!1163)) (= lt!357278 (MissingVacant!8414 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43486 (_ BitVec 32)) SeekEntryResult!8414)

(assert (=> b!799900 (= lt!357278 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!799901 () Bool)

(declare-fun res!544426 () Bool)

(assert (=> b!799901 (=> (not res!544426) (not e!443545))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!799901 (= res!544426 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21244 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20823 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21244 a!3170)) (= (select (arr!20823 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!799902 () Bool)

(declare-fun res!544430 () Bool)

(assert (=> b!799902 (=> (not res!544430) (not e!443545))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43486 (_ BitVec 32)) Bool)

(assert (=> b!799902 (= res!544430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!799903 () Bool)

(declare-fun e!443542 () Bool)

(declare-fun e!443544 () Bool)

(assert (=> b!799903 (= e!443542 e!443544)))

(declare-fun res!544418 () Bool)

(assert (=> b!799903 (=> (not res!544418) (not e!443544))))

(declare-fun lt!357275 () SeekEntryResult!8414)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!357277 () SeekEntryResult!8414)

(assert (=> b!799903 (= res!544418 (and (= lt!357275 lt!357277) (= lt!357277 (Found!8414 j!153)) (not (= (select (arr!20823 a!3170) index!1236) (select (arr!20823 a!3170) j!153)))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43486 (_ BitVec 32)) SeekEntryResult!8414)

(assert (=> b!799903 (= lt!357277 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20823 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!799903 (= lt!357275 (seekEntryOrOpen!0 (select (arr!20823 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799904 () Bool)

(declare-fun res!544428 () Bool)

(assert (=> b!799904 (=> (not res!544428) (not e!443543))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!799904 (= res!544428 (validKeyInArray!0 k!2044))))

(declare-fun b!799905 () Bool)

(declare-fun res!544425 () Bool)

(assert (=> b!799905 (=> (not res!544425) (not e!443543))))

(assert (=> b!799905 (= res!544425 (and (= (size!21244 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21244 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21244 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!799906 () Bool)

(declare-fun res!544424 () Bool)

(declare-fun e!443546 () Bool)

(assert (=> b!799906 (=> (not res!544424) (not e!443546))))

(declare-fun lt!357281 () array!43486)

(declare-fun lt!357279 () SeekEntryResult!8414)

(declare-fun lt!357276 () (_ BitVec 64))

(declare-fun lt!357274 () (_ BitVec 32))

(assert (=> b!799906 (= res!544424 (= lt!357279 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357274 vacantAfter!23 lt!357276 lt!357281 mask!3266)))))

(declare-fun b!799907 () Bool)

(assert (=> b!799907 (= e!443544 e!443546)))

(declare-fun res!544421 () Bool)

(assert (=> b!799907 (=> (not res!544421) (not e!443546))))

(assert (=> b!799907 (= res!544421 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357274 #b00000000000000000000000000000000) (bvslt lt!357274 (size!21244 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!799907 (= lt!357274 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun res!544422 () Bool)

(assert (=> start!68696 (=> (not res!544422) (not e!443543))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68696 (= res!544422 (validMask!0 mask!3266))))

(assert (=> start!68696 e!443543))

(assert (=> start!68696 true))

(declare-fun array_inv!16619 (array!43486) Bool)

(assert (=> start!68696 (array_inv!16619 a!3170)))

(declare-fun b!799908 () Bool)

(declare-fun res!544423 () Bool)

(assert (=> b!799908 (=> (not res!544423) (not e!443543))))

(declare-fun arrayContainsKey!0 (array!43486 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!799908 (= res!544423 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!799909 () Bool)

(declare-fun res!544419 () Bool)

(assert (=> b!799909 (=> (not res!544419) (not e!443543))))

(assert (=> b!799909 (= res!544419 (validKeyInArray!0 (select (arr!20823 a!3170) j!153)))))

(declare-fun b!799910 () Bool)

(assert (=> b!799910 (= e!443546 false)))

(declare-fun lt!357280 () SeekEntryResult!8414)

(assert (=> b!799910 (= lt!357280 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357274 vacantBefore!23 (select (arr!20823 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799911 () Bool)

(assert (=> b!799911 (= e!443545 e!443542)))

(declare-fun res!544427 () Bool)

(assert (=> b!799911 (=> (not res!544427) (not e!443542))))

(assert (=> b!799911 (= res!544427 (= lt!357279 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357276 lt!357281 mask!3266)))))

(assert (=> b!799911 (= lt!357279 (seekEntryOrOpen!0 lt!357276 lt!357281 mask!3266))))

(assert (=> b!799911 (= lt!357276 (select (store (arr!20823 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!799911 (= lt!357281 (array!43487 (store (arr!20823 a!3170) i!1163 k!2044) (size!21244 a!3170)))))

(assert (= (and start!68696 res!544422) b!799905))

(assert (= (and b!799905 res!544425) b!799909))

(assert (= (and b!799909 res!544419) b!799904))

(assert (= (and b!799904 res!544428) b!799908))

(assert (= (and b!799908 res!544423) b!799900))

(assert (= (and b!799900 res!544420) b!799902))

(assert (= (and b!799902 res!544430) b!799899))

(assert (= (and b!799899 res!544429) b!799901))

(assert (= (and b!799901 res!544426) b!799911))

(assert (= (and b!799911 res!544427) b!799903))

(assert (= (and b!799903 res!544418) b!799907))

(assert (= (and b!799907 res!544421) b!799906))

(assert (= (and b!799906 res!544424) b!799910))

(declare-fun m!740945 () Bool)

(assert (=> b!799907 m!740945))

(declare-fun m!740947 () Bool)

(assert (=> b!799904 m!740947))

(declare-fun m!740949 () Bool)

(assert (=> b!799906 m!740949))

(declare-fun m!740951 () Bool)

(assert (=> start!68696 m!740951))

(declare-fun m!740953 () Bool)

(assert (=> start!68696 m!740953))

(declare-fun m!740955 () Bool)

(assert (=> b!799900 m!740955))

(declare-fun m!740957 () Bool)

(assert (=> b!799911 m!740957))

(declare-fun m!740959 () Bool)

(assert (=> b!799911 m!740959))

(declare-fun m!740961 () Bool)

(assert (=> b!799911 m!740961))

(declare-fun m!740963 () Bool)

(assert (=> b!799911 m!740963))

(declare-fun m!740965 () Bool)

(assert (=> b!799902 m!740965))

(declare-fun m!740967 () Bool)

(assert (=> b!799909 m!740967))

(assert (=> b!799909 m!740967))

(declare-fun m!740969 () Bool)

(assert (=> b!799909 m!740969))

(declare-fun m!740971 () Bool)

(assert (=> b!799903 m!740971))

(assert (=> b!799903 m!740967))

(assert (=> b!799903 m!740967))

(declare-fun m!740973 () Bool)

(assert (=> b!799903 m!740973))

(assert (=> b!799903 m!740967))

(declare-fun m!740975 () Bool)

(assert (=> b!799903 m!740975))

(declare-fun m!740977 () Bool)

(assert (=> b!799901 m!740977))

(declare-fun m!740979 () Bool)

(assert (=> b!799901 m!740979))

(declare-fun m!740981 () Bool)

(assert (=> b!799899 m!740981))

(assert (=> b!799910 m!740967))

(assert (=> b!799910 m!740967))

(declare-fun m!740983 () Bool)

(assert (=> b!799910 m!740983))

(declare-fun m!740985 () Bool)

(assert (=> b!799908 m!740985))

(push 1)

