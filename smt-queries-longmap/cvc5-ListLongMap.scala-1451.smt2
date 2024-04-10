; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27996 () Bool)

(assert start!27996)

(declare-fun b!287232 () Bool)

(declare-fun res!149122 () Bool)

(declare-fun e!181941 () Bool)

(assert (=> b!287232 (=> (not res!149122) (not e!181941))))

(declare-datatypes ((array!14400 0))(
  ( (array!14401 (arr!6830 (Array (_ BitVec 32) (_ BitVec 64))) (size!7182 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14400)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14400 (_ BitVec 32)) Bool)

(assert (=> b!287232 (= res!149122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!287233 () Bool)

(assert (=> b!287233 (= e!181941 false)))

(declare-datatypes ((SeekEntryResult!1979 0))(
  ( (MissingZero!1979 (index!10086 (_ BitVec 32))) (Found!1979 (index!10087 (_ BitVec 32))) (Intermediate!1979 (undefined!2791 Bool) (index!10088 (_ BitVec 32)) (x!28308 (_ BitVec 32))) (Undefined!1979) (MissingVacant!1979 (index!10089 (_ BitVec 32))) )
))
(declare-fun lt!141432 () SeekEntryResult!1979)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14400 (_ BitVec 32)) SeekEntryResult!1979)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287233 (= lt!141432 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun res!149119 () Bool)

(declare-fun e!181943 () Bool)

(assert (=> start!27996 (=> (not res!149119) (not e!181943))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27996 (= res!149119 (validMask!0 mask!3809))))

(assert (=> start!27996 e!181943))

(assert (=> start!27996 true))

(declare-fun array_inv!4793 (array!14400) Bool)

(assert (=> start!27996 (array_inv!4793 a!3312)))

(declare-fun b!287234 () Bool)

(assert (=> b!287234 (= e!181943 e!181941)))

(declare-fun res!149120 () Bool)

(assert (=> b!287234 (=> (not res!149120) (not e!181941))))

(declare-fun lt!141433 () SeekEntryResult!1979)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!287234 (= res!149120 (or (= lt!141433 (MissingZero!1979 i!1256)) (= lt!141433 (MissingVacant!1979 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14400 (_ BitVec 32)) SeekEntryResult!1979)

(assert (=> b!287234 (= lt!141433 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!287235 () Bool)

(declare-fun res!149124 () Bool)

(assert (=> b!287235 (=> (not res!149124) (not e!181943))))

(assert (=> b!287235 (= res!149124 (and (= (size!7182 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7182 a!3312))))))

(declare-fun b!287236 () Bool)

(declare-fun res!149123 () Bool)

(assert (=> b!287236 (=> (not res!149123) (not e!181943))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287236 (= res!149123 (validKeyInArray!0 k!2524))))

(declare-fun b!287237 () Bool)

(declare-fun res!149121 () Bool)

(assert (=> b!287237 (=> (not res!149121) (not e!181943))))

(declare-fun arrayContainsKey!0 (array!14400 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287237 (= res!149121 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!27996 res!149119) b!287235))

(assert (= (and b!287235 res!149124) b!287236))

(assert (= (and b!287236 res!149123) b!287237))

(assert (= (and b!287237 res!149121) b!287234))

(assert (= (and b!287234 res!149120) b!287232))

(assert (= (and b!287232 res!149122) b!287233))

(declare-fun m!301683 () Bool)

(assert (=> b!287237 m!301683))

(declare-fun m!301685 () Bool)

(assert (=> b!287233 m!301685))

(assert (=> b!287233 m!301685))

(declare-fun m!301687 () Bool)

(assert (=> b!287233 m!301687))

(declare-fun m!301689 () Bool)

(assert (=> b!287234 m!301689))

(declare-fun m!301691 () Bool)

(assert (=> b!287236 m!301691))

(declare-fun m!301693 () Bool)

(assert (=> b!287232 m!301693))

(declare-fun m!301695 () Bool)

(assert (=> start!27996 m!301695))

(declare-fun m!301697 () Bool)

(assert (=> start!27996 m!301697))

(push 1)

(assert (not b!287232))

(assert (not b!287234))

(assert (not b!287233))

(assert (not b!287237))

(assert (not b!287236))

(assert (not start!27996))

(check-sat)

(pop 1)

