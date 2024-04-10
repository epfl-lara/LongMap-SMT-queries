; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56632 () Bool)

(assert start!56632)

(declare-fun b!627580 () Bool)

(declare-fun res!405289 () Bool)

(declare-fun e!359295 () Bool)

(assert (=> b!627580 (=> (not res!405289) (not e!359295))))

(declare-datatypes ((array!37924 0))(
  ( (array!37925 (arr!18202 (Array (_ BitVec 32) (_ BitVec 64))) (size!18566 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37924)

(declare-datatypes ((List!12243 0))(
  ( (Nil!12240) (Cons!12239 (h!13284 (_ BitVec 64)) (t!18471 List!12243)) )
))
(declare-fun arrayNoDuplicates!0 (array!37924 (_ BitVec 32) List!12243) Bool)

(assert (=> b!627580 (= res!405289 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12240))))

(declare-fun b!627581 () Bool)

(declare-fun res!405285 () Bool)

(assert (=> b!627581 (=> (not res!405285) (not e!359295))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!627581 (= res!405285 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18202 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18202 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!627582 () Bool)

(declare-fun res!405290 () Bool)

(assert (=> b!627582 (=> (not res!405290) (not e!359295))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37924 (_ BitVec 32)) Bool)

(assert (=> b!627582 (= res!405290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!627583 () Bool)

(declare-fun e!359294 () Bool)

(assert (=> b!627583 (= e!359294 e!359295)))

(declare-fun res!405282 () Bool)

(assert (=> b!627583 (=> (not res!405282) (not e!359295))))

(declare-datatypes ((SeekEntryResult!6642 0))(
  ( (MissingZero!6642 (index!28852 (_ BitVec 32))) (Found!6642 (index!28853 (_ BitVec 32))) (Intermediate!6642 (undefined!7454 Bool) (index!28854 (_ BitVec 32)) (x!57590 (_ BitVec 32))) (Undefined!6642) (MissingVacant!6642 (index!28855 (_ BitVec 32))) )
))
(declare-fun lt!290305 () SeekEntryResult!6642)

(assert (=> b!627583 (= res!405282 (or (= lt!290305 (MissingZero!6642 i!1108)) (= lt!290305 (MissingVacant!6642 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37924 (_ BitVec 32)) SeekEntryResult!6642)

(assert (=> b!627583 (= lt!290305 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!627584 () Bool)

(assert (=> b!627584 (= e!359295 false)))

(declare-fun lt!290304 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627584 (= lt!290304 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!627585 () Bool)

(declare-fun res!405288 () Bool)

(assert (=> b!627585 (=> (not res!405288) (not e!359294))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627585 (= res!405288 (validKeyInArray!0 (select (arr!18202 a!2986) j!136)))))

(declare-fun b!627586 () Bool)

(declare-fun res!405283 () Bool)

(assert (=> b!627586 (=> (not res!405283) (not e!359295))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37924 (_ BitVec 32)) SeekEntryResult!6642)

(assert (=> b!627586 (= res!405283 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18202 a!2986) j!136) a!2986 mask!3053) (Found!6642 j!136)))))

(declare-fun b!627587 () Bool)

(declare-fun res!405280 () Bool)

(assert (=> b!627587 (=> (not res!405280) (not e!359294))))

(assert (=> b!627587 (= res!405280 (and (= (size!18566 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18566 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18566 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!627588 () Bool)

(declare-fun res!405286 () Bool)

(assert (=> b!627588 (=> (not res!405286) (not e!359295))))

(assert (=> b!627588 (= res!405286 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18202 a!2986) index!984) (select (arr!18202 a!2986) j!136))) (not (= (select (arr!18202 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun res!405281 () Bool)

(assert (=> start!56632 (=> (not res!405281) (not e!359294))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56632 (= res!405281 (validMask!0 mask!3053))))

(assert (=> start!56632 e!359294))

(assert (=> start!56632 true))

(declare-fun array_inv!13998 (array!37924) Bool)

(assert (=> start!56632 (array_inv!13998 a!2986)))

(declare-fun b!627589 () Bool)

(declare-fun res!405287 () Bool)

(assert (=> b!627589 (=> (not res!405287) (not e!359294))))

(declare-fun arrayContainsKey!0 (array!37924 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627589 (= res!405287 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627590 () Bool)

(declare-fun res!405284 () Bool)

(assert (=> b!627590 (=> (not res!405284) (not e!359294))))

(assert (=> b!627590 (= res!405284 (validKeyInArray!0 k0!1786))))

(assert (= (and start!56632 res!405281) b!627587))

(assert (= (and b!627587 res!405280) b!627585))

(assert (= (and b!627585 res!405288) b!627590))

(assert (= (and b!627590 res!405284) b!627589))

(assert (= (and b!627589 res!405287) b!627583))

(assert (= (and b!627583 res!405282) b!627582))

(assert (= (and b!627582 res!405290) b!627580))

(assert (= (and b!627580 res!405289) b!627581))

(assert (= (and b!627581 res!405285) b!627586))

(assert (= (and b!627586 res!405283) b!627588))

(assert (= (and b!627588 res!405286) b!627584))

(declare-fun m!602877 () Bool)

(assert (=> b!627589 m!602877))

(declare-fun m!602879 () Bool)

(assert (=> b!627584 m!602879))

(declare-fun m!602881 () Bool)

(assert (=> start!56632 m!602881))

(declare-fun m!602883 () Bool)

(assert (=> start!56632 m!602883))

(declare-fun m!602885 () Bool)

(assert (=> b!627588 m!602885))

(declare-fun m!602887 () Bool)

(assert (=> b!627588 m!602887))

(declare-fun m!602889 () Bool)

(assert (=> b!627580 m!602889))

(assert (=> b!627586 m!602887))

(assert (=> b!627586 m!602887))

(declare-fun m!602891 () Bool)

(assert (=> b!627586 m!602891))

(declare-fun m!602893 () Bool)

(assert (=> b!627590 m!602893))

(declare-fun m!602895 () Bool)

(assert (=> b!627582 m!602895))

(declare-fun m!602897 () Bool)

(assert (=> b!627581 m!602897))

(declare-fun m!602899 () Bool)

(assert (=> b!627581 m!602899))

(declare-fun m!602901 () Bool)

(assert (=> b!627581 m!602901))

(declare-fun m!602903 () Bool)

(assert (=> b!627583 m!602903))

(assert (=> b!627585 m!602887))

(assert (=> b!627585 m!602887))

(declare-fun m!602905 () Bool)

(assert (=> b!627585 m!602905))

(check-sat (not b!627582) (not b!627586) (not b!627585) (not b!627590) (not start!56632) (not b!627584) (not b!627580) (not b!627583) (not b!627589))
(check-sat)
