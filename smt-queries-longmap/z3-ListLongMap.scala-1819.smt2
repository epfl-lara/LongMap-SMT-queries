; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32724 () Bool)

(assert start!32724)

(declare-fun b!327161 () Bool)

(declare-fun res!180195 () Bool)

(declare-fun e!201242 () Bool)

(assert (=> b!327161 (=> (not res!180195) (not e!201242))))

(declare-datatypes ((array!16761 0))(
  ( (array!16762 (arr!7935 (Array (_ BitVec 32) (_ BitVec 64))) (size!8287 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16761)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3066 0))(
  ( (MissingZero!3066 (index!14440 (_ BitVec 32))) (Found!3066 (index!14441 (_ BitVec 32))) (Intermediate!3066 (undefined!3878 Bool) (index!14442 (_ BitVec 32)) (x!32680 (_ BitVec 32))) (Undefined!3066) (MissingVacant!3066 (index!14443 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16761 (_ BitVec 32)) SeekEntryResult!3066)

(assert (=> b!327161 (= res!180195 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3066 i!1250)))))

(declare-fun res!180193 () Bool)

(assert (=> start!32724 (=> (not res!180193) (not e!201242))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32724 (= res!180193 (validMask!0 mask!3777))))

(assert (=> start!32724 e!201242))

(declare-fun array_inv!5898 (array!16761) Bool)

(assert (=> start!32724 (array_inv!5898 a!3305)))

(assert (=> start!32724 true))

(declare-fun b!327162 () Bool)

(declare-fun res!180201 () Bool)

(declare-fun e!201243 () Bool)

(assert (=> b!327162 (=> (not res!180201) (not e!201243))))

(declare-fun lt!157470 () SeekEntryResult!3066)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16761 (_ BitVec 32)) SeekEntryResult!3066)

(assert (=> b!327162 (= res!180201 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157470))))

(declare-fun b!327163 () Bool)

(declare-fun res!180194 () Bool)

(assert (=> b!327163 (=> (not res!180194) (not e!201243))))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!327163 (= res!180194 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7935 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!327164 () Bool)

(declare-fun res!180192 () Bool)

(assert (=> b!327164 (=> (not res!180192) (not e!201242))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!327164 (= res!180192 (validKeyInArray!0 k0!2497))))

(declare-fun b!327165 () Bool)

(declare-fun res!180200 () Bool)

(assert (=> b!327165 (=> (not res!180200) (not e!201242))))

(assert (=> b!327165 (= res!180200 (and (= (size!8287 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8287 a!3305))))))

(declare-fun b!327166 () Bool)

(assert (=> b!327166 (= e!201242 e!201243)))

(declare-fun res!180196 () Bool)

(assert (=> b!327166 (=> (not res!180196) (not e!201243))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327166 (= res!180196 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157470))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!327166 (= lt!157470 (Intermediate!3066 false resIndex!58 resX!58))))

(declare-fun b!327167 () Bool)

(declare-fun res!180198 () Bool)

(assert (=> b!327167 (=> (not res!180198) (not e!201242))))

(declare-fun arrayContainsKey!0 (array!16761 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!327167 (= res!180198 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!327168 () Bool)

(assert (=> b!327168 (= e!201243 false)))

(declare-datatypes ((Unit!10166 0))(
  ( (Unit!10167) )
))
(declare-fun lt!157469 () Unit!10166)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16761 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10166)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327168 (= lt!157469 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!327169 () Bool)

(declare-fun res!180197 () Bool)

(assert (=> b!327169 (=> (not res!180197) (not e!201243))))

(assert (=> b!327169 (= res!180197 (and (= (select (arr!7935 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8287 a!3305))))))

(declare-fun b!327170 () Bool)

(declare-fun res!180199 () Bool)

(assert (=> b!327170 (=> (not res!180199) (not e!201242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16761 (_ BitVec 32)) Bool)

(assert (=> b!327170 (= res!180199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32724 res!180193) b!327165))

(assert (= (and b!327165 res!180200) b!327164))

(assert (= (and b!327164 res!180192) b!327167))

(assert (= (and b!327167 res!180198) b!327161))

(assert (= (and b!327161 res!180195) b!327170))

(assert (= (and b!327170 res!180199) b!327166))

(assert (= (and b!327166 res!180196) b!327169))

(assert (= (and b!327169 res!180197) b!327162))

(assert (= (and b!327162 res!180201) b!327163))

(assert (= (and b!327163 res!180194) b!327168))

(declare-fun m!333613 () Bool)

(assert (=> b!327163 m!333613))

(declare-fun m!333615 () Bool)

(assert (=> b!327161 m!333615))

(declare-fun m!333617 () Bool)

(assert (=> b!327170 m!333617))

(declare-fun m!333619 () Bool)

(assert (=> start!32724 m!333619))

(declare-fun m!333621 () Bool)

(assert (=> start!32724 m!333621))

(declare-fun m!333623 () Bool)

(assert (=> b!327167 m!333623))

(declare-fun m!333625 () Bool)

(assert (=> b!327168 m!333625))

(assert (=> b!327168 m!333625))

(declare-fun m!333627 () Bool)

(assert (=> b!327168 m!333627))

(declare-fun m!333629 () Bool)

(assert (=> b!327162 m!333629))

(declare-fun m!333631 () Bool)

(assert (=> b!327166 m!333631))

(assert (=> b!327166 m!333631))

(declare-fun m!333633 () Bool)

(assert (=> b!327166 m!333633))

(declare-fun m!333635 () Bool)

(assert (=> b!327164 m!333635))

(declare-fun m!333637 () Bool)

(assert (=> b!327169 m!333637))

(check-sat (not b!327170) (not b!327162) (not b!327164) (not b!327161) (not b!327168) (not start!32724) (not b!327167) (not b!327166))
(check-sat)
