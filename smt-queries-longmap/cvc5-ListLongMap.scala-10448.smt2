; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122850 () Bool)

(assert start!122850)

(declare-fun b!1424883 () Bool)

(declare-fun res!960367 () Bool)

(declare-fun e!805196 () Bool)

(assert (=> b!1424883 (=> (not res!960367) (not e!805196))))

(declare-datatypes ((array!97168 0))(
  ( (array!97169 (arr!46902 (Array (_ BitVec 32) (_ BitVec 64))) (size!47454 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97168)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1424883 (= res!960367 (validKeyInArray!0 (select (arr!46902 a!2831) i!982)))))

(declare-fun b!1424884 () Bool)

(declare-fun res!960371 () Bool)

(assert (=> b!1424884 (=> (not res!960371) (not e!805196))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97168 (_ BitVec 32)) Bool)

(assert (=> b!1424884 (= res!960371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1424886 () Bool)

(declare-fun res!960368 () Bool)

(assert (=> b!1424886 (=> (not res!960368) (not e!805196))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1424886 (= res!960368 (and (= (size!47454 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47454 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47454 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1424887 () Bool)

(declare-fun res!960372 () Bool)

(assert (=> b!1424887 (=> (not res!960372) (not e!805196))))

(assert (=> b!1424887 (= res!960372 (validKeyInArray!0 (select (arr!46902 a!2831) j!81)))))

(declare-fun b!1424888 () Bool)

(declare-fun res!960370 () Bool)

(assert (=> b!1424888 (=> (not res!960370) (not e!805196))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1424888 (= res!960370 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47454 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47454 a!2831))))))

(declare-fun b!1424889 () Bool)

(assert (=> b!1424889 (= e!805196 false)))

(declare-fun lt!627563 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424889 (= lt!627563 (toIndex!0 (select (arr!46902 a!2831) j!81) mask!2608))))

(declare-fun res!960369 () Bool)

(assert (=> start!122850 (=> (not res!960369) (not e!805196))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122850 (= res!960369 (validMask!0 mask!2608))))

(assert (=> start!122850 e!805196))

(assert (=> start!122850 true))

(declare-fun array_inv!36135 (array!97168) Bool)

(assert (=> start!122850 (array_inv!36135 a!2831)))

(declare-fun b!1424885 () Bool)

(declare-fun res!960373 () Bool)

(assert (=> b!1424885 (=> (not res!960373) (not e!805196))))

(declare-datatypes ((List!33490 0))(
  ( (Nil!33487) (Cons!33486 (h!34788 (_ BitVec 64)) (t!48176 List!33490)) )
))
(declare-fun arrayNoDuplicates!0 (array!97168 (_ BitVec 32) List!33490) Bool)

(assert (=> b!1424885 (= res!960373 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33487))))

(assert (= (and start!122850 res!960369) b!1424886))

(assert (= (and b!1424886 res!960368) b!1424883))

(assert (= (and b!1424883 res!960367) b!1424887))

(assert (= (and b!1424887 res!960372) b!1424884))

(assert (= (and b!1424884 res!960371) b!1424885))

(assert (= (and b!1424885 res!960373) b!1424888))

(assert (= (and b!1424888 res!960370) b!1424889))

(declare-fun m!1314975 () Bool)

(assert (=> b!1424884 m!1314975))

(declare-fun m!1314977 () Bool)

(assert (=> b!1424885 m!1314977))

(declare-fun m!1314979 () Bool)

(assert (=> b!1424887 m!1314979))

(assert (=> b!1424887 m!1314979))

(declare-fun m!1314981 () Bool)

(assert (=> b!1424887 m!1314981))

(assert (=> b!1424889 m!1314979))

(assert (=> b!1424889 m!1314979))

(declare-fun m!1314983 () Bool)

(assert (=> b!1424889 m!1314983))

(declare-fun m!1314985 () Bool)

(assert (=> b!1424883 m!1314985))

(assert (=> b!1424883 m!1314985))

(declare-fun m!1314987 () Bool)

(assert (=> b!1424883 m!1314987))

(declare-fun m!1314989 () Bool)

(assert (=> start!122850 m!1314989))

(declare-fun m!1314991 () Bool)

(assert (=> start!122850 m!1314991))

(push 1)

(assert (not b!1424889))

(assert (not b!1424883))

(assert (not b!1424885))

(assert (not b!1424887))

(assert (not start!122850))

(assert (not b!1424884))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

