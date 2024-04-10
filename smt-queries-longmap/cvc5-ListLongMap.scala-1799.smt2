; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32494 () Bool)

(assert start!32494)

(declare-fun b!324863 () Bool)

(declare-fun e!200406 () Bool)

(declare-fun e!200407 () Bool)

(assert (=> b!324863 (= e!200406 e!200407)))

(declare-fun res!178202 () Bool)

(assert (=> b!324863 (=> (not res!178202) (not e!200407))))

(declare-datatypes ((array!16633 0))(
  ( (array!16634 (arr!7874 (Array (_ BitVec 32) (_ BitVec 64))) (size!8226 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16633)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3005 0))(
  ( (MissingZero!3005 (index!14196 (_ BitVec 32))) (Found!3005 (index!14197 (_ BitVec 32))) (Intermediate!3005 (undefined!3817 Bool) (index!14198 (_ BitVec 32)) (x!32441 (_ BitVec 32))) (Undefined!3005) (MissingVacant!3005 (index!14199 (_ BitVec 32))) )
))
(declare-fun lt!156887 () SeekEntryResult!3005)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16633 (_ BitVec 32)) SeekEntryResult!3005)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324863 (= res!178202 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156887))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!324863 (= lt!156887 (Intermediate!3005 false resIndex!58 resX!58))))

(declare-fun b!324864 () Bool)

(declare-fun res!178196 () Bool)

(assert (=> b!324864 (=> (not res!178196) (not e!200406))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16633 (_ BitVec 32)) SeekEntryResult!3005)

(assert (=> b!324864 (= res!178196 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3005 i!1250)))))

(declare-fun b!324865 () Bool)

(declare-fun res!178194 () Bool)

(assert (=> b!324865 (=> (not res!178194) (not e!200406))))

(declare-fun arrayContainsKey!0 (array!16633 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324865 (= res!178194 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324866 () Bool)

(declare-fun res!178200 () Bool)

(assert (=> b!324866 (=> (not res!178200) (not e!200407))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!324866 (= res!178200 (and (= (select (arr!7874 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8226 a!3305))))))

(declare-fun b!324868 () Bool)

(declare-fun res!178201 () Bool)

(assert (=> b!324868 (=> (not res!178201) (not e!200407))))

(assert (=> b!324868 (= res!178201 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7874 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!324869 () Bool)

(declare-fun res!178203 () Bool)

(assert (=> b!324869 (=> (not res!178203) (not e!200406))))

(assert (=> b!324869 (= res!178203 (and (= (size!8226 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8226 a!3305))))))

(declare-fun b!324870 () Bool)

(declare-fun res!178195 () Bool)

(assert (=> b!324870 (=> (not res!178195) (not e!200406))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16633 (_ BitVec 32)) Bool)

(assert (=> b!324870 (= res!178195 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324871 () Bool)

(declare-fun res!178197 () Bool)

(assert (=> b!324871 (=> (not res!178197) (not e!200407))))

(assert (=> b!324871 (= res!178197 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156887))))

(declare-fun b!324872 () Bool)

(assert (=> b!324872 (= e!200407 false)))

(declare-fun lt!156888 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324872 (= lt!156888 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun res!178199 () Bool)

(assert (=> start!32494 (=> (not res!178199) (not e!200406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32494 (= res!178199 (validMask!0 mask!3777))))

(assert (=> start!32494 e!200406))

(declare-fun array_inv!5837 (array!16633) Bool)

(assert (=> start!32494 (array_inv!5837 a!3305)))

(assert (=> start!32494 true))

(declare-fun b!324867 () Bool)

(declare-fun res!178198 () Bool)

(assert (=> b!324867 (=> (not res!178198) (not e!200406))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324867 (= res!178198 (validKeyInArray!0 k!2497))))

(assert (= (and start!32494 res!178199) b!324869))

(assert (= (and b!324869 res!178203) b!324867))

(assert (= (and b!324867 res!178198) b!324865))

(assert (= (and b!324865 res!178194) b!324864))

(assert (= (and b!324864 res!178196) b!324870))

(assert (= (and b!324870 res!178195) b!324863))

(assert (= (and b!324863 res!178202) b!324866))

(assert (= (and b!324866 res!178200) b!324871))

(assert (= (and b!324871 res!178197) b!324868))

(assert (= (and b!324868 res!178201) b!324872))

(declare-fun m!331823 () Bool)

(assert (=> b!324868 m!331823))

(declare-fun m!331825 () Bool)

(assert (=> start!32494 m!331825))

(declare-fun m!331827 () Bool)

(assert (=> start!32494 m!331827))

(declare-fun m!331829 () Bool)

(assert (=> b!324866 m!331829))

(declare-fun m!331831 () Bool)

(assert (=> b!324867 m!331831))

(declare-fun m!331833 () Bool)

(assert (=> b!324864 m!331833))

(declare-fun m!331835 () Bool)

(assert (=> b!324870 m!331835))

(declare-fun m!331837 () Bool)

(assert (=> b!324863 m!331837))

(assert (=> b!324863 m!331837))

(declare-fun m!331839 () Bool)

(assert (=> b!324863 m!331839))

(declare-fun m!331841 () Bool)

(assert (=> b!324871 m!331841))

(declare-fun m!331843 () Bool)

(assert (=> b!324865 m!331843))

(declare-fun m!331845 () Bool)

(assert (=> b!324872 m!331845))

(push 1)

