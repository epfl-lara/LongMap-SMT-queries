; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64014 () Bool)

(assert start!64014)

(declare-fun b!718807 () Bool)

(declare-fun res!481204 () Bool)

(declare-fun e!403498 () Bool)

(assert (=> b!718807 (=> (not res!481204) (not e!403498))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!718807 (= res!481204 (validKeyInArray!0 k0!2102))))

(declare-fun b!718808 () Bool)

(declare-fun res!481201 () Bool)

(assert (=> b!718808 (=> (not res!481201) (not e!403498))))

(declare-datatypes ((array!40709 0))(
  ( (array!40710 (arr!19480 (Array (_ BitVec 32) (_ BitVec 64))) (size!19901 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40709)

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!718808 (= res!481201 (validKeyInArray!0 (select (arr!19480 a!3186) j!159)))))

(declare-fun b!718809 () Bool)

(declare-fun res!481207 () Bool)

(declare-fun e!403497 () Bool)

(assert (=> b!718809 (=> (not res!481207) (not e!403497))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!718809 (= res!481207 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19901 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19901 a!3186))))))

(declare-fun b!718810 () Bool)

(declare-fun res!481203 () Bool)

(assert (=> b!718810 (=> (not res!481203) (not e!403497))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40709 (_ BitVec 32)) Bool)

(assert (=> b!718810 (= res!481203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!718812 () Bool)

(assert (=> b!718812 (= e!403498 e!403497)))

(declare-fun res!481205 () Bool)

(assert (=> b!718812 (=> (not res!481205) (not e!403497))))

(declare-datatypes ((SeekEntryResult!7080 0))(
  ( (MissingZero!7080 (index!30688 (_ BitVec 32))) (Found!7080 (index!30689 (_ BitVec 32))) (Intermediate!7080 (undefined!7892 Bool) (index!30690 (_ BitVec 32)) (x!61703 (_ BitVec 32))) (Undefined!7080) (MissingVacant!7080 (index!30691 (_ BitVec 32))) )
))
(declare-fun lt!319483 () SeekEntryResult!7080)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!718812 (= res!481205 (or (= lt!319483 (MissingZero!7080 i!1173)) (= lt!319483 (MissingVacant!7080 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40709 (_ BitVec 32)) SeekEntryResult!7080)

(assert (=> b!718812 (= lt!319483 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!718813 () Bool)

(declare-fun res!481200 () Bool)

(assert (=> b!718813 (=> (not res!481200) (not e!403498))))

(declare-fun arrayContainsKey!0 (array!40709 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!718813 (= res!481200 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!718814 () Bool)

(assert (=> b!718814 (= e!403497 false)))

(declare-fun lt!319484 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!718814 (= lt!319484 (toIndex!0 (select (arr!19480 a!3186) j!159) mask!3328))))

(declare-fun b!718815 () Bool)

(declare-fun res!481202 () Bool)

(assert (=> b!718815 (=> (not res!481202) (not e!403497))))

(declare-datatypes ((List!13482 0))(
  ( (Nil!13479) (Cons!13478 (h!14526 (_ BitVec 64)) (t!19797 List!13482)) )
))
(declare-fun arrayNoDuplicates!0 (array!40709 (_ BitVec 32) List!13482) Bool)

(assert (=> b!718815 (= res!481202 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13479))))

(declare-fun b!718811 () Bool)

(declare-fun res!481208 () Bool)

(assert (=> b!718811 (=> (not res!481208) (not e!403498))))

(assert (=> b!718811 (= res!481208 (and (= (size!19901 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19901 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19901 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!481206 () Bool)

(assert (=> start!64014 (=> (not res!481206) (not e!403498))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64014 (= res!481206 (validMask!0 mask!3328))))

(assert (=> start!64014 e!403498))

(assert (=> start!64014 true))

(declare-fun array_inv!15276 (array!40709) Bool)

(assert (=> start!64014 (array_inv!15276 a!3186)))

(assert (= (and start!64014 res!481206) b!718811))

(assert (= (and b!718811 res!481208) b!718808))

(assert (= (and b!718808 res!481201) b!718807))

(assert (= (and b!718807 res!481204) b!718813))

(assert (= (and b!718813 res!481200) b!718812))

(assert (= (and b!718812 res!481205) b!718810))

(assert (= (and b!718810 res!481203) b!718815))

(assert (= (and b!718815 res!481202) b!718809))

(assert (= (and b!718809 res!481207) b!718814))

(declare-fun m!674337 () Bool)

(assert (=> b!718808 m!674337))

(assert (=> b!718808 m!674337))

(declare-fun m!674339 () Bool)

(assert (=> b!718808 m!674339))

(assert (=> b!718814 m!674337))

(assert (=> b!718814 m!674337))

(declare-fun m!674341 () Bool)

(assert (=> b!718814 m!674341))

(declare-fun m!674343 () Bool)

(assert (=> start!64014 m!674343))

(declare-fun m!674345 () Bool)

(assert (=> start!64014 m!674345))

(declare-fun m!674347 () Bool)

(assert (=> b!718812 m!674347))

(declare-fun m!674349 () Bool)

(assert (=> b!718815 m!674349))

(declare-fun m!674351 () Bool)

(assert (=> b!718813 m!674351))

(declare-fun m!674353 () Bool)

(assert (=> b!718810 m!674353))

(declare-fun m!674355 () Bool)

(assert (=> b!718807 m!674355))

(check-sat (not b!718810) (not b!718807) (not start!64014) (not b!718813) (not b!718812) (not b!718814) (not b!718808) (not b!718815))
(check-sat)
