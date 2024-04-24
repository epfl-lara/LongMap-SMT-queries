; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66394 () Bool)

(assert start!66394)

(declare-fun b!764311 () Bool)

(declare-fun res!516883 () Bool)

(declare-fun e!425868 () Bool)

(assert (=> b!764311 (=> (not res!516883) (not e!425868))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42177 0))(
  ( (array!42178 (arr!20192 (Array (_ BitVec 32) (_ BitVec 64))) (size!20612 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42177)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!764311 (= res!516883 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20612 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20612 a!3186))))))

(declare-fun b!764312 () Bool)

(declare-fun res!516878 () Bool)

(assert (=> b!764312 (=> (not res!516878) (not e!425868))))

(declare-datatypes ((List!14101 0))(
  ( (Nil!14098) (Cons!14097 (h!15187 (_ BitVec 64)) (t!20408 List!14101)) )
))
(declare-fun arrayNoDuplicates!0 (array!42177 (_ BitVec 32) List!14101) Bool)

(assert (=> b!764312 (= res!516878 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14098))))

(declare-fun b!764313 () Bool)

(declare-fun e!425869 () Bool)

(assert (=> b!764313 (= e!425869 e!425868)))

(declare-fun res!516885 () Bool)

(assert (=> b!764313 (=> (not res!516885) (not e!425868))))

(declare-datatypes ((SeekEntryResult!7748 0))(
  ( (MissingZero!7748 (index!33360 (_ BitVec 32))) (Found!7748 (index!33361 (_ BitVec 32))) (Intermediate!7748 (undefined!8560 Bool) (index!33362 (_ BitVec 32)) (x!64419 (_ BitVec 32))) (Undefined!7748) (MissingVacant!7748 (index!33363 (_ BitVec 32))) )
))
(declare-fun lt!340160 () SeekEntryResult!7748)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!764313 (= res!516885 (or (= lt!340160 (MissingZero!7748 i!1173)) (= lt!340160 (MissingVacant!7748 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42177 (_ BitVec 32)) SeekEntryResult!7748)

(assert (=> b!764313 (= lt!340160 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!764314 () Bool)

(declare-fun res!516881 () Bool)

(declare-fun e!425867 () Bool)

(assert (=> b!764314 (=> (not res!516881) (not e!425867))))

(assert (=> b!764314 (= res!516881 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20192 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!425866 () Bool)

(declare-fun b!764315 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42177 (_ BitVec 32)) SeekEntryResult!7748)

(assert (=> b!764315 (= e!425866 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20192 a!3186) j!159) a!3186 mask!3328) (Found!7748 j!159)))))

(declare-fun res!516876 () Bool)

(assert (=> start!66394 (=> (not res!516876) (not e!425869))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66394 (= res!516876 (validMask!0 mask!3328))))

(assert (=> start!66394 e!425869))

(assert (=> start!66394 true))

(declare-fun array_inv!16051 (array!42177) Bool)

(assert (=> start!66394 (array_inv!16051 a!3186)))

(declare-fun b!764316 () Bool)

(assert (=> b!764316 (= e!425868 e!425867)))

(declare-fun res!516887 () Bool)

(assert (=> b!764316 (=> (not res!516887) (not e!425867))))

(declare-fun lt!340161 () SeekEntryResult!7748)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42177 (_ BitVec 32)) SeekEntryResult!7748)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!764316 (= res!516887 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20192 a!3186) j!159) mask!3328) (select (arr!20192 a!3186) j!159) a!3186 mask!3328) lt!340161))))

