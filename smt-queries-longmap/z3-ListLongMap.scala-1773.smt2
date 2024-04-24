; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32270 () Bool)

(assert start!32270)

(declare-fun b!321651 () Bool)

(declare-fun res!175822 () Bool)

(declare-fun e!199223 () Bool)

(assert (=> b!321651 (=> (not res!175822) (not e!199223))))

(declare-datatypes ((array!16473 0))(
  ( (array!16474 (arr!7795 (Array (_ BitVec 32) (_ BitVec 64))) (size!8147 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16473)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!321651 (= res!175822 (and (= (select (arr!7795 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8147 a!3305))))))

(declare-fun b!321652 () Bool)

(declare-fun res!175824 () Bool)

(declare-fun e!199222 () Bool)

(assert (=> b!321652 (=> (not res!175824) (not e!199222))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2891 0))(
  ( (MissingZero!2891 (index!13740 (_ BitVec 32))) (Found!2891 (index!13741 (_ BitVec 32))) (Intermediate!2891 (undefined!3703 Bool) (index!13742 (_ BitVec 32)) (x!32107 (_ BitVec 32))) (Undefined!2891) (MissingVacant!2891 (index!13743 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16473 (_ BitVec 32)) SeekEntryResult!2891)

(assert (=> b!321652 (= res!175824 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2891 i!1250)))))

(declare-fun b!321653 () Bool)

(declare-fun res!175823 () Bool)

(assert (=> b!321653 (=> (not res!175823) (not e!199223))))

(assert (=> b!321653 (= res!175823 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7795 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7795 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7795 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!321654 () Bool)

(declare-fun res!175826 () Bool)

(assert (=> b!321654 (=> (not res!175826) (not e!199222))))

(assert (=> b!321654 (= res!175826 (and (= (size!8147 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8147 a!3305))))))

(declare-fun res!175829 () Bool)

(assert (=> start!32270 (=> (not res!175829) (not e!199222))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32270 (= res!175829 (validMask!0 mask!3777))))

(assert (=> start!32270 e!199222))

(declare-fun array_inv!5745 (array!16473) Bool)

(assert (=> start!32270 (array_inv!5745 a!3305)))

(assert (=> start!32270 true))

(declare-fun b!321655 () Bool)

(declare-fun res!175825 () Bool)

(assert (=> b!321655 (=> (not res!175825) (not e!199223))))

(declare-fun lt!156261 () SeekEntryResult!2891)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16473 (_ BitVec 32)) SeekEntryResult!2891)

(assert (=> b!321655 (= res!175825 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156261))))

(declare-fun b!321656 () Bool)

(assert (=> b!321656 (= e!199223 false)))

(declare-fun lt!156260 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321656 (= lt!156260 (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777))))

(declare-fun b!321657 () Bool)

(declare-fun res!175830 () Bool)

(assert (=> b!321657 (=> (not res!175830) (not e!199222))))

(declare-fun arrayContainsKey!0 (array!16473 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321657 (= res!175830 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!321658 () Bool)

(assert (=> b!321658 (= e!199222 e!199223)))

(declare-fun res!175828 () Bool)

(assert (=> b!321658 (=> (not res!175828) (not e!199223))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321658 (= res!175828 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156261))))

(assert (=> b!321658 (= lt!156261 (Intermediate!2891 false resIndex!58 resX!58))))

(declare-fun b!321659 () Bool)

(declare-fun res!175821 () Bool)

(assert (=> b!321659 (=> (not res!175821) (not e!199222))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321659 (= res!175821 (validKeyInArray!0 k0!2497))))

(declare-fun b!321660 () Bool)

(declare-fun res!175827 () Bool)

(assert (=> b!321660 (=> (not res!175827) (not e!199222))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16473 (_ BitVec 32)) Bool)

(assert (=> b!321660 (= res!175827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32270 res!175829) b!321654))

(assert (= (and b!321654 res!175826) b!321659))

(assert (= (and b!321659 res!175821) b!321657))

(assert (= (and b!321657 res!175830) b!321652))

(assert (= (and b!321652 res!175824) b!321660))

(assert (= (and b!321660 res!175827) b!321658))

(assert (= (and b!321658 res!175828) b!321651))

(assert (= (and b!321651 res!175822) b!321655))

(assert (= (and b!321655 res!175825) b!321653))

(assert (= (and b!321653 res!175823) b!321656))

(declare-fun m!329971 () Bool)

(assert (=> b!321657 m!329971))

(declare-fun m!329973 () Bool)

(assert (=> b!321653 m!329973))

(declare-fun m!329975 () Bool)

(assert (=> b!321656 m!329975))

(declare-fun m!329977 () Bool)

(assert (=> b!321655 m!329977))

(declare-fun m!329979 () Bool)

(assert (=> b!321660 m!329979))

(declare-fun m!329981 () Bool)

(assert (=> b!321659 m!329981))

(declare-fun m!329983 () Bool)

(assert (=> start!32270 m!329983))

(declare-fun m!329985 () Bool)

(assert (=> start!32270 m!329985))

(declare-fun m!329987 () Bool)

(assert (=> b!321652 m!329987))

(declare-fun m!329989 () Bool)

(assert (=> b!321658 m!329989))

(assert (=> b!321658 m!329989))

(declare-fun m!329991 () Bool)

(assert (=> b!321658 m!329991))

(declare-fun m!329993 () Bool)

(assert (=> b!321651 m!329993))

(check-sat (not start!32270) (not b!321658) (not b!321656) (not b!321659) (not b!321657) (not b!321660) (not b!321652) (not b!321655))
(check-sat)
