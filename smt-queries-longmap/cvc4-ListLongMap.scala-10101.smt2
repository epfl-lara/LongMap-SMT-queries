; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119104 () Bool)

(assert start!119104)

(declare-fun res!929707 () Bool)

(declare-fun e!787075 () Bool)

(assert (=> start!119104 (=> (not res!929707) (not e!787075))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119104 (= res!929707 (validMask!0 mask!2840))))

(assert (=> start!119104 e!787075))

(assert (=> start!119104 true))

(declare-datatypes ((array!95041 0))(
  ( (array!95042 (arr!45886 (Array (_ BitVec 32) (_ BitVec 64))) (size!46436 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95041)

(declare-fun array_inv!34914 (array!95041) Bool)

(assert (=> start!119104 (array_inv!34914 a!2901)))

(declare-fun b!1389541 () Bool)

(declare-fun res!929704 () Bool)

(assert (=> b!1389541 (=> (not res!929704) (not e!787075))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95041 (_ BitVec 32)) Bool)

(assert (=> b!1389541 (= res!929704 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389542 () Bool)

(declare-fun res!929703 () Bool)

(assert (=> b!1389542 (=> (not res!929703) (not e!787075))))

(declare-datatypes ((List!32405 0))(
  ( (Nil!32402) (Cons!32401 (h!33619 (_ BitVec 64)) (t!47099 List!32405)) )
))
(declare-fun arrayNoDuplicates!0 (array!95041 (_ BitVec 32) List!32405) Bool)

(assert (=> b!1389542 (= res!929703 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32402))))

(declare-fun b!1389543 () Bool)

(declare-fun res!929705 () Bool)

(assert (=> b!1389543 (=> (not res!929705) (not e!787075))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389543 (= res!929705 (validKeyInArray!0 (select (arr!45886 a!2901) j!112)))))

(declare-fun b!1389544 () Bool)

(declare-fun res!929706 () Bool)

(assert (=> b!1389544 (=> (not res!929706) (not e!787075))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1389544 (= res!929706 (validKeyInArray!0 (select (arr!45886 a!2901) i!1037)))))

(declare-fun b!1389545 () Bool)

(assert (=> b!1389545 (= e!787075 false)))

(declare-datatypes ((SeekEntryResult!10203 0))(
  ( (MissingZero!10203 (index!43183 (_ BitVec 32))) (Found!10203 (index!43184 (_ BitVec 32))) (Intermediate!10203 (undefined!11015 Bool) (index!43185 (_ BitVec 32)) (x!124873 (_ BitVec 32))) (Undefined!10203) (MissingVacant!10203 (index!43186 (_ BitVec 32))) )
))
(declare-fun lt!610584 () SeekEntryResult!10203)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95041 (_ BitVec 32)) SeekEntryResult!10203)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389545 (= lt!610584 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45886 a!2901) j!112) mask!2840) (select (arr!45886 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1389546 () Bool)

(declare-fun res!929702 () Bool)

(assert (=> b!1389546 (=> (not res!929702) (not e!787075))))

(assert (=> b!1389546 (= res!929702 (and (= (size!46436 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46436 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46436 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119104 res!929707) b!1389546))

(assert (= (and b!1389546 res!929702) b!1389544))

(assert (= (and b!1389544 res!929706) b!1389543))

(assert (= (and b!1389543 res!929705) b!1389541))

(assert (= (and b!1389541 res!929704) b!1389542))

(assert (= (and b!1389542 res!929703) b!1389545))

(declare-fun m!1275187 () Bool)

(assert (=> b!1389545 m!1275187))

(assert (=> b!1389545 m!1275187))

(declare-fun m!1275189 () Bool)

(assert (=> b!1389545 m!1275189))

(assert (=> b!1389545 m!1275189))

(assert (=> b!1389545 m!1275187))

(declare-fun m!1275191 () Bool)

(assert (=> b!1389545 m!1275191))

(declare-fun m!1275193 () Bool)

(assert (=> start!119104 m!1275193))

(declare-fun m!1275195 () Bool)

(assert (=> start!119104 m!1275195))

(assert (=> b!1389543 m!1275187))

(assert (=> b!1389543 m!1275187))

(declare-fun m!1275197 () Bool)

(assert (=> b!1389543 m!1275197))

(declare-fun m!1275199 () Bool)

(assert (=> b!1389544 m!1275199))

(assert (=> b!1389544 m!1275199))

(declare-fun m!1275201 () Bool)

(assert (=> b!1389544 m!1275201))

(declare-fun m!1275203 () Bool)

(assert (=> b!1389542 m!1275203))

(declare-fun m!1275205 () Bool)

(assert (=> b!1389541 m!1275205))

(push 1)

(assert (not b!1389541))

(assert (not b!1389542))

(assert (not b!1389544))

(assert (not b!1389543))

(assert (not b!1389545))

(assert (not start!119104))

(check-sat)

(pop 1)

(push 1)

(check-sat)

