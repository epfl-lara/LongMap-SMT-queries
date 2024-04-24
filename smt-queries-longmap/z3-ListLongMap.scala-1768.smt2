; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32240 () Bool)

(assert start!32240)

(declare-fun b!321226 () Bool)

(declare-fun res!175402 () Bool)

(declare-fun e!199088 () Bool)

(assert (=> b!321226 (=> (not res!175402) (not e!199088))))

(declare-datatypes ((array!16443 0))(
  ( (array!16444 (arr!7780 (Array (_ BitVec 32) (_ BitVec 64))) (size!8132 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16443)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16443 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321226 (= res!175402 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!321227 () Bool)

(declare-fun e!199089 () Bool)

(assert (=> b!321227 (= e!199088 e!199089)))

(declare-fun res!175396 () Bool)

(assert (=> b!321227 (=> (not res!175396) (not e!199089))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2876 0))(
  ( (MissingZero!2876 (index!13680 (_ BitVec 32))) (Found!2876 (index!13681 (_ BitVec 32))) (Intermediate!2876 (undefined!3688 Bool) (index!13682 (_ BitVec 32)) (x!32052 (_ BitVec 32))) (Undefined!2876) (MissingVacant!2876 (index!13683 (_ BitVec 32))) )
))
(declare-fun lt!156195 () SeekEntryResult!2876)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16443 (_ BitVec 32)) SeekEntryResult!2876)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321227 (= res!175396 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156195))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!321227 (= lt!156195 (Intermediate!2876 false resIndex!58 resX!58))))

(declare-fun b!321228 () Bool)

(declare-fun res!175398 () Bool)

(assert (=> b!321228 (=> (not res!175398) (not e!199088))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16443 (_ BitVec 32)) Bool)

(assert (=> b!321228 (= res!175398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!321229 () Bool)

(declare-fun res!175397 () Bool)

(assert (=> b!321229 (=> (not res!175397) (not e!199089))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!321229 (= res!175397 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156195))))

(declare-fun b!321230 () Bool)

(declare-fun res!175403 () Bool)

(assert (=> b!321230 (=> (not res!175403) (not e!199088))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16443 (_ BitVec 32)) SeekEntryResult!2876)

(assert (=> b!321230 (= res!175403 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2876 i!1250)))))

(declare-fun b!321231 () Bool)

(declare-fun res!175400 () Bool)

(assert (=> b!321231 (=> (not res!175400) (not e!199089))))

(assert (=> b!321231 (= res!175400 (and (= (select (arr!7780 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8132 a!3305))))))

(declare-fun b!321232 () Bool)

(declare-fun res!175404 () Bool)

(assert (=> b!321232 (=> (not res!175404) (not e!199088))))

(assert (=> b!321232 (= res!175404 (and (= (size!8132 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8132 a!3305))))))

(declare-fun res!175399 () Bool)

(assert (=> start!32240 (=> (not res!175399) (not e!199088))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32240 (= res!175399 (validMask!0 mask!3777))))

(assert (=> start!32240 e!199088))

(declare-fun array_inv!5730 (array!16443) Bool)

(assert (=> start!32240 (array_inv!5730 a!3305)))

(assert (=> start!32240 true))

(declare-fun b!321233 () Bool)

(declare-fun res!175401 () Bool)

(assert (=> b!321233 (=> (not res!175401) (not e!199088))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321233 (= res!175401 (validKeyInArray!0 k0!2497))))

(declare-fun b!321234 () Bool)

(assert (=> b!321234 (= e!199089 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7780 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7780 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7780 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3777 #b00000000000000000000000000000000)))))

(assert (= (and start!32240 res!175399) b!321232))

(assert (= (and b!321232 res!175404) b!321233))

(assert (= (and b!321233 res!175401) b!321226))

(assert (= (and b!321226 res!175402) b!321230))

(assert (= (and b!321230 res!175403) b!321228))

(assert (= (and b!321228 res!175398) b!321227))

(assert (= (and b!321227 res!175396) b!321231))

(assert (= (and b!321231 res!175400) b!321229))

(assert (= (and b!321229 res!175397) b!321234))

(declare-fun m!329629 () Bool)

(assert (=> b!321229 m!329629))

(declare-fun m!329631 () Bool)

(assert (=> b!321233 m!329631))

(declare-fun m!329633 () Bool)

(assert (=> b!321228 m!329633))

(declare-fun m!329635 () Bool)

(assert (=> b!321230 m!329635))

(declare-fun m!329637 () Bool)

(assert (=> b!321231 m!329637))

(declare-fun m!329639 () Bool)

(assert (=> start!32240 m!329639))

(declare-fun m!329641 () Bool)

(assert (=> start!32240 m!329641))

(declare-fun m!329643 () Bool)

(assert (=> b!321234 m!329643))

(declare-fun m!329645 () Bool)

(assert (=> b!321226 m!329645))

(declare-fun m!329647 () Bool)

(assert (=> b!321227 m!329647))

(assert (=> b!321227 m!329647))

(declare-fun m!329649 () Bool)

(assert (=> b!321227 m!329649))

(check-sat (not b!321230) (not start!32240) (not b!321227) (not b!321228) (not b!321226) (not b!321233) (not b!321229))
(check-sat)
