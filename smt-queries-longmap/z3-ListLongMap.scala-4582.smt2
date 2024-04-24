; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64068 () Bool)

(assert start!64068)

(declare-fun b!719027 () Bool)

(declare-fun res!481274 () Bool)

(declare-fun e!403687 () Bool)

(assert (=> b!719027 (=> (not res!481274) (not e!403687))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719027 (= res!481274 (validKeyInArray!0 k0!2102))))

(declare-fun b!719028 () Bool)

(declare-fun res!481271 () Bool)

(assert (=> b!719028 (=> (not res!481271) (not e!403687))))

(declare-datatypes ((array!40696 0))(
  ( (array!40697 (arr!19471 (Array (_ BitVec 32) (_ BitVec 64))) (size!19891 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40696)

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!719028 (= res!481271 (validKeyInArray!0 (select (arr!19471 a!3186) j!159)))))

(declare-fun b!719029 () Bool)

(declare-fun res!481279 () Bool)

(assert (=> b!719029 (=> (not res!481279) (not e!403687))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!719029 (= res!481279 (and (= (size!19891 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19891 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19891 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719030 () Bool)

(declare-fun res!481277 () Bool)

(declare-fun e!403689 () Bool)

(assert (=> b!719030 (=> (not res!481277) (not e!403689))))

(declare-datatypes ((List!13380 0))(
  ( (Nil!13377) (Cons!13376 (h!14427 (_ BitVec 64)) (t!19687 List!13380)) )
))
(declare-fun arrayNoDuplicates!0 (array!40696 (_ BitVec 32) List!13380) Bool)

(assert (=> b!719030 (= res!481277 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13377))))

(declare-fun res!481273 () Bool)

(assert (=> start!64068 (=> (not res!481273) (not e!403687))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64068 (= res!481273 (validMask!0 mask!3328))))

(assert (=> start!64068 e!403687))

(assert (=> start!64068 true))

(declare-fun array_inv!15330 (array!40696) Bool)

(assert (=> start!64068 (array_inv!15330 a!3186)))

(declare-fun b!719031 () Bool)

(declare-fun res!481272 () Bool)

(assert (=> b!719031 (=> (not res!481272) (not e!403689))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40696 (_ BitVec 32)) Bool)

(assert (=> b!719031 (= res!481272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719032 () Bool)

(declare-fun res!481275 () Bool)

(assert (=> b!719032 (=> (not res!481275) (not e!403689))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!719032 (= res!481275 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19891 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19891 a!3186))))))

(declare-fun b!719033 () Bool)

(assert (=> b!719033 (= e!403687 e!403689)))

(declare-fun res!481276 () Bool)

(assert (=> b!719033 (=> (not res!481276) (not e!403689))))

(declare-datatypes ((SeekEntryResult!7027 0))(
  ( (MissingZero!7027 (index!30476 (_ BitVec 32))) (Found!7027 (index!30477 (_ BitVec 32))) (Intermediate!7027 (undefined!7839 Bool) (index!30478 (_ BitVec 32)) (x!61645 (_ BitVec 32))) (Undefined!7027) (MissingVacant!7027 (index!30479 (_ BitVec 32))) )
))
(declare-fun lt!319590 () SeekEntryResult!7027)

(assert (=> b!719033 (= res!481276 (or (= lt!319590 (MissingZero!7027 i!1173)) (= lt!319590 (MissingVacant!7027 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40696 (_ BitVec 32)) SeekEntryResult!7027)

(assert (=> b!719033 (= lt!319590 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!719034 () Bool)

(assert (=> b!719034 (= e!403689 false)))

(declare-fun lt!319589 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719034 (= lt!319589 (toIndex!0 (select (arr!19471 a!3186) j!159) mask!3328))))

(declare-fun b!719035 () Bool)

(declare-fun res!481278 () Bool)

(assert (=> b!719035 (=> (not res!481278) (not e!403687))))

(declare-fun arrayContainsKey!0 (array!40696 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719035 (= res!481278 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!64068 res!481273) b!719029))

(assert (= (and b!719029 res!481279) b!719028))

(assert (= (and b!719028 res!481271) b!719027))

(assert (= (and b!719027 res!481274) b!719035))

(assert (= (and b!719035 res!481278) b!719033))

(assert (= (and b!719033 res!481276) b!719031))

(assert (= (and b!719031 res!481272) b!719030))

(assert (= (and b!719030 res!481277) b!719032))

(assert (= (and b!719032 res!481275) b!719034))

(declare-fun m!675105 () Bool)

(assert (=> b!719030 m!675105))

(declare-fun m!675107 () Bool)

(assert (=> b!719035 m!675107))

(declare-fun m!675109 () Bool)

(assert (=> b!719034 m!675109))

(assert (=> b!719034 m!675109))

(declare-fun m!675111 () Bool)

(assert (=> b!719034 m!675111))

(declare-fun m!675113 () Bool)

(assert (=> start!64068 m!675113))

(declare-fun m!675115 () Bool)

(assert (=> start!64068 m!675115))

(declare-fun m!675117 () Bool)

(assert (=> b!719031 m!675117))

(declare-fun m!675119 () Bool)

(assert (=> b!719027 m!675119))

(declare-fun m!675121 () Bool)

(assert (=> b!719033 m!675121))

(assert (=> b!719028 m!675109))

(assert (=> b!719028 m!675109))

(declare-fun m!675123 () Bool)

(assert (=> b!719028 m!675123))

(check-sat (not b!719034) (not start!64068) (not b!719031) (not b!719035) (not b!719028) (not b!719030) (not b!719027) (not b!719033))
(check-sat)
