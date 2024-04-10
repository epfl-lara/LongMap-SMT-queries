; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66478 () Bool)

(assert start!66478)

(declare-fun b!766167 () Bool)

(declare-fun e!426666 () Bool)

(declare-fun e!426660 () Bool)

(assert (=> b!766167 (= e!426666 e!426660)))

(declare-fun res!518327 () Bool)

(assert (=> b!766167 (=> (not res!518327) (not e!426660))))

(declare-datatypes ((array!42257 0))(
  ( (array!42258 (arr!20233 (Array (_ BitVec 32) (_ BitVec 64))) (size!20654 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42257)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7833 0))(
  ( (MissingZero!7833 (index!33700 (_ BitVec 32))) (Found!7833 (index!33701 (_ BitVec 32))) (Intermediate!7833 (undefined!8645 Bool) (index!33702 (_ BitVec 32)) (x!64607 (_ BitVec 32))) (Undefined!7833) (MissingVacant!7833 (index!33703 (_ BitVec 32))) )
))
(declare-fun lt!340808 () SeekEntryResult!7833)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42257 (_ BitVec 32)) SeekEntryResult!7833)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!766167 (= res!518327 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20233 a!3186) j!159) mask!3328) (select (arr!20233 a!3186) j!159) a!3186 mask!3328) lt!340808))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!766167 (= lt!340808 (Intermediate!7833 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!766168 () Bool)

(declare-fun res!518340 () Bool)

(assert (=> b!766168 (=> (not res!518340) (not e!426660))))

(declare-fun e!426658 () Bool)

(assert (=> b!766168 (= res!518340 e!426658)))

(declare-fun c!84310 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!766168 (= c!84310 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!518330 () Bool)

(declare-fun e!426662 () Bool)

(assert (=> start!66478 (=> (not res!518330) (not e!426662))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66478 (= res!518330 (validMask!0 mask!3328))))

(assert (=> start!66478 e!426662))

(assert (=> start!66478 true))

(declare-fun array_inv!16029 (array!42257) Bool)

(assert (=> start!66478 (array_inv!16029 a!3186)))

(declare-fun b!766169 () Bool)

(declare-fun res!518338 () Bool)

(assert (=> b!766169 (=> (not res!518338) (not e!426662))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42257 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!766169 (= res!518338 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!766170 () Bool)

(declare-fun res!518335 () Bool)

(assert (=> b!766170 (=> (not res!518335) (not e!426666))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!766170 (= res!518335 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20654 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20654 a!3186))))))

(declare-fun lt!340803 () SeekEntryResult!7833)

(declare-fun b!766171 () Bool)

(declare-fun e!426661 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42257 (_ BitVec 32)) SeekEntryResult!7833)

(assert (=> b!766171 (= e!426661 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20233 a!3186) j!159) a!3186 mask!3328) lt!340803))))

(declare-fun b!766172 () Bool)

(assert (=> b!766172 (= e!426658 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20233 a!3186) j!159) a!3186 mask!3328) (Found!7833 j!159)))))

(declare-fun b!766173 () Bool)

(declare-fun res!518332 () Bool)

(assert (=> b!766173 (=> (not res!518332) (not e!426666))))

(declare-datatypes ((List!14235 0))(
  ( (Nil!14232) (Cons!14231 (h!15321 (_ BitVec 64)) (t!20550 List!14235)) )
))
(declare-fun arrayNoDuplicates!0 (array!42257 (_ BitVec 32) List!14235) Bool)

(assert (=> b!766173 (= res!518332 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14232))))

(declare-fun b!766174 () Bool)

(declare-fun e!426665 () Bool)

(declare-fun e!426659 () Bool)

(assert (=> b!766174 (= e!426665 (not e!426659))))

(declare-fun res!518334 () Bool)

(assert (=> b!766174 (=> res!518334 e!426659)))

(declare-fun lt!340809 () SeekEntryResult!7833)

(get-info :version)

