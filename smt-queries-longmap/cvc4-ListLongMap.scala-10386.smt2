; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122332 () Bool)

(assert start!122332)

(declare-fun b!1418152 () Bool)

(declare-fun res!953829 () Bool)

(declare-fun e!802571 () Bool)

(assert (=> b!1418152 (=> (not res!953829) (not e!802571))))

(declare-datatypes ((array!96835 0))(
  ( (array!96836 (arr!46741 (Array (_ BitVec 32) (_ BitVec 64))) (size!47291 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96835)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418152 (= res!953829 (validKeyInArray!0 (select (arr!46741 a!2831) j!81)))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun b!1418153 () Bool)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(assert (=> b!1418153 (= e!802571 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47291 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47291 a!2831)) (bvslt mask!2608 #b00000000000000000000000000000000)))))

(declare-fun res!953833 () Bool)

(assert (=> start!122332 (=> (not res!953833) (not e!802571))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122332 (= res!953833 (validMask!0 mask!2608))))

(assert (=> start!122332 e!802571))

(assert (=> start!122332 true))

(declare-fun array_inv!35769 (array!96835) Bool)

(assert (=> start!122332 (array_inv!35769 a!2831)))

(declare-fun b!1418154 () Bool)

(declare-fun res!953828 () Bool)

(assert (=> b!1418154 (=> (not res!953828) (not e!802571))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1418154 (= res!953828 (validKeyInArray!0 (select (arr!46741 a!2831) i!982)))))

(declare-fun b!1418155 () Bool)

(declare-fun res!953832 () Bool)

(assert (=> b!1418155 (=> (not res!953832) (not e!802571))))

(assert (=> b!1418155 (= res!953832 (and (= (size!47291 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47291 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47291 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1418156 () Bool)

(declare-fun res!953830 () Bool)

(assert (=> b!1418156 (=> (not res!953830) (not e!802571))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96835 (_ BitVec 32)) Bool)

(assert (=> b!1418156 (= res!953830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1418157 () Bool)

(declare-fun res!953831 () Bool)

(assert (=> b!1418157 (=> (not res!953831) (not e!802571))))

(declare-datatypes ((List!33251 0))(
  ( (Nil!33248) (Cons!33247 (h!34540 (_ BitVec 64)) (t!47945 List!33251)) )
))
(declare-fun arrayNoDuplicates!0 (array!96835 (_ BitVec 32) List!33251) Bool)

(assert (=> b!1418157 (= res!953831 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33248))))

(assert (= (and start!122332 res!953833) b!1418155))

(assert (= (and b!1418155 res!953832) b!1418154))

(assert (= (and b!1418154 res!953828) b!1418152))

(assert (= (and b!1418152 res!953829) b!1418156))

(assert (= (and b!1418156 res!953830) b!1418157))

(assert (= (and b!1418157 res!953831) b!1418153))

(declare-fun m!1308899 () Bool)

(assert (=> b!1418154 m!1308899))

(assert (=> b!1418154 m!1308899))

(declare-fun m!1308901 () Bool)

(assert (=> b!1418154 m!1308901))

(declare-fun m!1308903 () Bool)

(assert (=> b!1418152 m!1308903))

(assert (=> b!1418152 m!1308903))

(declare-fun m!1308905 () Bool)

(assert (=> b!1418152 m!1308905))

(declare-fun m!1308907 () Bool)

(assert (=> b!1418156 m!1308907))

(declare-fun m!1308909 () Bool)

(assert (=> b!1418157 m!1308909))

(declare-fun m!1308911 () Bool)

(assert (=> start!122332 m!1308911))

(declare-fun m!1308913 () Bool)

(assert (=> start!122332 m!1308913))

(push 1)

(assert (not b!1418156))

(assert (not start!122332))

(assert (not b!1418154))

(assert (not b!1418152))

(assert (not b!1418157))

(check-sat)

(pop 1)

(push 1)

(check-sat)

