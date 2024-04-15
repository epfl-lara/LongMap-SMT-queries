; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47418 () Bool)

(assert start!47418)

(declare-fun b!521727 () Bool)

(declare-datatypes ((Unit!16234 0))(
  ( (Unit!16235) )
))
(declare-fun e!304325 () Unit!16234)

(declare-fun Unit!16236 () Unit!16234)

(assert (=> b!521727 (= e!304325 Unit!16236)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4447 0))(
  ( (MissingZero!4447 (index!19991 (_ BitVec 32))) (Found!4447 (index!19992 (_ BitVec 32))) (Intermediate!4447 (undefined!5259 Bool) (index!19993 (_ BitVec 32)) (x!48980 (_ BitVec 32))) (Undefined!4447) (MissingVacant!4447 (index!19994 (_ BitVec 32))) )
))
(declare-fun lt!239085 () SeekEntryResult!4447)

(declare-datatypes ((array!33254 0))(
  ( (array!33255 (arr!15983 (Array (_ BitVec 32) (_ BitVec 64))) (size!16348 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33254)

(declare-fun lt!239092 () Unit!16234)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!239089 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33254 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16234)

(assert (=> b!521727 (= lt!239092 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!239089 #b00000000000000000000000000000000 (index!19993 lt!239085) (x!48980 lt!239085) mask!3524))))

(declare-fun res!319589 () Bool)

(declare-fun lt!239090 () array!33254)

(declare-fun lt!239091 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33254 (_ BitVec 32)) SeekEntryResult!4447)

(assert (=> b!521727 (= res!319589 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239089 lt!239091 lt!239090 mask!3524) (Intermediate!4447 false (index!19993 lt!239085) (x!48980 lt!239085))))))

(declare-fun e!304324 () Bool)

(assert (=> b!521727 (=> (not res!319589) (not e!304324))))

(assert (=> b!521727 e!304324))

(declare-fun res!319590 () Bool)

(declare-fun e!304323 () Bool)

(assert (=> start!47418 (=> (not res!319590) (not e!304323))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47418 (= res!319590 (validMask!0 mask!3524))))

(assert (=> start!47418 e!304323))

(assert (=> start!47418 true))

(declare-fun array_inv!11866 (array!33254) Bool)

(assert (=> start!47418 (array_inv!11866 a!3235)))

(declare-fun b!521728 () Bool)

(declare-fun res!319592 () Bool)

(declare-fun e!304320 () Bool)

(assert (=> b!521728 (=> (not res!319592) (not e!304320))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33254 (_ BitVec 32)) Bool)

(assert (=> b!521728 (= res!319592 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!521729 () Bool)

(declare-fun res!319591 () Bool)

(assert (=> b!521729 (=> (not res!319591) (not e!304323))))

(declare-fun arrayContainsKey!0 (array!33254 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!521729 (= res!319591 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!521730 () Bool)

(assert (=> b!521730 (= e!304323 e!304320)))

(declare-fun res!319588 () Bool)

(assert (=> b!521730 (=> (not res!319588) (not e!304320))))

(declare-fun lt!239086 () SeekEntryResult!4447)

(assert (=> b!521730 (= res!319588 (or (= lt!239086 (MissingZero!4447 i!1204)) (= lt!239086 (MissingVacant!4447 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33254 (_ BitVec 32)) SeekEntryResult!4447)

(assert (=> b!521730 (= lt!239086 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!521731 () Bool)

(assert (=> b!521731 (= e!304324 false)))

(declare-fun b!521732 () Bool)

(declare-fun res!319593 () Bool)

(declare-fun e!304321 () Bool)

(assert (=> b!521732 (=> res!319593 e!304321)))

(get-info :version)

(assert (=> b!521732 (= res!319593 (or (undefined!5259 lt!239085) (not ((_ is Intermediate!4447) lt!239085))))))

(declare-fun b!521733 () Bool)

(declare-fun res!319597 () Bool)

(assert (=> b!521733 (=> (not res!319597) (not e!304323))))

(assert (=> b!521733 (= res!319597 (and (= (size!16348 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16348 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16348 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!521734 () Bool)

(assert (=> b!521734 (= e!304321 true)))

(assert (=> b!521734 (and (or (= (select (arr!15983 a!3235) (index!19993 lt!239085)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15983 a!3235) (index!19993 lt!239085)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15983 a!3235) (index!19993 lt!239085)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15983 a!3235) (index!19993 lt!239085)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!239087 () Unit!16234)

(assert (=> b!521734 (= lt!239087 e!304325)))

(declare-fun c!61371 () Bool)

(assert (=> b!521734 (= c!61371 (= (select (arr!15983 a!3235) (index!19993 lt!239085)) (select (arr!15983 a!3235) j!176)))))

(assert (=> b!521734 (and (bvslt (x!48980 lt!239085) #b01111111111111111111111111111110) (or (= (select (arr!15983 a!3235) (index!19993 lt!239085)) (select (arr!15983 a!3235) j!176)) (= (select (arr!15983 a!3235) (index!19993 lt!239085)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15983 a!3235) (index!19993 lt!239085)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!521735 () Bool)

(assert (=> b!521735 (= e!304320 (not e!304321))))

(declare-fun res!319598 () Bool)

(assert (=> b!521735 (=> res!319598 e!304321)))

(declare-fun lt!239088 () (_ BitVec 32))

(assert (=> b!521735 (= res!319598 (= lt!239085 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239088 lt!239091 lt!239090 mask!3524)))))

(assert (=> b!521735 (= lt!239085 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239089 (select (arr!15983 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!521735 (= lt!239088 (toIndex!0 lt!239091 mask!3524))))

(assert (=> b!521735 (= lt!239091 (select (store (arr!15983 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!521735 (= lt!239089 (toIndex!0 (select (arr!15983 a!3235) j!176) mask!3524))))

(assert (=> b!521735 (= lt!239090 (array!33255 (store (arr!15983 a!3235) i!1204 k0!2280) (size!16348 a!3235)))))

(declare-fun e!304322 () Bool)

(assert (=> b!521735 e!304322))

(declare-fun res!319596 () Bool)

(assert (=> b!521735 (=> (not res!319596) (not e!304322))))

(assert (=> b!521735 (= res!319596 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!239084 () Unit!16234)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33254 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16234)

(assert (=> b!521735 (= lt!239084 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!521736 () Bool)

(declare-fun Unit!16237 () Unit!16234)

(assert (=> b!521736 (= e!304325 Unit!16237)))

(declare-fun b!521737 () Bool)

(declare-fun res!319587 () Bool)

(assert (=> b!521737 (=> (not res!319587) (not e!304323))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!521737 (= res!319587 (validKeyInArray!0 (select (arr!15983 a!3235) j!176)))))

(declare-fun b!521738 () Bool)

(declare-fun res!319594 () Bool)

(assert (=> b!521738 (=> (not res!319594) (not e!304320))))

(declare-datatypes ((List!10180 0))(
  ( (Nil!10177) (Cons!10176 (h!11098 (_ BitVec 64)) (t!16399 List!10180)) )
))
(declare-fun arrayNoDuplicates!0 (array!33254 (_ BitVec 32) List!10180) Bool)

(assert (=> b!521738 (= res!319594 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10177))))

(declare-fun b!521739 () Bool)

(declare-fun res!319595 () Bool)

(assert (=> b!521739 (=> (not res!319595) (not e!304323))))

(assert (=> b!521739 (= res!319595 (validKeyInArray!0 k0!2280))))

(declare-fun b!521740 () Bool)

(assert (=> b!521740 (= e!304322 (= (seekEntryOrOpen!0 (select (arr!15983 a!3235) j!176) a!3235 mask!3524) (Found!4447 j!176)))))

(assert (= (and start!47418 res!319590) b!521733))

(assert (= (and b!521733 res!319597) b!521737))

(assert (= (and b!521737 res!319587) b!521739))

(assert (= (and b!521739 res!319595) b!521729))

(assert (= (and b!521729 res!319591) b!521730))

(assert (= (and b!521730 res!319588) b!521728))

(assert (= (and b!521728 res!319592) b!521738))

(assert (= (and b!521738 res!319594) b!521735))

(assert (= (and b!521735 res!319596) b!521740))

(assert (= (and b!521735 (not res!319598)) b!521732))

(assert (= (and b!521732 (not res!319593)) b!521734))

(assert (= (and b!521734 c!61371) b!521727))

(assert (= (and b!521734 (not c!61371)) b!521736))

(assert (= (and b!521727 res!319589) b!521731))

(declare-fun m!502159 () Bool)

(assert (=> b!521735 m!502159))

(declare-fun m!502161 () Bool)

(assert (=> b!521735 m!502161))

(declare-fun m!502163 () Bool)

(assert (=> b!521735 m!502163))

(declare-fun m!502165 () Bool)

(assert (=> b!521735 m!502165))

(declare-fun m!502167 () Bool)

(assert (=> b!521735 m!502167))

(declare-fun m!502169 () Bool)

(assert (=> b!521735 m!502169))

(assert (=> b!521735 m!502167))

(declare-fun m!502171 () Bool)

(assert (=> b!521735 m!502171))

(assert (=> b!521735 m!502167))

(declare-fun m!502173 () Bool)

(assert (=> b!521735 m!502173))

(declare-fun m!502175 () Bool)

(assert (=> b!521735 m!502175))

(declare-fun m!502177 () Bool)

(assert (=> start!47418 m!502177))

(declare-fun m!502179 () Bool)

(assert (=> start!47418 m!502179))

(declare-fun m!502181 () Bool)

(assert (=> b!521727 m!502181))

(declare-fun m!502183 () Bool)

(assert (=> b!521727 m!502183))

(declare-fun m!502185 () Bool)

(assert (=> b!521738 m!502185))

(declare-fun m!502187 () Bool)

(assert (=> b!521730 m!502187))

(assert (=> b!521737 m!502167))

(assert (=> b!521737 m!502167))

(declare-fun m!502189 () Bool)

(assert (=> b!521737 m!502189))

(declare-fun m!502191 () Bool)

(assert (=> b!521739 m!502191))

(declare-fun m!502193 () Bool)

(assert (=> b!521734 m!502193))

(assert (=> b!521734 m!502167))

(declare-fun m!502195 () Bool)

(assert (=> b!521729 m!502195))

(assert (=> b!521740 m!502167))

(assert (=> b!521740 m!502167))

(declare-fun m!502197 () Bool)

(assert (=> b!521740 m!502197))

(declare-fun m!502199 () Bool)

(assert (=> b!521728 m!502199))

(check-sat (not b!521740) (not b!521737) (not b!521730) (not start!47418) (not b!521729) (not b!521738) (not b!521735) (not b!521728) (not b!521739) (not b!521727))
(check-sat)
