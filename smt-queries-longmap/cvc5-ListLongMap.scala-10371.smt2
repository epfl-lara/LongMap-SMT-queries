; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122286 () Bool)

(assert start!122286)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96843 0))(
  ( (array!96844 (arr!46749 (Array (_ BitVec 32) (_ BitVec 64))) (size!47300 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96843)

(declare-fun b!1417994 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun e!802637 () Bool)

(declare-datatypes ((SeekEntryResult!10963 0))(
  ( (MissingZero!10963 (index!46244 (_ BitVec 32))) (Found!10963 (index!46245 (_ BitVec 32))) (Intermediate!10963 (undefined!11775 Bool) (index!46246 (_ BitVec 32)) (x!127995 (_ BitVec 32))) (Undefined!10963) (MissingVacant!10963 (index!46247 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96843 (_ BitVec 32)) SeekEntryResult!10963)

(assert (=> b!1417994 (= e!802637 (= (seekEntryOrOpen!0 (select (arr!46749 a!2901) j!112) a!2901 mask!2840) (Found!10963 j!112)))))

(declare-fun b!1417995 () Bool)

(declare-fun res!953191 () Bool)

(declare-fun e!802636 () Bool)

(assert (=> b!1417995 (=> (not res!953191) (not e!802636))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417995 (= res!953191 (validKeyInArray!0 (select (arr!46749 a!2901) i!1037)))))

(declare-fun b!1417996 () Bool)

(declare-fun e!802634 () Bool)

(assert (=> b!1417996 (= e!802636 (not e!802634))))

(declare-fun res!953193 () Bool)

(assert (=> b!1417996 (=> res!953193 e!802634)))

(declare-fun lt!625540 () SeekEntryResult!10963)

(assert (=> b!1417996 (= res!953193 (or (not (is-Intermediate!10963 lt!625540)) (undefined!11775 lt!625540)))))

(assert (=> b!1417996 e!802637))

(declare-fun res!953192 () Bool)

(assert (=> b!1417996 (=> (not res!953192) (not e!802637))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96843 (_ BitVec 32)) Bool)

(assert (=> b!1417996 (= res!953192 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47927 0))(
  ( (Unit!47928) )
))
(declare-fun lt!625541 () Unit!47927)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96843 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47927)

(assert (=> b!1417996 (= lt!625541 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96843 (_ BitVec 32)) SeekEntryResult!10963)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1417996 (= lt!625540 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46749 a!2901) j!112) mask!2840) (select (arr!46749 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!953190 () Bool)

(assert (=> start!122286 (=> (not res!953190) (not e!802636))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122286 (= res!953190 (validMask!0 mask!2840))))

(assert (=> start!122286 e!802636))

(assert (=> start!122286 true))

(declare-fun array_inv!36030 (array!96843) Bool)

(assert (=> start!122286 (array_inv!36030 a!2901)))

(declare-fun b!1417997 () Bool)

(declare-fun res!953194 () Bool)

(assert (=> b!1417997 (=> (not res!953194) (not e!802636))))

(assert (=> b!1417997 (= res!953194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1417998 () Bool)

(declare-fun res!953187 () Bool)

(assert (=> b!1417998 (=> (not res!953187) (not e!802636))))

(declare-datatypes ((List!33255 0))(
  ( (Nil!33252) (Cons!33251 (h!34549 (_ BitVec 64)) (t!47941 List!33255)) )
))
(declare-fun arrayNoDuplicates!0 (array!96843 (_ BitVec 32) List!33255) Bool)

(assert (=> b!1417998 (= res!953187 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33252))))

(declare-fun b!1417999 () Bool)

(declare-fun res!953189 () Bool)

(assert (=> b!1417999 (=> (not res!953189) (not e!802636))))

(assert (=> b!1417999 (= res!953189 (validKeyInArray!0 (select (arr!46749 a!2901) j!112)))))

(declare-fun b!1418000 () Bool)

(declare-fun res!953188 () Bool)

(assert (=> b!1418000 (=> (not res!953188) (not e!802636))))

(assert (=> b!1418000 (= res!953188 (and (= (size!47300 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47300 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47300 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1418001 () Bool)

(assert (=> b!1418001 (= e!802634 true)))

(declare-fun lt!625539 () SeekEntryResult!10963)

(assert (=> b!1418001 (= lt!625539 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46749 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46749 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96844 (store (arr!46749 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47300 a!2901)) mask!2840))))

(assert (= (and start!122286 res!953190) b!1418000))

(assert (= (and b!1418000 res!953188) b!1417995))

(assert (= (and b!1417995 res!953191) b!1417999))

(assert (= (and b!1417999 res!953189) b!1417997))

(assert (= (and b!1417997 res!953194) b!1417998))

(assert (= (and b!1417998 res!953187) b!1417996))

(assert (= (and b!1417996 res!953192) b!1417994))

(assert (= (and b!1417996 (not res!953193)) b!1418001))

(declare-fun m!1308915 () Bool)

(assert (=> b!1417998 m!1308915))

(declare-fun m!1308917 () Bool)

(assert (=> b!1417995 m!1308917))

(assert (=> b!1417995 m!1308917))

(declare-fun m!1308919 () Bool)

(assert (=> b!1417995 m!1308919))

(declare-fun m!1308921 () Bool)

(assert (=> b!1417999 m!1308921))

(assert (=> b!1417999 m!1308921))

(declare-fun m!1308923 () Bool)

(assert (=> b!1417999 m!1308923))

(declare-fun m!1308925 () Bool)

(assert (=> start!122286 m!1308925))

(declare-fun m!1308927 () Bool)

(assert (=> start!122286 m!1308927))

(assert (=> b!1417996 m!1308921))

(declare-fun m!1308929 () Bool)

(assert (=> b!1417996 m!1308929))

(assert (=> b!1417996 m!1308921))

(declare-fun m!1308931 () Bool)

(assert (=> b!1417996 m!1308931))

(assert (=> b!1417996 m!1308929))

(assert (=> b!1417996 m!1308921))

(declare-fun m!1308933 () Bool)

(assert (=> b!1417996 m!1308933))

(declare-fun m!1308935 () Bool)

(assert (=> b!1417996 m!1308935))

(declare-fun m!1308937 () Bool)

(assert (=> b!1418001 m!1308937))

(declare-fun m!1308939 () Bool)

(assert (=> b!1418001 m!1308939))

(assert (=> b!1418001 m!1308939))

(declare-fun m!1308941 () Bool)

(assert (=> b!1418001 m!1308941))

(assert (=> b!1418001 m!1308941))

(assert (=> b!1418001 m!1308939))

(declare-fun m!1308943 () Bool)

(assert (=> b!1418001 m!1308943))

(declare-fun m!1308945 () Bool)

(assert (=> b!1417997 m!1308945))

(assert (=> b!1417994 m!1308921))

(assert (=> b!1417994 m!1308921))

(declare-fun m!1308947 () Bool)

(assert (=> b!1417994 m!1308947))

(push 1)

(assert (not b!1417999))

(assert (not b!1417995))

(assert (not start!122286))

(assert (not b!1417998))

(assert (not b!1418001))

(assert (not b!1417997))

(assert (not b!1417996))

(assert (not b!1417994))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

