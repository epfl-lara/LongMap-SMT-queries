; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122718 () Bool)

(assert start!122718)

(declare-fun b!1421892 () Bool)

(declare-fun e!803908 () Bool)

(declare-fun e!803907 () Bool)

(assert (=> b!1421892 (= e!803908 e!803907)))

(declare-fun res!957336 () Bool)

(assert (=> b!1421892 (=> (not res!957336) (not e!803907))))

(declare-datatypes ((SeekEntryResult!11144 0))(
  ( (MissingZero!11144 (index!46968 (_ BitVec 32))) (Found!11144 (index!46969 (_ BitVec 32))) (Intermediate!11144 (undefined!11956 Bool) (index!46970 (_ BitVec 32)) (x!128618 (_ BitVec 32))) (Undefined!11144) (MissingVacant!11144 (index!46971 (_ BitVec 32))) )
))
(declare-fun lt!626442 () SeekEntryResult!11144)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97083 0))(
  ( (array!97084 (arr!46859 (Array (_ BitVec 32) (_ BitVec 64))) (size!47409 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97083)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97083 (_ BitVec 32)) SeekEntryResult!11144)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421892 (= res!957336 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46859 a!2831) j!81) mask!2608) (select (arr!46859 a!2831) j!81) a!2831 mask!2608) lt!626442))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1421892 (= lt!626442 (Intermediate!11144 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1421893 () Bool)

(declare-fun e!803906 () Bool)

(assert (=> b!1421893 (= e!803906 (not true))))

(declare-fun e!803909 () Bool)

(assert (=> b!1421893 e!803909))

(declare-fun res!957332 () Bool)

(assert (=> b!1421893 (=> (not res!957332) (not e!803909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97083 (_ BitVec 32)) Bool)

(assert (=> b!1421893 (= res!957332 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48124 0))(
  ( (Unit!48125) )
))
(declare-fun lt!626445 () Unit!48124)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97083 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48124)

(assert (=> b!1421893 (= lt!626445 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1421894 () Bool)

(declare-fun res!957337 () Bool)

(assert (=> b!1421894 (=> (not res!957337) (not e!803908))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1421894 (= res!957337 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47409 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47409 a!2831))))))

(declare-fun b!1421895 () Bool)

(declare-fun res!957325 () Bool)

(assert (=> b!1421895 (=> (not res!957325) (not e!803908))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421895 (= res!957325 (validKeyInArray!0 (select (arr!46859 a!2831) j!81)))))

(declare-fun b!1421896 () Bool)

(declare-fun res!957333 () Bool)

(assert (=> b!1421896 (=> (not res!957333) (not e!803908))))

(assert (=> b!1421896 (= res!957333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1421897 () Bool)

(declare-fun res!957334 () Bool)

(assert (=> b!1421897 (=> (not res!957334) (not e!803906))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1421897 (= res!957334 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1421898 () Bool)

(declare-fun res!957329 () Bool)

(assert (=> b!1421898 (=> (not res!957329) (not e!803906))))

(declare-fun lt!626441 () (_ BitVec 64))

(declare-fun lt!626443 () array!97083)

(declare-fun lt!626444 () SeekEntryResult!11144)

(assert (=> b!1421898 (= res!957329 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626441 lt!626443 mask!2608) lt!626444))))

(declare-fun res!957335 () Bool)

(assert (=> start!122718 (=> (not res!957335) (not e!803908))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122718 (= res!957335 (validMask!0 mask!2608))))

(assert (=> start!122718 e!803908))

(assert (=> start!122718 true))

(declare-fun array_inv!35887 (array!97083) Bool)

(assert (=> start!122718 (array_inv!35887 a!2831)))

(declare-fun b!1421899 () Bool)

(declare-fun res!957327 () Bool)

(assert (=> b!1421899 (=> (not res!957327) (not e!803908))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1421899 (= res!957327 (validKeyInArray!0 (select (arr!46859 a!2831) i!982)))))

(declare-fun b!1421900 () Bool)

(assert (=> b!1421900 (= e!803907 e!803906)))

(declare-fun res!957326 () Bool)

(assert (=> b!1421900 (=> (not res!957326) (not e!803906))))

(assert (=> b!1421900 (= res!957326 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626441 mask!2608) lt!626441 lt!626443 mask!2608) lt!626444))))

