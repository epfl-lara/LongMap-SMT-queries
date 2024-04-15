; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122648 () Bool)

(assert start!122648)

(declare-fun b!1420662 () Bool)

(declare-fun e!803441 () Bool)

(declare-fun e!803442 () Bool)

(assert (=> b!1420662 (= e!803441 e!803442)))

(declare-fun res!956146 () Bool)

(assert (=> b!1420662 (=> (not res!956146) (not e!803442))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun lt!625793 () (_ BitVec 64))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((array!96966 0))(
  ( (array!96967 (arr!46801 (Array (_ BitVec 32) (_ BitVec 64))) (size!47353 (_ BitVec 32))) )
))
(declare-fun lt!625790 () array!96966)

(declare-fun undefinedAfter!5 () Bool)

(declare-datatypes ((SeekEntryResult!11113 0))(
  ( (MissingZero!11113 (index!46844 (_ BitVec 32))) (Found!11113 (index!46845 (_ BitVec 32))) (Intermediate!11113 (undefined!11925 Bool) (index!46846 (_ BitVec 32)) (x!128496 (_ BitVec 32))) (Undefined!11113) (MissingVacant!11113 (index!46847 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96966 (_ BitVec 32)) SeekEntryResult!11113)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420662 (= res!956146 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!625793 mask!2608) lt!625793 lt!625790 mask!2608) (Intermediate!11113 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun a!2831 () array!96966)

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1420662 (= lt!625793 (select (store (arr!46801 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1420662 (= lt!625790 (array!96967 (store (arr!46801 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47353 a!2831)))))

(declare-fun b!1420663 () Bool)

(declare-fun res!956148 () Bool)

(declare-fun e!803443 () Bool)

(assert (=> b!1420663 (=> (not res!956148) (not e!803443))))

(assert (=> b!1420663 (= res!956148 (and (= (size!47353 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47353 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47353 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420665 () Bool)

(declare-fun res!956154 () Bool)

(assert (=> b!1420665 (=> (not res!956154) (not e!803442))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun lt!625791 () SeekEntryResult!11113)

(assert (=> b!1420665 (= res!956154 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46801 a!2831) j!81) a!2831 mask!2608) lt!625791))))

(declare-fun b!1420666 () Bool)

(assert (=> b!1420666 (= e!803442 false)))

(declare-fun lt!625792 () SeekEntryResult!11113)

(assert (=> b!1420666 (= lt!625792 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!625793 lt!625790 mask!2608))))

(declare-fun b!1420667 () Bool)

(declare-fun res!956152 () Bool)

(assert (=> b!1420667 (=> (not res!956152) (not e!803443))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1420667 (= res!956152 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47353 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47353 a!2831))))))

(declare-fun b!1420668 () Bool)

(assert (=> b!1420668 (= e!803443 e!803441)))

(declare-fun res!956147 () Bool)

(assert (=> b!1420668 (=> (not res!956147) (not e!803441))))

(assert (=> b!1420668 (= res!956147 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46801 a!2831) j!81) mask!2608) (select (arr!46801 a!2831) j!81) a!2831 mask!2608) lt!625791))))

(assert (=> b!1420668 (= lt!625791 (Intermediate!11113 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1420669 () Bool)

(declare-fun res!956150 () Bool)

(assert (=> b!1420669 (=> (not res!956150) (not e!803443))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96966 (_ BitVec 32)) Bool)

(assert (=> b!1420669 (= res!956150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1420670 () Bool)

(declare-fun res!956155 () Bool)

(assert (=> b!1420670 (=> (not res!956155) (not e!803443))))

(declare-datatypes ((List!33389 0))(
  ( (Nil!33386) (Cons!33385 (h!34687 (_ BitVec 64)) (t!48075 List!33389)) )
))
(declare-fun arrayNoDuplicates!0 (array!96966 (_ BitVec 32) List!33389) Bool)

(assert (=> b!1420670 (= res!956155 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33386))))

(declare-fun b!1420671 () Bool)

(declare-fun res!956153 () Bool)

(assert (=> b!1420671 (=> (not res!956153) (not e!803443))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420671 (= res!956153 (validKeyInArray!0 (select (arr!46801 a!2831) i!982)))))

(declare-fun b!1420664 () Bool)

(declare-fun res!956151 () Bool)

(assert (=> b!1420664 (=> (not res!956151) (not e!803443))))

(assert (=> b!1420664 (= res!956151 (validKeyInArray!0 (select (arr!46801 a!2831) j!81)))))

(declare-fun res!956149 () Bool)

(assert (=> start!122648 (=> (not res!956149) (not e!803443))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122648 (= res!956149 (validMask!0 mask!2608))))

(assert (=> start!122648 e!803443))

(assert (=> start!122648 true))

(declare-fun array_inv!36034 (array!96966) Bool)

(assert (=> start!122648 (array_inv!36034 a!2831)))

(assert (= (and start!122648 res!956149) b!1420663))

(assert (= (and b!1420663 res!956148) b!1420671))

(assert (= (and b!1420671 res!956153) b!1420664))

(assert (= (and b!1420664 res!956151) b!1420669))

(assert (= (and b!1420669 res!956150) b!1420670))

(assert (= (and b!1420670 res!956155) b!1420667))

(assert (= (and b!1420667 res!956152) b!1420668))

(assert (= (and b!1420668 res!956147) b!1420662))

(assert (= (and b!1420662 res!956146) b!1420665))

(assert (= (and b!1420665 res!956154) b!1420666))

(declare-fun m!1310715 () Bool)

(assert (=> b!1420665 m!1310715))

(assert (=> b!1420665 m!1310715))

(declare-fun m!1310717 () Bool)

(assert (=> b!1420665 m!1310717))

(declare-fun m!1310719 () Bool)

(assert (=> start!122648 m!1310719))

(declare-fun m!1310721 () Bool)

(assert (=> start!122648 m!1310721))

(declare-fun m!1310723 () Bool)

(assert (=> b!1420666 m!1310723))

(assert (=> b!1420664 m!1310715))

(assert (=> b!1420664 m!1310715))

(declare-fun m!1310725 () Bool)

(assert (=> b!1420664 m!1310725))

(assert (=> b!1420668 m!1310715))

(assert (=> b!1420668 m!1310715))

(declare-fun m!1310727 () Bool)

(assert (=> b!1420668 m!1310727))

(assert (=> b!1420668 m!1310727))

(assert (=> b!1420668 m!1310715))

(declare-fun m!1310729 () Bool)

(assert (=> b!1420668 m!1310729))

(declare-fun m!1310731 () Bool)

(assert (=> b!1420662 m!1310731))

(assert (=> b!1420662 m!1310731))

(declare-fun m!1310733 () Bool)

(assert (=> b!1420662 m!1310733))

(declare-fun m!1310735 () Bool)

(assert (=> b!1420662 m!1310735))

(declare-fun m!1310737 () Bool)

(assert (=> b!1420662 m!1310737))

(declare-fun m!1310739 () Bool)

(assert (=> b!1420670 m!1310739))

(declare-fun m!1310741 () Bool)

(assert (=> b!1420669 m!1310741))

(declare-fun m!1310743 () Bool)

(assert (=> b!1420671 m!1310743))

(assert (=> b!1420671 m!1310743))

(declare-fun m!1310745 () Bool)

(assert (=> b!1420671 m!1310745))

(check-sat (not b!1420666) (not b!1420668) (not b!1420665) (not b!1420664) (not start!122648) (not b!1420662) (not b!1420669) (not b!1420670) (not b!1420671))
(check-sat)
