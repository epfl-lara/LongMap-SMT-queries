; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66762 () Bool)

(assert start!66762)

(declare-fun b!769256 () Bool)

(declare-fun res!520213 () Bool)

(declare-fun e!428366 () Bool)

(assert (=> b!769256 (=> (not res!520213) (not e!428366))))

(declare-datatypes ((array!42324 0))(
  ( (array!42325 (arr!20262 (Array (_ BitVec 32) (_ BitVec 64))) (size!20683 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42324)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42324 (_ BitVec 32)) Bool)

(assert (=> b!769256 (= res!520213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!520208 () Bool)

(declare-fun e!428368 () Bool)

(assert (=> start!66762 (=> (not res!520208) (not e!428368))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66762 (= res!520208 (validMask!0 mask!3328))))

(assert (=> start!66762 e!428368))

(assert (=> start!66762 true))

(declare-fun array_inv!16058 (array!42324) Bool)

(assert (=> start!66762 (array_inv!16058 a!3186)))

(declare-fun b!769257 () Bool)

(declare-fun e!428360 () Bool)

(declare-fun e!428363 () Bool)

(assert (=> b!769257 (= e!428360 e!428363)))

(declare-fun res!520212 () Bool)

(assert (=> b!769257 (=> (not res!520212) (not e!428363))))

(declare-datatypes ((SeekEntryResult!7862 0))(
  ( (MissingZero!7862 (index!33816 (_ BitVec 32))) (Found!7862 (index!33817 (_ BitVec 32))) (Intermediate!7862 (undefined!8674 Bool) (index!33818 (_ BitVec 32)) (x!64753 (_ BitVec 32))) (Undefined!7862) (MissingVacant!7862 (index!33819 (_ BitVec 32))) )
))
(declare-fun lt!342253 () SeekEntryResult!7862)

(declare-fun lt!342251 () SeekEntryResult!7862)

(assert (=> b!769257 (= res!520212 (= lt!342253 lt!342251))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!342248 () array!42324)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!342250 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42324 (_ BitVec 32)) SeekEntryResult!7862)

(assert (=> b!769257 (= lt!342251 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342250 lt!342248 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769257 (= lt!342253 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342250 mask!3328) lt!342250 lt!342248 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!769257 (= lt!342250 (select (store (arr!20262 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!769257 (= lt!342248 (array!42325 (store (arr!20262 a!3186) i!1173 k!2102) (size!20683 a!3186)))))

(declare-fun b!769258 () Bool)

(declare-fun res!520214 () Bool)

(assert (=> b!769258 (=> (not res!520214) (not e!428360))))

(declare-fun e!428365 () Bool)

(assert (=> b!769258 (= res!520214 e!428365)))

(declare-fun c!84922 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!769258 (= c!84922 (bvsle x!1131 resIntermediateX!5))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!769259 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42324 (_ BitVec 32)) SeekEntryResult!7862)

(assert (=> b!769259 (= e!428365 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20262 a!3186) j!159) a!3186 mask!3328) (Found!7862 j!159)))))

(declare-fun b!769260 () Bool)

(declare-fun res!520210 () Bool)

(assert (=> b!769260 (=> (not res!520210) (not e!428368))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!769260 (= res!520210 (validKeyInArray!0 k!2102))))

(declare-fun b!769261 () Bool)

(assert (=> b!769261 (= e!428368 e!428366)))

(declare-fun res!520209 () Bool)

(assert (=> b!769261 (=> (not res!520209) (not e!428366))))

(declare-fun lt!342254 () SeekEntryResult!7862)

(assert (=> b!769261 (= res!520209 (or (= lt!342254 (MissingZero!7862 i!1173)) (= lt!342254 (MissingVacant!7862 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42324 (_ BitVec 32)) SeekEntryResult!7862)

(assert (=> b!769261 (= lt!342254 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!769262 () Bool)

(declare-fun res!520218 () Bool)

(assert (=> b!769262 (=> (not res!520218) (not e!428366))))

(declare-datatypes ((List!14264 0))(
  ( (Nil!14261) (Cons!14260 (h!15359 (_ BitVec 64)) (t!20579 List!14264)) )
))
(declare-fun arrayNoDuplicates!0 (array!42324 (_ BitVec 32) List!14264) Bool)

(assert (=> b!769262 (= res!520218 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14261))))

(declare-fun b!769263 () Bool)

(declare-fun res!520219 () Bool)

(assert (=> b!769263 (=> (not res!520219) (not e!428360))))

(assert (=> b!769263 (= res!520219 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20262 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!342249 () SeekEntryResult!7862)

(declare-fun e!428367 () Bool)

(declare-fun b!769264 () Bool)

(assert (=> b!769264 (= e!428367 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20262 a!3186) j!159) a!3186 mask!3328) lt!342249))))

(declare-fun b!769265 () Bool)

(declare-fun lt!342252 () SeekEntryResult!7862)

(assert (=> b!769265 (= e!428365 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20262 a!3186) j!159) a!3186 mask!3328) lt!342252))))

(declare-fun b!769266 () Bool)

(declare-fun res!520207 () Bool)

(assert (=> b!769266 (=> (not res!520207) (not e!428368))))

(declare-fun arrayContainsKey!0 (array!42324 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!769266 (= res!520207 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!769267 () Bool)

(declare-fun res!520216 () Bool)

(assert (=> b!769267 (=> (not res!520216) (not e!428368))))

(assert (=> b!769267 (= res!520216 (validKeyInArray!0 (select (arr!20262 a!3186) j!159)))))

(declare-fun b!769268 () Bool)

(assert (=> b!769268 (= e!428366 e!428360)))

(declare-fun res!520215 () Bool)

(assert (=> b!769268 (=> (not res!520215) (not e!428360))))

(assert (=> b!769268 (= res!520215 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20262 a!3186) j!159) mask!3328) (select (arr!20262 a!3186) j!159) a!3186 mask!3328) lt!342252))))

