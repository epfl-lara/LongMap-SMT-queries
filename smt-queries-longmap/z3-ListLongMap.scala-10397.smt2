; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122504 () Bool)

(assert start!122504)

(declare-fun b!1419171 () Bool)

(declare-fun res!954696 () Bool)

(declare-fun e!802997 () Bool)

(assert (=> b!1419171 (=> (not res!954696) (not e!802997))))

(declare-datatypes ((array!96908 0))(
  ( (array!96909 (arr!46773 (Array (_ BitVec 32) (_ BitVec 64))) (size!47323 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96908)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419171 (= res!954696 (validKeyInArray!0 (select (arr!46773 a!2831) i!982)))))

(declare-fun b!1419172 () Bool)

(declare-fun res!954690 () Bool)

(assert (=> b!1419172 (=> (not res!954690) (not e!802997))))

(declare-datatypes ((List!33283 0))(
  ( (Nil!33280) (Cons!33279 (h!34578 (_ BitVec 64)) (t!47977 List!33283)) )
))
(declare-fun arrayNoDuplicates!0 (array!96908 (_ BitVec 32) List!33283) Bool)

(assert (=> b!1419172 (= res!954690 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33280))))

(declare-fun b!1419173 () Bool)

(declare-fun mask!2608 () (_ BitVec 32))

(assert (=> b!1419173 (= e!802997 (bvslt mask!2608 #b00000000000000000000000000000000))))

(declare-fun lt!625737 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419173 (= lt!625737 (toIndex!0 (select (store (arr!46773 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608))))

(declare-fun res!954691 () Bool)

(assert (=> start!122504 (=> (not res!954691) (not e!802997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122504 (= res!954691 (validMask!0 mask!2608))))

(assert (=> start!122504 e!802997))

(assert (=> start!122504 true))

(declare-fun array_inv!35801 (array!96908) Bool)

(assert (=> start!122504 (array_inv!35801 a!2831)))

(declare-fun b!1419170 () Bool)

(declare-fun res!954692 () Bool)

(assert (=> b!1419170 (=> (not res!954692) (not e!802997))))

(assert (=> b!1419170 (= res!954692 (and (= (size!47323 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47323 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47323 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1419174 () Bool)

(declare-fun res!954697 () Bool)

(assert (=> b!1419174 (=> (not res!954697) (not e!802997))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11058 0))(
  ( (MissingZero!11058 (index!46624 (_ BitVec 32))) (Found!11058 (index!46625 (_ BitVec 32))) (Intermediate!11058 (undefined!11870 Bool) (index!46626 (_ BitVec 32)) (x!128294 (_ BitVec 32))) (Undefined!11058) (MissingVacant!11058 (index!46627 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96908 (_ BitVec 32)) SeekEntryResult!11058)

(assert (=> b!1419174 (= res!954697 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46773 a!2831) j!81) mask!2608) (select (arr!46773 a!2831) j!81) a!2831 mask!2608) (Intermediate!11058 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1419175 () Bool)

(declare-fun res!954695 () Bool)

(assert (=> b!1419175 (=> (not res!954695) (not e!802997))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96908 (_ BitVec 32)) Bool)

(assert (=> b!1419175 (= res!954695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1419176 () Bool)

(declare-fun res!954693 () Bool)

(assert (=> b!1419176 (=> (not res!954693) (not e!802997))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1419176 (= res!954693 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47323 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47323 a!2831))))))

(declare-fun b!1419177 () Bool)

(declare-fun res!954694 () Bool)

(assert (=> b!1419177 (=> (not res!954694) (not e!802997))))

(assert (=> b!1419177 (= res!954694 (validKeyInArray!0 (select (arr!46773 a!2831) j!81)))))

(assert (= (and start!122504 res!954691) b!1419170))

(assert (= (and b!1419170 res!954692) b!1419171))

(assert (= (and b!1419171 res!954696) b!1419177))

(assert (= (and b!1419177 res!954694) b!1419175))

(assert (= (and b!1419175 res!954695) b!1419172))

(assert (= (and b!1419172 res!954690) b!1419176))

(assert (= (and b!1419176 res!954693) b!1419174))

(assert (= (and b!1419174 res!954697) b!1419173))

(declare-fun m!1309679 () Bool)

(assert (=> b!1419171 m!1309679))

(assert (=> b!1419171 m!1309679))

(declare-fun m!1309681 () Bool)

(assert (=> b!1419171 m!1309681))

(declare-fun m!1309683 () Bool)

(assert (=> b!1419175 m!1309683))

(declare-fun m!1309685 () Bool)

(assert (=> start!122504 m!1309685))

(declare-fun m!1309687 () Bool)

(assert (=> start!122504 m!1309687))

(declare-fun m!1309689 () Bool)

(assert (=> b!1419174 m!1309689))

(assert (=> b!1419174 m!1309689))

(declare-fun m!1309691 () Bool)

(assert (=> b!1419174 m!1309691))

(assert (=> b!1419174 m!1309691))

(assert (=> b!1419174 m!1309689))

(declare-fun m!1309693 () Bool)

(assert (=> b!1419174 m!1309693))

(assert (=> b!1419177 m!1309689))

(assert (=> b!1419177 m!1309689))

(declare-fun m!1309695 () Bool)

(assert (=> b!1419177 m!1309695))

(declare-fun m!1309697 () Bool)

(assert (=> b!1419172 m!1309697))

(declare-fun m!1309699 () Bool)

(assert (=> b!1419173 m!1309699))

(declare-fun m!1309701 () Bool)

(assert (=> b!1419173 m!1309701))

(assert (=> b!1419173 m!1309701))

(declare-fun m!1309703 () Bool)

(assert (=> b!1419173 m!1309703))

(check-sat (not b!1419174) (not b!1419172) (not b!1419173) (not b!1419175) (not start!122504) (not b!1419177) (not b!1419171))
(check-sat)
