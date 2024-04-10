; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28654 () Bool)

(assert start!28654)

(declare-fun b!292911 () Bool)

(declare-fun e!185261 () Bool)

(declare-fun e!185259 () Bool)

(assert (=> b!292911 (= e!185261 e!185259)))

(declare-fun res!153972 () Bool)

(assert (=> b!292911 (=> (not res!153972) (not e!185259))))

(declare-datatypes ((SeekEntryResult!2188 0))(
  ( (MissingZero!2188 (index!10922 (_ BitVec 32))) (Found!2188 (index!10923 (_ BitVec 32))) (Intermediate!2188 (undefined!3000 Bool) (index!10924 (_ BitVec 32)) (x!29099 (_ BitVec 32))) (Undefined!2188) (MissingVacant!2188 (index!10925 (_ BitVec 32))) )
))
(declare-fun lt!145159 () SeekEntryResult!2188)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!292911 (= res!153972 (or (= lt!145159 (MissingZero!2188 i!1256)) (= lt!145159 (MissingVacant!2188 i!1256))))))

(declare-datatypes ((array!14833 0))(
  ( (array!14834 (arr!7039 (Array (_ BitVec 32) (_ BitVec 64))) (size!7391 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14833)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14833 (_ BitVec 32)) SeekEntryResult!2188)

(assert (=> b!292911 (= lt!145159 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!292912 () Bool)

(declare-fun res!153968 () Bool)

(assert (=> b!292912 (=> (not res!153968) (not e!185259))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14833 (_ BitVec 32)) Bool)

(assert (=> b!292912 (= res!153968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!153969 () Bool)

(assert (=> start!28654 (=> (not res!153969) (not e!185261))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28654 (= res!153969 (validMask!0 mask!3809))))

(assert (=> start!28654 e!185261))

(assert (=> start!28654 true))

(declare-fun array_inv!5002 (array!14833) Bool)

(assert (=> start!28654 (array_inv!5002 a!3312)))

(declare-fun b!292913 () Bool)

(declare-fun res!153970 () Bool)

(assert (=> b!292913 (=> (not res!153970) (not e!185261))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292913 (= res!153970 (validKeyInArray!0 k!2524))))

(declare-fun b!292914 () Bool)

(declare-fun res!153971 () Bool)

(assert (=> b!292914 (=> (not res!153971) (not e!185261))))

(assert (=> b!292914 (= res!153971 (and (= (size!7391 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7391 a!3312))))))

(declare-fun b!292915 () Bool)

(declare-fun res!153967 () Bool)

(assert (=> b!292915 (=> (not res!153967) (not e!185261))))

(declare-fun arrayContainsKey!0 (array!14833 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292915 (= res!153967 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292916 () Bool)

(assert (=> b!292916 (= e!185259 false)))

(declare-fun lt!145157 () SeekEntryResult!2188)

(declare-fun lt!145158 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14833 (_ BitVec 32)) SeekEntryResult!2188)

(assert (=> b!292916 (= lt!145157 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145158 k!2524 (array!14834 (store (arr!7039 a!3312) i!1256 k!2524) (size!7391 a!3312)) mask!3809))))

(declare-fun lt!145156 () SeekEntryResult!2188)

(assert (=> b!292916 (= lt!145156 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145158 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292916 (= lt!145158 (toIndex!0 k!2524 mask!3809))))

(assert (= (and start!28654 res!153969) b!292914))

(assert (= (and b!292914 res!153971) b!292913))

(assert (= (and b!292913 res!153970) b!292915))

(assert (= (and b!292915 res!153967) b!292911))

(assert (= (and b!292911 res!153972) b!292912))

(assert (= (and b!292912 res!153968) b!292916))

(declare-fun m!306697 () Bool)

(assert (=> b!292913 m!306697))

(declare-fun m!306699 () Bool)

(assert (=> b!292911 m!306699))

(declare-fun m!306701 () Bool)

(assert (=> b!292912 m!306701))

(declare-fun m!306703 () Bool)

(assert (=> b!292915 m!306703))

(declare-fun m!306705 () Bool)

(assert (=> start!28654 m!306705))

(declare-fun m!306707 () Bool)

(assert (=> start!28654 m!306707))

(declare-fun m!306709 () Bool)

(assert (=> b!292916 m!306709))

(declare-fun m!306711 () Bool)

(assert (=> b!292916 m!306711))

(declare-fun m!306713 () Bool)

(assert (=> b!292916 m!306713))

(declare-fun m!306715 () Bool)

(assert (=> b!292916 m!306715))

(push 1)

(assert (not b!292913))

(assert (not b!292916))

(assert (not start!28654))

(assert (not b!292912))

(assert (not b!292915))

(assert (not b!292911))

(check-sat)

(pop 1)

