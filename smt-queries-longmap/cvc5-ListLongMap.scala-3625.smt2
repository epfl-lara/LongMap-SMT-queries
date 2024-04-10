; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49988 () Bool)

(assert start!49988)

(declare-fun b!548101 () Bool)

(declare-fun res!341516 () Bool)

(declare-fun e!316682 () Bool)

(assert (=> b!548101 (=> (not res!341516) (not e!316682))))

(declare-datatypes ((array!34570 0))(
  ( (array!34571 (arr!16605 (Array (_ BitVec 32) (_ BitVec 64))) (size!16969 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34570)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!548101 (= res!341516 (validKeyInArray!0 (select (arr!16605 a!3118) j!142)))))

(declare-fun res!341514 () Bool)

(assert (=> start!49988 (=> (not res!341514) (not e!316682))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49988 (= res!341514 (validMask!0 mask!3119))))

(assert (=> start!49988 e!316682))

(assert (=> start!49988 true))

(declare-fun array_inv!12401 (array!34570) Bool)

(assert (=> start!49988 (array_inv!12401 a!3118)))

(declare-fun b!548102 () Bool)

(declare-fun e!316683 () Bool)

(assert (=> b!548102 (= e!316682 e!316683)))

(declare-fun res!341512 () Bool)

(assert (=> b!548102 (=> (not res!341512) (not e!316683))))

(declare-datatypes ((SeekEntryResult!5054 0))(
  ( (MissingZero!5054 (index!22443 (_ BitVec 32))) (Found!5054 (index!22444 (_ BitVec 32))) (Intermediate!5054 (undefined!5866 Bool) (index!22445 (_ BitVec 32)) (x!51386 (_ BitVec 32))) (Undefined!5054) (MissingVacant!5054 (index!22446 (_ BitVec 32))) )
))
(declare-fun lt!249724 () SeekEntryResult!5054)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!548102 (= res!341512 (or (= lt!249724 (MissingZero!5054 i!1132)) (= lt!249724 (MissingVacant!5054 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34570 (_ BitVec 32)) SeekEntryResult!5054)

(assert (=> b!548102 (= lt!249724 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!548103 () Bool)

(declare-fun res!341515 () Bool)

(assert (=> b!548103 (=> (not res!341515) (not e!316683))))

(declare-datatypes ((List!10685 0))(
  ( (Nil!10682) (Cons!10681 (h!11648 (_ BitVec 64)) (t!16913 List!10685)) )
))
(declare-fun arrayNoDuplicates!0 (array!34570 (_ BitVec 32) List!10685) Bool)

(assert (=> b!548103 (= res!341515 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10682))))

(declare-fun b!548104 () Bool)

(declare-fun res!341513 () Bool)

(assert (=> b!548104 (=> (not res!341513) (not e!316682))))

(declare-fun arrayContainsKey!0 (array!34570 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!548104 (= res!341513 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!548105 () Bool)

(declare-fun res!341510 () Bool)

(assert (=> b!548105 (=> (not res!341510) (not e!316682))))

(assert (=> b!548105 (= res!341510 (validKeyInArray!0 k!1914))))

(declare-fun b!548106 () Bool)

(assert (=> b!548106 (= e!316683 false)))

(declare-fun lt!249723 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!548106 (= lt!249723 (toIndex!0 (select (arr!16605 a!3118) j!142) mask!3119))))

(declare-fun b!548107 () Bool)

(declare-fun res!341511 () Bool)

(assert (=> b!548107 (=> (not res!341511) (not e!316682))))

(assert (=> b!548107 (= res!341511 (and (= (size!16969 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16969 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16969 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!548108 () Bool)

(declare-fun res!341509 () Bool)

(assert (=> b!548108 (=> (not res!341509) (not e!316683))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34570 (_ BitVec 32)) Bool)

(assert (=> b!548108 (= res!341509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!49988 res!341514) b!548107))

(assert (= (and b!548107 res!341511) b!548101))

(assert (= (and b!548101 res!341516) b!548105))

(assert (= (and b!548105 res!341510) b!548104))

(assert (= (and b!548104 res!341513) b!548102))

(assert (= (and b!548102 res!341512) b!548108))

(assert (= (and b!548108 res!341509) b!548103))

(assert (= (and b!548103 res!341515) b!548106))

(declare-fun m!525207 () Bool)

(assert (=> b!548103 m!525207))

(declare-fun m!525209 () Bool)

(assert (=> b!548105 m!525209))

(declare-fun m!525211 () Bool)

(assert (=> b!548102 m!525211))

(declare-fun m!525213 () Bool)

(assert (=> b!548108 m!525213))

(declare-fun m!525215 () Bool)

(assert (=> b!548106 m!525215))

(assert (=> b!548106 m!525215))

(declare-fun m!525217 () Bool)

(assert (=> b!548106 m!525217))

(assert (=> b!548101 m!525215))

(assert (=> b!548101 m!525215))

(declare-fun m!525219 () Bool)

(assert (=> b!548101 m!525219))

(declare-fun m!525221 () Bool)

(assert (=> start!49988 m!525221))

(declare-fun m!525223 () Bool)

(assert (=> start!49988 m!525223))

(declare-fun m!525225 () Bool)

(assert (=> b!548104 m!525225))

(push 1)

