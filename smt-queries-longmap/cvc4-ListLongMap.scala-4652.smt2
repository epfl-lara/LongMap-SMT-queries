; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64688 () Bool)

(assert start!64688)

(declare-fun e!408216 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41137 0))(
  ( (array!41138 (arr!19688 (Array (_ BitVec 32) (_ BitVec 64))) (size!20109 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41137)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!729334 () Bool)

(declare-datatypes ((SeekEntryResult!7288 0))(
  ( (MissingZero!7288 (index!31520 (_ BitVec 32))) (Found!7288 (index!31521 (_ BitVec 32))) (Intermediate!7288 (undefined!8100 Bool) (index!31522 (_ BitVec 32)) (x!62502 (_ BitVec 32))) (Undefined!7288) (MissingVacant!7288 (index!31523 (_ BitVec 32))) )
))
(declare-fun lt!323115 () SeekEntryResult!7288)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41137 (_ BitVec 32)) SeekEntryResult!7288)

(assert (=> b!729334 (= e!408216 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19688 a!3186) j!159) a!3186 mask!3328) lt!323115))))

(declare-fun b!729335 () Bool)

(declare-fun e!408214 () Bool)

(declare-fun e!408217 () Bool)

(assert (=> b!729335 (= e!408214 e!408217)))

(declare-fun res!489762 () Bool)

(assert (=> b!729335 (=> (not res!489762) (not e!408217))))

