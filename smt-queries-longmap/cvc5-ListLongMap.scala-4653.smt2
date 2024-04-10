; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64690 () Bool)

(assert start!64690)

(declare-fun b!729388 () Bool)

(declare-fun res!489801 () Bool)

(declare-fun e!408242 () Bool)

(assert (=> b!729388 (=> (not res!489801) (not e!408242))))

(declare-datatypes ((array!41139 0))(
  ( (array!41140 (arr!19689 (Array (_ BitVec 32) (_ BitVec 64))) (size!20110 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41139)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41139 (_ BitVec 32)) Bool)

(assert (=> b!729388 (= res!489801 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!489799 () Bool)

(declare-fun e!408238 () Bool)

(assert (=> start!64690 (=> (not res!489799) (not e!408238))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64690 (= res!489799 (validMask!0 mask!3328))))

(assert (=> start!64690 e!408238))

(assert (=> start!64690 true))

(declare-fun array_inv!15485 (array!41139) Bool)

(assert (=> start!64690 (array_inv!15485 a!3186)))

(declare-fun b!729389 () Bool)

(declare-fun res!489803 () Bool)

(declare-fun e!408239 () Bool)

(assert (=> b!729389 (=> (not res!489803) (not e!408239))))

(declare-fun e!408240 () Bool)

(assert (=> b!729389 (= res!489803 e!408240)))

(declare-fun c!80170 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!729389 (= c!80170 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!729390 () Bool)

(assert (=> b!729390 (= e!408238 e!408242)))

(declare-fun res!489806 () Bool)

(assert (=> b!729390 (=> (not res!489806) (not e!408242))))

(declare-datatypes ((SeekEntryResult!7289 0))(
  ( (MissingZero!7289 (index!31524 (_ BitVec 32))) (Found!7289 (index!31525 (_ BitVec 32))) (Intermediate!7289 (undefined!8101 Bool) (index!31526 (_ BitVec 32)) (x!62511 (_ BitVec 32))) (Undefined!7289) (MissingVacant!7289 (index!31527 (_ BitVec 32))) )
))
(declare-fun lt!323139 () SeekEntryResult!7289)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!729390 (= res!489806 (or (= lt!323139 (MissingZero!7289 i!1173)) (= lt!323139 (MissingVacant!7289 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41139 (_ BitVec 32)) SeekEntryResult!7289)

(assert (=> b!729390 (= lt!323139 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!729391 () Bool)

(declare-fun res!489811 () Bool)

(assert (=> b!729391 (=> (not res!489811) (not e!408238))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!729391 (= res!489811 (and (= (size!20110 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20110 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20110 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!729392 () Bool)

(declare-fun res!489802 () Bool)

(assert (=> b!729392 (=> (not res!489802) (not e!408242))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!729392 (= res!489802 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20110 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20110 a!3186))))))

(declare-fun b!729393 () Bool)

(declare-fun lt!323137 () SeekEntryResult!7289)

(declare-fun e!408237 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41139 (_ BitVec 32)) SeekEntryResult!7289)

(assert (=> b!729393 (= e!408237 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19689 a!3186) j!159) a!3186 mask!3328) lt!323137))))

(declare-fun b!729394 () Bool)

(declare-fun res!489812 () Bool)

(assert (=> b!729394 (=> (not res!489812) (not e!408238))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!729394 (= res!489812 (validKeyInArray!0 (select (arr!19689 a!3186) j!159)))))

(declare-fun b!729395 () Bool)

(assert (=> b!729395 (= e!408242 e!408239)))

(declare-fun res!489807 () Bool)

(assert (=> b!729395 (=> (not res!489807) (not e!408239))))

(declare-fun lt!323143 () SeekEntryResult!7289)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41139 (_ BitVec 32)) SeekEntryResult!7289)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729395 (= res!489807 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19689 a!3186) j!159) mask!3328) (select (arr!19689 a!3186) j!159) a!3186 mask!3328) lt!323143))))

