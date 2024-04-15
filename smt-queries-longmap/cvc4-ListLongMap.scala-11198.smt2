; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130772 () Bool)

(assert start!130772)

(declare-fun b!1533925 () Bool)

(declare-fun res!1051200 () Bool)

(declare-fun e!854247 () Bool)

(assert (=> b!1533925 (=> (not res!1051200) (not e!854247))))

(declare-datatypes ((array!101868 0))(
  ( (array!101869 (arr!49151 (Array (_ BitVec 32) (_ BitVec 64))) (size!49703 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101868)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101868 (_ BitVec 32)) Bool)

(assert (=> b!1533925 (= res!1051200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533926 () Bool)

(declare-fun res!1051201 () Bool)

(assert (=> b!1533926 (=> (not res!1051201) (not e!854247))))

(declare-datatypes ((List!35703 0))(
  ( (Nil!35700) (Cons!35699 (h!37145 (_ BitVec 64)) (t!50389 List!35703)) )
))
(declare-fun arrayNoDuplicates!0 (array!101868 (_ BitVec 32) List!35703) Bool)

(assert (=> b!1533926 (= res!1051201 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35700))))

(declare-fun res!1051199 () Bool)

(assert (=> start!130772 (=> (not res!1051199) (not e!854247))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130772 (= res!1051199 (validMask!0 mask!2480))))

(assert (=> start!130772 e!854247))

(assert (=> start!130772 true))

(declare-fun array_inv!38384 (array!101868) Bool)

(assert (=> start!130772 (array_inv!38384 a!2792)))

(declare-fun b!1533927 () Bool)

(assert (=> b!1533927 (= e!854247 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13308 0))(
  ( (MissingZero!13308 (index!55627 (_ BitVec 32))) (Found!13308 (index!55628 (_ BitVec 32))) (Intermediate!13308 (undefined!14120 Bool) (index!55629 (_ BitVec 32)) (x!137385 (_ BitVec 32))) (Undefined!13308) (MissingVacant!13308 (index!55630 (_ BitVec 32))) )
))
(declare-fun lt!663567 () SeekEntryResult!13308)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101868 (_ BitVec 32)) SeekEntryResult!13308)

(assert (=> b!1533927 (= lt!663567 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49151 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1533928 () Bool)

(declare-fun res!1051198 () Bool)

(assert (=> b!1533928 (=> (not res!1051198) (not e!854247))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533928 (= res!1051198 (validKeyInArray!0 (select (arr!49151 a!2792) j!64)))))

(declare-fun b!1533929 () Bool)

(declare-fun res!1051196 () Bool)

(assert (=> b!1533929 (=> (not res!1051196) (not e!854247))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1533929 (= res!1051196 (and (= (size!49703 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49703 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49703 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533930 () Bool)

(declare-fun res!1051195 () Bool)

(assert (=> b!1533930 (=> (not res!1051195) (not e!854247))))

(assert (=> b!1533930 (= res!1051195 (validKeyInArray!0 (select (arr!49151 a!2792) i!951)))))

(declare-fun b!1533931 () Bool)

(declare-fun res!1051197 () Bool)

(assert (=> b!1533931 (=> (not res!1051197) (not e!854247))))

(assert (=> b!1533931 (= res!1051197 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49703 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49703 a!2792)) (= (select (arr!49151 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!130772 res!1051199) b!1533929))

(assert (= (and b!1533929 res!1051196) b!1533930))

(assert (= (and b!1533930 res!1051195) b!1533928))

(assert (= (and b!1533928 res!1051198) b!1533925))

(assert (= (and b!1533925 res!1051200) b!1533926))

(assert (= (and b!1533926 res!1051201) b!1533931))

(assert (= (and b!1533931 res!1051197) b!1533927))

(declare-fun m!1416013 () Bool)

(assert (=> b!1533931 m!1416013))

(declare-fun m!1416015 () Bool)

(assert (=> b!1533926 m!1416015))

(declare-fun m!1416017 () Bool)

(assert (=> b!1533927 m!1416017))

(assert (=> b!1533927 m!1416017))

(declare-fun m!1416019 () Bool)

(assert (=> b!1533927 m!1416019))

(declare-fun m!1416021 () Bool)

(assert (=> b!1533925 m!1416021))

(assert (=> b!1533928 m!1416017))

(assert (=> b!1533928 m!1416017))

(declare-fun m!1416023 () Bool)

(assert (=> b!1533928 m!1416023))

(declare-fun m!1416025 () Bool)

(assert (=> b!1533930 m!1416025))

(assert (=> b!1533930 m!1416025))

(declare-fun m!1416027 () Bool)

(assert (=> b!1533930 m!1416027))

(declare-fun m!1416029 () Bool)

(assert (=> start!130772 m!1416029))

(declare-fun m!1416031 () Bool)

(assert (=> start!130772 m!1416031))

(push 1)

(assert (not b!1533928))

(assert (not b!1533925))

(assert (not b!1533926))

(assert (not start!130772))

(assert (not b!1533930))

(assert (not b!1533927))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

