; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65634 () Bool)

(assert start!65634)

(declare-fun b!751299 () Bool)

(declare-fun e!419127 () Bool)

(declare-fun e!419119 () Bool)

(assert (=> b!751299 (= e!419127 (not e!419119))))

(declare-fun res!507198 () Bool)

(assert (=> b!751299 (=> res!507198 e!419119)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7617 0))(
  ( (MissingZero!7617 (index!32836 (_ BitVec 32))) (Found!7617 (index!32837 (_ BitVec 32))) (Intermediate!7617 (undefined!8429 Bool) (index!32838 (_ BitVec 32)) (x!63759 (_ BitVec 32))) (Undefined!7617) (MissingVacant!7617 (index!32839 (_ BitVec 32))) )
))
(declare-fun lt!334112 () SeekEntryResult!7617)

(get-info :version)

(assert (=> b!751299 (= res!507198 (or (not ((_ is Intermediate!7617) lt!334112)) (bvslt x!1131 (x!63759 lt!334112)) (not (= x!1131 (x!63759 lt!334112))) (not (= index!1321 (index!32838 lt!334112)))))))

(declare-fun e!419121 () Bool)

(assert (=> b!751299 e!419121))

(declare-fun res!507214 () Bool)

(assert (=> b!751299 (=> (not res!507214) (not e!419121))))

(declare-fun lt!334116 () SeekEntryResult!7617)

(declare-fun lt!334113 () SeekEntryResult!7617)

(assert (=> b!751299 (= res!507214 (= lt!334116 lt!334113))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!751299 (= lt!334113 (Found!7617 j!159))))

(declare-datatypes ((array!41807 0))(
  ( (array!41808 (arr!20017 (Array (_ BitVec 32) (_ BitVec 64))) (size!20438 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41807)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41807 (_ BitVec 32)) SeekEntryResult!7617)

(assert (=> b!751299 (= lt!334116 (seekEntryOrOpen!0 (select (arr!20017 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41807 (_ BitVec 32)) Bool)

(assert (=> b!751299 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25848 0))(
  ( (Unit!25849) )
))
(declare-fun lt!334114 () Unit!25848)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41807 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25848)

(assert (=> b!751299 (= lt!334114 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!751300 () Bool)

(declare-fun e!419128 () Unit!25848)

(declare-fun Unit!25850 () Unit!25848)

(assert (=> b!751300 (= e!419128 Unit!25850)))

(assert (=> b!751300 false))

(declare-fun b!751301 () Bool)

(declare-fun res!507206 () Bool)

(declare-fun e!419122 () Bool)

(assert (=> b!751301 (=> (not res!507206) (not e!419122))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!751301 (= res!507206 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20017 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!751302 () Bool)

(declare-fun res!507212 () Bool)

(declare-fun e!419125 () Bool)

(assert (=> b!751302 (=> (not res!507212) (not e!419125))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!751302 (= res!507212 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20438 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20438 a!3186))))))

(declare-fun b!751303 () Bool)

(declare-fun res!507215 () Bool)

(assert (=> b!751303 (=> (not res!507215) (not e!419125))))

(declare-datatypes ((List!14019 0))(
  ( (Nil!14016) (Cons!14015 (h!15087 (_ BitVec 64)) (t!20334 List!14019)) )
))
(declare-fun arrayNoDuplicates!0 (array!41807 (_ BitVec 32) List!14019) Bool)

(assert (=> b!751303 (= res!507215 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14016))))

(declare-fun b!751304 () Bool)

(declare-fun res!507210 () Bool)

(declare-fun e!419126 () Bool)

(assert (=> b!751304 (=> (not res!507210) (not e!419126))))

(assert (=> b!751304 (= res!507210 (and (= (size!20438 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20438 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20438 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!751305 () Bool)

(declare-fun res!507199 () Bool)

(assert (=> b!751305 (=> (not res!507199) (not e!419126))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41807 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!751305 (= res!507199 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!751306 () Bool)

(declare-fun res!507211 () Bool)

(assert (=> b!751306 (=> (not res!507211) (not e!419126))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!751306 (= res!507211 (validKeyInArray!0 (select (arr!20017 a!3186) j!159)))))

(declare-fun b!751307 () Bool)

(declare-fun res!507203 () Bool)

(assert (=> b!751307 (=> res!507203 e!419119)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41807 (_ BitVec 32)) SeekEntryResult!7617)

(assert (=> b!751307 (= res!507203 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20017 a!3186) j!159) a!3186 mask!3328) lt!334113)))))

(declare-fun b!751308 () Bool)

(declare-fun e!419120 () Bool)

(assert (=> b!751308 (= e!419120 true)))

(declare-fun e!419123 () Bool)

(assert (=> b!751308 e!419123))

(declare-fun res!507209 () Bool)

(assert (=> b!751308 (=> (not res!507209) (not e!419123))))

(declare-fun lt!334119 () (_ BitVec 64))

(assert (=> b!751308 (= res!507209 (= lt!334119 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!334120 () Unit!25848)

(assert (=> b!751308 (= lt!334120 e!419128)))

(declare-fun c!82431 () Bool)

(assert (=> b!751308 (= c!82431 (= lt!334119 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!751309 () Bool)

(declare-fun lt!334117 () (_ BitVec 64))

(declare-fun lt!334115 () array!41807)

(assert (=> b!751309 (= e!419123 (= (seekEntryOrOpen!0 lt!334117 lt!334115 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334117 lt!334115 mask!3328)))))

(declare-fun b!751310 () Bool)

(declare-fun Unit!25851 () Unit!25848)

(assert (=> b!751310 (= e!419128 Unit!25851)))

(declare-fun b!751311 () Bool)

(assert (=> b!751311 (= e!419121 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20017 a!3186) j!159) a!3186 mask!3328) lt!334113))))

(declare-fun b!751312 () Bool)

(assert (=> b!751312 (= e!419126 e!419125)))

(declare-fun res!507213 () Bool)

(assert (=> b!751312 (=> (not res!507213) (not e!419125))))

(declare-fun lt!334111 () SeekEntryResult!7617)

(assert (=> b!751312 (= res!507213 (or (= lt!334111 (MissingZero!7617 i!1173)) (= lt!334111 (MissingVacant!7617 i!1173))))))

(assert (=> b!751312 (= lt!334111 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!507207 () Bool)

(assert (=> start!65634 (=> (not res!507207) (not e!419126))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65634 (= res!507207 (validMask!0 mask!3328))))

(assert (=> start!65634 e!419126))

(assert (=> start!65634 true))

(declare-fun array_inv!15813 (array!41807) Bool)

(assert (=> start!65634 (array_inv!15813 a!3186)))

(declare-fun e!419129 () Bool)

(declare-fun b!751313 () Bool)

(declare-fun lt!334118 () SeekEntryResult!7617)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41807 (_ BitVec 32)) SeekEntryResult!7617)

(assert (=> b!751313 (= e!419129 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20017 a!3186) j!159) a!3186 mask!3328) lt!334118))))

(declare-fun b!751314 () Bool)

(assert (=> b!751314 (= e!419129 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20017 a!3186) j!159) a!3186 mask!3328) (Found!7617 j!159)))))

