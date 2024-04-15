; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32250 () Bool)

(assert start!32250)

(declare-fun b!321139 () Bool)

(declare-fun e!198990 () Bool)

(declare-fun e!198991 () Bool)

(assert (=> b!321139 (= e!198990 e!198991)))

(declare-fun res!175411 () Bool)

(assert (=> b!321139 (=> (not res!175411) (not e!198991))))

(declare-datatypes ((array!16444 0))(
  ( (array!16445 (arr!7781 (Array (_ BitVec 32) (_ BitVec 64))) (size!8134 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16444)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2911 0))(
  ( (MissingZero!2911 (index!13820 (_ BitVec 32))) (Found!2911 (index!13821 (_ BitVec 32))) (Intermediate!2911 (undefined!3723 Bool) (index!13822 (_ BitVec 32)) (x!32093 (_ BitVec 32))) (Undefined!2911) (MissingVacant!2911 (index!13823 (_ BitVec 32))) )
))
(declare-fun lt!155957 () SeekEntryResult!2911)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16444 (_ BitVec 32)) SeekEntryResult!2911)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321139 (= res!175411 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!155957))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!321139 (= lt!155957 (Intermediate!2911 false resIndex!58 resX!58))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun b!321140 () Bool)

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!321140 (= e!198991 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7781 a!3305) index!1840) k!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7781 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7781 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3777 #b00000000000000000000000000000000) (bvsge index!1840 (bvadd #b00000000000000000000000000000001 mask!3777))))))

(declare-fun b!321141 () Bool)

(declare-fun res!175412 () Bool)

(assert (=> b!321141 (=> (not res!175412) (not e!198991))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!321141 (= res!175412 (and (= (select (arr!7781 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8134 a!3305))))))

(declare-fun b!321142 () Bool)

(declare-fun res!175405 () Bool)

(assert (=> b!321142 (=> (not res!175405) (not e!198990))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321142 (= res!175405 (validKeyInArray!0 k!2497))))

(declare-fun b!321143 () Bool)

(declare-fun res!175413 () Bool)

(assert (=> b!321143 (=> (not res!175413) (not e!198991))))

(assert (=> b!321143 (= res!175413 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!155957))))

(declare-fun b!321144 () Bool)

(declare-fun res!175407 () Bool)

(assert (=> b!321144 (=> (not res!175407) (not e!198990))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16444 (_ BitVec 32)) SeekEntryResult!2911)

(assert (=> b!321144 (= res!175407 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2911 i!1250)))))

(declare-fun b!321145 () Bool)

(declare-fun res!175406 () Bool)

(assert (=> b!321145 (=> (not res!175406) (not e!198990))))

(declare-fun arrayContainsKey!0 (array!16444 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321145 (= res!175406 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!321146 () Bool)

(declare-fun res!175409 () Bool)

(assert (=> b!321146 (=> (not res!175409) (not e!198990))))

(assert (=> b!321146 (= res!175409 (and (= (size!8134 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8134 a!3305))))))

(declare-fun b!321147 () Bool)

(declare-fun res!175408 () Bool)

(assert (=> b!321147 (=> (not res!175408) (not e!198990))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16444 (_ BitVec 32)) Bool)

(assert (=> b!321147 (= res!175408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!175410 () Bool)

(assert (=> start!32250 (=> (not res!175410) (not e!198990))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32250 (= res!175410 (validMask!0 mask!3777))))

(assert (=> start!32250 e!198990))

(declare-fun array_inv!5753 (array!16444) Bool)

(assert (=> start!32250 (array_inv!5753 a!3305)))

(assert (=> start!32250 true))

(assert (= (and start!32250 res!175410) b!321146))

(assert (= (and b!321146 res!175409) b!321142))

(assert (= (and b!321142 res!175405) b!321145))

(assert (= (and b!321145 res!175406) b!321144))

(assert (= (and b!321144 res!175407) b!321147))

(assert (= (and b!321147 res!175408) b!321139))

(assert (= (and b!321139 res!175411) b!321141))

(assert (= (and b!321141 res!175412) b!321143))

(assert (= (and b!321143 res!175413) b!321140))

(declare-fun m!328833 () Bool)

(assert (=> b!321147 m!328833))

(declare-fun m!328835 () Bool)

(assert (=> b!321144 m!328835))

(declare-fun m!328837 () Bool)

(assert (=> b!321145 m!328837))

(declare-fun m!328839 () Bool)

(assert (=> b!321141 m!328839))

(declare-fun m!328841 () Bool)

(assert (=> b!321139 m!328841))

(assert (=> b!321139 m!328841))

(declare-fun m!328843 () Bool)

(assert (=> b!321139 m!328843))

(declare-fun m!328845 () Bool)

(assert (=> start!32250 m!328845))

(declare-fun m!328847 () Bool)

(assert (=> start!32250 m!328847))

(declare-fun m!328849 () Bool)

(assert (=> b!321140 m!328849))

(declare-fun m!328851 () Bool)

(assert (=> b!321142 m!328851))

(declare-fun m!328853 () Bool)

(assert (=> b!321143 m!328853))

(push 1)

(assert (not b!321145))

(assert (not b!321142))

(assert (not start!32250))

(assert (not b!321144))

(assert (not b!321147))

(assert (not b!321139))

(assert (not b!321143))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

