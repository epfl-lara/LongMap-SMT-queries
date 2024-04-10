; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52426 () Bool)

(assert start!52426)

(declare-fun res!361782 () Bool)

(declare-fun e!329173 () Bool)

(assert (=> start!52426 (=> (not res!361782) (not e!329173))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52426 (= res!361782 (validMask!0 mask!3119))))

(assert (=> start!52426 e!329173))

(assert (=> start!52426 true))

(declare-datatypes ((array!35823 0))(
  ( (array!35824 (arr!17200 (Array (_ BitVec 32) (_ BitVec 64))) (size!17564 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35823)

(declare-fun array_inv!12996 (array!35823) Bool)

(assert (=> start!52426 (array_inv!12996 a!3118)))

(declare-fun b!572270 () Bool)

(declare-fun res!361788 () Bool)

(assert (=> b!572270 (=> (not res!361788) (not e!329173))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!572270 (= res!361788 (validKeyInArray!0 k0!1914))))

(declare-fun b!572271 () Bool)

(declare-fun e!329174 () Bool)

(declare-fun e!329176 () Bool)

(assert (=> b!572271 (= e!329174 e!329176)))

(declare-fun res!361787 () Bool)

(assert (=> b!572271 (=> (not res!361787) (not e!329176))))

(declare-fun lt!261123 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5649 0))(
  ( (MissingZero!5649 (index!24823 (_ BitVec 32))) (Found!5649 (index!24824 (_ BitVec 32))) (Intermediate!5649 (undefined!6461 Bool) (index!24825 (_ BitVec 32)) (x!53694 (_ BitVec 32))) (Undefined!5649) (MissingVacant!5649 (index!24826 (_ BitVec 32))) )
))
(declare-fun lt!261122 () SeekEntryResult!5649)

(declare-fun lt!261126 () (_ BitVec 32))

(declare-fun lt!261124 () array!35823)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35823 (_ BitVec 32)) SeekEntryResult!5649)

