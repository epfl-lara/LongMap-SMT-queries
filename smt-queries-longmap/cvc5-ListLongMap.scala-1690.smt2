; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31028 () Bool)

(assert start!31028)

(declare-fun b!311957 () Bool)

(declare-fun e!194578 () Bool)

(declare-fun e!194579 () Bool)

(assert (=> b!311957 (= e!194578 (not e!194579))))

(declare-fun res!168417 () Bool)

(assert (=> b!311957 (=> res!168417 e!194579)))

(declare-datatypes ((array!15930 0))(
  ( (array!15931 (arr!7547 (Array (_ BitVec 32) (_ BitVec 64))) (size!7899 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15930)

(declare-fun lt!152649 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2687 0))(
  ( (MissingZero!2687 (index!12924 (_ BitVec 32))) (Found!2687 (index!12925 (_ BitVec 32))) (Intermediate!2687 (undefined!3499 Bool) (index!12926 (_ BitVec 32)) (x!31140 (_ BitVec 32))) (Undefined!2687) (MissingVacant!2687 (index!12927 (_ BitVec 32))) )
))
(declare-fun lt!152642 () SeekEntryResult!2687)

(declare-fun lt!152643 () SeekEntryResult!2687)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!311957 (= res!168417 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!152649 #b00000000000000000000000000000000) (bvsge lt!152649 (size!7899 a!3293)) (not (= lt!152642 lt!152643))))))

(declare-fun lt!152644 () SeekEntryResult!2687)

(declare-fun lt!152647 () SeekEntryResult!2687)

(assert (=> b!311957 (= lt!152644 lt!152647)))

(declare-fun lt!152646 () array!15930)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15930 (_ BitVec 32)) SeekEntryResult!2687)

(assert (=> b!311957 (= lt!152647 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152649 k!2441 lt!152646 mask!3709))))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!311957 (= lt!152644 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!152646 mask!3709))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!311957 (= lt!152646 (array!15931 (store (arr!7547 a!3293) i!1240 k!2441) (size!7899 a!3293)))))

(declare-fun lt!152645 () SeekEntryResult!2687)

(assert (=> b!311957 (= lt!152645 lt!152642)))

(assert (=> b!311957 (= lt!152642 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152649 k!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311957 (= lt!152649 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!311958 () Bool)

(assert (=> b!311958 (= e!194579 true)))

(assert (=> b!311958 (= lt!152647 lt!152642)))

(declare-datatypes ((Unit!9605 0))(
  ( (Unit!9606) )
))
(declare-fun lt!152648 () Unit!9605)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15930 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9605)

(assert (=> b!311958 (= lt!152648 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!152649 resIndex!52 resX!52 mask!3709))))

(declare-fun res!168411 () Bool)

(declare-fun e!194581 () Bool)

(assert (=> start!31028 (=> (not res!168411) (not e!194581))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31028 (= res!168411 (validMask!0 mask!3709))))

(assert (=> start!31028 e!194581))

(declare-fun array_inv!5510 (array!15930) Bool)

(assert (=> start!31028 (array_inv!5510 a!3293)))

(assert (=> start!31028 true))

(declare-fun b!311959 () Bool)

(declare-fun e!194580 () Bool)

(assert (=> b!311959 (= e!194580 e!194578)))

(declare-fun res!168415 () Bool)

(assert (=> b!311959 (=> (not res!168415) (not e!194578))))

(assert (=> b!311959 (= res!168415 (and (= lt!152645 lt!152643) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7547 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311959 (= lt!152645 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!311960 () Bool)

(declare-fun res!168418 () Bool)

(assert (=> b!311960 (=> (not res!168418) (not e!194580))))

(assert (=> b!311960 (= res!168418 (and (= (select (arr!7547 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7899 a!3293))))))

(declare-fun b!311961 () Bool)

(declare-fun res!168420 () Bool)

(assert (=> b!311961 (=> (not res!168420) (not e!194581))))

(assert (=> b!311961 (= res!168420 (and (= (size!7899 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7899 a!3293))))))

(declare-fun b!311962 () Bool)

(declare-fun res!168419 () Bool)

(assert (=> b!311962 (=> (not res!168419) (not e!194581))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15930 (_ BitVec 32)) SeekEntryResult!2687)

(assert (=> b!311962 (= res!168419 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2687 i!1240)))))

(declare-fun b!311963 () Bool)

(declare-fun res!168416 () Bool)

(assert (=> b!311963 (=> (not res!168416) (not e!194581))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15930 (_ BitVec 32)) Bool)

(assert (=> b!311963 (= res!168416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311964 () Bool)

(declare-fun res!168412 () Bool)

(assert (=> b!311964 (=> (not res!168412) (not e!194581))))

(declare-fun arrayContainsKey!0 (array!15930 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311964 (= res!168412 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311965 () Bool)

(declare-fun res!168413 () Bool)

(assert (=> b!311965 (=> (not res!168413) (not e!194581))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311965 (= res!168413 (validKeyInArray!0 k!2441))))

(declare-fun b!311966 () Bool)

(assert (=> b!311966 (= e!194581 e!194580)))

(declare-fun res!168414 () Bool)

(assert (=> b!311966 (=> (not res!168414) (not e!194580))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311966 (= res!168414 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!152643))))

(assert (=> b!311966 (= lt!152643 (Intermediate!2687 false resIndex!52 resX!52))))

(assert (= (and start!31028 res!168411) b!311961))

(assert (= (and b!311961 res!168420) b!311965))

(assert (= (and b!311965 res!168413) b!311964))

(assert (= (and b!311964 res!168412) b!311962))

(assert (= (and b!311962 res!168419) b!311963))

(assert (= (and b!311963 res!168416) b!311966))

(assert (= (and b!311966 res!168414) b!311960))

(assert (= (and b!311960 res!168418) b!311959))

(assert (= (and b!311959 res!168415) b!311957))

(assert (= (and b!311957 (not res!168417)) b!311958))

(declare-fun m!321977 () Bool)

(assert (=> b!311960 m!321977))

(declare-fun m!321979 () Bool)

(assert (=> b!311959 m!321979))

(declare-fun m!321981 () Bool)

(assert (=> b!311959 m!321981))

(declare-fun m!321983 () Bool)

(assert (=> start!31028 m!321983))

(declare-fun m!321985 () Bool)

(assert (=> start!31028 m!321985))

(declare-fun m!321987 () Bool)

(assert (=> b!311962 m!321987))

(declare-fun m!321989 () Bool)

(assert (=> b!311966 m!321989))

(assert (=> b!311966 m!321989))

(declare-fun m!321991 () Bool)

(assert (=> b!311966 m!321991))

(declare-fun m!321993 () Bool)

(assert (=> b!311965 m!321993))

(declare-fun m!321995 () Bool)

(assert (=> b!311963 m!321995))

(declare-fun m!321997 () Bool)

(assert (=> b!311957 m!321997))

(declare-fun m!321999 () Bool)

(assert (=> b!311957 m!321999))

(declare-fun m!322001 () Bool)

(assert (=> b!311957 m!322001))

(declare-fun m!322003 () Bool)

(assert (=> b!311957 m!322003))

(declare-fun m!322005 () Bool)

(assert (=> b!311957 m!322005))

(declare-fun m!322007 () Bool)

(assert (=> b!311958 m!322007))

(declare-fun m!322009 () Bool)

(assert (=> b!311964 m!322009))

(push 1)

