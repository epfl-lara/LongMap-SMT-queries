; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122612 () Bool)

(assert start!122612)

(declare-fun b!1420156 () Bool)

(declare-fun res!955594 () Bool)

(declare-fun e!803311 () Bool)

(assert (=> b!1420156 (=> (not res!955594) (not e!803311))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!96977 0))(
  ( (array!96978 (arr!46806 (Array (_ BitVec 32) (_ BitVec 64))) (size!47356 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96977)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1420156 (= res!955594 (and (= (size!47356 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47356 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47356 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420157 () Bool)

(declare-fun res!955596 () Bool)

(assert (=> b!1420157 (=> (not res!955596) (not e!803311))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420157 (= res!955596 (validKeyInArray!0 (select (arr!46806 a!2831) i!982)))))

(declare-fun b!1420158 () Bool)

(declare-fun res!955591 () Bool)

(assert (=> b!1420158 (=> (not res!955591) (not e!803311))))

(assert (=> b!1420158 (= res!955591 (validKeyInArray!0 (select (arr!46806 a!2831) j!81)))))

(declare-fun b!1420159 () Bool)

(assert (=> b!1420159 (= e!803311 false)))

(declare-datatypes ((SeekEntryResult!11091 0))(
  ( (MissingZero!11091 (index!46756 (_ BitVec 32))) (Found!11091 (index!46757 (_ BitVec 32))) (Intermediate!11091 (undefined!11903 Bool) (index!46758 (_ BitVec 32)) (x!128421 (_ BitVec 32))) (Undefined!11091) (MissingVacant!11091 (index!46759 (_ BitVec 32))) )
))
(declare-fun lt!625887 () SeekEntryResult!11091)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96977 (_ BitVec 32)) SeekEntryResult!11091)

(assert (=> b!1420159 (= lt!625887 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46806 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1420160 () Bool)

(declare-fun res!955593 () Bool)

(assert (=> b!1420160 (=> (not res!955593) (not e!803311))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1420160 (= res!955593 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47356 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47356 a!2831))))))

(declare-fun b!1420161 () Bool)

(declare-fun res!955592 () Bool)

(assert (=> b!1420161 (=> (not res!955592) (not e!803311))))

(declare-datatypes ((List!33316 0))(
  ( (Nil!33313) (Cons!33312 (h!34614 (_ BitVec 64)) (t!48010 List!33316)) )
))
(declare-fun arrayNoDuplicates!0 (array!96977 (_ BitVec 32) List!33316) Bool)

(assert (=> b!1420161 (= res!955592 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33313))))

(declare-fun res!955597 () Bool)

(assert (=> start!122612 (=> (not res!955597) (not e!803311))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122612 (= res!955597 (validMask!0 mask!2608))))

(assert (=> start!122612 e!803311))

(assert (=> start!122612 true))

(declare-fun array_inv!35834 (array!96977) Bool)

(assert (=> start!122612 (array_inv!35834 a!2831)))

(declare-fun b!1420162 () Bool)

(declare-fun res!955595 () Bool)

(assert (=> b!1420162 (=> (not res!955595) (not e!803311))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420162 (= res!955595 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46806 a!2831) j!81) mask!2608) (select (arr!46806 a!2831) j!81) a!2831 mask!2608) (Intermediate!11091 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1420163 () Bool)

(declare-fun res!955590 () Bool)

(assert (=> b!1420163 (=> (not res!955590) (not e!803311))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1420163 (= res!955590 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46806 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46806 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!96978 (store (arr!46806 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47356 a!2831)) mask!2608) (Intermediate!11091 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1420164 () Bool)

(declare-fun res!955589 () Bool)

(assert (=> b!1420164 (=> (not res!955589) (not e!803311))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96977 (_ BitVec 32)) Bool)

(assert (=> b!1420164 (= res!955589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(assert (= (and start!122612 res!955597) b!1420156))

(assert (= (and b!1420156 res!955594) b!1420157))

(assert (= (and b!1420157 res!955596) b!1420158))

(assert (= (and b!1420158 res!955591) b!1420164))

(assert (= (and b!1420164 res!955589) b!1420161))

(assert (= (and b!1420161 res!955592) b!1420160))

(assert (= (and b!1420160 res!955593) b!1420162))

(assert (= (and b!1420162 res!955595) b!1420163))

(assert (= (and b!1420163 res!955590) b!1420159))

(declare-fun m!1310655 () Bool)

(assert (=> b!1420159 m!1310655))

(assert (=> b!1420159 m!1310655))

(declare-fun m!1310657 () Bool)

(assert (=> b!1420159 m!1310657))

(declare-fun m!1310659 () Bool)

(assert (=> start!122612 m!1310659))

(declare-fun m!1310661 () Bool)

(assert (=> start!122612 m!1310661))

(declare-fun m!1310663 () Bool)

(assert (=> b!1420163 m!1310663))

(declare-fun m!1310665 () Bool)

(assert (=> b!1420163 m!1310665))

(assert (=> b!1420163 m!1310665))

(declare-fun m!1310667 () Bool)

(assert (=> b!1420163 m!1310667))

(assert (=> b!1420163 m!1310667))

(assert (=> b!1420163 m!1310665))

(declare-fun m!1310669 () Bool)

(assert (=> b!1420163 m!1310669))

(assert (=> b!1420162 m!1310655))

(assert (=> b!1420162 m!1310655))

(declare-fun m!1310671 () Bool)

(assert (=> b!1420162 m!1310671))

(assert (=> b!1420162 m!1310671))

(assert (=> b!1420162 m!1310655))

(declare-fun m!1310673 () Bool)

(assert (=> b!1420162 m!1310673))

(assert (=> b!1420158 m!1310655))

(assert (=> b!1420158 m!1310655))

(declare-fun m!1310675 () Bool)

(assert (=> b!1420158 m!1310675))

(declare-fun m!1310677 () Bool)

(assert (=> b!1420157 m!1310677))

(assert (=> b!1420157 m!1310677))

(declare-fun m!1310679 () Bool)

(assert (=> b!1420157 m!1310679))

(declare-fun m!1310681 () Bool)

(assert (=> b!1420164 m!1310681))

(declare-fun m!1310683 () Bool)

(assert (=> b!1420161 m!1310683))

(check-sat (not b!1420159) (not b!1420158) (not b!1420157) (not b!1420164) (not b!1420161) (not b!1420162) (not start!122612) (not b!1420163))
