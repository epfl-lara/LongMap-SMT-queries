; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33222 () Bool)

(assert start!33222)

(declare-fun b!330458 () Bool)

(declare-fun e!202838 () Bool)

(assert (=> b!330458 (= e!202838 (not true))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!330458 (= index!1840 resIndex!58)))

(declare-datatypes ((Unit!10288 0))(
  ( (Unit!10289) )
))
(declare-fun lt!158517 () Unit!10288)

(declare-fun e!202841 () Unit!10288)

(assert (=> b!330458 (= lt!158517 e!202841)))

(declare-fun c!51815 () Bool)

(assert (=> b!330458 (= c!51815 (not (= resIndex!58 index!1840)))))

(declare-fun b!330460 () Bool)

(declare-fun res!182122 () Bool)

(assert (=> b!330460 (=> (not res!182122) (not e!202838))))

(declare-datatypes ((array!16881 0))(
  ( (array!16882 (arr!7983 (Array (_ BitVec 32) (_ BitVec 64))) (size!8335 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16881)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3114 0))(
  ( (MissingZero!3114 (index!14632 (_ BitVec 32))) (Found!3114 (index!14633 (_ BitVec 32))) (Intermediate!3114 (undefined!3926 Bool) (index!14634 (_ BitVec 32)) (x!32913 (_ BitVec 32))) (Undefined!3114) (MissingVacant!3114 (index!14635 (_ BitVec 32))) )
))
(declare-fun lt!158516 () SeekEntryResult!3114)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16881 (_ BitVec 32)) SeekEntryResult!3114)

(assert (=> b!330460 (= res!182122 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!158516))))

(declare-fun b!330461 () Bool)

(declare-fun res!182115 () Bool)

