; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122640 () Bool)

(assert start!122640)

(declare-fun b!1420556 () Bool)

(declare-fun res!955993 () Bool)

(declare-fun e!803416 () Bool)

(assert (=> b!1420556 (=> (not res!955993) (not e!803416))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97005 0))(
  ( (array!97006 (arr!46820 (Array (_ BitVec 32) (_ BitVec 64))) (size!47370 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97005)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1420556 (= res!955993 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47370 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47370 a!2831))))))

(declare-fun b!1420557 () Bool)

(declare-fun res!955994 () Bool)

(assert (=> b!1420557 (=> (not res!955994) (not e!803416))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1420557 (= res!955994 (and (= (size!47370 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47370 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47370 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420558 () Bool)

(declare-fun res!955992 () Bool)

(declare-fun e!803417 () Bool)

(assert (=> b!1420558 (=> (not res!955992) (not e!803417))))

(assert (=> b!1420558 (= res!955992 (and (bvsge mask!2608 #b00000000000000000000000000000000) (bvslt index!585 (bvadd #b00000000000000000000000000000001 mask!2608))))))

(declare-fun b!1420559 () Bool)

(declare-fun res!955995 () Bool)

(assert (=> b!1420559 (=> (not res!955995) (not e!803417))))

(declare-datatypes ((SeekEntryResult!11105 0))(
  ( (MissingZero!11105 (index!46812 (_ BitVec 32))) (Found!11105 (index!46813 (_ BitVec 32))) (Intermediate!11105 (undefined!11917 Bool) (index!46814 (_ BitVec 32)) (x!128475 (_ BitVec 32))) (Undefined!11105) (MissingVacant!11105 (index!46815 (_ BitVec 32))) )
))
(declare-fun lt!625929 () SeekEntryResult!11105)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97005 (_ BitVec 32)) SeekEntryResult!11105)

(assert (=> b!1420559 (= res!955995 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46820 a!2831) j!81) a!2831 mask!2608) lt!625929))))

(declare-fun res!955996 () Bool)

(assert (=> start!122640 (=> (not res!955996) (not e!803416))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122640 (= res!955996 (validMask!0 mask!2608))))

(assert (=> start!122640 e!803416))

(assert (=> start!122640 true))

(declare-fun array_inv!35848 (array!97005) Bool)

(assert (=> start!122640 (array_inv!35848 a!2831)))

(declare-fun b!1420560 () Bool)

(declare-fun res!955998 () Bool)

(assert (=> b!1420560 (=> (not res!955998) (not e!803416))))

(declare-datatypes ((List!33330 0))(
  ( (Nil!33327) (Cons!33326 (h!34628 (_ BitVec 64)) (t!48024 List!33330)) )
))
(declare-fun arrayNoDuplicates!0 (array!97005 (_ BitVec 32) List!33330) Bool)

(assert (=> b!1420560 (= res!955998 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33327))))

(declare-fun b!1420561 () Bool)

(declare-fun res!955991 () Bool)

(assert (=> b!1420561 (=> (not res!955991) (not e!803416))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420561 (= res!955991 (validKeyInArray!0 (select (arr!46820 a!2831) i!982)))))

(declare-fun b!1420562 () Bool)

(assert (=> b!1420562 (= e!803417 (not (validKeyInArray!0 (select (store (arr!46820 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))))

(declare-fun b!1420563 () Bool)

(declare-fun res!955989 () Bool)

(assert (=> b!1420563 (=> (not res!955989) (not e!803416))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97005 (_ BitVec 32)) Bool)

(assert (=> b!1420563 (= res!955989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1420564 () Bool)

(declare-fun res!955999 () Bool)

(assert (=> b!1420564 (=> (not res!955999) (not e!803416))))

(assert (=> b!1420564 (= res!955999 (validKeyInArray!0 (select (arr!46820 a!2831) j!81)))))

(declare-fun b!1420565 () Bool)

(assert (=> b!1420565 (= e!803416 e!803417)))

(declare-fun res!955997 () Bool)

(assert (=> b!1420565 (=> (not res!955997) (not e!803417))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420565 (= res!955997 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46820 a!2831) j!81) mask!2608) (select (arr!46820 a!2831) j!81) a!2831 mask!2608) lt!625929))))

(assert (=> b!1420565 (= lt!625929 (Intermediate!11105 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1420566 () Bool)

(declare-fun res!955990 () Bool)

(assert (=> b!1420566 (=> (not res!955990) (not e!803417))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1420566 (= res!955990 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46820 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46820 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!97006 (store (arr!46820 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47370 a!2831)) mask!2608) (Intermediate!11105 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(assert (= (and start!122640 res!955996) b!1420557))

(assert (= (and b!1420557 res!955994) b!1420561))

(assert (= (and b!1420561 res!955991) b!1420564))

(assert (= (and b!1420564 res!955999) b!1420563))

(assert (= (and b!1420563 res!955989) b!1420560))

(assert (= (and b!1420560 res!955998) b!1420556))

(assert (= (and b!1420556 res!955993) b!1420565))

(assert (= (and b!1420565 res!955997) b!1420566))

(assert (= (and b!1420566 res!955990) b!1420559))

(assert (= (and b!1420559 res!955995) b!1420558))

(assert (= (and b!1420558 res!955992) b!1420562))

(declare-fun m!1311075 () Bool)

(assert (=> b!1420560 m!1311075))

(declare-fun m!1311077 () Bool)

(assert (=> b!1420562 m!1311077))

(declare-fun m!1311079 () Bool)

(assert (=> b!1420562 m!1311079))

(assert (=> b!1420562 m!1311079))

(declare-fun m!1311081 () Bool)

(assert (=> b!1420562 m!1311081))

(declare-fun m!1311083 () Bool)

(assert (=> b!1420564 m!1311083))

(assert (=> b!1420564 m!1311083))

(declare-fun m!1311085 () Bool)

(assert (=> b!1420564 m!1311085))

(declare-fun m!1311087 () Bool)

(assert (=> b!1420563 m!1311087))

(assert (=> b!1420559 m!1311083))

(assert (=> b!1420559 m!1311083))

(declare-fun m!1311089 () Bool)

(assert (=> b!1420559 m!1311089))

(declare-fun m!1311091 () Bool)

(assert (=> start!122640 m!1311091))

(declare-fun m!1311093 () Bool)

(assert (=> start!122640 m!1311093))

(assert (=> b!1420565 m!1311083))

(assert (=> b!1420565 m!1311083))

(declare-fun m!1311095 () Bool)

(assert (=> b!1420565 m!1311095))

(assert (=> b!1420565 m!1311095))

(assert (=> b!1420565 m!1311083))

(declare-fun m!1311097 () Bool)

(assert (=> b!1420565 m!1311097))

(assert (=> b!1420566 m!1311077))

(assert (=> b!1420566 m!1311079))

(assert (=> b!1420566 m!1311079))

(declare-fun m!1311099 () Bool)

(assert (=> b!1420566 m!1311099))

(assert (=> b!1420566 m!1311099))

(assert (=> b!1420566 m!1311079))

(declare-fun m!1311101 () Bool)

(assert (=> b!1420566 m!1311101))

(declare-fun m!1311103 () Bool)

(assert (=> b!1420561 m!1311103))

(assert (=> b!1420561 m!1311103))

(declare-fun m!1311105 () Bool)

(assert (=> b!1420561 m!1311105))

(push 1)

