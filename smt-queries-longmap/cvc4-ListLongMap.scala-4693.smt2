; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65222 () Bool)

(assert start!65222)

(declare-fun b!738772 () Bool)

(declare-fun res!496678 () Bool)

(declare-fun e!413146 () Bool)

(assert (=> b!738772 (=> (not res!496678) (not e!413146))))

(declare-datatypes ((array!41395 0))(
  ( (array!41396 (arr!19811 (Array (_ BitVec 32) (_ BitVec 64))) (size!20232 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41395)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!738772 (= res!496678 (validKeyInArray!0 (select (arr!19811 a!3186) j!159)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!413148 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!738773 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7411 0))(
  ( (MissingZero!7411 (index!32012 (_ BitVec 32))) (Found!7411 (index!32013 (_ BitVec 32))) (Intermediate!7411 (undefined!8223 Bool) (index!32014 (_ BitVec 32)) (x!63001 (_ BitVec 32))) (Undefined!7411) (MissingVacant!7411 (index!32015 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41395 (_ BitVec 32)) SeekEntryResult!7411)

(assert (=> b!738773 (= e!413148 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19811 a!3186) j!159) a!3186 mask!3328) (Found!7411 j!159)))))

(declare-fun b!738774 () Bool)

(declare-fun e!413142 () Bool)

(declare-fun e!413147 () Bool)

(assert (=> b!738774 (= e!413142 e!413147)))

(declare-fun res!496685 () Bool)

(assert (=> b!738774 (=> (not res!496685) (not e!413147))))

(declare-fun lt!327966 () SeekEntryResult!7411)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41395 (_ BitVec 32)) SeekEntryResult!7411)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738774 (= res!496685 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19811 a!3186) j!159) mask!3328) (select (arr!19811 a!3186) j!159) a!3186 mask!3328) lt!327966))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!738774 (= lt!327966 (Intermediate!7411 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!738775 () Bool)

(declare-fun e!413145 () Bool)

(assert (=> b!738775 (= e!413147 e!413145)))

(declare-fun res!496684 () Bool)

(assert (=> b!738775 (=> (not res!496684) (not e!413145))))

(declare-fun lt!327964 () SeekEntryResult!7411)

(declare-fun lt!327970 () SeekEntryResult!7411)

(assert (=> b!738775 (= res!496684 (= lt!327964 lt!327970))))

(declare-fun lt!327967 () array!41395)

(declare-fun lt!327961 () (_ BitVec 64))

(assert (=> b!738775 (= lt!327970 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!327961 lt!327967 mask!3328))))

