; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32710 () Bool)

(assert start!32710)

(declare-fun b!326951 () Bool)

(declare-fun res!179984 () Bool)

(declare-fun e!201179 () Bool)

(assert (=> b!326951 (=> (not res!179984) (not e!201179))))

(declare-datatypes ((array!16747 0))(
  ( (array!16748 (arr!7928 (Array (_ BitVec 32) (_ BitVec 64))) (size!8280 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16747)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!326951 (= res!179984 (and (= (select (arr!7928 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8280 a!3305))))))

(declare-fun b!326953 () Bool)

(declare-fun res!179983 () Bool)

(declare-fun e!201180 () Bool)

(assert (=> b!326953 (=> (not res!179983) (not e!201180))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326953 (= res!179983 (validKeyInArray!0 k!2497))))

(declare-fun b!326954 () Bool)

(declare-fun res!179991 () Bool)

(assert (=> b!326954 (=> (not res!179991) (not e!201180))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3059 0))(
  ( (MissingZero!3059 (index!14412 (_ BitVec 32))) (Found!3059 (index!14413 (_ BitVec 32))) (Intermediate!3059 (undefined!3871 Bool) (index!14414 (_ BitVec 32)) (x!32657 (_ BitVec 32))) (Undefined!3059) (MissingVacant!3059 (index!14415 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16747 (_ BitVec 32)) SeekEntryResult!3059)

(assert (=> b!326954 (= res!179991 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3059 i!1250)))))

(declare-fun b!326955 () Bool)

(declare-fun res!179985 () Bool)

(assert (=> b!326955 (=> (not res!179985) (not e!201180))))

(declare-fun arrayContainsKey!0 (array!16747 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326955 (= res!179985 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!326956 () Bool)

(assert (=> b!326956 (= e!201179 (and (bvsge mask!3777 #b00000000000000000000000000000000) (bvsge index!1840 (bvadd #b00000000000000000000000000000001 mask!3777))))))

(declare-datatypes ((Unit!10152 0))(
  ( (Unit!10153) )
))
(declare-fun lt!157428 () Unit!10152)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16747 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10152)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326956 (= lt!157428 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!326957 () Bool)

(declare-fun res!179989 () Bool)

(assert (=> b!326957 (=> (not res!179989) (not e!201180))))

(assert (=> b!326957 (= res!179989 (and (= (size!8280 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8280 a!3305))))))

(declare-fun b!326958 () Bool)

(declare-fun res!179990 () Bool)

(assert (=> b!326958 (=> (not res!179990) (not e!201179))))

(declare-fun lt!157427 () SeekEntryResult!3059)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16747 (_ BitVec 32)) SeekEntryResult!3059)

(assert (=> b!326958 (= res!179990 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157427))))

(declare-fun b!326952 () Bool)

(declare-fun res!179988 () Bool)

(assert (=> b!326952 (=> (not res!179988) (not e!201180))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16747 (_ BitVec 32)) Bool)

(assert (=> b!326952 (= res!179988 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!179986 () Bool)

(assert (=> start!32710 (=> (not res!179986) (not e!201180))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32710 (= res!179986 (validMask!0 mask!3777))))

(assert (=> start!32710 e!201180))

(declare-fun array_inv!5891 (array!16747) Bool)

(assert (=> start!32710 (array_inv!5891 a!3305)))

(assert (=> start!32710 true))

(declare-fun b!326959 () Bool)

(assert (=> b!326959 (= e!201180 e!201179)))

(declare-fun res!179982 () Bool)

(assert (=> b!326959 (=> (not res!179982) (not e!201179))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326959 (= res!179982 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157427))))

(assert (=> b!326959 (= lt!157427 (Intermediate!3059 false resIndex!58 resX!58))))

(declare-fun b!326960 () Bool)

(declare-fun res!179987 () Bool)

(assert (=> b!326960 (=> (not res!179987) (not e!201179))))

(assert (=> b!326960 (= res!179987 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7928 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(assert (= (and start!32710 res!179986) b!326957))

(assert (= (and b!326957 res!179989) b!326953))

(assert (= (and b!326953 res!179983) b!326955))

(assert (= (and b!326955 res!179985) b!326954))

(assert (= (and b!326954 res!179991) b!326952))

(assert (= (and b!326952 res!179988) b!326959))

(assert (= (and b!326959 res!179982) b!326951))

(assert (= (and b!326951 res!179984) b!326958))

(assert (= (and b!326958 res!179990) b!326960))

(assert (= (and b!326960 res!179987) b!326956))

(declare-fun m!333431 () Bool)

(assert (=> b!326960 m!333431))

(declare-fun m!333433 () Bool)

(assert (=> b!326953 m!333433))

(declare-fun m!333435 () Bool)

(assert (=> b!326952 m!333435))

(declare-fun m!333437 () Bool)

(assert (=> start!32710 m!333437))

(declare-fun m!333439 () Bool)

(assert (=> start!32710 m!333439))

(declare-fun m!333441 () Bool)

(assert (=> b!326959 m!333441))

(assert (=> b!326959 m!333441))

(declare-fun m!333443 () Bool)

(assert (=> b!326959 m!333443))

(declare-fun m!333445 () Bool)

(assert (=> b!326954 m!333445))

(declare-fun m!333447 () Bool)

(assert (=> b!326958 m!333447))

(declare-fun m!333449 () Bool)

(assert (=> b!326951 m!333449))

(declare-fun m!333451 () Bool)

(assert (=> b!326956 m!333451))

(assert (=> b!326956 m!333451))

(declare-fun m!333453 () Bool)

(assert (=> b!326956 m!333453))

(declare-fun m!333455 () Bool)

(assert (=> b!326955 m!333455))

(push 1)

(assert (not b!326953))

(assert (not b!326955))

(assert (not b!326956))

(assert (not b!326952))

(assert (not b!326958))

(assert (not b!326959))

(assert (not start!32710))

(assert (not b!326954))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

