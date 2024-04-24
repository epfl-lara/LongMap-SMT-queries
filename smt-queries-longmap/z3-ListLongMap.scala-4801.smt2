; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65994 () Bool)

(assert start!65994)

(declare-fun res!514033 () Bool)

(declare-fun e!423732 () Bool)

(assert (=> start!65994 (=> (not res!514033) (not e!423732))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65994 (= res!514033 (validMask!0 mask!3328))))

(assert (=> start!65994 e!423732))

(assert (=> start!65994 true))

(declare-datatypes ((array!42037 0))(
  ( (array!42038 (arr!20128 (Array (_ BitVec 32) (_ BitVec 64))) (size!20548 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42037)

(declare-fun array_inv!15987 (array!42037) Bool)

(assert (=> start!65994 (array_inv!15987 a!3186)))

(declare-fun b!759942 () Bool)

(declare-fun res!514037 () Bool)

(declare-fun e!423727 () Bool)

(assert (=> b!759942 (=> (not res!514037) (not e!423727))))

(declare-datatypes ((List!14037 0))(
  ( (Nil!14034) (Cons!14033 (h!15111 (_ BitVec 64)) (t!20344 List!14037)) )
))
(declare-fun arrayNoDuplicates!0 (array!42037 (_ BitVec 32) List!14037) Bool)

(assert (=> b!759942 (= res!514037 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14034))))

(declare-fun b!759943 () Bool)

(declare-fun res!514036 () Bool)

(assert (=> b!759943 (=> (not res!514036) (not e!423727))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!759943 (= res!514036 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20548 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20548 a!3186))))))

(declare-fun b!759944 () Bool)

(declare-fun res!514038 () Bool)

(assert (=> b!759944 (=> (not res!514038) (not e!423732))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!759944 (= res!514038 (and (= (size!20548 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20548 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20548 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!759945 () Bool)

(declare-fun res!514040 () Bool)

(assert (=> b!759945 (=> (not res!514040) (not e!423732))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42037 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!759945 (= res!514040 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!7684 0))(
  ( (MissingZero!7684 (index!33104 (_ BitVec 32))) (Found!7684 (index!33105 (_ BitVec 32))) (Intermediate!7684 (undefined!8496 Bool) (index!33106 (_ BitVec 32)) (x!64150 (_ BitVec 32))) (Undefined!7684) (MissingVacant!7684 (index!33107 (_ BitVec 32))) )
))
(declare-fun lt!338631 () SeekEntryResult!7684)

(declare-fun e!423726 () Bool)

(declare-fun b!759946 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42037 (_ BitVec 32)) SeekEntryResult!7684)

(assert (=> b!759946 (= e!423726 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20128 a!3186) j!159) a!3186 mask!3328) lt!338631))))

(declare-fun b!759947 () Bool)

(declare-fun e!423730 () Bool)

(declare-fun lt!338629 () SeekEntryResult!7684)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42037 (_ BitVec 32)) SeekEntryResult!7684)

(assert (=> b!759947 (= e!423730 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20128 a!3186) j!159) a!3186 mask!3328) lt!338629))))

(declare-fun b!759948 () Bool)

(declare-fun res!514045 () Bool)

(assert (=> b!759948 (=> (not res!514045) (not e!423732))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!759948 (= res!514045 (validKeyInArray!0 k0!2102))))

(declare-fun b!759949 () Bool)

(declare-fun e!423725 () Bool)

(assert (=> b!759949 (= e!423725 (not true))))

(declare-fun e!423729 () Bool)

(assert (=> b!759949 e!423729))

(declare-fun res!514042 () Bool)

(assert (=> b!759949 (=> (not res!514042) (not e!423729))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42037 (_ BitVec 32)) Bool)

(assert (=> b!759949 (= res!514042 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26287 0))(
  ( (Unit!26288) )
))
(declare-fun lt!338632 () Unit!26287)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42037 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26287)

(assert (=> b!759949 (= lt!338632 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!759950 () Bool)

(declare-fun e!423731 () Bool)

(assert (=> b!759950 (= e!423727 e!423731)))

(declare-fun res!514034 () Bool)

(assert (=> b!759950 (=> (not res!514034) (not e!423731))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!759950 (= res!514034 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20128 a!3186) j!159) mask!3328) (select (arr!20128 a!3186) j!159) a!3186 mask!3328) lt!338631))))

