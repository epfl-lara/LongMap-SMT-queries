; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65232 () Bool)

(assert start!65232)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun e!411545 () Bool)

(declare-fun b!735387 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!325904 () (_ BitVec 32))

(assert (=> b!735387 (= e!411545 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt lt!325904 #b00000000000000000000000000000000) (bvsge lt!325904 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun b!735388 () Bool)

(declare-fun e!411548 () Bool)

(declare-fun e!411544 () Bool)

(assert (=> b!735388 (= e!411548 e!411544)))

(declare-fun res!493831 () Bool)

(assert (=> b!735388 (=> (not res!493831) (not e!411544))))

(declare-datatypes ((array!41275 0))(
  ( (array!41276 (arr!19747 (Array (_ BitVec 32) (_ BitVec 64))) (size!20167 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41275)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7303 0))(
  ( (MissingZero!7303 (index!31580 (_ BitVec 32))) (Found!7303 (index!31581 (_ BitVec 32))) (Intermediate!7303 (undefined!8115 Bool) (index!31582 (_ BitVec 32)) (x!62753 (_ BitVec 32))) (Undefined!7303) (MissingVacant!7303 (index!31583 (_ BitVec 32))) )
))
(declare-fun lt!325902 () SeekEntryResult!7303)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41275 (_ BitVec 32)) SeekEntryResult!7303)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735388 (= res!493831 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19747 a!3186) j!159) mask!3328) (select (arr!19747 a!3186) j!159) a!3186 mask!3328) lt!325902))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!735388 (= lt!325902 (Intermediate!7303 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!735389 () Bool)

(declare-fun e!411550 () Bool)

(assert (=> b!735389 (= e!411550 e!411545)))

(declare-fun res!493823 () Bool)

(assert (=> b!735389 (=> res!493823 e!411545)))

(assert (=> b!735389 (= res!493823 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735389 (= lt!325904 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!735390 () Bool)

(declare-fun res!493825 () Bool)

(declare-fun e!411546 () Bool)

(assert (=> b!735390 (=> (not res!493825) (not e!411546))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41275 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!735390 (= res!493825 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun e!411543 () Bool)

(declare-fun b!735391 () Bool)

(assert (=> b!735391 (= e!411543 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19747 a!3186) j!159) a!3186 mask!3328) lt!325902))))

(declare-fun b!735392 () Bool)

(declare-fun e!411547 () Bool)

(assert (=> b!735392 (= e!411547 (not e!411550))))

(declare-fun res!493818 () Bool)

(assert (=> b!735392 (=> res!493818 e!411550)))

(declare-fun lt!325905 () SeekEntryResult!7303)

(get-info :version)

(assert (=> b!735392 (= res!493818 (or (not ((_ is Intermediate!7303) lt!325905)) (bvsge x!1131 (x!62753 lt!325905))))))

(declare-fun e!411549 () Bool)

(assert (=> b!735392 e!411549))

(declare-fun res!493819 () Bool)

(assert (=> b!735392 (=> (not res!493819) (not e!411549))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41275 (_ BitVec 32)) Bool)

(assert (=> b!735392 (= res!493819 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25003 0))(
  ( (Unit!25004) )
))
(declare-fun lt!325907 () Unit!25003)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41275 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25003)

(assert (=> b!735392 (= lt!325907 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!735394 () Bool)

(declare-fun res!493829 () Bool)

(assert (=> b!735394 (=> (not res!493829) (not e!411548))))

(assert (=> b!735394 (= res!493829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!735395 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41275 (_ BitVec 32)) SeekEntryResult!7303)

(assert (=> b!735395 (= e!411543 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19747 a!3186) j!159) a!3186 mask!3328) (Found!7303 j!159)))))

(declare-fun b!735396 () Bool)

(declare-fun res!493817 () Bool)

