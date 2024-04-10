; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117962 () Bool)

(assert start!117962)

(declare-fun b!1381857 () Bool)

(declare-fun e!783298 () Bool)

(assert (=> b!1381857 (= e!783298 false)))

(declare-fun lt!608304 () Bool)

(declare-datatypes ((array!94353 0))(
  ( (array!94354 (arr!45559 (Array (_ BitVec 32) (_ BitVec 64))) (size!46109 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94353)

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94353 (_ BitVec 32)) Bool)

(assert (=> b!1381857 (= lt!608304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1381855 () Bool)

(declare-fun res!923483 () Bool)

(assert (=> b!1381855 (=> (not res!923483) (not e!783298))))

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381855 (= res!923483 (validKeyInArray!0 (select (arr!45559 a!2971) i!1094)))))

(declare-fun b!1381854 () Bool)

(declare-fun res!923485 () Bool)

(assert (=> b!1381854 (=> (not res!923485) (not e!783298))))

(assert (=> b!1381854 (= res!923485 (and (= (size!46109 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46109 a!2971))))))

(declare-fun res!923484 () Bool)

(assert (=> start!117962 (=> (not res!923484) (not e!783298))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117962 (= res!923484 (validMask!0 mask!3034))))

(assert (=> start!117962 e!783298))

(assert (=> start!117962 true))

(declare-fun array_inv!34587 (array!94353) Bool)

(assert (=> start!117962 (array_inv!34587 a!2971)))

(declare-fun b!1381856 () Bool)

(declare-fun res!923482 () Bool)

(assert (=> b!1381856 (=> (not res!923482) (not e!783298))))

(declare-datatypes ((List!32093 0))(
  ( (Nil!32090) (Cons!32089 (h!33298 (_ BitVec 64)) (t!46787 List!32093)) )
))
(declare-fun arrayNoDuplicates!0 (array!94353 (_ BitVec 32) List!32093) Bool)

(assert (=> b!1381856 (= res!923482 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32090))))

(assert (= (and start!117962 res!923484) b!1381854))

(assert (= (and b!1381854 res!923485) b!1381855))

(assert (= (and b!1381855 res!923483) b!1381856))

(assert (= (and b!1381856 res!923482) b!1381857))

(declare-fun m!1267035 () Bool)

(assert (=> b!1381857 m!1267035))

(declare-fun m!1267037 () Bool)

(assert (=> b!1381855 m!1267037))

(assert (=> b!1381855 m!1267037))

(declare-fun m!1267039 () Bool)

(assert (=> b!1381855 m!1267039))

(declare-fun m!1267041 () Bool)

(assert (=> start!117962 m!1267041))

(declare-fun m!1267043 () Bool)

(assert (=> start!117962 m!1267043))

(declare-fun m!1267045 () Bool)

(assert (=> b!1381856 m!1267045))

(push 1)

(assert (not b!1381855))

(assert (not b!1381856))

(assert (not start!117962))

(assert (not b!1381857))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

