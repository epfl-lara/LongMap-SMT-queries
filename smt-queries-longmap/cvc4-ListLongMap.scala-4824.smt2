; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66288 () Bool)

(assert start!66288)

(declare-fun b!763968 () Bool)

(declare-fun e!425566 () Bool)

(declare-fun e!425563 () Bool)

(assert (=> b!763968 (= e!425566 e!425563)))

(declare-fun res!516871 () Bool)

(assert (=> b!763968 (=> (not res!516871) (not e!425563))))

(declare-datatypes ((SeekEntryResult!7804 0))(
  ( (MissingZero!7804 (index!33584 (_ BitVec 32))) (Found!7804 (index!33585 (_ BitVec 32))) (Intermediate!7804 (undefined!8616 Bool) (index!33586 (_ BitVec 32)) (x!64480 (_ BitVec 32))) (Undefined!7804) (MissingVacant!7804 (index!33587 (_ BitVec 32))) )
))
(declare-fun lt!340001 () SeekEntryResult!7804)

(declare-datatypes ((array!42193 0))(
  ( (array!42194 (arr!20204 (Array (_ BitVec 32) (_ BitVec 64))) (size!20625 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42193)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42193 (_ BitVec 32)) SeekEntryResult!7804)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!763968 (= res!516871 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20204 a!3186) j!159) mask!3328) (select (arr!20204 a!3186) j!159) a!3186 mask!3328) lt!340001))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!763968 (= lt!340001 (Intermediate!7804 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!763969 () Bool)

(declare-fun res!516873 () Bool)

(assert (=> b!763969 (=> (not res!516873) (not e!425563))))

(declare-fun e!425567 () Bool)

(assert (=> b!763969 (= res!516873 e!425567)))

(declare-fun c!83938 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!763969 (= c!83938 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!763970 () Bool)

(declare-fun e!425565 () Bool)

(assert (=> b!763970 (= e!425565 e!425566)))

(declare-fun res!516865 () Bool)

(assert (=> b!763970 (=> (not res!516865) (not e!425566))))

(declare-fun lt!339999 () SeekEntryResult!7804)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!763970 (= res!516865 (or (= lt!339999 (MissingZero!7804 i!1173)) (= lt!339999 (MissingVacant!7804 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42193 (_ BitVec 32)) SeekEntryResult!7804)

(assert (=> b!763970 (= lt!339999 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun res!516875 () Bool)

(assert (=> start!66288 (=> (not res!516875) (not e!425565))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66288 (= res!516875 (validMask!0 mask!3328))))

(assert (=> start!66288 e!425565))

(assert (=> start!66288 true))

(declare-fun array_inv!16000 (array!42193) Bool)

(assert (=> start!66288 (array_inv!16000 a!3186)))

(declare-fun b!763971 () Bool)

(declare-fun res!516876 () Bool)

(assert (=> b!763971 (=> (not res!516876) (not e!425566))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!763971 (= res!516876 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20625 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20625 a!3186))))))

(declare-fun b!763972 () Bool)

(declare-fun e!425568 () Bool)

(assert (=> b!763972 (= e!425568 (bvsgt #b00000000000000000000000000000000 (size!20625 a!3186)))))

(declare-fun b!763973 () Bool)

(declare-fun res!516869 () Bool)

(assert (=> b!763973 (=> (not res!516869) (not e!425565))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!763973 (= res!516869 (validKeyInArray!0 (select (arr!20204 a!3186) j!159)))))

(declare-fun b!763974 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42193 (_ BitVec 32)) SeekEntryResult!7804)

(assert (=> b!763974 (= e!425567 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20204 a!3186) j!159) a!3186 mask!3328) (Found!7804 j!159)))))

(declare-fun b!763975 () Bool)

(assert (=> b!763975 (= e!425563 e!425568)))

(declare-fun res!516872 () Bool)

(assert (=> b!763975 (=> (not res!516872) (not e!425568))))

(declare-fun lt!340000 () (_ BitVec 64))

(declare-fun lt!339998 () array!42193)

(assert (=> b!763975 (= res!516872 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340000 mask!3328) lt!340000 lt!339998 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340000 lt!339998 mask!3328)))))

(assert (=> b!763975 (= lt!340000 (select (store (arr!20204 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!763975 (= lt!339998 (array!42194 (store (arr!20204 a!3186) i!1173 k!2102) (size!20625 a!3186)))))

(declare-fun b!763976 () Bool)

(assert (=> b!763976 (= e!425567 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20204 a!3186) j!159) a!3186 mask!3328) lt!340001))))

(declare-fun b!763977 () Bool)

