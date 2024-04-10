; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66380 () Bool)

(assert start!66380)

(declare-fun res!517503 () Bool)

(declare-fun e!426034 () Bool)

(assert (=> start!66380 (=> (not res!517503) (not e!426034))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66380 (= res!517503 (validMask!0 mask!3328))))

(assert (=> start!66380 e!426034))

(assert (=> start!66380 true))

(declare-datatypes ((array!42222 0))(
  ( (array!42223 (arr!20217 (Array (_ BitVec 32) (_ BitVec 64))) (size!20638 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42222)

(declare-fun array_inv!16013 (array!42222) Bool)

(assert (=> start!66380 (array_inv!16013 a!3186)))

(declare-fun b!764945 () Bool)

(declare-fun e!426038 () Bool)

(assert (=> b!764945 (= e!426038 (not true))))

(declare-fun e!426033 () Bool)

(assert (=> b!764945 e!426033))

(declare-fun res!517501 () Bool)

(assert (=> b!764945 (=> (not res!517501) (not e!426033))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42222 (_ BitVec 32)) Bool)

(assert (=> b!764945 (= res!517501 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26360 0))(
  ( (Unit!26361) )
))
(declare-fun lt!340355 () Unit!26360)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42222 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26360)

(assert (=> b!764945 (= lt!340355 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!764946 () Bool)

(declare-fun res!517497 () Bool)

(declare-fun e!426039 () Bool)

(assert (=> b!764946 (=> (not res!517497) (not e!426039))))

(declare-datatypes ((List!14219 0))(
  ( (Nil!14216) (Cons!14215 (h!15302 (_ BitVec 64)) (t!20534 List!14219)) )
))
(declare-fun arrayNoDuplicates!0 (array!42222 (_ BitVec 32) List!14219) Bool)

(assert (=> b!764946 (= res!517497 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14216))))

(declare-fun b!764947 () Bool)

(declare-fun res!517500 () Bool)

(declare-fun e!426037 () Bool)

(assert (=> b!764947 (=> (not res!517500) (not e!426037))))

(declare-fun e!426035 () Bool)

(assert (=> b!764947 (= res!517500 e!426035)))

(declare-fun c!84115 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!764947 (= c!84115 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!764948 () Bool)

(assert (=> b!764948 (= e!426037 e!426038)))

(declare-fun res!517495 () Bool)

(assert (=> b!764948 (=> (not res!517495) (not e!426038))))

(declare-fun lt!340354 () array!42222)

(declare-fun lt!340352 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7817 0))(
  ( (MissingZero!7817 (index!33636 (_ BitVec 32))) (Found!7817 (index!33637 (_ BitVec 32))) (Intermediate!7817 (undefined!8629 Bool) (index!33638 (_ BitVec 32)) (x!64542 (_ BitVec 32))) (Undefined!7817) (MissingVacant!7817 (index!33639 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42222 (_ BitVec 32)) SeekEntryResult!7817)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!764948 (= res!517495 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340352 mask!3328) lt!340352 lt!340354 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340352 lt!340354 mask!3328)))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!764948 (= lt!340352 (select (store (arr!20217 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!764948 (= lt!340354 (array!42223 (store (arr!20217 a!3186) i!1173 k!2102) (size!20638 a!3186)))))

(declare-fun b!764949 () Bool)

(declare-fun res!517498 () Bool)

(assert (=> b!764949 (=> (not res!517498) (not e!426034))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!764949 (= res!517498 (validKeyInArray!0 k!2102))))

(declare-fun b!764950 () Bool)

(assert (=> b!764950 (= e!426039 e!426037)))

(declare-fun res!517492 () Bool)

(assert (=> b!764950 (=> (not res!517492) (not e!426037))))

(declare-fun lt!340351 () SeekEntryResult!7817)

(assert (=> b!764950 (= res!517492 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20217 a!3186) j!159) mask!3328) (select (arr!20217 a!3186) j!159) a!3186 mask!3328) lt!340351))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!764950 (= lt!340351 (Intermediate!7817 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!764951 () Bool)

(declare-fun res!517496 () Bool)

(assert (=> b!764951 (=> (not res!517496) (not e!426039))))

(assert (=> b!764951 (= res!517496 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20638 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20638 a!3186))))))

(declare-fun b!764952 () Bool)

(declare-fun res!517491 () Bool)

(assert (=> b!764952 (=> (not res!517491) (not e!426034))))

(assert (=> b!764952 (= res!517491 (and (= (size!20638 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20638 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20638 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!764953 () Bool)

(declare-fun res!517494 () Bool)

(assert (=> b!764953 (=> (not res!517494) (not e!426037))))

(assert (=> b!764953 (= res!517494 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20217 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!764954 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42222 (_ BitVec 32)) SeekEntryResult!7817)

(assert (=> b!764954 (= e!426033 (= (seekEntryOrOpen!0 (select (arr!20217 a!3186) j!159) a!3186 mask!3328) (Found!7817 j!159)))))

(declare-fun b!764955 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42222 (_ BitVec 32)) SeekEntryResult!7817)

(assert (=> b!764955 (= e!426035 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20217 a!3186) j!159) a!3186 mask!3328) (Found!7817 j!159)))))

(declare-fun b!764956 () Bool)

(assert (=> b!764956 (= e!426035 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20217 a!3186) j!159) a!3186 mask!3328) lt!340351))))

