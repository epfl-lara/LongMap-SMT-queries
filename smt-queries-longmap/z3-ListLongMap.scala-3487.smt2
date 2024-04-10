; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48392 () Bool)

(assert start!48392)

(declare-fun b!531740 () Bool)

(declare-fun res!327231 () Bool)

(declare-fun e!309706 () Bool)

(assert (=> b!531740 (=> (not res!327231) (not e!309706))))

(declare-datatypes ((array!33700 0))(
  ( (array!33701 (arr!16192 (Array (_ BitVec 32) (_ BitVec 64))) (size!16556 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33700)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33700 (_ BitVec 32)) Bool)

(assert (=> b!531740 (= res!327231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!531741 () Bool)

(declare-fun res!327235 () Bool)

(declare-fun e!309708 () Bool)

(assert (=> b!531741 (=> (not res!327235) (not e!309708))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!531741 (= res!327235 (and (= (size!16556 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16556 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16556 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!531742 () Bool)

(declare-fun res!327230 () Bool)

(assert (=> b!531742 (=> (not res!327230) (not e!309708))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33700 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!531742 (= res!327230 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!531743 () Bool)

(assert (=> b!531743 (= e!309708 e!309706)))

(declare-fun res!327236 () Bool)

(assert (=> b!531743 (=> (not res!327236) (not e!309706))))

(declare-datatypes ((SeekEntryResult!4650 0))(
  ( (MissingZero!4650 (index!20824 (_ BitVec 32))) (Found!4650 (index!20825 (_ BitVec 32))) (Intermediate!4650 (undefined!5462 Bool) (index!20826 (_ BitVec 32)) (x!49800 (_ BitVec 32))) (Undefined!4650) (MissingVacant!4650 (index!20827 (_ BitVec 32))) )
))
(declare-fun lt!245067 () SeekEntryResult!4650)

(assert (=> b!531743 (= res!327236 (or (= lt!245067 (MissingZero!4650 i!1153)) (= lt!245067 (MissingVacant!4650 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33700 (_ BitVec 32)) SeekEntryResult!4650)

(assert (=> b!531743 (= lt!245067 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!531744 () Bool)

(declare-fun res!327232 () Bool)

(assert (=> b!531744 (=> (not res!327232) (not e!309708))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!531744 (= res!327232 (validKeyInArray!0 (select (arr!16192 a!3154) j!147)))))

(declare-fun b!531745 () Bool)

(assert (=> b!531745 (= e!309706 false)))

(declare-fun lt!245068 () Bool)

(declare-datatypes ((List!10311 0))(
  ( (Nil!10308) (Cons!10307 (h!11247 (_ BitVec 64)) (t!16539 List!10311)) )
))
(declare-fun arrayNoDuplicates!0 (array!33700 (_ BitVec 32) List!10311) Bool)

(assert (=> b!531745 (= lt!245068 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10308))))

(declare-fun b!531746 () Bool)

(declare-fun res!327233 () Bool)

(assert (=> b!531746 (=> (not res!327233) (not e!309708))))

(assert (=> b!531746 (= res!327233 (validKeyInArray!0 k0!1998))))

(declare-fun res!327234 () Bool)

(assert (=> start!48392 (=> (not res!327234) (not e!309708))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48392 (= res!327234 (validMask!0 mask!3216))))

(assert (=> start!48392 e!309708))

(assert (=> start!48392 true))

(declare-fun array_inv!11988 (array!33700) Bool)

(assert (=> start!48392 (array_inv!11988 a!3154)))

(assert (= (and start!48392 res!327234) b!531741))

(assert (= (and b!531741 res!327235) b!531744))

(assert (= (and b!531744 res!327232) b!531746))

(assert (= (and b!531746 res!327233) b!531742))

(assert (= (and b!531742 res!327230) b!531743))

(assert (= (and b!531743 res!327236) b!531740))

(assert (= (and b!531740 res!327231) b!531745))

(declare-fun m!512103 () Bool)

(assert (=> b!531746 m!512103))

(declare-fun m!512105 () Bool)

(assert (=> start!48392 m!512105))

(declare-fun m!512107 () Bool)

(assert (=> start!48392 m!512107))

(declare-fun m!512109 () Bool)

(assert (=> b!531744 m!512109))

(assert (=> b!531744 m!512109))

(declare-fun m!512111 () Bool)

(assert (=> b!531744 m!512111))

(declare-fun m!512113 () Bool)

(assert (=> b!531743 m!512113))

(declare-fun m!512115 () Bool)

(assert (=> b!531745 m!512115))

(declare-fun m!512117 () Bool)

(assert (=> b!531740 m!512117))

(declare-fun m!512119 () Bool)

(assert (=> b!531742 m!512119))

(check-sat (not b!531743) (not b!531746) (not b!531745) (not start!48392) (not b!531744) (not b!531742) (not b!531740))
(check-sat)
