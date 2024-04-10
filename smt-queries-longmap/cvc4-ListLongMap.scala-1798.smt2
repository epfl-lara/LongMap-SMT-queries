; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32492 () Bool)

(assert start!32492)

(declare-fun res!178171 () Bool)

(declare-fun e!200398 () Bool)

(assert (=> start!32492 (=> (not res!178171) (not e!200398))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32492 (= res!178171 (validMask!0 mask!3777))))

(assert (=> start!32492 e!200398))

(declare-datatypes ((array!16631 0))(
  ( (array!16632 (arr!7873 (Array (_ BitVec 32) (_ BitVec 64))) (size!8225 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16631)

(declare-fun array_inv!5836 (array!16631) Bool)

(assert (=> start!32492 (array_inv!5836 a!3305)))

(assert (=> start!32492 true))

(declare-fun b!324833 () Bool)

(declare-fun res!178164 () Bool)

(declare-fun e!200397 () Bool)

(assert (=> b!324833 (=> (not res!178164) (not e!200397))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!324833 (= res!178164 (and (= (select (arr!7873 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8225 a!3305))))))

(declare-fun b!324834 () Bool)

(declare-fun res!178165 () Bool)

(assert (=> b!324834 (=> (not res!178165) (not e!200398))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16631 (_ BitVec 32)) Bool)

(assert (=> b!324834 (= res!178165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324835 () Bool)

(declare-fun res!178173 () Bool)

(assert (=> b!324835 (=> (not res!178173) (not e!200398))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3004 0))(
  ( (MissingZero!3004 (index!14192 (_ BitVec 32))) (Found!3004 (index!14193 (_ BitVec 32))) (Intermediate!3004 (undefined!3816 Bool) (index!14194 (_ BitVec 32)) (x!32432 (_ BitVec 32))) (Undefined!3004) (MissingVacant!3004 (index!14195 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16631 (_ BitVec 32)) SeekEntryResult!3004)

(assert (=> b!324835 (= res!178173 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3004 i!1250)))))

(declare-fun b!324836 () Bool)

(declare-fun res!178169 () Bool)

(assert (=> b!324836 (=> (not res!178169) (not e!200397))))

(declare-fun lt!156882 () SeekEntryResult!3004)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16631 (_ BitVec 32)) SeekEntryResult!3004)

(assert (=> b!324836 (= res!178169 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156882))))

(declare-fun b!324837 () Bool)

(declare-fun res!178166 () Bool)

(assert (=> b!324837 (=> (not res!178166) (not e!200398))))

(declare-fun arrayContainsKey!0 (array!16631 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324837 (= res!178166 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324838 () Bool)

(assert (=> b!324838 (= e!200397 false)))

(declare-fun lt!156881 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324838 (= lt!156881 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!324839 () Bool)

(declare-fun res!178172 () Bool)

(assert (=> b!324839 (=> (not res!178172) (not e!200398))))

(assert (=> b!324839 (= res!178172 (and (= (size!8225 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8225 a!3305))))))

(declare-fun b!324840 () Bool)

(assert (=> b!324840 (= e!200398 e!200397)))

(declare-fun res!178167 () Bool)

(assert (=> b!324840 (=> (not res!178167) (not e!200397))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324840 (= res!178167 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156882))))

(assert (=> b!324840 (= lt!156882 (Intermediate!3004 false resIndex!58 resX!58))))

(declare-fun b!324841 () Bool)

(declare-fun res!178170 () Bool)

(assert (=> b!324841 (=> (not res!178170) (not e!200398))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324841 (= res!178170 (validKeyInArray!0 k!2497))))

(declare-fun b!324842 () Bool)

(declare-fun res!178168 () Bool)

(assert (=> b!324842 (=> (not res!178168) (not e!200397))))

(assert (=> b!324842 (= res!178168 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7873 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(assert (= (and start!32492 res!178171) b!324839))

(assert (= (and b!324839 res!178172) b!324841))

(assert (= (and b!324841 res!178170) b!324837))

(assert (= (and b!324837 res!178166) b!324835))

(assert (= (and b!324835 res!178173) b!324834))

(assert (= (and b!324834 res!178165) b!324840))

(assert (= (and b!324840 res!178167) b!324833))

(assert (= (and b!324833 res!178164) b!324836))

(assert (= (and b!324836 res!178169) b!324842))

(assert (= (and b!324842 res!178168) b!324838))

(declare-fun m!331799 () Bool)

(assert (=> b!324835 m!331799))

(declare-fun m!331801 () Bool)

(assert (=> b!324841 m!331801))

(declare-fun m!331803 () Bool)

(assert (=> b!324837 m!331803))

(declare-fun m!331805 () Bool)

(assert (=> start!32492 m!331805))

(declare-fun m!331807 () Bool)

(assert (=> start!32492 m!331807))

(declare-fun m!331809 () Bool)

(assert (=> b!324842 m!331809))

(declare-fun m!331811 () Bool)

(assert (=> b!324834 m!331811))

(declare-fun m!331813 () Bool)

(assert (=> b!324836 m!331813))

(declare-fun m!331815 () Bool)

(assert (=> b!324833 m!331815))

(declare-fun m!331817 () Bool)

(assert (=> b!324838 m!331817))

(declare-fun m!331819 () Bool)

(assert (=> b!324840 m!331819))

(assert (=> b!324840 m!331819))

(declare-fun m!331821 () Bool)

(assert (=> b!324840 m!331821))

(push 1)

