; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32444 () Bool)

(assert start!32444)

(declare-fun b!324270 () Bool)

(declare-fun e!200210 () Bool)

(assert (=> b!324270 (= e!200210 false)))

(declare-fun lt!156797 () (_ BitVec 32))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324270 (= lt!156797 (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777))))

(declare-fun b!324271 () Bool)

(declare-fun e!200209 () Bool)

(assert (=> b!324271 (= e!200209 e!200210)))

(declare-fun res!177655 () Bool)

(assert (=> b!324271 (=> (not res!177655) (not e!200210))))

(declare-datatypes ((array!16596 0))(
  ( (array!16597 (arr!7855 (Array (_ BitVec 32) (_ BitVec 64))) (size!8207 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16596)

(declare-datatypes ((SeekEntryResult!2951 0))(
  ( (MissingZero!2951 (index!13980 (_ BitVec 32))) (Found!2951 (index!13981 (_ BitVec 32))) (Intermediate!2951 (undefined!3763 Bool) (index!13982 (_ BitVec 32)) (x!32336 (_ BitVec 32))) (Undefined!2951) (MissingVacant!2951 (index!13983 (_ BitVec 32))) )
))
(declare-fun lt!156798 () SeekEntryResult!2951)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16596 (_ BitVec 32)) SeekEntryResult!2951)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324271 (= res!177655 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156798))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!324271 (= lt!156798 (Intermediate!2951 false resIndex!58 resX!58))))

(declare-fun b!324272 () Bool)

(declare-fun res!177652 () Bool)

(assert (=> b!324272 (=> (not res!177652) (not e!200209))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16596 (_ BitVec 32)) Bool)

(assert (=> b!324272 (= res!177652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324274 () Bool)

(declare-fun res!177659 () Bool)

(assert (=> b!324274 (=> (not res!177659) (not e!200209))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!324274 (= res!177659 (and (= (size!8207 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8207 a!3305))))))

(declare-fun b!324275 () Bool)

(declare-fun res!177651 () Bool)

(assert (=> b!324275 (=> (not res!177651) (not e!200210))))

(assert (=> b!324275 (= res!177651 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7855 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!324276 () Bool)

(declare-fun res!177657 () Bool)

(assert (=> b!324276 (=> (not res!177657) (not e!200210))))

(assert (=> b!324276 (= res!177657 (and (= (select (arr!7855 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8207 a!3305))))))

(declare-fun b!324277 () Bool)

(declare-fun res!177653 () Bool)

(assert (=> b!324277 (=> (not res!177653) (not e!200209))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16596 (_ BitVec 32)) SeekEntryResult!2951)

(assert (=> b!324277 (= res!177653 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2951 i!1250)))))

(declare-fun res!177656 () Bool)

(assert (=> start!32444 (=> (not res!177656) (not e!200209))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32444 (= res!177656 (validMask!0 mask!3777))))

(assert (=> start!32444 e!200209))

(declare-fun array_inv!5805 (array!16596) Bool)

(assert (=> start!32444 (array_inv!5805 a!3305)))

(assert (=> start!32444 true))

(declare-fun b!324273 () Bool)

(declare-fun res!177658 () Bool)

(assert (=> b!324273 (=> (not res!177658) (not e!200210))))

(assert (=> b!324273 (= res!177658 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156798))))

(declare-fun b!324278 () Bool)

(declare-fun res!177660 () Bool)

(assert (=> b!324278 (=> (not res!177660) (not e!200209))))

(declare-fun arrayContainsKey!0 (array!16596 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324278 (= res!177660 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324279 () Bool)

(declare-fun res!177654 () Bool)

(assert (=> b!324279 (=> (not res!177654) (not e!200209))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324279 (= res!177654 (validKeyInArray!0 k0!2497))))

(assert (= (and start!32444 res!177656) b!324274))

(assert (= (and b!324274 res!177659) b!324279))

(assert (= (and b!324279 res!177654) b!324278))

(assert (= (and b!324278 res!177660) b!324277))

(assert (= (and b!324277 res!177653) b!324272))

(assert (= (and b!324272 res!177652) b!324271))

(assert (= (and b!324271 res!177655) b!324276))

(assert (= (and b!324276 res!177657) b!324273))

(assert (= (and b!324273 res!177658) b!324275))

(assert (= (and b!324275 res!177651) b!324270))

(declare-fun m!331573 () Bool)

(assert (=> b!324278 m!331573))

(declare-fun m!331575 () Bool)

(assert (=> b!324273 m!331575))

(declare-fun m!331577 () Bool)

(assert (=> b!324272 m!331577))

(declare-fun m!331579 () Bool)

(assert (=> b!324270 m!331579))

(declare-fun m!331581 () Bool)

(assert (=> b!324275 m!331581))

(declare-fun m!331583 () Bool)

(assert (=> b!324276 m!331583))

(declare-fun m!331585 () Bool)

(assert (=> start!32444 m!331585))

(declare-fun m!331587 () Bool)

(assert (=> start!32444 m!331587))

(declare-fun m!331589 () Bool)

(assert (=> b!324279 m!331589))

(declare-fun m!331591 () Bool)

(assert (=> b!324277 m!331591))

(declare-fun m!331593 () Bool)

(assert (=> b!324271 m!331593))

(assert (=> b!324271 m!331593))

(declare-fun m!331595 () Bool)

(assert (=> b!324271 m!331595))

(check-sat (not b!324272) (not b!324273) (not start!32444) (not b!324270) (not b!324279) (not b!324277) (not b!324278) (not b!324271))
(check-sat)
