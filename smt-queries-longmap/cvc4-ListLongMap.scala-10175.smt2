; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119980 () Bool)

(assert start!119980)

(declare-fun b!1396690 () Bool)

(declare-fun res!935606 () Bool)

(declare-fun e!790715 () Bool)

(assert (=> b!1396690 (=> (not res!935606) (not e!790715))))

(declare-datatypes ((array!95509 0))(
  ( (array!95510 (arr!46108 (Array (_ BitVec 32) (_ BitVec 64))) (size!46658 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95509)

(declare-datatypes ((List!32627 0))(
  ( (Nil!32624) (Cons!32623 (h!33865 (_ BitVec 64)) (t!47321 List!32627)) )
))
(declare-fun arrayNoDuplicates!0 (array!95509 (_ BitVec 32) List!32627) Bool)

(assert (=> b!1396690 (= res!935606 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32624))))

(declare-fun b!1396691 () Bool)

(declare-fun res!935604 () Bool)

(assert (=> b!1396691 (=> (not res!935604) (not e!790715))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95509 (_ BitVec 32)) Bool)

(assert (=> b!1396691 (= res!935604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!935609 () Bool)

(assert (=> start!119980 (=> (not res!935609) (not e!790715))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119980 (= res!935609 (validMask!0 mask!2840))))

(assert (=> start!119980 e!790715))

(assert (=> start!119980 true))

(declare-fun array_inv!35136 (array!95509) Bool)

(assert (=> start!119980 (array_inv!35136 a!2901)))

(declare-fun b!1396692 () Bool)

(declare-fun e!790717 () Bool)

(declare-fun e!790718 () Bool)

(assert (=> b!1396692 (= e!790717 e!790718)))

(declare-fun res!935610 () Bool)

(assert (=> b!1396692 (=> res!935610 e!790718)))

(declare-fun lt!613626 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10425 0))(
  ( (MissingZero!10425 (index!44071 (_ BitVec 32))) (Found!10425 (index!44072 (_ BitVec 32))) (Intermediate!10425 (undefined!11237 Bool) (index!44073 (_ BitVec 32)) (x!125735 (_ BitVec 32))) (Undefined!10425) (MissingVacant!10425 (index!44074 (_ BitVec 32))) )
))
(declare-fun lt!613621 () SeekEntryResult!10425)

(declare-fun lt!613625 () SeekEntryResult!10425)

(assert (=> b!1396692 (= res!935610 (or (= lt!613625 lt!613621) (not (is-Intermediate!10425 lt!613621)) (bvslt (x!125735 lt!613625) #b00000000000000000000000000000000) (bvsgt (x!125735 lt!613625) #b01111111111111111111111111111110) (bvslt lt!613626 #b00000000000000000000000000000000) (bvsge lt!613626 (size!46658 a!2901)) (bvslt (index!44073 lt!613625) #b00000000000000000000000000000000) (bvsge (index!44073 lt!613625) (size!46658 a!2901)) (not (= lt!613625 (Intermediate!10425 false (index!44073 lt!613625) (x!125735 lt!613625)))) (not (= lt!613621 (Intermediate!10425 (undefined!11237 lt!613621) (index!44073 lt!613621) (x!125735 lt!613621))))))))

(declare-fun lt!613624 () (_ BitVec 64))

(declare-fun lt!613623 () array!95509)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95509 (_ BitVec 32)) SeekEntryResult!10425)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396692 (= lt!613621 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613624 mask!2840) lt!613624 lt!613623 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1396692 (= lt!613624 (select (store (arr!46108 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1396692 (= lt!613623 (array!95510 (store (arr!46108 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46658 a!2901)))))

(declare-fun b!1396693 () Bool)

(assert (=> b!1396693 (= e!790715 (not e!790717))))

(declare-fun res!935607 () Bool)

(assert (=> b!1396693 (=> res!935607 e!790717)))

(assert (=> b!1396693 (= res!935607 (or (not (is-Intermediate!10425 lt!613625)) (undefined!11237 lt!613625)))))

(declare-fun e!790716 () Bool)

(assert (=> b!1396693 e!790716))

(declare-fun res!935603 () Bool)

(assert (=> b!1396693 (=> (not res!935603) (not e!790716))))

(assert (=> b!1396693 (= res!935603 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46854 0))(
  ( (Unit!46855) )
))
(declare-fun lt!613620 () Unit!46854)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95509 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46854)

(assert (=> b!1396693 (= lt!613620 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1396693 (= lt!613625 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613626 (select (arr!46108 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1396693 (= lt!613626 (toIndex!0 (select (arr!46108 a!2901) j!112) mask!2840))))

(declare-fun b!1396694 () Bool)

(declare-fun res!935608 () Bool)

(assert (=> b!1396694 (=> (not res!935608) (not e!790715))))

(assert (=> b!1396694 (= res!935608 (and (= (size!46658 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46658 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46658 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1396695 () Bool)

(declare-fun res!935611 () Bool)

(assert (=> b!1396695 (=> (not res!935611) (not e!790715))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1396695 (= res!935611 (validKeyInArray!0 (select (arr!46108 a!2901) i!1037)))))

(declare-fun b!1396696 () Bool)

(declare-fun res!935605 () Bool)

(assert (=> b!1396696 (=> (not res!935605) (not e!790715))))

(assert (=> b!1396696 (= res!935605 (validKeyInArray!0 (select (arr!46108 a!2901) j!112)))))

(declare-fun b!1396697 () Bool)

(assert (=> b!1396697 (= e!790718 true)))

(declare-fun lt!613622 () SeekEntryResult!10425)

(assert (=> b!1396697 (= lt!613622 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613626 lt!613624 lt!613623 mask!2840))))

(declare-fun b!1396698 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95509 (_ BitVec 32)) SeekEntryResult!10425)

(assert (=> b!1396698 (= e!790716 (= (seekEntryOrOpen!0 (select (arr!46108 a!2901) j!112) a!2901 mask!2840) (Found!10425 j!112)))))

(assert (= (and start!119980 res!935609) b!1396694))

(assert (= (and b!1396694 res!935608) b!1396695))

(assert (= (and b!1396695 res!935611) b!1396696))

(assert (= (and b!1396696 res!935605) b!1396691))

(assert (= (and b!1396691 res!935604) b!1396690))

(assert (= (and b!1396690 res!935606) b!1396693))

(assert (= (and b!1396693 res!935603) b!1396698))

(assert (= (and b!1396693 (not res!935607)) b!1396692))

(assert (= (and b!1396692 (not res!935610)) b!1396697))

(declare-fun m!1283211 () Bool)

(assert (=> b!1396695 m!1283211))

(assert (=> b!1396695 m!1283211))

(declare-fun m!1283213 () Bool)

(assert (=> b!1396695 m!1283213))

(declare-fun m!1283215 () Bool)

(assert (=> b!1396697 m!1283215))

(declare-fun m!1283217 () Bool)

(assert (=> b!1396698 m!1283217))

(assert (=> b!1396698 m!1283217))

(declare-fun m!1283219 () Bool)

(assert (=> b!1396698 m!1283219))

(declare-fun m!1283221 () Bool)

(assert (=> start!119980 m!1283221))

(declare-fun m!1283223 () Bool)

(assert (=> start!119980 m!1283223))

(assert (=> b!1396693 m!1283217))

(declare-fun m!1283225 () Bool)

(assert (=> b!1396693 m!1283225))

(assert (=> b!1396693 m!1283217))

(declare-fun m!1283227 () Bool)

(assert (=> b!1396693 m!1283227))

(declare-fun m!1283229 () Bool)

(assert (=> b!1396693 m!1283229))

(assert (=> b!1396693 m!1283217))

(declare-fun m!1283231 () Bool)

(assert (=> b!1396693 m!1283231))

(declare-fun m!1283233 () Bool)

(assert (=> b!1396692 m!1283233))

(assert (=> b!1396692 m!1283233))

(declare-fun m!1283235 () Bool)

(assert (=> b!1396692 m!1283235))

(declare-fun m!1283237 () Bool)

(assert (=> b!1396692 m!1283237))

(declare-fun m!1283239 () Bool)

(assert (=> b!1396692 m!1283239))

(declare-fun m!1283241 () Bool)

(assert (=> b!1396690 m!1283241))

(declare-fun m!1283243 () Bool)

(assert (=> b!1396691 m!1283243))

(assert (=> b!1396696 m!1283217))

(assert (=> b!1396696 m!1283217))

(declare-fun m!1283245 () Bool)

(assert (=> b!1396696 m!1283245))

(push 1)

(assert (not b!1396696))

(assert (not start!119980))

(assert (not b!1396697))

(assert (not b!1396692))

(assert (not b!1396695))

(assert (not b!1396698))

(assert (not b!1396690))

(assert (not b!1396693))

(assert (not b!1396691))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

