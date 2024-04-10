; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120596 () Bool)

(assert start!120596)

(declare-fun b!1404151 () Bool)

(declare-fun e!794944 () Bool)

(assert (=> b!1404151 (= e!794944 false)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96005 0))(
  ( (array!96006 (arr!46353 (Array (_ BitVec 32) (_ BitVec 64))) (size!46903 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96005)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10664 0))(
  ( (MissingZero!10664 (index!45033 (_ BitVec 32))) (Found!10664 (index!45034 (_ BitVec 32))) (Intermediate!10664 (undefined!11476 Bool) (index!45035 (_ BitVec 32)) (x!126651 (_ BitVec 32))) (Undefined!10664) (MissingVacant!10664 (index!45036 (_ BitVec 32))) )
))
(declare-fun lt!618597 () SeekEntryResult!10664)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96005 (_ BitVec 32)) SeekEntryResult!10664)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404151 (= lt!618597 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46353 a!2901) j!112) mask!2840) (select (arr!46353 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404152 () Bool)

(declare-fun res!942664 () Bool)

(assert (=> b!1404152 (=> (not res!942664) (not e!794944))))

(declare-datatypes ((List!32872 0))(
  ( (Nil!32869) (Cons!32868 (h!34116 (_ BitVec 64)) (t!47566 List!32872)) )
))
(declare-fun arrayNoDuplicates!0 (array!96005 (_ BitVec 32) List!32872) Bool)

(assert (=> b!1404152 (= res!942664 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32869))))

(declare-fun b!1404153 () Bool)

(declare-fun res!942665 () Bool)

(assert (=> b!1404153 (=> (not res!942665) (not e!794944))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404153 (= res!942665 (validKeyInArray!0 (select (arr!46353 a!2901) j!112)))))

(declare-fun b!1404154 () Bool)

(declare-fun res!942662 () Bool)

(assert (=> b!1404154 (=> (not res!942662) (not e!794944))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1404154 (= res!942662 (and (= (size!46903 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46903 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46903 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1404155 () Bool)

(declare-fun res!942667 () Bool)

(assert (=> b!1404155 (=> (not res!942667) (not e!794944))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96005 (_ BitVec 32)) Bool)

(assert (=> b!1404155 (= res!942667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1404156 () Bool)

(declare-fun res!942666 () Bool)

(assert (=> b!1404156 (=> (not res!942666) (not e!794944))))

(assert (=> b!1404156 (= res!942666 (validKeyInArray!0 (select (arr!46353 a!2901) i!1037)))))

(declare-fun res!942663 () Bool)

(assert (=> start!120596 (=> (not res!942663) (not e!794944))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120596 (= res!942663 (validMask!0 mask!2840))))

(assert (=> start!120596 e!794944))

(assert (=> start!120596 true))

(declare-fun array_inv!35381 (array!96005) Bool)

(assert (=> start!120596 (array_inv!35381 a!2901)))

(assert (= (and start!120596 res!942663) b!1404154))

(assert (= (and b!1404154 res!942662) b!1404156))

(assert (= (and b!1404156 res!942666) b!1404153))

(assert (= (and b!1404153 res!942665) b!1404155))

(assert (= (and b!1404155 res!942667) b!1404152))

(assert (= (and b!1404152 res!942664) b!1404151))

(declare-fun m!1292957 () Bool)

(assert (=> b!1404152 m!1292957))

(declare-fun m!1292959 () Bool)

(assert (=> start!120596 m!1292959))

(declare-fun m!1292961 () Bool)

(assert (=> start!120596 m!1292961))

(declare-fun m!1292963 () Bool)

(assert (=> b!1404156 m!1292963))

(assert (=> b!1404156 m!1292963))

(declare-fun m!1292965 () Bool)

(assert (=> b!1404156 m!1292965))

(declare-fun m!1292967 () Bool)

(assert (=> b!1404155 m!1292967))

(declare-fun m!1292969 () Bool)

(assert (=> b!1404153 m!1292969))

(assert (=> b!1404153 m!1292969))

(declare-fun m!1292971 () Bool)

(assert (=> b!1404153 m!1292971))

(assert (=> b!1404151 m!1292969))

(assert (=> b!1404151 m!1292969))

(declare-fun m!1292973 () Bool)

(assert (=> b!1404151 m!1292973))

(assert (=> b!1404151 m!1292973))

(assert (=> b!1404151 m!1292969))

(declare-fun m!1292975 () Bool)

(assert (=> b!1404151 m!1292975))

(check-sat (not b!1404152) (not b!1404155) (not b!1404151) (not b!1404153) (not b!1404156) (not start!120596))
