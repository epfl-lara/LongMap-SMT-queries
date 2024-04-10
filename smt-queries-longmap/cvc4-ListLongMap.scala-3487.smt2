; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48394 () Bool)

(assert start!48394)

(declare-fun res!327255 () Bool)

(declare-fun e!309715 () Bool)

(assert (=> start!48394 (=> (not res!327255) (not e!309715))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48394 (= res!327255 (validMask!0 mask!3216))))

(assert (=> start!48394 e!309715))

(assert (=> start!48394 true))

(declare-datatypes ((array!33702 0))(
  ( (array!33703 (arr!16193 (Array (_ BitVec 32) (_ BitVec 64))) (size!16557 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33702)

(declare-fun array_inv!11989 (array!33702) Bool)

(assert (=> start!48394 (array_inv!11989 a!3154)))

(declare-fun b!531761 () Bool)

(declare-fun e!309717 () Bool)

(assert (=> b!531761 (= e!309717 false)))

(declare-fun lt!245073 () Bool)

(declare-datatypes ((List!10312 0))(
  ( (Nil!10309) (Cons!10308 (h!11248 (_ BitVec 64)) (t!16540 List!10312)) )
))
(declare-fun arrayNoDuplicates!0 (array!33702 (_ BitVec 32) List!10312) Bool)

(assert (=> b!531761 (= lt!245073 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10309))))

(declare-fun b!531762 () Bool)

(declare-fun res!327256 () Bool)

(assert (=> b!531762 (=> (not res!327256) (not e!309717))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33702 (_ BitVec 32)) Bool)

(assert (=> b!531762 (= res!327256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!531763 () Bool)

(declare-fun res!327251 () Bool)

(assert (=> b!531763 (=> (not res!327251) (not e!309715))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!531763 (= res!327251 (validKeyInArray!0 k!1998))))

(declare-fun b!531764 () Bool)

(declare-fun res!327252 () Bool)

(assert (=> b!531764 (=> (not res!327252) (not e!309715))))

(declare-fun arrayContainsKey!0 (array!33702 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!531764 (= res!327252 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!531765 () Bool)

(declare-fun res!327254 () Bool)

(assert (=> b!531765 (=> (not res!327254) (not e!309715))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!531765 (= res!327254 (validKeyInArray!0 (select (arr!16193 a!3154) j!147)))))

(declare-fun b!531766 () Bool)

(assert (=> b!531766 (= e!309715 e!309717)))

(declare-fun res!327257 () Bool)

(assert (=> b!531766 (=> (not res!327257) (not e!309717))))

(declare-datatypes ((SeekEntryResult!4651 0))(
  ( (MissingZero!4651 (index!20828 (_ BitVec 32))) (Found!4651 (index!20829 (_ BitVec 32))) (Intermediate!4651 (undefined!5463 Bool) (index!20830 (_ BitVec 32)) (x!49801 (_ BitVec 32))) (Undefined!4651) (MissingVacant!4651 (index!20831 (_ BitVec 32))) )
))
(declare-fun lt!245074 () SeekEntryResult!4651)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!531766 (= res!327257 (or (= lt!245074 (MissingZero!4651 i!1153)) (= lt!245074 (MissingVacant!4651 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33702 (_ BitVec 32)) SeekEntryResult!4651)

(assert (=> b!531766 (= lt!245074 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!531767 () Bool)

(declare-fun res!327253 () Bool)

(assert (=> b!531767 (=> (not res!327253) (not e!309715))))

(assert (=> b!531767 (= res!327253 (and (= (size!16557 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16557 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16557 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48394 res!327255) b!531767))

(assert (= (and b!531767 res!327253) b!531765))

(assert (= (and b!531765 res!327254) b!531763))

(assert (= (and b!531763 res!327251) b!531764))

(assert (= (and b!531764 res!327252) b!531766))

(assert (= (and b!531766 res!327257) b!531762))

(assert (= (and b!531762 res!327256) b!531761))

(declare-fun m!512121 () Bool)

(assert (=> b!531764 m!512121))

(declare-fun m!512123 () Bool)

(assert (=> b!531763 m!512123))

(declare-fun m!512125 () Bool)

(assert (=> b!531766 m!512125))

(declare-fun m!512127 () Bool)

(assert (=> start!48394 m!512127))

(declare-fun m!512129 () Bool)

(assert (=> start!48394 m!512129))

(declare-fun m!512131 () Bool)

(assert (=> b!531761 m!512131))

(declare-fun m!512133 () Bool)

(assert (=> b!531765 m!512133))

(assert (=> b!531765 m!512133))

(declare-fun m!512135 () Bool)

(assert (=> b!531765 m!512135))

(declare-fun m!512137 () Bool)

(assert (=> b!531762 m!512137))

(push 1)

(assert (not b!531766))

(assert (not start!48394))

(assert (not b!531763))

(assert (not b!531764))

