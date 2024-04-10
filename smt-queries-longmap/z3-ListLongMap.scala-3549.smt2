; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48866 () Bool)

(assert start!48866)

(declare-fun b!538367 () Bool)

(declare-fun e!312189 () Bool)

(declare-fun mask!3216 () (_ BitVec 32))

(assert (=> b!538367 (= e!312189 (not (bvsge mask!3216 #b00000000000000000000000000000000)))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!246733 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4836 0))(
  ( (MissingZero!4836 (index!21568 (_ BitVec 32))) (Found!4836 (index!21569 (_ BitVec 32))) (Intermediate!4836 (undefined!5648 Bool) (index!21570 (_ BitVec 32)) (x!50491 (_ BitVec 32))) (Undefined!4836) (MissingVacant!4836 (index!21571 (_ BitVec 32))) )
))
(declare-fun lt!246732 () SeekEntryResult!4836)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(declare-datatypes ((array!34078 0))(
  ( (array!34079 (arr!16378 (Array (_ BitVec 32) (_ BitVec 64))) (size!16742 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34078)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34078 (_ BitVec 32)) SeekEntryResult!4836)

(assert (=> b!538367 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246733 (select (store (arr!16378 a!3154) i!1153 k0!1998) j!147) (array!34079 (store (arr!16378 a!3154) i!1153 k0!1998) (size!16742 a!3154)) mask!3216) lt!246732)))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-datatypes ((Unit!16856 0))(
  ( (Unit!16857) )
))
(declare-fun lt!246730 () Unit!16856)

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34078 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16856)

(assert (=> b!538367 (= lt!246730 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k0!1998 j!147 lt!246733 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!538368 () Bool)

(declare-fun res!333582 () Bool)

(declare-fun e!312184 () Bool)

(assert (=> b!538368 (=> (not res!333582) (not e!312184))))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!538368 (= res!333582 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16742 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16742 a!3154)) (= (select (arr!16378 a!3154) resIndex!32) (select (arr!16378 a!3154) j!147))))))

(declare-fun b!538369 () Bool)

(declare-fun res!333580 () Bool)

(declare-fun e!312185 () Bool)

(assert (=> b!538369 (=> (not res!333580) (not e!312185))))

