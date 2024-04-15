; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66264 () Bool)

(assert start!66264)

(declare-fun b!763628 () Bool)

(declare-fun res!516678 () Bool)

(declare-fun e!425374 () Bool)

(assert (=> b!763628 (=> (not res!516678) (not e!425374))))

(declare-datatypes ((array!42186 0))(
  ( (array!42187 (arr!20201 (Array (_ BitVec 32) (_ BitVec 64))) (size!20622 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42186)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!763628 (= res!516678 (validKeyInArray!0 (select (arr!20201 a!3186) j!159)))))

(declare-fun b!763629 () Bool)

(declare-fun res!516680 () Bool)

(declare-fun e!425376 () Bool)

(assert (=> b!763629 (=> (not res!516680) (not e!425376))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!763629 (= res!516680 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20201 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!763630 () Bool)

(declare-fun res!516677 () Bool)

(assert (=> b!763630 (=> (not res!516677) (not e!425376))))

(declare-fun e!425377 () Bool)

(assert (=> b!763630 (= res!516677 e!425377)))

(declare-fun c!83862 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!763630 (= c!83862 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!763631 () Bool)

(declare-fun e!425375 () Bool)

(assert (=> b!763631 (= e!425375 e!425376)))

(declare-fun res!516682 () Bool)

(assert (=> b!763631 (=> (not res!516682) (not e!425376))))

(declare-datatypes ((SeekEntryResult!7798 0))(
  ( (MissingZero!7798 (index!33560 (_ BitVec 32))) (Found!7798 (index!33561 (_ BitVec 32))) (Intermediate!7798 (undefined!8610 Bool) (index!33562 (_ BitVec 32)) (x!64469 (_ BitVec 32))) (Undefined!7798) (MissingVacant!7798 (index!33563 (_ BitVec 32))) )
))
(declare-fun lt!339736 () SeekEntryResult!7798)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42186 (_ BitVec 32)) SeekEntryResult!7798)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!763631 (= res!516682 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20201 a!3186) j!159) mask!3328) (select (arr!20201 a!3186) j!159) a!3186 mask!3328) lt!339736))))

(assert (=> b!763631 (= lt!339736 (Intermediate!7798 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!763632 () Bool)

(declare-fun res!516681 () Bool)

(assert (=> b!763632 (=> (not res!516681) (not e!425374))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42186 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!763632 (= res!516681 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!763633 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42186 (_ BitVec 32)) SeekEntryResult!7798)

(assert (=> b!763633 (= e!425377 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20201 a!3186) j!159) a!3186 mask!3328) (Found!7798 j!159)))))

(declare-fun b!763634 () Bool)

(declare-fun e!425378 () Bool)

(assert (=> b!763634 (= e!425378 (bvsgt #b00000000000000000000000000000000 (size!20622 a!3186)))))

(declare-fun b!763635 () Bool)

(declare-fun res!516686 () Bool)

(assert (=> b!763635 (=> (not res!516686) (not e!425375))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42186 (_ BitVec 32)) Bool)

(assert (=> b!763635 (= res!516686 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!763637 () Bool)

(declare-fun res!516683 () Bool)

(assert (=> b!763637 (=> (not res!516683) (not e!425375))))

(declare-datatypes ((List!14242 0))(
  ( (Nil!14239) (Cons!14238 (h!15322 (_ BitVec 64)) (t!20548 List!14242)) )
))
(declare-fun arrayNoDuplicates!0 (array!42186 (_ BitVec 32) List!14242) Bool)

(assert (=> b!763637 (= res!516683 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14239))))

(declare-fun b!763638 () Bool)

(assert (=> b!763638 (= e!425377 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20201 a!3186) j!159) a!3186 mask!3328) lt!339736))))

(declare-fun b!763639 () Bool)

(declare-fun res!516689 () Bool)

(assert (=> b!763639 (=> (not res!516689) (not e!425374))))

(assert (=> b!763639 (= res!516689 (validKeyInArray!0 k0!2102))))

(declare-fun b!763640 () Bool)

(assert (=> b!763640 (= e!425376 e!425378)))

(declare-fun res!516685 () Bool)

(assert (=> b!763640 (=> (not res!516685) (not e!425378))))

(declare-fun lt!339735 () array!42186)

(declare-fun lt!339734 () (_ BitVec 64))

(assert (=> b!763640 (= res!516685 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!339734 mask!3328) lt!339734 lt!339735 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!339734 lt!339735 mask!3328)))))

