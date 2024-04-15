; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122930 () Bool)

(assert start!122930)

(declare-fun b!1425929 () Bool)

(declare-fun res!961414 () Bool)

(declare-fun e!805511 () Bool)

(assert (=> b!1425929 (=> (not res!961414) (not e!805511))))

(declare-datatypes ((array!97248 0))(
  ( (array!97249 (arr!46942 (Array (_ BitVec 32) (_ BitVec 64))) (size!47494 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97248)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425929 (= res!961414 (validKeyInArray!0 (select (arr!46942 a!2831) j!81)))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun e!805513 () Bool)

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun b!1425930 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1425930 (= e!805513 (and (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))) (bvsle #b00000000000000000000000000000000 (size!47494 a!2831)) (bvsgt j!81 (size!47494 a!2831))))))

(declare-fun b!1425931 () Bool)

(declare-fun res!961421 () Bool)

(assert (=> b!1425931 (=> (not res!961421) (not e!805511))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1425931 (= res!961421 (and (= (size!47494 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47494 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47494 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425932 () Bool)

(declare-fun res!961413 () Bool)

(assert (=> b!1425932 (=> (not res!961413) (not e!805511))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97248 (_ BitVec 32)) Bool)

(assert (=> b!1425932 (= res!961413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425933 () Bool)

(declare-fun e!805512 () Bool)

(assert (=> b!1425933 (= e!805511 e!805512)))

(declare-fun res!961420 () Bool)

(assert (=> b!1425933 (=> (not res!961420) (not e!805512))))

(declare-datatypes ((SeekEntryResult!11248 0))(
  ( (MissingZero!11248 (index!47384 (_ BitVec 32))) (Found!11248 (index!47385 (_ BitVec 32))) (Intermediate!11248 (undefined!12060 Bool) (index!47386 (_ BitVec 32)) (x!129007 (_ BitVec 32))) (Undefined!11248) (MissingVacant!11248 (index!47387 (_ BitVec 32))) )
))
(declare-fun lt!627797 () SeekEntryResult!11248)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97248 (_ BitVec 32)) SeekEntryResult!11248)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425933 (= res!961420 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46942 a!2831) j!81) mask!2608) (select (arr!46942 a!2831) j!81) a!2831 mask!2608) lt!627797))))

(assert (=> b!1425933 (= lt!627797 (Intermediate!11248 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1425935 () Bool)

(declare-fun res!961422 () Bool)

(assert (=> b!1425935 (=> (not res!961422) (not e!805511))))

(declare-datatypes ((List!33530 0))(
  ( (Nil!33527) (Cons!33526 (h!34828 (_ BitVec 64)) (t!48216 List!33530)) )
))
(declare-fun arrayNoDuplicates!0 (array!97248 (_ BitVec 32) List!33530) Bool)

(assert (=> b!1425935 (= res!961422 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33527))))

(declare-fun b!1425936 () Bool)

(declare-fun res!961416 () Bool)

(assert (=> b!1425936 (=> (not res!961416) (not e!805511))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1425936 (= res!961416 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47494 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47494 a!2831))))))

(declare-fun b!1425937 () Bool)

(declare-fun res!961417 () Bool)

(assert (=> b!1425937 (=> (not res!961417) (not e!805513))))

(assert (=> b!1425937 (= res!961417 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46942 a!2831) j!81) a!2831 mask!2608) lt!627797))))

(declare-fun b!1425934 () Bool)

(assert (=> b!1425934 (= e!805512 e!805513)))

(declare-fun res!961415 () Bool)

(assert (=> b!1425934 (=> (not res!961415) (not e!805513))))

(declare-fun lt!627799 () (_ BitVec 64))

(declare-fun lt!627800 () SeekEntryResult!11248)

(declare-fun lt!627798 () array!97248)

(assert (=> b!1425934 (= res!961415 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627799 mask!2608) lt!627799 lt!627798 mask!2608) lt!627800))))