(declare-fun arrayContainsKey!0 (array!34078 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538369 (= res!333580 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!538370 () Bool)

(declare-fun e!312188 () Bool)

(assert (=> b!538370 (= e!312184 e!312188)))

(declare-fun res!333572 () Bool)

(assert (=> b!538370 (=> (not res!333572) (not e!312188))))

(declare-fun lt!246734 () SeekEntryResult!4836)

(assert (=> b!538370 (= res!333572 (= lt!246734 lt!246732))))

(assert (=> b!538370 (= lt!246732 (Intermediate!4836 false resIndex!32 resX!32))))

(assert (=> b!538370 (= lt!246734 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16378 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538371 () Bool)

(assert (=> b!538371 (= e!312185 e!312184)))

(declare-fun res!333584 () Bool)

(assert (=> b!538371 (=> (not res!333584) (not e!312184))))

(declare-fun lt!246731 () SeekEntryResult!4836)

(assert (=> b!538371 (= res!333584 (or (= lt!246731 (MissingZero!4836 i!1153)) (= lt!246731 (MissingVacant!4836 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34078 (_ BitVec 32)) SeekEntryResult!4836)

(assert (=> b!538371 (= lt!246731 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun res!333583 () Bool)

(assert (=> start!48866 (=> (not res!333583) (not e!312185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48866 (= res!333583 (validMask!0 mask!3216))))

(assert (=> start!48866 e!312185))

(assert (=> start!48866 true))

(declare-fun array_inv!12174 (array!34078) Bool)

(assert (=> start!48866 (array_inv!12174 a!3154)))

(declare-fun b!538372 () Bool)

(declare-fun e!312186 () Bool)

(declare-fun e!312183 () Bool)

(assert (=> b!538372 (= e!312186 e!312183)))

(declare-fun res!333575 () Bool)

(assert (=> b!538372 (=> (not res!333575) (not e!312183))))

(assert (=> b!538372 (= res!333575 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246733 #b00000000000000000000000000000000) (bvslt lt!246733 (size!16742 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538372 (= lt!246733 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!538373 () Bool)

(assert (=> b!538373 (= e!312188 e!312186)))

(declare-fun res!333578 () Bool)

(assert (=> b!538373 (=> (not res!333578) (not e!312186))))

(declare-fun lt!246735 () SeekEntryResult!4836)

(assert (=> b!538373 (= res!333578 (and (= lt!246735 lt!246734) (not (= (select (arr!16378 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16378 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16378 a!3154) index!1177) (select (arr!16378 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538373 (= lt!246735 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16378 a!3154) j!147) mask!3216) (select (arr!16378 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538374 () Bool)

(declare-fun res!333577 () Bool)

(assert (=> b!538374 (=> (not res!333577) (not e!312185))))

(assert (=> b!538374 (= res!333577 (and (= (size!16742 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16742 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16742 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!538375 () Bool)

(declare-fun res!333576 () Bool)

(assert (=> b!538375 (=> (not res!333576) (not e!312184))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34078 (_ BitVec 32)) Bool)

(assert (=> b!538375 (= res!333576 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!538376 () Bool)

(declare-fun res!333581 () Bool)

(assert (=> b!538376 (=> (not res!333581) (not e!312184))))

(declare-datatypes ((List!10497 0))(
  ( (Nil!10494) (Cons!10493 (h!11436 (_ BitVec 64)) (t!16725 List!10497)) )
))
(declare-fun arrayNoDuplicates!0 (array!34078 (_ BitVec 32) List!10497) Bool)

(assert (=> b!538376 (= res!333581 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10494))))

(declare-fun b!538377 () Bool)

(declare-fun res!333574 () Bool)

(assert (=> b!538377 (=> (not res!333574) (not e!312185))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538377 (= res!333574 (validKeyInArray!0 k0!1998))))

(declare-fun b!538378 () Bool)

(declare-fun res!333573 () Bool)

(assert (=> b!538378 (=> (not res!333573) (not e!312185))))

(assert (=> b!538378 (= res!333573 (validKeyInArray!0 (select (arr!16378 a!3154) j!147)))))

(declare-fun b!538379 () Bool)

(assert (=> b!538379 (= e!312183 e!312189)))

(declare-fun res!333579 () Bool)

(assert (=> b!538379 (=> (not res!333579) (not e!312189))))

(declare-fun lt!246736 () SeekEntryResult!4836)

(assert (=> b!538379 (= res!333579 (and (= lt!246736 lt!246732) (= lt!246735 lt!246736)))))

(assert (=> b!538379 (= lt!246736 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246733 (select (arr!16378 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48866 res!333583) b!538374))

(assert (= (and b!538374 res!333577) b!538378))

(assert (= (and b!538378 res!333573) b!538377))

(assert (= (and b!538377 res!333574) b!538369))

(assert (= (and b!538369 res!333580) b!538371))

(assert (= (and b!538371 res!333584) b!538375))

(assert (= (and b!538375 res!333576) b!538376))

(assert (= (and b!538376 res!333581) b!538368))

(assert (= (and b!538368 res!333582) b!538370))

(assert (= (and b!538370 res!333572) b!538373))

(assert (= (and b!538373 res!333578) b!538372))

(assert (= (and b!538372 res!333575) b!538379))

(assert (= (and b!538379 res!333579) b!538367))

(declare-fun m!517465 () Bool)

(assert (=> b!538367 m!517465))

(declare-fun m!517467 () Bool)

(assert (=> b!538367 m!517467))

(assert (=> b!538367 m!517467))

(declare-fun m!517469 () Bool)

(assert (=> b!538367 m!517469))

(declare-fun m!517471 () Bool)

(assert (=> b!538367 m!517471))

(declare-fun m!517473 () Bool)

(assert (=> b!538377 m!517473))

(declare-fun m!517475 () Bool)

(assert (=> b!538372 m!517475))

(declare-fun m!517477 () Bool)

(assert (=> b!538369 m!517477))

(declare-fun m!517479 () Bool)

(assert (=> b!538379 m!517479))

(assert (=> b!538379 m!517479))

(declare-fun m!517481 () Bool)

(assert (=> b!538379 m!517481))

(declare-fun m!517483 () Bool)

(assert (=> start!48866 m!517483))

(declare-fun m!517485 () Bool)

(assert (=> start!48866 m!517485))

(declare-fun m!517487 () Bool)

(assert (=> b!538368 m!517487))

(assert (=> b!538368 m!517479))

(assert (=> b!538370 m!517479))

(assert (=> b!538370 m!517479))

(declare-fun m!517489 () Bool)

(assert (=> b!538370 m!517489))

(declare-fun m!517491 () Bool)

(assert (=> b!538371 m!517491))

(declare-fun m!517493 () Bool)

(assert (=> b!538376 m!517493))

(declare-fun m!517495 () Bool)

(assert (=> b!538373 m!517495))

(assert (=> b!538373 m!517479))

(assert (=> b!538373 m!517479))

(declare-fun m!517497 () Bool)

(assert (=> b!538373 m!517497))

(assert (=> b!538373 m!517497))

(assert (=> b!538373 m!517479))

(declare-fun m!517499 () Bool)

(assert (=> b!538373 m!517499))

(assert (=> b!538378 m!517479))

(assert (=> b!538378 m!517479))

(declare-fun m!517501 () Bool)

(assert (=> b!538378 m!517501))

(declare-fun m!517503 () Bool)

(assert (=> b!538375 m!517503))

(check-sat (not b!538371) (not b!538379) (not b!538369) (not b!538377) (not b!538375) (not start!48866) (not b!538378) (not b!538372) (not b!538376) (not b!538370) (not b!538367) (not b!538373))
(check-sat)
