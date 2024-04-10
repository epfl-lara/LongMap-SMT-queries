; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32214 () Bool)

(assert start!32214)

(declare-fun res!174896 () Bool)

(declare-fun e!198972 () Bool)

(assert (=> start!32214 (=> (not res!174896) (not e!198972))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32214 (= res!174896 (validMask!0 mask!3777))))

(assert (=> start!32214 e!198972))

(declare-datatypes ((array!16404 0))(
  ( (array!16405 (arr!7761 (Array (_ BitVec 32) (_ BitVec 64))) (size!8113 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16404)

(declare-fun array_inv!5724 (array!16404) Bool)

(assert (=> start!32214 (array_inv!5724 a!3305)))

(assert (=> start!32214 true))

(declare-fun b!320770 () Bool)

(declare-fun res!174890 () Bool)

(assert (=> b!320770 (=> (not res!174890) (not e!198972))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16404 (_ BitVec 32)) Bool)

(assert (=> b!320770 (= res!174890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!320771 () Bool)

(declare-fun res!174894 () Bool)

(assert (=> b!320771 (=> (not res!174894) (not e!198972))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16404 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320771 (= res!174894 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320772 () Bool)

(declare-fun res!174895 () Bool)

(assert (=> b!320772 (=> (not res!174895) (not e!198972))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!320772 (= res!174895 (and (= (size!8113 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8113 a!3305))))))

(declare-fun b!320773 () Bool)

(declare-fun res!174892 () Bool)

(assert (=> b!320773 (=> (not res!174892) (not e!198972))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320773 (= res!174892 (validKeyInArray!0 k0!2497))))

(declare-fun b!320774 () Bool)

(declare-fun res!174891 () Bool)

(assert (=> b!320774 (=> (not res!174891) (not e!198972))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2892 0))(
  ( (MissingZero!2892 (index!13744 (_ BitVec 32))) (Found!2892 (index!13745 (_ BitVec 32))) (Intermediate!2892 (undefined!3704 Bool) (index!13746 (_ BitVec 32)) (x!32015 (_ BitVec 32))) (Undefined!2892) (MissingVacant!2892 (index!13747 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16404 (_ BitVec 32)) SeekEntryResult!2892)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320774 (= res!174891 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) (Intermediate!2892 false resIndex!58 resX!58)))))

(declare-fun b!320775 () Bool)

(assert (=> b!320775 (= e!198972 false)))

(declare-fun lt!156117 () SeekEntryResult!2892)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!320775 (= lt!156117 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777))))

(declare-fun b!320776 () Bool)

(declare-fun res!174893 () Bool)

(assert (=> b!320776 (=> (not res!174893) (not e!198972))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16404 (_ BitVec 32)) SeekEntryResult!2892)

(assert (=> b!320776 (= res!174893 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2892 i!1250)))))

(declare-fun b!320777 () Bool)

(declare-fun res!174897 () Bool)

(assert (=> b!320777 (=> (not res!174897) (not e!198972))))

(assert (=> b!320777 (= res!174897 (and (= (select (arr!7761 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8113 a!3305))))))

(assert (= (and start!32214 res!174896) b!320772))

(assert (= (and b!320772 res!174895) b!320773))

(assert (= (and b!320773 res!174892) b!320771))

(assert (= (and b!320771 res!174894) b!320776))

(assert (= (and b!320776 res!174893) b!320770))

(assert (= (and b!320770 res!174890) b!320774))

(assert (= (and b!320774 res!174891) b!320777))

(assert (= (and b!320777 res!174897) b!320775))

(declare-fun m!329035 () Bool)

(assert (=> b!320776 m!329035))

(declare-fun m!329037 () Bool)

(assert (=> b!320775 m!329037))

(declare-fun m!329039 () Bool)

(assert (=> b!320770 m!329039))

(declare-fun m!329041 () Bool)

(assert (=> b!320777 m!329041))

(declare-fun m!329043 () Bool)

(assert (=> b!320773 m!329043))

(declare-fun m!329045 () Bool)

(assert (=> b!320771 m!329045))

(declare-fun m!329047 () Bool)

(assert (=> start!32214 m!329047))

(declare-fun m!329049 () Bool)

(assert (=> start!32214 m!329049))

(declare-fun m!329051 () Bool)

(assert (=> b!320774 m!329051))

(assert (=> b!320774 m!329051))

(declare-fun m!329053 () Bool)

(assert (=> b!320774 m!329053))

(check-sat (not b!320774) (not b!320776) (not b!320771) (not b!320775) (not b!320773) (not b!320770) (not start!32214))
