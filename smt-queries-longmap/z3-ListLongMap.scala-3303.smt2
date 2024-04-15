; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45750 () Bool)

(assert start!45750)

(declare-fun b!506085 () Bool)

(declare-fun res!307193 () Bool)

(declare-fun e!296198 () Bool)

(assert (=> b!506085 (=> (not res!307193) (not e!296198))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506085 (= res!307193 (validKeyInArray!0 k0!2280))))

(declare-fun b!506086 () Bool)

(declare-fun res!307189 () Bool)

(assert (=> b!506086 (=> (not res!307189) (not e!296198))))

(declare-datatypes ((array!32516 0))(
  ( (array!32517 (arr!15638 (Array (_ BitVec 32) (_ BitVec 64))) (size!16003 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32516)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!506086 (= res!307189 (validKeyInArray!0 (select (arr!15638 a!3235) j!176)))))

(declare-fun b!506087 () Bool)

(declare-fun e!296197 () Bool)

(declare-fun e!296200 () Bool)

(assert (=> b!506087 (= e!296197 (not e!296200))))

(declare-fun res!307186 () Bool)

(assert (=> b!506087 (=> res!307186 e!296200)))

(declare-datatypes ((SeekEntryResult!4102 0))(
  ( (MissingZero!4102 (index!18596 (_ BitVec 32))) (Found!4102 (index!18597 (_ BitVec 32))) (Intermediate!4102 (undefined!4914 Bool) (index!18598 (_ BitVec 32)) (x!47610 (_ BitVec 32))) (Undefined!4102) (MissingVacant!4102 (index!18599 (_ BitVec 32))) )
))
(declare-fun lt!230817 () SeekEntryResult!4102)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!230813 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32516 (_ BitVec 32)) SeekEntryResult!4102)

(assert (=> b!506087 (= res!307186 (= lt!230817 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230813 (select (store (arr!15638 a!3235) i!1204 k0!2280) j!176) (array!32517 (store (arr!15638 a!3235) i!1204 k0!2280) (size!16003 a!3235)) mask!3524)))))

(declare-fun lt!230818 () (_ BitVec 32))

