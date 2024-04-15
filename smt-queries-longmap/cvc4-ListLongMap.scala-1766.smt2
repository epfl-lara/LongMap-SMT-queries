; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32230 () Bool)

(assert start!32230)

(declare-fun b!320882 () Bool)

(declare-fun e!198913 () Bool)

(assert (=> b!320882 (= e!198913 false)))

(declare-datatypes ((array!16424 0))(
  ( (array!16425 (arr!7771 (Array (_ BitVec 32) (_ BitVec 64))) (size!8124 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16424)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun k!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2901 0))(
  ( (MissingZero!2901 (index!13780 (_ BitVec 32))) (Found!2901 (index!13781 (_ BitVec 32))) (Intermediate!2901 (undefined!3713 Bool) (index!13782 (_ BitVec 32)) (x!32059 (_ BitVec 32))) (Undefined!2901) (MissingVacant!2901 (index!13783 (_ BitVec 32))) )
))
(declare-fun lt!155927 () SeekEntryResult!2901)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16424 (_ BitVec 32)) SeekEntryResult!2901)

(assert (=> b!320882 (= lt!155927 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777))))

(declare-fun b!320883 () Bool)

(declare-fun res!175153 () Bool)

(assert (=> b!320883 (=> (not res!175153) (not e!198913))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320883 (= res!175153 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) (Intermediate!2901 false resIndex!58 resX!58)))))

(declare-fun b!320884 () Bool)

(declare-fun res!175154 () Bool)

(assert (=> b!320884 (=> (not res!175154) (not e!198913))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16424 (_ BitVec 32)) Bool)

(assert (=> b!320884 (= res!175154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!320886 () Bool)

(declare-fun res!175151 () Bool)

(assert (=> b!320886 (=> (not res!175151) (not e!198913))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!320886 (= res!175151 (and (= (size!8124 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8124 a!3305))))))

(declare-fun b!320887 () Bool)

(declare-fun res!175152 () Bool)

(assert (=> b!320887 (=> (not res!175152) (not e!198913))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320887 (= res!175152 (validKeyInArray!0 k!2497))))

(declare-fun b!320888 () Bool)

(declare-fun res!175148 () Bool)

(assert (=> b!320888 (=> (not res!175148) (not e!198913))))

(declare-fun arrayContainsKey!0 (array!16424 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320888 (= res!175148 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320889 () Bool)

(declare-fun res!175155 () Bool)

(assert (=> b!320889 (=> (not res!175155) (not e!198913))))

(assert (=> b!320889 (= res!175155 (and (= (select (arr!7771 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8124 a!3305))))))

(declare-fun b!320885 () Bool)

(declare-fun res!175149 () Bool)

(assert (=> b!320885 (=> (not res!175149) (not e!198913))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16424 (_ BitVec 32)) SeekEntryResult!2901)

(assert (=> b!320885 (= res!175149 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2901 i!1250)))))

(declare-fun res!175150 () Bool)

(assert (=> start!32230 (=> (not res!175150) (not e!198913))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32230 (= res!175150 (validMask!0 mask!3777))))

(assert (=> start!32230 e!198913))

(declare-fun array_inv!5743 (array!16424) Bool)

(assert (=> start!32230 (array_inv!5743 a!3305)))

(assert (=> start!32230 true))

(assert (= (and start!32230 res!175150) b!320886))

(assert (= (and b!320886 res!175151) b!320887))

(assert (= (and b!320887 res!175152) b!320888))

(assert (= (and b!320888 res!175148) b!320885))

(assert (= (and b!320885 res!175149) b!320884))

(assert (= (and b!320884 res!175154) b!320883))

(assert (= (and b!320883 res!175153) b!320889))

(assert (= (and b!320889 res!175155) b!320882))

(declare-fun m!328623 () Bool)

(assert (=> b!320882 m!328623))

(declare-fun m!328625 () Bool)

(assert (=> b!320888 m!328625))

(declare-fun m!328627 () Bool)

(assert (=> b!320889 m!328627))

(declare-fun m!328629 () Bool)

(assert (=> b!320884 m!328629))

(declare-fun m!328631 () Bool)

(assert (=> b!320883 m!328631))

(assert (=> b!320883 m!328631))

(declare-fun m!328633 () Bool)

(assert (=> b!320883 m!328633))

(declare-fun m!328635 () Bool)

(assert (=> b!320885 m!328635))

(declare-fun m!328637 () Bool)

(assert (=> b!320887 m!328637))

(declare-fun m!328639 () Bool)

(assert (=> start!32230 m!328639))

(declare-fun m!328641 () Bool)

(assert (=> start!32230 m!328641))

(push 1)

(assert (not b!320885))

(assert (not start!32230))

(assert (not b!320884))

(assert (not b!320888))

(assert (not b!320882))

(assert (not b!320883))

(assert (not b!320887))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

