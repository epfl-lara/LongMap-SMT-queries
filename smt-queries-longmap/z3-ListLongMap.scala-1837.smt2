; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33272 () Bool)

(assert start!33272)

(declare-fun b!330681 () Bool)

(declare-fun res!182234 () Bool)

(declare-fun e!202926 () Bool)

(assert (=> b!330681 (=> (not res!182234) (not e!202926))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!330681 (= res!182234 (validKeyInArray!0 k0!2497))))

(declare-fun b!330682 () Bool)

(declare-fun res!182238 () Bool)

(declare-fun e!202928 () Bool)

(assert (=> b!330682 (=> (not res!182238) (not e!202928))))

(declare-datatypes ((array!16884 0))(
  ( (array!16885 (arr!7983 (Array (_ BitVec 32) (_ BitVec 64))) (size!8336 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16884)

(declare-fun index!1840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3113 0))(
  ( (MissingZero!3113 (index!14628 (_ BitVec 32))) (Found!3113 (index!14629 (_ BitVec 32))) (Intermediate!3113 (undefined!3925 Bool) (index!14630 (_ BitVec 32)) (x!32932 (_ BitVec 32))) (Undefined!3113) (MissingVacant!3113 (index!14631 (_ BitVec 32))) )
))
(declare-fun lt!158449 () SeekEntryResult!3113)

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16884 (_ BitVec 32)) SeekEntryResult!3113)

(assert (=> b!330682 (= res!182238 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!158449))))

(declare-fun b!330683 () Bool)

(declare-fun res!182232 () Bool)

(assert (=> b!330683 (=> (not res!182232) (not e!202926))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16884 (_ BitVec 32)) Bool)

(assert (=> b!330683 (= res!182232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!330684 () Bool)

(declare-fun res!182231 () Bool)

(assert (=> b!330684 (=> (not res!182231) (not e!202928))))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!330684 (= res!182231 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7983 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun res!182230 () Bool)

(assert (=> start!33272 (=> (not res!182230) (not e!202926))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33272 (= res!182230 (validMask!0 mask!3777))))

(assert (=> start!33272 e!202926))

(declare-fun array_inv!5955 (array!16884) Bool)

(assert (=> start!33272 (array_inv!5955 a!3305)))

(assert (=> start!33272 true))

(declare-fun b!330685 () Bool)

(assert (=> b!330685 (= e!202928 (bvsge (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!1490)) (bvsub #b01111111111111111111111111111110 x!1490)))))

(declare-fun lt!158450 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330685 (= lt!158450 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!330686 () Bool)

(assert (=> b!330686 (= e!202926 e!202928)))

(declare-fun res!182233 () Bool)

(assert (=> b!330686 (=> (not res!182233) (not e!202928))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330686 (= res!182233 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!158449))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!330686 (= lt!158449 (Intermediate!3113 false resIndex!58 resX!58))))

(declare-fun b!330687 () Bool)

(declare-fun res!182236 () Bool)

(assert (=> b!330687 (=> (not res!182236) (not e!202928))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!330687 (= res!182236 (and (= (select (arr!7983 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8336 a!3305))))))

(declare-fun b!330688 () Bool)

(declare-fun res!182237 () Bool)

(assert (=> b!330688 (=> (not res!182237) (not e!202926))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16884 (_ BitVec 32)) SeekEntryResult!3113)

(assert (=> b!330688 (= res!182237 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3113 i!1250)))))

(declare-fun b!330689 () Bool)

(declare-fun res!182229 () Bool)

(assert (=> b!330689 (=> (not res!182229) (not e!202926))))

(assert (=> b!330689 (= res!182229 (and (= (size!8336 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8336 a!3305))))))

(declare-fun b!330690 () Bool)

(declare-fun res!182235 () Bool)

(assert (=> b!330690 (=> (not res!182235) (not e!202926))))

(declare-fun arrayContainsKey!0 (array!16884 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!330690 (= res!182235 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(assert (= (and start!33272 res!182230) b!330689))

(assert (= (and b!330689 res!182229) b!330681))

(assert (= (and b!330681 res!182234) b!330690))

(assert (= (and b!330690 res!182235) b!330688))

(assert (= (and b!330688 res!182237) b!330683))

(assert (= (and b!330683 res!182232) b!330686))

(assert (= (and b!330686 res!182233) b!330687))

(assert (= (and b!330687 res!182236) b!330682))

(assert (= (and b!330682 res!182238) b!330684))

(assert (= (and b!330684 res!182231) b!330685))

(declare-fun m!335251 () Bool)

(assert (=> b!330685 m!335251))

(declare-fun m!335253 () Bool)

(assert (=> b!330688 m!335253))

(declare-fun m!335255 () Bool)

(assert (=> start!33272 m!335255))

(declare-fun m!335257 () Bool)

(assert (=> start!33272 m!335257))

(declare-fun m!335259 () Bool)

(assert (=> b!330681 m!335259))

(declare-fun m!335261 () Bool)

(assert (=> b!330690 m!335261))

(declare-fun m!335263 () Bool)

(assert (=> b!330684 m!335263))

(declare-fun m!335265 () Bool)

(assert (=> b!330687 m!335265))

(declare-fun m!335267 () Bool)

(assert (=> b!330683 m!335267))

(declare-fun m!335269 () Bool)

(assert (=> b!330682 m!335269))

(declare-fun m!335271 () Bool)

(assert (=> b!330686 m!335271))

(assert (=> b!330686 m!335271))

(declare-fun m!335273 () Bool)

(assert (=> b!330686 m!335273))

(check-sat (not b!330683) (not b!330686) (not b!330685) (not b!330690) (not b!330688) (not b!330681) (not b!330682) (not start!33272))
(check-sat)
