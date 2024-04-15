; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32222 () Bool)

(assert start!32222)

(declare-fun b!320779 () Bool)

(declare-fun res!175047 () Bool)

(declare-fun e!198882 () Bool)

(assert (=> b!320779 (=> (not res!175047) (not e!198882))))

(declare-datatypes ((array!16416 0))(
  ( (array!16417 (arr!7767 (Array (_ BitVec 32) (_ BitVec 64))) (size!8120 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16416)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun x!1490 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2897 0))(
  ( (MissingZero!2897 (index!13764 (_ BitVec 32))) (Found!2897 (index!13765 (_ BitVec 32))) (Intermediate!2897 (undefined!3709 Bool) (index!13766 (_ BitVec 32)) (x!32047 (_ BitVec 32))) (Undefined!2897) (MissingVacant!2897 (index!13767 (_ BitVec 32))) )
))
(declare-fun lt!155915 () SeekEntryResult!2897)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16416 (_ BitVec 32)) SeekEntryResult!2897)

(assert (=> b!320779 (= res!175047 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!155915))))

(declare-fun b!320781 () Bool)

(declare-fun res!175048 () Bool)

(declare-fun e!198883 () Bool)

(assert (=> b!320781 (=> (not res!175048) (not e!198883))))

(declare-fun arrayContainsKey!0 (array!16416 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320781 (= res!175048 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320782 () Bool)

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!320782 (= e!198882 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7767 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (or (= (select (arr!7767 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7767 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3777 #b00000000000000000000000000000000) (bvslt index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsgt x!1490 #b01111111111111111111111111111110)))))

(declare-fun b!320783 () Bool)

(declare-fun res!175051 () Bool)

(assert (=> b!320783 (=> (not res!175051) (not e!198883))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320783 (= res!175051 (validKeyInArray!0 k0!2497))))

(declare-fun b!320784 () Bool)

(declare-fun res!175053 () Bool)

(assert (=> b!320784 (=> (not res!175053) (not e!198882))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!320784 (= res!175053 (and (= (select (arr!7767 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8120 a!3305))))))

(declare-fun b!320785 () Bool)

(declare-fun res!175046 () Bool)

(assert (=> b!320785 (=> (not res!175046) (not e!198883))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16416 (_ BitVec 32)) SeekEntryResult!2897)

(assert (=> b!320785 (= res!175046 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2897 i!1250)))))

(declare-fun b!320786 () Bool)

(assert (=> b!320786 (= e!198883 e!198882)))

(declare-fun res!175045 () Bool)

(assert (=> b!320786 (=> (not res!175045) (not e!198882))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320786 (= res!175045 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!155915))))

(assert (=> b!320786 (= lt!155915 (Intermediate!2897 false resIndex!58 resX!58))))

(declare-fun b!320787 () Bool)

(declare-fun res!175052 () Bool)

(assert (=> b!320787 (=> (not res!175052) (not e!198883))))

(assert (=> b!320787 (= res!175052 (and (= (size!8120 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8120 a!3305))))))

(declare-fun res!175050 () Bool)

(assert (=> start!32222 (=> (not res!175050) (not e!198883))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32222 (= res!175050 (validMask!0 mask!3777))))

(assert (=> start!32222 e!198883))

(declare-fun array_inv!5739 (array!16416) Bool)

(assert (=> start!32222 (array_inv!5739 a!3305)))

(assert (=> start!32222 true))

(declare-fun b!320780 () Bool)

(declare-fun res!175049 () Bool)

(assert (=> b!320780 (=> (not res!175049) (not e!198883))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16416 (_ BitVec 32)) Bool)

(assert (=> b!320780 (= res!175049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32222 res!175050) b!320787))

(assert (= (and b!320787 res!175052) b!320783))

(assert (= (and b!320783 res!175051) b!320781))

(assert (= (and b!320781 res!175048) b!320785))

(assert (= (and b!320785 res!175046) b!320780))

(assert (= (and b!320780 res!175049) b!320786))

(assert (= (and b!320786 res!175045) b!320784))

(assert (= (and b!320784 res!175053) b!320779))

(assert (= (and b!320779 res!175047) b!320782))

(declare-fun m!328537 () Bool)

(assert (=> b!320783 m!328537))

(declare-fun m!328539 () Bool)

(assert (=> b!320786 m!328539))

(assert (=> b!320786 m!328539))

(declare-fun m!328541 () Bool)

(assert (=> b!320786 m!328541))

(declare-fun m!328543 () Bool)

(assert (=> b!320780 m!328543))

(declare-fun m!328545 () Bool)

(assert (=> b!320785 m!328545))

(declare-fun m!328547 () Bool)

(assert (=> b!320779 m!328547))

(declare-fun m!328549 () Bool)

(assert (=> start!32222 m!328549))

(declare-fun m!328551 () Bool)

(assert (=> start!32222 m!328551))

(declare-fun m!328553 () Bool)

(assert (=> b!320781 m!328553))

(declare-fun m!328555 () Bool)

(assert (=> b!320782 m!328555))

(declare-fun m!328557 () Bool)

(assert (=> b!320784 m!328557))

(check-sat (not b!320785) (not b!320781) (not b!320779) (not b!320783) (not b!320786) (not start!32222) (not b!320780))
(check-sat)
