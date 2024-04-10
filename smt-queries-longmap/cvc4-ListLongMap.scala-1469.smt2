; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28204 () Bool)

(assert start!28204)

(declare-fun b!288805 () Bool)

(declare-fun e!182855 () Bool)

(declare-fun e!182856 () Bool)

(assert (=> b!288805 (= e!182855 e!182856)))

(declare-fun res!150432 () Bool)

(assert (=> b!288805 (=> (not res!150432) (not e!182856))))

(declare-fun lt!142355 () Bool)

(assert (=> b!288805 (= res!150432 lt!142355)))

(declare-fun lt!142357 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2035 0))(
  ( (MissingZero!2035 (index!10310 (_ BitVec 32))) (Found!2035 (index!10311 (_ BitVec 32))) (Intermediate!2035 (undefined!2847 Bool) (index!10312 (_ BitVec 32)) (x!28520 (_ BitVec 32))) (Undefined!2035) (MissingVacant!2035 (index!10313 (_ BitVec 32))) )
))
(declare-fun lt!142356 () SeekEntryResult!2035)

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14518 0))(
  ( (array!14519 (arr!6886 (Array (_ BitVec 32) (_ BitVec 64))) (size!7238 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14518)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14518 (_ BitVec 32)) SeekEntryResult!2035)

(assert (=> b!288805 (= lt!142356 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142357 k!2524 (array!14519 (store (arr!6886 a!3312) i!1256 k!2524) (size!7238 a!3312)) mask!3809))))

(declare-fun lt!142358 () SeekEntryResult!2035)

(assert (=> b!288805 (= lt!142358 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142357 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288805 (= lt!142357 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!288806 () Bool)

(declare-fun res!150431 () Bool)

(declare-fun e!182858 () Bool)

(assert (=> b!288806 (=> (not res!150431) (not e!182858))))

(declare-fun arrayContainsKey!0 (array!14518 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288806 (= res!150431 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288807 () Bool)

(declare-fun e!182857 () Bool)

(assert (=> b!288807 (= e!182857 (not true))))

(assert (=> b!288807 (and (= (select (arr!6886 a!3312) (index!10312 lt!142358)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10312 lt!142358) i!1256))))

(declare-fun b!288808 () Bool)

(assert (=> b!288808 (= e!182858 e!182855)))

(declare-fun res!150429 () Bool)

(assert (=> b!288808 (=> (not res!150429) (not e!182855))))

(declare-fun lt!142359 () SeekEntryResult!2035)

(assert (=> b!288808 (= res!150429 (or lt!142355 (= lt!142359 (MissingVacant!2035 i!1256))))))

(assert (=> b!288808 (= lt!142355 (= lt!142359 (MissingZero!2035 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14518 (_ BitVec 32)) SeekEntryResult!2035)

(assert (=> b!288808 (= lt!142359 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!288809 () Bool)

(assert (=> b!288809 (= e!182856 e!182857)))

(declare-fun res!150433 () Bool)

(assert (=> b!288809 (=> (not res!150433) (not e!182857))))

(declare-fun lt!142360 () Bool)

(assert (=> b!288809 (= res!150433 (and (or lt!142360 (not (undefined!2847 lt!142358))) (or lt!142360 (not (= (select (arr!6886 a!3312) (index!10312 lt!142358)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142360 (not (= (select (arr!6886 a!3312) (index!10312 lt!142358)) k!2524))) (not lt!142360)))))

(assert (=> b!288809 (= lt!142360 (not (is-Intermediate!2035 lt!142358)))))

(declare-fun b!288811 () Bool)

(declare-fun res!150428 () Bool)

(assert (=> b!288811 (=> (not res!150428) (not e!182858))))

(assert (=> b!288811 (= res!150428 (and (= (size!7238 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7238 a!3312))))))

(declare-fun b!288812 () Bool)

(declare-fun res!150435 () Bool)

(assert (=> b!288812 (=> (not res!150435) (not e!182858))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288812 (= res!150435 (validKeyInArray!0 k!2524))))

(declare-fun b!288810 () Bool)

(declare-fun res!150434 () Bool)

(assert (=> b!288810 (=> (not res!150434) (not e!182855))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14518 (_ BitVec 32)) Bool)

(assert (=> b!288810 (= res!150434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!150430 () Bool)

(assert (=> start!28204 (=> (not res!150430) (not e!182858))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28204 (= res!150430 (validMask!0 mask!3809))))

(assert (=> start!28204 e!182858))

(assert (=> start!28204 true))

(declare-fun array_inv!4849 (array!14518) Bool)

(assert (=> start!28204 (array_inv!4849 a!3312)))

(assert (= (and start!28204 res!150430) b!288811))

(assert (= (and b!288811 res!150428) b!288812))

(assert (= (and b!288812 res!150435) b!288806))

(assert (= (and b!288806 res!150431) b!288808))

(assert (= (and b!288808 res!150429) b!288810))

(assert (= (and b!288810 res!150434) b!288805))

(assert (= (and b!288805 res!150432) b!288809))

(assert (= (and b!288809 res!150433) b!288807))

(declare-fun m!303005 () Bool)

(assert (=> start!28204 m!303005))

(declare-fun m!303007 () Bool)

(assert (=> start!28204 m!303007))

(declare-fun m!303009 () Bool)

(assert (=> b!288805 m!303009))

(declare-fun m!303011 () Bool)

(assert (=> b!288805 m!303011))

(declare-fun m!303013 () Bool)

(assert (=> b!288805 m!303013))

(declare-fun m!303015 () Bool)

(assert (=> b!288805 m!303015))

(declare-fun m!303017 () Bool)

(assert (=> b!288810 m!303017))

(declare-fun m!303019 () Bool)

(assert (=> b!288808 m!303019))

(declare-fun m!303021 () Bool)

(assert (=> b!288812 m!303021))

(declare-fun m!303023 () Bool)

(assert (=> b!288806 m!303023))

(declare-fun m!303025 () Bool)

(assert (=> b!288807 m!303025))

(assert (=> b!288809 m!303025))

(push 1)

