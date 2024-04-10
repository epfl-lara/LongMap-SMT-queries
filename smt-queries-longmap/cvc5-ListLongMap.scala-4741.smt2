; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65506 () Bool)

(assert start!65506)

(declare-fun b!747154 () Bool)

(declare-datatypes ((Unit!25592 0))(
  ( (Unit!25593) )
))
(declare-fun e!417189 () Unit!25592)

(declare-fun Unit!25594 () Unit!25592)

(assert (=> b!747154 (= e!417189 Unit!25594)))

(assert (=> b!747154 false))

(declare-fun b!747155 () Bool)

(declare-fun res!503835 () Bool)

(declare-fun e!417185 () Bool)

(assert (=> b!747155 (=> (not res!503835) (not e!417185))))

(declare-datatypes ((array!41679 0))(
  ( (array!41680 (arr!19953 (Array (_ BitVec 32) (_ BitVec 64))) (size!20374 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41679)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!747155 (= res!503835 (and (= (size!20374 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20374 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20374 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!747156 () Bool)

(declare-fun res!503827 () Bool)

(declare-fun e!417190 () Bool)

(assert (=> b!747156 (=> res!503827 e!417190)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun lt!332096 () (_ BitVec 64))

(assert (=> b!747156 (= res!503827 (= (select (store (arr!19953 a!3186) i!1173 k!2102) index!1321) lt!332096))))

(declare-fun b!747157 () Bool)

(declare-fun e!417183 () Bool)

(assert (=> b!747157 (= e!417183 (not e!417190))))

(declare-fun res!503829 () Bool)

(assert (=> b!747157 (=> res!503829 e!417190)))

(declare-datatypes ((SeekEntryResult!7553 0))(
  ( (MissingZero!7553 (index!32580 (_ BitVec 32))) (Found!7553 (index!32581 (_ BitVec 32))) (Intermediate!7553 (undefined!8365 Bool) (index!32582 (_ BitVec 32)) (x!63527 (_ BitVec 32))) (Undefined!7553) (MissingVacant!7553 (index!32583 (_ BitVec 32))) )
))
(declare-fun lt!332097 () SeekEntryResult!7553)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!747157 (= res!503829 (or (not (is-Intermediate!7553 lt!332097)) (bvslt x!1131 (x!63527 lt!332097)) (not (= x!1131 (x!63527 lt!332097))) (not (= index!1321 (index!32582 lt!332097)))))))

(declare-fun e!417186 () Bool)

(assert (=> b!747157 e!417186))

(declare-fun res!503824 () Bool)

(assert (=> b!747157 (=> (not res!503824) (not e!417186))))

(declare-fun lt!332100 () SeekEntryResult!7553)

(declare-fun lt!332098 () SeekEntryResult!7553)

(assert (=> b!747157 (= res!503824 (= lt!332100 lt!332098))))

(assert (=> b!747157 (= lt!332098 (Found!7553 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41679 (_ BitVec 32)) SeekEntryResult!7553)

(assert (=> b!747157 (= lt!332100 (seekEntryOrOpen!0 (select (arr!19953 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41679 (_ BitVec 32)) Bool)

(assert (=> b!747157 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!332101 () Unit!25592)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41679 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25592)

(assert (=> b!747157 (= lt!332101 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun lt!332105 () SeekEntryResult!7553)

(declare-fun e!417188 () Bool)

(declare-fun b!747158 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41679 (_ BitVec 32)) SeekEntryResult!7553)

(assert (=> b!747158 (= e!417188 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19953 a!3186) j!159) a!3186 mask!3328) lt!332105))))

(declare-fun b!747159 () Bool)

(declare-fun res!503837 () Bool)

(declare-fun e!417191 () Bool)

(assert (=> b!747159 (=> (not res!503837) (not e!417191))))

(assert (=> b!747159 (= res!503837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!747160 () Bool)

(declare-fun e!417184 () Bool)

(assert (=> b!747160 (= e!417184 e!417183)))

(declare-fun res!503821 () Bool)

(assert (=> b!747160 (=> (not res!503821) (not e!417183))))

(declare-fun lt!332102 () SeekEntryResult!7553)

(assert (=> b!747160 (= res!503821 (= lt!332102 lt!332097))))

(declare-fun lt!332103 () array!41679)

(assert (=> b!747160 (= lt!332097 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332096 lt!332103 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!747160 (= lt!332102 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332096 mask!3328) lt!332096 lt!332103 mask!3328))))

(assert (=> b!747160 (= lt!332096 (select (store (arr!19953 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!747160 (= lt!332103 (array!41680 (store (arr!19953 a!3186) i!1173 k!2102) (size!20374 a!3186)))))

(declare-fun b!747161 () Bool)

(declare-fun res!503823 () Bool)

(assert (=> b!747161 (=> res!503823 e!417190)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41679 (_ BitVec 32)) SeekEntryResult!7553)

(assert (=> b!747161 (= res!503823 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19953 a!3186) j!159) a!3186 mask!3328) lt!332098)))))

(declare-fun res!503822 () Bool)

(assert (=> start!65506 (=> (not res!503822) (not e!417185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65506 (= res!503822 (validMask!0 mask!3328))))

(assert (=> start!65506 e!417185))

(assert (=> start!65506 true))

(declare-fun array_inv!15749 (array!41679) Bool)

(assert (=> start!65506 (array_inv!15749 a!3186)))

(declare-fun b!747162 () Bool)

(assert (=> b!747162 (= e!417188 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19953 a!3186) j!159) a!3186 mask!3328) (Found!7553 j!159)))))

(declare-fun b!747163 () Bool)

(assert (=> b!747163 (= e!417185 e!417191)))

(declare-fun res!503828 () Bool)

(assert (=> b!747163 (=> (not res!503828) (not e!417191))))

(declare-fun lt!332104 () SeekEntryResult!7553)

(assert (=> b!747163 (= res!503828 (or (= lt!332104 (MissingZero!7553 i!1173)) (= lt!332104 (MissingVacant!7553 i!1173))))))

(assert (=> b!747163 (= lt!332104 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!747164 () Bool)

(declare-fun Unit!25595 () Unit!25592)

(assert (=> b!747164 (= e!417189 Unit!25595)))

(declare-fun b!747165 () Bool)

(declare-fun res!503826 () Bool)

(assert (=> b!747165 (=> (not res!503826) (not e!417184))))

(assert (=> b!747165 (= res!503826 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19953 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!747166 () Bool)

(declare-fun res!503825 () Bool)

(assert (=> b!747166 (=> (not res!503825) (not e!417191))))

(declare-datatypes ((List!13955 0))(
  ( (Nil!13952) (Cons!13951 (h!15023 (_ BitVec 64)) (t!20270 List!13955)) )
))
(declare-fun arrayNoDuplicates!0 (array!41679 (_ BitVec 32) List!13955) Bool)

(assert (=> b!747166 (= res!503825 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13952))))

(declare-fun b!747167 () Bool)

(declare-fun res!503831 () Bool)

(assert (=> b!747167 (=> (not res!503831) (not e!417191))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!747167 (= res!503831 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20374 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20374 a!3186))))))

(declare-fun b!747168 () Bool)

(assert (=> b!747168 (= e!417190 (bvsge mask!3328 #b00000000000000000000000000000000))))

(assert (=> b!747168 (= (select (store (arr!19953 a!3186) i!1173 k!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!332099 () Unit!25592)

(assert (=> b!747168 (= lt!332099 e!417189)))

(declare-fun c!82047 () Bool)

(assert (=> b!747168 (= c!82047 (= (select (store (arr!19953 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!747169 () Bool)

(declare-fun res!503833 () Bool)

(assert (=> b!747169 (=> (not res!503833) (not e!417184))))

(assert (=> b!747169 (= res!503833 e!417188)))

(declare-fun c!82048 () Bool)

(assert (=> b!747169 (= c!82048 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!747170 () Bool)

(declare-fun res!503832 () Bool)

(assert (=> b!747170 (=> (not res!503832) (not e!417185))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!747170 (= res!503832 (validKeyInArray!0 (select (arr!19953 a!3186) j!159)))))

(declare-fun b!747171 () Bool)

(assert (=> b!747171 (= e!417186 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19953 a!3186) j!159) a!3186 mask!3328) lt!332098))))

(declare-fun b!747172 () Bool)

(declare-fun res!503830 () Bool)

(assert (=> b!747172 (=> (not res!503830) (not e!417185))))

(declare-fun arrayContainsKey!0 (array!41679 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!747172 (= res!503830 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!747173 () Bool)

(assert (=> b!747173 (= e!417191 e!417184)))

(declare-fun res!503834 () Bool)

(assert (=> b!747173 (=> (not res!503834) (not e!417184))))

(assert (=> b!747173 (= res!503834 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19953 a!3186) j!159) mask!3328) (select (arr!19953 a!3186) j!159) a!3186 mask!3328) lt!332105))))

(assert (=> b!747173 (= lt!332105 (Intermediate!7553 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!747174 () Bool)

(declare-fun res!503836 () Bool)

(assert (=> b!747174 (=> (not res!503836) (not e!417185))))

(assert (=> b!747174 (= res!503836 (validKeyInArray!0 k!2102))))

(assert (= (and start!65506 res!503822) b!747155))

(assert (= (and b!747155 res!503835) b!747170))

(assert (= (and b!747170 res!503832) b!747174))

(assert (= (and b!747174 res!503836) b!747172))

(assert (= (and b!747172 res!503830) b!747163))

(assert (= (and b!747163 res!503828) b!747159))

(assert (= (and b!747159 res!503837) b!747166))

(assert (= (and b!747166 res!503825) b!747167))

(assert (= (and b!747167 res!503831) b!747173))

(assert (= (and b!747173 res!503834) b!747165))

(assert (= (and b!747165 res!503826) b!747169))

(assert (= (and b!747169 c!82048) b!747158))

(assert (= (and b!747169 (not c!82048)) b!747162))

(assert (= (and b!747169 res!503833) b!747160))

(assert (= (and b!747160 res!503821) b!747157))

(assert (= (and b!747157 res!503824) b!747171))

(assert (= (and b!747157 (not res!503829)) b!747161))

(assert (= (and b!747161 (not res!503823)) b!747156))

(assert (= (and b!747156 (not res!503827)) b!747168))

(assert (= (and b!747168 c!82047) b!747154))

(assert (= (and b!747168 (not c!82047)) b!747164))

(declare-fun m!697303 () Bool)

(assert (=> b!747161 m!697303))

(assert (=> b!747161 m!697303))

(declare-fun m!697305 () Bool)

(assert (=> b!747161 m!697305))

(declare-fun m!697307 () Bool)

(assert (=> start!65506 m!697307))

(declare-fun m!697309 () Bool)

(assert (=> start!65506 m!697309))

(assert (=> b!747162 m!697303))

(assert (=> b!747162 m!697303))

(assert (=> b!747162 m!697305))

(assert (=> b!747173 m!697303))

(assert (=> b!747173 m!697303))

(declare-fun m!697311 () Bool)

(assert (=> b!747173 m!697311))

(assert (=> b!747173 m!697311))

(assert (=> b!747173 m!697303))

(declare-fun m!697313 () Bool)

(assert (=> b!747173 m!697313))

(assert (=> b!747157 m!697303))

(assert (=> b!747157 m!697303))

(declare-fun m!697315 () Bool)

(assert (=> b!747157 m!697315))

(declare-fun m!697317 () Bool)

(assert (=> b!747157 m!697317))

(declare-fun m!697319 () Bool)

(assert (=> b!747157 m!697319))

(declare-fun m!697321 () Bool)

(assert (=> b!747168 m!697321))

(declare-fun m!697323 () Bool)

(assert (=> b!747168 m!697323))

(declare-fun m!697325 () Bool)

(assert (=> b!747172 m!697325))

(assert (=> b!747170 m!697303))

(assert (=> b!747170 m!697303))

(declare-fun m!697327 () Bool)

(assert (=> b!747170 m!697327))

(declare-fun m!697329 () Bool)

(assert (=> b!747163 m!697329))

(declare-fun m!697331 () Bool)

(assert (=> b!747166 m!697331))

(assert (=> b!747171 m!697303))

(assert (=> b!747171 m!697303))

(declare-fun m!697333 () Bool)

(assert (=> b!747171 m!697333))

(assert (=> b!747158 m!697303))

(assert (=> b!747158 m!697303))

(declare-fun m!697335 () Bool)

(assert (=> b!747158 m!697335))

(declare-fun m!697337 () Bool)

(assert (=> b!747160 m!697337))

(assert (=> b!747160 m!697337))

(declare-fun m!697339 () Bool)

(assert (=> b!747160 m!697339))

(assert (=> b!747160 m!697321))

(declare-fun m!697341 () Bool)

(assert (=> b!747160 m!697341))

(declare-fun m!697343 () Bool)

(assert (=> b!747160 m!697343))

(declare-fun m!697345 () Bool)

(assert (=> b!747165 m!697345))

(assert (=> b!747156 m!697321))

(assert (=> b!747156 m!697323))

(declare-fun m!697347 () Bool)

(assert (=> b!747159 m!697347))

(declare-fun m!697349 () Bool)

(assert (=> b!747174 m!697349))

(push 1)

