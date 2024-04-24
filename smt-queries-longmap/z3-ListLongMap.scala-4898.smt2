; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67684 () Bool)

(assert start!67684)

(declare-fun b!782785 () Bool)

(declare-fun res!529472 () Bool)

(declare-fun e!435366 () Bool)

(assert (=> b!782785 (=> (not res!529472) (not e!435366))))

(declare-fun e!435361 () Bool)

(assert (=> b!782785 (= res!529472 e!435361)))

(declare-fun c!87067 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!782785 (= c!87067 (bvsle x!1131 resIntermediateX!5))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42667 0))(
  ( (array!42668 (arr!20419 (Array (_ BitVec 32) (_ BitVec 64))) (size!20839 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42667)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!782786 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7975 0))(
  ( (MissingZero!7975 (index!34268 (_ BitVec 32))) (Found!7975 (index!34269 (_ BitVec 32))) (Intermediate!7975 (undefined!8787 Bool) (index!34270 (_ BitVec 32)) (x!65381 (_ BitVec 32))) (Undefined!7975) (MissingVacant!7975 (index!34271 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42667 (_ BitVec 32)) SeekEntryResult!7975)

(assert (=> b!782786 (= e!435361 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20419 a!3186) j!159) a!3186 mask!3328) (Found!7975 j!159)))))

(declare-fun b!782787 () Bool)

(declare-fun res!529481 () Bool)

(declare-fun e!435359 () Bool)

(assert (=> b!782787 (=> (not res!529481) (not e!435359))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42667 (_ BitVec 32)) Bool)

(assert (=> b!782787 (= res!529481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!782788 () Bool)

(declare-fun lt!348833 () SeekEntryResult!7975)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42667 (_ BitVec 32)) SeekEntryResult!7975)

(assert (=> b!782788 (= e!435361 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20419 a!3186) j!159) a!3186 mask!3328) lt!348833))))

(declare-fun b!782789 () Bool)

(declare-fun e!435365 () Bool)

(declare-fun lt!348839 () SeekEntryResult!7975)

(assert (=> b!782789 (= e!435365 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20419 a!3186) j!159) a!3186 mask!3328) lt!348839))))

(declare-fun b!782790 () Bool)

(declare-fun res!529485 () Bool)

(declare-fun e!435364 () Bool)

(assert (=> b!782790 (=> res!529485 e!435364)))

(declare-fun lt!348841 () (_ BitVec 64))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!782790 (= res!529485 (= (select (store (arr!20419 a!3186) i!1173 k0!2102) index!1321) lt!348841))))

(declare-fun b!782791 () Bool)

(declare-fun e!435360 () Bool)

(assert (=> b!782791 (= e!435360 (not e!435364))))

(declare-fun res!529484 () Bool)

(assert (=> b!782791 (=> res!529484 e!435364)))

(declare-fun lt!348832 () SeekEntryResult!7975)

(get-info :version)

(assert (=> b!782791 (= res!529484 (or (not ((_ is Intermediate!7975) lt!348832)) (bvslt x!1131 (x!65381 lt!348832)) (not (= x!1131 (x!65381 lt!348832))) (not (= index!1321 (index!34270 lt!348832)))))))

(assert (=> b!782791 e!435365))

(declare-fun res!529469 () Bool)

(assert (=> b!782791 (=> (not res!529469) (not e!435365))))

(declare-fun lt!348838 () SeekEntryResult!7975)

(assert (=> b!782791 (= res!529469 (= lt!348838 lt!348839))))

(assert (=> b!782791 (= lt!348839 (Found!7975 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42667 (_ BitVec 32)) SeekEntryResult!7975)

(assert (=> b!782791 (= lt!348838 (seekEntryOrOpen!0 (select (arr!20419 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!782791 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26965 0))(
  ( (Unit!26966) )
))
(declare-fun lt!348840 () Unit!26965)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42667 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26965)

(assert (=> b!782791 (= lt!348840 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!529480 () Bool)

(declare-fun e!435363 () Bool)

(assert (=> start!67684 (=> (not res!529480) (not e!435363))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67684 (= res!529480 (validMask!0 mask!3328))))

(assert (=> start!67684 e!435363))

(assert (=> start!67684 true))

(declare-fun array_inv!16278 (array!42667) Bool)

(assert (=> start!67684 (array_inv!16278 a!3186)))

(declare-fun b!782792 () Bool)

(declare-fun res!529483 () Bool)

(assert (=> b!782792 (=> (not res!529483) (not e!435359))))

(assert (=> b!782792 (= res!529483 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20839 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20839 a!3186))))))

(declare-fun b!782793 () Bool)

(declare-fun res!529475 () Bool)

(assert (=> b!782793 (=> (not res!529475) (not e!435363))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!782793 (= res!529475 (validKeyInArray!0 (select (arr!20419 a!3186) j!159)))))

(declare-fun b!782794 () Bool)

(declare-fun e!435362 () Unit!26965)

(declare-fun Unit!26967 () Unit!26965)

(assert (=> b!782794 (= e!435362 Unit!26967)))

(declare-fun b!782795 () Bool)

(assert (=> b!782795 (= e!435359 e!435366)))

(declare-fun res!529471 () Bool)

(assert (=> b!782795 (=> (not res!529471) (not e!435366))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!782795 (= res!529471 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20419 a!3186) j!159) mask!3328) (select (arr!20419 a!3186) j!159) a!3186 mask!3328) lt!348833))))

