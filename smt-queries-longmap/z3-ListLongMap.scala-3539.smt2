; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48850 () Bool)

(assert start!48850)

(declare-fun b!537358 () Bool)

(declare-fun res!332460 () Bool)

(declare-fun e!311823 () Bool)

(assert (=> b!537358 (=> (not res!332460) (not e!311823))))

(declare-datatypes ((array!34010 0))(
  ( (array!34011 (arr!16342 (Array (_ BitVec 32) (_ BitVec 64))) (size!16706 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34010)

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34010 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537358 (= res!332460 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!537359 () Bool)

(declare-fun res!332465 () Bool)

(declare-fun e!311821 () Bool)

(assert (=> b!537359 (=> (not res!332465) (not e!311821))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4756 0))(
  ( (MissingZero!4756 (index!21248 (_ BitVec 32))) (Found!4756 (index!21249 (_ BitVec 32))) (Intermediate!4756 (undefined!5568 Bool) (index!21250 (_ BitVec 32)) (x!50334 (_ BitVec 32))) (Undefined!4756) (MissingVacant!4756 (index!21251 (_ BitVec 32))) )
))
(declare-fun lt!246424 () SeekEntryResult!4756)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34010 (_ BitVec 32)) SeekEntryResult!4756)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537359 (= res!332465 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16342 a!3154) j!147) mask!3216) (select (arr!16342 a!3154) j!147) a!3154 mask!3216) lt!246424))))

(declare-fun b!537360 () Bool)

(declare-fun res!332458 () Bool)

(declare-fun e!311819 () Bool)

(assert (=> b!537360 (=> (not res!332458) (not e!311819))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!537360 (= res!332458 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16706 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16706 a!3154)) (= (select (arr!16342 a!3154) resIndex!32) (select (arr!16342 a!3154) j!147))))))

(declare-fun b!537361 () Bool)

(declare-fun res!332463 () Bool)

(assert (=> b!537361 (=> (not res!332463) (not e!311821))))

(assert (=> b!537361 (= res!332463 (and (not (= (select (arr!16342 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16342 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16342 a!3154) index!1177) (select (arr!16342 a!3154) j!147)))))))

(declare-fun b!537362 () Bool)

(declare-fun e!311822 () Bool)

(assert (=> b!537362 (= e!311821 e!311822)))

(declare-fun res!332468 () Bool)

(assert (=> b!537362 (=> (not res!332468) (not e!311822))))

(declare-fun lt!246425 () (_ BitVec 32))

