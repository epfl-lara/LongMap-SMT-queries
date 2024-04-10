; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119152 () Bool)

(assert start!119152)

(declare-fun b!1389973 () Bool)

(declare-fun res!930139 () Bool)

(declare-fun e!787220 () Bool)

(assert (=> b!1389973 (=> (not res!930139) (not e!787220))))

(declare-datatypes ((array!95089 0))(
  ( (array!95090 (arr!45910 (Array (_ BitVec 32) (_ BitVec 64))) (size!46460 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95089)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389973 (= res!930139 (validKeyInArray!0 (select (arr!45910 a!2901) j!112)))))

(declare-fun b!1389974 () Bool)

(declare-fun res!930138 () Bool)

(assert (=> b!1389974 (=> (not res!930138) (not e!787220))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1389974 (= res!930138 (validKeyInArray!0 (select (arr!45910 a!2901) i!1037)))))

(declare-fun b!1389975 () Bool)

(declare-fun res!930136 () Bool)

(assert (=> b!1389975 (=> (not res!930136) (not e!787220))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95089 (_ BitVec 32)) Bool)

(assert (=> b!1389975 (= res!930136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389976 () Bool)

(assert (=> b!1389976 (= e!787220 (not true))))

(assert (=> b!1389976 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!46458 0))(
  ( (Unit!46459) )
))
(declare-fun lt!610691 () Unit!46458)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95089 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46458)

(assert (=> b!1389976 (= lt!610691 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10227 0))(
  ( (MissingZero!10227 (index!43279 (_ BitVec 32))) (Found!10227 (index!43280 (_ BitVec 32))) (Intermediate!10227 (undefined!11039 Bool) (index!43281 (_ BitVec 32)) (x!124961 (_ BitVec 32))) (Undefined!10227) (MissingVacant!10227 (index!43282 (_ BitVec 32))) )
))
(declare-fun lt!610692 () SeekEntryResult!10227)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95089 (_ BitVec 32)) SeekEntryResult!10227)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389976 (= lt!610692 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45910 a!2901) j!112) mask!2840) (select (arr!45910 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!930134 () Bool)

(assert (=> start!119152 (=> (not res!930134) (not e!787220))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119152 (= res!930134 (validMask!0 mask!2840))))

(assert (=> start!119152 e!787220))

(assert (=> start!119152 true))

(declare-fun array_inv!34938 (array!95089) Bool)

(assert (=> start!119152 (array_inv!34938 a!2901)))

(declare-fun b!1389977 () Bool)

(declare-fun res!930137 () Bool)

(assert (=> b!1389977 (=> (not res!930137) (not e!787220))))

(declare-datatypes ((List!32429 0))(
  ( (Nil!32426) (Cons!32425 (h!33643 (_ BitVec 64)) (t!47123 List!32429)) )
))
(declare-fun arrayNoDuplicates!0 (array!95089 (_ BitVec 32) List!32429) Bool)

(assert (=> b!1389977 (= res!930137 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32426))))

(declare-fun b!1389978 () Bool)

(declare-fun res!930135 () Bool)

(assert (=> b!1389978 (=> (not res!930135) (not e!787220))))

(assert (=> b!1389978 (= res!930135 (and (= (size!46460 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46460 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46460 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119152 res!930134) b!1389978))

(assert (= (and b!1389978 res!930135) b!1389974))

(assert (= (and b!1389974 res!930138) b!1389973))

(assert (= (and b!1389973 res!930139) b!1389975))

(assert (= (and b!1389975 res!930136) b!1389977))

(assert (= (and b!1389977 res!930137) b!1389976))

(declare-fun m!1275711 () Bool)

(assert (=> start!119152 m!1275711))

(declare-fun m!1275713 () Bool)

(assert (=> start!119152 m!1275713))

(declare-fun m!1275715 () Bool)

(assert (=> b!1389974 m!1275715))

(assert (=> b!1389974 m!1275715))

(declare-fun m!1275717 () Bool)

(assert (=> b!1389974 m!1275717))

(declare-fun m!1275719 () Bool)

(assert (=> b!1389973 m!1275719))

(assert (=> b!1389973 m!1275719))

(declare-fun m!1275721 () Bool)

(assert (=> b!1389973 m!1275721))

(assert (=> b!1389976 m!1275719))

(declare-fun m!1275723 () Bool)

(assert (=> b!1389976 m!1275723))

(assert (=> b!1389976 m!1275719))

(declare-fun m!1275725 () Bool)

(assert (=> b!1389976 m!1275725))

(assert (=> b!1389976 m!1275723))

(assert (=> b!1389976 m!1275719))

(declare-fun m!1275727 () Bool)

(assert (=> b!1389976 m!1275727))

(declare-fun m!1275729 () Bool)

(assert (=> b!1389976 m!1275729))

(declare-fun m!1275731 () Bool)

(assert (=> b!1389975 m!1275731))

(declare-fun m!1275733 () Bool)

(assert (=> b!1389977 m!1275733))

(push 1)

(assert (not b!1389976))

(assert (not b!1389974))

(assert (not b!1389975))

(assert (not b!1389973))

(assert (not start!119152))

(assert (not b!1389977))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

