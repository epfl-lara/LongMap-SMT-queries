; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45758 () Bool)

(assert start!45758)

(declare-fun b!506262 () Bool)

(declare-fun e!296326 () Bool)

(declare-fun e!296325 () Bool)

(assert (=> b!506262 (= e!296326 e!296325)))

(declare-fun res!307241 () Bool)

(assert (=> b!506262 (=> (not res!307241) (not e!296325))))

(declare-datatypes ((SeekEntryResult!4104 0))(
  ( (MissingZero!4104 (index!18604 (_ BitVec 32))) (Found!4104 (index!18605 (_ BitVec 32))) (Intermediate!4104 (undefined!4916 Bool) (index!18606 (_ BitVec 32)) (x!47609 (_ BitVec 32))) (Undefined!4104) (MissingVacant!4104 (index!18607 (_ BitVec 32))) )
))
(declare-fun lt!230987 () SeekEntryResult!4104)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!506262 (= res!307241 (or (= lt!230987 (MissingZero!4104 i!1204)) (= lt!230987 (MissingVacant!4104 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32514 0))(
  ( (array!32515 (arr!15637 (Array (_ BitVec 32) (_ BitVec 64))) (size!16001 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32514)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32514 (_ BitVec 32)) SeekEntryResult!4104)

(assert (=> b!506262 (= lt!230987 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!506263 () Bool)

(declare-fun res!307240 () Bool)

(assert (=> b!506263 (=> (not res!307240) (not e!296326))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506263 (= res!307240 (validKeyInArray!0 (select (arr!15637 a!3235) j!176)))))

(declare-fun b!506264 () Bool)

(declare-fun e!296319 () Bool)

(declare-fun e!296324 () Bool)

(assert (=> b!506264 (= e!296319 e!296324)))

(declare-fun res!307232 () Bool)

(assert (=> b!506264 (=> res!307232 e!296324)))

(assert (=> b!506264 (= res!307232 (bvslt mask!3524 #b00000000000000000000000000000000))))

(declare-fun lt!230984 () SeekEntryResult!4104)

(declare-fun lt!230994 () array!32514)

(declare-fun lt!230988 () (_ BitVec 64))

(assert (=> b!506264 (= (seekEntryOrOpen!0 lt!230988 lt!230994 mask!3524) lt!230984)))

(declare-fun lt!230990 () (_ BitVec 32))

(declare-fun lt!230983 () SeekEntryResult!4104)

(declare-datatypes ((Unit!15492 0))(
  ( (Unit!15493) )
))
(declare-fun lt!230992 () Unit!15492)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!32514 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15492)

(assert (=> b!506264 (= lt!230992 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k0!2280 j!176 lt!230990 #b00000000000000000000000000000000 (index!18606 lt!230983) (x!47609 lt!230983) mask!3524))))

(declare-fun b!506265 () Bool)

(declare-fun e!296323 () Bool)

(assert (=> b!506265 (= e!296323 e!296319)))

(declare-fun res!307233 () Bool)

(assert (=> b!506265 (=> res!307233 e!296319)))

(assert (=> b!506265 (= res!307233 (or (bvsgt (x!47609 lt!230983) #b01111111111111111111111111111110) (bvslt lt!230990 #b00000000000000000000000000000000) (bvsge lt!230990 (size!16001 a!3235)) (bvslt (index!18606 lt!230983) #b00000000000000000000000000000000) (bvsge (index!18606 lt!230983) (size!16001 a!3235)) (not (= lt!230983 (Intermediate!4104 false (index!18606 lt!230983) (x!47609 lt!230983))))))))

(assert (=> b!506265 (= (index!18606 lt!230983) i!1204)))

(declare-fun lt!230985 () Unit!15492)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32514 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15492)

(assert (=> b!506265 (= lt!230985 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!230990 #b00000000000000000000000000000000 (index!18606 lt!230983) (x!47609 lt!230983) mask!3524))))

(assert (=> b!506265 (and (or (= (select (arr!15637 a!3235) (index!18606 lt!230983)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15637 a!3235) (index!18606 lt!230983)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15637 a!3235) (index!18606 lt!230983)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15637 a!3235) (index!18606 lt!230983)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!230989 () Unit!15492)

(declare-fun e!296327 () Unit!15492)

(assert (=> b!506265 (= lt!230989 e!296327)))

(declare-fun c!59795 () Bool)

(assert (=> b!506265 (= c!59795 (= (select (arr!15637 a!3235) (index!18606 lt!230983)) (select (arr!15637 a!3235) j!176)))))

(assert (=> b!506265 (and (bvslt (x!47609 lt!230983) #b01111111111111111111111111111110) (or (= (select (arr!15637 a!3235) (index!18606 lt!230983)) (select (arr!15637 a!3235) j!176)) (= (select (arr!15637 a!3235) (index!18606 lt!230983)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15637 a!3235) (index!18606 lt!230983)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!506266 () Bool)

(declare-fun res!307235 () Bool)

(assert (=> b!506266 (=> res!307235 e!296319)))

(declare-fun lt!230991 () SeekEntryResult!4104)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32514 (_ BitVec 32)) SeekEntryResult!4104)

(assert (=> b!506266 (= res!307235 (not (= lt!230991 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230990 lt!230988 lt!230994 mask!3524))))))

(declare-fun b!506267 () Bool)

(assert (=> b!506267 (= e!296325 (not e!296323))))

(declare-fun res!307234 () Bool)

(assert (=> b!506267 (=> res!307234 e!296323)))

(get-info :version)

(assert (=> b!506267 (= res!307234 (or (= lt!230983 lt!230991) (undefined!4916 lt!230983) (not ((_ is Intermediate!4104) lt!230983))))))

(declare-fun lt!230986 () (_ BitVec 32))

(assert (=> b!506267 (= lt!230991 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230986 lt!230988 lt!230994 mask!3524))))

(assert (=> b!506267 (= lt!230983 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230990 (select (arr!15637 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506267 (= lt!230986 (toIndex!0 lt!230988 mask!3524))))

(assert (=> b!506267 (= lt!230988 (select (store (arr!15637 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!506267 (= lt!230990 (toIndex!0 (select (arr!15637 a!3235) j!176) mask!3524))))

(assert (=> b!506267 (= lt!230994 (array!32515 (store (arr!15637 a!3235) i!1204 k0!2280) (size!16001 a!3235)))))

(assert (=> b!506267 (= lt!230984 (Found!4104 j!176))))

(declare-fun e!296322 () Bool)

(assert (=> b!506267 e!296322))

(declare-fun res!307237 () Bool)

(assert (=> b!506267 (=> (not res!307237) (not e!296322))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32514 (_ BitVec 32)) Bool)

(assert (=> b!506267 (= res!307237 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!230995 () Unit!15492)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32514 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15492)

(assert (=> b!506267 (= lt!230995 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!506268 () Bool)

(assert (=> b!506268 (= e!296322 (= (seekEntryOrOpen!0 (select (arr!15637 a!3235) j!176) a!3235 mask!3524) (Found!4104 j!176)))))

(declare-fun b!506269 () Bool)

(declare-fun e!296321 () Bool)

(assert (=> b!506269 (= e!296321 false)))

(declare-fun b!506270 () Bool)

(declare-fun res!307244 () Bool)

(assert (=> b!506270 (=> (not res!307244) (not e!296326))))

(declare-fun arrayContainsKey!0 (array!32514 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506270 (= res!307244 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!506271 () Bool)

(declare-fun res!307231 () Bool)

(assert (=> b!506271 (=> (not res!307231) (not e!296325))))

(declare-datatypes ((List!9795 0))(
  ( (Nil!9792) (Cons!9791 (h!10668 (_ BitVec 64)) (t!16023 List!9795)) )
))
(declare-fun arrayNoDuplicates!0 (array!32514 (_ BitVec 32) List!9795) Bool)

(assert (=> b!506271 (= res!307231 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9792))))

(declare-fun b!506272 () Bool)

(assert (=> b!506272 (= e!296324 (validKeyInArray!0 lt!230988))))

(declare-fun b!506273 () Bool)

(declare-fun res!307242 () Bool)

(assert (=> b!506273 (=> (not res!307242) (not e!296326))))

(assert (=> b!506273 (= res!307242 (and (= (size!16001 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16001 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16001 a!3235)) (not (= i!1204 j!176))))))

(declare-fun e!296328 () Bool)

(declare-fun b!506274 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32514 (_ BitVec 32)) SeekEntryResult!4104)

(assert (=> b!506274 (= e!296328 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!230990 (index!18606 lt!230983) (select (arr!15637 a!3235) j!176) a!3235 mask!3524) lt!230984)))))

(declare-fun b!506275 () Bool)

(declare-fun res!307239 () Bool)

(assert (=> b!506275 (=> res!307239 e!296319)))

(assert (=> b!506275 (= res!307239 e!296328)))

(declare-fun res!307229 () Bool)

(assert (=> b!506275 (=> (not res!307229) (not e!296328))))

(assert (=> b!506275 (= res!307229 (bvsgt #b00000000000000000000000000000000 (x!47609 lt!230983)))))

(declare-fun res!307236 () Bool)

(assert (=> start!45758 (=> (not res!307236) (not e!296326))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45758 (= res!307236 (validMask!0 mask!3524))))

(assert (=> start!45758 e!296326))

(assert (=> start!45758 true))

(declare-fun array_inv!11433 (array!32514) Bool)

(assert (=> start!45758 (array_inv!11433 a!3235)))

(declare-fun b!506276 () Bool)

(declare-fun res!307243 () Bool)

(assert (=> b!506276 (=> (not res!307243) (not e!296325))))

(assert (=> b!506276 (= res!307243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!506277 () Bool)

(declare-fun res!307238 () Bool)

(assert (=> b!506277 (=> (not res!307238) (not e!296326))))

(assert (=> b!506277 (= res!307238 (validKeyInArray!0 k0!2280))))

(declare-fun b!506278 () Bool)

(declare-fun Unit!15494 () Unit!15492)

(assert (=> b!506278 (= e!296327 Unit!15494)))

(declare-fun b!506279 () Bool)

(declare-fun Unit!15495 () Unit!15492)

(assert (=> b!506279 (= e!296327 Unit!15495)))

(declare-fun lt!230993 () Unit!15492)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32514 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15492)

(assert (=> b!506279 (= lt!230993 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!230990 #b00000000000000000000000000000000 (index!18606 lt!230983) (x!47609 lt!230983) mask!3524))))

(declare-fun res!307230 () Bool)

(assert (=> b!506279 (= res!307230 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230990 lt!230988 lt!230994 mask!3524) (Intermediate!4104 false (index!18606 lt!230983) (x!47609 lt!230983))))))

(assert (=> b!506279 (=> (not res!307230) (not e!296321))))

(assert (=> b!506279 e!296321))

(assert (= (and start!45758 res!307236) b!506273))

(assert (= (and b!506273 res!307242) b!506263))

(assert (= (and b!506263 res!307240) b!506277))

(assert (= (and b!506277 res!307238) b!506270))

(assert (= (and b!506270 res!307244) b!506262))

(assert (= (and b!506262 res!307241) b!506276))

(assert (= (and b!506276 res!307243) b!506271))

(assert (= (and b!506271 res!307231) b!506267))

(assert (= (and b!506267 res!307237) b!506268))

(assert (= (and b!506267 (not res!307234)) b!506265))

(assert (= (and b!506265 c!59795) b!506279))

(assert (= (and b!506265 (not c!59795)) b!506278))

(assert (= (and b!506279 res!307230) b!506269))

(assert (= (and b!506265 (not res!307233)) b!506275))

(assert (= (and b!506275 res!307229) b!506274))

(assert (= (and b!506275 (not res!307239)) b!506266))

(assert (= (and b!506266 (not res!307235)) b!506264))

(assert (= (and b!506264 (not res!307232)) b!506272))

(declare-fun m!486907 () Bool)

(assert (=> b!506270 m!486907))

(declare-fun m!486909 () Bool)

(assert (=> start!45758 m!486909))

(declare-fun m!486911 () Bool)

(assert (=> start!45758 m!486911))

(declare-fun m!486913 () Bool)

(assert (=> b!506262 m!486913))

(declare-fun m!486915 () Bool)

(assert (=> b!506267 m!486915))

(declare-fun m!486917 () Bool)

(assert (=> b!506267 m!486917))

(declare-fun m!486919 () Bool)

(assert (=> b!506267 m!486919))

(declare-fun m!486921 () Bool)

(assert (=> b!506267 m!486921))

(declare-fun m!486923 () Bool)

(assert (=> b!506267 m!486923))

(declare-fun m!486925 () Bool)

(assert (=> b!506267 m!486925))

(assert (=> b!506267 m!486923))

(declare-fun m!486927 () Bool)

(assert (=> b!506267 m!486927))

(assert (=> b!506267 m!486923))

(declare-fun m!486929 () Bool)

(assert (=> b!506267 m!486929))

(declare-fun m!486931 () Bool)

(assert (=> b!506267 m!486931))

(declare-fun m!486933 () Bool)

(assert (=> b!506264 m!486933))

(declare-fun m!486935 () Bool)

(assert (=> b!506264 m!486935))

(declare-fun m!486937 () Bool)

(assert (=> b!506279 m!486937))

(declare-fun m!486939 () Bool)

(assert (=> b!506279 m!486939))

(assert (=> b!506274 m!486923))

(assert (=> b!506274 m!486923))

(declare-fun m!486941 () Bool)

(assert (=> b!506274 m!486941))

(declare-fun m!486943 () Bool)

(assert (=> b!506271 m!486943))

(declare-fun m!486945 () Bool)

(assert (=> b!506276 m!486945))

(declare-fun m!486947 () Bool)

(assert (=> b!506265 m!486947))

(declare-fun m!486949 () Bool)

(assert (=> b!506265 m!486949))

(assert (=> b!506265 m!486923))

(declare-fun m!486951 () Bool)

(assert (=> b!506272 m!486951))

(assert (=> b!506263 m!486923))

(assert (=> b!506263 m!486923))

(declare-fun m!486953 () Bool)

(assert (=> b!506263 m!486953))

(assert (=> b!506266 m!486939))

(assert (=> b!506268 m!486923))

(assert (=> b!506268 m!486923))

(declare-fun m!486955 () Bool)

(assert (=> b!506268 m!486955))

(declare-fun m!486957 () Bool)

(assert (=> b!506277 m!486957))

(check-sat (not b!506272) (not b!506262) (not b!506270) (not b!506263) (not b!506271) (not b!506277) (not b!506268) (not b!506276) (not b!506274) (not start!45758) (not b!506264) (not b!506265) (not b!506266) (not b!506267) (not b!506279))
(check-sat)
