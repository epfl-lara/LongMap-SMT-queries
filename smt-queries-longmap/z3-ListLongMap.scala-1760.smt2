; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32208 () Bool)

(assert start!32208)

(declare-fun b!320706 () Bool)

(declare-fun res!174827 () Bool)

(declare-fun e!198954 () Bool)

(assert (=> b!320706 (=> (not res!174827) (not e!198954))))

(declare-datatypes ((array!16398 0))(
  ( (array!16399 (arr!7758 (Array (_ BitVec 32) (_ BitVec 64))) (size!8110 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16398)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16398 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320706 (= res!174827 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320707 () Bool)

(declare-fun res!174830 () Bool)

(assert (=> b!320707 (=> (not res!174830) (not e!198954))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2889 0))(
  ( (MissingZero!2889 (index!13732 (_ BitVec 32))) (Found!2889 (index!13733 (_ BitVec 32))) (Intermediate!2889 (undefined!3701 Bool) (index!13734 (_ BitVec 32)) (x!32004 (_ BitVec 32))) (Undefined!2889) (MissingVacant!2889 (index!13735 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16398 (_ BitVec 32)) SeekEntryResult!2889)

(assert (=> b!320707 (= res!174830 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2889 i!1250)))))

(declare-fun b!320708 () Bool)

(declare-fun res!174826 () Bool)

(assert (=> b!320708 (=> (not res!174826) (not e!198954))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16398 (_ BitVec 32)) Bool)

(assert (=> b!320708 (= res!174826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!174831 () Bool)

(assert (=> start!32208 (=> (not res!174831) (not e!198954))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32208 (= res!174831 (validMask!0 mask!3777))))

(assert (=> start!32208 e!198954))

(assert (=> start!32208 true))

(declare-fun array_inv!5721 (array!16398) Bool)

(assert (=> start!32208 (array_inv!5721 a!3305)))

(declare-fun b!320709 () Bool)

(declare-fun res!174828 () Bool)

(assert (=> b!320709 (=> (not res!174828) (not e!198954))))

(assert (=> b!320709 (= res!174828 (and (= (size!8110 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8110 a!3305))))))

(declare-fun b!320710 () Bool)

(declare-fun res!174829 () Bool)

(assert (=> b!320710 (=> (not res!174829) (not e!198954))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320710 (= res!174829 (validKeyInArray!0 k0!2497))))

(declare-fun b!320711 () Bool)

(assert (=> b!320711 (= e!198954 false)))

(declare-fun lt!156108 () SeekEntryResult!2889)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16398 (_ BitVec 32)) SeekEntryResult!2889)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320711 (= lt!156108 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (= (and start!32208 res!174831) b!320709))

(assert (= (and b!320709 res!174828) b!320710))

(assert (= (and b!320710 res!174829) b!320706))

(assert (= (and b!320706 res!174827) b!320707))

(assert (= (and b!320707 res!174830) b!320708))

(assert (= (and b!320708 res!174826) b!320711))

(declare-fun m!328983 () Bool)

(assert (=> b!320706 m!328983))

(declare-fun m!328985 () Bool)

(assert (=> start!32208 m!328985))

(declare-fun m!328987 () Bool)

(assert (=> start!32208 m!328987))

(declare-fun m!328989 () Bool)

(assert (=> b!320708 m!328989))

(declare-fun m!328991 () Bool)

(assert (=> b!320711 m!328991))

(assert (=> b!320711 m!328991))

(declare-fun m!328993 () Bool)

(assert (=> b!320711 m!328993))

(declare-fun m!328995 () Bool)

(assert (=> b!320707 m!328995))

(declare-fun m!328997 () Bool)

(assert (=> b!320710 m!328997))

(check-sat (not b!320710) (not b!320707) (not b!320706) (not start!32208) (not b!320711) (not b!320708))
(check-sat)
