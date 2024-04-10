; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32692 () Bool)

(assert start!32692)

(declare-fun b!326681 () Bool)

(declare-fun res!179720 () Bool)

(declare-fun e!201099 () Bool)

(assert (=> b!326681 (=> (not res!179720) (not e!201099))))

(declare-datatypes ((array!16729 0))(
  ( (array!16730 (arr!7919 (Array (_ BitVec 32) (_ BitVec 64))) (size!8271 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16729)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3050 0))(
  ( (MissingZero!3050 (index!14376 (_ BitVec 32))) (Found!3050 (index!14377 (_ BitVec 32))) (Intermediate!3050 (undefined!3862 Bool) (index!14378 (_ BitVec 32)) (x!32624 (_ BitVec 32))) (Undefined!3050) (MissingVacant!3050 (index!14379 (_ BitVec 32))) )
))
(declare-fun lt!157374 () SeekEntryResult!3050)

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16729 (_ BitVec 32)) SeekEntryResult!3050)

(assert (=> b!326681 (= res!179720 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157374))))

(declare-fun b!326682 () Bool)

(declare-fun res!179718 () Bool)

(assert (=> b!326682 (=> (not res!179718) (not e!201099))))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!326682 (= res!179718 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7919 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!326683 () Bool)

(declare-fun res!179712 () Bool)

(declare-fun e!201100 () Bool)

(assert (=> b!326683 (=> (not res!179712) (not e!201100))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!326683 (= res!179712 (and (= (size!8271 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8271 a!3305))))))

(declare-fun b!326684 () Bool)

(declare-fun res!179713 () Bool)

(assert (=> b!326684 (=> (not res!179713) (not e!201100))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16729 (_ BitVec 32)) Bool)

(assert (=> b!326684 (= res!179713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!179716 () Bool)

(assert (=> start!32692 (=> (not res!179716) (not e!201100))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32692 (= res!179716 (validMask!0 mask!3777))))

(assert (=> start!32692 e!201100))

(declare-fun array_inv!5882 (array!16729) Bool)

(assert (=> start!32692 (array_inv!5882 a!3305)))

(assert (=> start!32692 true))

(declare-fun b!326685 () Bool)

(declare-fun res!179715 () Bool)

(assert (=> b!326685 (=> (not res!179715) (not e!201100))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16729 (_ BitVec 32)) SeekEntryResult!3050)

(assert (=> b!326685 (= res!179715 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3050 i!1250)))))

(declare-fun b!326686 () Bool)

(declare-fun res!179719 () Bool)

(assert (=> b!326686 (=> (not res!179719) (not e!201100))))

(declare-fun arrayContainsKey!0 (array!16729 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326686 (= res!179719 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!326687 () Bool)

(declare-fun res!179721 () Bool)

(assert (=> b!326687 (=> (not res!179721) (not e!201100))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326687 (= res!179721 (validKeyInArray!0 k!2497))))

(declare-fun b!326688 () Bool)

(assert (=> b!326688 (= e!201099 false)))

(declare-datatypes ((Unit!10134 0))(
  ( (Unit!10135) )
))
(declare-fun lt!157373 () Unit!10134)

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16729 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10134)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326688 (= lt!157373 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!326689 () Bool)

(assert (=> b!326689 (= e!201100 e!201099)))

(declare-fun res!179714 () Bool)

(assert (=> b!326689 (=> (not res!179714) (not e!201099))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326689 (= res!179714 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157374))))

(assert (=> b!326689 (= lt!157374 (Intermediate!3050 false resIndex!58 resX!58))))

(declare-fun b!326690 () Bool)

(declare-fun res!179717 () Bool)

(assert (=> b!326690 (=> (not res!179717) (not e!201099))))

(assert (=> b!326690 (= res!179717 (and (= (select (arr!7919 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8271 a!3305))))))

(assert (= (and start!32692 res!179716) b!326683))

(assert (= (and b!326683 res!179712) b!326687))

(assert (= (and b!326687 res!179721) b!326686))

(assert (= (and b!326686 res!179719) b!326685))

(assert (= (and b!326685 res!179715) b!326684))

(assert (= (and b!326684 res!179713) b!326689))

(assert (= (and b!326689 res!179714) b!326690))

(assert (= (and b!326690 res!179717) b!326681))

(assert (= (and b!326681 res!179720) b!326682))

(assert (= (and b!326682 res!179718) b!326688))

(declare-fun m!333197 () Bool)

(assert (=> b!326686 m!333197))

(declare-fun m!333199 () Bool)

(assert (=> b!326689 m!333199))

(assert (=> b!326689 m!333199))

(declare-fun m!333201 () Bool)

(assert (=> b!326689 m!333201))

(declare-fun m!333203 () Bool)

(assert (=> b!326687 m!333203))

(declare-fun m!333205 () Bool)

(assert (=> b!326681 m!333205))

(declare-fun m!333207 () Bool)

(assert (=> b!326682 m!333207))

(declare-fun m!333209 () Bool)

(assert (=> start!32692 m!333209))

(declare-fun m!333211 () Bool)

(assert (=> start!32692 m!333211))

(declare-fun m!333213 () Bool)

(assert (=> b!326685 m!333213))

(declare-fun m!333215 () Bool)

(assert (=> b!326690 m!333215))

(declare-fun m!333217 () Bool)

(assert (=> b!326684 m!333217))

(declare-fun m!333219 () Bool)

(assert (=> b!326688 m!333219))

(assert (=> b!326688 m!333219))

(declare-fun m!333221 () Bool)

(assert (=> b!326688 m!333221))

(push 1)

