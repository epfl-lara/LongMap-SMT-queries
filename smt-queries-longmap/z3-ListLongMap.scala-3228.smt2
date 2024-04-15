; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45162 () Bool)

(assert start!45162)

(declare-fun b!495423 () Bool)

(declare-fun res!297962 () Bool)

(declare-fun e!290613 () Bool)

(assert (=> b!495423 (=> res!297962 e!290613)))

(declare-datatypes ((SeekEntryResult!3877 0))(
  ( (MissingZero!3877 (index!17687 (_ BitVec 32))) (Found!3877 (index!17688 (_ BitVec 32))) (Intermediate!3877 (undefined!4689 Bool) (index!17689 (_ BitVec 32)) (x!46764 (_ BitVec 32))) (Undefined!3877) (MissingVacant!3877 (index!17690 (_ BitVec 32))) )
))
(declare-fun lt!224172 () SeekEntryResult!3877)

(get-info :version)

(assert (=> b!495423 (= res!297962 (or (undefined!4689 lt!224172) (not ((_ is Intermediate!3877) lt!224172))))))

(declare-fun b!495424 () Bool)

(declare-fun e!290611 () Bool)

(assert (=> b!495424 (= e!290611 (not e!290613))))

(declare-fun res!297960 () Bool)

(assert (=> b!495424 (=> res!297960 e!290613)))

(declare-fun lt!224170 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32060 0))(
  ( (array!32061 (arr!15413 (Array (_ BitVec 32) (_ BitVec 64))) (size!15778 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32060)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32060 (_ BitVec 32)) SeekEntryResult!3877)

(assert (=> b!495424 (= res!297960 (= lt!224172 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224170 (select (store (arr!15413 a!3235) i!1204 k0!2280) j!176) (array!32061 (store (arr!15413 a!3235) i!1204 k0!2280) (size!15778 a!3235)) mask!3524)))))

(declare-fun lt!224169 () (_ BitVec 32))

