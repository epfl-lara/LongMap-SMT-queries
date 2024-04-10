; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67738 () Bool)

(assert start!67738)

(declare-fun b!786173 () Bool)

(declare-fun res!532275 () Bool)

(declare-fun e!437048 () Bool)

(assert (=> b!786173 (=> (not res!532275) (not e!437048))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42778 0))(
  ( (array!42779 (arr!20477 (Array (_ BitVec 32) (_ BitVec 64))) (size!20898 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42778)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!786173 (= res!532275 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20477 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!786174 () Bool)

(declare-fun res!532271 () Bool)

(assert (=> b!786174 (=> (not res!532271) (not e!437048))))

(declare-fun e!437037 () Bool)

(assert (=> b!786174 (= res!532271 e!437037)))

(declare-fun c!87361 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!786174 (= c!87361 (bvsle x!1131 resIntermediateX!5))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!786175 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!437038 () Bool)

(declare-datatypes ((SeekEntryResult!8077 0))(
  ( (MissingZero!8077 (index!34676 (_ BitVec 32))) (Found!8077 (index!34677 (_ BitVec 32))) (Intermediate!8077 (undefined!8889 Bool) (index!34678 (_ BitVec 32)) (x!65617 (_ BitVec 32))) (Undefined!8077) (MissingVacant!8077 (index!34679 (_ BitVec 32))) )
))
(declare-fun lt!350592 () SeekEntryResult!8077)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42778 (_ BitVec 32)) SeekEntryResult!8077)

(assert (=> b!786175 (= e!437038 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20477 a!3186) j!159) a!3186 mask!3328) lt!350592))))

(declare-fun b!786176 () Bool)

(declare-datatypes ((Unit!27196 0))(
  ( (Unit!27197) )
))
(declare-fun e!437047 () Unit!27196)

(declare-fun Unit!27198 () Unit!27196)

(assert (=> b!786176 (= e!437047 Unit!27198)))

(assert (=> b!786176 false))

(declare-fun b!786177 () Bool)

(declare-fun res!532280 () Bool)

(declare-fun e!437040 () Bool)

(assert (=> b!786177 (=> (not res!532280) (not e!437040))))

(assert (=> b!786177 (= res!532280 (and (= (size!20898 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20898 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20898 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!786178 () Bool)

(declare-fun res!532284 () Bool)

(assert (=> b!786178 (=> (not res!532284) (not e!437040))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!786178 (= res!532284 (validKeyInArray!0 k!2102))))

(declare-fun b!786179 () Bool)

(declare-fun res!532279 () Bool)

(declare-fun e!437044 () Bool)

(assert (=> b!786179 (=> (not res!532279) (not e!437044))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42778 (_ BitVec 32)) Bool)

(assert (=> b!786179 (= res!532279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun lt!350590 () SeekEntryResult!8077)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!786180 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42778 (_ BitVec 32)) SeekEntryResult!8077)

(assert (=> b!786180 (= e!437037 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20477 a!3186) j!159) a!3186 mask!3328) lt!350590))))

(declare-fun b!786182 () Bool)

(declare-fun res!532268 () Bool)

(declare-fun e!437043 () Bool)

(assert (=> b!786182 (=> (not res!532268) (not e!437043))))

(declare-fun lt!350594 () array!42778)

(declare-fun lt!350591 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42778 (_ BitVec 32)) SeekEntryResult!8077)

(assert (=> b!786182 (= res!532268 (= (seekEntryOrOpen!0 lt!350591 lt!350594 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350591 lt!350594 mask!3328)))))

(declare-fun b!786183 () Bool)

(declare-fun e!437041 () Bool)

(declare-fun e!437039 () Bool)

(assert (=> b!786183 (= e!437041 e!437039)))

(declare-fun res!532272 () Bool)

(assert (=> b!786183 (=> res!532272 e!437039)))

(declare-fun lt!350596 () (_ BitVec 64))

(assert (=> b!786183 (= res!532272 (= lt!350596 lt!350591))))

(assert (=> b!786183 (= lt!350596 (select (store (arr!20477 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!786184 () Bool)

(declare-fun lt!350589 () SeekEntryResult!8077)

(declare-fun lt!350593 () SeekEntryResult!8077)

(assert (=> b!786184 (= e!437043 (= lt!350589 lt!350593))))

(declare-fun b!786185 () Bool)

(assert (=> b!786185 (= e!437037 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20477 a!3186) j!159) a!3186 mask!3328) (Found!8077 j!159)))))

(declare-fun b!786186 () Bool)

(declare-fun res!532269 () Bool)

(assert (=> b!786186 (=> (not res!532269) (not e!437044))))

(declare-datatypes ((List!14479 0))(
  ( (Nil!14476) (Cons!14475 (h!15598 (_ BitVec 64)) (t!20794 List!14479)) )
))
(declare-fun arrayNoDuplicates!0 (array!42778 (_ BitVec 32) List!14479) Bool)

(assert (=> b!786186 (= res!532269 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14476))))

