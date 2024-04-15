; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44754 () Bool)

(assert start!44754)

(declare-fun res!294250 () Bool)

(declare-fun e!288584 () Bool)

(assert (=> start!44754 (=> (not res!294250) (not e!288584))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44754 (= res!294250 (validMask!0 mask!3524))))

(assert (=> start!44754 e!288584))

(assert (=> start!44754 true))

(declare-datatypes ((array!31823 0))(
  ( (array!31824 (arr!15299 (Array (_ BitVec 32) (_ BitVec 64))) (size!15664 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31823)

(declare-fun array_inv!11182 (array!31823) Bool)

(assert (=> start!44754 (array_inv!11182 a!3235)))

(declare-fun b!491171 () Bool)

(declare-fun res!294254 () Bool)

(assert (=> b!491171 (=> (not res!294254) (not e!288584))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31823 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491171 (= res!294254 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!491172 () Bool)

(declare-fun res!294256 () Bool)

(assert (=> b!491172 (=> (not res!294256) (not e!288584))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491172 (= res!294256 (validKeyInArray!0 k0!2280))))

(declare-fun b!491173 () Bool)

(declare-fun res!294255 () Bool)

(declare-fun e!288585 () Bool)

(assert (=> b!491173 (=> (not res!294255) (not e!288585))))

(declare-datatypes ((List!9496 0))(
  ( (Nil!9493) (Cons!9492 (h!10354 (_ BitVec 64)) (t!15715 List!9496)) )
))
(declare-fun arrayNoDuplicates!0 (array!31823 (_ BitVec 32) List!9496) Bool)

(assert (=> b!491173 (= res!294255 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9493))))

(declare-fun b!491174 () Bool)

(declare-fun e!288583 () Bool)

(assert (=> b!491174 (= e!288583 true)))

(declare-datatypes ((SeekEntryResult!3763 0))(
  ( (MissingZero!3763 (index!17231 (_ BitVec 32))) (Found!3763 (index!17232 (_ BitVec 32))) (Intermediate!3763 (undefined!4575 Bool) (index!17233 (_ BitVec 32)) (x!46328 (_ BitVec 32))) (Undefined!3763) (MissingVacant!3763 (index!17234 (_ BitVec 32))) )
))
(declare-fun lt!221925 () SeekEntryResult!3763)

(declare-fun lt!221922 () (_ BitVec 64))

(declare-fun lt!221926 () array!31823)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31823 (_ BitVec 32)) SeekEntryResult!3763)

(assert (=> b!491174 (= lt!221925 (seekEntryOrOpen!0 lt!221922 lt!221926 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((Unit!14458 0))(
  ( (Unit!14459) )
))
(declare-fun lt!221921 () Unit!14458)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31823 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14458)

(assert (=> b!491174 (= lt!221921 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!491175 () Bool)

(assert (=> b!491175 (= e!288585 (not e!288583))))

(declare-fun res!294253 () Bool)

(assert (=> b!491175 (=> res!294253 e!288583)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31823 (_ BitVec 32)) SeekEntryResult!3763)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491175 (= res!294253 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15299 a!3235) j!176) mask!3524) (select (arr!15299 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221922 mask!3524) lt!221922 lt!221926 mask!3524))))))

