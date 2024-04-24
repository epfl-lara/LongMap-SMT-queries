; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64338 () Bool)

(assert start!64338)

(declare-fun b!722142 () Bool)

(declare-fun res!483797 () Bool)

(declare-fun e!404930 () Bool)

(assert (=> b!722142 (=> (not res!483797) (not e!404930))))

(declare-datatypes ((array!40852 0))(
  ( (array!40853 (arr!19546 (Array (_ BitVec 32) (_ BitVec 64))) (size!19966 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40852)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40852 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!722142 (= res!483797 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!404931 () Bool)

(declare-fun b!722143 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7102 0))(
  ( (MissingZero!7102 (index!30776 (_ BitVec 32))) (Found!7102 (index!30777 (_ BitVec 32))) (Intermediate!7102 (undefined!7914 Bool) (index!30778 (_ BitVec 32)) (x!61938 (_ BitVec 32))) (Undefined!7102) (MissingVacant!7102 (index!30779 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40852 (_ BitVec 32)) SeekEntryResult!7102)

(assert (=> b!722143 (= e!404931 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19546 a!3186) j!159) a!3186 mask!3328) (Found!7102 j!159)))))

(declare-fun b!722144 () Bool)

(declare-fun lt!320291 () SeekEntryResult!7102)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40852 (_ BitVec 32)) SeekEntryResult!7102)

(assert (=> b!722144 (= e!404931 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19546 a!3186) j!159) a!3186 mask!3328) lt!320291))))

(declare-fun b!722145 () Bool)

(declare-fun res!483800 () Bool)

(assert (=> b!722145 (=> (not res!483800) (not e!404930))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!722145 (= res!483800 (validKeyInArray!0 k0!2102))))

(declare-fun b!722146 () Bool)

(declare-fun res!483794 () Bool)

(declare-fun e!404929 () Bool)

(assert (=> b!722146 (=> (not res!483794) (not e!404929))))

(assert (=> b!722146 (= res!483794 e!404931)))

(declare-fun c!79547 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!722146 (= c!79547 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!722148 () Bool)

(declare-fun res!483796 () Bool)

(declare-fun e!404927 () Bool)

(assert (=> b!722148 (=> (not res!483796) (not e!404927))))

(declare-datatypes ((List!13455 0))(
  ( (Nil!13452) (Cons!13451 (h!14508 (_ BitVec 64)) (t!19762 List!13455)) )
))
(declare-fun arrayNoDuplicates!0 (array!40852 (_ BitVec 32) List!13455) Bool)

(assert (=> b!722148 (= res!483796 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13452))))

(declare-fun b!722149 () Bool)

(declare-fun res!483799 () Bool)

(assert (=> b!722149 (=> (not res!483799) (not e!404929))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!722149 (= res!483799 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19546 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!722150 () Bool)

(declare-fun res!483803 () Bool)

(assert (=> b!722150 (=> (not res!483803) (not e!404927))))

(assert (=> b!722150 (= res!483803 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19966 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19966 a!3186))))))

(declare-fun b!722151 () Bool)

(declare-fun res!483805 () Bool)

(assert (=> b!722151 (=> (not res!483805) (not e!404927))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40852 (_ BitVec 32)) Bool)