(assert (=> b!330461 (=> (not res!182115) (not e!202838))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!330461 (= res!182115 (and (= (select (arr!7983 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8335 a!3305))))))

(declare-fun b!330462 () Bool)

(declare-fun e!202842 () Unit!10288)

(declare-fun Unit!10290 () Unit!10288)

(assert (=> b!330462 (= e!202842 Unit!10290)))

(assert (=> b!330462 false))

(declare-fun b!330463 () Bool)

(declare-fun res!182118 () Bool)

(declare-fun e!202840 () Bool)

(assert (=> b!330463 (=> (not res!182118) (not e!202840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16881 (_ BitVec 32)) Bool)

(assert (=> b!330463 (= res!182118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!330464 () Bool)

(declare-fun e!202839 () Unit!10288)

(assert (=> b!330464 (= e!202841 e!202839)))

(declare-fun c!51816 () Bool)

(assert (=> b!330464 (= c!51816 (or (= (select (arr!7983 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7983 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!330465 () Bool)

(declare-fun res!182117 () Bool)

(assert (=> b!330465 (=> (not res!182117) (not e!202840))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16881 (_ BitVec 32)) SeekEntryResult!3114)

(assert (=> b!330465 (= res!182117 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3114 i!1250)))))

(declare-fun b!330466 () Bool)

(declare-fun Unit!10291 () Unit!10288)

(assert (=> b!330466 (= e!202841 Unit!10291)))

(declare-fun b!330467 () Bool)

(declare-fun Unit!10292 () Unit!10288)

(assert (=> b!330467 (= e!202842 Unit!10292)))

(declare-fun b!330468 () Bool)

(declare-fun res!182124 () Bool)

(assert (=> b!330468 (=> (not res!182124) (not e!202840))))

(declare-fun arrayContainsKey!0 (array!16881 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!330468 (= res!182124 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!330469 () Bool)

(declare-fun res!182119 () Bool)

(assert (=> b!330469 (=> (not res!182119) (not e!202840))))

(assert (=> b!330469 (= res!182119 (and (= (size!8335 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8335 a!3305))))))

(declare-fun b!330470 () Bool)

(assert (=> b!330470 false))

(declare-fun lt!158515 () Unit!10288)

(assert (=> b!330470 (= lt!158515 e!202842)))

(declare-fun c!51814 () Bool)

(get-info :version)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330470 (= c!51814 ((_ is Intermediate!3114) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun Unit!10293 () Unit!10288)

(assert (=> b!330470 (= e!202839 Unit!10293)))

(declare-fun b!330471 () Bool)

(declare-fun res!182120 () Bool)

(assert (=> b!330471 (=> (not res!182120) (not e!202840))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!330471 (= res!182120 (validKeyInArray!0 k0!2497))))

(declare-fun b!330472 () Bool)

(assert (=> b!330472 false))

(declare-fun Unit!10294 () Unit!10288)

(assert (=> b!330472 (= e!202839 Unit!10294)))

(declare-fun b!330473 () Bool)

(declare-fun res!182123 () Bool)

(assert (=> b!330473 (=> (not res!182123) (not e!202838))))

(assert (=> b!330473 (= res!182123 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7983 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(declare-fun res!182116 () Bool)

(assert (=> start!33222 (=> (not res!182116) (not e!202840))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33222 (= res!182116 (validMask!0 mask!3777))))

(assert (=> start!33222 e!202840))

(declare-fun array_inv!5946 (array!16881) Bool)

(assert (=> start!33222 (array_inv!5946 a!3305)))

(assert (=> start!33222 true))

(declare-fun b!330459 () Bool)

(assert (=> b!330459 (= e!202840 e!202838)))

(declare-fun res!182121 () Bool)

(assert (=> b!330459 (=> (not res!182121) (not e!202838))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330459 (= res!182121 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!158516))))

(assert (=> b!330459 (= lt!158516 (Intermediate!3114 false resIndex!58 resX!58))))

(assert (= (and start!33222 res!182116) b!330469))

(assert (= (and b!330469 res!182119) b!330471))

(assert (= (and b!330471 res!182120) b!330468))

(assert (= (and b!330468 res!182124) b!330465))

(assert (= (and b!330465 res!182117) b!330463))

(assert (= (and b!330463 res!182118) b!330459))

(assert (= (and b!330459 res!182121) b!330461))

(assert (= (and b!330461 res!182115) b!330460))

(assert (= (and b!330460 res!182122) b!330473))

(assert (= (and b!330473 res!182123) b!330458))

(assert (= (and b!330458 c!51815) b!330464))

(assert (= (and b!330458 (not c!51815)) b!330466))

(assert (= (and b!330464 c!51816) b!330472))

(assert (= (and b!330464 (not c!51816)) b!330470))

(assert (= (and b!330470 c!51814) b!330467))

(assert (= (and b!330470 (not c!51814)) b!330462))

(declare-fun m!335683 () Bool)

(assert (=> b!330461 m!335683))

(declare-fun m!335685 () Bool)

(assert (=> b!330473 m!335685))

(assert (=> b!330464 m!335685))

(declare-fun m!335687 () Bool)

(assert (=> b!330460 m!335687))

(declare-fun m!335689 () Bool)

(assert (=> start!33222 m!335689))

(declare-fun m!335691 () Bool)

(assert (=> start!33222 m!335691))

(declare-fun m!335693 () Bool)

(assert (=> b!330468 m!335693))

(declare-fun m!335695 () Bool)

(assert (=> b!330470 m!335695))

(assert (=> b!330470 m!335695))

(declare-fun m!335697 () Bool)

(assert (=> b!330470 m!335697))

(declare-fun m!335699 () Bool)

(assert (=> b!330471 m!335699))

(declare-fun m!335701 () Bool)

(assert (=> b!330465 m!335701))

(declare-fun m!335703 () Bool)

(assert (=> b!330463 m!335703))

(declare-fun m!335705 () Bool)

(assert (=> b!330459 m!335705))

(assert (=> b!330459 m!335705))

(declare-fun m!335707 () Bool)

(assert (=> b!330459 m!335707))

(check-sat (not b!330460) (not b!330471) (not b!330459) (not b!330468) (not start!33222) (not b!330470) (not b!330465) (not b!330463))
