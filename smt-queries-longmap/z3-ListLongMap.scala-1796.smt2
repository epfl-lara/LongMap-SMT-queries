; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32462 () Bool)

(assert start!32462)

(declare-fun b!324318 () Bool)

(declare-fun res!177801 () Bool)

(declare-fun e!200149 () Bool)

(assert (=> b!324318 (=> (not res!177801) (not e!200149))))

(declare-datatypes ((array!16605 0))(
  ( (array!16606 (arr!7860 (Array (_ BitVec 32) (_ BitVec 64))) (size!8213 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16605)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16605 (_ BitVec 32)) Bool)

(assert (=> b!324318 (= res!177801 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324319 () Bool)

(declare-fun res!177804 () Bool)

(assert (=> b!324319 (=> (not res!177804) (not e!200149))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!324319 (= res!177804 (and (= (size!8213 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8213 a!3305))))))

(declare-fun b!324320 () Bool)

(declare-fun e!200148 () Bool)

(assert (=> b!324320 (= e!200148 false)))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun lt!156599 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324320 (= lt!156599 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!324321 () Bool)

(declare-fun res!177795 () Bool)

(assert (=> b!324321 (=> (not res!177795) (not e!200149))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2990 0))(
  ( (MissingZero!2990 (index!14136 (_ BitVec 32))) (Found!2990 (index!14137 (_ BitVec 32))) (Intermediate!2990 (undefined!3802 Bool) (index!14138 (_ BitVec 32)) (x!32397 (_ BitVec 32))) (Undefined!2990) (MissingVacant!2990 (index!14139 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16605 (_ BitVec 32)) SeekEntryResult!2990)

(assert (=> b!324321 (= res!177795 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2990 i!1250)))))

(declare-fun b!324322 () Bool)

(declare-fun res!177796 () Bool)

(assert (=> b!324322 (=> (not res!177796) (not e!200148))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!324322 (= res!177796 (and (= (select (arr!7860 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8213 a!3305))))))

(declare-fun b!324324 () Bool)

(declare-fun res!177800 () Bool)

(assert (=> b!324324 (=> (not res!177800) (not e!200149))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324324 (= res!177800 (validKeyInArray!0 k0!2497))))

(declare-fun b!324325 () Bool)

(declare-fun res!177802 () Bool)

(assert (=> b!324325 (=> (not res!177802) (not e!200148))))

(assert (=> b!324325 (= res!177802 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7860 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun res!177797 () Bool)

(assert (=> start!32462 (=> (not res!177797) (not e!200149))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32462 (= res!177797 (validMask!0 mask!3777))))

(assert (=> start!32462 e!200149))

(declare-fun array_inv!5832 (array!16605) Bool)

(assert (=> start!32462 (array_inv!5832 a!3305)))

(assert (=> start!32462 true))

(declare-fun b!324323 () Bool)

(assert (=> b!324323 (= e!200149 e!200148)))

(declare-fun res!177798 () Bool)

(assert (=> b!324323 (=> (not res!177798) (not e!200148))))

(declare-fun lt!156598 () SeekEntryResult!2990)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16605 (_ BitVec 32)) SeekEntryResult!2990)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324323 (= res!177798 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156598))))

(assert (=> b!324323 (= lt!156598 (Intermediate!2990 false resIndex!58 resX!58))))

(declare-fun b!324326 () Bool)

(declare-fun res!177803 () Bool)

(assert (=> b!324326 (=> (not res!177803) (not e!200149))))

(declare-fun arrayContainsKey!0 (array!16605 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324326 (= res!177803 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324327 () Bool)

(declare-fun res!177799 () Bool)

(assert (=> b!324327 (=> (not res!177799) (not e!200148))))

(assert (=> b!324327 (= res!177799 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156598))))

(assert (= (and start!32462 res!177797) b!324319))

(assert (= (and b!324319 res!177804) b!324324))

(assert (= (and b!324324 res!177800) b!324326))

(assert (= (and b!324326 res!177803) b!324321))

(assert (= (and b!324321 res!177795) b!324318))

(assert (= (and b!324318 res!177801) b!324323))

(assert (= (and b!324323 res!177798) b!324322))

(assert (= (and b!324322 res!177796) b!324327))

(assert (= (and b!324327 res!177799) b!324325))

(assert (= (and b!324325 res!177802) b!324320))

(declare-fun m!330877 () Bool)

(assert (=> b!324324 m!330877))

(declare-fun m!330879 () Bool)

(assert (=> b!324320 m!330879))

(declare-fun m!330881 () Bool)

(assert (=> b!324323 m!330881))

(assert (=> b!324323 m!330881))

(declare-fun m!330883 () Bool)

(assert (=> b!324323 m!330883))

(declare-fun m!330885 () Bool)

(assert (=> b!324325 m!330885))

(declare-fun m!330887 () Bool)

(assert (=> b!324322 m!330887))

(declare-fun m!330889 () Bool)

(assert (=> b!324326 m!330889))

(declare-fun m!330891 () Bool)

(assert (=> b!324321 m!330891))

(declare-fun m!330893 () Bool)

(assert (=> start!32462 m!330893))

(declare-fun m!330895 () Bool)

(assert (=> start!32462 m!330895))

(declare-fun m!330897 () Bool)

(assert (=> b!324318 m!330897))

(declare-fun m!330899 () Bool)

(assert (=> b!324327 m!330899))

(check-sat (not b!324326) (not b!324323) (not b!324318) (not b!324321) (not b!324320) (not b!324324) (not start!32462) (not b!324327))
(check-sat)
