; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65106 () Bool)

(assert start!65106)

(declare-fun e!411100 () Bool)

(declare-datatypes ((array!41279 0))(
  ( (array!41280 (arr!19753 (Array (_ BitVec 32) (_ BitVec 64))) (size!20174 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41279)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7353 0))(
  ( (MissingZero!7353 (index!31780 (_ BitVec 32))) (Found!7353 (index!31781 (_ BitVec 32))) (Intermediate!7353 (undefined!8165 Bool) (index!31782 (_ BitVec 32)) (x!62791 (_ BitVec 32))) (Undefined!7353) (MissingVacant!7353 (index!31783 (_ BitVec 32))) )
))
(declare-fun lt!325614 () SeekEntryResult!7353)

(declare-fun b!734702 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41279 (_ BitVec 32)) SeekEntryResult!7353)

(assert (=> b!734702 (= e!411100 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19753 a!3186) j!159) a!3186 mask!3328) lt!325614))))

(declare-fun b!734703 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41279 (_ BitVec 32)) SeekEntryResult!7353)

(assert (=> b!734703 (= e!411100 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19753 a!3186) j!159) a!3186 mask!3328) (Found!7353 j!159)))))

(declare-fun b!734704 () Bool)

(declare-fun e!411099 () Bool)

(declare-fun e!411098 () Bool)

(assert (=> b!734704 (= e!411099 e!411098)))

(declare-fun res!493579 () Bool)

(assert (=> b!734704 (=> (not res!493579) (not e!411098))))

(declare-fun lt!325620 () SeekEntryResult!7353)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41279 (_ BitVec 32)) SeekEntryResult!7353)

(assert (=> b!734704 (= res!493579 (= (seekEntryOrOpen!0 (select (arr!19753 a!3186) j!159) a!3186 mask!3328) lt!325620))))

(assert (=> b!734704 (= lt!325620 (Found!7353 j!159))))

(declare-fun b!734705 () Bool)

(declare-fun res!493563 () Bool)

(declare-fun e!411103 () Bool)