(assert (=> b!735396 (=> (not res!493817) (not e!411544))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!735396 (= res!493817 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19747 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!735397 () Bool)

(declare-fun res!493827 () Bool)

(assert (=> b!735397 (=> (not res!493827) (not e!411546))))

(assert (=> b!735397 (= res!493827 (and (= (size!20167 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20167 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20167 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!735398 () Bool)

(declare-fun e!411552 () Bool)

(declare-fun lt!325903 () SeekEntryResult!7303)

(assert (=> b!735398 (= e!411552 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19747 a!3186) j!159) a!3186 mask!3328) lt!325903))))

(declare-fun b!735399 () Bool)

(declare-fun res!493820 () Bool)

(assert (=> b!735399 (=> (not res!493820) (not e!411546))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!735399 (= res!493820 (validKeyInArray!0 (select (arr!19747 a!3186) j!159)))))

(declare-fun b!735400 () Bool)

(assert (=> b!735400 (= e!411549 e!411552)))

(declare-fun res!493822 () Bool)

(assert (=> b!735400 (=> (not res!493822) (not e!411552))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41275 (_ BitVec 32)) SeekEntryResult!7303)

(assert (=> b!735400 (= res!493822 (= (seekEntryOrOpen!0 (select (arr!19747 a!3186) j!159) a!3186 mask!3328) lt!325903))))

(assert (=> b!735400 (= lt!325903 (Found!7303 j!159))))

(declare-fun b!735401 () Bool)

(declare-fun res!493815 () Bool)

(assert (=> b!735401 (=> (not res!493815) (not e!411548))))

(declare-datatypes ((List!13656 0))(
  ( (Nil!13653) (Cons!13652 (h!14730 (_ BitVec 64)) (t!19963 List!13656)) )
))
(declare-fun arrayNoDuplicates!0 (array!41275 (_ BitVec 32) List!13656) Bool)

(assert (=> b!735401 (= res!493815 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13653))))

(declare-fun res!493814 () Bool)

(assert (=> start!65232 (=> (not res!493814) (not e!411546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65232 (= res!493814 (validMask!0 mask!3328))))

(assert (=> start!65232 e!411546))

(assert (=> start!65232 true))

(declare-fun array_inv!15606 (array!41275) Bool)

(assert (=> start!65232 (array_inv!15606 a!3186)))

(declare-fun b!735393 () Bool)

(declare-fun res!493821 () Bool)

(assert (=> b!735393 (=> (not res!493821) (not e!411544))))

(assert (=> b!735393 (= res!493821 e!411543)))

(declare-fun c!81170 () Bool)

(assert (=> b!735393 (= c!81170 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!735402 () Bool)

(declare-fun res!493830 () Bool)

(assert (=> b!735402 (=> res!493830 e!411545)))

(assert (=> b!735402 (= res!493830 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19747 a!3186) j!159) a!3186 mask!3328) (Found!7303 j!159)))))

(declare-fun b!735403 () Bool)

(declare-fun res!493826 () Bool)

(assert (=> b!735403 (=> (not res!493826) (not e!411548))))

(assert (=> b!735403 (= res!493826 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20167 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20167 a!3186))))))

(declare-fun b!735404 () Bool)

(assert (=> b!735404 (= e!411546 e!411548)))

(declare-fun res!493828 () Bool)

(assert (=> b!735404 (=> (not res!493828) (not e!411548))))

(declare-fun lt!325901 () SeekEntryResult!7303)

(assert (=> b!735404 (= res!493828 (or (= lt!325901 (MissingZero!7303 i!1173)) (= lt!325901 (MissingVacant!7303 i!1173))))))

(assert (=> b!735404 (= lt!325901 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!735405 () Bool)

(assert (=> b!735405 (= e!411544 e!411547)))

(declare-fun res!493816 () Bool)

(assert (=> b!735405 (=> (not res!493816) (not e!411547))))

(declare-fun lt!325908 () SeekEntryResult!7303)

(assert (=> b!735405 (= res!493816 (= lt!325908 lt!325905))))

(declare-fun lt!325906 () (_ BitVec 64))

(declare-fun lt!325900 () array!41275)

(assert (=> b!735405 (= lt!325905 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!325906 lt!325900 mask!3328))))

(assert (=> b!735405 (= lt!325908 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!325906 mask!3328) lt!325906 lt!325900 mask!3328))))

