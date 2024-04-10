; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65746 () Bool)

(assert start!65746)

(declare-datatypes ((SeekEntryResult!7673 0))(
  ( (MissingZero!7673 (index!33060 (_ BitVec 32))) (Found!7673 (index!33061 (_ BitVec 32))) (Intermediate!7673 (undefined!8485 Bool) (index!33062 (_ BitVec 32)) (x!63967 (_ BitVec 32))) (Undefined!7673) (MissingVacant!7673 (index!33063 (_ BitVec 32))) )
))
(declare-fun lt!336121 () SeekEntryResult!7673)

(declare-fun e!421123 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!41919 0))(
  ( (array!41920 (arr!20073 (Array (_ BitVec 32) (_ BitVec 64))) (size!20494 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41919)

(declare-fun b!755150 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41919 (_ BitVec 32)) SeekEntryResult!7673)

(assert (=> b!755150 (= e!421123 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20073 a!3186) j!159) a!3186 mask!3328) lt!336121))))

(declare-fun res!510382 () Bool)

(declare-fun e!421132 () Bool)

(assert (=> start!65746 (=> (not res!510382) (not e!421132))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65746 (= res!510382 (validMask!0 mask!3328))))

(assert (=> start!65746 e!421132))

(assert (=> start!65746 true))

(declare-fun array_inv!15869 (array!41919) Bool)

(assert (=> start!65746 (array_inv!15869 a!3186)))

(declare-fun b!755151 () Bool)

(declare-fun e!421122 () Bool)

(declare-fun lt!336122 () SeekEntryResult!7673)

(declare-fun lt!336120 () SeekEntryResult!7673)

(assert (=> b!755151 (= e!421122 (= lt!336122 lt!336120))))

(declare-fun b!755152 () Bool)

(declare-fun e!421125 () Bool)

(declare-fun e!421124 () Bool)

(assert (=> b!755152 (= e!421125 e!421124)))

(declare-fun res!510387 () Bool)

(assert (=> b!755152 (=> (not res!510387) (not e!421124))))

(declare-fun lt!336124 () SeekEntryResult!7673)

(declare-fun lt!336125 () SeekEntryResult!7673)

(assert (=> b!755152 (= res!510387 (= lt!336124 lt!336125))))

(declare-fun lt!336116 () array!41919)

(declare-fun lt!336123 () (_ BitVec 64))

