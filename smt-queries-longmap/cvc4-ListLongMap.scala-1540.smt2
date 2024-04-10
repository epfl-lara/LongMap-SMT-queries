; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29174 () Bool)

(assert start!29174)

(declare-fun res!155846 () Bool)

(declare-fun e!187111 () Bool)

(assert (=> start!29174 (=> (not res!155846) (not e!187111))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29174 (= res!155846 (validMask!0 mask!3809))))

(assert (=> start!29174 e!187111))

(assert (=> start!29174 true))

(declare-datatypes ((array!14977 0))(
  ( (array!14978 (arr!7099 (Array (_ BitVec 32) (_ BitVec 64))) (size!7451 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14977)

(declare-fun array_inv!5062 (array!14977) Bool)

(assert (=> start!29174 (array_inv!5062 a!3312)))

(declare-fun b!296038 () Bool)

(declare-fun res!155852 () Bool)

(assert (=> b!296038 (=> (not res!155852) (not e!187111))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!296038 (= res!155852 (and (= (size!7451 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7451 a!3312))))))

(declare-fun b!296039 () Bool)

(declare-fun e!187107 () Bool)

(assert (=> b!296039 (= e!187111 e!187107)))

(declare-fun res!155850 () Bool)

(assert (=> b!296039 (=> (not res!155850) (not e!187107))))

(declare-datatypes ((SeekEntryResult!2248 0))(
  ( (MissingZero!2248 (index!11162 (_ BitVec 32))) (Found!2248 (index!11163 (_ BitVec 32))) (Intermediate!2248 (undefined!3060 Bool) (index!11164 (_ BitVec 32)) (x!29372 (_ BitVec 32))) (Undefined!2248) (MissingVacant!2248 (index!11165 (_ BitVec 32))) )
))
(declare-fun lt!146916 () SeekEntryResult!2248)

(declare-fun lt!146919 () Bool)

(assert (=> b!296039 (= res!155850 (or lt!146919 (= lt!146916 (MissingVacant!2248 i!1256))))))

(assert (=> b!296039 (= lt!146919 (= lt!146916 (MissingZero!2248 i!1256)))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14977 (_ BitVec 32)) SeekEntryResult!2248)

(assert (=> b!296039 (= lt!146916 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!296040 () Bool)

(declare-fun res!155853 () Bool)

(assert (=> b!296040 (=> (not res!155853) (not e!187111))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!296040 (= res!155853 (validKeyInArray!0 k!2524))))

(declare-fun b!296041 () Bool)

(declare-fun e!187109 () Bool)

(assert (=> b!296041 (= e!187109 (not true))))

(declare-fun lt!146915 () SeekEntryResult!2248)

(assert (=> b!296041 (and (= (select (arr!7099 a!3312) (index!11164 lt!146915)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11164 lt!146915) i!1256))))

(declare-fun b!296042 () Bool)

(declare-fun res!155848 () Bool)

(assert (=> b!296042 (=> (not res!155848) (not e!187107))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14977 (_ BitVec 32)) Bool)

(assert (=> b!296042 (= res!155848 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!296043 () Bool)

(declare-fun e!187108 () Bool)

(assert (=> b!296043 (= e!187108 e!187109)))

(declare-fun res!155851 () Bool)

(assert (=> b!296043 (=> (not res!155851) (not e!187109))))

(declare-fun lt!146917 () Bool)

(assert (=> b!296043 (= res!155851 (and (or lt!146917 (not (undefined!3060 lt!146915))) (or lt!146917 (not (= (select (arr!7099 a!3312) (index!11164 lt!146915)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146917 (not (= (select (arr!7099 a!3312) (index!11164 lt!146915)) k!2524))) (not lt!146917)))))

(assert (=> b!296043 (= lt!146917 (not (is-Intermediate!2248 lt!146915)))))

(declare-fun b!296044 () Bool)

(assert (=> b!296044 (= e!187107 e!187108)))

(declare-fun res!155847 () Bool)

(assert (=> b!296044 (=> (not res!155847) (not e!187108))))

(assert (=> b!296044 (= res!155847 lt!146919)))

(declare-fun lt!146918 () SeekEntryResult!2248)

(declare-fun lt!146914 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14977 (_ BitVec 32)) SeekEntryResult!2248)

(assert (=> b!296044 (= lt!146918 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146914 k!2524 (array!14978 (store (arr!7099 a!3312) i!1256 k!2524) (size!7451 a!3312)) mask!3809))))

(assert (=> b!296044 (= lt!146915 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146914 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296044 (= lt!146914 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!296045 () Bool)

(declare-fun res!155849 () Bool)

(assert (=> b!296045 (=> (not res!155849) (not e!187111))))

(declare-fun arrayContainsKey!0 (array!14977 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!296045 (= res!155849 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!29174 res!155846) b!296038))

(assert (= (and b!296038 res!155852) b!296040))

(assert (= (and b!296040 res!155853) b!296045))

(assert (= (and b!296045 res!155849) b!296039))

(assert (= (and b!296039 res!155850) b!296042))

(assert (= (and b!296042 res!155848) b!296044))

(assert (= (and b!296044 res!155847) b!296043))

(assert (= (and b!296043 res!155851) b!296041))

(declare-fun m!309095 () Bool)

(assert (=> b!296045 m!309095))

(declare-fun m!309097 () Bool)

(assert (=> b!296042 m!309097))

(declare-fun m!309099 () Bool)

(assert (=> b!296043 m!309099))

(declare-fun m!309101 () Bool)

(assert (=> b!296040 m!309101))

(declare-fun m!309103 () Bool)

(assert (=> b!296039 m!309103))

(assert (=> b!296041 m!309099))

(declare-fun m!309105 () Bool)

(assert (=> start!29174 m!309105))

(declare-fun m!309107 () Bool)

(assert (=> start!29174 m!309107))

(declare-fun m!309109 () Bool)

(assert (=> b!296044 m!309109))

(declare-fun m!309111 () Bool)

(assert (=> b!296044 m!309111))

(declare-fun m!309113 () Bool)

(assert (=> b!296044 m!309113))

(declare-fun m!309115 () Bool)

(assert (=> b!296044 m!309115))

(push 1)

