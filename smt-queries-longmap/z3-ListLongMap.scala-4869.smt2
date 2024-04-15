; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67106 () Bool)

(assert start!67106)

(declare-fun e!431412 () Bool)

(declare-datatypes ((array!42480 0))(
  ( (array!42481 (arr!20336 (Array (_ BitVec 32) (_ BitVec 64))) (size!20757 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42480)

(declare-datatypes ((SeekEntryResult!7933 0))(
  ( (MissingZero!7933 (index!34100 (_ BitVec 32))) (Found!7933 (index!34101 (_ BitVec 32))) (Intermediate!7933 (undefined!8745 Bool) (index!34102 (_ BitVec 32)) (x!65055 (_ BitVec 32))) (Undefined!7933) (MissingVacant!7933 (index!34103 (_ BitVec 32))) )
))
(declare-fun lt!345194 () SeekEntryResult!7933)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!775172 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42480 (_ BitVec 32)) SeekEntryResult!7933)

(assert (=> b!775172 (= e!431412 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20336 a!3186) j!159) a!3186 mask!3328) lt!345194))))

(declare-fun b!775173 () Bool)

(declare-fun e!431417 () Bool)

(declare-fun e!431415 () Bool)

(assert (=> b!775173 (= e!431417 e!431415)))

(declare-fun res!524259 () Bool)

(assert (=> b!775173 (=> (not res!524259) (not e!431415))))

(declare-fun lt!345195 () SeekEntryResult!7933)

(declare-fun lt!345191 () SeekEntryResult!7933)

(assert (=> b!775173 (= res!524259 (= lt!345195 lt!345191))))

(declare-fun lt!345189 () (_ BitVec 64))

(declare-fun lt!345193 () array!42480)

