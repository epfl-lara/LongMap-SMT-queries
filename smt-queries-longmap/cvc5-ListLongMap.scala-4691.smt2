; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65206 () Bool)

(assert start!65206)

(declare-datatypes ((array!41379 0))(
  ( (array!41380 (arr!19803 (Array (_ BitVec 32) (_ BitVec 64))) (size!20224 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41379)

(declare-fun e!412853 () Bool)

(declare-datatypes ((SeekEntryResult!7403 0))(
  ( (MissingZero!7403 (index!31980 (_ BitVec 32))) (Found!7403 (index!31981 (_ BitVec 32))) (Intermediate!7403 (undefined!8215 Bool) (index!31982 (_ BitVec 32)) (x!62977 (_ BitVec 32))) (Undefined!7403) (MissingVacant!7403 (index!31983 (_ BitVec 32))) )
))
(declare-fun lt!327633 () SeekEntryResult!7403)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!738196 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41379 (_ BitVec 32)) SeekEntryResult!7403)

(assert (=> b!738196 (= e!412853 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19803 a!3186) j!159) a!3186 mask!3328) lt!327633))))

(declare-fun b!738197 () Bool)

(declare-fun e!412860 () Bool)

(declare-fun e!412856 () Bool)

(assert (=> b!738197 (= e!412860 (not e!412856))))

(declare-fun res!496255 () Bool)

(assert (=> b!738197 (=> res!496255 e!412856)))

(declare-fun lt!327632 () SeekEntryResult!7403)

(assert (=> b!738197 (= res!496255 (or (not (is-Intermediate!7403 lt!327632)) (bvsge x!1131 (x!62977 lt!327632))))))

(declare-fun lt!327626 () SeekEntryResult!7403)

(assert (=> b!738197 (= lt!327626 (Found!7403 j!159))))

(declare-fun e!412859 () Bool)

(assert (=> b!738197 e!412859))

(declare-fun res!496247 () Bool)

(assert (=> b!738197 (=> (not res!496247) (not e!412859))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41379 (_ BitVec 32)) Bool)

(assert (=> b!738197 (= res!496247 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25208 0))(
  ( (Unit!25209) )
))
(declare-fun lt!327622 () Unit!25208)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41379 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25208)

(assert (=> b!738197 (= lt!327622 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!412852 () Bool)

(declare-fun b!738198 () Bool)

(declare-fun lt!327635 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41379 (_ BitVec 32)) SeekEntryResult!7403)

(assert (=> b!738198 (= e!412852 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327635 resIntermediateIndex!5 (select (arr!19803 a!3186) j!159) a!3186 mask!3328) lt!327626)))))

(declare-fun b!738199 () Bool)

(declare-fun e!412855 () Bool)

(assert (=> b!738199 (= e!412855 true)))

(declare-fun lt!327628 () array!41379)

(declare-fun lt!327634 () SeekEntryResult!7403)

(declare-fun lt!327623 () (_ BitVec 64))

(assert (=> b!738199 (= lt!327634 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327635 lt!327623 lt!327628 mask!3328))))

(declare-fun b!738200 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun lt!327630 () SeekEntryResult!7403)

(declare-fun e!412862 () Bool)

(assert (=> b!738200 (= e!412862 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19803 a!3186) j!159) a!3186 mask!3328) lt!327630))))

(declare-fun b!738201 () Bool)

(declare-fun e!412858 () Unit!25208)

(declare-fun Unit!25210 () Unit!25208)

(assert (=> b!738201 (= e!412858 Unit!25210)))

(declare-fun lt!327625 () SeekEntryResult!7403)

(assert (=> b!738201 (= lt!327625 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19803 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!738201 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327635 resIntermediateIndex!5 (select (arr!19803 a!3186) j!159) a!3186 mask!3328) lt!327626)))

(declare-fun b!738202 () Bool)

(declare-fun res!496252 () Bool)

