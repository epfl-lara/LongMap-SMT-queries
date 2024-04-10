; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32478 () Bool)

(assert start!32478)

(declare-fun b!324623 () Bool)

(declare-fun res!177960 () Bool)

(declare-fun e!200334 () Bool)

(assert (=> b!324623 (=> (not res!177960) (not e!200334))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324623 (= res!177960 (validKeyInArray!0 k0!2497))))

(declare-fun b!324624 () Bool)

(declare-fun res!177961 () Bool)

(assert (=> b!324624 (=> (not res!177961) (not e!200334))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((array!16617 0))(
  ( (array!16618 (arr!7866 (Array (_ BitVec 32) (_ BitVec 64))) (size!8218 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16617)

(assert (=> b!324624 (= res!177961 (and (= (size!8218 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8218 a!3305))))))

(declare-fun b!324625 () Bool)

(declare-fun res!177958 () Bool)

(assert (=> b!324625 (=> (not res!177958) (not e!200334))))

(declare-datatypes ((SeekEntryResult!2997 0))(
  ( (MissingZero!2997 (index!14164 (_ BitVec 32))) (Found!2997 (index!14165 (_ BitVec 32))) (Intermediate!2997 (undefined!3809 Bool) (index!14166 (_ BitVec 32)) (x!32409 (_ BitVec 32))) (Undefined!2997) (MissingVacant!2997 (index!14167 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16617 (_ BitVec 32)) SeekEntryResult!2997)

(assert (=> b!324625 (= res!177958 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2997 i!1250)))))

(declare-fun b!324626 () Bool)

(declare-fun res!177957 () Bool)

(assert (=> b!324626 (=> (not res!177957) (not e!200334))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16617 (_ BitVec 32)) Bool)

(assert (=> b!324626 (= res!177957 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324627 () Bool)

(declare-fun res!177956 () Bool)

(assert (=> b!324627 (=> (not res!177956) (not e!200334))))

(declare-fun arrayContainsKey!0 (array!16617 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324627 (= res!177956 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324628 () Bool)

(declare-fun res!177963 () Bool)

(declare-fun e!200335 () Bool)

(assert (=> b!324628 (=> (not res!177963) (not e!200335))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!324628 (= res!177963 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7866 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun res!177959 () Bool)

(assert (=> start!32478 (=> (not res!177959) (not e!200334))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32478 (= res!177959 (validMask!0 mask!3777))))

(assert (=> start!32478 e!200334))

(declare-fun array_inv!5829 (array!16617) Bool)

(assert (=> start!32478 (array_inv!5829 a!3305)))

(assert (=> start!32478 true))

(declare-fun b!324629 () Bool)

(declare-fun res!177954 () Bool)

(assert (=> b!324629 (=> (not res!177954) (not e!200335))))

(declare-fun lt!156840 () SeekEntryResult!2997)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16617 (_ BitVec 32)) SeekEntryResult!2997)

(assert (=> b!324629 (= res!177954 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156840))))

(declare-fun b!324630 () Bool)

(declare-fun res!177955 () Bool)

(assert (=> b!324630 (=> (not res!177955) (not e!200335))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!324630 (= res!177955 (and (= (select (arr!7866 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8218 a!3305))))))

(declare-fun b!324631 () Bool)

(assert (=> b!324631 (= e!200334 e!200335)))

(declare-fun res!177962 () Bool)

(assert (=> b!324631 (=> (not res!177962) (not e!200335))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324631 (= res!177962 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156840))))

(assert (=> b!324631 (= lt!156840 (Intermediate!2997 false resIndex!58 resX!58))))

(declare-fun b!324632 () Bool)

(assert (=> b!324632 (= e!200335 false)))

(declare-fun lt!156839 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324632 (= lt!156839 (nextIndex!0 index!1840 x!1490 mask!3777))))

(assert (= (and start!32478 res!177959) b!324624))

(assert (= (and b!324624 res!177961) b!324623))

(assert (= (and b!324623 res!177960) b!324627))

(assert (= (and b!324627 res!177956) b!324625))

(assert (= (and b!324625 res!177958) b!324626))

(assert (= (and b!324626 res!177957) b!324631))

(assert (= (and b!324631 res!177962) b!324630))

(assert (= (and b!324630 res!177955) b!324629))

(assert (= (and b!324629 res!177954) b!324628))

(assert (= (and b!324628 res!177963) b!324632))

(declare-fun m!331631 () Bool)

(assert (=> b!324627 m!331631))

(declare-fun m!331633 () Bool)

(assert (=> b!324625 m!331633))

(declare-fun m!331635 () Bool)

(assert (=> b!324630 m!331635))

(declare-fun m!331637 () Bool)

(assert (=> b!324632 m!331637))

(declare-fun m!331639 () Bool)

(assert (=> b!324623 m!331639))

(declare-fun m!331641 () Bool)

(assert (=> b!324631 m!331641))

(assert (=> b!324631 m!331641))

(declare-fun m!331643 () Bool)

(assert (=> b!324631 m!331643))

(declare-fun m!331645 () Bool)

(assert (=> b!324629 m!331645))

(declare-fun m!331647 () Bool)

(assert (=> b!324628 m!331647))

(declare-fun m!331649 () Bool)

(assert (=> b!324626 m!331649))

(declare-fun m!331651 () Bool)

(assert (=> start!32478 m!331651))

(declare-fun m!331653 () Bool)

(assert (=> start!32478 m!331653))

(check-sat (not b!324629) (not b!324623) (not b!324625) (not start!32478) (not b!324632) (not b!324627) (not b!324631) (not b!324626))
(check-sat)
