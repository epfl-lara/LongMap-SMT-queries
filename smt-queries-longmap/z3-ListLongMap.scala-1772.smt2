; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32280 () Bool)

(assert start!32280)

(declare-fun b!321644 () Bool)

(declare-fun res!175766 () Bool)

(declare-fun e!199239 () Bool)

(assert (=> b!321644 (=> (not res!175766) (not e!199239))))

(declare-datatypes ((array!16470 0))(
  ( (array!16471 (arr!7794 (Array (_ BitVec 32) (_ BitVec 64))) (size!8146 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16470)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!321644 (= res!175766 (and (= (select (arr!7794 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8146 a!3305))))))

(declare-fun b!321645 () Bool)

(declare-fun e!199240 () Bool)

(assert (=> b!321645 (= e!199240 e!199239)))

(declare-fun res!175770 () Bool)

(assert (=> b!321645 (=> (not res!175770) (not e!199239))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2925 0))(
  ( (MissingZero!2925 (index!13876 (_ BitVec 32))) (Found!2925 (index!13877 (_ BitVec 32))) (Intermediate!2925 (undefined!3737 Bool) (index!13878 (_ BitVec 32)) (x!32136 (_ BitVec 32))) (Undefined!2925) (MissingVacant!2925 (index!13879 (_ BitVec 32))) )
))
(declare-fun lt!156230 () SeekEntryResult!2925)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16470 (_ BitVec 32)) SeekEntryResult!2925)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321645 (= res!175770 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156230))))

(assert (=> b!321645 (= lt!156230 (Intermediate!2925 false resIndex!58 resX!58))))

(declare-fun b!321646 () Bool)

(declare-fun res!175768 () Bool)

(assert (=> b!321646 (=> (not res!175768) (not e!199240))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16470 (_ BitVec 32)) SeekEntryResult!2925)

(assert (=> b!321646 (= res!175768 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2925 i!1250)))))

(declare-fun b!321647 () Bool)

(declare-fun res!175767 () Bool)

(assert (=> b!321647 (=> (not res!175767) (not e!199240))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321647 (= res!175767 (validKeyInArray!0 k0!2497))))

(declare-fun res!175773 () Bool)

(assert (=> start!32280 (=> (not res!175773) (not e!199240))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32280 (= res!175773 (validMask!0 mask!3777))))

(assert (=> start!32280 e!199240))

(declare-fun array_inv!5757 (array!16470) Bool)

(assert (=> start!32280 (array_inv!5757 a!3305)))

(assert (=> start!32280 true))

(declare-fun b!321648 () Bool)

(declare-fun res!175771 () Bool)

(assert (=> b!321648 (=> (not res!175771) (not e!199239))))

(assert (=> b!321648 (= res!175771 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7794 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7794 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7794 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!321649 () Bool)

(declare-fun res!175772 () Bool)

(assert (=> b!321649 (=> (not res!175772) (not e!199240))))

(declare-fun arrayContainsKey!0 (array!16470 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321649 (= res!175772 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!321650 () Bool)

(declare-fun res!175769 () Bool)

(assert (=> b!321650 (=> (not res!175769) (not e!199240))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16470 (_ BitVec 32)) Bool)

(assert (=> b!321650 (= res!175769 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!321651 () Bool)

(assert (=> b!321651 (= e!199239 (bvslt mask!3777 #b00000000000000000000000000000000))))

(declare-fun lt!156231 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321651 (= lt!156231 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!321652 () Bool)

(declare-fun res!175764 () Bool)

(assert (=> b!321652 (=> (not res!175764) (not e!199240))))

(assert (=> b!321652 (= res!175764 (and (= (size!8146 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8146 a!3305))))))

(declare-fun b!321653 () Bool)

(declare-fun res!175765 () Bool)

(assert (=> b!321653 (=> (not res!175765) (not e!199239))))

(assert (=> b!321653 (= res!175765 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156230))))

(assert (= (and start!32280 res!175773) b!321652))

(assert (= (and b!321652 res!175764) b!321647))

(assert (= (and b!321647 res!175767) b!321649))

(assert (= (and b!321649 res!175772) b!321646))

(assert (= (and b!321646 res!175768) b!321650))

(assert (= (and b!321650 res!175769) b!321645))

(assert (= (and b!321645 res!175770) b!321644))

(assert (= (and b!321644 res!175766) b!321653))

(assert (= (and b!321653 res!175765) b!321648))

(assert (= (and b!321648 res!175771) b!321651))

(declare-fun m!329747 () Bool)

(assert (=> b!321650 m!329747))

(declare-fun m!329749 () Bool)

(assert (=> b!321648 m!329749))

(declare-fun m!329751 () Bool)

(assert (=> b!321644 m!329751))

(declare-fun m!329753 () Bool)

(assert (=> b!321646 m!329753))

(declare-fun m!329755 () Bool)

(assert (=> b!321647 m!329755))

(declare-fun m!329757 () Bool)

(assert (=> b!321653 m!329757))

(declare-fun m!329759 () Bool)

(assert (=> b!321645 m!329759))

(assert (=> b!321645 m!329759))

(declare-fun m!329761 () Bool)

(assert (=> b!321645 m!329761))

(declare-fun m!329763 () Bool)

(assert (=> start!32280 m!329763))

(declare-fun m!329765 () Bool)

(assert (=> start!32280 m!329765))

(declare-fun m!329767 () Bool)

(assert (=> b!321649 m!329767))

(declare-fun m!329769 () Bool)

(assert (=> b!321651 m!329769))

(check-sat (not b!321647) (not b!321645) (not b!321646) (not start!32280) (not b!321649) (not b!321653) (not b!321651) (not b!321650))
(check-sat)
