; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67666 () Bool)

(assert start!67666)

(declare-fun b!783690 () Bool)

(declare-fun e!435743 () Bool)

(declare-fun e!435752 () Bool)

(assert (=> b!783690 (= e!435743 (not e!435752))))

(declare-fun res!530229 () Bool)

(assert (=> b!783690 (=> res!530229 e!435752)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8041 0))(
  ( (MissingZero!8041 (index!34532 (_ BitVec 32))) (Found!8041 (index!34533 (_ BitVec 32))) (Intermediate!8041 (undefined!8853 Bool) (index!34534 (_ BitVec 32)) (x!65485 (_ BitVec 32))) (Undefined!8041) (MissingVacant!8041 (index!34535 (_ BitVec 32))) )
))
(declare-fun lt!349295 () SeekEntryResult!8041)

(assert (=> b!783690 (= res!530229 (or (not (is-Intermediate!8041 lt!349295)) (bvslt x!1131 (x!65485 lt!349295)) (not (= x!1131 (x!65485 lt!349295))) (not (= index!1321 (index!34534 lt!349295)))))))

(declare-fun e!435751 () Bool)

(assert (=> b!783690 e!435751))

(declare-fun res!530217 () Bool)

(assert (=> b!783690 (=> (not res!530217) (not e!435751))))

(declare-fun lt!349302 () SeekEntryResult!8041)

(declare-fun lt!349293 () SeekEntryResult!8041)

(assert (=> b!783690 (= res!530217 (= lt!349302 lt!349293))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!783690 (= lt!349293 (Found!8041 j!159))))

