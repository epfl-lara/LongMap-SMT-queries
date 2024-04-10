; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32398 () Bool)

(assert start!32398)

(declare-fun b!323156 () Bool)

(declare-fun res!176800 () Bool)

(declare-fun e!199831 () Bool)

(assert (=> b!323156 (=> (not res!176800) (not e!199831))))

(declare-datatypes ((array!16537 0))(
  ( (array!16538 (arr!7826 (Array (_ BitVec 32) (_ BitVec 64))) (size!8178 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16537)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16537 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!323156 (= res!176800 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!323157 () Bool)

(declare-datatypes ((Unit!9962 0))(
  ( (Unit!9963) )
))
(declare-fun e!199830 () Unit!9962)

(declare-fun Unit!9964 () Unit!9962)

(assert (=> b!323157 (= e!199830 Unit!9964)))

(declare-fun b!323158 () Bool)

(assert (=> b!323158 false))

(declare-fun lt!156583 () Unit!9962)

(assert (=> b!323158 (= lt!156583 e!199830)))

(declare-fun c!50806 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2957 0))(
  ( (MissingZero!2957 (index!14004 (_ BitVec 32))) (Found!2957 (index!14005 (_ BitVec 32))) (Intermediate!2957 (undefined!3769 Bool) (index!14006 (_ BitVec 32)) (x!32265 (_ BitVec 32))) (Undefined!2957) (MissingVacant!2957 (index!14007 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16537 (_ BitVec 32)) SeekEntryResult!2957)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323158 (= c!50806 (is-Intermediate!2957 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777)))))

(declare-fun e!199827 () Unit!9962)

(declare-fun Unit!9965 () Unit!9962)

(assert (=> b!323158 (= e!199827 Unit!9965)))

(declare-fun b!323159 () Bool)

(declare-fun e!199828 () Unit!9962)

(assert (=> b!323159 (= e!199828 e!199827)))

(declare-fun c!50807 () Bool)

(assert (=> b!323159 (= c!50807 (or (= (select (arr!7826 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7826 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!323160 () Bool)

(declare-fun res!176808 () Bool)

(declare-fun e!199826 () Bool)

(assert (=> b!323160 (=> (not res!176808) (not e!199826))))

(declare-fun lt!156584 () SeekEntryResult!2957)

(assert (=> b!323160 (= res!176808 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156584))))

(declare-fun b!323161 () Bool)

(declare-fun res!176805 () Bool)

(assert (=> b!323161 (=> (not res!176805) (not e!199826))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!323161 (= res!176805 (and (= (select (arr!7826 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8178 a!3305))))))

(declare-fun b!323162 () Bool)

(assert (=> b!323162 (= e!199831 e!199826)))

(declare-fun res!176804 () Bool)

(assert (=> b!323162 (=> (not res!176804) (not e!199826))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323162 (= res!176804 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156584))))

(assert (=> b!323162 (= lt!156584 (Intermediate!2957 false resIndex!58 resX!58))))

(declare-fun b!323164 () Bool)

(declare-fun res!176806 () Bool)

(assert (=> b!323164 (=> (not res!176806) (not e!199831))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16537 (_ BitVec 32)) SeekEntryResult!2957)

(assert (=> b!323164 (= res!176806 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2957 i!1250)))))

(declare-fun b!323165 () Bool)

(declare-fun res!176801 () Bool)

(assert (=> b!323165 (=> (not res!176801) (not e!199826))))

(assert (=> b!323165 (= res!176801 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7826 a!3305) index!1840) k!2497)) (= x!1490 resX!58)))))

(declare-fun b!323166 () Bool)

(declare-fun Unit!9966 () Unit!9962)

(assert (=> b!323166 (= e!199830 Unit!9966)))

(assert (=> b!323166 false))

(declare-fun b!323167 () Bool)

(assert (=> b!323167 (= e!199826 (not true))))

(assert (=> b!323167 (= index!1840 resIndex!58)))

