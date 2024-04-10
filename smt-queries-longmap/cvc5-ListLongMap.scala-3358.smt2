; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46200 () Bool)

(assert start!46200)

(declare-fun b!511490 () Bool)

(declare-fun res!312156 () Bool)

(declare-fun e!298885 () Bool)

(assert (=> b!511490 (=> res!312156 e!298885)))

(declare-datatypes ((SeekEntryResult!4271 0))(
  ( (MissingZero!4271 (index!19272 (_ BitVec 32))) (Found!4271 (index!19273 (_ BitVec 32))) (Intermediate!4271 (undefined!5083 Bool) (index!19274 (_ BitVec 32)) (x!48230 (_ BitVec 32))) (Undefined!4271) (MissingVacant!4271 (index!19275 (_ BitVec 32))) )
))
(declare-fun lt!234016 () SeekEntryResult!4271)

(assert (=> b!511490 (= res!312156 (or (not (is-Intermediate!4271 lt!234016)) (not (undefined!5083 lt!234016))))))

(declare-fun b!511491 () Bool)

(declare-fun res!312155 () Bool)

(declare-fun e!298886 () Bool)

(assert (=> b!511491 (=> (not res!312155) (not e!298886))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32854 0))(
  ( (array!32855 (arr!15804 (Array (_ BitVec 32) (_ BitVec 64))) (size!16168 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32854)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!511491 (= res!312155 (and (= (size!16168 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16168 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16168 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!312153 () Bool)

(assert (=> start!46200 (=> (not res!312153) (not e!298886))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46200 (= res!312153 (validMask!0 mask!3524))))

(assert (=> start!46200 e!298886))

(assert (=> start!46200 true))

(declare-fun array_inv!11600 (array!32854) Bool)

(assert (=> start!46200 (array_inv!11600 a!3235)))

(declare-fun b!511492 () Bool)

(declare-fun e!298884 () Bool)

(assert (=> b!511492 (= e!298884 (not e!298885))))

(declare-fun res!312159 () Bool)

(assert (=> b!511492 (=> res!312159 e!298885)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun lt!234014 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32854 (_ BitVec 32)) SeekEntryResult!4271)

(assert (=> b!511492 (= res!312159 (= lt!234016 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234014 (select (store (arr!15804 a!3235) i!1204 k!2280) j!176) (array!32855 (store (arr!15804 a!3235) i!1204 k!2280) (size!16168 a!3235)) mask!3524)))))

(declare-fun lt!234015 () (_ BitVec 32))

(assert (=> b!511492 (= lt!234016 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234015 (select (arr!15804 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511492 (= lt!234014 (toIndex!0 (select (store (arr!15804 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!511492 (= lt!234015 (toIndex!0 (select (arr!15804 a!3235) j!176) mask!3524))))

(declare-fun lt!234013 () SeekEntryResult!4271)

(assert (=> b!511492 (= lt!234013 (Found!4271 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32854 (_ BitVec 32)) SeekEntryResult!4271)

(assert (=> b!511492 (= lt!234013 (seekEntryOrOpen!0 (select (arr!15804 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32854 (_ BitVec 32)) Bool)

(assert (=> b!511492 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15800 0))(
  ( (Unit!15801) )
))
(declare-fun lt!234012 () Unit!15800)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32854 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15800)

(assert (=> b!511492 (= lt!234012 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!511493 () Bool)

(declare-fun res!312158 () Bool)

(assert (=> b!511493 (=> (not res!312158) (not e!298884))))

(assert (=> b!511493 (= res!312158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!511494 () Bool)

(declare-fun res!312161 () Bool)

(assert (=> b!511494 (=> (not res!312161) (not e!298886))))

(declare-fun arrayContainsKey!0 (array!32854 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!511494 (= res!312161 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!511495 () Bool)

(assert (=> b!511495 (= e!298886 e!298884)))

(declare-fun res!312157 () Bool)

(assert (=> b!511495 (=> (not res!312157) (not e!298884))))

(declare-fun lt!234011 () SeekEntryResult!4271)

(assert (=> b!511495 (= res!312157 (or (= lt!234011 (MissingZero!4271 i!1204)) (= lt!234011 (MissingVacant!4271 i!1204))))))

(assert (=> b!511495 (= lt!234011 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!511496 () Bool)

(declare-fun res!312160 () Bool)

(assert (=> b!511496 (=> (not res!312160) (not e!298886))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!511496 (= res!312160 (validKeyInArray!0 k!2280))))

(declare-fun b!511497 () Bool)

(declare-fun res!312154 () Bool)

(assert (=> b!511497 (=> (not res!312154) (not e!298884))))

(declare-datatypes ((List!9962 0))(
  ( (Nil!9959) (Cons!9958 (h!10838 (_ BitVec 64)) (t!16190 List!9962)) )
))
(declare-fun arrayNoDuplicates!0 (array!32854 (_ BitVec 32) List!9962) Bool)

(assert (=> b!511497 (= res!312154 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9959))))

(declare-fun b!511498 () Bool)

(declare-fun res!312152 () Bool)

(assert (=> b!511498 (=> (not res!312152) (not e!298886))))

(assert (=> b!511498 (= res!312152 (validKeyInArray!0 (select (arr!15804 a!3235) j!176)))))

(declare-fun b!511499 () Bool)

(assert (=> b!511499 (= e!298885 true)))

(assert (=> b!511499 (= lt!234013 Undefined!4271)))

(assert (= (and start!46200 res!312153) b!511491))

(assert (= (and b!511491 res!312155) b!511498))

(assert (= (and b!511498 res!312152) b!511496))

(assert (= (and b!511496 res!312160) b!511494))

(assert (= (and b!511494 res!312161) b!511495))

(assert (= (and b!511495 res!312157) b!511493))

(assert (= (and b!511493 res!312158) b!511497))

(assert (= (and b!511497 res!312154) b!511492))

(assert (= (and b!511492 (not res!312159)) b!511490))

(assert (= (and b!511490 (not res!312156)) b!511499))

(declare-fun m!492957 () Bool)

(assert (=> b!511495 m!492957))

(declare-fun m!492959 () Bool)

(assert (=> b!511494 m!492959))

(declare-fun m!492961 () Bool)

(assert (=> b!511493 m!492961))

(declare-fun m!492963 () Bool)

(assert (=> b!511492 m!492963))

(declare-fun m!492965 () Bool)

(assert (=> b!511492 m!492965))

(declare-fun m!492967 () Bool)

(assert (=> b!511492 m!492967))

(declare-fun m!492969 () Bool)

(assert (=> b!511492 m!492969))

(declare-fun m!492971 () Bool)

(assert (=> b!511492 m!492971))

(assert (=> b!511492 m!492969))

(declare-fun m!492973 () Bool)

(assert (=> b!511492 m!492973))

(assert (=> b!511492 m!492969))

(assert (=> b!511492 m!492969))

(declare-fun m!492975 () Bool)

(assert (=> b!511492 m!492975))

(assert (=> b!511492 m!492967))

(declare-fun m!492977 () Bool)

(assert (=> b!511492 m!492977))

(declare-fun m!492979 () Bool)

(assert (=> b!511492 m!492979))

(assert (=> b!511492 m!492967))

(declare-fun m!492981 () Bool)

(assert (=> b!511492 m!492981))

(declare-fun m!492983 () Bool)

(assert (=> b!511497 m!492983))

(assert (=> b!511498 m!492969))

(assert (=> b!511498 m!492969))

(declare-fun m!492985 () Bool)

(assert (=> b!511498 m!492985))

(declare-fun m!492987 () Bool)

(assert (=> b!511496 m!492987))

(declare-fun m!492989 () Bool)

(assert (=> start!46200 m!492989))

(declare-fun m!492991 () Bool)

(assert (=> start!46200 m!492991))

(push 1)

