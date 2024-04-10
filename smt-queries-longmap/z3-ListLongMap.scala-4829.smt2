; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66382 () Bool)

(assert start!66382)

(declare-fun b!764993 () Bool)

(declare-fun e!426056 () Bool)

(declare-fun e!426057 () Bool)

(assert (=> b!764993 (= e!426056 e!426057)))

(declare-fun res!517537 () Bool)

(assert (=> b!764993 (=> (not res!517537) (not e!426057))))

(declare-fun lt!340369 () (_ BitVec 64))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((array!42224 0))(
  ( (array!42225 (arr!20218 (Array (_ BitVec 32) (_ BitVec 64))) (size!20639 (_ BitVec 32))) )
))
(declare-fun lt!340370 () array!42224)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7818 0))(
  ( (MissingZero!7818 (index!33640 (_ BitVec 32))) (Found!7818 (index!33641 (_ BitVec 32))) (Intermediate!7818 (undefined!8630 Bool) (index!33642 (_ BitVec 32)) (x!64543 (_ BitVec 32))) (Undefined!7818) (MissingVacant!7818 (index!33643 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42224 (_ BitVec 32)) SeekEntryResult!7818)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!764993 (= res!517537 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340369 mask!3328) lt!340369 lt!340370 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340369 lt!340370 mask!3328)))))