(assert (=> b!769268 (= lt!342252 (Intermediate!7862 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!769269 () Bool)

(declare-fun res!520211 () Bool)

(assert (=> b!769269 (=> (not res!520211) (not e!428366))))

(assert (=> b!769269 (= res!520211 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20683 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20683 a!3186))))))

(declare-fun b!769270 () Bool)

(declare-fun e!428369 () Bool)

(assert (=> b!769270 (= e!428363 (not e!428369))))

(declare-fun res!520220 () Bool)

(assert (=> b!769270 (=> res!520220 e!428369)))

(assert (=> b!769270 (= res!520220 (or (not (is-Intermediate!7862 lt!342251)) (bvsge x!1131 (x!64753 lt!342251))))))

(declare-fun e!428364 () Bool)

(assert (=> b!769270 e!428364))

(declare-fun res!520205 () Bool)

(assert (=> b!769270 (=> (not res!520205) (not e!428364))))

(assert (=> b!769270 (= res!520205 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26462 0))(
  ( (Unit!26463) )
))
(declare-fun lt!342245 () Unit!26462)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42324 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26462)

(assert (=> b!769270 (= lt!342245 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!769271 () Bool)

(assert (=> b!769271 (= e!428364 e!428367)))

(declare-fun res!520206 () Bool)

(assert (=> b!769271 (=> (not res!520206) (not e!428367))))

(assert (=> b!769271 (= res!520206 (= (seekEntryOrOpen!0 (select (arr!20262 a!3186) j!159) a!3186 mask!3328) lt!342249))))

(assert (=> b!769271 (= lt!342249 (Found!7862 j!159))))

(declare-fun b!769272 () Bool)

(declare-fun e!428361 () Unit!26462)

(declare-fun Unit!26464 () Unit!26462)

(assert (=> b!769272 (= e!428361 Unit!26464)))

(declare-fun lt!342247 () (_ BitVec 32))

(assert (=> b!769272 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342247 (select (arr!20262 a!3186) j!159) a!3186 mask!3328) lt!342252)))

(declare-fun b!769273 () Bool)

(assert (=> b!769273 (= e!428369 true)))

(declare-fun lt!342244 () Unit!26462)

(assert (=> b!769273 (= lt!342244 e!428361)))

(declare-fun c!84921 () Bool)

