; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32476 () Bool)

(assert start!32476)

(declare-fun b!324593 () Bool)

(declare-fun res!177925 () Bool)

(declare-fun e!200326 () Bool)

(assert (=> b!324593 (=> (not res!177925) (not e!200326))))

(declare-datatypes ((array!16615 0))(
  ( (array!16616 (arr!7865 (Array (_ BitVec 32) (_ BitVec 64))) (size!8217 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16615)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16615 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324593 (= res!177925 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324594 () Bool)

(declare-fun e!200324 () Bool)

(assert (=> b!324594 (= e!200324 false)))

(declare-fun lt!156834 () (_ BitVec 32))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324594 (= lt!156834 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!324595 () Bool)

(declare-fun res!177928 () Bool)

(assert (=> b!324595 (=> (not res!177928) (not e!200324))))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!324595 (= res!177928 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7865 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!324596 () Bool)

(assert (=> b!324596 (= e!200326 e!200324)))

(declare-fun res!177929 () Bool)

(assert (=> b!324596 (=> (not res!177929) (not e!200324))))

(declare-datatypes ((SeekEntryResult!2996 0))(
  ( (MissingZero!2996 (index!14160 (_ BitVec 32))) (Found!2996 (index!14161 (_ BitVec 32))) (Intermediate!2996 (undefined!3808 Bool) (index!14162 (_ BitVec 32)) (x!32408 (_ BitVec 32))) (Undefined!2996) (MissingVacant!2996 (index!14163 (_ BitVec 32))) )
))
(declare-fun lt!156833 () SeekEntryResult!2996)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16615 (_ BitVec 32)) SeekEntryResult!2996)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324596 (= res!177929 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156833))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!324596 (= lt!156833 (Intermediate!2996 false resIndex!58 resX!58))))

(declare-fun res!177933 () Bool)

(assert (=> start!32476 (=> (not res!177933) (not e!200326))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32476 (= res!177933 (validMask!0 mask!3777))))

(assert (=> start!32476 e!200326))

(declare-fun array_inv!5828 (array!16615) Bool)

(assert (=> start!32476 (array_inv!5828 a!3305)))

(assert (=> start!32476 true))

(declare-fun b!324597 () Bool)

(declare-fun res!177926 () Bool)

(assert (=> b!324597 (=> (not res!177926) (not e!200326))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!324597 (= res!177926 (and (= (size!8217 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8217 a!3305))))))

(declare-fun b!324598 () Bool)

(declare-fun res!177932 () Bool)

(assert (=> b!324598 (=> (not res!177932) (not e!200324))))

(assert (=> b!324598 (= res!177932 (and (= (select (arr!7865 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8217 a!3305))))))

(declare-fun b!324599 () Bool)

(declare-fun res!177924 () Bool)

(assert (=> b!324599 (=> (not res!177924) (not e!200326))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16615 (_ BitVec 32)) SeekEntryResult!2996)

(assert (=> b!324599 (= res!177924 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2996 i!1250)))))

(declare-fun b!324600 () Bool)

(declare-fun res!177927 () Bool)

(assert (=> b!324600 (=> (not res!177927) (not e!200326))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16615 (_ BitVec 32)) Bool)

(assert (=> b!324600 (= res!177927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324601 () Bool)

(declare-fun res!177930 () Bool)

(assert (=> b!324601 (=> (not res!177930) (not e!200326))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324601 (= res!177930 (validKeyInArray!0 k!2497))))

(declare-fun b!324602 () Bool)

(declare-fun res!177931 () Bool)

(assert (=> b!324602 (=> (not res!177931) (not e!200324))))

(assert (=> b!324602 (= res!177931 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156833))))

(assert (= (and start!32476 res!177933) b!324597))

(assert (= (and b!324597 res!177926) b!324601))

(assert (= (and b!324601 res!177930) b!324593))

(assert (= (and b!324593 res!177925) b!324599))

(assert (= (and b!324599 res!177924) b!324600))

(assert (= (and b!324600 res!177927) b!324596))

(assert (= (and b!324596 res!177929) b!324598))

(assert (= (and b!324598 res!177932) b!324602))

(assert (= (and b!324602 res!177931) b!324595))

(assert (= (and b!324595 res!177928) b!324594))

(declare-fun m!331607 () Bool)

(assert (=> b!324600 m!331607))

(declare-fun m!331609 () Bool)

(assert (=> b!324596 m!331609))

(assert (=> b!324596 m!331609))

(declare-fun m!331611 () Bool)

(assert (=> b!324596 m!331611))

(declare-fun m!331613 () Bool)

(assert (=> b!324602 m!331613))

(declare-fun m!331615 () Bool)

(assert (=> b!324598 m!331615))

(declare-fun m!331617 () Bool)

(assert (=> b!324594 m!331617))

(declare-fun m!331619 () Bool)

(assert (=> b!324601 m!331619))

(declare-fun m!331621 () Bool)

(assert (=> b!324595 m!331621))

(declare-fun m!331623 () Bool)

(assert (=> b!324599 m!331623))

(declare-fun m!331625 () Bool)

(assert (=> b!324593 m!331625))

(declare-fun m!331627 () Bool)

(assert (=> start!32476 m!331627))

(declare-fun m!331629 () Bool)

(assert (=> start!32476 m!331629))

(push 1)

