; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120050 () Bool)

(assert start!120050)

(declare-fun b!1397608 () Bool)

(declare-fun e!791233 () Bool)

(declare-fun e!791234 () Bool)

(assert (=> b!1397608 (= e!791233 (not e!791234))))

(declare-fun res!936577 () Bool)

(assert (=> b!1397608 (=> res!936577 e!791234)))

(declare-datatypes ((SeekEntryResult!10463 0))(
  ( (MissingZero!10463 (index!44223 (_ BitVec 32))) (Found!10463 (index!44224 (_ BitVec 32))) (Intermediate!10463 (undefined!11275 Bool) (index!44225 (_ BitVec 32)) (x!125874 (_ BitVec 32))) (Undefined!10463) (MissingVacant!10463 (index!44226 (_ BitVec 32))) )
))
(declare-fun lt!614208 () SeekEntryResult!10463)

(get-info :version)

(assert (=> b!1397608 (= res!936577 (or (not ((_ is Intermediate!10463) lt!614208)) (undefined!11275 lt!614208)))))

(declare-fun e!791231 () Bool)

(assert (=> b!1397608 e!791231))

(declare-fun res!936573 () Bool)

(assert (=> b!1397608 (=> (not res!936573) (not e!791231))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95532 0))(
  ( (array!95533 (arr!46120 (Array (_ BitVec 32) (_ BitVec 64))) (size!46672 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95532)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95532 (_ BitVec 32)) Bool)

(assert (=> b!1397608 (= res!936573 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46773 0))(
  ( (Unit!46774) )
))
(declare-fun lt!614211 () Unit!46773)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95532 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46773)

