; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65624 () Bool)

(assert start!65624)

(declare-fun b!750969 () Bool)

(declare-fun res!506929 () Bool)

(declare-fun e!418955 () Bool)

(assert (=> b!750969 (=> (not res!506929) (not e!418955))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!750969 (= res!506929 (validKeyInArray!0 k!2102))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41797 0))(
  ( (array!41798 (arr!20012 (Array (_ BitVec 32) (_ BitVec 64))) (size!20433 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41797)

(declare-fun e!418954 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!750970 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7612 0))(
  ( (MissingZero!7612 (index!32816 (_ BitVec 32))) (Found!7612 (index!32817 (_ BitVec 32))) (Intermediate!7612 (undefined!8424 Bool) (index!32818 (_ BitVec 32)) (x!63738 (_ BitVec 32))) (Undefined!7612) (MissingVacant!7612 (index!32819 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41797 (_ BitVec 32)) SeekEntryResult!7612)

(assert (=> b!750970 (= e!418954 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20012 a!3186) j!159) a!3186 mask!3328) (Found!7612 j!159)))))

(declare-fun res!506942 () Bool)

(assert (=> start!65624 (=> (not res!506942) (not e!418955))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65624 (= res!506942 (validMask!0 mask!3328))))

(assert (=> start!65624 e!418955))

(assert (=> start!65624 true))

(declare-fun array_inv!15808 (array!41797) Bool)

(assert (=> start!65624 (array_inv!15808 a!3186)))

(declare-fun b!750971 () Bool)

(declare-fun e!418963 () Bool)

(declare-fun e!418958 () Bool)

(assert (=> b!750971 (= e!418963 e!418958)))

(declare-fun res!506941 () Bool)

(assert (=> b!750971 (=> res!506941 e!418958)))

(declare-fun lt!333946 () (_ BitVec 64))

(declare-fun lt!333948 () (_ BitVec 64))

