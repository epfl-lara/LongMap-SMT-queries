; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122926 () Bool)

(assert start!122926)

(declare-fun b!1425879 () Bool)

(declare-fun e!805505 () Bool)

(declare-fun e!805504 () Bool)

(assert (=> b!1425879 (= e!805505 e!805504)))

(declare-fun res!961321 () Bool)

(assert (=> b!1425879 (=> (not res!961321) (not e!805504))))

(declare-datatypes ((SeekEntryResult!11242 0))(
  ( (MissingZero!11242 (index!47360 (_ BitVec 32))) (Found!11242 (index!47361 (_ BitVec 32))) (Intermediate!11242 (undefined!12054 Bool) (index!47362 (_ BitVec 32)) (x!128988 (_ BitVec 32))) (Undefined!11242) (MissingVacant!11242 (index!47363 (_ BitVec 32))) )
))
(declare-fun lt!627939 () SeekEntryResult!11242)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97291 0))(
  ( (array!97292 (arr!46963 (Array (_ BitVec 32) (_ BitVec 64))) (size!47513 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97291)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97291 (_ BitVec 32)) SeekEntryResult!11242)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425879 (= res!961321 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46963 a!2831) j!81) mask!2608) (select (arr!46963 a!2831) j!81) a!2831 mask!2608) lt!627939))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1425879 (= lt!627939 (Intermediate!11242 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1425880 () Bool)

(declare-fun e!805503 () Bool)

(assert (=> b!1425880 (= e!805503 false)))

(declare-fun lt!627941 () SeekEntryResult!11242)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun lt!627940 () array!97291)

(declare-fun lt!627942 () (_ BitVec 64))

(assert (=> b!1425880 (= lt!627941 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627942 lt!627940 mask!2608))))

(declare-fun b!1425881 () Bool)

(declare-fun res!961315 () Bool)

(assert (=> b!1425881 (=> (not res!961315) (not e!805503))))

(assert (=> b!1425881 (= res!961315 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46963 a!2831) j!81) a!2831 mask!2608) lt!627939))))

(declare-fun b!1425882 () Bool)

(declare-fun res!961312 () Bool)

(assert (=> b!1425882 (=> (not res!961312) (not e!805505))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425882 (= res!961312 (validKeyInArray!0 (select (arr!46963 a!2831) j!81)))))

(declare-fun b!1425883 () Bool)

(declare-fun res!961317 () Bool)

(assert (=> b!1425883 (=> (not res!961317) (not e!805505))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1425883 (= res!961317 (validKeyInArray!0 (select (arr!46963 a!2831) i!982)))))

(declare-fun res!961313 () Bool)

(assert (=> start!122926 (=> (not res!961313) (not e!805505))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122926 (= res!961313 (validMask!0 mask!2608))))

(assert (=> start!122926 e!805505))

(assert (=> start!122926 true))

(declare-fun array_inv!35991 (array!97291) Bool)

(assert (=> start!122926 (array_inv!35991 a!2831)))

(declare-fun b!1425884 () Bool)

(declare-fun res!961316 () Bool)

(assert (=> b!1425884 (=> (not res!961316) (not e!805505))))

(assert (=> b!1425884 (= res!961316 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47513 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47513 a!2831))))))

(declare-fun b!1425885 () Bool)

(declare-fun res!961314 () Bool)

(assert (=> b!1425885 (=> (not res!961314) (not e!805505))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97291 (_ BitVec 32)) Bool)

(assert (=> b!1425885 (= res!961314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425886 () Bool)

(assert (=> b!1425886 (= e!805504 e!805503)))

(declare-fun res!961318 () Bool)

(assert (=> b!1425886 (=> (not res!961318) (not e!805503))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1425886 (= res!961318 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627942 mask!2608) lt!627942 lt!627940 mask!2608) (Intermediate!11242 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(assert (=> b!1425886 (= lt!627942 (select (store (arr!46963 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1425886 (= lt!627940 (array!97292 (store (arr!46963 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47513 a!2831)))))

(declare-fun b!1425887 () Bool)

(declare-fun res!961320 () Bool)

(assert (=> b!1425887 (=> (not res!961320) (not e!805505))))

(assert (=> b!1425887 (= res!961320 (and (= (size!47513 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47513 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47513 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425888 () Bool)

(declare-fun res!961319 () Bool)

(assert (=> b!1425888 (=> (not res!961319) (not e!805505))))

(declare-datatypes ((List!33473 0))(
  ( (Nil!33470) (Cons!33469 (h!34771 (_ BitVec 64)) (t!48167 List!33473)) )
))
(declare-fun arrayNoDuplicates!0 (array!97291 (_ BitVec 32) List!33473) Bool)

(assert (=> b!1425888 (= res!961319 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33470))))

(assert (= (and start!122926 res!961313) b!1425887))

(assert (= (and b!1425887 res!961320) b!1425883))

(assert (= (and b!1425883 res!961317) b!1425882))

(assert (= (and b!1425882 res!961312) b!1425885))

(assert (= (and b!1425885 res!961314) b!1425888))

(assert (= (and b!1425888 res!961319) b!1425884))

(assert (= (and b!1425884 res!961316) b!1425879))

(assert (= (and b!1425879 res!961321) b!1425886))

(assert (= (and b!1425886 res!961318) b!1425881))

(assert (= (and b!1425881 res!961315) b!1425880))

(declare-fun m!1316491 () Bool)

(assert (=> b!1425880 m!1316491))

(declare-fun m!1316493 () Bool)

(assert (=> b!1425881 m!1316493))

(assert (=> b!1425881 m!1316493))

(declare-fun m!1316495 () Bool)

(assert (=> b!1425881 m!1316495))

(declare-fun m!1316497 () Bool)

(assert (=> b!1425886 m!1316497))

(assert (=> b!1425886 m!1316497))

(declare-fun m!1316499 () Bool)

(assert (=> b!1425886 m!1316499))

(declare-fun m!1316501 () Bool)

(assert (=> b!1425886 m!1316501))

(declare-fun m!1316503 () Bool)

(assert (=> b!1425886 m!1316503))

(declare-fun m!1316505 () Bool)

(assert (=> b!1425888 m!1316505))

(declare-fun m!1316507 () Bool)

(assert (=> b!1425885 m!1316507))

(assert (=> b!1425882 m!1316493))

(assert (=> b!1425882 m!1316493))

(declare-fun m!1316509 () Bool)

(assert (=> b!1425882 m!1316509))

(assert (=> b!1425879 m!1316493))

(assert (=> b!1425879 m!1316493))

(declare-fun m!1316511 () Bool)

(assert (=> b!1425879 m!1316511))

(assert (=> b!1425879 m!1316511))

(assert (=> b!1425879 m!1316493))

(declare-fun m!1316513 () Bool)

(assert (=> b!1425879 m!1316513))

(declare-fun m!1316515 () Bool)

(assert (=> start!122926 m!1316515))

(declare-fun m!1316517 () Bool)

(assert (=> start!122926 m!1316517))

(declare-fun m!1316519 () Bool)

(assert (=> b!1425883 m!1316519))

(assert (=> b!1425883 m!1316519))

(declare-fun m!1316521 () Bool)

(assert (=> b!1425883 m!1316521))

(push 1)

(assert (not start!122926))

(assert (not b!1425885))

(assert (not b!1425883))

(assert (not b!1425886))

(assert (not b!1425882))

(assert (not b!1425880))

(assert (not b!1425879))

(assert (not b!1425888))

(assert (not b!1425881))

