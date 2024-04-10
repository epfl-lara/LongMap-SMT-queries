; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32262 () Bool)

(assert start!32262)

(declare-datatypes ((array!16452 0))(
  ( (array!16453 (arr!7785 (Array (_ BitVec 32) (_ BitVec 64))) (size!8137 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16452)

(declare-fun e!199157 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun b!321387 () Bool)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(assert (=> b!321387 (= e!199157 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7785 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7785 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7785 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3777 #b00000000000000000000000000000000) (bvsge index!1840 (bvadd #b00000000000000000000000000000001 mask!3777))))))

(declare-fun b!321388 () Bool)

(declare-fun res!175509 () Bool)

(declare-fun e!199159 () Bool)

(assert (=> b!321388 (=> (not res!175509) (not e!199159))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321388 (= res!175509 (validKeyInArray!0 k0!2497))))

(declare-fun res!175507 () Bool)

(assert (=> start!32262 (=> (not res!175507) (not e!199159))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32262 (= res!175507 (validMask!0 mask!3777))))

(assert (=> start!32262 e!199159))

(declare-fun array_inv!5748 (array!16452) Bool)

(assert (=> start!32262 (array_inv!5748 a!3305)))

(assert (=> start!32262 true))

(declare-fun b!321389 () Bool)

(assert (=> b!321389 (= e!199159 e!199157)))

(declare-fun res!175514 () Bool)

(assert (=> b!321389 (=> (not res!175514) (not e!199157))))

(declare-datatypes ((SeekEntryResult!2916 0))(
  ( (MissingZero!2916 (index!13840 (_ BitVec 32))) (Found!2916 (index!13841 (_ BitVec 32))) (Intermediate!2916 (undefined!3728 Bool) (index!13842 (_ BitVec 32)) (x!32103 (_ BitVec 32))) (Undefined!2916) (MissingVacant!2916 (index!13843 (_ BitVec 32))) )
))
(declare-fun lt!156189 () SeekEntryResult!2916)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16452 (_ BitVec 32)) SeekEntryResult!2916)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321389 (= res!175514 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156189))))

(assert (=> b!321389 (= lt!156189 (Intermediate!2916 false resIndex!58 resX!58))))

(declare-fun b!321390 () Bool)

(declare-fun res!175508 () Bool)

(assert (=> b!321390 (=> (not res!175508) (not e!199157))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!321390 (= res!175508 (and (= (select (arr!7785 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8137 a!3305))))))

(declare-fun b!321391 () Bool)

(declare-fun res!175512 () Bool)

(assert (=> b!321391 (=> (not res!175512) (not e!199159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16452 (_ BitVec 32)) SeekEntryResult!2916)

(assert (=> b!321391 (= res!175512 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2916 i!1250)))))

(declare-fun b!321392 () Bool)

(declare-fun res!175510 () Bool)

(assert (=> b!321392 (=> (not res!175510) (not e!199159))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16452 (_ BitVec 32)) Bool)

(assert (=> b!321392 (= res!175510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!321393 () Bool)

(declare-fun res!175513 () Bool)

(assert (=> b!321393 (=> (not res!175513) (not e!199157))))

(assert (=> b!321393 (= res!175513 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156189))))

(declare-fun b!321394 () Bool)

(declare-fun res!175511 () Bool)

(assert (=> b!321394 (=> (not res!175511) (not e!199159))))

(declare-fun arrayContainsKey!0 (array!16452 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321394 (= res!175511 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!321395 () Bool)

(declare-fun res!175515 () Bool)

(assert (=> b!321395 (=> (not res!175515) (not e!199159))))

(assert (=> b!321395 (= res!175515 (and (= (size!8137 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8137 a!3305))))))

(assert (= (and start!32262 res!175507) b!321395))

(assert (= (and b!321395 res!175515) b!321388))

(assert (= (and b!321388 res!175509) b!321394))

(assert (= (and b!321394 res!175511) b!321391))

(assert (= (and b!321391 res!175512) b!321392))

(assert (= (and b!321392 res!175510) b!321389))

(assert (= (and b!321389 res!175514) b!321390))

(assert (= (and b!321390 res!175508) b!321393))

(assert (= (and b!321393 res!175513) b!321387))

(declare-fun m!329541 () Bool)

(assert (=> b!321389 m!329541))

(assert (=> b!321389 m!329541))

(declare-fun m!329543 () Bool)

(assert (=> b!321389 m!329543))

(declare-fun m!329545 () Bool)

(assert (=> start!32262 m!329545))

(declare-fun m!329547 () Bool)

(assert (=> start!32262 m!329547))

(declare-fun m!329549 () Bool)

(assert (=> b!321393 m!329549))

(declare-fun m!329551 () Bool)

(assert (=> b!321391 m!329551))

(declare-fun m!329553 () Bool)

(assert (=> b!321392 m!329553))

(declare-fun m!329555 () Bool)

(assert (=> b!321390 m!329555))

(declare-fun m!329557 () Bool)

(assert (=> b!321388 m!329557))

(declare-fun m!329559 () Bool)

(assert (=> b!321387 m!329559))

(declare-fun m!329561 () Bool)

(assert (=> b!321394 m!329561))

(check-sat (not b!321391) (not b!321393) (not b!321389) (not b!321394) (not start!32262) (not b!321392) (not b!321388))
(check-sat)