(assert (=> b!572271 (= res!361787 (= lt!261122 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261126 lt!261123 lt!261124 mask!3119)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!261127 () (_ BitVec 32))

(assert (=> b!572271 (= lt!261122 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261127 (select (arr!17200 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!572271 (= lt!261126 (toIndex!0 lt!261123 mask!3119))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!572271 (= lt!261123 (select (store (arr!17200 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!572271 (= lt!261127 (toIndex!0 (select (arr!17200 a!3118) j!142) mask!3119))))

(assert (=> b!572271 (= lt!261124 (array!35824 (store (arr!17200 a!3118) i!1132 k0!1914) (size!17564 a!3118)))))

(declare-fun b!572272 () Bool)

(declare-fun res!361786 () Bool)

(assert (=> b!572272 (=> (not res!361786) (not e!329174))))

(declare-datatypes ((List!11280 0))(
  ( (Nil!11277) (Cons!11276 (h!12303 (_ BitVec 64)) (t!17508 List!11280)) )
))
(declare-fun arrayNoDuplicates!0 (array!35823 (_ BitVec 32) List!11280) Bool)

(assert (=> b!572272 (= res!361786 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11277))))

(declare-fun b!572273 () Bool)

(declare-fun e!329177 () Bool)

(declare-fun e!329178 () Bool)

(assert (=> b!572273 (= e!329177 e!329178)))

(declare-fun res!361785 () Bool)

(assert (=> b!572273 (=> res!361785 e!329178)))

(get-info :version)

(assert (=> b!572273 (= res!361785 (or (undefined!6461 lt!261122) (not ((_ is Intermediate!5649) lt!261122))))))

(declare-fun b!572274 () Bool)

(assert (=> b!572274 (= e!329176 (not true))))

(assert (=> b!572274 e!329177))

(declare-fun res!361790 () Bool)

(assert (=> b!572274 (=> (not res!361790) (not e!329177))))

(declare-fun lt!261120 () SeekEntryResult!5649)

(assert (=> b!572274 (= res!361790 (= lt!261120 (Found!5649 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35823 (_ BitVec 32)) SeekEntryResult!5649)

(assert (=> b!572274 (= lt!261120 (seekEntryOrOpen!0 (select (arr!17200 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35823 (_ BitVec 32)) Bool)

(assert (=> b!572274 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18000 0))(
  ( (Unit!18001) )
))
(declare-fun lt!261119 () Unit!18000)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35823 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18000)

(assert (=> b!572274 (= lt!261119 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!572275 () Bool)

(declare-fun res!361778 () Bool)

(assert (=> b!572275 (=> (not res!361778) (not e!329173))))

(assert (=> b!572275 (= res!361778 (and (= (size!17564 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17564 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17564 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!572276 () Bool)

(declare-fun e!329171 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35823 (_ BitVec 32)) SeekEntryResult!5649)

(assert (=> b!572276 (= e!329171 (= (seekEntryOrOpen!0 lt!261123 lt!261124 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53694 lt!261122) (index!24825 lt!261122) (index!24825 lt!261122) lt!261123 lt!261124 mask!3119)))))

(declare-fun b!572277 () Bool)

(declare-fun e!329175 () Bool)

(assert (=> b!572277 (= e!329175 e!329171)))

(declare-fun res!361781 () Bool)

(assert (=> b!572277 (=> (not res!361781) (not e!329171))))

(assert (=> b!572277 (= res!361781 (= lt!261120 (seekKeyOrZeroReturnVacant!0 (x!53694 lt!261122) (index!24825 lt!261122) (index!24825 lt!261122) (select (arr!17200 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!572278 () Bool)

(declare-fun res!361783 () Bool)

(assert (=> b!572278 (=> (not res!361783) (not e!329174))))

(assert (=> b!572278 (= res!361783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!572279 () Bool)

(declare-fun res!361784 () Bool)

(assert (=> b!572279 (=> (not res!361784) (not e!329173))))

(declare-fun arrayContainsKey!0 (array!35823 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!572279 (= res!361784 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!572280 () Bool)

(assert (=> b!572280 (= e!329178 e!329175)))

(declare-fun res!361780 () Bool)

(assert (=> b!572280 (=> res!361780 e!329175)))

(declare-fun lt!261121 () (_ BitVec 64))

(assert (=> b!572280 (= res!361780 (or (= lt!261121 (select (arr!17200 a!3118) j!142)) (= lt!261121 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!572280 (= lt!261121 (select (arr!17200 a!3118) (index!24825 lt!261122)))))

(declare-fun b!572281 () Bool)

(declare-fun res!361779 () Bool)

(assert (=> b!572281 (=> (not res!361779) (not e!329173))))

(assert (=> b!572281 (= res!361779 (validKeyInArray!0 (select (arr!17200 a!3118) j!142)))))

(declare-fun b!572282 () Bool)

(assert (=> b!572282 (= e!329173 e!329174)))

(declare-fun res!361789 () Bool)

(assert (=> b!572282 (=> (not res!361789) (not e!329174))))

(declare-fun lt!261125 () SeekEntryResult!5649)

(assert (=> b!572282 (= res!361789 (or (= lt!261125 (MissingZero!5649 i!1132)) (= lt!261125 (MissingVacant!5649 i!1132))))))

(assert (=> b!572282 (= lt!261125 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!52426 res!361782) b!572275))

(assert (= (and b!572275 res!361778) b!572281))

(assert (= (and b!572281 res!361779) b!572270))

(assert (= (and b!572270 res!361788) b!572279))

(assert (= (and b!572279 res!361784) b!572282))

(assert (= (and b!572282 res!361789) b!572278))

(assert (= (and b!572278 res!361783) b!572272))

(assert (= (and b!572272 res!361786) b!572271))

(assert (= (and b!572271 res!361787) b!572274))

(assert (= (and b!572274 res!361790) b!572273))

(assert (= (and b!572273 (not res!361785)) b!572280))

(assert (= (and b!572280 (not res!361780)) b!572277))

(assert (= (and b!572277 res!361781) b!572276))

(declare-fun m!551225 () Bool)

(assert (=> b!572274 m!551225))

(assert (=> b!572274 m!551225))

(declare-fun m!551227 () Bool)

(assert (=> b!572274 m!551227))

(declare-fun m!551229 () Bool)

(assert (=> b!572274 m!551229))

(declare-fun m!551231 () Bool)

(assert (=> b!572274 m!551231))

(assert (=> b!572280 m!551225))

(declare-fun m!551233 () Bool)

(assert (=> b!572280 m!551233))

(declare-fun m!551235 () Bool)

(assert (=> b!572278 m!551235))

(assert (=> b!572277 m!551225))

(assert (=> b!572277 m!551225))

(declare-fun m!551237 () Bool)

(assert (=> b!572277 m!551237))

(declare-fun m!551239 () Bool)

(assert (=> start!52426 m!551239))

(declare-fun m!551241 () Bool)

(assert (=> start!52426 m!551241))

(assert (=> b!572281 m!551225))

(assert (=> b!572281 m!551225))

(declare-fun m!551243 () Bool)

(assert (=> b!572281 m!551243))

(declare-fun m!551245 () Bool)

(assert (=> b!572276 m!551245))

(declare-fun m!551247 () Bool)

(assert (=> b!572276 m!551247))

(assert (=> b!572271 m!551225))

(declare-fun m!551249 () Bool)

(assert (=> b!572271 m!551249))

(assert (=> b!572271 m!551225))

(declare-fun m!551251 () Bool)

(assert (=> b!572271 m!551251))

(declare-fun m!551253 () Bool)

(assert (=> b!572271 m!551253))

(declare-fun m!551255 () Bool)

(assert (=> b!572271 m!551255))

(assert (=> b!572271 m!551225))

(declare-fun m!551257 () Bool)

(assert (=> b!572271 m!551257))

(declare-fun m!551259 () Bool)

(assert (=> b!572271 m!551259))

(declare-fun m!551261 () Bool)

(assert (=> b!572282 m!551261))

(declare-fun m!551263 () Bool)

(assert (=> b!572272 m!551263))

(declare-fun m!551265 () Bool)

(assert (=> b!572279 m!551265))

(declare-fun m!551267 () Bool)

(assert (=> b!572270 m!551267))

(check-sat (not b!572282) (not b!572277) (not b!572270) (not b!572279) (not b!572274) (not b!572272) (not b!572281) (not b!572276) (not b!572271) (not b!572278) (not start!52426))
(check-sat)
