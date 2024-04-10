; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122714 () Bool)

(assert start!122714)

(declare-fun b!1421814 () Bool)

(declare-fun res!957255 () Bool)

(declare-fun e!803875 () Bool)

(assert (=> b!1421814 (=> (not res!957255) (not e!803875))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97079 0))(
  ( (array!97080 (arr!46857 (Array (_ BitVec 32) (_ BitVec 64))) (size!47407 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97079)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1421814 (= res!957255 (and (= (size!47407 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47407 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47407 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1421815 () Bool)

(declare-fun res!957248 () Bool)

(assert (=> b!1421815 (=> (not res!957248) (not e!803875))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97079 (_ BitVec 32)) Bool)

(assert (=> b!1421815 (= res!957248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1421816 () Bool)

(declare-fun res!957253 () Bool)

(declare-fun e!803877 () Bool)

(assert (=> b!1421816 (=> (not res!957253) (not e!803877))))

(declare-datatypes ((SeekEntryResult!11142 0))(
  ( (MissingZero!11142 (index!46960 (_ BitVec 32))) (Found!11142 (index!46961 (_ BitVec 32))) (Intermediate!11142 (undefined!11954 Bool) (index!46962 (_ BitVec 32)) (x!128608 (_ BitVec 32))) (Undefined!11142) (MissingVacant!11142 (index!46963 (_ BitVec 32))) )
))
(declare-fun lt!626411 () SeekEntryResult!11142)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun lt!626415 () array!97079)

(declare-fun lt!626413 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97079 (_ BitVec 32)) SeekEntryResult!11142)

(assert (=> b!1421816 (= res!957253 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626413 lt!626415 mask!2608) lt!626411))))

(declare-fun b!1421817 () Bool)

(declare-fun res!957251 () Bool)

(assert (=> b!1421817 (=> (not res!957251) (not e!803875))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421817 (= res!957251 (validKeyInArray!0 (select (arr!46857 a!2831) i!982)))))

(declare-fun b!1421818 () Bool)

(declare-fun e!803876 () Bool)

(assert (=> b!1421818 (= e!803875 e!803876)))

(declare-fun res!957250 () Bool)

(assert (=> b!1421818 (=> (not res!957250) (not e!803876))))

(declare-fun lt!626414 () SeekEntryResult!11142)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421818 (= res!957250 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46857 a!2831) j!81) mask!2608) (select (arr!46857 a!2831) j!81) a!2831 mask!2608) lt!626414))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1421818 (= lt!626414 (Intermediate!11142 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1421819 () Bool)

(declare-fun res!957254 () Bool)

(assert (=> b!1421819 (=> (not res!957254) (not e!803877))))

(assert (=> b!1421819 (= res!957254 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46857 a!2831) j!81) a!2831 mask!2608) lt!626414))))

(declare-fun b!1421820 () Bool)

(declare-fun res!957257 () Bool)

(assert (=> b!1421820 (=> (not res!957257) (not e!803875))))

(declare-datatypes ((List!33367 0))(
  ( (Nil!33364) (Cons!33363 (h!34665 (_ BitVec 64)) (t!48061 List!33367)) )
))
(declare-fun arrayNoDuplicates!0 (array!97079 (_ BitVec 32) List!33367) Bool)

(assert (=> b!1421820 (= res!957257 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33364))))

(declare-fun b!1421821 () Bool)

(declare-fun e!803879 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97079 (_ BitVec 32)) SeekEntryResult!11142)

(assert (=> b!1421821 (= e!803879 (= (seekEntryOrOpen!0 (select (arr!46857 a!2831) j!81) a!2831 mask!2608) (Found!11142 j!81)))))

(declare-fun b!1421822 () Bool)

(assert (=> b!1421822 (= e!803876 e!803877)))

(declare-fun res!957256 () Bool)

(assert (=> b!1421822 (=> (not res!957256) (not e!803877))))

