; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64250 () Bool)

(assert start!64250)

(declare-fun b!721239 () Bool)

(declare-fun res!483190 () Bool)

(declare-fun e!404516 () Bool)

(assert (=> b!721239 (=> (not res!483190) (not e!404516))))

(declare-datatypes ((array!40821 0))(
  ( (array!40822 (arr!19532 (Array (_ BitVec 32) (_ BitVec 64))) (size!19952 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40821)

(declare-datatypes ((List!13441 0))(
  ( (Nil!13438) (Cons!13437 (h!14491 (_ BitVec 64)) (t!19748 List!13441)) )
))
(declare-fun arrayNoDuplicates!0 (array!40821 (_ BitVec 32) List!13441) Bool)

(assert (=> b!721239 (= res!483190 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13438))))

(declare-fun b!721240 () Bool)

(declare-fun e!404515 () Bool)

(assert (=> b!721240 (= e!404515 false)))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun lt!320047 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!721240 (= lt!320047 (toIndex!0 (select (store (arr!19532 a!3186) i!1173 k!2102) j!159) mask!3328))))

(declare-fun b!721241 () Bool)

(declare-fun res!483195 () Bool)

(assert (=> b!721241 (=> (not res!483195) (not e!404515))))

(declare-fun e!404513 () Bool)

(assert (=> b!721241 (= res!483195 e!404513)))

(declare-fun c!79397 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!721241 (= c!79397 (bvsle x!1131 resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!721242 () Bool)

(declare-datatypes ((SeekEntryResult!7088 0))(
  ( (MissingZero!7088 (index!30720 (_ BitVec 32))) (Found!7088 (index!30721 (_ BitVec 32))) (Intermediate!7088 (undefined!7900 Bool) (index!30722 (_ BitVec 32)) (x!61875 (_ BitVec 32))) (Undefined!7088) (MissingVacant!7088 (index!30723 (_ BitVec 32))) )
))
(declare-fun lt!320049 () SeekEntryResult!7088)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40821 (_ BitVec 32)) SeekEntryResult!7088)

(assert (=> b!721242 (= e!404513 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19532 a!3186) j!159) a!3186 mask!3328) lt!320049))))

(declare-fun b!721243 () Bool)

(declare-fun res!483198 () Bool)

(declare-fun e!404514 () Bool)

(assert (=> b!721243 (=> (not res!483198) (not e!404514))))

(declare-fun arrayContainsKey!0 (array!40821 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!721243 (= res!483198 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!721244 () Bool)

(declare-fun res!483192 () Bool)

(assert (=> b!721244 (=> (not res!483192) (not e!404516))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40821 (_ BitVec 32)) Bool)

(assert (=> b!721244 (= res!483192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!721245 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40821 (_ BitVec 32)) SeekEntryResult!7088)

(assert (=> b!721245 (= e!404513 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19532 a!3186) j!159) a!3186 mask!3328) (Found!7088 j!159)))))

(declare-fun b!721246 () Bool)

(assert (=> b!721246 (= e!404516 e!404515)))

(declare-fun res!483199 () Bool)

(assert (=> b!721246 (=> (not res!483199) (not e!404515))))

(assert (=> b!721246 (= res!483199 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19532 a!3186) j!159) mask!3328) (select (arr!19532 a!3186) j!159) a!3186 mask!3328) lt!320049))))

