; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67740 () Bool)

(assert start!67740)

(declare-fun b!786242 () Bool)

(declare-fun e!437078 () Bool)

(declare-fun e!437079 () Bool)

(assert (=> b!786242 (= e!437078 e!437079)))

(declare-fun res!532333 () Bool)

(assert (=> b!786242 (=> (not res!532333) (not e!437079))))

(declare-datatypes ((SeekEntryResult!8078 0))(
  ( (MissingZero!8078 (index!34680 (_ BitVec 32))) (Found!8078 (index!34681 (_ BitVec 32))) (Intermediate!8078 (undefined!8890 Bool) (index!34682 (_ BitVec 32)) (x!65626 (_ BitVec 32))) (Undefined!8078) (MissingVacant!8078 (index!34683 (_ BitVec 32))) )
))
(declare-fun lt!350626 () SeekEntryResult!8078)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!786242 (= res!532333 (or (= lt!350626 (MissingZero!8078 i!1173)) (= lt!350626 (MissingVacant!8078 i!1173))))))

(declare-datatypes ((array!42780 0))(
  ( (array!42781 (arr!20478 (Array (_ BitVec 32) (_ BitVec 64))) (size!20899 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42780)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42780 (_ BitVec 32)) SeekEntryResult!8078)

(assert (=> b!786242 (= lt!350626 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!786243 () Bool)

(declare-datatypes ((Unit!27200 0))(
  ( (Unit!27201) )
))
(declare-fun e!437075 () Unit!27200)

(declare-fun Unit!27202 () Unit!27200)

(assert (=> b!786243 (= e!437075 Unit!27202)))

(assert (=> b!786243 false))

(declare-fun b!786244 () Bool)

(declare-fun e!437074 () Bool)

(declare-fun e!437083 () Bool)

(assert (=> b!786244 (= e!437074 e!437083)))

(declare-fun res!532341 () Bool)

(assert (=> b!786244 (=> (not res!532341) (not e!437083))))

(declare-fun lt!350632 () SeekEntryResult!8078)

(declare-fun lt!350633 () SeekEntryResult!8078)

(assert (=> b!786244 (= res!532341 (= lt!350632 lt!350633))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!350636 () (_ BitVec 64))

(declare-fun lt!350628 () array!42780)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42780 (_ BitVec 32)) SeekEntryResult!8078)

(assert (=> b!786244 (= lt!350633 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350636 lt!350628 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!786244 (= lt!350632 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350636 mask!3328) lt!350636 lt!350628 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!786244 (= lt!350636 (select (store (arr!20478 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!786244 (= lt!350628 (array!42781 (store (arr!20478 a!3186) i!1173 k!2102) (size!20899 a!3186)))))

(declare-fun b!786245 () Bool)

(declare-fun res!532338 () Bool)

(assert (=> b!786245 (=> (not res!532338) (not e!437078))))

(declare-fun arrayContainsKey!0 (array!42780 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!786245 (= res!532338 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!786246 () Bool)

(declare-fun lt!350625 () SeekEntryResult!8078)

(declare-fun e!437084 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42780 (_ BitVec 32)) SeekEntryResult!8078)

(assert (=> b!786246 (= e!437084 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20478 a!3186) j!159) a!3186 mask!3328) lt!350625))))

(declare-fun b!786247 () Bool)

(declare-fun res!532342 () Bool)

(assert (=> b!786247 (=> (not res!532342) (not e!437078))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!786247 (= res!532342 (validKeyInArray!0 (select (arr!20478 a!3186) j!159)))))

(declare-fun b!786248 () Bool)

(declare-fun res!532334 () Bool)

(assert (=> b!786248 (=> (not res!532334) (not e!437074))))

(assert (=> b!786248 (= res!532334 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20478 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!786249 () Bool)

(declare-fun e!437082 () Bool)

(assert (=> b!786249 (= e!437083 (not e!437082))))

(declare-fun res!532339 () Bool)

(assert (=> b!786249 (=> res!532339 e!437082)))

(assert (=> b!786249 (= res!532339 (or (not (is-Intermediate!8078 lt!350633)) (bvslt x!1131 (x!65626 lt!350633)) (not (= x!1131 (x!65626 lt!350633))) (not (= index!1321 (index!34682 lt!350633)))))))

(assert (=> b!786249 e!437084))

(declare-fun res!532335 () Bool)

(assert (=> b!786249 (=> (not res!532335) (not e!437084))))

(declare-fun lt!350627 () SeekEntryResult!8078)

(assert (=> b!786249 (= res!532335 (= lt!350627 lt!350625))))

(assert (=> b!786249 (= lt!350625 (Found!8078 j!159))))

(assert (=> b!786249 (= lt!350627 (seekEntryOrOpen!0 (select (arr!20478 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42780 (_ BitVec 32)) Bool)

(assert (=> b!786249 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!350635 () Unit!27200)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42780 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27200)

(assert (=> b!786249 (= lt!350635 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!786250 () Bool)

(declare-fun e!437076 () Bool)

(assert (=> b!786250 (= e!437076 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20478 a!3186) j!159) a!3186 mask!3328) (Found!8078 j!159)))))

(declare-fun b!786251 () Bool)

(declare-fun Unit!27203 () Unit!27200)

(assert (=> b!786251 (= e!437075 Unit!27203)))

(declare-fun b!786253 () Bool)

(declare-fun e!437080 () Bool)

(declare-fun lt!350634 () SeekEntryResult!8078)

(assert (=> b!786253 (= e!437080 (= lt!350627 lt!350634))))

(declare-fun b!786254 () Bool)

(declare-fun res!532343 () Bool)

(assert (=> b!786254 (=> (not res!532343) (not e!437079))))

(assert (=> b!786254 (= res!532343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!786255 () Bool)

(declare-fun res!532337 () Bool)

(assert (=> b!786255 (=> (not res!532337) (not e!437079))))

(declare-datatypes ((List!14480 0))(
  ( (Nil!14477) (Cons!14476 (h!15599 (_ BitVec 64)) (t!20795 List!14480)) )
))
(declare-fun arrayNoDuplicates!0 (array!42780 (_ BitVec 32) List!14480) Bool)

(assert (=> b!786255 (= res!532337 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14477))))

(declare-fun b!786256 () Bool)

(declare-fun res!532330 () Bool)

(assert (=> b!786256 (=> (not res!532330) (not e!437074))))

(assert (=> b!786256 (= res!532330 e!437076)))

(declare-fun c!87367 () Bool)

(assert (=> b!786256 (= c!87367 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!786257 () Bool)

(assert (=> b!786257 (= e!437079 e!437074)))

(declare-fun res!532328 () Bool)

(assert (=> b!786257 (=> (not res!532328) (not e!437074))))

(declare-fun lt!350631 () SeekEntryResult!8078)

(assert (=> b!786257 (= res!532328 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20478 a!3186) j!159) mask!3328) (select (arr!20478 a!3186) j!159) a!3186 mask!3328) lt!350631))))

(assert (=> b!786257 (= lt!350631 (Intermediate!8078 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!786258 () Bool)

(declare-fun e!437073 () Bool)

(declare-fun e!437081 () Bool)

(assert (=> b!786258 (= e!437073 e!437081)))

(declare-fun res!532332 () Bool)

(assert (=> b!786258 (=> res!532332 e!437081)))

(declare-fun lt!350630 () (_ BitVec 64))

(assert (=> b!786258 (= res!532332 (= lt!350630 lt!350636))))

(assert (=> b!786258 (= lt!350630 (select (store (arr!20478 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!786259 () Bool)

(assert (=> b!786259 (= e!437076 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20478 a!3186) j!159) a!3186 mask!3328) lt!350631))))

(declare-fun b!786260 () Bool)

(declare-fun res!532327 () Bool)

(assert (=> b!786260 (=> (not res!532327) (not e!437078))))

(assert (=> b!786260 (= res!532327 (validKeyInArray!0 k!2102))))

(declare-fun res!532325 () Bool)

(assert (=> start!67740 (=> (not res!532325) (not e!437078))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67740 (= res!532325 (validMask!0 mask!3328))))

(assert (=> start!67740 e!437078))

(assert (=> start!67740 true))

(declare-fun array_inv!16274 (array!42780) Bool)

(assert (=> start!67740 (array_inv!16274 a!3186)))

(declare-fun b!786252 () Bool)

(assert (=> b!786252 (= e!437081 true)))

(assert (=> b!786252 e!437080))

(declare-fun res!532326 () Bool)

(assert (=> b!786252 (=> (not res!532326) (not e!437080))))

(assert (=> b!786252 (= res!532326 (= lt!350630 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!350629 () Unit!27200)

(assert (=> b!786252 (= lt!350629 e!437075)))

(declare-fun c!87366 () Bool)

(assert (=> b!786252 (= c!87366 (= lt!350630 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!786261 () Bool)

(declare-fun res!532336 () Bool)

(assert (=> b!786261 (=> (not res!532336) (not e!437079))))

(assert (=> b!786261 (= res!532336 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20899 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20899 a!3186))))))

(declare-fun b!786262 () Bool)

(declare-fun res!532331 () Bool)

(assert (=> b!786262 (=> (not res!532331) (not e!437080))))

(assert (=> b!786262 (= res!532331 (= (seekEntryOrOpen!0 lt!350636 lt!350628 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350636 lt!350628 mask!3328)))))

(declare-fun b!786263 () Bool)

(assert (=> b!786263 (= e!437082 e!437073)))

(declare-fun res!532340 () Bool)

(assert (=> b!786263 (=> res!532340 e!437073)))

(assert (=> b!786263 (= res!532340 (not (= lt!350634 lt!350625)))))

(assert (=> b!786263 (= lt!350634 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20478 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!786264 () Bool)

(declare-fun res!532329 () Bool)

(assert (=> b!786264 (=> (not res!532329) (not e!437078))))

(assert (=> b!786264 (= res!532329 (and (= (size!20899 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20899 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20899 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!67740 res!532325) b!786264))

(assert (= (and b!786264 res!532329) b!786247))

(assert (= (and b!786247 res!532342) b!786260))

(assert (= (and b!786260 res!532327) b!786245))

(assert (= (and b!786245 res!532338) b!786242))

(assert (= (and b!786242 res!532333) b!786254))

(assert (= (and b!786254 res!532343) b!786255))

(assert (= (and b!786255 res!532337) b!786261))

(assert (= (and b!786261 res!532336) b!786257))

(assert (= (and b!786257 res!532328) b!786248))

(assert (= (and b!786248 res!532334) b!786256))

(assert (= (and b!786256 c!87367) b!786259))

(assert (= (and b!786256 (not c!87367)) b!786250))

(assert (= (and b!786256 res!532330) b!786244))

(assert (= (and b!786244 res!532341) b!786249))

(assert (= (and b!786249 res!532335) b!786246))

(assert (= (and b!786249 (not res!532339)) b!786263))

(assert (= (and b!786263 (not res!532340)) b!786258))

(assert (= (and b!786258 (not res!532332)) b!786252))

(assert (= (and b!786252 c!87366) b!786243))

(assert (= (and b!786252 (not c!87366)) b!786251))

(assert (= (and b!786252 res!532326) b!786262))

(assert (= (and b!786262 res!532331) b!786253))

(declare-fun m!728117 () Bool)

(assert (=> start!67740 m!728117))

(declare-fun m!728119 () Bool)

(assert (=> start!67740 m!728119))

(declare-fun m!728121 () Bool)

(assert (=> b!786262 m!728121))

(declare-fun m!728123 () Bool)

(assert (=> b!786262 m!728123))

(declare-fun m!728125 () Bool)

(assert (=> b!786247 m!728125))

(assert (=> b!786247 m!728125))

(declare-fun m!728127 () Bool)

(assert (=> b!786247 m!728127))

(declare-fun m!728129 () Bool)

(assert (=> b!786258 m!728129))

(declare-fun m!728131 () Bool)

(assert (=> b!786258 m!728131))

(declare-fun m!728133 () Bool)

(assert (=> b!786260 m!728133))

(assert (=> b!786246 m!728125))

(assert (=> b!786246 m!728125))

(declare-fun m!728135 () Bool)

(assert (=> b!786246 m!728135))

(declare-fun m!728137 () Bool)

(assert (=> b!786244 m!728137))

(declare-fun m!728139 () Bool)

(assert (=> b!786244 m!728139))

(assert (=> b!786244 m!728129))

(assert (=> b!786244 m!728137))

(declare-fun m!728141 () Bool)

(assert (=> b!786244 m!728141))

(declare-fun m!728143 () Bool)

(assert (=> b!786244 m!728143))

(declare-fun m!728145 () Bool)

(assert (=> b!786255 m!728145))

(declare-fun m!728147 () Bool)

(assert (=> b!786242 m!728147))

(assert (=> b!786249 m!728125))

(assert (=> b!786249 m!728125))

(declare-fun m!728149 () Bool)

(assert (=> b!786249 m!728149))

(declare-fun m!728151 () Bool)

(assert (=> b!786249 m!728151))

(declare-fun m!728153 () Bool)

(assert (=> b!786249 m!728153))

(assert (=> b!786257 m!728125))

(assert (=> b!786257 m!728125))

(declare-fun m!728155 () Bool)

(assert (=> b!786257 m!728155))

(assert (=> b!786257 m!728155))

(assert (=> b!786257 m!728125))

(declare-fun m!728157 () Bool)

(assert (=> b!786257 m!728157))

(assert (=> b!786259 m!728125))

(assert (=> b!786259 m!728125))

(declare-fun m!728159 () Bool)

(assert (=> b!786259 m!728159))

(declare-fun m!728161 () Bool)

(assert (=> b!786245 m!728161))

(declare-fun m!728163 () Bool)

(assert (=> b!786254 m!728163))

(declare-fun m!728165 () Bool)

(assert (=> b!786248 m!728165))

(assert (=> b!786263 m!728125))

(assert (=> b!786263 m!728125))

(declare-fun m!728167 () Bool)

(assert (=> b!786263 m!728167))

(assert (=> b!786250 m!728125))

(assert (=> b!786250 m!728125))

(assert (=> b!786250 m!728167))

(push 1)

