; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66886 () Bool)

(assert start!66886)

(declare-fun b!770081 () Bool)

(declare-datatypes ((Unit!26455 0))(
  ( (Unit!26456) )
))
(declare-fun e!428871 () Unit!26455)

(declare-fun Unit!26457 () Unit!26455)

(assert (=> b!770081 (= e!428871 Unit!26457)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42328 0))(
  ( (array!42329 (arr!20260 (Array (_ BitVec 32) (_ BitVec 64))) (size!20680 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42328)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7816 0))(
  ( (MissingZero!7816 (index!33632 (_ BitVec 32))) (Found!7816 (index!33633 (_ BitVec 32))) (Intermediate!7816 (undefined!8628 Bool) (index!33634 (_ BitVec 32)) (x!64726 (_ BitVec 32))) (Undefined!7816) (MissingVacant!7816 (index!33635 (_ BitVec 32))) )
))
(declare-fun lt!342615 () SeekEntryResult!7816)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42328 (_ BitVec 32)) SeekEntryResult!7816)

(assert (=> b!770081 (= lt!342615 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20260 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!342620 () (_ BitVec 32))

(assert (=> b!770081 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342620 resIntermediateIndex!5 (select (arr!20260 a!3186) j!159) a!3186 mask!3328) (Found!7816 j!159))))

(declare-fun b!770082 () Bool)

(declare-fun e!428870 () Bool)

(declare-fun e!428873 () Bool)

(assert (=> b!770082 (= e!428870 e!428873)))

(declare-fun res!520634 () Bool)

(assert (=> b!770082 (=> (not res!520634) (not e!428873))))

(declare-fun lt!342618 () SeekEntryResult!7816)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42328 (_ BitVec 32)) SeekEntryResult!7816)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770082 (= res!520634 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20260 a!3186) j!159) mask!3328) (select (arr!20260 a!3186) j!159) a!3186 mask!3328) lt!342618))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!770082 (= lt!342618 (Intermediate!7816 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!770083 () Bool)

(declare-fun e!428868 () Bool)

(assert (=> b!770083 (= e!428868 true)))

(declare-fun lt!342622 () Unit!26455)

(assert (=> b!770083 (= lt!342622 e!428871)))

(declare-fun c!85129 () Bool)

(assert (=> b!770083 (= c!85129 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770083 (= lt!342620 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!770084 () Bool)

(declare-fun res!520630 () Bool)

(declare-fun e!428874 () Bool)

(assert (=> b!770084 (=> (not res!520630) (not e!428874))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!770084 (= res!520630 (and (= (size!20680 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20680 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20680 a!3186)) (not (= i!1173 j!159))))))

(declare-fun e!428867 () Bool)

(declare-fun b!770085 () Bool)

(assert (=> b!770085 (= e!428867 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20260 a!3186) j!159) a!3186 mask!3328) lt!342618))))

(declare-fun b!770086 () Bool)

(declare-fun res!520625 () Bool)

(assert (=> b!770086 (=> (not res!520625) (not e!428873))))

(assert (=> b!770086 (= res!520625 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20260 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!770087 () Bool)

(declare-fun res!520632 () Bool)

(assert (=> b!770087 (=> (not res!520632) (not e!428874))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!770087 (= res!520632 (validKeyInArray!0 (select (arr!20260 a!3186) j!159)))))

(declare-fun b!770088 () Bool)

(declare-fun res!520627 () Bool)

(assert (=> b!770088 (=> (not res!520627) (not e!428870))))

(declare-datatypes ((List!14169 0))(
  ( (Nil!14166) (Cons!14165 (h!15270 (_ BitVec 64)) (t!20476 List!14169)) )
))
(declare-fun arrayNoDuplicates!0 (array!42328 (_ BitVec 32) List!14169) Bool)

(assert (=> b!770088 (= res!520627 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14166))))

(declare-fun b!770089 () Bool)

(declare-fun lt!342619 () SeekEntryResult!7816)

(declare-fun e!428869 () Bool)

(assert (=> b!770089 (= e!428869 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20260 a!3186) j!159) a!3186 mask!3328) lt!342619))))

(declare-fun b!770090 () Bool)

(declare-fun res!520621 () Bool)

(assert (=> b!770090 (=> (not res!520621) (not e!428870))))

(assert (=> b!770090 (= res!520621 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20680 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20680 a!3186))))))

(declare-fun b!770091 () Bool)

(declare-fun Unit!26458 () Unit!26455)

(assert (=> b!770091 (= e!428871 Unit!26458)))