(assert (=> b!775173 (= lt!345191 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345189 lt!345193 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!775173 (= lt!345195 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345189 mask!3328) lt!345189 lt!345193 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!775173 (= lt!345189 (select (store (arr!20336 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!775173 (= lt!345193 (array!42481 (store (arr!20336 a!3186) i!1173 k0!2102) (size!20757 a!3186)))))

(declare-fun b!775174 () Bool)

(declare-fun res!524260 () Bool)

(declare-fun e!431418 () Bool)

(assert (=> b!775174 (=> (not res!524260) (not e!431418))))

(declare-fun arrayContainsKey!0 (array!42480 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!775174 (= res!524260 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!775175 () Bool)

(declare-fun res!524261 () Bool)

(declare-fun e!431411 () Bool)

(assert (=> b!775175 (=> res!524261 e!431411)))

(declare-fun lt!345196 () (_ BitVec 32))

(assert (=> b!775175 (= res!524261 (not (= lt!345195 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345196 lt!345189 lt!345193 mask!3328))))))

(declare-fun b!775176 () Bool)

(declare-fun res!524268 () Bool)

(assert (=> b!775176 (=> (not res!524268) (not e!431418))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!775176 (= res!524268 (validKeyInArray!0 (select (arr!20336 a!3186) j!159)))))

(declare-fun b!775177 () Bool)

(declare-fun res!524255 () Bool)

(declare-fun e!431414 () Bool)

(assert (=> b!775177 (=> (not res!524255) (not e!431414))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42480 (_ BitVec 32)) Bool)

(assert (=> b!775177 (= res!524255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!775178 () Bool)

(declare-fun e!431422 () Bool)

(assert (=> b!775178 (= e!431422 e!431411)))

(declare-fun res!524266 () Bool)

(assert (=> b!775178 (=> res!524266 e!431411)))

(assert (=> b!775178 (= res!524266 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!345196 #b00000000000000000000000000000000) (bvsge lt!345196 (size!20757 a!3186))))))

(declare-datatypes ((Unit!26726 0))(
  ( (Unit!26727) )
))
(declare-fun lt!345185 () Unit!26726)

(declare-fun e!431420 () Unit!26726)

(assert (=> b!775178 (= lt!345185 e!431420)))

(declare-fun c!85863 () Bool)

(declare-fun lt!345190 () Bool)

(assert (=> b!775178 (= c!85863 lt!345190)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!775178 (= lt!345190 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!775178 (= lt!345196 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!775179 () Bool)

(declare-fun res!524254 () Bool)

(assert (=> b!775179 (=> (not res!524254) (not e!431414))))

(declare-datatypes ((List!14377 0))(
  ( (Nil!14374) (Cons!14373 (h!15481 (_ BitVec 64)) (t!20683 List!14377)) )
))
(declare-fun arrayNoDuplicates!0 (array!42480 (_ BitVec 32) List!14377) Bool)

(assert (=> b!775179 (= res!524254 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14374))))

(declare-fun b!775180 () Bool)

(declare-fun e!431421 () Bool)

(assert (=> b!775180 (= e!431421 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345196 (select (arr!20336 a!3186) j!159) a!3186 mask!3328) lt!345194)))))

(declare-fun b!775181 () Bool)

(declare-fun Unit!26728 () Unit!26726)

(assert (=> b!775181 (= e!431420 Unit!26728)))

(declare-fun lt!345197 () SeekEntryResult!7933)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42480 (_ BitVec 32)) SeekEntryResult!7933)

(assert (=> b!775181 (= lt!345197 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20336 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!345187 () SeekEntryResult!7933)

(assert (=> b!775181 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345196 resIntermediateIndex!5 (select (arr!20336 a!3186) j!159) a!3186 mask!3328) lt!345187)))

(declare-fun b!775182 () Bool)

(assert (=> b!775182 (= e!431411 true)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42480 (_ BitVec 32)) SeekEntryResult!7933)

(assert (=> b!775182 (= (seekEntryOrOpen!0 lt!345189 lt!345193 mask!3328) lt!345187)))

(declare-fun lt!345186 () Unit!26726)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!42480 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26726)

(assert (=> b!775182 (= lt!345186 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3186 i!1173 k0!2102 j!159 lt!345196 (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(declare-fun b!775183 () Bool)

(assert (=> b!775183 (= e!431415 (not e!431422))))

(declare-fun res!524262 () Bool)

(assert (=> b!775183 (=> res!524262 e!431422)))

(get-info :version)

(assert (=> b!775183 (= res!524262 (or (not ((_ is Intermediate!7933) lt!345191)) (bvsge x!1131 (x!65055 lt!345191))))))

(assert (=> b!775183 (= lt!345187 (Found!7933 j!159))))

(declare-fun e!431419 () Bool)

(assert (=> b!775183 e!431419))

(declare-fun res!524256 () Bool)

(assert (=> b!775183 (=> (not res!524256) (not e!431419))))

(assert (=> b!775183 (= res!524256 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!345184 () Unit!26726)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42480 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26726)

(assert (=> b!775183 (= lt!345184 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!775184 () Bool)

(assert (=> b!775184 (= e!431414 e!431417)))

(declare-fun res!524258 () Bool)

(assert (=> b!775184 (=> (not res!524258) (not e!431417))))

(assert (=> b!775184 (= res!524258 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20336 a!3186) j!159) mask!3328) (select (arr!20336 a!3186) j!159) a!3186 mask!3328) lt!345194))))

(assert (=> b!775184 (= lt!345194 (Intermediate!7933 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!775185 () Bool)

(declare-fun res!524250 () Bool)

(assert (=> b!775185 (=> (not res!524250) (not e!431418))))

(assert (=> b!775185 (= res!524250 (validKeyInArray!0 k0!2102))))

(declare-fun res!524257 () Bool)

(assert (=> start!67106 (=> (not res!524257) (not e!431418))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67106 (= res!524257 (validMask!0 mask!3328))))

(assert (=> start!67106 e!431418))

(assert (=> start!67106 true))

(declare-fun array_inv!16219 (array!42480) Bool)

(assert (=> start!67106 (array_inv!16219 a!3186)))

(declare-fun b!775186 () Bool)

(declare-fun lt!345192 () SeekEntryResult!7933)

(declare-fun e!431416 () Bool)

(assert (=> b!775186 (= e!431416 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20336 a!3186) j!159) a!3186 mask!3328) lt!345192))))

(declare-fun b!775187 () Bool)

(assert (=> b!775187 (= e!431418 e!431414)))

(declare-fun res!524252 () Bool)

(assert (=> b!775187 (=> (not res!524252) (not e!431414))))

(declare-fun lt!345188 () SeekEntryResult!7933)

(assert (=> b!775187 (= res!524252 (or (= lt!345188 (MissingZero!7933 i!1173)) (= lt!345188 (MissingVacant!7933 i!1173))))))

(assert (=> b!775187 (= lt!345188 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!775188 () Bool)

(declare-fun res!524267 () Bool)

(assert (=> b!775188 (=> (not res!524267) (not e!431417))))

(assert (=> b!775188 (= res!524267 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20336 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!775189 () Bool)

(declare-fun res!524251 () Bool)

(assert (=> b!775189 (=> (not res!524251) (not e!431418))))

(assert (=> b!775189 (= res!524251 (and (= (size!20757 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20757 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20757 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!775190 () Bool)

(declare-fun res!524264 () Bool)

(assert (=> b!775190 (=> (not res!524264) (not e!431417))))

(assert (=> b!775190 (= res!524264 e!431412)))

(declare-fun c!85862 () Bool)

(assert (=> b!775190 (= c!85862 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!775191 () Bool)

(assert (=> b!775191 (= e!431421 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345196 resIntermediateIndex!5 (select (arr!20336 a!3186) j!159) a!3186 mask!3328) lt!345187)))))

(declare-fun b!775192 () Bool)

(declare-fun res!524265 () Bool)

(assert (=> b!775192 (=> (not res!524265) (not e!431414))))

(assert (=> b!775192 (= res!524265 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20757 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20757 a!3186))))))

(declare-fun b!775193 () Bool)

(assert (=> b!775193 (= e!431419 e!431416)))

(declare-fun res!524263 () Bool)

(assert (=> b!775193 (=> (not res!524263) (not e!431416))))

(assert (=> b!775193 (= res!524263 (= (seekEntryOrOpen!0 (select (arr!20336 a!3186) j!159) a!3186 mask!3328) lt!345192))))

(assert (=> b!775193 (= lt!345192 (Found!7933 j!159))))

(declare-fun b!775194 () Bool)

(declare-fun res!524253 () Bool)

(assert (=> b!775194 (=> res!524253 e!431411)))

(assert (=> b!775194 (= res!524253 e!431421)))

(declare-fun c!85861 () Bool)

(assert (=> b!775194 (= c!85861 lt!345190)))

(declare-fun b!775195 () Bool)

(assert (=> b!775195 (= e!431412 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20336 a!3186) j!159) a!3186 mask!3328) (Found!7933 j!159)))))

(declare-fun b!775196 () Bool)

(declare-fun Unit!26729 () Unit!26726)

(assert (=> b!775196 (= e!431420 Unit!26729)))

(assert (=> b!775196 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345196 (select (arr!20336 a!3186) j!159) a!3186 mask!3328) lt!345194)))

(assert (= (and start!67106 res!524257) b!775189))

(assert (= (and b!775189 res!524251) b!775176))

(assert (= (and b!775176 res!524268) b!775185))

(assert (= (and b!775185 res!524250) b!775174))

(assert (= (and b!775174 res!524260) b!775187))

(assert (= (and b!775187 res!524252) b!775177))

(assert (= (and b!775177 res!524255) b!775179))

(assert (= (and b!775179 res!524254) b!775192))

(assert (= (and b!775192 res!524265) b!775184))

(assert (= (and b!775184 res!524258) b!775188))

(assert (= (and b!775188 res!524267) b!775190))

(assert (= (and b!775190 c!85862) b!775172))

(assert (= (and b!775190 (not c!85862)) b!775195))

(assert (= (and b!775190 res!524264) b!775173))

(assert (= (and b!775173 res!524259) b!775183))

(assert (= (and b!775183 res!524256) b!775193))

(assert (= (and b!775193 res!524263) b!775186))

(assert (= (and b!775183 (not res!524262)) b!775178))

(assert (= (and b!775178 c!85863) b!775196))

(assert (= (and b!775178 (not c!85863)) b!775181))

(assert (= (and b!775178 (not res!524266)) b!775194))

(assert (= (and b!775194 c!85861) b!775180))

(assert (= (and b!775194 (not c!85861)) b!775191))

(assert (= (and b!775194 (not res!524253)) b!775175))

(assert (= (and b!775175 (not res!524261)) b!775182))

(declare-fun m!718893 () Bool)

(assert (=> b!775195 m!718893))

(assert (=> b!775195 m!718893))

(declare-fun m!718895 () Bool)

(assert (=> b!775195 m!718895))

(declare-fun m!718897 () Bool)

(assert (=> b!775187 m!718897))

(assert (=> b!775191 m!718893))

(assert (=> b!775191 m!718893))

(declare-fun m!718899 () Bool)

(assert (=> b!775191 m!718899))

(declare-fun m!718901 () Bool)

(assert (=> b!775178 m!718901))

(assert (=> b!775172 m!718893))

(assert (=> b!775172 m!718893))

(declare-fun m!718903 () Bool)

(assert (=> b!775172 m!718903))

(declare-fun m!718905 () Bool)

(assert (=> b!775188 m!718905))

(assert (=> b!775184 m!718893))

(assert (=> b!775184 m!718893))

(declare-fun m!718907 () Bool)

(assert (=> b!775184 m!718907))

(assert (=> b!775184 m!718907))

(assert (=> b!775184 m!718893))

(declare-fun m!718909 () Bool)

(assert (=> b!775184 m!718909))

(assert (=> b!775186 m!718893))

(assert (=> b!775186 m!718893))

(declare-fun m!718911 () Bool)

(assert (=> b!775186 m!718911))

(assert (=> b!775180 m!718893))

(assert (=> b!775180 m!718893))

(declare-fun m!718913 () Bool)

(assert (=> b!775180 m!718913))

(declare-fun m!718915 () Bool)

(assert (=> b!775182 m!718915))

(declare-fun m!718917 () Bool)

(assert (=> b!775182 m!718917))

(assert (=> b!775193 m!718893))

(assert (=> b!775193 m!718893))

(declare-fun m!718919 () Bool)

(assert (=> b!775193 m!718919))

(assert (=> b!775176 m!718893))

(assert (=> b!775176 m!718893))

(declare-fun m!718921 () Bool)

(assert (=> b!775176 m!718921))

(declare-fun m!718923 () Bool)

(assert (=> b!775175 m!718923))

(declare-fun m!718925 () Bool)

(assert (=> b!775173 m!718925))

(declare-fun m!718927 () Bool)

(assert (=> b!775173 m!718927))

(declare-fun m!718929 () Bool)

(assert (=> b!775173 m!718929))

(declare-fun m!718931 () Bool)

(assert (=> b!775173 m!718931))

(assert (=> b!775173 m!718927))

(declare-fun m!718933 () Bool)

(assert (=> b!775173 m!718933))

(declare-fun m!718935 () Bool)

(assert (=> b!775179 m!718935))

(assert (=> b!775196 m!718893))

(assert (=> b!775196 m!718893))

(assert (=> b!775196 m!718913))

(declare-fun m!718937 () Bool)

(assert (=> start!67106 m!718937))

(declare-fun m!718939 () Bool)

(assert (=> start!67106 m!718939))

(declare-fun m!718941 () Bool)

(assert (=> b!775174 m!718941))

(declare-fun m!718943 () Bool)

(assert (=> b!775185 m!718943))

(declare-fun m!718945 () Bool)

(assert (=> b!775183 m!718945))

(declare-fun m!718947 () Bool)

(assert (=> b!775183 m!718947))

(assert (=> b!775181 m!718893))

(assert (=> b!775181 m!718893))

(assert (=> b!775181 m!718895))

(assert (=> b!775181 m!718893))

(assert (=> b!775181 m!718899))

(declare-fun m!718949 () Bool)

(assert (=> b!775177 m!718949))

(check-sat (not b!775180) (not b!775195) (not b!775181) (not b!775187) (not b!775176) (not b!775177) (not b!775191) (not b!775196) (not b!775182) (not b!775185) (not b!775174) (not b!775178) (not b!775193) (not b!775175) (not start!67106) (not b!775172) (not b!775179) (not b!775186) (not b!775184) (not b!775173) (not b!775183))
(check-sat)
