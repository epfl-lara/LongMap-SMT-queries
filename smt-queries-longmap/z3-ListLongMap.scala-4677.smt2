; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65250 () Bool)

(assert start!65250)

(declare-fun b!735917 () Bool)

(declare-fun res!494284 () Bool)

(declare-fun e!411819 () Bool)

(assert (=> b!735917 (=> (not res!494284) (not e!411819))))

(declare-datatypes ((array!41293 0))(
  ( (array!41294 (arr!19756 (Array (_ BitVec 32) (_ BitVec 64))) (size!20176 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41293)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41293 (_ BitVec 32)) Bool)

(assert (=> b!735917 (= res!494284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!735918 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!411821 () Bool)

(declare-datatypes ((SeekEntryResult!7312 0))(
  ( (MissingZero!7312 (index!31616 (_ BitVec 32))) (Found!7312 (index!31617 (_ BitVec 32))) (Intermediate!7312 (undefined!8124 Bool) (index!31618 (_ BitVec 32)) (x!62786 (_ BitVec 32))) (Undefined!7312) (MissingVacant!7312 (index!31619 (_ BitVec 32))) )
))
(declare-fun lt!326174 () SeekEntryResult!7312)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41293 (_ BitVec 32)) SeekEntryResult!7312)

(assert (=> b!735918 (= e!411821 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19756 a!3186) j!159) a!3186 mask!3328) lt!326174))))

(declare-fun b!735919 () Bool)

(declare-fun res!494292 () Bool)

(declare-fun e!411827 () Bool)

(assert (=> b!735919 (=> (not res!494292) (not e!411827))))

(assert (=> b!735919 (= res!494292 e!411821)))

(declare-fun c!81201 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!735919 (= c!81201 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!735920 () Bool)

(declare-fun e!411823 () Bool)

(declare-fun e!411824 () Bool)

(assert (=> b!735920 (= e!411823 (not e!411824))))

(declare-fun res!494293 () Bool)

(assert (=> b!735920 (=> res!494293 e!411824)))

(declare-fun lt!326178 () SeekEntryResult!7312)

(get-info :version)

(assert (=> b!735920 (= res!494293 (or (not ((_ is Intermediate!7312) lt!326178)) (bvsge x!1131 (x!62786 lt!326178))))))

(declare-fun lt!326172 () SeekEntryResult!7312)

(assert (=> b!735920 (= lt!326172 (Found!7312 j!159))))

(declare-fun e!411817 () Bool)

(assert (=> b!735920 e!411817))

(declare-fun res!494282 () Bool)

(assert (=> b!735920 (=> (not res!494282) (not e!411817))))

(assert (=> b!735920 (= res!494282 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25021 0))(
  ( (Unit!25022) )
))
(declare-fun lt!326175 () Unit!25021)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41293 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25021)

(assert (=> b!735920 (= lt!326175 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!735921 () Bool)

(declare-fun res!494283 () Bool)

(declare-fun e!411818 () Bool)

(assert (=> b!735921 (=> res!494283 e!411818)))

(declare-fun e!411820 () Bool)

(assert (=> b!735921 (= res!494283 e!411820)))

(declare-fun c!81202 () Bool)

(declare-fun lt!326183 () Bool)

(assert (=> b!735921 (= c!81202 lt!326183)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!735922 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41293 (_ BitVec 32)) SeekEntryResult!7312)

(assert (=> b!735922 (= e!411821 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19756 a!3186) j!159) a!3186 mask!3328) (Found!7312 j!159)))))

(declare-fun b!735923 () Bool)

(declare-fun res!494295 () Bool)

(assert (=> b!735923 (=> (not res!494295) (not e!411819))))

(assert (=> b!735923 (= res!494295 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20176 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20176 a!3186))))))

(declare-fun b!735924 () Bool)

(declare-fun e!411822 () Unit!25021)

(declare-fun Unit!25023 () Unit!25021)

(assert (=> b!735924 (= e!411822 Unit!25023)))

