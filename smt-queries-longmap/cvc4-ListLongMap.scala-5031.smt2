; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68700 () Bool)

(assert start!68700)

(declare-fun b!799977 () Bool)

(declare-fun res!544508 () Bool)

(declare-fun e!443579 () Bool)

(assert (=> b!799977 (=> (not res!544508) (not e!443579))))

(declare-datatypes ((array!43490 0))(
  ( (array!43491 (arr!20825 (Array (_ BitVec 32) (_ BitVec 64))) (size!21246 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43490)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43490 (_ BitVec 32)) Bool)

(assert (=> b!799977 (= res!544508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!799978 () Bool)

(declare-fun res!544504 () Bool)

(declare-fun e!443577 () Bool)

(assert (=> b!799978 (=> (not res!544504) (not e!443577))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!799978 (= res!544504 (validKeyInArray!0 k!2044))))

(declare-fun b!799979 () Bool)

(assert (=> b!799979 (= e!443577 e!443579)))

(declare-fun res!544501 () Bool)

(assert (=> b!799979 (=> (not res!544501) (not e!443579))))

(declare-datatypes ((SeekEntryResult!8416 0))(
  ( (MissingZero!8416 (index!36032 (_ BitVec 32))) (Found!8416 (index!36033 (_ BitVec 32))) (Intermediate!8416 (undefined!9228 Bool) (index!36034 (_ BitVec 32)) (x!66902 (_ BitVec 32))) (Undefined!8416) (MissingVacant!8416 (index!36035 (_ BitVec 32))) )
))
(declare-fun lt!357324 () SeekEntryResult!8416)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!799979 (= res!544501 (or (= lt!357324 (MissingZero!8416 i!1163)) (= lt!357324 (MissingVacant!8416 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43490 (_ BitVec 32)) SeekEntryResult!8416)

(assert (=> b!799979 (= lt!357324 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!799980 () Bool)

(declare-fun res!544506 () Bool)

(assert (=> b!799980 (=> (not res!544506) (not e!443577))))

(declare-fun arrayContainsKey!0 (array!43490 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!799980 (= res!544506 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!799981 () Bool)

(declare-fun e!443582 () Bool)

(declare-fun e!443580 () Bool)

(assert (=> b!799981 (= e!443582 e!443580)))

(declare-fun res!544497 () Bool)

(assert (=> b!799981 (=> (not res!544497) (not e!443580))))

(declare-fun lt!357327 () SeekEntryResult!8416)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!357328 () SeekEntryResult!8416)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!799981 (= res!544497 (and (= lt!357327 lt!357328) (= lt!357328 (Found!8416 j!153)) (not (= (select (arr!20825 a!3170) index!1236) (select (arr!20825 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43490 (_ BitVec 32)) SeekEntryResult!8416)

(assert (=> b!799981 (= lt!357328 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20825 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!799981 (= lt!357327 (seekEntryOrOpen!0 (select (arr!20825 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799982 () Bool)

(declare-fun res!544496 () Bool)

(assert (=> b!799982 (=> (not res!544496) (not e!443577))))

(assert (=> b!799982 (= res!544496 (and (= (size!21246 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21246 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21246 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!799983 () Bool)

(declare-fun e!443578 () Bool)

(assert (=> b!799983 (= e!443578 false)))

(declare-fun lt!357329 () SeekEntryResult!8416)

(declare-fun lt!357326 () (_ BitVec 32))

(assert (=> b!799983 (= lt!357329 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357326 vacantBefore!23 (select (arr!20825 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799984 () Bool)

(declare-fun res!544505 () Bool)

(assert (=> b!799984 (=> (not res!544505) (not e!443577))))

(assert (=> b!799984 (= res!544505 (validKeyInArray!0 (select (arr!20825 a!3170) j!153)))))

(declare-fun b!799985 () Bool)

(assert (=> b!799985 (= e!443580 e!443578)))

(declare-fun res!544498 () Bool)

(assert (=> b!799985 (=> (not res!544498) (not e!443578))))

(assert (=> b!799985 (= res!544498 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357326 #b00000000000000000000000000000000) (bvslt lt!357326 (size!21246 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!799985 (= lt!357326 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!799986 () Bool)

(declare-fun res!544499 () Bool)

(assert (=> b!799986 (=> (not res!544499) (not e!443579))))

(declare-datatypes ((List!14788 0))(
  ( (Nil!14785) (Cons!14784 (h!15913 (_ BitVec 64)) (t!21103 List!14788)) )
))
(declare-fun arrayNoDuplicates!0 (array!43490 (_ BitVec 32) List!14788) Bool)

(assert (=> b!799986 (= res!544499 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14785))))

(declare-fun res!544502 () Bool)

(assert (=> start!68700 (=> (not res!544502) (not e!443577))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68700 (= res!544502 (validMask!0 mask!3266))))

(assert (=> start!68700 e!443577))

(assert (=> start!68700 true))

(declare-fun array_inv!16621 (array!43490) Bool)

(assert (=> start!68700 (array_inv!16621 a!3170)))

(declare-fun b!799987 () Bool)

(declare-fun res!544503 () Bool)

(assert (=> b!799987 (=> (not res!544503) (not e!443579))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!799987 (= res!544503 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21246 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20825 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21246 a!3170)) (= (select (arr!20825 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!799988 () Bool)

(assert (=> b!799988 (= e!443579 e!443582)))

(declare-fun res!544507 () Bool)

(assert (=> b!799988 (=> (not res!544507) (not e!443582))))

(declare-fun lt!357322 () array!43490)

(declare-fun lt!357323 () (_ BitVec 64))

(declare-fun lt!357325 () SeekEntryResult!8416)

(assert (=> b!799988 (= res!544507 (= lt!357325 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357323 lt!357322 mask!3266)))))

(assert (=> b!799988 (= lt!357325 (seekEntryOrOpen!0 lt!357323 lt!357322 mask!3266))))

(assert (=> b!799988 (= lt!357323 (select (store (arr!20825 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!799988 (= lt!357322 (array!43491 (store (arr!20825 a!3170) i!1163 k!2044) (size!21246 a!3170)))))

(declare-fun b!799989 () Bool)

(declare-fun res!544500 () Bool)

(assert (=> b!799989 (=> (not res!544500) (not e!443578))))

(assert (=> b!799989 (= res!544500 (= lt!357325 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357326 vacantAfter!23 lt!357323 lt!357322 mask!3266)))))

(assert (= (and start!68700 res!544502) b!799982))

(assert (= (and b!799982 res!544496) b!799984))

(assert (= (and b!799984 res!544505) b!799978))

(assert (= (and b!799978 res!544504) b!799980))

(assert (= (and b!799980 res!544506) b!799979))

(assert (= (and b!799979 res!544501) b!799977))

(assert (= (and b!799977 res!544508) b!799986))

(assert (= (and b!799986 res!544499) b!799987))

(assert (= (and b!799987 res!544503) b!799988))

(assert (= (and b!799988 res!544507) b!799981))

(assert (= (and b!799981 res!544497) b!799985))

(assert (= (and b!799985 res!544498) b!799989))

(assert (= (and b!799989 res!544500) b!799983))

(declare-fun m!741029 () Bool)

(assert (=> b!799977 m!741029))

(declare-fun m!741031 () Bool)

(assert (=> b!799986 m!741031))

(declare-fun m!741033 () Bool)

(assert (=> b!799981 m!741033))

(declare-fun m!741035 () Bool)

(assert (=> b!799981 m!741035))

(assert (=> b!799981 m!741035))

(declare-fun m!741037 () Bool)

(assert (=> b!799981 m!741037))

(assert (=> b!799981 m!741035))

(declare-fun m!741039 () Bool)

(assert (=> b!799981 m!741039))

(declare-fun m!741041 () Bool)

(assert (=> start!68700 m!741041))

(declare-fun m!741043 () Bool)

(assert (=> start!68700 m!741043))

(declare-fun m!741045 () Bool)

(assert (=> b!799988 m!741045))

(declare-fun m!741047 () Bool)

(assert (=> b!799988 m!741047))

(declare-fun m!741049 () Bool)

(assert (=> b!799988 m!741049))

(declare-fun m!741051 () Bool)

(assert (=> b!799988 m!741051))

(declare-fun m!741053 () Bool)

(assert (=> b!799989 m!741053))

(declare-fun m!741055 () Bool)

(assert (=> b!799985 m!741055))

(declare-fun m!741057 () Bool)

(assert (=> b!799980 m!741057))

(declare-fun m!741059 () Bool)

(assert (=> b!799979 m!741059))

(declare-fun m!741061 () Bool)

(assert (=> b!799987 m!741061))

(declare-fun m!741063 () Bool)

(assert (=> b!799987 m!741063))

(assert (=> b!799983 m!741035))

(assert (=> b!799983 m!741035))

(declare-fun m!741065 () Bool)

(assert (=> b!799983 m!741065))

(declare-fun m!741067 () Bool)

(assert (=> b!799978 m!741067))

(assert (=> b!799984 m!741035))

(assert (=> b!799984 m!741035))

(declare-fun m!741069 () Bool)

(assert (=> b!799984 m!741069))

(push 1)