(declare-fun a!3186 () array!42224)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!764993 (= lt!340369 (select (store (arr!20218 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!764993 (= lt!340370 (array!42225 (store (arr!20218 a!3186) i!1173 k0!2102) (size!20639 a!3186)))))

(declare-fun b!764994 () Bool)

(assert (=> b!764994 (= e!426057 (not true))))

(declare-fun e!426055 () Bool)

(assert (=> b!764994 e!426055))

(declare-fun res!517543 () Bool)

(assert (=> b!764994 (=> (not res!517543) (not e!426055))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42224 (_ BitVec 32)) Bool)

(assert (=> b!764994 (= res!517543 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26362 0))(
  ( (Unit!26363) )
))
(declare-fun lt!340367 () Unit!26362)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42224 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26362)

(assert (=> b!764994 (= lt!340367 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!764995 () Bool)

(declare-fun e!426058 () Bool)

(declare-fun e!426054 () Bool)

(assert (=> b!764995 (= e!426058 e!426054)))

(declare-fun res!517533 () Bool)

(assert (=> b!764995 (=> (not res!517533) (not e!426054))))

(declare-fun lt!340366 () SeekEntryResult!7818)

(assert (=> b!764995 (= res!517533 (or (= lt!340366 (MissingZero!7818 i!1173)) (= lt!340366 (MissingVacant!7818 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42224 (_ BitVec 32)) SeekEntryResult!7818)

(assert (=> b!764995 (= lt!340366 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun e!426060 () Bool)

(declare-fun lt!340368 () SeekEntryResult!7818)

(declare-fun b!764996 () Bool)

(assert (=> b!764996 (= e!426060 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20218 a!3186) j!159) a!3186 mask!3328) lt!340368))))

(declare-fun b!764997 () Bool)

(assert (=> b!764997 (= e!426054 e!426056)))

(declare-fun res!517544 () Bool)

(assert (=> b!764997 (=> (not res!517544) (not e!426056))))

(assert (=> b!764997 (= res!517544 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20218 a!3186) j!159) mask!3328) (select (arr!20218 a!3186) j!159) a!3186 mask!3328) lt!340368))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!764997 (= lt!340368 (Intermediate!7818 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!764998 () Bool)

(declare-fun res!517542 () Bool)

(assert (=> b!764998 (=> (not res!517542) (not e!426058))))

(assert (=> b!764998 (= res!517542 (and (= (size!20639 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20639 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20639 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!517545 () Bool)

(assert (=> start!66382 (=> (not res!517545) (not e!426058))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66382 (= res!517545 (validMask!0 mask!3328))))

(assert (=> start!66382 e!426058))

(assert (=> start!66382 true))

(declare-fun array_inv!16014 (array!42224) Bool)

(assert (=> start!66382 (array_inv!16014 a!3186)))

(declare-fun b!764999 () Bool)

(declare-fun res!517535 () Bool)

(assert (=> b!764999 (=> (not res!517535) (not e!426058))))

(declare-fun arrayContainsKey!0 (array!42224 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!764999 (= res!517535 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!765000 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42224 (_ BitVec 32)) SeekEntryResult!7818)

(assert (=> b!765000 (= e!426060 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20218 a!3186) j!159) a!3186 mask!3328) (Found!7818 j!159)))))

(declare-fun b!765001 () Bool)

(declare-fun res!517540 () Bool)

(assert (=> b!765001 (=> (not res!517540) (not e!426054))))

(declare-datatypes ((List!14220 0))(
  ( (Nil!14217) (Cons!14216 (h!15303 (_ BitVec 64)) (t!20535 List!14220)) )
))
(declare-fun arrayNoDuplicates!0 (array!42224 (_ BitVec 32) List!14220) Bool)

(assert (=> b!765001 (= res!517540 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14217))))

(declare-fun b!765002 () Bool)

(declare-fun res!517538 () Bool)

(assert (=> b!765002 (=> (not res!517538) (not e!426056))))

(assert (=> b!765002 (= res!517538 e!426060)))

(declare-fun c!84118 () Bool)

(assert (=> b!765002 (= c!84118 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!765003 () Bool)

(declare-fun res!517546 () Bool)

(assert (=> b!765003 (=> (not res!517546) (not e!426058))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!765003 (= res!517546 (validKeyInArray!0 (select (arr!20218 a!3186) j!159)))))

(declare-fun b!765004 () Bool)

(declare-fun res!517541 () Bool)

(assert (=> b!765004 (=> (not res!517541) (not e!426054))))

(assert (=> b!765004 (= res!517541 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20639 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20639 a!3186))))))

(declare-fun b!765005 () Bool)

(declare-fun res!517536 () Bool)

(assert (=> b!765005 (=> (not res!517536) (not e!426058))))

(assert (=> b!765005 (= res!517536 (validKeyInArray!0 k0!2102))))

(declare-fun b!765006 () Bool)

(declare-fun res!517539 () Bool)

(assert (=> b!765006 (=> (not res!517539) (not e!426056))))

(assert (=> b!765006 (= res!517539 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20218 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!765007 () Bool)

(assert (=> b!765007 (= e!426055 (= (seekEntryOrOpen!0 (select (arr!20218 a!3186) j!159) a!3186 mask!3328) (Found!7818 j!159)))))

(declare-fun b!765008 () Bool)

(declare-fun res!517534 () Bool)

(assert (=> b!765008 (=> (not res!517534) (not e!426054))))

(assert (=> b!765008 (= res!517534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!66382 res!517545) b!764998))

(assert (= (and b!764998 res!517542) b!765003))

(assert (= (and b!765003 res!517546) b!765005))

(assert (= (and b!765005 res!517536) b!764999))

(assert (= (and b!764999 res!517535) b!764995))

(assert (= (and b!764995 res!517533) b!765008))

(assert (= (and b!765008 res!517534) b!765001))

(assert (= (and b!765001 res!517540) b!765004))

(assert (= (and b!765004 res!517541) b!764997))

(assert (= (and b!764997 res!517544) b!765006))

(assert (= (and b!765006 res!517539) b!765002))

(assert (= (and b!765002 c!84118) b!764996))

(assert (= (and b!765002 (not c!84118)) b!765000))

(assert (= (and b!765002 res!517538) b!764993))

(assert (= (and b!764993 res!517537) b!764994))

(assert (= (and b!764994 res!517543) b!765007))

(declare-fun m!711215 () Bool)

(assert (=> b!764997 m!711215))

(assert (=> b!764997 m!711215))

(declare-fun m!711217 () Bool)

(assert (=> b!764997 m!711217))

(assert (=> b!764997 m!711217))

(assert (=> b!764997 m!711215))

(declare-fun m!711219 () Bool)

(assert (=> b!764997 m!711219))

(declare-fun m!711221 () Bool)

(assert (=> b!764994 m!711221))

(declare-fun m!711223 () Bool)

(assert (=> b!764994 m!711223))

(declare-fun m!711225 () Bool)

(assert (=> b!765006 m!711225))

(declare-fun m!711227 () Bool)

(assert (=> b!765005 m!711227))

(declare-fun m!711229 () Bool)

(assert (=> b!764999 m!711229))

(declare-fun m!711231 () Bool)

(assert (=> b!765008 m!711231))

(assert (=> b!765000 m!711215))

(assert (=> b!765000 m!711215))

(declare-fun m!711233 () Bool)

(assert (=> b!765000 m!711233))

(declare-fun m!711235 () Bool)

(assert (=> b!765001 m!711235))

(assert (=> b!765003 m!711215))

(assert (=> b!765003 m!711215))

(declare-fun m!711237 () Bool)

(assert (=> b!765003 m!711237))

(assert (=> b!765007 m!711215))

(assert (=> b!765007 m!711215))

(declare-fun m!711239 () Bool)

(assert (=> b!765007 m!711239))

(assert (=> b!764996 m!711215))

(assert (=> b!764996 m!711215))

(declare-fun m!711241 () Bool)

(assert (=> b!764996 m!711241))

(declare-fun m!711243 () Bool)

(assert (=> b!764995 m!711243))

(declare-fun m!711245 () Bool)

(assert (=> start!66382 m!711245))

(declare-fun m!711247 () Bool)

(assert (=> start!66382 m!711247))

(declare-fun m!711249 () Bool)

(assert (=> b!764993 m!711249))

(declare-fun m!711251 () Bool)

(assert (=> b!764993 m!711251))

(declare-fun m!711253 () Bool)

(assert (=> b!764993 m!711253))

(declare-fun m!711255 () Bool)

(assert (=> b!764993 m!711255))

(declare-fun m!711257 () Bool)

(assert (=> b!764993 m!711257))

(assert (=> b!764993 m!711255))

(check-sat (not b!764993) (not b!765001) (not b!764997) (not start!66382) (not b!765003) (not b!765000) (not b!764994) (not b!765007) (not b!764995) (not b!765008) (not b!765005) (not b!764999) (not b!764996))
(check-sat)
