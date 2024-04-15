; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66168 () Bool)

(assert start!66168)

(declare-fun b!761893 () Bool)

(declare-fun res!515146 () Bool)

(declare-fun e!424739 () Bool)

(assert (=> b!761893 (=> (not res!515146) (not e!424739))))

(declare-datatypes ((array!42090 0))(
  ( (array!42091 (arr!20153 (Array (_ BitVec 32) (_ BitVec 64))) (size!20574 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42090)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42090 (_ BitVec 32)) Bool)

(assert (=> b!761893 (= res!515146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!761894 () Bool)

(declare-fun res!515148 () Bool)

(declare-fun e!424738 () Bool)

(assert (=> b!761894 (=> (not res!515148) (not e!424738))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!761894 (= res!515148 (and (= (size!20574 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20574 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20574 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!761896 () Bool)

(assert (=> b!761896 (= e!424739 false)))

(declare-fun lt!339262 () Bool)

(declare-datatypes ((List!14194 0))(
  ( (Nil!14191) (Cons!14190 (h!15274 (_ BitVec 64)) (t!20500 List!14194)) )
))
(declare-fun arrayNoDuplicates!0 (array!42090 (_ BitVec 32) List!14194) Bool)

(assert (=> b!761896 (= lt!339262 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14191))))

(declare-fun b!761897 () Bool)

(declare-fun res!515144 () Bool)

(assert (=> b!761897 (=> (not res!515144) (not e!424738))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42090 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!761897 (= res!515144 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!515147 () Bool)

(assert (=> start!66168 (=> (not res!515147) (not e!424738))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66168 (= res!515147 (validMask!0 mask!3328))))

(assert (=> start!66168 e!424738))

(declare-fun array_inv!16036 (array!42090) Bool)

(assert (=> start!66168 (array_inv!16036 a!3186)))

(assert (=> start!66168 true))

(declare-fun b!761895 () Bool)

(declare-fun res!515149 () Bool)

(assert (=> b!761895 (=> (not res!515149) (not e!424738))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!761895 (= res!515149 (validKeyInArray!0 (select (arr!20153 a!3186) j!159)))))

(declare-fun b!761898 () Bool)

(declare-fun res!515145 () Bool)

(assert (=> b!761898 (=> (not res!515145) (not e!424738))))

(assert (=> b!761898 (= res!515145 (validKeyInArray!0 k0!2102))))

(declare-fun b!761899 () Bool)

(assert (=> b!761899 (= e!424738 e!424739)))

(declare-fun res!515150 () Bool)

(assert (=> b!761899 (=> (not res!515150) (not e!424739))))

(declare-datatypes ((SeekEntryResult!7750 0))(
  ( (MissingZero!7750 (index!33368 (_ BitVec 32))) (Found!7750 (index!33369 (_ BitVec 32))) (Intermediate!7750 (undefined!8562 Bool) (index!33370 (_ BitVec 32)) (x!64293 (_ BitVec 32))) (Undefined!7750) (MissingVacant!7750 (index!33371 (_ BitVec 32))) )
))
(declare-fun lt!339263 () SeekEntryResult!7750)

(assert (=> b!761899 (= res!515150 (or (= lt!339263 (MissingZero!7750 i!1173)) (= lt!339263 (MissingVacant!7750 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42090 (_ BitVec 32)) SeekEntryResult!7750)

(assert (=> b!761899 (= lt!339263 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!66168 res!515147) b!761894))

(assert (= (and b!761894 res!515148) b!761895))

(assert (= (and b!761895 res!515149) b!761898))

(assert (= (and b!761898 res!515145) b!761897))

(assert (= (and b!761897 res!515144) b!761899))

(assert (= (and b!761899 res!515150) b!761893))

(assert (= (and b!761893 res!515146) b!761896))

(declare-fun m!708193 () Bool)

(assert (=> b!761898 m!708193))

(declare-fun m!708195 () Bool)

(assert (=> b!761895 m!708195))

(assert (=> b!761895 m!708195))

(declare-fun m!708197 () Bool)

(assert (=> b!761895 m!708197))

(declare-fun m!708199 () Bool)

(assert (=> b!761896 m!708199))

(declare-fun m!708201 () Bool)

(assert (=> start!66168 m!708201))

(declare-fun m!708203 () Bool)

(assert (=> start!66168 m!708203))

(declare-fun m!708205 () Bool)

(assert (=> b!761897 m!708205))

(declare-fun m!708207 () Bool)

(assert (=> b!761893 m!708207))

(declare-fun m!708209 () Bool)

(assert (=> b!761899 m!708209))

(check-sat (not b!761897) (not b!761893) (not b!761896) (not b!761899) (not b!761898) (not start!66168) (not b!761895))
(check-sat)