(declare-datatypes ((array!42706 0))(
  ( (array!42707 (arr!20441 (Array (_ BitVec 32) (_ BitVec 64))) (size!20862 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42706)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42706 (_ BitVec 32)) SeekEntryResult!8041)

(assert (=> b!783690 (= lt!349302 (seekEntryOrOpen!0 (select (arr!20441 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42706 (_ BitVec 32)) Bool)

(assert (=> b!783690 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!27052 0))(
  ( (Unit!27053) )
))
(declare-fun lt!349297 () Unit!27052)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42706 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27052)

(assert (=> b!783690 (= lt!349297 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!783691 () Bool)

(declare-fun res!530226 () Bool)

(declare-fun e!435745 () Bool)

(assert (=> b!783691 (=> (not res!530226) (not e!435745))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!783691 (= res!530226 (validKeyInArray!0 k!2102))))

(declare-fun b!783692 () Bool)

(declare-fun res!530224 () Bool)

(assert (=> b!783692 (=> (not res!530224) (not e!435745))))

(declare-fun arrayContainsKey!0 (array!42706 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!783692 (= res!530224 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!783693 () Bool)

(declare-fun res!530232 () Bool)

(declare-fun e!435741 () Bool)

(assert (=> b!783693 (=> (not res!530232) (not e!435741))))

(declare-datatypes ((List!14443 0))(
  ( (Nil!14440) (Cons!14439 (h!15562 (_ BitVec 64)) (t!20758 List!14443)) )
))
(declare-fun arrayNoDuplicates!0 (array!42706 (_ BitVec 32) List!14443) Bool)

(assert (=> b!783693 (= res!530232 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14440))))

(declare-fun b!783694 () Bool)

(declare-fun e!435747 () Bool)

(declare-fun lt!349304 () SeekEntryResult!8041)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42706 (_ BitVec 32)) SeekEntryResult!8041)

(assert (=> b!783694 (= e!435747 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20441 a!3186) j!159) a!3186 mask!3328) lt!349304))))

(declare-fun b!783695 () Bool)

(declare-fun res!530223 () Bool)

(declare-fun e!435746 () Bool)

(assert (=> b!783695 (=> (not res!530223) (not e!435746))))

(assert (=> b!783695 (= res!530223 e!435747)))

(declare-fun c!87145 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!783695 (= c!87145 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!783696 () Bool)

(declare-fun res!530220 () Bool)

(assert (=> b!783696 (=> (not res!530220) (not e!435745))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!783696 (= res!530220 (and (= (size!20862 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20862 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20862 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!783697 () Bool)

(declare-fun e!435750 () Bool)

(declare-fun e!435742 () Bool)

(assert (=> b!783697 (= e!435750 e!435742)))

(declare-fun res!530231 () Bool)

(assert (=> b!783697 (=> res!530231 e!435742)))

(declare-fun lt!349298 () (_ BitVec 64))

(declare-fun lt!349296 () (_ BitVec 64))

(assert (=> b!783697 (= res!530231 (= lt!349298 lt!349296))))

(assert (=> b!783697 (= lt!349298 (select (store (arr!20441 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!783698 () Bool)

(declare-fun res!530233 () Bool)

(assert (=> b!783698 (=> (not res!530233) (not e!435746))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!783698 (= res!530233 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20441 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!783699 () Bool)

(assert (=> b!783699 (= e!435752 e!435750)))

(declare-fun res!530228 () Bool)

(assert (=> b!783699 (=> res!530228 e!435750)))

(declare-fun lt!349299 () SeekEntryResult!8041)

(assert (=> b!783699 (= res!530228 (not (= lt!349299 lt!349293)))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42706 (_ BitVec 32)) SeekEntryResult!8041)

(assert (=> b!783699 (= lt!349299 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20441 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!783700 () Bool)

(assert (=> b!783700 (= e!435745 e!435741)))

(declare-fun res!530219 () Bool)

(assert (=> b!783700 (=> (not res!530219) (not e!435741))))

(declare-fun lt!349301 () SeekEntryResult!8041)

(assert (=> b!783700 (= res!530219 (or (= lt!349301 (MissingZero!8041 i!1173)) (= lt!349301 (MissingVacant!8041 i!1173))))))

(assert (=> b!783700 (= lt!349301 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun res!530230 () Bool)

(assert (=> start!67666 (=> (not res!530230) (not e!435745))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67666 (= res!530230 (validMask!0 mask!3328))))

(assert (=> start!67666 e!435745))

(assert (=> start!67666 true))

(declare-fun array_inv!16237 (array!42706) Bool)

(assert (=> start!67666 (array_inv!16237 a!3186)))

(declare-fun b!783701 () Bool)

(declare-fun e!435749 () Unit!27052)

(declare-fun Unit!27054 () Unit!27052)

(assert (=> b!783701 (= e!435749 Unit!27054)))

(declare-fun b!783702 () Bool)

(assert (=> b!783702 (= e!435741 e!435746)))

(declare-fun res!530225 () Bool)

(assert (=> b!783702 (=> (not res!530225) (not e!435746))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!783702 (= res!530225 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20441 a!3186) j!159) mask!3328) (select (arr!20441 a!3186) j!159) a!3186 mask!3328) lt!349304))))

(assert (=> b!783702 (= lt!349304 (Intermediate!8041 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!783703 () Bool)

(assert (=> b!783703 (= e!435746 e!435743)))

(declare-fun res!530227 () Bool)

(assert (=> b!783703 (=> (not res!530227) (not e!435743))))

(declare-fun lt!349303 () SeekEntryResult!8041)

(assert (=> b!783703 (= res!530227 (= lt!349303 lt!349295))))

(declare-fun lt!349300 () array!42706)

(assert (=> b!783703 (= lt!349295 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349296 lt!349300 mask!3328))))

(assert (=> b!783703 (= lt!349303 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349296 mask!3328) lt!349296 lt!349300 mask!3328))))

(assert (=> b!783703 (= lt!349296 (select (store (arr!20441 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!783703 (= lt!349300 (array!42707 (store (arr!20441 a!3186) i!1173 k!2102) (size!20862 a!3186)))))

(declare-fun b!783704 () Bool)

(assert (=> b!783704 (= e!435747 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20441 a!3186) j!159) a!3186 mask!3328) (Found!8041 j!159)))))

(declare-fun b!783705 () Bool)

(declare-fun Unit!27055 () Unit!27052)

(assert (=> b!783705 (= e!435749 Unit!27055)))

(assert (=> b!783705 false))

(declare-fun b!783706 () Bool)

(declare-fun res!530218 () Bool)

(assert (=> b!783706 (=> (not res!530218) (not e!435745))))

(assert (=> b!783706 (= res!530218 (validKeyInArray!0 (select (arr!20441 a!3186) j!159)))))

(declare-fun b!783707 () Bool)

(declare-fun res!530222 () Bool)

(assert (=> b!783707 (=> (not res!530222) (not e!435741))))

(assert (=> b!783707 (= res!530222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!783708 () Bool)

(assert (=> b!783708 (= e!435742 (= lt!349302 lt!349299))))

(declare-fun e!435744 () Bool)

(assert (=> b!783708 e!435744))

(declare-fun res!530234 () Bool)

(assert (=> b!783708 (=> (not res!530234) (not e!435744))))

(assert (=> b!783708 (= res!530234 (= lt!349298 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!349294 () Unit!27052)

(assert (=> b!783708 (= lt!349294 e!435749)))

(declare-fun c!87144 () Bool)

(assert (=> b!783708 (= c!87144 (= lt!349298 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!783709 () Bool)

(assert (=> b!783709 (= e!435751 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20441 a!3186) j!159) a!3186 mask!3328) lt!349293))))

(declare-fun b!783710 () Bool)

(declare-fun res!530221 () Bool)

(assert (=> b!783710 (=> (not res!530221) (not e!435741))))

(assert (=> b!783710 (= res!530221 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20862 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20862 a!3186))))))

(declare-fun b!783711 () Bool)

(assert (=> b!783711 (= e!435744 (= (seekEntryOrOpen!0 lt!349296 lt!349300 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349296 lt!349300 mask!3328)))))

(assert (= (and start!67666 res!530230) b!783696))

(assert (= (and b!783696 res!530220) b!783706))

(assert (= (and b!783706 res!530218) b!783691))

(assert (= (and b!783691 res!530226) b!783692))

(assert (= (and b!783692 res!530224) b!783700))

(assert (= (and b!783700 res!530219) b!783707))

(assert (= (and b!783707 res!530222) b!783693))

(assert (= (and b!783693 res!530232) b!783710))

(assert (= (and b!783710 res!530221) b!783702))

(assert (= (and b!783702 res!530225) b!783698))

(assert (= (and b!783698 res!530233) b!783695))

(assert (= (and b!783695 c!87145) b!783694))

(assert (= (and b!783695 (not c!87145)) b!783704))

(assert (= (and b!783695 res!530223) b!783703))

(assert (= (and b!783703 res!530227) b!783690))

(assert (= (and b!783690 res!530217) b!783709))

(assert (= (and b!783690 (not res!530229)) b!783699))

(assert (= (and b!783699 (not res!530228)) b!783697))

(assert (= (and b!783697 (not res!530231)) b!783708))

(assert (= (and b!783708 c!87144) b!783705))

(assert (= (and b!783708 (not c!87144)) b!783701))

(assert (= (and b!783708 res!530234) b!783711))

(declare-fun m!726193 () Bool)

(assert (=> b!783704 m!726193))

(assert (=> b!783704 m!726193))

(declare-fun m!726195 () Bool)

(assert (=> b!783704 m!726195))

(assert (=> b!783702 m!726193))

(assert (=> b!783702 m!726193))

(declare-fun m!726197 () Bool)

(assert (=> b!783702 m!726197))

(assert (=> b!783702 m!726197))

(assert (=> b!783702 m!726193))

(declare-fun m!726199 () Bool)

(assert (=> b!783702 m!726199))

(declare-fun m!726201 () Bool)

(assert (=> b!783707 m!726201))

(declare-fun m!726203 () Bool)

(assert (=> b!783698 m!726203))

(declare-fun m!726205 () Bool)

(assert (=> b!783711 m!726205))

(declare-fun m!726207 () Bool)

(assert (=> b!783711 m!726207))

(declare-fun m!726209 () Bool)

(assert (=> b!783692 m!726209))

(declare-fun m!726211 () Bool)

(assert (=> b!783697 m!726211))

(declare-fun m!726213 () Bool)

(assert (=> b!783697 m!726213))

(declare-fun m!726215 () Bool)

(assert (=> start!67666 m!726215))

(declare-fun m!726217 () Bool)

(assert (=> start!67666 m!726217))

(declare-fun m!726219 () Bool)

(assert (=> b!783703 m!726219))

(declare-fun m!726221 () Bool)

(assert (=> b!783703 m!726221))

(assert (=> b!783703 m!726211))

(assert (=> b!783703 m!726221))

(declare-fun m!726223 () Bool)

(assert (=> b!783703 m!726223))

(declare-fun m!726225 () Bool)

(assert (=> b!783703 m!726225))

(assert (=> b!783706 m!726193))

(assert (=> b!783706 m!726193))

(declare-fun m!726227 () Bool)

(assert (=> b!783706 m!726227))

(declare-fun m!726229 () Bool)

(assert (=> b!783700 m!726229))

(declare-fun m!726231 () Bool)

(assert (=> b!783693 m!726231))

(assert (=> b!783690 m!726193))

(assert (=> b!783690 m!726193))

(declare-fun m!726233 () Bool)

(assert (=> b!783690 m!726233))

(declare-fun m!726235 () Bool)

(assert (=> b!783690 m!726235))

(declare-fun m!726237 () Bool)

(assert (=> b!783690 m!726237))

(assert (=> b!783694 m!726193))

(assert (=> b!783694 m!726193))

(declare-fun m!726239 () Bool)

(assert (=> b!783694 m!726239))

(assert (=> b!783699 m!726193))

(assert (=> b!783699 m!726193))

(assert (=> b!783699 m!726195))

(assert (=> b!783709 m!726193))

(assert (=> b!783709 m!726193))

(declare-fun m!726241 () Bool)

(assert (=> b!783709 m!726241))

(declare-fun m!726243 () Bool)

(assert (=> b!783691 m!726243))

(push 1)

