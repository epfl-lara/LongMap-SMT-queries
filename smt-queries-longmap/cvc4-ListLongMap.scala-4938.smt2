; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68008 () Bool)

(assert start!68008)

(declare-datatypes ((array!42922 0))(
  ( (array!42923 (arr!20546 (Array (_ BitVec 32) (_ BitVec 64))) (size!20967 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42922)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!439867 () Bool)

(declare-datatypes ((SeekEntryResult!8146 0))(
  ( (MissingZero!8146 (index!34952 (_ BitVec 32))) (Found!8146 (index!34953 (_ BitVec 32))) (Intermediate!8146 (undefined!8958 Bool) (index!34954 (_ BitVec 32)) (x!65888 (_ BitVec 32))) (Undefined!8146) (MissingVacant!8146 (index!34955 (_ BitVec 32))) )
))
(declare-fun lt!353281 () SeekEntryResult!8146)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!791505 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42922 (_ BitVec 32)) SeekEntryResult!8146)

(assert (=> b!791505 (= e!439867 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20546 a!3186) j!159) a!3186 mask!3328) lt!353281))))

(declare-fun b!791506 () Bool)

(declare-fun e!439870 () Bool)

(assert (=> b!791506 (= e!439870 (not true))))

(declare-fun e!439872 () Bool)

(assert (=> b!791506 e!439872))

(declare-fun res!536252 () Bool)

(assert (=> b!791506 (=> (not res!536252) (not e!439872))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42922 (_ BitVec 32)) Bool)

(assert (=> b!791506 (= res!536252 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!27444 0))(
  ( (Unit!27445) )
))
(declare-fun lt!353283 () Unit!27444)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42922 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27444)

(assert (=> b!791506 (= lt!353283 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!791507 () Bool)

(declare-fun res!536249 () Bool)

(declare-fun e!439873 () Bool)

(assert (=> b!791507 (=> (not res!536249) (not e!439873))))

(assert (=> b!791507 (= res!536249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!791508 () Bool)

(declare-fun res!536242 () Bool)

(assert (=> b!791508 (=> (not res!536242) (not e!439873))))

(declare-datatypes ((List!14548 0))(
  ( (Nil!14545) (Cons!14544 (h!15673 (_ BitVec 64)) (t!20863 List!14548)) )
))
(declare-fun arrayNoDuplicates!0 (array!42922 (_ BitVec 32) List!14548) Bool)

(assert (=> b!791508 (= res!536242 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14545))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!791509 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42922 (_ BitVec 32)) SeekEntryResult!8146)

(assert (=> b!791509 (= e!439867 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20546 a!3186) j!159) a!3186 mask!3328) (Found!8146 j!159)))))

(declare-fun b!791510 () Bool)

(declare-fun e!439871 () Bool)

(assert (=> b!791510 (= e!439871 e!439870)))

(declare-fun res!536250 () Bool)

(assert (=> b!791510 (=> (not res!536250) (not e!439870))))

(declare-fun lt!353282 () array!42922)

