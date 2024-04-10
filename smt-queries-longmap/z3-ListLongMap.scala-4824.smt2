; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66286 () Bool)

(assert start!66286)

(declare-fun res!516836 () Bool)

(declare-fun e!425546 () Bool)

(assert (=> start!66286 (=> (not res!516836) (not e!425546))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66286 (= res!516836 (validMask!0 mask!3328))))

(assert (=> start!66286 e!425546))

(assert (=> start!66286 true))

(declare-datatypes ((array!42191 0))(
  ( (array!42192 (arr!20203 (Array (_ BitVec 32) (_ BitVec 64))) (size!20624 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42191)

(declare-fun array_inv!15999 (array!42191) Bool)

(assert (=> start!66286 (array_inv!15999 a!3186)))

(declare-fun b!763923 () Bool)

(declare-fun res!516831 () Bool)

(declare-fun e!425548 () Bool)

(assert (=> b!763923 (=> (not res!516831) (not e!425548))))

(declare-fun e!425545 () Bool)

(assert (=> b!763923 (= res!516831 e!425545)))

(declare-fun c!83935 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!763923 (= c!83935 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!763924 () Bool)

(declare-fun e!425550 () Bool)

(assert (=> b!763924 (= e!425550 (bvsgt #b00000000000000000000000000000000 (size!20624 a!3186)))))

(declare-datatypes ((SeekEntryResult!7803 0))(
  ( (MissingZero!7803 (index!33580 (_ BitVec 32))) (Found!7803 (index!33581 (_ BitVec 32))) (Intermediate!7803 (undefined!8615 Bool) (index!33582 (_ BitVec 32)) (x!64479 (_ BitVec 32))) (Undefined!7803) (MissingVacant!7803 (index!33583 (_ BitVec 32))) )
))
(declare-fun lt!339987 () SeekEntryResult!7803)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!763925 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42191 (_ BitVec 32)) SeekEntryResult!7803)

(assert (=> b!763925 (= e!425545 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20203 a!3186) j!159) a!3186 mask!3328) lt!339987))))

(declare-fun b!763926 () Bool)

(declare-fun res!516830 () Bool)

(declare-fun e!425547 () Bool)

(assert (=> b!763926 (=> (not res!516830) (not e!425547))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!763926 (= res!516830 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20624 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20624 a!3186))))))

(declare-fun b!763927 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42191 (_ BitVec 32)) SeekEntryResult!7803)

(assert (=> b!763927 (= e!425545 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20203 a!3186) j!159) a!3186 mask!3328) (Found!7803 j!159)))))

(declare-fun b!763928 () Bool)

(declare-fun res!516828 () Bool)

(assert (=> b!763928 (=> (not res!516828) (not e!425547))))

(declare-datatypes ((List!14205 0))(
  ( (Nil!14202) (Cons!14201 (h!15285 (_ BitVec 64)) (t!20520 List!14205)) )
))
(declare-fun arrayNoDuplicates!0 (array!42191 (_ BitVec 32) List!14205) Bool)

(assert (=> b!763928 (= res!516828 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14202))))

(declare-fun b!763929 () Bool)

(declare-fun res!516838 () Bool)

(assert (=> b!763929 (=> (not res!516838) (not e!425546))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!763929 (= res!516838 (validKeyInArray!0 k0!2102))))

(declare-fun b!763930 () Bool)

(assert (=> b!763930 (= e!425546 e!425547)))

(declare-fun res!516832 () Bool)

(assert (=> b!763930 (=> (not res!516832) (not e!425547))))

