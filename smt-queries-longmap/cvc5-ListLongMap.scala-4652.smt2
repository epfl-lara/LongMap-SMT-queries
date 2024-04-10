; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64684 () Bool)

(assert start!64684)

(declare-fun b!729226 () Bool)

(declare-fun e!408156 () Bool)

(declare-fun e!408161 () Bool)

(assert (=> b!729226 (= e!408156 e!408161)))

(declare-fun res!489658 () Bool)

(assert (=> b!729226 (=> (not res!489658) (not e!408161))))

(declare-datatypes ((array!41133 0))(
  ( (array!41134 (arr!19686 (Array (_ BitVec 32) (_ BitVec 64))) (size!20107 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41133)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7286 0))(
  ( (MissingZero!7286 (index!31512 (_ BitVec 32))) (Found!7286 (index!31513 (_ BitVec 32))) (Intermediate!7286 (undefined!8098 Bool) (index!31514 (_ BitVec 32)) (x!62500 (_ BitVec 32))) (Undefined!7286) (MissingVacant!7286 (index!31515 (_ BitVec 32))) )
))
(declare-fun lt!323056 () SeekEntryResult!7286)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41133 (_ BitVec 32)) SeekEntryResult!7286)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729226 (= res!489658 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19686 a!3186) j!159) mask!3328) (select (arr!19686 a!3186) j!159) a!3186 mask!3328) lt!323056))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!729226 (= lt!323056 (Intermediate!7286 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!729227 () Bool)

(declare-fun res!489661 () Bool)

(assert (=> b!729227 (=> (not res!489661) (not e!408161))))

(declare-fun e!408162 () Bool)

(assert (=> b!729227 (= res!489661 e!408162)))

(declare-fun c!80161 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!729227 (= c!80161 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!729228 () Bool)

(declare-fun res!489654 () Bool)

(declare-fun e!408163 () Bool)

(assert (=> b!729228 (=> (not res!489654) (not e!408163))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!729228 (= res!489654 (validKeyInArray!0 (select (arr!19686 a!3186) j!159)))))

(declare-fun b!729229 () Bool)

(declare-fun e!408164 () Bool)

(declare-fun e!408157 () Bool)

(assert (=> b!729229 (= e!408164 (not e!408157))))

(declare-fun res!489666 () Bool)

(assert (=> b!729229 (=> res!489666 e!408157)))

(declare-fun lt!323060 () SeekEntryResult!7286)

(assert (=> b!729229 (= res!489666 (or (not (is-Intermediate!7286 lt!323060)) (bvsge x!1131 (x!62500 lt!323060))))))

(declare-fun e!408158 () Bool)

(assert (=> b!729229 e!408158))

(declare-fun res!489659 () Bool)

(assert (=> b!729229 (=> (not res!489659) (not e!408158))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41133 (_ BitVec 32)) Bool)

(assert (=> b!729229 (= res!489659 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24890 0))(
  ( (Unit!24891) )
))
(declare-fun lt!323059 () Unit!24890)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41133 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24890)

(assert (=> b!729229 (= lt!323059 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun lt!323055 () SeekEntryResult!7286)

(declare-fun b!729230 () Bool)

(declare-fun e!408160 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41133 (_ BitVec 32)) SeekEntryResult!7286)

(assert (=> b!729230 (= e!408160 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19686 a!3186) j!159) a!3186 mask!3328) lt!323055))))

(declare-fun b!729231 () Bool)

(assert (=> b!729231 (= e!408161 e!408164)))

(declare-fun res!489668 () Bool)

(assert (=> b!729231 (=> (not res!489668) (not e!408164))))

(declare-fun lt!323061 () SeekEntryResult!7286)

(assert (=> b!729231 (= res!489668 (= lt!323061 lt!323060))))

(declare-fun lt!323058 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!323057 () array!41133)

(assert (=> b!729231 (= lt!323060 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323058 lt!323057 mask!3328))))

