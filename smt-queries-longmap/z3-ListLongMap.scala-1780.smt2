; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32366 () Bool)

(assert start!32366)

(declare-fun b!322449 () Bool)

(declare-fun res!176404 () Bool)

(declare-fun e!199489 () Bool)

(assert (=> b!322449 (=> (not res!176404) (not e!199489))))

(declare-datatypes ((array!16509 0))(
  ( (array!16510 (arr!7812 (Array (_ BitVec 32) (_ BitVec 64))) (size!8165 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16509)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!322449 (= res!176404 (and (= (select (arr!7812 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8165 a!3305))))))

(declare-fun b!322450 () Bool)

(declare-fun e!199488 () Bool)

(assert (=> b!322450 (= e!199488 e!199489)))

(declare-fun res!176407 () Bool)

(assert (=> b!322450 (=> (not res!176407) (not e!199489))))

(declare-datatypes ((SeekEntryResult!2942 0))(
  ( (MissingZero!2942 (index!13944 (_ BitVec 32))) (Found!2942 (index!13945 (_ BitVec 32))) (Intermediate!2942 (undefined!3754 Bool) (index!13946 (_ BitVec 32)) (x!32221 (_ BitVec 32))) (Undefined!2942) (MissingVacant!2942 (index!13947 (_ BitVec 32))) )
))
(declare-fun lt!156267 () SeekEntryResult!2942)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16509 (_ BitVec 32)) SeekEntryResult!2942)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322450 (= res!176407 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156267))))

(assert (=> b!322450 (= lt!156267 (Intermediate!2942 false resIndex!58 resX!58))))

(declare-fun b!322451 () Bool)

(declare-fun res!176403 () Bool)

(assert (=> b!322451 (=> (not res!176403) (not e!199489))))

(assert (=> b!322451 (= res!176403 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156267))))

(declare-fun b!322452 () Bool)

(declare-fun res!176405 () Bool)

(assert (=> b!322452 (=> (not res!176405) (not e!199488))))

(assert (=> b!322452 (= res!176405 (and (= (size!8165 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8165 a!3305))))))

(declare-fun b!322453 () Bool)

(declare-fun res!176402 () Bool)

(assert (=> b!322453 (=> (not res!176402) (not e!199488))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!322453 (= res!176402 (validKeyInArray!0 k0!2497))))

(declare-fun b!322455 () Bool)

(declare-datatypes ((Unit!9863 0))(
  ( (Unit!9864) )
))
(declare-fun e!199493 () Unit!9863)

(declare-fun e!199492 () Unit!9863)

(assert (=> b!322455 (= e!199493 e!199492)))

(declare-fun c!50654 () Bool)

