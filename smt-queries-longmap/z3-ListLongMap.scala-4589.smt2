; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64028 () Bool)

(assert start!64028)

(declare-fun b!719034 () Bool)

(declare-fun e!403498 () Bool)

(assert (=> b!719034 (= e!403498 false)))

(declare-datatypes ((array!40740 0))(
  ( (array!40741 (arr!19496 (Array (_ BitVec 32) (_ BitVec 64))) (size!19917 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40740)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7093 0))(
  ( (MissingZero!7093 (index!30740 (_ BitVec 32))) (Found!7093 (index!30741 (_ BitVec 32))) (Intermediate!7093 (undefined!7905 Bool) (index!30742 (_ BitVec 32)) (x!61759 (_ BitVec 32))) (Undefined!7093) (MissingVacant!7093 (index!30743 (_ BitVec 32))) )
))
(declare-fun lt!319328 () SeekEntryResult!7093)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40740 (_ BitVec 32)) SeekEntryResult!7093)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719034 (= lt!319328 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19496 a!3186) j!159) mask!3328) (select (arr!19496 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!719035 () Bool)

(declare-fun res!481571 () Bool)

(declare-fun e!403496 () Bool)

(assert (=> b!719035 (=> (not res!481571) (not e!403496))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40740 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719035 (= res!481571 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719036 () Bool)

(declare-fun res!481574 () Bool)

(assert (=> b!719036 (=> (not res!481574) (not e!403498))))

(declare-datatypes ((List!13537 0))(
  ( (Nil!13534) (Cons!13533 (h!14581 (_ BitVec 64)) (t!19843 List!13537)) )
))
(declare-fun arrayNoDuplicates!0 (array!40740 (_ BitVec 32) List!13537) Bool)

(assert (=> b!719036 (= res!481574 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13534))))

(declare-fun b!719037 () Bool)

(declare-fun res!481575 () Bool)

(assert (=> b!719037 (=> (not res!481575) (not e!403496))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719037 (= res!481575 (validKeyInArray!0 k0!2102))))

(declare-fun b!719038 () Bool)

(declare-fun res!481568 () Bool)

(assert (=> b!719038 (=> (not res!481568) (not e!403498))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!719038 (= res!481568 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19917 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19917 a!3186))))))

(declare-fun b!719040 () Bool)

(declare-fun res!481573 () Bool)

(assert (=> b!719040 (=> (not res!481573) (not e!403496))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!719040 (= res!481573 (and (= (size!19917 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19917 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19917 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719041 () Bool)

(assert (=> b!719041 (= e!403496 e!403498)))

(declare-fun res!481570 () Bool)

(assert (=> b!719041 (=> (not res!481570) (not e!403498))))

(declare-fun lt!319327 () SeekEntryResult!7093)

(assert (=> b!719041 (= res!481570 (or (= lt!319327 (MissingZero!7093 i!1173)) (= lt!319327 (MissingVacant!7093 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40740 (_ BitVec 32)) SeekEntryResult!7093)

(assert (=> b!719041 (= lt!319327 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!719042 () Bool)

(declare-fun res!481572 () Bool)

(assert (=> b!719042 (=> (not res!481572) (not e!403498))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40740 (_ BitVec 32)) Bool)

(assert (=> b!719042 (= res!481572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719039 () Bool)

(declare-fun res!481567 () Bool)

(assert (=> b!719039 (=> (not res!481567) (not e!403496))))

(assert (=> b!719039 (= res!481567 (validKeyInArray!0 (select (arr!19496 a!3186) j!159)))))

(declare-fun res!481569 () Bool)

(assert (=> start!64028 (=> (not res!481569) (not e!403496))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64028 (= res!481569 (validMask!0 mask!3328))))

(assert (=> start!64028 e!403496))

(assert (=> start!64028 true))

(declare-fun array_inv!15379 (array!40740) Bool)

(assert (=> start!64028 (array_inv!15379 a!3186)))

(assert (= (and start!64028 res!481569) b!719040))

(assert (= (and b!719040 res!481573) b!719039))

(assert (= (and b!719039 res!481567) b!719037))

(assert (= (and b!719037 res!481575) b!719035))

(assert (= (and b!719035 res!481571) b!719041))

(assert (= (and b!719041 res!481570) b!719042))

(assert (= (and b!719042 res!481572) b!719036))

(assert (= (and b!719036 res!481574) b!719038))

(assert (= (and b!719038 res!481568) b!719034))

(declare-fun m!673961 () Bool)

(assert (=> b!719039 m!673961))

(assert (=> b!719039 m!673961))

(declare-fun m!673963 () Bool)

(assert (=> b!719039 m!673963))

(declare-fun m!673965 () Bool)

(assert (=> b!719036 m!673965))

(assert (=> b!719034 m!673961))

(assert (=> b!719034 m!673961))

(declare-fun m!673967 () Bool)

(assert (=> b!719034 m!673967))

(assert (=> b!719034 m!673967))

(assert (=> b!719034 m!673961))

(declare-fun m!673969 () Bool)

(assert (=> b!719034 m!673969))

(declare-fun m!673971 () Bool)

(assert (=> b!719042 m!673971))

(declare-fun m!673973 () Bool)

(assert (=> b!719037 m!673973))

(declare-fun m!673975 () Bool)

(assert (=> b!719041 m!673975))

(declare-fun m!673977 () Bool)

(assert (=> start!64028 m!673977))

(declare-fun m!673979 () Bool)

(assert (=> start!64028 m!673979))

(declare-fun m!673981 () Bool)

(assert (=> b!719035 m!673981))

(check-sat (not b!719034) (not start!64028) (not b!719039) (not b!719035) (not b!719036) (not b!719042) (not b!719041) (not b!719037))
(check-sat)
