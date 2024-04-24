; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64080 () Bool)

(assert start!64080)

(declare-fun b!719189 () Bool)

(declare-fun e!403741 () Bool)

(assert (=> b!719189 (= e!403741 false)))

(declare-datatypes ((array!40708 0))(
  ( (array!40709 (arr!19477 (Array (_ BitVec 32) (_ BitVec 64))) (size!19897 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40708)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7033 0))(
  ( (MissingZero!7033 (index!30500 (_ BitVec 32))) (Found!7033 (index!30501 (_ BitVec 32))) (Intermediate!7033 (undefined!7845 Bool) (index!30502 (_ BitVec 32)) (x!61667 (_ BitVec 32))) (Undefined!7033) (MissingVacant!7033 (index!30503 (_ BitVec 32))) )
))
(declare-fun lt!319626 () SeekEntryResult!7033)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40708 (_ BitVec 32)) SeekEntryResult!7033)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719189 (= lt!319626 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19477 a!3186) j!159) mask!3328) (select (arr!19477 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!719190 () Bool)

(declare-fun res!481435 () Bool)

(assert (=> b!719190 (=> (not res!481435) (not e!403741))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40708 (_ BitVec 32)) Bool)

(assert (=> b!719190 (= res!481435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719191 () Bool)

(declare-fun e!403742 () Bool)

(assert (=> b!719191 (= e!403742 e!403741)))

(declare-fun res!481441 () Bool)

(assert (=> b!719191 (=> (not res!481441) (not e!403741))))

(declare-fun lt!319625 () SeekEntryResult!7033)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!719191 (= res!481441 (or (= lt!319625 (MissingZero!7033 i!1173)) (= lt!319625 (MissingVacant!7033 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40708 (_ BitVec 32)) SeekEntryResult!7033)

(assert (=> b!719191 (= lt!319625 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!481436 () Bool)

(assert (=> start!64080 (=> (not res!481436) (not e!403742))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64080 (= res!481436 (validMask!0 mask!3328))))

(assert (=> start!64080 e!403742))

(assert (=> start!64080 true))

(declare-fun array_inv!15336 (array!40708) Bool)

(assert (=> start!64080 (array_inv!15336 a!3186)))

(declare-fun b!719192 () Bool)

(declare-fun res!481439 () Bool)

(assert (=> b!719192 (=> (not res!481439) (not e!403742))))

(declare-fun arrayContainsKey!0 (array!40708 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719192 (= res!481439 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719193 () Bool)

(declare-fun res!481440 () Bool)

(assert (=> b!719193 (=> (not res!481440) (not e!403742))))

(assert (=> b!719193 (= res!481440 (and (= (size!19897 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19897 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19897 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719194 () Bool)

(declare-fun res!481437 () Bool)

(assert (=> b!719194 (=> (not res!481437) (not e!403741))))

(declare-datatypes ((List!13386 0))(
  ( (Nil!13383) (Cons!13382 (h!14433 (_ BitVec 64)) (t!19693 List!13386)) )
))
(declare-fun arrayNoDuplicates!0 (array!40708 (_ BitVec 32) List!13386) Bool)

(assert (=> b!719194 (= res!481437 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13383))))

(declare-fun b!719195 () Bool)

(declare-fun res!481434 () Bool)

(assert (=> b!719195 (=> (not res!481434) (not e!403741))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!719195 (= res!481434 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19897 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19897 a!3186))))))

(declare-fun b!719196 () Bool)

(declare-fun res!481438 () Bool)

(assert (=> b!719196 (=> (not res!481438) (not e!403742))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719196 (= res!481438 (validKeyInArray!0 (select (arr!19477 a!3186) j!159)))))

(declare-fun b!719197 () Bool)

(declare-fun res!481433 () Bool)

(assert (=> b!719197 (=> (not res!481433) (not e!403742))))

(assert (=> b!719197 (= res!481433 (validKeyInArray!0 k0!2102))))

(assert (= (and start!64080 res!481436) b!719193))

(assert (= (and b!719193 res!481440) b!719196))

(assert (= (and b!719196 res!481438) b!719197))

(assert (= (and b!719197 res!481433) b!719192))

(assert (= (and b!719192 res!481439) b!719191))

(assert (= (and b!719191 res!481441) b!719190))

(assert (= (and b!719190 res!481435) b!719194))

(assert (= (and b!719194 res!481437) b!719195))

(assert (= (and b!719195 res!481434) b!719189))

(declare-fun m!675225 () Bool)

(assert (=> b!719192 m!675225))

(declare-fun m!675227 () Bool)

(assert (=> b!719190 m!675227))

(declare-fun m!675229 () Bool)

(assert (=> b!719191 m!675229))

(declare-fun m!675231 () Bool)

(assert (=> b!719189 m!675231))

(assert (=> b!719189 m!675231))

(declare-fun m!675233 () Bool)

(assert (=> b!719189 m!675233))

(assert (=> b!719189 m!675233))

(assert (=> b!719189 m!675231))

(declare-fun m!675235 () Bool)

(assert (=> b!719189 m!675235))

(declare-fun m!675237 () Bool)

(assert (=> b!719197 m!675237))

(declare-fun m!675239 () Bool)

(assert (=> b!719194 m!675239))

(declare-fun m!675241 () Bool)

(assert (=> start!64080 m!675241))

(declare-fun m!675243 () Bool)

(assert (=> start!64080 m!675243))

(assert (=> b!719196 m!675231))

(assert (=> b!719196 m!675231))

(declare-fun m!675245 () Bool)

(assert (=> b!719196 m!675245))

(check-sat (not b!719189) (not b!719194) (not b!719197) (not start!64080) (not b!719192) (not b!719190) (not b!719191) (not b!719196))
(check-sat)
