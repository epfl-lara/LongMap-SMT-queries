; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66356 () Bool)

(assert start!66356)

(declare-fun b!763538 () Bool)

(declare-fun res!516226 () Bool)

(declare-fun e!425585 () Bool)

(assert (=> b!763538 (=> (not res!516226) (not e!425585))))

(declare-datatypes ((array!42139 0))(
  ( (array!42140 (arr!20173 (Array (_ BitVec 32) (_ BitVec 64))) (size!20593 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42139)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42139 (_ BitVec 32)) Bool)

(assert (=> b!763538 (= res!516226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!763539 () Bool)

(declare-fun res!516219 () Bool)

(declare-fun e!425583 () Bool)

(assert (=> b!763539 (=> (not res!516219) (not e!425583))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!763539 (= res!516219 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20173 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!516222 () Bool)

(declare-fun e!425581 () Bool)

(assert (=> start!66356 (=> (not res!516222) (not e!425581))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66356 (= res!516222 (validMask!0 mask!3328))))

(assert (=> start!66356 e!425581))

(assert (=> start!66356 true))

(declare-fun array_inv!16032 (array!42139) Bool)

(assert (=> start!66356 (array_inv!16032 a!3186)))

(declare-fun b!763540 () Bool)

(declare-fun res!516221 () Bool)

(assert (=> b!763540 (=> (not res!516221) (not e!425585))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!763540 (= res!516221 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20593 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20593 a!3186))))))

(declare-fun b!763541 () Bool)

(assert (=> b!763541 (= e!425585 e!425583)))

(declare-fun res!516224 () Bool)

(assert (=> b!763541 (=> (not res!516224) (not e!425583))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7729 0))(
  ( (MissingZero!7729 (index!33284 (_ BitVec 32))) (Found!7729 (index!33285 (_ BitVec 32))) (Intermediate!7729 (undefined!8541 Bool) (index!33286 (_ BitVec 32)) (x!64352 (_ BitVec 32))) (Undefined!7729) (MissingVacant!7729 (index!33287 (_ BitVec 32))) )
))
(declare-fun lt!339947 () SeekEntryResult!7729)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42139 (_ BitVec 32)) SeekEntryResult!7729)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!763541 (= res!516224 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20173 a!3186) j!159) mask!3328) (select (arr!20173 a!3186) j!159) a!3186 mask!3328) lt!339947))))

(assert (=> b!763541 (= lt!339947 (Intermediate!7729 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!763542 () Bool)

(declare-fun e!425582 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42139 (_ BitVec 32)) SeekEntryResult!7729)

(assert (=> b!763542 (= e!425582 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20173 a!3186) j!159) a!3186 mask!3328) (Found!7729 j!159))))))

(declare-fun b!763543 () Bool)

(declare-fun res!516227 () Bool)

(assert (=> b!763543 (=> (not res!516227) (not e!425581))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!763543 (= res!516227 (validKeyInArray!0 k0!2102))))

(declare-fun b!763544 () Bool)

(assert (=> b!763544 (= e!425581 e!425585)))

(declare-fun res!516223 () Bool)

(assert (=> b!763544 (=> (not res!516223) (not e!425585))))

(declare-fun lt!339948 () SeekEntryResult!7729)

