; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48142 () Bool)

(assert start!48142)

(declare-fun b!530302 () Bool)

(declare-fun e!308986 () Bool)

(declare-fun e!308991 () Bool)

(assert (=> b!530302 (= e!308986 (not e!308991))))

(declare-fun res!326009 () Bool)

(assert (=> b!530302 (=> res!326009 e!308991)))

(declare-fun lt!244672 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4603 0))(
  ( (MissingZero!4603 (index!20636 (_ BitVec 32))) (Found!4603 (index!20637 (_ BitVec 32))) (Intermediate!4603 (undefined!5415 Bool) (index!20638 (_ BitVec 32)) (x!49601 (_ BitVec 32))) (Undefined!4603) (MissingVacant!4603 (index!20639 (_ BitVec 32))) )
))
(declare-fun lt!244667 () SeekEntryResult!4603)

(declare-datatypes ((array!33578 0))(
  ( (array!33579 (arr!16136 (Array (_ BitVec 32) (_ BitVec 64))) (size!16500 (_ BitVec 32))) )
))
(declare-fun lt!244671 () array!33578)

(declare-fun lt!244670 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33578 (_ BitVec 32)) SeekEntryResult!4603)

(assert (=> b!530302 (= res!326009 (= lt!244667 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244672 lt!244670 lt!244671 mask!3524)))))

(declare-fun lt!244673 () (_ BitVec 32))

