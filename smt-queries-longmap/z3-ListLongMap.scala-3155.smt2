; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44444 () Bool)

(assert start!44444)

(declare-fun b!488162 () Bool)

(declare-fun res!291381 () Bool)

(declare-fun e!287187 () Bool)

(assert (=> b!488162 (=> (not res!291381) (not e!287187))))

(declare-datatypes ((array!31600 0))(
  ( (array!31601 (arr!15190 (Array (_ BitVec 32) (_ BitVec 64))) (size!15554 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31600)

(declare-datatypes ((List!9255 0))(
  ( (Nil!9252) (Cons!9251 (h!10110 (_ BitVec 64)) (t!15475 List!9255)) )
))
(declare-fun arrayNoDuplicates!0 (array!31600 (_ BitVec 32) List!9255) Bool)

(assert (=> b!488162 (= res!291381 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9252))))

(declare-fun b!488163 () Bool)

(declare-fun res!291382 () Bool)

(assert (=> b!488163 (=> (not res!291382) (not e!287187))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31600 (_ BitVec 32)) Bool)

(assert (=> b!488163 (= res!291382 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!488164 () Bool)

(declare-fun e!287188 () Bool)

(assert (=> b!488164 (= e!287188 e!287187)))

(declare-fun res!291384 () Bool)

(assert (=> b!488164 (=> (not res!291384) (not e!287187))))

(declare-datatypes ((SeekEntryResult!3613 0))(
  ( (MissingZero!3613 (index!16631 (_ BitVec 32))) (Found!3613 (index!16632 (_ BitVec 32))) (Intermediate!3613 (undefined!4425 Bool) (index!16633 (_ BitVec 32)) (x!45897 (_ BitVec 32))) (Undefined!3613) (MissingVacant!3613 (index!16634 (_ BitVec 32))) )
))
(declare-fun lt!220354 () SeekEntryResult!3613)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!488164 (= res!291384 (or (= lt!220354 (MissingZero!3613 i!1204)) (= lt!220354 (MissingVacant!3613 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31600 (_ BitVec 32)) SeekEntryResult!3613)

(assert (=> b!488164 (= lt!220354 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!488165 () Bool)

(declare-fun res!291385 () Bool)

(assert (=> b!488165 (=> (not res!291385) (not e!287188))))

(declare-fun arrayContainsKey!0 (array!31600 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!488165 (= res!291385 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!488166 () Bool)

(declare-fun res!291377 () Bool)

(assert (=> b!488166 (=> (not res!291377) (not e!287188))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!488166 (= res!291377 (and (= (size!15554 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15554 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15554 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!488167 () Bool)

(declare-fun res!291378 () Bool)

(assert (=> b!488167 (=> (not res!291378) (not e!287188))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!488167 (= res!291378 (validKeyInArray!0 (select (arr!15190 a!3235) j!176)))))

(declare-fun b!488168 () Bool)

(assert (=> b!488168 (= e!287187 (not true))))

(declare-fun lt!220352 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!488168 (= lt!220352 (toIndex!0 (select (arr!15190 a!3235) j!176) mask!3524))))

(declare-fun e!287189 () Bool)

(assert (=> b!488168 e!287189))

(declare-fun res!291379 () Bool)

(assert (=> b!488168 (=> (not res!291379) (not e!287189))))

(assert (=> b!488168 (= res!291379 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14233 0))(
  ( (Unit!14234) )
))
(declare-fun lt!220353 () Unit!14233)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31600 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14233)

(assert (=> b!488168 (= lt!220353 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!488170 () Bool)

(assert (=> b!488170 (= e!287189 (= (seekEntryOrOpen!0 (select (arr!15190 a!3235) j!176) a!3235 mask!3524) (Found!3613 j!176)))))

(declare-fun b!488169 () Bool)

(declare-fun res!291380 () Bool)

(assert (=> b!488169 (=> (not res!291380) (not e!287188))))

(assert (=> b!488169 (= res!291380 (validKeyInArray!0 k0!2280))))

(declare-fun res!291383 () Bool)

(assert (=> start!44444 (=> (not res!291383) (not e!287188))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44444 (= res!291383 (validMask!0 mask!3524))))

(assert (=> start!44444 e!287188))

(assert (=> start!44444 true))

(declare-fun array_inv!11049 (array!31600) Bool)

(assert (=> start!44444 (array_inv!11049 a!3235)))

(assert (= (and start!44444 res!291383) b!488166))

(assert (= (and b!488166 res!291377) b!488167))

(assert (= (and b!488167 res!291378) b!488169))

(assert (= (and b!488169 res!291380) b!488165))

(assert (= (and b!488165 res!291385) b!488164))

(assert (= (and b!488164 res!291384) b!488163))

(assert (= (and b!488163 res!291382) b!488162))

(assert (= (and b!488162 res!291381) b!488168))

(assert (= (and b!488168 res!291379) b!488170))

(declare-fun m!468157 () Bool)

(assert (=> b!488164 m!468157))

(declare-fun m!468159 () Bool)

(assert (=> b!488167 m!468159))

(assert (=> b!488167 m!468159))

(declare-fun m!468161 () Bool)

(assert (=> b!488167 m!468161))

(assert (=> b!488168 m!468159))

(assert (=> b!488168 m!468159))

(declare-fun m!468163 () Bool)

(assert (=> b!488168 m!468163))

(declare-fun m!468165 () Bool)

(assert (=> b!488168 m!468165))

(declare-fun m!468167 () Bool)

(assert (=> b!488168 m!468167))

(declare-fun m!468169 () Bool)

(assert (=> b!488165 m!468169))

(declare-fun m!468171 () Bool)

(assert (=> b!488169 m!468171))

(declare-fun m!468173 () Bool)

(assert (=> b!488162 m!468173))

(declare-fun m!468175 () Bool)

(assert (=> start!44444 m!468175))

(declare-fun m!468177 () Bool)

(assert (=> start!44444 m!468177))

(declare-fun m!468179 () Bool)

(assert (=> b!488163 m!468179))

(assert (=> b!488170 m!468159))

(assert (=> b!488170 m!468159))

(declare-fun m!468181 () Bool)

(assert (=> b!488170 m!468181))

(check-sat (not b!488164) (not b!488169) (not b!488167) (not start!44444) (not b!488165) (not b!488163) (not b!488162) (not b!488168) (not b!488170))
(check-sat)