(assert (=> b!1421822 (= res!957256 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626413 mask!2608) lt!626413 lt!626415 mask!2608) lt!626411))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1421822 (= lt!626411 (Intermediate!11142 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1421822 (= lt!626413 (select (store (arr!46857 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1421822 (= lt!626415 (array!97080 (store (arr!46857 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47407 a!2831)))))

(declare-fun b!1421823 () Bool)

(declare-fun res!957249 () Bool)

(assert (=> b!1421823 (=> (not res!957249) (not e!803875))))

(assert (=> b!1421823 (= res!957249 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47407 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47407 a!2831))))))

(declare-fun b!1421824 () Bool)

(declare-fun res!957258 () Bool)

(assert (=> b!1421824 (=> (not res!957258) (not e!803877))))

(assert (=> b!1421824 (= res!957258 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun res!957247 () Bool)

(assert (=> start!122714 (=> (not res!957247) (not e!803875))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122714 (= res!957247 (validMask!0 mask!2608))))

(assert (=> start!122714 e!803875))

(assert (=> start!122714 true))

(declare-fun array_inv!35885 (array!97079) Bool)

(assert (=> start!122714 (array_inv!35885 a!2831)))

(declare-fun b!1421825 () Bool)

(declare-fun res!957252 () Bool)

(assert (=> b!1421825 (=> (not res!957252) (not e!803875))))

(assert (=> b!1421825 (= res!957252 (validKeyInArray!0 (select (arr!46857 a!2831) j!81)))))

(declare-fun b!1421826 () Bool)

(assert (=> b!1421826 (= e!803877 (not (or (= (select (arr!46857 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46857 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46857 a!2831) index!585) (select (arr!46857 a!2831) j!81)) (= (select (store (arr!46857 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!2608 #b00000000000000000000000000000000) (bvslt index!585 (bvadd #b00000000000000000000000000000001 mask!2608)))))))

(assert (=> b!1421826 e!803879))

(declare-fun res!957259 () Bool)

(assert (=> b!1421826 (=> (not res!957259) (not e!803879))))

(assert (=> b!1421826 (= res!957259 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48120 0))(
  ( (Unit!48121) )
))
(declare-fun lt!626412 () Unit!48120)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97079 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48120)

(assert (=> b!1421826 (= lt!626412 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (= (and start!122714 res!957247) b!1421814))

(assert (= (and b!1421814 res!957255) b!1421817))

(assert (= (and b!1421817 res!957251) b!1421825))

(assert (= (and b!1421825 res!957252) b!1421815))

(assert (= (and b!1421815 res!957248) b!1421820))

(assert (= (and b!1421820 res!957257) b!1421823))

(assert (= (and b!1421823 res!957249) b!1421818))

(assert (= (and b!1421818 res!957250) b!1421822))

(assert (= (and b!1421822 res!957256) b!1421819))

(assert (= (and b!1421819 res!957254) b!1421816))

(assert (= (and b!1421816 res!957253) b!1421824))

(assert (= (and b!1421824 res!957258) b!1421826))

(assert (= (and b!1421826 res!957259) b!1421821))

(declare-fun m!1312365 () Bool)

(assert (=> start!122714 m!1312365))

(declare-fun m!1312367 () Bool)

(assert (=> start!122714 m!1312367))

(declare-fun m!1312369 () Bool)

(assert (=> b!1421825 m!1312369))

(assert (=> b!1421825 m!1312369))

(declare-fun m!1312371 () Bool)

(assert (=> b!1421825 m!1312371))

(declare-fun m!1312373 () Bool)

(assert (=> b!1421817 m!1312373))

(assert (=> b!1421817 m!1312373))

(declare-fun m!1312375 () Bool)

(assert (=> b!1421817 m!1312375))

(declare-fun m!1312377 () Bool)

(assert (=> b!1421820 m!1312377))

(declare-fun m!1312379 () Bool)

(assert (=> b!1421816 m!1312379))

(assert (=> b!1421821 m!1312369))

(assert (=> b!1421821 m!1312369))

(declare-fun m!1312381 () Bool)

(assert (=> b!1421821 m!1312381))

(declare-fun m!1312383 () Bool)

(assert (=> b!1421815 m!1312383))

(declare-fun m!1312385 () Bool)

(assert (=> b!1421822 m!1312385))

(assert (=> b!1421822 m!1312385))

(declare-fun m!1312387 () Bool)

(assert (=> b!1421822 m!1312387))

(declare-fun m!1312389 () Bool)

(assert (=> b!1421822 m!1312389))

(declare-fun m!1312391 () Bool)

(assert (=> b!1421822 m!1312391))

(assert (=> b!1421818 m!1312369))

(assert (=> b!1421818 m!1312369))

(declare-fun m!1312393 () Bool)

(assert (=> b!1421818 m!1312393))

(assert (=> b!1421818 m!1312393))

(assert (=> b!1421818 m!1312369))

(declare-fun m!1312395 () Bool)

(assert (=> b!1421818 m!1312395))

(assert (=> b!1421826 m!1312389))

(declare-fun m!1312397 () Bool)

(assert (=> b!1421826 m!1312397))

(declare-fun m!1312399 () Bool)

(assert (=> b!1421826 m!1312399))

(declare-fun m!1312401 () Bool)

(assert (=> b!1421826 m!1312401))

(assert (=> b!1421826 m!1312369))

(declare-fun m!1312403 () Bool)

(assert (=> b!1421826 m!1312403))

(assert (=> b!1421819 m!1312369))

(assert (=> b!1421819 m!1312369))

(declare-fun m!1312405 () Bool)

(assert (=> b!1421819 m!1312405))

(check-sat (not b!1421817) (not b!1421822) (not b!1421821) (not b!1421818) (not b!1421826) (not b!1421815) (not b!1421825) (not b!1421819) (not b!1421820) (not start!122714) (not b!1421816))
(check-sat)
