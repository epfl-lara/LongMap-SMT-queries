; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119598 () Bool)

(assert start!119598)

(declare-fun b!1393082 () Bool)

(declare-fun res!932548 () Bool)

(declare-fun e!788842 () Bool)

(assert (=> b!1393082 (=> (not res!932548) (not e!788842))))

(declare-datatypes ((array!95233 0))(
  ( (array!95234 (arr!45975 (Array (_ BitVec 32) (_ BitVec 64))) (size!46527 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95233)

(declare-datatypes ((List!32572 0))(
  ( (Nil!32569) (Cons!32568 (h!33801 (_ BitVec 64)) (t!47258 List!32572)) )
))
(declare-fun arrayNoDuplicates!0 (array!95233 (_ BitVec 32) List!32572) Bool)

(assert (=> b!1393082 (= res!932548 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32569))))

(declare-fun res!932545 () Bool)

(assert (=> start!119598 (=> (not res!932545) (not e!788842))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119598 (= res!932545 (validMask!0 mask!2840))))

(assert (=> start!119598 e!788842))

(assert (=> start!119598 true))

(declare-fun array_inv!35208 (array!95233) Bool)

(assert (=> start!119598 (array_inv!35208 a!2901)))

(declare-fun b!1393083 () Bool)

(declare-fun res!932546 () Bool)

(assert (=> b!1393083 (=> (not res!932546) (not e!788842))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393083 (= res!932546 (validKeyInArray!0 (select (arr!45975 a!2901) j!112)))))

(declare-fun b!1393084 () Bool)

(declare-fun res!932542 () Bool)

(assert (=> b!1393084 (=> (not res!932542) (not e!788842))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95233 (_ BitVec 32)) Bool)

(assert (=> b!1393084 (= res!932542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393085 () Bool)

(declare-fun e!788841 () Bool)

(assert (=> b!1393085 (= e!788841 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10318 0))(
  ( (MissingZero!10318 (index!43643 (_ BitVec 32))) (Found!10318 (index!43644 (_ BitVec 32))) (Intermediate!10318 (undefined!11130 Bool) (index!43645 (_ BitVec 32)) (x!125319 (_ BitVec 32))) (Undefined!10318) (MissingVacant!10318 (index!43646 (_ BitVec 32))) )
))
(declare-fun lt!611697 () SeekEntryResult!10318)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95233 (_ BitVec 32)) SeekEntryResult!10318)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393085 (= lt!611697 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45975 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!45975 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95234 (store (arr!45975 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46527 a!2901)) mask!2840))))

(declare-fun b!1393086 () Bool)

(declare-fun res!932541 () Bool)

(assert (=> b!1393086 (=> (not res!932541) (not e!788842))))

(assert (=> b!1393086 (= res!932541 (and (= (size!46527 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46527 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46527 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393087 () Bool)

(assert (=> b!1393087 (= e!788842 (not e!788841))))

(declare-fun res!932547 () Bool)

(assert (=> b!1393087 (=> res!932547 e!788841)))

(declare-fun lt!611698 () SeekEntryResult!10318)

(assert (=> b!1393087 (= res!932547 (or (not (is-Intermediate!10318 lt!611698)) (undefined!11130 lt!611698)))))

(declare-fun e!788843 () Bool)

(assert (=> b!1393087 e!788843))

(declare-fun res!932543 () Bool)

(assert (=> b!1393087 (=> (not res!932543) (not e!788843))))

(assert (=> b!1393087 (= res!932543 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46483 0))(
  ( (Unit!46484) )
))
(declare-fun lt!611699 () Unit!46483)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95233 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46483)

(assert (=> b!1393087 (= lt!611699 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1393087 (= lt!611698 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45975 a!2901) j!112) mask!2840) (select (arr!45975 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393088 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95233 (_ BitVec 32)) SeekEntryResult!10318)

(assert (=> b!1393088 (= e!788843 (= (seekEntryOrOpen!0 (select (arr!45975 a!2901) j!112) a!2901 mask!2840) (Found!10318 j!112)))))

(declare-fun b!1393089 () Bool)

(declare-fun res!932544 () Bool)

(assert (=> b!1393089 (=> (not res!932544) (not e!788842))))

(assert (=> b!1393089 (= res!932544 (validKeyInArray!0 (select (arr!45975 a!2901) i!1037)))))

(assert (= (and start!119598 res!932545) b!1393086))

(assert (= (and b!1393086 res!932541) b!1393089))

(assert (= (and b!1393089 res!932544) b!1393083))

(assert (= (and b!1393083 res!932546) b!1393084))

(assert (= (and b!1393084 res!932542) b!1393082))

(assert (= (and b!1393082 res!932548) b!1393087))

(assert (= (and b!1393087 res!932543) b!1393088))

(assert (= (and b!1393087 (not res!932547)) b!1393085))

(declare-fun m!1278423 () Bool)

(assert (=> b!1393084 m!1278423))

(declare-fun m!1278425 () Bool)

(assert (=> b!1393088 m!1278425))

(assert (=> b!1393088 m!1278425))

(declare-fun m!1278427 () Bool)

(assert (=> b!1393088 m!1278427))

(declare-fun m!1278429 () Bool)

(assert (=> b!1393089 m!1278429))

(assert (=> b!1393089 m!1278429))

(declare-fun m!1278431 () Bool)

(assert (=> b!1393089 m!1278431))

(assert (=> b!1393087 m!1278425))

(declare-fun m!1278433 () Bool)

(assert (=> b!1393087 m!1278433))

(assert (=> b!1393087 m!1278425))

(declare-fun m!1278435 () Bool)

(assert (=> b!1393087 m!1278435))

(assert (=> b!1393087 m!1278433))

(assert (=> b!1393087 m!1278425))

(declare-fun m!1278437 () Bool)

(assert (=> b!1393087 m!1278437))

(declare-fun m!1278439 () Bool)

(assert (=> b!1393087 m!1278439))

(declare-fun m!1278441 () Bool)

(assert (=> b!1393085 m!1278441))

(declare-fun m!1278443 () Bool)

(assert (=> b!1393085 m!1278443))

(assert (=> b!1393085 m!1278443))

(declare-fun m!1278445 () Bool)

(assert (=> b!1393085 m!1278445))

(assert (=> b!1393085 m!1278445))

(assert (=> b!1393085 m!1278443))

(declare-fun m!1278447 () Bool)

(assert (=> b!1393085 m!1278447))

(assert (=> b!1393083 m!1278425))

(assert (=> b!1393083 m!1278425))

(declare-fun m!1278449 () Bool)

(assert (=> b!1393083 m!1278449))

(declare-fun m!1278451 () Bool)

(assert (=> start!119598 m!1278451))

(declare-fun m!1278453 () Bool)

(assert (=> start!119598 m!1278453))

(declare-fun m!1278455 () Bool)

(assert (=> b!1393082 m!1278455))

(push 1)

(assert (not b!1393089))

(assert (not b!1393083))

(assert (not b!1393088))

(assert (not b!1393084))

(assert (not start!119598))

(assert (not b!1393087))

(assert (not b!1393082))

(assert (not b!1393085))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

