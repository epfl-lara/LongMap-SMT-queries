; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119122 () Bool)

(assert start!119122)

(declare-fun b!1389704 () Bool)

(declare-fun res!929865 () Bool)

(declare-fun e!787130 () Bool)

(assert (=> b!1389704 (=> (not res!929865) (not e!787130))))

(declare-datatypes ((array!95059 0))(
  ( (array!95060 (arr!45895 (Array (_ BitVec 32) (_ BitVec 64))) (size!46445 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95059)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389704 (= res!929865 (validKeyInArray!0 (select (arr!45895 a!2901) i!1037)))))

(declare-fun b!1389705 () Bool)

(assert (=> b!1389705 (= e!787130 false)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10212 0))(
  ( (MissingZero!10212 (index!43219 (_ BitVec 32))) (Found!10212 (index!43220 (_ BitVec 32))) (Intermediate!10212 (undefined!11024 Bool) (index!43221 (_ BitVec 32)) (x!124906 (_ BitVec 32))) (Undefined!10212) (MissingVacant!10212 (index!43222 (_ BitVec 32))) )
))
(declare-fun lt!610611 () SeekEntryResult!10212)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95059 (_ BitVec 32)) SeekEntryResult!10212)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389705 (= lt!610611 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45895 a!2901) j!112) mask!2840) (select (arr!45895 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1389706 () Bool)

(declare-fun res!929868 () Bool)

(assert (=> b!1389706 (=> (not res!929868) (not e!787130))))

(assert (=> b!1389706 (= res!929868 (validKeyInArray!0 (select (arr!45895 a!2901) j!112)))))

(declare-fun b!1389707 () Bool)

(declare-fun res!929864 () Bool)

(assert (=> b!1389707 (=> (not res!929864) (not e!787130))))

(assert (=> b!1389707 (= res!929864 (and (= (size!46445 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46445 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46445 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389708 () Bool)

(declare-fun res!929866 () Bool)

(assert (=> b!1389708 (=> (not res!929866) (not e!787130))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95059 (_ BitVec 32)) Bool)

(assert (=> b!1389708 (= res!929866 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!929869 () Bool)

(assert (=> start!119122 (=> (not res!929869) (not e!787130))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119122 (= res!929869 (validMask!0 mask!2840))))

(assert (=> start!119122 e!787130))

(assert (=> start!119122 true))

(declare-fun array_inv!34923 (array!95059) Bool)

(assert (=> start!119122 (array_inv!34923 a!2901)))

(declare-fun b!1389703 () Bool)

(declare-fun res!929867 () Bool)

(assert (=> b!1389703 (=> (not res!929867) (not e!787130))))

(declare-datatypes ((List!32414 0))(
  ( (Nil!32411) (Cons!32410 (h!33628 (_ BitVec 64)) (t!47108 List!32414)) )
))
(declare-fun arrayNoDuplicates!0 (array!95059 (_ BitVec 32) List!32414) Bool)

(assert (=> b!1389703 (= res!929867 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32411))))

(assert (= (and start!119122 res!929869) b!1389707))

(assert (= (and b!1389707 res!929864) b!1389704))

(assert (= (and b!1389704 res!929865) b!1389706))

(assert (= (and b!1389706 res!929868) b!1389708))

(assert (= (and b!1389708 res!929866) b!1389703))

(assert (= (and b!1389703 res!929867) b!1389705))

(declare-fun m!1275367 () Bool)

(assert (=> b!1389706 m!1275367))

(assert (=> b!1389706 m!1275367))

(declare-fun m!1275369 () Bool)

(assert (=> b!1389706 m!1275369))

(declare-fun m!1275371 () Bool)

(assert (=> start!119122 m!1275371))

(declare-fun m!1275373 () Bool)

(assert (=> start!119122 m!1275373))

(assert (=> b!1389705 m!1275367))

(assert (=> b!1389705 m!1275367))

(declare-fun m!1275375 () Bool)

(assert (=> b!1389705 m!1275375))

(assert (=> b!1389705 m!1275375))

(assert (=> b!1389705 m!1275367))

(declare-fun m!1275377 () Bool)

(assert (=> b!1389705 m!1275377))

(declare-fun m!1275379 () Bool)

(assert (=> b!1389704 m!1275379))

(assert (=> b!1389704 m!1275379))

(declare-fun m!1275381 () Bool)

(assert (=> b!1389704 m!1275381))

(declare-fun m!1275383 () Bool)

(assert (=> b!1389708 m!1275383))

(declare-fun m!1275385 () Bool)

(assert (=> b!1389703 m!1275385))

(push 1)

(assert (not b!1389706))

(assert (not b!1389704))

(assert (not start!119122))

(assert (not b!1389705))

(assert (not b!1389703))

(assert (not b!1389708))

