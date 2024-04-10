; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32698 () Bool)

(assert start!32698)

(declare-fun b!326771 () Bool)

(declare-fun res!179807 () Bool)

(declare-fun e!201127 () Bool)

(assert (=> b!326771 (=> (not res!179807) (not e!201127))))

(declare-datatypes ((array!16735 0))(
  ( (array!16736 (arr!7922 (Array (_ BitVec 32) (_ BitVec 64))) (size!8274 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16735)

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun index!1840 () (_ BitVec 32))

(assert (=> b!326771 (= res!179807 (and (= (select (arr!7922 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8274 a!3305))))))

(declare-fun b!326772 () Bool)

(declare-fun mask!3777 () (_ BitVec 32))

(assert (=> b!326772 (= e!201127 (bvslt mask!3777 #b00000000000000000000000000000000))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-datatypes ((Unit!10140 0))(
  ( (Unit!10141) )
))
(declare-fun lt!157392 () Unit!10140)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16735 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10140)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326772 (= lt!157392 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!326773 () Bool)

(declare-fun res!179810 () Bool)

(assert (=> b!326773 (=> (not res!179810) (not e!201127))))

(assert (=> b!326773 (= res!179810 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7922 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!326774 () Bool)

(declare-fun res!179805 () Bool)

(declare-fun e!201126 () Bool)

(assert (=> b!326774 (=> (not res!179805) (not e!201126))))

(declare-datatypes ((SeekEntryResult!3053 0))(
  ( (MissingZero!3053 (index!14388 (_ BitVec 32))) (Found!3053 (index!14389 (_ BitVec 32))) (Intermediate!3053 (undefined!3865 Bool) (index!14390 (_ BitVec 32)) (x!32635 (_ BitVec 32))) (Undefined!3053) (MissingVacant!3053 (index!14391 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16735 (_ BitVec 32)) SeekEntryResult!3053)

(assert (=> b!326774 (= res!179805 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3053 i!1250)))))

(declare-fun b!326775 () Bool)

(assert (=> b!326775 (= e!201126 e!201127)))

(declare-fun res!179811 () Bool)

(assert (=> b!326775 (=> (not res!179811) (not e!201127))))

(declare-fun lt!157391 () SeekEntryResult!3053)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16735 (_ BitVec 32)) SeekEntryResult!3053)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326775 (= res!179811 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157391))))

(assert (=> b!326775 (= lt!157391 (Intermediate!3053 false resIndex!58 resX!58))))

(declare-fun b!326776 () Bool)

(declare-fun res!179804 () Bool)

(assert (=> b!326776 (=> (not res!179804) (not e!201127))))

(assert (=> b!326776 (= res!179804 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157391))))

(declare-fun b!326777 () Bool)

(declare-fun res!179802 () Bool)

(assert (=> b!326777 (=> (not res!179802) (not e!201126))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16735 (_ BitVec 32)) Bool)

(assert (=> b!326777 (= res!179802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!326779 () Bool)

(declare-fun res!179806 () Bool)

(assert (=> b!326779 (=> (not res!179806) (not e!201126))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326779 (= res!179806 (validKeyInArray!0 k!2497))))

(declare-fun b!326780 () Bool)

(declare-fun res!179808 () Bool)

(assert (=> b!326780 (=> (not res!179808) (not e!201126))))

(assert (=> b!326780 (= res!179808 (and (= (size!8274 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8274 a!3305))))))

(declare-fun res!179809 () Bool)

(assert (=> start!32698 (=> (not res!179809) (not e!201126))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32698 (= res!179809 (validMask!0 mask!3777))))

(assert (=> start!32698 e!201126))

(declare-fun array_inv!5885 (array!16735) Bool)

(assert (=> start!32698 (array_inv!5885 a!3305)))

(assert (=> start!32698 true))

(declare-fun b!326778 () Bool)

(declare-fun res!179803 () Bool)

(assert (=> b!326778 (=> (not res!179803) (not e!201126))))

(declare-fun arrayContainsKey!0 (array!16735 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326778 (= res!179803 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(assert (= (and start!32698 res!179809) b!326780))

(assert (= (and b!326780 res!179808) b!326779))

(assert (= (and b!326779 res!179806) b!326778))

(assert (= (and b!326778 res!179803) b!326774))

(assert (= (and b!326774 res!179805) b!326777))

(assert (= (and b!326777 res!179802) b!326775))

(assert (= (and b!326775 res!179811) b!326771))

(assert (= (and b!326771 res!179807) b!326776))

(assert (= (and b!326776 res!179804) b!326773))

(assert (= (and b!326773 res!179810) b!326772))

(declare-fun m!333275 () Bool)

(assert (=> b!326772 m!333275))

(assert (=> b!326772 m!333275))

(declare-fun m!333277 () Bool)

(assert (=> b!326772 m!333277))

(declare-fun m!333279 () Bool)

(assert (=> b!326777 m!333279))

(declare-fun m!333281 () Bool)

(assert (=> b!326774 m!333281))

(declare-fun m!333283 () Bool)

(assert (=> b!326775 m!333283))

(assert (=> b!326775 m!333283))

(declare-fun m!333285 () Bool)

(assert (=> b!326775 m!333285))

(declare-fun m!333287 () Bool)

(assert (=> b!326776 m!333287))

(declare-fun m!333289 () Bool)

(assert (=> start!32698 m!333289))

(declare-fun m!333291 () Bool)

(assert (=> start!32698 m!333291))

(declare-fun m!333293 () Bool)

(assert (=> b!326771 m!333293))

(declare-fun m!333295 () Bool)

(assert (=> b!326779 m!333295))

(declare-fun m!333297 () Bool)

(assert (=> b!326773 m!333297))

(declare-fun m!333299 () Bool)

(assert (=> b!326778 m!333299))

(push 1)

(assert (not b!326776))

