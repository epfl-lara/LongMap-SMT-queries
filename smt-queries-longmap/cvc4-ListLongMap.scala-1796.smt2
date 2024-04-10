; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32480 () Bool)

(assert start!32480)

(declare-fun b!324653 () Bool)

(declare-fun e!200344 () Bool)

(assert (=> b!324653 (= e!200344 false)))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun lt!156846 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324653 (= lt!156846 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!324654 () Bool)

(declare-fun res!177987 () Bool)

(assert (=> b!324654 (=> (not res!177987) (not e!200344))))

(declare-datatypes ((array!16619 0))(
  ( (array!16620 (arr!7867 (Array (_ BitVec 32) (_ BitVec 64))) (size!8219 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16619)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!324654 (= res!177987 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7867 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!324655 () Bool)

(declare-fun res!177985 () Bool)

(declare-fun e!200343 () Bool)

(assert (=> b!324655 (=> (not res!177985) (not e!200343))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16619 (_ BitVec 32)) Bool)

(assert (=> b!324655 (= res!177985 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324656 () Bool)

(declare-fun res!177986 () Bool)

(assert (=> b!324656 (=> (not res!177986) (not e!200344))))

(declare-datatypes ((SeekEntryResult!2998 0))(
  ( (MissingZero!2998 (index!14168 (_ BitVec 32))) (Found!2998 (index!14169 (_ BitVec 32))) (Intermediate!2998 (undefined!3810 Bool) (index!14170 (_ BitVec 32)) (x!32410 (_ BitVec 32))) (Undefined!2998) (MissingVacant!2998 (index!14171 (_ BitVec 32))) )
))
(declare-fun lt!156845 () SeekEntryResult!2998)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16619 (_ BitVec 32)) SeekEntryResult!2998)

(assert (=> b!324656 (= res!177986 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156845))))

(declare-fun b!324658 () Bool)

(assert (=> b!324658 (= e!200343 e!200344)))

(declare-fun res!177990 () Bool)

(assert (=> b!324658 (=> (not res!177990) (not e!200344))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324658 (= res!177990 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156845))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!324658 (= lt!156845 (Intermediate!2998 false resIndex!58 resX!58))))

(declare-fun b!324659 () Bool)

(declare-fun res!177984 () Bool)

(assert (=> b!324659 (=> (not res!177984) (not e!200344))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!324659 (= res!177984 (and (= (select (arr!7867 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8219 a!3305))))))

(declare-fun b!324660 () Bool)

(declare-fun res!177992 () Bool)

(assert (=> b!324660 (=> (not res!177992) (not e!200343))))

(declare-fun arrayContainsKey!0 (array!16619 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324660 (= res!177992 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324661 () Bool)

(declare-fun res!177993 () Bool)

(assert (=> b!324661 (=> (not res!177993) (not e!200343))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324661 (= res!177993 (validKeyInArray!0 k!2497))))

(declare-fun b!324662 () Bool)

(declare-fun res!177989 () Bool)

(assert (=> b!324662 (=> (not res!177989) (not e!200343))))

(assert (=> b!324662 (= res!177989 (and (= (size!8219 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8219 a!3305))))))

(declare-fun res!177991 () Bool)

(assert (=> start!32480 (=> (not res!177991) (not e!200343))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32480 (= res!177991 (validMask!0 mask!3777))))

(assert (=> start!32480 e!200343))

(declare-fun array_inv!5830 (array!16619) Bool)

(assert (=> start!32480 (array_inv!5830 a!3305)))

(assert (=> start!32480 true))

(declare-fun b!324657 () Bool)

(declare-fun res!177988 () Bool)

(assert (=> b!324657 (=> (not res!177988) (not e!200343))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16619 (_ BitVec 32)) SeekEntryResult!2998)

(assert (=> b!324657 (= res!177988 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2998 i!1250)))))

(assert (= (and start!32480 res!177991) b!324662))

(assert (= (and b!324662 res!177989) b!324661))

(assert (= (and b!324661 res!177993) b!324660))

(assert (= (and b!324660 res!177992) b!324657))

(assert (= (and b!324657 res!177988) b!324655))

(assert (= (and b!324655 res!177985) b!324658))

(assert (= (and b!324658 res!177990) b!324659))

(assert (= (and b!324659 res!177984) b!324656))

(assert (= (and b!324656 res!177986) b!324654))

(assert (= (and b!324654 res!177987) b!324653))

(declare-fun m!331655 () Bool)

(assert (=> b!324656 m!331655))

(declare-fun m!331657 () Bool)

(assert (=> start!32480 m!331657))

(declare-fun m!331659 () Bool)

(assert (=> start!32480 m!331659))

(declare-fun m!331661 () Bool)

(assert (=> b!324659 m!331661))

(declare-fun m!331663 () Bool)

(assert (=> b!324653 m!331663))

(declare-fun m!331665 () Bool)

(assert (=> b!324661 m!331665))

(declare-fun m!331667 () Bool)

(assert (=> b!324658 m!331667))

(assert (=> b!324658 m!331667))

(declare-fun m!331669 () Bool)

(assert (=> b!324658 m!331669))

(declare-fun m!331671 () Bool)

(assert (=> b!324660 m!331671))

(declare-fun m!331673 () Bool)

(assert (=> b!324655 m!331673))

(declare-fun m!331675 () Bool)

(assert (=> b!324654 m!331675))

(declare-fun m!331677 () Bool)

(assert (=> b!324657 m!331677))

(push 1)

