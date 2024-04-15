; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122660 () Bool)

(assert start!122660)

(declare-fun b!1420842 () Bool)

(declare-fun res!956335 () Bool)

(declare-fun e!803514 () Bool)

(assert (=> b!1420842 (=> (not res!956335) (not e!803514))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!96978 0))(
  ( (array!96979 (arr!46807 (Array (_ BitVec 32) (_ BitVec 64))) (size!47359 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96978)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1420842 (= res!956335 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47359 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47359 a!2831))))))

(declare-fun b!1420843 () Bool)

(declare-fun e!803515 () Bool)

(assert (=> b!1420843 (= e!803514 e!803515)))

(declare-fun res!956334 () Bool)

(assert (=> b!1420843 (=> (not res!956334) (not e!803515))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11119 0))(
  ( (MissingZero!11119 (index!46868 (_ BitVec 32))) (Found!11119 (index!46869 (_ BitVec 32))) (Intermediate!11119 (undefined!11931 Bool) (index!46870 (_ BitVec 32)) (x!128518 (_ BitVec 32))) (Undefined!11119) (MissingVacant!11119 (index!46871 (_ BitVec 32))) )
))
(declare-fun lt!625865 () SeekEntryResult!11119)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96978 (_ BitVec 32)) SeekEntryResult!11119)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420843 (= res!956334 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46807 a!2831) j!81) mask!2608) (select (arr!46807 a!2831) j!81) a!2831 mask!2608) lt!625865))))

(assert (=> b!1420843 (= lt!625865 (Intermediate!11119 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1420844 () Bool)

(declare-fun res!956327 () Bool)

(assert (=> b!1420844 (=> (not res!956327) (not e!803514))))

(declare-datatypes ((List!33395 0))(
  ( (Nil!33392) (Cons!33391 (h!34693 (_ BitVec 64)) (t!48081 List!33395)) )
))
(declare-fun arrayNoDuplicates!0 (array!96978 (_ BitVec 32) List!33395) Bool)

(assert (=> b!1420844 (= res!956327 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33392))))

(declare-fun b!1420845 () Bool)

(declare-fun res!956332 () Bool)

(assert (=> b!1420845 (=> (not res!956332) (not e!803514))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420845 (= res!956332 (validKeyInArray!0 (select (arr!46807 a!2831) i!982)))))

(declare-fun b!1420846 () Bool)

(declare-fun res!956326 () Bool)

(assert (=> b!1420846 (=> (not res!956326) (not e!803514))))

(assert (=> b!1420846 (= res!956326 (and (= (size!47359 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47359 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47359 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!956331 () Bool)

(assert (=> start!122660 (=> (not res!956331) (not e!803514))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122660 (= res!956331 (validMask!0 mask!2608))))

(assert (=> start!122660 e!803514))

(assert (=> start!122660 true))

(declare-fun array_inv!36040 (array!96978) Bool)

(assert (=> start!122660 (array_inv!36040 a!2831)))

(declare-fun b!1420847 () Bool)

(declare-fun e!803516 () Bool)

(assert (=> b!1420847 (= e!803515 e!803516)))

(declare-fun res!956328 () Bool)

(assert (=> b!1420847 (=> (not res!956328) (not e!803516))))

(declare-fun lt!625864 () array!96978)

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun lt!625862 () (_ BitVec 64))

(assert (=> b!1420847 (= res!956328 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!625862 mask!2608) lt!625862 lt!625864 mask!2608) (Intermediate!11119 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(assert (=> b!1420847 (= lt!625862 (select (store (arr!46807 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1420847 (= lt!625864 (array!96979 (store (arr!46807 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47359 a!2831)))))

(declare-fun b!1420848 () Bool)

(declare-fun res!956333 () Bool)

(assert (=> b!1420848 (=> (not res!956333) (not e!803516))))

(assert (=> b!1420848 (= res!956333 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46807 a!2831) j!81) a!2831 mask!2608) lt!625865))))

(declare-fun b!1420849 () Bool)

(assert (=> b!1420849 (= e!803516 false)))

(declare-fun lt!625863 () SeekEntryResult!11119)

(assert (=> b!1420849 (= lt!625863 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!625862 lt!625864 mask!2608))))

(declare-fun b!1420850 () Bool)

(declare-fun res!956329 () Bool)

(assert (=> b!1420850 (=> (not res!956329) (not e!803514))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96978 (_ BitVec 32)) Bool)

(assert (=> b!1420850 (= res!956329 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1420851 () Bool)

(declare-fun res!956330 () Bool)

(assert (=> b!1420851 (=> (not res!956330) (not e!803514))))

(assert (=> b!1420851 (= res!956330 (validKeyInArray!0 (select (arr!46807 a!2831) j!81)))))

(assert (= (and start!122660 res!956331) b!1420846))

(assert (= (and b!1420846 res!956326) b!1420845))

(assert (= (and b!1420845 res!956332) b!1420851))

(assert (= (and b!1420851 res!956330) b!1420850))

(assert (= (and b!1420850 res!956329) b!1420844))

(assert (= (and b!1420844 res!956327) b!1420842))

(assert (= (and b!1420842 res!956335) b!1420843))

(assert (= (and b!1420843 res!956334) b!1420847))

(assert (= (and b!1420847 res!956328) b!1420848))

(assert (= (and b!1420848 res!956333) b!1420849))

(declare-fun m!1310907 () Bool)

(assert (=> b!1420851 m!1310907))

(assert (=> b!1420851 m!1310907))

(declare-fun m!1310909 () Bool)

(assert (=> b!1420851 m!1310909))

(assert (=> b!1420843 m!1310907))

(assert (=> b!1420843 m!1310907))

(declare-fun m!1310911 () Bool)

(assert (=> b!1420843 m!1310911))

(assert (=> b!1420843 m!1310911))

(assert (=> b!1420843 m!1310907))

(declare-fun m!1310913 () Bool)

(assert (=> b!1420843 m!1310913))

(declare-fun m!1310915 () Bool)

(assert (=> b!1420847 m!1310915))

(assert (=> b!1420847 m!1310915))

(declare-fun m!1310917 () Bool)

(assert (=> b!1420847 m!1310917))

(declare-fun m!1310919 () Bool)

(assert (=> b!1420847 m!1310919))

(declare-fun m!1310921 () Bool)

(assert (=> b!1420847 m!1310921))

(declare-fun m!1310923 () Bool)

(assert (=> b!1420849 m!1310923))

(declare-fun m!1310925 () Bool)

(assert (=> b!1420845 m!1310925))

(assert (=> b!1420845 m!1310925))

(declare-fun m!1310927 () Bool)

(assert (=> b!1420845 m!1310927))

(declare-fun m!1310929 () Bool)

(assert (=> b!1420844 m!1310929))

(assert (=> b!1420848 m!1310907))

(assert (=> b!1420848 m!1310907))

(declare-fun m!1310931 () Bool)

(assert (=> b!1420848 m!1310931))

(declare-fun m!1310933 () Bool)

(assert (=> start!122660 m!1310933))

(declare-fun m!1310935 () Bool)

(assert (=> start!122660 m!1310935))

(declare-fun m!1310937 () Bool)

(assert (=> b!1420850 m!1310937))

(check-sat (not b!1420850) (not b!1420844) (not start!122660) (not b!1420848) (not b!1420843) (not b!1420847) (not b!1420849) (not b!1420845) (not b!1420851))
(check-sat)
