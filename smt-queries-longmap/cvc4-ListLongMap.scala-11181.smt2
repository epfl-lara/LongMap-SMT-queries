; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130670 () Bool)

(assert start!130670)

(declare-fun b!1532781 () Bool)

(declare-fun res!1050052 () Bool)

(declare-fun e!853942 () Bool)

(assert (=> b!1532781 (=> (not res!1050052) (not e!853942))))

(declare-datatypes ((array!101766 0))(
  ( (array!101767 (arr!49100 (Array (_ BitVec 32) (_ BitVec 64))) (size!49652 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101766)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532781 (= res!1050052 (validKeyInArray!0 (select (arr!49100 a!2792) j!64)))))

(declare-fun b!1532783 () Bool)

(assert (=> b!1532783 (= e!853942 false)))

(declare-fun lt!663486 () Bool)

(declare-datatypes ((List!35652 0))(
  ( (Nil!35649) (Cons!35648 (h!37094 (_ BitVec 64)) (t!50338 List!35652)) )
))
(declare-fun arrayNoDuplicates!0 (array!101766 (_ BitVec 32) List!35652) Bool)

(assert (=> b!1532783 (= lt!663486 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35649))))

(declare-fun res!1050051 () Bool)

(assert (=> start!130670 (=> (not res!1050051) (not e!853942))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130670 (= res!1050051 (validMask!0 mask!2480))))

(assert (=> start!130670 e!853942))

(assert (=> start!130670 true))

(declare-fun array_inv!38333 (array!101766) Bool)

(assert (=> start!130670 (array_inv!38333 a!2792)))

(declare-fun b!1532782 () Bool)

(declare-fun res!1050055 () Bool)

(assert (=> b!1532782 (=> (not res!1050055) (not e!853942))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101766 (_ BitVec 32)) Bool)

(assert (=> b!1532782 (= res!1050055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1532784 () Bool)

(declare-fun res!1050054 () Bool)

(assert (=> b!1532784 (=> (not res!1050054) (not e!853942))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1532784 (= res!1050054 (validKeyInArray!0 (select (arr!49100 a!2792) i!951)))))

(declare-fun b!1532785 () Bool)

(declare-fun res!1050053 () Bool)

(assert (=> b!1532785 (=> (not res!1050053) (not e!853942))))

(assert (=> b!1532785 (= res!1050053 (and (= (size!49652 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49652 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49652 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!130670 res!1050051) b!1532785))

(assert (= (and b!1532785 res!1050053) b!1532784))

(assert (= (and b!1532784 res!1050054) b!1532781))

(assert (= (and b!1532781 res!1050052) b!1532782))

(assert (= (and b!1532782 res!1050055) b!1532783))

(declare-fun m!1414917 () Bool)

(assert (=> b!1532782 m!1414917))

(declare-fun m!1414919 () Bool)

(assert (=> b!1532784 m!1414919))

(assert (=> b!1532784 m!1414919))

(declare-fun m!1414921 () Bool)

(assert (=> b!1532784 m!1414921))

(declare-fun m!1414923 () Bool)

(assert (=> b!1532783 m!1414923))

(declare-fun m!1414925 () Bool)

(assert (=> b!1532781 m!1414925))

(assert (=> b!1532781 m!1414925))

(declare-fun m!1414927 () Bool)

(assert (=> b!1532781 m!1414927))

(declare-fun m!1414929 () Bool)

(assert (=> start!130670 m!1414929))

(declare-fun m!1414931 () Bool)

(assert (=> start!130670 m!1414931))

(push 1)

(assert (not b!1532784))

(assert (not b!1532782))

(assert (not start!130670))

(assert (not b!1532781))

(assert (not b!1532783))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

