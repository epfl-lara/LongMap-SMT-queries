; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124690 () Bool)

(assert start!124690)

(declare-fun b!1445621 () Bool)

(declare-fun res!977571 () Bool)

(declare-fun e!814281 () Bool)

(assert (=> b!1445621 (=> (not res!977571) (not e!814281))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11624 0))(
  ( (MissingZero!11624 (index!48888 (_ BitVec 32))) (Found!11624 (index!48889 (_ BitVec 32))) (Intermediate!11624 (undefined!12436 Bool) (index!48890 (_ BitVec 32)) (x!130572 (_ BitVec 32))) (Undefined!11624) (MissingVacant!11624 (index!48891 (_ BitVec 32))) )
))
(declare-fun lt!634375 () SeekEntryResult!11624)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98116 0))(
  ( (array!98117 (arr!47347 (Array (_ BitVec 32) (_ BitVec 64))) (size!47899 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98116)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98116 (_ BitVec 32)) SeekEntryResult!11624)

(assert (=> b!1445621 (= res!977571 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47347 a!2862) j!93) a!2862 mask!2687) lt!634375))))

(declare-fun b!1445622 () Bool)

(declare-fun res!977579 () Bool)

(declare-fun e!814284 () Bool)

(assert (=> b!1445622 (=> (not res!977579) (not e!814284))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98116 (_ BitVec 32)) Bool)