(assert (=> b!770091 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342620 (select (arr!20260 a!3186) j!159) a!3186 mask!3328) lt!342618)))

(declare-fun b!770092 () Bool)

(declare-fun res!520620 () Bool)

(assert (=> b!770092 (=> (not res!520620) (not e!428870))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42328 (_ BitVec 32)) Bool)

(assert (=> b!770092 (= res!520620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!520626 () Bool)

(assert (=> start!66886 (=> (not res!520626) (not e!428874))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66886 (= res!520626 (validMask!0 mask!3328))))

(assert (=> start!66886 e!428874))

(assert (=> start!66886 true))

(declare-fun array_inv!16119 (array!42328) Bool)

(assert (=> start!66886 (array_inv!16119 a!3186)))

(declare-fun b!770093 () Bool)

(assert (=> b!770093 (= e!428874 e!428870)))

(declare-fun res!520628 () Bool)

(assert (=> b!770093 (=> (not res!520628) (not e!428870))))

(declare-fun lt!342621 () SeekEntryResult!7816)

(assert (=> b!770093 (= res!520628 (or (= lt!342621 (MissingZero!7816 i!1173)) (= lt!342621 (MissingVacant!7816 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42328 (_ BitVec 32)) SeekEntryResult!7816)

(assert (=> b!770093 (= lt!342621 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!770094 () Bool)

(declare-fun e!428872 () Bool)

(assert (=> b!770094 (= e!428872 (not e!428868))))

(declare-fun res!520622 () Bool)

(assert (=> b!770094 (=> res!520622 e!428868)))

(declare-fun lt!342624 () SeekEntryResult!7816)

(get-info :version)

(assert (=> b!770094 (= res!520622 (or (not ((_ is Intermediate!7816) lt!342624)) (bvsge x!1131 (x!64726 lt!342624))))))

(declare-fun e!428866 () Bool)

(assert (=> b!770094 e!428866))

(declare-fun res!520629 () Bool)

(assert (=> b!770094 (=> (not res!520629) (not e!428866))))

(assert (=> b!770094 (= res!520629 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!342623 () Unit!26455)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42328 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26455)

(assert (=> b!770094 (= lt!342623 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!770095 () Bool)

(declare-fun res!520623 () Bool)

(assert (=> b!770095 (=> (not res!520623) (not e!428874))))

(declare-fun arrayContainsKey!0 (array!42328 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!770095 (= res!520623 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!770096 () Bool)

(declare-fun res!520633 () Bool)

(assert (=> b!770096 (=> (not res!520633) (not e!428874))))

(assert (=> b!770096 (= res!520633 (validKeyInArray!0 k0!2102))))

(declare-fun b!770097 () Bool)

(assert (=> b!770097 (= e!428873 e!428872)))

(declare-fun res!520631 () Bool)

(assert (=> b!770097 (=> (not res!520631) (not e!428872))))

(declare-fun lt!342616 () SeekEntryResult!7816)

(assert (=> b!770097 (= res!520631 (= lt!342616 lt!342624))))

(declare-fun lt!342625 () (_ BitVec 64))

(declare-fun lt!342617 () array!42328)

(assert (=> b!770097 (= lt!342624 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342625 lt!342617 mask!3328))))

(assert (=> b!770097 (= lt!342616 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342625 mask!3328) lt!342625 lt!342617 mask!3328))))

(assert (=> b!770097 (= lt!342625 (select (store (arr!20260 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!770097 (= lt!342617 (array!42329 (store (arr!20260 a!3186) i!1173 k0!2102) (size!20680 a!3186)))))

(declare-fun b!770098 () Bool)

(assert (=> b!770098 (= e!428867 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20260 a!3186) j!159) a!3186 mask!3328) (Found!7816 j!159)))))

(declare-fun b!770099 () Bool)

(declare-fun res!520635 () Bool)

(assert (=> b!770099 (=> (not res!520635) (not e!428873))))

(assert (=> b!770099 (= res!520635 e!428867)))

(declare-fun c!85130 () Bool)

(assert (=> b!770099 (= c!85130 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!770100 () Bool)

(assert (=> b!770100 (= e!428866 e!428869)))

(declare-fun res!520624 () Bool)

(assert (=> b!770100 (=> (not res!520624) (not e!428869))))

(assert (=> b!770100 (= res!520624 (= (seekEntryOrOpen!0 (select (arr!20260 a!3186) j!159) a!3186 mask!3328) lt!342619))))

(assert (=> b!770100 (= lt!342619 (Found!7816 j!159))))

(assert (= (and start!66886 res!520626) b!770084))

(assert (= (and b!770084 res!520630) b!770087))

(assert (= (and b!770087 res!520632) b!770096))

(assert (= (and b!770096 res!520633) b!770095))

(assert (= (and b!770095 res!520623) b!770093))

(assert (= (and b!770093 res!520628) b!770092))

(assert (= (and b!770092 res!520620) b!770088))

(assert (= (and b!770088 res!520627) b!770090))

(assert (= (and b!770090 res!520621) b!770082))

(assert (= (and b!770082 res!520634) b!770086))

(assert (= (and b!770086 res!520625) b!770099))

(assert (= (and b!770099 c!85130) b!770085))

(assert (= (and b!770099 (not c!85130)) b!770098))

(assert (= (and b!770099 res!520635) b!770097))

(assert (= (and b!770097 res!520631) b!770094))

(assert (= (and b!770094 res!520629) b!770100))

(assert (= (and b!770100 res!520624) b!770089))

(assert (= (and b!770094 (not res!520622)) b!770083))

(assert (= (and b!770083 c!85129) b!770091))

(assert (= (and b!770083 (not c!85129)) b!770081))

(declare-fun m!715895 () Bool)

(assert (=> b!770093 m!715895))

(declare-fun m!715897 () Bool)

(assert (=> b!770096 m!715897))

(declare-fun m!715899 () Bool)

(assert (=> b!770087 m!715899))

(assert (=> b!770087 m!715899))

(declare-fun m!715901 () Bool)

(assert (=> b!770087 m!715901))

(declare-fun m!715903 () Bool)

(assert (=> b!770086 m!715903))

(assert (=> b!770089 m!715899))

(assert (=> b!770089 m!715899))

(declare-fun m!715905 () Bool)

(assert (=> b!770089 m!715905))

(assert (=> b!770091 m!715899))

(assert (=> b!770091 m!715899))

(declare-fun m!715907 () Bool)

(assert (=> b!770091 m!715907))

(assert (=> b!770098 m!715899))

(assert (=> b!770098 m!715899))

(declare-fun m!715909 () Bool)

(assert (=> b!770098 m!715909))

(declare-fun m!715911 () Bool)

(assert (=> start!66886 m!715911))

(declare-fun m!715913 () Bool)

(assert (=> start!66886 m!715913))

(declare-fun m!715915 () Bool)

(assert (=> b!770094 m!715915))

(declare-fun m!715917 () Bool)

(assert (=> b!770094 m!715917))

(declare-fun m!715919 () Bool)

(assert (=> b!770088 m!715919))

(declare-fun m!715921 () Bool)

(assert (=> b!770097 m!715921))

(declare-fun m!715923 () Bool)

(assert (=> b!770097 m!715923))

(assert (=> b!770097 m!715923))

(declare-fun m!715925 () Bool)

(assert (=> b!770097 m!715925))

(declare-fun m!715927 () Bool)

(assert (=> b!770097 m!715927))

(declare-fun m!715929 () Bool)

(assert (=> b!770097 m!715929))

(assert (=> b!770082 m!715899))

(assert (=> b!770082 m!715899))

(declare-fun m!715931 () Bool)

(assert (=> b!770082 m!715931))

(assert (=> b!770082 m!715931))

(assert (=> b!770082 m!715899))

(declare-fun m!715933 () Bool)

(assert (=> b!770082 m!715933))

(assert (=> b!770085 m!715899))

(assert (=> b!770085 m!715899))

(declare-fun m!715935 () Bool)

(assert (=> b!770085 m!715935))

(declare-fun m!715937 () Bool)

(assert (=> b!770092 m!715937))

(declare-fun m!715939 () Bool)

(assert (=> b!770083 m!715939))

(assert (=> b!770100 m!715899))

(assert (=> b!770100 m!715899))

(declare-fun m!715941 () Bool)

(assert (=> b!770100 m!715941))

(declare-fun m!715943 () Bool)

(assert (=> b!770095 m!715943))

(assert (=> b!770081 m!715899))

(assert (=> b!770081 m!715899))

(assert (=> b!770081 m!715909))

(assert (=> b!770081 m!715899))

(declare-fun m!715945 () Bool)

(assert (=> b!770081 m!715945))

(check-sat (not b!770095) (not b!770081) (not b!770092) (not b!770098) (not b!770083) (not b!770096) (not b!770082) (not b!770094) (not start!66886) (not b!770089) (not b!770091) (not b!770088) (not b!770097) (not b!770093) (not b!770100) (not b!770087) (not b!770085))
(check-sat)
