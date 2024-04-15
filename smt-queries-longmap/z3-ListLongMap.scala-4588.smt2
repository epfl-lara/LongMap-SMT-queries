; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64022 () Bool)

(assert start!64022)

(declare-fun b!718953 () Bool)

(declare-fun res!481493 () Bool)

(declare-fun e!403471 () Bool)

(assert (=> b!718953 (=> (not res!481493) (not e!403471))))

(declare-datatypes ((array!40734 0))(
  ( (array!40735 (arr!19493 (Array (_ BitVec 32) (_ BitVec 64))) (size!19914 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40734)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!718953 (= res!481493 (validKeyInArray!0 (select (arr!19493 a!3186) j!159)))))

(declare-fun b!718954 () Bool)

(declare-fun res!481492 () Bool)

(declare-fun e!403470 () Bool)

(assert (=> b!718954 (=> (not res!481492) (not e!403470))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40734 (_ BitVec 32)) Bool)

(assert (=> b!718954 (= res!481492 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!718955 () Bool)

(declare-fun res!481486 () Bool)

(assert (=> b!718955 (=> (not res!481486) (not e!403471))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40734 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!718955 (= res!481486 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!718956 () Bool)

(assert (=> b!718956 (= e!403470 false)))

(declare-datatypes ((SeekEntryResult!7090 0))(
  ( (MissingZero!7090 (index!30728 (_ BitVec 32))) (Found!7090 (index!30729 (_ BitVec 32))) (Intermediate!7090 (undefined!7902 Bool) (index!30730 (_ BitVec 32)) (x!61748 (_ BitVec 32))) (Undefined!7090) (MissingVacant!7090 (index!30731 (_ BitVec 32))) )
))
(declare-fun lt!319309 () SeekEntryResult!7090)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40734 (_ BitVec 32)) SeekEntryResult!7090)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!718956 (= lt!319309 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19493 a!3186) j!159) mask!3328) (select (arr!19493 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!718957 () Bool)

(declare-fun res!481491 () Bool)

(assert (=> b!718957 (=> (not res!481491) (not e!403470))))

(declare-datatypes ((List!13534 0))(
  ( (Nil!13531) (Cons!13530 (h!14578 (_ BitVec 64)) (t!19840 List!13534)) )
))
(declare-fun arrayNoDuplicates!0 (array!40734 (_ BitVec 32) List!13534) Bool)

(assert (=> b!718957 (= res!481491 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13531))))

(declare-fun b!718958 () Bool)

(declare-fun res!481490 () Bool)

(assert (=> b!718958 (=> (not res!481490) (not e!403471))))

(assert (=> b!718958 (= res!481490 (validKeyInArray!0 k0!2102))))

(declare-fun b!718959 () Bool)

(declare-fun res!481489 () Bool)

(assert (=> b!718959 (=> (not res!481489) (not e!403471))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!718959 (= res!481489 (and (= (size!19914 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19914 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19914 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!718960 () Bool)

(assert (=> b!718960 (= e!403471 e!403470)))

(declare-fun res!481487 () Bool)

(assert (=> b!718960 (=> (not res!481487) (not e!403470))))

(declare-fun lt!319310 () SeekEntryResult!7090)

(assert (=> b!718960 (= res!481487 (or (= lt!319310 (MissingZero!7090 i!1173)) (= lt!319310 (MissingVacant!7090 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40734 (_ BitVec 32)) SeekEntryResult!7090)

(assert (=> b!718960 (= lt!319310 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!481494 () Bool)

(assert (=> start!64022 (=> (not res!481494) (not e!403471))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64022 (= res!481494 (validMask!0 mask!3328))))

(assert (=> start!64022 e!403471))

(assert (=> start!64022 true))

(declare-fun array_inv!15376 (array!40734) Bool)

(assert (=> start!64022 (array_inv!15376 a!3186)))

(declare-fun b!718961 () Bool)

(declare-fun res!481488 () Bool)

(assert (=> b!718961 (=> (not res!481488) (not e!403470))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!718961 (= res!481488 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19914 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19914 a!3186))))))

(assert (= (and start!64022 res!481494) b!718959))

(assert (= (and b!718959 res!481489) b!718953))

(assert (= (and b!718953 res!481493) b!718958))

(assert (= (and b!718958 res!481490) b!718955))

(assert (= (and b!718955 res!481486) b!718960))

(assert (= (and b!718960 res!481487) b!718954))

(assert (= (and b!718954 res!481492) b!718957))

(assert (= (and b!718957 res!481491) b!718961))

(assert (= (and b!718961 res!481488) b!718956))

(declare-fun m!673895 () Bool)

(assert (=> b!718958 m!673895))

(declare-fun m!673897 () Bool)

(assert (=> b!718960 m!673897))

(declare-fun m!673899 () Bool)

(assert (=> b!718953 m!673899))

(assert (=> b!718953 m!673899))

(declare-fun m!673901 () Bool)

(assert (=> b!718953 m!673901))

(declare-fun m!673903 () Bool)

(assert (=> b!718955 m!673903))

(declare-fun m!673905 () Bool)

(assert (=> start!64022 m!673905))

(declare-fun m!673907 () Bool)

(assert (=> start!64022 m!673907))

(declare-fun m!673909 () Bool)

(assert (=> b!718957 m!673909))

(assert (=> b!718956 m!673899))

(assert (=> b!718956 m!673899))

(declare-fun m!673911 () Bool)

(assert (=> b!718956 m!673911))

(assert (=> b!718956 m!673911))

(assert (=> b!718956 m!673899))

(declare-fun m!673913 () Bool)

(assert (=> b!718956 m!673913))

(declare-fun m!673915 () Bool)

(assert (=> b!718954 m!673915))

(check-sat (not b!718958) (not start!64022) (not b!718960) (not b!718955) (not b!718956) (not b!718954) (not b!718953) (not b!718957))
(check-sat)