(assert (=> b!766174 (= res!518334 (or (not ((_ is Intermediate!7833) lt!340809)) (bvsge x!1131 (x!64607 lt!340809))))))

(declare-fun e!426664 () Bool)

(assert (=> b!766174 e!426664))

(declare-fun res!518328 () Bool)

(assert (=> b!766174 (=> (not res!518328) (not e!426664))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42257 (_ BitVec 32)) Bool)

(assert (=> b!766174 (= res!518328 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26392 0))(
  ( (Unit!26393) )
))
(declare-fun lt!340811 () Unit!26392)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42257 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26392)

(assert (=> b!766174 (= lt!340811 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!766175 () Bool)

(assert (=> b!766175 (= e!426662 e!426666)))

(declare-fun res!518326 () Bool)

(assert (=> b!766175 (=> (not res!518326) (not e!426666))))

(declare-fun lt!340810 () SeekEntryResult!7833)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!766175 (= res!518326 (or (= lt!340810 (MissingZero!7833 i!1173)) (= lt!340810 (MissingVacant!7833 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42257 (_ BitVec 32)) SeekEntryResult!7833)

(assert (=> b!766175 (= lt!340810 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!766176 () Bool)

(assert (=> b!766176 (= e!426658 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20233 a!3186) j!159) a!3186 mask!3328) lt!340808))))

(declare-fun b!766177 () Bool)

(declare-fun res!518339 () Bool)

(assert (=> b!766177 (=> (not res!518339) (not e!426660))))

(assert (=> b!766177 (= res!518339 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20233 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!766178 () Bool)

(declare-fun res!518331 () Bool)

(assert (=> b!766178 (=> (not res!518331) (not e!426666))))

(assert (=> b!766178 (= res!518331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!766179 () Bool)

(declare-fun res!518336 () Bool)

(assert (=> b!766179 (=> (not res!518336) (not e!426662))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!766179 (= res!518336 (validKeyInArray!0 (select (arr!20233 a!3186) j!159)))))

(declare-fun b!766180 () Bool)

(declare-fun res!518337 () Bool)

(assert (=> b!766180 (=> (not res!518337) (not e!426662))))

(assert (=> b!766180 (= res!518337 (validKeyInArray!0 k0!2102))))

(declare-fun b!766181 () Bool)

(assert (=> b!766181 (= e!426660 e!426665)))

(declare-fun res!518341 () Bool)

(assert (=> b!766181 (=> (not res!518341) (not e!426665))))

(declare-fun lt!340805 () SeekEntryResult!7833)

(assert (=> b!766181 (= res!518341 (= lt!340805 lt!340809))))

(declare-fun lt!340806 () array!42257)

(declare-fun lt!340804 () (_ BitVec 64))

(assert (=> b!766181 (= lt!340809 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340804 lt!340806 mask!3328))))

(assert (=> b!766181 (= lt!340805 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340804 mask!3328) lt!340804 lt!340806 mask!3328))))

(assert (=> b!766181 (= lt!340804 (select (store (arr!20233 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!766181 (= lt!340806 (array!42258 (store (arr!20233 a!3186) i!1173 k0!2102) (size!20654 a!3186)))))

(declare-fun b!766182 () Bool)

(assert (=> b!766182 (= e!426664 e!426661)))

(declare-fun res!518333 () Bool)

(assert (=> b!766182 (=> (not res!518333) (not e!426661))))

(assert (=> b!766182 (= res!518333 (= (seekEntryOrOpen!0 (select (arr!20233 a!3186) j!159) a!3186 mask!3328) lt!340803))))

(assert (=> b!766182 (= lt!340803 (Found!7833 j!159))))

(declare-fun b!766183 () Bool)

(assert (=> b!766183 (= e!426659 true)))

(declare-fun lt!340807 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!766183 (= lt!340807 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!766184 () Bool)

(declare-fun res!518329 () Bool)

(assert (=> b!766184 (=> (not res!518329) (not e!426662))))

(assert (=> b!766184 (= res!518329 (and (= (size!20654 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20654 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20654 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!66478 res!518330) b!766184))

(assert (= (and b!766184 res!518329) b!766179))

(assert (= (and b!766179 res!518336) b!766180))

(assert (= (and b!766180 res!518337) b!766169))

(assert (= (and b!766169 res!518338) b!766175))

(assert (= (and b!766175 res!518326) b!766178))

(assert (= (and b!766178 res!518331) b!766173))

(assert (= (and b!766173 res!518332) b!766170))

(assert (= (and b!766170 res!518335) b!766167))

(assert (= (and b!766167 res!518327) b!766177))

(assert (= (and b!766177 res!518339) b!766168))

(assert (= (and b!766168 c!84310) b!766176))

(assert (= (and b!766168 (not c!84310)) b!766172))

(assert (= (and b!766168 res!518340) b!766181))

(assert (= (and b!766181 res!518341) b!766174))

(assert (= (and b!766174 res!518328) b!766182))

(assert (= (and b!766182 res!518333) b!766171))

(assert (= (and b!766174 (not res!518334)) b!766183))

(declare-fun m!712185 () Bool)

(assert (=> b!766173 m!712185))

(declare-fun m!712187 () Bool)

(assert (=> b!766183 m!712187))

(declare-fun m!712189 () Bool)

(assert (=> b!766167 m!712189))

(assert (=> b!766167 m!712189))

(declare-fun m!712191 () Bool)

(assert (=> b!766167 m!712191))

(assert (=> b!766167 m!712191))

(assert (=> b!766167 m!712189))

(declare-fun m!712193 () Bool)

(assert (=> b!766167 m!712193))

(declare-fun m!712195 () Bool)

(assert (=> b!766181 m!712195))

(assert (=> b!766181 m!712195))

(declare-fun m!712197 () Bool)

(assert (=> b!766181 m!712197))

(declare-fun m!712199 () Bool)

(assert (=> b!766181 m!712199))

(declare-fun m!712201 () Bool)

(assert (=> b!766181 m!712201))

(declare-fun m!712203 () Bool)

(assert (=> b!766181 m!712203))

(assert (=> b!766176 m!712189))

(assert (=> b!766176 m!712189))

(declare-fun m!712205 () Bool)

(assert (=> b!766176 m!712205))

(declare-fun m!712207 () Bool)

(assert (=> b!766177 m!712207))

(declare-fun m!712209 () Bool)

(assert (=> b!766169 m!712209))

(declare-fun m!712211 () Bool)

(assert (=> start!66478 m!712211))

(declare-fun m!712213 () Bool)

(assert (=> start!66478 m!712213))

(declare-fun m!712215 () Bool)

(assert (=> b!766174 m!712215))

(declare-fun m!712217 () Bool)

(assert (=> b!766174 m!712217))

(assert (=> b!766179 m!712189))

(assert (=> b!766179 m!712189))

(declare-fun m!712219 () Bool)

(assert (=> b!766179 m!712219))

(assert (=> b!766171 m!712189))

(assert (=> b!766171 m!712189))

(declare-fun m!712221 () Bool)

(assert (=> b!766171 m!712221))

(assert (=> b!766182 m!712189))

(assert (=> b!766182 m!712189))

(declare-fun m!712223 () Bool)

(assert (=> b!766182 m!712223))

(declare-fun m!712225 () Bool)

(assert (=> b!766175 m!712225))

(declare-fun m!712227 () Bool)

(assert (=> b!766180 m!712227))

(declare-fun m!712229 () Bool)

(assert (=> b!766178 m!712229))

(assert (=> b!766172 m!712189))

(assert (=> b!766172 m!712189))

(declare-fun m!712231 () Bool)

(assert (=> b!766172 m!712231))

(check-sat (not b!766172) (not b!766175) (not b!766178) (not b!766179) (not start!66478) (not b!766173) (not b!766181) (not b!766182) (not b!766167) (not b!766169) (not b!766174) (not b!766180) (not b!766183) (not b!766171) (not b!766176))
(check-sat)