(assert (=> b!755152 (= lt!336125 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336123 lt!336116 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!755152 (= lt!336124 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336123 mask!3328) lt!336123 lt!336116 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!755152 (= lt!336123 (select (store (arr!20073 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!755152 (= lt!336116 (array!41920 (store (arr!20073 a!3186) i!1173 k!2102) (size!20494 a!3186)))))

(declare-fun b!755153 () Bool)

(declare-fun e!421131 () Bool)

(declare-fun e!421128 () Bool)

(assert (=> b!755153 (= e!421131 e!421128)))

(declare-fun res!510394 () Bool)

(assert (=> b!755153 (=> res!510394 e!421128)))

(declare-fun lt!336117 () SeekEntryResult!7673)

(assert (=> b!755153 (= res!510394 (not (= lt!336120 lt!336117)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41919 (_ BitVec 32)) SeekEntryResult!7673)

(assert (=> b!755153 (= lt!336120 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20073 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!755154 () Bool)

(declare-fun e!421127 () Bool)

(assert (=> b!755154 (= e!421127 e!421125)))

(declare-fun res!510393 () Bool)

(assert (=> b!755154 (=> (not res!510393) (not e!421125))))

(assert (=> b!755154 (= res!510393 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20073 a!3186) j!159) mask!3328) (select (arr!20073 a!3186) j!159) a!3186 mask!3328) lt!336121))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!755154 (= lt!336121 (Intermediate!7673 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!755155 () Bool)

(declare-fun res!510381 () Bool)

(assert (=> b!755155 (=> (not res!510381) (not e!421127))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41919 (_ BitVec 32)) Bool)

(assert (=> b!755155 (= res!510381 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!755156 () Bool)

(declare-datatypes ((Unit!26072 0))(
  ( (Unit!26073) )
))
(declare-fun e!421133 () Unit!26072)

(declare-fun Unit!26074 () Unit!26072)

(assert (=> b!755156 (= e!421133 Unit!26074)))

(declare-fun b!755157 () Bool)

(declare-fun res!510380 () Bool)

(assert (=> b!755157 (=> (not res!510380) (not e!421132))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!755157 (= res!510380 (validKeyInArray!0 k!2102))))

(declare-fun b!755158 () Bool)

(declare-fun res!510390 () Bool)

(assert (=> b!755158 (=> (not res!510390) (not e!421122))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41919 (_ BitVec 32)) SeekEntryResult!7673)

(assert (=> b!755158 (= res!510390 (= (seekEntryOrOpen!0 lt!336123 lt!336116 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336123 lt!336116 mask!3328)))))

(declare-fun b!755159 () Bool)

(assert (=> b!755159 (= e!421123 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20073 a!3186) j!159) a!3186 mask!3328) (Found!7673 j!159)))))

(declare-fun b!755160 () Bool)

(declare-fun e!421129 () Bool)

(assert (=> b!755160 (= e!421128 e!421129)))

(declare-fun res!510377 () Bool)

(assert (=> b!755160 (=> res!510377 e!421129)))

(declare-fun lt!336114 () (_ BitVec 64))

(assert (=> b!755160 (= res!510377 (= lt!336114 lt!336123))))

(assert (=> b!755160 (= lt!336114 (select (store (arr!20073 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!755161 () Bool)

(declare-fun res!510386 () Bool)

(assert (=> b!755161 (=> (not res!510386) (not e!421125))))

(assert (=> b!755161 (= res!510386 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20073 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!755162 () Bool)

(assert (=> b!755162 (= e!421129 true)))

(assert (=> b!755162 e!421122))

(declare-fun res!510392 () Bool)

(assert (=> b!755162 (=> (not res!510392) (not e!421122))))

(assert (=> b!755162 (= res!510392 (= lt!336114 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!336115 () Unit!26072)

(assert (=> b!755162 (= lt!336115 e!421133)))

(declare-fun c!82767 () Bool)

(assert (=> b!755162 (= c!82767 (= lt!336114 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!755163 () Bool)

(declare-fun res!510391 () Bool)

(assert (=> b!755163 (=> (not res!510391) (not e!421127))))

(declare-datatypes ((List!14075 0))(
  ( (Nil!14072) (Cons!14071 (h!15143 (_ BitVec 64)) (t!20390 List!14075)) )
))
(declare-fun arrayNoDuplicates!0 (array!41919 (_ BitVec 32) List!14075) Bool)

(assert (=> b!755163 (= res!510391 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14072))))

(declare-fun b!755164 () Bool)

(assert (=> b!755164 (= e!421124 (not e!421131))))

(declare-fun res!510378 () Bool)

(assert (=> b!755164 (=> res!510378 e!421131)))

(assert (=> b!755164 (= res!510378 (or (not (is-Intermediate!7673 lt!336125)) (bvslt x!1131 (x!63967 lt!336125)) (not (= x!1131 (x!63967 lt!336125))) (not (= index!1321 (index!33062 lt!336125)))))))

(declare-fun e!421130 () Bool)

(assert (=> b!755164 e!421130))

(declare-fun res!510389 () Bool)

(assert (=> b!755164 (=> (not res!510389) (not e!421130))))

(assert (=> b!755164 (= res!510389 (= lt!336122 lt!336117))))

(assert (=> b!755164 (= lt!336117 (Found!7673 j!159))))

(assert (=> b!755164 (= lt!336122 (seekEntryOrOpen!0 (select (arr!20073 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!755164 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!336118 () Unit!26072)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41919 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26072)

(assert (=> b!755164 (= lt!336118 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!755165 () Bool)

(declare-fun res!510383 () Bool)

(assert (=> b!755165 (=> (not res!510383) (not e!421132))))

(assert (=> b!755165 (= res!510383 (validKeyInArray!0 (select (arr!20073 a!3186) j!159)))))

(declare-fun b!755166 () Bool)

(declare-fun res!510384 () Bool)

(assert (=> b!755166 (=> (not res!510384) (not e!421127))))

(assert (=> b!755166 (= res!510384 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20494 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20494 a!3186))))))

(declare-fun b!755167 () Bool)

(assert (=> b!755167 (= e!421132 e!421127)))

(declare-fun res!510379 () Bool)

(assert (=> b!755167 (=> (not res!510379) (not e!421127))))

(declare-fun lt!336119 () SeekEntryResult!7673)

(assert (=> b!755167 (= res!510379 (or (= lt!336119 (MissingZero!7673 i!1173)) (= lt!336119 (MissingVacant!7673 i!1173))))))

(assert (=> b!755167 (= lt!336119 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!755168 () Bool)

(declare-fun res!510395 () Bool)

(assert (=> b!755168 (=> (not res!510395) (not e!421125))))

(assert (=> b!755168 (= res!510395 e!421123)))

(declare-fun c!82768 () Bool)

(assert (=> b!755168 (= c!82768 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!755169 () Bool)

(assert (=> b!755169 (= e!421130 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20073 a!3186) j!159) a!3186 mask!3328) lt!336117))))

(declare-fun b!755170 () Bool)

(declare-fun res!510388 () Bool)

(assert (=> b!755170 (=> (not res!510388) (not e!421132))))

(declare-fun arrayContainsKey!0 (array!41919 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!755170 (= res!510388 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!755171 () Bool)

(declare-fun Unit!26075 () Unit!26072)

(assert (=> b!755171 (= e!421133 Unit!26075)))

(assert (=> b!755171 false))

(declare-fun b!755172 () Bool)

(declare-fun res!510385 () Bool)

(assert (=> b!755172 (=> (not res!510385) (not e!421132))))

(assert (=> b!755172 (= res!510385 (and (= (size!20494 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20494 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20494 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!65746 res!510382) b!755172))

(assert (= (and b!755172 res!510385) b!755165))

(assert (= (and b!755165 res!510383) b!755157))

(assert (= (and b!755157 res!510380) b!755170))

(assert (= (and b!755170 res!510388) b!755167))

(assert (= (and b!755167 res!510379) b!755155))

(assert (= (and b!755155 res!510381) b!755163))

(assert (= (and b!755163 res!510391) b!755166))

(assert (= (and b!755166 res!510384) b!755154))

(assert (= (and b!755154 res!510393) b!755161))

(assert (= (and b!755161 res!510386) b!755168))

(assert (= (and b!755168 c!82768) b!755150))

(assert (= (and b!755168 (not c!82768)) b!755159))

(assert (= (and b!755168 res!510395) b!755152))

(assert (= (and b!755152 res!510387) b!755164))

(assert (= (and b!755164 res!510389) b!755169))

(assert (= (and b!755164 (not res!510378)) b!755153))

(assert (= (and b!755153 (not res!510394)) b!755160))

(assert (= (and b!755160 (not res!510377)) b!755162))

(assert (= (and b!755162 c!82767) b!755171))

(assert (= (and b!755162 (not c!82767)) b!755156))

(assert (= (and b!755162 res!510392) b!755158))

(assert (= (and b!755158 res!510390) b!755151))

(declare-fun m!703423 () Bool)

(assert (=> b!755169 m!703423))

(assert (=> b!755169 m!703423))

(declare-fun m!703425 () Bool)

(assert (=> b!755169 m!703425))

(declare-fun m!703427 () Bool)

(assert (=> b!755170 m!703427))

(declare-fun m!703429 () Bool)

(assert (=> b!755161 m!703429))

(declare-fun m!703431 () Bool)

(assert (=> b!755155 m!703431))

(assert (=> b!755150 m!703423))

(assert (=> b!755150 m!703423))

(declare-fun m!703433 () Bool)

(assert (=> b!755150 m!703433))

(declare-fun m!703435 () Bool)

(assert (=> b!755157 m!703435))

(declare-fun m!703437 () Bool)

(assert (=> b!755160 m!703437))

(declare-fun m!703439 () Bool)

(assert (=> b!755160 m!703439))

(declare-fun m!703441 () Bool)

(assert (=> b!755152 m!703441))

(declare-fun m!703443 () Bool)

(assert (=> b!755152 m!703443))

(declare-fun m!703445 () Bool)

(assert (=> b!755152 m!703445))

(assert (=> b!755152 m!703443))

(assert (=> b!755152 m!703437))

(declare-fun m!703447 () Bool)

(assert (=> b!755152 m!703447))

(assert (=> b!755154 m!703423))

(assert (=> b!755154 m!703423))

(declare-fun m!703449 () Bool)

(assert (=> b!755154 m!703449))

(assert (=> b!755154 m!703449))

(assert (=> b!755154 m!703423))

(declare-fun m!703451 () Bool)

(assert (=> b!755154 m!703451))

(declare-fun m!703453 () Bool)

(assert (=> start!65746 m!703453))

(declare-fun m!703455 () Bool)

(assert (=> start!65746 m!703455))

(assert (=> b!755153 m!703423))

(assert (=> b!755153 m!703423))

(declare-fun m!703457 () Bool)

(assert (=> b!755153 m!703457))

(assert (=> b!755159 m!703423))

(assert (=> b!755159 m!703423))

(assert (=> b!755159 m!703457))

(declare-fun m!703459 () Bool)

(assert (=> b!755167 m!703459))

(assert (=> b!755164 m!703423))

(assert (=> b!755164 m!703423))

(declare-fun m!703461 () Bool)

(assert (=> b!755164 m!703461))

(declare-fun m!703463 () Bool)

(assert (=> b!755164 m!703463))

(declare-fun m!703465 () Bool)

(assert (=> b!755164 m!703465))

(declare-fun m!703467 () Bool)

(assert (=> b!755158 m!703467))

(declare-fun m!703469 () Bool)

(assert (=> b!755158 m!703469))

(declare-fun m!703471 () Bool)

(assert (=> b!755163 m!703471))

(assert (=> b!755165 m!703423))

(assert (=> b!755165 m!703423))

(declare-fun m!703473 () Bool)

(assert (=> b!755165 m!703473))

(push 1)

