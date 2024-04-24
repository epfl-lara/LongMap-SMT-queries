; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65412 () Bool)

(assert start!65412)

(declare-fun b!741780 () Bool)

(declare-fun res!498696 () Bool)

(declare-fun e!414741 () Bool)

(assert (=> b!741780 (=> (not res!498696) (not e!414741))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41455 0))(
  ( (array!41456 (arr!19837 (Array (_ BitVec 32) (_ BitVec 64))) (size!20257 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41455)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!741780 (= res!498696 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19837 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!741781 () Bool)

(declare-fun res!498704 () Bool)

(assert (=> b!741781 (=> (not res!498704) (not e!414741))))

(declare-fun e!414738 () Bool)

(assert (=> b!741781 (= res!498704 e!414738)))

(declare-fun c!81926 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!741781 (= c!81926 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!741783 () Bool)

(declare-fun e!414735 () Bool)

(declare-fun e!414734 () Bool)

(assert (=> b!741783 (= e!414735 e!414734)))

(declare-fun res!498703 () Bool)

(assert (=> b!741783 (=> (not res!498703) (not e!414734))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7393 0))(
  ( (MissingZero!7393 (index!31940 (_ BitVec 32))) (Found!7393 (index!31941 (_ BitVec 32))) (Intermediate!7393 (undefined!8205 Bool) (index!31942 (_ BitVec 32)) (x!63083 (_ BitVec 32))) (Undefined!7393) (MissingVacant!7393 (index!31943 (_ BitVec 32))) )
))
(declare-fun lt!329562 () SeekEntryResult!7393)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41455 (_ BitVec 32)) SeekEntryResult!7393)

(assert (=> b!741783 (= res!498703 (= (seekEntryOrOpen!0 (select (arr!19837 a!3186) j!159) a!3186 mask!3328) lt!329562))))

(assert (=> b!741783 (= lt!329562 (Found!7393 j!159))))

(declare-fun b!741784 () Bool)

(declare-fun res!498695 () Bool)

(declare-fun e!414740 () Bool)

(assert (=> b!741784 (=> (not res!498695) (not e!414740))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!741784 (= res!498695 (validKeyInArray!0 k0!2102))))

(declare-fun b!741785 () Bool)

(declare-fun res!498709 () Bool)

(assert (=> b!741785 (=> (not res!498709) (not e!414740))))

(declare-fun arrayContainsKey!0 (array!41455 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!741785 (= res!498709 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!741786 () Bool)

(declare-fun e!414736 () Bool)

(assert (=> b!741786 (= e!414740 e!414736)))

(declare-fun res!498708 () Bool)

(assert (=> b!741786 (=> (not res!498708) (not e!414736))))

(declare-fun lt!329560 () SeekEntryResult!7393)

(assert (=> b!741786 (= res!498708 (or (= lt!329560 (MissingZero!7393 i!1173)) (= lt!329560 (MissingVacant!7393 i!1173))))))

(assert (=> b!741786 (= lt!329560 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!741787 () Bool)

(declare-fun res!498707 () Bool)

(assert (=> b!741787 (=> (not res!498707) (not e!414740))))

(assert (=> b!741787 (= res!498707 (and (= (size!20257 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20257 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20257 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!741788 () Bool)

(declare-fun res!498698 () Bool)

(assert (=> b!741788 (=> (not res!498698) (not e!414736))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!741788 (= res!498698 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20257 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20257 a!3186))))))

(declare-fun b!741789 () Bool)

(declare-fun e!414739 () Bool)

(assert (=> b!741789 (= e!414741 e!414739)))

(declare-fun res!498705 () Bool)

(assert (=> b!741789 (=> (not res!498705) (not e!414739))))

(declare-fun lt!329559 () array!41455)

(declare-fun lt!329557 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41455 (_ BitVec 32)) SeekEntryResult!7393)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!741789 (= res!498705 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329557 mask!3328) lt!329557 lt!329559 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329557 lt!329559 mask!3328)))))

(assert (=> b!741789 (= lt!329557 (select (store (arr!19837 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!741789 (= lt!329559 (array!41456 (store (arr!19837 a!3186) i!1173 k0!2102) (size!20257 a!3186)))))

(declare-fun b!741790 () Bool)

(assert (=> b!741790 (= e!414736 e!414741)))

(declare-fun res!498702 () Bool)

(assert (=> b!741790 (=> (not res!498702) (not e!414741))))

(declare-fun lt!329561 () SeekEntryResult!7393)

(assert (=> b!741790 (= res!498702 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19837 a!3186) j!159) mask!3328) (select (arr!19837 a!3186) j!159) a!3186 mask!3328) lt!329561))))

(assert (=> b!741790 (= lt!329561 (Intermediate!7393 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!741791 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41455 (_ BitVec 32)) SeekEntryResult!7393)

(assert (=> b!741791 (= e!414738 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19837 a!3186) j!159) a!3186 mask!3328) (Found!7393 j!159)))))

(declare-fun b!741792 () Bool)

(assert (=> b!741792 (= e!414739 (not true))))

(assert (=> b!741792 e!414735))

(declare-fun res!498699 () Bool)

(assert (=> b!741792 (=> (not res!498699) (not e!414735))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41455 (_ BitVec 32)) Bool)

(assert (=> b!741792 (= res!498699 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25345 0))(
  ( (Unit!25346) )
))
(declare-fun lt!329558 () Unit!25345)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41455 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25345)