(assert (=> b!1425934 (= lt!627800 (Intermediate!11248 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1425934 (= lt!627799 (select (store (arr!46942 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1425934 (= lt!627798 (array!97249 (store (arr!46942 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47494 a!2831)))))

(declare-fun res!961419 () Bool)

(assert (=> start!122930 (=> (not res!961419) (not e!805511))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122930 (= res!961419 (validMask!0 mask!2608))))

(assert (=> start!122930 e!805511))

(assert (=> start!122930 true))

(declare-fun array_inv!36175 (array!97248) Bool)

(assert (=> start!122930 (array_inv!36175 a!2831)))

(declare-fun b!1425938 () Bool)

(declare-fun res!961418 () Bool)

(assert (=> b!1425938 (=> (not res!961418) (not e!805513))))

(assert (=> b!1425938 (= res!961418 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627799 lt!627798 mask!2608) lt!627800))))

(declare-fun b!1425939 () Bool)

(declare-fun res!961423 () Bool)

(assert (=> b!1425939 (=> (not res!961423) (not e!805511))))

(assert (=> b!1425939 (= res!961423 (validKeyInArray!0 (select (arr!46942 a!2831) i!982)))))

(assert (= (and start!122930 res!961419) b!1425931))

(assert (= (and b!1425931 res!961421) b!1425939))

(assert (= (and b!1425939 res!961423) b!1425929))

(assert (= (and b!1425929 res!961414) b!1425932))

(assert (= (and b!1425932 res!961413) b!1425935))

(assert (= (and b!1425935 res!961422) b!1425936))

(assert (= (and b!1425936 res!961416) b!1425933))

(assert (= (and b!1425933 res!961420) b!1425934))

(assert (= (and b!1425934 res!961415) b!1425937))

(assert (= (and b!1425937 res!961417) b!1425938))

(assert (= (and b!1425938 res!961418) b!1425930))

(declare-fun m!1316067 () Bool)

(assert (=> b!1425933 m!1316067))

(assert (=> b!1425933 m!1316067))

(declare-fun m!1316069 () Bool)

(assert (=> b!1425933 m!1316069))

(assert (=> b!1425933 m!1316069))

(assert (=> b!1425933 m!1316067))

(declare-fun m!1316071 () Bool)

(assert (=> b!1425933 m!1316071))

(declare-fun m!1316073 () Bool)

(assert (=> b!1425939 m!1316073))

(assert (=> b!1425939 m!1316073))

(declare-fun m!1316075 () Bool)

(assert (=> b!1425939 m!1316075))

(declare-fun m!1316077 () Bool)

(assert (=> b!1425938 m!1316077))

(assert (=> b!1425929 m!1316067))

(assert (=> b!1425929 m!1316067))

(declare-fun m!1316079 () Bool)

(assert (=> b!1425929 m!1316079))

(declare-fun m!1316081 () Bool)

(assert (=> start!122930 m!1316081))

(declare-fun m!1316083 () Bool)

(assert (=> start!122930 m!1316083))

(assert (=> b!1425937 m!1316067))

(assert (=> b!1425937 m!1316067))

(declare-fun m!1316085 () Bool)

(assert (=> b!1425937 m!1316085))

(declare-fun m!1316087 () Bool)

(assert (=> b!1425934 m!1316087))

(assert (=> b!1425934 m!1316087))

(declare-fun m!1316089 () Bool)

(assert (=> b!1425934 m!1316089))

(declare-fun m!1316091 () Bool)

(assert (=> b!1425934 m!1316091))

(declare-fun m!1316093 () Bool)

(assert (=> b!1425934 m!1316093))

(declare-fun m!1316095 () Bool)

(assert (=> b!1425932 m!1316095))

(declare-fun m!1316097 () Bool)

(assert (=> b!1425935 m!1316097))

(check-sat (not b!1425934) (not b!1425938) (not b!1425935) (not b!1425937) (not b!1425939) (not start!122930) (not b!1425932) (not b!1425929) (not b!1425933))
(check-sat)
