; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45824 () Bool)

(assert start!45824)

(declare-fun b!507379 () Bool)

(declare-fun res!308339 () Bool)

(declare-fun e!296932 () Bool)

(assert (=> b!507379 (=> (not res!308339) (not e!296932))))

(declare-datatypes ((array!32580 0))(
  ( (array!32581 (arr!15670 (Array (_ BitVec 32) (_ BitVec 64))) (size!16034 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32580)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507379 (= res!308339 (validKeyInArray!0 (select (arr!15670 a!3235) j!176)))))

(declare-fun res!308343 () Bool)

(assert (=> start!45824 (=> (not res!308343) (not e!296932))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45824 (= res!308343 (validMask!0 mask!3524))))

(assert (=> start!45824 e!296932))

(assert (=> start!45824 true))

(declare-fun array_inv!11466 (array!32580) Bool)

(assert (=> start!45824 (array_inv!11466 a!3235)))

(declare-fun b!507380 () Bool)

(declare-fun res!308348 () Bool)

(assert (=> b!507380 (=> (not res!308348) (not e!296932))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32580 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507380 (= res!308348 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!507381 () Bool)

(declare-fun e!296934 () Bool)

(assert (=> b!507381 (= e!296934 true)))

(declare-fun lt!231675 () array!32580)

(declare-datatypes ((SeekEntryResult!4137 0))(
  ( (MissingZero!4137 (index!18736 (_ BitVec 32))) (Found!4137 (index!18737 (_ BitVec 32))) (Intermediate!4137 (undefined!4949 Bool) (index!18738 (_ BitVec 32)) (x!47730 (_ BitVec 32))) (Undefined!4137) (MissingVacant!4137 (index!18739 (_ BitVec 32))) )
))
(declare-fun lt!231682 () SeekEntryResult!4137)

(declare-fun lt!231679 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32580 (_ BitVec 32)) SeekEntryResult!4137)

(assert (=> b!507381 (= lt!231682 (seekEntryOrOpen!0 lt!231679 lt!231675 mask!3524))))

(assert (=> b!507381 false))

(declare-fun b!507382 () Bool)

(declare-fun e!296933 () Bool)

(assert (=> b!507382 (= e!296932 e!296933)))

(declare-fun res!308341 () Bool)

(assert (=> b!507382 (=> (not res!308341) (not e!296933))))

(declare-fun lt!231676 () SeekEntryResult!4137)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!507382 (= res!308341 (or (= lt!231676 (MissingZero!4137 i!1204)) (= lt!231676 (MissingVacant!4137 i!1204))))))

(assert (=> b!507382 (= lt!231676 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!507383 () Bool)

(declare-fun res!308340 () Bool)

(assert (=> b!507383 (=> (not res!308340) (not e!296933))))

(declare-datatypes ((List!9828 0))(
  ( (Nil!9825) (Cons!9824 (h!10701 (_ BitVec 64)) (t!16056 List!9828)) )
))
(declare-fun arrayNoDuplicates!0 (array!32580 (_ BitVec 32) List!9828) Bool)

(assert (=> b!507383 (= res!308340 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9825))))

(declare-fun b!507384 () Bool)

(declare-fun res!308347 () Bool)

(assert (=> b!507384 (=> (not res!308347) (not e!296932))))

(assert (=> b!507384 (= res!308347 (and (= (size!16034 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16034 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16034 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507385 () Bool)

(declare-fun e!296931 () Bool)

(assert (=> b!507385 (= e!296933 (not e!296931))))

(declare-fun res!308345 () Bool)

(assert (=> b!507385 (=> res!308345 e!296931)))

(declare-fun lt!231678 () SeekEntryResult!4137)

(declare-fun lt!231681 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32580 (_ BitVec 32)) SeekEntryResult!4137)

(assert (=> b!507385 (= res!308345 (= lt!231678 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231681 lt!231679 lt!231675 mask!3524)))))

(declare-fun lt!231677 () (_ BitVec 32))

(assert (=> b!507385 (= lt!231678 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231677 (select (arr!15670 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!507385 (= lt!231681 (toIndex!0 lt!231679 mask!3524))))

(assert (=> b!507385 (= lt!231679 (select (store (arr!15670 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!507385 (= lt!231677 (toIndex!0 (select (arr!15670 a!3235) j!176) mask!3524))))

(assert (=> b!507385 (= lt!231675 (array!32581 (store (arr!15670 a!3235) i!1204 k0!2280) (size!16034 a!3235)))))

(declare-fun e!296930 () Bool)

(assert (=> b!507385 e!296930))

(declare-fun res!308344 () Bool)

(assert (=> b!507385 (=> (not res!308344) (not e!296930))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32580 (_ BitVec 32)) Bool)

(assert (=> b!507385 (= res!308344 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15562 0))(
  ( (Unit!15563) )
))
(declare-fun lt!231680 () Unit!15562)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32580 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15562)

(assert (=> b!507385 (= lt!231680 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!507386 () Bool)

(declare-fun res!308346 () Bool)

(assert (=> b!507386 (=> (not res!308346) (not e!296932))))

(assert (=> b!507386 (= res!308346 (validKeyInArray!0 k0!2280))))

(declare-fun b!507387 () Bool)

(assert (=> b!507387 (= e!296930 (= (seekEntryOrOpen!0 (select (arr!15670 a!3235) j!176) a!3235 mask!3524) (Found!4137 j!176)))))

(declare-fun b!507388 () Bool)

(declare-fun res!308342 () Bool)

(assert (=> b!507388 (=> (not res!308342) (not e!296933))))

(assert (=> b!507388 (= res!308342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!507389 () Bool)

(assert (=> b!507389 (= e!296931 e!296934)))

(declare-fun res!308338 () Bool)

(assert (=> b!507389 (=> res!308338 e!296934)))

(declare-fun lt!231674 () Bool)

(assert (=> b!507389 (= res!308338 (or (and (not lt!231674) (undefined!4949 lt!231678)) (and (not lt!231674) (not (undefined!4949 lt!231678)))))))

(get-info :version)

(assert (=> b!507389 (= lt!231674 (not ((_ is Intermediate!4137) lt!231678)))))

(assert (= (and start!45824 res!308343) b!507384))

(assert (= (and b!507384 res!308347) b!507379))

(assert (= (and b!507379 res!308339) b!507386))

(assert (= (and b!507386 res!308346) b!507380))

(assert (= (and b!507380 res!308348) b!507382))

(assert (= (and b!507382 res!308341) b!507388))

(assert (= (and b!507388 res!308342) b!507383))

(assert (= (and b!507383 res!308340) b!507385))

(assert (= (and b!507385 res!308344) b!507387))

(assert (= (and b!507385 (not res!308345)) b!507389))

(assert (= (and b!507389 (not res!308338)) b!507381))

(declare-fun m!488141 () Bool)

(assert (=> b!507379 m!488141))

(assert (=> b!507379 m!488141))

(declare-fun m!488143 () Bool)

(assert (=> b!507379 m!488143))

(declare-fun m!488145 () Bool)

(assert (=> b!507386 m!488145))

(declare-fun m!488147 () Bool)

(assert (=> b!507383 m!488147))

(declare-fun m!488149 () Bool)

(assert (=> b!507388 m!488149))

(declare-fun m!488151 () Bool)

(assert (=> b!507382 m!488151))

(declare-fun m!488153 () Bool)

(assert (=> b!507381 m!488153))

(declare-fun m!488155 () Bool)

(assert (=> b!507380 m!488155))

(assert (=> b!507387 m!488141))

(assert (=> b!507387 m!488141))

(declare-fun m!488157 () Bool)

(assert (=> b!507387 m!488157))

(declare-fun m!488159 () Bool)

(assert (=> start!45824 m!488159))

(declare-fun m!488161 () Bool)

(assert (=> start!45824 m!488161))

(assert (=> b!507385 m!488141))

(declare-fun m!488163 () Bool)

(assert (=> b!507385 m!488163))

(declare-fun m!488165 () Bool)

(assert (=> b!507385 m!488165))

(declare-fun m!488167 () Bool)

(assert (=> b!507385 m!488167))

(assert (=> b!507385 m!488141))

(declare-fun m!488169 () Bool)

(assert (=> b!507385 m!488169))

(assert (=> b!507385 m!488141))

(declare-fun m!488171 () Bool)

(assert (=> b!507385 m!488171))

(declare-fun m!488173 () Bool)

(assert (=> b!507385 m!488173))

(declare-fun m!488175 () Bool)

(assert (=> b!507385 m!488175))

(declare-fun m!488177 () Bool)

(assert (=> b!507385 m!488177))

(check-sat (not b!507387) (not b!507385) (not b!507382) (not b!507388) (not b!507383) (not b!507379) (not b!507380) (not start!45824) (not b!507386) (not b!507381))
(check-sat)
