; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63882 () Bool)

(assert start!63882)

(declare-fun b!717947 () Bool)

(declare-fun res!480519 () Bool)

(declare-fun e!403093 () Bool)

(assert (=> b!717947 (=> (not res!480519) (not e!403093))))

(declare-datatypes ((array!40661 0))(
  ( (array!40662 (arr!19459 (Array (_ BitVec 32) (_ BitVec 64))) (size!19880 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40661)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40661 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717947 (= res!480519 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!717949 () Bool)

(declare-fun e!403094 () Bool)

(assert (=> b!717949 (= e!403093 e!403094)))

(declare-fun res!480517 () Bool)

(assert (=> b!717949 (=> (not res!480517) (not e!403094))))

(declare-datatypes ((SeekEntryResult!7059 0))(
  ( (MissingZero!7059 (index!30604 (_ BitVec 32))) (Found!7059 (index!30605 (_ BitVec 32))) (Intermediate!7059 (undefined!7871 Bool) (index!30606 (_ BitVec 32)) (x!61623 (_ BitVec 32))) (Undefined!7059) (MissingVacant!7059 (index!30607 (_ BitVec 32))) )
))
(declare-fun lt!319244 () SeekEntryResult!7059)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!717949 (= res!480517 (or (= lt!319244 (MissingZero!7059 i!1173)) (= lt!319244 (MissingVacant!7059 i!1173))))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40661 (_ BitVec 32)) SeekEntryResult!7059)

(assert (=> b!717949 (= lt!319244 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!717950 () Bool)

(declare-fun res!480524 () Bool)

(assert (=> b!717950 (=> (not res!480524) (not e!403093))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!717950 (= res!480524 (and (= (size!19880 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19880 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19880 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!717951 () Bool)

(declare-fun res!480521 () Bool)

(assert (=> b!717951 (=> (not res!480521) (not e!403093))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717951 (= res!480521 (validKeyInArray!0 k0!2102))))

(declare-fun b!717952 () Bool)

(declare-fun res!480522 () Bool)

(assert (=> b!717952 (=> (not res!480522) (not e!403094))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40661 (_ BitVec 32)) Bool)

(assert (=> b!717952 (= res!480522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!717953 () Bool)

(assert (=> b!717953 (= e!403094 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19880 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19880 a!3186)) (bvslt mask!3328 #b00000000000000000000000000000000)))))

(declare-fun b!717954 () Bool)

(declare-fun res!480518 () Bool)

(assert (=> b!717954 (=> (not res!480518) (not e!403093))))

(assert (=> b!717954 (= res!480518 (validKeyInArray!0 (select (arr!19459 a!3186) j!159)))))

(declare-fun res!480520 () Bool)

(assert (=> start!63882 (=> (not res!480520) (not e!403093))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63882 (= res!480520 (validMask!0 mask!3328))))

(assert (=> start!63882 e!403093))

(assert (=> start!63882 true))

(declare-fun array_inv!15255 (array!40661) Bool)

(assert (=> start!63882 (array_inv!15255 a!3186)))

(declare-fun b!717948 () Bool)

(declare-fun res!480523 () Bool)

(assert (=> b!717948 (=> (not res!480523) (not e!403094))))

(declare-datatypes ((List!13461 0))(
  ( (Nil!13458) (Cons!13457 (h!14502 (_ BitVec 64)) (t!19776 List!13461)) )
))
(declare-fun arrayNoDuplicates!0 (array!40661 (_ BitVec 32) List!13461) Bool)

(assert (=> b!717948 (= res!480523 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13458))))

(assert (= (and start!63882 res!480520) b!717950))

(assert (= (and b!717950 res!480524) b!717954))

(assert (= (and b!717954 res!480518) b!717951))

(assert (= (and b!717951 res!480521) b!717947))

(assert (= (and b!717947 res!480519) b!717949))

(assert (= (and b!717949 res!480517) b!717952))

(assert (= (and b!717952 res!480522) b!717948))

(assert (= (and b!717948 res!480523) b!717953))

(declare-fun m!673735 () Bool)

(assert (=> start!63882 m!673735))

(declare-fun m!673737 () Bool)

(assert (=> start!63882 m!673737))

(declare-fun m!673739 () Bool)

(assert (=> b!717948 m!673739))

(declare-fun m!673741 () Bool)

(assert (=> b!717947 m!673741))

(declare-fun m!673743 () Bool)

(assert (=> b!717951 m!673743))

(declare-fun m!673745 () Bool)

(assert (=> b!717949 m!673745))

(declare-fun m!673747 () Bool)

(assert (=> b!717952 m!673747))

(declare-fun m!673749 () Bool)

(assert (=> b!717954 m!673749))

(assert (=> b!717954 m!673749))

(declare-fun m!673751 () Bool)

(assert (=> b!717954 m!673751))

(check-sat (not b!717949) (not b!717954) (not b!717952) (not b!717947) (not b!717948) (not start!63882) (not b!717951))
(check-sat)
