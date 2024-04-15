; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45600 () Bool)

(assert start!45600)

(declare-fun b!502263 () Bool)

(declare-fun e!294169 () Bool)

(assert (=> b!502263 (= e!294169 false)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!502264 () Bool)

(declare-datatypes ((array!32366 0))(
  ( (array!32367 (arr!15563 (Array (_ BitVec 32) (_ BitVec 64))) (size!15928 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32366)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!294174 () Bool)

(declare-datatypes ((SeekEntryResult!4027 0))(
  ( (MissingZero!4027 (index!18296 (_ BitVec 32))) (Found!4027 (index!18297 (_ BitVec 32))) (Intermediate!4027 (undefined!4839 Bool) (index!18298 (_ BitVec 32)) (x!47335 (_ BitVec 32))) (Undefined!4027) (MissingVacant!4027 (index!18299 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32366 (_ BitVec 32)) SeekEntryResult!4027)

(assert (=> b!502264 (= e!294174 (= (seekEntryOrOpen!0 (select (arr!15563 a!3235) j!176) a!3235 mask!3524) (Found!4027 j!176)))))

(declare-fun b!502265 () Bool)

(declare-fun e!294175 () Bool)

(declare-fun e!294170 () Bool)

(assert (=> b!502265 (= e!294175 e!294170)))

(declare-fun res!303823 () Bool)

(assert (=> b!502265 (=> res!303823 e!294170)))

(declare-fun lt!228212 () SeekEntryResult!4027)

(declare-fun lt!228206 () (_ BitVec 32))

(assert (=> b!502265 (= res!303823 (or (bvsgt (x!47335 lt!228212) #b01111111111111111111111111111110) (bvslt lt!228206 #b00000000000000000000000000000000) (bvsge lt!228206 (size!15928 a!3235)) (bvslt (index!18298 lt!228212) #b00000000000000000000000000000000) (bvsge (index!18298 lt!228212) (size!15928 a!3235)) (not (= lt!228212 (Intermediate!4027 false (index!18298 lt!228212) (x!47335 lt!228212))))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!502265 (= (index!18298 lt!228212) i!1204)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-datatypes ((Unit!15178 0))(
  ( (Unit!15179) )
))
(declare-fun lt!228209 () Unit!15178)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32366 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15178)

(assert (=> b!502265 (= lt!228209 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!228206 #b00000000000000000000000000000000 (index!18298 lt!228212) (x!47335 lt!228212) mask!3524))))

(assert (=> b!502265 (and (or (= (select (arr!15563 a!3235) (index!18298 lt!228212)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15563 a!3235) (index!18298 lt!228212)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15563 a!3235) (index!18298 lt!228212)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15563 a!3235) (index!18298 lt!228212)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228207 () Unit!15178)

(declare-fun e!294172 () Unit!15178)

(assert (=> b!502265 (= lt!228207 e!294172)))

(declare-fun c!59505 () Bool)

(assert (=> b!502265 (= c!59505 (= (select (arr!15563 a!3235) (index!18298 lt!228212)) (select (arr!15563 a!3235) j!176)))))

(assert (=> b!502265 (and (bvslt (x!47335 lt!228212) #b01111111111111111111111111111110) (or (= (select (arr!15563 a!3235) (index!18298 lt!228212)) (select (arr!15563 a!3235) j!176)) (= (select (arr!15563 a!3235) (index!18298 lt!228212)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15563 a!3235) (index!18298 lt!228212)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!502266 () Bool)

(declare-fun res!303820 () Bool)

(declare-fun e!294177 () Bool)

(assert (=> b!502266 (=> (not res!303820) (not e!294177))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!502266 (= res!303820 (validKeyInArray!0 (select (arr!15563 a!3235) j!176)))))

(declare-fun b!502267 () Bool)

(declare-fun res!303810 () Bool)

(assert (=> b!502267 (=> res!303810 e!294170)))

(declare-fun e!294171 () Bool)

(assert (=> b!502267 (= res!303810 e!294171)))

(declare-fun res!303813 () Bool)

(assert (=> b!502267 (=> (not res!303813) (not e!294171))))

(assert (=> b!502267 (= res!303813 (bvsgt #b00000000000000000000000000000000 (x!47335 lt!228212)))))

(declare-fun b!502268 () Bool)

(declare-fun res!303815 () Bool)

(declare-fun e!294176 () Bool)

(assert (=> b!502268 (=> (not res!303815) (not e!294176))))

(declare-datatypes ((List!9760 0))(
  ( (Nil!9757) (Cons!9756 (h!10633 (_ BitVec 64)) (t!15979 List!9760)) )
))
(declare-fun arrayNoDuplicates!0 (array!32366 (_ BitVec 32) List!9760) Bool)

(assert (=> b!502268 (= res!303815 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9757))))

(declare-fun b!502269 () Bool)

(declare-fun res!303822 () Bool)

(assert (=> b!502269 (=> (not res!303822) (not e!294177))))

(declare-fun arrayContainsKey!0 (array!32366 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!502269 (= res!303822 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!502270 () Bool)

(declare-fun res!303819 () Bool)

(assert (=> b!502270 (=> (not res!303819) (not e!294177))))

(assert (=> b!502270 (= res!303819 (and (= (size!15928 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15928 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15928 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!502271 () Bool)

(assert (=> b!502271 (= e!294176 (not e!294175))))

(declare-fun res!303821 () Bool)

(assert (=> b!502271 (=> res!303821 e!294175)))

(declare-fun lt!228213 () (_ BitVec 64))

(declare-fun lt!228208 () array!32366)

(declare-fun lt!228204 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32366 (_ BitVec 32)) SeekEntryResult!4027)

(assert (=> b!502271 (= res!303821 (= lt!228212 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228204 lt!228213 lt!228208 mask!3524)))))

(assert (=> b!502271 (= lt!228212 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228206 (select (arr!15563 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!502271 (= lt!228204 (toIndex!0 lt!228213 mask!3524))))

(assert (=> b!502271 (= lt!228213 (select (store (arr!15563 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!502271 (= lt!228206 (toIndex!0 (select (arr!15563 a!3235) j!176) mask!3524))))

(assert (=> b!502271 (= lt!228208 (array!32367 (store (arr!15563 a!3235) i!1204 k0!2280) (size!15928 a!3235)))))

(assert (=> b!502271 e!294174))

(declare-fun res!303811 () Bool)

(assert (=> b!502271 (=> (not res!303811) (not e!294174))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32366 (_ BitVec 32)) Bool)

(assert (=> b!502271 (= res!303811 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!228214 () Unit!15178)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32366 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15178)

(assert (=> b!502271 (= lt!228214 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!502273 () Bool)

(assert (=> b!502273 (= e!294170 true)))

(declare-fun lt!228211 () SeekEntryResult!4027)

(assert (=> b!502273 (= lt!228211 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228206 lt!228213 lt!228208 mask!3524))))

(declare-fun b!502274 () Bool)

(declare-fun res!303812 () Bool)

(assert (=> b!502274 (=> (not res!303812) (not e!294177))))

(assert (=> b!502274 (= res!303812 (validKeyInArray!0 k0!2280))))

(declare-fun b!502275 () Bool)

(assert (=> b!502275 (= e!294177 e!294176)))

(declare-fun res!303824 () Bool)

(assert (=> b!502275 (=> (not res!303824) (not e!294176))))

(declare-fun lt!228205 () SeekEntryResult!4027)

(assert (=> b!502275 (= res!303824 (or (= lt!228205 (MissingZero!4027 i!1204)) (= lt!228205 (MissingVacant!4027 i!1204))))))

(assert (=> b!502275 (= lt!228205 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!502276 () Bool)

(declare-fun Unit!15180 () Unit!15178)

(assert (=> b!502276 (= e!294172 Unit!15180)))

(declare-fun lt!228210 () Unit!15178)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32366 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15178)

(assert (=> b!502276 (= lt!228210 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!228206 #b00000000000000000000000000000000 (index!18298 lt!228212) (x!47335 lt!228212) mask!3524))))

(declare-fun res!303814 () Bool)

(assert (=> b!502276 (= res!303814 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228206 lt!228213 lt!228208 mask!3524) (Intermediate!4027 false (index!18298 lt!228212) (x!47335 lt!228212))))))

(assert (=> b!502276 (=> (not res!303814) (not e!294169))))

(assert (=> b!502276 e!294169))

(declare-fun b!502277 () Bool)

(declare-fun Unit!15181 () Unit!15178)

(assert (=> b!502277 (= e!294172 Unit!15181)))

(declare-fun b!502278 () Bool)

(declare-fun res!303818 () Bool)

(assert (=> b!502278 (=> res!303818 e!294175)))

(get-info :version)

(assert (=> b!502278 (= res!303818 (or (undefined!4839 lt!228212) (not ((_ is Intermediate!4027) lt!228212))))))

(declare-fun b!502279 () Bool)

(declare-fun res!303817 () Bool)

(assert (=> b!502279 (=> (not res!303817) (not e!294176))))

(assert (=> b!502279 (= res!303817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!502272 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32366 (_ BitVec 32)) SeekEntryResult!4027)

(assert (=> b!502272 (= e!294171 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228206 (index!18298 lt!228212) (select (arr!15563 a!3235) j!176) a!3235 mask!3524) (Found!4027 j!176))))))

(declare-fun res!303816 () Bool)

(assert (=> start!45600 (=> (not res!303816) (not e!294177))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45600 (= res!303816 (validMask!0 mask!3524))))

(assert (=> start!45600 e!294177))

(assert (=> start!45600 true))

(declare-fun array_inv!11446 (array!32366) Bool)

(assert (=> start!45600 (array_inv!11446 a!3235)))

(assert (= (and start!45600 res!303816) b!502270))

(assert (= (and b!502270 res!303819) b!502266))

(assert (= (and b!502266 res!303820) b!502274))

(assert (= (and b!502274 res!303812) b!502269))

(assert (= (and b!502269 res!303822) b!502275))

(assert (= (and b!502275 res!303824) b!502279))

(assert (= (and b!502279 res!303817) b!502268))

(assert (= (and b!502268 res!303815) b!502271))

(assert (= (and b!502271 res!303811) b!502264))

(assert (= (and b!502271 (not res!303821)) b!502278))

(assert (= (and b!502278 (not res!303818)) b!502265))

(assert (= (and b!502265 c!59505) b!502276))

(assert (= (and b!502265 (not c!59505)) b!502277))

(assert (= (and b!502276 res!303814) b!502263))

(assert (= (and b!502265 (not res!303823)) b!502267))

(assert (= (and b!502267 res!303813) b!502272))

(assert (= (and b!502267 (not res!303810)) b!502273))

(declare-fun m!482707 () Bool)

(assert (=> b!502273 m!482707))

(declare-fun m!482709 () Bool)

(assert (=> b!502269 m!482709))

(declare-fun m!482711 () Bool)

(assert (=> b!502266 m!482711))

(assert (=> b!502266 m!482711))

(declare-fun m!482713 () Bool)

(assert (=> b!502266 m!482713))

(declare-fun m!482715 () Bool)

(assert (=> b!502275 m!482715))

(assert (=> b!502272 m!482711))

(assert (=> b!502272 m!482711))

(declare-fun m!482717 () Bool)

(assert (=> b!502272 m!482717))

(assert (=> b!502271 m!482711))

(declare-fun m!482719 () Bool)

(assert (=> b!502271 m!482719))

(declare-fun m!482721 () Bool)

(assert (=> b!502271 m!482721))

(declare-fun m!482723 () Bool)

(assert (=> b!502271 m!482723))

(declare-fun m!482725 () Bool)

(assert (=> b!502271 m!482725))

(declare-fun m!482727 () Bool)

(assert (=> b!502271 m!482727))

(assert (=> b!502271 m!482711))

(declare-fun m!482729 () Bool)

(assert (=> b!502271 m!482729))

(assert (=> b!502271 m!482711))

(declare-fun m!482731 () Bool)

(assert (=> b!502271 m!482731))

(declare-fun m!482733 () Bool)

(assert (=> b!502271 m!482733))

(declare-fun m!482735 () Bool)

(assert (=> start!45600 m!482735))

(declare-fun m!482737 () Bool)

(assert (=> start!45600 m!482737))

(declare-fun m!482739 () Bool)

(assert (=> b!502265 m!482739))

(declare-fun m!482741 () Bool)

(assert (=> b!502265 m!482741))

(assert (=> b!502265 m!482711))

(assert (=> b!502264 m!482711))

(assert (=> b!502264 m!482711))

(declare-fun m!482743 () Bool)

(assert (=> b!502264 m!482743))

(declare-fun m!482745 () Bool)

(assert (=> b!502276 m!482745))

(assert (=> b!502276 m!482707))

(declare-fun m!482747 () Bool)

(assert (=> b!502279 m!482747))

(declare-fun m!482749 () Bool)

(assert (=> b!502268 m!482749))

(declare-fun m!482751 () Bool)

(assert (=> b!502274 m!482751))

(check-sat (not b!502273) (not b!502274) (not b!502272) (not b!502275) (not b!502276) (not b!502279) (not b!502264) (not b!502266) (not b!502269) (not b!502268) (not b!502271) (not b!502265) (not start!45600))
(check-sat)