(assert (=> b!764316 (= lt!340161 (Intermediate!7748 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!764317 () Bool)

(declare-fun res!516884 () Bool)

(assert (=> b!764317 (=> (not res!516884) (not e!425867))))

(assert (=> b!764317 (= res!516884 e!425866)))

(declare-fun c!84107 () Bool)

(assert (=> b!764317 (= c!84107 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!764318 () Bool)

(declare-fun res!516879 () Bool)

(assert (=> b!764318 (=> (not res!516879) (not e!425868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42177 (_ BitVec 32)) Bool)

(assert (=> b!764318 (= res!516879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!764319 () Bool)

(assert (=> b!764319 (= e!425866 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20192 a!3186) j!159) a!3186 mask!3328) lt!340161))))

(declare-fun b!764320 () Bool)

(declare-fun res!516880 () Bool)

(assert (=> b!764320 (=> (not res!516880) (not e!425869))))

(assert (=> b!764320 (= res!516880 (and (= (size!20612 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20612 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20612 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!764321 () Bool)

(assert (=> b!764321 (= e!425867 false)))

(declare-fun lt!340159 () array!42177)

(declare-fun lt!340163 () SeekEntryResult!7748)

(declare-fun lt!340162 () (_ BitVec 64))

(assert (=> b!764321 (= lt!340163 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340162 lt!340159 mask!3328))))

(declare-fun lt!340164 () SeekEntryResult!7748)

(assert (=> b!764321 (= lt!340164 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340162 mask!3328) lt!340162 lt!340159 mask!3328))))

(assert (=> b!764321 (= lt!340162 (select (store (arr!20192 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!764321 (= lt!340159 (array!42178 (store (arr!20192 a!3186) i!1173 k!2102) (size!20612 a!3186)))))

(declare-fun b!764322 () Bool)

(declare-fun res!516877 () Bool)

(assert (=> b!764322 (=> (not res!516877) (not e!425869))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!764322 (= res!516877 (validKeyInArray!0 k!2102))))

(declare-fun b!764323 () Bool)

(declare-fun res!516886 () Bool)

(assert (=> b!764323 (=> (not res!516886) (not e!425869))))

(assert (=> b!764323 (= res!516886 (validKeyInArray!0 (select (arr!20192 a!3186) j!159)))))

(declare-fun b!764324 () Bool)

(declare-fun res!516882 () Bool)

(assert (=> b!764324 (=> (not res!516882) (not e!425869))))

(declare-fun arrayContainsKey!0 (array!42177 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!764324 (= res!516882 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!66394 res!516876) b!764320))

(assert (= (and b!764320 res!516880) b!764323))

(assert (= (and b!764323 res!516886) b!764322))

(assert (= (and b!764322 res!516877) b!764324))

(assert (= (and b!764324 res!516882) b!764313))

(assert (= (and b!764313 res!516885) b!764318))

(assert (= (and b!764318 res!516879) b!764312))

(assert (= (and b!764312 res!516878) b!764311))

(assert (= (and b!764311 res!516883) b!764316))

(assert (= (and b!764316 res!516887) b!764314))

(assert (= (and b!764314 res!516881) b!764317))

(assert (= (and b!764317 c!84107) b!764319))

(assert (= (and b!764317 (not c!84107)) b!764315))

(assert (= (and b!764317 res!516884) b!764321))

(declare-fun m!711147 () Bool)

(assert (=> b!764313 m!711147))

(declare-fun m!711149 () Bool)

(assert (=> b!764323 m!711149))

(assert (=> b!764323 m!711149))

(declare-fun m!711151 () Bool)

(assert (=> b!764323 m!711151))

(assert (=> b!764315 m!711149))

(assert (=> b!764315 m!711149))

(declare-fun m!711153 () Bool)

(assert (=> b!764315 m!711153))

(declare-fun m!711155 () Bool)

(assert (=> b!764324 m!711155))

(declare-fun m!711157 () Bool)

(assert (=> b!764312 m!711157))

(declare-fun m!711159 () Bool)

(assert (=> b!764314 m!711159))

(assert (=> b!764319 m!711149))

(assert (=> b!764319 m!711149))

(declare-fun m!711161 () Bool)

(assert (=> b!764319 m!711161))

(declare-fun m!711163 () Bool)

(assert (=> b!764318 m!711163))

(declare-fun m!711165 () Bool)

(assert (=> b!764321 m!711165))

(declare-fun m!711167 () Bool)

(assert (=> b!764321 m!711167))

(declare-fun m!711169 () Bool)

(assert (=> b!764321 m!711169))

(assert (=> b!764321 m!711167))

(declare-fun m!711171 () Bool)

(assert (=> b!764321 m!711171))

(declare-fun m!711173 () Bool)

(assert (=> b!764321 m!711173))

(declare-fun m!711175 () Bool)

(assert (=> b!764322 m!711175))

(assert (=> b!764316 m!711149))

(assert (=> b!764316 m!711149))

(declare-fun m!711177 () Bool)

(assert (=> b!764316 m!711177))

(assert (=> b!764316 m!711177))

(assert (=> b!764316 m!711149))

(declare-fun m!711179 () Bool)

(assert (=> b!764316 m!711179))

(declare-fun m!711181 () Bool)

(assert (=> start!66394 m!711181))

(declare-fun m!711183 () Bool)

(assert (=> start!66394 m!711183))

(push 1)

(assert (not start!66394))

(assert (not b!764322))

(assert (not b!764313))

(assert (not b!764312))

(assert (not b!764324))

(assert (not b!764315))

(assert (not b!764323))

(assert (not b!764318))

(assert (not b!764316))

(assert (not b!764321))

(assert (not b!764319))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

