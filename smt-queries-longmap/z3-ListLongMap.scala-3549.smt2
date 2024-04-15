; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48852 () Bool)

(assert start!48852)

(declare-fun b!538057 () Bool)

(declare-fun e!311990 () Bool)

(declare-fun e!311988 () Bool)

(assert (=> b!538057 (= e!311990 e!311988)))

(declare-fun res!333405 () Bool)

(assert (=> b!538057 (=> (not res!333405) (not e!311988))))

(declare-datatypes ((SeekEntryResult!4831 0))(
  ( (MissingZero!4831 (index!21548 (_ BitVec 32))) (Found!4831 (index!21549 (_ BitVec 32))) (Intermediate!4831 (undefined!5643 Bool) (index!21550 (_ BitVec 32)) (x!50481 (_ BitVec 32))) (Undefined!4831) (MissingVacant!4831 (index!21551 (_ BitVec 32))) )
))
(declare-fun lt!246479 () SeekEntryResult!4831)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!538057 (= res!333405 (or (= lt!246479 (MissingZero!4831 i!1153)) (= lt!246479 (MissingVacant!4831 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-datatypes ((array!34074 0))(
  ( (array!34075 (arr!16376 (Array (_ BitVec 32) (_ BitVec 64))) (size!16741 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34074)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34074 (_ BitVec 32)) SeekEntryResult!4831)

(assert (=> b!538057 (= lt!246479 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!538058 () Bool)

(declare-fun res!333415 () Bool)

(assert (=> b!538058 (=> (not res!333415) (not e!311990))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538058 (= res!333415 (validKeyInArray!0 k0!1998))))

(declare-fun res!333407 () Bool)

(assert (=> start!48852 (=> (not res!333407) (not e!311990))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48852 (= res!333407 (validMask!0 mask!3216))))

(assert (=> start!48852 e!311990))

(assert (=> start!48852 true))

(declare-fun array_inv!12259 (array!34074) Bool)

(assert (=> start!48852 (array_inv!12259 a!3154)))

(declare-fun b!538059 () Bool)

(declare-fun res!333414 () Bool)

(assert (=> b!538059 (=> (not res!333414) (not e!311988))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!538059 (= res!333414 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16741 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16741 a!3154)) (= (select (arr!16376 a!3154) resIndex!32) (select (arr!16376 a!3154) j!147))))))

(declare-fun b!538060 () Bool)

(declare-fun res!333410 () Bool)

(assert (=> b!538060 (=> (not res!333410) (not e!311988))))

(declare-datatypes ((List!10534 0))(
  ( (Nil!10531) (Cons!10530 (h!11473 (_ BitVec 64)) (t!16753 List!10534)) )
))
(declare-fun arrayNoDuplicates!0 (array!34074 (_ BitVec 32) List!10534) Bool)

(assert (=> b!538060 (= res!333410 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10531))))

(declare-fun b!538061 () Bool)

(declare-fun e!311994 () Bool)

(assert (=> b!538061 (= e!311994 (not (bvsge mask!3216 #b00000000000000000000000000000000)))))

(declare-fun lt!246478 () (_ BitVec 32))

(declare-fun lt!246476 () SeekEntryResult!4831)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34074 (_ BitVec 32)) SeekEntryResult!4831)

(assert (=> b!538061 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246478 (select (store (arr!16376 a!3154) i!1153 k0!1998) j!147) (array!34075 (store (arr!16376 a!3154) i!1153 k0!1998) (size!16741 a!3154)) mask!3216) lt!246476)))

(declare-datatypes ((Unit!16834 0))(
  ( (Unit!16835) )
))
(declare-fun lt!246481 () Unit!16834)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34074 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16834)

(assert (=> b!538061 (= lt!246481 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k0!1998 j!147 lt!246478 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!538062 () Bool)

(declare-fun res!333409 () Bool)

(assert (=> b!538062 (=> (not res!333409) (not e!311988))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34074 (_ BitVec 32)) Bool)

(assert (=> b!538062 (= res!333409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!538063 () Bool)

(declare-fun res!333411 () Bool)

(assert (=> b!538063 (=> (not res!333411) (not e!311990))))

(assert (=> b!538063 (= res!333411 (and (= (size!16741 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16741 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16741 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!538064 () Bool)

(declare-fun e!311992 () Bool)

(declare-fun e!311989 () Bool)

(assert (=> b!538064 (= e!311992 e!311989)))

(declare-fun res!333416 () Bool)

(assert (=> b!538064 (=> (not res!333416) (not e!311989))))

(assert (=> b!538064 (= res!333416 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246478 #b00000000000000000000000000000000) (bvslt lt!246478 (size!16741 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538064 (= lt!246478 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!538065 () Bool)

(declare-fun e!311991 () Bool)

(assert (=> b!538065 (= e!311988 e!311991)))

(declare-fun res!333413 () Bool)

(assert (=> b!538065 (=> (not res!333413) (not e!311991))))

(declare-fun lt!246477 () SeekEntryResult!4831)

(assert (=> b!538065 (= res!333413 (= lt!246477 lt!246476))))

(assert (=> b!538065 (= lt!246476 (Intermediate!4831 false resIndex!32 resX!32))))

(assert (=> b!538065 (= lt!246477 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16376 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538066 () Bool)

(assert (=> b!538066 (= e!311991 e!311992)))

(declare-fun res!333412 () Bool)

(assert (=> b!538066 (=> (not res!333412) (not e!311992))))

(declare-fun lt!246475 () SeekEntryResult!4831)

(assert (=> b!538066 (= res!333412 (and (= lt!246475 lt!246477) (not (= (select (arr!16376 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16376 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16376 a!3154) index!1177) (select (arr!16376 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538066 (= lt!246475 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16376 a!3154) j!147) mask!3216) (select (arr!16376 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538067 () Bool)

(declare-fun res!333404 () Bool)

(assert (=> b!538067 (=> (not res!333404) (not e!311990))))

(declare-fun arrayContainsKey!0 (array!34074 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538067 (= res!333404 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!538068 () Bool)

(declare-fun res!333406 () Bool)

(assert (=> b!538068 (=> (not res!333406) (not e!311990))))

(assert (=> b!538068 (= res!333406 (validKeyInArray!0 (select (arr!16376 a!3154) j!147)))))

(declare-fun b!538069 () Bool)

(assert (=> b!538069 (= e!311989 e!311994)))

(declare-fun res!333408 () Bool)

(assert (=> b!538069 (=> (not res!333408) (not e!311994))))

(declare-fun lt!246480 () SeekEntryResult!4831)

(assert (=> b!538069 (= res!333408 (and (= lt!246480 lt!246476) (= lt!246475 lt!246480)))))

(assert (=> b!538069 (= lt!246480 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246478 (select (arr!16376 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48852 res!333407) b!538063))

(assert (= (and b!538063 res!333411) b!538068))

(assert (= (and b!538068 res!333406) b!538058))

(assert (= (and b!538058 res!333415) b!538067))

(assert (= (and b!538067 res!333404) b!538057))

(assert (= (and b!538057 res!333405) b!538062))

(assert (= (and b!538062 res!333409) b!538060))

(assert (= (and b!538060 res!333410) b!538059))

(assert (= (and b!538059 res!333414) b!538065))

(assert (= (and b!538065 res!333413) b!538066))

(assert (= (and b!538066 res!333412) b!538064))

(assert (= (and b!538064 res!333416) b!538069))

(assert (= (and b!538069 res!333408) b!538061))

(declare-fun m!516673 () Bool)

(assert (=> b!538058 m!516673))

(declare-fun m!516675 () Bool)

(assert (=> b!538062 m!516675))

(declare-fun m!516677 () Bool)

(assert (=> b!538065 m!516677))

(assert (=> b!538065 m!516677))

(declare-fun m!516679 () Bool)

(assert (=> b!538065 m!516679))

(declare-fun m!516681 () Bool)

(assert (=> b!538064 m!516681))

(declare-fun m!516683 () Bool)

(assert (=> b!538061 m!516683))

(declare-fun m!516685 () Bool)

(assert (=> b!538061 m!516685))

(assert (=> b!538061 m!516685))

(declare-fun m!516687 () Bool)

(assert (=> b!538061 m!516687))

(declare-fun m!516689 () Bool)

(assert (=> b!538061 m!516689))

(declare-fun m!516691 () Bool)

(assert (=> start!48852 m!516691))

(declare-fun m!516693 () Bool)

(assert (=> start!48852 m!516693))

(assert (=> b!538069 m!516677))

(assert (=> b!538069 m!516677))

(declare-fun m!516695 () Bool)

(assert (=> b!538069 m!516695))

(declare-fun m!516697 () Bool)

(assert (=> b!538067 m!516697))

(declare-fun m!516699 () Bool)

(assert (=> b!538057 m!516699))

(assert (=> b!538068 m!516677))

(assert (=> b!538068 m!516677))

(declare-fun m!516701 () Bool)

(assert (=> b!538068 m!516701))

(declare-fun m!516703 () Bool)

(assert (=> b!538060 m!516703))

(declare-fun m!516705 () Bool)

(assert (=> b!538066 m!516705))

(assert (=> b!538066 m!516677))

(assert (=> b!538066 m!516677))

(declare-fun m!516707 () Bool)

(assert (=> b!538066 m!516707))

(assert (=> b!538066 m!516707))

(assert (=> b!538066 m!516677))

(declare-fun m!516709 () Bool)

(assert (=> b!538066 m!516709))

(declare-fun m!516711 () Bool)

(assert (=> b!538059 m!516711))

(assert (=> b!538059 m!516677))

(check-sat (not b!538060) (not b!538064) (not b!538065) (not b!538069) (not b!538067) (not b!538057) (not b!538061) (not start!48852) (not b!538066) (not b!538058) (not b!538068) (not b!538062))
(check-sat)