(assert (=> b!763544 (= res!516223 (or (= lt!339948 (MissingZero!7729 i!1173)) (= lt!339948 (MissingVacant!7729 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42139 (_ BitVec 32)) SeekEntryResult!7729)

(assert (=> b!763544 (= lt!339948 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!763545 () Bool)

(declare-fun res!516225 () Bool)

(assert (=> b!763545 (=> (not res!516225) (not e!425581))))

(assert (=> b!763545 (= res!516225 (and (= (size!20593 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20593 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20593 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!763546 () Bool)

(declare-fun res!516218 () Bool)

(assert (=> b!763546 (=> (not res!516218) (not e!425585))))

(declare-datatypes ((List!14082 0))(
  ( (Nil!14079) (Cons!14078 (h!15168 (_ BitVec 64)) (t!20389 List!14082)) )
))
(declare-fun arrayNoDuplicates!0 (array!42139 (_ BitVec 32) List!14082) Bool)

(assert (=> b!763546 (= res!516218 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14079))))

(declare-fun b!763547 () Bool)

(assert (=> b!763547 (= e!425583 false)))

(declare-fun lt!339946 () Bool)

(assert (=> b!763547 (= lt!339946 e!425582)))

(declare-fun c!84050 () Bool)

(assert (=> b!763547 (= c!84050 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!763548 () Bool)

(declare-fun res!516217 () Bool)

(assert (=> b!763548 (=> (not res!516217) (not e!425581))))

(assert (=> b!763548 (= res!516217 (validKeyInArray!0 (select (arr!20173 a!3186) j!159)))))

(declare-fun b!763549 () Bool)

(declare-fun res!516220 () Bool)

(assert (=> b!763549 (=> (not res!516220) (not e!425581))))

(declare-fun arrayContainsKey!0 (array!42139 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!763549 (= res!516220 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!763550 () Bool)

(assert (=> b!763550 (= e!425582 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20173 a!3186) j!159) a!3186 mask!3328) lt!339947)))))

(assert (= (and start!66356 res!516222) b!763545))

(assert (= (and b!763545 res!516225) b!763548))

(assert (= (and b!763548 res!516217) b!763543))

(assert (= (and b!763543 res!516227) b!763549))

(assert (= (and b!763549 res!516220) b!763544))

(assert (= (and b!763544 res!516223) b!763538))

(assert (= (and b!763538 res!516226) b!763546))

(assert (= (and b!763546 res!516218) b!763540))

(assert (= (and b!763540 res!516221) b!763541))

(assert (= (and b!763541 res!516224) b!763539))

(assert (= (and b!763539 res!516219) b!763547))

(assert (= (and b!763547 c!84050) b!763550))

(assert (= (and b!763547 (not c!84050)) b!763542))

(declare-fun m!710539 () Bool)

(assert (=> b!763548 m!710539))

(assert (=> b!763548 m!710539))

(declare-fun m!710541 () Bool)

(assert (=> b!763548 m!710541))

(declare-fun m!710543 () Bool)

(assert (=> start!66356 m!710543))

(declare-fun m!710545 () Bool)

(assert (=> start!66356 m!710545))

(assert (=> b!763542 m!710539))

(assert (=> b!763542 m!710539))

(declare-fun m!710547 () Bool)

(assert (=> b!763542 m!710547))

(declare-fun m!710549 () Bool)

(assert (=> b!763544 m!710549))

(assert (=> b!763550 m!710539))

(assert (=> b!763550 m!710539))

(declare-fun m!710551 () Bool)

(assert (=> b!763550 m!710551))

(declare-fun m!710553 () Bool)

(assert (=> b!763538 m!710553))

(assert (=> b!763541 m!710539))

(assert (=> b!763541 m!710539))

(declare-fun m!710555 () Bool)

(assert (=> b!763541 m!710555))

(assert (=> b!763541 m!710555))

(assert (=> b!763541 m!710539))

(declare-fun m!710557 () Bool)

(assert (=> b!763541 m!710557))

(declare-fun m!710559 () Bool)

(assert (=> b!763546 m!710559))

(declare-fun m!710561 () Bool)

(assert (=> b!763543 m!710561))

(declare-fun m!710563 () Bool)

(assert (=> b!763539 m!710563))

(declare-fun m!710565 () Bool)

(assert (=> b!763549 m!710565))

(check-sat (not b!763541) (not b!763543) (not b!763549) (not b!763546) (not b!763550) (not b!763538) (not b!763542) (not b!763544) (not start!66356) (not b!763548))
(check-sat)