(assert (=> b!734705 (=> (not res!493563) (not e!411103))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41279 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!734705 (= res!493563 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!734706 () Bool)

(declare-fun e!411102 () Bool)

(declare-fun e!411101 () Bool)

(assert (=> b!734706 (= e!411102 e!411101)))

(declare-fun res!493574 () Bool)

(assert (=> b!734706 (=> (not res!493574) (not e!411101))))

(declare-fun lt!325617 () SeekEntryResult!7353)

(declare-fun lt!325618 () SeekEntryResult!7353)

(assert (=> b!734706 (= res!493574 (= lt!325617 lt!325618))))

(declare-fun lt!325619 () (_ BitVec 64))

(declare-fun lt!325615 () array!41279)

(assert (=> b!734706 (= lt!325618 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!325619 lt!325615 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!734706 (= lt!325617 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!325619 mask!3328) lt!325619 lt!325615 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!734706 (= lt!325619 (select (store (arr!19753 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!734706 (= lt!325615 (array!41280 (store (arr!19753 a!3186) i!1173 k0!2102) (size!20174 a!3186)))))

(declare-fun b!734707 () Bool)

(declare-fun e!411104 () Bool)

(assert (=> b!734707 (= e!411101 (not e!411104))))

(declare-fun res!493580 () Bool)

(assert (=> b!734707 (=> res!493580 e!411104)))

(get-info :version)

(assert (=> b!734707 (= res!493580 (or (not ((_ is Intermediate!7353) lt!325618)) (bvsge x!1131 (x!62791 lt!325618))))))

(assert (=> b!734707 e!411099))

(declare-fun res!493575 () Bool)

(assert (=> b!734707 (=> (not res!493575) (not e!411099))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41279 (_ BitVec 32)) Bool)

(assert (=> b!734707 (= res!493575 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25024 0))(
  ( (Unit!25025) )
))
(declare-fun lt!325622 () Unit!25024)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41279 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25024)

(assert (=> b!734707 (= lt!325622 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!734708 () Bool)

(declare-fun res!493571 () Bool)

(declare-fun e!411097 () Bool)

(assert (=> b!734708 (=> (not res!493571) (not e!411097))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!734708 (= res!493571 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20174 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20174 a!3186))))))

(declare-fun b!734709 () Bool)

(declare-fun res!493567 () Bool)

(assert (=> b!734709 (=> (not res!493567) (not e!411097))))

(declare-datatypes ((List!13755 0))(
  ( (Nil!13752) (Cons!13751 (h!14823 (_ BitVec 64)) (t!20070 List!13755)) )
))
(declare-fun arrayNoDuplicates!0 (array!41279 (_ BitVec 32) List!13755) Bool)

(assert (=> b!734709 (= res!493567 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13752))))

(declare-fun b!734710 () Bool)

(declare-fun res!493577 () Bool)

(assert (=> b!734710 (=> (not res!493577) (not e!411097))))

(assert (=> b!734710 (= res!493577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun e!411095 () Bool)

(declare-fun b!734711 () Bool)

(declare-fun lt!325621 () (_ BitVec 32))

(assert (=> b!734711 (= e!411095 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt lt!325621 #b00000000000000000000000000000000) (bvsge lt!325621 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun b!734712 () Bool)

(assert (=> b!734712 (= e!411103 e!411097)))

(declare-fun res!493570 () Bool)

(assert (=> b!734712 (=> (not res!493570) (not e!411097))))

(declare-fun lt!325616 () SeekEntryResult!7353)

(assert (=> b!734712 (= res!493570 (or (= lt!325616 (MissingZero!7353 i!1173)) (= lt!325616 (MissingVacant!7353 i!1173))))))

(assert (=> b!734712 (= lt!325616 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!734713 () Bool)

(declare-fun res!493564 () Bool)

(assert (=> b!734713 (=> (not res!493564) (not e!411103))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!734713 (= res!493564 (validKeyInArray!0 k0!2102))))

(declare-fun b!734714 () Bool)

(declare-fun res!493572 () Bool)

(assert (=> b!734714 (=> (not res!493572) (not e!411102))))

(assert (=> b!734714 (= res!493572 e!411100)))

(declare-fun c!80950 () Bool)

(assert (=> b!734714 (= c!80950 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!734715 () Bool)

(assert (=> b!734715 (= e!411104 e!411095)))

(declare-fun res!493569 () Bool)

(assert (=> b!734715 (=> res!493569 e!411095)))

(assert (=> b!734715 (= res!493569 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!734715 (= lt!325621 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!734716 () Bool)

(declare-fun res!493576 () Bool)

(assert (=> b!734716 (=> (not res!493576) (not e!411103))))

(assert (=> b!734716 (= res!493576 (and (= (size!20174 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20174 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20174 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!734717 () Bool)

(declare-fun res!493565 () Bool)

(assert (=> b!734717 (=> (not res!493565) (not e!411102))))

(assert (=> b!734717 (= res!493565 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19753 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!734718 () Bool)

(declare-fun res!493578 () Bool)

(assert (=> b!734718 (=> res!493578 e!411095)))

(assert (=> b!734718 (= res!493578 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19753 a!3186) j!159) a!3186 mask!3328) (Found!7353 j!159)))))

(declare-fun b!734719 () Bool)

(assert (=> b!734719 (= e!411097 e!411102)))

(declare-fun res!493568 () Bool)

(assert (=> b!734719 (=> (not res!493568) (not e!411102))))

(assert (=> b!734719 (= res!493568 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19753 a!3186) j!159) mask!3328) (select (arr!19753 a!3186) j!159) a!3186 mask!3328) lt!325614))))

(assert (=> b!734719 (= lt!325614 (Intermediate!7353 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!734720 () Bool)

(assert (=> b!734720 (= e!411098 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19753 a!3186) j!159) a!3186 mask!3328) lt!325620))))

(declare-fun res!493573 () Bool)

(assert (=> start!65106 (=> (not res!493573) (not e!411103))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65106 (= res!493573 (validMask!0 mask!3328))))

(assert (=> start!65106 e!411103))

(assert (=> start!65106 true))

(declare-fun array_inv!15549 (array!41279) Bool)

(assert (=> start!65106 (array_inv!15549 a!3186)))

(declare-fun b!734721 () Bool)

(declare-fun res!493566 () Bool)

(assert (=> b!734721 (=> (not res!493566) (not e!411103))))

(assert (=> b!734721 (= res!493566 (validKeyInArray!0 (select (arr!19753 a!3186) j!159)))))

(assert (= (and start!65106 res!493573) b!734716))

(assert (= (and b!734716 res!493576) b!734721))

(assert (= (and b!734721 res!493566) b!734713))

(assert (= (and b!734713 res!493564) b!734705))

(assert (= (and b!734705 res!493563) b!734712))

(assert (= (and b!734712 res!493570) b!734710))

(assert (= (and b!734710 res!493577) b!734709))

(assert (= (and b!734709 res!493567) b!734708))

(assert (= (and b!734708 res!493571) b!734719))

(assert (= (and b!734719 res!493568) b!734717))

(assert (= (and b!734717 res!493565) b!734714))

(assert (= (and b!734714 c!80950) b!734702))

(assert (= (and b!734714 (not c!80950)) b!734703))

(assert (= (and b!734714 res!493572) b!734706))

(assert (= (and b!734706 res!493574) b!734707))

(assert (= (and b!734707 res!493575) b!734704))

(assert (= (and b!734704 res!493579) b!734720))

(assert (= (and b!734707 (not res!493580)) b!734715))

(assert (= (and b!734715 (not res!493569)) b!734718))

(assert (= (and b!734718 (not res!493578)) b!734711))

(declare-fun m!687235 () Bool)

(assert (=> b!734713 m!687235))

(declare-fun m!687237 () Bool)

(assert (=> b!734717 m!687237))

(declare-fun m!687239 () Bool)

(assert (=> b!734721 m!687239))

(assert (=> b!734721 m!687239))

(declare-fun m!687241 () Bool)

(assert (=> b!734721 m!687241))

(assert (=> b!734720 m!687239))

(assert (=> b!734720 m!687239))

(declare-fun m!687243 () Bool)

(assert (=> b!734720 m!687243))

(assert (=> b!734703 m!687239))

(assert (=> b!734703 m!687239))

(declare-fun m!687245 () Bool)

(assert (=> b!734703 m!687245))

(declare-fun m!687247 () Bool)

(assert (=> b!734715 m!687247))

(declare-fun m!687249 () Bool)

(assert (=> b!734706 m!687249))

(declare-fun m!687251 () Bool)

(assert (=> b!734706 m!687251))

(declare-fun m!687253 () Bool)

(assert (=> b!734706 m!687253))

(assert (=> b!734706 m!687249))

(declare-fun m!687255 () Bool)

(assert (=> b!734706 m!687255))

(declare-fun m!687257 () Bool)

(assert (=> b!734706 m!687257))

(assert (=> b!734702 m!687239))

(assert (=> b!734702 m!687239))

(declare-fun m!687259 () Bool)

(assert (=> b!734702 m!687259))

(assert (=> b!734718 m!687239))

(assert (=> b!734718 m!687239))

(assert (=> b!734718 m!687245))

(assert (=> b!734719 m!687239))

(assert (=> b!734719 m!687239))

(declare-fun m!687261 () Bool)

(assert (=> b!734719 m!687261))

(assert (=> b!734719 m!687261))

(assert (=> b!734719 m!687239))

(declare-fun m!687263 () Bool)

(assert (=> b!734719 m!687263))

(declare-fun m!687265 () Bool)

(assert (=> b!734705 m!687265))

(declare-fun m!687267 () Bool)

(assert (=> start!65106 m!687267))

(declare-fun m!687269 () Bool)

(assert (=> start!65106 m!687269))

(declare-fun m!687271 () Bool)

(assert (=> b!734712 m!687271))

(declare-fun m!687273 () Bool)

(assert (=> b!734707 m!687273))

(declare-fun m!687275 () Bool)

(assert (=> b!734707 m!687275))

(assert (=> b!734704 m!687239))

(assert (=> b!734704 m!687239))

(declare-fun m!687277 () Bool)

(assert (=> b!734704 m!687277))

(declare-fun m!687279 () Bool)

(assert (=> b!734709 m!687279))

(declare-fun m!687281 () Bool)

(assert (=> b!734710 m!687281))

(check-sat (not b!734712) (not b!734710) (not b!734718) (not b!734720) (not b!734721) (not b!734719) (not b!734715) (not b!734702) (not b!734709) (not b!734704) (not b!734713) (not b!734703) (not b!734706) (not b!734705) (not start!65106) (not b!734707))
(check-sat)
