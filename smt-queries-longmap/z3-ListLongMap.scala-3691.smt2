; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50808 () Bool)

(assert start!50808)

(declare-fun b!555479 () Bool)

(declare-fun res!347786 () Bool)

(declare-fun e!320193 () Bool)

(assert (=> b!555479 (=> (not res!347786) (not e!320193))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!34980 0))(
  ( (array!34981 (arr!16798 (Array (_ BitVec 32) (_ BitVec 64))) (size!17162 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34980)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!555479 (= res!347786 (and (= (size!17162 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17162 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17162 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555480 () Bool)

(declare-fun res!347789 () Bool)

(assert (=> b!555480 (=> (not res!347789) (not e!320193))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555480 (= res!347789 (validKeyInArray!0 (select (arr!16798 a!3118) j!142)))))

(declare-fun b!555481 () Bool)

(declare-fun res!347787 () Bool)

(assert (=> b!555481 (=> (not res!347787) (not e!320193))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!555481 (= res!347787 (validKeyInArray!0 k0!1914))))

(declare-fun b!555482 () Bool)

(declare-fun e!320196 () Bool)

(assert (=> b!555482 (= e!320193 e!320196)))

(declare-fun res!347791 () Bool)

(assert (=> b!555482 (=> (not res!347791) (not e!320196))))

(declare-datatypes ((SeekEntryResult!5203 0))(
  ( (MissingZero!5203 (index!23039 (_ BitVec 32))) (Found!5203 (index!23040 (_ BitVec 32))) (Intermediate!5203 (undefined!6015 Bool) (index!23041 (_ BitVec 32)) (x!52096 (_ BitVec 32))) (Undefined!5203) (MissingVacant!5203 (index!23042 (_ BitVec 32))) )
))
(declare-fun lt!252420 () SeekEntryResult!5203)

(assert (=> b!555482 (= res!347791 (or (= lt!252420 (MissingZero!5203 i!1132)) (= lt!252420 (MissingVacant!5203 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34980 (_ BitVec 32)) SeekEntryResult!5203)

(assert (=> b!555482 (= lt!252420 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!347794 () Bool)

(assert (=> start!50808 (=> (not res!347794) (not e!320193))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50808 (= res!347794 (validMask!0 mask!3119))))

(assert (=> start!50808 e!320193))

(assert (=> start!50808 true))

(declare-fun array_inv!12657 (array!34980) Bool)

(assert (=> start!50808 (array_inv!12657 a!3118)))

(declare-fun b!555483 () Bool)

(declare-fun res!347793 () Bool)

(assert (=> b!555483 (=> (not res!347793) (not e!320196))))

(declare-datatypes ((List!10785 0))(
  ( (Nil!10782) (Cons!10781 (h!11769 (_ BitVec 64)) (t!17005 List!10785)) )
))
(declare-fun arrayNoDuplicates!0 (array!34980 (_ BitVec 32) List!10785) Bool)

(assert (=> b!555483 (= res!347793 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10782))))

(declare-fun b!555484 () Bool)

(declare-fun e!320195 () Bool)

(assert (=> b!555484 (= e!320195 (not true))))

(declare-fun lt!252423 () SeekEntryResult!5203)

(declare-fun lt!252419 () SeekEntryResult!5203)

(get-info :version)

(assert (=> b!555484 (and (= lt!252423 (Found!5203 j!142)) (or (undefined!6015 lt!252419) (not ((_ is Intermediate!5203) lt!252419)) (= (select (arr!16798 a!3118) (index!23041 lt!252419)) (select (arr!16798 a!3118) j!142)) (not (= (select (arr!16798 a!3118) (index!23041 lt!252419)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252423 (MissingZero!5203 (index!23041 lt!252419)))))))

(assert (=> b!555484 (= lt!252423 (seekEntryOrOpen!0 (select (arr!16798 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34980 (_ BitVec 32)) Bool)

(assert (=> b!555484 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17251 0))(
  ( (Unit!17252) )
))
(declare-fun lt!252421 () Unit!17251)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34980 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17251)

(assert (=> b!555484 (= lt!252421 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555485 () Bool)

(declare-fun res!347792 () Bool)

(assert (=> b!555485 (=> (not res!347792) (not e!320193))))

(declare-fun arrayContainsKey!0 (array!34980 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555485 (= res!347792 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555486 () Bool)

(assert (=> b!555486 (= e!320196 e!320195)))

(declare-fun res!347790 () Bool)

(assert (=> b!555486 (=> (not res!347790) (not e!320195))))

(declare-fun lt!252424 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34980 (_ BitVec 32)) SeekEntryResult!5203)

(assert (=> b!555486 (= res!347790 (= lt!252419 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252424 (select (store (arr!16798 a!3118) i!1132 k0!1914) j!142) (array!34981 (store (arr!16798 a!3118) i!1132 k0!1914) (size!17162 a!3118)) mask!3119)))))

(declare-fun lt!252422 () (_ BitVec 32))

(assert (=> b!555486 (= lt!252419 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252422 (select (arr!16798 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555486 (= lt!252424 (toIndex!0 (select (store (arr!16798 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!555486 (= lt!252422 (toIndex!0 (select (arr!16798 a!3118) j!142) mask!3119))))

(declare-fun b!555487 () Bool)

(declare-fun res!347788 () Bool)

(assert (=> b!555487 (=> (not res!347788) (not e!320196))))

(assert (=> b!555487 (= res!347788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!50808 res!347794) b!555479))

(assert (= (and b!555479 res!347786) b!555480))

(assert (= (and b!555480 res!347789) b!555481))

(assert (= (and b!555481 res!347787) b!555485))

(assert (= (and b!555485 res!347792) b!555482))

(assert (= (and b!555482 res!347791) b!555487))

(assert (= (and b!555487 res!347788) b!555483))

(assert (= (and b!555483 res!347793) b!555486))

(assert (= (and b!555486 res!347790) b!555484))

(declare-fun m!533237 () Bool)

(assert (=> b!555482 m!533237))

(declare-fun m!533239 () Bool)

(assert (=> b!555480 m!533239))

(assert (=> b!555480 m!533239))

(declare-fun m!533241 () Bool)

(assert (=> b!555480 m!533241))

(declare-fun m!533243 () Bool)

(assert (=> b!555483 m!533243))

(declare-fun m!533245 () Bool)

(assert (=> b!555487 m!533245))

(declare-fun m!533247 () Bool)

(assert (=> start!50808 m!533247))

(declare-fun m!533249 () Bool)

(assert (=> start!50808 m!533249))

(assert (=> b!555484 m!533239))

(declare-fun m!533251 () Bool)

(assert (=> b!555484 m!533251))

(declare-fun m!533253 () Bool)

(assert (=> b!555484 m!533253))

(declare-fun m!533255 () Bool)

(assert (=> b!555484 m!533255))

(assert (=> b!555484 m!533239))

(declare-fun m!533257 () Bool)

(assert (=> b!555484 m!533257))

(declare-fun m!533259 () Bool)

(assert (=> b!555481 m!533259))

(declare-fun m!533261 () Bool)

(assert (=> b!555485 m!533261))

(assert (=> b!555486 m!533239))

(declare-fun m!533263 () Bool)

(assert (=> b!555486 m!533263))

(assert (=> b!555486 m!533239))

(declare-fun m!533265 () Bool)

(assert (=> b!555486 m!533265))

(assert (=> b!555486 m!533239))

(declare-fun m!533267 () Bool)

(assert (=> b!555486 m!533267))

(declare-fun m!533269 () Bool)

(assert (=> b!555486 m!533269))

(assert (=> b!555486 m!533265))

(declare-fun m!533271 () Bool)

(assert (=> b!555486 m!533271))

(assert (=> b!555486 m!533265))

(declare-fun m!533273 () Bool)

(assert (=> b!555486 m!533273))

(check-sat (not b!555482) (not b!555483) (not b!555485) (not b!555481) (not b!555480) (not b!555487) (not b!555486) (not b!555484) (not start!50808))
(check-sat)
