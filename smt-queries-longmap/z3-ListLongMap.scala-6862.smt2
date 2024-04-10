; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86428 () Bool)

(assert start!86428)

(declare-fun b!1000457 () Bool)

(declare-fun res!669938 () Bool)

(declare-fun e!563901 () Bool)

(assert (=> b!1000457 (=> (not res!669938) (not e!563901))))

(declare-datatypes ((array!63229 0))(
  ( (array!63230 (arr!30440 (Array (_ BitVec 32) (_ BitVec 64))) (size!30942 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63229)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1000457 (= res!669938 (and (= (size!30942 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30942 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30942 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1000458 () Bool)

(declare-fun res!669935 () Bool)

(declare-fun e!563900 () Bool)

(assert (=> b!1000458 (=> (not res!669935) (not e!563900))))

(declare-datatypes ((List!21116 0))(
  ( (Nil!21113) (Cons!21112 (h!22289 (_ BitVec 64)) (t!30117 List!21116)) )
))
(declare-fun arrayNoDuplicates!0 (array!63229 (_ BitVec 32) List!21116) Bool)

(assert (=> b!1000458 (= res!669935 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21113))))

(declare-fun res!669936 () Bool)

(assert (=> start!86428 (=> (not res!669936) (not e!563901))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86428 (= res!669936 (validMask!0 mask!3464))))

(assert (=> start!86428 e!563901))

(declare-fun array_inv!23564 (array!63229) Bool)

(assert (=> start!86428 (array_inv!23564 a!3219)))

(assert (=> start!86428 true))

(declare-fun b!1000459 () Bool)

(declare-fun res!669939 () Bool)

(assert (=> b!1000459 (=> (not res!669939) (not e!563900))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1000459 (= res!669939 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30942 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30942 a!3219))))))

(declare-fun b!1000460 () Bool)

(declare-fun res!669945 () Bool)

(assert (=> b!1000460 (=> (not res!669945) (not e!563900))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63229 (_ BitVec 32)) Bool)

(assert (=> b!1000460 (= res!669945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1000461 () Bool)

(declare-fun res!669943 () Bool)

(assert (=> b!1000461 (=> (not res!669943) (not e!563901))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000461 (= res!669943 (validKeyInArray!0 k0!2224))))

(declare-fun b!1000462 () Bool)

(declare-fun res!669942 () Bool)

(assert (=> b!1000462 (=> (not res!669942) (not e!563901))))

(declare-fun arrayContainsKey!0 (array!63229 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000462 (= res!669942 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1000463 () Bool)

(declare-fun e!563899 () Bool)

(assert (=> b!1000463 (= e!563900 e!563899)))

(declare-fun res!669937 () Bool)

(assert (=> b!1000463 (=> (not res!669937) (not e!563899))))

(declare-datatypes ((SeekEntryResult!9372 0))(
  ( (MissingZero!9372 (index!39859 (_ BitVec 32))) (Found!9372 (index!39860 (_ BitVec 32))) (Intermediate!9372 (undefined!10184 Bool) (index!39861 (_ BitVec 32)) (x!87288 (_ BitVec 32))) (Undefined!9372) (MissingVacant!9372 (index!39862 (_ BitVec 32))) )
))
(declare-fun lt!442295 () SeekEntryResult!9372)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63229 (_ BitVec 32)) SeekEntryResult!9372)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000463 (= res!669937 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30440 a!3219) j!170) mask!3464) (select (arr!30440 a!3219) j!170) a!3219 mask!3464) lt!442295))))

(assert (=> b!1000463 (= lt!442295 (Intermediate!9372 false resIndex!38 resX!38))))

(declare-fun b!1000464 () Bool)

(assert (=> b!1000464 (= e!563901 e!563900)))

(declare-fun res!669941 () Bool)

(assert (=> b!1000464 (=> (not res!669941) (not e!563900))))

(declare-fun lt!442293 () SeekEntryResult!9372)