(assert (=> b!729395 (= lt!323143 (Intermediate!7289 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!729396 () Bool)

(declare-fun res!489797 () Bool)

(assert (=> b!729396 (=> (not res!489797) (not e!408239))))

(assert (=> b!729396 (= res!489797 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19689 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!729397 () Bool)

(assert (=> b!729397 (= e!408240 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19689 a!3186) j!159) a!3186 mask!3328) lt!323143))))

(declare-fun b!729398 () Bool)

(declare-fun res!489809 () Bool)

(assert (=> b!729398 (=> (not res!489809) (not e!408238))))

(declare-fun arrayContainsKey!0 (array!41139 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!729398 (= res!489809 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!729399 () Bool)

(declare-fun e!408244 () Bool)

(assert (=> b!729399 (= e!408244 true)))

(declare-fun lt!323140 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729399 (= lt!323140 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!729400 () Bool)

(declare-fun res!489804 () Bool)

(assert (=> b!729400 (=> (not res!489804) (not e!408238))))

(assert (=> b!729400 (= res!489804 (validKeyInArray!0 k!2102))))

(declare-fun b!729401 () Bool)

(declare-fun e!408243 () Bool)

(assert (=> b!729401 (= e!408243 e!408237)))

(declare-fun res!489808 () Bool)

(assert (=> b!729401 (=> (not res!489808) (not e!408237))))

(assert (=> b!729401 (= res!489808 (= (seekEntryOrOpen!0 (select (arr!19689 a!3186) j!159) a!3186 mask!3328) lt!323137))))

(assert (=> b!729401 (= lt!323137 (Found!7289 j!159))))

(declare-fun b!729402 () Bool)

(declare-fun res!489798 () Bool)

(assert (=> b!729402 (=> (not res!489798) (not e!408242))))

(declare-datatypes ((List!13691 0))(
  ( (Nil!13688) (Cons!13687 (h!14747 (_ BitVec 64)) (t!20006 List!13691)) )
))
(declare-fun arrayNoDuplicates!0 (array!41139 (_ BitVec 32) List!13691) Bool)

(assert (=> b!729402 (= res!489798 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13688))))

(declare-fun b!729403 () Bool)

(assert (=> b!729403 (= e!408240 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19689 a!3186) j!159) a!3186 mask!3328) (Found!7289 j!159)))))

(declare-fun b!729404 () Bool)

(declare-fun e!408245 () Bool)

(assert (=> b!729404 (= e!408245 (not e!408244))))

(declare-fun res!489800 () Bool)

(assert (=> b!729404 (=> res!489800 e!408244)))

(declare-fun lt!323136 () SeekEntryResult!7289)

(assert (=> b!729404 (= res!489800 (or (not (is-Intermediate!7289 lt!323136)) (bvsge x!1131 (x!62511 lt!323136))))))

(assert (=> b!729404 e!408243))

(declare-fun res!489810 () Bool)

(assert (=> b!729404 (=> (not res!489810) (not e!408243))))

(assert (=> b!729404 (= res!489810 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24896 0))(
  ( (Unit!24897) )
))
(declare-fun lt!323141 () Unit!24896)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41139 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24896)

(assert (=> b!729404 (= lt!323141 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!729405 () Bool)

(assert (=> b!729405 (= e!408239 e!408245)))

(declare-fun res!489805 () Bool)

(assert (=> b!729405 (=> (not res!489805) (not e!408245))))

(declare-fun lt!323138 () SeekEntryResult!7289)

(assert (=> b!729405 (= res!489805 (= lt!323138 lt!323136))))

(declare-fun lt!323144 () array!41139)

(declare-fun lt!323142 () (_ BitVec 64))

(assert (=> b!729405 (= lt!323136 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323142 lt!323144 mask!3328))))

(assert (=> b!729405 (= lt!323138 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323142 mask!3328) lt!323142 lt!323144 mask!3328))))

