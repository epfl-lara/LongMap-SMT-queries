; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122596 () Bool)

(assert start!122596)

(declare-fun b!1419926 () Bool)

(declare-fun res!955415 () Bool)

(declare-fun e!803237 () Bool)

(assert (=> b!1419926 (=> (not res!955415) (not e!803237))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!96914 0))(
  ( (array!96915 (arr!46775 (Array (_ BitVec 32) (_ BitVec 64))) (size!47327 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96914)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1419926 (= res!955415 (and (= (size!47327 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47327 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47327 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1419927 () Bool)

(declare-fun res!955410 () Bool)

(assert (=> b!1419927 (=> (not res!955410) (not e!803237))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96914 (_ BitVec 32)) Bool)

(assert (=> b!1419927 (= res!955410 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1419928 () Bool)

(declare-fun res!955416 () Bool)

(assert (=> b!1419928 (=> (not res!955416) (not e!803237))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419928 (= res!955416 (validKeyInArray!0 (select (arr!46775 a!2831) i!982)))))

(declare-fun b!1419929 () Bool)

(assert (=> b!1419929 (= e!803237 false)))

(declare-datatypes ((SeekEntryResult!11087 0))(
  ( (MissingZero!11087 (index!46740 (_ BitVec 32))) (Found!11087 (index!46741 (_ BitVec 32))) (Intermediate!11087 (undefined!11899 Bool) (index!46742 (_ BitVec 32)) (x!128398 (_ BitVec 32))) (Undefined!11087) (MissingVacant!11087 (index!46743 (_ BitVec 32))) )
))
(declare-fun lt!625679 () SeekEntryResult!11087)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96914 (_ BitVec 32)) SeekEntryResult!11087)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419929 (= lt!625679 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46775 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46775 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!96915 (store (arr!46775 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47327 a!2831)) mask!2608))))

(declare-fun b!1419931 () Bool)

(declare-fun res!955414 () Bool)

(assert (=> b!1419931 (=> (not res!955414) (not e!803237))))

(assert (=> b!1419931 (= res!955414 (validKeyInArray!0 (select (arr!46775 a!2831) j!81)))))

(declare-fun b!1419932 () Bool)

(declare-fun res!955411 () Bool)

(assert (=> b!1419932 (=> (not res!955411) (not e!803237))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1419932 (= res!955411 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47327 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47327 a!2831))))))

(declare-fun b!1419933 () Bool)

(declare-fun res!955413 () Bool)

(assert (=> b!1419933 (=> (not res!955413) (not e!803237))))

(declare-datatypes ((List!33363 0))(
  ( (Nil!33360) (Cons!33359 (h!34661 (_ BitVec 64)) (t!48049 List!33363)) )
))
(declare-fun arrayNoDuplicates!0 (array!96914 (_ BitVec 32) List!33363) Bool)

(assert (=> b!1419933 (= res!955413 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33360))))

(declare-fun res!955417 () Bool)

(assert (=> start!122596 (=> (not res!955417) (not e!803237))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122596 (= res!955417 (validMask!0 mask!2608))))

(assert (=> start!122596 e!803237))

(assert (=> start!122596 true))

(declare-fun array_inv!36008 (array!96914) Bool)

(assert (=> start!122596 (array_inv!36008 a!2831)))

(declare-fun b!1419930 () Bool)

(declare-fun res!955412 () Bool)

(assert (=> b!1419930 (=> (not res!955412) (not e!803237))))

(assert (=> b!1419930 (= res!955412 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46775 a!2831) j!81) mask!2608) (select (arr!46775 a!2831) j!81) a!2831 mask!2608) (Intermediate!11087 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(assert (= (and start!122596 res!955417) b!1419926))

(assert (= (and b!1419926 res!955415) b!1419928))

(assert (= (and b!1419928 res!955416) b!1419931))

(assert (= (and b!1419931 res!955414) b!1419927))

(assert (= (and b!1419927 res!955410) b!1419933))

(assert (= (and b!1419933 res!955413) b!1419932))

(assert (= (and b!1419932 res!955411) b!1419930))

(assert (= (and b!1419930 res!955412) b!1419929))

(declare-fun m!1309933 () Bool)

(assert (=> b!1419927 m!1309933))

(declare-fun m!1309935 () Bool)

(assert (=> b!1419931 m!1309935))

(assert (=> b!1419931 m!1309935))

(declare-fun m!1309937 () Bool)

(assert (=> b!1419931 m!1309937))

(assert (=> b!1419930 m!1309935))

(assert (=> b!1419930 m!1309935))

(declare-fun m!1309939 () Bool)

(assert (=> b!1419930 m!1309939))

(assert (=> b!1419930 m!1309939))

(assert (=> b!1419930 m!1309935))

(declare-fun m!1309941 () Bool)

(assert (=> b!1419930 m!1309941))

(declare-fun m!1309943 () Bool)

(assert (=> start!122596 m!1309943))

(declare-fun m!1309945 () Bool)

(assert (=> start!122596 m!1309945))

(declare-fun m!1309947 () Bool)

(assert (=> b!1419933 m!1309947))

(declare-fun m!1309949 () Bool)

(assert (=> b!1419929 m!1309949))

(declare-fun m!1309951 () Bool)

(assert (=> b!1419929 m!1309951))

(assert (=> b!1419929 m!1309951))

(declare-fun m!1309953 () Bool)

(assert (=> b!1419929 m!1309953))

(assert (=> b!1419929 m!1309953))

(assert (=> b!1419929 m!1309951))

(declare-fun m!1309955 () Bool)

(assert (=> b!1419929 m!1309955))

(declare-fun m!1309957 () Bool)

(assert (=> b!1419928 m!1309957))

(assert (=> b!1419928 m!1309957))

(declare-fun m!1309959 () Bool)

(assert (=> b!1419928 m!1309959))

(push 1)

(assert (not b!1419928))

(assert (not b!1419929))

(assert (not b!1419927))

(assert (not start!122596))

(assert (not b!1419933))

(assert (not b!1419930))

(assert (not b!1419931))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

