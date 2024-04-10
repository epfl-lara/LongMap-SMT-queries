; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64368 () Bool)

(assert start!64368)

(declare-fun b!723801 () Bool)

(declare-fun e!405459 () Bool)

(declare-fun e!405458 () Bool)

(assert (=> b!723801 (= e!405459 e!405458)))

(declare-fun res!485326 () Bool)

(assert (=> b!723801 (=> (not res!485326) (not e!405458))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!40949 0))(
  ( (array!40950 (arr!19597 (Array (_ BitVec 32) (_ BitVec 64))) (size!20018 (_ BitVec 32))) )
))
(declare-fun lt!320788 () array!40949)

(declare-fun lt!320785 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!7197 0))(
  ( (MissingZero!7197 (index!31156 (_ BitVec 32))) (Found!7197 (index!31157 (_ BitVec 32))) (Intermediate!7197 (undefined!8009 Bool) (index!31158 (_ BitVec 32)) (x!62150 (_ BitVec 32))) (Undefined!7197) (MissingVacant!7197 (index!31159 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40949 (_ BitVec 32)) SeekEntryResult!7197)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!723801 (= res!485326 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320785 mask!3328) lt!320785 lt!320788 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320785 lt!320788 mask!3328)))))

(declare-fun a!3186 () array!40949)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!723801 (= lt!320785 (select (store (arr!19597 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!723801 (= lt!320788 (array!40950 (store (arr!19597 a!3186) i!1173 k0!2102) (size!20018 a!3186)))))

(declare-fun b!723802 () Bool)

(declare-fun e!405460 () Bool)

(declare-fun e!405461 () Bool)

(assert (=> b!723802 (= e!405460 e!405461)))

(declare-fun res!485332 () Bool)

(assert (=> b!723802 (=> (not res!485332) (not e!405461))))

(declare-fun lt!320786 () SeekEntryResult!7197)

(assert (=> b!723802 (= res!485332 (or (= lt!320786 (MissingZero!7197 i!1173)) (= lt!320786 (MissingVacant!7197 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40949 (_ BitVec 32)) SeekEntryResult!7197)

(assert (=> b!723802 (= lt!320786 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!485333 () Bool)

(assert (=> start!64368 (=> (not res!485333) (not e!405460))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64368 (= res!485333 (validMask!0 mask!3328))))

(assert (=> start!64368 e!405460))

(assert (=> start!64368 true))

(declare-fun array_inv!15393 (array!40949) Bool)

(assert (=> start!64368 (array_inv!15393 a!3186)))

(declare-fun b!723803 () Bool)

(assert (=> b!723803 (= e!405458 (not (bvsge mask!3328 #b00000000000000000000000000000000)))))

(declare-fun e!405457 () Bool)

(assert (=> b!723803 e!405457))

(declare-fun res!485337 () Bool)

(assert (=> b!723803 (=> (not res!485337) (not e!405457))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40949 (_ BitVec 32)) Bool)

(assert (=> b!723803 (= res!485337 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24712 0))(
  ( (Unit!24713) )
))
(declare-fun lt!320789 () Unit!24712)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40949 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24712)

(assert (=> b!723803 (= lt!320789 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!723804 () Bool)

(assert (=> b!723804 (= e!405461 e!405459)))

(declare-fun res!485336 () Bool)

(assert (=> b!723804 (=> (not res!485336) (not e!405459))))

(declare-fun lt!320787 () SeekEntryResult!7197)

(assert (=> b!723804 (= res!485336 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19597 a!3186) j!159) mask!3328) (select (arr!19597 a!3186) j!159) a!3186 mask!3328) lt!320787))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!723804 (= lt!320787 (Intermediate!7197 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!723805 () Bool)

(declare-fun res!485328 () Bool)

(assert (=> b!723805 (=> (not res!485328) (not e!405461))))

(declare-datatypes ((List!13599 0))(
  ( (Nil!13596) (Cons!13595 (h!14649 (_ BitVec 64)) (t!19914 List!13599)) )
))
(declare-fun arrayNoDuplicates!0 (array!40949 (_ BitVec 32) List!13599) Bool)

(assert (=> b!723805 (= res!485328 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13596))))

(declare-fun b!723806 () Bool)

(declare-fun res!485338 () Bool)

(assert (=> b!723806 (=> (not res!485338) (not e!405461))))

(assert (=> b!723806 (= res!485338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!723807 () Bool)

(declare-fun res!485331 () Bool)

(assert (=> b!723807 (=> (not res!485331) (not e!405459))))

(declare-fun e!405456 () Bool)

(assert (=> b!723807 (= res!485331 e!405456)))

(declare-fun c!79609 () Bool)

(assert (=> b!723807 (= c!79609 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!723808 () Bool)

(assert (=> b!723808 (= e!405456 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19597 a!3186) j!159) a!3186 mask!3328) lt!320787))))

(declare-fun b!723809 () Bool)

(declare-fun res!485334 () Bool)

(assert (=> b!723809 (=> (not res!485334) (not e!405460))))

(declare-fun arrayContainsKey!0 (array!40949 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!723809 (= res!485334 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!723810 () Bool)

(declare-fun res!485335 () Bool)

(assert (=> b!723810 (=> (not res!485335) (not e!405459))))

(assert (=> b!723810 (= res!485335 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19597 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!723811 () Bool)

(declare-fun res!485327 () Bool)

(assert (=> b!723811 (=> (not res!485327) (not e!405460))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!723811 (= res!485327 (validKeyInArray!0 (select (arr!19597 a!3186) j!159)))))

(declare-fun b!723812 () Bool)

(declare-fun res!485339 () Bool)

(assert (=> b!723812 (=> (not res!485339) (not e!405460))))

(assert (=> b!723812 (= res!485339 (and (= (size!20018 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20018 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20018 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!723813 () Bool)

(assert (=> b!723813 (= e!405457 (= (seekEntryOrOpen!0 (select (arr!19597 a!3186) j!159) a!3186 mask!3328) (Found!7197 j!159)))))

(declare-fun b!723814 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40949 (_ BitVec 32)) SeekEntryResult!7197)

(assert (=> b!723814 (= e!405456 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19597 a!3186) j!159) a!3186 mask!3328) (Found!7197 j!159)))))

(declare-fun b!723815 () Bool)

(declare-fun res!485329 () Bool)

(assert (=> b!723815 (=> (not res!485329) (not e!405460))))

(assert (=> b!723815 (= res!485329 (validKeyInArray!0 k0!2102))))

(declare-fun b!723816 () Bool)

(declare-fun res!485330 () Bool)

(assert (=> b!723816 (=> (not res!485330) (not e!405461))))

(assert (=> b!723816 (= res!485330 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20018 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20018 a!3186))))))

(assert (= (and start!64368 res!485333) b!723812))

(assert (= (and b!723812 res!485339) b!723811))

(assert (= (and b!723811 res!485327) b!723815))

(assert (= (and b!723815 res!485329) b!723809))

(assert (= (and b!723809 res!485334) b!723802))

(assert (= (and b!723802 res!485332) b!723806))

(assert (= (and b!723806 res!485338) b!723805))

(assert (= (and b!723805 res!485328) b!723816))

(assert (= (and b!723816 res!485330) b!723804))

(assert (= (and b!723804 res!485336) b!723810))

(assert (= (and b!723810 res!485335) b!723807))

(assert (= (and b!723807 c!79609) b!723808))

(assert (= (and b!723807 (not c!79609)) b!723814))

(assert (= (and b!723807 res!485331) b!723801))

(assert (= (and b!723801 res!485326) b!723803))

(assert (= (and b!723803 res!485337) b!723813))

(declare-fun m!678213 () Bool)

(assert (=> b!723810 m!678213))

(declare-fun m!678215 () Bool)

(assert (=> b!723801 m!678215))

(declare-fun m!678217 () Bool)

(assert (=> b!723801 m!678217))

(declare-fun m!678219 () Bool)

(assert (=> b!723801 m!678219))

(declare-fun m!678221 () Bool)

(assert (=> b!723801 m!678221))

(assert (=> b!723801 m!678215))

(declare-fun m!678223 () Bool)

(assert (=> b!723801 m!678223))

(declare-fun m!678225 () Bool)

(assert (=> b!723811 m!678225))

(assert (=> b!723811 m!678225))

(declare-fun m!678227 () Bool)

(assert (=> b!723811 m!678227))

(declare-fun m!678229 () Bool)

(assert (=> b!723809 m!678229))

(assert (=> b!723813 m!678225))

(assert (=> b!723813 m!678225))

(declare-fun m!678231 () Bool)

(assert (=> b!723813 m!678231))

(assert (=> b!723814 m!678225))

(assert (=> b!723814 m!678225))

(declare-fun m!678233 () Bool)

(assert (=> b!723814 m!678233))

(declare-fun m!678235 () Bool)

(assert (=> b!723805 m!678235))

(assert (=> b!723804 m!678225))

(assert (=> b!723804 m!678225))

(declare-fun m!678237 () Bool)

(assert (=> b!723804 m!678237))

(assert (=> b!723804 m!678237))

(assert (=> b!723804 m!678225))

(declare-fun m!678239 () Bool)

(assert (=> b!723804 m!678239))

(declare-fun m!678241 () Bool)

(assert (=> b!723802 m!678241))

(assert (=> b!723808 m!678225))

(assert (=> b!723808 m!678225))

(declare-fun m!678243 () Bool)

(assert (=> b!723808 m!678243))

(declare-fun m!678245 () Bool)

(assert (=> b!723806 m!678245))

(declare-fun m!678247 () Bool)

(assert (=> b!723803 m!678247))

(declare-fun m!678249 () Bool)

(assert (=> b!723803 m!678249))

(declare-fun m!678251 () Bool)

(assert (=> b!723815 m!678251))

(declare-fun m!678253 () Bool)

(assert (=> start!64368 m!678253))

(declare-fun m!678255 () Bool)

(assert (=> start!64368 m!678255))

(check-sat (not b!723802) (not b!723805) (not b!723806) (not start!64368) (not b!723813) (not b!723811) (not b!723803) (not b!723814) (not b!723808) (not b!723815) (not b!723801) (not b!723804) (not b!723809))
(check-sat)
