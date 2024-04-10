; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28186 () Bool)

(assert start!28186)

(declare-fun b!288589 () Bool)

(declare-fun e!182723 () Bool)

(declare-fun e!182720 () Bool)

(assert (=> b!288589 (= e!182723 e!182720)))

(declare-fun res!150215 () Bool)

(assert (=> b!288589 (=> (not res!150215) (not e!182720))))

(declare-datatypes ((SeekEntryResult!2026 0))(
  ( (MissingZero!2026 (index!10274 (_ BitVec 32))) (Found!2026 (index!10275 (_ BitVec 32))) (Intermediate!2026 (undefined!2838 Bool) (index!10276 (_ BitVec 32)) (x!28487 (_ BitVec 32))) (Undefined!2026) (MissingVacant!2026 (index!10277 (_ BitVec 32))) )
))
(declare-fun lt!142197 () SeekEntryResult!2026)

(declare-fun lt!142194 () Bool)

(declare-datatypes ((array!14500 0))(
  ( (array!14501 (arr!6877 (Array (_ BitVec 32) (_ BitVec 64))) (size!7229 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14500)

(declare-fun k!2524 () (_ BitVec 64))

(assert (=> b!288589 (= res!150215 (and (or lt!142194 (not (undefined!2838 lt!142197))) (or lt!142194 (not (= (select (arr!6877 a!3312) (index!10276 lt!142197)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142194 (not (= (select (arr!6877 a!3312) (index!10276 lt!142197)) k!2524))) (not lt!142194)))))

(assert (=> b!288589 (= lt!142194 (not (is-Intermediate!2026 lt!142197)))))

(declare-fun b!288590 () Bool)

(declare-fun e!182719 () Bool)

(assert (=> b!288590 (= e!182719 e!182723)))

(declare-fun res!150214 () Bool)

(assert (=> b!288590 (=> (not res!150214) (not e!182723))))

(declare-fun lt!142196 () Bool)

(assert (=> b!288590 (= res!150214 lt!142196)))

(declare-fun lt!142193 () SeekEntryResult!2026)

(declare-fun lt!142198 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14500 (_ BitVec 32)) SeekEntryResult!2026)

(assert (=> b!288590 (= lt!142193 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142198 k!2524 (array!14501 (store (arr!6877 a!3312) i!1256 k!2524) (size!7229 a!3312)) mask!3809))))

(assert (=> b!288590 (= lt!142197 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142198 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288590 (= lt!142198 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!288592 () Bool)

(declare-fun res!150218 () Bool)

(declare-fun e!182721 () Bool)

(assert (=> b!288592 (=> (not res!150218) (not e!182721))))

(assert (=> b!288592 (= res!150218 (and (= (size!7229 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7229 a!3312))))))

(declare-fun b!288593 () Bool)

(assert (=> b!288593 (= e!182720 (not true))))

(assert (=> b!288593 (and (= (select (arr!6877 a!3312) (index!10276 lt!142197)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10276 lt!142197) i!1256))))

(declare-fun b!288594 () Bool)

(declare-fun res!150212 () Bool)

(assert (=> b!288594 (=> (not res!150212) (not e!182721))))

(declare-fun arrayContainsKey!0 (array!14500 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288594 (= res!150212 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288591 () Bool)

(declare-fun res!150216 () Bool)

(assert (=> b!288591 (=> (not res!150216) (not e!182719))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14500 (_ BitVec 32)) Bool)

(assert (=> b!288591 (= res!150216 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!150217 () Bool)

(assert (=> start!28186 (=> (not res!150217) (not e!182721))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28186 (= res!150217 (validMask!0 mask!3809))))

(assert (=> start!28186 e!182721))

(assert (=> start!28186 true))

(declare-fun array_inv!4840 (array!14500) Bool)

(assert (=> start!28186 (array_inv!4840 a!3312)))

(declare-fun b!288595 () Bool)

(assert (=> b!288595 (= e!182721 e!182719)))

(declare-fun res!150219 () Bool)

(assert (=> b!288595 (=> (not res!150219) (not e!182719))))

(declare-fun lt!142195 () SeekEntryResult!2026)

(assert (=> b!288595 (= res!150219 (or lt!142196 (= lt!142195 (MissingVacant!2026 i!1256))))))

(assert (=> b!288595 (= lt!142196 (= lt!142195 (MissingZero!2026 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14500 (_ BitVec 32)) SeekEntryResult!2026)

(assert (=> b!288595 (= lt!142195 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!288596 () Bool)

(declare-fun res!150213 () Bool)

(assert (=> b!288596 (=> (not res!150213) (not e!182721))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288596 (= res!150213 (validKeyInArray!0 k!2524))))

(assert (= (and start!28186 res!150217) b!288592))

(assert (= (and b!288592 res!150218) b!288596))

(assert (= (and b!288596 res!150213) b!288594))

(assert (= (and b!288594 res!150212) b!288595))

(assert (= (and b!288595 res!150219) b!288591))

(assert (= (and b!288591 res!150216) b!288590))

(assert (= (and b!288590 res!150214) b!288589))

(assert (= (and b!288589 res!150215) b!288593))

(declare-fun m!302807 () Bool)

(assert (=> start!28186 m!302807))

(declare-fun m!302809 () Bool)

(assert (=> start!28186 m!302809))

(declare-fun m!302811 () Bool)

(assert (=> b!288594 m!302811))

(declare-fun m!302813 () Bool)

(assert (=> b!288596 m!302813))

(declare-fun m!302815 () Bool)

(assert (=> b!288593 m!302815))

(assert (=> b!288589 m!302815))

(declare-fun m!302817 () Bool)

(assert (=> b!288595 m!302817))

(declare-fun m!302819 () Bool)

(assert (=> b!288590 m!302819))

(declare-fun m!302821 () Bool)

(assert (=> b!288590 m!302821))

(declare-fun m!302823 () Bool)

(assert (=> b!288590 m!302823))

(declare-fun m!302825 () Bool)

(assert (=> b!288590 m!302825))

(declare-fun m!302827 () Bool)

(assert (=> b!288591 m!302827))

(push 1)