(declare-fun b!751315 () Bool)

(assert (=> b!751315 (= e!419125 e!419122)))

(declare-fun res!507204 () Bool)

(assert (=> b!751315 (=> (not res!507204) (not e!419122))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!751315 (= res!507204 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20017 a!3186) j!159) mask!3328) (select (arr!20017 a!3186) j!159) a!3186 mask!3328) lt!334118))))

(assert (=> b!751315 (= lt!334118 (Intermediate!7617 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!751316 () Bool)

(assert (=> b!751316 (= e!419119 e!419120)))

(declare-fun res!507205 () Bool)

(assert (=> b!751316 (=> res!507205 e!419120)))

(assert (=> b!751316 (= res!507205 (= lt!334119 lt!334117))))

(assert (=> b!751316 (= lt!334119 (select (store (arr!20017 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!751317 () Bool)

(declare-fun res!507201 () Bool)

(assert (=> b!751317 (=> (not res!507201) (not e!419122))))

(assert (=> b!751317 (= res!507201 e!419129)))

(declare-fun c!82432 () Bool)

(assert (=> b!751317 (= c!82432 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!751318 () Bool)

(declare-fun res!507208 () Bool)

(assert (=> b!751318 (=> (not res!507208) (not e!419125))))

(assert (=> b!751318 (= res!507208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!751319 () Bool)

(declare-fun res!507202 () Bool)

(assert (=> b!751319 (=> (not res!507202) (not e!419126))))

(assert (=> b!751319 (= res!507202 (validKeyInArray!0 k0!2102))))

(declare-fun b!751320 () Bool)

(assert (=> b!751320 (= e!419122 e!419127)))

(declare-fun res!507200 () Bool)

(assert (=> b!751320 (=> (not res!507200) (not e!419127))))

(declare-fun lt!334121 () SeekEntryResult!7617)

(assert (=> b!751320 (= res!507200 (= lt!334121 lt!334112))))

(assert (=> b!751320 (= lt!334112 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334117 lt!334115 mask!3328))))

(assert (=> b!751320 (= lt!334121 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334117 mask!3328) lt!334117 lt!334115 mask!3328))))

(assert (=> b!751320 (= lt!334117 (select (store (arr!20017 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!751320 (= lt!334115 (array!41808 (store (arr!20017 a!3186) i!1173 k0!2102) (size!20438 a!3186)))))

(assert (= (and start!65634 res!507207) b!751304))

(assert (= (and b!751304 res!507210) b!751306))

(assert (= (and b!751306 res!507211) b!751319))

(assert (= (and b!751319 res!507202) b!751305))

(assert (= (and b!751305 res!507199) b!751312))

(assert (= (and b!751312 res!507213) b!751318))

(assert (= (and b!751318 res!507208) b!751303))

(assert (= (and b!751303 res!507215) b!751302))

(assert (= (and b!751302 res!507212) b!751315))

(assert (= (and b!751315 res!507204) b!751301))

(assert (= (and b!751301 res!507206) b!751317))

(assert (= (and b!751317 c!82432) b!751313))

(assert (= (and b!751317 (not c!82432)) b!751314))

(assert (= (and b!751317 res!507201) b!751320))

(assert (= (and b!751320 res!507200) b!751299))

(assert (= (and b!751299 res!507214) b!751311))

(assert (= (and b!751299 (not res!507198)) b!751307))

(assert (= (and b!751307 (not res!507203)) b!751316))

(assert (= (and b!751316 (not res!507205)) b!751308))

(assert (= (and b!751308 c!82431) b!751300))

(assert (= (and b!751308 (not c!82431)) b!751310))

(assert (= (and b!751308 res!507209) b!751309))

(declare-fun m!700511 () Bool)

(assert (=> b!751316 m!700511))

(declare-fun m!700513 () Bool)

(assert (=> b!751316 m!700513))

(declare-fun m!700515 () Bool)

(assert (=> b!751313 m!700515))

(assert (=> b!751313 m!700515))

(declare-fun m!700517 () Bool)

(assert (=> b!751313 m!700517))

(declare-fun m!700519 () Bool)

(assert (=> b!751301 m!700519))

(declare-fun m!700521 () Bool)

(assert (=> start!65634 m!700521))

(declare-fun m!700523 () Bool)

(assert (=> start!65634 m!700523))

(declare-fun m!700525 () Bool)

(assert (=> b!751305 m!700525))

(declare-fun m!700527 () Bool)

(assert (=> b!751312 m!700527))

(declare-fun m!700529 () Bool)

(assert (=> b!751319 m!700529))

(declare-fun m!700531 () Bool)

(assert (=> b!751303 m!700531))

(assert (=> b!751314 m!700515))

(assert (=> b!751314 m!700515))

(declare-fun m!700533 () Bool)

(assert (=> b!751314 m!700533))

(assert (=> b!751307 m!700515))

(assert (=> b!751307 m!700515))

(assert (=> b!751307 m!700533))

(declare-fun m!700535 () Bool)

(assert (=> b!751309 m!700535))

(declare-fun m!700537 () Bool)

(assert (=> b!751309 m!700537))

(declare-fun m!700539 () Bool)

(assert (=> b!751320 m!700539))

(assert (=> b!751320 m!700511))

(declare-fun m!700541 () Bool)

(assert (=> b!751320 m!700541))

(declare-fun m!700543 () Bool)

(assert (=> b!751320 m!700543))

(declare-fun m!700545 () Bool)

(assert (=> b!751320 m!700545))

(assert (=> b!751320 m!700541))

(declare-fun m!700547 () Bool)

(assert (=> b!751318 m!700547))

(assert (=> b!751306 m!700515))

(assert (=> b!751306 m!700515))

(declare-fun m!700549 () Bool)

(assert (=> b!751306 m!700549))

(assert (=> b!751299 m!700515))

(assert (=> b!751299 m!700515))

(declare-fun m!700551 () Bool)

(assert (=> b!751299 m!700551))

(declare-fun m!700553 () Bool)

(assert (=> b!751299 m!700553))

(declare-fun m!700555 () Bool)

(assert (=> b!751299 m!700555))

(assert (=> b!751311 m!700515))

(assert (=> b!751311 m!700515))

(declare-fun m!700557 () Bool)

(assert (=> b!751311 m!700557))

(assert (=> b!751315 m!700515))

(assert (=> b!751315 m!700515))

(declare-fun m!700559 () Bool)

(assert (=> b!751315 m!700559))

(assert (=> b!751315 m!700559))

(assert (=> b!751315 m!700515))

(declare-fun m!700561 () Bool)

(assert (=> b!751315 m!700561))

(check-sat (not b!751315) (not b!751312) (not b!751309) (not b!751320) (not b!751303) (not b!751307) (not b!751319) (not start!65634) (not b!751311) (not b!751318) (not b!751306) (not b!751314) (not b!751299) (not b!751305) (not b!751313))
(check-sat)
