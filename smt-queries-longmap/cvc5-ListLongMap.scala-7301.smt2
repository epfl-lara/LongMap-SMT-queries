; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93544 () Bool)

(assert start!93544)

(declare-fun b!1058959 () Bool)

(declare-fun lt!467071 () (_ BitVec 32))

(declare-datatypes ((array!66758 0))(
  ( (array!66759 (arr!32094 (Array (_ BitVec 32) (_ BitVec 64))) (size!32631 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66758)

(declare-fun lt!467074 () (_ BitVec 32))

(declare-fun e!602377 () Bool)

(assert (=> b!1058959 (= e!602377 (or (bvslt lt!467071 #b00000000000000000000000000000000) (bvsge lt!467074 (size!32631 a!3488)) (bvslt lt!467071 (size!32631 a!3488))))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66758 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058959 (arrayContainsKey!0 a!3488 k!2747 lt!467074)))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((Unit!34679 0))(
  ( (Unit!34680) )
))
(declare-fun lt!467073 () Unit!34679)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66758 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34679)

(assert (=> b!1058959 (= lt!467073 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!467074))))

(assert (=> b!1058959 (= lt!467074 (bvadd #b00000000000000000000000000000001 lt!467071))))

(declare-datatypes ((List!22376 0))(
  ( (Nil!22373) (Cons!22372 (h!23590 (_ BitVec 64)) (t!31675 List!22376)) )
))
(declare-fun arrayNoDuplicates!0 (array!66758 (_ BitVec 32) List!22376) Bool)

(assert (=> b!1058959 (arrayNoDuplicates!0 a!3488 lt!467071 Nil!22373)))

(declare-fun lt!467072 () Unit!34679)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66758 (_ BitVec 32) (_ BitVec 32)) Unit!34679)

(assert (=> b!1058959 (= lt!467072 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!467071))))

(declare-fun b!1058960 () Bool)

(declare-fun e!602379 () Bool)

(declare-fun e!602383 () Bool)

(assert (=> b!1058960 (= e!602379 e!602383)))

(declare-fun res!706812 () Bool)

(assert (=> b!1058960 (=> (not res!706812) (not e!602383))))

(declare-fun lt!467075 () array!66758)

(assert (=> b!1058960 (= res!706812 (arrayContainsKey!0 lt!467075 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1058960 (= lt!467075 (array!66759 (store (arr!32094 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32631 a!3488)))))

(declare-fun b!1058961 () Bool)

(declare-fun e!602381 () Bool)

(assert (=> b!1058961 (= e!602383 e!602381)))

(declare-fun res!706820 () Bool)

(assert (=> b!1058961 (=> (not res!706820) (not e!602381))))

(assert (=> b!1058961 (= res!706820 (not (= lt!467071 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66758 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058961 (= lt!467071 (arrayScanForKey!0 lt!467075 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1058962 () Bool)

(declare-fun res!706814 () Bool)

(assert (=> b!1058962 (=> (not res!706814) (not e!602379))))

(assert (=> b!1058962 (= res!706814 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22373))))

(declare-fun e!602380 () Bool)

(declare-fun b!1058963 () Bool)

(assert (=> b!1058963 (= e!602380 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun res!706819 () Bool)

(assert (=> start!93544 (=> (not res!706819) (not e!602379))))

(assert (=> start!93544 (= res!706819 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32631 a!3488)) (bvslt (size!32631 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93544 e!602379))

(assert (=> start!93544 true))

(declare-fun array_inv!24876 (array!66758) Bool)

(assert (=> start!93544 (array_inv!24876 a!3488)))

(declare-fun b!1058964 () Bool)

(declare-fun res!706818 () Bool)

(assert (=> b!1058964 (=> (not res!706818) (not e!602379))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1058964 (= res!706818 (validKeyInArray!0 k!2747))))

(declare-fun b!1058965 () Bool)

(declare-fun res!706817 () Bool)

(assert (=> b!1058965 (=> (not res!706817) (not e!602379))))

(assert (=> b!1058965 (= res!706817 (= (select (arr!32094 a!3488) i!1381) k!2747))))

(declare-fun b!1058966 () Bool)

(declare-fun e!602382 () Bool)

(assert (=> b!1058966 (= e!602382 e!602380)))

(declare-fun res!706813 () Bool)

(assert (=> b!1058966 (=> res!706813 e!602380)))

(assert (=> b!1058966 (= res!706813 (or (bvsgt lt!467071 i!1381) (bvsle i!1381 lt!467071)))))

(declare-fun b!1058967 () Bool)

(assert (=> b!1058967 (= e!602381 (not e!602377))))

(declare-fun res!706815 () Bool)

(assert (=> b!1058967 (=> res!706815 e!602377)))

(assert (=> b!1058967 (= res!706815 (or (bvsgt lt!467071 i!1381) (bvsle i!1381 lt!467071)))))

(assert (=> b!1058967 e!602382))

(declare-fun res!706816 () Bool)

(assert (=> b!1058967 (=> (not res!706816) (not e!602382))))

(assert (=> b!1058967 (= res!706816 (= (select (store (arr!32094 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!467071) k!2747))))

(assert (= (and start!93544 res!706819) b!1058962))

(assert (= (and b!1058962 res!706814) b!1058964))

(assert (= (and b!1058964 res!706818) b!1058965))

(assert (= (and b!1058965 res!706817) b!1058960))

(assert (= (and b!1058960 res!706812) b!1058961))

(assert (= (and b!1058961 res!706820) b!1058967))

(assert (= (and b!1058967 res!706816) b!1058966))

(assert (= (and b!1058966 (not res!706813)) b!1058963))

(assert (= (and b!1058967 (not res!706815)) b!1058959))

(declare-fun m!978999 () Bool)

(assert (=> b!1058965 m!978999))

(declare-fun m!979001 () Bool)

(assert (=> start!93544 m!979001))

(declare-fun m!979003 () Bool)

(assert (=> b!1058962 m!979003))

(declare-fun m!979005 () Bool)

(assert (=> b!1058964 m!979005))

(declare-fun m!979007 () Bool)

(assert (=> b!1058959 m!979007))

(declare-fun m!979009 () Bool)

(assert (=> b!1058959 m!979009))

(declare-fun m!979011 () Bool)

(assert (=> b!1058959 m!979011))

(declare-fun m!979013 () Bool)

(assert (=> b!1058959 m!979013))

(declare-fun m!979015 () Bool)

(assert (=> b!1058961 m!979015))

(declare-fun m!979017 () Bool)

(assert (=> b!1058960 m!979017))

(declare-fun m!979019 () Bool)

(assert (=> b!1058960 m!979019))

(declare-fun m!979021 () Bool)

(assert (=> b!1058963 m!979021))

(assert (=> b!1058967 m!979019))

(declare-fun m!979023 () Bool)

(assert (=> b!1058967 m!979023))

(push 1)

(assert (not start!93544))

(assert (not b!1058962))

(assert (not b!1058964))

(assert (not b!1058960))

(assert (not b!1058963))

(assert (not b!1058959))

(assert (not b!1058961))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

