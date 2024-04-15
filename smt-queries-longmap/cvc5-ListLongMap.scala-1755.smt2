; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32118 () Bool)

(assert start!32118)

(declare-fun b!319963 () Bool)

(declare-fun res!174354 () Bool)

(declare-fun e!198577 () Bool)

(assert (=> b!319963 (=> (not res!174354) (not e!198577))))

(declare-datatypes ((array!16357 0))(
  ( (array!16358 (arr!7739 (Array (_ BitVec 32) (_ BitVec 64))) (size!8092 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16357)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16357 (_ BitVec 32)) Bool)

(assert (=> b!319963 (= res!174354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!319964 () Bool)

(declare-fun res!174355 () Bool)

(assert (=> b!319964 (=> (not res!174355) (not e!198577))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16357 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319964 (= res!174355 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!319965 () Bool)

(declare-fun res!174357 () Bool)

(assert (=> b!319965 (=> (not res!174357) (not e!198577))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319965 (= res!174357 (and (= (size!8092 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8092 a!3305))))))

(declare-fun b!319967 () Bool)

(declare-fun res!174356 () Bool)

(assert (=> b!319967 (=> (not res!174356) (not e!198577))))

(declare-datatypes ((SeekEntryResult!2869 0))(
  ( (MissingZero!2869 (index!13652 (_ BitVec 32))) (Found!2869 (index!13653 (_ BitVec 32))) (Intermediate!2869 (undefined!3681 Bool) (index!13654 (_ BitVec 32)) (x!31933 (_ BitVec 32))) (Undefined!2869) (MissingVacant!2869 (index!13655 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16357 (_ BitVec 32)) SeekEntryResult!2869)

(assert (=> b!319967 (= res!174356 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2869 i!1250)))))

(declare-fun b!319968 () Bool)

(assert (=> b!319968 (= e!198577 false)))

(declare-fun lt!155768 () SeekEntryResult!2869)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16357 (_ BitVec 32)) SeekEntryResult!2869)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319968 (= lt!155768 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!319966 () Bool)

(declare-fun res!174352 () Bool)

(assert (=> b!319966 (=> (not res!174352) (not e!198577))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319966 (= res!174352 (validKeyInArray!0 k!2497))))

(declare-fun res!174353 () Bool)

(assert (=> start!32118 (=> (not res!174353) (not e!198577))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32118 (= res!174353 (validMask!0 mask!3777))))

(assert (=> start!32118 e!198577))

(assert (=> start!32118 true))

(declare-fun array_inv!5711 (array!16357) Bool)

(assert (=> start!32118 (array_inv!5711 a!3305)))

(assert (= (and start!32118 res!174353) b!319965))

(assert (= (and b!319965 res!174357) b!319966))

(assert (= (and b!319966 res!174352) b!319964))

(assert (= (and b!319964 res!174355) b!319967))

(assert (= (and b!319967 res!174356) b!319963))

(assert (= (and b!319963 res!174354) b!319968))

(declare-fun m!327915 () Bool)

(assert (=> b!319966 m!327915))

(declare-fun m!327917 () Bool)

(assert (=> b!319963 m!327917))

(declare-fun m!327919 () Bool)

(assert (=> b!319967 m!327919))

(declare-fun m!327921 () Bool)

(assert (=> start!32118 m!327921))

(declare-fun m!327923 () Bool)

(assert (=> start!32118 m!327923))

(declare-fun m!327925 () Bool)

(assert (=> b!319968 m!327925))

(assert (=> b!319968 m!327925))

(declare-fun m!327927 () Bool)

(assert (=> b!319968 m!327927))

(declare-fun m!327929 () Bool)

(assert (=> b!319964 m!327929))

(push 1)

(assert (not b!319964))

(assert (not b!319963))

(assert (not b!319968))

(assert (not b!319966))

(assert (not b!319967))

(assert (not start!32118))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