(declare-fun lt!323111 () SeekEntryResult!7288)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!729335 (= res!489762 (or (= lt!323111 (MissingZero!7288 i!1173)) (= lt!323111 (MissingVacant!7288 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41137 (_ BitVec 32)) SeekEntryResult!7288)

(assert (=> b!729335 (= lt!323111 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!729336 () Bool)

(declare-fun e!408211 () Bool)

(assert (=> b!729336 (= e!408211 true)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!323116 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729336 (= lt!323116 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!729337 () Bool)

(declare-fun res!489756 () Bool)

(assert (=> b!729337 (=> (not res!489756) (not e!408217))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41137 (_ BitVec 32)) Bool)

(assert (=> b!729337 (= res!489756 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!729338 () Bool)

(declare-fun e!408210 () Bool)

(assert (=> b!729338 (= e!408210 (not e!408211))))

(declare-fun res!489763 () Bool)

(assert (=> b!729338 (=> res!489763 e!408211)))

(declare-fun lt!323110 () SeekEntryResult!7288)

(assert (=> b!729338 (= res!489763 (or (not (is-Intermediate!7288 lt!323110)) (bvsge x!1131 (x!62502 lt!323110))))))

(declare-fun e!408213 () Bool)

(assert (=> b!729338 e!408213))

(declare-fun res!489752 () Bool)

(assert (=> b!729338 (=> (not res!489752) (not e!408213))))

(assert (=> b!729338 (= res!489752 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24894 0))(
  ( (Unit!24895) )
))
(declare-fun lt!323114 () Unit!24894)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41137 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24894)

(assert (=> b!729338 (= lt!323114 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!729339 () Bool)

(declare-fun res!489759 () Bool)

(assert (=> b!729339 (=> (not res!489759) (not e!408214))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!729339 (= res!489759 (validKeyInArray!0 k!2102))))

(declare-fun b!729340 () Bool)

(declare-fun e!408212 () Bool)

(assert (=> b!729340 (= e!408212 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19688 a!3186) j!159) a!3186 mask!3328) (Found!7288 j!159)))))

(declare-fun b!729341 () Bool)

(declare-fun res!489761 () Bool)

(assert (=> b!729341 (=> (not res!489761) (not e!408214))))

(assert (=> b!729341 (= res!489761 (and (= (size!20109 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20109 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20109 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!729342 () Bool)

(declare-fun res!489755 () Bool)

(assert (=> b!729342 (=> (not res!489755) (not e!408217))))

(assert (=> b!729342 (= res!489755 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20109 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20109 a!3186))))))

(declare-fun b!729343 () Bool)

(declare-fun res!489753 () Bool)

(assert (=> b!729343 (=> (not res!489753) (not e!408217))))

(declare-datatypes ((List!13690 0))(
  ( (Nil!13687) (Cons!13686 (h!14746 (_ BitVec 64)) (t!20005 List!13690)) )
))
(declare-fun arrayNoDuplicates!0 (array!41137 (_ BitVec 32) List!13690) Bool)

(assert (=> b!729343 (= res!489753 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13687))))

(declare-fun res!489750 () Bool)

(assert (=> start!64688 (=> (not res!489750) (not e!408214))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64688 (= res!489750 (validMask!0 mask!3328))))

(assert (=> start!64688 e!408214))

(assert (=> start!64688 true))

(declare-fun array_inv!15484 (array!41137) Bool)

(assert (=> start!64688 (array_inv!15484 a!3186)))

(declare-fun b!729344 () Bool)

(declare-fun res!489751 () Bool)

(declare-fun e!408215 () Bool)

(assert (=> b!729344 (=> (not res!489751) (not e!408215))))

(assert (=> b!729344 (= res!489751 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19688 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!323109 () SeekEntryResult!7288)

(declare-fun b!729345 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41137 (_ BitVec 32)) SeekEntryResult!7288)

(assert (=> b!729345 (= e!408212 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19688 a!3186) j!159) a!3186 mask!3328) lt!323109))))

(declare-fun b!729346 () Bool)

(assert (=> b!729346 (= e!408215 e!408210)))

(declare-fun res!489764 () Bool)

(assert (=> b!729346 (=> (not res!489764) (not e!408210))))

(declare-fun lt!323113 () SeekEntryResult!7288)

(assert (=> b!729346 (= res!489764 (= lt!323113 lt!323110))))

(declare-fun lt!323112 () (_ BitVec 64))

(declare-fun lt!323117 () array!41137)

(assert (=> b!729346 (= lt!323110 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323112 lt!323117 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729346 (= lt!323113 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323112 mask!3328) lt!323112 lt!323117 mask!3328))))

(assert (=> b!729346 (= lt!323112 (select (store (arr!19688 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!729346 (= lt!323117 (array!41138 (store (arr!19688 a!3186) i!1173 k!2102) (size!20109 a!3186)))))

(declare-fun b!729347 () Bool)

(assert (=> b!729347 (= e!408213 e!408216)))

(declare-fun res!489749 () Bool)

(assert (=> b!729347 (=> (not res!489749) (not e!408216))))

(assert (=> b!729347 (= res!489749 (= (seekEntryOrOpen!0 (select (arr!19688 a!3186) j!159) a!3186 mask!3328) lt!323115))))

(assert (=> b!729347 (= lt!323115 (Found!7288 j!159))))

(declare-fun b!729348 () Bool)

(declare-fun res!489758 () Bool)

(assert (=> b!729348 (=> (not res!489758) (not e!408214))))

(declare-fun arrayContainsKey!0 (array!41137 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!729348 (= res!489758 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!729349 () Bool)

(assert (=> b!729349 (= e!408217 e!408215)))

(declare-fun res!489754 () Bool)

(assert (=> b!729349 (=> (not res!489754) (not e!408215))))

(assert (=> b!729349 (= res!489754 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19688 a!3186) j!159) mask!3328) (select (arr!19688 a!3186) j!159) a!3186 mask!3328) lt!323109))))

(assert (=> b!729349 (= lt!323109 (Intermediate!7288 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!729350 () Bool)

(declare-fun res!489757 () Bool)

(assert (=> b!729350 (=> (not res!489757) (not e!408214))))

(assert (=> b!729350 (= res!489757 (validKeyInArray!0 (select (arr!19688 a!3186) j!159)))))

(declare-fun b!729351 () Bool)

(declare-fun res!489760 () Bool)

(assert (=> b!729351 (=> (not res!489760) (not e!408215))))

(assert (=> b!729351 (= res!489760 e!408212)))

(declare-fun c!80167 () Bool)

(assert (=> b!729351 (= c!80167 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!64688 res!489750) b!729341))

(assert (= (and b!729341 res!489761) b!729350))

(assert (= (and b!729350 res!489757) b!729339))

(assert (= (and b!729339 res!489759) b!729348))

(assert (= (and b!729348 res!489758) b!729335))

(assert (= (and b!729335 res!489762) b!729337))

(assert (= (and b!729337 res!489756) b!729343))

(assert (= (and b!729343 res!489753) b!729342))

(assert (= (and b!729342 res!489755) b!729349))

(assert (= (and b!729349 res!489754) b!729344))

(assert (= (and b!729344 res!489751) b!729351))

(assert (= (and b!729351 c!80167) b!729345))

(assert (= (and b!729351 (not c!80167)) b!729340))

(assert (= (and b!729351 res!489760) b!729346))

(assert (= (and b!729346 res!489764) b!729338))

(assert (= (and b!729338 res!489752) b!729347))

(assert (= (and b!729347 res!489749) b!729334))

(assert (= (and b!729338 (not res!489763)) b!729336))

(declare-fun m!682987 () Bool)

(assert (=> b!729344 m!682987))

(declare-fun m!682989 () Bool)

(assert (=> b!729340 m!682989))

(assert (=> b!729340 m!682989))

(declare-fun m!682991 () Bool)

(assert (=> b!729340 m!682991))

(declare-fun m!682993 () Bool)

(assert (=> b!729348 m!682993))

(assert (=> b!729350 m!682989))

(assert (=> b!729350 m!682989))

(declare-fun m!682995 () Bool)

(assert (=> b!729350 m!682995))

(declare-fun m!682997 () Bool)

(assert (=> b!729343 m!682997))

(assert (=> b!729334 m!682989))

(assert (=> b!729334 m!682989))

(declare-fun m!682999 () Bool)

(assert (=> b!729334 m!682999))

(declare-fun m!683001 () Bool)

(assert (=> b!729338 m!683001))

(declare-fun m!683003 () Bool)

(assert (=> b!729338 m!683003))

(assert (=> b!729345 m!682989))

(assert (=> b!729345 m!682989))

(declare-fun m!683005 () Bool)

(assert (=> b!729345 m!683005))

(declare-fun m!683007 () Bool)

(assert (=> b!729335 m!683007))

(declare-fun m!683009 () Bool)

(assert (=> start!64688 m!683009))

(declare-fun m!683011 () Bool)

(assert (=> start!64688 m!683011))

(assert (=> b!729347 m!682989))

(assert (=> b!729347 m!682989))

(declare-fun m!683013 () Bool)

(assert (=> b!729347 m!683013))

(declare-fun m!683015 () Bool)

(assert (=> b!729346 m!683015))

(declare-fun m!683017 () Bool)

(assert (=> b!729346 m!683017))

(declare-fun m!683019 () Bool)

(assert (=> b!729346 m!683019))

(declare-fun m!683021 () Bool)

(assert (=> b!729346 m!683021))

(assert (=> b!729346 m!683015))

(declare-fun m!683023 () Bool)

(assert (=> b!729346 m!683023))

(declare-fun m!683025 () Bool)

(assert (=> b!729339 m!683025))

(declare-fun m!683027 () Bool)

(assert (=> b!729336 m!683027))

(declare-fun m!683029 () Bool)

(assert (=> b!729337 m!683029))

(assert (=> b!729349 m!682989))

(assert (=> b!729349 m!682989))

(declare-fun m!683031 () Bool)

(assert (=> b!729349 m!683031))

(assert (=> b!729349 m!683031))

(assert (=> b!729349 m!682989))

(declare-fun m!683033 () Bool)

(assert (=> b!729349 m!683033))

(push 1)

