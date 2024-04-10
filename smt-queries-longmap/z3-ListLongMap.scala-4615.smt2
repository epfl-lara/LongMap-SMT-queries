; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64326 () Bool)

(assert start!64326)

(declare-fun b!722855 () Bool)

(declare-fun res!484515 () Bool)

(declare-fun e!405079 () Bool)

(assert (=> b!722855 (=> (not res!484515) (not e!405079))))

(declare-fun e!405077 () Bool)

(assert (=> b!722855 (= res!484515 e!405077)))

(declare-fun c!79546 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!722855 (= c!79546 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!722856 () Bool)

(declare-fun res!484510 () Bool)

(declare-fun e!405078 () Bool)

(assert (=> b!722856 (=> (not res!484510) (not e!405078))))

(declare-datatypes ((array!40907 0))(
  ( (array!40908 (arr!19576 (Array (_ BitVec 32) (_ BitVec 64))) (size!19997 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40907)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40907 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!722856 (= res!484510 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!722857 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7176 0))(
  ( (MissingZero!7176 (index!31072 (_ BitVec 32))) (Found!7176 (index!31073 (_ BitVec 32))) (Intermediate!7176 (undefined!7988 Bool) (index!31074 (_ BitVec 32)) (x!62073 (_ BitVec 32))) (Undefined!7176) (MissingVacant!7176 (index!31075 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40907 (_ BitVec 32)) SeekEntryResult!7176)

(assert (=> b!722857 (= e!405077 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19576 a!3186) j!159) a!3186 mask!3328) (Found!7176 j!159)))))

(declare-fun b!722858 () Bool)

(declare-fun e!405080 () Bool)

(assert (=> b!722858 (= e!405080 e!405079)))

(declare-fun res!484512 () Bool)

(assert (=> b!722858 (=> (not res!484512) (not e!405079))))

(declare-fun lt!320462 () SeekEntryResult!7176)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40907 (_ BitVec 32)) SeekEntryResult!7176)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!722858 (= res!484512 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19576 a!3186) j!159) mask!3328) (select (arr!19576 a!3186) j!159) a!3186 mask!3328) lt!320462))))