(assert (=> b!491175 (= lt!221922 (select (store (arr!15299 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!491175 (= lt!221926 (array!31824 (store (arr!15299 a!3235) i!1204 k0!2280) (size!15664 a!3235)))))

(assert (=> b!491175 (= lt!221925 (Found!3763 j!176))))

(assert (=> b!491175 (= lt!221925 (seekEntryOrOpen!0 (select (arr!15299 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31823 (_ BitVec 32)) Bool)

(assert (=> b!491175 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!221923 () Unit!14458)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31823 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14458)

(assert (=> b!491175 (= lt!221923 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!491176 () Bool)

(declare-fun res!294252 () Bool)

(assert (=> b!491176 (=> (not res!294252) (not e!288584))))

(assert (=> b!491176 (= res!294252 (and (= (size!15664 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15664 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15664 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491177 () Bool)

(declare-fun res!294257 () Bool)

(assert (=> b!491177 (=> (not res!294257) (not e!288585))))

(assert (=> b!491177 (= res!294257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491178 () Bool)

(declare-fun res!294249 () Bool)

(assert (=> b!491178 (=> (not res!294249) (not e!288584))))

(assert (=> b!491178 (= res!294249 (validKeyInArray!0 (select (arr!15299 a!3235) j!176)))))

(declare-fun b!491179 () Bool)

(assert (=> b!491179 (= e!288584 e!288585)))

(declare-fun res!294251 () Bool)

(assert (=> b!491179 (=> (not res!294251) (not e!288585))))

(declare-fun lt!221924 () SeekEntryResult!3763)

(assert (=> b!491179 (= res!294251 (or (= lt!221924 (MissingZero!3763 i!1204)) (= lt!221924 (MissingVacant!3763 i!1204))))))

(assert (=> b!491179 (= lt!221924 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!44754 res!294250) b!491176))

(assert (= (and b!491176 res!294252) b!491178))

(assert (= (and b!491178 res!294249) b!491172))

(assert (= (and b!491172 res!294256) b!491171))

(assert (= (and b!491171 res!294254) b!491179))

(assert (= (and b!491179 res!294251) b!491177))

(assert (= (and b!491177 res!294257) b!491173))

(assert (= (and b!491173 res!294255) b!491175))

(assert (= (and b!491175 (not res!294253)) b!491174))

(declare-fun m!471271 () Bool)

(assert (=> b!491173 m!471271))

(declare-fun m!471273 () Bool)

(assert (=> start!44754 m!471273))

(declare-fun m!471275 () Bool)

(assert (=> start!44754 m!471275))

(declare-fun m!471277 () Bool)

(assert (=> b!491175 m!471277))

(declare-fun m!471279 () Bool)

(assert (=> b!491175 m!471279))

(declare-fun m!471281 () Bool)

(assert (=> b!491175 m!471281))

(declare-fun m!471283 () Bool)

(assert (=> b!491175 m!471283))

(declare-fun m!471285 () Bool)

(assert (=> b!491175 m!471285))

(declare-fun m!471287 () Bool)

(assert (=> b!491175 m!471287))

(declare-fun m!471289 () Bool)

(assert (=> b!491175 m!471289))

(declare-fun m!471291 () Bool)

(assert (=> b!491175 m!471291))

(assert (=> b!491175 m!471279))

(assert (=> b!491175 m!471289))

(assert (=> b!491175 m!471287))

(assert (=> b!491175 m!471289))

(declare-fun m!471293 () Bool)

(assert (=> b!491175 m!471293))

(assert (=> b!491175 m!471289))

(declare-fun m!471295 () Bool)

(assert (=> b!491175 m!471295))

(declare-fun m!471297 () Bool)

(assert (=> b!491179 m!471297))

(declare-fun m!471299 () Bool)

(assert (=> b!491172 m!471299))

(declare-fun m!471301 () Bool)

(assert (=> b!491174 m!471301))

(declare-fun m!471303 () Bool)

(assert (=> b!491174 m!471303))

(declare-fun m!471305 () Bool)

(assert (=> b!491177 m!471305))

(assert (=> b!491178 m!471289))

(assert (=> b!491178 m!471289))

(declare-fun m!471307 () Bool)

(assert (=> b!491178 m!471307))

(declare-fun m!471309 () Bool)

(assert (=> b!491171 m!471309))

(check-sat (not b!491177) (not b!491178) (not b!491173) (not b!491171) (not b!491172) (not start!44754) (not b!491175) (not b!491179) (not b!491174))
(check-sat)
