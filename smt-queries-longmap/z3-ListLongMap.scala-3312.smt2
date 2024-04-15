; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45804 () Bool)

(assert start!45804)

(declare-fun b!506976 () Bool)

(declare-fun res!308079 () Bool)

(declare-fun e!296683 () Bool)

(assert (=> b!506976 (=> (not res!308079) (not e!296683))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506976 (= res!308079 (validKeyInArray!0 k0!2280))))

(declare-fun res!308084 () Bool)

(assert (=> start!45804 (=> (not res!308084) (not e!296683))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45804 (= res!308084 (validMask!0 mask!3524))))

(assert (=> start!45804 e!296683))

(assert (=> start!45804 true))

(declare-datatypes ((array!32570 0))(
  ( (array!32571 (arr!15665 (Array (_ BitVec 32) (_ BitVec 64))) (size!16030 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32570)

(declare-fun array_inv!11548 (array!32570) Bool)

(assert (=> start!45804 (array_inv!11548 a!3235)))

(declare-fun e!296684 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!506977 () Bool)

(declare-datatypes ((SeekEntryResult!4129 0))(
  ( (MissingZero!4129 (index!18704 (_ BitVec 32))) (Found!4129 (index!18705 (_ BitVec 32))) (Intermediate!4129 (undefined!4941 Bool) (index!18706 (_ BitVec 32)) (x!47709 (_ BitVec 32))) (Undefined!4129) (MissingVacant!4129 (index!18707 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32570 (_ BitVec 32)) SeekEntryResult!4129)

(assert (=> b!506977 (= e!296684 (= (seekEntryOrOpen!0 (select (arr!15665 a!3235) j!176) a!3235 mask!3524) (Found!4129 j!176)))))

(declare-fun b!506978 () Bool)

(declare-fun e!296685 () Bool)

(assert (=> b!506978 (= e!296683 e!296685)))

(declare-fun res!308077 () Bool)

(assert (=> b!506978 (=> (not res!308077) (not e!296685))))

(declare-fun lt!231334 () SeekEntryResult!4129)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!506978 (= res!308077 (or (= lt!231334 (MissingZero!4129 i!1204)) (= lt!231334 (MissingVacant!4129 i!1204))))))

(assert (=> b!506978 (= lt!231334 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!506979 () Bool)

(declare-fun res!308083 () Bool)

(assert (=> b!506979 (=> (not res!308083) (not e!296685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32570 (_ BitVec 32)) Bool)

(assert (=> b!506979 (= res!308083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!506980 () Bool)

(declare-fun e!296687 () Bool)

(assert (=> b!506980 (= e!296687 true)))

(declare-fun lt!231337 () SeekEntryResult!4129)

(declare-fun lt!231332 () array!32570)

(declare-fun lt!231336 () (_ BitVec 64))

(assert (=> b!506980 (= lt!231337 (seekEntryOrOpen!0 lt!231336 lt!231332 mask!3524))))

(assert (=> b!506980 false))

(declare-fun b!506981 () Bool)

(declare-fun res!308086 () Bool)

(assert (=> b!506981 (=> (not res!308086) (not e!296683))))

(declare-fun arrayContainsKey!0 (array!32570 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506981 (= res!308086 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!506982 () Bool)

(declare-fun res!308085 () Bool)

(assert (=> b!506982 (=> (not res!308085) (not e!296685))))

(declare-datatypes ((List!9862 0))(
  ( (Nil!9859) (Cons!9858 (h!10735 (_ BitVec 64)) (t!16081 List!9862)) )
))
(declare-fun arrayNoDuplicates!0 (array!32570 (_ BitVec 32) List!9862) Bool)

(assert (=> b!506982 (= res!308085 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9859))))

(declare-fun b!506983 () Bool)

(declare-fun e!296688 () Bool)

(assert (=> b!506983 (= e!296685 (not e!296688))))

(declare-fun res!308087 () Bool)

(assert (=> b!506983 (=> res!308087 e!296688)))

(declare-fun lt!231335 () SeekEntryResult!4129)

(declare-fun lt!231338 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32570 (_ BitVec 32)) SeekEntryResult!4129)

(assert (=> b!506983 (= res!308087 (= lt!231335 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231338 lt!231336 lt!231332 mask!3524)))))

(declare-fun lt!231339 () (_ BitVec 32))

(assert (=> b!506983 (= lt!231335 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231339 (select (arr!15665 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506983 (= lt!231338 (toIndex!0 lt!231336 mask!3524))))

(assert (=> b!506983 (= lt!231336 (select (store (arr!15665 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!506983 (= lt!231339 (toIndex!0 (select (arr!15665 a!3235) j!176) mask!3524))))

(assert (=> b!506983 (= lt!231332 (array!32571 (store (arr!15665 a!3235) i!1204 k0!2280) (size!16030 a!3235)))))

(assert (=> b!506983 e!296684))

(declare-fun res!308078 () Bool)

(assert (=> b!506983 (=> (not res!308078) (not e!296684))))

(assert (=> b!506983 (= res!308078 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15532 0))(
  ( (Unit!15533) )
))
(declare-fun lt!231340 () Unit!15532)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32570 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15532)

(assert (=> b!506983 (= lt!231340 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!506984 () Bool)

(assert (=> b!506984 (= e!296688 e!296687)))

(declare-fun res!308080 () Bool)

(assert (=> b!506984 (=> res!308080 e!296687)))

(declare-fun lt!231333 () Bool)

(assert (=> b!506984 (= res!308080 (or (and (not lt!231333) (undefined!4941 lt!231335)) (and (not lt!231333) (not (undefined!4941 lt!231335)))))))

(get-info :version)

(assert (=> b!506984 (= lt!231333 (not ((_ is Intermediate!4129) lt!231335)))))

(declare-fun b!506985 () Bool)

(declare-fun res!308081 () Bool)

(assert (=> b!506985 (=> (not res!308081) (not e!296683))))

(assert (=> b!506985 (= res!308081 (and (= (size!16030 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16030 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16030 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506986 () Bool)

(declare-fun res!308082 () Bool)

(assert (=> b!506986 (=> (not res!308082) (not e!296683))))

(assert (=> b!506986 (= res!308082 (validKeyInArray!0 (select (arr!15665 a!3235) j!176)))))

(assert (= (and start!45804 res!308084) b!506985))

(assert (= (and b!506985 res!308081) b!506986))

(assert (= (and b!506986 res!308082) b!506976))

(assert (= (and b!506976 res!308079) b!506981))

(assert (= (and b!506981 res!308086) b!506978))

(assert (= (and b!506978 res!308077) b!506979))

(assert (= (and b!506979 res!308083) b!506982))

(assert (= (and b!506982 res!308085) b!506983))

(assert (= (and b!506983 res!308078) b!506977))

(assert (= (and b!506983 (not res!308087)) b!506984))

(assert (= (and b!506984 (not res!308080)) b!506980))

(declare-fun m!487237 () Bool)

(assert (=> b!506981 m!487237))

(declare-fun m!487239 () Bool)

(assert (=> b!506977 m!487239))

(assert (=> b!506977 m!487239))

(declare-fun m!487241 () Bool)

(assert (=> b!506977 m!487241))

(declare-fun m!487243 () Bool)

(assert (=> b!506979 m!487243))

(declare-fun m!487245 () Bool)

(assert (=> start!45804 m!487245))

(declare-fun m!487247 () Bool)

(assert (=> start!45804 m!487247))

(assert (=> b!506986 m!487239))

(assert (=> b!506986 m!487239))

(declare-fun m!487249 () Bool)

(assert (=> b!506986 m!487249))

(declare-fun m!487251 () Bool)

(assert (=> b!506982 m!487251))

(declare-fun m!487253 () Bool)

(assert (=> b!506980 m!487253))

(declare-fun m!487255 () Bool)

(assert (=> b!506978 m!487255))

(declare-fun m!487257 () Bool)

(assert (=> b!506976 m!487257))

(declare-fun m!487259 () Bool)

(assert (=> b!506983 m!487259))

(assert (=> b!506983 m!487239))

(declare-fun m!487261 () Bool)

(assert (=> b!506983 m!487261))

(declare-fun m!487263 () Bool)

(assert (=> b!506983 m!487263))

(declare-fun m!487265 () Bool)

(assert (=> b!506983 m!487265))

(declare-fun m!487267 () Bool)

(assert (=> b!506983 m!487267))

(assert (=> b!506983 m!487239))

(declare-fun m!487269 () Bool)

(assert (=> b!506983 m!487269))

(assert (=> b!506983 m!487239))

(declare-fun m!487271 () Bool)

(assert (=> b!506983 m!487271))

(declare-fun m!487273 () Bool)

(assert (=> b!506983 m!487273))

(check-sat (not b!506982) (not b!506977) (not b!506983) (not start!45804) (not b!506979) (not b!506978) (not b!506986) (not b!506976) (not b!506980) (not b!506981))
(check-sat)
