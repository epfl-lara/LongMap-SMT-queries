; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120622 () Bool)

(assert start!120622)

(declare-fun b!1404385 () Bool)

(declare-fun res!942900 () Bool)

(declare-fun e!795022 () Bool)

(assert (=> b!1404385 (=> (not res!942900) (not e!795022))))

(declare-datatypes ((array!96031 0))(
  ( (array!96032 (arr!46366 (Array (_ BitVec 32) (_ BitVec 64))) (size!46916 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96031)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404385 (= res!942900 (validKeyInArray!0 (select (arr!46366 a!2901) j!112)))))

(declare-fun b!1404386 () Bool)

(declare-fun res!942898 () Bool)

(assert (=> b!1404386 (=> (not res!942898) (not e!795022))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1404386 (= res!942898 (and (= (size!46916 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46916 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46916 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1404387 () Bool)

(declare-fun res!942896 () Bool)

(assert (=> b!1404387 (=> (not res!942896) (not e!795022))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96031 (_ BitVec 32)) Bool)

(assert (=> b!1404387 (= res!942896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1404388 () Bool)

(declare-fun res!942899 () Bool)

(assert (=> b!1404388 (=> (not res!942899) (not e!795022))))

(declare-datatypes ((List!32885 0))(
  ( (Nil!32882) (Cons!32881 (h!34129 (_ BitVec 64)) (t!47579 List!32885)) )
))
(declare-fun arrayNoDuplicates!0 (array!96031 (_ BitVec 32) List!32885) Bool)

(assert (=> b!1404388 (= res!942899 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32882))))

(declare-fun b!1404390 () Bool)

(declare-fun res!942897 () Bool)

(assert (=> b!1404390 (=> (not res!942897) (not e!795022))))

(assert (=> b!1404390 (= res!942897 (validKeyInArray!0 (select (arr!46366 a!2901) i!1037)))))

(declare-fun b!1404389 () Bool)

(assert (=> b!1404389 (= e!795022 false)))

(declare-datatypes ((SeekEntryResult!10677 0))(
  ( (MissingZero!10677 (index!45085 (_ BitVec 32))) (Found!10677 (index!45086 (_ BitVec 32))) (Intermediate!10677 (undefined!11489 Bool) (index!45087 (_ BitVec 32)) (x!126696 (_ BitVec 32))) (Undefined!10677) (MissingVacant!10677 (index!45088 (_ BitVec 32))) )
))
(declare-fun lt!618636 () SeekEntryResult!10677)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96031 (_ BitVec 32)) SeekEntryResult!10677)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404389 (= lt!618636 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46366 a!2901) j!112) mask!2840) (select (arr!46366 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!942901 () Bool)

(assert (=> start!120622 (=> (not res!942901) (not e!795022))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120622 (= res!942901 (validMask!0 mask!2840))))

(assert (=> start!120622 e!795022))

(assert (=> start!120622 true))

(declare-fun array_inv!35394 (array!96031) Bool)

(assert (=> start!120622 (array_inv!35394 a!2901)))

(assert (= (and start!120622 res!942901) b!1404386))

(assert (= (and b!1404386 res!942898) b!1404390))

(assert (= (and b!1404390 res!942897) b!1404385))

(assert (= (and b!1404385 res!942900) b!1404387))

(assert (= (and b!1404387 res!942896) b!1404388))

(assert (= (and b!1404388 res!942899) b!1404389))

(declare-fun m!1293217 () Bool)

(assert (=> b!1404389 m!1293217))

(assert (=> b!1404389 m!1293217))

(declare-fun m!1293219 () Bool)

(assert (=> b!1404389 m!1293219))

(assert (=> b!1404389 m!1293219))

(assert (=> b!1404389 m!1293217))

(declare-fun m!1293221 () Bool)

(assert (=> b!1404389 m!1293221))

(declare-fun m!1293223 () Bool)

(assert (=> b!1404388 m!1293223))

(declare-fun m!1293225 () Bool)

(assert (=> start!120622 m!1293225))

(declare-fun m!1293227 () Bool)

(assert (=> start!120622 m!1293227))

(assert (=> b!1404385 m!1293217))

(assert (=> b!1404385 m!1293217))

(declare-fun m!1293229 () Bool)

(assert (=> b!1404385 m!1293229))

(declare-fun m!1293231 () Bool)

(assert (=> b!1404390 m!1293231))

(assert (=> b!1404390 m!1293231))

(declare-fun m!1293233 () Bool)

(assert (=> b!1404390 m!1293233))

(declare-fun m!1293235 () Bool)

(assert (=> b!1404387 m!1293235))

(push 1)

(assert (not b!1404387))

(assert (not b!1404388))

(assert (not b!1404385))

(assert (not start!120622))

(assert (not b!1404389))

(assert (not b!1404390))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

