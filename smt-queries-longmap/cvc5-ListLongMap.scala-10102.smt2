; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119298 () Bool)

(assert start!119298)

(declare-fun b!1390735 () Bool)

(declare-fun res!930217 () Bool)

(declare-fun e!787832 () Bool)

(assert (=> b!1390735 (=> (not res!930217) (not e!787832))))

(declare-datatypes ((array!95157 0))(
  ( (array!95158 (arr!45942 (Array (_ BitVec 32) (_ BitVec 64))) (size!46493 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95157)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95157 (_ BitVec 32)) Bool)

(assert (=> b!1390735 (= res!930217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1390736 () Bool)

(declare-fun res!930216 () Bool)

(assert (=> b!1390736 (=> (not res!930216) (not e!787832))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1390736 (= res!930216 (and (= (size!46493 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46493 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46493 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390737 () Bool)

(assert (=> b!1390737 (= e!787832 false)))

(declare-datatypes ((SeekEntryResult!10162 0))(
  ( (MissingZero!10162 (index!43019 (_ BitVec 32))) (Found!10162 (index!43020 (_ BitVec 32))) (Intermediate!10162 (undefined!10974 Bool) (index!43021 (_ BitVec 32)) (x!124859 (_ BitVec 32))) (Undefined!10162) (MissingVacant!10162 (index!43022 (_ BitVec 32))) )
))
(declare-fun lt!610991 () SeekEntryResult!10162)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95157 (_ BitVec 32)) SeekEntryResult!10162)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390737 (= lt!610991 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45942 a!2901) j!112) mask!2840) (select (arr!45942 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390738 () Bool)

(declare-fun res!930214 () Bool)

(assert (=> b!1390738 (=> (not res!930214) (not e!787832))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390738 (= res!930214 (validKeyInArray!0 (select (arr!45942 a!2901) j!112)))))

(declare-fun res!930213 () Bool)

(assert (=> start!119298 (=> (not res!930213) (not e!787832))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119298 (= res!930213 (validMask!0 mask!2840))))

(assert (=> start!119298 e!787832))

(assert (=> start!119298 true))

(declare-fun array_inv!35223 (array!95157) Bool)

(assert (=> start!119298 (array_inv!35223 a!2901)))

(declare-fun b!1390739 () Bool)

(declare-fun res!930215 () Bool)

(assert (=> b!1390739 (=> (not res!930215) (not e!787832))))

(assert (=> b!1390739 (= res!930215 (validKeyInArray!0 (select (arr!45942 a!2901) i!1037)))))

(declare-fun b!1390740 () Bool)

(declare-fun res!930212 () Bool)

(assert (=> b!1390740 (=> (not res!930212) (not e!787832))))

(declare-datatypes ((List!32448 0))(
  ( (Nil!32445) (Cons!32444 (h!33670 (_ BitVec 64)) (t!47134 List!32448)) )
))
(declare-fun arrayNoDuplicates!0 (array!95157 (_ BitVec 32) List!32448) Bool)

(assert (=> b!1390740 (= res!930212 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32445))))

(assert (= (and start!119298 res!930213) b!1390736))

(assert (= (and b!1390736 res!930216) b!1390739))

(assert (= (and b!1390739 res!930215) b!1390738))

(assert (= (and b!1390738 res!930214) b!1390735))

(assert (= (and b!1390735 res!930217) b!1390740))

(assert (= (and b!1390740 res!930212) b!1390737))

(declare-fun m!1276619 () Bool)

(assert (=> b!1390735 m!1276619))

(declare-fun m!1276621 () Bool)

(assert (=> b!1390738 m!1276621))

(assert (=> b!1390738 m!1276621))

(declare-fun m!1276623 () Bool)

(assert (=> b!1390738 m!1276623))

(assert (=> b!1390737 m!1276621))

(assert (=> b!1390737 m!1276621))

(declare-fun m!1276625 () Bool)

(assert (=> b!1390737 m!1276625))

(assert (=> b!1390737 m!1276625))

(assert (=> b!1390737 m!1276621))

(declare-fun m!1276627 () Bool)

(assert (=> b!1390737 m!1276627))

(declare-fun m!1276629 () Bool)

(assert (=> b!1390739 m!1276629))

(assert (=> b!1390739 m!1276629))

(declare-fun m!1276631 () Bool)

(assert (=> b!1390739 m!1276631))

(declare-fun m!1276633 () Bool)

(assert (=> start!119298 m!1276633))

(declare-fun m!1276635 () Bool)

(assert (=> start!119298 m!1276635))

(declare-fun m!1276637 () Bool)

(assert (=> b!1390740 m!1276637))

(push 1)

(assert (not b!1390737))

(assert (not b!1390738))

(assert (not start!119298))

(assert (not b!1390739))

(assert (not b!1390735))

(assert (not b!1390740))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

