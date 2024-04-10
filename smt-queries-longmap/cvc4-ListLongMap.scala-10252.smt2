; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120568 () Bool)

(assert start!120568)

(declare-fun b!1403889 () Bool)

(declare-fun res!942406 () Bool)

(declare-fun e!794843 () Bool)

(assert (=> b!1403889 (=> (not res!942406) (not e!794843))))

(declare-datatypes ((array!95977 0))(
  ( (array!95978 (arr!46339 (Array (_ BitVec 32) (_ BitVec 64))) (size!46889 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95977)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95977 (_ BitVec 32)) Bool)

(assert (=> b!1403889 (= res!942406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403890 () Bool)

(declare-fun res!942403 () Bool)

(assert (=> b!1403890 (=> (not res!942403) (not e!794843))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1403890 (= res!942403 (and (= (size!46889 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46889 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46889 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!942400 () Bool)

(assert (=> start!120568 (=> (not res!942400) (not e!794843))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120568 (= res!942400 (validMask!0 mask!2840))))

(assert (=> start!120568 e!794843))

(assert (=> start!120568 true))

(declare-fun array_inv!35367 (array!95977) Bool)

(assert (=> start!120568 (array_inv!35367 a!2901)))

(declare-fun b!1403891 () Bool)

(declare-fun res!942402 () Bool)

(assert (=> b!1403891 (=> (not res!942402) (not e!794843))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403891 (= res!942402 (validKeyInArray!0 (select (arr!46339 a!2901) j!112)))))

(declare-fun b!1403892 () Bool)

(declare-fun res!942401 () Bool)

(assert (=> b!1403892 (=> (not res!942401) (not e!794843))))

(declare-datatypes ((List!32858 0))(
  ( (Nil!32855) (Cons!32854 (h!34102 (_ BitVec 64)) (t!47552 List!32858)) )
))
(declare-fun arrayNoDuplicates!0 (array!95977 (_ BitVec 32) List!32858) Bool)

(assert (=> b!1403892 (= res!942401 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32855))))

(declare-fun b!1403893 () Bool)

(declare-fun res!942405 () Bool)

(assert (=> b!1403893 (=> (not res!942405) (not e!794843))))

(assert (=> b!1403893 (= res!942405 (validKeyInArray!0 (select (arr!46339 a!2901) i!1037)))))

(declare-fun b!1403894 () Bool)

(assert (=> b!1403894 (= e!794843 (not true))))

(declare-fun e!794842 () Bool)

(assert (=> b!1403894 e!794842))

(declare-fun res!942404 () Bool)

(assert (=> b!1403894 (=> (not res!942404) (not e!794842))))

(assert (=> b!1403894 (= res!942404 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47316 0))(
  ( (Unit!47317) )
))
(declare-fun lt!618537 () Unit!47316)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95977 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47316)

(assert (=> b!1403894 (= lt!618537 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10656 0))(
  ( (MissingZero!10656 (index!45001 (_ BitVec 32))) (Found!10656 (index!45002 (_ BitVec 32))) (Intermediate!10656 (undefined!11468 Bool) (index!45003 (_ BitVec 32)) (x!126603 (_ BitVec 32))) (Undefined!10656) (MissingVacant!10656 (index!45004 (_ BitVec 32))) )
))
(declare-fun lt!618536 () SeekEntryResult!10656)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95977 (_ BitVec 32)) SeekEntryResult!10656)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403894 (= lt!618536 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46339 a!2901) j!112) mask!2840) (select (arr!46339 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403895 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95977 (_ BitVec 32)) SeekEntryResult!10656)

(assert (=> b!1403895 (= e!794842 (= (seekEntryOrOpen!0 (select (arr!46339 a!2901) j!112) a!2901 mask!2840) (Found!10656 j!112)))))

(assert (= (and start!120568 res!942400) b!1403890))

(assert (= (and b!1403890 res!942403) b!1403893))

(assert (= (and b!1403893 res!942405) b!1403891))

(assert (= (and b!1403891 res!942402) b!1403889))

(assert (= (and b!1403889 res!942406) b!1403892))

(assert (= (and b!1403892 res!942401) b!1403894))

(assert (= (and b!1403894 res!942404) b!1403895))

(declare-fun m!1292653 () Bool)

(assert (=> start!120568 m!1292653))

(declare-fun m!1292655 () Bool)

(assert (=> start!120568 m!1292655))

(declare-fun m!1292657 () Bool)

(assert (=> b!1403895 m!1292657))

(assert (=> b!1403895 m!1292657))

(declare-fun m!1292659 () Bool)

(assert (=> b!1403895 m!1292659))

(assert (=> b!1403891 m!1292657))

(assert (=> b!1403891 m!1292657))

(declare-fun m!1292661 () Bool)

(assert (=> b!1403891 m!1292661))

(assert (=> b!1403894 m!1292657))

(declare-fun m!1292663 () Bool)

(assert (=> b!1403894 m!1292663))

(assert (=> b!1403894 m!1292657))

(declare-fun m!1292665 () Bool)

(assert (=> b!1403894 m!1292665))

(assert (=> b!1403894 m!1292663))

(assert (=> b!1403894 m!1292657))

(declare-fun m!1292667 () Bool)

(assert (=> b!1403894 m!1292667))

(declare-fun m!1292669 () Bool)

(assert (=> b!1403894 m!1292669))

(declare-fun m!1292671 () Bool)

(assert (=> b!1403893 m!1292671))

(assert (=> b!1403893 m!1292671))

(declare-fun m!1292673 () Bool)

(assert (=> b!1403893 m!1292673))

(declare-fun m!1292675 () Bool)

(assert (=> b!1403889 m!1292675))

(declare-fun m!1292677 () Bool)

(assert (=> b!1403892 m!1292677))

(push 1)

(assert (not b!1403891))

(assert (not b!1403889))

(assert (not b!1403895))

(assert (not start!120568))

(assert (not b!1403892))

(assert (not b!1403894))

(assert (not b!1403893))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