(assert (=> b!1000464 (= res!669941 (or (= lt!442293 (MissingVacant!9372 i!1194)) (= lt!442293 (MissingZero!9372 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63229 (_ BitVec 32)) SeekEntryResult!9372)

(assert (=> b!1000464 (= lt!442293 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1000465 () Bool)

(declare-fun res!669944 () Bool)

(assert (=> b!1000465 (=> (not res!669944) (not e!563899))))

(assert (=> b!1000465 (= res!669944 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30440 a!3219) j!170) a!3219 mask!3464) lt!442295))))

(declare-fun b!1000466 () Bool)

(assert (=> b!1000466 (= e!563899 false)))

(declare-fun lt!442294 () SeekEntryResult!9372)

(assert (=> b!1000466 (= lt!442294 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30440 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30440 a!3219) i!1194 k0!2224) j!170) (array!63230 (store (arr!30440 a!3219) i!1194 k0!2224) (size!30942 a!3219)) mask!3464))))

(declare-fun b!1000467 () Bool)

(declare-fun res!669940 () Bool)

(assert (=> b!1000467 (=> (not res!669940) (not e!563901))))

(assert (=> b!1000467 (= res!669940 (validKeyInArray!0 (select (arr!30440 a!3219) j!170)))))

(assert (= (and start!86428 res!669936) b!1000457))

(assert (= (and b!1000457 res!669938) b!1000467))

(assert (= (and b!1000467 res!669940) b!1000461))

(assert (= (and b!1000461 res!669943) b!1000462))

(assert (= (and b!1000462 res!669942) b!1000464))

(assert (= (and b!1000464 res!669941) b!1000460))

(assert (= (and b!1000460 res!669945) b!1000458))

(assert (= (and b!1000458 res!669935) b!1000459))

(assert (= (and b!1000459 res!669939) b!1000463))

(assert (= (and b!1000463 res!669937) b!1000465))

(assert (= (and b!1000465 res!669944) b!1000466))

(declare-fun m!926623 () Bool)

(assert (=> b!1000464 m!926623))

(declare-fun m!926625 () Bool)

(assert (=> b!1000461 m!926625))

(declare-fun m!926627 () Bool)

(assert (=> b!1000466 m!926627))

(declare-fun m!926629 () Bool)

(assert (=> b!1000466 m!926629))

(assert (=> b!1000466 m!926629))

(declare-fun m!926631 () Bool)

(assert (=> b!1000466 m!926631))

(assert (=> b!1000466 m!926631))

(assert (=> b!1000466 m!926629))

(declare-fun m!926633 () Bool)

(assert (=> b!1000466 m!926633))

(declare-fun m!926635 () Bool)

(assert (=> b!1000460 m!926635))

(declare-fun m!926637 () Bool)

(assert (=> b!1000458 m!926637))

(declare-fun m!926639 () Bool)

(assert (=> b!1000463 m!926639))

(assert (=> b!1000463 m!926639))

(declare-fun m!926641 () Bool)

(assert (=> b!1000463 m!926641))

(assert (=> b!1000463 m!926641))

(assert (=> b!1000463 m!926639))

(declare-fun m!926643 () Bool)

(assert (=> b!1000463 m!926643))

(assert (=> b!1000465 m!926639))

(assert (=> b!1000465 m!926639))

(declare-fun m!926645 () Bool)

(assert (=> b!1000465 m!926645))

(declare-fun m!926647 () Bool)

(assert (=> b!1000462 m!926647))

(declare-fun m!926649 () Bool)

(assert (=> start!86428 m!926649))

(declare-fun m!926651 () Bool)

(assert (=> start!86428 m!926651))

(assert (=> b!1000467 m!926639))

(assert (=> b!1000467 m!926639))

(declare-fun m!926653 () Bool)

(assert (=> b!1000467 m!926653))

(check-sat (not b!1000464) (not b!1000458) (not b!1000467) (not b!1000466) (not b!1000463) (not b!1000460) (not b!1000462) (not b!1000465) (not b!1000461) (not start!86428))
(check-sat)
