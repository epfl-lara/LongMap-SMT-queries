; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48380 () Bool)

(assert start!48380)

(declare-fun res!327101 () Bool)

(declare-fun e!309653 () Bool)

(assert (=> start!48380 (=> (not res!327101) (not e!309653))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48380 (= res!327101 (validMask!0 mask!3216))))

(assert (=> start!48380 e!309653))

(assert (=> start!48380 true))

(declare-datatypes ((array!33688 0))(
  ( (array!33689 (arr!16186 (Array (_ BitVec 32) (_ BitVec 64))) (size!16550 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33688)

(declare-fun array_inv!11982 (array!33688) Bool)

(assert (=> start!48380 (array_inv!11982 a!3154)))

(declare-fun b!531605 () Bool)

(declare-fun res!327096 () Bool)

(assert (=> b!531605 (=> (not res!327096) (not e!309653))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33688 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!531605 (= res!327096 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!531606 () Bool)

(declare-fun res!327097 () Bool)

(assert (=> b!531606 (=> (not res!327097) (not e!309653))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!531606 (= res!327097 (and (= (size!16550 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16550 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16550 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!531607 () Bool)

(declare-fun e!309654 () Bool)

(assert (=> b!531607 (= e!309654 false)))

(declare-fun lt!245041 () Bool)

(declare-datatypes ((List!10305 0))(
  ( (Nil!10302) (Cons!10301 (h!11241 (_ BitVec 64)) (t!16533 List!10305)) )
))
(declare-fun arrayNoDuplicates!0 (array!33688 (_ BitVec 32) List!10305) Bool)

(assert (=> b!531607 (= lt!245041 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10302))))

(declare-fun b!531608 () Bool)

(declare-fun res!327099 () Bool)

(assert (=> b!531608 (=> (not res!327099) (not e!309654))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33688 (_ BitVec 32)) Bool)

(assert (=> b!531608 (= res!327099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!531609 () Bool)

(declare-fun res!327098 () Bool)

(assert (=> b!531609 (=> (not res!327098) (not e!309653))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!531609 (= res!327098 (validKeyInArray!0 (select (arr!16186 a!3154) j!147)))))

(declare-fun b!531610 () Bool)

(declare-fun res!327095 () Bool)

(assert (=> b!531610 (=> (not res!327095) (not e!309653))))

(assert (=> b!531610 (= res!327095 (validKeyInArray!0 k0!1998))))

(declare-fun b!531611 () Bool)

(assert (=> b!531611 (= e!309653 e!309654)))

(declare-fun res!327100 () Bool)

(assert (=> b!531611 (=> (not res!327100) (not e!309654))))

(declare-datatypes ((SeekEntryResult!4644 0))(
  ( (MissingZero!4644 (index!20800 (_ BitVec 32))) (Found!4644 (index!20801 (_ BitVec 32))) (Intermediate!4644 (undefined!5456 Bool) (index!20802 (_ BitVec 32)) (x!49778 (_ BitVec 32))) (Undefined!4644) (MissingVacant!4644 (index!20803 (_ BitVec 32))) )
))
(declare-fun lt!245040 () SeekEntryResult!4644)

(assert (=> b!531611 (= res!327100 (or (= lt!245040 (MissingZero!4644 i!1153)) (= lt!245040 (MissingVacant!4644 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33688 (_ BitVec 32)) SeekEntryResult!4644)

(assert (=> b!531611 (= lt!245040 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(assert (= (and start!48380 res!327101) b!531606))

(assert (= (and b!531606 res!327097) b!531609))

(assert (= (and b!531609 res!327098) b!531610))

(assert (= (and b!531610 res!327095) b!531605))

(assert (= (and b!531605 res!327096) b!531611))

(assert (= (and b!531611 res!327100) b!531608))

(assert (= (and b!531608 res!327099) b!531607))

(declare-fun m!511989 () Bool)

(assert (=> b!531608 m!511989))

(declare-fun m!511991 () Bool)

(assert (=> b!531609 m!511991))

(assert (=> b!531609 m!511991))

(declare-fun m!511993 () Bool)

(assert (=> b!531609 m!511993))

(declare-fun m!511995 () Bool)

(assert (=> b!531611 m!511995))

(declare-fun m!511997 () Bool)

(assert (=> b!531610 m!511997))

(declare-fun m!511999 () Bool)

(assert (=> start!48380 m!511999))

(declare-fun m!512001 () Bool)

(assert (=> start!48380 m!512001))

(declare-fun m!512003 () Bool)

(assert (=> b!531607 m!512003))

(declare-fun m!512005 () Bool)

(assert (=> b!531605 m!512005))

(check-sat (not b!531608) (not b!531611) (not b!531610) (not b!531607) (not b!531605) (not b!531609) (not start!48380))
(check-sat)
