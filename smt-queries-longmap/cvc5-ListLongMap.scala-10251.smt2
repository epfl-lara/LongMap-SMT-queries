; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120558 () Bool)

(assert start!120558)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95967 0))(
  ( (array!95968 (arr!46334 (Array (_ BitVec 32) (_ BitVec 64))) (size!46884 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95967)

(declare-fun e!794798 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun b!1403784 () Bool)

(declare-datatypes ((SeekEntryResult!10651 0))(
  ( (MissingZero!10651 (index!44981 (_ BitVec 32))) (Found!10651 (index!44982 (_ BitVec 32))) (Intermediate!10651 (undefined!11463 Bool) (index!44983 (_ BitVec 32)) (x!126590 (_ BitVec 32))) (Undefined!10651) (MissingVacant!10651 (index!44984 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95967 (_ BitVec 32)) SeekEntryResult!10651)

(assert (=> b!1403784 (= e!794798 (= (seekEntryOrOpen!0 (select (arr!46334 a!2901) j!112) a!2901 mask!2840) (Found!10651 j!112)))))

(declare-fun b!1403786 () Bool)

(declare-fun res!942301 () Bool)

(declare-fun e!794796 () Bool)

(assert (=> b!1403786 (=> (not res!942301) (not e!794796))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1403786 (= res!942301 (and (= (size!46884 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46884 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46884 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403787 () Bool)

(declare-fun res!942296 () Bool)

(assert (=> b!1403787 (=> (not res!942296) (not e!794796))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403787 (= res!942296 (validKeyInArray!0 (select (arr!46334 a!2901) j!112)))))

(declare-fun b!1403788 () Bool)

(declare-fun res!942297 () Bool)

(assert (=> b!1403788 (=> (not res!942297) (not e!794796))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95967 (_ BitVec 32)) Bool)

(assert (=> b!1403788 (= res!942297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403789 () Bool)

(declare-fun res!942300 () Bool)

(assert (=> b!1403789 (=> (not res!942300) (not e!794796))))

(assert (=> b!1403789 (= res!942300 (validKeyInArray!0 (select (arr!46334 a!2901) i!1037)))))

(declare-fun b!1403790 () Bool)

(assert (=> b!1403790 (= e!794796 (not true))))

(assert (=> b!1403790 e!794798))

(declare-fun res!942299 () Bool)

(assert (=> b!1403790 (=> (not res!942299) (not e!794798))))

(assert (=> b!1403790 (= res!942299 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47306 0))(
  ( (Unit!47307) )
))
(declare-fun lt!618507 () Unit!47306)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95967 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47306)

(assert (=> b!1403790 (= lt!618507 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618506 () SeekEntryResult!10651)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95967 (_ BitVec 32)) SeekEntryResult!10651)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403790 (= lt!618506 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46334 a!2901) j!112) mask!2840) (select (arr!46334 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403785 () Bool)

(declare-fun res!942295 () Bool)

(assert (=> b!1403785 (=> (not res!942295) (not e!794796))))

(declare-datatypes ((List!32853 0))(
  ( (Nil!32850) (Cons!32849 (h!34097 (_ BitVec 64)) (t!47547 List!32853)) )
))
(declare-fun arrayNoDuplicates!0 (array!95967 (_ BitVec 32) List!32853) Bool)

(assert (=> b!1403785 (= res!942295 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32850))))

(declare-fun res!942298 () Bool)

(assert (=> start!120558 (=> (not res!942298) (not e!794796))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120558 (= res!942298 (validMask!0 mask!2840))))

(assert (=> start!120558 e!794796))

(assert (=> start!120558 true))

(declare-fun array_inv!35362 (array!95967) Bool)

(assert (=> start!120558 (array_inv!35362 a!2901)))

(assert (= (and start!120558 res!942298) b!1403786))

(assert (= (and b!1403786 res!942301) b!1403789))

(assert (= (and b!1403789 res!942300) b!1403787))

(assert (= (and b!1403787 res!942296) b!1403788))

(assert (= (and b!1403788 res!942297) b!1403785))

(assert (= (and b!1403785 res!942295) b!1403790))

(assert (= (and b!1403790 res!942299) b!1403784))

(declare-fun m!1292523 () Bool)

(assert (=> b!1403790 m!1292523))

(declare-fun m!1292525 () Bool)

(assert (=> b!1403790 m!1292525))

(assert (=> b!1403790 m!1292523))

(declare-fun m!1292527 () Bool)

(assert (=> b!1403790 m!1292527))

(assert (=> b!1403790 m!1292525))

(assert (=> b!1403790 m!1292523))

(declare-fun m!1292529 () Bool)

(assert (=> b!1403790 m!1292529))

(declare-fun m!1292531 () Bool)

(assert (=> b!1403790 m!1292531))

(declare-fun m!1292533 () Bool)

(assert (=> b!1403785 m!1292533))

(assert (=> b!1403784 m!1292523))

(assert (=> b!1403784 m!1292523))

(declare-fun m!1292535 () Bool)

(assert (=> b!1403784 m!1292535))

(declare-fun m!1292537 () Bool)

(assert (=> b!1403788 m!1292537))

(declare-fun m!1292539 () Bool)

(assert (=> b!1403789 m!1292539))

(assert (=> b!1403789 m!1292539))

(declare-fun m!1292541 () Bool)

(assert (=> b!1403789 m!1292541))

(assert (=> b!1403787 m!1292523))

(assert (=> b!1403787 m!1292523))

(declare-fun m!1292543 () Bool)

(assert (=> b!1403787 m!1292543))

(declare-fun m!1292545 () Bool)

(assert (=> start!120558 m!1292545))

(declare-fun m!1292547 () Bool)

(assert (=> start!120558 m!1292547))

(push 1)

(assert (not b!1403784))

(assert (not b!1403787))

(assert (not start!120558))

(assert (not b!1403790))

(assert (not b!1403789))

(assert (not b!1403785))

(assert (not b!1403788))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

