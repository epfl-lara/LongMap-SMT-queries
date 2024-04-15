; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65858 () Bool)

(assert start!65858)

(declare-fun b!759253 () Bool)

(declare-fun res!513895 () Bool)

(declare-fun e!423237 () Bool)

(assert (=> b!759253 (=> (not res!513895) (not e!423237))))

(declare-fun e!423242 () Bool)

(assert (=> b!759253 (= res!513895 e!423242)))

(declare-fun c!83064 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!759253 (= c!83064 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!759254 () Bool)

(declare-fun res!513892 () Bool)

(declare-fun e!423238 () Bool)

(assert (=> b!759254 (=> (not res!513892) (not e!423238))))

(declare-datatypes ((array!42048 0))(
  ( (array!42049 (arr!20138 (Array (_ BitVec 32) (_ BitVec 64))) (size!20559 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42048)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42048 (_ BitVec 32)) Bool)

(assert (=> b!759254 (= res!513892 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!759255 () Bool)

(assert (=> b!759255 (= e!423238 e!423237)))

(declare-fun res!513899 () Bool)

(assert (=> b!759255 (=> (not res!513899) (not e!423237))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7735 0))(
  ( (MissingZero!7735 (index!33308 (_ BitVec 32))) (Found!7735 (index!33309 (_ BitVec 32))) (Intermediate!7735 (undefined!8547 Bool) (index!33310 (_ BitVec 32)) (x!64200 (_ BitVec 32))) (Undefined!7735) (MissingVacant!7735 (index!33311 (_ BitVec 32))) )
))
(declare-fun lt!338188 () SeekEntryResult!7735)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42048 (_ BitVec 32)) SeekEntryResult!7735)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!759255 (= res!513899 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20138 a!3186) j!159) mask!3328) (select (arr!20138 a!3186) j!159) a!3186 mask!3328) lt!338188))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!759255 (= lt!338188 (Intermediate!7735 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!513893 () Bool)

(declare-fun e!423240 () Bool)

(assert (=> start!65858 (=> (not res!513893) (not e!423240))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65858 (= res!513893 (validMask!0 mask!3328))))

(assert (=> start!65858 e!423240))

(assert (=> start!65858 true))

(declare-fun array_inv!16021 (array!42048) Bool)

(assert (=> start!65858 (array_inv!16021 a!3186)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!759256 () Bool)

(assert (=> b!759256 (= e!423242 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20138 a!3186) j!159) a!3186 mask!3328) lt!338188))))

(declare-fun b!759257 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42048 (_ BitVec 32)) SeekEntryResult!7735)

(assert (=> b!759257 (= e!423242 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20138 a!3186) j!159) a!3186 mask!3328) (Found!7735 j!159)))))

(declare-fun lt!338187 () SeekEntryResult!7735)

(declare-fun b!759258 () Bool)

(declare-fun e!423239 () Bool)

(assert (=> b!759258 (= e!423239 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20138 a!3186) j!159) a!3186 mask!3328) lt!338187))))

(declare-fun b!759259 () Bool)

(declare-fun res!513897 () Bool)

(assert (=> b!759259 (=> (not res!513897) (not e!423238))))

(declare-datatypes ((List!14179 0))(
  ( (Nil!14176) (Cons!14175 (h!15247 (_ BitVec 64)) (t!20485 List!14179)) )
))
(declare-fun arrayNoDuplicates!0 (array!42048 (_ BitVec 32) List!14179) Bool)

(assert (=> b!759259 (= res!513897 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14176))))

(declare-fun b!759260 () Bool)

(declare-fun res!513891 () Bool)

