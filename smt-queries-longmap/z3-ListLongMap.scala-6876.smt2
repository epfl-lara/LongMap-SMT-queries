; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86502 () Bool)

(assert start!86502)

(declare-fun b!1001971 () Bool)

(declare-fun res!671575 () Bool)

(declare-fun e!564493 () Bool)

(assert (=> b!1001971 (=> (not res!671575) (not e!564493))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9407 0))(
  ( (MissingZero!9407 (index!39999 (_ BitVec 32))) (Found!9407 (index!40000 (_ BitVec 32))) (Intermediate!9407 (undefined!10219 Bool) (index!40001 (_ BitVec 32)) (x!87430 (_ BitVec 32))) (Undefined!9407) (MissingVacant!9407 (index!40002 (_ BitVec 32))) )
))
(declare-fun lt!442822 () SeekEntryResult!9407)

(declare-datatypes ((array!63250 0))(
  ( (array!63251 (arr!30450 (Array (_ BitVec 32) (_ BitVec 64))) (size!30954 (_ BitVec 32))) )
))
(declare-fun lt!442823 () array!63250)

(declare-fun lt!442818 () (_ BitVec 64))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63250 (_ BitVec 32)) SeekEntryResult!9407)

(assert (=> b!1001971 (= res!671575 (not (= lt!442822 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442818 lt!442823 mask!3464))))))

(declare-fun res!671586 () Bool)

(declare-fun e!564497 () Bool)

(assert (=> start!86502 (=> (not res!671586) (not e!564497))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86502 (= res!671586 (validMask!0 mask!3464))))

(assert (=> start!86502 e!564497))

(declare-fun a!3219 () array!63250)

(declare-fun array_inv!23593 (array!63250) Bool)

(assert (=> start!86502 (array_inv!23593 a!3219)))

(assert (=> start!86502 true))

(declare-fun b!1001972 () Bool)

(declare-fun res!671587 () Bool)

