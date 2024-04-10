; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119088 () Bool)

(assert start!119088)

(declare-fun b!1389397 () Bool)

(declare-fun res!929558 () Bool)

(declare-fun e!787027 () Bool)

(assert (=> b!1389397 (=> (not res!929558) (not e!787027))))

(declare-datatypes ((array!95025 0))(
  ( (array!95026 (arr!45878 (Array (_ BitVec 32) (_ BitVec 64))) (size!46428 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95025)

(declare-datatypes ((List!32397 0))(
  ( (Nil!32394) (Cons!32393 (h!33611 (_ BitVec 64)) (t!47091 List!32397)) )
))
(declare-fun arrayNoDuplicates!0 (array!95025 (_ BitVec 32) List!32397) Bool)

(assert (=> b!1389397 (= res!929558 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32394))))

(declare-fun b!1389398 () Bool)

(declare-fun res!929560 () Bool)

(assert (=> b!1389398 (=> (not res!929560) (not e!787027))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389398 (= res!929560 (validKeyInArray!0 (select (arr!45878 a!2901) j!112)))))

(declare-fun b!1389399 () Bool)

(declare-fun res!929561 () Bool)

(assert (=> b!1389399 (=> (not res!929561) (not e!787027))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1389399 (= res!929561 (validKeyInArray!0 (select (arr!45878 a!2901) i!1037)))))

(declare-fun b!1389400 () Bool)

(assert (=> b!1389400 (= e!787027 false)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!610560 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389400 (= lt!610560 (toIndex!0 (select (arr!45878 a!2901) j!112) mask!2840))))

(declare-fun res!929562 () Bool)

(assert (=> start!119088 (=> (not res!929562) (not e!787027))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119088 (= res!929562 (validMask!0 mask!2840))))

(assert (=> start!119088 e!787027))

(assert (=> start!119088 true))

(declare-fun array_inv!34906 (array!95025) Bool)

(assert (=> start!119088 (array_inv!34906 a!2901)))

(declare-fun b!1389401 () Bool)

(declare-fun res!929563 () Bool)

(assert (=> b!1389401 (=> (not res!929563) (not e!787027))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95025 (_ BitVec 32)) Bool)

(assert (=> b!1389401 (= res!929563 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389402 () Bool)

(declare-fun res!929559 () Bool)

(assert (=> b!1389402 (=> (not res!929559) (not e!787027))))

(assert (=> b!1389402 (= res!929559 (and (= (size!46428 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46428 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46428 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119088 res!929562) b!1389402))

(assert (= (and b!1389402 res!929559) b!1389399))

(assert (= (and b!1389399 res!929561) b!1389398))

(assert (= (and b!1389398 res!929560) b!1389401))

(assert (= (and b!1389401 res!929563) b!1389397))

(assert (= (and b!1389397 res!929558) b!1389400))

(declare-fun m!1275039 () Bool)

(assert (=> b!1389400 m!1275039))

(assert (=> b!1389400 m!1275039))

(declare-fun m!1275041 () Bool)

(assert (=> b!1389400 m!1275041))

(declare-fun m!1275043 () Bool)

(assert (=> b!1389401 m!1275043))

(declare-fun m!1275045 () Bool)

(assert (=> start!119088 m!1275045))

(declare-fun m!1275047 () Bool)

(assert (=> start!119088 m!1275047))

(assert (=> b!1389398 m!1275039))

(assert (=> b!1389398 m!1275039))

(declare-fun m!1275049 () Bool)

(assert (=> b!1389398 m!1275049))

(declare-fun m!1275051 () Bool)

(assert (=> b!1389399 m!1275051))

(assert (=> b!1389399 m!1275051))

(declare-fun m!1275053 () Bool)

(assert (=> b!1389399 m!1275053))

(declare-fun m!1275055 () Bool)

(assert (=> b!1389397 m!1275055))

(push 1)

(assert (not b!1389398))

(assert (not b!1389397))

(assert (not start!119088))

(assert (not b!1389401))

(assert (not b!1389400))

(assert (not b!1389399))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

