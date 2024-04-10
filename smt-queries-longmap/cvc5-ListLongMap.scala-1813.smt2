; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32686 () Bool)

(assert start!32686)

(declare-fun b!326591 () Bool)

(declare-fun res!179625 () Bool)

(declare-fun e!201071 () Bool)

(assert (=> b!326591 (=> (not res!179625) (not e!201071))))

(declare-datatypes ((array!16723 0))(
  ( (array!16724 (arr!7916 (Array (_ BitVec 32) (_ BitVec 64))) (size!8268 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16723)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16723 (_ BitVec 32)) Bool)

(assert (=> b!326591 (= res!179625 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!326592 () Bool)

(declare-fun res!179629 () Bool)

(declare-fun e!201072 () Bool)

(assert (=> b!326592 (=> (not res!179629) (not e!201072))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!326592 (= res!179629 (and (= (select (arr!7916 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8268 a!3305))))))

(declare-fun b!326593 () Bool)

(declare-fun res!179631 () Bool)

(assert (=> b!326593 (=> (not res!179631) (not e!201071))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3047 0))(
  ( (MissingZero!3047 (index!14364 (_ BitVec 32))) (Found!3047 (index!14365 (_ BitVec 32))) (Intermediate!3047 (undefined!3859 Bool) (index!14366 (_ BitVec 32)) (x!32613 (_ BitVec 32))) (Undefined!3047) (MissingVacant!3047 (index!14367 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16723 (_ BitVec 32)) SeekEntryResult!3047)

(assert (=> b!326593 (= res!179631 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3047 i!1250)))))

(declare-fun res!179622 () Bool)

(assert (=> start!32686 (=> (not res!179622) (not e!201071))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32686 (= res!179622 (validMask!0 mask!3777))))

(assert (=> start!32686 e!201071))

(declare-fun array_inv!5879 (array!16723) Bool)

(assert (=> start!32686 (array_inv!5879 a!3305)))

(assert (=> start!32686 true))

(declare-fun b!326594 () Bool)

(declare-fun res!179627 () Bool)

(assert (=> b!326594 (=> (not res!179627) (not e!201071))))

(declare-fun arrayContainsKey!0 (array!16723 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326594 (= res!179627 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!326595 () Bool)

(declare-fun res!179623 () Bool)

(assert (=> b!326595 (=> (not res!179623) (not e!201071))))

(assert (=> b!326595 (= res!179623 (and (= (size!8268 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8268 a!3305))))))

(declare-fun b!326596 () Bool)

(declare-fun res!179628 () Bool)

(assert (=> b!326596 (=> (not res!179628) (not e!201071))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326596 (= res!179628 (validKeyInArray!0 k!2497))))

(declare-fun b!326597 () Bool)

(declare-fun res!179626 () Bool)

(assert (=> b!326597 (=> (not res!179626) (not e!201072))))

(declare-fun lt!157355 () SeekEntryResult!3047)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16723 (_ BitVec 32)) SeekEntryResult!3047)

(assert (=> b!326597 (= res!179626 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157355))))

(declare-fun b!326598 () Bool)

(declare-fun res!179630 () Bool)

(assert (=> b!326598 (=> (not res!179630) (not e!201072))))

(assert (=> b!326598 (= res!179630 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7916 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!326599 () Bool)

(assert (=> b!326599 (= e!201071 e!201072)))

(declare-fun res!179624 () Bool)

(assert (=> b!326599 (=> (not res!179624) (not e!201072))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326599 (= res!179624 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157355))))

(assert (=> b!326599 (= lt!157355 (Intermediate!3047 false resIndex!58 resX!58))))

(declare-fun b!326600 () Bool)

(assert (=> b!326600 (= e!201072 false)))

(declare-datatypes ((Unit!10128 0))(
  ( (Unit!10129) )
))
(declare-fun lt!157356 () Unit!10128)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16723 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10128)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326600 (= lt!157356 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(assert (= (and start!32686 res!179622) b!326595))

(assert (= (and b!326595 res!179623) b!326596))

(assert (= (and b!326596 res!179628) b!326594))

(assert (= (and b!326594 res!179627) b!326593))

(assert (= (and b!326593 res!179631) b!326591))

(assert (= (and b!326591 res!179625) b!326599))

(assert (= (and b!326599 res!179624) b!326592))

(assert (= (and b!326592 res!179629) b!326597))

(assert (= (and b!326597 res!179626) b!326598))

(assert (= (and b!326598 res!179630) b!326600))

(declare-fun m!333119 () Bool)

(assert (=> b!326597 m!333119))

(declare-fun m!333121 () Bool)

(assert (=> b!326598 m!333121))

(declare-fun m!333123 () Bool)

(assert (=> b!326592 m!333123))

(declare-fun m!333125 () Bool)

(assert (=> b!326593 m!333125))

(declare-fun m!333127 () Bool)

(assert (=> start!32686 m!333127))

(declare-fun m!333129 () Bool)

(assert (=> start!32686 m!333129))

(declare-fun m!333131 () Bool)

(assert (=> b!326591 m!333131))

(declare-fun m!333133 () Bool)

(assert (=> b!326599 m!333133))

(assert (=> b!326599 m!333133))

(declare-fun m!333135 () Bool)

(assert (=> b!326599 m!333135))

(declare-fun m!333137 () Bool)

(assert (=> b!326596 m!333137))

(declare-fun m!333139 () Bool)

(assert (=> b!326594 m!333139))

(declare-fun m!333141 () Bool)

(assert (=> b!326600 m!333141))

(assert (=> b!326600 m!333141))

(declare-fun m!333143 () Bool)

(assert (=> b!326600 m!333143))

(push 1)

(assert (not b!326597))

(assert (not b!326600))

(assert (not b!326593))

(assert (not b!326594))

(assert (not start!32686))

(assert (not b!326591))

(assert (not b!326599))

