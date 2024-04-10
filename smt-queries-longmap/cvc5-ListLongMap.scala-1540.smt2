; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29170 () Bool)

(assert start!29170)

(declare-fun b!295990 () Bool)

(declare-fun res!155800 () Bool)

(declare-fun e!187080 () Bool)

(assert (=> b!295990 (=> (not res!155800) (not e!187080))))

(declare-datatypes ((array!14973 0))(
  ( (array!14974 (arr!7097 (Array (_ BitVec 32) (_ BitVec 64))) (size!7449 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14973)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14973 (_ BitVec 32)) Bool)

(assert (=> b!295990 (= res!155800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!295991 () Bool)

(declare-fun res!155801 () Bool)

(declare-fun e!187077 () Bool)

(assert (=> b!295991 (=> (not res!155801) (not e!187077))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14973 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295991 (= res!155801 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!295992 () Bool)

(declare-fun e!187079 () Bool)

(assert (=> b!295992 (= e!187079 (not true))))

(declare-datatypes ((SeekEntryResult!2246 0))(
  ( (MissingZero!2246 (index!11154 (_ BitVec 32))) (Found!2246 (index!11155 (_ BitVec 32))) (Intermediate!2246 (undefined!3058 Bool) (index!11156 (_ BitVec 32)) (x!29370 (_ BitVec 32))) (Undefined!2246) (MissingVacant!2246 (index!11157 (_ BitVec 32))) )
))
(declare-fun lt!146881 () SeekEntryResult!2246)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!295992 (and (= (select (arr!7097 a!3312) (index!11156 lt!146881)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11156 lt!146881) i!1256))))

(declare-fun b!295993 () Bool)

(declare-fun res!155798 () Bool)

(assert (=> b!295993 (=> (not res!155798) (not e!187077))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295993 (= res!155798 (validKeyInArray!0 k!2524))))

(declare-fun b!295994 () Bool)

(declare-fun e!187078 () Bool)

(assert (=> b!295994 (= e!187080 e!187078)))

(declare-fun res!155802 () Bool)

(assert (=> b!295994 (=> (not res!155802) (not e!187078))))

(declare-fun lt!146880 () Bool)

(assert (=> b!295994 (= res!155802 lt!146880)))

(declare-fun lt!146878 () SeekEntryResult!2246)

(declare-fun lt!146879 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14973 (_ BitVec 32)) SeekEntryResult!2246)

(assert (=> b!295994 (= lt!146878 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146879 k!2524 (array!14974 (store (arr!7097 a!3312) i!1256 k!2524) (size!7449 a!3312)) mask!3809))))

(assert (=> b!295994 (= lt!146881 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146879 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295994 (= lt!146879 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!295996 () Bool)

(declare-fun res!155804 () Bool)

(assert (=> b!295996 (=> (not res!155804) (not e!187077))))

(assert (=> b!295996 (= res!155804 (and (= (size!7449 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7449 a!3312))))))

(declare-fun b!295997 () Bool)

(assert (=> b!295997 (= e!187077 e!187080)))

(declare-fun res!155803 () Bool)

(assert (=> b!295997 (=> (not res!155803) (not e!187080))))

(declare-fun lt!146883 () SeekEntryResult!2246)

(assert (=> b!295997 (= res!155803 (or lt!146880 (= lt!146883 (MissingVacant!2246 i!1256))))))

(assert (=> b!295997 (= lt!146880 (= lt!146883 (MissingZero!2246 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14973 (_ BitVec 32)) SeekEntryResult!2246)

(assert (=> b!295997 (= lt!146883 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!295995 () Bool)

(assert (=> b!295995 (= e!187078 e!187079)))

(declare-fun res!155799 () Bool)

(assert (=> b!295995 (=> (not res!155799) (not e!187079))))

(declare-fun lt!146882 () Bool)

(assert (=> b!295995 (= res!155799 (and (or lt!146882 (not (undefined!3058 lt!146881))) (or lt!146882 (not (= (select (arr!7097 a!3312) (index!11156 lt!146881)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146882 (not (= (select (arr!7097 a!3312) (index!11156 lt!146881)) k!2524))) (not lt!146882)))))

(assert (=> b!295995 (= lt!146882 (not (is-Intermediate!2246 lt!146881)))))

(declare-fun res!155805 () Bool)

(assert (=> start!29170 (=> (not res!155805) (not e!187077))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29170 (= res!155805 (validMask!0 mask!3809))))

(assert (=> start!29170 e!187077))

(assert (=> start!29170 true))

(declare-fun array_inv!5060 (array!14973) Bool)

(assert (=> start!29170 (array_inv!5060 a!3312)))

(assert (= (and start!29170 res!155805) b!295996))

(assert (= (and b!295996 res!155804) b!295993))

(assert (= (and b!295993 res!155798) b!295991))

(assert (= (and b!295991 res!155801) b!295997))

(assert (= (and b!295997 res!155803) b!295990))

(assert (= (and b!295990 res!155800) b!295994))

(assert (= (and b!295994 res!155802) b!295995))

(assert (= (and b!295995 res!155799) b!295992))

(declare-fun m!309051 () Bool)

(assert (=> b!295997 m!309051))

(declare-fun m!309053 () Bool)

(assert (=> b!295992 m!309053))

(declare-fun m!309055 () Bool)

(assert (=> start!29170 m!309055))

(declare-fun m!309057 () Bool)

(assert (=> start!29170 m!309057))

(declare-fun m!309059 () Bool)

(assert (=> b!295991 m!309059))

(assert (=> b!295995 m!309053))

(declare-fun m!309061 () Bool)

(assert (=> b!295990 m!309061))

(declare-fun m!309063 () Bool)

(assert (=> b!295993 m!309063))

(declare-fun m!309065 () Bool)

(assert (=> b!295994 m!309065))

(declare-fun m!309067 () Bool)

(assert (=> b!295994 m!309067))

(declare-fun m!309069 () Bool)

(assert (=> b!295994 m!309069))

(declare-fun m!309071 () Bool)

(assert (=> b!295994 m!309071))

(push 1)

