; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48384 () Bool)

(assert start!48384)

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun b!531513 () Bool)

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33702 0))(
  ( (array!33703 (arr!16193 (Array (_ BitVec 32) (_ BitVec 64))) (size!16558 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33702)

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun e!309551 () Bool)

(assert (=> b!531513 (= e!309551 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16558 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16558 a!3154)) (= (select (arr!16193 a!3154) resIndex!32) (select (arr!16193 a!3154) j!147)) (bvsge mask!3216 #b00000000000000000000000000000000) (bvsge index!1177 (bvadd #b00000000000000000000000000000001 mask!3216))))))

(declare-fun b!531514 () Bool)

(declare-fun res!327146 () Bool)

(declare-fun e!309550 () Bool)

(assert (=> b!531514 (=> (not res!327146) (not e!309550))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33702 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!531514 (= res!327146 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun res!327148 () Bool)

(assert (=> start!48384 (=> (not res!327148) (not e!309550))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48384 (= res!327148 (validMask!0 mask!3216))))

(assert (=> start!48384 e!309550))

(assert (=> start!48384 true))

(declare-fun array_inv!12076 (array!33702) Bool)

(assert (=> start!48384 (array_inv!12076 a!3154)))

(declare-fun b!531515 () Bool)

(declare-fun res!327152 () Bool)

(assert (=> b!531515 (=> (not res!327152) (not e!309550))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!531515 (= res!327152 (validKeyInArray!0 (select (arr!16193 a!3154) j!147)))))

(declare-fun b!531516 () Bool)

(assert (=> b!531516 (= e!309550 e!309551)))

(declare-fun res!327145 () Bool)

(assert (=> b!531516 (=> (not res!327145) (not e!309551))))

(declare-datatypes ((SeekEntryResult!4648 0))(
  ( (MissingZero!4648 (index!20816 (_ BitVec 32))) (Found!4648 (index!20817 (_ BitVec 32))) (Intermediate!4648 (undefined!5460 Bool) (index!20818 (_ BitVec 32)) (x!49801 (_ BitVec 32))) (Undefined!4648) (MissingVacant!4648 (index!20819 (_ BitVec 32))) )
))
(declare-fun lt!244843 () SeekEntryResult!4648)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!531516 (= res!327145 (or (= lt!244843 (MissingZero!4648 i!1153)) (= lt!244843 (MissingVacant!4648 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33702 (_ BitVec 32)) SeekEntryResult!4648)

(assert (=> b!531516 (= lt!244843 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!531517 () Bool)

(declare-fun res!327150 () Bool)

(assert (=> b!531517 (=> (not res!327150) (not e!309550))))

(assert (=> b!531517 (= res!327150 (and (= (size!16558 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16558 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16558 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!531518 () Bool)

(declare-fun res!327147 () Bool)

(assert (=> b!531518 (=> (not res!327147) (not e!309551))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33702 (_ BitVec 32)) Bool)

(assert (=> b!531518 (= res!327147 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!531519 () Bool)

(declare-fun res!327149 () Bool)

(assert (=> b!531519 (=> (not res!327149) (not e!309551))))

(declare-datatypes ((List!10351 0))(
  ( (Nil!10348) (Cons!10347 (h!11287 (_ BitVec 64)) (t!16570 List!10351)) )
))
(declare-fun arrayNoDuplicates!0 (array!33702 (_ BitVec 32) List!10351) Bool)

(assert (=> b!531519 (= res!327149 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10348))))

(declare-fun b!531520 () Bool)

(declare-fun res!327151 () Bool)

(assert (=> b!531520 (=> (not res!327151) (not e!309550))))

(assert (=> b!531520 (= res!327151 (validKeyInArray!0 k0!1998))))

(assert (= (and start!48384 res!327148) b!531517))

(assert (= (and b!531517 res!327150) b!531515))

(assert (= (and b!531515 res!327152) b!531520))

(assert (= (and b!531520 res!327151) b!531514))

(assert (= (and b!531514 res!327146) b!531516))

(assert (= (and b!531516 res!327145) b!531518))

(assert (= (and b!531518 res!327147) b!531519))

(assert (= (and b!531519 res!327149) b!531513))

(declare-fun m!511387 () Bool)

(assert (=> b!531516 m!511387))

(declare-fun m!511389 () Bool)

(assert (=> b!531515 m!511389))

(assert (=> b!531515 m!511389))

(declare-fun m!511391 () Bool)

(assert (=> b!531515 m!511391))

(declare-fun m!511393 () Bool)

(assert (=> b!531519 m!511393))

(declare-fun m!511395 () Bool)

(assert (=> b!531514 m!511395))

(declare-fun m!511397 () Bool)

(assert (=> b!531520 m!511397))

(declare-fun m!511399 () Bool)

(assert (=> start!48384 m!511399))

(declare-fun m!511401 () Bool)

(assert (=> start!48384 m!511401))

(declare-fun m!511403 () Bool)

(assert (=> b!531513 m!511403))

(assert (=> b!531513 m!511389))

(declare-fun m!511405 () Bool)

(assert (=> b!531518 m!511405))

(check-sat (not b!531519) (not start!48384) (not b!531514) (not b!531518) (not b!531520) (not b!531516) (not b!531515))
(check-sat)
