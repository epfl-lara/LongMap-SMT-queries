; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56574 () Bool)

(assert start!56574)

(declare-fun b!626679 () Bool)

(declare-fun res!404384 () Bool)

(declare-fun e!359034 () Bool)

(assert (=> b!626679 (=> (not res!404384) (not e!359034))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37866 0))(
  ( (array!37867 (arr!18173 (Array (_ BitVec 32) (_ BitVec 64))) (size!18537 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37866)

(assert (=> b!626679 (= res!404384 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18173 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18173 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!626680 () Bool)

(declare-fun res!404379 () Bool)

(declare-fun e!359033 () Bool)

(assert (=> b!626680 (=> (not res!404379) (not e!359033))))

(declare-fun arrayContainsKey!0 (array!37866 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!626680 (= res!404379 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!626681 () Bool)

(declare-fun res!404386 () Bool)

(assert (=> b!626681 (=> (not res!404386) (not e!359034))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37866 (_ BitVec 32)) Bool)

(assert (=> b!626681 (= res!404386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!626682 () Bool)

(assert (=> b!626682 (= e!359033 e!359034)))

(declare-fun res!404385 () Bool)

(assert (=> b!626682 (=> (not res!404385) (not e!359034))))

(declare-datatypes ((SeekEntryResult!6613 0))(
  ( (MissingZero!6613 (index!28736 (_ BitVec 32))) (Found!6613 (index!28737 (_ BitVec 32))) (Intermediate!6613 (undefined!7425 Bool) (index!28738 (_ BitVec 32)) (x!57481 (_ BitVec 32))) (Undefined!6613) (MissingVacant!6613 (index!28739 (_ BitVec 32))) )
))
(declare-fun lt!290131 () SeekEntryResult!6613)

(assert (=> b!626682 (= res!404385 (or (= lt!290131 (MissingZero!6613 i!1108)) (= lt!290131 (MissingVacant!6613 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37866 (_ BitVec 32)) SeekEntryResult!6613)

(assert (=> b!626682 (= lt!290131 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!626683 () Bool)

(declare-fun res!404387 () Bool)

(assert (=> b!626683 (=> (not res!404387) (not e!359034))))

(declare-datatypes ((List!12214 0))(
  ( (Nil!12211) (Cons!12210 (h!13255 (_ BitVec 64)) (t!18442 List!12214)) )
))
(declare-fun arrayNoDuplicates!0 (array!37866 (_ BitVec 32) List!12214) Bool)

(assert (=> b!626683 (= res!404387 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12211))))

(declare-fun b!626684 () Bool)

(declare-fun res!404382 () Bool)

(assert (=> b!626684 (=> (not res!404382) (not e!359033))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!626684 (= res!404382 (and (= (size!18537 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18537 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18537 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!626685 () Bool)

(declare-fun res!404383 () Bool)

(assert (=> b!626685 (=> (not res!404383) (not e!359033))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!626685 (= res!404383 (validKeyInArray!0 (select (arr!18173 a!2986) j!136)))))

(declare-fun b!626686 () Bool)

(assert (=> b!626686 (= e!359034 false)))

(declare-fun lt!290130 () SeekEntryResult!6613)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37866 (_ BitVec 32)) SeekEntryResult!6613)

(assert (=> b!626686 (= lt!290130 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18173 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!626687 () Bool)

(declare-fun res!404381 () Bool)

(assert (=> b!626687 (=> (not res!404381) (not e!359033))))

(assert (=> b!626687 (= res!404381 (validKeyInArray!0 k!1786))))

(declare-fun res!404380 () Bool)

(assert (=> start!56574 (=> (not res!404380) (not e!359033))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56574 (= res!404380 (validMask!0 mask!3053))))

(assert (=> start!56574 e!359033))

(assert (=> start!56574 true))

(declare-fun array_inv!13969 (array!37866) Bool)

(assert (=> start!56574 (array_inv!13969 a!2986)))

(assert (= (and start!56574 res!404380) b!626684))

(assert (= (and b!626684 res!404382) b!626685))

(assert (= (and b!626685 res!404383) b!626687))

(assert (= (and b!626687 res!404381) b!626680))

(assert (= (and b!626680 res!404379) b!626682))

(assert (= (and b!626682 res!404385) b!626681))

(assert (= (and b!626681 res!404386) b!626683))

(assert (= (and b!626683 res!404387) b!626679))

(assert (= (and b!626679 res!404384) b!626686))

(declare-fun m!602047 () Bool)

(assert (=> start!56574 m!602047))

(declare-fun m!602049 () Bool)

(assert (=> start!56574 m!602049))

(declare-fun m!602051 () Bool)

(assert (=> b!626679 m!602051))

(declare-fun m!602053 () Bool)

(assert (=> b!626679 m!602053))

(declare-fun m!602055 () Bool)

(assert (=> b!626679 m!602055))

(declare-fun m!602057 () Bool)

(assert (=> b!626681 m!602057))

(declare-fun m!602059 () Bool)

(assert (=> b!626680 m!602059))

(declare-fun m!602061 () Bool)

(assert (=> b!626687 m!602061))

(declare-fun m!602063 () Bool)

(assert (=> b!626683 m!602063))

(declare-fun m!602065 () Bool)

(assert (=> b!626685 m!602065))

(assert (=> b!626685 m!602065))

(declare-fun m!602067 () Bool)

(assert (=> b!626685 m!602067))

(assert (=> b!626686 m!602065))

(assert (=> b!626686 m!602065))

(declare-fun m!602069 () Bool)

(assert (=> b!626686 m!602069))

(declare-fun m!602071 () Bool)

(assert (=> b!626682 m!602071))

(push 1)

