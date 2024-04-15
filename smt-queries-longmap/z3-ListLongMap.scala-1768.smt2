; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32240 () Bool)

(assert start!32240)

(declare-fun b!321004 () Bool)

(declare-fun res!175274 () Bool)

(declare-fun e!198947 () Bool)

(assert (=> b!321004 (=> (not res!175274) (not e!198947))))

(declare-datatypes ((array!16434 0))(
  ( (array!16435 (arr!7776 (Array (_ BitVec 32) (_ BitVec 64))) (size!8129 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16434)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2906 0))(
  ( (MissingZero!2906 (index!13800 (_ BitVec 32))) (Found!2906 (index!13801 (_ BitVec 32))) (Intermediate!2906 (undefined!3718 Bool) (index!13802 (_ BitVec 32)) (x!32080 (_ BitVec 32))) (Undefined!2906) (MissingVacant!2906 (index!13803 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16434 (_ BitVec 32)) SeekEntryResult!2906)

(assert (=> b!321004 (= res!175274 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2906 i!1250)))))

(declare-fun b!321005 () Bool)

(declare-fun res!175273 () Bool)

(assert (=> b!321005 (=> (not res!175273) (not e!198947))))

(assert (=> b!321005 (= res!175273 (and (= (size!8129 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8129 a!3305))))))

(declare-fun b!321007 () Bool)

(declare-fun res!175271 () Bool)

(declare-fun e!198946 () Bool)

(assert (=> b!321007 (=> (not res!175271) (not e!198946))))

(declare-fun lt!155942 () SeekEntryResult!2906)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16434 (_ BitVec 32)) SeekEntryResult!2906)

(assert (=> b!321007 (= res!175271 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!155942))))

(declare-fun b!321008 () Bool)

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!321008 (= e!198946 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7776 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7776 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7776 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3777 #b00000000000000000000000000000000)))))

(declare-fun b!321009 () Bool)

(declare-fun res!175278 () Bool)

(assert (=> b!321009 (=> (not res!175278) (not e!198947))))

(declare-fun arrayContainsKey!0 (array!16434 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321009 (= res!175278 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!321010 () Bool)

(declare-fun res!175275 () Bool)

(assert (=> b!321010 (=> (not res!175275) (not e!198947))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321010 (= res!175275 (validKeyInArray!0 k0!2497))))

(declare-fun b!321011 () Bool)

(declare-fun res!175276 () Bool)

(assert (=> b!321011 (=> (not res!175276) (not e!198946))))

(assert (=> b!321011 (= res!175276 (and (= (select (arr!7776 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8129 a!3305))))))

(declare-fun b!321012 () Bool)

(declare-fun res!175272 () Bool)

(assert (=> b!321012 (=> (not res!175272) (not e!198947))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16434 (_ BitVec 32)) Bool)

(assert (=> b!321012 (= res!175272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!175277 () Bool)

(assert (=> start!32240 (=> (not res!175277) (not e!198947))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32240 (= res!175277 (validMask!0 mask!3777))))

(assert (=> start!32240 e!198947))

(declare-fun array_inv!5748 (array!16434) Bool)

(assert (=> start!32240 (array_inv!5748 a!3305)))

(assert (=> start!32240 true))

(declare-fun b!321006 () Bool)

(assert (=> b!321006 (= e!198947 e!198946)))

(declare-fun res!175270 () Bool)

(assert (=> b!321006 (=> (not res!175270) (not e!198946))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321006 (= res!175270 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!155942))))

(assert (=> b!321006 (= lt!155942 (Intermediate!2906 false resIndex!58 resX!58))))

(assert (= (and start!32240 res!175277) b!321005))

(assert (= (and b!321005 res!175273) b!321010))

(assert (= (and b!321010 res!175275) b!321009))

(assert (= (and b!321009 res!175278) b!321004))

(assert (= (and b!321004 res!175274) b!321012))

(assert (= (and b!321012 res!175272) b!321006))

(assert (= (and b!321006 res!175270) b!321011))

(assert (= (and b!321011 res!175276) b!321007))

(assert (= (and b!321007 res!175271) b!321008))

(declare-fun m!328723 () Bool)

(assert (=> b!321008 m!328723))

(declare-fun m!328725 () Bool)

(assert (=> b!321012 m!328725))

(declare-fun m!328727 () Bool)

(assert (=> b!321010 m!328727))

(declare-fun m!328729 () Bool)

(assert (=> b!321009 m!328729))

(declare-fun m!328731 () Bool)

(assert (=> b!321007 m!328731))

(declare-fun m!328733 () Bool)

(assert (=> b!321006 m!328733))

(assert (=> b!321006 m!328733))

(declare-fun m!328735 () Bool)

(assert (=> b!321006 m!328735))

(declare-fun m!328737 () Bool)

(assert (=> b!321011 m!328737))

(declare-fun m!328739 () Bool)

(assert (=> b!321004 m!328739))

(declare-fun m!328741 () Bool)

(assert (=> start!32240 m!328741))

(declare-fun m!328743 () Bool)

(assert (=> start!32240 m!328743))

(check-sat (not b!321012) (not b!321004) (not start!32240) (not b!321010) (not b!321009) (not b!321007) (not b!321006))
(check-sat)
