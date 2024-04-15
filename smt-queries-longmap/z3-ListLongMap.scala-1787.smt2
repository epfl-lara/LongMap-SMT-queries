; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32408 () Bool)

(assert start!32408)

(declare-fun b!323457 () Bool)

(assert (=> b!323457 false))

(declare-datatypes ((Unit!10010 0))(
  ( (Unit!10011) )
))
(declare-fun e!199870 () Unit!10010)

(declare-fun Unit!10012 () Unit!10010)

(assert (=> b!323457 (= e!199870 Unit!10012)))

(declare-datatypes ((array!16551 0))(
  ( (array!16552 (arr!7833 (Array (_ BitVec 32) (_ BitVec 64))) (size!8186 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16551)

(declare-fun b!323458 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun e!199868 () Bool)

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!323458 (= e!199868 (not (or (not (= (select (arr!7833 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3777 #b00000000000000000000000000000000) (bvsge index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsle x!1490 #b01111111111111111111111111111110))))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!323458 (= index!1840 resIndex!58)))

(declare-fun lt!156458 () Unit!10010)

(declare-fun e!199866 () Unit!10010)

(assert (=> b!323458 (= lt!156458 e!199866)))

(declare-fun c!50843 () Bool)

(assert (=> b!323458 (= c!50843 (not (= resIndex!58 index!1840)))))

(declare-fun b!323459 () Bool)

(declare-fun res!177038 () Bool)

(declare-fun e!199871 () Bool)

(assert (=> b!323459 (=> (not res!177038) (not e!199871))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16551 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!323459 (= res!177038 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!323460 () Bool)

(assert (=> b!323460 (= e!199866 e!199870)))

(declare-fun c!50841 () Bool)

(assert (=> b!323460 (= c!50841 (or (= (select (arr!7833 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7833 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!323461 () Bool)

(declare-fun res!177036 () Bool)

(assert (=> b!323461 (=> (not res!177036) (not e!199871))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16551 (_ BitVec 32)) Bool)

(assert (=> b!323461 (= res!177036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!323462 () Bool)

(declare-fun e!199867 () Unit!10010)

(declare-fun Unit!10013 () Unit!10010)

(assert (=> b!323462 (= e!199867 Unit!10013)))

(assert (=> b!323462 false))

(declare-fun b!323463 () Bool)

(declare-fun res!177030 () Bool)

(assert (=> b!323463 (=> (not res!177030) (not e!199871))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2963 0))(
  ( (MissingZero!2963 (index!14028 (_ BitVec 32))) (Found!2963 (index!14029 (_ BitVec 32))) (Intermediate!2963 (undefined!3775 Bool) (index!14030 (_ BitVec 32)) (x!32298 (_ BitVec 32))) (Undefined!2963) (MissingVacant!2963 (index!14031 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16551 (_ BitVec 32)) SeekEntryResult!2963)

(assert (=> b!323463 (= res!177030 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2963 i!1250)))))

(declare-fun b!323464 () Bool)

(declare-fun res!177032 () Bool)

(assert (=> b!323464 (=> (not res!177032) (not e!199868))))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!323464 (= res!177032 (and (= (select (arr!7833 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8186 a!3305))))))

(declare-fun res!177039 () Bool)

(assert (=> start!32408 (=> (not res!177039) (not e!199871))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32408 (= res!177039 (validMask!0 mask!3777))))

(assert (=> start!32408 e!199871))

(declare-fun array_inv!5805 (array!16551) Bool)

(assert (=> start!32408 (array_inv!5805 a!3305)))

(assert (=> start!32408 true))

(declare-fun b!323465 () Bool)

(declare-fun Unit!10014 () Unit!10010)

(assert (=> b!323465 (= e!199866 Unit!10014)))

(declare-fun b!323466 () Bool)

(declare-fun Unit!10015 () Unit!10010)

(assert (=> b!323466 (= e!199867 Unit!10015)))

(declare-fun b!323467 () Bool)

(declare-fun res!177035 () Bool)

(assert (=> b!323467 (=> (not res!177035) (not e!199871))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!323467 (= res!177035 (validKeyInArray!0 k0!2497))))

(declare-fun b!323468 () Bool)

(assert (=> b!323468 false))

(declare-fun lt!156457 () Unit!10010)

(assert (=> b!323468 (= lt!156457 e!199867)))

(declare-fun c!50842 () Bool)

(get-info :version)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16551 (_ BitVec 32)) SeekEntryResult!2963)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323468 (= c!50842 ((_ is Intermediate!2963) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun Unit!10016 () Unit!10010)

(assert (=> b!323468 (= e!199870 Unit!10016)))

(declare-fun b!323469 () Bool)

(declare-fun res!177031 () Bool)

(assert (=> b!323469 (=> (not res!177031) (not e!199868))))

(declare-fun lt!156456 () SeekEntryResult!2963)

(assert (=> b!323469 (= res!177031 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156456))))

(declare-fun b!323470 () Bool)

(assert (=> b!323470 (= e!199871 e!199868)))

(declare-fun res!177034 () Bool)

(assert (=> b!323470 (=> (not res!177034) (not e!199868))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323470 (= res!177034 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156456))))

(assert (=> b!323470 (= lt!156456 (Intermediate!2963 false resIndex!58 resX!58))))

(declare-fun b!323471 () Bool)

(declare-fun res!177037 () Bool)

(assert (=> b!323471 (=> (not res!177037) (not e!199871))))

(assert (=> b!323471 (= res!177037 (and (= (size!8186 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8186 a!3305))))))

(declare-fun b!323472 () Bool)

(declare-fun res!177033 () Bool)

(assert (=> b!323472 (=> (not res!177033) (not e!199868))))

(assert (=> b!323472 (= res!177033 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7833 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(assert (= (and start!32408 res!177039) b!323471))

(assert (= (and b!323471 res!177037) b!323467))

(assert (= (and b!323467 res!177035) b!323459))

(assert (= (and b!323459 res!177038) b!323463))

(assert (= (and b!323463 res!177030) b!323461))

(assert (= (and b!323461 res!177036) b!323470))

(assert (= (and b!323470 res!177034) b!323464))

(assert (= (and b!323464 res!177032) b!323469))

(assert (= (and b!323469 res!177031) b!323472))

(assert (= (and b!323472 res!177033) b!323458))

(assert (= (and b!323458 c!50843) b!323460))

(assert (= (and b!323458 (not c!50843)) b!323465))

(assert (= (and b!323460 c!50841) b!323457))

(assert (= (and b!323460 (not c!50841)) b!323468))

(assert (= (and b!323468 c!50842) b!323466))

(assert (= (and b!323468 (not c!50842)) b!323462))

(declare-fun m!330247 () Bool)

(assert (=> b!323458 m!330247))

(declare-fun m!330249 () Bool)

(assert (=> start!32408 m!330249))

(declare-fun m!330251 () Bool)

(assert (=> start!32408 m!330251))

(declare-fun m!330253 () Bool)

(assert (=> b!323467 m!330253))

(declare-fun m!330255 () Bool)

(assert (=> b!323464 m!330255))

(declare-fun m!330257 () Bool)

(assert (=> b!323469 m!330257))

(declare-fun m!330259 () Bool)

(assert (=> b!323468 m!330259))

(assert (=> b!323468 m!330259))

(declare-fun m!330261 () Bool)

(assert (=> b!323468 m!330261))

(declare-fun m!330263 () Bool)

(assert (=> b!323470 m!330263))

(assert (=> b!323470 m!330263))

(declare-fun m!330265 () Bool)

(assert (=> b!323470 m!330265))

(declare-fun m!330267 () Bool)

(assert (=> b!323459 m!330267))

(declare-fun m!330269 () Bool)

(assert (=> b!323461 m!330269))

(assert (=> b!323460 m!330247))

(declare-fun m!330271 () Bool)

(assert (=> b!323463 m!330271))

(assert (=> b!323472 m!330247))

(check-sat (not b!323470) (not b!323463) (not b!323459) (not b!323468) (not start!32408) (not b!323469) (not b!323467) (not b!323461))
(check-sat)
