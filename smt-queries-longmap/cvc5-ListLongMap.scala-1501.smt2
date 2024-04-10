; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28440 () Bool)

(assert start!28440)

(declare-fun b!291241 () Bool)

(declare-fun e!184288 () Bool)

(declare-fun e!184292 () Bool)

(assert (=> b!291241 (= e!184288 e!184292)))

(declare-fun res!152583 () Bool)

(assert (=> b!291241 (=> (not res!152583) (not e!184292))))

(declare-fun lt!144048 () Bool)

(declare-datatypes ((array!14709 0))(
  ( (array!14710 (arr!6980 (Array (_ BitVec 32) (_ BitVec 64))) (size!7332 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14709)

(declare-datatypes ((SeekEntryResult!2129 0))(
  ( (MissingZero!2129 (index!10686 (_ BitVec 32))) (Found!2129 (index!10687 (_ BitVec 32))) (Intermediate!2129 (undefined!2941 Bool) (index!10688 (_ BitVec 32)) (x!28876 (_ BitVec 32))) (Undefined!2129) (MissingVacant!2129 (index!10689 (_ BitVec 32))) )
))
(declare-fun lt!144047 () SeekEntryResult!2129)

(assert (=> b!291241 (= res!152583 (and (or lt!144048 (not (undefined!2941 lt!144047))) (not lt!144048) (= (select (arr!6980 a!3312) (index!10688 lt!144047)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!291241 (= lt!144048 (not (is-Intermediate!2129 lt!144047)))))

(declare-fun b!291242 () Bool)

(declare-fun res!152582 () Bool)

(declare-fun e!184289 () Bool)

(assert (=> b!291242 (=> (not res!152582) (not e!184289))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!291242 (= res!152582 (and (= (size!7332 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7332 a!3312))))))

(declare-fun b!291243 () Bool)

(declare-fun res!152585 () Bool)

(declare-fun e!184291 () Bool)

(assert (=> b!291243 (=> (not res!152585) (not e!184291))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14709 (_ BitVec 32)) Bool)

(assert (=> b!291243 (= res!152585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!152584 () Bool)

(assert (=> start!28440 (=> (not res!152584) (not e!184289))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28440 (= res!152584 (validMask!0 mask!3809))))

(assert (=> start!28440 e!184289))

(assert (=> start!28440 true))

(declare-fun array_inv!4943 (array!14709) Bool)

(assert (=> start!28440 (array_inv!4943 a!3312)))

(declare-fun b!291244 () Bool)

(assert (=> b!291244 (= e!184289 e!184291)))

(declare-fun res!152580 () Bool)

(assert (=> b!291244 (=> (not res!152580) (not e!184291))))

(declare-fun lt!144049 () Bool)

(declare-fun lt!144044 () SeekEntryResult!2129)

(assert (=> b!291244 (= res!152580 (or lt!144049 (= lt!144044 (MissingVacant!2129 i!1256))))))

(assert (=> b!291244 (= lt!144049 (= lt!144044 (MissingZero!2129 i!1256)))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14709 (_ BitVec 32)) SeekEntryResult!2129)

(assert (=> b!291244 (= lt!144044 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!291245 () Bool)

(assert (=> b!291245 (= e!184291 e!184288)))

(declare-fun res!152586 () Bool)

(assert (=> b!291245 (=> (not res!152586) (not e!184288))))

(assert (=> b!291245 (= res!152586 (and (not lt!144049) (= lt!144044 (MissingVacant!2129 i!1256))))))

(declare-fun lt!144046 () SeekEntryResult!2129)

(declare-fun lt!144045 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14709 (_ BitVec 32)) SeekEntryResult!2129)

(assert (=> b!291245 (= lt!144046 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144045 k!2524 (array!14710 (store (arr!6980 a!3312) i!1256 k!2524) (size!7332 a!3312)) mask!3809))))

(assert (=> b!291245 (= lt!144047 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144045 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291245 (= lt!144045 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!291246 () Bool)

(declare-fun res!152579 () Bool)

(assert (=> b!291246 (=> (not res!152579) (not e!184289))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!291246 (= res!152579 (validKeyInArray!0 k!2524))))

(declare-fun b!291247 () Bool)

(declare-fun res!152581 () Bool)

(assert (=> b!291247 (=> (not res!152581) (not e!184289))))

(declare-fun arrayContainsKey!0 (array!14709 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!291247 (= res!152581 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!291248 () Bool)

(assert (=> b!291248 (= e!184292 (not true))))

(assert (=> b!291248 (= (index!10688 lt!144047) i!1256)))

(assert (= (and start!28440 res!152584) b!291242))

(assert (= (and b!291242 res!152582) b!291246))

(assert (= (and b!291246 res!152579) b!291247))

(assert (= (and b!291247 res!152581) b!291244))

(assert (= (and b!291244 res!152580) b!291243))

(assert (= (and b!291243 res!152585) b!291245))

(assert (= (and b!291245 res!152586) b!291241))

(assert (= (and b!291241 res!152583) b!291248))

(declare-fun m!305193 () Bool)

(assert (=> b!291246 m!305193))

(declare-fun m!305195 () Bool)

(assert (=> b!291241 m!305195))

(declare-fun m!305197 () Bool)

(assert (=> b!291244 m!305197))

(declare-fun m!305199 () Bool)

(assert (=> b!291247 m!305199))

(declare-fun m!305201 () Bool)

(assert (=> start!28440 m!305201))

(declare-fun m!305203 () Bool)

(assert (=> start!28440 m!305203))

(declare-fun m!305205 () Bool)

(assert (=> b!291243 m!305205))

(declare-fun m!305207 () Bool)

(assert (=> b!291245 m!305207))

(declare-fun m!305209 () Bool)

(assert (=> b!291245 m!305209))

(declare-fun m!305211 () Bool)

(assert (=> b!291245 m!305211))

(declare-fun m!305213 () Bool)

(assert (=> b!291245 m!305213))

(push 1)

(assert (not b!291244))

(assert (not b!291247))

(assert (not start!28440))

(assert (not b!291245))

(assert (not b!291243))

(assert (not b!291246))

(check-sat)

(pop 1)

