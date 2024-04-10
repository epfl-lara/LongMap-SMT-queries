; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122874 () Bool)

(assert start!122874)

(declare-fun res!960616 () Bool)

(declare-fun e!805295 () Bool)

(assert (=> start!122874 (=> (not res!960616) (not e!805295))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122874 (= res!960616 (validMask!0 mask!2608))))

(assert (=> start!122874 e!805295))

(assert (=> start!122874 true))

(declare-datatypes ((array!97239 0))(
  ( (array!97240 (arr!46937 (Array (_ BitVec 32) (_ BitVec 64))) (size!47487 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97239)

(declare-fun array_inv!35965 (array!97239) Bool)

(assert (=> start!122874 (array_inv!35965 a!2831)))

(declare-fun b!1425176 () Bool)

(declare-fun res!960612 () Bool)

(assert (=> b!1425176 (=> (not res!960612) (not e!805295))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1425176 (= res!960612 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47487 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47487 a!2831))))))

(declare-fun b!1425177 () Bool)

(declare-fun res!960609 () Bool)

(assert (=> b!1425177 (=> (not res!960609) (not e!805295))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1425177 (= res!960609 (and (= (size!47487 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47487 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47487 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425178 () Bool)

(declare-fun res!960614 () Bool)

(assert (=> b!1425178 (=> (not res!960614) (not e!805295))))

(declare-datatypes ((SeekEntryResult!11216 0))(
  ( (MissingZero!11216 (index!47256 (_ BitVec 32))) (Found!11216 (index!47257 (_ BitVec 32))) (Intermediate!11216 (undefined!12028 Bool) (index!47258 (_ BitVec 32)) (x!128898 (_ BitVec 32))) (Undefined!11216) (MissingVacant!11216 (index!47259 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97239 (_ BitVec 32)) SeekEntryResult!11216)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425178 (= res!960614 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46937 a!2831) j!81) mask!2608) (select (arr!46937 a!2831) j!81) a!2831 mask!2608) (Intermediate!11216 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1425179 () Bool)

(declare-fun res!960610 () Bool)

(assert (=> b!1425179 (=> (not res!960610) (not e!805295))))

(declare-datatypes ((List!33447 0))(
  ( (Nil!33444) (Cons!33443 (h!34745 (_ BitVec 64)) (t!48141 List!33447)) )
))
(declare-fun arrayNoDuplicates!0 (array!97239 (_ BitVec 32) List!33447) Bool)

(assert (=> b!1425179 (= res!960610 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33444))))

(declare-fun b!1425180 () Bool)

(declare-fun res!960613 () Bool)

(assert (=> b!1425180 (=> (not res!960613) (not e!805295))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425180 (= res!960613 (validKeyInArray!0 (select (arr!46937 a!2831) j!81)))))

(declare-fun b!1425181 () Bool)

(declare-fun res!960615 () Bool)

(assert (=> b!1425181 (=> (not res!960615) (not e!805295))))

(assert (=> b!1425181 (= res!960615 (validKeyInArray!0 (select (arr!46937 a!2831) i!982)))))

(declare-fun b!1425182 () Bool)

(assert (=> b!1425182 (= e!805295 false)))

(declare-fun lt!627783 () (_ BitVec 32))

(assert (=> b!1425182 (= lt!627783 (toIndex!0 (select (store (arr!46937 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608))))

(declare-fun b!1425183 () Bool)

(declare-fun res!960611 () Bool)

(assert (=> b!1425183 (=> (not res!960611) (not e!805295))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97239 (_ BitVec 32)) Bool)

(assert (=> b!1425183 (= res!960611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(assert (= (and start!122874 res!960616) b!1425177))

(assert (= (and b!1425177 res!960609) b!1425181))

(assert (= (and b!1425181 res!960615) b!1425180))

(assert (= (and b!1425180 res!960613) b!1425183))

(assert (= (and b!1425183 res!960611) b!1425179))

(assert (= (and b!1425179 res!960610) b!1425176))

(assert (= (and b!1425176 res!960612) b!1425178))

(assert (= (and b!1425178 res!960614) b!1425182))

(declare-fun m!1315725 () Bool)

(assert (=> b!1425178 m!1315725))

(assert (=> b!1425178 m!1315725))

(declare-fun m!1315727 () Bool)

(assert (=> b!1425178 m!1315727))

(assert (=> b!1425178 m!1315727))

(assert (=> b!1425178 m!1315725))

(declare-fun m!1315729 () Bool)

(assert (=> b!1425178 m!1315729))

(declare-fun m!1315731 () Bool)

(assert (=> start!122874 m!1315731))

(declare-fun m!1315733 () Bool)

(assert (=> start!122874 m!1315733))

(declare-fun m!1315735 () Bool)

(assert (=> b!1425179 m!1315735))

(assert (=> b!1425180 m!1315725))

(assert (=> b!1425180 m!1315725))

(declare-fun m!1315737 () Bool)

(assert (=> b!1425180 m!1315737))

(declare-fun m!1315739 () Bool)

(assert (=> b!1425181 m!1315739))

(assert (=> b!1425181 m!1315739))

(declare-fun m!1315741 () Bool)

(assert (=> b!1425181 m!1315741))

(declare-fun m!1315743 () Bool)

(assert (=> b!1425182 m!1315743))

(declare-fun m!1315745 () Bool)

(assert (=> b!1425182 m!1315745))

(assert (=> b!1425182 m!1315745))

(declare-fun m!1315747 () Bool)

(assert (=> b!1425182 m!1315747))

(declare-fun m!1315749 () Bool)

(assert (=> b!1425183 m!1315749))

(push 1)

(assert (not start!122874))

(assert (not b!1425178))

(assert (not b!1425183))

(assert (not b!1425182))

(assert (not b!1425179))

(assert (not b!1425181))

(assert (not b!1425180))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