(declare-fun b!764957 () Bool)

(declare-fun res!517502 () Bool)

(assert (=> b!764957 (=> (not res!517502) (not e!426039))))

(assert (=> b!764957 (= res!517502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!764958 () Bool)

(declare-fun res!517499 () Bool)

(assert (=> b!764958 (=> (not res!517499) (not e!426034))))

(assert (=> b!764958 (= res!517499 (validKeyInArray!0 (select (arr!20217 a!3186) j!159)))))

(declare-fun b!764959 () Bool)

(declare-fun res!517504 () Bool)

(assert (=> b!764959 (=> (not res!517504) (not e!426034))))

(declare-fun arrayContainsKey!0 (array!42222 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!764959 (= res!517504 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!764960 () Bool)

(assert (=> b!764960 (= e!426034 e!426039)))

(declare-fun res!517493 () Bool)

(assert (=> b!764960 (=> (not res!517493) (not e!426039))))

(declare-fun lt!340353 () SeekEntryResult!7817)

(assert (=> b!764960 (= res!517493 (or (= lt!340353 (MissingZero!7817 i!1173)) (= lt!340353 (MissingVacant!7817 i!1173))))))

(assert (=> b!764960 (= lt!340353 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!66380 res!517503) b!764952))

(assert (= (and b!764952 res!517491) b!764958))

(assert (= (and b!764958 res!517499) b!764949))

(assert (= (and b!764949 res!517498) b!764959))

(assert (= (and b!764959 res!517504) b!764960))

(assert (= (and b!764960 res!517493) b!764957))

(assert (= (and b!764957 res!517502) b!764946))

(assert (= (and b!764946 res!517497) b!764951))

(assert (= (and b!764951 res!517496) b!764950))

(assert (= (and b!764950 res!517492) b!764953))

(assert (= (and b!764953 res!517494) b!764947))

(assert (= (and b!764947 c!84115) b!764956))

(assert (= (and b!764947 (not c!84115)) b!764955))

(assert (= (and b!764947 res!517500) b!764948))

(assert (= (and b!764948 res!517495) b!764945))

(assert (= (and b!764945 res!517501) b!764954))

(declare-fun m!711171 () Bool)

(assert (=> b!764956 m!711171))

(assert (=> b!764956 m!711171))

(declare-fun m!711173 () Bool)

(assert (=> b!764956 m!711173))

(declare-fun m!711175 () Bool)

(assert (=> b!764957 m!711175))

(assert (=> b!764950 m!711171))

(assert (=> b!764950 m!711171))

(declare-fun m!711177 () Bool)

(assert (=> b!764950 m!711177))

(assert (=> b!764950 m!711177))

(assert (=> b!764950 m!711171))

(declare-fun m!711179 () Bool)

(assert (=> b!764950 m!711179))

(declare-fun m!711181 () Bool)

(assert (=> b!764960 m!711181))

(assert (=> b!764955 m!711171))

(assert (=> b!764955 m!711171))

(declare-fun m!711183 () Bool)

(assert (=> b!764955 m!711183))

(assert (=> b!764954 m!711171))

(assert (=> b!764954 m!711171))

(declare-fun m!711185 () Bool)

(assert (=> b!764954 m!711185))

(declare-fun m!711187 () Bool)

(assert (=> b!764959 m!711187))

(declare-fun m!711189 () Bool)

(assert (=> start!66380 m!711189))

(declare-fun m!711191 () Bool)

(assert (=> start!66380 m!711191))

(declare-fun m!711193 () Bool)

(assert (=> b!764949 m!711193))

(assert (=> b!764958 m!711171))

(assert (=> b!764958 m!711171))

(declare-fun m!711195 () Bool)

(assert (=> b!764958 m!711195))

(declare-fun m!711197 () Bool)

(assert (=> b!764953 m!711197))

(declare-fun m!711199 () Bool)

(assert (=> b!764948 m!711199))

(declare-fun m!711201 () Bool)

(assert (=> b!764948 m!711201))

(assert (=> b!764948 m!711199))

(declare-fun m!711203 () Bool)

(assert (=> b!764948 m!711203))

(declare-fun m!711205 () Bool)

(assert (=> b!764948 m!711205))

(declare-fun m!711207 () Bool)

(assert (=> b!764948 m!711207))

(declare-fun m!711209 () Bool)

(assert (=> b!764946 m!711209))

(declare-fun m!711211 () Bool)

(assert (=> b!764945 m!711211))

(declare-fun m!711213 () Bool)

(assert (=> b!764945 m!711213))

(push 1)

