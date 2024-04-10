; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33294 () Bool)

(assert start!33294)

(declare-fun b!331076 () Bool)

(declare-fun res!182483 () Bool)

(declare-fun e!203140 () Bool)

(assert (=> b!331076 (=> (not res!182483) (not e!203140))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((array!16902 0))(
  ( (array!16903 (arr!7992 (Array (_ BitVec 32) (_ BitVec 64))) (size!8344 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16902)

(assert (=> b!331076 (= res!182483 (and (= (select (arr!7992 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8344 a!3305))))))

(declare-fun b!331077 () Bool)

(declare-fun res!182486 () Bool)

(declare-fun e!203139 () Bool)

(assert (=> b!331077 (=> (not res!182486) (not e!203139))))

(declare-fun mask!3777 () (_ BitVec 32))

(assert (=> b!331077 (= res!182486 (and (= (size!8344 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8344 a!3305))))))

(declare-fun b!331078 () Bool)

(declare-fun res!182478 () Bool)

(assert (=> b!331078 (=> (not res!182478) (not e!203139))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16902 (_ BitVec 32)) Bool)

(assert (=> b!331078 (= res!182478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!331079 () Bool)

(declare-fun res!182482 () Bool)

(assert (=> b!331079 (=> (not res!182482) (not e!203139))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3123 0))(
  ( (MissingZero!3123 (index!14668 (_ BitVec 32))) (Found!3123 (index!14669 (_ BitVec 32))) (Intermediate!3123 (undefined!3935 Bool) (index!14670 (_ BitVec 32)) (x!32955 (_ BitVec 32))) (Undefined!3123) (MissingVacant!3123 (index!14671 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16902 (_ BitVec 32)) SeekEntryResult!3123)

(assert (=> b!331079 (= res!182482 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3123 i!1250)))))

(declare-fun b!331080 () Bool)

(assert (=> b!331080 (= e!203140 false)))

(declare-datatypes ((Unit!10325 0))(
  ( (Unit!10326) )
))
(declare-fun lt!158709 () Unit!10325)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16902 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10325)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!331080 (= lt!158709 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!331081 () Bool)

(declare-fun res!182479 () Bool)

(assert (=> b!331081 (=> (not res!182479) (not e!203139))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!331081 (= res!182479 (validKeyInArray!0 k0!2497))))

(declare-fun b!331083 () Bool)

(declare-fun res!182485 () Bool)

(assert (=> b!331083 (=> (not res!182485) (not e!203140))))

(declare-fun lt!158708 () SeekEntryResult!3123)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16902 (_ BitVec 32)) SeekEntryResult!3123)

(assert (=> b!331083 (= res!182485 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!158708))))

(declare-fun res!182480 () Bool)

(assert (=> start!33294 (=> (not res!182480) (not e!203139))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33294 (= res!182480 (validMask!0 mask!3777))))

(assert (=> start!33294 e!203139))

(declare-fun array_inv!5955 (array!16902) Bool)

(assert (=> start!33294 (array_inv!5955 a!3305)))

(assert (=> start!33294 true))

(declare-fun b!331082 () Bool)

(assert (=> b!331082 (= e!203139 e!203140)))

(declare-fun res!182484 () Bool)

(assert (=> b!331082 (=> (not res!182484) (not e!203140))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!331082 (= res!182484 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!158708))))

(assert (=> b!331082 (= lt!158708 (Intermediate!3123 false resIndex!58 resX!58))))

(declare-fun b!331084 () Bool)

(declare-fun res!182487 () Bool)

(assert (=> b!331084 (=> (not res!182487) (not e!203140))))

(assert (=> b!331084 (= res!182487 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7992 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!331085 () Bool)

(declare-fun res!182481 () Bool)

(assert (=> b!331085 (=> (not res!182481) (not e!203139))))

(declare-fun arrayContainsKey!0 (array!16902 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!331085 (= res!182481 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(assert (= (and start!33294 res!182480) b!331077))

(assert (= (and b!331077 res!182486) b!331081))

(assert (= (and b!331081 res!182479) b!331085))

(assert (= (and b!331085 res!182481) b!331079))

(assert (= (and b!331079 res!182482) b!331078))

(assert (= (and b!331078 res!182478) b!331082))

(assert (= (and b!331082 res!182484) b!331076))

(assert (= (and b!331076 res!182483) b!331083))

(assert (= (and b!331083 res!182485) b!331084))

(assert (= (and b!331084 res!182487) b!331080))

(declare-fun m!336079 () Bool)

(assert (=> b!331081 m!336079))

(declare-fun m!336081 () Bool)

(assert (=> b!331082 m!336081))

(assert (=> b!331082 m!336081))

(declare-fun m!336083 () Bool)

(assert (=> b!331082 m!336083))

(declare-fun m!336085 () Bool)

(assert (=> b!331080 m!336085))

(assert (=> b!331080 m!336085))

(declare-fun m!336087 () Bool)

(assert (=> b!331080 m!336087))

(declare-fun m!336089 () Bool)

(assert (=> b!331078 m!336089))

(declare-fun m!336091 () Bool)

(assert (=> b!331085 m!336091))

(declare-fun m!336093 () Bool)

(assert (=> start!33294 m!336093))

(declare-fun m!336095 () Bool)

(assert (=> start!33294 m!336095))

(declare-fun m!336097 () Bool)

(assert (=> b!331084 m!336097))

(declare-fun m!336099 () Bool)

(assert (=> b!331083 m!336099))

(declare-fun m!336101 () Bool)

(assert (=> b!331076 m!336101))

(declare-fun m!336103 () Bool)

(assert (=> b!331079 m!336103))

(check-sat (not start!33294) (not b!331078) (not b!331082) (not b!331081) (not b!331085) (not b!331080) (not b!331079) (not b!331083))
(check-sat)
