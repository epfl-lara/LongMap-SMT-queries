; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122376 () Bool)

(assert start!122376)

(declare-fun b!1418628 () Bool)

(declare-fun res!953674 () Bool)

(declare-fun e!802969 () Bool)

(assert (=> b!1418628 (=> (not res!953674) (not e!802969))))

(declare-datatypes ((array!96882 0))(
  ( (array!96883 (arr!46767 (Array (_ BitVec 32) (_ BitVec 64))) (size!47318 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96882)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418628 (= res!953674 (validKeyInArray!0 (select (arr!46767 a!2901) i!1037)))))

(declare-fun res!953675 () Bool)

(assert (=> start!122376 (=> (not res!953675) (not e!802969))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122376 (= res!953675 (validMask!0 mask!2840))))

(assert (=> start!122376 e!802969))

(assert (=> start!122376 true))

(declare-fun array_inv!36048 (array!96882) Bool)

(assert (=> start!122376 (array_inv!36048 a!2901)))

(declare-fun b!1418629 () Bool)

(declare-fun res!953677 () Bool)

(assert (=> b!1418629 (=> (not res!953677) (not e!802969))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96882 (_ BitVec 32)) Bool)

(assert (=> b!1418629 (= res!953677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1418630 () Bool)

(assert (=> b!1418630 (= e!802969 (not true))))

(declare-fun e!802970 () Bool)

(assert (=> b!1418630 e!802970))

(declare-fun res!953680 () Bool)

(assert (=> b!1418630 (=> (not res!953680) (not e!802970))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1418630 (= res!953680 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47963 0))(
  ( (Unit!47964) )
))
(declare-fun lt!625784 () Unit!47963)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96882 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47963)

(assert (=> b!1418630 (= lt!625784 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10981 0))(
  ( (MissingZero!10981 (index!46316 (_ BitVec 32))) (Found!10981 (index!46317 (_ BitVec 32))) (Intermediate!10981 (undefined!11793 Bool) (index!46318 (_ BitVec 32)) (x!128067 (_ BitVec 32))) (Undefined!10981) (MissingVacant!10981 (index!46319 (_ BitVec 32))) )
))
(declare-fun lt!625783 () SeekEntryResult!10981)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96882 (_ BitVec 32)) SeekEntryResult!10981)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418630 (= lt!625783 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46767 a!2901) j!112) mask!2840) (select (arr!46767 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1418631 () Bool)

(declare-fun res!953676 () Bool)

(assert (=> b!1418631 (=> (not res!953676) (not e!802969))))

(assert (=> b!1418631 (= res!953676 (and (= (size!47318 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47318 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47318 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1418632 () Bool)

(declare-fun res!953678 () Bool)

(assert (=> b!1418632 (=> (not res!953678) (not e!802969))))

(declare-datatypes ((List!33273 0))(
  ( (Nil!33270) (Cons!33269 (h!34570 (_ BitVec 64)) (t!47959 List!33273)) )
))
(declare-fun arrayNoDuplicates!0 (array!96882 (_ BitVec 32) List!33273) Bool)

(assert (=> b!1418632 (= res!953678 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33270))))

(declare-fun b!1418633 () Bool)

(declare-fun res!953679 () Bool)

(assert (=> b!1418633 (=> (not res!953679) (not e!802969))))

(assert (=> b!1418633 (= res!953679 (validKeyInArray!0 (select (arr!46767 a!2901) j!112)))))

(declare-fun b!1418634 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96882 (_ BitVec 32)) SeekEntryResult!10981)

(assert (=> b!1418634 (= e!802970 (= (seekEntryOrOpen!0 (select (arr!46767 a!2901) j!112) a!2901 mask!2840) (Found!10981 j!112)))))

(assert (= (and start!122376 res!953675) b!1418631))

(assert (= (and b!1418631 res!953676) b!1418628))

(assert (= (and b!1418628 res!953674) b!1418633))

(assert (= (and b!1418633 res!953679) b!1418629))

(assert (= (and b!1418629 res!953677) b!1418632))

(assert (= (and b!1418632 res!953678) b!1418630))

(assert (= (and b!1418630 res!953680) b!1418634))

(declare-fun m!1309589 () Bool)

(assert (=> b!1418630 m!1309589))

(declare-fun m!1309591 () Bool)

(assert (=> b!1418630 m!1309591))

(assert (=> b!1418630 m!1309589))

(declare-fun m!1309593 () Bool)

(assert (=> b!1418630 m!1309593))

(assert (=> b!1418630 m!1309591))

(assert (=> b!1418630 m!1309589))

(declare-fun m!1309595 () Bool)

(assert (=> b!1418630 m!1309595))

(declare-fun m!1309597 () Bool)

(assert (=> b!1418630 m!1309597))

(declare-fun m!1309599 () Bool)

(assert (=> start!122376 m!1309599))

(declare-fun m!1309601 () Bool)

(assert (=> start!122376 m!1309601))

(declare-fun m!1309603 () Bool)

(assert (=> b!1418632 m!1309603))

(assert (=> b!1418633 m!1309589))

(assert (=> b!1418633 m!1309589))

(declare-fun m!1309605 () Bool)

(assert (=> b!1418633 m!1309605))

(declare-fun m!1309607 () Bool)

(assert (=> b!1418628 m!1309607))

(assert (=> b!1418628 m!1309607))

(declare-fun m!1309609 () Bool)

(assert (=> b!1418628 m!1309609))

(assert (=> b!1418634 m!1309589))

(assert (=> b!1418634 m!1309589))

(declare-fun m!1309611 () Bool)

(assert (=> b!1418634 m!1309611))

(declare-fun m!1309613 () Bool)

(assert (=> b!1418629 m!1309613))

(push 1)

(assert (not b!1418634))

(assert (not start!122376))

(assert (not b!1418629))

(assert (not b!1418632))

(assert (not b!1418628))

(assert (not b!1418633))

(assert (not b!1418630))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

