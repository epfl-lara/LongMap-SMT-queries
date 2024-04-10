; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48818 () Bool)

(assert start!48818)

(declare-fun res!332641 () Bool)

(declare-fun e!311798 () Bool)

(assert (=> start!48818 (=> (not res!332641) (not e!311798))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48818 (= res!332641 (validMask!0 mask!3216))))

(assert (=> start!48818 e!311798))

(assert (=> start!48818 true))

(declare-datatypes ((array!34030 0))(
  ( (array!34031 (arr!16354 (Array (_ BitVec 32) (_ BitVec 64))) (size!16718 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34030)

(declare-fun array_inv!12150 (array!34030) Bool)

(assert (=> start!48818 (array_inv!12150 a!3154)))

(declare-fun b!537431 () Bool)

(declare-fun res!332636 () Bool)

(assert (=> b!537431 (=> (not res!332636) (not e!311798))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34030 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537431 (= res!332636 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!537432 () Bool)

(declare-fun e!311796 () Bool)

(declare-fun e!311795 () Bool)

(assert (=> b!537432 (= e!311796 e!311795)))

(declare-fun res!332645 () Bool)

(assert (=> b!537432 (=> (not res!332645) (not e!311795))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!246402 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!537432 (= res!332645 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246402 #b00000000000000000000000000000000) (bvslt lt!246402 (size!16718 a!3154))))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537432 (= lt!246402 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!537433 () Bool)

(declare-fun res!332647 () Bool)

(declare-fun e!311797 () Bool)

(assert (=> b!537433 (=> (not res!332647) (not e!311797))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34030 (_ BitVec 32)) Bool)

(assert (=> b!537433 (= res!332647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!537434 () Bool)

(declare-fun res!332648 () Bool)

(assert (=> b!537434 (=> (not res!332648) (not e!311798))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537434 (= res!332648 (validKeyInArray!0 k0!1998))))

(declare-fun b!537435 () Bool)

(declare-fun res!332642 () Bool)

(assert (=> b!537435 (=> (not res!332642) (not e!311798))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!537435 (= res!332642 (and (= (size!16718 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16718 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16718 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!537436 () Bool)

(declare-fun res!332640 () Bool)

(assert (=> b!537436 (=> (not res!332640) (not e!311797))))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!537436 (= res!332640 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16718 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16718 a!3154)) (= (select (arr!16354 a!3154) resIndex!32) (select (arr!16354 a!3154) j!147))))))

(declare-fun b!537437 () Bool)

(declare-fun res!332638 () Bool)

(assert (=> b!537437 (=> (not res!332638) (not e!311797))))

(declare-datatypes ((List!10473 0))(
  ( (Nil!10470) (Cons!10469 (h!11412 (_ BitVec 64)) (t!16701 List!10473)) )
))
(declare-fun arrayNoDuplicates!0 (array!34030 (_ BitVec 32) List!10473) Bool)

(assert (=> b!537437 (= res!332638 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10470))))

(declare-fun b!537438 () Bool)

(assert (=> b!537438 (= e!311795 false)))

(declare-datatypes ((SeekEntryResult!4812 0))(
  ( (MissingZero!4812 (index!21472 (_ BitVec 32))) (Found!4812 (index!21473 (_ BitVec 32))) (Intermediate!4812 (undefined!5624 Bool) (index!21474 (_ BitVec 32)) (x!50403 (_ BitVec 32))) (Undefined!4812) (MissingVacant!4812 (index!21475 (_ BitVec 32))) )
))
(declare-fun lt!246400 () SeekEntryResult!4812)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34030 (_ BitVec 32)) SeekEntryResult!4812)

(assert (=> b!537438 (= lt!246400 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246402 (select (arr!16354 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537439 () Bool)

(declare-fun res!332643 () Bool)

(assert (=> b!537439 (=> (not res!332643) (not e!311798))))

(assert (=> b!537439 (= res!332643 (validKeyInArray!0 (select (arr!16354 a!3154) j!147)))))

(declare-fun b!537440 () Bool)

(assert (=> b!537440 (= e!311797 e!311796)))

(declare-fun res!332646 () Bool)

(assert (=> b!537440 (=> (not res!332646) (not e!311796))))

(declare-fun lt!246403 () SeekEntryResult!4812)

(assert (=> b!537440 (= res!332646 (= lt!246403 (Intermediate!4812 false resIndex!32 resX!32)))))

(assert (=> b!537440 (= lt!246403 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16354 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537441 () Bool)

(assert (=> b!537441 (= e!311798 e!311797)))

(declare-fun res!332637 () Bool)

(assert (=> b!537441 (=> (not res!332637) (not e!311797))))

(declare-fun lt!246401 () SeekEntryResult!4812)

(assert (=> b!537441 (= res!332637 (or (= lt!246401 (MissingZero!4812 i!1153)) (= lt!246401 (MissingVacant!4812 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34030 (_ BitVec 32)) SeekEntryResult!4812)

(assert (=> b!537441 (= lt!246401 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!537442 () Bool)

(declare-fun res!332639 () Bool)

(assert (=> b!537442 (=> (not res!332639) (not e!311796))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537442 (= res!332639 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16354 a!3154) j!147) mask!3216) (select (arr!16354 a!3154) j!147) a!3154 mask!3216) lt!246403))))

(declare-fun b!537443 () Bool)

(declare-fun res!332644 () Bool)

(assert (=> b!537443 (=> (not res!332644) (not e!311796))))

(assert (=> b!537443 (= res!332644 (and (not (= (select (arr!16354 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16354 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16354 a!3154) index!1177) (select (arr!16354 a!3154) j!147)))))))

(assert (= (and start!48818 res!332641) b!537435))

(assert (= (and b!537435 res!332642) b!537439))

(assert (= (and b!537439 res!332643) b!537434))

(assert (= (and b!537434 res!332648) b!537431))

(assert (= (and b!537431 res!332636) b!537441))

(assert (= (and b!537441 res!332637) b!537433))

(assert (= (and b!537433 res!332647) b!537437))

(assert (= (and b!537437 res!332638) b!537436))

(assert (= (and b!537436 res!332640) b!537440))

(assert (= (and b!537440 res!332646) b!537442))

(assert (= (and b!537442 res!332639) b!537443))

(assert (= (and b!537443 res!332644) b!537432))

(assert (= (and b!537432 res!332645) b!537438))

(declare-fun m!516665 () Bool)

(assert (=> b!537439 m!516665))

(assert (=> b!537439 m!516665))

(declare-fun m!516667 () Bool)

(assert (=> b!537439 m!516667))

(assert (=> b!537438 m!516665))

(assert (=> b!537438 m!516665))

(declare-fun m!516669 () Bool)

(assert (=> b!537438 m!516669))

(declare-fun m!516671 () Bool)

(assert (=> b!537433 m!516671))

(assert (=> b!537442 m!516665))

(assert (=> b!537442 m!516665))

(declare-fun m!516673 () Bool)

(assert (=> b!537442 m!516673))

(assert (=> b!537442 m!516673))

(assert (=> b!537442 m!516665))

(declare-fun m!516675 () Bool)

(assert (=> b!537442 m!516675))

(declare-fun m!516677 () Bool)

(assert (=> b!537432 m!516677))

(declare-fun m!516679 () Bool)

(assert (=> b!537437 m!516679))

(declare-fun m!516681 () Bool)

(assert (=> b!537434 m!516681))

(declare-fun m!516683 () Bool)

(assert (=> b!537436 m!516683))

(assert (=> b!537436 m!516665))

(declare-fun m!516685 () Bool)

(assert (=> b!537443 m!516685))

(assert (=> b!537443 m!516665))

(declare-fun m!516687 () Bool)

(assert (=> start!48818 m!516687))

(declare-fun m!516689 () Bool)

(assert (=> start!48818 m!516689))

(declare-fun m!516691 () Bool)

(assert (=> b!537441 m!516691))

(assert (=> b!537440 m!516665))

(assert (=> b!537440 m!516665))

(declare-fun m!516693 () Bool)

(assert (=> b!537440 m!516693))

(declare-fun m!516695 () Bool)

(assert (=> b!537431 m!516695))

(check-sat (not b!537433) (not start!48818) (not b!537432) (not b!537441) (not b!537431) (not b!537438) (not b!537434) (not b!537442) (not b!537440) (not b!537439) (not b!537437))
(check-sat)
