; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32700 () Bool)

(assert start!32700)

(declare-fun b!326958 () Bool)

(declare-fun e!201165 () Bool)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun index!1840 () (_ BitVec 32))

(assert (=> b!326958 (= e!201165 (and (bvsge mask!3777 #b00000000000000000000000000000000) (bvsge index!1840 (bvadd #b00000000000000000000000000000001 mask!3777))))))

(declare-datatypes ((array!16750 0))(
  ( (array!16751 (arr!7929 (Array (_ BitVec 32) (_ BitVec 64))) (size!8281 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16750)

(declare-datatypes ((Unit!10118 0))(
  ( (Unit!10119) )
))
(declare-fun lt!157457 () Unit!10118)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16750 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10118)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326958 (= lt!157457 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!326959 () Bool)

(declare-fun res!180042 () Bool)

(declare-fun e!201163 () Bool)

(assert (=> b!326959 (=> (not res!180042) (not e!201163))))

(declare-fun arrayContainsKey!0 (array!16750 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326959 (= res!180042 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!326960 () Bool)

(declare-fun res!180048 () Bool)

(assert (=> b!326960 (=> (not res!180048) (not e!201163))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16750 (_ BitVec 32)) Bool)

(assert (=> b!326960 (= res!180048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!180043 () Bool)

(assert (=> start!32700 (=> (not res!180043) (not e!201163))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32700 (= res!180043 (validMask!0 mask!3777))))

(assert (=> start!32700 e!201163))

(declare-fun array_inv!5879 (array!16750) Bool)

(assert (=> start!32700 (array_inv!5879 a!3305)))

(assert (=> start!32700 true))

(declare-fun b!326961 () Bool)

(declare-fun res!180040 () Bool)

(assert (=> b!326961 (=> (not res!180040) (not e!201163))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326961 (= res!180040 (validKeyInArray!0 k!2497))))

(declare-fun b!326962 () Bool)

(declare-fun res!180039 () Bool)

(assert (=> b!326962 (=> (not res!180039) (not e!201165))))

(assert (=> b!326962 (= res!180039 (and (= (select (arr!7929 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8281 a!3305))))))

(declare-fun b!326963 () Bool)

(declare-fun res!180047 () Bool)

(assert (=> b!326963 (=> (not res!180047) (not e!201163))))

(assert (=> b!326963 (= res!180047 (and (= (size!8281 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8281 a!3305))))))

(declare-fun b!326964 () Bool)

(assert (=> b!326964 (= e!201163 e!201165)))

(declare-fun res!180045 () Bool)

(assert (=> b!326964 (=> (not res!180045) (not e!201165))))

(declare-datatypes ((SeekEntryResult!3025 0))(
  ( (MissingZero!3025 (index!14276 (_ BitVec 32))) (Found!3025 (index!14277 (_ BitVec 32))) (Intermediate!3025 (undefined!3837 Bool) (index!14278 (_ BitVec 32)) (x!32620 (_ BitVec 32))) (Undefined!3025) (MissingVacant!3025 (index!14279 (_ BitVec 32))) )
))
(declare-fun lt!157458 () SeekEntryResult!3025)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16750 (_ BitVec 32)) SeekEntryResult!3025)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326964 (= res!180045 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157458))))

(assert (=> b!326964 (= lt!157458 (Intermediate!3025 false resIndex!58 resX!58))))

(declare-fun b!326965 () Bool)

(declare-fun res!180041 () Bool)

(assert (=> b!326965 (=> (not res!180041) (not e!201165))))

(assert (=> b!326965 (= res!180041 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157458))))

(declare-fun b!326966 () Bool)

(declare-fun res!180044 () Bool)

(assert (=> b!326966 (=> (not res!180044) (not e!201165))))

(assert (=> b!326966 (= res!180044 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7929 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!326967 () Bool)

(declare-fun res!180046 () Bool)

(assert (=> b!326967 (=> (not res!180046) (not e!201163))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16750 (_ BitVec 32)) SeekEntryResult!3025)

(assert (=> b!326967 (= res!180046 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3025 i!1250)))))

(assert (= (and start!32700 res!180043) b!326963))

(assert (= (and b!326963 res!180047) b!326961))

(assert (= (and b!326961 res!180040) b!326959))

(assert (= (and b!326959 res!180042) b!326967))

(assert (= (and b!326967 res!180046) b!326960))

(assert (= (and b!326960 res!180048) b!326964))

(assert (= (and b!326964 res!180045) b!326962))

(assert (= (and b!326962 res!180039) b!326965))

(assert (= (and b!326965 res!180041) b!326966))

(assert (= (and b!326966 res!180044) b!326958))

(declare-fun m!333677 () Bool)

(assert (=> start!32700 m!333677))

(declare-fun m!333679 () Bool)

(assert (=> start!32700 m!333679))

(declare-fun m!333681 () Bool)

(assert (=> b!326965 m!333681))

(declare-fun m!333683 () Bool)

(assert (=> b!326964 m!333683))

(assert (=> b!326964 m!333683))

(declare-fun m!333685 () Bool)

(assert (=> b!326964 m!333685))

(declare-fun m!333687 () Bool)

(assert (=> b!326962 m!333687))

(declare-fun m!333689 () Bool)

(assert (=> b!326958 m!333689))

(assert (=> b!326958 m!333689))

(declare-fun m!333691 () Bool)

(assert (=> b!326958 m!333691))

(declare-fun m!333693 () Bool)

(assert (=> b!326959 m!333693))

(declare-fun m!333695 () Bool)

(assert (=> b!326961 m!333695))

(declare-fun m!333697 () Bool)

(assert (=> b!326960 m!333697))

(declare-fun m!333699 () Bool)

(assert (=> b!326967 m!333699))

(declare-fun m!333701 () Bool)

(assert (=> b!326966 m!333701))

(push 1)

(assert (not b!326959))

(assert (not b!326965))

(assert (not b!326967))

(assert (not b!326964))

(assert (not b!326961))

(assert (not b!326960))

(assert (not start!32700))

(assert (not b!326958))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

