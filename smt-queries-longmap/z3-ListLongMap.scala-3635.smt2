; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50188 () Bool)

(assert start!50188)

(declare-fun b!549304 () Bool)

(declare-fun e!317285 () Bool)

(assert (=> b!549304 (= e!317285 false)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!250090 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34641 0))(
  ( (array!34642 (arr!16636 (Array (_ BitVec 32) (_ BitVec 64))) (size!17000 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34641)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549304 (= lt!250090 (toIndex!0 (select (store (arr!16636 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(declare-fun b!549305 () Bool)

(declare-fun res!342450 () Bool)

(assert (=> b!549305 (=> (not res!342450) (not e!317285))))

(declare-datatypes ((List!10716 0))(
  ( (Nil!10713) (Cons!10712 (h!11685 (_ BitVec 64)) (t!16944 List!10716)) )
))
(declare-fun arrayNoDuplicates!0 (array!34641 (_ BitVec 32) List!10716) Bool)

(assert (=> b!549305 (= res!342450 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10713))))

(declare-fun res!342452 () Bool)

(declare-fun e!317286 () Bool)

(assert (=> start!50188 (=> (not res!342452) (not e!317286))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50188 (= res!342452 (validMask!0 mask!3119))))

(assert (=> start!50188 e!317286))

(assert (=> start!50188 true))

(declare-fun array_inv!12432 (array!34641) Bool)

(assert (=> start!50188 (array_inv!12432 a!3118)))

(declare-fun b!549306 () Bool)

(declare-fun res!342453 () Bool)

(assert (=> b!549306 (=> (not res!342453) (not e!317286))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549306 (= res!342453 (validKeyInArray!0 k0!1914))))

(declare-fun b!549307 () Bool)

(declare-fun res!342448 () Bool)

(assert (=> b!549307 (=> (not res!342448) (not e!317286))))

(assert (=> b!549307 (= res!342448 (validKeyInArray!0 (select (arr!16636 a!3118) j!142)))))

(declare-fun b!549308 () Bool)

(assert (=> b!549308 (= e!317286 e!317285)))

(declare-fun res!342454 () Bool)

(assert (=> b!549308 (=> (not res!342454) (not e!317285))))

(declare-datatypes ((SeekEntryResult!5085 0))(
  ( (MissingZero!5085 (index!22567 (_ BitVec 32))) (Found!5085 (index!22568 (_ BitVec 32))) (Intermediate!5085 (undefined!5897 Bool) (index!22569 (_ BitVec 32)) (x!51503 (_ BitVec 32))) (Undefined!5085) (MissingVacant!5085 (index!22570 (_ BitVec 32))) )
))
(declare-fun lt!250089 () SeekEntryResult!5085)

(assert (=> b!549308 (= res!342454 (or (= lt!250089 (MissingZero!5085 i!1132)) (= lt!250089 (MissingVacant!5085 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34641 (_ BitVec 32)) SeekEntryResult!5085)

(assert (=> b!549308 (= lt!250089 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!549309 () Bool)

(declare-fun res!342449 () Bool)

(assert (=> b!549309 (=> (not res!342449) (not e!317286))))

(assert (=> b!549309 (= res!342449 (and (= (size!17000 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17000 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17000 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!549310 () Bool)

(declare-fun res!342455 () Bool)

(assert (=> b!549310 (=> (not res!342455) (not e!317285))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34641 (_ BitVec 32)) Bool)

(assert (=> b!549310 (= res!342455 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549311 () Bool)

(declare-fun res!342451 () Bool)

(assert (=> b!549311 (=> (not res!342451) (not e!317286))))

(declare-fun arrayContainsKey!0 (array!34641 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549311 (= res!342451 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!50188 res!342452) b!549309))

(assert (= (and b!549309 res!342449) b!549307))

(assert (= (and b!549307 res!342448) b!549306))

(assert (= (and b!549306 res!342453) b!549311))

(assert (= (and b!549311 res!342451) b!549308))

(assert (= (and b!549308 res!342454) b!549310))

(assert (= (and b!549310 res!342455) b!549305))

(assert (= (and b!549305 res!342450) b!549304))

(declare-fun m!526155 () Bool)

(assert (=> b!549306 m!526155))

(declare-fun m!526157 () Bool)

(assert (=> b!549310 m!526157))

(declare-fun m!526159 () Bool)

(assert (=> b!549311 m!526159))

(declare-fun m!526161 () Bool)

(assert (=> b!549304 m!526161))

(declare-fun m!526163 () Bool)

(assert (=> b!549304 m!526163))

(assert (=> b!549304 m!526163))

(declare-fun m!526165 () Bool)

(assert (=> b!549304 m!526165))

(declare-fun m!526167 () Bool)

(assert (=> b!549307 m!526167))

(assert (=> b!549307 m!526167))

(declare-fun m!526169 () Bool)

(assert (=> b!549307 m!526169))

(declare-fun m!526171 () Bool)

(assert (=> start!50188 m!526171))

(declare-fun m!526173 () Bool)

(assert (=> start!50188 m!526173))

(declare-fun m!526175 () Bool)

(assert (=> b!549308 m!526175))

(declare-fun m!526177 () Bool)

(assert (=> b!549305 m!526177))

(check-sat (not b!549310) (not b!549308) (not b!549304) (not b!549307) (not b!549306) (not b!549305) (not b!549311) (not start!50188))
(check-sat)