(declare-fun a!3235 () array!33578)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!530302 (= lt!244667 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244673 (select (arr!16136 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!530302 (= lt!244672 (toIndex!0 lt!244670 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!530302 (= lt!244670 (select (store (arr!16136 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!530302 (= lt!244673 (toIndex!0 (select (arr!16136 a!3235) j!176) mask!3524))))

(assert (=> b!530302 (= lt!244671 (array!33579 (store (arr!16136 a!3235) i!1204 k!2280) (size!16500 a!3235)))))

(declare-fun e!308990 () Bool)

(assert (=> b!530302 e!308990))

(declare-fun res!326012 () Bool)

(assert (=> b!530302 (=> (not res!326012) (not e!308990))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33578 (_ BitVec 32)) Bool)

(assert (=> b!530302 (= res!326012 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16818 0))(
  ( (Unit!16819) )
))
(declare-fun lt!244674 () Unit!16818)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33578 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16818)

(assert (=> b!530302 (= lt!244674 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!530303 () Bool)

(declare-fun res!326015 () Bool)

(assert (=> b!530303 (=> (not res!326015) (not e!308986))))

(declare-datatypes ((List!10294 0))(
  ( (Nil!10291) (Cons!10290 (h!11230 (_ BitVec 64)) (t!16522 List!10294)) )
))
(declare-fun arrayNoDuplicates!0 (array!33578 (_ BitVec 32) List!10294) Bool)

(assert (=> b!530303 (= res!326015 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10291))))

(declare-fun b!530304 () Bool)

(declare-fun res!326008 () Bool)

(declare-fun e!308989 () Bool)

(assert (=> b!530304 (=> (not res!326008) (not e!308989))))

(declare-fun arrayContainsKey!0 (array!33578 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530304 (= res!326008 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!530305 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33578 (_ BitVec 32)) SeekEntryResult!4603)

(assert (=> b!530305 (= e!308990 (= (seekEntryOrOpen!0 (select (arr!16136 a!3235) j!176) a!3235 mask!3524) (Found!4603 j!176)))))

(declare-fun b!530306 () Bool)

(declare-fun res!326013 () Bool)

(assert (=> b!530306 (=> (not res!326013) (not e!308986))))

(assert (=> b!530306 (= res!326013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!530307 () Bool)

(declare-fun res!326016 () Bool)

(assert (=> b!530307 (=> (not res!326016) (not e!308989))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530307 (= res!326016 (validKeyInArray!0 (select (arr!16136 a!3235) j!176)))))

(declare-fun res!326011 () Bool)

(assert (=> start!48142 (=> (not res!326011) (not e!308989))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48142 (= res!326011 (validMask!0 mask!3524))))

(assert (=> start!48142 e!308989))

(assert (=> start!48142 true))

(declare-fun array_inv!11932 (array!33578) Bool)

(assert (=> start!48142 (array_inv!11932 a!3235)))

(declare-fun b!530308 () Bool)

(declare-fun e!308987 () Bool)

(assert (=> b!530308 (= e!308987 true)))

(declare-fun lt!244668 () SeekEntryResult!4603)

(assert (=> b!530308 (= lt!244668 (seekEntryOrOpen!0 lt!244670 lt!244671 mask!3524))))

(assert (=> b!530308 false))

(declare-fun b!530309 () Bool)

(declare-fun res!326010 () Bool)

(assert (=> b!530309 (=> (not res!326010) (not e!308989))))

(assert (=> b!530309 (= res!326010 (and (= (size!16500 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16500 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16500 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!530310 () Bool)

(assert (=> b!530310 (= e!308991 e!308987)))

(declare-fun res!326017 () Bool)

(assert (=> b!530310 (=> res!326017 e!308987)))

(declare-fun lt!244669 () Bool)

(assert (=> b!530310 (= res!326017 (or (and (not lt!244669) (undefined!5415 lt!244667)) (and (not lt!244669) (not (undefined!5415 lt!244667)))))))

(assert (=> b!530310 (= lt!244669 (not (is-Intermediate!4603 lt!244667)))))

(declare-fun b!530311 () Bool)

(assert (=> b!530311 (= e!308989 e!308986)))

(declare-fun res!326014 () Bool)

(assert (=> b!530311 (=> (not res!326014) (not e!308986))))

(declare-fun lt!244675 () SeekEntryResult!4603)

(assert (=> b!530311 (= res!326014 (or (= lt!244675 (MissingZero!4603 i!1204)) (= lt!244675 (MissingVacant!4603 i!1204))))))

(assert (=> b!530311 (= lt!244675 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!530312 () Bool)

(declare-fun res!326018 () Bool)

(assert (=> b!530312 (=> (not res!326018) (not e!308989))))

(assert (=> b!530312 (= res!326018 (validKeyInArray!0 k!2280))))

(assert (= (and start!48142 res!326011) b!530309))

(assert (= (and b!530309 res!326010) b!530307))

(assert (= (and b!530307 res!326016) b!530312))

(assert (= (and b!530312 res!326018) b!530304))

(assert (= (and b!530304 res!326008) b!530311))

(assert (= (and b!530311 res!326014) b!530306))

(assert (= (and b!530306 res!326013) b!530303))

(assert (= (and b!530303 res!326015) b!530302))

(assert (= (and b!530302 res!326012) b!530305))

(assert (= (and b!530302 (not res!326009)) b!530310))

(assert (= (and b!530310 (not res!326017)) b!530308))

(declare-fun m!510865 () Bool)

(assert (=> b!530306 m!510865))

(declare-fun m!510867 () Bool)

(assert (=> b!530311 m!510867))

(declare-fun m!510869 () Bool)

(assert (=> b!530308 m!510869))

(declare-fun m!510871 () Bool)

(assert (=> b!530305 m!510871))

(assert (=> b!530305 m!510871))

(declare-fun m!510873 () Bool)

(assert (=> b!530305 m!510873))

(declare-fun m!510875 () Bool)

(assert (=> b!530312 m!510875))

(declare-fun m!510877 () Bool)

(assert (=> b!530303 m!510877))

(declare-fun m!510879 () Bool)

(assert (=> b!530304 m!510879))

(declare-fun m!510881 () Bool)

(assert (=> start!48142 m!510881))

(declare-fun m!510883 () Bool)

(assert (=> start!48142 m!510883))

(assert (=> b!530307 m!510871))

(assert (=> b!530307 m!510871))

(declare-fun m!510885 () Bool)

(assert (=> b!530307 m!510885))

(declare-fun m!510887 () Bool)

(assert (=> b!530302 m!510887))

(declare-fun m!510889 () Bool)

(assert (=> b!530302 m!510889))

(declare-fun m!510891 () Bool)

(assert (=> b!530302 m!510891))

(assert (=> b!530302 m!510871))

(declare-fun m!510893 () Bool)

(assert (=> b!530302 m!510893))

(declare-fun m!510895 () Bool)

(assert (=> b!530302 m!510895))

(assert (=> b!530302 m!510871))

(declare-fun m!510897 () Bool)

(assert (=> b!530302 m!510897))

(declare-fun m!510899 () Bool)

(assert (=> b!530302 m!510899))

(assert (=> b!530302 m!510871))

(declare-fun m!510901 () Bool)

(assert (=> b!530302 m!510901))

(push 1)

