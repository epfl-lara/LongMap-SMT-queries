; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45998 () Bool)

(assert start!45998)

(declare-fun b!509271 () Bool)

(declare-fun res!310118 () Bool)

(declare-fun e!297849 () Bool)

(assert (=> b!509271 (=> (not res!310118) (not e!297849))))

(declare-datatypes ((array!32709 0))(
  ( (array!32710 (arr!15733 (Array (_ BitVec 32) (_ BitVec 64))) (size!16097 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32709)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32709 (_ BitVec 32)) Bool)

(assert (=> b!509271 (= res!310118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509272 () Bool)

(declare-fun res!310124 () Bool)

(declare-fun e!297848 () Bool)

(assert (=> b!509272 (=> (not res!310124) (not e!297848))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509272 (= res!310124 (validKeyInArray!0 (select (arr!15733 a!3235) j!176)))))

(declare-fun b!509273 () Bool)

(assert (=> b!509273 (= e!297848 e!297849)))

(declare-fun res!310117 () Bool)

(assert (=> b!509273 (=> (not res!310117) (not e!297849))))

(declare-datatypes ((SeekEntryResult!4200 0))(
  ( (MissingZero!4200 (index!18988 (_ BitVec 32))) (Found!4200 (index!18989 (_ BitVec 32))) (Intermediate!4200 (undefined!5012 Bool) (index!18990 (_ BitVec 32)) (x!47961 (_ BitVec 32))) (Undefined!4200) (MissingVacant!4200 (index!18991 (_ BitVec 32))) )
))
(declare-fun lt!232604 () SeekEntryResult!4200)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!509273 (= res!310117 (or (= lt!232604 (MissingZero!4200 i!1204)) (= lt!232604 (MissingVacant!4200 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32709 (_ BitVec 32)) SeekEntryResult!4200)

(assert (=> b!509273 (= lt!232604 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!509274 () Bool)

(declare-fun res!310123 () Bool)

(assert (=> b!509274 (=> (not res!310123) (not e!297848))))

(assert (=> b!509274 (= res!310123 (validKeyInArray!0 k0!2280))))

(declare-fun b!509275 () Bool)

(declare-fun res!310116 () Bool)

(assert (=> b!509275 (=> (not res!310116) (not e!297849))))

(declare-datatypes ((List!9891 0))(
  ( (Nil!9888) (Cons!9887 (h!10764 (_ BitVec 64)) (t!16119 List!9891)) )
))
(declare-fun arrayNoDuplicates!0 (array!32709 (_ BitVec 32) List!9891) Bool)

(assert (=> b!509275 (= res!310116 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9888))))

(declare-fun res!310122 () Bool)

(assert (=> start!45998 (=> (not res!310122) (not e!297848))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45998 (= res!310122 (validMask!0 mask!3524))))

(assert (=> start!45998 e!297848))

(assert (=> start!45998 true))

(declare-fun array_inv!11529 (array!32709) Bool)

(assert (=> start!45998 (array_inv!11529 a!3235)))

(declare-fun b!509276 () Bool)

(assert (=> b!509276 (= e!297849 (not true))))

(declare-fun lt!232607 () SeekEntryResult!4200)

(declare-fun lt!232609 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32709 (_ BitVec 32)) SeekEntryResult!4200)

(assert (=> b!509276 (= lt!232607 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232609 (select (store (arr!15733 a!3235) i!1204 k0!2280) j!176) (array!32710 (store (arr!15733 a!3235) i!1204 k0!2280) (size!16097 a!3235)) mask!3524))))

(declare-fun lt!232606 () (_ BitVec 32))

(declare-fun lt!232608 () SeekEntryResult!4200)

(assert (=> b!509276 (= lt!232608 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232606 (select (arr!15733 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509276 (= lt!232609 (toIndex!0 (select (store (arr!15733 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!509276 (= lt!232606 (toIndex!0 (select (arr!15733 a!3235) j!176) mask!3524))))

(declare-fun e!297846 () Bool)

(assert (=> b!509276 e!297846))

(declare-fun res!310121 () Bool)

(assert (=> b!509276 (=> (not res!310121) (not e!297846))))

(assert (=> b!509276 (= res!310121 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15658 0))(
  ( (Unit!15659) )
))
(declare-fun lt!232605 () Unit!15658)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32709 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15658)

(assert (=> b!509276 (= lt!232605 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!509277 () Bool)

(declare-fun res!310119 () Bool)

(assert (=> b!509277 (=> (not res!310119) (not e!297848))))

(assert (=> b!509277 (= res!310119 (and (= (size!16097 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16097 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16097 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509278 () Bool)

(declare-fun res!310120 () Bool)

(assert (=> b!509278 (=> (not res!310120) (not e!297848))))

(declare-fun arrayContainsKey!0 (array!32709 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509278 (= res!310120 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509279 () Bool)

(assert (=> b!509279 (= e!297846 (= (seekEntryOrOpen!0 (select (arr!15733 a!3235) j!176) a!3235 mask!3524) (Found!4200 j!176)))))

(assert (= (and start!45998 res!310122) b!509277))

(assert (= (and b!509277 res!310119) b!509272))

(assert (= (and b!509272 res!310124) b!509274))

(assert (= (and b!509274 res!310123) b!509278))

(assert (= (and b!509278 res!310120) b!509273))

(assert (= (and b!509273 res!310117) b!509271))

(assert (= (and b!509271 res!310118) b!509275))

(assert (= (and b!509275 res!310116) b!509276))

(assert (= (and b!509276 res!310121) b!509279))

(declare-fun m!490101 () Bool)

(assert (=> b!509275 m!490101))

(declare-fun m!490103 () Bool)

(assert (=> b!509279 m!490103))

(assert (=> b!509279 m!490103))

(declare-fun m!490105 () Bool)

(assert (=> b!509279 m!490105))

(declare-fun m!490107 () Bool)

(assert (=> b!509274 m!490107))

(assert (=> b!509272 m!490103))

(assert (=> b!509272 m!490103))

(declare-fun m!490109 () Bool)

(assert (=> b!509272 m!490109))

(declare-fun m!490111 () Bool)

(assert (=> b!509278 m!490111))

(declare-fun m!490113 () Bool)

(assert (=> b!509273 m!490113))

(declare-fun m!490115 () Bool)

(assert (=> start!45998 m!490115))

(declare-fun m!490117 () Bool)

(assert (=> start!45998 m!490117))

(declare-fun m!490119 () Bool)

(assert (=> b!509276 m!490119))

(declare-fun m!490121 () Bool)

(assert (=> b!509276 m!490121))

(declare-fun m!490123 () Bool)

(assert (=> b!509276 m!490123))

(assert (=> b!509276 m!490123))

(declare-fun m!490125 () Bool)

(assert (=> b!509276 m!490125))

(assert (=> b!509276 m!490103))

(declare-fun m!490127 () Bool)

(assert (=> b!509276 m!490127))

(assert (=> b!509276 m!490103))

(declare-fun m!490129 () Bool)

(assert (=> b!509276 m!490129))

(assert (=> b!509276 m!490103))

(declare-fun m!490131 () Bool)

(assert (=> b!509276 m!490131))

(assert (=> b!509276 m!490123))

(declare-fun m!490133 () Bool)

(assert (=> b!509276 m!490133))

(declare-fun m!490135 () Bool)

(assert (=> b!509271 m!490135))

(check-sat (not b!509275) (not b!509272) (not b!509279) (not b!509276) (not b!509273) (not start!45998) (not b!509274) (not b!509278) (not b!509271))
(check-sat)