(assert (=> b!1397608 (= lt!614211 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!614212 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95532 (_ BitVec 32)) SeekEntryResult!10463)

(assert (=> b!1397608 (= lt!614208 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614212 (select (arr!46120 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397608 (= lt!614212 (toIndex!0 (select (arr!46120 a!2901) j!112) mask!2840))))

(declare-fun b!1397609 () Bool)

(declare-fun res!936580 () Bool)

(assert (=> b!1397609 (=> (not res!936580) (not e!791233))))

(declare-datatypes ((List!32717 0))(
  ( (Nil!32714) (Cons!32713 (h!33955 (_ BitVec 64)) (t!47403 List!32717)) )
))
(declare-fun arrayNoDuplicates!0 (array!95532 (_ BitVec 32) List!32717) Bool)

(assert (=> b!1397609 (= res!936580 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32714))))

(declare-fun b!1397610 () Bool)

(declare-fun e!791232 () Bool)

(assert (=> b!1397610 (= e!791234 e!791232)))

(declare-fun res!936579 () Bool)

(assert (=> b!1397610 (=> res!936579 e!791232)))

(declare-fun lt!614210 () SeekEntryResult!10463)

(assert (=> b!1397610 (= res!936579 (or (= lt!614208 lt!614210) (not ((_ is Intermediate!10463) lt!614210)) (bvslt (x!125874 lt!614208) #b00000000000000000000000000000000) (bvsgt (x!125874 lt!614208) #b01111111111111111111111111111110) (bvslt lt!614212 #b00000000000000000000000000000000) (bvsge lt!614212 (size!46672 a!2901)) (bvslt (index!44225 lt!614208) #b00000000000000000000000000000000) (bvsge (index!44225 lt!614208) (size!46672 a!2901)) (not (= lt!614208 (Intermediate!10463 false (index!44225 lt!614208) (x!125874 lt!614208)))) (not (= lt!614210 (Intermediate!10463 (undefined!11275 lt!614210) (index!44225 lt!614210) (x!125874 lt!614210))))))))

(declare-fun lt!614209 () array!95532)

(declare-fun lt!614207 () (_ BitVec 64))

(assert (=> b!1397610 (= lt!614210 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614207 mask!2840) lt!614207 lt!614209 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1397610 (= lt!614207 (select (store (arr!46120 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397610 (= lt!614209 (array!95533 (store (arr!46120 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46672 a!2901)))))

(declare-fun b!1397611 () Bool)

(declare-fun res!936576 () Bool)

(assert (=> b!1397611 (=> (not res!936576) (not e!791233))))

(assert (=> b!1397611 (= res!936576 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397612 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95532 (_ BitVec 32)) SeekEntryResult!10463)

(assert (=> b!1397612 (= e!791231 (= (seekEntryOrOpen!0 (select (arr!46120 a!2901) j!112) a!2901 mask!2840) (Found!10463 j!112)))))

(declare-fun b!1397613 () Bool)

(declare-fun res!936578 () Bool)

(assert (=> b!1397613 (=> (not res!936578) (not e!791233))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397613 (= res!936578 (validKeyInArray!0 (select (arr!46120 a!2901) j!112)))))

(declare-fun res!936575 () Bool)

(assert (=> start!120050 (=> (not res!936575) (not e!791233))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120050 (= res!936575 (validMask!0 mask!2840))))

(assert (=> start!120050 e!791233))

(assert (=> start!120050 true))

(declare-fun array_inv!35353 (array!95532) Bool)

(assert (=> start!120050 (array_inv!35353 a!2901)))

(declare-fun b!1397614 () Bool)

(declare-fun res!936574 () Bool)

(assert (=> b!1397614 (=> (not res!936574) (not e!791233))))

(assert (=> b!1397614 (= res!936574 (validKeyInArray!0 (select (arr!46120 a!2901) i!1037)))))

(declare-fun b!1397615 () Bool)

(declare-fun res!936572 () Bool)

(assert (=> b!1397615 (=> (not res!936572) (not e!791233))))

(assert (=> b!1397615 (= res!936572 (and (= (size!46672 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46672 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46672 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397616 () Bool)

(assert (=> b!1397616 (= e!791232 true)))

(declare-fun lt!614213 () SeekEntryResult!10463)

(assert (=> b!1397616 (= lt!614213 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614212 lt!614207 lt!614209 mask!2840))))

(assert (= (and start!120050 res!936575) b!1397615))

(assert (= (and b!1397615 res!936572) b!1397614))

(assert (= (and b!1397614 res!936574) b!1397613))

(assert (= (and b!1397613 res!936578) b!1397611))

(assert (= (and b!1397611 res!936576) b!1397609))

(assert (= (and b!1397609 res!936580) b!1397608))

(assert (= (and b!1397608 res!936573) b!1397612))

(assert (= (and b!1397608 (not res!936577)) b!1397610))

(assert (= (and b!1397610 (not res!936579)) b!1397616))

(declare-fun m!1284007 () Bool)

(assert (=> b!1397611 m!1284007))

(declare-fun m!1284009 () Bool)

(assert (=> b!1397609 m!1284009))

(declare-fun m!1284011 () Bool)

(assert (=> b!1397616 m!1284011))

(declare-fun m!1284013 () Bool)

(assert (=> b!1397612 m!1284013))

(assert (=> b!1397612 m!1284013))

(declare-fun m!1284015 () Bool)

(assert (=> b!1397612 m!1284015))

(declare-fun m!1284017 () Bool)

(assert (=> b!1397614 m!1284017))

(assert (=> b!1397614 m!1284017))

(declare-fun m!1284019 () Bool)

(assert (=> b!1397614 m!1284019))

(declare-fun m!1284021 () Bool)

(assert (=> start!120050 m!1284021))

(declare-fun m!1284023 () Bool)

(assert (=> start!120050 m!1284023))

(declare-fun m!1284025 () Bool)

(assert (=> b!1397610 m!1284025))

(assert (=> b!1397610 m!1284025))

(declare-fun m!1284027 () Bool)

(assert (=> b!1397610 m!1284027))

(declare-fun m!1284029 () Bool)

(assert (=> b!1397610 m!1284029))

(declare-fun m!1284031 () Bool)

(assert (=> b!1397610 m!1284031))

(assert (=> b!1397613 m!1284013))

(assert (=> b!1397613 m!1284013))

(declare-fun m!1284033 () Bool)

(assert (=> b!1397613 m!1284033))

(assert (=> b!1397608 m!1284013))

(declare-fun m!1284035 () Bool)

(assert (=> b!1397608 m!1284035))

(assert (=> b!1397608 m!1284013))

(declare-fun m!1284037 () Bool)

(assert (=> b!1397608 m!1284037))

(declare-fun m!1284039 () Bool)

(assert (=> b!1397608 m!1284039))

(assert (=> b!1397608 m!1284013))

(declare-fun m!1284041 () Bool)

(assert (=> b!1397608 m!1284041))

(check-sat (not b!1397614) (not b!1397613) (not b!1397609) (not b!1397608) (not start!120050) (not b!1397611) (not b!1397610) (not b!1397616) (not b!1397612))
(check-sat)