(assert (=> b!759950 (= lt!338631 (Intermediate!7684 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!759951 () Bool)

(assert (=> b!759951 (= e!423729 e!423730)))

(declare-fun res!514035 () Bool)

(assert (=> b!759951 (=> (not res!514035) (not e!423730))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42037 (_ BitVec 32)) SeekEntryResult!7684)

(assert (=> b!759951 (= res!514035 (= (seekEntryOrOpen!0 (select (arr!20128 a!3186) j!159) a!3186 mask!3328) lt!338629))))

(assert (=> b!759951 (= lt!338629 (Found!7684 j!159))))

(declare-fun b!759952 () Bool)

(declare-fun res!514043 () Bool)

(assert (=> b!759952 (=> (not res!514043) (not e!423727))))

(assert (=> b!759952 (= res!514043 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!759953 () Bool)

(assert (=> b!759953 (= e!423731 e!423725)))

(declare-fun res!514032 () Bool)

(assert (=> b!759953 (=> (not res!514032) (not e!423725))))

(declare-fun lt!338630 () array!42037)

(declare-fun lt!338634 () (_ BitVec 64))

(assert (=> b!759953 (= res!514032 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338634 mask!3328) lt!338634 lt!338630 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338634 lt!338630 mask!3328)))))

(assert (=> b!759953 (= lt!338634 (select (store (arr!20128 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!759953 (= lt!338630 (array!42038 (store (arr!20128 a!3186) i!1173 k0!2102) (size!20548 a!3186)))))

(declare-fun b!759954 () Bool)

(declare-fun res!514044 () Bool)

(assert (=> b!759954 (=> (not res!514044) (not e!423731))))

(assert (=> b!759954 (= res!514044 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20128 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!759955 () Bool)

(declare-fun res!514031 () Bool)

(assert (=> b!759955 (=> (not res!514031) (not e!423732))))

(assert (=> b!759955 (= res!514031 (validKeyInArray!0 (select (arr!20128 a!3186) j!159)))))

(declare-fun b!759956 () Bool)

(assert (=> b!759956 (= e!423726 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20128 a!3186) j!159) a!3186 mask!3328) (Found!7684 j!159)))))

(declare-fun b!759957 () Bool)

(declare-fun res!514041 () Bool)

(assert (=> b!759957 (=> (not res!514041) (not e!423731))))

(assert (=> b!759957 (= res!514041 e!423726)))

(declare-fun c!83339 () Bool)

(assert (=> b!759957 (= c!83339 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!759958 () Bool)

(assert (=> b!759958 (= e!423732 e!423727)))

(declare-fun res!514039 () Bool)

(assert (=> b!759958 (=> (not res!514039) (not e!423727))))

(declare-fun lt!338633 () SeekEntryResult!7684)

(assert (=> b!759958 (= res!514039 (or (= lt!338633 (MissingZero!7684 i!1173)) (= lt!338633 (MissingVacant!7684 i!1173))))))

(assert (=> b!759958 (= lt!338633 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!65994 res!514033) b!759944))

(assert (= (and b!759944 res!514038) b!759955))

(assert (= (and b!759955 res!514031) b!759948))

(assert (= (and b!759948 res!514045) b!759945))

(assert (= (and b!759945 res!514040) b!759958))

(assert (= (and b!759958 res!514039) b!759952))

(assert (= (and b!759952 res!514043) b!759942))

(assert (= (and b!759942 res!514037) b!759943))

(assert (= (and b!759943 res!514036) b!759950))

(assert (= (and b!759950 res!514034) b!759954))

(assert (= (and b!759954 res!514044) b!759957))

(assert (= (and b!759957 c!83339) b!759946))

(assert (= (and b!759957 (not c!83339)) b!759956))

(assert (= (and b!759957 res!514041) b!759953))

(assert (= (and b!759953 res!514032) b!759949))

(assert (= (and b!759949 res!514042) b!759951))

(assert (= (and b!759951 res!514035) b!759947))

(declare-fun m!707739 () Bool)

(assert (=> b!759947 m!707739))

(assert (=> b!759947 m!707739))

(declare-fun m!707741 () Bool)

(assert (=> b!759947 m!707741))

(declare-fun m!707743 () Bool)

(assert (=> b!759948 m!707743))

(declare-fun m!707745 () Bool)

(assert (=> b!759945 m!707745))

(declare-fun m!707747 () Bool)

(assert (=> b!759958 m!707747))

(declare-fun m!707749 () Bool)

(assert (=> b!759953 m!707749))

(assert (=> b!759953 m!707749))

(declare-fun m!707751 () Bool)

(assert (=> b!759953 m!707751))

(declare-fun m!707753 () Bool)

(assert (=> b!759953 m!707753))

(declare-fun m!707755 () Bool)

(assert (=> b!759953 m!707755))

(declare-fun m!707757 () Bool)

(assert (=> b!759953 m!707757))

(assert (=> b!759956 m!707739))

(assert (=> b!759956 m!707739))

(declare-fun m!707759 () Bool)

(assert (=> b!759956 m!707759))

(assert (=> b!759951 m!707739))

(assert (=> b!759951 m!707739))

(declare-fun m!707761 () Bool)

(assert (=> b!759951 m!707761))

(declare-fun m!707763 () Bool)

(assert (=> start!65994 m!707763))

(declare-fun m!707765 () Bool)

(assert (=> start!65994 m!707765))

(assert (=> b!759946 m!707739))

(assert (=> b!759946 m!707739))

(declare-fun m!707767 () Bool)

(assert (=> b!759946 m!707767))

(declare-fun m!707769 () Bool)

(assert (=> b!759942 m!707769))

(declare-fun m!707771 () Bool)

(assert (=> b!759949 m!707771))

(declare-fun m!707773 () Bool)

(assert (=> b!759949 m!707773))

(assert (=> b!759950 m!707739))

(assert (=> b!759950 m!707739))

(declare-fun m!707775 () Bool)

(assert (=> b!759950 m!707775))

(assert (=> b!759950 m!707775))

(assert (=> b!759950 m!707739))

(declare-fun m!707777 () Bool)

(assert (=> b!759950 m!707777))

(assert (=> b!759955 m!707739))

(assert (=> b!759955 m!707739))

(declare-fun m!707779 () Bool)

(assert (=> b!759955 m!707779))

(declare-fun m!707781 () Bool)

(assert (=> b!759954 m!707781))

(declare-fun m!707783 () Bool)

(assert (=> b!759952 m!707783))

(check-sat (not b!759949) (not start!65994) (not b!759942) (not b!759958) (not b!759953) (not b!759950) (not b!759946) (not b!759948) (not b!759956) (not b!759955) (not b!759952) (not b!759947) (not b!759951) (not b!759945))
(check-sat)