(assert (=> b!735405 (= lt!325906 (select (store (arr!19747 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!735405 (= lt!325900 (array!41276 (store (arr!19747 a!3186) i!1173 k0!2102) (size!20167 a!3186)))))

(declare-fun b!735406 () Bool)

(declare-fun res!493824 () Bool)

(assert (=> b!735406 (=> (not res!493824) (not e!411546))))

(assert (=> b!735406 (= res!493824 (validKeyInArray!0 k0!2102))))

(assert (= (and start!65232 res!493814) b!735397))

(assert (= (and b!735397 res!493827) b!735399))

(assert (= (and b!735399 res!493820) b!735406))

(assert (= (and b!735406 res!493824) b!735390))

(assert (= (and b!735390 res!493825) b!735404))

(assert (= (and b!735404 res!493828) b!735394))

(assert (= (and b!735394 res!493829) b!735401))

(assert (= (and b!735401 res!493815) b!735403))

(assert (= (and b!735403 res!493826) b!735388))

(assert (= (and b!735388 res!493831) b!735396))

(assert (= (and b!735396 res!493817) b!735393))

(assert (= (and b!735393 c!81170) b!735391))

(assert (= (and b!735393 (not c!81170)) b!735395))

(assert (= (and b!735393 res!493821) b!735405))

(assert (= (and b!735405 res!493816) b!735392))

(assert (= (and b!735392 res!493819) b!735400))

(assert (= (and b!735400 res!493822) b!735398))

(assert (= (and b!735392 (not res!493818)) b!735389))

(assert (= (and b!735389 (not res!493823)) b!735402))

(assert (= (and b!735402 (not res!493830)) b!735387))

(declare-fun m!688347 () Bool)

(assert (=> b!735388 m!688347))

(assert (=> b!735388 m!688347))

(declare-fun m!688349 () Bool)

(assert (=> b!735388 m!688349))

(assert (=> b!735388 m!688349))

(assert (=> b!735388 m!688347))

(declare-fun m!688351 () Bool)

(assert (=> b!735388 m!688351))

(declare-fun m!688353 () Bool)

(assert (=> b!735389 m!688353))

(declare-fun m!688355 () Bool)

(assert (=> b!735401 m!688355))

(assert (=> b!735402 m!688347))

(assert (=> b!735402 m!688347))

(declare-fun m!688357 () Bool)

(assert (=> b!735402 m!688357))

(assert (=> b!735391 m!688347))

(assert (=> b!735391 m!688347))

(declare-fun m!688359 () Bool)

(assert (=> b!735391 m!688359))

(declare-fun m!688361 () Bool)

(assert (=> b!735406 m!688361))

(assert (=> b!735395 m!688347))

(assert (=> b!735395 m!688347))

(assert (=> b!735395 m!688357))

(declare-fun m!688363 () Bool)

(assert (=> b!735396 m!688363))

(declare-fun m!688365 () Bool)

(assert (=> b!735394 m!688365))

(declare-fun m!688367 () Bool)

(assert (=> b!735405 m!688367))

(declare-fun m!688369 () Bool)

(assert (=> b!735405 m!688369))

(declare-fun m!688371 () Bool)

(assert (=> b!735405 m!688371))

(declare-fun m!688373 () Bool)

(assert (=> b!735405 m!688373))

(declare-fun m!688375 () Bool)

(assert (=> b!735405 m!688375))

(assert (=> b!735405 m!688373))

(declare-fun m!688377 () Bool)

(assert (=> b!735404 m!688377))

(declare-fun m!688379 () Bool)

(assert (=> start!65232 m!688379))

(declare-fun m!688381 () Bool)

(assert (=> start!65232 m!688381))

(declare-fun m!688383 () Bool)

(assert (=> b!735392 m!688383))

(declare-fun m!688385 () Bool)

(assert (=> b!735392 m!688385))

(assert (=> b!735398 m!688347))

(assert (=> b!735398 m!688347))

(declare-fun m!688387 () Bool)

(assert (=> b!735398 m!688387))

(assert (=> b!735399 m!688347))

(assert (=> b!735399 m!688347))

(declare-fun m!688389 () Bool)

(assert (=> b!735399 m!688389))

(declare-fun m!688391 () Bool)

(assert (=> b!735390 m!688391))

(assert (=> b!735400 m!688347))

(assert (=> b!735400 m!688347))

(declare-fun m!688393 () Bool)

(assert (=> b!735400 m!688393))

(check-sat (not b!735402) (not start!65232) (not b!735401) (not b!735398) (not b!735400) (not b!735394) (not b!735389) (not b!735395) (not b!735406) (not b!735392) (not b!735405) (not b!735391) (not b!735399) (not b!735404) (not b!735390) (not b!735388))
(check-sat)
