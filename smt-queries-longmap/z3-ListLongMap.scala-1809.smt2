; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32664 () Bool)

(assert start!32664)

(declare-fun b!326261 () Bool)

(declare-fun res!179293 () Bool)

(declare-fun e!200973 () Bool)

(assert (=> b!326261 (=> (not res!179293) (not e!200973))))

(declare-datatypes ((array!16701 0))(
  ( (array!16702 (arr!7905 (Array (_ BitVec 32) (_ BitVec 64))) (size!8257 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16701)

(declare-datatypes ((SeekEntryResult!3036 0))(
  ( (MissingZero!3036 (index!14320 (_ BitVec 32))) (Found!3036 (index!14321 (_ BitVec 32))) (Intermediate!3036 (undefined!3848 Bool) (index!14322 (_ BitVec 32)) (x!32570 (_ BitVec 32))) (Undefined!3036) (MissingVacant!3036 (index!14323 (_ BitVec 32))) )
))
(declare-fun lt!157289 () SeekEntryResult!3036)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16701 (_ BitVec 32)) SeekEntryResult!3036)

(assert (=> b!326261 (= res!179293 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157289))))

(declare-fun b!326262 () Bool)

(declare-fun res!179295 () Bool)

(assert (=> b!326262 (=> (not res!179295) (not e!200973))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!326262 (= res!179295 (and (= (select (arr!7905 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8257 a!3305))))))

(declare-fun b!326263 () Bool)

(declare-fun res!179294 () Bool)

(declare-fun e!200972 () Bool)

(assert (=> b!326263 (=> (not res!179294) (not e!200972))))

(assert (=> b!326263 (= res!179294 (and (= (size!8257 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8257 a!3305))))))

(declare-fun b!326264 () Bool)

(assert (=> b!326264 (= e!200972 e!200973)))

(declare-fun res!179299 () Bool)

(assert (=> b!326264 (=> (not res!179299) (not e!200973))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326264 (= res!179299 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157289))))

(assert (=> b!326264 (= lt!157289 (Intermediate!3036 false resIndex!58 resX!58))))

(declare-fun b!326265 () Bool)

(assert (=> b!326265 (= e!200973 (bvslt mask!3777 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10106 0))(
  ( (Unit!10107) )
))
(declare-fun lt!157290 () Unit!10106)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16701 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10106)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326265 (= lt!157290 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!326266 () Bool)

(declare-fun res!179300 () Bool)

(assert (=> b!326266 (=> (not res!179300) (not e!200972))))

(declare-fun arrayContainsKey!0 (array!16701 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326266 (= res!179300 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun res!179296 () Bool)

(assert (=> start!32664 (=> (not res!179296) (not e!200972))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32664 (= res!179296 (validMask!0 mask!3777))))

(assert (=> start!32664 e!200972))

(declare-fun array_inv!5868 (array!16701) Bool)

(assert (=> start!32664 (array_inv!5868 a!3305)))

(assert (=> start!32664 true))

(declare-fun b!326267 () Bool)

(declare-fun res!179301 () Bool)

(assert (=> b!326267 (=> (not res!179301) (not e!200973))))

(assert (=> b!326267 (= res!179301 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7905 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!326268 () Bool)

(declare-fun res!179292 () Bool)

(assert (=> b!326268 (=> (not res!179292) (not e!200972))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16701 (_ BitVec 32)) Bool)

(assert (=> b!326268 (= res!179292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!326269 () Bool)

(declare-fun res!179298 () Bool)

(assert (=> b!326269 (=> (not res!179298) (not e!200972))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326269 (= res!179298 (validKeyInArray!0 k0!2497))))

(declare-fun b!326270 () Bool)

(declare-fun res!179297 () Bool)

(assert (=> b!326270 (=> (not res!179297) (not e!200972))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16701 (_ BitVec 32)) SeekEntryResult!3036)

(assert (=> b!326270 (= res!179297 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3036 i!1250)))))

(assert (= (and start!32664 res!179296) b!326263))

(assert (= (and b!326263 res!179294) b!326269))

(assert (= (and b!326269 res!179298) b!326266))

(assert (= (and b!326266 res!179300) b!326270))

(assert (= (and b!326270 res!179297) b!326268))

(assert (= (and b!326268 res!179292) b!326264))

(assert (= (and b!326264 res!179299) b!326262))

(assert (= (and b!326262 res!179295) b!326261))

(assert (= (and b!326261 res!179293) b!326267))

(assert (= (and b!326267 res!179301) b!326265))

(declare-fun m!332833 () Bool)

(assert (=> b!326269 m!332833))

(declare-fun m!332835 () Bool)

(assert (=> b!326266 m!332835))

(declare-fun m!332837 () Bool)

(assert (=> b!326270 m!332837))

(declare-fun m!332839 () Bool)

(assert (=> b!326268 m!332839))

(declare-fun m!332841 () Bool)

(assert (=> start!32664 m!332841))

(declare-fun m!332843 () Bool)

(assert (=> start!32664 m!332843))

(declare-fun m!332845 () Bool)

(assert (=> b!326265 m!332845))

(assert (=> b!326265 m!332845))

(declare-fun m!332847 () Bool)

(assert (=> b!326265 m!332847))

(declare-fun m!332849 () Bool)

(assert (=> b!326264 m!332849))

(assert (=> b!326264 m!332849))

(declare-fun m!332851 () Bool)

(assert (=> b!326264 m!332851))

(declare-fun m!332853 () Bool)

(assert (=> b!326261 m!332853))

(declare-fun m!332855 () Bool)

(assert (=> b!326262 m!332855))

(declare-fun m!332857 () Bool)

(assert (=> b!326267 m!332857))

(check-sat (not b!326266) (not start!32664) (not b!326269) (not b!326261) (not b!326264) (not b!326270) (not b!326265) (not b!326268))
(check-sat)
