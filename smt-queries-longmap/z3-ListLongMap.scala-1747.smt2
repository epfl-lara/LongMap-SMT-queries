; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32004 () Bool)

(assert start!32004)

(declare-fun b!319572 () Bool)

(declare-fun res!173958 () Bool)

(declare-fun e!198460 () Bool)

(assert (=> b!319572 (=> (not res!173958) (not e!198460))))

(declare-datatypes ((array!16311 0))(
  ( (array!16312 (arr!7719 (Array (_ BitVec 32) (_ BitVec 64))) (size!8071 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16311)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16311 (_ BitVec 32)) Bool)

(assert (=> b!319572 (= res!173958 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!319573 () Bool)

(declare-fun res!173960 () Bool)

(assert (=> b!319573 (=> (not res!173960) (not e!198460))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16311 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319573 (= res!173960 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!319574 () Bool)

(declare-fun res!173957 () Bool)

(assert (=> b!319574 (=> (not res!173957) (not e!198460))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2850 0))(
  ( (MissingZero!2850 (index!13576 (_ BitVec 32))) (Found!2850 (index!13577 (_ BitVec 32))) (Intermediate!2850 (undefined!3662 Bool) (index!13578 (_ BitVec 32)) (x!31852 (_ BitVec 32))) (Undefined!2850) (MissingVacant!2850 (index!13579 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16311 (_ BitVec 32)) SeekEntryResult!2850)

(assert (=> b!319574 (= res!173957 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2850 i!1250)))))

(declare-fun res!173956 () Bool)

(assert (=> start!32004 (=> (not res!173956) (not e!198460))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32004 (= res!173956 (validMask!0 mask!3777))))

(assert (=> start!32004 e!198460))

(assert (=> start!32004 true))

(declare-fun array_inv!5682 (array!16311) Bool)

(assert (=> start!32004 (array_inv!5682 a!3305)))

(declare-fun b!319575 () Bool)

(assert (=> b!319575 (= e!198460 (bvslt mask!3777 #b00000000000000000000000000000000))))

(declare-fun b!319576 () Bool)

(declare-fun res!173959 () Bool)

(assert (=> b!319576 (=> (not res!173959) (not e!198460))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319576 (= res!173959 (validKeyInArray!0 k0!2497))))

(declare-fun b!319577 () Bool)

(declare-fun res!173961 () Bool)

(assert (=> b!319577 (=> (not res!173961) (not e!198460))))

(assert (=> b!319577 (= res!173961 (and (= (size!8071 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8071 a!3305))))))

(assert (= (and start!32004 res!173956) b!319577))

(assert (= (and b!319577 res!173961) b!319576))

(assert (= (and b!319576 res!173959) b!319573))

(assert (= (and b!319573 res!173960) b!319574))

(assert (= (and b!319574 res!173957) b!319572))

(assert (= (and b!319572 res!173958) b!319575))

(declare-fun m!328139 () Bool)

(assert (=> b!319573 m!328139))

(declare-fun m!328141 () Bool)

(assert (=> b!319576 m!328141))

(declare-fun m!328143 () Bool)

(assert (=> start!32004 m!328143))

(declare-fun m!328145 () Bool)

(assert (=> start!32004 m!328145))

(declare-fun m!328147 () Bool)

(assert (=> b!319574 m!328147))

(declare-fun m!328149 () Bool)

(assert (=> b!319572 m!328149))

(check-sat (not b!319573) (not b!319576) (not b!319574) (not start!32004) (not b!319572))
(check-sat)
