; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44270 () Bool)

(assert start!44270)

(declare-fun b!486874 () Bool)

(declare-fun res!290320 () Bool)

(declare-fun e!286547 () Bool)

(assert (=> b!486874 (=> (not res!290320) (not e!286547))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31522 0))(
  ( (array!31523 (arr!15154 (Array (_ BitVec 32) (_ BitVec 64))) (size!15518 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31522)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!486874 (= res!290320 (and (= (size!15518 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15518 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15518 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!486875 () Bool)

(declare-fun res!290318 () Bool)

(assert (=> b!486875 (=> (not res!290318) (not e!286547))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486875 (= res!290318 (validKeyInArray!0 k0!2280))))

(declare-fun b!486877 () Bool)

(declare-fun e!286548 () Bool)

(assert (=> b!486877 (= e!286548 false)))

(declare-fun lt!219909 () Bool)

(declare-datatypes ((List!9219 0))(
  ( (Nil!9216) (Cons!9215 (h!10071 (_ BitVec 64)) (t!15439 List!9219)) )
))
(declare-fun arrayNoDuplicates!0 (array!31522 (_ BitVec 32) List!9219) Bool)

(assert (=> b!486877 (= lt!219909 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9216))))

(declare-fun b!486878 () Bool)

(assert (=> b!486878 (= e!286547 e!286548)))

(declare-fun res!290316 () Bool)

(assert (=> b!486878 (=> (not res!290316) (not e!286548))))

(declare-datatypes ((SeekEntryResult!3577 0))(
  ( (MissingZero!3577 (index!16487 (_ BitVec 32))) (Found!3577 (index!16488 (_ BitVec 32))) (Intermediate!3577 (undefined!4389 Bool) (index!16489 (_ BitVec 32)) (x!45762 (_ BitVec 32))) (Undefined!3577) (MissingVacant!3577 (index!16490 (_ BitVec 32))) )
))
(declare-fun lt!219910 () SeekEntryResult!3577)

(assert (=> b!486878 (= res!290316 (or (= lt!219910 (MissingZero!3577 i!1204)) (= lt!219910 (MissingVacant!3577 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31522 (_ BitVec 32)) SeekEntryResult!3577)

(assert (=> b!486878 (= lt!219910 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!486879 () Bool)

(declare-fun res!290319 () Bool)

(assert (=> b!486879 (=> (not res!290319) (not e!286547))))

(declare-fun arrayContainsKey!0 (array!31522 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486879 (= res!290319 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!486880 () Bool)

(declare-fun res!290317 () Bool)

(assert (=> b!486880 (=> (not res!290317) (not e!286548))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31522 (_ BitVec 32)) Bool)

(assert (=> b!486880 (= res!290317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!290314 () Bool)

(assert (=> start!44270 (=> (not res!290314) (not e!286547))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44270 (= res!290314 (validMask!0 mask!3524))))

(assert (=> start!44270 e!286547))

(assert (=> start!44270 true))

(declare-fun array_inv!11013 (array!31522) Bool)

(assert (=> start!44270 (array_inv!11013 a!3235)))

(declare-fun b!486876 () Bool)

(declare-fun res!290315 () Bool)

(assert (=> b!486876 (=> (not res!290315) (not e!286547))))

(assert (=> b!486876 (= res!290315 (validKeyInArray!0 (select (arr!15154 a!3235) j!176)))))

(assert (= (and start!44270 res!290314) b!486874))

(assert (= (and b!486874 res!290320) b!486876))

(assert (= (and b!486876 res!290315) b!486875))

(assert (= (and b!486875 res!290318) b!486879))

(assert (= (and b!486879 res!290319) b!486878))

(assert (= (and b!486878 res!290316) b!486880))

(assert (= (and b!486880 res!290317) b!486877))

(declare-fun m!466987 () Bool)

(assert (=> b!486879 m!466987))

(declare-fun m!466989 () Bool)

(assert (=> b!486877 m!466989))

(declare-fun m!466991 () Bool)

(assert (=> b!486878 m!466991))

(declare-fun m!466993 () Bool)

(assert (=> start!44270 m!466993))

(declare-fun m!466995 () Bool)

(assert (=> start!44270 m!466995))

(declare-fun m!466997 () Bool)

(assert (=> b!486876 m!466997))

(assert (=> b!486876 m!466997))

(declare-fun m!466999 () Bool)

(assert (=> b!486876 m!466999))

(declare-fun m!467001 () Bool)

(assert (=> b!486880 m!467001))

(declare-fun m!467003 () Bool)

(assert (=> b!486875 m!467003))

(check-sat (not start!44270) (not b!486875) (not b!486877) (not b!486876) (not b!486879) (not b!486880) (not b!486878))
(check-sat)