(assert (=> b!1445622 (= res!977579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1445623 () Bool)

(declare-fun res!977574 () Bool)

(assert (=> b!1445623 (=> (not res!977574) (not e!814284))))

(declare-datatypes ((List!33926 0))(
  ( (Nil!33923) (Cons!33922 (h!35272 (_ BitVec 64)) (t!48612 List!33926)) )
))
(declare-fun arrayNoDuplicates!0 (array!98116 (_ BitVec 32) List!33926) Bool)

(assert (=> b!1445623 (= res!977574 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33923))))

(declare-fun res!977573 () Bool)

(assert (=> start!124690 (=> (not res!977573) (not e!814284))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124690 (= res!977573 (validMask!0 mask!2687))))

(assert (=> start!124690 e!814284))

(assert (=> start!124690 true))

(declare-fun array_inv!36580 (array!98116) Bool)

(assert (=> start!124690 (array_inv!36580 a!2862)))

(declare-fun b!1445624 () Bool)

(declare-fun e!814286 () Bool)

(assert (=> b!1445624 (= e!814284 e!814286)))

(declare-fun res!977576 () Bool)

(assert (=> b!1445624 (=> (not res!977576) (not e!814286))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1445624 (= res!977576 (= (select (store (arr!47347 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!634376 () array!98116)

(assert (=> b!1445624 (= lt!634376 (array!98117 (store (arr!47347 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47899 a!2862)))))

(declare-fun b!1445625 () Bool)

(declare-fun e!814282 () Bool)

(assert (=> b!1445625 (= e!814281 e!814282)))

(declare-fun res!977580 () Bool)

(assert (=> b!1445625 (=> (not res!977580) (not e!814282))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!634373 () SeekEntryResult!11624)

(assert (=> b!1445625 (= res!977580 (= lt!634373 (Intermediate!11624 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!634374 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1445625 (= lt!634373 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634374 mask!2687) lt!634374 lt!634376 mask!2687))))

(assert (=> b!1445625 (= lt!634374 (select (store (arr!47347 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1445626 () Bool)

(declare-fun res!977578 () Bool)

(assert (=> b!1445626 (=> (not res!977578) (not e!814282))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1445626 (= res!977578 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1445627 () Bool)

(assert (=> b!1445627 (= e!814286 e!814281)))

(declare-fun res!977581 () Bool)

(assert (=> b!1445627 (=> (not res!977581) (not e!814281))))

(assert (=> b!1445627 (= res!977581 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47347 a!2862) j!93) mask!2687) (select (arr!47347 a!2862) j!93) a!2862 mask!2687) lt!634375))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1445627 (= lt!634375 (Intermediate!11624 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1445628 () Bool)

(declare-fun res!977568 () Bool)

(assert (=> b!1445628 (=> (not res!977568) (not e!814284))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1445628 (= res!977568 (validKeyInArray!0 (select (arr!47347 a!2862) i!1006)))))

(declare-fun b!1445629 () Bool)

(declare-fun res!977567 () Bool)

(assert (=> b!1445629 (=> (not res!977567) (not e!814282))))

(declare-fun e!814285 () Bool)

(assert (=> b!1445629 (= res!977567 e!814285)))

(declare-fun c!133540 () Bool)

(assert (=> b!1445629 (= c!133540 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1445630 () Bool)

(declare-fun e!814283 () Bool)

(assert (=> b!1445630 (= e!814283 (or (= (select (arr!47347 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47347 a!2862) intermediateBeforeIndex!19) (select (arr!47347 a!2862) j!93))))))

(declare-fun b!1445631 () Bool)

(assert (=> b!1445631 (= e!814285 (= lt!634373 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634374 lt!634376 mask!2687)))))

(declare-fun b!1445632 () Bool)

(declare-fun res!977570 () Bool)

(assert (=> b!1445632 (=> (not res!977570) (not e!814284))))

(assert (=> b!1445632 (= res!977570 (and (= (size!47899 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47899 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47899 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1445633 () Bool)

(assert (=> b!1445633 (= e!814282 (not true))))

(assert (=> b!1445633 e!814283))

(declare-fun res!977577 () Bool)

(assert (=> b!1445633 (=> (not res!977577) (not e!814283))))

(assert (=> b!1445633 (= res!977577 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48585 0))(
  ( (Unit!48586) )
))
(declare-fun lt!634377 () Unit!48585)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98116 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48585)

(assert (=> b!1445633 (= lt!634377 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1445634 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98116 (_ BitVec 32)) SeekEntryResult!11624)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98116 (_ BitVec 32)) SeekEntryResult!11624)

(assert (=> b!1445634 (= e!814285 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634374 lt!634376 mask!2687) (seekEntryOrOpen!0 lt!634374 lt!634376 mask!2687)))))

(declare-fun b!1445635 () Bool)

(declare-fun res!977569 () Bool)

(assert (=> b!1445635 (=> (not res!977569) (not e!814284))))

(assert (=> b!1445635 (= res!977569 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47899 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47899 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47899 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1445636 () Bool)

(declare-fun res!977575 () Bool)

(assert (=> b!1445636 (=> (not res!977575) (not e!814284))))

(assert (=> b!1445636 (= res!977575 (validKeyInArray!0 (select (arr!47347 a!2862) j!93)))))

(declare-fun b!1445637 () Bool)

(declare-fun res!977572 () Bool)

(assert (=> b!1445637 (=> (not res!977572) (not e!814283))))

(assert (=> b!1445637 (= res!977572 (= (seekEntryOrOpen!0 (select (arr!47347 a!2862) j!93) a!2862 mask!2687) (Found!11624 j!93)))))

(assert (= (and start!124690 res!977573) b!1445632))

(assert (= (and b!1445632 res!977570) b!1445628))

(assert (= (and b!1445628 res!977568) b!1445636))

(assert (= (and b!1445636 res!977575) b!1445622))

(assert (= (and b!1445622 res!977579) b!1445623))

(assert (= (and b!1445623 res!977574) b!1445635))

(assert (= (and b!1445635 res!977569) b!1445624))

(assert (= (and b!1445624 res!977576) b!1445627))

(assert (= (and b!1445627 res!977581) b!1445621))

(assert (= (and b!1445621 res!977571) b!1445625))

(assert (= (and b!1445625 res!977580) b!1445629))

(assert (= (and b!1445629 c!133540) b!1445631))

(assert (= (and b!1445629 (not c!133540)) b!1445634))

(assert (= (and b!1445629 res!977567) b!1445626))

(assert (= (and b!1445626 res!977578) b!1445633))

(assert (= (and b!1445633 res!977577) b!1445637))

(assert (= (and b!1445637 res!977572) b!1445630))

(declare-fun m!1334073 () Bool)

(assert (=> b!1445627 m!1334073))

(assert (=> b!1445627 m!1334073))

(declare-fun m!1334075 () Bool)

(assert (=> b!1445627 m!1334075))

(assert (=> b!1445627 m!1334075))

(assert (=> b!1445627 m!1334073))

(declare-fun m!1334077 () Bool)

(assert (=> b!1445627 m!1334077))

(assert (=> b!1445621 m!1334073))

(assert (=> b!1445621 m!1334073))

(declare-fun m!1334079 () Bool)

(assert (=> b!1445621 m!1334079))

(declare-fun m!1334081 () Bool)

(assert (=> b!1445633 m!1334081))

(declare-fun m!1334083 () Bool)

(assert (=> b!1445633 m!1334083))

(declare-fun m!1334085 () Bool)

(assert (=> b!1445622 m!1334085))

(declare-fun m!1334087 () Bool)

(assert (=> b!1445631 m!1334087))

(declare-fun m!1334089 () Bool)

(assert (=> b!1445625 m!1334089))

(assert (=> b!1445625 m!1334089))

(declare-fun m!1334091 () Bool)

(assert (=> b!1445625 m!1334091))

(declare-fun m!1334093 () Bool)

(assert (=> b!1445625 m!1334093))

(declare-fun m!1334095 () Bool)

(assert (=> b!1445625 m!1334095))

(declare-fun m!1334097 () Bool)

(assert (=> b!1445630 m!1334097))

(assert (=> b!1445630 m!1334073))

(declare-fun m!1334099 () Bool)

(assert (=> start!124690 m!1334099))

(declare-fun m!1334101 () Bool)

(assert (=> start!124690 m!1334101))

(assert (=> b!1445636 m!1334073))

(assert (=> b!1445636 m!1334073))

(declare-fun m!1334103 () Bool)

(assert (=> b!1445636 m!1334103))

(assert (=> b!1445637 m!1334073))

(assert (=> b!1445637 m!1334073))

(declare-fun m!1334105 () Bool)

(assert (=> b!1445637 m!1334105))

(declare-fun m!1334107 () Bool)

(assert (=> b!1445623 m!1334107))

(declare-fun m!1334109 () Bool)

(assert (=> b!1445628 m!1334109))

(assert (=> b!1445628 m!1334109))

(declare-fun m!1334111 () Bool)

(assert (=> b!1445628 m!1334111))

(declare-fun m!1334113 () Bool)

(assert (=> b!1445634 m!1334113))

(declare-fun m!1334115 () Bool)

(assert (=> b!1445634 m!1334115))

(assert (=> b!1445624 m!1334093))

(declare-fun m!1334117 () Bool)

(assert (=> b!1445624 m!1334117))

(check-sat (not b!1445637) (not b!1445628) (not b!1445631) (not b!1445621) (not b!1445622) (not b!1445625) (not b!1445627) (not b!1445636) (not b!1445623) (not b!1445634) (not start!124690) (not b!1445633))
(check-sat)
