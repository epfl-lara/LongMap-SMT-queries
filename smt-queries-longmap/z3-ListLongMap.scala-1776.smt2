; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32342 () Bool)

(assert start!32342)

(declare-fun b!321915 () Bool)

(declare-fun e!199293 () Bool)

(assert (=> b!321915 (= e!199293 false)))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun lt!156166 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321915 (= lt!156166 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!321916 () Bool)

(declare-fun res!176041 () Bool)

(declare-fun e!199294 () Bool)

(assert (=> b!321916 (=> (not res!176041) (not e!199294))))

(declare-datatypes ((array!16485 0))(
  ( (array!16486 (arr!7800 (Array (_ BitVec 32) (_ BitVec 64))) (size!8153 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16485)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2930 0))(
  ( (MissingZero!2930 (index!13896 (_ BitVec 32))) (Found!2930 (index!13897 (_ BitVec 32))) (Intermediate!2930 (undefined!3742 Bool) (index!13898 (_ BitVec 32)) (x!32177 (_ BitVec 32))) (Undefined!2930) (MissingVacant!2930 (index!13899 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16485 (_ BitVec 32)) SeekEntryResult!2930)

(assert (=> b!321916 (= res!176041 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2930 i!1250)))))

(declare-fun b!321917 () Bool)

(declare-fun res!176048 () Bool)

(assert (=> b!321917 (=> (not res!176048) (not e!199293))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!321917 (= res!176048 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7800 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7800 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7800 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!321918 () Bool)

(declare-fun res!176040 () Bool)

(assert (=> b!321918 (=> (not res!176040) (not e!199294))))

(assert (=> b!321918 (= res!176040 (and (= (size!8153 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8153 a!3305))))))

(declare-fun b!321919 () Bool)

(declare-fun res!176044 () Bool)

(assert (=> b!321919 (=> (not res!176044) (not e!199293))))

(assert (=> b!321919 (= res!176044 (and (= (select (arr!7800 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8153 a!3305))))))

(declare-fun b!321920 () Bool)

(declare-fun res!176042 () Bool)

(assert (=> b!321920 (=> (not res!176042) (not e!199294))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321920 (= res!176042 (validKeyInArray!0 k0!2497))))

(declare-fun b!321922 () Bool)

(declare-fun res!176046 () Bool)

(assert (=> b!321922 (=> (not res!176046) (not e!199294))))

(declare-fun arrayContainsKey!0 (array!16485 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321922 (= res!176046 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!321923 () Bool)

(declare-fun res!176043 () Bool)

(assert (=> b!321923 (=> (not res!176043) (not e!199293))))

(declare-fun lt!156167 () SeekEntryResult!2930)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16485 (_ BitVec 32)) SeekEntryResult!2930)

(assert (=> b!321923 (= res!176043 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156167))))

(declare-fun b!321924 () Bool)

(declare-fun res!176049 () Bool)

(assert (=> b!321924 (=> (not res!176049) (not e!199294))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16485 (_ BitVec 32)) Bool)

(assert (=> b!321924 (= res!176049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!176045 () Bool)

(assert (=> start!32342 (=> (not res!176045) (not e!199294))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32342 (= res!176045 (validMask!0 mask!3777))))

(assert (=> start!32342 e!199294))

(declare-fun array_inv!5772 (array!16485) Bool)

(assert (=> start!32342 (array_inv!5772 a!3305)))

(assert (=> start!32342 true))

(declare-fun b!321921 () Bool)

(assert (=> b!321921 (= e!199294 e!199293)))

(declare-fun res!176047 () Bool)

(assert (=> b!321921 (=> (not res!176047) (not e!199293))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321921 (= res!176047 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156167))))

(assert (=> b!321921 (= lt!156167 (Intermediate!2930 false resIndex!58 resX!58))))

(assert (= (and start!32342 res!176045) b!321918))

(assert (= (and b!321918 res!176040) b!321920))

(assert (= (and b!321920 res!176042) b!321922))

(assert (= (and b!321922 res!176046) b!321916))

(assert (= (and b!321916 res!176041) b!321924))

(assert (= (and b!321924 res!176049) b!321921))

(assert (= (and b!321921 res!176047) b!321919))

(assert (= (and b!321919 res!176044) b!321923))

(assert (= (and b!321923 res!176043) b!321917))

(assert (= (and b!321917 res!176048) b!321915))

(declare-fun m!329395 () Bool)

(assert (=> b!321916 m!329395))

(declare-fun m!329397 () Bool)

(assert (=> b!321922 m!329397))

(declare-fun m!329399 () Bool)

(assert (=> b!321920 m!329399))

(declare-fun m!329401 () Bool)

(assert (=> b!321923 m!329401))

(declare-fun m!329403 () Bool)

(assert (=> b!321919 m!329403))

(declare-fun m!329405 () Bool)

(assert (=> b!321924 m!329405))

(declare-fun m!329407 () Bool)

(assert (=> start!32342 m!329407))

(declare-fun m!329409 () Bool)

(assert (=> start!32342 m!329409))

(declare-fun m!329411 () Bool)

(assert (=> b!321921 m!329411))

(assert (=> b!321921 m!329411))

(declare-fun m!329413 () Bool)

(assert (=> b!321921 m!329413))

(declare-fun m!329415 () Bool)

(assert (=> b!321917 m!329415))

(declare-fun m!329417 () Bool)

(assert (=> b!321915 m!329417))

(check-sat (not b!321920) (not b!321924) (not start!32342) (not b!321921) (not b!321922) (not b!321923) (not b!321916) (not b!321915))
(check-sat)
