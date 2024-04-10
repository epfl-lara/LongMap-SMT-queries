; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123012 () Bool)

(assert start!123012)

(declare-fun b!1426728 () Bool)

(declare-fun res!961972 () Bool)

(declare-fun e!805886 () Bool)

(assert (=> b!1426728 (=> (not res!961972) (not e!805886))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1426728 (= res!961972 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1426729 () Bool)

(declare-fun res!961970 () Bool)

(declare-fun e!805885 () Bool)

(assert (=> b!1426729 (=> (not res!961970) (not e!805885))))

(declare-datatypes ((array!97326 0))(
  ( (array!97327 (arr!46979 (Array (_ BitVec 32) (_ BitVec 64))) (size!47529 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97326)

(declare-datatypes ((List!33489 0))(
  ( (Nil!33486) (Cons!33485 (h!34790 (_ BitVec 64)) (t!48183 List!33489)) )
))
(declare-fun arrayNoDuplicates!0 (array!97326 (_ BitVec 32) List!33489) Bool)

(assert (=> b!1426729 (= res!961970 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33486))))

(declare-fun b!1426730 () Bool)

(assert (=> b!1426730 (= e!805886 (not true))))

(declare-fun e!805887 () Bool)

(assert (=> b!1426730 e!805887))

(declare-fun res!961968 () Bool)

(assert (=> b!1426730 (=> (not res!961968) (not e!805887))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97326 (_ BitVec 32)) Bool)

(assert (=> b!1426730 (= res!961968 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48262 0))(
  ( (Unit!48263) )
))
(declare-fun lt!628283 () Unit!48262)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97326 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48262)

(assert (=> b!1426730 (= lt!628283 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1426731 () Bool)

(declare-fun e!805889 () Bool)

(assert (=> b!1426731 (= e!805889 e!805886)))

(declare-fun res!961967 () Bool)

(assert (=> b!1426731 (=> (not res!961967) (not e!805886))))

(declare-fun lt!628287 () array!97326)

(declare-datatypes ((SeekEntryResult!11258 0))(
  ( (MissingZero!11258 (index!47424 (_ BitVec 32))) (Found!11258 (index!47425 (_ BitVec 32))) (Intermediate!11258 (undefined!12070 Bool) (index!47426 (_ BitVec 32)) (x!129058 (_ BitVec 32))) (Undefined!11258) (MissingVacant!11258 (index!47427 (_ BitVec 32))) )
))
(declare-fun lt!628285 () SeekEntryResult!11258)

(declare-fun lt!628284 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97326 (_ BitVec 32)) SeekEntryResult!11258)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1426731 (= res!961967 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628284 mask!2608) lt!628284 lt!628287 mask!2608) lt!628285))))

