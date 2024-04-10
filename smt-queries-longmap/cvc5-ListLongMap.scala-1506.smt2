; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28566 () Bool)

(assert start!28566)

(declare-fun b!292033 () Bool)

(declare-fun res!153091 () Bool)

(declare-fun e!184778 () Bool)

(assert (=> b!292033 (=> (not res!153091) (not e!184778))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292033 (= res!153091 (validKeyInArray!0 k!2524))))

(declare-fun b!292034 () Bool)

(declare-fun e!184777 () Bool)

(declare-fun e!184779 () Bool)

(assert (=> b!292034 (= e!184777 e!184779)))

(declare-fun res!153093 () Bool)

(assert (=> b!292034 (=> (not res!153093) (not e!184779))))

(declare-datatypes ((SeekEntryResult!2144 0))(
  ( (MissingZero!2144 (index!10746 (_ BitVec 32))) (Found!2144 (index!10747 (_ BitVec 32))) (Intermediate!2144 (undefined!2956 Bool) (index!10748 (_ BitVec 32)) (x!28943 (_ BitVec 32))) (Undefined!2144) (MissingVacant!2144 (index!10749 (_ BitVec 32))) )
))
(declare-fun lt!144511 () SeekEntryResult!2144)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!144508 () Bool)

(assert (=> b!292034 (= res!153093 (and (not lt!144508) (= lt!144511 (MissingVacant!2144 i!1256))))))

(declare-fun lt!144506 () (_ BitVec 32))

(declare-datatypes ((array!14745 0))(
  ( (array!14746 (arr!6995 (Array (_ BitVec 32) (_ BitVec 64))) (size!7347 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14745)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun lt!144509 () SeekEntryResult!2144)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14745 (_ BitVec 32)) SeekEntryResult!2144)

(assert (=> b!292034 (= lt!144509 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144506 k!2524 (array!14746 (store (arr!6995 a!3312) i!1256 k!2524) (size!7347 a!3312)) mask!3809))))

(declare-fun lt!144510 () SeekEntryResult!2144)

(assert (=> b!292034 (= lt!144510 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144506 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292034 (= lt!144506 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!292035 () Bool)

(declare-fun res!153095 () Bool)

(assert (=> b!292035 (=> (not res!153095) (not e!184778))))

(assert (=> b!292035 (= res!153095 (and (= (size!7347 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7347 a!3312))))))

(declare-fun b!292036 () Bool)

(declare-fun e!184781 () Bool)

(assert (=> b!292036 (= e!184781 (not true))))

(assert (=> b!292036 (= (index!10748 lt!144510) i!1256)))

(declare-fun b!292037 () Bool)

(declare-fun res!153094 () Bool)

(assert (=> b!292037 (=> (not res!153094) (not e!184777))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14745 (_ BitVec 32)) Bool)

(assert (=> b!292037 (= res!153094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292038 () Bool)

(declare-fun res!153096 () Bool)

(assert (=> b!292038 (=> (not res!153096) (not e!184778))))

(declare-fun arrayContainsKey!0 (array!14745 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292038 (= res!153096 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292039 () Bool)

(assert (=> b!292039 (= e!184779 e!184781)))

(declare-fun res!153089 () Bool)

(assert (=> b!292039 (=> (not res!153089) (not e!184781))))

(declare-fun lt!144507 () Bool)

(assert (=> b!292039 (= res!153089 (and (or lt!144507 (not (undefined!2956 lt!144510))) (not lt!144507) (= (select (arr!6995 a!3312) (index!10748 lt!144510)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!292039 (= lt!144507 (not (is-Intermediate!2144 lt!144510)))))

(declare-fun res!153090 () Bool)

(assert (=> start!28566 (=> (not res!153090) (not e!184778))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28566 (= res!153090 (validMask!0 mask!3809))))

(assert (=> start!28566 e!184778))

(assert (=> start!28566 true))

(declare-fun array_inv!4958 (array!14745) Bool)

(assert (=> start!28566 (array_inv!4958 a!3312)))

(declare-fun b!292040 () Bool)

(assert (=> b!292040 (= e!184778 e!184777)))

(declare-fun res!153092 () Bool)

(assert (=> b!292040 (=> (not res!153092) (not e!184777))))

(assert (=> b!292040 (= res!153092 (or lt!144508 (= lt!144511 (MissingVacant!2144 i!1256))))))

(assert (=> b!292040 (= lt!144508 (= lt!144511 (MissingZero!2144 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14745 (_ BitVec 32)) SeekEntryResult!2144)

(assert (=> b!292040 (= lt!144511 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(assert (= (and start!28566 res!153090) b!292035))

(assert (= (and b!292035 res!153095) b!292033))

(assert (= (and b!292033 res!153091) b!292038))

(assert (= (and b!292038 res!153096) b!292040))

(assert (= (and b!292040 res!153092) b!292037))

(assert (= (and b!292037 res!153094) b!292034))

(assert (= (and b!292034 res!153093) b!292039))

(assert (= (and b!292039 res!153089) b!292036))

(declare-fun m!305763 () Bool)

(assert (=> b!292034 m!305763))

(declare-fun m!305765 () Bool)

(assert (=> b!292034 m!305765))

(declare-fun m!305767 () Bool)

(assert (=> b!292034 m!305767))

(declare-fun m!305769 () Bool)

(assert (=> b!292034 m!305769))

(declare-fun m!305771 () Bool)

(assert (=> b!292033 m!305771))

(declare-fun m!305773 () Bool)

(assert (=> b!292040 m!305773))

(declare-fun m!305775 () Bool)

(assert (=> start!28566 m!305775))

(declare-fun m!305777 () Bool)

(assert (=> start!28566 m!305777))

(declare-fun m!305779 () Bool)

(assert (=> b!292039 m!305779))

(declare-fun m!305781 () Bool)

(assert (=> b!292038 m!305781))

(declare-fun m!305783 () Bool)

(assert (=> b!292037 m!305783))

(push 1)