(assert (=> b!750971 (= res!506941 (= lt!333946 lt!333948))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!750971 (= lt!333946 (select (store (arr!20012 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!750972 () Bool)

(declare-fun res!506934 () Bool)

(declare-fun e!418962 () Bool)

(assert (=> b!750972 (=> (not res!506934) (not e!418962))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41797 (_ BitVec 32)) Bool)

(assert (=> b!750972 (= res!506934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!750973 () Bool)

(declare-fun res!506944 () Bool)

(declare-fun e!418957 () Bool)

(assert (=> b!750973 (=> (not res!506944) (not e!418957))))

(assert (=> b!750973 (= res!506944 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20012 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!750974 () Bool)

(declare-fun res!506935 () Bool)

(assert (=> b!750974 (=> res!506935 e!418963)))

(declare-fun lt!333956 () SeekEntryResult!7612)

(assert (=> b!750974 (= res!506935 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20012 a!3186) j!159) a!3186 mask!3328) lt!333956)))))

(declare-fun b!750975 () Bool)

(assert (=> b!750975 (= e!418958 true)))

(declare-fun e!418964 () Bool)

(assert (=> b!750975 e!418964))

(declare-fun res!506933 () Bool)

(assert (=> b!750975 (=> (not res!506933) (not e!418964))))

(assert (=> b!750975 (= res!506933 (= lt!333946 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!25828 0))(
  ( (Unit!25829) )
))
(declare-fun lt!333953 () Unit!25828)

(declare-fun e!418960 () Unit!25828)

(assert (=> b!750975 (= lt!333953 e!418960)))

(declare-fun c!82401 () Bool)

(assert (=> b!750975 (= c!82401 (= lt!333946 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!750976 () Bool)

(declare-fun res!506938 () Bool)

(assert (=> b!750976 (=> (not res!506938) (not e!418957))))

(assert (=> b!750976 (= res!506938 e!418954)))

(declare-fun c!82402 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!750976 (= c!82402 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!750977 () Bool)

(declare-fun e!418956 () Bool)

(assert (=> b!750977 (= e!418957 e!418956)))

(declare-fun res!506928 () Bool)

(assert (=> b!750977 (=> (not res!506928) (not e!418956))))

(declare-fun lt!333952 () SeekEntryResult!7612)

(declare-fun lt!333949 () SeekEntryResult!7612)

(assert (=> b!750977 (= res!506928 (= lt!333952 lt!333949))))

(declare-fun lt!333950 () array!41797)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41797 (_ BitVec 32)) SeekEntryResult!7612)

(assert (=> b!750977 (= lt!333949 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333948 lt!333950 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!750977 (= lt!333952 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333948 mask!3328) lt!333948 lt!333950 mask!3328))))

(assert (=> b!750977 (= lt!333948 (select (store (arr!20012 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!750977 (= lt!333950 (array!41798 (store (arr!20012 a!3186) i!1173 k!2102) (size!20433 a!3186)))))

(declare-fun b!750978 () Bool)

(assert (=> b!750978 (= e!418962 e!418957)))

(declare-fun res!506945 () Bool)

(assert (=> b!750978 (=> (not res!506945) (not e!418957))))

(declare-fun lt!333947 () SeekEntryResult!7612)

(assert (=> b!750978 (= res!506945 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20012 a!3186) j!159) mask!3328) (select (arr!20012 a!3186) j!159) a!3186 mask!3328) lt!333947))))

(assert (=> b!750978 (= lt!333947 (Intermediate!7612 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!750979 () Bool)

(declare-fun Unit!25830 () Unit!25828)

(assert (=> b!750979 (= e!418960 Unit!25830)))

(assert (=> b!750979 false))

(declare-fun b!750980 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41797 (_ BitVec 32)) SeekEntryResult!7612)

(assert (=> b!750980 (= e!418964 (= (seekEntryOrOpen!0 lt!333948 lt!333950 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333948 lt!333950 mask!3328)))))

(declare-fun b!750981 () Bool)

(declare-fun res!506936 () Bool)

(assert (=> b!750981 (=> (not res!506936) (not e!418955))))

(assert (=> b!750981 (= res!506936 (and (= (size!20433 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20433 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20433 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!750982 () Bool)

(assert (=> b!750982 (= e!418956 (not e!418963))))

(declare-fun res!506937 () Bool)

(assert (=> b!750982 (=> res!506937 e!418963)))

(assert (=> b!750982 (= res!506937 (or (not (is-Intermediate!7612 lt!333949)) (bvslt x!1131 (x!63738 lt!333949)) (not (= x!1131 (x!63738 lt!333949))) (not (= index!1321 (index!32818 lt!333949)))))))

(declare-fun e!418959 () Bool)

(assert (=> b!750982 e!418959))

(declare-fun res!506931 () Bool)

(assert (=> b!750982 (=> (not res!506931) (not e!418959))))

(declare-fun lt!333951 () SeekEntryResult!7612)

(assert (=> b!750982 (= res!506931 (= lt!333951 lt!333956))))

(assert (=> b!750982 (= lt!333956 (Found!7612 j!159))))

(assert (=> b!750982 (= lt!333951 (seekEntryOrOpen!0 (select (arr!20012 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!750982 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!333955 () Unit!25828)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41797 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25828)

(assert (=> b!750982 (= lt!333955 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!750983 () Bool)

(declare-fun Unit!25831 () Unit!25828)

(assert (=> b!750983 (= e!418960 Unit!25831)))

(declare-fun b!750984 () Bool)

(assert (=> b!750984 (= e!418959 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20012 a!3186) j!159) a!3186 mask!3328) lt!333956))))

(declare-fun b!750985 () Bool)

(assert (=> b!750985 (= e!418954 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20012 a!3186) j!159) a!3186 mask!3328) lt!333947))))

(declare-fun b!750986 () Bool)

(assert (=> b!750986 (= e!418955 e!418962)))

(declare-fun res!506943 () Bool)

(assert (=> b!750986 (=> (not res!506943) (not e!418962))))

(declare-fun lt!333954 () SeekEntryResult!7612)

(assert (=> b!750986 (= res!506943 (or (= lt!333954 (MissingZero!7612 i!1173)) (= lt!333954 (MissingVacant!7612 i!1173))))))

(assert (=> b!750986 (= lt!333954 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!750987 () Bool)

(declare-fun res!506939 () Bool)

(assert (=> b!750987 (=> (not res!506939) (not e!418962))))

(declare-datatypes ((List!14014 0))(
  ( (Nil!14011) (Cons!14010 (h!15082 (_ BitVec 64)) (t!20329 List!14014)) )
))
(declare-fun arrayNoDuplicates!0 (array!41797 (_ BitVec 32) List!14014) Bool)

(assert (=> b!750987 (= res!506939 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14011))))

(declare-fun b!750988 () Bool)

(declare-fun res!506932 () Bool)

(assert (=> b!750988 (=> (not res!506932) (not e!418955))))

(assert (=> b!750988 (= res!506932 (validKeyInArray!0 (select (arr!20012 a!3186) j!159)))))

(declare-fun b!750989 () Bool)

(declare-fun res!506940 () Bool)

(assert (=> b!750989 (=> (not res!506940) (not e!418955))))

(declare-fun arrayContainsKey!0 (array!41797 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!750989 (= res!506940 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!750990 () Bool)

(declare-fun res!506930 () Bool)

(assert (=> b!750990 (=> (not res!506930) (not e!418962))))

(assert (=> b!750990 (= res!506930 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20433 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20433 a!3186))))))

(assert (= (and start!65624 res!506942) b!750981))

(assert (= (and b!750981 res!506936) b!750988))

(assert (= (and b!750988 res!506932) b!750969))

(assert (= (and b!750969 res!506929) b!750989))

(assert (= (and b!750989 res!506940) b!750986))

(assert (= (and b!750986 res!506943) b!750972))

(assert (= (and b!750972 res!506934) b!750987))

(assert (= (and b!750987 res!506939) b!750990))

(assert (= (and b!750990 res!506930) b!750978))

(assert (= (and b!750978 res!506945) b!750973))

(assert (= (and b!750973 res!506944) b!750976))

(assert (= (and b!750976 c!82402) b!750985))

(assert (= (and b!750976 (not c!82402)) b!750970))

(assert (= (and b!750976 res!506938) b!750977))

(assert (= (and b!750977 res!506928) b!750982))

(assert (= (and b!750982 res!506931) b!750984))

(assert (= (and b!750982 (not res!506937)) b!750974))

(assert (= (and b!750974 (not res!506935)) b!750971))

(assert (= (and b!750971 (not res!506941)) b!750975))

(assert (= (and b!750975 c!82401) b!750979))

(assert (= (and b!750975 (not c!82401)) b!750983))

(assert (= (and b!750975 res!506933) b!750980))

(declare-fun m!700251 () Bool)

(assert (=> b!750988 m!700251))

(assert (=> b!750988 m!700251))

(declare-fun m!700253 () Bool)

(assert (=> b!750988 m!700253))

(assert (=> b!750974 m!700251))

(assert (=> b!750974 m!700251))

(declare-fun m!700255 () Bool)

(assert (=> b!750974 m!700255))

(assert (=> b!750982 m!700251))

(assert (=> b!750982 m!700251))

(declare-fun m!700257 () Bool)

(assert (=> b!750982 m!700257))

(declare-fun m!700259 () Bool)

(assert (=> b!750982 m!700259))

(declare-fun m!700261 () Bool)

(assert (=> b!750982 m!700261))

(declare-fun m!700263 () Bool)

(assert (=> b!750973 m!700263))

(assert (=> b!750978 m!700251))

(assert (=> b!750978 m!700251))

(declare-fun m!700265 () Bool)

(assert (=> b!750978 m!700265))

(assert (=> b!750978 m!700265))

(assert (=> b!750978 m!700251))

(declare-fun m!700267 () Bool)

(assert (=> b!750978 m!700267))

(declare-fun m!700269 () Bool)

(assert (=> b!750977 m!700269))

(declare-fun m!700271 () Bool)

(assert (=> b!750977 m!700271))

(assert (=> b!750977 m!700271))

(declare-fun m!700273 () Bool)

(assert (=> b!750977 m!700273))

(declare-fun m!700275 () Bool)

(assert (=> b!750977 m!700275))

(declare-fun m!700277 () Bool)

(assert (=> b!750977 m!700277))

(declare-fun m!700279 () Bool)

(assert (=> b!750987 m!700279))

(assert (=> b!750984 m!700251))

(assert (=> b!750984 m!700251))

(declare-fun m!700281 () Bool)

(assert (=> b!750984 m!700281))

(assert (=> b!750970 m!700251))

(assert (=> b!750970 m!700251))

(assert (=> b!750970 m!700255))

(assert (=> b!750985 m!700251))

(assert (=> b!750985 m!700251))

(declare-fun m!700283 () Bool)

(assert (=> b!750985 m!700283))

(assert (=> b!750971 m!700269))

(declare-fun m!700285 () Bool)

(assert (=> b!750971 m!700285))

(declare-fun m!700287 () Bool)

(assert (=> b!750989 m!700287))

(declare-fun m!700289 () Bool)

(assert (=> b!750969 m!700289))

(declare-fun m!700291 () Bool)

(assert (=> b!750980 m!700291))

(declare-fun m!700293 () Bool)

(assert (=> b!750980 m!700293))

(declare-fun m!700295 () Bool)

(assert (=> b!750972 m!700295))

(declare-fun m!700297 () Bool)

(assert (=> b!750986 m!700297))

(declare-fun m!700299 () Bool)

(assert (=> start!65624 m!700299))

(declare-fun m!700301 () Bool)

(assert (=> start!65624 m!700301))

(push 1)

