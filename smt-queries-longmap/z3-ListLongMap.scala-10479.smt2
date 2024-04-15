; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123248 () Bool)

(assert start!123248)

(declare-fun b!1429095 () Bool)

(declare-fun res!963780 () Bool)

(declare-fun e!807000 () Bool)

(assert (=> b!1429095 (=> (not res!963780) (not e!807000))))

(declare-datatypes ((array!97362 0))(
  ( (array!97363 (arr!46993 (Array (_ BitVec 32) (_ BitVec 64))) (size!47545 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97362)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1429095 (= res!963780 (validKeyInArray!0 (select (arr!46993 a!2831) i!982)))))

(declare-fun b!1429096 () Bool)

(declare-fun res!963776 () Bool)

(declare-fun e!807001 () Bool)

(assert (=> b!1429096 (=> (not res!963776) (not e!807001))))

(declare-fun lt!629076 () array!97362)

(declare-datatypes ((SeekEntryResult!11299 0))(
  ( (MissingZero!11299 (index!47588 (_ BitVec 32))) (Found!11299 (index!47589 (_ BitVec 32))) (Intermediate!11299 (undefined!12111 Bool) (index!47590 (_ BitVec 32)) (x!129218 (_ BitVec 32))) (Undefined!11299) (MissingVacant!11299 (index!47591 (_ BitVec 32))) )
))
(declare-fun lt!629078 () SeekEntryResult!11299)

(declare-fun lt!629077 () (_ BitVec 64))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97362 (_ BitVec 32)) SeekEntryResult!11299)

(assert (=> b!1429096 (= res!963776 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629077 lt!629076 mask!2608) lt!629078))))

(declare-fun b!1429097 () Bool)

(declare-fun res!963786 () Bool)

(assert (=> b!1429097 (=> (not res!963786) (not e!807001))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1429097 (= res!963786 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1429098 () Bool)

(assert (=> b!1429098 (= e!807001 (not true))))

(declare-fun e!806999 () Bool)

(assert (=> b!1429098 e!806999))

(declare-fun res!963777 () Bool)

(assert (=> b!1429098 (=> (not res!963777) (not e!806999))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97362 (_ BitVec 32)) Bool)

(assert (=> b!1429098 (= res!963777 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48183 0))(
  ( (Unit!48184) )
))
(declare-fun lt!629074 () Unit!48183)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97362 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48183)

(assert (=> b!1429098 (= lt!629074 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1429099 () Bool)

(declare-fun res!963787 () Bool)

(assert (=> b!1429099 (=> (not res!963787) (not e!807000))))

(declare-datatypes ((List!33581 0))(
  ( (Nil!33578) (Cons!33577 (h!34891 (_ BitVec 64)) (t!48267 List!33581)) )
))
(declare-fun arrayNoDuplicates!0 (array!97362 (_ BitVec 32) List!33581) Bool)

(assert (=> b!1429099 (= res!963787 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33578))))

(declare-fun res!963781 () Bool)

(assert (=> start!123248 (=> (not res!963781) (not e!807000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123248 (= res!963781 (validMask!0 mask!2608))))

(assert (=> start!123248 e!807000))

(assert (=> start!123248 true))

(declare-fun array_inv!36226 (array!97362) Bool)

(assert (=> start!123248 (array_inv!36226 a!2831)))

(declare-fun b!1429100 () Bool)

(declare-fun res!963784 () Bool)

(assert (=> b!1429100 (=> (not res!963784) (not e!807000))))

(assert (=> b!1429100 (= res!963784 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1429101 () Bool)

(declare-fun res!963782 () Bool)

(assert (=> b!1429101 (=> (not res!963782) (not e!807001))))

(declare-fun lt!629075 () SeekEntryResult!11299)

(assert (=> b!1429101 (= res!963782 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46993 a!2831) j!81) a!2831 mask!2608) lt!629075))))

(declare-fun b!1429102 () Bool)

(declare-fun e!806998 () Bool)

(assert (=> b!1429102 (= e!807000 e!806998)))

(declare-fun res!963778 () Bool)

(assert (=> b!1429102 (=> (not res!963778) (not e!806998))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1429102 (= res!963778 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46993 a!2831) j!81) mask!2608) (select (arr!46993 a!2831) j!81) a!2831 mask!2608) lt!629075))))

(assert (=> b!1429102 (= lt!629075 (Intermediate!11299 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1429103 () Bool)

(declare-fun res!963785 () Bool)

(assert (=> b!1429103 (=> (not res!963785) (not e!807000))))

(assert (=> b!1429103 (= res!963785 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47545 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47545 a!2831))))))

(declare-fun b!1429104 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97362 (_ BitVec 32)) SeekEntryResult!11299)

