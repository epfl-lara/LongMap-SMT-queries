; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53444 () Bool)

(assert start!53444)

(declare-fun b!581526 () Bool)

(declare-fun res!369346 () Bool)

(declare-fun e!333690 () Bool)

(assert (=> b!581526 (=> (not res!369346) (not e!333690))))

(declare-datatypes ((array!36345 0))(
  ( (array!36346 (arr!17447 (Array (_ BitVec 32) (_ BitVec 64))) (size!17811 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36345)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581526 (= res!369346 (validKeyInArray!0 (select (arr!17447 a!2986) j!136)))))

(declare-fun b!581527 () Bool)

(declare-fun res!369347 () Bool)

(assert (=> b!581527 (=> (not res!369347) (not e!333690))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36345 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581527 (= res!369347 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581528 () Bool)

(declare-fun res!369343 () Bool)

(declare-fun e!333688 () Bool)

(assert (=> b!581528 (=> (not res!369343) (not e!333688))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!581528 (= res!369343 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17447 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17447 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581529 () Bool)

(declare-fun res!369344 () Bool)

(assert (=> b!581529 (=> (not res!369344) (not e!333688))))

(declare-datatypes ((List!11488 0))(
  ( (Nil!11485) (Cons!11484 (h!12529 (_ BitVec 64)) (t!17716 List!11488)) )
))
(declare-fun arrayNoDuplicates!0 (array!36345 (_ BitVec 32) List!11488) Bool)

(assert (=> b!581529 (= res!369344 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11485))))

(declare-fun b!581530 () Bool)

(assert (=> b!581530 (= e!333690 e!333688)))

(declare-fun res!369345 () Bool)

(assert (=> b!581530 (=> (not res!369345) (not e!333688))))

(declare-datatypes ((SeekEntryResult!5887 0))(
  ( (MissingZero!5887 (index!25775 (_ BitVec 32))) (Found!5887 (index!25776 (_ BitVec 32))) (Intermediate!5887 (undefined!6699 Bool) (index!25777 (_ BitVec 32)) (x!54636 (_ BitVec 32))) (Undefined!5887) (MissingVacant!5887 (index!25778 (_ BitVec 32))) )
))
(declare-fun lt!264925 () SeekEntryResult!5887)

(assert (=> b!581530 (= res!369345 (or (= lt!264925 (MissingZero!5887 i!1108)) (= lt!264925 (MissingVacant!5887 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36345 (_ BitVec 32)) SeekEntryResult!5887)

(assert (=> b!581530 (= lt!264925 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!581532 () Bool)

(declare-fun res!369348 () Bool)

(assert (=> b!581532 (=> (not res!369348) (not e!333688))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36345 (_ BitVec 32)) Bool)

(assert (=> b!581532 (= res!369348 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581533 () Bool)

(declare-fun res!369349 () Bool)

(assert (=> b!581533 (=> (not res!369349) (not e!333690))))

(assert (=> b!581533 (= res!369349 (and (= (size!17811 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17811 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17811 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581534 () Bool)

(assert (=> b!581534 (= e!333688 false)))

(declare-fun lt!264924 () SeekEntryResult!5887)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36345 (_ BitVec 32)) SeekEntryResult!5887)

(assert (=> b!581534 (= lt!264924 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17447 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!581531 () Bool)

(declare-fun res!369342 () Bool)

(assert (=> b!581531 (=> (not res!369342) (not e!333690))))

(assert (=> b!581531 (= res!369342 (validKeyInArray!0 k!1786))))

(declare-fun res!369350 () Bool)

(assert (=> start!53444 (=> (not res!369350) (not e!333690))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53444 (= res!369350 (validMask!0 mask!3053))))

(assert (=> start!53444 e!333690))

(assert (=> start!53444 true))

(declare-fun array_inv!13243 (array!36345) Bool)

(assert (=> start!53444 (array_inv!13243 a!2986)))

(assert (= (and start!53444 res!369350) b!581533))

(assert (= (and b!581533 res!369349) b!581526))

(assert (= (and b!581526 res!369346) b!581531))

(assert (= (and b!581531 res!369342) b!581527))

(assert (= (and b!581527 res!369347) b!581530))

(assert (= (and b!581530 res!369345) b!581532))

(assert (= (and b!581532 res!369348) b!581529))

(assert (= (and b!581529 res!369344) b!581528))

(assert (= (and b!581528 res!369343) b!581534))

(declare-fun m!560063 () Bool)

(assert (=> b!581532 m!560063))

(declare-fun m!560065 () Bool)

(assert (=> b!581534 m!560065))

(assert (=> b!581534 m!560065))

(declare-fun m!560067 () Bool)

(assert (=> b!581534 m!560067))

(declare-fun m!560069 () Bool)

(assert (=> b!581530 m!560069))

(declare-fun m!560071 () Bool)

(assert (=> start!53444 m!560071))

(declare-fun m!560073 () Bool)

(assert (=> start!53444 m!560073))

(declare-fun m!560075 () Bool)

(assert (=> b!581528 m!560075))

(declare-fun m!560077 () Bool)

(assert (=> b!581528 m!560077))

(declare-fun m!560079 () Bool)

(assert (=> b!581528 m!560079))

(declare-fun m!560081 () Bool)

(assert (=> b!581531 m!560081))

(declare-fun m!560083 () Bool)

(assert (=> b!581529 m!560083))

(assert (=> b!581526 m!560065))

(assert (=> b!581526 m!560065))

(declare-fun m!560085 () Bool)

(assert (=> b!581526 m!560085))

(declare-fun m!560087 () Bool)

(assert (=> b!581527 m!560087))

(push 1)

(assert (not b!581530))

(assert (not b!581531))

(assert (not b!581526))

(assert (not b!581529))

(assert (not b!581532))

(assert (not start!53444))

(assert (not b!581534))

(assert (not b!581527))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