(declare-fun lt!326179 () (_ BitVec 32))

(assert (=> b!735924 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326179 (select (arr!19756 a!3186) j!159) a!3186 mask!3328) lt!326174)))

(declare-fun b!735925 () Bool)

(assert (=> b!735925 (= e!411820 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326179 resIntermediateIndex!5 (select (arr!19756 a!3186) j!159) a!3186 mask!3328) lt!326172)))))

(declare-fun b!735926 () Bool)

(declare-fun res!494296 () Bool)

(assert (=> b!735926 (=> (not res!494296) (not e!411827))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!735926 (= res!494296 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19756 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!735927 () Bool)

(assert (=> b!735927 (= e!411827 e!411823)))

(declare-fun res!494287 () Bool)

(assert (=> b!735927 (=> (not res!494287) (not e!411823))))

(declare-fun lt!326180 () SeekEntryResult!7312)

(assert (=> b!735927 (= res!494287 (= lt!326180 lt!326178))))

(declare-fun lt!326173 () (_ BitVec 64))

(declare-fun lt!326181 () array!41293)

(assert (=> b!735927 (= lt!326178 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!326173 lt!326181 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735927 (= lt!326180 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!326173 mask!3328) lt!326173 lt!326181 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!735927 (= lt!326173 (select (store (arr!19756 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!735927 (= lt!326181 (array!41294 (store (arr!19756 a!3186) i!1173 k0!2102) (size!20176 a!3186)))))

(declare-fun b!735928 () Bool)

(declare-fun res!494290 () Bool)

(declare-fun e!411826 () Bool)

(assert (=> b!735928 (=> (not res!494290) (not e!411826))))

(assert (=> b!735928 (= res!494290 (and (= (size!20176 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20176 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20176 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!735929 () Bool)

(declare-fun res!494291 () Bool)

(assert (=> b!735929 (=> (not res!494291) (not e!411819))))

(declare-datatypes ((List!13665 0))(
  ( (Nil!13662) (Cons!13661 (h!14739 (_ BitVec 64)) (t!19972 List!13665)) )
))
(declare-fun arrayNoDuplicates!0 (array!41293 (_ BitVec 32) List!13665) Bool)

(assert (=> b!735929 (= res!494291 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13662))))

(declare-fun res!494289 () Bool)

(assert (=> start!65250 (=> (not res!494289) (not e!411826))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65250 (= res!494289 (validMask!0 mask!3328))))

(assert (=> start!65250 e!411826))

(assert (=> start!65250 true))

(declare-fun array_inv!15615 (array!41293) Bool)

(assert (=> start!65250 (array_inv!15615 a!3186)))

(declare-fun b!735930 () Bool)

(assert (=> b!735930 (= e!411826 e!411819)))

(declare-fun res!494285 () Bool)

(assert (=> b!735930 (=> (not res!494285) (not e!411819))))

(declare-fun lt!326177 () SeekEntryResult!7312)

(assert (=> b!735930 (= res!494285 (or (= lt!326177 (MissingZero!7312 i!1173)) (= lt!326177 (MissingVacant!7312 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41293 (_ BitVec 32)) SeekEntryResult!7312)

(assert (=> b!735930 (= lt!326177 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!735931 () Bool)

(declare-fun res!494294 () Bool)

(assert (=> b!735931 (=> (not res!494294) (not e!411826))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!735931 (= res!494294 (validKeyInArray!0 (select (arr!19756 a!3186) j!159)))))

(declare-fun b!735932 () Bool)

(assert (=> b!735932 (= e!411818 true)))

(declare-fun lt!326182 () SeekEntryResult!7312)

(assert (=> b!735932 (= lt!326182 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326179 lt!326173 lt!326181 mask!3328))))

(declare-fun b!735933 () Bool)

(declare-fun res!494298 () Bool)

(assert (=> b!735933 (=> (not res!494298) (not e!411826))))

(assert (=> b!735933 (= res!494298 (validKeyInArray!0 k0!2102))))

(declare-fun b!735934 () Bool)

(assert (=> b!735934 (= e!411820 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326179 (select (arr!19756 a!3186) j!159) a!3186 mask!3328) lt!326174)))))

(declare-fun b!735935 () Bool)

(declare-fun lt!326184 () SeekEntryResult!7312)

(declare-fun e!411828 () Bool)

(assert (=> b!735935 (= e!411828 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19756 a!3186) j!159) a!3186 mask!3328) lt!326184))))

(declare-fun b!735936 () Bool)

(assert (=> b!735936 (= e!411824 e!411818)))

(declare-fun res!494297 () Bool)

(assert (=> b!735936 (=> res!494297 e!411818)))

(assert (=> b!735936 (= res!494297 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!326179 #b00000000000000000000000000000000) (bvsge lt!326179 (size!20176 a!3186))))))

(declare-fun lt!326176 () Unit!25021)

(assert (=> b!735936 (= lt!326176 e!411822)))

(declare-fun c!81203 () Bool)

(assert (=> b!735936 (= c!81203 lt!326183)))

(assert (=> b!735936 (= lt!326183 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735936 (= lt!326179 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!735937 () Bool)

(assert (=> b!735937 (= e!411819 e!411827)))

(declare-fun res!494299 () Bool)

(assert (=> b!735937 (=> (not res!494299) (not e!411827))))

(assert (=> b!735937 (= res!494299 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19756 a!3186) j!159) mask!3328) (select (arr!19756 a!3186) j!159) a!3186 mask!3328) lt!326174))))

(assert (=> b!735937 (= lt!326174 (Intermediate!7312 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!735938 () Bool)

(declare-fun Unit!25024 () Unit!25021)

(assert (=> b!735938 (= e!411822 Unit!25024)))

(declare-fun lt!326171 () SeekEntryResult!7312)

(assert (=> b!735938 (= lt!326171 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19756 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!735938 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326179 resIntermediateIndex!5 (select (arr!19756 a!3186) j!159) a!3186 mask!3328) lt!326172)))

(declare-fun b!735939 () Bool)

(declare-fun res!494286 () Bool)

(assert (=> b!735939 (=> (not res!494286) (not e!411826))))

(declare-fun arrayContainsKey!0 (array!41293 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!735939 (= res!494286 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!735940 () Bool)

(assert (=> b!735940 (= e!411817 e!411828)))

(declare-fun res!494288 () Bool)

(assert (=> b!735940 (=> (not res!494288) (not e!411828))))

(assert (=> b!735940 (= res!494288 (= (seekEntryOrOpen!0 (select (arr!19756 a!3186) j!159) a!3186 mask!3328) lt!326184))))

(assert (=> b!735940 (= lt!326184 (Found!7312 j!159))))

(assert (= (and start!65250 res!494289) b!735928))

(assert (= (and b!735928 res!494290) b!735931))

(assert (= (and b!735931 res!494294) b!735933))

(assert (= (and b!735933 res!494298) b!735939))

(assert (= (and b!735939 res!494286) b!735930))

(assert (= (and b!735930 res!494285) b!735917))

(assert (= (and b!735917 res!494284) b!735929))

(assert (= (and b!735929 res!494291) b!735923))

(assert (= (and b!735923 res!494295) b!735937))

(assert (= (and b!735937 res!494299) b!735926))

(assert (= (and b!735926 res!494296) b!735919))

(assert (= (and b!735919 c!81201) b!735918))

(assert (= (and b!735919 (not c!81201)) b!735922))

(assert (= (and b!735919 res!494292) b!735927))

(assert (= (and b!735927 res!494287) b!735920))

(assert (= (and b!735920 res!494282) b!735940))

(assert (= (and b!735940 res!494288) b!735935))

(assert (= (and b!735920 (not res!494293)) b!735936))

(assert (= (and b!735936 c!81203) b!735924))

(assert (= (and b!735936 (not c!81203)) b!735938))

(assert (= (and b!735936 (not res!494297)) b!735921))

(assert (= (and b!735921 c!81202) b!735934))

(assert (= (and b!735921 (not c!81202)) b!735925))

(assert (= (and b!735921 (not res!494283)) b!735932))

(declare-fun m!688779 () Bool)

(assert (=> b!735929 m!688779))

(declare-fun m!688781 () Bool)

(assert (=> b!735917 m!688781))

(declare-fun m!688783 () Bool)

(assert (=> b!735936 m!688783))

(declare-fun m!688785 () Bool)

(assert (=> b!735926 m!688785))

(declare-fun m!688787 () Bool)

(assert (=> b!735938 m!688787))

(assert (=> b!735938 m!688787))

(declare-fun m!688789 () Bool)

(assert (=> b!735938 m!688789))

(assert (=> b!735938 m!688787))

(declare-fun m!688791 () Bool)

(assert (=> b!735938 m!688791))

(declare-fun m!688793 () Bool)

(assert (=> b!735932 m!688793))

(assert (=> b!735918 m!688787))

(assert (=> b!735918 m!688787))

(declare-fun m!688795 () Bool)

(assert (=> b!735918 m!688795))

(assert (=> b!735935 m!688787))

(assert (=> b!735935 m!688787))

(declare-fun m!688797 () Bool)

(assert (=> b!735935 m!688797))

(declare-fun m!688799 () Bool)

(assert (=> b!735920 m!688799))

(declare-fun m!688801 () Bool)

(assert (=> b!735920 m!688801))

(declare-fun m!688803 () Bool)

(assert (=> b!735927 m!688803))

(declare-fun m!688805 () Bool)

(assert (=> b!735927 m!688805))

(declare-fun m!688807 () Bool)

(assert (=> b!735927 m!688807))

(assert (=> b!735927 m!688803))

(declare-fun m!688809 () Bool)

(assert (=> b!735927 m!688809))

(declare-fun m!688811 () Bool)

(assert (=> b!735927 m!688811))

(assert (=> b!735925 m!688787))

(assert (=> b!735925 m!688787))

(assert (=> b!735925 m!688791))

(assert (=> b!735931 m!688787))

(assert (=> b!735931 m!688787))

(declare-fun m!688813 () Bool)

(assert (=> b!735931 m!688813))

(declare-fun m!688815 () Bool)

(assert (=> start!65250 m!688815))

(declare-fun m!688817 () Bool)

(assert (=> start!65250 m!688817))

(assert (=> b!735924 m!688787))

(assert (=> b!735924 m!688787))

(declare-fun m!688819 () Bool)

(assert (=> b!735924 m!688819))

(declare-fun m!688821 () Bool)

(assert (=> b!735939 m!688821))

(declare-fun m!688823 () Bool)

(assert (=> b!735930 m!688823))

(assert (=> b!735934 m!688787))

(assert (=> b!735934 m!688787))

(assert (=> b!735934 m!688819))

(assert (=> b!735937 m!688787))

(assert (=> b!735937 m!688787))

(declare-fun m!688825 () Bool)

(assert (=> b!735937 m!688825))

(assert (=> b!735937 m!688825))

(assert (=> b!735937 m!688787))

(declare-fun m!688827 () Bool)

(assert (=> b!735937 m!688827))

(assert (=> b!735940 m!688787))

(assert (=> b!735940 m!688787))

(declare-fun m!688829 () Bool)

(assert (=> b!735940 m!688829))

(declare-fun m!688831 () Bool)

(assert (=> b!735933 m!688831))

(assert (=> b!735922 m!688787))

(assert (=> b!735922 m!688787))

(assert (=> b!735922 m!688789))

(check-sat (not b!735940) (not b!735920) (not b!735934) (not b!735932) (not b!735917) (not b!735929) (not b!735939) (not b!735938) (not b!735930) (not b!735918) (not b!735935) (not b!735924) (not b!735925) (not b!735931) (not start!65250) (not b!735922) (not b!735933) (not b!735936) (not b!735937) (not b!735927))
(check-sat)
