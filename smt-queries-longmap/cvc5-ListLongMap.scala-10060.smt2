; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118710 () Bool)

(assert start!118710)

(declare-fun b!1386888 () Bool)

(declare-fun e!785908 () Bool)

(assert (=> b!1386888 (= e!785908 false)))

(declare-fun lt!609759 () Bool)

(declare-datatypes ((array!94884 0))(
  ( (array!94885 (arr!45816 (Array (_ BitVec 32) (_ BitVec 64))) (size!46367 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94884)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94884 (_ BitVec 32)) Bool)

(assert (=> b!1386888 (= lt!609759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386885 () Bool)

(declare-fun res!927348 () Bool)

(assert (=> b!1386885 (=> (not res!927348) (not e!785908))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1386885 (= res!927348 (and (= (size!46367 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46367 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46367 a!2938))))))

(declare-fun b!1386886 () Bool)

(declare-fun res!927347 () Bool)

(assert (=> b!1386886 (=> (not res!927347) (not e!785908))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386886 (= res!927347 (validKeyInArray!0 (select (arr!45816 a!2938) i!1065)))))

(declare-fun b!1386887 () Bool)

(declare-fun res!927346 () Bool)

(assert (=> b!1386887 (=> (not res!927346) (not e!785908))))

(declare-datatypes ((List!32331 0))(
  ( (Nil!32328) (Cons!32327 (h!33545 (_ BitVec 64)) (t!47017 List!32331)) )
))
(declare-fun arrayNoDuplicates!0 (array!94884 (_ BitVec 32) List!32331) Bool)

(assert (=> b!1386887 (= res!927346 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32328))))

(declare-fun res!927349 () Bool)

(assert (=> start!118710 (=> (not res!927349) (not e!785908))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118710 (= res!927349 (validMask!0 mask!2987))))

(assert (=> start!118710 e!785908))

(assert (=> start!118710 true))

(declare-fun array_inv!35097 (array!94884) Bool)

(assert (=> start!118710 (array_inv!35097 a!2938)))

(assert (= (and start!118710 res!927349) b!1386885))

(assert (= (and b!1386885 res!927348) b!1386886))

(assert (= (and b!1386886 res!927347) b!1386887))

(assert (= (and b!1386887 res!927346) b!1386888))

(declare-fun m!1272501 () Bool)

(assert (=> b!1386888 m!1272501))

(declare-fun m!1272503 () Bool)

(assert (=> b!1386886 m!1272503))

(assert (=> b!1386886 m!1272503))

(declare-fun m!1272505 () Bool)

(assert (=> b!1386886 m!1272505))

(declare-fun m!1272507 () Bool)

(assert (=> b!1386887 m!1272507))

(declare-fun m!1272509 () Bool)

(assert (=> start!118710 m!1272509))

(declare-fun m!1272511 () Bool)

(assert (=> start!118710 m!1272511))

(push 1)

(assert (not b!1386886))

(assert (not b!1386888))

(assert (not start!118710))

(assert (not b!1386887))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