(declare-fun b!786187 () Bool)

(declare-fun Unit!27199 () Unit!27196)

(assert (=> b!786187 (= e!437047 Unit!27199)))

(declare-fun b!786188 () Bool)

(assert (=> b!786188 (= e!437040 e!437044)))

(declare-fun res!532270 () Bool)

(assert (=> b!786188 (=> (not res!532270) (not e!437044))))

(declare-fun lt!350598 () SeekEntryResult!8077)

(assert (=> b!786188 (= res!532270 (or (= lt!350598 (MissingZero!8077 i!1173)) (= lt!350598 (MissingVacant!8077 i!1173))))))

(assert (=> b!786188 (= lt!350598 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!786189 () Bool)

(declare-fun res!532283 () Bool)

(assert (=> b!786189 (=> (not res!532283) (not e!437044))))

(assert (=> b!786189 (= res!532283 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20898 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20898 a!3186))))))

(declare-fun b!786190 () Bool)

(assert (=> b!786190 (= e!437039 true)))

(assert (=> b!786190 e!437043))

(declare-fun res!532278 () Bool)

(assert (=> b!786190 (=> (not res!532278) (not e!437043))))

(assert (=> b!786190 (= res!532278 (= lt!350596 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!350595 () Unit!27196)

(assert (=> b!786190 (= lt!350595 e!437047)))

(declare-fun c!87360 () Bool)

(assert (=> b!786190 (= c!87360 (= lt!350596 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!786191 () Bool)

(declare-fun res!532276 () Bool)

(assert (=> b!786191 (=> (not res!532276) (not e!437040))))

(assert (=> b!786191 (= res!532276 (validKeyInArray!0 (select (arr!20477 a!3186) j!159)))))

(declare-fun b!786192 () Bool)

(declare-fun res!532285 () Bool)

(assert (=> b!786192 (=> (not res!532285) (not e!437040))))

(declare-fun arrayContainsKey!0 (array!42778 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!786192 (= res!532285 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!786193 () Bool)

(assert (=> b!786193 (= e!437044 e!437048)))

(declare-fun res!532281 () Bool)

(assert (=> b!786193 (=> (not res!532281) (not e!437048))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!786193 (= res!532281 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20477 a!3186) j!159) mask!3328) (select (arr!20477 a!3186) j!159) a!3186 mask!3328) lt!350590))))

(assert (=> b!786193 (= lt!350590 (Intermediate!8077 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!786194 () Bool)

(declare-fun e!437046 () Bool)

(declare-fun e!437042 () Bool)

(assert (=> b!786194 (= e!437046 (not e!437042))))

(declare-fun res!532282 () Bool)

(assert (=> b!786194 (=> res!532282 e!437042)))

(declare-fun lt!350599 () SeekEntryResult!8077)

(assert (=> b!786194 (= res!532282 (or (not (is-Intermediate!8077 lt!350599)) (bvslt x!1131 (x!65617 lt!350599)) (not (= x!1131 (x!65617 lt!350599))) (not (= index!1321 (index!34678 lt!350599)))))))

(assert (=> b!786194 e!437038))

(declare-fun res!532277 () Bool)

(assert (=> b!786194 (=> (not res!532277) (not e!437038))))

(assert (=> b!786194 (= res!532277 (= lt!350589 lt!350592))))

(assert (=> b!786194 (= lt!350592 (Found!8077 j!159))))

(assert (=> b!786194 (= lt!350589 (seekEntryOrOpen!0 (select (arr!20477 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!786194 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!350597 () Unit!27196)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42778 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27196)

(assert (=> b!786194 (= lt!350597 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!786195 () Bool)

(assert (=> b!786195 (= e!437042 e!437041)))

(declare-fun res!532286 () Bool)

(assert (=> b!786195 (=> res!532286 e!437041)))

(assert (=> b!786195 (= res!532286 (not (= lt!350593 lt!350592)))))

(assert (=> b!786195 (= lt!350593 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20477 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!786181 () Bool)

(assert (=> b!786181 (= e!437048 e!437046)))

(declare-fun res!532273 () Bool)

(assert (=> b!786181 (=> (not res!532273) (not e!437046))))

(declare-fun lt!350600 () SeekEntryResult!8077)

(assert (=> b!786181 (= res!532273 (= lt!350600 lt!350599))))

(assert (=> b!786181 (= lt!350599 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350591 lt!350594 mask!3328))))

(assert (=> b!786181 (= lt!350600 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350591 mask!3328) lt!350591 lt!350594 mask!3328))))

(assert (=> b!786181 (= lt!350591 (select (store (arr!20477 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!786181 (= lt!350594 (array!42779 (store (arr!20477 a!3186) i!1173 k!2102) (size!20898 a!3186)))))

(declare-fun res!532274 () Bool)

(assert (=> start!67738 (=> (not res!532274) (not e!437040))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67738 (= res!532274 (validMask!0 mask!3328))))

(assert (=> start!67738 e!437040))

(assert (=> start!67738 true))

(declare-fun array_inv!16273 (array!42778) Bool)

(assert (=> start!67738 (array_inv!16273 a!3186)))

(assert (= (and start!67738 res!532274) b!786177))

(assert (= (and b!786177 res!532280) b!786191))

(assert (= (and b!786191 res!532276) b!786178))

(assert (= (and b!786178 res!532284) b!786192))

(assert (= (and b!786192 res!532285) b!786188))

(assert (= (and b!786188 res!532270) b!786179))

(assert (= (and b!786179 res!532279) b!786186))

(assert (= (and b!786186 res!532269) b!786189))

(assert (= (and b!786189 res!532283) b!786193))

(assert (= (and b!786193 res!532281) b!786173))

(assert (= (and b!786173 res!532275) b!786174))

(assert (= (and b!786174 c!87361) b!786180))

(assert (= (and b!786174 (not c!87361)) b!786185))

(assert (= (and b!786174 res!532271) b!786181))

(assert (= (and b!786181 res!532273) b!786194))

(assert (= (and b!786194 res!532277) b!786175))

(assert (= (and b!786194 (not res!532282)) b!786195))

(assert (= (and b!786195 (not res!532286)) b!786183))

(assert (= (and b!786183 (not res!532272)) b!786190))

(assert (= (and b!786190 c!87360) b!786176))

(assert (= (and b!786190 (not c!87360)) b!786187))

(assert (= (and b!786190 res!532278) b!786182))

(assert (= (and b!786182 res!532268) b!786184))

(declare-fun m!728065 () Bool)

(assert (=> b!786183 m!728065))

(declare-fun m!728067 () Bool)

(assert (=> b!786183 m!728067))

(declare-fun m!728069 () Bool)

(assert (=> b!786173 m!728069))

(declare-fun m!728071 () Bool)

(assert (=> b!786188 m!728071))

(declare-fun m!728073 () Bool)

(assert (=> b!786181 m!728073))

(assert (=> b!786181 m!728065))

(declare-fun m!728075 () Bool)

(assert (=> b!786181 m!728075))

(assert (=> b!786181 m!728073))

(declare-fun m!728077 () Bool)

(assert (=> b!786181 m!728077))

(declare-fun m!728079 () Bool)

(assert (=> b!786181 m!728079))

(declare-fun m!728081 () Bool)

(assert (=> b!786193 m!728081))

(assert (=> b!786193 m!728081))

(declare-fun m!728083 () Bool)

(assert (=> b!786193 m!728083))

(assert (=> b!786193 m!728083))

(assert (=> b!786193 m!728081))

(declare-fun m!728085 () Bool)

(assert (=> b!786193 m!728085))

(declare-fun m!728087 () Bool)

(assert (=> b!786179 m!728087))

(declare-fun m!728089 () Bool)

(assert (=> start!67738 m!728089))

(declare-fun m!728091 () Bool)

(assert (=> start!67738 m!728091))

(assert (=> b!786180 m!728081))

(assert (=> b!786180 m!728081))

(declare-fun m!728093 () Bool)

(assert (=> b!786180 m!728093))

(declare-fun m!728095 () Bool)

(assert (=> b!786186 m!728095))

(assert (=> b!786185 m!728081))

(assert (=> b!786185 m!728081))

(declare-fun m!728097 () Bool)

(assert (=> b!786185 m!728097))

(assert (=> b!786194 m!728081))

(assert (=> b!786194 m!728081))

(declare-fun m!728099 () Bool)

(assert (=> b!786194 m!728099))

(declare-fun m!728101 () Bool)

(assert (=> b!786194 m!728101))

(declare-fun m!728103 () Bool)

(assert (=> b!786194 m!728103))

(declare-fun m!728105 () Bool)

(assert (=> b!786192 m!728105))

(assert (=> b!786195 m!728081))

(assert (=> b!786195 m!728081))

(assert (=> b!786195 m!728097))

(assert (=> b!786191 m!728081))

(assert (=> b!786191 m!728081))

(declare-fun m!728107 () Bool)

(assert (=> b!786191 m!728107))

(declare-fun m!728109 () Bool)

(assert (=> b!786182 m!728109))

(declare-fun m!728111 () Bool)

(assert (=> b!786182 m!728111))

(declare-fun m!728113 () Bool)

(assert (=> b!786178 m!728113))

(assert (=> b!786175 m!728081))

(assert (=> b!786175 m!728081))

(declare-fun m!728115 () Bool)

(assert (=> b!786175 m!728115))

(push 1)