(assert (=> b!322455 (= c!50654 (or (= (select (arr!7812 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7812 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!322456 () Bool)

(declare-fun res!176409 () Bool)

(assert (=> b!322456 (=> (not res!176409) (not e!199488))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16509 (_ BitVec 32)) SeekEntryResult!2942)

(assert (=> b!322456 (= res!176409 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2942 i!1250)))))

(declare-fun b!322457 () Bool)

(assert (=> b!322457 false))

(declare-fun lt!156269 () Unit!9863)

(declare-fun e!199491 () Unit!9863)

(assert (=> b!322457 (= lt!156269 e!199491)))

(declare-fun c!50652 () Bool)

(get-info :version)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322457 (= c!50652 ((_ is Intermediate!2942) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun Unit!9865 () Unit!9863)

(assert (=> b!322457 (= e!199492 Unit!9865)))

(declare-fun b!322458 () Bool)

(assert (=> b!322458 false))

(declare-fun Unit!9866 () Unit!9863)

(assert (=> b!322458 (= e!199492 Unit!9866)))

(declare-fun b!322459 () Bool)

(assert (=> b!322459 (= e!199489 (not (or (not (= (select (arr!7812 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3777 #b00000000000000000000000000000000) (bvslt index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)))))))

(assert (=> b!322459 (= index!1840 resIndex!58)))

(declare-fun lt!156268 () Unit!9863)

(assert (=> b!322459 (= lt!156268 e!199493)))

(declare-fun c!50653 () Bool)

(assert (=> b!322459 (= c!50653 (not (= resIndex!58 index!1840)))))

(declare-fun b!322460 () Bool)

(declare-fun Unit!9867 () Unit!9863)

(assert (=> b!322460 (= e!199493 Unit!9867)))

(declare-fun res!176408 () Bool)

(assert (=> start!32366 (=> (not res!176408) (not e!199488))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32366 (= res!176408 (validMask!0 mask!3777))))

(assert (=> start!32366 e!199488))

(declare-fun array_inv!5784 (array!16509) Bool)

(assert (=> start!32366 (array_inv!5784 a!3305)))

(assert (=> start!32366 true))

(declare-fun b!322454 () Bool)

(declare-fun res!176406 () Bool)

(assert (=> b!322454 (=> (not res!176406) (not e!199488))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16509 (_ BitVec 32)) Bool)

(assert (=> b!322454 (= res!176406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!322461 () Bool)

(declare-fun res!176401 () Bool)

(assert (=> b!322461 (=> (not res!176401) (not e!199489))))

(assert (=> b!322461 (= res!176401 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7812 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(declare-fun b!322462 () Bool)

(declare-fun Unit!9868 () Unit!9863)

(assert (=> b!322462 (= e!199491 Unit!9868)))

(declare-fun b!322463 () Bool)

(declare-fun Unit!9869 () Unit!9863)

(assert (=> b!322463 (= e!199491 Unit!9869)))

(assert (=> b!322463 false))

(declare-fun b!322464 () Bool)

(declare-fun res!176400 () Bool)

(assert (=> b!322464 (=> (not res!176400) (not e!199488))))

(declare-fun arrayContainsKey!0 (array!16509 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!322464 (= res!176400 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(assert (= (and start!32366 res!176408) b!322452))

(assert (= (and b!322452 res!176405) b!322453))

(assert (= (and b!322453 res!176402) b!322464))

(assert (= (and b!322464 res!176400) b!322456))

(assert (= (and b!322456 res!176409) b!322454))

(assert (= (and b!322454 res!176406) b!322450))

(assert (= (and b!322450 res!176407) b!322449))

(assert (= (and b!322449 res!176404) b!322451))

(assert (= (and b!322451 res!176403) b!322461))

(assert (= (and b!322461 res!176401) b!322459))

(assert (= (and b!322459 c!50653) b!322455))

(assert (= (and b!322459 (not c!50653)) b!322460))

(assert (= (and b!322455 c!50654) b!322458))

(assert (= (and b!322455 (not c!50654)) b!322457))

(assert (= (and b!322457 c!50652) b!322462))

(assert (= (and b!322457 (not c!50652)) b!322463))

(declare-fun m!329701 () Bool)

(assert (=> b!322457 m!329701))

(assert (=> b!322457 m!329701))

(declare-fun m!329703 () Bool)

(assert (=> b!322457 m!329703))

(declare-fun m!329705 () Bool)

(assert (=> b!322453 m!329705))

(declare-fun m!329707 () Bool)

(assert (=> b!322464 m!329707))

(declare-fun m!329709 () Bool)

(assert (=> b!322461 m!329709))

(declare-fun m!329711 () Bool)

(assert (=> b!322449 m!329711))

(declare-fun m!329713 () Bool)

(assert (=> b!322454 m!329713))

(declare-fun m!329715 () Bool)

(assert (=> start!32366 m!329715))

(declare-fun m!329717 () Bool)

(assert (=> start!32366 m!329717))

(assert (=> b!322459 m!329709))

(declare-fun m!329719 () Bool)

(assert (=> b!322451 m!329719))

(declare-fun m!329721 () Bool)

(assert (=> b!322450 m!329721))

(assert (=> b!322450 m!329721))

(declare-fun m!329723 () Bool)

(assert (=> b!322450 m!329723))

(declare-fun m!329725 () Bool)

(assert (=> b!322456 m!329725))

(assert (=> b!322455 m!329709))

(check-sat (not b!322450) (not b!322453) (not b!322464) (not start!32366) (not b!322451) (not b!322456) (not b!322454) (not b!322457))
(check-sat)
