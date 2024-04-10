; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65630 () Bool)

(assert start!65630)

(declare-fun b!751167 () Bool)

(declare-fun res!507104 () Bool)

(declare-fun e!419059 () Bool)

(assert (=> b!751167 (=> (not res!507104) (not e!419059))))

(declare-datatypes ((array!41803 0))(
  ( (array!41804 (arr!20015 (Array (_ BitVec 32) (_ BitVec 64))) (size!20436 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41803)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!751167 (= res!507104 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20015 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!751168 () Bool)

(declare-fun res!507105 () Bool)

(declare-fun e!419062 () Bool)

(assert (=> b!751168 (=> (not res!507105) (not e!419062))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41803 (_ BitVec 32)) Bool)

(assert (=> b!751168 (= res!507105 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!751169 () Bool)

(declare-fun res!507106 () Bool)

(declare-fun e!419057 () Bool)

(assert (=> b!751169 (=> (not res!507106) (not e!419057))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!751169 (= res!507106 (and (= (size!20436 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20436 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20436 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!751170 () Bool)

(assert (=> b!751170 (= e!419057 e!419062)))

(declare-fun res!507097 () Bool)

(assert (=> b!751170 (=> (not res!507097) (not e!419062))))

(declare-datatypes ((SeekEntryResult!7615 0))(
  ( (MissingZero!7615 (index!32828 (_ BitVec 32))) (Found!7615 (index!32829 (_ BitVec 32))) (Intermediate!7615 (undefined!8427 Bool) (index!32830 (_ BitVec 32)) (x!63749 (_ BitVec 32))) (Undefined!7615) (MissingVacant!7615 (index!32831 (_ BitVec 32))) )
))
(declare-fun lt!334054 () SeekEntryResult!7615)

(assert (=> b!751170 (= res!507097 (or (= lt!334054 (MissingZero!7615 i!1173)) (= lt!334054 (MissingVacant!7615 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41803 (_ BitVec 32)) SeekEntryResult!7615)

(assert (=> b!751170 (= lt!334054 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!751171 () Bool)

(declare-fun res!507093 () Bool)

(assert (=> b!751171 (=> (not res!507093) (not e!419062))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!751171 (= res!507093 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20436 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20436 a!3186))))))

(declare-fun b!751172 () Bool)

(declare-datatypes ((Unit!25840 0))(
  ( (Unit!25841) )
))
(declare-fun e!419053 () Unit!25840)

(declare-fun Unit!25842 () Unit!25840)

(assert (=> b!751172 (= e!419053 Unit!25842)))

(assert (=> b!751172 false))

(declare-fun b!751173 () Bool)

(declare-fun res!507091 () Bool)

(assert (=> b!751173 (=> (not res!507091) (not e!419057))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!751173 (= res!507091 (validKeyInArray!0 (select (arr!20015 a!3186) j!159)))))

(declare-fun b!751174 () Bool)

(declare-fun res!507098 () Bool)

(declare-fun e!419055 () Bool)

(assert (=> b!751174 (=> res!507098 e!419055)))

(declare-fun lt!334051 () SeekEntryResult!7615)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41803 (_ BitVec 32)) SeekEntryResult!7615)

(assert (=> b!751174 (= res!507098 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20015 a!3186) j!159) a!3186 mask!3328) lt!334051)))))

(declare-fun b!751175 () Bool)

(declare-fun e!419063 () Bool)

(assert (=> b!751175 (= e!419055 e!419063)))

(declare-fun res!507101 () Bool)

(assert (=> b!751175 (=> res!507101 e!419063)))

(declare-fun lt!334052 () (_ BitVec 64))

(declare-fun lt!334046 () (_ BitVec 64))

(assert (=> b!751175 (= res!507101 (= lt!334052 lt!334046))))

(assert (=> b!751175 (= lt!334052 (select (store (arr!20015 a!3186) i!1173 k!2102) index!1321))))

(declare-fun res!507094 () Bool)

(assert (=> start!65630 (=> (not res!507094) (not e!419057))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65630 (= res!507094 (validMask!0 mask!3328))))

(assert (=> start!65630 e!419057))

(assert (=> start!65630 true))

(declare-fun array_inv!15811 (array!41803) Bool)

(assert (=> start!65630 (array_inv!15811 a!3186)))

(declare-fun b!751176 () Bool)

(assert (=> b!751176 (= e!419063 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun e!419061 () Bool)

(assert (=> b!751176 e!419061))

(declare-fun res!507096 () Bool)

(assert (=> b!751176 (=> (not res!507096) (not e!419061))))

(assert (=> b!751176 (= res!507096 (= lt!334052 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!334048 () Unit!25840)

(assert (=> b!751176 (= lt!334048 e!419053)))

(declare-fun c!82420 () Bool)

(assert (=> b!751176 (= c!82420 (= lt!334052 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!751177 () Bool)

(declare-fun Unit!25843 () Unit!25840)

(assert (=> b!751177 (= e!419053 Unit!25843)))

(declare-fun b!751178 () Bool)

(declare-fun e!419054 () Bool)

(assert (=> b!751178 (= e!419054 (not e!419055))))

(declare-fun res!507100 () Bool)

(assert (=> b!751178 (=> res!507100 e!419055)))

(declare-fun lt!334053 () SeekEntryResult!7615)

(assert (=> b!751178 (= res!507100 (or (not (is-Intermediate!7615 lt!334053)) (bvslt x!1131 (x!63749 lt!334053)) (not (= x!1131 (x!63749 lt!334053))) (not (= index!1321 (index!32830 lt!334053)))))))

(declare-fun e!419056 () Bool)

(assert (=> b!751178 e!419056))

(declare-fun res!507092 () Bool)

(assert (=> b!751178 (=> (not res!507092) (not e!419056))))

(declare-fun lt!334050 () SeekEntryResult!7615)

(assert (=> b!751178 (= res!507092 (= lt!334050 lt!334051))))

(assert (=> b!751178 (= lt!334051 (Found!7615 j!159))))

(assert (=> b!751178 (= lt!334050 (seekEntryOrOpen!0 (select (arr!20015 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!751178 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!334049 () Unit!25840)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41803 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25840)

(assert (=> b!751178 (= lt!334049 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!751179 () Bool)

(declare-fun res!507090 () Bool)

(assert (=> b!751179 (=> (not res!507090) (not e!419057))))

(assert (=> b!751179 (= res!507090 (validKeyInArray!0 k!2102))))

(declare-fun b!751180 () Bool)

(assert (=> b!751180 (= e!419062 e!419059)))

(declare-fun res!507102 () Bool)

(assert (=> b!751180 (=> (not res!507102) (not e!419059))))

(declare-fun lt!334055 () SeekEntryResult!7615)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41803 (_ BitVec 32)) SeekEntryResult!7615)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!751180 (= res!507102 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20015 a!3186) j!159) mask!3328) (select (arr!20015 a!3186) j!159) a!3186 mask!3328) lt!334055))))

(assert (=> b!751180 (= lt!334055 (Intermediate!7615 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun e!419058 () Bool)

(declare-fun b!751181 () Bool)

(assert (=> b!751181 (= e!419058 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20015 a!3186) j!159) a!3186 mask!3328) (Found!7615 j!159)))))

(declare-fun b!751182 () Bool)

(assert (=> b!751182 (= e!419059 e!419054)))

(declare-fun res!507099 () Bool)

(assert (=> b!751182 (=> (not res!507099) (not e!419054))))

(declare-fun lt!334047 () SeekEntryResult!7615)

(assert (=> b!751182 (= res!507099 (= lt!334047 lt!334053))))

(declare-fun lt!334045 () array!41803)

(assert (=> b!751182 (= lt!334053 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334046 lt!334045 mask!3328))))

(assert (=> b!751182 (= lt!334047 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334046 mask!3328) lt!334046 lt!334045 mask!3328))))

(assert (=> b!751182 (= lt!334046 (select (store (arr!20015 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!751182 (= lt!334045 (array!41804 (store (arr!20015 a!3186) i!1173 k!2102) (size!20436 a!3186)))))

(declare-fun b!751183 () Bool)

(assert (=> b!751183 (= e!419056 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20015 a!3186) j!159) a!3186 mask!3328) lt!334051))))

(declare-fun b!751184 () Bool)

(declare-fun res!507095 () Bool)

(assert (=> b!751184 (=> (not res!507095) (not e!419062))))

(declare-datatypes ((List!14017 0))(
  ( (Nil!14014) (Cons!14013 (h!15085 (_ BitVec 64)) (t!20332 List!14017)) )
))
(declare-fun arrayNoDuplicates!0 (array!41803 (_ BitVec 32) List!14017) Bool)

(assert (=> b!751184 (= res!507095 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14014))))

(declare-fun b!751185 () Bool)

(declare-fun res!507107 () Bool)

(assert (=> b!751185 (=> (not res!507107) (not e!419059))))

(assert (=> b!751185 (= res!507107 e!419058)))

(declare-fun c!82419 () Bool)

(assert (=> b!751185 (= c!82419 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!751186 () Bool)

(assert (=> b!751186 (= e!419061 (= (seekEntryOrOpen!0 lt!334046 lt!334045 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334046 lt!334045 mask!3328)))))

(declare-fun b!751187 () Bool)

(assert (=> b!751187 (= e!419058 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20015 a!3186) j!159) a!3186 mask!3328) lt!334055))))

(declare-fun b!751188 () Bool)

(declare-fun res!507103 () Bool)

(assert (=> b!751188 (=> (not res!507103) (not e!419057))))

(declare-fun arrayContainsKey!0 (array!41803 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!751188 (= res!507103 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!65630 res!507094) b!751169))

(assert (= (and b!751169 res!507106) b!751173))

(assert (= (and b!751173 res!507091) b!751179))

(assert (= (and b!751179 res!507090) b!751188))

(assert (= (and b!751188 res!507103) b!751170))

(assert (= (and b!751170 res!507097) b!751168))

(assert (= (and b!751168 res!507105) b!751184))

(assert (= (and b!751184 res!507095) b!751171))

(assert (= (and b!751171 res!507093) b!751180))

(assert (= (and b!751180 res!507102) b!751167))

(assert (= (and b!751167 res!507104) b!751185))

(assert (= (and b!751185 c!82419) b!751187))

(assert (= (and b!751185 (not c!82419)) b!751181))

(assert (= (and b!751185 res!507107) b!751182))

(assert (= (and b!751182 res!507099) b!751178))

(assert (= (and b!751178 res!507092) b!751183))

(assert (= (and b!751178 (not res!507100)) b!751174))

(assert (= (and b!751174 (not res!507098)) b!751175))

(assert (= (and b!751175 (not res!507101)) b!751176))

(assert (= (and b!751176 c!82420) b!751172))

(assert (= (and b!751176 (not c!82420)) b!751177))

(assert (= (and b!751176 res!507096) b!751186))

(declare-fun m!700407 () Bool)

(assert (=> b!751173 m!700407))

(assert (=> b!751173 m!700407))

(declare-fun m!700409 () Bool)

(assert (=> b!751173 m!700409))

(declare-fun m!700411 () Bool)

(assert (=> b!751179 m!700411))

(assert (=> b!751183 m!700407))

(assert (=> b!751183 m!700407))

(declare-fun m!700413 () Bool)

(assert (=> b!751183 m!700413))

(assert (=> b!751180 m!700407))

(assert (=> b!751180 m!700407))

(declare-fun m!700415 () Bool)

(assert (=> b!751180 m!700415))

(assert (=> b!751180 m!700415))

(assert (=> b!751180 m!700407))

(declare-fun m!700417 () Bool)

(assert (=> b!751180 m!700417))

(assert (=> b!751174 m!700407))

(assert (=> b!751174 m!700407))

(declare-fun m!700419 () Bool)

(assert (=> b!751174 m!700419))

(declare-fun m!700421 () Bool)

(assert (=> b!751170 m!700421))

(declare-fun m!700423 () Bool)

(assert (=> b!751182 m!700423))

(declare-fun m!700425 () Bool)

(assert (=> b!751182 m!700425))

(assert (=> b!751182 m!700423))

(declare-fun m!700427 () Bool)

(assert (=> b!751182 m!700427))

(declare-fun m!700429 () Bool)

(assert (=> b!751182 m!700429))

(declare-fun m!700431 () Bool)

(assert (=> b!751182 m!700431))

(declare-fun m!700433 () Bool)

(assert (=> b!751167 m!700433))

(assert (=> b!751178 m!700407))

(assert (=> b!751178 m!700407))

(declare-fun m!700435 () Bool)

(assert (=> b!751178 m!700435))

(declare-fun m!700437 () Bool)

(assert (=> b!751178 m!700437))

(declare-fun m!700439 () Bool)

(assert (=> b!751178 m!700439))

(assert (=> b!751181 m!700407))

(assert (=> b!751181 m!700407))

(assert (=> b!751181 m!700419))

(declare-fun m!700441 () Bool)

(assert (=> b!751188 m!700441))

(assert (=> b!751187 m!700407))

(assert (=> b!751187 m!700407))

(declare-fun m!700443 () Bool)

(assert (=> b!751187 m!700443))

(declare-fun m!700445 () Bool)

(assert (=> b!751168 m!700445))

(assert (=> b!751175 m!700429))

(declare-fun m!700447 () Bool)

(assert (=> b!751175 m!700447))

(declare-fun m!700449 () Bool)

(assert (=> start!65630 m!700449))

(declare-fun m!700451 () Bool)

(assert (=> start!65630 m!700451))

(declare-fun m!700453 () Bool)

(assert (=> b!751184 m!700453))

(declare-fun m!700455 () Bool)

(assert (=> b!751186 m!700455))

(declare-fun m!700457 () Bool)

(assert (=> b!751186 m!700457))

(push 1)

(assert (not b!751184))

(assert (not b!751178))

(assert (not b!751180))

(assert (not b!751188))

(assert (not b!751182))

(assert (not b!751183))

(assert (not b!751170))

(assert (not b!751174))

(assert (not b!751168))

(assert (not b!751179))

(assert (not b!751186))

(assert (not b!751181))

(assert (not b!751187))

(assert (not start!65630))

(assert (not b!751173))

(check-sat)

(pop 1)

(push 1)

(check-sat)