(assert (=> b!1429104 (= e!806999 (= (seekEntryOrOpen!0 (select (arr!46993 a!2831) j!81) a!2831 mask!2608) (Found!11299 j!81)))))

(declare-fun b!1429105 () Bool)

(assert (=> b!1429105 (= e!806998 e!807001)))

(declare-fun res!963783 () Bool)

(assert (=> b!1429105 (=> (not res!963783) (not e!807001))))

(assert (=> b!1429105 (= res!963783 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629077 mask!2608) lt!629077 lt!629076 mask!2608) lt!629078))))

(assert (=> b!1429105 (= lt!629078 (Intermediate!11299 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1429105 (= lt!629077 (select (store (arr!46993 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1429105 (= lt!629076 (array!97363 (store (arr!46993 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47545 a!2831)))))

(declare-fun b!1429106 () Bool)

(declare-fun res!963779 () Bool)

(assert (=> b!1429106 (=> (not res!963779) (not e!807000))))

(assert (=> b!1429106 (= res!963779 (and (= (size!47545 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47545 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47545 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1429107 () Bool)

(declare-fun res!963775 () Bool)

(assert (=> b!1429107 (=> (not res!963775) (not e!807000))))

(assert (=> b!1429107 (= res!963775 (validKeyInArray!0 (select (arr!46993 a!2831) j!81)))))

(assert (= (and start!123248 res!963781) b!1429106))

(assert (= (and b!1429106 res!963779) b!1429095))

(assert (= (and b!1429095 res!963780) b!1429107))

(assert (= (and b!1429107 res!963775) b!1429100))

(assert (= (and b!1429100 res!963784) b!1429099))

(assert (= (and b!1429099 res!963787) b!1429103))

(assert (= (and b!1429103 res!963785) b!1429102))

(assert (= (and b!1429102 res!963778) b!1429105))

(assert (= (and b!1429105 res!963783) b!1429101))

(assert (= (and b!1429101 res!963782) b!1429096))

(assert (= (and b!1429096 res!963776) b!1429097))

(assert (= (and b!1429097 res!963786) b!1429098))

(assert (= (and b!1429098 res!963777) b!1429104))

(declare-fun m!1318731 () Bool)

(assert (=> b!1429095 m!1318731))

(assert (=> b!1429095 m!1318731))

(declare-fun m!1318733 () Bool)

(assert (=> b!1429095 m!1318733))

(declare-fun m!1318735 () Bool)

(assert (=> b!1429098 m!1318735))

(declare-fun m!1318737 () Bool)

(assert (=> b!1429098 m!1318737))

(declare-fun m!1318739 () Bool)

(assert (=> start!123248 m!1318739))

(declare-fun m!1318741 () Bool)

(assert (=> start!123248 m!1318741))

(declare-fun m!1318743 () Bool)

(assert (=> b!1429099 m!1318743))

(declare-fun m!1318745 () Bool)

(assert (=> b!1429100 m!1318745))

(declare-fun m!1318747 () Bool)

(assert (=> b!1429104 m!1318747))

(assert (=> b!1429104 m!1318747))

(declare-fun m!1318749 () Bool)

(assert (=> b!1429104 m!1318749))

(assert (=> b!1429101 m!1318747))

(assert (=> b!1429101 m!1318747))

(declare-fun m!1318751 () Bool)

(assert (=> b!1429101 m!1318751))

(assert (=> b!1429102 m!1318747))

(assert (=> b!1429102 m!1318747))

(declare-fun m!1318753 () Bool)

(assert (=> b!1429102 m!1318753))

(assert (=> b!1429102 m!1318753))

(assert (=> b!1429102 m!1318747))

(declare-fun m!1318755 () Bool)

(assert (=> b!1429102 m!1318755))

(assert (=> b!1429107 m!1318747))

(assert (=> b!1429107 m!1318747))

(declare-fun m!1318757 () Bool)

(assert (=> b!1429107 m!1318757))

(declare-fun m!1318759 () Bool)

(assert (=> b!1429096 m!1318759))

(declare-fun m!1318761 () Bool)

(assert (=> b!1429105 m!1318761))

(assert (=> b!1429105 m!1318761))

(declare-fun m!1318763 () Bool)

(assert (=> b!1429105 m!1318763))

(declare-fun m!1318765 () Bool)

(assert (=> b!1429105 m!1318765))

(declare-fun m!1318767 () Bool)

(assert (=> b!1429105 m!1318767))

(check-sat (not b!1429102) (not start!123248) (not b!1429100) (not b!1429101) (not b!1429095) (not b!1429107) (not b!1429105) (not b!1429096) (not b!1429099) (not b!1429098) (not b!1429104))
(check-sat)
