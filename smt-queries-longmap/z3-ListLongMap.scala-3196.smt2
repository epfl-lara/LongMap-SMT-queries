; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44850 () Bool)

(assert start!44850)

(declare-fun b!491975 () Bool)

(declare-fun res!294870 () Bool)

(declare-fun e!289014 () Bool)

(assert (=> b!491975 (=> (not res!294870) (not e!289014))))

(declare-datatypes ((array!31862 0))(
  ( (array!31863 (arr!15317 (Array (_ BitVec 32) (_ BitVec 64))) (size!15682 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31862)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491975 (= res!294870 (validKeyInArray!0 (select (arr!15317 a!3235) j!176)))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!289013 () Bool)

(declare-fun b!491976 () Bool)

(declare-datatypes ((SeekEntryResult!3781 0))(
  ( (MissingZero!3781 (index!17303 (_ BitVec 32))) (Found!3781 (index!17304 (_ BitVec 32))) (Intermediate!3781 (undefined!4593 Bool) (index!17305 (_ BitVec 32)) (x!46400 (_ BitVec 32))) (Undefined!3781) (MissingVacant!3781 (index!17306 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31862 (_ BitVec 32)) SeekEntryResult!3781)

(assert (=> b!491976 (= e!289013 (= (seekEntryOrOpen!0 (select (arr!15317 a!3235) j!176) a!3235 mask!3524) (Found!3781 j!176)))))

(declare-fun b!491977 () Bool)

(declare-fun res!294876 () Bool)

(assert (=> b!491977 (=> (not res!294876) (not e!289014))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!491977 (= res!294876 (validKeyInArray!0 k0!2280))))

(declare-fun b!491978 () Bool)

(declare-fun res!294877 () Bool)

(assert (=> b!491978 (=> (not res!294877) (not e!289014))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!491978 (= res!294877 (and (= (size!15682 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15682 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15682 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491979 () Bool)

(declare-fun res!294874 () Bool)

(assert (=> b!491979 (=> (not res!294874) (not e!289014))))

(declare-fun arrayContainsKey!0 (array!31862 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491979 (= res!294874 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!491980 () Bool)

(declare-fun e!289011 () Bool)

(assert (=> b!491980 (= e!289011 (not true))))

(declare-fun lt!222307 () (_ BitVec 32))

(declare-fun lt!222304 () SeekEntryResult!3781)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31862 (_ BitVec 32)) SeekEntryResult!3781)

(assert (=> b!491980 (= lt!222304 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222307 (select (store (arr!15317 a!3235) i!1204 k0!2280) j!176) (array!31863 (store (arr!15317 a!3235) i!1204 k0!2280) (size!15682 a!3235)) mask!3524))))

(declare-fun lt!222302 () (_ BitVec 32))

(declare-fun lt!222306 () SeekEntryResult!3781)

(assert (=> b!491980 (= lt!222306 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222302 (select (arr!15317 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491980 (= lt!222307 (toIndex!0 (select (store (arr!15317 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!491980 (= lt!222302 (toIndex!0 (select (arr!15317 a!3235) j!176) mask!3524))))

(assert (=> b!491980 e!289013))

(declare-fun res!294871 () Bool)

(assert (=> b!491980 (=> (not res!294871) (not e!289013))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31862 (_ BitVec 32)) Bool)

(assert (=> b!491980 (= res!294871 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14494 0))(
  ( (Unit!14495) )
))
(declare-fun lt!222303 () Unit!14494)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31862 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14494)

(assert (=> b!491980 (= lt!222303 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!491981 () Bool)

(assert (=> b!491981 (= e!289014 e!289011)))

(declare-fun res!294875 () Bool)

(assert (=> b!491981 (=> (not res!294875) (not e!289011))))

(declare-fun lt!222305 () SeekEntryResult!3781)

(assert (=> b!491981 (= res!294875 (or (= lt!222305 (MissingZero!3781 i!1204)) (= lt!222305 (MissingVacant!3781 i!1204))))))

(assert (=> b!491981 (= lt!222305 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!294872 () Bool)

(assert (=> start!44850 (=> (not res!294872) (not e!289014))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44850 (= res!294872 (validMask!0 mask!3524))))

(assert (=> start!44850 e!289014))

(assert (=> start!44850 true))

(declare-fun array_inv!11200 (array!31862) Bool)

(assert (=> start!44850 (array_inv!11200 a!3235)))

(declare-fun b!491982 () Bool)

(declare-fun res!294873 () Bool)

(assert (=> b!491982 (=> (not res!294873) (not e!289011))))

(assert (=> b!491982 (= res!294873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491983 () Bool)

(declare-fun res!294878 () Bool)

(assert (=> b!491983 (=> (not res!294878) (not e!289011))))

(declare-datatypes ((List!9514 0))(
  ( (Nil!9511) (Cons!9510 (h!10375 (_ BitVec 64)) (t!15733 List!9514)) )
))
(declare-fun arrayNoDuplicates!0 (array!31862 (_ BitVec 32) List!9514) Bool)

(assert (=> b!491983 (= res!294878 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9511))))

(assert (= (and start!44850 res!294872) b!491978))

(assert (= (and b!491978 res!294877) b!491975))

(assert (= (and b!491975 res!294870) b!491977))

(assert (= (and b!491977 res!294876) b!491979))

(assert (= (and b!491979 res!294874) b!491981))

(assert (= (and b!491981 res!294875) b!491982))

(assert (= (and b!491982 res!294873) b!491983))

(assert (= (and b!491983 res!294878) b!491980))

(assert (= (and b!491980 res!294871) b!491976))

(declare-fun m!472171 () Bool)

(assert (=> b!491983 m!472171))

(declare-fun m!472173 () Bool)

(assert (=> b!491975 m!472173))

(assert (=> b!491975 m!472173))

(declare-fun m!472175 () Bool)

(assert (=> b!491975 m!472175))

(declare-fun m!472177 () Bool)

(assert (=> b!491981 m!472177))

(declare-fun m!472179 () Bool)

(assert (=> b!491980 m!472179))

(declare-fun m!472181 () Bool)

(assert (=> b!491980 m!472181))

(declare-fun m!472183 () Bool)

(assert (=> b!491980 m!472183))

(declare-fun m!472185 () Bool)

(assert (=> b!491980 m!472185))

(assert (=> b!491980 m!472179))

(assert (=> b!491980 m!472173))

(declare-fun m!472187 () Bool)

(assert (=> b!491980 m!472187))

(assert (=> b!491980 m!472173))

(declare-fun m!472189 () Bool)

(assert (=> b!491980 m!472189))

(assert (=> b!491980 m!472173))

(declare-fun m!472191 () Bool)

(assert (=> b!491980 m!472191))

(assert (=> b!491980 m!472179))

(declare-fun m!472193 () Bool)

(assert (=> b!491980 m!472193))

(declare-fun m!472195 () Bool)

(assert (=> b!491982 m!472195))

(declare-fun m!472197 () Bool)

(assert (=> start!44850 m!472197))

(declare-fun m!472199 () Bool)

(assert (=> start!44850 m!472199))

(declare-fun m!472201 () Bool)

(assert (=> b!491979 m!472201))

(declare-fun m!472203 () Bool)

(assert (=> b!491977 m!472203))

(assert (=> b!491976 m!472173))

(assert (=> b!491976 m!472173))

(declare-fun m!472205 () Bool)

(assert (=> b!491976 m!472205))

(check-sat (not b!491982) (not b!491980) (not b!491981) (not start!44850) (not b!491977) (not b!491983) (not b!491975) (not b!491979) (not b!491976))
(check-sat)
