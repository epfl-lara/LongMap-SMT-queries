; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46746 () Bool)

(assert start!46746)

(declare-fun b!516099 () Bool)

(declare-fun res!315811 () Bool)

(declare-fun e!301196 () Bool)

(assert (=> b!516099 (=> (not res!315811) (not e!301196))))

(declare-datatypes ((array!33068 0))(
  ( (array!33069 (arr!15902 (Array (_ BitVec 32) (_ BitVec 64))) (size!16267 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33068)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33068 (_ BitVec 32)) Bool)

(assert (=> b!516099 (= res!315811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!516100 () Bool)

(declare-fun res!315810 () Bool)

(declare-fun e!301197 () Bool)

(assert (=> b!516100 (=> (not res!315810) (not e!301197))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!516100 (= res!315810 (validKeyInArray!0 k0!2280))))

(declare-fun b!516101 () Bool)

(declare-fun e!301200 () Bool)

(assert (=> b!516101 (= e!301196 (not e!301200))))

(declare-fun res!315815 () Bool)

(assert (=> b!516101 (=> res!315815 e!301200)))

(declare-datatypes ((SeekEntryResult!4366 0))(
  ( (MissingZero!4366 (index!19652 (_ BitVec 32))) (Found!4366 (index!19653 (_ BitVec 32))) (Intermediate!4366 (undefined!5178 Bool) (index!19654 (_ BitVec 32)) (x!48620 (_ BitVec 32))) (Undefined!4366) (MissingVacant!4366 (index!19655 (_ BitVec 32))) )
))
(declare-fun lt!236155 () SeekEntryResult!4366)

(declare-fun lt!236152 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33068 (_ BitVec 32)) SeekEntryResult!4366)

(assert (=> b!516101 (= res!315815 (= lt!236155 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236152 (select (store (arr!15902 a!3235) i!1204 k0!2280) j!176) (array!33069 (store (arr!15902 a!3235) i!1204 k0!2280) (size!16267 a!3235)) mask!3524)))))

(declare-fun lt!236153 () (_ BitVec 32))

(assert (=> b!516101 (= lt!236155 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236153 (select (arr!15902 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!516101 (= lt!236152 (toIndex!0 (select (store (arr!15902 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!516101 (= lt!236153 (toIndex!0 (select (arr!15902 a!3235) j!176) mask!3524))))

(declare-fun e!301199 () Bool)

(assert (=> b!516101 e!301199))

(declare-fun res!315805 () Bool)

(assert (=> b!516101 (=> (not res!315805) (not e!301199))))

(assert (=> b!516101 (= res!315805 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15976 0))(
  ( (Unit!15977) )
))
(declare-fun lt!236151 () Unit!15976)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33068 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15976)

(assert (=> b!516101 (= lt!236151 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!516102 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33068 (_ BitVec 32)) SeekEntryResult!4366)

(assert (=> b!516102 (= e!301199 (= (seekEntryOrOpen!0 (select (arr!15902 a!3235) j!176) a!3235 mask!3524) (Found!4366 j!176)))))

(declare-fun b!516103 () Bool)

(declare-fun res!315807 () Bool)

(assert (=> b!516103 (=> (not res!315807) (not e!301196))))

(declare-datatypes ((List!10099 0))(
  ( (Nil!10096) (Cons!10095 (h!10993 (_ BitVec 64)) (t!16318 List!10099)) )
))
(declare-fun arrayNoDuplicates!0 (array!33068 (_ BitVec 32) List!10099) Bool)

(assert (=> b!516103 (= res!315807 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10096))))

(declare-fun res!315809 () Bool)

(assert (=> start!46746 (=> (not res!315809) (not e!301197))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46746 (= res!315809 (validMask!0 mask!3524))))

(assert (=> start!46746 e!301197))

(assert (=> start!46746 true))

(declare-fun array_inv!11785 (array!33068) Bool)

(assert (=> start!46746 (array_inv!11785 a!3235)))

(declare-fun b!516104 () Bool)

(assert (=> b!516104 (= e!301200 true)))

(assert (=> b!516104 (and (bvslt (x!48620 lt!236155) #b01111111111111111111111111111110) (or (= (select (arr!15902 a!3235) (index!19654 lt!236155)) (select (arr!15902 a!3235) j!176)) (= (select (arr!15902 a!3235) (index!19654 lt!236155)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15902 a!3235) (index!19654 lt!236155)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!516105 () Bool)

(declare-fun res!315808 () Bool)

(assert (=> b!516105 (=> (not res!315808) (not e!301197))))

(declare-fun arrayContainsKey!0 (array!33068 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!516105 (= res!315808 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!516106 () Bool)

(declare-fun res!315813 () Bool)

(assert (=> b!516106 (=> res!315813 e!301200)))

(get-info :version)

(assert (=> b!516106 (= res!315813 (or (undefined!5178 lt!236155) (not ((_ is Intermediate!4366) lt!236155))))))

(declare-fun b!516107 () Bool)

(assert (=> b!516107 (= e!301197 e!301196)))

(declare-fun res!315806 () Bool)

(assert (=> b!516107 (=> (not res!315806) (not e!301196))))

(declare-fun lt!236154 () SeekEntryResult!4366)

(assert (=> b!516107 (= res!315806 (or (= lt!236154 (MissingZero!4366 i!1204)) (= lt!236154 (MissingVacant!4366 i!1204))))))

(assert (=> b!516107 (= lt!236154 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!516108 () Bool)

(declare-fun res!315814 () Bool)

(assert (=> b!516108 (=> (not res!315814) (not e!301197))))

(assert (=> b!516108 (= res!315814 (and (= (size!16267 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16267 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16267 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!516109 () Bool)

(declare-fun res!315812 () Bool)

(assert (=> b!516109 (=> (not res!315812) (not e!301197))))

(assert (=> b!516109 (= res!315812 (validKeyInArray!0 (select (arr!15902 a!3235) j!176)))))

(assert (= (and start!46746 res!315809) b!516108))

(assert (= (and b!516108 res!315814) b!516109))

(assert (= (and b!516109 res!315812) b!516100))

(assert (= (and b!516100 res!315810) b!516105))

(assert (= (and b!516105 res!315808) b!516107))

(assert (= (and b!516107 res!315806) b!516099))

(assert (= (and b!516099 res!315811) b!516103))

(assert (= (and b!516103 res!315807) b!516101))

(assert (= (and b!516101 res!315805) b!516102))

(assert (= (and b!516101 (not res!315815)) b!516106))

(assert (= (and b!516106 (not res!315813)) b!516104))

(declare-fun m!497095 () Bool)

(assert (=> b!516105 m!497095))

(declare-fun m!497097 () Bool)

(assert (=> b!516107 m!497097))

(declare-fun m!497099 () Bool)

(assert (=> start!46746 m!497099))

(declare-fun m!497101 () Bool)

(assert (=> start!46746 m!497101))

(declare-fun m!497103 () Bool)

(assert (=> b!516100 m!497103))

(declare-fun m!497105 () Bool)

(assert (=> b!516099 m!497105))

(declare-fun m!497107 () Bool)

(assert (=> b!516103 m!497107))

(declare-fun m!497109 () Bool)

(assert (=> b!516102 m!497109))

(assert (=> b!516102 m!497109))

(declare-fun m!497111 () Bool)

(assert (=> b!516102 m!497111))

(declare-fun m!497113 () Bool)

(assert (=> b!516101 m!497113))

(declare-fun m!497115 () Bool)

(assert (=> b!516101 m!497115))

(declare-fun m!497117 () Bool)

(assert (=> b!516101 m!497117))

(declare-fun m!497119 () Bool)

(assert (=> b!516101 m!497119))

(assert (=> b!516101 m!497109))

(declare-fun m!497121 () Bool)

(assert (=> b!516101 m!497121))

(assert (=> b!516101 m!497109))

(declare-fun m!497123 () Bool)

(assert (=> b!516101 m!497123))

(assert (=> b!516101 m!497117))

(declare-fun m!497125 () Bool)

(assert (=> b!516101 m!497125))

(assert (=> b!516101 m!497109))

(declare-fun m!497127 () Bool)

(assert (=> b!516101 m!497127))

(assert (=> b!516101 m!497117))

(assert (=> b!516109 m!497109))

(assert (=> b!516109 m!497109))

(declare-fun m!497129 () Bool)

(assert (=> b!516109 m!497129))

(declare-fun m!497131 () Bool)

(assert (=> b!516104 m!497131))

(assert (=> b!516104 m!497109))

(check-sat (not b!516103) (not b!516101) (not b!516100) (not b!516109) (not b!516107) (not b!516099) (not start!46746) (not b!516102) (not b!516105))
(check-sat)
