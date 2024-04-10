; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65738 () Bool)

(assert start!65738)

(declare-fun b!754874 () Bool)

(declare-fun res!510149 () Bool)

(declare-fun e!420985 () Bool)

(assert (=> b!754874 (=> (not res!510149) (not e!420985))))

(declare-fun e!420979 () Bool)

(assert (=> b!754874 (= res!510149 e!420979)))

(declare-fun c!82743 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!754874 (= c!82743 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!754875 () Bool)

(declare-fun e!420980 () Bool)

(assert (=> b!754875 (= e!420980 true)))

(declare-fun e!420983 () Bool)

(assert (=> b!754875 e!420983))

(declare-fun res!510165 () Bool)

(assert (=> b!754875 (=> (not res!510165) (not e!420983))))

(declare-fun lt!335978 () (_ BitVec 64))

(assert (=> b!754875 (= res!510165 (= lt!335978 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!26056 0))(
  ( (Unit!26057) )
))
(declare-fun lt!335976 () Unit!26056)

(declare-fun e!420978 () Unit!26056)

(assert (=> b!754875 (= lt!335976 e!420978)))

(declare-fun c!82744 () Bool)

(assert (=> b!754875 (= c!82744 (= lt!335978 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!754876 () Bool)

(declare-datatypes ((SeekEntryResult!7669 0))(
  ( (MissingZero!7669 (index!33044 (_ BitVec 32))) (Found!7669 (index!33045 (_ BitVec 32))) (Intermediate!7669 (undefined!8481 Bool) (index!33046 (_ BitVec 32)) (x!63947 (_ BitVec 32))) (Undefined!7669) (MissingVacant!7669 (index!33047 (_ BitVec 32))) )
))
(declare-fun lt!335981 () SeekEntryResult!7669)

(declare-fun lt!335977 () SeekEntryResult!7669)

(assert (=> b!754876 (= e!420983 (= lt!335981 lt!335977))))

(declare-fun b!754877 () Bool)

(declare-fun res!510151 () Bool)

(declare-fun e!420989 () Bool)

(assert (=> b!754877 (=> (not res!510151) (not e!420989))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!754877 (= res!510151 (validKeyInArray!0 k!2102))))

(declare-fun b!754878 () Bool)

(declare-fun res!510163 () Bool)

(declare-fun e!420988 () Bool)

(assert (=> b!754878 (=> (not res!510163) (not e!420988))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41911 0))(
  ( (array!41912 (arr!20069 (Array (_ BitVec 32) (_ BitVec 64))) (size!20490 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41911)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!754878 (= res!510163 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20490 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20490 a!3186))))))

(declare-fun res!510155 () Bool)

(assert (=> start!65738 (=> (not res!510155) (not e!420989))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65738 (= res!510155 (validMask!0 mask!3328))))

(assert (=> start!65738 e!420989))

(assert (=> start!65738 true))

(declare-fun array_inv!15865 (array!41911) Bool)

(assert (=> start!65738 (array_inv!15865 a!3186)))

(declare-fun b!754879 () Bool)

(declare-fun res!510150 () Bool)

(assert (=> b!754879 (=> (not res!510150) (not e!420985))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!754879 (= res!510150 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20069 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!754880 () Bool)

(declare-fun res!510167 () Bool)

(assert (=> b!754880 (=> (not res!510167) (not e!420989))))

(declare-fun arrayContainsKey!0 (array!41911 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!754880 (= res!510167 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!754881 () Bool)

(declare-fun Unit!26058 () Unit!26056)

(assert (=> b!754881 (= e!420978 Unit!26058)))

(declare-fun b!754882 () Bool)

(declare-fun Unit!26059 () Unit!26056)

(assert (=> b!754882 (= e!420978 Unit!26059)))

(assert (=> b!754882 false))

(declare-fun b!754883 () Bool)

(assert (=> b!754883 (= e!420988 e!420985)))

(declare-fun res!510164 () Bool)

(assert (=> b!754883 (=> (not res!510164) (not e!420985))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!335970 () SeekEntryResult!7669)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41911 (_ BitVec 32)) SeekEntryResult!7669)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!754883 (= res!510164 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20069 a!3186) j!159) mask!3328) (select (arr!20069 a!3186) j!159) a!3186 mask!3328) lt!335970))))

(assert (=> b!754883 (= lt!335970 (Intermediate!7669 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun lt!335974 () SeekEntryResult!7669)

(declare-fun e!420986 () Bool)

(declare-fun b!754884 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41911 (_ BitVec 32)) SeekEntryResult!7669)

(assert (=> b!754884 (= e!420986 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20069 a!3186) j!159) a!3186 mask!3328) lt!335974))))

(declare-fun b!754885 () Bool)

(declare-fun e!420982 () Bool)

(assert (=> b!754885 (= e!420985 e!420982)))

