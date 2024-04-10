; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28212 () Bool)

(assert start!28212)

(declare-fun b!288901 () Bool)

(declare-fun res!150529 () Bool)

(declare-fun e!182918 () Bool)

(assert (=> b!288901 (=> (not res!150529) (not e!182918))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288901 (= res!150529 (validKeyInArray!0 k!2524))))

(declare-fun b!288902 () Bool)

(declare-fun res!150526 () Bool)

(assert (=> b!288902 (=> (not res!150526) (not e!182918))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14526 0))(
  ( (array!14527 (arr!6890 (Array (_ BitVec 32) (_ BitVec 64))) (size!7242 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14526)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!288902 (= res!150526 (and (= (size!7242 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7242 a!3312))))))

(declare-fun b!288903 () Bool)

(declare-fun res!150527 () Bool)

(declare-fun e!182917 () Bool)

(assert (=> b!288903 (=> (not res!150527) (not e!182917))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14526 (_ BitVec 32)) Bool)

(assert (=> b!288903 (= res!150527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!288904 () Bool)

(declare-fun e!182915 () Bool)

(assert (=> b!288904 (= e!182915 (not true))))

(declare-datatypes ((SeekEntryResult!2039 0))(
  ( (MissingZero!2039 (index!10326 (_ BitVec 32))) (Found!2039 (index!10327 (_ BitVec 32))) (Intermediate!2039 (undefined!2851 Bool) (index!10328 (_ BitVec 32)) (x!28540 (_ BitVec 32))) (Undefined!2039) (MissingVacant!2039 (index!10329 (_ BitVec 32))) )
))
(declare-fun lt!142430 () SeekEntryResult!2039)

(assert (=> b!288904 (and (= (select (arr!6890 a!3312) (index!10328 lt!142430)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10328 lt!142430) i!1256))))

(declare-fun b!288905 () Bool)

(declare-fun e!182914 () Bool)

(assert (=> b!288905 (= e!182917 e!182914)))

(declare-fun res!150531 () Bool)

(assert (=> b!288905 (=> (not res!150531) (not e!182914))))

(declare-fun lt!142427 () Bool)

(assert (=> b!288905 (= res!150531 lt!142427)))

(declare-fun lt!142429 () (_ BitVec 32))

(declare-fun lt!142428 () SeekEntryResult!2039)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14526 (_ BitVec 32)) SeekEntryResult!2039)

(assert (=> b!288905 (= lt!142428 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142429 k!2524 (array!14527 (store (arr!6890 a!3312) i!1256 k!2524) (size!7242 a!3312)) mask!3809))))

(assert (=> b!288905 (= lt!142430 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142429 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288905 (= lt!142429 (toIndex!0 k!2524 mask!3809))))

(declare-fun res!150524 () Bool)

(assert (=> start!28212 (=> (not res!150524) (not e!182918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28212 (= res!150524 (validMask!0 mask!3809))))

(assert (=> start!28212 e!182918))

(assert (=> start!28212 true))

(declare-fun array_inv!4853 (array!14526) Bool)

(assert (=> start!28212 (array_inv!4853 a!3312)))

(declare-fun b!288906 () Bool)

(declare-fun res!150528 () Bool)

(assert (=> b!288906 (=> (not res!150528) (not e!182918))))

(declare-fun arrayContainsKey!0 (array!14526 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288906 (= res!150528 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288907 () Bool)

(assert (=> b!288907 (= e!182918 e!182917)))

(declare-fun res!150530 () Bool)

(assert (=> b!288907 (=> (not res!150530) (not e!182917))))

(declare-fun lt!142432 () SeekEntryResult!2039)

(assert (=> b!288907 (= res!150530 (or lt!142427 (= lt!142432 (MissingVacant!2039 i!1256))))))

(assert (=> b!288907 (= lt!142427 (= lt!142432 (MissingZero!2039 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14526 (_ BitVec 32)) SeekEntryResult!2039)

(assert (=> b!288907 (= lt!142432 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!288908 () Bool)

(assert (=> b!288908 (= e!182914 e!182915)))

(declare-fun res!150525 () Bool)

(assert (=> b!288908 (=> (not res!150525) (not e!182915))))

(declare-fun lt!142431 () Bool)

(assert (=> b!288908 (= res!150525 (and (or lt!142431 (not (undefined!2851 lt!142430))) (or lt!142431 (not (= (select (arr!6890 a!3312) (index!10328 lt!142430)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142431 (not (= (select (arr!6890 a!3312) (index!10328 lt!142430)) k!2524))) (not lt!142431)))))

(assert (=> b!288908 (= lt!142431 (not (is-Intermediate!2039 lt!142430)))))

(assert (= (and start!28212 res!150524) b!288902))

(assert (= (and b!288902 res!150526) b!288901))

(assert (= (and b!288901 res!150529) b!288906))

(assert (= (and b!288906 res!150528) b!288907))

(assert (= (and b!288907 res!150530) b!288903))

(assert (= (and b!288903 res!150527) b!288905))

(assert (= (and b!288905 res!150531) b!288908))

(assert (= (and b!288908 res!150525) b!288904))

(declare-fun m!303093 () Bool)

(assert (=> start!28212 m!303093))

(declare-fun m!303095 () Bool)

(assert (=> start!28212 m!303095))

(declare-fun m!303097 () Bool)

(assert (=> b!288904 m!303097))

(assert (=> b!288908 m!303097))

(declare-fun m!303099 () Bool)

(assert (=> b!288905 m!303099))

(declare-fun m!303101 () Bool)

(assert (=> b!288905 m!303101))

(declare-fun m!303103 () Bool)

(assert (=> b!288905 m!303103))

(declare-fun m!303105 () Bool)

(assert (=> b!288905 m!303105))

(declare-fun m!303107 () Bool)

(assert (=> b!288901 m!303107))

(declare-fun m!303109 () Bool)

(assert (=> b!288907 m!303109))

(declare-fun m!303111 () Bool)

(assert (=> b!288906 m!303111))

(declare-fun m!303113 () Bool)

(assert (=> b!288903 m!303113))

(push 1)