(assert (=> b!769273 (= c!84921 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769273 (= lt!342247 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!769274 () Bool)

(declare-fun res!520217 () Bool)

(assert (=> b!769274 (=> (not res!520217) (not e!428368))))

(assert (=> b!769274 (= res!520217 (and (= (size!20683 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20683 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20683 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!769275 () Bool)

(declare-fun Unit!26465 () Unit!26462)

(assert (=> b!769275 (= e!428361 Unit!26465)))

(declare-fun lt!342246 () SeekEntryResult!7862)

(assert (=> b!769275 (= lt!342246 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20262 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!769275 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342247 resIntermediateIndex!5 (select (arr!20262 a!3186) j!159) a!3186 mask!3328) (Found!7862 j!159))))

(assert (= (and start!66762 res!520208) b!769274))

(assert (= (and b!769274 res!520217) b!769267))

(assert (= (and b!769267 res!520216) b!769260))

(assert (= (and b!769260 res!520210) b!769266))

(assert (= (and b!769266 res!520207) b!769261))

(assert (= (and b!769261 res!520209) b!769256))

(assert (= (and b!769256 res!520213) b!769262))

(assert (= (and b!769262 res!520218) b!769269))

(assert (= (and b!769269 res!520211) b!769268))

(assert (= (and b!769268 res!520215) b!769263))

(assert (= (and b!769263 res!520219) b!769258))

(assert (= (and b!769258 c!84922) b!769265))

(assert (= (and b!769258 (not c!84922)) b!769259))

(assert (= (and b!769258 res!520214) b!769257))

(assert (= (and b!769257 res!520212) b!769270))

(assert (= (and b!769270 res!520205) b!769271))

(assert (= (and b!769271 res!520206) b!769264))

(assert (= (and b!769270 (not res!520220)) b!769273))

(assert (= (and b!769273 c!84921) b!769272))

(assert (= (and b!769273 (not c!84921)) b!769275))

(declare-fun m!714695 () Bool)

(assert (=> b!769271 m!714695))

(assert (=> b!769271 m!714695))

(declare-fun m!714697 () Bool)

(assert (=> b!769271 m!714697))

(assert (=> b!769259 m!714695))

(assert (=> b!769259 m!714695))

(declare-fun m!714699 () Bool)

(assert (=> b!769259 m!714699))

(declare-fun m!714701 () Bool)

(assert (=> b!769260 m!714701))

(assert (=> b!769267 m!714695))

(assert (=> b!769267 m!714695))

(declare-fun m!714703 () Bool)

(assert (=> b!769267 m!714703))

(assert (=> b!769268 m!714695))

(assert (=> b!769268 m!714695))

(declare-fun m!714705 () Bool)

(assert (=> b!769268 m!714705))

(assert (=> b!769268 m!714705))

(assert (=> b!769268 m!714695))

(declare-fun m!714707 () Bool)

(assert (=> b!769268 m!714707))

(declare-fun m!714709 () Bool)

(assert (=> b!769262 m!714709))

(assert (=> b!769275 m!714695))

(assert (=> b!769275 m!714695))

(assert (=> b!769275 m!714699))

(assert (=> b!769275 m!714695))

(declare-fun m!714711 () Bool)

(assert (=> b!769275 m!714711))

(declare-fun m!714713 () Bool)

(assert (=> b!769263 m!714713))

(declare-fun m!714715 () Bool)

(assert (=> b!769261 m!714715))

(declare-fun m!714717 () Bool)

(assert (=> b!769266 m!714717))

(declare-fun m!714719 () Bool)

(assert (=> b!769270 m!714719))

(declare-fun m!714721 () Bool)

(assert (=> b!769270 m!714721))

(assert (=> b!769265 m!714695))

(assert (=> b!769265 m!714695))

(declare-fun m!714723 () Bool)

(assert (=> b!769265 m!714723))

(declare-fun m!714725 () Bool)

(assert (=> b!769256 m!714725))

(declare-fun m!714727 () Bool)

(assert (=> b!769257 m!714727))

(declare-fun m!714729 () Bool)

(assert (=> b!769257 m!714729))

(declare-fun m!714731 () Bool)

(assert (=> b!769257 m!714731))

(assert (=> b!769257 m!714727))

(declare-fun m!714733 () Bool)

(assert (=> b!769257 m!714733))

(declare-fun m!714735 () Bool)

(assert (=> b!769257 m!714735))

(declare-fun m!714737 () Bool)

(assert (=> start!66762 m!714737))

(declare-fun m!714739 () Bool)

(assert (=> start!66762 m!714739))

(declare-fun m!714741 () Bool)

(assert (=> b!769273 m!714741))

(assert (=> b!769272 m!714695))

(assert (=> b!769272 m!714695))

(declare-fun m!714743 () Bool)

(assert (=> b!769272 m!714743))

(assert (=> b!769264 m!714695))

(assert (=> b!769264 m!714695))

(declare-fun m!714745 () Bool)

(assert (=> b!769264 m!714745))

(push 1)

