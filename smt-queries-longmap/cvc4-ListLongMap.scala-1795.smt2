; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32474 () Bool)

(assert start!32474)

(declare-fun res!177897 () Bool)

(declare-fun e!200315 () Bool)

(assert (=> start!32474 (=> (not res!177897) (not e!200315))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32474 (= res!177897 (validMask!0 mask!3777))))

(assert (=> start!32474 e!200315))

(declare-datatypes ((array!16613 0))(
  ( (array!16614 (arr!7864 (Array (_ BitVec 32) (_ BitVec 64))) (size!8216 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16613)

(declare-fun array_inv!5827 (array!16613) Bool)

(assert (=> start!32474 (array_inv!5827 a!3305)))

(assert (=> start!32474 true))

(declare-fun b!324563 () Bool)

(declare-fun res!177898 () Bool)

(declare-fun e!200316 () Bool)

(assert (=> b!324563 (=> (not res!177898) (not e!200316))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!324563 (= res!177898 (and (= (select (arr!7864 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8216 a!3305))))))

(declare-fun b!324564 () Bool)

(declare-fun res!177894 () Bool)

(assert (=> b!324564 (=> (not res!177894) (not e!200316))))

(declare-fun k!2497 () (_ BitVec 64))

(assert (=> b!324564 (= res!177894 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7864 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!324565 () Bool)

(declare-fun res!177895 () Bool)

(assert (=> b!324565 (=> (not res!177895) (not e!200315))))

(declare-datatypes ((SeekEntryResult!2995 0))(
  ( (MissingZero!2995 (index!14156 (_ BitVec 32))) (Found!2995 (index!14157 (_ BitVec 32))) (Intermediate!2995 (undefined!3807 Bool) (index!14158 (_ BitVec 32)) (x!32399 (_ BitVec 32))) (Undefined!2995) (MissingVacant!2995 (index!14159 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16613 (_ BitVec 32)) SeekEntryResult!2995)

(assert (=> b!324565 (= res!177895 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2995 i!1250)))))

(declare-fun b!324566 () Bool)

(assert (=> b!324566 (= e!200315 e!200316)))

(declare-fun res!177901 () Bool)

(assert (=> b!324566 (=> (not res!177901) (not e!200316))))

(declare-fun lt!156827 () SeekEntryResult!2995)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16613 (_ BitVec 32)) SeekEntryResult!2995)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324566 (= res!177901 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156827))))

(assert (=> b!324566 (= lt!156827 (Intermediate!2995 false resIndex!58 resX!58))))

(declare-fun b!324567 () Bool)

(declare-fun res!177899 () Bool)

(assert (=> b!324567 (=> (not res!177899) (not e!200316))))

(assert (=> b!324567 (= res!177899 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156827))))

(declare-fun b!324568 () Bool)

(declare-fun res!177896 () Bool)

(assert (=> b!324568 (=> (not res!177896) (not e!200315))))

(declare-fun arrayContainsKey!0 (array!16613 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324568 (= res!177896 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324569 () Bool)

(declare-fun res!177900 () Bool)

(assert (=> b!324569 (=> (not res!177900) (not e!200315))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16613 (_ BitVec 32)) Bool)

(assert (=> b!324569 (= res!177900 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324570 () Bool)

(declare-fun res!177903 () Bool)

(assert (=> b!324570 (=> (not res!177903) (not e!200315))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324570 (= res!177903 (validKeyInArray!0 k!2497))))

(declare-fun b!324571 () Bool)

(assert (=> b!324571 (= e!200316 false)))

(declare-fun lt!156828 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324571 (= lt!156828 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!324572 () Bool)

(declare-fun res!177902 () Bool)

(assert (=> b!324572 (=> (not res!177902) (not e!200315))))

(assert (=> b!324572 (= res!177902 (and (= (size!8216 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8216 a!3305))))))

(assert (= (and start!32474 res!177897) b!324572))

(assert (= (and b!324572 res!177902) b!324570))

(assert (= (and b!324570 res!177903) b!324568))

(assert (= (and b!324568 res!177896) b!324565))

(assert (= (and b!324565 res!177895) b!324569))

(assert (= (and b!324569 res!177900) b!324566))

(assert (= (and b!324566 res!177901) b!324563))

(assert (= (and b!324563 res!177898) b!324567))

(assert (= (and b!324567 res!177899) b!324564))

(assert (= (and b!324564 res!177894) b!324571))

(declare-fun m!331583 () Bool)

(assert (=> b!324566 m!331583))

(assert (=> b!324566 m!331583))

(declare-fun m!331585 () Bool)

(assert (=> b!324566 m!331585))

(declare-fun m!331587 () Bool)

(assert (=> b!324563 m!331587))

(declare-fun m!331589 () Bool)

(assert (=> b!324571 m!331589))

(declare-fun m!331591 () Bool)

(assert (=> b!324567 m!331591))

(declare-fun m!331593 () Bool)

(assert (=> b!324569 m!331593))

(declare-fun m!331595 () Bool)

(assert (=> b!324565 m!331595))

(declare-fun m!331597 () Bool)

(assert (=> start!32474 m!331597))

(declare-fun m!331599 () Bool)

(assert (=> start!32474 m!331599))

(declare-fun m!331601 () Bool)

(assert (=> b!324570 m!331601))

(declare-fun m!331603 () Bool)

(assert (=> b!324564 m!331603))

(declare-fun m!331605 () Bool)

(assert (=> b!324568 m!331605))

(push 1)