(declare-fun res!516870 () Bool)

(assert (=> b!763977 (=> (not res!516870) (not e!425565))))

(assert (=> b!763977 (= res!516870 (and (= (size!20625 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20625 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20625 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!763978 () Bool)

(declare-fun res!516866 () Bool)

(assert (=> b!763978 (=> (not res!516866) (not e!425565))))

(assert (=> b!763978 (= res!516866 (validKeyInArray!0 k!2102))))

(declare-fun b!763979 () Bool)

(declare-fun res!516877 () Bool)

(assert (=> b!763979 (=> (not res!516877) (not e!425566))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42193 (_ BitVec 32)) Bool)

(assert (=> b!763979 (= res!516877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!763980 () Bool)

(declare-fun res!516868 () Bool)

(assert (=> b!763980 (=> (not res!516868) (not e!425565))))

(declare-fun arrayContainsKey!0 (array!42193 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!763980 (= res!516868 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!763981 () Bool)

(declare-fun res!516874 () Bool)

(assert (=> b!763981 (=> (not res!516874) (not e!425563))))

(assert (=> b!763981 (= res!516874 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20204 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!763982 () Bool)

(declare-fun res!516867 () Bool)

(assert (=> b!763982 (=> (not res!516867) (not e!425566))))

(declare-datatypes ((List!14206 0))(
  ( (Nil!14203) (Cons!14202 (h!15286 (_ BitVec 64)) (t!20521 List!14206)) )
))
(declare-fun arrayNoDuplicates!0 (array!42193 (_ BitVec 32) List!14206) Bool)

(assert (=> b!763982 (= res!516867 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14203))))

(assert (= (and start!66288 res!516875) b!763977))

(assert (= (and b!763977 res!516870) b!763973))

(assert (= (and b!763973 res!516869) b!763978))

(assert (= (and b!763978 res!516866) b!763980))

(assert (= (and b!763980 res!516868) b!763970))

(assert (= (and b!763970 res!516865) b!763979))

(assert (= (and b!763979 res!516877) b!763982))

(assert (= (and b!763982 res!516867) b!763971))

(assert (= (and b!763971 res!516876) b!763968))

(assert (= (and b!763968 res!516871) b!763981))

(assert (= (and b!763981 res!516874) b!763969))

(assert (= (and b!763969 c!83938) b!763976))

(assert (= (and b!763969 (not c!83938)) b!763974))

(assert (= (and b!763969 res!516873) b!763975))

(assert (= (and b!763975 res!516872) b!763972))

(declare-fun m!710389 () Bool)

(assert (=> b!763980 m!710389))

(declare-fun m!710391 () Bool)

(assert (=> b!763976 m!710391))

(assert (=> b!763976 m!710391))

(declare-fun m!710393 () Bool)

(assert (=> b!763976 m!710393))

(declare-fun m!710395 () Bool)

(assert (=> start!66288 m!710395))

(declare-fun m!710397 () Bool)

(assert (=> start!66288 m!710397))

(assert (=> b!763973 m!710391))

(assert (=> b!763973 m!710391))

(declare-fun m!710399 () Bool)

(assert (=> b!763973 m!710399))

(declare-fun m!710401 () Bool)

(assert (=> b!763978 m!710401))

(declare-fun m!710403 () Bool)

(assert (=> b!763979 m!710403))

(assert (=> b!763968 m!710391))

(assert (=> b!763968 m!710391))

(declare-fun m!710405 () Bool)

(assert (=> b!763968 m!710405))

(assert (=> b!763968 m!710405))

(assert (=> b!763968 m!710391))

(declare-fun m!710407 () Bool)

(assert (=> b!763968 m!710407))

(declare-fun m!710409 () Bool)

(assert (=> b!763981 m!710409))

(declare-fun m!710411 () Bool)

(assert (=> b!763975 m!710411))

(declare-fun m!710413 () Bool)

(assert (=> b!763975 m!710413))

(declare-fun m!710415 () Bool)

(assert (=> b!763975 m!710415))

(assert (=> b!763975 m!710411))

(declare-fun m!710417 () Bool)

(assert (=> b!763975 m!710417))

(declare-fun m!710419 () Bool)

(assert (=> b!763975 m!710419))

(declare-fun m!710421 () Bool)

(assert (=> b!763982 m!710421))

(assert (=> b!763974 m!710391))

(assert (=> b!763974 m!710391))

(declare-fun m!710423 () Bool)

(assert (=> b!763974 m!710423))

(declare-fun m!710425 () Bool)

(assert (=> b!763970 m!710425))

(push 1)

