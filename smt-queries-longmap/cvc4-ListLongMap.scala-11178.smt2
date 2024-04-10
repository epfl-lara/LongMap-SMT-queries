; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130704 () Bool)

(assert start!130704)

(declare-fun b!1532965 () Bool)

(declare-fun e!854091 () Bool)

(assert (=> b!1532965 (= e!854091 false)))

(declare-fun lt!663757 () Bool)

(declare-datatypes ((array!101802 0))(
  ( (array!101803 (arr!49117 (Array (_ BitVec 32) (_ BitVec 64))) (size!49667 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101802)

(declare-datatypes ((List!35591 0))(
  ( (Nil!35588) (Cons!35587 (h!37032 (_ BitVec 64)) (t!50285 List!35591)) )
))
(declare-fun arrayNoDuplicates!0 (array!101802 (_ BitVec 32) List!35591) Bool)

(assert (=> b!1532965 (= lt!663757 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35588))))

(declare-fun res!1050053 () Bool)

(assert (=> start!130704 (=> (not res!1050053) (not e!854091))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130704 (= res!1050053 (validMask!0 mask!2480))))

(assert (=> start!130704 e!854091))

(assert (=> start!130704 true))

(declare-fun array_inv!38145 (array!101802) Bool)

(assert (=> start!130704 (array_inv!38145 a!2792)))

(declare-fun b!1532966 () Bool)

(declare-fun res!1050055 () Bool)

(assert (=> b!1532966 (=> (not res!1050055) (not e!854091))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532966 (= res!1050055 (validKeyInArray!0 (select (arr!49117 a!2792) i!951)))))

(declare-fun b!1532967 () Bool)

(declare-fun res!1050054 () Bool)

(assert (=> b!1532967 (=> (not res!1050054) (not e!854091))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1532967 (= res!1050054 (and (= (size!49667 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49667 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49667 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1532968 () Bool)

(declare-fun res!1050052 () Bool)

(assert (=> b!1532968 (=> (not res!1050052) (not e!854091))))

(assert (=> b!1532968 (= res!1050052 (validKeyInArray!0 (select (arr!49117 a!2792) j!64)))))

(declare-fun b!1532969 () Bool)

(declare-fun res!1050051 () Bool)

(assert (=> b!1532969 (=> (not res!1050051) (not e!854091))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101802 (_ BitVec 32)) Bool)

(assert (=> b!1532969 (= res!1050051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!130704 res!1050053) b!1532967))

(assert (= (and b!1532967 res!1050054) b!1532966))

(assert (= (and b!1532966 res!1050055) b!1532968))

(assert (= (and b!1532968 res!1050052) b!1532969))

(assert (= (and b!1532969 res!1050051) b!1532965))

(declare-fun m!1415675 () Bool)

(assert (=> b!1532965 m!1415675))

(declare-fun m!1415677 () Bool)

(assert (=> start!130704 m!1415677))

(declare-fun m!1415679 () Bool)

(assert (=> start!130704 m!1415679))

(declare-fun m!1415681 () Bool)

(assert (=> b!1532969 m!1415681))

(declare-fun m!1415683 () Bool)

(assert (=> b!1532968 m!1415683))

(assert (=> b!1532968 m!1415683))

(declare-fun m!1415685 () Bool)

(assert (=> b!1532968 m!1415685))

(declare-fun m!1415687 () Bool)

(assert (=> b!1532966 m!1415687))

(assert (=> b!1532966 m!1415687))

(declare-fun m!1415689 () Bool)

(assert (=> b!1532966 m!1415689))

(push 1)

(assert (not b!1532969))

(assert (not start!130704))

(assert (not b!1532966))

(assert (not b!1532968))

(assert (not b!1532965))

(check-sat)

(pop 1)

(push 1)

(check-sat)

