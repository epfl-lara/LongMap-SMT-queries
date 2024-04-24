; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32258 () Bool)

(assert start!32258)

(declare-fun b!321471 () Bool)

(declare-fun e!199168 () Bool)

(declare-fun e!199169 () Bool)

(assert (=> b!321471 (= e!199168 e!199169)))

(declare-fun res!175648 () Bool)

(assert (=> b!321471 (=> (not res!175648) (not e!199169))))

(declare-datatypes ((array!16461 0))(
  ( (array!16462 (arr!7789 (Array (_ BitVec 32) (_ BitVec 64))) (size!8141 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16461)

(declare-datatypes ((SeekEntryResult!2885 0))(
  ( (MissingZero!2885 (index!13716 (_ BitVec 32))) (Found!2885 (index!13717 (_ BitVec 32))) (Intermediate!2885 (undefined!3697 Bool) (index!13718 (_ BitVec 32)) (x!32085 (_ BitVec 32))) (Undefined!2885) (MissingVacant!2885 (index!13719 (_ BitVec 32))) )
))
(declare-fun lt!156225 () SeekEntryResult!2885)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16461 (_ BitVec 32)) SeekEntryResult!2885)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321471 (= res!175648 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156225))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!321471 (= lt!156225 (Intermediate!2885 false resIndex!58 resX!58))))

(declare-fun b!321472 () Bool)

(declare-fun res!175641 () Bool)

(assert (=> b!321472 (=> (not res!175641) (not e!199168))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16461 (_ BitVec 32)) SeekEntryResult!2885)

(assert (=> b!321472 (= res!175641 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2885 i!1250)))))

(declare-fun b!321473 () Bool)

(declare-fun res!175643 () Bool)

(assert (=> b!321473 (=> (not res!175643) (not e!199168))))

(assert (=> b!321473 (= res!175643 (and (= (size!8141 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8141 a!3305))))))

(declare-fun b!321474 () Bool)

(declare-fun res!175650 () Bool)

(assert (=> b!321474 (=> (not res!175650) (not e!199168))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321474 (= res!175650 (validKeyInArray!0 k0!2497))))

(declare-fun b!321475 () Bool)

(declare-fun res!175645 () Bool)

(assert (=> b!321475 (=> (not res!175645) (not e!199169))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!321475 (= res!175645 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7789 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7789 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7789 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!175642 () Bool)

(assert (=> start!32258 (=> (not res!175642) (not e!199168))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32258 (= res!175642 (validMask!0 mask!3777))))

(assert (=> start!32258 e!199168))

(declare-fun array_inv!5739 (array!16461) Bool)

(assert (=> start!32258 (array_inv!5739 a!3305)))

(assert (=> start!32258 true))

(declare-fun b!321476 () Bool)

(declare-fun res!175644 () Bool)

(assert (=> b!321476 (=> (not res!175644) (not e!199169))))

(assert (=> b!321476 (= res!175644 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156225))))

(declare-fun b!321477 () Bool)

(declare-fun res!175646 () Bool)

(assert (=> b!321477 (=> (not res!175646) (not e!199168))))

(declare-fun arrayContainsKey!0 (array!16461 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321477 (= res!175646 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!321478 () Bool)

(assert (=> b!321478 (= e!199169 false)))

(declare-fun lt!156224 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321478 (= lt!156224 (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777))))

(declare-fun b!321479 () Bool)

(declare-fun res!175649 () Bool)

(assert (=> b!321479 (=> (not res!175649) (not e!199168))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16461 (_ BitVec 32)) Bool)

(assert (=> b!321479 (= res!175649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!321480 () Bool)

(declare-fun res!175647 () Bool)

(assert (=> b!321480 (=> (not res!175647) (not e!199169))))

(assert (=> b!321480 (= res!175647 (and (= (select (arr!7789 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8141 a!3305))))))

(assert (= (and start!32258 res!175642) b!321473))

(assert (= (and b!321473 res!175643) b!321474))

(assert (= (and b!321474 res!175650) b!321477))

(assert (= (and b!321477 res!175646) b!321472))

(assert (= (and b!321472 res!175641) b!321479))

(assert (= (and b!321479 res!175649) b!321471))

(assert (= (and b!321471 res!175648) b!321480))

(assert (= (and b!321480 res!175647) b!321476))

(assert (= (and b!321476 res!175644) b!321475))

(assert (= (and b!321475 res!175645) b!321478))

(declare-fun m!329827 () Bool)

(assert (=> start!32258 m!329827))

(declare-fun m!329829 () Bool)

(assert (=> start!32258 m!329829))

(declare-fun m!329831 () Bool)

(assert (=> b!321479 m!329831))

(declare-fun m!329833 () Bool)

(assert (=> b!321477 m!329833))

(declare-fun m!329835 () Bool)

(assert (=> b!321472 m!329835))

(declare-fun m!329837 () Bool)

(assert (=> b!321471 m!329837))

(assert (=> b!321471 m!329837))

(declare-fun m!329839 () Bool)

(assert (=> b!321471 m!329839))

(declare-fun m!329841 () Bool)

(assert (=> b!321475 m!329841))

(declare-fun m!329843 () Bool)

(assert (=> b!321474 m!329843))

(declare-fun m!329845 () Bool)

(assert (=> b!321480 m!329845))

(declare-fun m!329847 () Bool)

(assert (=> b!321476 m!329847))

(declare-fun m!329849 () Bool)

(assert (=> b!321478 m!329849))

(check-sat (not b!321472) (not b!321471) (not b!321478) (not start!32258) (not b!321479) (not b!321477) (not b!321476) (not b!321474))
(check-sat)
