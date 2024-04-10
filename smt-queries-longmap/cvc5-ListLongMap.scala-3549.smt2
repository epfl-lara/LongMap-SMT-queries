; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48864 () Bool)

(assert start!48864)

(declare-fun b!538328 () Bool)

(declare-fun e!312166 () Bool)

(declare-fun mask!3216 () (_ BitVec 32))

(assert (=> b!538328 (= e!312166 (not (bvsge mask!3216 #b00000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!4835 0))(
  ( (MissingZero!4835 (index!21564 (_ BitVec 32))) (Found!4835 (index!21565 (_ BitVec 32))) (Intermediate!4835 (undefined!5647 Bool) (index!21566 (_ BitVec 32)) (x!50490 (_ BitVec 32))) (Undefined!4835) (MissingVacant!4835 (index!21567 (_ BitVec 32))) )
))
(declare-fun lt!246715 () SeekEntryResult!4835)

(declare-fun lt!246711 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34076 0))(
  ( (array!34077 (arr!16377 (Array (_ BitVec 32) (_ BitVec 64))) (size!16741 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34076)

(declare-fun i!1153 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34076 (_ BitVec 32)) SeekEntryResult!4835)

(assert (=> b!538328 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246711 (select (store (arr!16377 a!3154) i!1153 k!1998) j!147) (array!34077 (store (arr!16377 a!3154) i!1153 k!1998) (size!16741 a!3154)) mask!3216) lt!246715)))

(declare-datatypes ((Unit!16854 0))(
  ( (Unit!16855) )
))
(declare-fun lt!246713 () Unit!16854)

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34076 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16854)

(assert (=> b!538328 (= lt!246713 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k!1998 j!147 lt!246711 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun res!333535 () Bool)

(declare-fun e!312167 () Bool)

(assert (=> start!48864 (=> (not res!333535) (not e!312167))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48864 (= res!333535 (validMask!0 mask!3216))))

(assert (=> start!48864 e!312167))

(assert (=> start!48864 true))

(declare-fun array_inv!12173 (array!34076) Bool)

(assert (=> start!48864 (array_inv!12173 a!3154)))

(declare-fun b!538329 () Bool)

(declare-fun res!333545 () Bool)

(assert (=> b!538329 (=> (not res!333545) (not e!312167))))

(assert (=> b!538329 (= res!333545 (and (= (size!16741 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16741 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16741 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!538330 () Bool)

(declare-fun res!333540 () Bool)

(declare-fun e!312164 () Bool)

(assert (=> b!538330 (=> (not res!333540) (not e!312164))))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!538330 (= res!333540 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16741 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16741 a!3154)) (= (select (arr!16377 a!3154) resIndex!32) (select (arr!16377 a!3154) j!147))))))

(declare-fun b!538331 () Bool)

(declare-fun res!333543 () Bool)

(assert (=> b!538331 (=> (not res!333543) (not e!312164))))

(declare-datatypes ((List!10496 0))(
  ( (Nil!10493) (Cons!10492 (h!11435 (_ BitVec 64)) (t!16724 List!10496)) )
))
(declare-fun arrayNoDuplicates!0 (array!34076 (_ BitVec 32) List!10496) Bool)

(assert (=> b!538331 (= res!333543 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10493))))

(declare-fun b!538332 () Bool)

(declare-fun res!333533 () Bool)

(assert (=> b!538332 (=> (not res!333533) (not e!312164))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34076 (_ BitVec 32)) Bool)

(assert (=> b!538332 (= res!333533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!538333 () Bool)

(declare-fun e!312165 () Bool)

(assert (=> b!538333 (= e!312164 e!312165)))

(declare-fun res!333537 () Bool)

(assert (=> b!538333 (=> (not res!333537) (not e!312165))))

(declare-fun lt!246710 () SeekEntryResult!4835)

(assert (=> b!538333 (= res!333537 (= lt!246710 lt!246715))))

(assert (=> b!538333 (= lt!246715 (Intermediate!4835 false resIndex!32 resX!32))))

(assert (=> b!538333 (= lt!246710 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16377 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538334 () Bool)

(declare-fun res!333544 () Bool)

(assert (=> b!538334 (=> (not res!333544) (not e!312167))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538334 (= res!333544 (validKeyInArray!0 (select (arr!16377 a!3154) j!147)))))

(declare-fun b!538335 () Bool)

(declare-fun res!333541 () Bool)

(assert (=> b!538335 (=> (not res!333541) (not e!312167))))

(declare-fun arrayContainsKey!0 (array!34076 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538335 (= res!333541 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!538336 () Bool)

(declare-fun e!312162 () Bool)

(assert (=> b!538336 (= e!312162 e!312166)))

(declare-fun res!333542 () Bool)

(assert (=> b!538336 (=> (not res!333542) (not e!312166))))

(declare-fun lt!246712 () SeekEntryResult!4835)

(declare-fun lt!246714 () SeekEntryResult!4835)

(assert (=> b!538336 (= res!333542 (and (= lt!246714 lt!246715) (= lt!246712 lt!246714)))))

(assert (=> b!538336 (= lt!246714 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246711 (select (arr!16377 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538337 () Bool)

(declare-fun e!312163 () Bool)

(assert (=> b!538337 (= e!312163 e!312162)))

(declare-fun res!333536 () Bool)

(assert (=> b!538337 (=> (not res!333536) (not e!312162))))

(assert (=> b!538337 (= res!333536 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246711 #b00000000000000000000000000000000) (bvslt lt!246711 (size!16741 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538337 (= lt!246711 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!538338 () Bool)

(assert (=> b!538338 (= e!312167 e!312164)))

(declare-fun res!333534 () Bool)

(assert (=> b!538338 (=> (not res!333534) (not e!312164))))

(declare-fun lt!246709 () SeekEntryResult!4835)

(assert (=> b!538338 (= res!333534 (or (= lt!246709 (MissingZero!4835 i!1153)) (= lt!246709 (MissingVacant!4835 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34076 (_ BitVec 32)) SeekEntryResult!4835)

(assert (=> b!538338 (= lt!246709 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!538339 () Bool)

(declare-fun res!333538 () Bool)

(assert (=> b!538339 (=> (not res!333538) (not e!312167))))

(assert (=> b!538339 (= res!333538 (validKeyInArray!0 k!1998))))

(declare-fun b!538340 () Bool)

(assert (=> b!538340 (= e!312165 e!312163)))

(declare-fun res!333539 () Bool)

(assert (=> b!538340 (=> (not res!333539) (not e!312163))))

(assert (=> b!538340 (= res!333539 (and (= lt!246712 lt!246710) (not (= (select (arr!16377 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16377 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16377 a!3154) index!1177) (select (arr!16377 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538340 (= lt!246712 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16377 a!3154) j!147) mask!3216) (select (arr!16377 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48864 res!333535) b!538329))

(assert (= (and b!538329 res!333545) b!538334))

(assert (= (and b!538334 res!333544) b!538339))

(assert (= (and b!538339 res!333538) b!538335))

(assert (= (and b!538335 res!333541) b!538338))

(assert (= (and b!538338 res!333534) b!538332))

(assert (= (and b!538332 res!333533) b!538331))

(assert (= (and b!538331 res!333543) b!538330))

(assert (= (and b!538330 res!333540) b!538333))

(assert (= (and b!538333 res!333537) b!538340))

(assert (= (and b!538340 res!333539) b!538337))

(assert (= (and b!538337 res!333536) b!538336))

(assert (= (and b!538336 res!333542) b!538328))

(declare-fun m!517425 () Bool)

(assert (=> b!538339 m!517425))

(declare-fun m!517427 () Bool)

(assert (=> b!538328 m!517427))

(declare-fun m!517429 () Bool)

(assert (=> b!538328 m!517429))

(assert (=> b!538328 m!517429))

(declare-fun m!517431 () Bool)

(assert (=> b!538328 m!517431))

(declare-fun m!517433 () Bool)

(assert (=> b!538328 m!517433))

(declare-fun m!517435 () Bool)

(assert (=> b!538331 m!517435))

(declare-fun m!517437 () Bool)

(assert (=> start!48864 m!517437))

(declare-fun m!517439 () Bool)

(assert (=> start!48864 m!517439))

(declare-fun m!517441 () Bool)

(assert (=> b!538338 m!517441))

(declare-fun m!517443 () Bool)

(assert (=> b!538334 m!517443))

(assert (=> b!538334 m!517443))

(declare-fun m!517445 () Bool)

(assert (=> b!538334 m!517445))

(declare-fun m!517447 () Bool)

(assert (=> b!538335 m!517447))

(declare-fun m!517449 () Bool)

(assert (=> b!538332 m!517449))

(assert (=> b!538336 m!517443))

(assert (=> b!538336 m!517443))

(declare-fun m!517451 () Bool)

(assert (=> b!538336 m!517451))

(declare-fun m!517453 () Bool)

(assert (=> b!538330 m!517453))

(assert (=> b!538330 m!517443))

(declare-fun m!517455 () Bool)

(assert (=> b!538337 m!517455))

(assert (=> b!538333 m!517443))

(assert (=> b!538333 m!517443))

(declare-fun m!517457 () Bool)

(assert (=> b!538333 m!517457))

(declare-fun m!517459 () Bool)

(assert (=> b!538340 m!517459))

(assert (=> b!538340 m!517443))

(assert (=> b!538340 m!517443))

(declare-fun m!517461 () Bool)

(assert (=> b!538340 m!517461))

(assert (=> b!538340 m!517461))

(assert (=> b!538340 m!517443))

(declare-fun m!517463 () Bool)

(assert (=> b!538340 m!517463))

(push 1)

