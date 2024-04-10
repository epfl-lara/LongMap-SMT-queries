; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122330 () Bool)

(assert start!122330)

(declare-fun b!1418134 () Bool)

(declare-fun res!953810 () Bool)

(declare-fun e!802564 () Bool)

(assert (=> b!1418134 (=> (not res!953810) (not e!802564))))

(declare-datatypes ((array!96833 0))(
  ( (array!96834 (arr!46740 (Array (_ BitVec 32) (_ BitVec 64))) (size!47290 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96833)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418134 (= res!953810 (validKeyInArray!0 (select (arr!46740 a!2831) i!982)))))

(declare-fun b!1418135 () Bool)

(declare-fun res!953814 () Bool)

(assert (=> b!1418135 (=> (not res!953814) (not e!802564))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1418135 (= res!953814 (validKeyInArray!0 (select (arr!46740 a!2831) j!81)))))

(declare-fun b!1418136 () Bool)

(declare-fun res!953813 () Bool)

(assert (=> b!1418136 (=> (not res!953813) (not e!802564))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96833 (_ BitVec 32)) Bool)

(assert (=> b!1418136 (= res!953813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1418137 () Bool)

(declare-fun res!953815 () Bool)

(assert (=> b!1418137 (=> (not res!953815) (not e!802564))))

(declare-datatypes ((List!33250 0))(
  ( (Nil!33247) (Cons!33246 (h!34539 (_ BitVec 64)) (t!47944 List!33250)) )
))
(declare-fun arrayNoDuplicates!0 (array!96833 (_ BitVec 32) List!33250) Bool)

(assert (=> b!1418137 (= res!953815 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33247))))

(declare-fun res!953812 () Bool)

(assert (=> start!122330 (=> (not res!953812) (not e!802564))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122330 (= res!953812 (validMask!0 mask!2608))))

(assert (=> start!122330 e!802564))

(assert (=> start!122330 true))

(declare-fun array_inv!35768 (array!96833) Bool)

(assert (=> start!122330 (array_inv!35768 a!2831)))

(declare-fun b!1418138 () Bool)

(declare-fun res!953811 () Bool)

(assert (=> b!1418138 (=> (not res!953811) (not e!802564))))

(assert (=> b!1418138 (= res!953811 (and (= (size!47290 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47290 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47290 a!2831)) (not (= i!982 j!81))))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun b!1418139 () Bool)

(assert (=> b!1418139 (= e!802564 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47290 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47290 a!2831)) (bvslt mask!2608 #b00000000000000000000000000000000)))))

(assert (= (and start!122330 res!953812) b!1418138))

(assert (= (and b!1418138 res!953811) b!1418134))

(assert (= (and b!1418134 res!953810) b!1418135))

(assert (= (and b!1418135 res!953814) b!1418136))

(assert (= (and b!1418136 res!953813) b!1418137))

(assert (= (and b!1418137 res!953815) b!1418139))

(declare-fun m!1308883 () Bool)

(assert (=> b!1418135 m!1308883))

(assert (=> b!1418135 m!1308883))

(declare-fun m!1308885 () Bool)

(assert (=> b!1418135 m!1308885))

(declare-fun m!1308887 () Bool)

(assert (=> b!1418136 m!1308887))

(declare-fun m!1308889 () Bool)

(assert (=> b!1418137 m!1308889))

(declare-fun m!1308891 () Bool)

(assert (=> b!1418134 m!1308891))

(assert (=> b!1418134 m!1308891))

(declare-fun m!1308893 () Bool)

(assert (=> b!1418134 m!1308893))

(declare-fun m!1308895 () Bool)

(assert (=> start!122330 m!1308895))

(declare-fun m!1308897 () Bool)

(assert (=> start!122330 m!1308897))

(check-sat (not start!122330) (not b!1418135) (not b!1418134) (not b!1418137) (not b!1418136))
(check-sat)
