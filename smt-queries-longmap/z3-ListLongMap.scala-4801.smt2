; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65868 () Bool)

(assert start!65868)

(declare-fun b!759248 () Bool)

(declare-fun e!423276 () Bool)

(declare-fun e!423272 () Bool)

(assert (=> b!759248 (= e!423276 e!423272)))

(declare-fun res!513777 () Bool)

(assert (=> b!759248 (=> (not res!513777) (not e!423272))))

(declare-datatypes ((array!42041 0))(
  ( (array!42042 (arr!20134 (Array (_ BitVec 32) (_ BitVec 64))) (size!20555 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42041)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7734 0))(
  ( (MissingZero!7734 (index!33304 (_ BitVec 32))) (Found!7734 (index!33305 (_ BitVec 32))) (Intermediate!7734 (undefined!8546 Bool) (index!33306 (_ BitVec 32)) (x!64188 (_ BitVec 32))) (Undefined!7734) (MissingVacant!7734 (index!33307 (_ BitVec 32))) )
))
(declare-fun lt!338337 () SeekEntryResult!7734)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42041 (_ BitVec 32)) SeekEntryResult!7734)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!759248 (= res!513777 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20134 a!3186) j!159) mask!3328) (select (arr!20134 a!3186) j!159) a!3186 mask!3328) lt!338337))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!759248 (= lt!338337 (Intermediate!7734 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!759250 () Bool)

(declare-fun res!513784 () Bool)

(declare-fun e!423274 () Bool)

(assert (=> b!759250 (=> (not res!513784) (not e!423274))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42041 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!759250 (= res!513784 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!759251 () Bool)

(declare-fun res!513774 () Bool)

(assert (=> b!759251 (=> (not res!513774) (not e!423274))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!759251 (= res!513774 (validKeyInArray!0 (select (arr!20134 a!3186) j!159)))))

(declare-fun b!759252 () Bool)

(declare-fun res!513785 () Bool)

(assert (=> b!759252 (=> (not res!513785) (not e!423276))))

(declare-datatypes ((List!14136 0))(
  ( (Nil!14133) (Cons!14132 (h!15204 (_ BitVec 64)) (t!20451 List!14136)) )
))
(declare-fun arrayNoDuplicates!0 (array!42041 (_ BitVec 32) List!14136) Bool)

(assert (=> b!759252 (= res!513785 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14133))))

(declare-fun b!759253 () Bool)

(declare-fun res!513783 () Bool)

(assert (=> b!759253 (=> (not res!513783) (not e!423274))))

(assert (=> b!759253 (= res!513783 (validKeyInArray!0 k0!2102))))

(declare-fun b!759254 () Bool)

(assert (=> b!759254 (= e!423274 e!423276)))

(declare-fun res!513775 () Bool)

(assert (=> b!759254 (=> (not res!513775) (not e!423276))))

(declare-fun lt!338336 () SeekEntryResult!7734)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!759254 (= res!513775 (or (= lt!338336 (MissingZero!7734 i!1173)) (= lt!338336 (MissingVacant!7734 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42041 (_ BitVec 32)) SeekEntryResult!7734)

(assert (=> b!759254 (= lt!338336 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!759255 () Bool)

(declare-fun res!513773 () Bool)

(assert (=> b!759255 (=> (not res!513773) (not e!423272))))

(declare-fun e!423277 () Bool)

(assert (=> b!759255 (= res!513773 e!423277)))

(declare-fun c!83119 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!759255 (= c!83119 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!759256 () Bool)

(declare-fun res!513779 () Bool)

(assert (=> b!759256 (=> (not res!513779) (not e!423276))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!759256 (= res!513779 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20555 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20555 a!3186))))))

(declare-fun b!759257 () Bool)

(declare-fun res!513772 () Bool)

(assert (=> b!759257 (=> (not res!513772) (not e!423274))))

(assert (=> b!759257 (= res!513772 (and (= (size!20555 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20555 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20555 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!513776 () Bool)

(assert (=> start!65868 (=> (not res!513776) (not e!423274))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65868 (= res!513776 (validMask!0 mask!3328))))

(assert (=> start!65868 e!423274))

(assert (=> start!65868 true))

(declare-fun array_inv!15930 (array!42041) Bool)

(assert (=> start!65868 (array_inv!15930 a!3186)))

(declare-fun b!759249 () Bool)

(declare-fun res!513778 () Bool)

(assert (=> b!759249 (=> (not res!513778) (not e!423276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42041 (_ BitVec 32)) Bool)

(assert (=> b!759249 (= res!513778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!759258 () Bool)

(declare-fun res!513771 () Bool)

(assert (=> b!759258 (=> (not res!513771) (not e!423272))))

(assert (=> b!759258 (= res!513771 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20134 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!759259 () Bool)

(declare-fun e!423271 () Bool)

(assert (=> b!759259 (= e!423271 (not true))))

(declare-fun e!423275 () Bool)

(assert (=> b!759259 e!423275))

(declare-fun res!513780 () Bool)

(assert (=> b!759259 (=> (not res!513780) (not e!423275))))

(assert (=> b!759259 (= res!513780 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26308 0))(
  ( (Unit!26309) )
))
(declare-fun lt!338334 () Unit!26308)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42041 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26308)

(assert (=> b!759259 (= lt!338334 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun lt!338338 () SeekEntryResult!7734)

(declare-fun e!423273 () Bool)

(declare-fun b!759260 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42041 (_ BitVec 32)) SeekEntryResult!7734)

(assert (=> b!759260 (= e!423273 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20134 a!3186) j!159) a!3186 mask!3328) lt!338338))))

(declare-fun b!759261 () Bool)

(assert (=> b!759261 (= e!423275 e!423273)))

(declare-fun res!513782 () Bool)

(assert (=> b!759261 (=> (not res!513782) (not e!423273))))

(assert (=> b!759261 (= res!513782 (= (seekEntryOrOpen!0 (select (arr!20134 a!3186) j!159) a!3186 mask!3328) lt!338338))))

(assert (=> b!759261 (= lt!338338 (Found!7734 j!159))))

(declare-fun b!759262 () Bool)

(assert (=> b!759262 (= e!423277 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20134 a!3186) j!159) a!3186 mask!3328) (Found!7734 j!159)))))

(declare-fun b!759263 () Bool)

(assert (=> b!759263 (= e!423272 e!423271)))

(declare-fun res!513781 () Bool)

(assert (=> b!759263 (=> (not res!513781) (not e!423271))))

(declare-fun lt!338339 () (_ BitVec 64))

(declare-fun lt!338335 () array!42041)

(assert (=> b!759263 (= res!513781 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338339 mask!3328) lt!338339 lt!338335 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338339 lt!338335 mask!3328)))))

(assert (=> b!759263 (= lt!338339 (select (store (arr!20134 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!759263 (= lt!338335 (array!42042 (store (arr!20134 a!3186) i!1173 k0!2102) (size!20555 a!3186)))))

(declare-fun b!759264 () Bool)

(assert (=> b!759264 (= e!423277 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20134 a!3186) j!159) a!3186 mask!3328) lt!338337))))

(assert (= (and start!65868 res!513776) b!759257))

(assert (= (and b!759257 res!513772) b!759251))

(assert (= (and b!759251 res!513774) b!759253))

(assert (= (and b!759253 res!513783) b!759250))

(assert (= (and b!759250 res!513784) b!759254))

(assert (= (and b!759254 res!513775) b!759249))

(assert (= (and b!759249 res!513778) b!759252))

(assert (= (and b!759252 res!513785) b!759256))

(assert (= (and b!759256 res!513779) b!759248))

(assert (= (and b!759248 res!513777) b!759258))

(assert (= (and b!759258 res!513771) b!759255))

(assert (= (and b!759255 c!83119) b!759264))

(assert (= (and b!759255 (not c!83119)) b!759262))

(assert (= (and b!759255 res!513773) b!759263))

(assert (= (and b!759263 res!513781) b!759259))

(assert (= (and b!759259 res!513780) b!759261))

(assert (= (and b!759261 res!513782) b!759260))

(declare-fun m!706625 () Bool)

(assert (=> b!759258 m!706625))

(declare-fun m!706627 () Bool)

(assert (=> b!759259 m!706627))

(declare-fun m!706629 () Bool)

(assert (=> b!759259 m!706629))

(declare-fun m!706631 () Bool)

(assert (=> b!759254 m!706631))

(declare-fun m!706633 () Bool)

(assert (=> b!759251 m!706633))

(assert (=> b!759251 m!706633))

(declare-fun m!706635 () Bool)

(assert (=> b!759251 m!706635))

(declare-fun m!706637 () Bool)

(assert (=> b!759253 m!706637))

(declare-fun m!706639 () Bool)

(assert (=> b!759263 m!706639))

(declare-fun m!706641 () Bool)

(assert (=> b!759263 m!706641))

(declare-fun m!706643 () Bool)

(assert (=> b!759263 m!706643))

(declare-fun m!706645 () Bool)

(assert (=> b!759263 m!706645))

(declare-fun m!706647 () Bool)

(assert (=> b!759263 m!706647))

(assert (=> b!759263 m!706639))

(declare-fun m!706649 () Bool)

(assert (=> start!65868 m!706649))

(declare-fun m!706651 () Bool)

(assert (=> start!65868 m!706651))

(declare-fun m!706653 () Bool)

(assert (=> b!759249 m!706653))

(assert (=> b!759260 m!706633))

(assert (=> b!759260 m!706633))

(declare-fun m!706655 () Bool)

(assert (=> b!759260 m!706655))

(assert (=> b!759262 m!706633))

(assert (=> b!759262 m!706633))

(declare-fun m!706657 () Bool)

(assert (=> b!759262 m!706657))

(assert (=> b!759261 m!706633))

(assert (=> b!759261 m!706633))

(declare-fun m!706659 () Bool)

(assert (=> b!759261 m!706659))

(assert (=> b!759264 m!706633))

(assert (=> b!759264 m!706633))

(declare-fun m!706661 () Bool)

(assert (=> b!759264 m!706661))

(assert (=> b!759248 m!706633))

(assert (=> b!759248 m!706633))

(declare-fun m!706663 () Bool)

(assert (=> b!759248 m!706663))

(assert (=> b!759248 m!706663))

(assert (=> b!759248 m!706633))

(declare-fun m!706665 () Bool)

(assert (=> b!759248 m!706665))

(declare-fun m!706667 () Bool)

(assert (=> b!759250 m!706667))

(declare-fun m!706669 () Bool)

(assert (=> b!759252 m!706669))

(check-sat (not b!759261) (not b!759248) (not b!759251) (not b!759254) (not start!65868) (not b!759259) (not b!759263) (not b!759260) (not b!759250) (not b!759249) (not b!759264) (not b!759253) (not b!759252) (not b!759262))
(check-sat)