(declare-fun lt!353284 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!791510 (= res!536250 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!353284 mask!3328) lt!353284 lt!353282 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!353284 lt!353282 mask!3328)))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!791510 (= lt!353284 (select (store (arr!20546 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!791510 (= lt!353282 (array!42923 (store (arr!20546 a!3186) i!1173 k!2102) (size!20967 a!3186)))))

(declare-fun b!791511 () Bool)

(declare-fun res!536246 () Bool)

(declare-fun e!439869 () Bool)

(assert (=> b!791511 (=> (not res!536246) (not e!439869))))

(declare-fun arrayContainsKey!0 (array!42922 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791511 (= res!536246 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!791512 () Bool)

(declare-fun res!536251 () Bool)

(assert (=> b!791512 (=> (not res!536251) (not e!439869))))

(assert (=> b!791512 (= res!536251 (and (= (size!20967 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20967 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20967 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!791513 () Bool)

(declare-fun res!536248 () Bool)

(assert (=> b!791513 (=> (not res!536248) (not e!439871))))

(assert (=> b!791513 (= res!536248 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20546 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!791514 () Bool)

(assert (=> b!791514 (= e!439873 e!439871)))

(declare-fun res!536241 () Bool)

(assert (=> b!791514 (=> (not res!536241) (not e!439871))))

(assert (=> b!791514 (= res!536241 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20546 a!3186) j!159) mask!3328) (select (arr!20546 a!3186) j!159) a!3186 mask!3328) lt!353281))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!791514 (= lt!353281 (Intermediate!8146 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!536253 () Bool)

(assert (=> start!68008 (=> (not res!536253) (not e!439869))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68008 (= res!536253 (validMask!0 mask!3328))))

(assert (=> start!68008 e!439869))

(assert (=> start!68008 true))

(declare-fun array_inv!16342 (array!42922) Bool)

(assert (=> start!68008 (array_inv!16342 a!3186)))

(declare-fun b!791504 () Bool)

(declare-fun res!536247 () Bool)

(assert (=> b!791504 (=> (not res!536247) (not e!439873))))

(assert (=> b!791504 (= res!536247 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20967 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20967 a!3186))))))

(declare-fun b!791515 () Bool)

(declare-fun e!439868 () Bool)

(assert (=> b!791515 (= e!439872 e!439868)))

(declare-fun res!536254 () Bool)

(assert (=> b!791515 (=> (not res!536254) (not e!439868))))

(declare-fun lt!353280 () SeekEntryResult!8146)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42922 (_ BitVec 32)) SeekEntryResult!8146)

(assert (=> b!791515 (= res!536254 (= (seekEntryOrOpen!0 (select (arr!20546 a!3186) j!159) a!3186 mask!3328) lt!353280))))

(assert (=> b!791515 (= lt!353280 (Found!8146 j!159))))

(declare-fun b!791516 () Bool)

(declare-fun res!536244 () Bool)

(assert (=> b!791516 (=> (not res!536244) (not e!439869))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791516 (= res!536244 (validKeyInArray!0 (select (arr!20546 a!3186) j!159)))))

(declare-fun b!791517 () Bool)

(declare-fun res!536255 () Bool)

(assert (=> b!791517 (=> (not res!536255) (not e!439871))))

(assert (=> b!791517 (= res!536255 e!439867)))

(declare-fun c!88042 () Bool)

(assert (=> b!791517 (= c!88042 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!791518 () Bool)

(declare-fun res!536243 () Bool)

(assert (=> b!791518 (=> (not res!536243) (not e!439869))))

(assert (=> b!791518 (= res!536243 (validKeyInArray!0 k!2102))))

(declare-fun b!791519 () Bool)

(assert (=> b!791519 (= e!439869 e!439873)))

(declare-fun res!536245 () Bool)

(assert (=> b!791519 (=> (not res!536245) (not e!439873))))

(declare-fun lt!353285 () SeekEntryResult!8146)

(assert (=> b!791519 (= res!536245 (or (= lt!353285 (MissingZero!8146 i!1173)) (= lt!353285 (MissingVacant!8146 i!1173))))))

(assert (=> b!791519 (= lt!353285 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!791520 () Bool)

(assert (=> b!791520 (= e!439868 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20546 a!3186) j!159) a!3186 mask!3328) lt!353280))))

(assert (= (and start!68008 res!536253) b!791512))

(assert (= (and b!791512 res!536251) b!791516))

(assert (= (and b!791516 res!536244) b!791518))

(assert (= (and b!791518 res!536243) b!791511))

(assert (= (and b!791511 res!536246) b!791519))

(assert (= (and b!791519 res!536245) b!791507))

(assert (= (and b!791507 res!536249) b!791508))

(assert (= (and b!791508 res!536242) b!791504))

(assert (= (and b!791504 res!536247) b!791514))

(assert (= (and b!791514 res!536241) b!791513))

(assert (= (and b!791513 res!536248) b!791517))

(assert (= (and b!791517 c!88042) b!791505))

(assert (= (and b!791517 (not c!88042)) b!791509))

(assert (= (and b!791517 res!536255) b!791510))

(assert (= (and b!791510 res!536250) b!791506))

(assert (= (and b!791506 res!536252) b!791515))

(assert (= (and b!791515 res!536254) b!791520))

(declare-fun m!732235 () Bool)

(assert (=> b!791520 m!732235))

(assert (=> b!791520 m!732235))

(declare-fun m!732237 () Bool)

(assert (=> b!791520 m!732237))

(declare-fun m!732239 () Bool)

(assert (=> b!791513 m!732239))

(assert (=> b!791515 m!732235))

(assert (=> b!791515 m!732235))

(declare-fun m!732241 () Bool)

(assert (=> b!791515 m!732241))

(declare-fun m!732243 () Bool)

(assert (=> b!791506 m!732243))

(declare-fun m!732245 () Bool)

(assert (=> b!791506 m!732245))

(assert (=> b!791514 m!732235))

(assert (=> b!791514 m!732235))

(declare-fun m!732247 () Bool)

(assert (=> b!791514 m!732247))

(assert (=> b!791514 m!732247))

(assert (=> b!791514 m!732235))

(declare-fun m!732249 () Bool)

(assert (=> b!791514 m!732249))

(declare-fun m!732251 () Bool)

(assert (=> b!791518 m!732251))

(declare-fun m!732253 () Bool)

(assert (=> b!791519 m!732253))

(assert (=> b!791505 m!732235))

(assert (=> b!791505 m!732235))

(declare-fun m!732255 () Bool)

(assert (=> b!791505 m!732255))

(assert (=> b!791509 m!732235))

(assert (=> b!791509 m!732235))

(declare-fun m!732257 () Bool)

(assert (=> b!791509 m!732257))

(declare-fun m!732259 () Bool)

(assert (=> b!791511 m!732259))

(declare-fun m!732261 () Bool)

(assert (=> start!68008 m!732261))

(declare-fun m!732263 () Bool)

(assert (=> start!68008 m!732263))

(declare-fun m!732265 () Bool)

(assert (=> b!791510 m!732265))

(declare-fun m!732267 () Bool)

(assert (=> b!791510 m!732267))

(declare-fun m!732269 () Bool)

(assert (=> b!791510 m!732269))

(assert (=> b!791510 m!732267))

(declare-fun m!732271 () Bool)

(assert (=> b!791510 m!732271))

(declare-fun m!732273 () Bool)

(assert (=> b!791510 m!732273))

(declare-fun m!732275 () Bool)

(assert (=> b!791507 m!732275))

(assert (=> b!791516 m!732235))

(assert (=> b!791516 m!732235))

(declare-fun m!732277 () Bool)

(assert (=> b!791516 m!732277))

(declare-fun m!732279 () Bool)

(assert (=> b!791508 m!732279))

(push 1)