(assert (=> b!495424 (= lt!224172 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224169 (select (arr!15413 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!495424 (= lt!224170 (toIndex!0 (select (store (arr!15413 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!495424 (= lt!224169 (toIndex!0 (select (arr!15413 a!3235) j!176) mask!3524))))

(declare-fun e!290609 () Bool)

(assert (=> b!495424 e!290609))

(declare-fun res!297953 () Bool)

(assert (=> b!495424 (=> (not res!297953) (not e!290609))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32060 (_ BitVec 32)) Bool)

(assert (=> b!495424 (= res!297953 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14686 0))(
  ( (Unit!14687) )
))
(declare-fun lt!224171 () Unit!14686)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32060 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14686)

(assert (=> b!495424 (= lt!224171 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!495425 () Bool)

(declare-fun res!297955 () Bool)

(assert (=> b!495425 (=> (not res!297955) (not e!290611))))

(assert (=> b!495425 (= res!297955 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!495426 () Bool)

(declare-fun res!297956 () Bool)

(declare-fun e!290612 () Bool)

(assert (=> b!495426 (=> (not res!297956) (not e!290612))))

(declare-fun arrayContainsKey!0 (array!32060 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!495426 (= res!297956 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!495427 () Bool)

(declare-fun res!297952 () Bool)

(assert (=> b!495427 (=> (not res!297952) (not e!290612))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!495427 (= res!297952 (validKeyInArray!0 k0!2280))))

(declare-fun b!495428 () Bool)

(declare-fun res!297961 () Bool)

(assert (=> b!495428 (=> (not res!297961) (not e!290611))))

(declare-datatypes ((List!9610 0))(
  ( (Nil!9607) (Cons!9606 (h!10477 (_ BitVec 64)) (t!15829 List!9610)) )
))
(declare-fun arrayNoDuplicates!0 (array!32060 (_ BitVec 32) List!9610) Bool)

(assert (=> b!495428 (= res!297961 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9607))))

(declare-fun res!297954 () Bool)

(assert (=> start!45162 (=> (not res!297954) (not e!290612))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45162 (= res!297954 (validMask!0 mask!3524))))

(assert (=> start!45162 e!290612))

(assert (=> start!45162 true))

(declare-fun array_inv!11296 (array!32060) Bool)

(assert (=> start!45162 (array_inv!11296 a!3235)))

(declare-fun b!495429 () Bool)

(declare-fun res!297958 () Bool)

(assert (=> b!495429 (=> (not res!297958) (not e!290612))))

(assert (=> b!495429 (= res!297958 (validKeyInArray!0 (select (arr!15413 a!3235) j!176)))))

(declare-fun b!495430 () Bool)

(declare-fun res!297959 () Bool)

(assert (=> b!495430 (=> (not res!297959) (not e!290612))))

(assert (=> b!495430 (= res!297959 (and (= (size!15778 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15778 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15778 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!495431 () Bool)

(assert (=> b!495431 (= e!290613 true)))

(assert (=> b!495431 (and (bvslt (x!46764 lt!224172) #b01111111111111111111111111111110) (or (= (select (arr!15413 a!3235) (index!17689 lt!224172)) (select (arr!15413 a!3235) j!176)) (= (select (arr!15413 a!3235) (index!17689 lt!224172)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15413 a!3235) (index!17689 lt!224172)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!495432 () Bool)

(assert (=> b!495432 (= e!290612 e!290611)))

(declare-fun res!297957 () Bool)

(assert (=> b!495432 (=> (not res!297957) (not e!290611))))

(declare-fun lt!224173 () SeekEntryResult!3877)

(assert (=> b!495432 (= res!297957 (or (= lt!224173 (MissingZero!3877 i!1204)) (= lt!224173 (MissingVacant!3877 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32060 (_ BitVec 32)) SeekEntryResult!3877)

(assert (=> b!495432 (= lt!224173 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!495433 () Bool)

(assert (=> b!495433 (= e!290609 (= (seekEntryOrOpen!0 (select (arr!15413 a!3235) j!176) a!3235 mask!3524) (Found!3877 j!176)))))

(assert (= (and start!45162 res!297954) b!495430))

(assert (= (and b!495430 res!297959) b!495429))

(assert (= (and b!495429 res!297958) b!495427))

(assert (= (and b!495427 res!297952) b!495426))

(assert (= (and b!495426 res!297956) b!495432))

(assert (= (and b!495432 res!297957) b!495425))

(assert (= (and b!495425 res!297955) b!495428))

(assert (= (and b!495428 res!297961) b!495424))

(assert (= (and b!495424 res!297953) b!495433))

(assert (= (and b!495424 (not res!297960)) b!495423))

(assert (= (and b!495423 (not res!297962)) b!495431))

(declare-fun m!476065 () Bool)

(assert (=> b!495428 m!476065))

(declare-fun m!476067 () Bool)

(assert (=> b!495431 m!476067))

(declare-fun m!476069 () Bool)

(assert (=> b!495431 m!476069))

(declare-fun m!476071 () Bool)

(assert (=> b!495432 m!476071))

(declare-fun m!476073 () Bool)

(assert (=> b!495427 m!476073))

(declare-fun m!476075 () Bool)

(assert (=> b!495425 m!476075))

(declare-fun m!476077 () Bool)

(assert (=> b!495424 m!476077))

(declare-fun m!476079 () Bool)

(assert (=> b!495424 m!476079))

(declare-fun m!476081 () Bool)

(assert (=> b!495424 m!476081))

(assert (=> b!495424 m!476077))

(assert (=> b!495424 m!476069))

(declare-fun m!476083 () Bool)

(assert (=> b!495424 m!476083))

(assert (=> b!495424 m!476069))

(declare-fun m!476085 () Bool)

(assert (=> b!495424 m!476085))

(assert (=> b!495424 m!476077))

(declare-fun m!476087 () Bool)

(assert (=> b!495424 m!476087))

(declare-fun m!476089 () Bool)

(assert (=> b!495424 m!476089))

(assert (=> b!495424 m!476069))

(declare-fun m!476091 () Bool)

(assert (=> b!495424 m!476091))

(assert (=> b!495433 m!476069))

(assert (=> b!495433 m!476069))

(declare-fun m!476093 () Bool)

(assert (=> b!495433 m!476093))

(declare-fun m!476095 () Bool)

(assert (=> start!45162 m!476095))

(declare-fun m!476097 () Bool)

(assert (=> start!45162 m!476097))

(declare-fun m!476099 () Bool)

(assert (=> b!495426 m!476099))

(assert (=> b!495429 m!476069))

(assert (=> b!495429 m!476069))

(declare-fun m!476101 () Bool)

(assert (=> b!495429 m!476101))

(check-sat (not b!495425) (not b!495432) (not b!495433) (not b!495428) (not b!495427) (not b!495426) (not start!45162) (not b!495424) (not b!495429))
(check-sat)
