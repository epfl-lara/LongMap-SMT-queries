; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53184 () Bool)

(assert start!53184)

(declare-fun b!578114 () Bool)

(declare-fun e!332519 () Bool)

(declare-fun e!332518 () Bool)

(assert (=> b!578114 (= e!332519 e!332518)))

(declare-fun res!365931 () Bool)

(assert (=> b!578114 (=> (not res!365931) (not e!332518))))

(declare-datatypes ((SeekEntryResult!5757 0))(
  ( (MissingZero!5757 (index!25255 (_ BitVec 32))) (Found!5757 (index!25256 (_ BitVec 32))) (Intermediate!5757 (undefined!6569 Bool) (index!25257 (_ BitVec 32)) (x!54162 (_ BitVec 32))) (Undefined!5757) (MissingVacant!5757 (index!25258 (_ BitVec 32))) )
))
(declare-fun lt!264181 () SeekEntryResult!5757)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578114 (= res!365931 (or (= lt!264181 (MissingZero!5757 i!1108)) (= lt!264181 (MissingVacant!5757 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!36085 0))(
  ( (array!36086 (arr!17317 (Array (_ BitVec 32) (_ BitVec 64))) (size!17681 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36085)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36085 (_ BitVec 32)) SeekEntryResult!5757)

(assert (=> b!578114 (= lt!264181 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!578115 () Bool)

(declare-fun res!365933 () Bool)

(assert (=> b!578115 (=> (not res!365933) (not e!332519))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578115 (= res!365933 (validKeyInArray!0 k0!1786))))

(declare-fun b!578116 () Bool)

(declare-fun res!365932 () Bool)

(assert (=> b!578116 (=> (not res!365932) (not e!332519))))

(declare-fun arrayContainsKey!0 (array!36085 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578116 (= res!365932 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578117 () Bool)

(declare-fun res!365935 () Bool)

(assert (=> b!578117 (=> (not res!365935) (not e!332519))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!578117 (= res!365935 (and (= (size!17681 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17681 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17681 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578118 () Bool)

(declare-fun res!365930 () Bool)

(assert (=> b!578118 (=> (not res!365930) (not e!332519))))

(assert (=> b!578118 (= res!365930 (validKeyInArray!0 (select (arr!17317 a!2986) j!136)))))

(declare-fun b!578119 () Bool)

(assert (=> b!578119 (= e!332518 false)))

(declare-fun lt!264180 () Bool)

(declare-datatypes ((List!11358 0))(
  ( (Nil!11355) (Cons!11354 (h!12399 (_ BitVec 64)) (t!17586 List!11358)) )
))
(declare-fun arrayNoDuplicates!0 (array!36085 (_ BitVec 32) List!11358) Bool)

(assert (=> b!578119 (= lt!264180 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11355))))

(declare-fun b!578120 () Bool)

(declare-fun res!365934 () Bool)

(assert (=> b!578120 (=> (not res!365934) (not e!332518))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36085 (_ BitVec 32)) Bool)

(assert (=> b!578120 (= res!365934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!365936 () Bool)

(assert (=> start!53184 (=> (not res!365936) (not e!332519))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53184 (= res!365936 (validMask!0 mask!3053))))

(assert (=> start!53184 e!332519))

(assert (=> start!53184 true))

(declare-fun array_inv!13113 (array!36085) Bool)

(assert (=> start!53184 (array_inv!13113 a!2986)))

(assert (= (and start!53184 res!365936) b!578117))

(assert (= (and b!578117 res!365935) b!578118))

(assert (= (and b!578118 res!365930) b!578115))

(assert (= (and b!578115 res!365933) b!578116))

(assert (= (and b!578116 res!365932) b!578114))

(assert (= (and b!578114 res!365931) b!578120))

(assert (= (and b!578120 res!365934) b!578119))

(declare-fun m!556837 () Bool)

(assert (=> b!578119 m!556837))

(declare-fun m!556839 () Bool)

(assert (=> b!578118 m!556839))

(assert (=> b!578118 m!556839))

(declare-fun m!556841 () Bool)

(assert (=> b!578118 m!556841))

(declare-fun m!556843 () Bool)

(assert (=> b!578114 m!556843))

(declare-fun m!556845 () Bool)

(assert (=> b!578116 m!556845))

(declare-fun m!556847 () Bool)

(assert (=> b!578115 m!556847))

(declare-fun m!556849 () Bool)

(assert (=> start!53184 m!556849))

(declare-fun m!556851 () Bool)

(assert (=> start!53184 m!556851))

(declare-fun m!556853 () Bool)

(assert (=> b!578120 m!556853))

(check-sat (not b!578120) (not b!578116) (not b!578119) (not b!578118) (not b!578115) (not start!53184) (not b!578114))
(check-sat)
