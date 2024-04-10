; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67348 () Bool)

(assert start!67348)

(declare-fun b!778798 () Bool)

(declare-fun e!433295 () Bool)

(declare-fun e!433292 () Bool)

(assert (=> b!778798 (= e!433295 e!433292)))

(declare-fun res!526841 () Bool)

(assert (=> b!778798 (=> (not res!526841) (not e!433292))))

(declare-datatypes ((SeekEntryResult!7981 0))(
  ( (MissingZero!7981 (index!34292 (_ BitVec 32))) (Found!7981 (index!34293 (_ BitVec 32))) (Intermediate!7981 (undefined!8793 Bool) (index!34294 (_ BitVec 32)) (x!65238 (_ BitVec 32))) (Undefined!7981) (MissingVacant!7981 (index!34295 (_ BitVec 32))) )
))
(declare-fun lt!346974 () SeekEntryResult!7981)

(declare-datatypes ((array!42577 0))(
  ( (array!42578 (arr!20381 (Array (_ BitVec 32) (_ BitVec 64))) (size!20802 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42577)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42577 (_ BitVec 32)) SeekEntryResult!7981)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!778798 (= res!526841 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20381 a!3186) j!159) mask!3328) (select (arr!20381 a!3186) j!159) a!3186 mask!3328) lt!346974))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!778798 (= lt!346974 (Intermediate!7981 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun e!433294 () Bool)

(declare-fun lt!346968 () SeekEntryResult!7981)

(declare-fun b!778799 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42577 (_ BitVec 32)) SeekEntryResult!7981)

(assert (=> b!778799 (= e!433294 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20381 a!3186) j!159) a!3186 mask!3328) lt!346968))))

(declare-fun b!778800 () Bool)

(declare-fun res!526839 () Bool)

(assert (=> b!778800 (=> (not res!526839) (not e!433295))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42577 (_ BitVec 32)) Bool)