(declare-fun res!510154 () Bool)

(assert (=> b!754885 (=> (not res!510154) (not e!420982))))

(declare-fun lt!335972 () SeekEntryResult!7669)

(declare-fun lt!335980 () SeekEntryResult!7669)

(assert (=> b!754885 (= res!510154 (= lt!335972 lt!335980))))

(declare-fun lt!335979 () (_ BitVec 64))

(declare-fun lt!335973 () array!41911)

(assert (=> b!754885 (= lt!335980 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335979 lt!335973 mask!3328))))

(assert (=> b!754885 (= lt!335972 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335979 mask!3328) lt!335979 lt!335973 mask!3328))))

(assert (=> b!754885 (= lt!335979 (select (store (arr!20069 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!754885 (= lt!335973 (array!41912 (store (arr!20069 a!3186) i!1173 k!2102) (size!20490 a!3186)))))

(declare-fun b!754886 () Bool)

(declare-fun res!510158 () Bool)

(assert (=> b!754886 (=> (not res!510158) (not e!420983))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41911 (_ BitVec 32)) SeekEntryResult!7669)

(assert (=> b!754886 (= res!510158 (= (seekEntryOrOpen!0 lt!335979 lt!335973 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335979 lt!335973 mask!3328)))))

(declare-fun b!754887 () Bool)

(declare-fun res!510153 () Bool)

(assert (=> b!754887 (=> (not res!510153) (not e!420988))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41911 (_ BitVec 32)) Bool)

(assert (=> b!754887 (= res!510153 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!754888 () Bool)

(declare-fun e!420984 () Bool)

(assert (=> b!754888 (= e!420984 e!420980)))

(declare-fun res!510160 () Bool)

(assert (=> b!754888 (=> res!510160 e!420980)))

(assert (=> b!754888 (= res!510160 (= lt!335978 lt!335979))))

(assert (=> b!754888 (= lt!335978 (select (store (arr!20069 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!754889 () Bool)

(declare-fun e!420987 () Bool)

(assert (=> b!754889 (= e!420982 (not e!420987))))

(declare-fun res!510166 () Bool)

(assert (=> b!754889 (=> res!510166 e!420987)))

(assert (=> b!754889 (= res!510166 (or (not (is-Intermediate!7669 lt!335980)) (bvslt x!1131 (x!63947 lt!335980)) (not (= x!1131 (x!63947 lt!335980))) (not (= index!1321 (index!33046 lt!335980)))))))

(assert (=> b!754889 e!420986))

(declare-fun res!510152 () Bool)

(assert (=> b!754889 (=> (not res!510152) (not e!420986))))

(assert (=> b!754889 (= res!510152 (= lt!335981 lt!335974))))

(assert (=> b!754889 (= lt!335974 (Found!7669 j!159))))

(assert (=> b!754889 (= lt!335981 (seekEntryOrOpen!0 (select (arr!20069 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!754889 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!335971 () Unit!26056)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41911 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26056)

(assert (=> b!754889 (= lt!335971 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!754890 () Bool)

(assert (=> b!754890 (= e!420979 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20069 a!3186) j!159) a!3186 mask!3328) (Found!7669 j!159)))))

(declare-fun b!754891 () Bool)

(assert (=> b!754891 (= e!420989 e!420988)))

(declare-fun res!510159 () Bool)

(assert (=> b!754891 (=> (not res!510159) (not e!420988))))

(declare-fun lt!335975 () SeekEntryResult!7669)

(assert (=> b!754891 (= res!510159 (or (= lt!335975 (MissingZero!7669 i!1173)) (= lt!335975 (MissingVacant!7669 i!1173))))))

(assert (=> b!754891 (= lt!335975 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!754892 () Bool)

(assert (=> b!754892 (= e!420979 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20069 a!3186) j!159) a!3186 mask!3328) lt!335970))))

(declare-fun b!754893 () Bool)

(assert (=> b!754893 (= e!420987 e!420984)))

(declare-fun res!510162 () Bool)

(assert (=> b!754893 (=> res!510162 e!420984)))

(assert (=> b!754893 (= res!510162 (not (= lt!335977 lt!335974)))))

(assert (=> b!754893 (= lt!335977 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20069 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!754894 () Bool)

(declare-fun res!510161 () Bool)

(assert (=> b!754894 (=> (not res!510161) (not e!420988))))

(declare-datatypes ((List!14071 0))(
  ( (Nil!14068) (Cons!14067 (h!15139 (_ BitVec 64)) (t!20386 List!14071)) )
))
(declare-fun arrayNoDuplicates!0 (array!41911 (_ BitVec 32) List!14071) Bool)

(assert (=> b!754894 (= res!510161 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14068))))

(declare-fun b!754895 () Bool)

(declare-fun res!510156 () Bool)

(assert (=> b!754895 (=> (not res!510156) (not e!420989))))

(assert (=> b!754895 (= res!510156 (and (= (size!20490 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20490 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20490 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!754896 () Bool)

(declare-fun res!510157 () Bool)

(assert (=> b!754896 (=> (not res!510157) (not e!420989))))

(assert (=> b!754896 (= res!510157 (validKeyInArray!0 (select (arr!20069 a!3186) j!159)))))

(assert (= (and start!65738 res!510155) b!754895))

(assert (= (and b!754895 res!510156) b!754896))

(assert (= (and b!754896 res!510157) b!754877))

(assert (= (and b!754877 res!510151) b!754880))

(assert (= (and b!754880 res!510167) b!754891))

(assert (= (and b!754891 res!510159) b!754887))

(assert (= (and b!754887 res!510153) b!754894))

(assert (= (and b!754894 res!510161) b!754878))

(assert (= (and b!754878 res!510163) b!754883))

(assert (= (and b!754883 res!510164) b!754879))

(assert (= (and b!754879 res!510150) b!754874))

(assert (= (and b!754874 c!82743) b!754892))

(assert (= (and b!754874 (not c!82743)) b!754890))

(assert (= (and b!754874 res!510149) b!754885))

(assert (= (and b!754885 res!510154) b!754889))

(assert (= (and b!754889 res!510152) b!754884))

(assert (= (and b!754889 (not res!510166)) b!754893))

(assert (= (and b!754893 (not res!510162)) b!754888))

(assert (= (and b!754888 (not res!510160)) b!754875))

(assert (= (and b!754875 c!82744) b!754882))

(assert (= (and b!754875 (not c!82744)) b!754881))

(assert (= (and b!754875 res!510165) b!754886))

(assert (= (and b!754886 res!510158) b!754876))

(declare-fun m!703215 () Bool)

(assert (=> b!754894 m!703215))

(declare-fun m!703217 () Bool)

(assert (=> b!754890 m!703217))

(assert (=> b!754890 m!703217))

(declare-fun m!703219 () Bool)

(assert (=> b!754890 m!703219))

(assert (=> b!754893 m!703217))

(assert (=> b!754893 m!703217))

(assert (=> b!754893 m!703219))

(assert (=> b!754884 m!703217))

(assert (=> b!754884 m!703217))

(declare-fun m!703221 () Bool)

(assert (=> b!754884 m!703221))

(declare-fun m!703223 () Bool)

(assert (=> b!754880 m!703223))

(assert (=> b!754889 m!703217))

(assert (=> b!754889 m!703217))

(declare-fun m!703225 () Bool)

(assert (=> b!754889 m!703225))

(declare-fun m!703227 () Bool)

(assert (=> b!754889 m!703227))

(declare-fun m!703229 () Bool)

(assert (=> b!754889 m!703229))

(declare-fun m!703231 () Bool)

(assert (=> b!754885 m!703231))

(declare-fun m!703233 () Bool)

(assert (=> b!754885 m!703233))

(declare-fun m!703235 () Bool)

(assert (=> b!754885 m!703235))

(declare-fun m!703237 () Bool)

(assert (=> b!754885 m!703237))

(declare-fun m!703239 () Bool)

(assert (=> b!754885 m!703239))

(assert (=> b!754885 m!703233))

(assert (=> b!754888 m!703237))

(declare-fun m!703241 () Bool)

(assert (=> b!754888 m!703241))

(declare-fun m!703243 () Bool)

(assert (=> b!754887 m!703243))

(declare-fun m!703245 () Bool)

(assert (=> b!754891 m!703245))

(declare-fun m!703247 () Bool)

(assert (=> b!754879 m!703247))

(assert (=> b!754892 m!703217))

(assert (=> b!754892 m!703217))

(declare-fun m!703249 () Bool)

(assert (=> b!754892 m!703249))

(assert (=> b!754883 m!703217))

(assert (=> b!754883 m!703217))

(declare-fun m!703251 () Bool)

(assert (=> b!754883 m!703251))

(assert (=> b!754883 m!703251))

(assert (=> b!754883 m!703217))

(declare-fun m!703253 () Bool)

(assert (=> b!754883 m!703253))

(declare-fun m!703255 () Bool)

(assert (=> b!754877 m!703255))

(assert (=> b!754896 m!703217))

(assert (=> b!754896 m!703217))

(declare-fun m!703257 () Bool)

(assert (=> b!754896 m!703257))

(declare-fun m!703259 () Bool)

(assert (=> b!754886 m!703259))

(declare-fun m!703261 () Bool)

(assert (=> b!754886 m!703261))

(declare-fun m!703263 () Bool)

(assert (=> start!65738 m!703263))

(declare-fun m!703265 () Bool)

(assert (=> start!65738 m!703265))

(push 1)