(declare-fun e!412861 () Bool)

(assert (=> b!738202 (=> (not res!496252) (not e!412861))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!738202 (= res!496252 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19803 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!738203 () Bool)

(declare-fun res!496260 () Bool)

(declare-fun e!412851 () Bool)

(assert (=> b!738203 (=> (not res!496260) (not e!412851))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41379 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!738203 (= res!496260 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!738205 () Bool)

(declare-fun res!496245 () Bool)

(declare-fun e!412854 () Bool)

(assert (=> b!738205 (=> (not res!496245) (not e!412854))))

(assert (=> b!738205 (= res!496245 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!738206 () Bool)

(assert (=> b!738206 (= e!412861 e!412860)))

(declare-fun res!496257 () Bool)

(assert (=> b!738206 (=> (not res!496257) (not e!412860))))

(declare-fun lt!327627 () SeekEntryResult!7403)

(assert (=> b!738206 (= res!496257 (= lt!327627 lt!327632))))

(assert (=> b!738206 (= lt!327632 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!327623 lt!327628 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738206 (= lt!327627 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!327623 mask!3328) lt!327623 lt!327628 mask!3328))))

(assert (=> b!738206 (= lt!327623 (select (store (arr!19803 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!738206 (= lt!327628 (array!41380 (store (arr!19803 a!3186) i!1173 k!2102) (size!20224 a!3186)))))

(declare-fun b!738207 () Bool)

(declare-fun res!496254 () Bool)

(assert (=> b!738207 (=> (not res!496254) (not e!412854))))

(declare-datatypes ((List!13805 0))(
  ( (Nil!13802) (Cons!13801 (h!14873 (_ BitVec 64)) (t!20120 List!13805)) )
))
(declare-fun arrayNoDuplicates!0 (array!41379 (_ BitVec 32) List!13805) Bool)

(assert (=> b!738207 (= res!496254 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13802))))

(declare-fun b!738208 () Bool)

(declare-fun res!496261 () Bool)

(assert (=> b!738208 (=> (not res!496261) (not e!412851))))

(assert (=> b!738208 (= res!496261 (and (= (size!20224 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20224 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20224 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!738209 () Bool)

(assert (=> b!738209 (= e!412852 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327635 (select (arr!19803 a!3186) j!159) a!3186 mask!3328) lt!327633)))))

(declare-fun b!738210 () Bool)

(assert (=> b!738210 (= e!412851 e!412854)))

(declare-fun res!496262 () Bool)

(assert (=> b!738210 (=> (not res!496262) (not e!412854))))

(declare-fun lt!327631 () SeekEntryResult!7403)

(assert (=> b!738210 (= res!496262 (or (= lt!327631 (MissingZero!7403 i!1173)) (= lt!327631 (MissingVacant!7403 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41379 (_ BitVec 32)) SeekEntryResult!7403)

(assert (=> b!738210 (= lt!327631 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!738211 () Bool)

(assert (=> b!738211 (= e!412853 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19803 a!3186) j!159) a!3186 mask!3328) (Found!7403 j!159)))))

(declare-fun b!738212 () Bool)

(declare-fun res!496250 () Bool)

(assert (=> b!738212 (=> (not res!496250) (not e!412851))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!738212 (= res!496250 (validKeyInArray!0 (select (arr!19803 a!3186) j!159)))))

(declare-fun b!738213 () Bool)

(assert (=> b!738213 (= e!412854 e!412861)))

(declare-fun res!496258 () Bool)

(assert (=> b!738213 (=> (not res!496258) (not e!412861))))

(assert (=> b!738213 (= res!496258 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19803 a!3186) j!159) mask!3328) (select (arr!19803 a!3186) j!159) a!3186 mask!3328) lt!327633))))

(assert (=> b!738213 (= lt!327633 (Intermediate!7403 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!738214 () Bool)

(declare-fun res!496249 () Bool)

(assert (=> b!738214 (=> res!496249 e!412855)))

(assert (=> b!738214 (= res!496249 e!412852)))

(declare-fun c!81356 () Bool)

(declare-fun lt!327629 () Bool)

(assert (=> b!738214 (= c!81356 lt!327629)))

(declare-fun b!738215 () Bool)

(assert (=> b!738215 (= e!412859 e!412862)))

(declare-fun res!496256 () Bool)

(assert (=> b!738215 (=> (not res!496256) (not e!412862))))

(assert (=> b!738215 (= res!496256 (= (seekEntryOrOpen!0 (select (arr!19803 a!3186) j!159) a!3186 mask!3328) lt!327630))))

(assert (=> b!738215 (= lt!327630 (Found!7403 j!159))))

(declare-fun b!738216 () Bool)

(assert (=> b!738216 (= e!412856 e!412855)))

(declare-fun res!496246 () Bool)

(assert (=> b!738216 (=> res!496246 e!412855)))

(assert (=> b!738216 (= res!496246 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!327635 #b00000000000000000000000000000000) (bvsge lt!327635 (size!20224 a!3186))))))

(declare-fun lt!327624 () Unit!25208)

(assert (=> b!738216 (= lt!327624 e!412858)))

(declare-fun c!81358 () Bool)

(assert (=> b!738216 (= c!81358 lt!327629)))

(assert (=> b!738216 (= lt!327629 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738216 (= lt!327635 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!738217 () Bool)

(declare-fun res!496251 () Bool)

(assert (=> b!738217 (=> (not res!496251) (not e!412851))))

(assert (=> b!738217 (= res!496251 (validKeyInArray!0 k!2102))))

(declare-fun b!738204 () Bool)

(declare-fun res!496248 () Bool)

(assert (=> b!738204 (=> (not res!496248) (not e!412854))))

(assert (=> b!738204 (= res!496248 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20224 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20224 a!3186))))))

(declare-fun res!496259 () Bool)

(assert (=> start!65206 (=> (not res!496259) (not e!412851))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65206 (= res!496259 (validMask!0 mask!3328))))

(assert (=> start!65206 e!412851))

(assert (=> start!65206 true))

(declare-fun array_inv!15599 (array!41379) Bool)

(assert (=> start!65206 (array_inv!15599 a!3186)))

(declare-fun b!738218 () Bool)

(declare-fun res!496253 () Bool)

(assert (=> b!738218 (=> (not res!496253) (not e!412861))))

(assert (=> b!738218 (= res!496253 e!412853)))

(declare-fun c!81357 () Bool)

(assert (=> b!738218 (= c!81357 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!738219 () Bool)

(declare-fun Unit!25211 () Unit!25208)

(assert (=> b!738219 (= e!412858 Unit!25211)))

(assert (=> b!738219 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327635 (select (arr!19803 a!3186) j!159) a!3186 mask!3328) lt!327633)))

(assert (= (and start!65206 res!496259) b!738208))

(assert (= (and b!738208 res!496261) b!738212))

(assert (= (and b!738212 res!496250) b!738217))

(assert (= (and b!738217 res!496251) b!738203))

(assert (= (and b!738203 res!496260) b!738210))

(assert (= (and b!738210 res!496262) b!738205))

(assert (= (and b!738205 res!496245) b!738207))

(assert (= (and b!738207 res!496254) b!738204))

(assert (= (and b!738204 res!496248) b!738213))

(assert (= (and b!738213 res!496258) b!738202))

(assert (= (and b!738202 res!496252) b!738218))

(assert (= (and b!738218 c!81357) b!738196))

(assert (= (and b!738218 (not c!81357)) b!738211))

(assert (= (and b!738218 res!496253) b!738206))

(assert (= (and b!738206 res!496257) b!738197))

(assert (= (and b!738197 res!496247) b!738215))

(assert (= (and b!738215 res!496256) b!738200))

(assert (= (and b!738197 (not res!496255)) b!738216))

(assert (= (and b!738216 c!81358) b!738219))

(assert (= (and b!738216 (not c!81358)) b!738201))

(assert (= (and b!738216 (not res!496246)) b!738214))

(assert (= (and b!738214 c!81356) b!738209))

(assert (= (and b!738214 (not c!81356)) b!738198))

(assert (= (and b!738214 (not res!496249)) b!738199))

(declare-fun m!689887 () Bool)

(assert (=> b!738200 m!689887))

(assert (=> b!738200 m!689887))

(declare-fun m!689889 () Bool)

(assert (=> b!738200 m!689889))

(assert (=> b!738196 m!689887))

(assert (=> b!738196 m!689887))

(declare-fun m!689891 () Bool)

(assert (=> b!738196 m!689891))

(assert (=> b!738201 m!689887))

(assert (=> b!738201 m!689887))

(declare-fun m!689893 () Bool)

(assert (=> b!738201 m!689893))

(assert (=> b!738201 m!689887))

(declare-fun m!689895 () Bool)

(assert (=> b!738201 m!689895))

(declare-fun m!689897 () Bool)

(assert (=> b!738216 m!689897))

(assert (=> b!738213 m!689887))

(assert (=> b!738213 m!689887))

(declare-fun m!689899 () Bool)

(assert (=> b!738213 m!689899))

(assert (=> b!738213 m!689899))

(assert (=> b!738213 m!689887))

(declare-fun m!689901 () Bool)

(assert (=> b!738213 m!689901))

(declare-fun m!689903 () Bool)

(assert (=> b!738199 m!689903))

(assert (=> b!738209 m!689887))

(assert (=> b!738209 m!689887))

(declare-fun m!689905 () Bool)

(assert (=> b!738209 m!689905))

(declare-fun m!689907 () Bool)

(assert (=> start!65206 m!689907))

(declare-fun m!689909 () Bool)

(assert (=> start!65206 m!689909))

(declare-fun m!689911 () Bool)

(assert (=> b!738210 m!689911))

(declare-fun m!689913 () Bool)

(assert (=> b!738205 m!689913))

(declare-fun m!689915 () Bool)

(assert (=> b!738202 m!689915))

(declare-fun m!689917 () Bool)

(assert (=> b!738206 m!689917))

(declare-fun m!689919 () Bool)

(assert (=> b!738206 m!689919))

(declare-fun m!689921 () Bool)

(assert (=> b!738206 m!689921))

(assert (=> b!738206 m!689917))

(declare-fun m!689923 () Bool)

(assert (=> b!738206 m!689923))

(declare-fun m!689925 () Bool)

(assert (=> b!738206 m!689925))

(assert (=> b!738215 m!689887))

(assert (=> b!738215 m!689887))

(declare-fun m!689927 () Bool)

(assert (=> b!738215 m!689927))

(assert (=> b!738198 m!689887))

(assert (=> b!738198 m!689887))

(assert (=> b!738198 m!689895))

(declare-fun m!689929 () Bool)

(assert (=> b!738207 m!689929))

(declare-fun m!689931 () Bool)

(assert (=> b!738203 m!689931))

(declare-fun m!689933 () Bool)

(assert (=> b!738217 m!689933))

(assert (=> b!738211 m!689887))

(assert (=> b!738211 m!689887))

(assert (=> b!738211 m!689893))

(assert (=> b!738212 m!689887))

(assert (=> b!738212 m!689887))

(declare-fun m!689935 () Bool)

(assert (=> b!738212 m!689935))

(declare-fun m!689937 () Bool)

(assert (=> b!738197 m!689937))

(declare-fun m!689939 () Bool)

(assert (=> b!738197 m!689939))

(assert (=> b!738219 m!689887))

(assert (=> b!738219 m!689887))

(assert (=> b!738219 m!689905))

(push 1)