(assert (=> b!778800 (= res!526839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!778801 () Bool)

(declare-fun e!433293 () Bool)

(assert (=> b!778801 (= e!433293 e!433295)))

(declare-fun res!526828 () Bool)

(assert (=> b!778801 (=> (not res!526828) (not e!433295))))

(declare-fun lt!346976 () SeekEntryResult!7981)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!778801 (= res!526828 (or (= lt!346976 (MissingZero!7981 i!1173)) (= lt!346976 (MissingVacant!7981 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42577 (_ BitVec 32)) SeekEntryResult!7981)

(assert (=> b!778801 (= lt!346976 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!778802 () Bool)

(declare-fun res!526833 () Bool)

(assert (=> b!778802 (=> (not res!526833) (not e!433295))))

(declare-datatypes ((List!14383 0))(
  ( (Nil!14380) (Cons!14379 (h!15493 (_ BitVec 64)) (t!20698 List!14383)) )
))
(declare-fun arrayNoDuplicates!0 (array!42577 (_ BitVec 32) List!14383) Bool)

(assert (=> b!778802 (= res!526833 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14380))))

(declare-fun b!778803 () Bool)

(declare-fun res!526835 () Bool)

(assert (=> b!778803 (=> (not res!526835) (not e!433293))))

(assert (=> b!778803 (= res!526835 (and (= (size!20802 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20802 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20802 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!778804 () Bool)

(declare-fun res!526838 () Bool)

(assert (=> b!778804 (=> (not res!526838) (not e!433295))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!778804 (= res!526838 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20802 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20802 a!3186))))))

(declare-fun b!778805 () Bool)

(declare-fun e!433288 () Bool)

(assert (=> b!778805 (= e!433288 true)))

(declare-fun lt!346975 () SeekEntryResult!7981)

(assert (=> b!778805 (= lt!346975 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20381 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!778806 () Bool)

(declare-fun e!433287 () Bool)

(assert (=> b!778806 (= e!433287 e!433294)))

(declare-fun res!526834 () Bool)

(assert (=> b!778806 (=> (not res!526834) (not e!433294))))

(assert (=> b!778806 (= res!526834 (= (seekEntryOrOpen!0 (select (arr!20381 a!3186) j!159) a!3186 mask!3328) lt!346968))))

(assert (=> b!778806 (= lt!346968 (Found!7981 j!159))))

(declare-fun res!526826 () Bool)

(assert (=> start!67348 (=> (not res!526826) (not e!433293))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67348 (= res!526826 (validMask!0 mask!3328))))

(assert (=> start!67348 e!433293))

(assert (=> start!67348 true))

(declare-fun array_inv!16177 (array!42577) Bool)

(assert (=> start!67348 (array_inv!16177 a!3186)))

(declare-fun b!778807 () Bool)

(declare-fun res!526832 () Bool)

(assert (=> b!778807 (=> (not res!526832) (not e!433293))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!778807 (= res!526832 (validKeyInArray!0 (select (arr!20381 a!3186) j!159)))))

(declare-fun b!778808 () Bool)

(declare-fun res!526830 () Bool)

(assert (=> b!778808 (=> (not res!526830) (not e!433293))))

(declare-fun arrayContainsKey!0 (array!42577 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!778808 (= res!526830 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!778809 () Bool)

(declare-fun e!433291 () Bool)

(assert (=> b!778809 (= e!433292 e!433291)))

(declare-fun res!526829 () Bool)

(assert (=> b!778809 (=> (not res!526829) (not e!433291))))

(declare-fun lt!346969 () SeekEntryResult!7981)

(declare-fun lt!346970 () SeekEntryResult!7981)

(assert (=> b!778809 (= res!526829 (= lt!346969 lt!346970))))

(declare-fun lt!346972 () (_ BitVec 64))

(declare-fun lt!346973 () array!42577)

(assert (=> b!778809 (= lt!346970 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346972 lt!346973 mask!3328))))

(assert (=> b!778809 (= lt!346969 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346972 mask!3328) lt!346972 lt!346973 mask!3328))))

(assert (=> b!778809 (= lt!346972 (select (store (arr!20381 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!778809 (= lt!346973 (array!42578 (store (arr!20381 a!3186) i!1173 k!2102) (size!20802 a!3186)))))

(declare-fun b!778810 () Bool)

(declare-fun res!526840 () Bool)

(assert (=> b!778810 (=> (not res!526840) (not e!433292))))

(declare-fun e!433290 () Bool)

(assert (=> b!778810 (= res!526840 e!433290)))

(declare-fun c!86389 () Bool)

(assert (=> b!778810 (= c!86389 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!778811 () Bool)

(declare-fun res!526836 () Bool)

(assert (=> b!778811 (=> (not res!526836) (not e!433293))))

(assert (=> b!778811 (= res!526836 (validKeyInArray!0 k!2102))))

(declare-fun b!778812 () Bool)

(assert (=> b!778812 (= e!433290 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20381 a!3186) j!159) a!3186 mask!3328) (Found!7981 j!159)))))

(declare-fun b!778813 () Bool)

(assert (=> b!778813 (= e!433290 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20381 a!3186) j!159) a!3186 mask!3328) lt!346974))))

(declare-fun b!778814 () Bool)

(declare-fun res!526831 () Bool)

(assert (=> b!778814 (=> (not res!526831) (not e!433292))))

(assert (=> b!778814 (= res!526831 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20381 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!778815 () Bool)

(assert (=> b!778815 (= e!433291 (not e!433288))))

(declare-fun res!526837 () Bool)

(assert (=> b!778815 (=> res!526837 e!433288)))

(assert (=> b!778815 (= res!526837 (or (not (is-Intermediate!7981 lt!346970)) (bvslt x!1131 (x!65238 lt!346970)) (not (= x!1131 (x!65238 lt!346970))) (not (= index!1321 (index!34294 lt!346970)))))))

(assert (=> b!778815 e!433287))

(declare-fun res!526827 () Bool)

(assert (=> b!778815 (=> (not res!526827) (not e!433287))))

(assert (=> b!778815 (= res!526827 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26856 0))(
  ( (Unit!26857) )
))
(declare-fun lt!346971 () Unit!26856)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42577 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26856)

(assert (=> b!778815 (= lt!346971 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!67348 res!526826) b!778803))

(assert (= (and b!778803 res!526835) b!778807))

(assert (= (and b!778807 res!526832) b!778811))

(assert (= (and b!778811 res!526836) b!778808))

(assert (= (and b!778808 res!526830) b!778801))

(assert (= (and b!778801 res!526828) b!778800))

(assert (= (and b!778800 res!526839) b!778802))

(assert (= (and b!778802 res!526833) b!778804))

(assert (= (and b!778804 res!526838) b!778798))

(assert (= (and b!778798 res!526841) b!778814))

(assert (= (and b!778814 res!526831) b!778810))

(assert (= (and b!778810 c!86389) b!778813))

(assert (= (and b!778810 (not c!86389)) b!778812))

(assert (= (and b!778810 res!526840) b!778809))

(assert (= (and b!778809 res!526829) b!778815))

(assert (= (and b!778815 res!526827) b!778806))

(assert (= (and b!778806 res!526834) b!778799))

(assert (= (and b!778815 (not res!526837)) b!778805))

(declare-fun m!722395 () Bool)

(assert (=> b!778814 m!722395))

(declare-fun m!722397 () Bool)

(assert (=> b!778811 m!722397))

(declare-fun m!722399 () Bool)

(assert (=> b!778815 m!722399))

(declare-fun m!722401 () Bool)

(assert (=> b!778815 m!722401))

(declare-fun m!722403 () Bool)

(assert (=> b!778800 m!722403))

(declare-fun m!722405 () Bool)

(assert (=> b!778806 m!722405))

(assert (=> b!778806 m!722405))

(declare-fun m!722407 () Bool)

(assert (=> b!778806 m!722407))

(declare-fun m!722409 () Bool)

(assert (=> b!778808 m!722409))

(declare-fun m!722411 () Bool)

(assert (=> b!778801 m!722411))

(declare-fun m!722413 () Bool)

(assert (=> start!67348 m!722413))

(declare-fun m!722415 () Bool)

(assert (=> start!67348 m!722415))

(declare-fun m!722417 () Bool)

(assert (=> b!778809 m!722417))

(declare-fun m!722419 () Bool)

(assert (=> b!778809 m!722419))

(declare-fun m!722421 () Bool)

(assert (=> b!778809 m!722421))

(declare-fun m!722423 () Bool)

(assert (=> b!778809 m!722423))

(assert (=> b!778809 m!722417))

(declare-fun m!722425 () Bool)

(assert (=> b!778809 m!722425))

(declare-fun m!722427 () Bool)

(assert (=> b!778802 m!722427))

(assert (=> b!778805 m!722405))

(assert (=> b!778805 m!722405))

(declare-fun m!722429 () Bool)

(assert (=> b!778805 m!722429))

(assert (=> b!778813 m!722405))

(assert (=> b!778813 m!722405))

(declare-fun m!722431 () Bool)

(assert (=> b!778813 m!722431))

(assert (=> b!778798 m!722405))

(assert (=> b!778798 m!722405))

(declare-fun m!722433 () Bool)

(assert (=> b!778798 m!722433))

(assert (=> b!778798 m!722433))

(assert (=> b!778798 m!722405))

(declare-fun m!722435 () Bool)

(assert (=> b!778798 m!722435))

(assert (=> b!778807 m!722405))

(assert (=> b!778807 m!722405))

(declare-fun m!722437 () Bool)

(assert (=> b!778807 m!722437))

(assert (=> b!778799 m!722405))

(assert (=> b!778799 m!722405))

(declare-fun m!722439 () Bool)

(assert (=> b!778799 m!722439))

(assert (=> b!778812 m!722405))

(assert (=> b!778812 m!722405))

(assert (=> b!778812 m!722429))

(push 1)