(declare-fun lt!339988 () SeekEntryResult!7803)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!763930 (= res!516832 (or (= lt!339988 (MissingZero!7803 i!1173)) (= lt!339988 (MissingVacant!7803 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42191 (_ BitVec 32)) SeekEntryResult!7803)

(assert (=> b!763930 (= lt!339988 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!763931 () Bool)

(declare-fun res!516826 () Bool)

(assert (=> b!763931 (=> (not res!516826) (not e!425547))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42191 (_ BitVec 32)) Bool)

(assert (=> b!763931 (= res!516826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!763932 () Bool)

(declare-fun res!516833 () Bool)

(assert (=> b!763932 (=> (not res!516833) (not e!425546))))

(assert (=> b!763932 (= res!516833 (and (= (size!20624 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20624 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20624 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!763933 () Bool)

(declare-fun res!516829 () Bool)

(assert (=> b!763933 (=> (not res!516829) (not e!425548))))

(assert (=> b!763933 (= res!516829 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20203 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!763934 () Bool)

(declare-fun res!516827 () Bool)

(assert (=> b!763934 (=> (not res!516827) (not e!425546))))

(declare-fun arrayContainsKey!0 (array!42191 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!763934 (= res!516827 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!763935 () Bool)

(assert (=> b!763935 (= e!425548 e!425550)))

(declare-fun res!516835 () Bool)

(assert (=> b!763935 (=> (not res!516835) (not e!425550))))

(declare-fun lt!339989 () (_ BitVec 64))

(declare-fun lt!339986 () array!42191)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!763935 (= res!516835 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!339989 mask!3328) lt!339989 lt!339986 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!339989 lt!339986 mask!3328)))))

(assert (=> b!763935 (= lt!339989 (select (store (arr!20203 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!763935 (= lt!339986 (array!42192 (store (arr!20203 a!3186) i!1173 k0!2102) (size!20624 a!3186)))))

(declare-fun b!763936 () Bool)

(declare-fun res!516837 () Bool)

(assert (=> b!763936 (=> (not res!516837) (not e!425546))))

(assert (=> b!763936 (= res!516837 (validKeyInArray!0 (select (arr!20203 a!3186) j!159)))))

(declare-fun b!763937 () Bool)

(assert (=> b!763937 (= e!425547 e!425548)))

(declare-fun res!516834 () Bool)

(assert (=> b!763937 (=> (not res!516834) (not e!425548))))

(assert (=> b!763937 (= res!516834 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20203 a!3186) j!159) mask!3328) (select (arr!20203 a!3186) j!159) a!3186 mask!3328) lt!339987))))

(assert (=> b!763937 (= lt!339987 (Intermediate!7803 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!66286 res!516836) b!763932))

(assert (= (and b!763932 res!516833) b!763936))

(assert (= (and b!763936 res!516837) b!763929))

(assert (= (and b!763929 res!516838) b!763934))

(assert (= (and b!763934 res!516827) b!763930))

(assert (= (and b!763930 res!516832) b!763931))

(assert (= (and b!763931 res!516826) b!763928))

(assert (= (and b!763928 res!516828) b!763926))

(assert (= (and b!763926 res!516830) b!763937))

(assert (= (and b!763937 res!516834) b!763933))

(assert (= (and b!763933 res!516829) b!763923))

(assert (= (and b!763923 c!83935) b!763925))

(assert (= (and b!763923 (not c!83935)) b!763927))

(assert (= (and b!763923 res!516831) b!763935))

(assert (= (and b!763935 res!516835) b!763924))

(declare-fun m!710351 () Bool)

(assert (=> b!763934 m!710351))

(declare-fun m!710353 () Bool)

(assert (=> b!763929 m!710353))

(declare-fun m!710355 () Bool)

(assert (=> b!763927 m!710355))

(assert (=> b!763927 m!710355))

(declare-fun m!710357 () Bool)

(assert (=> b!763927 m!710357))

(assert (=> b!763925 m!710355))

(assert (=> b!763925 m!710355))

(declare-fun m!710359 () Bool)

(assert (=> b!763925 m!710359))

(declare-fun m!710361 () Bool)

(assert (=> b!763930 m!710361))

(declare-fun m!710363 () Bool)

(assert (=> start!66286 m!710363))

(declare-fun m!710365 () Bool)

(assert (=> start!66286 m!710365))

(declare-fun m!710367 () Bool)

(assert (=> b!763928 m!710367))

(declare-fun m!710369 () Bool)

(assert (=> b!763935 m!710369))

(declare-fun m!710371 () Bool)

(assert (=> b!763935 m!710371))

(declare-fun m!710373 () Bool)

(assert (=> b!763935 m!710373))

(declare-fun m!710375 () Bool)

(assert (=> b!763935 m!710375))

(assert (=> b!763935 m!710371))

(declare-fun m!710377 () Bool)

(assert (=> b!763935 m!710377))

(declare-fun m!710379 () Bool)

(assert (=> b!763931 m!710379))

(declare-fun m!710381 () Bool)

(assert (=> b!763933 m!710381))

(assert (=> b!763936 m!710355))

(assert (=> b!763936 m!710355))

(declare-fun m!710383 () Bool)

(assert (=> b!763936 m!710383))

(assert (=> b!763937 m!710355))

(assert (=> b!763937 m!710355))

(declare-fun m!710385 () Bool)

(assert (=> b!763937 m!710385))

(assert (=> b!763937 m!710385))

(assert (=> b!763937 m!710355))

(declare-fun m!710387 () Bool)

(assert (=> b!763937 m!710387))

(check-sat (not b!763931) (not b!763928) (not b!763937) (not b!763930) (not b!763927) (not b!763936) (not b!763929) (not b!763925) (not b!763934) (not b!763935) (not start!66286))
(check-sat)