(assert (=> b!741792 (= lt!329558 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!741793 () Bool)

(assert (=> b!741793 (= e!414734 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19837 a!3186) j!159) a!3186 mask!3328) lt!329562))))

(declare-fun b!741794 () Bool)

(assert (=> b!741794 (= e!414738 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19837 a!3186) j!159) a!3186 mask!3328) lt!329561))))

(declare-fun res!498697 () Bool)

(assert (=> start!65412 (=> (not res!498697) (not e!414740))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65412 (= res!498697 (validMask!0 mask!3328))))

(assert (=> start!65412 e!414740))

(assert (=> start!65412 true))

(declare-fun array_inv!15696 (array!41455) Bool)

(assert (=> start!65412 (array_inv!15696 a!3186)))

(declare-fun b!741782 () Bool)

(declare-fun res!498706 () Bool)

(assert (=> b!741782 (=> (not res!498706) (not e!414736))))

(assert (=> b!741782 (= res!498706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!741795 () Bool)

(declare-fun res!498701 () Bool)

(assert (=> b!741795 (=> (not res!498701) (not e!414736))))

(declare-datatypes ((List!13746 0))(
  ( (Nil!13743) (Cons!13742 (h!14820 (_ BitVec 64)) (t!20053 List!13746)) )
))
(declare-fun arrayNoDuplicates!0 (array!41455 (_ BitVec 32) List!13746) Bool)

(assert (=> b!741795 (= res!498701 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13743))))

(declare-fun b!741796 () Bool)

(declare-fun res!498700 () Bool)

(assert (=> b!741796 (=> (not res!498700) (not e!414740))))

(assert (=> b!741796 (= res!498700 (validKeyInArray!0 (select (arr!19837 a!3186) j!159)))))

(assert (= (and start!65412 res!498697) b!741787))

(assert (= (and b!741787 res!498707) b!741796))

(assert (= (and b!741796 res!498700) b!741784))

(assert (= (and b!741784 res!498695) b!741785))

(assert (= (and b!741785 res!498709) b!741786))

(assert (= (and b!741786 res!498708) b!741782))

(assert (= (and b!741782 res!498706) b!741795))

(assert (= (and b!741795 res!498701) b!741788))

(assert (= (and b!741788 res!498698) b!741790))

(assert (= (and b!741790 res!498702) b!741780))

(assert (= (and b!741780 res!498696) b!741781))

(assert (= (and b!741781 c!81926) b!741794))

(assert (= (and b!741781 (not c!81926)) b!741791))

(assert (= (and b!741781 res!498704) b!741789))

(assert (= (and b!741789 res!498705) b!741792))

(assert (= (and b!741792 res!498699) b!741783))

(assert (= (and b!741783 res!498703) b!741793))

(declare-fun m!693207 () Bool)

(assert (=> b!741784 m!693207))

(declare-fun m!693209 () Bool)

(assert (=> b!741780 m!693209))

(declare-fun m!693211 () Bool)

(assert (=> b!741794 m!693211))

(assert (=> b!741794 m!693211))

(declare-fun m!693213 () Bool)

(assert (=> b!741794 m!693213))

(assert (=> b!741796 m!693211))

(assert (=> b!741796 m!693211))

(declare-fun m!693215 () Bool)

(assert (=> b!741796 m!693215))

(declare-fun m!693217 () Bool)

(assert (=> b!741789 m!693217))

(declare-fun m!693219 () Bool)

(assert (=> b!741789 m!693219))

(declare-fun m!693221 () Bool)

(assert (=> b!741789 m!693221))

(declare-fun m!693223 () Bool)

(assert (=> b!741789 m!693223))

(assert (=> b!741789 m!693217))

(declare-fun m!693225 () Bool)

(assert (=> b!741789 m!693225))

(declare-fun m!693227 () Bool)

(assert (=> b!741782 m!693227))

(assert (=> b!741793 m!693211))

(assert (=> b!741793 m!693211))

(declare-fun m!693229 () Bool)

(assert (=> b!741793 m!693229))

(declare-fun m!693231 () Bool)

(assert (=> b!741786 m!693231))

(declare-fun m!693233 () Bool)

(assert (=> b!741792 m!693233))

(declare-fun m!693235 () Bool)

(assert (=> b!741792 m!693235))

(declare-fun m!693237 () Bool)

(assert (=> b!741785 m!693237))

(declare-fun m!693239 () Bool)

(assert (=> start!65412 m!693239))

(declare-fun m!693241 () Bool)

(assert (=> start!65412 m!693241))

(assert (=> b!741783 m!693211))

(assert (=> b!741783 m!693211))

(declare-fun m!693243 () Bool)

(assert (=> b!741783 m!693243))

(declare-fun m!693245 () Bool)

(assert (=> b!741795 m!693245))

(assert (=> b!741791 m!693211))

(assert (=> b!741791 m!693211))

(declare-fun m!693247 () Bool)

(assert (=> b!741791 m!693247))

(assert (=> b!741790 m!693211))

(assert (=> b!741790 m!693211))

(declare-fun m!693249 () Bool)

(assert (=> b!741790 m!693249))

(assert (=> b!741790 m!693249))

(assert (=> b!741790 m!693211))

(declare-fun m!693251 () Bool)

(assert (=> b!741790 m!693251))

(check-sat (not b!741783) (not b!741796) (not b!741791) (not b!741794) (not b!741786) (not b!741793) (not b!741795) (not start!65412) (not b!741789) (not b!741790) (not b!741782) (not b!741784) (not b!741785) (not b!741792))
(check-sat)
