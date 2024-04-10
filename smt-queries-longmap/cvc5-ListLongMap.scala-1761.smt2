; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32212 () Bool)

(assert start!32212)

(declare-fun b!320746 () Bool)

(declare-fun e!198967 () Bool)

(assert (=> b!320746 (= e!198967 false)))

(declare-datatypes ((array!16402 0))(
  ( (array!16403 (arr!7760 (Array (_ BitVec 32) (_ BitVec 64))) (size!8112 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16402)

(declare-fun index!1840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2891 0))(
  ( (MissingZero!2891 (index!13740 (_ BitVec 32))) (Found!2891 (index!13741 (_ BitVec 32))) (Intermediate!2891 (undefined!3703 Bool) (index!13742 (_ BitVec 32)) (x!32014 (_ BitVec 32))) (Undefined!2891) (MissingVacant!2891 (index!13743 (_ BitVec 32))) )
))
(declare-fun lt!156114 () SeekEntryResult!2891)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16402 (_ BitVec 32)) SeekEntryResult!2891)

(assert (=> b!320746 (= lt!156114 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777))))

(declare-fun b!320747 () Bool)

(declare-fun res!174871 () Bool)

(assert (=> b!320747 (=> (not res!174871) (not e!198967))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320747 (= res!174871 (validKeyInArray!0 k!2497))))

(declare-fun b!320748 () Bool)

(declare-fun res!174866 () Bool)

(assert (=> b!320748 (=> (not res!174866) (not e!198967))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16402 (_ BitVec 32)) SeekEntryResult!2891)

(assert (=> b!320748 (= res!174866 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2891 i!1250)))))

(declare-fun res!174868 () Bool)

(assert (=> start!32212 (=> (not res!174868) (not e!198967))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32212 (= res!174868 (validMask!0 mask!3777))))

(assert (=> start!32212 e!198967))

(declare-fun array_inv!5723 (array!16402) Bool)

(assert (=> start!32212 (array_inv!5723 a!3305)))

(assert (=> start!32212 true))

(declare-fun b!320749 () Bool)

(declare-fun res!174867 () Bool)

(assert (=> b!320749 (=> (not res!174867) (not e!198967))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!320749 (= res!174867 (and (= (select (arr!7760 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8112 a!3305))))))

(declare-fun b!320750 () Bool)

(declare-fun res!174872 () Bool)

(assert (=> b!320750 (=> (not res!174872) (not e!198967))))

(declare-fun arrayContainsKey!0 (array!16402 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320750 (= res!174872 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320751 () Bool)

(declare-fun res!174873 () Bool)

(assert (=> b!320751 (=> (not res!174873) (not e!198967))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320751 (= res!174873 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) (Intermediate!2891 false resIndex!58 resX!58)))))

(declare-fun b!320752 () Bool)

(declare-fun res!174869 () Bool)

(assert (=> b!320752 (=> (not res!174869) (not e!198967))))

(assert (=> b!320752 (= res!174869 (and (= (size!8112 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8112 a!3305))))))

(declare-fun b!320753 () Bool)

(declare-fun res!174870 () Bool)

(assert (=> b!320753 (=> (not res!174870) (not e!198967))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16402 (_ BitVec 32)) Bool)

(assert (=> b!320753 (= res!174870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32212 res!174868) b!320752))

(assert (= (and b!320752 res!174869) b!320747))

(assert (= (and b!320747 res!174871) b!320750))

(assert (= (and b!320750 res!174872) b!320748))

(assert (= (and b!320748 res!174866) b!320753))

(assert (= (and b!320753 res!174870) b!320751))

(assert (= (and b!320751 res!174873) b!320749))

(assert (= (and b!320749 res!174867) b!320746))

(declare-fun m!329015 () Bool)

(assert (=> b!320747 m!329015))

(declare-fun m!329017 () Bool)

(assert (=> b!320753 m!329017))

(declare-fun m!329019 () Bool)

(assert (=> b!320751 m!329019))

(assert (=> b!320751 m!329019))

(declare-fun m!329021 () Bool)

(assert (=> b!320751 m!329021))

(declare-fun m!329023 () Bool)

(assert (=> b!320748 m!329023))

(declare-fun m!329025 () Bool)

(assert (=> b!320749 m!329025))

(declare-fun m!329027 () Bool)

(assert (=> b!320750 m!329027))

(declare-fun m!329029 () Bool)

(assert (=> b!320746 m!329029))

(declare-fun m!329031 () Bool)

(assert (=> start!32212 m!329031))

(declare-fun m!329033 () Bool)

(assert (=> start!32212 m!329033))

(push 1)

(assert (not b!320746))

(assert (not b!320751))

(assert (not b!320750))

(assert (not b!320753))

(assert (not start!32212))

(assert (not b!320748))

(assert (not b!320747))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