(assert (=> b!782795 (= lt!348833 (Intermediate!7975 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!782796 () Bool)

(assert (=> b!782796 (= e!435363 e!435359)))

(declare-fun res!529474 () Bool)

(assert (=> b!782796 (=> (not res!529474) (not e!435359))))

(declare-fun lt!348835 () SeekEntryResult!7975)

(assert (=> b!782796 (= res!529474 (or (= lt!348835 (MissingZero!7975 i!1173)) (= lt!348835 (MissingVacant!7975 i!1173))))))

(assert (=> b!782796 (= lt!348835 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!782797 () Bool)

(declare-fun res!529479 () Bool)

(assert (=> b!782797 (=> (not res!529479) (not e!435363))))

(assert (=> b!782797 (= res!529479 (and (= (size!20839 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20839 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20839 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!782798 () Bool)

(assert (=> b!782798 (= e!435366 e!435360)))

(declare-fun res!529470 () Bool)

(assert (=> b!782798 (=> (not res!529470) (not e!435360))))

(declare-fun lt!348834 () SeekEntryResult!7975)

(assert (=> b!782798 (= res!529470 (= lt!348834 lt!348832))))

(declare-fun lt!348836 () array!42667)

(assert (=> b!782798 (= lt!348832 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348841 lt!348836 mask!3328))))

(assert (=> b!782798 (= lt!348834 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348841 mask!3328) lt!348841 lt!348836 mask!3328))))

(assert (=> b!782798 (= lt!348841 (select (store (arr!20419 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!782798 (= lt!348836 (array!42668 (store (arr!20419 a!3186) i!1173 k0!2102) (size!20839 a!3186)))))

(declare-fun b!782799 () Bool)

(declare-fun res!529478 () Bool)

(assert (=> b!782799 (=> res!529478 e!435364)))

(assert (=> b!782799 (= res!529478 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20419 a!3186) j!159) a!3186 mask!3328) lt!348839)))))

(declare-fun b!782800 () Bool)

(declare-fun Unit!26968 () Unit!26965)

(assert (=> b!782800 (= e!435362 Unit!26968)))

(assert (=> b!782800 false))

(declare-fun b!782801 () Bool)

(declare-fun res!529476 () Bool)

(assert (=> b!782801 (=> (not res!529476) (not e!435363))))

(declare-fun arrayContainsKey!0 (array!42667 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!782801 (= res!529476 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!782802 () Bool)

(declare-fun res!529482 () Bool)

(assert (=> b!782802 (=> (not res!529482) (not e!435366))))

(assert (=> b!782802 (= res!529482 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20419 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!782803 () Bool)

(declare-fun res!529477 () Bool)

(assert (=> b!782803 (=> (not res!529477) (not e!435359))))

(declare-datatypes ((List!14328 0))(
  ( (Nil!14325) (Cons!14324 (h!15450 (_ BitVec 64)) (t!20635 List!14328)) )
))
(declare-fun arrayNoDuplicates!0 (array!42667 (_ BitVec 32) List!14328) Bool)

(assert (=> b!782803 (= res!529477 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14325))))

(declare-fun b!782804 () Bool)

(assert (=> b!782804 (= e!435364 true)))

(assert (=> b!782804 (= (select (store (arr!20419 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!348837 () Unit!26965)

(assert (=> b!782804 (= lt!348837 e!435362)))

(declare-fun c!87068 () Bool)

(assert (=> b!782804 (= c!87068 (= (select (store (arr!20419 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!782805 () Bool)

(declare-fun res!529473 () Bool)

(assert (=> b!782805 (=> (not res!529473) (not e!435363))))

(assert (=> b!782805 (= res!529473 (validKeyInArray!0 k0!2102))))

(assert (= (and start!67684 res!529480) b!782797))

(assert (= (and b!782797 res!529479) b!782793))

(assert (= (and b!782793 res!529475) b!782805))

(assert (= (and b!782805 res!529473) b!782801))

(assert (= (and b!782801 res!529476) b!782796))

(assert (= (and b!782796 res!529474) b!782787))

(assert (= (and b!782787 res!529481) b!782803))

(assert (= (and b!782803 res!529477) b!782792))

(assert (= (and b!782792 res!529483) b!782795))

(assert (= (and b!782795 res!529471) b!782802))

(assert (= (and b!782802 res!529482) b!782785))

(assert (= (and b!782785 c!87067) b!782788))

(assert (= (and b!782785 (not c!87067)) b!782786))

(assert (= (and b!782785 res!529472) b!782798))

(assert (= (and b!782798 res!529470) b!782791))

(assert (= (and b!782791 res!529469) b!782789))

(assert (= (and b!782791 (not res!529484)) b!782799))

(assert (= (and b!782799 (not res!529478)) b!782790))

(assert (= (and b!782790 (not res!529485)) b!782804))

(assert (= (and b!782804 c!87068) b!782800))

(assert (= (and b!782804 (not c!87068)) b!782794))

(declare-fun m!726065 () Bool)

(assert (=> b!782803 m!726065))

(declare-fun m!726067 () Bool)

(assert (=> b!782787 m!726067))

(declare-fun m!726069 () Bool)

(assert (=> b!782793 m!726069))

(assert (=> b!782793 m!726069))

(declare-fun m!726071 () Bool)

(assert (=> b!782793 m!726071))

(declare-fun m!726073 () Bool)

(assert (=> b!782804 m!726073))

(declare-fun m!726075 () Bool)

(assert (=> b!782804 m!726075))

(assert (=> b!782790 m!726073))

(assert (=> b!782790 m!726075))

(declare-fun m!726077 () Bool)

(assert (=> b!782801 m!726077))

(declare-fun m!726079 () Bool)

(assert (=> b!782802 m!726079))

(assert (=> b!782799 m!726069))

(assert (=> b!782799 m!726069))

(declare-fun m!726081 () Bool)

(assert (=> b!782799 m!726081))

(assert (=> b!782789 m!726069))

(assert (=> b!782789 m!726069))

(declare-fun m!726083 () Bool)

(assert (=> b!782789 m!726083))

(assert (=> b!782795 m!726069))

(assert (=> b!782795 m!726069))

(declare-fun m!726085 () Bool)

(assert (=> b!782795 m!726085))

(assert (=> b!782795 m!726085))

(assert (=> b!782795 m!726069))

(declare-fun m!726087 () Bool)

(assert (=> b!782795 m!726087))

(declare-fun m!726089 () Bool)

(assert (=> b!782796 m!726089))

(declare-fun m!726091 () Bool)

(assert (=> b!782805 m!726091))

(declare-fun m!726093 () Bool)

(assert (=> start!67684 m!726093))

(declare-fun m!726095 () Bool)

(assert (=> start!67684 m!726095))

(assert (=> b!782788 m!726069))

(assert (=> b!782788 m!726069))

(declare-fun m!726097 () Bool)

(assert (=> b!782788 m!726097))

(assert (=> b!782791 m!726069))

(assert (=> b!782791 m!726069))

(declare-fun m!726099 () Bool)

(assert (=> b!782791 m!726099))

(declare-fun m!726101 () Bool)

(assert (=> b!782791 m!726101))

(declare-fun m!726103 () Bool)

(assert (=> b!782791 m!726103))

(declare-fun m!726105 () Bool)

(assert (=> b!782798 m!726105))

(declare-fun m!726107 () Bool)

(assert (=> b!782798 m!726107))

(declare-fun m!726109 () Bool)

(assert (=> b!782798 m!726109))

(assert (=> b!782798 m!726073))

(assert (=> b!782798 m!726107))

(declare-fun m!726111 () Bool)

(assert (=> b!782798 m!726111))

(assert (=> b!782786 m!726069))

(assert (=> b!782786 m!726069))

(assert (=> b!782786 m!726081))

(check-sat (not b!782791) (not b!782788) (not b!782795) (not b!782798) (not b!782789) (not b!782799) (not b!782787) (not b!782801) (not b!782803) (not b!782796) (not b!782805) (not b!782786) (not b!782793) (not start!67684))
(check-sat)