(assert (=> b!506087 (= lt!230817 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230818 (select (arr!15638 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506087 (= lt!230813 (toIndex!0 (select (store (arr!15638 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!506087 (= lt!230818 (toIndex!0 (select (arr!15638 a!3235) j!176) mask!3524))))

(declare-fun e!296202 () Bool)

(assert (=> b!506087 e!296202))

(declare-fun res!307195 () Bool)

(assert (=> b!506087 (=> (not res!307195) (not e!296202))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32516 (_ BitVec 32)) Bool)

(assert (=> b!506087 (= res!307195 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15478 0))(
  ( (Unit!15479) )
))
(declare-fun lt!230814 () Unit!15478)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32516 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15478)

(assert (=> b!506087 (= lt!230814 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!506088 () Bool)

(declare-fun res!307194 () Bool)

(assert (=> b!506088 (=> (not res!307194) (not e!296197))))

(assert (=> b!506088 (= res!307194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!506089 () Bool)

(declare-fun e!296199 () Bool)

(assert (=> b!506089 (= e!296200 e!296199)))

(declare-fun res!307188 () Bool)

(assert (=> b!506089 (=> res!307188 e!296199)))

(declare-fun lt!230815 () Bool)

(assert (=> b!506089 (= res!307188 (or (and (not lt!230815) (undefined!4914 lt!230817)) (and (not lt!230815) (not (undefined!4914 lt!230817)))))))

(get-info :version)

(assert (=> b!506089 (= lt!230815 (not ((_ is Intermediate!4102) lt!230817)))))

(declare-fun b!506090 () Bool)

(assert (=> b!506090 (= e!296199 true)))

(assert (=> b!506090 false))

(declare-fun b!506091 () Bool)

(assert (=> b!506091 (= e!296198 e!296197)))

(declare-fun res!307196 () Bool)

(assert (=> b!506091 (=> (not res!307196) (not e!296197))))

(declare-fun lt!230816 () SeekEntryResult!4102)

(assert (=> b!506091 (= res!307196 (or (= lt!230816 (MissingZero!4102 i!1204)) (= lt!230816 (MissingVacant!4102 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32516 (_ BitVec 32)) SeekEntryResult!4102)

(assert (=> b!506091 (= lt!230816 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!506092 () Bool)

(declare-fun res!307187 () Bool)

(assert (=> b!506092 (=> (not res!307187) (not e!296197))))

(declare-datatypes ((List!9835 0))(
  ( (Nil!9832) (Cons!9831 (h!10708 (_ BitVec 64)) (t!16054 List!9835)) )
))
(declare-fun arrayNoDuplicates!0 (array!32516 (_ BitVec 32) List!9835) Bool)

(assert (=> b!506092 (= res!307187 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9832))))

(declare-fun b!506094 () Bool)

(declare-fun res!307190 () Bool)

(assert (=> b!506094 (=> (not res!307190) (not e!296198))))

(declare-fun arrayContainsKey!0 (array!32516 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506094 (= res!307190 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!506095 () Bool)

(declare-fun res!307191 () Bool)

(assert (=> b!506095 (=> (not res!307191) (not e!296198))))

(assert (=> b!506095 (= res!307191 (and (= (size!16003 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16003 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16003 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!307192 () Bool)

(assert (=> start!45750 (=> (not res!307192) (not e!296198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45750 (= res!307192 (validMask!0 mask!3524))))

(assert (=> start!45750 e!296198))

(assert (=> start!45750 true))

(declare-fun array_inv!11521 (array!32516) Bool)

(assert (=> start!45750 (array_inv!11521 a!3235)))

(declare-fun b!506093 () Bool)

(assert (=> b!506093 (= e!296202 (= (seekEntryOrOpen!0 (select (arr!15638 a!3235) j!176) a!3235 mask!3524) (Found!4102 j!176)))))

(assert (= (and start!45750 res!307192) b!506095))

(assert (= (and b!506095 res!307191) b!506086))

(assert (= (and b!506086 res!307189) b!506085))

(assert (= (and b!506085 res!307193) b!506094))

(assert (= (and b!506094 res!307190) b!506091))

(assert (= (and b!506091 res!307196) b!506088))

(assert (= (and b!506088 res!307194) b!506092))

(assert (= (and b!506092 res!307187) b!506087))

(assert (= (and b!506087 res!307195) b!506093))

(assert (= (and b!506087 (not res!307186)) b!506089))

(assert (= (and b!506089 (not res!307188)) b!506090))

(declare-fun m!486259 () Bool)

(assert (=> b!506093 m!486259))

(assert (=> b!506093 m!486259))

(declare-fun m!486261 () Bool)

(assert (=> b!506093 m!486261))

(declare-fun m!486263 () Bool)

(assert (=> b!506088 m!486263))

(declare-fun m!486265 () Bool)

(assert (=> start!45750 m!486265))

(declare-fun m!486267 () Bool)

(assert (=> start!45750 m!486267))

(declare-fun m!486269 () Bool)

(assert (=> b!506087 m!486269))

(declare-fun m!486271 () Bool)

(assert (=> b!506087 m!486271))

(declare-fun m!486273 () Bool)

(assert (=> b!506087 m!486273))

(assert (=> b!506087 m!486259))

(declare-fun m!486275 () Bool)

(assert (=> b!506087 m!486275))

(assert (=> b!506087 m!486259))

(declare-fun m!486277 () Bool)

(assert (=> b!506087 m!486277))

(assert (=> b!506087 m!486259))

(declare-fun m!486279 () Bool)

(assert (=> b!506087 m!486279))

(assert (=> b!506087 m!486273))

(declare-fun m!486281 () Bool)

(assert (=> b!506087 m!486281))

(assert (=> b!506087 m!486273))

(declare-fun m!486283 () Bool)

(assert (=> b!506087 m!486283))

(declare-fun m!486285 () Bool)

(assert (=> b!506092 m!486285))

(declare-fun m!486287 () Bool)

(assert (=> b!506091 m!486287))

(declare-fun m!486289 () Bool)

(assert (=> b!506094 m!486289))

(declare-fun m!486291 () Bool)

(assert (=> b!506085 m!486291))

(assert (=> b!506086 m!486259))

(assert (=> b!506086 m!486259))

(declare-fun m!486293 () Bool)

(assert (=> b!506086 m!486293))

(check-sat (not start!45750) (not b!506088) (not b!506092) (not b!506087) (not b!506086) (not b!506093) (not b!506091) (not b!506085) (not b!506094))
(check-sat)
