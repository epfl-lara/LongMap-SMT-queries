; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32258 () Bool)

(assert start!32258)

(declare-fun b!321249 () Bool)

(declare-fun res!175524 () Bool)

(declare-fun e!199028 () Bool)

(assert (=> b!321249 (=> (not res!175524) (not e!199028))))

(declare-datatypes ((array!16452 0))(
  ( (array!16453 (arr!7785 (Array (_ BitVec 32) (_ BitVec 64))) (size!8138 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16452)

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(assert (=> b!321249 (= res!175524 (and (= (size!8138 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8138 a!3305))))))

(declare-fun b!321250 () Bool)

(declare-fun res!175523 () Bool)

(assert (=> b!321250 (=> (not res!175523) (not e!199028))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16452 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321250 (= res!175523 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!321251 () Bool)

(declare-fun res!175520 () Bool)

(declare-fun e!199026 () Bool)

(assert (=> b!321251 (=> (not res!175520) (not e!199026))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!321251 (= res!175520 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7785 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7785 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7785 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!321252 () Bool)

(assert (=> b!321252 (= e!199028 e!199026)))

(declare-fun res!175517 () Bool)

(assert (=> b!321252 (=> (not res!175517) (not e!199026))))

(declare-datatypes ((SeekEntryResult!2915 0))(
  ( (MissingZero!2915 (index!13836 (_ BitVec 32))) (Found!2915 (index!13837 (_ BitVec 32))) (Intermediate!2915 (undefined!3727 Bool) (index!13838 (_ BitVec 32)) (x!32113 (_ BitVec 32))) (Undefined!2915) (MissingVacant!2915 (index!13839 (_ BitVec 32))) )
))
(declare-fun lt!155971 () SeekEntryResult!2915)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16452 (_ BitVec 32)) SeekEntryResult!2915)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321252 (= res!175517 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!155971))))

(assert (=> b!321252 (= lt!155971 (Intermediate!2915 false resIndex!58 resX!58))))

(declare-fun b!321253 () Bool)

(declare-fun res!175519 () Bool)

(assert (=> b!321253 (=> (not res!175519) (not e!199028))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16452 (_ BitVec 32)) SeekEntryResult!2915)

(assert (=> b!321253 (= res!175519 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2915 i!1250)))))

(declare-fun b!321254 () Bool)

(declare-fun res!175518 () Bool)

(assert (=> b!321254 (=> (not res!175518) (not e!199026))))

(assert (=> b!321254 (= res!175518 (and (= (select (arr!7785 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8138 a!3305))))))

(declare-fun res!175522 () Bool)

(assert (=> start!32258 (=> (not res!175522) (not e!199028))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32258 (= res!175522 (validMask!0 mask!3777))))

(assert (=> start!32258 e!199028))

(declare-fun array_inv!5757 (array!16452) Bool)

(assert (=> start!32258 (array_inv!5757 a!3305)))

(assert (=> start!32258 true))

(declare-fun b!321255 () Bool)

(assert (=> b!321255 (= e!199026 false)))

(declare-fun lt!155972 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321255 (= lt!155972 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!321256 () Bool)

(declare-fun res!175516 () Bool)

(assert (=> b!321256 (=> (not res!175516) (not e!199026))))

(assert (=> b!321256 (= res!175516 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!155971))))

(declare-fun b!321257 () Bool)

(declare-fun res!175515 () Bool)

(assert (=> b!321257 (=> (not res!175515) (not e!199028))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321257 (= res!175515 (validKeyInArray!0 k0!2497))))

(declare-fun b!321258 () Bool)

(declare-fun res!175521 () Bool)

(assert (=> b!321258 (=> (not res!175521) (not e!199028))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16452 (_ BitVec 32)) Bool)

(assert (=> b!321258 (= res!175521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32258 res!175522) b!321249))

(assert (= (and b!321249 res!175524) b!321257))

(assert (= (and b!321257 res!175515) b!321250))

(assert (= (and b!321250 res!175523) b!321253))

(assert (= (and b!321253 res!175519) b!321258))

(assert (= (and b!321258 res!175521) b!321252))

(assert (= (and b!321252 res!175517) b!321254))

(assert (= (and b!321254 res!175518) b!321256))

(assert (= (and b!321256 res!175516) b!321251))

(assert (= (and b!321251 res!175520) b!321255))

(declare-fun m!328921 () Bool)

(assert (=> b!321257 m!328921))

(declare-fun m!328923 () Bool)

(assert (=> start!32258 m!328923))

(declare-fun m!328925 () Bool)

(assert (=> start!32258 m!328925))

(declare-fun m!328927 () Bool)

(assert (=> b!321252 m!328927))

(assert (=> b!321252 m!328927))

(declare-fun m!328929 () Bool)

(assert (=> b!321252 m!328929))

(declare-fun m!328931 () Bool)

(assert (=> b!321254 m!328931))

(declare-fun m!328933 () Bool)

(assert (=> b!321251 m!328933))

(declare-fun m!328935 () Bool)

(assert (=> b!321258 m!328935))

(declare-fun m!328937 () Bool)

(assert (=> b!321250 m!328937))

(declare-fun m!328939 () Bool)

(assert (=> b!321253 m!328939))

(declare-fun m!328941 () Bool)

(assert (=> b!321255 m!328941))

(declare-fun m!328943 () Bool)

(assert (=> b!321256 m!328943))

(check-sat (not b!321255) (not start!32258) (not b!321257) (not b!321250) (not b!321252) (not b!321256) (not b!321253) (not b!321258))
(check-sat)
