; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32690 () Bool)

(assert start!32690)

(declare-fun b!326651 () Bool)

(declare-fun e!201089 () Bool)

(declare-fun e!201090 () Bool)

(assert (=> b!326651 (= e!201089 e!201090)))

(declare-fun res!179689 () Bool)

(assert (=> b!326651 (=> (not res!179689) (not e!201090))))

(declare-datatypes ((array!16727 0))(
  ( (array!16728 (arr!7918 (Array (_ BitVec 32) (_ BitVec 64))) (size!8270 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16727)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3049 0))(
  ( (MissingZero!3049 (index!14372 (_ BitVec 32))) (Found!3049 (index!14373 (_ BitVec 32))) (Intermediate!3049 (undefined!3861 Bool) (index!14374 (_ BitVec 32)) (x!32615 (_ BitVec 32))) (Undefined!3049) (MissingVacant!3049 (index!14375 (_ BitVec 32))) )
))
(declare-fun lt!157368 () SeekEntryResult!3049)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16727 (_ BitVec 32)) SeekEntryResult!3049)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326651 (= res!179689 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157368))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!326651 (= lt!157368 (Intermediate!3049 false resIndex!58 resX!58))))

(declare-fun b!326652 () Bool)

(declare-fun res!179687 () Bool)

(assert (=> b!326652 (=> (not res!179687) (not e!201089))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16727 (_ BitVec 32)) SeekEntryResult!3049)

(assert (=> b!326652 (= res!179687 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3049 i!1250)))))

(declare-fun b!326653 () Bool)

(declare-fun res!179683 () Bool)

(assert (=> b!326653 (=> (not res!179683) (not e!201089))))

(assert (=> b!326653 (= res!179683 (and (= (size!8270 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8270 a!3305))))))

(declare-fun b!326654 () Bool)

(declare-fun res!179690 () Bool)

(assert (=> b!326654 (=> (not res!179690) (not e!201089))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16727 (_ BitVec 32)) Bool)

(assert (=> b!326654 (= res!179690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!326655 () Bool)

(declare-fun res!179686 () Bool)

(assert (=> b!326655 (=> (not res!179686) (not e!201089))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326655 (= res!179686 (validKeyInArray!0 k!2497))))

(declare-fun b!326656 () Bool)

(declare-fun res!179684 () Bool)

(assert (=> b!326656 (=> (not res!179684) (not e!201090))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!326656 (= res!179684 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7918 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun res!179685 () Bool)

(assert (=> start!32690 (=> (not res!179685) (not e!201089))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32690 (= res!179685 (validMask!0 mask!3777))))

(assert (=> start!32690 e!201089))

(declare-fun array_inv!5881 (array!16727) Bool)

(assert (=> start!32690 (array_inv!5881 a!3305)))

(assert (=> start!32690 true))

(declare-fun b!326657 () Bool)

(declare-fun res!179688 () Bool)

(assert (=> b!326657 (=> (not res!179688) (not e!201089))))

(declare-fun arrayContainsKey!0 (array!16727 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326657 (= res!179688 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!326658 () Bool)

(declare-fun res!179691 () Bool)

(assert (=> b!326658 (=> (not res!179691) (not e!201090))))

(assert (=> b!326658 (= res!179691 (and (= (select (arr!7918 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8270 a!3305))))))

(declare-fun b!326659 () Bool)

(declare-fun res!179682 () Bool)

(assert (=> b!326659 (=> (not res!179682) (not e!201090))))

(assert (=> b!326659 (= res!179682 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157368))))

(declare-fun b!326660 () Bool)

(assert (=> b!326660 (= e!201090 false)))

(declare-datatypes ((Unit!10132 0))(
  ( (Unit!10133) )
))
(declare-fun lt!157367 () Unit!10132)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16727 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10132)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326660 (= lt!157367 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(assert (= (and start!32690 res!179685) b!326653))

(assert (= (and b!326653 res!179683) b!326655))

(assert (= (and b!326655 res!179686) b!326657))

(assert (= (and b!326657 res!179688) b!326652))

(assert (= (and b!326652 res!179687) b!326654))

(assert (= (and b!326654 res!179690) b!326651))

(assert (= (and b!326651 res!179689) b!326658))

(assert (= (and b!326658 res!179691) b!326659))

(assert (= (and b!326659 res!179682) b!326656))

(assert (= (and b!326656 res!179684) b!326660))

(declare-fun m!333171 () Bool)

(assert (=> b!326655 m!333171))

(declare-fun m!333173 () Bool)

(assert (=> start!32690 m!333173))

(declare-fun m!333175 () Bool)

(assert (=> start!32690 m!333175))

(declare-fun m!333177 () Bool)

(assert (=> b!326657 m!333177))

(declare-fun m!333179 () Bool)

(assert (=> b!326652 m!333179))

(declare-fun m!333181 () Bool)

(assert (=> b!326658 m!333181))

(declare-fun m!333183 () Bool)

(assert (=> b!326654 m!333183))

(declare-fun m!333185 () Bool)

(assert (=> b!326651 m!333185))

(assert (=> b!326651 m!333185))

(declare-fun m!333187 () Bool)

(assert (=> b!326651 m!333187))

(declare-fun m!333189 () Bool)

(assert (=> b!326659 m!333189))

(declare-fun m!333191 () Bool)

(assert (=> b!326656 m!333191))

(declare-fun m!333193 () Bool)

(assert (=> b!326660 m!333193))

(assert (=> b!326660 m!333193))

(declare-fun m!333195 () Bool)

(assert (=> b!326660 m!333195))

(push 1)