(assert (=> b!738775 (= lt!327964 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!327961 mask!3328) lt!327961 lt!327967 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!738775 (= lt!327961 (select (store (arr!19811 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!738775 (= lt!327967 (array!41396 (store (arr!19811 a!3186) i!1173 k!2102) (size!20232 a!3186)))))

(declare-fun b!738776 () Bool)

(declare-fun res!496686 () Bool)

(assert (=> b!738776 (=> (not res!496686) (not e!413142))))

(assert (=> b!738776 (= res!496686 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20232 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20232 a!3186))))))

(declare-fun b!738777 () Bool)

(declare-datatypes ((Unit!25240 0))(
  ( (Unit!25241) )
))
(declare-fun e!413143 () Unit!25240)

(declare-fun Unit!25242 () Unit!25240)

(assert (=> b!738777 (= e!413143 Unit!25242)))

(declare-fun lt!327963 () SeekEntryResult!7411)

(assert (=> b!738777 (= lt!327963 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19811 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!327968 () SeekEntryResult!7411)

(declare-fun lt!327960 () (_ BitVec 32))

(assert (=> b!738777 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327960 resIntermediateIndex!5 (select (arr!19811 a!3186) j!159) a!3186 mask!3328) lt!327968)))

(declare-fun b!738779 () Bool)

(declare-fun res!496692 () Bool)

(assert (=> b!738779 (=> (not res!496692) (not e!413146))))

(assert (=> b!738779 (= res!496692 (and (= (size!20232 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20232 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20232 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!738780 () Bool)

(assert (=> b!738780 (= e!413146 e!413142)))

(declare-fun res!496693 () Bool)

(assert (=> b!738780 (=> (not res!496693) (not e!413142))))

(declare-fun lt!327959 () SeekEntryResult!7411)

(assert (=> b!738780 (= res!496693 (or (= lt!327959 (MissingZero!7411 i!1173)) (= lt!327959 (MissingVacant!7411 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41395 (_ BitVec 32)) SeekEntryResult!7411)

(assert (=> b!738780 (= lt!327959 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!738781 () Bool)

(assert (=> b!738781 (= e!413148 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19811 a!3186) j!159) a!3186 mask!3328) lt!327966))))

(declare-fun b!738782 () Bool)

(declare-fun e!413150 () Bool)

(declare-fun e!413140 () Bool)

(assert (=> b!738782 (= e!413150 e!413140)))

(declare-fun res!496680 () Bool)

(assert (=> b!738782 (=> (not res!496680) (not e!413140))))

(declare-fun lt!327971 () SeekEntryResult!7411)

(assert (=> b!738782 (= res!496680 (= (seekEntryOrOpen!0 (select (arr!19811 a!3186) j!159) a!3186 mask!3328) lt!327971))))

(assert (=> b!738782 (= lt!327971 (Found!7411 j!159))))

(declare-fun b!738783 () Bool)

(declare-fun res!496694 () Bool)

(declare-fun e!413139 () Bool)

(assert (=> b!738783 (=> res!496694 e!413139)))

(declare-fun e!413144 () Bool)

(assert (=> b!738783 (= res!496694 e!413144)))

(declare-fun c!81430 () Bool)

(declare-fun lt!327958 () Bool)

(assert (=> b!738783 (= c!81430 lt!327958)))

(declare-fun b!738784 () Bool)

(declare-fun res!496683 () Bool)

(assert (=> b!738784 (=> (not res!496683) (not e!413147))))

(assert (=> b!738784 (= res!496683 e!413148)))

(declare-fun c!81429 () Bool)

(assert (=> b!738784 (= c!81429 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!738785 () Bool)

(declare-fun e!413149 () Bool)

(assert (=> b!738785 (= e!413149 e!413139)))

(declare-fun res!496688 () Bool)

(assert (=> b!738785 (=> res!496688 e!413139)))

(assert (=> b!738785 (= res!496688 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!327960 #b00000000000000000000000000000000) (bvsge lt!327960 (size!20232 a!3186))))))

(declare-fun lt!327965 () Unit!25240)

(assert (=> b!738785 (= lt!327965 e!413143)))

(declare-fun c!81428 () Bool)

(assert (=> b!738785 (= c!81428 lt!327958)))

(assert (=> b!738785 (= lt!327958 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738785 (= lt!327960 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!738786 () Bool)

(assert (=> b!738786 (= e!413144 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327960 resIntermediateIndex!5 (select (arr!19811 a!3186) j!159) a!3186 mask!3328) lt!327968)))))

(declare-fun b!738778 () Bool)

(declare-fun res!496679 () Bool)

(assert (=> b!738778 (=> (not res!496679) (not e!413146))))

(declare-fun arrayContainsKey!0 (array!41395 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!738778 (= res!496679 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!496689 () Bool)

(assert (=> start!65222 (=> (not res!496689) (not e!413146))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65222 (= res!496689 (validMask!0 mask!3328))))

(assert (=> start!65222 e!413146))

(assert (=> start!65222 true))

(declare-fun array_inv!15607 (array!41395) Bool)

(assert (=> start!65222 (array_inv!15607 a!3186)))

(declare-fun b!738787 () Bool)

(declare-fun res!496690 () Bool)

(assert (=> b!738787 (=> (not res!496690) (not e!413147))))

(assert (=> b!738787 (= res!496690 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19811 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!738788 () Bool)

(declare-fun res!496677 () Bool)

(assert (=> b!738788 (=> (not res!496677) (not e!413146))))

(assert (=> b!738788 (= res!496677 (validKeyInArray!0 k!2102))))

(declare-fun b!738789 () Bool)

(assert (=> b!738789 (= e!413144 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327960 (select (arr!19811 a!3186) j!159) a!3186 mask!3328) lt!327966)))))

(declare-fun b!738790 () Bool)

(declare-fun Unit!25243 () Unit!25240)

(assert (=> b!738790 (= e!413143 Unit!25243)))

(assert (=> b!738790 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327960 (select (arr!19811 a!3186) j!159) a!3186 mask!3328) lt!327966)))

(declare-fun b!738791 () Bool)

(declare-fun res!496691 () Bool)

(assert (=> b!738791 (=> (not res!496691) (not e!413142))))

(declare-datatypes ((List!13813 0))(
  ( (Nil!13810) (Cons!13809 (h!14881 (_ BitVec 64)) (t!20128 List!13813)) )
))
(declare-fun arrayNoDuplicates!0 (array!41395 (_ BitVec 32) List!13813) Bool)

(assert (=> b!738791 (= res!496691 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13810))))

(declare-fun b!738792 () Bool)

(assert (=> b!738792 (= e!413145 (not e!413149))))

(declare-fun res!496681 () Bool)

(assert (=> b!738792 (=> res!496681 e!413149)))

(assert (=> b!738792 (= res!496681 (or (not (is-Intermediate!7411 lt!327970)) (bvsge x!1131 (x!63001 lt!327970))))))

(assert (=> b!738792 (= lt!327968 (Found!7411 j!159))))

(assert (=> b!738792 e!413150))

(declare-fun res!496682 () Bool)

(assert (=> b!738792 (=> (not res!496682) (not e!413150))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41395 (_ BitVec 32)) Bool)

(assert (=> b!738792 (= res!496682 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!327969 () Unit!25240)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41395 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25240)

(assert (=> b!738792 (= lt!327969 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!738793 () Bool)

(declare-fun res!496687 () Bool)

(assert (=> b!738793 (=> (not res!496687) (not e!413142))))

(assert (=> b!738793 (= res!496687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!738794 () Bool)

(assert (=> b!738794 (= e!413140 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19811 a!3186) j!159) a!3186 mask!3328) lt!327971))))

(declare-fun b!738795 () Bool)

(assert (=> b!738795 (= e!413139 true)))

(declare-fun lt!327962 () SeekEntryResult!7411)

(assert (=> b!738795 (= lt!327962 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327960 lt!327961 lt!327967 mask!3328))))

(assert (= (and start!65222 res!496689) b!738779))

(assert (= (and b!738779 res!496692) b!738772))

(assert (= (and b!738772 res!496678) b!738788))

(assert (= (and b!738788 res!496677) b!738778))

(assert (= (and b!738778 res!496679) b!738780))

(assert (= (and b!738780 res!496693) b!738793))

(assert (= (and b!738793 res!496687) b!738791))

(assert (= (and b!738791 res!496691) b!738776))

(assert (= (and b!738776 res!496686) b!738774))

(assert (= (and b!738774 res!496685) b!738787))

(assert (= (and b!738787 res!496690) b!738784))

(assert (= (and b!738784 c!81429) b!738781))

(assert (= (and b!738784 (not c!81429)) b!738773))

(assert (= (and b!738784 res!496683) b!738775))

(assert (= (and b!738775 res!496684) b!738792))

(assert (= (and b!738792 res!496682) b!738782))

(assert (= (and b!738782 res!496680) b!738794))

(assert (= (and b!738792 (not res!496681)) b!738785))

(assert (= (and b!738785 c!81428) b!738790))

(assert (= (and b!738785 (not c!81428)) b!738777))

(assert (= (and b!738785 (not res!496688)) b!738783))

(assert (= (and b!738783 c!81430) b!738789))

(assert (= (and b!738783 (not c!81430)) b!738786))

(assert (= (and b!738783 (not res!496694)) b!738795))

(declare-fun m!690319 () Bool)

(assert (=> b!738795 m!690319))

(declare-fun m!690321 () Bool)

(assert (=> b!738792 m!690321))

(declare-fun m!690323 () Bool)

(assert (=> b!738792 m!690323))

(declare-fun m!690325 () Bool)

(assert (=> b!738794 m!690325))

(assert (=> b!738794 m!690325))

(declare-fun m!690327 () Bool)

(assert (=> b!738794 m!690327))

(assert (=> b!738789 m!690325))

(assert (=> b!738789 m!690325))

(declare-fun m!690329 () Bool)

(assert (=> b!738789 m!690329))

(assert (=> b!738777 m!690325))

(assert (=> b!738777 m!690325))

(declare-fun m!690331 () Bool)

(assert (=> b!738777 m!690331))

(assert (=> b!738777 m!690325))

(declare-fun m!690333 () Bool)

(assert (=> b!738777 m!690333))

(declare-fun m!690335 () Bool)

(assert (=> start!65222 m!690335))

(declare-fun m!690337 () Bool)

(assert (=> start!65222 m!690337))

(declare-fun m!690339 () Bool)

(assert (=> b!738788 m!690339))

(assert (=> b!738773 m!690325))

(assert (=> b!738773 m!690325))

(assert (=> b!738773 m!690331))

(declare-fun m!690341 () Bool)

(assert (=> b!738785 m!690341))

(assert (=> b!738774 m!690325))

(assert (=> b!738774 m!690325))

(declare-fun m!690343 () Bool)

(assert (=> b!738774 m!690343))

(assert (=> b!738774 m!690343))

(assert (=> b!738774 m!690325))

(declare-fun m!690345 () Bool)

(assert (=> b!738774 m!690345))

(declare-fun m!690347 () Bool)

(assert (=> b!738793 m!690347))

(declare-fun m!690349 () Bool)

(assert (=> b!738787 m!690349))

(assert (=> b!738772 m!690325))

(assert (=> b!738772 m!690325))

(declare-fun m!690351 () Bool)

(assert (=> b!738772 m!690351))

(assert (=> b!738781 m!690325))

(assert (=> b!738781 m!690325))

(declare-fun m!690353 () Bool)

(assert (=> b!738781 m!690353))

(declare-fun m!690355 () Bool)

(assert (=> b!738778 m!690355))

(assert (=> b!738786 m!690325))

(assert (=> b!738786 m!690325))

(assert (=> b!738786 m!690333))

(assert (=> b!738782 m!690325))

(assert (=> b!738782 m!690325))

(declare-fun m!690357 () Bool)

(assert (=> b!738782 m!690357))

(declare-fun m!690359 () Bool)

(assert (=> b!738791 m!690359))

(declare-fun m!690361 () Bool)

(assert (=> b!738780 m!690361))

(assert (=> b!738790 m!690325))

(assert (=> b!738790 m!690325))

(assert (=> b!738790 m!690329))

(declare-fun m!690363 () Bool)

(assert (=> b!738775 m!690363))

(declare-fun m!690365 () Bool)

(assert (=> b!738775 m!690365))

(assert (=> b!738775 m!690363))

(declare-fun m!690367 () Bool)

(assert (=> b!738775 m!690367))

(declare-fun m!690369 () Bool)

(assert (=> b!738775 m!690369))

(declare-fun m!690371 () Bool)

(assert (=> b!738775 m!690371))

(push 1)

