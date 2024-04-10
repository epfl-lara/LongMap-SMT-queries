; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28192 () Bool)

(assert start!28192)

(declare-fun b!288661 () Bool)

(declare-fun res!150287 () Bool)

(declare-fun e!182765 () Bool)

(assert (=> b!288661 (=> (not res!150287) (not e!182765))))

(declare-datatypes ((array!14506 0))(
  ( (array!14507 (arr!6880 (Array (_ BitVec 32) (_ BitVec 64))) (size!7232 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14506)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14506 (_ BitVec 32)) Bool)

(assert (=> b!288661 (= res!150287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!288663 () Bool)

(declare-fun res!150285 () Bool)

(declare-fun e!182766 () Bool)

(assert (=> b!288663 (=> (not res!150285) (not e!182766))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14506 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288663 (= res!150285 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288664 () Bool)

(assert (=> b!288664 (= e!182766 e!182765)))

(declare-fun res!150286 () Bool)

(assert (=> b!288664 (=> (not res!150286) (not e!182765))))

(declare-fun lt!142252 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2029 0))(
  ( (MissingZero!2029 (index!10286 (_ BitVec 32))) (Found!2029 (index!10287 (_ BitVec 32))) (Intermediate!2029 (undefined!2841 Bool) (index!10288 (_ BitVec 32)) (x!28498 (_ BitVec 32))) (Undefined!2029) (MissingVacant!2029 (index!10289 (_ BitVec 32))) )
))
(declare-fun lt!142251 () SeekEntryResult!2029)

(assert (=> b!288664 (= res!150286 (or lt!142252 (= lt!142251 (MissingVacant!2029 i!1256))))))

(assert (=> b!288664 (= lt!142252 (= lt!142251 (MissingZero!2029 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14506 (_ BitVec 32)) SeekEntryResult!2029)

(assert (=> b!288664 (= lt!142251 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!288665 () Bool)

(declare-fun res!150284 () Bool)

(assert (=> b!288665 (=> (not res!150284) (not e!182766))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288665 (= res!150284 (validKeyInArray!0 k!2524))))

(declare-fun b!288666 () Bool)

(declare-fun e!182764 () Bool)

(assert (=> b!288666 (= e!182764 (not true))))

(declare-fun lt!142249 () SeekEntryResult!2029)

(assert (=> b!288666 (and (= (select (arr!6880 a!3312) (index!10288 lt!142249)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10288 lt!142249) i!1256))))

(declare-fun b!288667 () Bool)

(declare-fun res!150289 () Bool)

(assert (=> b!288667 (=> (not res!150289) (not e!182766))))

(assert (=> b!288667 (= res!150289 (and (= (size!7232 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7232 a!3312))))))

(declare-fun b!288668 () Bool)

(declare-fun e!182767 () Bool)

(assert (=> b!288668 (= e!182767 e!182764)))

(declare-fun res!150290 () Bool)

(assert (=> b!288668 (=> (not res!150290) (not e!182764))))

(declare-fun lt!142247 () Bool)

(assert (=> b!288668 (= res!150290 (and (or lt!142247 (not (undefined!2841 lt!142249))) (or lt!142247 (not (= (select (arr!6880 a!3312) (index!10288 lt!142249)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142247 (not (= (select (arr!6880 a!3312) (index!10288 lt!142249)) k!2524))) (not lt!142247)))))

(assert (=> b!288668 (= lt!142247 (not (is-Intermediate!2029 lt!142249)))))

(declare-fun res!150291 () Bool)

(assert (=> start!28192 (=> (not res!150291) (not e!182766))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28192 (= res!150291 (validMask!0 mask!3809))))

(assert (=> start!28192 e!182766))

(assert (=> start!28192 true))

(declare-fun array_inv!4843 (array!14506) Bool)

(assert (=> start!28192 (array_inv!4843 a!3312)))

(declare-fun b!288662 () Bool)

(assert (=> b!288662 (= e!182765 e!182767)))

(declare-fun res!150288 () Bool)

(assert (=> b!288662 (=> (not res!150288) (not e!182767))))

(assert (=> b!288662 (= res!150288 lt!142252)))

(declare-fun lt!142248 () SeekEntryResult!2029)

(declare-fun lt!142250 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14506 (_ BitVec 32)) SeekEntryResult!2029)

(assert (=> b!288662 (= lt!142248 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142250 k!2524 (array!14507 (store (arr!6880 a!3312) i!1256 k!2524) (size!7232 a!3312)) mask!3809))))

(assert (=> b!288662 (= lt!142249 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142250 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288662 (= lt!142250 (toIndex!0 k!2524 mask!3809))))

(assert (= (and start!28192 res!150291) b!288667))

(assert (= (and b!288667 res!150289) b!288665))

(assert (= (and b!288665 res!150284) b!288663))

(assert (= (and b!288663 res!150285) b!288664))

(assert (= (and b!288664 res!150286) b!288661))

(assert (= (and b!288661 res!150287) b!288662))

(assert (= (and b!288662 res!150288) b!288668))

(assert (= (and b!288668 res!150290) b!288666))

(declare-fun m!302873 () Bool)

(assert (=> start!28192 m!302873))

(declare-fun m!302875 () Bool)

(assert (=> start!28192 m!302875))

(declare-fun m!302877 () Bool)

(assert (=> b!288663 m!302877))

(declare-fun m!302879 () Bool)

(assert (=> b!288664 m!302879))

(declare-fun m!302881 () Bool)

(assert (=> b!288665 m!302881))

(declare-fun m!302883 () Bool)

(assert (=> b!288666 m!302883))

(declare-fun m!302885 () Bool)

(assert (=> b!288662 m!302885))

(declare-fun m!302887 () Bool)

(assert (=> b!288662 m!302887))

(declare-fun m!302889 () Bool)

(assert (=> b!288662 m!302889))

(declare-fun m!302891 () Bool)

(assert (=> b!288662 m!302891))

(assert (=> b!288668 m!302883))

(declare-fun m!302893 () Bool)

(assert (=> b!288661 m!302893))

(push 1)

