; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45714 () Bool)

(assert start!45714)

(declare-fun b!505135 () Bool)

(declare-fun res!306243 () Bool)

(declare-fun e!295720 () Bool)

(assert (=> b!505135 (=> (not res!306243) (not e!295720))))

(declare-datatypes ((array!32470 0))(
  ( (array!32471 (arr!15615 (Array (_ BitVec 32) (_ BitVec 64))) (size!15979 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32470)

(declare-datatypes ((List!9773 0))(
  ( (Nil!9770) (Cons!9769 (h!10646 (_ BitVec 64)) (t!16001 List!9773)) )
))
(declare-fun arrayNoDuplicates!0 (array!32470 (_ BitVec 32) List!9773) Bool)

(assert (=> b!505135 (= res!306243 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9770))))

(declare-fun b!505136 () Bool)

(declare-fun res!306240 () Bool)

(declare-fun e!295723 () Bool)

(assert (=> b!505136 (=> res!306240 e!295723)))

(declare-datatypes ((SeekEntryResult!4082 0))(
  ( (MissingZero!4082 (index!18516 (_ BitVec 32))) (Found!4082 (index!18517 (_ BitVec 32))) (Intermediate!4082 (undefined!4894 Bool) (index!18518 (_ BitVec 32)) (x!47531 (_ BitVec 32))) (Undefined!4082) (MissingVacant!4082 (index!18519 (_ BitVec 32))) )
))
(declare-fun lt!230130 () SeekEntryResult!4082)

(declare-fun lt!230132 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!230135 () (_ BitVec 32))

(declare-fun lt!230136 () array!32470)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32470 (_ BitVec 32)) SeekEntryResult!4082)

(assert (=> b!505136 (= res!306240 (not (= lt!230130 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230135 lt!230132 lt!230136 mask!3524))))))

(declare-fun b!505137 () Bool)

(declare-fun res!306238 () Bool)

(assert (=> b!505137 (=> (not res!306238) (not e!295720))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32470 (_ BitVec 32)) Bool)