(assert (=> b!1426731 (= lt!628285 (Intermediate!11258 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1426731 (= lt!628284 (select (store (arr!46979 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1426731 (= lt!628287 (array!97327 (store (arr!46979 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47529 a!2831)))))

(declare-fun b!1426732 () Bool)

(declare-fun res!961960 () Bool)

(assert (=> b!1426732 (=> (not res!961960) (not e!805886))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1426732 (= res!961960 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628284 lt!628287 mask!2608) lt!628285))))

(declare-fun b!1426733 () Bool)

(declare-fun res!961965 () Bool)

(assert (=> b!1426733 (=> (not res!961965) (not e!805885))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1426733 (= res!961965 (validKeyInArray!0 (select (arr!46979 a!2831) j!81)))))

(declare-fun res!961969 () Bool)

(assert (=> start!123012 (=> (not res!961969) (not e!805885))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123012 (= res!961969 (validMask!0 mask!2608))))

(assert (=> start!123012 e!805885))

(assert (=> start!123012 true))

(declare-fun array_inv!36007 (array!97326) Bool)

(assert (=> start!123012 (array_inv!36007 a!2831)))

(declare-fun b!1426734 () Bool)

(declare-fun res!961964 () Bool)

(assert (=> b!1426734 (=> (not res!961964) (not e!805885))))

(assert (=> b!1426734 (= res!961964 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1426735 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97326 (_ BitVec 32)) SeekEntryResult!11258)

(assert (=> b!1426735 (= e!805887 (= (seekEntryOrOpen!0 (select (arr!46979 a!2831) j!81) a!2831 mask!2608) (Found!11258 j!81)))))

(declare-fun b!1426736 () Bool)

(declare-fun res!961962 () Bool)

(assert (=> b!1426736 (=> (not res!961962) (not e!805885))))

(assert (=> b!1426736 (= res!961962 (validKeyInArray!0 (select (arr!46979 a!2831) i!982)))))

(declare-fun b!1426737 () Bool)

(declare-fun res!961963 () Bool)

(assert (=> b!1426737 (=> (not res!961963) (not e!805885))))

(assert (=> b!1426737 (= res!961963 (and (= (size!47529 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47529 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47529 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1426738 () Bool)

(declare-fun res!961971 () Bool)

(assert (=> b!1426738 (=> (not res!961971) (not e!805885))))

(assert (=> b!1426738 (= res!961971 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47529 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47529 a!2831))))))

(declare-fun b!1426739 () Bool)

(assert (=> b!1426739 (= e!805885 e!805889)))

(declare-fun res!961961 () Bool)

(assert (=> b!1426739 (=> (not res!961961) (not e!805889))))

(declare-fun lt!628286 () SeekEntryResult!11258)

(assert (=> b!1426739 (= res!961961 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46979 a!2831) j!81) mask!2608) (select (arr!46979 a!2831) j!81) a!2831 mask!2608) lt!628286))))

(assert (=> b!1426739 (= lt!628286 (Intermediate!11258 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1426740 () Bool)

(declare-fun res!961966 () Bool)

(assert (=> b!1426740 (=> (not res!961966) (not e!805886))))

(assert (=> b!1426740 (= res!961966 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46979 a!2831) j!81) a!2831 mask!2608) lt!628286))))

(assert (= (and start!123012 res!961969) b!1426737))

(assert (= (and b!1426737 res!961963) b!1426736))

(assert (= (and b!1426736 res!961962) b!1426733))

(assert (= (and b!1426733 res!961965) b!1426734))

(assert (= (and b!1426734 res!961964) b!1426729))

(assert (= (and b!1426729 res!961970) b!1426738))

(assert (= (and b!1426738 res!961971) b!1426739))

(assert (= (and b!1426739 res!961961) b!1426731))

(assert (= (and b!1426731 res!961967) b!1426740))

(assert (= (and b!1426740 res!961966) b!1426732))

(assert (= (and b!1426732 res!961960) b!1426728))

(assert (= (and b!1426728 res!961972) b!1426730))

(assert (= (and b!1426730 res!961968) b!1426735))

(declare-fun m!1317225 () Bool)

(assert (=> b!1426731 m!1317225))

(assert (=> b!1426731 m!1317225))

(declare-fun m!1317227 () Bool)

(assert (=> b!1426731 m!1317227))

(declare-fun m!1317229 () Bool)

(assert (=> b!1426731 m!1317229))

(declare-fun m!1317231 () Bool)

(assert (=> b!1426731 m!1317231))

(declare-fun m!1317233 () Bool)

(assert (=> b!1426733 m!1317233))

(assert (=> b!1426733 m!1317233))

(declare-fun m!1317235 () Bool)

(assert (=> b!1426733 m!1317235))

(assert (=> b!1426740 m!1317233))

(assert (=> b!1426740 m!1317233))

(declare-fun m!1317237 () Bool)

(assert (=> b!1426740 m!1317237))

(declare-fun m!1317239 () Bool)

(assert (=> b!1426730 m!1317239))

(declare-fun m!1317241 () Bool)

(assert (=> b!1426730 m!1317241))

(declare-fun m!1317243 () Bool)

(assert (=> b!1426734 m!1317243))

(declare-fun m!1317245 () Bool)

(assert (=> b!1426732 m!1317245))

(declare-fun m!1317247 () Bool)

(assert (=> b!1426729 m!1317247))

(declare-fun m!1317249 () Bool)

(assert (=> b!1426736 m!1317249))

(assert (=> b!1426736 m!1317249))

(declare-fun m!1317251 () Bool)

(assert (=> b!1426736 m!1317251))

(assert (=> b!1426739 m!1317233))

(assert (=> b!1426739 m!1317233))

(declare-fun m!1317253 () Bool)

(assert (=> b!1426739 m!1317253))

(assert (=> b!1426739 m!1317253))

(assert (=> b!1426739 m!1317233))

(declare-fun m!1317255 () Bool)

(assert (=> b!1426739 m!1317255))

(declare-fun m!1317257 () Bool)

(assert (=> start!123012 m!1317257))

(declare-fun m!1317259 () Bool)

(assert (=> start!123012 m!1317259))

(assert (=> b!1426735 m!1317233))

(assert (=> b!1426735 m!1317233))

(declare-fun m!1317261 () Bool)

(assert (=> b!1426735 m!1317261))

(push 1)