(assert (=> b!721246 (= lt!320049 (Intermediate!7088 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!721247 () Bool)

(declare-fun res!483191 () Bool)

(assert (=> b!721247 (=> (not res!483191) (not e!404514))))

(assert (=> b!721247 (= res!483191 (and (= (size!19952 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19952 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19952 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!483197 () Bool)

(assert (=> start!64250 (=> (not res!483197) (not e!404514))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64250 (= res!483197 (validMask!0 mask!3328))))

(assert (=> start!64250 e!404514))

(assert (=> start!64250 true))

(declare-fun array_inv!15391 (array!40821) Bool)

(assert (=> start!64250 (array_inv!15391 a!3186)))

(declare-fun b!721248 () Bool)

(declare-fun res!483189 () Bool)

(assert (=> b!721248 (=> (not res!483189) (not e!404514))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!721248 (= res!483189 (validKeyInArray!0 (select (arr!19532 a!3186) j!159)))))

(declare-fun b!721249 () Bool)

(assert (=> b!721249 (= e!404514 e!404516)))

(declare-fun res!483196 () Bool)

(assert (=> b!721249 (=> (not res!483196) (not e!404516))))

(declare-fun lt!320048 () SeekEntryResult!7088)

(assert (=> b!721249 (= res!483196 (or (= lt!320048 (MissingZero!7088 i!1173)) (= lt!320048 (MissingVacant!7088 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40821 (_ BitVec 32)) SeekEntryResult!7088)

(assert (=> b!721249 (= lt!320048 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!721250 () Bool)

(declare-fun res!483194 () Bool)

(assert (=> b!721250 (=> (not res!483194) (not e!404516))))

(assert (=> b!721250 (= res!483194 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19952 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19952 a!3186))))))

(declare-fun b!721251 () Bool)

(declare-fun res!483193 () Bool)

(assert (=> b!721251 (=> (not res!483193) (not e!404514))))

(assert (=> b!721251 (= res!483193 (validKeyInArray!0 k!2102))))

(declare-fun b!721252 () Bool)

(declare-fun res!483188 () Bool)

(assert (=> b!721252 (=> (not res!483188) (not e!404515))))

(assert (=> b!721252 (= res!483188 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19532 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!64250 res!483197) b!721247))

(assert (= (and b!721247 res!483191) b!721248))

(assert (= (and b!721248 res!483189) b!721251))

(assert (= (and b!721251 res!483193) b!721243))

(assert (= (and b!721243 res!483198) b!721249))

(assert (= (and b!721249 res!483196) b!721244))

(assert (= (and b!721244 res!483192) b!721239))

(assert (= (and b!721239 res!483190) b!721250))

(assert (= (and b!721250 res!483194) b!721246))

(assert (= (and b!721246 res!483199) b!721252))

(assert (= (and b!721252 res!483188) b!721241))

(assert (= (and b!721241 c!79397) b!721242))

(assert (= (and b!721241 (not c!79397)) b!721245))

(assert (= (and b!721241 res!483195) b!721240))

(declare-fun m!676747 () Bool)

(assert (=> b!721242 m!676747))

(assert (=> b!721242 m!676747))

(declare-fun m!676749 () Bool)

(assert (=> b!721242 m!676749))

(assert (=> b!721248 m!676747))

(assert (=> b!721248 m!676747))

(declare-fun m!676751 () Bool)

(assert (=> b!721248 m!676751))

(declare-fun m!676753 () Bool)

(assert (=> b!721249 m!676753))

(declare-fun m!676755 () Bool)

(assert (=> b!721239 m!676755))

(declare-fun m!676757 () Bool)

(assert (=> b!721240 m!676757))

(declare-fun m!676759 () Bool)

(assert (=> b!721240 m!676759))

(assert (=> b!721240 m!676759))

(declare-fun m!676761 () Bool)

(assert (=> b!721240 m!676761))

(assert (=> b!721246 m!676747))

(assert (=> b!721246 m!676747))

(declare-fun m!676763 () Bool)

(assert (=> b!721246 m!676763))

(assert (=> b!721246 m!676763))

(assert (=> b!721246 m!676747))

(declare-fun m!676765 () Bool)

(assert (=> b!721246 m!676765))

(assert (=> b!721245 m!676747))

(assert (=> b!721245 m!676747))

(declare-fun m!676767 () Bool)

(assert (=> b!721245 m!676767))

(declare-fun m!676769 () Bool)

(assert (=> start!64250 m!676769))

(declare-fun m!676771 () Bool)

(assert (=> start!64250 m!676771))

(declare-fun m!676773 () Bool)

(assert (=> b!721251 m!676773))

(declare-fun m!676775 () Bool)

(assert (=> b!721243 m!676775))

(declare-fun m!676777 () Bool)

(assert (=> b!721244 m!676777))

(declare-fun m!676779 () Bool)

(assert (=> b!721252 m!676779))

(push 1)

(assert (not b!721249))

(assert (not b!721245))

(assert (not b!721246))

(assert (not b!721243))

(assert (not b!721251))

(assert (not b!721239))

(assert (not b!721240))

(assert (not b!721244))

(assert (not b!721242))

(assert (not b!721248))

(assert (not start!64250))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