(assert (=> b!729231 (= lt!323061 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323058 mask!3328) lt!323058 lt!323057 mask!3328))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!729231 (= lt!323058 (select (store (arr!19686 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!729231 (= lt!323057 (array!41134 (store (arr!19686 a!3186) i!1173 k!2102) (size!20107 a!3186)))))

(declare-fun b!729232 () Bool)

(declare-fun res!489655 () Bool)

(assert (=> b!729232 (=> (not res!489655) (not e!408163))))

(assert (=> b!729232 (= res!489655 (validKeyInArray!0 k!2102))))

(declare-fun b!729234 () Bool)

(declare-fun res!489653 () Bool)

(assert (=> b!729234 (=> (not res!489653) (not e!408156))))

(assert (=> b!729234 (= res!489653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!729235 () Bool)

(assert (=> b!729235 (= e!408162 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19686 a!3186) j!159) a!3186 mask!3328) lt!323056))))

(declare-fun b!729236 () Bool)

(assert (=> b!729236 (= e!408163 e!408156)))

(declare-fun res!489662 () Bool)

(assert (=> b!729236 (=> (not res!489662) (not e!408156))))

(declare-fun lt!323062 () SeekEntryResult!7286)

(assert (=> b!729236 (= res!489662 (or (= lt!323062 (MissingZero!7286 i!1173)) (= lt!323062 (MissingVacant!7286 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41133 (_ BitVec 32)) SeekEntryResult!7286)

(assert (=> b!729236 (= lt!323062 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!729237 () Bool)

(declare-fun res!489656 () Bool)

(assert (=> b!729237 (=> (not res!489656) (not e!408163))))

(declare-fun arrayContainsKey!0 (array!41133 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!729237 (= res!489656 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!729238 () Bool)

(declare-fun res!489657 () Bool)

(assert (=> b!729238 (=> (not res!489657) (not e!408161))))

(assert (=> b!729238 (= res!489657 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19686 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!729239 () Bool)

(declare-fun res!489665 () Bool)

(assert (=> b!729239 (=> (not res!489665) (not e!408156))))

(declare-datatypes ((List!13688 0))(
  ( (Nil!13685) (Cons!13684 (h!14744 (_ BitVec 64)) (t!20003 List!13688)) )
))
(declare-fun arrayNoDuplicates!0 (array!41133 (_ BitVec 32) List!13688) Bool)

(assert (=> b!729239 (= res!489665 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13685))))

(declare-fun b!729240 () Bool)

(assert (=> b!729240 (= e!408157 true)))

(declare-fun lt!323063 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729240 (= lt!323063 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!729233 () Bool)

(assert (=> b!729233 (= e!408158 e!408160)))

(declare-fun res!489660 () Bool)

(assert (=> b!729233 (=> (not res!489660) (not e!408160))))

(assert (=> b!729233 (= res!489660 (= (seekEntryOrOpen!0 (select (arr!19686 a!3186) j!159) a!3186 mask!3328) lt!323055))))

(assert (=> b!729233 (= lt!323055 (Found!7286 j!159))))

(declare-fun res!489663 () Bool)

(assert (=> start!64684 (=> (not res!489663) (not e!408163))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64684 (= res!489663 (validMask!0 mask!3328))))

(assert (=> start!64684 e!408163))

(assert (=> start!64684 true))

(declare-fun array_inv!15482 (array!41133) Bool)

(assert (=> start!64684 (array_inv!15482 a!3186)))

(declare-fun b!729241 () Bool)

(declare-fun res!489664 () Bool)

(assert (=> b!729241 (=> (not res!489664) (not e!408156))))

(assert (=> b!729241 (= res!489664 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20107 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20107 a!3186))))))

(declare-fun b!729242 () Bool)

(assert (=> b!729242 (= e!408162 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19686 a!3186) j!159) a!3186 mask!3328) (Found!7286 j!159)))))

(declare-fun b!729243 () Bool)

(declare-fun res!489667 () Bool)

(assert (=> b!729243 (=> (not res!489667) (not e!408163))))

(assert (=> b!729243 (= res!489667 (and (= (size!20107 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20107 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20107 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!64684 res!489663) b!729243))

(assert (= (and b!729243 res!489667) b!729228))

(assert (= (and b!729228 res!489654) b!729232))

(assert (= (and b!729232 res!489655) b!729237))

(assert (= (and b!729237 res!489656) b!729236))

(assert (= (and b!729236 res!489662) b!729234))

(assert (= (and b!729234 res!489653) b!729239))

(assert (= (and b!729239 res!489665) b!729241))

(assert (= (and b!729241 res!489664) b!729226))

(assert (= (and b!729226 res!489658) b!729238))

(assert (= (and b!729238 res!489657) b!729227))

(assert (= (and b!729227 c!80161) b!729235))

(assert (= (and b!729227 (not c!80161)) b!729242))

(assert (= (and b!729227 res!489661) b!729231))

(assert (= (and b!729231 res!489668) b!729229))

(assert (= (and b!729229 res!489659) b!729233))

(assert (= (and b!729233 res!489660) b!729230))

(assert (= (and b!729229 (not res!489666)) b!729240))

(declare-fun m!682891 () Bool)

(assert (=> b!729242 m!682891))

(assert (=> b!729242 m!682891))

(declare-fun m!682893 () Bool)

(assert (=> b!729242 m!682893))

(declare-fun m!682895 () Bool)

(assert (=> b!729239 m!682895))

(declare-fun m!682897 () Bool)

(assert (=> b!729236 m!682897))

(declare-fun m!682899 () Bool)

(assert (=> b!729231 m!682899))

(declare-fun m!682901 () Bool)

(assert (=> b!729231 m!682901))

(declare-fun m!682903 () Bool)

(assert (=> b!729231 m!682903))

(declare-fun m!682905 () Bool)

(assert (=> b!729231 m!682905))

(assert (=> b!729231 m!682899))

(declare-fun m!682907 () Bool)

(assert (=> b!729231 m!682907))

(assert (=> b!729235 m!682891))

(assert (=> b!729235 m!682891))

(declare-fun m!682909 () Bool)

(assert (=> b!729235 m!682909))

(declare-fun m!682911 () Bool)

(assert (=> start!64684 m!682911))

(declare-fun m!682913 () Bool)

(assert (=> start!64684 m!682913))

(declare-fun m!682915 () Bool)

(assert (=> b!729240 m!682915))

(assert (=> b!729228 m!682891))

(assert (=> b!729228 m!682891))

(declare-fun m!682917 () Bool)

(assert (=> b!729228 m!682917))

(declare-fun m!682919 () Bool)

(assert (=> b!729238 m!682919))

(assert (=> b!729230 m!682891))

(assert (=> b!729230 m!682891))

(declare-fun m!682921 () Bool)

(assert (=> b!729230 m!682921))

(assert (=> b!729233 m!682891))

(assert (=> b!729233 m!682891))

(declare-fun m!682923 () Bool)

(assert (=> b!729233 m!682923))

(declare-fun m!682925 () Bool)

(assert (=> b!729237 m!682925))

(declare-fun m!682927 () Bool)

(assert (=> b!729232 m!682927))

(assert (=> b!729226 m!682891))

(assert (=> b!729226 m!682891))

(declare-fun m!682929 () Bool)

(assert (=> b!729226 m!682929))

(assert (=> b!729226 m!682929))

(assert (=> b!729226 m!682891))

(declare-fun m!682931 () Bool)

(assert (=> b!729226 m!682931))

(declare-fun m!682933 () Bool)

(assert (=> b!729234 m!682933))

(declare-fun m!682935 () Bool)

(assert (=> b!729229 m!682935))

(declare-fun m!682937 () Bool)

(assert (=> b!729229 m!682937))

(push 1)

