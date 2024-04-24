; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45746 () Bool)

(assert start!45746)

(declare-fun b!506147 () Bool)

(declare-fun res!307188 () Bool)

(declare-fun e!296254 () Bool)

(assert (=> b!506147 (=> (not res!307188) (not e!296254))))

(declare-datatypes ((array!32503 0))(
  ( (array!32504 (arr!15631 (Array (_ BitVec 32) (_ BitVec 64))) (size!15995 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32503)

(declare-datatypes ((List!9696 0))(
  ( (Nil!9693) (Cons!9692 (h!10569 (_ BitVec 64)) (t!15916 List!9696)) )
))
(declare-fun arrayNoDuplicates!0 (array!32503 (_ BitVec 32) List!9696) Bool)

(assert (=> b!506147 (= res!307188 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9693))))

(declare-fun res!307183 () Bool)

(declare-fun e!296259 () Bool)

(assert (=> start!45746 (=> (not res!307183) (not e!296259))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45746 (= res!307183 (validMask!0 mask!3524))))

(assert (=> start!45746 e!296259))

(assert (=> start!45746 true))

(declare-fun array_inv!11490 (array!32503) Bool)

(assert (=> start!45746 (array_inv!11490 a!3235)))

(declare-fun b!506148 () Bool)

(declare-fun res!307182 () Bool)

(assert (=> b!506148 (=> (not res!307182) (not e!296259))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32503 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506148 (= res!307182 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!506149 () Bool)

(declare-fun res!307185 () Bool)

(assert (=> b!506149 (=> (not res!307185) (not e!296254))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32503 (_ BitVec 32)) Bool)

(assert (=> b!506149 (= res!307185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!506150 () Bool)

(declare-fun res!307174 () Bool)

(declare-fun e!296255 () Bool)

(assert (=> b!506150 (=> res!307174 e!296255)))

(declare-fun e!296258 () Bool)

(assert (=> b!506150 (= res!307174 e!296258)))

(declare-fun res!307184 () Bool)

(assert (=> b!506150 (=> (not res!307184) (not e!296258))))

(declare-datatypes ((SeekEntryResult!4054 0))(
  ( (MissingZero!4054 (index!18404 (_ BitVec 32))) (Found!4054 (index!18405 (_ BitVec 32))) (Intermediate!4054 (undefined!4866 Bool) (index!18406 (_ BitVec 32)) (x!47556 (_ BitVec 32))) (Undefined!4054) (MissingVacant!4054 (index!18407 (_ BitVec 32))) )
))
(declare-fun lt!230965 () SeekEntryResult!4054)

(assert (=> b!506150 (= res!307184 (bvsgt #b00000000000000000000000000000000 (x!47556 lt!230965)))))

(declare-fun b!506151 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!296250 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32503 (_ BitVec 32)) SeekEntryResult!4054)

(assert (=> b!506151 (= e!296250 (= (seekEntryOrOpen!0 (select (arr!15631 a!3235) j!176) a!3235 mask!3524) (Found!4054 j!176)))))

(declare-fun b!506152 () Bool)

(declare-fun e!296257 () Bool)

(assert (=> b!506152 (= e!296255 e!296257)))

(declare-fun res!307176 () Bool)

(assert (=> b!506152 (=> res!307176 e!296257)))

(assert (=> b!506152 (= res!307176 (bvslt mask!3524 #b00000000000000000000000000000000))))

(declare-fun lt!230957 () SeekEntryResult!4054)

(declare-fun lt!230968 () (_ BitVec 64))

(declare-fun lt!230959 () array!32503)

(assert (=> b!506152 (= (seekEntryOrOpen!0 lt!230968 lt!230959 mask!3524) lt!230957)))

(declare-datatypes ((Unit!15451 0))(
  ( (Unit!15452) )
))
(declare-fun lt!230961 () Unit!15451)

(declare-fun lt!230960 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!32503 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15451)

(assert (=> b!506152 (= lt!230961 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k0!2280 j!176 lt!230960 #b00000000000000000000000000000000 (index!18406 lt!230965) (x!47556 lt!230965) mask!3524))))

(declare-fun b!506153 () Bool)

(declare-fun res!307181 () Bool)

(assert (=> b!506153 (=> (not res!307181) (not e!296259))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506153 (= res!307181 (validKeyInArray!0 k0!2280))))

(declare-fun b!506154 () Bool)

(declare-fun e!296252 () Unit!15451)

(declare-fun Unit!15453 () Unit!15451)

(assert (=> b!506154 (= e!296252 Unit!15453)))

(declare-fun lt!230958 () Unit!15451)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32503 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15451)

(assert (=> b!506154 (= lt!230958 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!230960 #b00000000000000000000000000000000 (index!18406 lt!230965) (x!47556 lt!230965) mask!3524))))

(declare-fun res!307180 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32503 (_ BitVec 32)) SeekEntryResult!4054)

(assert (=> b!506154 (= res!307180 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230960 lt!230968 lt!230959 mask!3524) (Intermediate!4054 false (index!18406 lt!230965) (x!47556 lt!230965))))))

(declare-fun e!296251 () Bool)

(assert (=> b!506154 (=> (not res!307180) (not e!296251))))

(assert (=> b!506154 e!296251))

(declare-fun b!506155 () Bool)

(declare-fun res!307177 () Bool)

(assert (=> b!506155 (=> res!307177 e!296255)))

(declare-fun lt!230966 () SeekEntryResult!4054)

(assert (=> b!506155 (= res!307177 (not (= lt!230966 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230960 lt!230968 lt!230959 mask!3524))))))

(declare-fun b!506156 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32503 (_ BitVec 32)) SeekEntryResult!4054)

(assert (=> b!506156 (= e!296258 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!230960 (index!18406 lt!230965) (select (arr!15631 a!3235) j!176) a!3235 mask!3524) lt!230957)))))

(declare-fun b!506157 () Bool)

(assert (=> b!506157 (= e!296257 (validKeyInArray!0 lt!230968))))

(declare-fun b!506158 () Bool)

(declare-fun e!296253 () Bool)

(assert (=> b!506158 (= e!296254 (not e!296253))))

(declare-fun res!307189 () Bool)

(assert (=> b!506158 (=> res!307189 e!296253)))

(get-info :version)

(assert (=> b!506158 (= res!307189 (or (= lt!230965 lt!230966) (undefined!4866 lt!230965) (not ((_ is Intermediate!4054) lt!230965))))))

(declare-fun lt!230956 () (_ BitVec 32))

(assert (=> b!506158 (= lt!230966 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230956 lt!230968 lt!230959 mask!3524))))

(assert (=> b!506158 (= lt!230965 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230960 (select (arr!15631 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506158 (= lt!230956 (toIndex!0 lt!230968 mask!3524))))

(assert (=> b!506158 (= lt!230968 (select (store (arr!15631 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!506158 (= lt!230960 (toIndex!0 (select (arr!15631 a!3235) j!176) mask!3524))))

(assert (=> b!506158 (= lt!230959 (array!32504 (store (arr!15631 a!3235) i!1204 k0!2280) (size!15995 a!3235)))))

(assert (=> b!506158 (= lt!230957 (Found!4054 j!176))))

(assert (=> b!506158 e!296250))

(declare-fun res!307187 () Bool)

(assert (=> b!506158 (=> (not res!307187) (not e!296250))))

(assert (=> b!506158 (= res!307187 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!230964 () Unit!15451)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32503 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15451)

(assert (=> b!506158 (= lt!230964 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!506159 () Bool)

(assert (=> b!506159 (= e!296253 e!296255)))

(declare-fun res!307186 () Bool)

(assert (=> b!506159 (=> res!307186 e!296255)))

(assert (=> b!506159 (= res!307186 (or (bvsgt (x!47556 lt!230965) #b01111111111111111111111111111110) (bvslt lt!230960 #b00000000000000000000000000000000) (bvsge lt!230960 (size!15995 a!3235)) (bvslt (index!18406 lt!230965) #b00000000000000000000000000000000) (bvsge (index!18406 lt!230965) (size!15995 a!3235)) (not (= lt!230965 (Intermediate!4054 false (index!18406 lt!230965) (x!47556 lt!230965))))))))

(assert (=> b!506159 (= (index!18406 lt!230965) i!1204)))

(declare-fun lt!230963 () Unit!15451)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32503 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15451)

(assert (=> b!506159 (= lt!230963 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!230960 #b00000000000000000000000000000000 (index!18406 lt!230965) (x!47556 lt!230965) mask!3524))))

(assert (=> b!506159 (and (or (= (select (arr!15631 a!3235) (index!18406 lt!230965)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15631 a!3235) (index!18406 lt!230965)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15631 a!3235) (index!18406 lt!230965)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15631 a!3235) (index!18406 lt!230965)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!230967 () Unit!15451)

(assert (=> b!506159 (= lt!230967 e!296252)))

(declare-fun c!59765 () Bool)

(assert (=> b!506159 (= c!59765 (= (select (arr!15631 a!3235) (index!18406 lt!230965)) (select (arr!15631 a!3235) j!176)))))

(assert (=> b!506159 (and (bvslt (x!47556 lt!230965) #b01111111111111111111111111111110) (or (= (select (arr!15631 a!3235) (index!18406 lt!230965)) (select (arr!15631 a!3235) j!176)) (= (select (arr!15631 a!3235) (index!18406 lt!230965)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15631 a!3235) (index!18406 lt!230965)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!506160 () Bool)

(assert (=> b!506160 (= e!296259 e!296254)))

(declare-fun res!307175 () Bool)

(assert (=> b!506160 (=> (not res!307175) (not e!296254))))

(declare-fun lt!230962 () SeekEntryResult!4054)

(assert (=> b!506160 (= res!307175 (or (= lt!230962 (MissingZero!4054 i!1204)) (= lt!230962 (MissingVacant!4054 i!1204))))))

(assert (=> b!506160 (= lt!230962 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!506161 () Bool)

(declare-fun res!307179 () Bool)

(assert (=> b!506161 (=> (not res!307179) (not e!296259))))

(assert (=> b!506161 (= res!307179 (validKeyInArray!0 (select (arr!15631 a!3235) j!176)))))

(declare-fun b!506162 () Bool)

(declare-fun res!307178 () Bool)

(assert (=> b!506162 (=> (not res!307178) (not e!296259))))

(assert (=> b!506162 (= res!307178 (and (= (size!15995 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15995 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15995 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506163 () Bool)

(declare-fun Unit!15454 () Unit!15451)

(assert (=> b!506163 (= e!296252 Unit!15454)))

(declare-fun b!506164 () Bool)

(assert (=> b!506164 (= e!296251 false)))

(assert (= (and start!45746 res!307183) b!506162))

(assert (= (and b!506162 res!307178) b!506161))

(assert (= (and b!506161 res!307179) b!506153))

(assert (= (and b!506153 res!307181) b!506148))

(assert (= (and b!506148 res!307182) b!506160))

(assert (= (and b!506160 res!307175) b!506149))

(assert (= (and b!506149 res!307185) b!506147))

(assert (= (and b!506147 res!307188) b!506158))

(assert (= (and b!506158 res!307187) b!506151))

(assert (= (and b!506158 (not res!307189)) b!506159))

(assert (= (and b!506159 c!59765) b!506154))

(assert (= (and b!506159 (not c!59765)) b!506163))

(assert (= (and b!506154 res!307180) b!506164))

(assert (= (and b!506159 (not res!307186)) b!506150))

(assert (= (and b!506150 res!307184) b!506156))

(assert (= (and b!506150 (not res!307174)) b!506155))

(assert (= (and b!506155 (not res!307177)) b!506152))

(assert (= (and b!506152 (not res!307176)) b!506157))

(declare-fun m!487039 () Bool)

(assert (=> b!506154 m!487039))

(declare-fun m!487041 () Bool)

(assert (=> b!506154 m!487041))

(declare-fun m!487043 () Bool)

(assert (=> b!506152 m!487043))

(declare-fun m!487045 () Bool)

(assert (=> b!506152 m!487045))

(declare-fun m!487047 () Bool)

(assert (=> b!506153 m!487047))

(declare-fun m!487049 () Bool)

(assert (=> b!506159 m!487049))

(declare-fun m!487051 () Bool)

(assert (=> b!506159 m!487051))

(declare-fun m!487053 () Bool)

(assert (=> b!506159 m!487053))

(declare-fun m!487055 () Bool)

(assert (=> b!506148 m!487055))

(assert (=> b!506161 m!487053))

(assert (=> b!506161 m!487053))

(declare-fun m!487057 () Bool)

(assert (=> b!506161 m!487057))

(assert (=> b!506155 m!487041))

(assert (=> b!506156 m!487053))

(assert (=> b!506156 m!487053))

(declare-fun m!487059 () Bool)

(assert (=> b!506156 m!487059))

(assert (=> b!506151 m!487053))

(assert (=> b!506151 m!487053))

(declare-fun m!487061 () Bool)

(assert (=> b!506151 m!487061))

(declare-fun m!487063 () Bool)

(assert (=> b!506157 m!487063))

(declare-fun m!487065 () Bool)

(assert (=> b!506158 m!487065))

(declare-fun m!487067 () Bool)

(assert (=> b!506158 m!487067))

(declare-fun m!487069 () Bool)

(assert (=> b!506158 m!487069))

(declare-fun m!487071 () Bool)

(assert (=> b!506158 m!487071))

(assert (=> b!506158 m!487053))

(declare-fun m!487073 () Bool)

(assert (=> b!506158 m!487073))

(assert (=> b!506158 m!487053))

(declare-fun m!487075 () Bool)

(assert (=> b!506158 m!487075))

(declare-fun m!487077 () Bool)

(assert (=> b!506158 m!487077))

(assert (=> b!506158 m!487053))

(declare-fun m!487079 () Bool)

(assert (=> b!506158 m!487079))

(declare-fun m!487081 () Bool)

(assert (=> b!506147 m!487081))

(declare-fun m!487083 () Bool)

(assert (=> b!506149 m!487083))

(declare-fun m!487085 () Bool)

(assert (=> start!45746 m!487085))

(declare-fun m!487087 () Bool)

(assert (=> start!45746 m!487087))

(declare-fun m!487089 () Bool)

(assert (=> b!506160 m!487089))

(check-sat (not b!506156) (not b!506152) (not b!506154) (not b!506160) (not b!506158) (not b!506157) (not b!506161) (not b!506147) (not b!506159) (not b!506148) (not b!506151) (not b!506153) (not b!506149) (not b!506155) (not start!45746))
(check-sat)
