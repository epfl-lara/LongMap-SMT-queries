; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118716 () Bool)

(assert start!118716)

(declare-fun res!927385 () Bool)

(declare-fun e!785926 () Bool)

(assert (=> start!118716 (=> (not res!927385) (not e!785926))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118716 (= res!927385 (validMask!0 mask!2987))))

(assert (=> start!118716 e!785926))

(assert (=> start!118716 true))

(declare-datatypes ((array!94890 0))(
  ( (array!94891 (arr!45819 (Array (_ BitVec 32) (_ BitVec 64))) (size!46370 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94890)

(declare-fun array_inv!35100 (array!94890) Bool)

(assert (=> start!118716 (array_inv!35100 a!2938)))

(declare-fun b!1386921 () Bool)

(declare-fun res!927383 () Bool)

(assert (=> b!1386921 (=> (not res!927383) (not e!785926))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1386921 (= res!927383 (and (= (size!46370 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46370 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46370 a!2938))))))

(declare-fun b!1386922 () Bool)

(declare-fun res!927384 () Bool)

(assert (=> b!1386922 (=> (not res!927384) (not e!785926))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386922 (= res!927384 (validKeyInArray!0 (select (arr!45819 a!2938) i!1065)))))

(declare-fun b!1386923 () Bool)

(declare-fun res!927382 () Bool)

(assert (=> b!1386923 (=> (not res!927382) (not e!785926))))

(declare-datatypes ((List!32334 0))(
  ( (Nil!32331) (Cons!32330 (h!33548 (_ BitVec 64)) (t!47020 List!32334)) )
))
(declare-fun arrayNoDuplicates!0 (array!94890 (_ BitVec 32) List!32334) Bool)

(assert (=> b!1386923 (= res!927382 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32331))))

(declare-fun b!1386924 () Bool)

(assert (=> b!1386924 (= e!785926 false)))

(declare-fun lt!609768 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94890 (_ BitVec 32)) Bool)

(assert (=> b!1386924 (= lt!609768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(assert (= (and start!118716 res!927385) b!1386921))

(assert (= (and b!1386921 res!927383) b!1386922))

(assert (= (and b!1386922 res!927384) b!1386923))

(assert (= (and b!1386923 res!927382) b!1386924))

(declare-fun m!1272537 () Bool)

(assert (=> start!118716 m!1272537))

(declare-fun m!1272539 () Bool)

(assert (=> start!118716 m!1272539))

(declare-fun m!1272541 () Bool)

(assert (=> b!1386922 m!1272541))

(assert (=> b!1386922 m!1272541))

(declare-fun m!1272543 () Bool)

(assert (=> b!1386922 m!1272543))

(declare-fun m!1272545 () Bool)

(assert (=> b!1386923 m!1272545))

(declare-fun m!1272547 () Bool)

(assert (=> b!1386924 m!1272547))

(push 1)

(assert (not b!1386922))

(assert (not b!1386923))

(assert (not start!118716))

(assert (not b!1386924))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

