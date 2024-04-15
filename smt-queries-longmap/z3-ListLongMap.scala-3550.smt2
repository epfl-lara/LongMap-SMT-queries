; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48858 () Bool)

(assert start!48858)

(declare-fun b!538174 () Bool)

(declare-fun res!333523 () Bool)

(declare-fun e!312054 () Bool)

(assert (=> b!538174 (=> (not res!333523) (not e!312054))))

(declare-datatypes ((array!34080 0))(
  ( (array!34081 (arr!16379 (Array (_ BitVec 32) (_ BitVec 64))) (size!16744 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34080)

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34080 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538174 (= res!333523 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!538175 () Bool)

(declare-fun res!333521 () Bool)

(declare-fun e!312057 () Bool)

(assert (=> b!538175 (=> (not res!333521) (not e!312057))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34080 (_ BitVec 32)) Bool)

(assert (=> b!538175 (= res!333521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!538176 () Bool)

(declare-fun e!312056 () Bool)

(declare-fun e!312055 () Bool)

(assert (=> b!538176 (= e!312056 e!312055)))

(declare-fun res!333526 () Bool)

(assert (=> b!538176 (=> (not res!333526) (not e!312055))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!246542 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!538176 (= res!333526 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246542 #b00000000000000000000000000000000) (bvslt lt!246542 (size!16744 a!3154))))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538176 (= lt!246542 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!538177 () Bool)

(assert (=> b!538177 (= e!312054 e!312057)))

(declare-fun res!333527 () Bool)

(assert (=> b!538177 (=> (not res!333527) (not e!312057))))

(declare-datatypes ((SeekEntryResult!4834 0))(
  ( (MissingZero!4834 (index!21560 (_ BitVec 32))) (Found!4834 (index!21561 (_ BitVec 32))) (Intermediate!4834 (undefined!5646 Bool) (index!21562 (_ BitVec 32)) (x!50492 (_ BitVec 32))) (Undefined!4834) (MissingVacant!4834 (index!21563 (_ BitVec 32))) )
))
(declare-fun lt!246543 () SeekEntryResult!4834)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!538177 (= res!333527 (or (= lt!246543 (MissingZero!4834 i!1153)) (= lt!246543 (MissingVacant!4834 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34080 (_ BitVec 32)) SeekEntryResult!4834)

(assert (=> b!538177 (= lt!246543 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun res!333532 () Bool)

(assert (=> start!48858 (=> (not res!333532) (not e!312054))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48858 (= res!333532 (validMask!0 mask!3216))))

(assert (=> start!48858 e!312054))

(assert (=> start!48858 true))

(declare-fun array_inv!12262 (array!34080) Bool)

(assert (=> start!48858 (array_inv!12262 a!3154)))

(declare-fun b!538178 () Bool)

(declare-fun res!333529 () Bool)

(assert (=> b!538178 (=> (not res!333529) (not e!312054))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!538178 (= res!333529 (and (= (size!16744 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16744 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16744 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!538179 () Bool)

(declare-fun res!333531 () Bool)

(assert (=> b!538179 (=> (not res!333531) (not e!312057))))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!538179 (= res!333531 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16744 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16744 a!3154)) (= (select (arr!16379 a!3154) resIndex!32) (select (arr!16379 a!3154) j!147))))))

(declare-fun b!538180 () Bool)

(declare-fun res!333522 () Bool)

(assert (=> b!538180 (=> (not res!333522) (not e!312054))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538180 (= res!333522 (validKeyInArray!0 (select (arr!16379 a!3154) j!147)))))

(declare-fun b!538181 () Bool)

(declare-fun e!312053 () Bool)

(assert (=> b!538181 (= e!312055 e!312053)))

(declare-fun res!333530 () Bool)

(assert (=> b!538181 (=> (not res!333530) (not e!312053))))

(declare-fun lt!246539 () SeekEntryResult!4834)

(declare-fun lt!246544 () SeekEntryResult!4834)

(declare-fun lt!246540 () SeekEntryResult!4834)

(assert (=> b!538181 (= res!333530 (and (= lt!246540 lt!246544) (= lt!246539 lt!246540)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34080 (_ BitVec 32)) SeekEntryResult!4834)

(assert (=> b!538181 (= lt!246540 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246542 (select (arr!16379 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538182 () Bool)

(declare-fun res!333533 () Bool)

(assert (=> b!538182 (=> (not res!333533) (not e!312057))))

(declare-datatypes ((List!10537 0))(
  ( (Nil!10534) (Cons!10533 (h!11476 (_ BitVec 64)) (t!16756 List!10537)) )
))
(declare-fun arrayNoDuplicates!0 (array!34080 (_ BitVec 32) List!10537) Bool)

(assert (=> b!538182 (= res!333533 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10534))))

(declare-fun b!538183 () Bool)

(assert (=> b!538183 (= e!312053 (not true))))

(assert (=> b!538183 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246542 (select (store (arr!16379 a!3154) i!1153 k0!1998) j!147) (array!34081 (store (arr!16379 a!3154) i!1153 k0!1998) (size!16744 a!3154)) mask!3216) lt!246544)))

(declare-datatypes ((Unit!16840 0))(
  ( (Unit!16841) )
))
(declare-fun lt!246538 () Unit!16840)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34080 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16840)

(assert (=> b!538183 (= lt!246538 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k0!1998 j!147 lt!246542 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!538184 () Bool)

(declare-fun e!312052 () Bool)

(assert (=> b!538184 (= e!312057 e!312052)))

(declare-fun res!333528 () Bool)

(assert (=> b!538184 (=> (not res!333528) (not e!312052))))

(declare-fun lt!246541 () SeekEntryResult!4834)

(assert (=> b!538184 (= res!333528 (= lt!246541 lt!246544))))

(assert (=> b!538184 (= lt!246544 (Intermediate!4834 false resIndex!32 resX!32))))

(assert (=> b!538184 (= lt!246541 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16379 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538185 () Bool)

(declare-fun res!333525 () Bool)

(assert (=> b!538185 (=> (not res!333525) (not e!312054))))

(assert (=> b!538185 (= res!333525 (validKeyInArray!0 k0!1998))))

(declare-fun b!538186 () Bool)

(assert (=> b!538186 (= e!312052 e!312056)))

(declare-fun res!333524 () Bool)

(assert (=> b!538186 (=> (not res!333524) (not e!312056))))

(assert (=> b!538186 (= res!333524 (and (= lt!246539 lt!246541) (not (= (select (arr!16379 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16379 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16379 a!3154) index!1177) (select (arr!16379 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538186 (= lt!246539 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16379 a!3154) j!147) mask!3216) (select (arr!16379 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48858 res!333532) b!538178))

(assert (= (and b!538178 res!333529) b!538180))

(assert (= (and b!538180 res!333522) b!538185))

(assert (= (and b!538185 res!333525) b!538174))

(assert (= (and b!538174 res!333523) b!538177))

(assert (= (and b!538177 res!333527) b!538175))

(assert (= (and b!538175 res!333521) b!538182))

(assert (= (and b!538182 res!333533) b!538179))

(assert (= (and b!538179 res!333531) b!538184))

(assert (= (and b!538184 res!333528) b!538186))

(assert (= (and b!538186 res!333524) b!538176))

(assert (= (and b!538176 res!333526) b!538181))

(assert (= (and b!538181 res!333530) b!538183))

(declare-fun m!516793 () Bool)

(assert (=> b!538185 m!516793))

(declare-fun m!516795 () Bool)

(assert (=> b!538180 m!516795))

(assert (=> b!538180 m!516795))

(declare-fun m!516797 () Bool)

(assert (=> b!538180 m!516797))

(assert (=> b!538184 m!516795))

(assert (=> b!538184 m!516795))

(declare-fun m!516799 () Bool)

(assert (=> b!538184 m!516799))

(assert (=> b!538181 m!516795))

(assert (=> b!538181 m!516795))

(declare-fun m!516801 () Bool)

(assert (=> b!538181 m!516801))

(declare-fun m!516803 () Bool)

(assert (=> b!538183 m!516803))

(declare-fun m!516805 () Bool)

(assert (=> b!538183 m!516805))

(assert (=> b!538183 m!516805))

(declare-fun m!516807 () Bool)

(assert (=> b!538183 m!516807))

(declare-fun m!516809 () Bool)

(assert (=> b!538183 m!516809))

(declare-fun m!516811 () Bool)

(assert (=> b!538175 m!516811))

(declare-fun m!516813 () Bool)

(assert (=> b!538174 m!516813))

(declare-fun m!516815 () Bool)

(assert (=> b!538182 m!516815))

(declare-fun m!516817 () Bool)

(assert (=> b!538179 m!516817))

(assert (=> b!538179 m!516795))

(declare-fun m!516819 () Bool)

(assert (=> b!538176 m!516819))

(declare-fun m!516821 () Bool)

(assert (=> b!538177 m!516821))

(declare-fun m!516823 () Bool)

(assert (=> b!538186 m!516823))

(assert (=> b!538186 m!516795))

(assert (=> b!538186 m!516795))

(declare-fun m!516825 () Bool)

(assert (=> b!538186 m!516825))

(assert (=> b!538186 m!516825))

(assert (=> b!538186 m!516795))

(declare-fun m!516827 () Bool)

(assert (=> b!538186 m!516827))

(declare-fun m!516829 () Bool)

(assert (=> start!48858 m!516829))

(declare-fun m!516831 () Bool)

(assert (=> start!48858 m!516831))

(check-sat (not b!538177) (not b!538176) (not b!538184) (not b!538174) (not b!538185) (not b!538181) (not b!538182) (not start!48858) (not b!538175) (not b!538186) (not b!538180) (not b!538183))
(check-sat)