(assert (=> b!759260 (=> (not res!513891) (not e!423240))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!759260 (= res!513891 (and (= (size!20559 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20559 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20559 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!759261 () Bool)

(declare-fun res!513886 () Bool)

(assert (=> b!759261 (=> (not res!513886) (not e!423238))))

(assert (=> b!759261 (= res!513886 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20559 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20559 a!3186))))))

(declare-fun b!759262 () Bool)

(declare-fun e!423241 () Bool)

(assert (=> b!759262 (= e!423237 e!423241)))

(declare-fun res!513896 () Bool)

(assert (=> b!759262 (=> (not res!513896) (not e!423241))))

(declare-fun lt!338184 () array!42048)

(declare-fun lt!338189 () (_ BitVec 64))

(assert (=> b!759262 (= res!513896 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338189 mask!3328) lt!338189 lt!338184 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338189 lt!338184 mask!3328)))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!759262 (= lt!338189 (select (store (arr!20138 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!759262 (= lt!338184 (array!42049 (store (arr!20138 a!3186) i!1173 k0!2102) (size!20559 a!3186)))))

(declare-fun b!759263 () Bool)

(declare-fun e!423243 () Bool)

(assert (=> b!759263 (= e!423243 e!423239)))

(declare-fun res!513894 () Bool)

(assert (=> b!759263 (=> (not res!513894) (not e!423239))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42048 (_ BitVec 32)) SeekEntryResult!7735)

(assert (=> b!759263 (= res!513894 (= (seekEntryOrOpen!0 (select (arr!20138 a!3186) j!159) a!3186 mask!3328) lt!338187))))

(assert (=> b!759263 (= lt!338187 (Found!7735 j!159))))

(declare-fun b!759264 () Bool)

(assert (=> b!759264 (= e!423240 e!423238)))

(declare-fun res!513898 () Bool)

(assert (=> b!759264 (=> (not res!513898) (not e!423238))))

(declare-fun lt!338186 () SeekEntryResult!7735)

(assert (=> b!759264 (= res!513898 (or (= lt!338186 (MissingZero!7735 i!1173)) (= lt!338186 (MissingVacant!7735 i!1173))))))

(assert (=> b!759264 (= lt!338186 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!759265 () Bool)

(assert (=> b!759265 (= e!423241 (not true))))

(assert (=> b!759265 e!423243))

(declare-fun res!513900 () Bool)

(assert (=> b!759265 (=> (not res!513900) (not e!423243))))

(assert (=> b!759265 (= res!513900 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26282 0))(
  ( (Unit!26283) )
))
(declare-fun lt!338185 () Unit!26282)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42048 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26282)

(assert (=> b!759265 (= lt!338185 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!759266 () Bool)

(declare-fun res!513887 () Bool)

(assert (=> b!759266 (=> (not res!513887) (not e!423240))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!759266 (= res!513887 (validKeyInArray!0 k0!2102))))

(declare-fun b!759267 () Bool)

(declare-fun res!513890 () Bool)

(assert (=> b!759267 (=> (not res!513890) (not e!423237))))

(assert (=> b!759267 (= res!513890 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20138 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!759268 () Bool)

(declare-fun res!513888 () Bool)

(assert (=> b!759268 (=> (not res!513888) (not e!423240))))

(assert (=> b!759268 (= res!513888 (validKeyInArray!0 (select (arr!20138 a!3186) j!159)))))

(declare-fun b!759269 () Bool)

(declare-fun res!513889 () Bool)

(assert (=> b!759269 (=> (not res!513889) (not e!423240))))

(declare-fun arrayContainsKey!0 (array!42048 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!759269 (= res!513889 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!65858 res!513893) b!759260))

(assert (= (and b!759260 res!513891) b!759268))

(assert (= (and b!759268 res!513888) b!759266))

(assert (= (and b!759266 res!513887) b!759269))

(assert (= (and b!759269 res!513889) b!759264))

(assert (= (and b!759264 res!513898) b!759254))

(assert (= (and b!759254 res!513892) b!759259))

(assert (= (and b!759259 res!513897) b!759261))

(assert (= (and b!759261 res!513886) b!759255))

(assert (= (and b!759255 res!513899) b!759267))

(assert (= (and b!759267 res!513890) b!759253))

(assert (= (and b!759253 c!83064) b!759256))

(assert (= (and b!759253 (not c!83064)) b!759257))

(assert (= (and b!759253 res!513895) b!759262))

(assert (= (and b!759262 res!513896) b!759265))

(assert (= (and b!759265 res!513900) b!759263))

(assert (= (and b!759263 res!513894) b!759258))

(declare-fun m!706097 () Bool)

(assert (=> b!759257 m!706097))

(assert (=> b!759257 m!706097))

(declare-fun m!706099 () Bool)

(assert (=> b!759257 m!706099))

(declare-fun m!706101 () Bool)

(assert (=> b!759266 m!706101))

(assert (=> b!759256 m!706097))

(assert (=> b!759256 m!706097))

(declare-fun m!706103 () Bool)

(assert (=> b!759256 m!706103))

(assert (=> b!759268 m!706097))

(assert (=> b!759268 m!706097))

(declare-fun m!706105 () Bool)

(assert (=> b!759268 m!706105))

(declare-fun m!706107 () Bool)

(assert (=> b!759264 m!706107))

(assert (=> b!759263 m!706097))

(assert (=> b!759263 m!706097))

(declare-fun m!706109 () Bool)

(assert (=> b!759263 m!706109))

(declare-fun m!706111 () Bool)

(assert (=> b!759259 m!706111))

(declare-fun m!706113 () Bool)

(assert (=> b!759267 m!706113))

(declare-fun m!706115 () Bool)

(assert (=> b!759262 m!706115))

(declare-fun m!706117 () Bool)

(assert (=> b!759262 m!706117))

(declare-fun m!706119 () Bool)

(assert (=> b!759262 m!706119))

(assert (=> b!759262 m!706115))

(declare-fun m!706121 () Bool)

(assert (=> b!759262 m!706121))

(declare-fun m!706123 () Bool)

(assert (=> b!759262 m!706123))

(declare-fun m!706125 () Bool)

(assert (=> b!759265 m!706125))

(declare-fun m!706127 () Bool)

(assert (=> b!759265 m!706127))

(declare-fun m!706129 () Bool)

(assert (=> b!759254 m!706129))

(declare-fun m!706131 () Bool)

(assert (=> b!759269 m!706131))

(declare-fun m!706133 () Bool)

(assert (=> start!65858 m!706133))

(declare-fun m!706135 () Bool)

(assert (=> start!65858 m!706135))

(assert (=> b!759255 m!706097))

(assert (=> b!759255 m!706097))

(declare-fun m!706137 () Bool)

(assert (=> b!759255 m!706137))

(assert (=> b!759255 m!706137))

(assert (=> b!759255 m!706097))

(declare-fun m!706139 () Bool)

(assert (=> b!759255 m!706139))

(assert (=> b!759258 m!706097))

(assert (=> b!759258 m!706097))

(declare-fun m!706141 () Bool)

(assert (=> b!759258 m!706141))

(check-sat (not b!759259) (not start!65858) (not b!759254) (not b!759269) (not b!759263) (not b!759255) (not b!759266) (not b!759257) (not b!759264) (not b!759268) (not b!759262) (not b!759258) (not b!759256) (not b!759265))
(check-sat)