(assert (=> b!537362 (= res!332468 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246425 #b00000000000000000000000000000000) (bvslt lt!246425 (size!16706 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537362 (= lt!246425 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun b!537364 () Bool)

(assert (=> b!537364 (= e!311819 e!311821)))

(declare-fun res!332461 () Bool)

(assert (=> b!537364 (=> (not res!332461) (not e!311821))))

(assert (=> b!537364 (= res!332461 (= lt!246424 (Intermediate!4756 false resIndex!32 resX!32)))))

(assert (=> b!537364 (= lt!246424 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16342 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537365 () Bool)

(assert (=> b!537365 (= e!311822 false)))

(declare-fun lt!246427 () SeekEntryResult!4756)

(assert (=> b!537365 (= lt!246427 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246425 (select (arr!16342 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537366 () Bool)

(declare-fun res!332462 () Bool)

(assert (=> b!537366 (=> (not res!332462) (not e!311823))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!537366 (= res!332462 (and (= (size!16706 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16706 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16706 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!537367 () Bool)

(declare-fun res!332470 () Bool)

(assert (=> b!537367 (=> (not res!332470) (not e!311823))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537367 (= res!332470 (validKeyInArray!0 k0!1998))))

(declare-fun b!537368 () Bool)

(assert (=> b!537368 (= e!311823 e!311819)))

(declare-fun res!332466 () Bool)

(assert (=> b!537368 (=> (not res!332466) (not e!311819))))

(declare-fun lt!246426 () SeekEntryResult!4756)

(assert (=> b!537368 (= res!332466 (or (= lt!246426 (MissingZero!4756 i!1153)) (= lt!246426 (MissingVacant!4756 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34010 (_ BitVec 32)) SeekEntryResult!4756)

(assert (=> b!537368 (= lt!246426 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!537369 () Bool)

(declare-fun res!332469 () Bool)

(assert (=> b!537369 (=> (not res!332469) (not e!311823))))

(assert (=> b!537369 (= res!332469 (validKeyInArray!0 (select (arr!16342 a!3154) j!147)))))

(declare-fun b!537370 () Bool)

(declare-fun res!332459 () Bool)

(assert (=> b!537370 (=> (not res!332459) (not e!311819))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34010 (_ BitVec 32)) Bool)

(assert (=> b!537370 (= res!332459 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!332464 () Bool)

(assert (=> start!48850 (=> (not res!332464) (not e!311823))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48850 (= res!332464 (validMask!0 mask!3216))))

(assert (=> start!48850 e!311823))

(assert (=> start!48850 true))

(declare-fun array_inv!12201 (array!34010) Bool)

(assert (=> start!48850 (array_inv!12201 a!3154)))

(declare-fun b!537363 () Bool)

(declare-fun res!332467 () Bool)

(assert (=> b!537363 (=> (not res!332467) (not e!311819))))

(declare-datatypes ((List!10368 0))(
  ( (Nil!10365) (Cons!10364 (h!11310 (_ BitVec 64)) (t!16588 List!10368)) )
))
(declare-fun arrayNoDuplicates!0 (array!34010 (_ BitVec 32) List!10368) Bool)

(assert (=> b!537363 (= res!332467 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10365))))

(assert (= (and start!48850 res!332464) b!537366))

(assert (= (and b!537366 res!332462) b!537369))

(assert (= (and b!537369 res!332469) b!537367))

(assert (= (and b!537367 res!332470) b!537358))

(assert (= (and b!537358 res!332460) b!537368))

(assert (= (and b!537368 res!332466) b!537370))

(assert (= (and b!537370 res!332459) b!537363))

(assert (= (and b!537363 res!332467) b!537360))

(assert (= (and b!537360 res!332458) b!537364))

(assert (= (and b!537364 res!332461) b!537359))

(assert (= (and b!537359 res!332465) b!537361))

(assert (= (and b!537361 res!332463) b!537362))

(assert (= (and b!537362 res!332468) b!537365))

(declare-fun m!516763 () Bool)

(assert (=> b!537360 m!516763))

(declare-fun m!516765 () Bool)

(assert (=> b!537360 m!516765))

(declare-fun m!516767 () Bool)

(assert (=> b!537361 m!516767))

(assert (=> b!537361 m!516765))

(declare-fun m!516769 () Bool)

(assert (=> b!537370 m!516769))

(declare-fun m!516771 () Bool)

(assert (=> b!537367 m!516771))

(assert (=> b!537369 m!516765))

(assert (=> b!537369 m!516765))

(declare-fun m!516773 () Bool)

(assert (=> b!537369 m!516773))

(assert (=> b!537365 m!516765))

(assert (=> b!537365 m!516765))

(declare-fun m!516775 () Bool)

(assert (=> b!537365 m!516775))

(declare-fun m!516777 () Bool)

(assert (=> b!537362 m!516777))

(declare-fun m!516779 () Bool)

(assert (=> b!537368 m!516779))

(declare-fun m!516781 () Bool)

(assert (=> b!537358 m!516781))

(declare-fun m!516783 () Bool)

(assert (=> b!537363 m!516783))

(assert (=> b!537364 m!516765))

(assert (=> b!537364 m!516765))

(declare-fun m!516785 () Bool)

(assert (=> b!537364 m!516785))

(declare-fun m!516787 () Bool)

(assert (=> start!48850 m!516787))

(declare-fun m!516789 () Bool)

(assert (=> start!48850 m!516789))

(assert (=> b!537359 m!516765))

(assert (=> b!537359 m!516765))

(declare-fun m!516791 () Bool)

(assert (=> b!537359 m!516791))

(assert (=> b!537359 m!516791))

(assert (=> b!537359 m!516765))

(declare-fun m!516793 () Bool)

(assert (=> b!537359 m!516793))

(check-sat (not b!537369) (not b!537364) (not start!48850) (not b!537362) (not b!537363) (not b!537359) (not b!537365) (not b!537367) (not b!537358) (not b!537368) (not b!537370))
(check-sat)
