; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118734 () Bool)

(assert start!118734)

(declare-fun b!1387053 () Bool)

(declare-fun res!927520 () Bool)

(declare-fun e!785980 () Bool)

(assert (=> b!1387053 (=> (not res!927520) (not e!785980))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94908 0))(
  ( (array!94909 (arr!45828 (Array (_ BitVec 32) (_ BitVec 64))) (size!46379 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94908)

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1387053 (= res!927520 (and (not (= (select (arr!45828 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45828 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun res!927519 () Bool)

(assert (=> start!118734 (=> (not res!927519) (not e!785980))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118734 (= res!927519 (validMask!0 mask!2987))))

(assert (=> start!118734 e!785980))

(assert (=> start!118734 true))

(declare-fun array_inv!35109 (array!94908) Bool)

(assert (=> start!118734 (array_inv!35109 a!2938)))

(declare-fun b!1387054 () Bool)

(assert (=> b!1387054 (= e!785980 (= i!1065 startIndex!16))))

(declare-fun b!1387055 () Bool)

(declare-fun res!927514 () Bool)

(assert (=> b!1387055 (=> (not res!927514) (not e!785980))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1387055 (= res!927514 (validKeyInArray!0 (select (arr!45828 a!2938) i!1065)))))

(declare-fun b!1387056 () Bool)

(declare-fun res!927517 () Bool)

(assert (=> b!1387056 (=> (not res!927517) (not e!785980))))

(declare-datatypes ((List!32343 0))(
  ( (Nil!32340) (Cons!32339 (h!33557 (_ BitVec 64)) (t!47029 List!32343)) )
))
(declare-fun arrayNoDuplicates!0 (array!94908 (_ BitVec 32) List!32343) Bool)

(assert (=> b!1387056 (= res!927517 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32340))))

(declare-fun b!1387057 () Bool)

(declare-fun res!927516 () Bool)

(assert (=> b!1387057 (=> (not res!927516) (not e!785980))))

(assert (=> b!1387057 (= res!927516 (validKeyInArray!0 (select (arr!45828 a!2938) startIndex!16)))))

(declare-fun b!1387058 () Bool)

(declare-fun res!927515 () Bool)

(assert (=> b!1387058 (=> (not res!927515) (not e!785980))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94908 (_ BitVec 32)) Bool)

(assert (=> b!1387058 (= res!927515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1387059 () Bool)

(declare-fun res!927518 () Bool)

(assert (=> b!1387059 (=> (not res!927518) (not e!785980))))

(assert (=> b!1387059 (= res!927518 (and (= (size!46379 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46379 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46379 a!2938))))))

(assert (= (and start!118734 res!927519) b!1387059))

(assert (= (and b!1387059 res!927518) b!1387055))

(assert (= (and b!1387055 res!927514) b!1387056))

(assert (= (and b!1387056 res!927517) b!1387058))

(assert (= (and b!1387058 res!927515) b!1387053))

(assert (= (and b!1387053 res!927520) b!1387057))

(assert (= (and b!1387057 res!927516) b!1387054))

(declare-fun m!1272653 () Bool)

(assert (=> b!1387056 m!1272653))

(declare-fun m!1272655 () Bool)

(assert (=> start!118734 m!1272655))

(declare-fun m!1272657 () Bool)

(assert (=> start!118734 m!1272657))

(declare-fun m!1272659 () Bool)

(assert (=> b!1387055 m!1272659))

(assert (=> b!1387055 m!1272659))

(declare-fun m!1272661 () Bool)

(assert (=> b!1387055 m!1272661))

(declare-fun m!1272663 () Bool)

(assert (=> b!1387057 m!1272663))

(assert (=> b!1387057 m!1272663))

(declare-fun m!1272665 () Bool)

(assert (=> b!1387057 m!1272665))

(declare-fun m!1272667 () Bool)

(assert (=> b!1387058 m!1272667))

(assert (=> b!1387053 m!1272659))

(push 1)

(assert (not b!1387055))

(assert (not b!1387056))

(assert (not b!1387058))

(assert (not b!1387057))

(assert (not start!118734))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