(assert (=> b!729405 (= lt!323142 (select (store (arr!19689 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!729405 (= lt!323144 (array!41140 (store (arr!19689 a!3186) i!1173 k!2102) (size!20110 a!3186)))))

(assert (= (and start!64690 res!489799) b!729391))

(assert (= (and b!729391 res!489811) b!729394))

(assert (= (and b!729394 res!489812) b!729400))

(assert (= (and b!729400 res!489804) b!729398))

(assert (= (and b!729398 res!489809) b!729390))

(assert (= (and b!729390 res!489806) b!729388))

(assert (= (and b!729388 res!489801) b!729402))

(assert (= (and b!729402 res!489798) b!729392))

(assert (= (and b!729392 res!489802) b!729395))

(assert (= (and b!729395 res!489807) b!729396))

(assert (= (and b!729396 res!489797) b!729389))

(assert (= (and b!729389 c!80170) b!729397))

(assert (= (and b!729389 (not c!80170)) b!729403))

(assert (= (and b!729389 res!489803) b!729405))

(assert (= (and b!729405 res!489805) b!729404))

(assert (= (and b!729404 res!489810) b!729401))

(assert (= (and b!729401 res!489808) b!729393))

(assert (= (and b!729404 (not res!489800)) b!729399))

(declare-fun m!683035 () Bool)

(assert (=> b!729405 m!683035))

(declare-fun m!683037 () Bool)

(assert (=> b!729405 m!683037))

(assert (=> b!729405 m!683035))

(declare-fun m!683039 () Bool)

(assert (=> b!729405 m!683039))

(declare-fun m!683041 () Bool)

(assert (=> b!729405 m!683041))

(declare-fun m!683043 () Bool)

(assert (=> b!729405 m!683043))

(declare-fun m!683045 () Bool)

(assert (=> b!729393 m!683045))

(assert (=> b!729393 m!683045))

(declare-fun m!683047 () Bool)

(assert (=> b!729393 m!683047))

(declare-fun m!683049 () Bool)

(assert (=> b!729404 m!683049))

(declare-fun m!683051 () Bool)

(assert (=> b!729404 m!683051))

(declare-fun m!683053 () Bool)

(assert (=> b!729388 m!683053))

(assert (=> b!729401 m!683045))

(assert (=> b!729401 m!683045))

(declare-fun m!683055 () Bool)

(assert (=> b!729401 m!683055))

(declare-fun m!683057 () Bool)

(assert (=> b!729390 m!683057))

(assert (=> b!729394 m!683045))

(assert (=> b!729394 m!683045))

(declare-fun m!683059 () Bool)

(assert (=> b!729394 m!683059))

(declare-fun m!683061 () Bool)

(assert (=> b!729398 m!683061))

(assert (=> b!729397 m!683045))

(assert (=> b!729397 m!683045))

(declare-fun m!683063 () Bool)

(assert (=> b!729397 m!683063))

(declare-fun m!683065 () Bool)

(assert (=> b!729400 m!683065))

(declare-fun m!683067 () Bool)

(assert (=> b!729399 m!683067))

(declare-fun m!683069 () Bool)

(assert (=> b!729396 m!683069))

(assert (=> b!729395 m!683045))

(assert (=> b!729395 m!683045))

(declare-fun m!683071 () Bool)

(assert (=> b!729395 m!683071))

(assert (=> b!729395 m!683071))

(assert (=> b!729395 m!683045))

(declare-fun m!683073 () Bool)

(assert (=> b!729395 m!683073))

(declare-fun m!683075 () Bool)

(assert (=> b!729402 m!683075))

(declare-fun m!683077 () Bool)

(assert (=> start!64690 m!683077))

(declare-fun m!683079 () Bool)

(assert (=> start!64690 m!683079))

(assert (=> b!729403 m!683045))

(assert (=> b!729403 m!683045))

(declare-fun m!683081 () Bool)

(assert (=> b!729403 m!683081))

(push 1)

