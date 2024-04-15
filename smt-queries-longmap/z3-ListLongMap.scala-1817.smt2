; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32696 () Bool)

(assert start!32696)

(declare-fun b!326676 () Bool)

(declare-fun res!179860 () Bool)

(declare-fun e!201005 () Bool)

(assert (=> b!326676 (=> (not res!179860) (not e!201005))))

(declare-datatypes ((array!16737 0))(
  ( (array!16738 (arr!7923 (Array (_ BitVec 32) (_ BitVec 64))) (size!8276 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16737)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!326676 (= res!179860 (and (= (size!8276 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8276 a!3305))))))

(declare-fun b!326677 () Bool)

(declare-fun res!179854 () Bool)

(declare-fun e!201003 () Bool)

(assert (=> b!326677 (=> (not res!179854) (not e!201003))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!326677 (= res!179854 (and (= (select (arr!7923 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8276 a!3305))))))

(declare-fun b!326678 () Bool)

(declare-fun res!179853 () Bool)

(assert (=> b!326678 (=> (not res!179853) (not e!201003))))

(declare-fun k0!2497 () (_ BitVec 64))

(assert (=> b!326678 (= res!179853 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7923 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun res!179858 () Bool)

(assert (=> start!32696 (=> (not res!179858) (not e!201005))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32696 (= res!179858 (validMask!0 mask!3777))))

(assert (=> start!32696 e!201005))

(declare-fun array_inv!5895 (array!16737) Bool)

(assert (=> start!32696 (array_inv!5895 a!3305)))

(assert (=> start!32696 true))

(declare-fun b!326679 () Bool)

(declare-fun res!179861 () Bool)

(assert (=> b!326679 (=> (not res!179861) (not e!201005))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326679 (= res!179861 (validKeyInArray!0 k0!2497))))

(declare-fun b!326680 () Bool)

(assert (=> b!326680 (= e!201005 e!201003)))

(declare-fun res!179855 () Bool)

(assert (=> b!326680 (=> (not res!179855) (not e!201003))))

(declare-datatypes ((SeekEntryResult!3053 0))(
  ( (MissingZero!3053 (index!14388 (_ BitVec 32))) (Found!3053 (index!14389 (_ BitVec 32))) (Intermediate!3053 (undefined!3865 Bool) (index!14390 (_ BitVec 32)) (x!32646 (_ BitVec 32))) (Undefined!3053) (MissingVacant!3053 (index!14391 (_ BitVec 32))) )
))
(declare-fun lt!157193 () SeekEntryResult!3053)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16737 (_ BitVec 32)) SeekEntryResult!3053)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326680 (= res!179855 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157193))))

(assert (=> b!326680 (= lt!157193 (Intermediate!3053 false resIndex!58 resX!58))))

(declare-fun b!326681 () Bool)

(declare-fun res!179857 () Bool)

(assert (=> b!326681 (=> (not res!179857) (not e!201005))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16737 (_ BitVec 32)) SeekEntryResult!3053)

(assert (=> b!326681 (= res!179857 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3053 i!1250)))))

(declare-fun b!326682 () Bool)

(assert (=> b!326682 (= e!201003 (and (bvsge mask!3777 #b00000000000000000000000000000000) (bvsge index!1840 (bvadd #b00000000000000000000000000000001 mask!3777))))))

(declare-datatypes ((Unit!10118 0))(
  ( (Unit!10119) )
))
(declare-fun lt!157192 () Unit!10118)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16737 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10118)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326682 (= lt!157192 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!326683 () Bool)

(declare-fun res!179859 () Bool)

(assert (=> b!326683 (=> (not res!179859) (not e!201005))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16737 (_ BitVec 32)) Bool)

(assert (=> b!326683 (= res!179859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!326684 () Bool)

(declare-fun res!179862 () Bool)

(assert (=> b!326684 (=> (not res!179862) (not e!201005))))

(declare-fun arrayContainsKey!0 (array!16737 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326684 (= res!179862 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!326685 () Bool)

(declare-fun res!179856 () Bool)

(assert (=> b!326685 (=> (not res!179856) (not e!201003))))

(assert (=> b!326685 (= res!179856 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157193))))

(assert (= (and start!32696 res!179858) b!326676))

(assert (= (and b!326676 res!179860) b!326679))

(assert (= (and b!326679 res!179861) b!326684))

(assert (= (and b!326684 res!179862) b!326681))

(assert (= (and b!326681 res!179857) b!326683))

(assert (= (and b!326683 res!179859) b!326680))

(assert (= (and b!326680 res!179855) b!326677))

(assert (= (and b!326677 res!179854) b!326685))

(assert (= (and b!326685 res!179856) b!326678))

(assert (= (and b!326678 res!179853) b!326682))

(declare-fun m!332701 () Bool)

(assert (=> b!326680 m!332701))

(assert (=> b!326680 m!332701))

(declare-fun m!332703 () Bool)

(assert (=> b!326680 m!332703))

(declare-fun m!332705 () Bool)

(assert (=> start!32696 m!332705))

(declare-fun m!332707 () Bool)

(assert (=> start!32696 m!332707))

(declare-fun m!332709 () Bool)

(assert (=> b!326683 m!332709))

(declare-fun m!332711 () Bool)

(assert (=> b!326677 m!332711))

(declare-fun m!332713 () Bool)

(assert (=> b!326678 m!332713))

(declare-fun m!332715 () Bool)

(assert (=> b!326681 m!332715))

(declare-fun m!332717 () Bool)

(assert (=> b!326679 m!332717))

(declare-fun m!332719 () Bool)

(assert (=> b!326685 m!332719))

(declare-fun m!332721 () Bool)

(assert (=> b!326682 m!332721))

(assert (=> b!326682 m!332721))

(declare-fun m!332723 () Bool)

(assert (=> b!326682 m!332723))

(declare-fun m!332725 () Bool)

(assert (=> b!326684 m!332725))

(check-sat (not start!32696) (not b!326679) (not b!326685) (not b!326681) (not b!326680) (not b!326684) (not b!326682) (not b!326683))
(check-sat)