(assert (=> b!1001972 (=> (not res!671587) (not e!564493))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1001972 (= res!671587 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1001973 () Bool)

(declare-fun e!564494 () Bool)

(declare-fun e!564492 () Bool)

(assert (=> b!1001973 (= e!564494 e!564492)))

(declare-fun res!671581 () Bool)

(assert (=> b!1001973 (=> (not res!671581) (not e!564492))))

(declare-fun lt!442820 () SeekEntryResult!9407)

(declare-fun lt!442824 () SeekEntryResult!9407)

(assert (=> b!1001973 (= res!671581 (= lt!442820 lt!442824))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1001973 (= lt!442824 (Intermediate!9407 false resIndex!38 resX!38))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001973 (= lt!442820 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30450 a!3219) j!170) mask!3464) (select (arr!30450 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001974 () Bool)

(declare-fun e!564491 () Bool)

(assert (=> b!1001974 (= e!564493 e!564491)))

(declare-fun res!671576 () Bool)

(assert (=> b!1001974 (=> (not res!671576) (not e!564491))))

(declare-fun lt!442819 () (_ BitVec 32))

(assert (=> b!1001974 (= res!671576 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!442819 #b00000000000000000000000000000000) (bvslt lt!442819 (size!30954 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001974 (= lt!442819 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1001975 () Bool)

(assert (=> b!1001975 (= e!564497 e!564494)))

(declare-fun res!671573 () Bool)

(assert (=> b!1001975 (=> (not res!671573) (not e!564494))))

(declare-fun lt!442821 () SeekEntryResult!9407)

(assert (=> b!1001975 (= res!671573 (or (= lt!442821 (MissingVacant!9407 i!1194)) (= lt!442821 (MissingZero!9407 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63250 (_ BitVec 32)) SeekEntryResult!9407)

(assert (=> b!1001975 (= lt!442821 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1001976 () Bool)

(declare-fun res!671577 () Bool)

(assert (=> b!1001976 (=> (not res!671577) (not e!564494))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63250 (_ BitVec 32)) Bool)

(assert (=> b!1001976 (= res!671577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1001977 () Bool)

(declare-fun res!671588 () Bool)

(assert (=> b!1001977 (=> (not res!671588) (not e!564497))))

(assert (=> b!1001977 (= res!671588 (and (= (size!30954 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30954 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30954 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1001978 () Bool)

(declare-fun res!671580 () Bool)

(assert (=> b!1001978 (=> (not res!671580) (not e!564497))))

(declare-fun arrayContainsKey!0 (array!63250 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1001978 (= res!671580 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1001979 () Bool)

(declare-fun res!671585 () Bool)

(assert (=> b!1001979 (=> (not res!671585) (not e!564494))))

(declare-datatypes ((List!21192 0))(
  ( (Nil!21189) (Cons!21188 (h!22365 (_ BitVec 64)) (t!30184 List!21192)) )
))
(declare-fun arrayNoDuplicates!0 (array!63250 (_ BitVec 32) List!21192) Bool)

(assert (=> b!1001979 (= res!671585 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21189))))

(declare-fun b!1001980 () Bool)

(declare-fun e!564495 () Bool)

(assert (=> b!1001980 (= e!564492 e!564495)))

(declare-fun res!671579 () Bool)

(assert (=> b!1001980 (=> (not res!671579) (not e!564495))))

(assert (=> b!1001980 (= res!671579 (= lt!442822 lt!442824))))

(assert (=> b!1001980 (= lt!442822 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30450 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001981 () Bool)

(declare-fun res!671578 () Bool)

(assert (=> b!1001981 (=> (not res!671578) (not e!564494))))

(assert (=> b!1001981 (= res!671578 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30954 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30954 a!3219))))))

(declare-fun b!1001982 () Bool)

(declare-fun res!671582 () Bool)

(assert (=> b!1001982 (=> (not res!671582) (not e!564491))))

(assert (=> b!1001982 (= res!671582 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442819 (select (arr!30450 a!3219) j!170) a!3219 mask!3464) lt!442824))))

(declare-fun b!1001983 () Bool)

(assert (=> b!1001983 (= e!564495 e!564493)))

(declare-fun res!671574 () Bool)

(assert (=> b!1001983 (=> (not res!671574) (not e!564493))))

(assert (=> b!1001983 (= res!671574 (not (= lt!442820 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442818 mask!3464) lt!442818 lt!442823 mask!3464))))))

(assert (=> b!1001983 (= lt!442818 (select (store (arr!30450 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1001983 (= lt!442823 (array!63251 (store (arr!30450 a!3219) i!1194 k0!2224) (size!30954 a!3219)))))

(declare-fun b!1001984 () Bool)

(declare-fun res!671584 () Bool)

(assert (=> b!1001984 (=> (not res!671584) (not e!564497))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1001984 (= res!671584 (validKeyInArray!0 (select (arr!30450 a!3219) j!170)))))

(declare-fun b!1001985 () Bool)

(declare-fun res!671583 () Bool)

(assert (=> b!1001985 (=> (not res!671583) (not e!564497))))

(assert (=> b!1001985 (= res!671583 (validKeyInArray!0 k0!2224))))

(declare-fun b!1001986 () Bool)

(assert (=> b!1001986 (= e!564491 false)))

(declare-fun lt!442825 () SeekEntryResult!9407)

(assert (=> b!1001986 (= lt!442825 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442819 lt!442818 lt!442823 mask!3464))))

(assert (= (and start!86502 res!671586) b!1001977))

(assert (= (and b!1001977 res!671588) b!1001984))

(assert (= (and b!1001984 res!671584) b!1001985))

(assert (= (and b!1001985 res!671583) b!1001978))

(assert (= (and b!1001978 res!671580) b!1001975))

(assert (= (and b!1001975 res!671573) b!1001976))

(assert (= (and b!1001976 res!671577) b!1001979))

(assert (= (and b!1001979 res!671585) b!1001981))

(assert (= (and b!1001981 res!671578) b!1001973))

(assert (= (and b!1001973 res!671581) b!1001980))

(assert (= (and b!1001980 res!671579) b!1001983))

(assert (= (and b!1001983 res!671574) b!1001971))

(assert (= (and b!1001971 res!671575) b!1001972))

(assert (= (and b!1001972 res!671587) b!1001974))

(assert (= (and b!1001974 res!671576) b!1001982))

(assert (= (and b!1001982 res!671582) b!1001986))

(declare-fun m!927379 () Bool)

(assert (=> b!1001979 m!927379))

(declare-fun m!927381 () Bool)

(assert (=> b!1001984 m!927381))

(assert (=> b!1001984 m!927381))

(declare-fun m!927383 () Bool)

(assert (=> b!1001984 m!927383))

(declare-fun m!927385 () Bool)

(assert (=> b!1001974 m!927385))

(assert (=> b!1001982 m!927381))

(assert (=> b!1001982 m!927381))

(declare-fun m!927387 () Bool)

(assert (=> b!1001982 m!927387))

(declare-fun m!927389 () Bool)

(assert (=> b!1001978 m!927389))

(assert (=> b!1001973 m!927381))

(assert (=> b!1001973 m!927381))

(declare-fun m!927391 () Bool)

(assert (=> b!1001973 m!927391))

(assert (=> b!1001973 m!927391))

(assert (=> b!1001973 m!927381))

(declare-fun m!927393 () Bool)

(assert (=> b!1001973 m!927393))

(declare-fun m!927395 () Bool)

(assert (=> b!1001983 m!927395))

(assert (=> b!1001983 m!927395))

(declare-fun m!927397 () Bool)

(assert (=> b!1001983 m!927397))

(declare-fun m!927399 () Bool)

(assert (=> b!1001983 m!927399))

(declare-fun m!927401 () Bool)

(assert (=> b!1001983 m!927401))

(declare-fun m!927403 () Bool)

(assert (=> b!1001976 m!927403))

(declare-fun m!927405 () Bool)

(assert (=> start!86502 m!927405))

(declare-fun m!927407 () Bool)

(assert (=> start!86502 m!927407))

(declare-fun m!927409 () Bool)

(assert (=> b!1001971 m!927409))

(assert (=> b!1001980 m!927381))

(assert (=> b!1001980 m!927381))

(declare-fun m!927411 () Bool)

(assert (=> b!1001980 m!927411))

(declare-fun m!927413 () Bool)

(assert (=> b!1001985 m!927413))

(declare-fun m!927415 () Bool)

(assert (=> b!1001975 m!927415))

(declare-fun m!927417 () Bool)

(assert (=> b!1001986 m!927417))

(check-sat (not b!1001984) (not b!1001979) (not b!1001975) (not b!1001974) (not b!1001980) (not b!1001985) (not b!1001976) (not b!1001982) (not b!1001983) (not b!1001973) (not b!1001978) (not b!1001971) (not b!1001986) (not start!86502))
(check-sat)