(assert (=> b!763640 (= lt!339734 (select (store (arr!20201 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!763640 (= lt!339735 (array!42187 (store (arr!20201 a!3186) i!1173 k0!2102) (size!20622 a!3186)))))

(declare-fun b!763641 () Bool)

(declare-fun res!516687 () Bool)

(assert (=> b!763641 (=> (not res!516687) (not e!425375))))

(assert (=> b!763641 (= res!516687 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20622 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20622 a!3186))))))

(declare-fun b!763642 () Bool)

(declare-fun res!516684 () Bool)

(assert (=> b!763642 (=> (not res!516684) (not e!425374))))

(assert (=> b!763642 (= res!516684 (and (= (size!20622 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20622 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20622 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!516688 () Bool)

(assert (=> start!66264 (=> (not res!516688) (not e!425374))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66264 (= res!516688 (validMask!0 mask!3328))))

(assert (=> start!66264 e!425374))

(assert (=> start!66264 true))

(declare-fun array_inv!16084 (array!42186) Bool)

(assert (=> start!66264 (array_inv!16084 a!3186)))

(declare-fun b!763636 () Bool)

(assert (=> b!763636 (= e!425374 e!425375)))

(declare-fun res!516679 () Bool)

(assert (=> b!763636 (=> (not res!516679) (not e!425375))))

(declare-fun lt!339737 () SeekEntryResult!7798)

(assert (=> b!763636 (= res!516679 (or (= lt!339737 (MissingZero!7798 i!1173)) (= lt!339737 (MissingVacant!7798 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42186 (_ BitVec 32)) SeekEntryResult!7798)

(assert (=> b!763636 (= lt!339737 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!66264 res!516688) b!763642))

(assert (= (and b!763642 res!516684) b!763628))

(assert (= (and b!763628 res!516678) b!763639))

(assert (= (and b!763639 res!516689) b!763632))

(assert (= (and b!763632 res!516681) b!763636))

(assert (= (and b!763636 res!516679) b!763635))

(assert (= (and b!763635 res!516686) b!763637))

(assert (= (and b!763637 res!516683) b!763641))

(assert (= (and b!763641 res!516687) b!763631))

(assert (= (and b!763631 res!516682) b!763629))

(assert (= (and b!763629 res!516680) b!763630))

(assert (= (and b!763630 c!83862) b!763638))

(assert (= (and b!763630 (not c!83862)) b!763633))

(assert (= (and b!763630 res!516677) b!763640))

(assert (= (and b!763640 res!516685) b!763634))

(declare-fun m!709555 () Bool)

(assert (=> b!763637 m!709555))

(declare-fun m!709557 () Bool)

(assert (=> b!763635 m!709557))

(declare-fun m!709559 () Bool)

(assert (=> start!66264 m!709559))

(declare-fun m!709561 () Bool)

(assert (=> start!66264 m!709561))

(declare-fun m!709563 () Bool)

(assert (=> b!763638 m!709563))

(assert (=> b!763638 m!709563))

(declare-fun m!709565 () Bool)

(assert (=> b!763638 m!709565))

(declare-fun m!709567 () Bool)

(assert (=> b!763639 m!709567))

(declare-fun m!709569 () Bool)

(assert (=> b!763629 m!709569))

(assert (=> b!763631 m!709563))

(assert (=> b!763631 m!709563))

(declare-fun m!709571 () Bool)

(assert (=> b!763631 m!709571))

(assert (=> b!763631 m!709571))

(assert (=> b!763631 m!709563))

(declare-fun m!709573 () Bool)

(assert (=> b!763631 m!709573))

(declare-fun m!709575 () Bool)

(assert (=> b!763632 m!709575))

(assert (=> b!763633 m!709563))

(assert (=> b!763633 m!709563))

(declare-fun m!709577 () Bool)

(assert (=> b!763633 m!709577))

(declare-fun m!709579 () Bool)

(assert (=> b!763636 m!709579))

(declare-fun m!709581 () Bool)

(assert (=> b!763640 m!709581))

(declare-fun m!709583 () Bool)

(assert (=> b!763640 m!709583))

(assert (=> b!763640 m!709581))

(declare-fun m!709585 () Bool)

(assert (=> b!763640 m!709585))

(declare-fun m!709587 () Bool)

(assert (=> b!763640 m!709587))

(declare-fun m!709589 () Bool)

(assert (=> b!763640 m!709589))

(assert (=> b!763628 m!709563))

(assert (=> b!763628 m!709563))

(declare-fun m!709591 () Bool)

(assert (=> b!763628 m!709591))

(check-sat (not b!763633) (not b!763639) (not b!763631) (not b!763636) (not b!763635) (not b!763640) (not b!763628) (not b!763638) (not start!66264) (not b!763637) (not b!763632))
(check-sat)
