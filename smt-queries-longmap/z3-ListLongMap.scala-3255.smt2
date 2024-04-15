; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45390 () Bool)

(assert start!45390)

(declare-fun b!498737 () Bool)

(declare-fun res!300910 () Bool)

(declare-fun e!292267 () Bool)

(assert (=> b!498737 (=> (not res!300910) (not e!292267))))

(declare-datatypes ((array!32225 0))(
  ( (array!32226 (arr!15494 (Array (_ BitVec 32) (_ BitVec 64))) (size!15859 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32225)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32225 (_ BitVec 32)) Bool)

(assert (=> b!498737 (= res!300910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!498738 () Bool)

(declare-fun res!300911 () Bool)

(declare-fun e!292270 () Bool)

(assert (=> b!498738 (=> (not res!300911) (not e!292270))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32225 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!498738 (= res!300911 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!498739 () Bool)

(declare-datatypes ((Unit!14902 0))(
  ( (Unit!14903) )
))
(declare-fun e!292271 () Unit!14902)

(declare-fun Unit!14904 () Unit!14902)

(assert (=> b!498739 (= e!292271 Unit!14904)))

(declare-fun b!498740 () Bool)

(declare-fun res!300900 () Bool)

(declare-fun e!292272 () Bool)

(assert (=> b!498740 (=> res!300900 e!292272)))

(declare-datatypes ((SeekEntryResult!3958 0))(
  ( (MissingZero!3958 (index!18014 (_ BitVec 32))) (Found!3958 (index!18015 (_ BitVec 32))) (Intermediate!3958 (undefined!4770 Bool) (index!18016 (_ BitVec 32)) (x!47070 (_ BitVec 32))) (Undefined!3958) (MissingVacant!3958 (index!18017 (_ BitVec 32))) )
))
(declare-fun lt!225925 () SeekEntryResult!3958)

(get-info :version)

(assert (=> b!498740 (= res!300900 (or (undefined!4770 lt!225925) (not ((_ is Intermediate!3958) lt!225925))))))

(declare-fun b!498741 () Bool)

(declare-fun res!300909 () Bool)

(assert (=> b!498741 (=> (not res!300909) (not e!292270))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!498741 (= res!300909 (validKeyInArray!0 (select (arr!15494 a!3235) j!176)))))

(declare-fun b!498742 () Bool)

(assert (=> b!498742 (= e!292270 e!292267)))

(declare-fun res!300905 () Bool)

(assert (=> b!498742 (=> (not res!300905) (not e!292267))))

(declare-fun lt!225929 () SeekEntryResult!3958)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!498742 (= res!300905 (or (= lt!225929 (MissingZero!3958 i!1204)) (= lt!225929 (MissingVacant!3958 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32225 (_ BitVec 32)) SeekEntryResult!3958)

(assert (=> b!498742 (= lt!225929 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!498743 () Bool)

(declare-fun res!300906 () Bool)

(assert (=> b!498743 (=> (not res!300906) (not e!292270))))

(assert (=> b!498743 (= res!300906 (validKeyInArray!0 k0!2280))))

(declare-fun b!498745 () Bool)

(declare-fun res!300903 () Bool)

(assert (=> b!498745 (=> (not res!300903) (not e!292270))))

(assert (=> b!498745 (= res!300903 (and (= (size!15859 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15859 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15859 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!498746 () Bool)

(declare-fun e!292268 () Bool)

(assert (=> b!498746 (= e!292268 false)))

(declare-fun b!498747 () Bool)

(declare-fun res!300908 () Bool)

(assert (=> b!498747 (=> (not res!300908) (not e!292267))))

(declare-datatypes ((List!9691 0))(
  ( (Nil!9688) (Cons!9687 (h!10561 (_ BitVec 64)) (t!15910 List!9691)) )
))
(declare-fun arrayNoDuplicates!0 (array!32225 (_ BitVec 32) List!9691) Bool)

(assert (=> b!498747 (= res!300908 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9688))))

(declare-fun b!498748 () Bool)

(declare-fun e!292269 () Bool)

(assert (=> b!498748 (= e!292269 (= (seekEntryOrOpen!0 (select (arr!15494 a!3235) j!176) a!3235 mask!3524) (Found!3958 j!176)))))

(declare-fun b!498749 () Bool)

(declare-fun e!292265 () Bool)

(assert (=> b!498749 (= e!292265 true)))

(declare-fun lt!225930 () (_ BitVec 32))

(declare-fun lt!225927 () (_ BitVec 64))

(declare-fun lt!225934 () SeekEntryResult!3958)

(declare-fun lt!225931 () array!32225)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32225 (_ BitVec 32)) SeekEntryResult!3958)

(assert (=> b!498749 (= lt!225934 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225930 lt!225927 lt!225931 mask!3524))))

(declare-fun b!498750 () Bool)

(assert (=> b!498750 (= e!292267 (not e!292272))))

(declare-fun res!300899 () Bool)

(assert (=> b!498750 (=> res!300899 e!292272)))

(declare-fun lt!225932 () (_ BitVec 32))

(assert (=> b!498750 (= res!300899 (= lt!225925 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225932 lt!225927 lt!225931 mask!3524)))))

(assert (=> b!498750 (= lt!225925 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225930 (select (arr!15494 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!498750 (= lt!225932 (toIndex!0 lt!225927 mask!3524))))

(assert (=> b!498750 (= lt!225927 (select (store (arr!15494 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!498750 (= lt!225930 (toIndex!0 (select (arr!15494 a!3235) j!176) mask!3524))))

(assert (=> b!498750 (= lt!225931 (array!32226 (store (arr!15494 a!3235) i!1204 k0!2280) (size!15859 a!3235)))))

(assert (=> b!498750 e!292269))

(declare-fun res!300902 () Bool)

(assert (=> b!498750 (=> (not res!300902) (not e!292269))))

(assert (=> b!498750 (= res!300902 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!225926 () Unit!14902)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32225 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14902)

(assert (=> b!498750 (= lt!225926 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!498751 () Bool)

(assert (=> b!498751 (= e!292272 e!292265)))

(declare-fun res!300904 () Bool)

(assert (=> b!498751 (=> res!300904 e!292265)))

(assert (=> b!498751 (= res!300904 (or (bvsgt #b00000000000000000000000000000000 (x!47070 lt!225925)) (bvsgt (x!47070 lt!225925) #b01111111111111111111111111111110) (bvslt lt!225930 #b00000000000000000000000000000000) (bvsge lt!225930 (size!15859 a!3235)) (bvslt (index!18016 lt!225925) #b00000000000000000000000000000000) (bvsge (index!18016 lt!225925) (size!15859 a!3235)) (not (= lt!225925 (Intermediate!3958 false (index!18016 lt!225925) (x!47070 lt!225925))))))))

(assert (=> b!498751 (and (or (= (select (arr!15494 a!3235) (index!18016 lt!225925)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15494 a!3235) (index!18016 lt!225925)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15494 a!3235) (index!18016 lt!225925)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15494 a!3235) (index!18016 lt!225925)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!225928 () Unit!14902)

(assert (=> b!498751 (= lt!225928 e!292271)))

(declare-fun c!59196 () Bool)

(assert (=> b!498751 (= c!59196 (= (select (arr!15494 a!3235) (index!18016 lt!225925)) (select (arr!15494 a!3235) j!176)))))

(assert (=> b!498751 (and (bvslt (x!47070 lt!225925) #b01111111111111111111111111111110) (or (= (select (arr!15494 a!3235) (index!18016 lt!225925)) (select (arr!15494 a!3235) j!176)) (= (select (arr!15494 a!3235) (index!18016 lt!225925)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15494 a!3235) (index!18016 lt!225925)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!300907 () Bool)

(assert (=> start!45390 (=> (not res!300907) (not e!292270))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45390 (= res!300907 (validMask!0 mask!3524))))

(assert (=> start!45390 e!292270))

(assert (=> start!45390 true))

(declare-fun array_inv!11377 (array!32225) Bool)

(assert (=> start!45390 (array_inv!11377 a!3235)))

(declare-fun b!498744 () Bool)

(declare-fun Unit!14905 () Unit!14902)

(assert (=> b!498744 (= e!292271 Unit!14905)))

(declare-fun lt!225933 () Unit!14902)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32225 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14902)

(assert (=> b!498744 (= lt!225933 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!225930 #b00000000000000000000000000000000 (index!18016 lt!225925) (x!47070 lt!225925) mask!3524))))

(declare-fun res!300901 () Bool)

(assert (=> b!498744 (= res!300901 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225930 lt!225927 lt!225931 mask!3524) (Intermediate!3958 false (index!18016 lt!225925) (x!47070 lt!225925))))))

(assert (=> b!498744 (=> (not res!300901) (not e!292268))))

(assert (=> b!498744 e!292268))

(assert (= (and start!45390 res!300907) b!498745))

(assert (= (and b!498745 res!300903) b!498741))

(assert (= (and b!498741 res!300909) b!498743))

(assert (= (and b!498743 res!300906) b!498738))

(assert (= (and b!498738 res!300911) b!498742))

(assert (= (and b!498742 res!300905) b!498737))

(assert (= (and b!498737 res!300910) b!498747))

(assert (= (and b!498747 res!300908) b!498750))

(assert (= (and b!498750 res!300902) b!498748))

(assert (= (and b!498750 (not res!300899)) b!498740))

(assert (= (and b!498740 (not res!300900)) b!498751))

(assert (= (and b!498751 c!59196) b!498744))

(assert (= (and b!498751 (not c!59196)) b!498739))

(assert (= (and b!498744 res!300901) b!498746))

(assert (= (and b!498751 (not res!300904)) b!498749))

(declare-fun m!479485 () Bool)

(assert (=> b!498742 m!479485))

(declare-fun m!479487 () Bool)

(assert (=> start!45390 m!479487))

(declare-fun m!479489 () Bool)

(assert (=> start!45390 m!479489))

(declare-fun m!479491 () Bool)

(assert (=> b!498751 m!479491))

(declare-fun m!479493 () Bool)

(assert (=> b!498751 m!479493))

(assert (=> b!498748 m!479493))

(assert (=> b!498748 m!479493))

(declare-fun m!479495 () Bool)

(assert (=> b!498748 m!479495))

(declare-fun m!479497 () Bool)

(assert (=> b!498738 m!479497))

(declare-fun m!479499 () Bool)

(assert (=> b!498747 m!479499))

(assert (=> b!498741 m!479493))

(assert (=> b!498741 m!479493))

(declare-fun m!479501 () Bool)

(assert (=> b!498741 m!479501))

(declare-fun m!479503 () Bool)

(assert (=> b!498749 m!479503))

(declare-fun m!479505 () Bool)

(assert (=> b!498750 m!479505))

(declare-fun m!479507 () Bool)

(assert (=> b!498750 m!479507))

(declare-fun m!479509 () Bool)

(assert (=> b!498750 m!479509))

(assert (=> b!498750 m!479493))

(declare-fun m!479511 () Bool)

(assert (=> b!498750 m!479511))

(assert (=> b!498750 m!479493))

(declare-fun m!479513 () Bool)

(assert (=> b!498750 m!479513))

(declare-fun m!479515 () Bool)

(assert (=> b!498750 m!479515))

(assert (=> b!498750 m!479493))

(declare-fun m!479517 () Bool)

(assert (=> b!498750 m!479517))

(declare-fun m!479519 () Bool)

(assert (=> b!498750 m!479519))

(declare-fun m!479521 () Bool)

(assert (=> b!498743 m!479521))

(declare-fun m!479523 () Bool)

(assert (=> b!498737 m!479523))

(declare-fun m!479525 () Bool)

(assert (=> b!498744 m!479525))

(assert (=> b!498744 m!479503))

(check-sat (not start!45390) (not b!498749) (not b!498743) (not b!498750) (not b!498747) (not b!498748) (not b!498744) (not b!498738) (not b!498742) (not b!498737) (not b!498741))
(check-sat)
