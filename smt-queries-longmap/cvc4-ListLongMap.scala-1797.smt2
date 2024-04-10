; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32486 () Bool)

(assert start!32486)

(declare-fun b!324743 () Bool)

(declare-fun e!200369 () Bool)

(assert (=> b!324743 (= e!200369 false)))

(declare-fun lt!156864 () (_ BitVec 32))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324743 (= lt!156864 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!324744 () Bool)

(declare-fun res!178080 () Bool)

(assert (=> b!324744 (=> (not res!178080) (not e!200369))))

(declare-datatypes ((array!16625 0))(
  ( (array!16626 (arr!7870 (Array (_ BitVec 32) (_ BitVec 64))) (size!8222 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16625)

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!324744 (= res!178080 (and (= (select (arr!7870 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8222 a!3305))))))

(declare-fun b!324745 () Bool)

(declare-fun res!178081 () Bool)

(declare-fun e!200371 () Bool)

(assert (=> b!324745 (=> (not res!178081) (not e!200371))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16625 (_ BitVec 32)) Bool)

(assert (=> b!324745 (= res!178081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324746 () Bool)

(declare-fun res!178078 () Bool)

(assert (=> b!324746 (=> (not res!178078) (not e!200371))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3001 0))(
  ( (MissingZero!3001 (index!14180 (_ BitVec 32))) (Found!3001 (index!14181 (_ BitVec 32))) (Intermediate!3001 (undefined!3813 Bool) (index!14182 (_ BitVec 32)) (x!32421 (_ BitVec 32))) (Undefined!3001) (MissingVacant!3001 (index!14183 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16625 (_ BitVec 32)) SeekEntryResult!3001)

(assert (=> b!324746 (= res!178078 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3001 i!1250)))))

(declare-fun b!324747 () Bool)

(assert (=> b!324747 (= e!200371 e!200369)))

(declare-fun res!178077 () Bool)

(assert (=> b!324747 (=> (not res!178077) (not e!200369))))

(declare-fun lt!156863 () SeekEntryResult!3001)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16625 (_ BitVec 32)) SeekEntryResult!3001)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324747 (= res!178077 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156863))))

(assert (=> b!324747 (= lt!156863 (Intermediate!3001 false resIndex!58 resX!58))))

(declare-fun b!324748 () Bool)

(declare-fun res!178079 () Bool)

(assert (=> b!324748 (=> (not res!178079) (not e!200369))))

(assert (=> b!324748 (= res!178079 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156863))))

(declare-fun b!324749 () Bool)

(declare-fun res!178076 () Bool)

(assert (=> b!324749 (=> (not res!178076) (not e!200371))))

(declare-fun arrayContainsKey!0 (array!16625 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324749 (= res!178076 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324750 () Bool)

(declare-fun res!178075 () Bool)

(assert (=> b!324750 (=> (not res!178075) (not e!200371))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324750 (= res!178075 (validKeyInArray!0 k!2497))))

(declare-fun b!324751 () Bool)

(declare-fun res!178083 () Bool)

(assert (=> b!324751 (=> (not res!178083) (not e!200371))))

(assert (=> b!324751 (= res!178083 (and (= (size!8222 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8222 a!3305))))))

(declare-fun res!178082 () Bool)

(assert (=> start!32486 (=> (not res!178082) (not e!200371))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32486 (= res!178082 (validMask!0 mask!3777))))

(assert (=> start!32486 e!200371))

(declare-fun array_inv!5833 (array!16625) Bool)

(assert (=> start!32486 (array_inv!5833 a!3305)))

(assert (=> start!32486 true))

(declare-fun b!324752 () Bool)

(declare-fun res!178074 () Bool)

(assert (=> b!324752 (=> (not res!178074) (not e!200369))))

(assert (=> b!324752 (= res!178074 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7870 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(assert (= (and start!32486 res!178082) b!324751))

(assert (= (and b!324751 res!178083) b!324750))

(assert (= (and b!324750 res!178075) b!324749))

(assert (= (and b!324749 res!178076) b!324746))

(assert (= (and b!324746 res!178078) b!324745))

(assert (= (and b!324745 res!178081) b!324747))

(assert (= (and b!324747 res!178077) b!324744))

(assert (= (and b!324744 res!178080) b!324748))

(assert (= (and b!324748 res!178079) b!324752))

(assert (= (and b!324752 res!178074) b!324743))

(declare-fun m!331727 () Bool)

(assert (=> b!324744 m!331727))

(declare-fun m!331729 () Bool)

(assert (=> b!324745 m!331729))

(declare-fun m!331731 () Bool)

(assert (=> b!324748 m!331731))

(declare-fun m!331733 () Bool)

(assert (=> b!324746 m!331733))

(declare-fun m!331735 () Bool)

(assert (=> start!32486 m!331735))

(declare-fun m!331737 () Bool)

(assert (=> start!32486 m!331737))

(declare-fun m!331739 () Bool)

(assert (=> b!324743 m!331739))

(declare-fun m!331741 () Bool)

(assert (=> b!324747 m!331741))

(assert (=> b!324747 m!331741))

(declare-fun m!331743 () Bool)

(assert (=> b!324747 m!331743))

(declare-fun m!331745 () Bool)

(assert (=> b!324749 m!331745))

(declare-fun m!331747 () Bool)

(assert (=> b!324752 m!331747))

(declare-fun m!331749 () Bool)

(assert (=> b!324750 m!331749))

(push 1)

