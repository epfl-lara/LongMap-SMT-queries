; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46262 () Bool)

(assert start!46262)

(declare-fun b!512420 () Bool)

(declare-fun res!313091 () Bool)

(declare-fun e!299259 () Bool)

(assert (=> b!512420 (=> (not res!313091) (not e!299259))))

(declare-datatypes ((array!32916 0))(
  ( (array!32917 (arr!15835 (Array (_ BitVec 32) (_ BitVec 64))) (size!16199 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32916)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!512420 (= res!313091 (validKeyInArray!0 (select (arr!15835 a!3235) j!176)))))

(declare-fun b!512421 () Bool)

(declare-fun res!313084 () Bool)

(assert (=> b!512421 (=> (not res!313084) (not e!299259))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!512421 (= res!313084 (and (= (size!16199 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16199 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16199 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!512422 () Bool)

(declare-fun res!313087 () Bool)

(declare-fun e!299258 () Bool)

(assert (=> b!512422 (=> res!313087 e!299258)))

(declare-datatypes ((SeekEntryResult!4302 0))(
  ( (MissingZero!4302 (index!19396 (_ BitVec 32))) (Found!4302 (index!19397 (_ BitVec 32))) (Intermediate!4302 (undefined!5114 Bool) (index!19398 (_ BitVec 32)) (x!48341 (_ BitVec 32))) (Undefined!4302) (MissingVacant!4302 (index!19399 (_ BitVec 32))) )
))
(declare-fun lt!234574 () SeekEntryResult!4302)

(get-info :version)

(assert (=> b!512422 (= res!313087 (or (not ((_ is Intermediate!4302) lt!234574)) (not (undefined!5114 lt!234574))))))

(declare-fun b!512423 () Bool)

(assert (=> b!512423 (= e!299258 true)))

(declare-fun lt!234572 () SeekEntryResult!4302)

(assert (=> b!512423 (= lt!234572 Undefined!4302)))

(declare-fun b!512424 () Bool)

(declare-fun res!313090 () Bool)

(declare-fun e!299256 () Bool)

(assert (=> b!512424 (=> (not res!313090) (not e!299256))))

(declare-datatypes ((List!9993 0))(
  ( (Nil!9990) (Cons!9989 (h!10869 (_ BitVec 64)) (t!16221 List!9993)) )
))
(declare-fun arrayNoDuplicates!0 (array!32916 (_ BitVec 32) List!9993) Bool)

(assert (=> b!512424 (= res!313090 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9990))))

(declare-fun b!512425 () Bool)

(declare-fun res!313086 () Bool)

(assert (=> b!512425 (=> (not res!313086) (not e!299259))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32916 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!512425 (= res!313086 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!313083 () Bool)

(assert (=> start!46262 (=> (not res!313083) (not e!299259))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46262 (= res!313083 (validMask!0 mask!3524))))

(assert (=> start!46262 e!299259))

(assert (=> start!46262 true))

(declare-fun array_inv!11631 (array!32916) Bool)

(assert (=> start!46262 (array_inv!11631 a!3235)))

(declare-fun b!512426 () Bool)

(declare-fun res!313088 () Bool)

(assert (=> b!512426 (=> (not res!313088) (not e!299259))))

(assert (=> b!512426 (= res!313088 (validKeyInArray!0 k0!2280))))

(declare-fun b!512427 () Bool)

(assert (=> b!512427 (= e!299259 e!299256)))

(declare-fun res!313082 () Bool)

(assert (=> b!512427 (=> (not res!313082) (not e!299256))))

(declare-fun lt!234570 () SeekEntryResult!4302)

(assert (=> b!512427 (= res!313082 (or (= lt!234570 (MissingZero!4302 i!1204)) (= lt!234570 (MissingVacant!4302 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32916 (_ BitVec 32)) SeekEntryResult!4302)

(assert (=> b!512427 (= lt!234570 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!512428 () Bool)

(assert (=> b!512428 (= e!299256 (not e!299258))))

(declare-fun res!313089 () Bool)

(assert (=> b!512428 (=> res!313089 e!299258)))

(declare-fun lt!234573 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32916 (_ BitVec 32)) SeekEntryResult!4302)

(assert (=> b!512428 (= res!313089 (= lt!234574 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234573 (select (store (arr!15835 a!3235) i!1204 k0!2280) j!176) (array!32917 (store (arr!15835 a!3235) i!1204 k0!2280) (size!16199 a!3235)) mask!3524)))))

(declare-fun lt!234569 () (_ BitVec 32))

(assert (=> b!512428 (= lt!234574 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234569 (select (arr!15835 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512428 (= lt!234573 (toIndex!0 (select (store (arr!15835 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!512428 (= lt!234569 (toIndex!0 (select (arr!15835 a!3235) j!176) mask!3524))))

(assert (=> b!512428 (= lt!234572 (Found!4302 j!176))))

(assert (=> b!512428 (= lt!234572 (seekEntryOrOpen!0 (select (arr!15835 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32916 (_ BitVec 32)) Bool)

(assert (=> b!512428 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15862 0))(
  ( (Unit!15863) )
))
(declare-fun lt!234571 () Unit!15862)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32916 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15862)

(assert (=> b!512428 (= lt!234571 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!512429 () Bool)

(declare-fun res!313085 () Bool)

(assert (=> b!512429 (=> (not res!313085) (not e!299256))))

(assert (=> b!512429 (= res!313085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!46262 res!313083) b!512421))

(assert (= (and b!512421 res!313084) b!512420))

(assert (= (and b!512420 res!313091) b!512426))

(assert (= (and b!512426 res!313088) b!512425))

(assert (= (and b!512425 res!313086) b!512427))

(assert (= (and b!512427 res!313082) b!512429))

(assert (= (and b!512429 res!313085) b!512424))

(assert (= (and b!512424 res!313090) b!512428))

(assert (= (and b!512428 (not res!313089)) b!512422))

(assert (= (and b!512422 (not res!313087)) b!512423))

(declare-fun m!494073 () Bool)

(assert (=> b!512424 m!494073))

(declare-fun m!494075 () Bool)

(assert (=> b!512427 m!494075))

(declare-fun m!494077 () Bool)

(assert (=> start!46262 m!494077))

(declare-fun m!494079 () Bool)

(assert (=> start!46262 m!494079))

(declare-fun m!494081 () Bool)

(assert (=> b!512429 m!494081))

(declare-fun m!494083 () Bool)

(assert (=> b!512425 m!494083))

(declare-fun m!494085 () Bool)

(assert (=> b!512428 m!494085))

(declare-fun m!494087 () Bool)

(assert (=> b!512428 m!494087))

(declare-fun m!494089 () Bool)

(assert (=> b!512428 m!494089))

(declare-fun m!494091 () Bool)

(assert (=> b!512428 m!494091))

(assert (=> b!512428 m!494089))

(declare-fun m!494093 () Bool)

(assert (=> b!512428 m!494093))

(declare-fun m!494095 () Bool)

(assert (=> b!512428 m!494095))

(declare-fun m!494097 () Bool)

(assert (=> b!512428 m!494097))

(assert (=> b!512428 m!494095))

(declare-fun m!494099 () Bool)

(assert (=> b!512428 m!494099))

(assert (=> b!512428 m!494095))

(assert (=> b!512428 m!494089))

(declare-fun m!494101 () Bool)

(assert (=> b!512428 m!494101))

(assert (=> b!512428 m!494089))

(declare-fun m!494103 () Bool)

(assert (=> b!512428 m!494103))

(assert (=> b!512420 m!494089))

(assert (=> b!512420 m!494089))

(declare-fun m!494105 () Bool)

(assert (=> b!512420 m!494105))

(declare-fun m!494107 () Bool)

(assert (=> b!512426 m!494107))

(check-sat (not b!512425) (not b!512427) (not b!512420) (not b!512426) (not b!512424) (not start!46262) (not b!512429) (not b!512428))
(check-sat)
