; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68666 () Bool)

(assert start!68666)

(declare-fun b!799314 () Bool)

(declare-fun e!443271 () Bool)

(declare-fun e!443272 () Bool)

(assert (=> b!799314 (= e!443271 e!443272)))

(declare-fun res!543834 () Bool)

(assert (=> b!799314 (=> (not res!543834) (not e!443272))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43456 0))(
  ( (array!43457 (arr!20808 (Array (_ BitVec 32) (_ BitVec 64))) (size!21229 (_ BitVec 32))) )
))
(declare-fun lt!356914 () array!43456)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8399 0))(
  ( (MissingZero!8399 (index!35964 (_ BitVec 32))) (Found!8399 (index!35965 (_ BitVec 32))) (Intermediate!8399 (undefined!9211 Bool) (index!35966 (_ BitVec 32)) (x!66845 (_ BitVec 32))) (Undefined!8399) (MissingVacant!8399 (index!35967 (_ BitVec 32))) )
))
(declare-fun lt!356920 () SeekEntryResult!8399)

(declare-fun lt!356915 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43456 (_ BitVec 32)) SeekEntryResult!8399)

(assert (=> b!799314 (= res!543834 (= lt!356920 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356915 lt!356914 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43456 (_ BitVec 32)) SeekEntryResult!8399)

(assert (=> b!799314 (= lt!356920 (seekEntryOrOpen!0 lt!356915 lt!356914 mask!3266))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43456)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!799314 (= lt!356915 (select (store (arr!20808 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!799314 (= lt!356914 (array!43457 (store (arr!20808 a!3170) i!1163 k!2044) (size!21229 a!3170)))))

(declare-fun b!799315 () Bool)

(declare-fun res!543839 () Bool)

(declare-fun e!443275 () Bool)

(assert (=> b!799315 (=> (not res!543839) (not e!443275))))

(declare-fun lt!356918 () (_ BitVec 32))

(assert (=> b!799315 (= res!543839 (= lt!356920 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356918 vacantAfter!23 lt!356915 lt!356914 mask!3266)))))

(declare-fun b!799316 () Bool)

(declare-fun res!543841 () Bool)

(assert (=> b!799316 (=> (not res!543841) (not e!443271))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!799316 (= res!543841 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21229 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20808 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21229 a!3170)) (= (select (arr!20808 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!799317 () Bool)

(declare-fun e!443274 () Bool)

(assert (=> b!799317 (= e!443274 e!443275)))

(declare-fun res!543843 () Bool)

(assert (=> b!799317 (=> (not res!543843) (not e!443275))))

(assert (=> b!799317 (= res!543843 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!356918 #b00000000000000000000000000000000) (bvslt lt!356918 (size!21229 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!799317 (= lt!356918 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!799318 () Bool)

(assert (=> b!799318 (= e!443275 false)))

(declare-fun lt!356917 () SeekEntryResult!8399)

(assert (=> b!799318 (= lt!356917 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356918 vacantBefore!23 (select (arr!20808 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799319 () Bool)

(declare-fun res!543833 () Bool)

(declare-fun e!443276 () Bool)

(assert (=> b!799319 (=> (not res!543833) (not e!443276))))

(assert (=> b!799319 (= res!543833 (and (= (size!21229 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21229 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21229 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!799320 () Bool)

(declare-fun res!543838 () Bool)

(assert (=> b!799320 (=> (not res!543838) (not e!443276))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!799320 (= res!543838 (validKeyInArray!0 (select (arr!20808 a!3170) j!153)))))

(declare-fun b!799321 () Bool)

(assert (=> b!799321 (= e!443276 e!443271)))

(declare-fun res!543845 () Bool)

(assert (=> b!799321 (=> (not res!543845) (not e!443271))))

(declare-fun lt!356921 () SeekEntryResult!8399)

(assert (=> b!799321 (= res!543845 (or (= lt!356921 (MissingZero!8399 i!1163)) (= lt!356921 (MissingVacant!8399 i!1163))))))

(assert (=> b!799321 (= lt!356921 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!799322 () Bool)

(assert (=> b!799322 (= e!443272 e!443274)))

(declare-fun res!543844 () Bool)

(assert (=> b!799322 (=> (not res!543844) (not e!443274))))

(declare-fun lt!356916 () SeekEntryResult!8399)

(declare-fun lt!356919 () SeekEntryResult!8399)

(assert (=> b!799322 (= res!543844 (and (= lt!356919 lt!356916) (= lt!356916 (Found!8399 j!153)) (not (= (select (arr!20808 a!3170) index!1236) (select (arr!20808 a!3170) j!153)))))))

(assert (=> b!799322 (= lt!356916 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20808 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!799322 (= lt!356919 (seekEntryOrOpen!0 (select (arr!20808 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799323 () Bool)

(declare-fun res!543836 () Bool)

(assert (=> b!799323 (=> (not res!543836) (not e!443271))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43456 (_ BitVec 32)) Bool)

(assert (=> b!799323 (= res!543836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!799325 () Bool)

(declare-fun res!543837 () Bool)

(assert (=> b!799325 (=> (not res!543837) (not e!443276))))

(declare-fun arrayContainsKey!0 (array!43456 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!799325 (= res!543837 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!799326 () Bool)

(declare-fun res!543835 () Bool)

(assert (=> b!799326 (=> (not res!543835) (not e!443271))))

(declare-datatypes ((List!14771 0))(
  ( (Nil!14768) (Cons!14767 (h!15896 (_ BitVec 64)) (t!21086 List!14771)) )
))
(declare-fun arrayNoDuplicates!0 (array!43456 (_ BitVec 32) List!14771) Bool)

(assert (=> b!799326 (= res!543835 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14768))))

(declare-fun res!543840 () Bool)

(assert (=> start!68666 (=> (not res!543840) (not e!443276))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68666 (= res!543840 (validMask!0 mask!3266))))

(assert (=> start!68666 e!443276))

(assert (=> start!68666 true))

(declare-fun array_inv!16604 (array!43456) Bool)

(assert (=> start!68666 (array_inv!16604 a!3170)))

(declare-fun b!799324 () Bool)

(declare-fun res!543842 () Bool)

(assert (=> b!799324 (=> (not res!543842) (not e!443276))))

(assert (=> b!799324 (= res!543842 (validKeyInArray!0 k!2044))))

(assert (= (and start!68666 res!543840) b!799319))

(assert (= (and b!799319 res!543833) b!799320))

(assert (= (and b!799320 res!543838) b!799324))

(assert (= (and b!799324 res!543842) b!799325))

(assert (= (and b!799325 res!543837) b!799321))

(assert (= (and b!799321 res!543845) b!799323))

(assert (= (and b!799323 res!543836) b!799326))

(assert (= (and b!799326 res!543835) b!799316))

(assert (= (and b!799316 res!543841) b!799314))

(assert (= (and b!799314 res!543834) b!799322))

(assert (= (and b!799322 res!543844) b!799317))

(assert (= (and b!799317 res!543843) b!799315))

(assert (= (and b!799315 res!543839) b!799318))

(declare-fun m!740315 () Bool)

(assert (=> b!799325 m!740315))

(declare-fun m!740317 () Bool)

(assert (=> start!68666 m!740317))

(declare-fun m!740319 () Bool)

(assert (=> start!68666 m!740319))

(declare-fun m!740321 () Bool)

(assert (=> b!799320 m!740321))

(assert (=> b!799320 m!740321))

(declare-fun m!740323 () Bool)

(assert (=> b!799320 m!740323))

(declare-fun m!740325 () Bool)

(assert (=> b!799316 m!740325))

(declare-fun m!740327 () Bool)

(assert (=> b!799316 m!740327))

(declare-fun m!740329 () Bool)

(assert (=> b!799323 m!740329))

(declare-fun m!740331 () Bool)

(assert (=> b!799326 m!740331))

(declare-fun m!740333 () Bool)

(assert (=> b!799324 m!740333))

(declare-fun m!740335 () Bool)

(assert (=> b!799317 m!740335))

(declare-fun m!740337 () Bool)

(assert (=> b!799322 m!740337))

(assert (=> b!799322 m!740321))

(assert (=> b!799322 m!740321))

(declare-fun m!740339 () Bool)

(assert (=> b!799322 m!740339))

(assert (=> b!799322 m!740321))

(declare-fun m!740341 () Bool)

(assert (=> b!799322 m!740341))

(declare-fun m!740343 () Bool)

(assert (=> b!799315 m!740343))

(declare-fun m!740345 () Bool)

(assert (=> b!799321 m!740345))

(declare-fun m!740347 () Bool)

(assert (=> b!799314 m!740347))

(declare-fun m!740349 () Bool)

(assert (=> b!799314 m!740349))

(declare-fun m!740351 () Bool)

(assert (=> b!799314 m!740351))

(declare-fun m!740353 () Bool)

(assert (=> b!799314 m!740353))

(assert (=> b!799318 m!740321))

(assert (=> b!799318 m!740321))

(declare-fun m!740355 () Bool)

(assert (=> b!799318 m!740355))

(push 1)