(assert (=> b!722858 (= lt!320462 (Intermediate!7176 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!722859 () Bool)

(assert (=> b!722859 (= e!405079 false)))

(declare-fun lt!320458 () array!40907)

(declare-fun lt!320457 () SeekEntryResult!7176)

(declare-fun lt!320460 () (_ BitVec 64))

(assert (=> b!722859 (= lt!320457 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320460 lt!320458 mask!3328))))

(declare-fun lt!320461 () SeekEntryResult!7176)

(assert (=> b!722859 (= lt!320461 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320460 mask!3328) lt!320460 lt!320458 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!722859 (= lt!320460 (select (store (arr!19576 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!722859 (= lt!320458 (array!40908 (store (arr!19576 a!3186) i!1173 k0!2102) (size!19997 a!3186)))))

(declare-fun b!722860 () Bool)

(declare-fun res!484517 () Bool)

(assert (=> b!722860 (=> (not res!484517) (not e!405080))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40907 (_ BitVec 32)) Bool)

(assert (=> b!722860 (= res!484517 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!722861 () Bool)

(assert (=> b!722861 (= e!405078 e!405080)))

(declare-fun res!484514 () Bool)

(assert (=> b!722861 (=> (not res!484514) (not e!405080))))

(declare-fun lt!320459 () SeekEntryResult!7176)

(assert (=> b!722861 (= res!484514 (or (= lt!320459 (MissingZero!7176 i!1173)) (= lt!320459 (MissingVacant!7176 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40907 (_ BitVec 32)) SeekEntryResult!7176)

(assert (=> b!722861 (= lt!320459 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!722862 () Bool)

(assert (=> b!722862 (= e!405077 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19576 a!3186) j!159) a!3186 mask!3328) lt!320462))))

(declare-fun b!722863 () Bool)

(declare-fun res!484511 () Bool)

(assert (=> b!722863 (=> (not res!484511) (not e!405078))))

(assert (=> b!722863 (= res!484511 (and (= (size!19997 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19997 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19997 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!484506 () Bool)

(assert (=> start!64326 (=> (not res!484506) (not e!405078))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64326 (= res!484506 (validMask!0 mask!3328))))

(assert (=> start!64326 e!405078))

(assert (=> start!64326 true))

(declare-fun array_inv!15372 (array!40907) Bool)

(assert (=> start!64326 (array_inv!15372 a!3186)))

(declare-fun b!722864 () Bool)

(declare-fun res!484508 () Bool)

(assert (=> b!722864 (=> (not res!484508) (not e!405079))))

(assert (=> b!722864 (= res!484508 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19576 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!722865 () Bool)

(declare-fun res!484516 () Bool)

(assert (=> b!722865 (=> (not res!484516) (not e!405078))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!722865 (= res!484516 (validKeyInArray!0 (select (arr!19576 a!3186) j!159)))))

(declare-fun b!722866 () Bool)

(declare-fun res!484509 () Bool)

(assert (=> b!722866 (=> (not res!484509) (not e!405080))))

(assert (=> b!722866 (= res!484509 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19997 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19997 a!3186))))))

(declare-fun b!722867 () Bool)

(declare-fun res!484513 () Bool)

(assert (=> b!722867 (=> (not res!484513) (not e!405080))))

(declare-datatypes ((List!13578 0))(
  ( (Nil!13575) (Cons!13574 (h!14628 (_ BitVec 64)) (t!19893 List!13578)) )
))
(declare-fun arrayNoDuplicates!0 (array!40907 (_ BitVec 32) List!13578) Bool)

(assert (=> b!722867 (= res!484513 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13575))))

(declare-fun b!722868 () Bool)

(declare-fun res!484507 () Bool)

(assert (=> b!722868 (=> (not res!484507) (not e!405078))))

(assert (=> b!722868 (= res!484507 (validKeyInArray!0 k0!2102))))

(assert (= (and start!64326 res!484506) b!722863))

(assert (= (and b!722863 res!484511) b!722865))

(assert (= (and b!722865 res!484516) b!722868))

(assert (= (and b!722868 res!484507) b!722856))

(assert (= (and b!722856 res!484510) b!722861))

(assert (= (and b!722861 res!484514) b!722860))

(assert (= (and b!722860 res!484517) b!722867))

(assert (= (and b!722867 res!484513) b!722866))

(assert (= (and b!722866 res!484509) b!722858))

(assert (= (and b!722858 res!484512) b!722864))

(assert (= (and b!722864 res!484508) b!722855))

(assert (= (and b!722855 c!79546) b!722862))

(assert (= (and b!722855 (not c!79546)) b!722857))

(assert (= (and b!722855 res!484515) b!722859))

(declare-fun m!677343 () Bool)

(assert (=> b!722856 m!677343))

(declare-fun m!677345 () Bool)

(assert (=> b!722862 m!677345))

(assert (=> b!722862 m!677345))

(declare-fun m!677347 () Bool)

(assert (=> b!722862 m!677347))

(declare-fun m!677349 () Bool)

(assert (=> b!722859 m!677349))

(declare-fun m!677351 () Bool)

(assert (=> b!722859 m!677351))

(declare-fun m!677353 () Bool)

(assert (=> b!722859 m!677353))

(declare-fun m!677355 () Bool)

(assert (=> b!722859 m!677355))

(assert (=> b!722859 m!677349))

(declare-fun m!677357 () Bool)

(assert (=> b!722859 m!677357))

(assert (=> b!722865 m!677345))

(assert (=> b!722865 m!677345))

(declare-fun m!677359 () Bool)

(assert (=> b!722865 m!677359))

(declare-fun m!677361 () Bool)

(assert (=> b!722867 m!677361))

(declare-fun m!677363 () Bool)

(assert (=> b!722860 m!677363))

(assert (=> b!722858 m!677345))

(assert (=> b!722858 m!677345))

(declare-fun m!677365 () Bool)

(assert (=> b!722858 m!677365))

(assert (=> b!722858 m!677365))

(assert (=> b!722858 m!677345))

(declare-fun m!677367 () Bool)

(assert (=> b!722858 m!677367))

(assert (=> b!722857 m!677345))

(assert (=> b!722857 m!677345))

(declare-fun m!677369 () Bool)

(assert (=> b!722857 m!677369))

(declare-fun m!677371 () Bool)

(assert (=> b!722868 m!677371))

(declare-fun m!677373 () Bool)

(assert (=> start!64326 m!677373))

(declare-fun m!677375 () Bool)

(assert (=> start!64326 m!677375))

(declare-fun m!677377 () Bool)

(assert (=> b!722864 m!677377))

(declare-fun m!677379 () Bool)

(assert (=> b!722861 m!677379))

(check-sat (not b!722868) (not b!722859) (not b!722857) (not start!64326) (not b!722865) (not b!722856) (not b!722861) (not b!722862) (not b!722867) (not b!722858) (not b!722860))
(check-sat)
