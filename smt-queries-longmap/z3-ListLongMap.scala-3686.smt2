; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50778 () Bool)

(assert start!50778)

(declare-fun b!555074 () Bool)

(declare-fun res!347389 () Bool)

(declare-fun e!320015 () Bool)

(assert (=> b!555074 (=> (not res!347389) (not e!320015))))

(declare-datatypes ((array!34950 0))(
  ( (array!34951 (arr!16783 (Array (_ BitVec 32) (_ BitVec 64))) (size!17147 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34950)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34950 (_ BitVec 32)) Bool)

(assert (=> b!555074 (= res!347389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555075 () Bool)

(declare-fun e!320016 () Bool)

(assert (=> b!555075 (= e!320016 e!320015)))

(declare-fun res!347388 () Bool)

(assert (=> b!555075 (=> (not res!347388) (not e!320015))))

(declare-datatypes ((SeekEntryResult!5188 0))(
  ( (MissingZero!5188 (index!22979 (_ BitVec 32))) (Found!5188 (index!22980 (_ BitVec 32))) (Intermediate!5188 (undefined!6000 Bool) (index!22981 (_ BitVec 32)) (x!52041 (_ BitVec 32))) (Undefined!5188) (MissingVacant!5188 (index!22982 (_ BitVec 32))) )
))
(declare-fun lt!252149 () SeekEntryResult!5188)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!555075 (= res!347388 (or (= lt!252149 (MissingZero!5188 i!1132)) (= lt!252149 (MissingVacant!5188 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34950 (_ BitVec 32)) SeekEntryResult!5188)

(assert (=> b!555075 (= lt!252149 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!555076 () Bool)

(declare-fun res!347385 () Bool)

(assert (=> b!555076 (=> (not res!347385) (not e!320016))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555076 (= res!347385 (validKeyInArray!0 k0!1914))))

(declare-fun b!555077 () Bool)

(declare-fun res!347387 () Bool)

(assert (=> b!555077 (=> (not res!347387) (not e!320016))))

(declare-fun arrayContainsKey!0 (array!34950 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555077 (= res!347387 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555078 () Bool)

(declare-fun e!320013 () Bool)

(assert (=> b!555078 (= e!320015 e!320013)))

(declare-fun res!347386 () Bool)

(assert (=> b!555078 (=> (not res!347386) (not e!320013))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!252151 () (_ BitVec 32))

(declare-fun lt!252153 () SeekEntryResult!5188)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34950 (_ BitVec 32)) SeekEntryResult!5188)

(assert (=> b!555078 (= res!347386 (= lt!252153 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252151 (select (store (arr!16783 a!3118) i!1132 k0!1914) j!142) (array!34951 (store (arr!16783 a!3118) i!1132 k0!1914) (size!17147 a!3118)) mask!3119)))))

(declare-fun lt!252154 () (_ BitVec 32))

(assert (=> b!555078 (= lt!252153 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252154 (select (arr!16783 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555078 (= lt!252151 (toIndex!0 (select (store (arr!16783 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!555078 (= lt!252154 (toIndex!0 (select (arr!16783 a!3118) j!142) mask!3119))))

(declare-fun res!347384 () Bool)

(assert (=> start!50778 (=> (not res!347384) (not e!320016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50778 (= res!347384 (validMask!0 mask!3119))))

(assert (=> start!50778 e!320016))

(assert (=> start!50778 true))

(declare-fun array_inv!12642 (array!34950) Bool)

(assert (=> start!50778 (array_inv!12642 a!3118)))

(declare-fun b!555079 () Bool)

(declare-fun res!347381 () Bool)

(assert (=> b!555079 (=> (not res!347381) (not e!320015))))

(declare-datatypes ((List!10770 0))(
  ( (Nil!10767) (Cons!10766 (h!11754 (_ BitVec 64)) (t!16990 List!10770)) )
))
(declare-fun arrayNoDuplicates!0 (array!34950 (_ BitVec 32) List!10770) Bool)

(assert (=> b!555079 (= res!347381 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10767))))

(declare-fun b!555080 () Bool)

(declare-fun res!347382 () Bool)

(assert (=> b!555080 (=> (not res!347382) (not e!320016))))

(assert (=> b!555080 (= res!347382 (validKeyInArray!0 (select (arr!16783 a!3118) j!142)))))

(declare-fun b!555081 () Bool)

(assert (=> b!555081 (= e!320013 (not true))))

(declare-fun lt!252150 () SeekEntryResult!5188)

(get-info :version)

(assert (=> b!555081 (and (= lt!252150 (Found!5188 j!142)) (or (undefined!6000 lt!252153) (not ((_ is Intermediate!5188) lt!252153)) (= (select (arr!16783 a!3118) (index!22981 lt!252153)) (select (arr!16783 a!3118) j!142)) (not (= (select (arr!16783 a!3118) (index!22981 lt!252153)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252150 (MissingZero!5188 (index!22981 lt!252153)))))))

(assert (=> b!555081 (= lt!252150 (seekEntryOrOpen!0 (select (arr!16783 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!555081 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17221 0))(
  ( (Unit!17222) )
))
(declare-fun lt!252152 () Unit!17221)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34950 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17221)

(assert (=> b!555081 (= lt!252152 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555082 () Bool)

(declare-fun res!347383 () Bool)

(assert (=> b!555082 (=> (not res!347383) (not e!320016))))

(assert (=> b!555082 (= res!347383 (and (= (size!17147 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17147 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17147 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50778 res!347384) b!555082))

(assert (= (and b!555082 res!347383) b!555080))

(assert (= (and b!555080 res!347382) b!555076))

(assert (= (and b!555076 res!347385) b!555077))

(assert (= (and b!555077 res!347387) b!555075))

(assert (= (and b!555075 res!347388) b!555074))

(assert (= (and b!555074 res!347389) b!555079))

(assert (= (and b!555079 res!347381) b!555078))

(assert (= (and b!555078 res!347386) b!555081))

(declare-fun m!532667 () Bool)

(assert (=> b!555081 m!532667))

(declare-fun m!532669 () Bool)

(assert (=> b!555081 m!532669))

(declare-fun m!532671 () Bool)

(assert (=> b!555081 m!532671))

(declare-fun m!532673 () Bool)

(assert (=> b!555081 m!532673))

(assert (=> b!555081 m!532667))

(declare-fun m!532675 () Bool)

(assert (=> b!555081 m!532675))

(declare-fun m!532677 () Bool)

(assert (=> b!555074 m!532677))

(assert (=> b!555080 m!532667))

(assert (=> b!555080 m!532667))

(declare-fun m!532679 () Bool)

(assert (=> b!555080 m!532679))

(assert (=> b!555078 m!532667))

(declare-fun m!532681 () Bool)

(assert (=> b!555078 m!532681))

(assert (=> b!555078 m!532667))

(declare-fun m!532683 () Bool)

(assert (=> b!555078 m!532683))

(declare-fun m!532685 () Bool)

(assert (=> b!555078 m!532685))

(assert (=> b!555078 m!532683))

(assert (=> b!555078 m!532683))

(declare-fun m!532687 () Bool)

(assert (=> b!555078 m!532687))

(declare-fun m!532689 () Bool)

(assert (=> b!555078 m!532689))

(assert (=> b!555078 m!532667))

(declare-fun m!532691 () Bool)

(assert (=> b!555078 m!532691))

(declare-fun m!532693 () Bool)

(assert (=> b!555076 m!532693))

(declare-fun m!532695 () Bool)

(assert (=> b!555075 m!532695))

(declare-fun m!532697 () Bool)

(assert (=> b!555077 m!532697))

(declare-fun m!532699 () Bool)

(assert (=> b!555079 m!532699))

(declare-fun m!532701 () Bool)

(assert (=> start!50778 m!532701))

(declare-fun m!532703 () Bool)

(assert (=> start!50778 m!532703))

(check-sat (not b!555077) (not start!50778) (not b!555075) (not b!555081) (not b!555080) (not b!555076) (not b!555074) (not b!555078) (not b!555079))
(check-sat)