(declare-fun lt!156585 () Unit!9962)

(assert (=> b!323167 (= lt!156585 e!199828)))

(declare-fun c!50808 () Bool)

(assert (=> b!323167 (= c!50808 (not (= resIndex!58 index!1840)))))

(declare-fun b!323168 () Bool)

(declare-fun res!176803 () Bool)

(assert (=> b!323168 (=> (not res!176803) (not e!199831))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!323168 (= res!176803 (validKeyInArray!0 k!2497))))

(declare-fun b!323169 () Bool)

(declare-fun res!176802 () Bool)

(assert (=> b!323169 (=> (not res!176802) (not e!199831))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16537 (_ BitVec 32)) Bool)

(assert (=> b!323169 (= res!176802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!176799 () Bool)

(assert (=> start!32398 (=> (not res!176799) (not e!199831))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32398 (= res!176799 (validMask!0 mask!3777))))

(assert (=> start!32398 e!199831))

(declare-fun array_inv!5789 (array!16537) Bool)

(assert (=> start!32398 (array_inv!5789 a!3305)))

(assert (=> start!32398 true))

(declare-fun b!323163 () Bool)

(declare-fun Unit!9967 () Unit!9962)

(assert (=> b!323163 (= e!199828 Unit!9967)))

(declare-fun b!323170 () Bool)

(assert (=> b!323170 false))

(declare-fun Unit!9968 () Unit!9962)

(assert (=> b!323170 (= e!199827 Unit!9968)))

(declare-fun b!323171 () Bool)

(declare-fun res!176807 () Bool)

(assert (=> b!323171 (=> (not res!176807) (not e!199831))))

(assert (=> b!323171 (= res!176807 (and (= (size!8178 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8178 a!3305))))))

(assert (= (and start!32398 res!176799) b!323171))

(assert (= (and b!323171 res!176807) b!323168))

(assert (= (and b!323168 res!176803) b!323156))

(assert (= (and b!323156 res!176800) b!323164))

(assert (= (and b!323164 res!176806) b!323169))

(assert (= (and b!323169 res!176802) b!323162))

(assert (= (and b!323162 res!176804) b!323161))

(assert (= (and b!323161 res!176805) b!323160))

(assert (= (and b!323160 res!176808) b!323165))

(assert (= (and b!323165 res!176801) b!323167))

(assert (= (and b!323167 c!50808) b!323159))

(assert (= (and b!323167 (not c!50808)) b!323163))

(assert (= (and b!323159 c!50807) b!323170))

(assert (= (and b!323159 (not c!50807)) b!323158))

(assert (= (and b!323158 c!50806) b!323157))

(assert (= (and b!323158 (not c!50806)) b!323166))

(declare-fun m!330665 () Bool)

(assert (=> b!323156 m!330665))

(declare-fun m!330667 () Bool)

(assert (=> b!323164 m!330667))

(declare-fun m!330669 () Bool)

(assert (=> b!323168 m!330669))

(declare-fun m!330671 () Bool)

(assert (=> b!323161 m!330671))

(declare-fun m!330673 () Bool)

(assert (=> b!323169 m!330673))

(declare-fun m!330675 () Bool)

(assert (=> b!323160 m!330675))

(declare-fun m!330677 () Bool)

(assert (=> b!323159 m!330677))

(declare-fun m!330679 () Bool)

(assert (=> start!32398 m!330679))

(declare-fun m!330681 () Bool)

(assert (=> start!32398 m!330681))

(declare-fun m!330683 () Bool)

(assert (=> b!323162 m!330683))

(assert (=> b!323162 m!330683))

(declare-fun m!330685 () Bool)

(assert (=> b!323162 m!330685))

(declare-fun m!330687 () Bool)

(assert (=> b!323158 m!330687))

(assert (=> b!323158 m!330687))

(declare-fun m!330689 () Bool)

(assert (=> b!323158 m!330689))

(assert (=> b!323165 m!330677))

(push 1)