(assert (=> b!722151 (= res!483805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!722152 () Bool)

(assert (=> b!722152 (= e!404930 e!404927)))

(declare-fun res!483801 () Bool)

(assert (=> b!722152 (=> (not res!483801) (not e!404927))))

(declare-fun lt!320292 () SeekEntryResult!7102)

(assert (=> b!722152 (= res!483801 (or (= lt!320292 (MissingZero!7102 i!1173)) (= lt!320292 (MissingVacant!7102 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40852 (_ BitVec 32)) SeekEntryResult!7102)

(assert (=> b!722152 (= lt!320292 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!722153 () Bool)

(declare-fun res!483795 () Bool)

(assert (=> b!722153 (=> (not res!483795) (not e!404930))))

(assert (=> b!722153 (= res!483795 (and (= (size!19966 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19966 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19966 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!722154 () Bool)

(declare-fun res!483802 () Bool)

(assert (=> b!722154 (=> (not res!483802) (not e!404930))))

(assert (=> b!722154 (= res!483802 (validKeyInArray!0 (select (arr!19546 a!3186) j!159)))))

(declare-fun b!722155 () Bool)

(assert (=> b!722155 (= e!404927 e!404929)))

(declare-fun res!483798 () Bool)

(assert (=> b!722155 (=> (not res!483798) (not e!404929))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!722155 (= res!483798 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19546 a!3186) j!159) mask!3328) (select (arr!19546 a!3186) j!159) a!3186 mask!3328) lt!320291))))

(assert (=> b!722155 (= lt!320291 (Intermediate!7102 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!483804 () Bool)

(assert (=> start!64338 (=> (not res!483804) (not e!404930))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64338 (= res!483804 (validMask!0 mask!3328))))

(assert (=> start!64338 e!404930))

(assert (=> start!64338 true))

(declare-fun array_inv!15405 (array!40852) Bool)

(assert (=> start!64338 (array_inv!15405 a!3186)))

(declare-fun b!722147 () Bool)

(assert (=> b!722147 (= e!404929 (bvslt mask!3328 #b00000000000000000000000000000000))))

(assert (= (and start!64338 res!483804) b!722153))

(assert (= (and b!722153 res!483795) b!722154))

(assert (= (and b!722154 res!483802) b!722145))

(assert (= (and b!722145 res!483800) b!722142))

(assert (= (and b!722142 res!483797) b!722152))

(assert (= (and b!722152 res!483801) b!722151))

(assert (= (and b!722151 res!483805) b!722148))

(assert (= (and b!722148 res!483796) b!722150))

(assert (= (and b!722150 res!483803) b!722155))

(assert (= (and b!722155 res!483798) b!722149))

(assert (= (and b!722149 res!483799) b!722146))

(assert (= (and b!722146 c!79547) b!722144))

(assert (= (and b!722146 (not c!79547)) b!722143))

(assert (= (and b!722146 res!483794) b!722147))

(declare-fun m!677373 () Bool)

(assert (=> start!64338 m!677373))

(declare-fun m!677375 () Bool)

(assert (=> start!64338 m!677375))

(declare-fun m!677377 () Bool)

(assert (=> b!722152 m!677377))

(declare-fun m!677379 () Bool)

(assert (=> b!722154 m!677379))

(assert (=> b!722154 m!677379))

(declare-fun m!677381 () Bool)

(assert (=> b!722154 m!677381))

(assert (=> b!722144 m!677379))

(assert (=> b!722144 m!677379))

(declare-fun m!677383 () Bool)

(assert (=> b!722144 m!677383))

(declare-fun m!677385 () Bool)

(assert (=> b!722142 m!677385))

(assert (=> b!722143 m!677379))

(assert (=> b!722143 m!677379))

(declare-fun m!677387 () Bool)

(assert (=> b!722143 m!677387))

(declare-fun m!677389 () Bool)

(assert (=> b!722148 m!677389))

(declare-fun m!677391 () Bool)

(assert (=> b!722151 m!677391))

(declare-fun m!677393 () Bool)

(assert (=> b!722149 m!677393))

(declare-fun m!677395 () Bool)

(assert (=> b!722145 m!677395))

(assert (=> b!722155 m!677379))

(assert (=> b!722155 m!677379))

(declare-fun m!677397 () Bool)

(assert (=> b!722155 m!677397))

(assert (=> b!722155 m!677397))

(assert (=> b!722155 m!677379))

(declare-fun m!677399 () Bool)

(assert (=> b!722155 m!677399))

(check-sat (not b!722152) (not b!722145) (not b!722148) (not start!64338) (not b!722143) (not b!722151) (not b!722144) (not b!722155) (not b!722154) (not b!722142))
(check-sat)
