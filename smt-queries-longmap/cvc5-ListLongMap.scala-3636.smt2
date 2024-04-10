; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50192 () Bool)

(assert start!50192)

(declare-fun e!317305 () Bool)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun b!549354 () Bool)

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34645 0))(
  ( (array!34646 (arr!16638 (Array (_ BitVec 32) (_ BitVec 64))) (size!17002 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34645)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549354 (= e!317305 (not (validKeyInArray!0 (select (store (arr!16638 a!3118) i!1132 k!1914) j!142))))))

(declare-fun b!549355 () Bool)

(declare-fun res!342505 () Bool)

(declare-fun e!317306 () Bool)

(assert (=> b!549355 (=> (not res!342505) (not e!317306))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34645 (_ BitVec 32)) Bool)

(assert (=> b!549355 (= res!342505 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549356 () Bool)

(assert (=> b!549356 (= e!317306 e!317305)))

(declare-fun res!342501 () Bool)

(assert (=> b!549356 (=> (not res!342501) (not e!317305))))

(declare-fun lt!250101 () (_ BitVec 32))

(assert (=> b!549356 (= res!342501 (and (bvsge mask!3119 #b00000000000000000000000000000000) (bvsge lt!250101 #b00000000000000000000000000000000) (bvslt lt!250101 (bvadd #b00000000000000000000000000000001 mask!3119))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549356 (= lt!250101 (toIndex!0 (select (store (arr!16638 a!3118) i!1132 k!1914) j!142) mask!3119))))

(declare-fun b!549357 () Bool)

(declare-fun res!342502 () Bool)

(declare-fun e!317307 () Bool)

(assert (=> b!549357 (=> (not res!342502) (not e!317307))))

(declare-fun arrayContainsKey!0 (array!34645 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549357 (= res!342502 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!549358 () Bool)

(declare-fun res!342506 () Bool)

(assert (=> b!549358 (=> (not res!342506) (not e!317307))))

(assert (=> b!549358 (= res!342506 (validKeyInArray!0 (select (arr!16638 a!3118) j!142)))))

(declare-fun b!549359 () Bool)

(declare-fun res!342500 () Bool)

(assert (=> b!549359 (=> (not res!342500) (not e!317307))))

(assert (=> b!549359 (= res!342500 (validKeyInArray!0 k!1914))))

(declare-fun b!549360 () Bool)

(assert (=> b!549360 (= e!317307 e!317306)))

(declare-fun res!342499 () Bool)

(assert (=> b!549360 (=> (not res!342499) (not e!317306))))

(declare-datatypes ((SeekEntryResult!5087 0))(
  ( (MissingZero!5087 (index!22575 (_ BitVec 32))) (Found!5087 (index!22576 (_ BitVec 32))) (Intermediate!5087 (undefined!5899 Bool) (index!22577 (_ BitVec 32)) (x!51513 (_ BitVec 32))) (Undefined!5087) (MissingVacant!5087 (index!22578 (_ BitVec 32))) )
))
(declare-fun lt!250102 () SeekEntryResult!5087)

(assert (=> b!549360 (= res!342499 (or (= lt!250102 (MissingZero!5087 i!1132)) (= lt!250102 (MissingVacant!5087 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34645 (_ BitVec 32)) SeekEntryResult!5087)

(assert (=> b!549360 (= lt!250102 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!549361 () Bool)

(declare-fun res!342498 () Bool)

(assert (=> b!549361 (=> (not res!342498) (not e!317306))))

(declare-datatypes ((List!10718 0))(
  ( (Nil!10715) (Cons!10714 (h!11687 (_ BitVec 64)) (t!16946 List!10718)) )
))
(declare-fun arrayNoDuplicates!0 (array!34645 (_ BitVec 32) List!10718) Bool)

(assert (=> b!549361 (= res!342498 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10715))))

(declare-fun b!549362 () Bool)

(declare-fun res!342504 () Bool)

(assert (=> b!549362 (=> (not res!342504) (not e!317307))))

(assert (=> b!549362 (= res!342504 (and (= (size!17002 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17002 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17002 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!342503 () Bool)

(assert (=> start!50192 (=> (not res!342503) (not e!317307))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50192 (= res!342503 (validMask!0 mask!3119))))

(assert (=> start!50192 e!317307))

(assert (=> start!50192 true))

(declare-fun array_inv!12434 (array!34645) Bool)

(assert (=> start!50192 (array_inv!12434 a!3118)))

(assert (= (and start!50192 res!342503) b!549362))

(assert (= (and b!549362 res!342504) b!549358))

(assert (= (and b!549358 res!342506) b!549359))

(assert (= (and b!549359 res!342500) b!549357))

(assert (= (and b!549357 res!342502) b!549360))

(assert (= (and b!549360 res!342499) b!549355))

(assert (= (and b!549355 res!342505) b!549361))

(assert (= (and b!549361 res!342498) b!549356))

(assert (= (and b!549356 res!342501) b!549354))

(declare-fun m!526203 () Bool)

(assert (=> b!549354 m!526203))

(declare-fun m!526205 () Bool)

(assert (=> b!549354 m!526205))

(assert (=> b!549354 m!526205))

(declare-fun m!526207 () Bool)

(assert (=> b!549354 m!526207))

(assert (=> b!549356 m!526203))

(assert (=> b!549356 m!526205))

(assert (=> b!549356 m!526205))

(declare-fun m!526209 () Bool)

(assert (=> b!549356 m!526209))

(declare-fun m!526211 () Bool)

(assert (=> b!549361 m!526211))

(declare-fun m!526213 () Bool)

(assert (=> b!549358 m!526213))

(assert (=> b!549358 m!526213))

(declare-fun m!526215 () Bool)

(assert (=> b!549358 m!526215))

(declare-fun m!526217 () Bool)

(assert (=> b!549355 m!526217))

(declare-fun m!526219 () Bool)

(assert (=> b!549357 m!526219))

(declare-fun m!526221 () Bool)

(assert (=> b!549360 m!526221))

(declare-fun m!526223 () Bool)

(assert (=> start!50192 m!526223))

(declare-fun m!526225 () Bool)

(assert (=> start!50192 m!526225))

(declare-fun m!526227 () Bool)

(assert (=> b!549359 m!526227))

(push 1)

