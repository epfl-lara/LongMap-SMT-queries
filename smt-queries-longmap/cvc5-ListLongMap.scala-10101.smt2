; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119100 () Bool)

(assert start!119100)

(declare-fun b!1389460 () Bool)

(declare-fun res!929677 () Bool)

(declare-fun e!787037 () Bool)

(assert (=> b!1389460 (=> (not res!929677) (not e!787037))))

(declare-datatypes ((array!94990 0))(
  ( (array!94991 (arr!45861 (Array (_ BitVec 32) (_ BitVec 64))) (size!46413 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!94990)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389460 (= res!929677 (validKeyInArray!0 (select (arr!45861 a!2901) i!1037)))))

(declare-fun res!929672 () Bool)

(assert (=> start!119100 (=> (not res!929672) (not e!787037))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119100 (= res!929672 (validMask!0 mask!2840))))

(assert (=> start!119100 e!787037))

(assert (=> start!119100 true))

(declare-fun array_inv!35094 (array!94990) Bool)

(assert (=> start!119100 (array_inv!35094 a!2901)))

(declare-fun b!1389461 () Bool)

(declare-fun res!929675 () Bool)

(assert (=> b!1389461 (=> (not res!929675) (not e!787037))))

(declare-datatypes ((List!32458 0))(
  ( (Nil!32455) (Cons!32454 (h!33672 (_ BitVec 64)) (t!47144 List!32458)) )
))
(declare-fun arrayNoDuplicates!0 (array!94990 (_ BitVec 32) List!32458) Bool)

(assert (=> b!1389461 (= res!929675 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32455))))

(declare-fun b!1389462 () Bool)

(declare-fun res!929676 () Bool)

(assert (=> b!1389462 (=> (not res!929676) (not e!787037))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94990 (_ BitVec 32)) Bool)

(assert (=> b!1389462 (= res!929676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389463 () Bool)

(assert (=> b!1389463 (= e!787037 false)))

(declare-datatypes ((SeekEntryResult!10204 0))(
  ( (MissingZero!10204 (index!43187 (_ BitVec 32))) (Found!10204 (index!43188 (_ BitVec 32))) (Intermediate!10204 (undefined!11016 Bool) (index!43189 (_ BitVec 32)) (x!124871 (_ BitVec 32))) (Undefined!10204) (MissingVacant!10204 (index!43190 (_ BitVec 32))) )
))
(declare-fun lt!610394 () SeekEntryResult!10204)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!94990 (_ BitVec 32)) SeekEntryResult!10204)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389463 (= lt!610394 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45861 a!2901) j!112) mask!2840) (select (arr!45861 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1389464 () Bool)

(declare-fun res!929674 () Bool)

(assert (=> b!1389464 (=> (not res!929674) (not e!787037))))

(assert (=> b!1389464 (= res!929674 (and (= (size!46413 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46413 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46413 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389465 () Bool)

(declare-fun res!929673 () Bool)

(assert (=> b!1389465 (=> (not res!929673) (not e!787037))))

(assert (=> b!1389465 (= res!929673 (validKeyInArray!0 (select (arr!45861 a!2901) j!112)))))

(assert (= (and start!119100 res!929672) b!1389464))

(assert (= (and b!1389464 res!929674) b!1389460))

(assert (= (and b!1389460 res!929677) b!1389465))

(assert (= (and b!1389465 res!929673) b!1389462))

(assert (= (and b!1389462 res!929676) b!1389461))

(assert (= (and b!1389461 res!929675) b!1389463))

(declare-fun m!1274651 () Bool)

(assert (=> b!1389460 m!1274651))

(assert (=> b!1389460 m!1274651))

(declare-fun m!1274653 () Bool)

(assert (=> b!1389460 m!1274653))

(declare-fun m!1274655 () Bool)

(assert (=> start!119100 m!1274655))

(declare-fun m!1274657 () Bool)

(assert (=> start!119100 m!1274657))

(declare-fun m!1274659 () Bool)

(assert (=> b!1389465 m!1274659))

(assert (=> b!1389465 m!1274659))

(declare-fun m!1274661 () Bool)

(assert (=> b!1389465 m!1274661))

(declare-fun m!1274663 () Bool)

(assert (=> b!1389462 m!1274663))

(assert (=> b!1389463 m!1274659))

(assert (=> b!1389463 m!1274659))

(declare-fun m!1274665 () Bool)

(assert (=> b!1389463 m!1274665))

(assert (=> b!1389463 m!1274665))

(assert (=> b!1389463 m!1274659))

(declare-fun m!1274667 () Bool)

(assert (=> b!1389463 m!1274667))

(declare-fun m!1274669 () Bool)

(assert (=> b!1389461 m!1274669))

(push 1)

(assert (not b!1389465))

(assert (not b!1389462))

(assert (not b!1389460))

(assert (not start!119100))

(assert (not b!1389463))

(assert (not b!1389461))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

