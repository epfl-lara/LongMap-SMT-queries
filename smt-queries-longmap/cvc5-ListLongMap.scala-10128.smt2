; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119424 () Bool)

(assert start!119424)

(declare-fun b!1391813 () Bool)

(declare-fun e!788147 () Bool)

(declare-fun e!788148 () Bool)

(assert (=> b!1391813 (= e!788147 (not e!788148))))

(declare-fun res!931540 () Bool)

(assert (=> b!1391813 (=> res!931540 e!788148)))

(declare-datatypes ((SeekEntryResult!10282 0))(
  ( (MissingZero!10282 (index!43499 (_ BitVec 32))) (Found!10282 (index!43500 (_ BitVec 32))) (Intermediate!10282 (undefined!11094 Bool) (index!43501 (_ BitVec 32)) (x!125186 (_ BitVec 32))) (Undefined!10282) (MissingVacant!10282 (index!43502 (_ BitVec 32))) )
))
(declare-fun lt!611358 () SeekEntryResult!10282)

(assert (=> b!1391813 (= res!931540 (or (not (is-Intermediate!10282 lt!611358)) (undefined!11094 lt!611358)))))

(declare-fun e!788149 () Bool)

(assert (=> b!1391813 e!788149))

(declare-fun res!931535 () Bool)

(assert (=> b!1391813 (=> (not res!931535) (not e!788149))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95208 0))(
  ( (array!95209 (arr!45965 (Array (_ BitVec 32) (_ BitVec 64))) (size!46515 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95208)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95208 (_ BitVec 32)) Bool)

(assert (=> b!1391813 (= res!931535 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46568 0))(
  ( (Unit!46569) )
))
(declare-fun lt!611357 () Unit!46568)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95208 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46568)

(assert (=> b!1391813 (= lt!611357 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95208 (_ BitVec 32)) SeekEntryResult!10282)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391813 (= lt!611358 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45965 a!2901) j!112) mask!2840) (select (arr!45965 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391814 () Bool)

(declare-fun res!931536 () Bool)

(assert (=> b!1391814 (=> (not res!931536) (not e!788147))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1391814 (= res!931536 (and (= (size!46515 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46515 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46515 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!931539 () Bool)

(assert (=> start!119424 (=> (not res!931539) (not e!788147))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119424 (= res!931539 (validMask!0 mask!2840))))

(assert (=> start!119424 e!788147))

(assert (=> start!119424 true))

(declare-fun array_inv!34993 (array!95208) Bool)

(assert (=> start!119424 (array_inv!34993 a!2901)))

(declare-fun b!1391815 () Bool)

(declare-fun res!931533 () Bool)

(assert (=> b!1391815 (=> (not res!931533) (not e!788147))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391815 (= res!931533 (validKeyInArray!0 (select (arr!45965 a!2901) i!1037)))))

(declare-fun b!1391816 () Bool)

(declare-fun res!931538 () Bool)

(assert (=> b!1391816 (=> (not res!931538) (not e!788147))))

(declare-datatypes ((List!32484 0))(
  ( (Nil!32481) (Cons!32480 (h!33707 (_ BitVec 64)) (t!47178 List!32484)) )
))
(declare-fun arrayNoDuplicates!0 (array!95208 (_ BitVec 32) List!32484) Bool)

(assert (=> b!1391816 (= res!931538 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32481))))

(declare-fun b!1391817 () Bool)

(assert (=> b!1391817 (= e!788148 true)))

(declare-fun lt!611356 () (_ BitVec 32))

(assert (=> b!1391817 (= lt!611356 (toIndex!0 (select (store (arr!45965 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun b!1391818 () Bool)

(declare-fun res!931537 () Bool)

(assert (=> b!1391818 (=> (not res!931537) (not e!788147))))

(assert (=> b!1391818 (= res!931537 (validKeyInArray!0 (select (arr!45965 a!2901) j!112)))))

(declare-fun b!1391819 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95208 (_ BitVec 32)) SeekEntryResult!10282)

(assert (=> b!1391819 (= e!788149 (= (seekEntryOrOpen!0 (select (arr!45965 a!2901) j!112) a!2901 mask!2840) (Found!10282 j!112)))))

(declare-fun b!1391820 () Bool)

(declare-fun res!931534 () Bool)

(assert (=> b!1391820 (=> (not res!931534) (not e!788147))))

(assert (=> b!1391820 (= res!931534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!119424 res!931539) b!1391814))

(assert (= (and b!1391814 res!931536) b!1391815))

(assert (= (and b!1391815 res!931533) b!1391818))

(assert (= (and b!1391818 res!931537) b!1391820))

(assert (= (and b!1391820 res!931534) b!1391816))

(assert (= (and b!1391816 res!931538) b!1391813))

(assert (= (and b!1391813 res!931535) b!1391819))

(assert (= (and b!1391813 (not res!931540)) b!1391817))

(declare-fun m!1277523 () Bool)

(assert (=> b!1391820 m!1277523))

(declare-fun m!1277525 () Bool)

(assert (=> b!1391818 m!1277525))

(assert (=> b!1391818 m!1277525))

(declare-fun m!1277527 () Bool)

(assert (=> b!1391818 m!1277527))

(assert (=> b!1391819 m!1277525))

(assert (=> b!1391819 m!1277525))

(declare-fun m!1277529 () Bool)

(assert (=> b!1391819 m!1277529))

(declare-fun m!1277531 () Bool)

(assert (=> start!119424 m!1277531))

(declare-fun m!1277533 () Bool)

(assert (=> start!119424 m!1277533))

(assert (=> b!1391813 m!1277525))

(declare-fun m!1277535 () Bool)

(assert (=> b!1391813 m!1277535))

(assert (=> b!1391813 m!1277525))

(declare-fun m!1277537 () Bool)

(assert (=> b!1391813 m!1277537))

(assert (=> b!1391813 m!1277535))

(assert (=> b!1391813 m!1277525))

(declare-fun m!1277539 () Bool)

(assert (=> b!1391813 m!1277539))

(declare-fun m!1277541 () Bool)

(assert (=> b!1391813 m!1277541))

(declare-fun m!1277543 () Bool)

(assert (=> b!1391817 m!1277543))

(declare-fun m!1277545 () Bool)

(assert (=> b!1391817 m!1277545))

(assert (=> b!1391817 m!1277545))

(declare-fun m!1277547 () Bool)

(assert (=> b!1391817 m!1277547))

(declare-fun m!1277549 () Bool)

(assert (=> b!1391815 m!1277549))

(assert (=> b!1391815 m!1277549))

(declare-fun m!1277551 () Bool)

(assert (=> b!1391815 m!1277551))

(declare-fun m!1277553 () Bool)

(assert (=> b!1391816 m!1277553))

(push 1)

(assert (not b!1391817))

(assert (not b!1391819))

(assert (not b!1391816))

(assert (not b!1391815))

(assert (not b!1391820))

(assert (not b!1391818))

(assert (not start!119424))

(assert (not b!1391813))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

