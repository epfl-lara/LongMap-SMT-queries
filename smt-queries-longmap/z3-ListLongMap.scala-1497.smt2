; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28408 () Bool)

(assert start!28408)

(declare-fun b!291000 () Bool)

(declare-fun res!152317 () Bool)

(declare-fun e!184132 () Bool)

(assert (=> b!291000 (=> (not res!152317) (not e!184132))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14682 0))(
  ( (array!14683 (arr!6967 (Array (_ BitVec 32) (_ BitVec 64))) (size!7319 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14682)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!291000 (= res!152317 (and (= (size!7319 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7319 a!3312))))))

(declare-fun b!291001 () Bool)

(declare-fun res!152319 () Bool)

(assert (=> b!291001 (=> (not res!152319) (not e!184132))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14682 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!291001 (= res!152319 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!291002 () Bool)

(declare-fun res!152318 () Bool)

(declare-fun e!184134 () Bool)

(assert (=> b!291002 (=> (not res!152318) (not e!184134))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14682 (_ BitVec 32)) Bool)

(assert (=> b!291002 (= res!152318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!291003 () Bool)

(assert (=> b!291003 (= e!184132 e!184134)))

(declare-fun res!152313 () Bool)

(assert (=> b!291003 (=> (not res!152313) (not e!184134))))

(declare-datatypes ((SeekEntryResult!2081 0))(
  ( (MissingZero!2081 (index!10494 (_ BitVec 32))) (Found!2081 (index!10495 (_ BitVec 32))) (Intermediate!2081 (undefined!2893 Bool) (index!10496 (_ BitVec 32)) (x!28796 (_ BitVec 32))) (Undefined!2081) (MissingVacant!2081 (index!10497 (_ BitVec 32))) )
))
(declare-fun lt!143890 () SeekEntryResult!2081)

(declare-fun lt!143891 () Bool)

(assert (=> b!291003 (= res!152313 (or lt!143891 (= lt!143890 (MissingVacant!2081 i!1256))))))

(assert (=> b!291003 (= lt!143891 (= lt!143890 (MissingZero!2081 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14682 (_ BitVec 32)) SeekEntryResult!2081)

(assert (=> b!291003 (= lt!143890 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!291004 () Bool)

(declare-fun e!184135 () Bool)

(assert (=> b!291004 (= e!184135 (not true))))

(declare-fun lt!143889 () SeekEntryResult!2081)

(assert (=> b!291004 (= (index!10496 lt!143889) i!1256)))

(declare-fun b!291005 () Bool)

(declare-fun e!184133 () Bool)

(assert (=> b!291005 (= e!184134 e!184133)))

(declare-fun res!152314 () Bool)

(assert (=> b!291005 (=> (not res!152314) (not e!184133))))

(assert (=> b!291005 (= res!152314 (and (not lt!143891) (= lt!143890 (MissingVacant!2081 i!1256))))))

(declare-fun lt!143892 () (_ BitVec 32))

(declare-fun lt!143887 () SeekEntryResult!2081)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14682 (_ BitVec 32)) SeekEntryResult!2081)

(assert (=> b!291005 (= lt!143887 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143892 k0!2524 (array!14683 (store (arr!6967 a!3312) i!1256 k0!2524) (size!7319 a!3312)) mask!3809))))

(assert (=> b!291005 (= lt!143889 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143892 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291005 (= lt!143892 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!152315 () Bool)

(assert (=> start!28408 (=> (not res!152315) (not e!184132))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28408 (= res!152315 (validMask!0 mask!3809))))

(assert (=> start!28408 e!184132))

(assert (=> start!28408 true))

(declare-fun array_inv!4917 (array!14682) Bool)

(assert (=> start!28408 (array_inv!4917 a!3312)))

(declare-fun b!291006 () Bool)

(assert (=> b!291006 (= e!184133 e!184135)))

(declare-fun res!152316 () Bool)

(assert (=> b!291006 (=> (not res!152316) (not e!184135))))

(declare-fun lt!143888 () Bool)

(assert (=> b!291006 (= res!152316 (and (or lt!143888 (not (undefined!2893 lt!143889))) (not lt!143888) (= (select (arr!6967 a!3312) (index!10496 lt!143889)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!291006 (= lt!143888 (not ((_ is Intermediate!2081) lt!143889)))))

(declare-fun b!291007 () Bool)

(declare-fun res!152312 () Bool)

(assert (=> b!291007 (=> (not res!152312) (not e!184132))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!291007 (= res!152312 (validKeyInArray!0 k0!2524))))

(assert (= (and start!28408 res!152315) b!291000))

(assert (= (and b!291000 res!152317) b!291007))

(assert (= (and b!291007 res!152312) b!291001))

(assert (= (and b!291001 res!152319) b!291003))

(assert (= (and b!291003 res!152313) b!291002))

(assert (= (and b!291002 res!152318) b!291005))

(assert (= (and b!291005 res!152314) b!291006))

(assert (= (and b!291006 res!152316) b!291004))

(declare-fun m!305135 () Bool)

(assert (=> b!291005 m!305135))

(declare-fun m!305137 () Bool)

(assert (=> b!291005 m!305137))

(declare-fun m!305139 () Bool)

(assert (=> b!291005 m!305139))

(declare-fun m!305141 () Bool)

(assert (=> b!291005 m!305141))

(declare-fun m!305143 () Bool)

(assert (=> b!291002 m!305143))

(declare-fun m!305145 () Bool)

(assert (=> b!291001 m!305145))

(declare-fun m!305147 () Bool)

(assert (=> b!291006 m!305147))

(declare-fun m!305149 () Bool)

(assert (=> b!291007 m!305149))

(declare-fun m!305151 () Bool)

(assert (=> b!291003 m!305151))

(declare-fun m!305153 () Bool)

(assert (=> start!28408 m!305153))

(declare-fun m!305155 () Bool)

(assert (=> start!28408 m!305155))

(check-sat (not b!291001) (not b!291005) (not b!291007) (not b!291002) (not start!28408) (not b!291003))
(check-sat)
