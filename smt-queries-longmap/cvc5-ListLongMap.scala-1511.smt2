; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28596 () Bool)

(assert start!28596)

(declare-fun b!292389 () Bool)

(declare-fun res!153450 () Bool)

(declare-fun e!184999 () Bool)

(assert (=> b!292389 (=> (not res!153450) (not e!184999))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14775 0))(
  ( (array!14776 (arr!7010 (Array (_ BitVec 32) (_ BitVec 64))) (size!7362 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14775)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!292389 (= res!153450 (and (= (size!7362 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7362 a!3312))))))

(declare-fun b!292391 () Bool)

(declare-fun e!184998 () Bool)

(assert (=> b!292391 (= e!184999 e!184998)))

(declare-fun res!153449 () Bool)

(assert (=> b!292391 (=> (not res!153449) (not e!184998))))

(declare-datatypes ((SeekEntryResult!2159 0))(
  ( (MissingZero!2159 (index!10806 (_ BitVec 32))) (Found!2159 (index!10807 (_ BitVec 32))) (Intermediate!2159 (undefined!2971 Bool) (index!10808 (_ BitVec 32)) (x!28998 (_ BitVec 32))) (Undefined!2159) (MissingVacant!2159 (index!10809 (_ BitVec 32))) )
))
(declare-fun lt!144810 () SeekEntryResult!2159)

(assert (=> b!292391 (= res!153449 (or (= lt!144810 (MissingZero!2159 i!1256)) (= lt!144810 (MissingVacant!2159 i!1256))))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14775 (_ BitVec 32)) SeekEntryResult!2159)

(assert (=> b!292391 (= lt!144810 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!292392 () Bool)

(declare-fun res!153447 () Bool)

(assert (=> b!292392 (=> (not res!153447) (not e!184999))))

(declare-fun arrayContainsKey!0 (array!14775 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292392 (= res!153447 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292393 () Bool)

(declare-fun res!153448 () Bool)

(assert (=> b!292393 (=> (not res!153448) (not e!184998))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14775 (_ BitVec 32)) Bool)

(assert (=> b!292393 (= res!153448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292394 () Bool)

(declare-fun res!153445 () Bool)

(assert (=> b!292394 (=> (not res!153445) (not e!184999))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292394 (= res!153445 (validKeyInArray!0 k!2524))))

(declare-fun b!292390 () Bool)

(assert (=> b!292390 (= e!184998 false)))

(declare-fun lt!144809 () (_ BitVec 32))

(declare-fun lt!144808 () SeekEntryResult!2159)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14775 (_ BitVec 32)) SeekEntryResult!2159)

(assert (=> b!292390 (= lt!144808 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144809 k!2524 (array!14776 (store (arr!7010 a!3312) i!1256 k!2524) (size!7362 a!3312)) mask!3809))))

(declare-fun lt!144811 () SeekEntryResult!2159)

(assert (=> b!292390 (= lt!144811 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144809 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292390 (= lt!144809 (toIndex!0 k!2524 mask!3809))))

(declare-fun res!153446 () Bool)

(assert (=> start!28596 (=> (not res!153446) (not e!184999))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28596 (= res!153446 (validMask!0 mask!3809))))

(assert (=> start!28596 e!184999))

(assert (=> start!28596 true))

(declare-fun array_inv!4973 (array!14775) Bool)

(assert (=> start!28596 (array_inv!4973 a!3312)))

(assert (= (and start!28596 res!153446) b!292389))

(assert (= (and b!292389 res!153450) b!292394))

(assert (= (and b!292394 res!153445) b!292392))

(assert (= (and b!292392 res!153447) b!292391))

(assert (= (and b!292391 res!153449) b!292393))

(assert (= (and b!292393 res!153448) b!292390))

(declare-fun m!306117 () Bool)

(assert (=> b!292394 m!306117))

(declare-fun m!306119 () Bool)

(assert (=> b!292393 m!306119))

(declare-fun m!306121 () Bool)

(assert (=> start!28596 m!306121))

(declare-fun m!306123 () Bool)

(assert (=> start!28596 m!306123))

(declare-fun m!306125 () Bool)

(assert (=> b!292392 m!306125))

(declare-fun m!306127 () Bool)

(assert (=> b!292390 m!306127))

(declare-fun m!306129 () Bool)

(assert (=> b!292390 m!306129))

(declare-fun m!306131 () Bool)

(assert (=> b!292390 m!306131))

(declare-fun m!306133 () Bool)

(assert (=> b!292390 m!306133))

(declare-fun m!306135 () Bool)

(assert (=> b!292391 m!306135))

(push 1)

