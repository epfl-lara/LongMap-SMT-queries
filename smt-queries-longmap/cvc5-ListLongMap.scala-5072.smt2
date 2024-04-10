; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68942 () Bool)

(assert start!68942)

(declare-fun b!804243 () Bool)

(declare-fun res!548766 () Bool)

(declare-fun e!445569 () Bool)

(assert (=> b!804243 (=> (not res!548766) (not e!445569))))

(declare-datatypes ((array!43732 0))(
  ( (array!43733 (arr!20946 (Array (_ BitVec 32) (_ BitVec 64))) (size!21367 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43732)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43732 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804243 (= res!548766 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804244 () Bool)

(declare-fun res!548767 () Bool)

(assert (=> b!804244 (=> (not res!548767) (not e!445569))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804244 (= res!548767 (validKeyInArray!0 (select (arr!20946 a!3170) j!153)))))

(declare-fun b!804245 () Bool)

(declare-fun e!445570 () Bool)

(assert (=> b!804245 (= e!445569 e!445570)))

(declare-fun res!548765 () Bool)

(assert (=> b!804245 (=> (not res!548765) (not e!445570))))

(declare-datatypes ((SeekEntryResult!8537 0))(
  ( (MissingZero!8537 (index!36516 (_ BitVec 32))) (Found!8537 (index!36517 (_ BitVec 32))) (Intermediate!8537 (undefined!9349 Bool) (index!36518 (_ BitVec 32)) (x!67351 (_ BitVec 32))) (Undefined!8537) (MissingVacant!8537 (index!36519 (_ BitVec 32))) )
))
(declare-fun lt!360097 () SeekEntryResult!8537)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!804245 (= res!548765 (or (= lt!360097 (MissingZero!8537 i!1163)) (= lt!360097 (MissingVacant!8537 i!1163))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43732 (_ BitVec 32)) SeekEntryResult!8537)

(assert (=> b!804245 (= lt!360097 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!804246 () Bool)

(declare-fun res!548764 () Bool)

(assert (=> b!804246 (=> (not res!548764) (not e!445569))))

(assert (=> b!804246 (= res!548764 (and (= (size!21367 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21367 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21367 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804247 () Bool)

(assert (=> b!804247 (= e!445570 false)))

(declare-fun lt!360098 () Bool)

(declare-datatypes ((List!14909 0))(
  ( (Nil!14906) (Cons!14905 (h!16034 (_ BitVec 64)) (t!21224 List!14909)) )
))
(declare-fun arrayNoDuplicates!0 (array!43732 (_ BitVec 32) List!14909) Bool)

(assert (=> b!804247 (= lt!360098 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14906))))

(declare-fun b!804248 () Bool)

(declare-fun res!548762 () Bool)

(assert (=> b!804248 (=> (not res!548762) (not e!445569))))

(assert (=> b!804248 (= res!548762 (validKeyInArray!0 k!2044))))

(declare-fun b!804249 () Bool)

(declare-fun res!548763 () Bool)

(assert (=> b!804249 (=> (not res!548763) (not e!445570))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43732 (_ BitVec 32)) Bool)

(assert (=> b!804249 (= res!548763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!548768 () Bool)

(assert (=> start!68942 (=> (not res!548768) (not e!445569))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68942 (= res!548768 (validMask!0 mask!3266))))

(assert (=> start!68942 e!445569))

(assert (=> start!68942 true))

(declare-fun array_inv!16742 (array!43732) Bool)

(assert (=> start!68942 (array_inv!16742 a!3170)))

(assert (= (and start!68942 res!548768) b!804246))

(assert (= (and b!804246 res!548764) b!804244))

(assert (= (and b!804244 res!548767) b!804248))

(assert (= (and b!804248 res!548762) b!804243))

(assert (= (and b!804243 res!548766) b!804245))

(assert (= (and b!804245 res!548765) b!804249))

(assert (= (and b!804249 res!548763) b!804247))

(declare-fun m!746147 () Bool)

(assert (=> b!804245 m!746147))

(declare-fun m!746149 () Bool)

(assert (=> b!804247 m!746149))

(declare-fun m!746151 () Bool)

(assert (=> b!804249 m!746151))

(declare-fun m!746153 () Bool)

(assert (=> b!804244 m!746153))

(assert (=> b!804244 m!746153))

(declare-fun m!746155 () Bool)

(assert (=> b!804244 m!746155))

(declare-fun m!746157 () Bool)

(assert (=> b!804243 m!746157))

(declare-fun m!746159 () Bool)

(assert (=> b!804248 m!746159))

(declare-fun m!746161 () Bool)

(assert (=> start!68942 m!746161))

(declare-fun m!746163 () Bool)

(assert (=> start!68942 m!746163))

(push 1)