(assert (=> b!505137 (= res!306238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!505138 () Bool)

(declare-fun res!306247 () Bool)

(declare-fun e!295721 () Bool)

(assert (=> b!505138 (=> (not res!306247) (not e!295721))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!505138 (= res!306247 (validKeyInArray!0 (select (arr!15615 a!3235) j!176)))))

(declare-fun b!505139 () Bool)

(declare-datatypes ((Unit!15404 0))(
  ( (Unit!15405) )
))
(declare-fun e!295727 () Unit!15404)

(declare-fun Unit!15406 () Unit!15404)

(assert (=> b!505139 (= e!295727 Unit!15406)))

(declare-fun b!505140 () Bool)

(declare-fun res!306239 () Bool)

(assert (=> b!505140 (=> (not res!306239) (not e!295721))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!505140 (= res!306239 (and (= (size!15979 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15979 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15979 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!505141 () Bool)

(declare-fun e!295726 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32470 (_ BitVec 32)) SeekEntryResult!4082)

(assert (=> b!505141 (= e!295726 (= (seekEntryOrOpen!0 (select (arr!15615 a!3235) j!176) a!3235 mask!3524) (Found!4082 j!176)))))

(declare-fun b!505142 () Bool)

(declare-fun Unit!15407 () Unit!15404)

(assert (=> b!505142 (= e!295727 Unit!15407)))

(declare-fun lt!230126 () Unit!15404)

(declare-fun lt!230137 () SeekEntryResult!4082)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32470 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15404)

(assert (=> b!505142 (= lt!230126 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!230135 #b00000000000000000000000000000000 (index!18518 lt!230137) (x!47531 lt!230137) mask!3524))))

(declare-fun res!306246 () Bool)

(assert (=> b!505142 (= res!306246 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230135 lt!230132 lt!230136 mask!3524) (Intermediate!4082 false (index!18518 lt!230137) (x!47531 lt!230137))))))

(declare-fun e!295728 () Bool)

(assert (=> b!505142 (=> (not res!306246) (not e!295728))))

(assert (=> b!505142 e!295728))

(declare-fun b!505143 () Bool)

(declare-fun e!295722 () Bool)

(assert (=> b!505143 (= e!295722 e!295723)))

(declare-fun res!306244 () Bool)

(assert (=> b!505143 (=> res!306244 e!295723)))

(assert (=> b!505143 (= res!306244 (or (bvsgt (x!47531 lt!230137) #b01111111111111111111111111111110) (bvslt lt!230135 #b00000000000000000000000000000000) (bvsge lt!230135 (size!15979 a!3235)) (bvslt (index!18518 lt!230137) #b00000000000000000000000000000000) (bvsge (index!18518 lt!230137) (size!15979 a!3235)) (not (= lt!230137 (Intermediate!4082 false (index!18518 lt!230137) (x!47531 lt!230137))))))))

(assert (=> b!505143 (= (index!18518 lt!230137) i!1204)))

(declare-fun lt!230128 () Unit!15404)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32470 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15404)

(assert (=> b!505143 (= lt!230128 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!230135 #b00000000000000000000000000000000 (index!18518 lt!230137) (x!47531 lt!230137) mask!3524))))

(assert (=> b!505143 (and (or (= (select (arr!15615 a!3235) (index!18518 lt!230137)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15615 a!3235) (index!18518 lt!230137)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15615 a!3235) (index!18518 lt!230137)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15615 a!3235) (index!18518 lt!230137)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!230129 () Unit!15404)

(assert (=> b!505143 (= lt!230129 e!295727)))

(declare-fun c!59729 () Bool)

(assert (=> b!505143 (= c!59729 (= (select (arr!15615 a!3235) (index!18518 lt!230137)) (select (arr!15615 a!3235) j!176)))))

(assert (=> b!505143 (and (bvslt (x!47531 lt!230137) #b01111111111111111111111111111110) (or (= (select (arr!15615 a!3235) (index!18518 lt!230137)) (select (arr!15615 a!3235) j!176)) (= (select (arr!15615 a!3235) (index!18518 lt!230137)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15615 a!3235) (index!18518 lt!230137)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!505144 () Bool)

(assert (=> b!505144 (= e!295728 false)))

(declare-fun b!505145 () Bool)

(declare-fun res!306235 () Bool)

(assert (=> b!505145 (=> (not res!306235) (not e!295721))))

(declare-fun arrayContainsKey!0 (array!32470 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!505145 (= res!306235 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!306242 () Bool)

(assert (=> start!45714 (=> (not res!306242) (not e!295721))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45714 (= res!306242 (validMask!0 mask!3524))))

(assert (=> start!45714 e!295721))

(assert (=> start!45714 true))

(declare-fun array_inv!11411 (array!32470) Bool)

(assert (=> start!45714 (array_inv!11411 a!3235)))

(declare-fun b!505146 () Bool)

(declare-fun res!306237 () Bool)

(assert (=> b!505146 (=> res!306237 e!295723)))

(declare-fun e!295724 () Bool)

(assert (=> b!505146 (= res!306237 e!295724)))

(declare-fun res!306248 () Bool)

(assert (=> b!505146 (=> (not res!306248) (not e!295724))))

(assert (=> b!505146 (= res!306248 (bvsgt #b00000000000000000000000000000000 (x!47531 lt!230137)))))

(declare-fun b!505147 () Bool)

(assert (=> b!505147 (= e!295721 e!295720)))

(declare-fun res!306245 () Bool)

(assert (=> b!505147 (=> (not res!306245) (not e!295720))))

(declare-fun lt!230131 () SeekEntryResult!4082)

(assert (=> b!505147 (= res!306245 (or (= lt!230131 (MissingZero!4082 i!1204)) (= lt!230131 (MissingVacant!4082 i!1204))))))

(assert (=> b!505147 (= lt!230131 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!505148 () Bool)

(assert (=> b!505148 (= e!295723 true)))

(declare-fun lt!230133 () SeekEntryResult!4082)

(assert (=> b!505148 (= (seekEntryOrOpen!0 lt!230132 lt!230136 mask!3524) lt!230133)))

(declare-fun lt!230125 () Unit!15404)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!32470 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15404)

(assert (=> b!505148 (= lt!230125 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k!2280 j!176 lt!230135 #b00000000000000000000000000000000 (index!18518 lt!230137) (x!47531 lt!230137) mask!3524))))

(declare-fun b!505149 () Bool)

(declare-fun res!306234 () Bool)

(assert (=> b!505149 (=> (not res!306234) (not e!295721))))

(assert (=> b!505149 (= res!306234 (validKeyInArray!0 k!2280))))

(declare-fun b!505150 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32470 (_ BitVec 32)) SeekEntryResult!4082)

(assert (=> b!505150 (= e!295724 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!230135 (index!18518 lt!230137) (select (arr!15615 a!3235) j!176) a!3235 mask!3524) lt!230133)))))

(declare-fun b!505151 () Bool)

(assert (=> b!505151 (= e!295720 (not e!295722))))

(declare-fun res!306241 () Bool)

(assert (=> b!505151 (=> res!306241 e!295722)))

(assert (=> b!505151 (= res!306241 (or (= lt!230137 lt!230130) (undefined!4894 lt!230137) (not (is-Intermediate!4082 lt!230137))))))

(declare-fun lt!230134 () (_ BitVec 32))

(assert (=> b!505151 (= lt!230130 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230134 lt!230132 lt!230136 mask!3524))))

(assert (=> b!505151 (= lt!230137 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230135 (select (arr!15615 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!505151 (= lt!230134 (toIndex!0 lt!230132 mask!3524))))

(assert (=> b!505151 (= lt!230132 (select (store (arr!15615 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!505151 (= lt!230135 (toIndex!0 (select (arr!15615 a!3235) j!176) mask!3524))))

(assert (=> b!505151 (= lt!230136 (array!32471 (store (arr!15615 a!3235) i!1204 k!2280) (size!15979 a!3235)))))

(assert (=> b!505151 (= lt!230133 (Found!4082 j!176))))

(assert (=> b!505151 e!295726))

(declare-fun res!306236 () Bool)

(assert (=> b!505151 (=> (not res!306236) (not e!295726))))

(assert (=> b!505151 (= res!306236 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!230127 () Unit!15404)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32470 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15404)

(assert (=> b!505151 (= lt!230127 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!45714 res!306242) b!505140))

(assert (= (and b!505140 res!306239) b!505138))

(assert (= (and b!505138 res!306247) b!505149))

(assert (= (and b!505149 res!306234) b!505145))

(assert (= (and b!505145 res!306235) b!505147))

(assert (= (and b!505147 res!306245) b!505137))

(assert (= (and b!505137 res!306238) b!505135))

(assert (= (and b!505135 res!306243) b!505151))

(assert (= (and b!505151 res!306236) b!505141))

(assert (= (and b!505151 (not res!306241)) b!505143))

(assert (= (and b!505143 c!59729) b!505142))

(assert (= (and b!505143 (not c!59729)) b!505139))

(assert (= (and b!505142 res!306246) b!505144))

(assert (= (and b!505143 (not res!306244)) b!505146))

(assert (= (and b!505146 res!306248) b!505150))

(assert (= (and b!505146 (not res!306237)) b!505136))

(assert (= (and b!505136 (not res!306240)) b!505148))

(declare-fun m!485805 () Bool)

(assert (=> b!505141 m!485805))

(assert (=> b!505141 m!485805))

(declare-fun m!485807 () Bool)

(assert (=> b!505141 m!485807))

(declare-fun m!485809 () Bool)

(assert (=> b!505148 m!485809))

(declare-fun m!485811 () Bool)

(assert (=> b!505148 m!485811))

(declare-fun m!485813 () Bool)

(assert (=> b!505135 m!485813))

(declare-fun m!485815 () Bool)

(assert (=> b!505136 m!485815))

(declare-fun m!485817 () Bool)

(assert (=> b!505143 m!485817))

(declare-fun m!485819 () Bool)

(assert (=> b!505143 m!485819))

(assert (=> b!505143 m!485805))

(declare-fun m!485821 () Bool)

(assert (=> b!505145 m!485821))

(declare-fun m!485823 () Bool)

(assert (=> start!45714 m!485823))

(declare-fun m!485825 () Bool)

(assert (=> start!45714 m!485825))

(declare-fun m!485827 () Bool)

(assert (=> b!505151 m!485827))

(declare-fun m!485829 () Bool)

(assert (=> b!505151 m!485829))

(declare-fun m!485831 () Bool)

(assert (=> b!505151 m!485831))

(declare-fun m!485833 () Bool)

(assert (=> b!505151 m!485833))

(assert (=> b!505151 m!485805))

(declare-fun m!485835 () Bool)

(assert (=> b!505151 m!485835))

(assert (=> b!505151 m!485805))

(declare-fun m!485837 () Bool)

(assert (=> b!505151 m!485837))

(assert (=> b!505151 m!485805))

(declare-fun m!485839 () Bool)

(assert (=> b!505151 m!485839))

(declare-fun m!485841 () Bool)

(assert (=> b!505151 m!485841))

(declare-fun m!485843 () Bool)

(assert (=> b!505142 m!485843))

(assert (=> b!505142 m!485815))

(assert (=> b!505150 m!485805))

(assert (=> b!505150 m!485805))

(declare-fun m!485845 () Bool)

(assert (=> b!505150 m!485845))

(declare-fun m!485847 () Bool)

(assert (=> b!505149 m!485847))

(assert (=> b!505138 m!485805))

(assert (=> b!505138 m!485805))

(declare-fun m!485849 () Bool)

(assert (=> b!505138 m!485849))

(declare-fun m!485851 () Bool)

(assert (=> b!505137 m!485851))

(declare-fun m!485853 () Bool)

(assert (=> b!505147 m!485853))

(push 1)