(assert (=> b!1421900 (= lt!626444 (Intermediate!11144 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1421900 (= lt!626441 (select (store (arr!46859 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1421900 (= lt!626443 (array!97084 (store (arr!46859 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47409 a!2831)))))

(declare-fun b!1421901 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97083 (_ BitVec 32)) SeekEntryResult!11144)

(assert (=> b!1421901 (= e!803909 (= (seekEntryOrOpen!0 (select (arr!46859 a!2831) j!81) a!2831 mask!2608) (Found!11144 j!81)))))

(declare-fun b!1421902 () Bool)

(declare-fun res!957331 () Bool)

(assert (=> b!1421902 (=> (not res!957331) (not e!803908))))

(assert (=> b!1421902 (= res!957331 (and (= (size!47409 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47409 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47409 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1421903 () Bool)

(declare-fun res!957328 () Bool)

(assert (=> b!1421903 (=> (not res!957328) (not e!803908))))

(declare-datatypes ((List!33369 0))(
  ( (Nil!33366) (Cons!33365 (h!34667 (_ BitVec 64)) (t!48063 List!33369)) )
))
(declare-fun arrayNoDuplicates!0 (array!97083 (_ BitVec 32) List!33369) Bool)

(assert (=> b!1421903 (= res!957328 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33366))))

(declare-fun b!1421904 () Bool)

(declare-fun res!957330 () Bool)

(assert (=> b!1421904 (=> (not res!957330) (not e!803906))))

(assert (=> b!1421904 (= res!957330 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46859 a!2831) j!81) a!2831 mask!2608) lt!626442))))

(assert (= (and start!122718 res!957335) b!1421902))

(assert (= (and b!1421902 res!957331) b!1421899))

(assert (= (and b!1421899 res!957327) b!1421895))

(assert (= (and b!1421895 res!957325) b!1421896))

(assert (= (and b!1421896 res!957333) b!1421903))

(assert (= (and b!1421903 res!957328) b!1421894))

(assert (= (and b!1421894 res!957337) b!1421892))

(assert (= (and b!1421892 res!957336) b!1421900))

(assert (= (and b!1421900 res!957326) b!1421904))

(assert (= (and b!1421904 res!957330) b!1421898))

(assert (= (and b!1421898 res!957329) b!1421897))

(assert (= (and b!1421897 res!957334) b!1421893))

(assert (= (and b!1421893 res!957332) b!1421901))

(declare-fun m!1312449 () Bool)

(assert (=> b!1421895 m!1312449))

(assert (=> b!1421895 m!1312449))

(declare-fun m!1312451 () Bool)

(assert (=> b!1421895 m!1312451))

(assert (=> b!1421901 m!1312449))

(assert (=> b!1421901 m!1312449))

(declare-fun m!1312453 () Bool)

(assert (=> b!1421901 m!1312453))

(declare-fun m!1312455 () Bool)

(assert (=> b!1421903 m!1312455))

(assert (=> b!1421892 m!1312449))

(assert (=> b!1421892 m!1312449))

(declare-fun m!1312457 () Bool)

(assert (=> b!1421892 m!1312457))

(assert (=> b!1421892 m!1312457))

(assert (=> b!1421892 m!1312449))

(declare-fun m!1312459 () Bool)

(assert (=> b!1421892 m!1312459))

(declare-fun m!1312461 () Bool)

(assert (=> start!122718 m!1312461))

(declare-fun m!1312463 () Bool)

(assert (=> start!122718 m!1312463))

(declare-fun m!1312465 () Bool)

(assert (=> b!1421898 m!1312465))

(assert (=> b!1421904 m!1312449))

(assert (=> b!1421904 m!1312449))

(declare-fun m!1312467 () Bool)

(assert (=> b!1421904 m!1312467))

(declare-fun m!1312469 () Bool)

(assert (=> b!1421896 m!1312469))

(declare-fun m!1312471 () Bool)

(assert (=> b!1421899 m!1312471))

(assert (=> b!1421899 m!1312471))

(declare-fun m!1312473 () Bool)

(assert (=> b!1421899 m!1312473))

(declare-fun m!1312475 () Bool)

(assert (=> b!1421893 m!1312475))

(declare-fun m!1312477 () Bool)

(assert (=> b!1421893 m!1312477))

(declare-fun m!1312479 () Bool)

(assert (=> b!1421900 m!1312479))

(assert (=> b!1421900 m!1312479))

(declare-fun m!1312481 () Bool)

(assert (=> b!1421900 m!1312481))

(declare-fun m!1312483 () Bool)

(assert (=> b!1421900 m!1312483))

(declare-fun m!1312485 () Bool)

(assert (=> b!1421900 m!1312485))

(push 1)

