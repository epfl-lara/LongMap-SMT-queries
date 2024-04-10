; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27940 () Bool)

(assert start!27940)

(declare-fun b!286971 () Bool)

(declare-fun e!181789 () Bool)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!286971 (= e!181789 (bvslt mask!3809 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!1975 0))(
  ( (MissingZero!1975 (index!10070 (_ BitVec 32))) (Found!1975 (index!10071 (_ BitVec 32))) (Intermediate!1975 (undefined!2787 Bool) (index!10072 (_ BitVec 32)) (x!28282 (_ BitVec 32))) (Undefined!1975) (MissingVacant!1975 (index!10073 (_ BitVec 32))) )
))
(declare-fun lt!141319 () SeekEntryResult!1975)

(declare-datatypes ((array!14389 0))(
  ( (array!14390 (arr!6826 (Array (_ BitVec 32) (_ BitVec 64))) (size!7178 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14389)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14389 (_ BitVec 32)) SeekEntryResult!1975)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!286971 (= lt!141319 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!286972 () Bool)

(declare-fun res!148983 () Bool)

(assert (=> b!286972 (=> (not res!148983) (not e!181789))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14389 (_ BitVec 32)) Bool)

(assert (=> b!286972 (= res!148983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!286973 () Bool)

(declare-fun res!148982 () Bool)

(declare-fun e!181788 () Bool)

(assert (=> b!286973 (=> (not res!148982) (not e!181788))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286973 (= res!148982 (validKeyInArray!0 k!2524))))

(declare-fun b!286974 () Bool)

(declare-fun res!148985 () Bool)

(assert (=> b!286974 (=> (not res!148985) (not e!181788))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286974 (= res!148985 (and (= (size!7178 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7178 a!3312))))))

(declare-fun b!286975 () Bool)

(assert (=> b!286975 (= e!181788 e!181789)))

(declare-fun res!148981 () Bool)

(assert (=> b!286975 (=> (not res!148981) (not e!181789))))

(declare-fun lt!141318 () SeekEntryResult!1975)

(assert (=> b!286975 (= res!148981 (or (= lt!141318 (MissingZero!1975 i!1256)) (= lt!141318 (MissingVacant!1975 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14389 (_ BitVec 32)) SeekEntryResult!1975)

(assert (=> b!286975 (= lt!141318 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!286976 () Bool)

(declare-fun res!148984 () Bool)

(assert (=> b!286976 (=> (not res!148984) (not e!181788))))

(declare-fun arrayContainsKey!0 (array!14389 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286976 (= res!148984 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!148986 () Bool)

(assert (=> start!27940 (=> (not res!148986) (not e!181788))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27940 (= res!148986 (validMask!0 mask!3809))))

(assert (=> start!27940 e!181788))

(assert (=> start!27940 true))

(declare-fun array_inv!4789 (array!14389) Bool)

(assert (=> start!27940 (array_inv!4789 a!3312)))

(assert (= (and start!27940 res!148986) b!286974))

(assert (= (and b!286974 res!148985) b!286973))

(assert (= (and b!286973 res!148982) b!286976))

(assert (= (and b!286976 res!148984) b!286975))

(assert (= (and b!286975 res!148981) b!286972))

(assert (= (and b!286972 res!148983) b!286971))

(declare-fun m!301523 () Bool)

(assert (=> b!286973 m!301523))

(declare-fun m!301525 () Bool)

(assert (=> b!286975 m!301525))

(declare-fun m!301527 () Bool)

(assert (=> start!27940 m!301527))

(declare-fun m!301529 () Bool)

(assert (=> start!27940 m!301529))

(declare-fun m!301531 () Bool)

(assert (=> b!286971 m!301531))

(assert (=> b!286971 m!301531))

(declare-fun m!301533 () Bool)

(assert (=> b!286971 m!301533))

(declare-fun m!301535 () Bool)

(assert (=> b!286972 m!301535))

(declare-fun m!301537 () Bool)

(assert (=> b!286976 m!301537))

(push 1)

(assert (not b!286975))

(assert (not start!27940))

(assert (not b!286972))

(assert (not b!286976))

(assert (not b!286971))

(assert (not b!286973))

(check-sat)

(pop 1)

