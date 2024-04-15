; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28562 () Bool)

(assert start!28562)

(declare-fun res!153001 () Bool)

(declare-fun e!184679 () Bool)

(assert (=> start!28562 (=> (not res!153001) (not e!184679))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28562 (= res!153001 (validMask!0 mask!3809))))

(assert (=> start!28562 e!184679))

(assert (=> start!28562 true))

(declare-datatypes ((array!14734 0))(
  ( (array!14735 (arr!6990 (Array (_ BitVec 32) (_ BitVec 64))) (size!7343 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14734)

(declare-fun array_inv!4962 (array!14734) Bool)

(assert (=> start!28562 (array_inv!4962 a!3312)))

(declare-fun b!291886 () Bool)

(declare-fun res!153000 () Bool)

(assert (=> b!291886 (=> (not res!153000) (not e!184679))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14734 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!291886 (= res!153000 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!291887 () Bool)

(declare-fun e!184676 () Bool)

(declare-fun e!184678 () Bool)

(assert (=> b!291887 (= e!184676 e!184678)))

(declare-fun res!152997 () Bool)

(assert (=> b!291887 (=> (not res!152997) (not e!184678))))

(declare-fun lt!144328 () Bool)

(declare-datatypes ((SeekEntryResult!2138 0))(
  ( (MissingZero!2138 (index!10722 (_ BitVec 32))) (Found!2138 (index!10723 (_ BitVec 32))) (Intermediate!2138 (undefined!2950 Bool) (index!10724 (_ BitVec 32)) (x!28936 (_ BitVec 32))) (Undefined!2138) (MissingVacant!2138 (index!10725 (_ BitVec 32))) )
))
(declare-fun lt!144326 () SeekEntryResult!2138)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!291887 (= res!152997 (and (not lt!144328) (= lt!144326 (MissingVacant!2138 i!1256))))))

(declare-fun lt!144325 () (_ BitVec 32))

(declare-fun lt!144330 () SeekEntryResult!2138)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14734 (_ BitVec 32)) SeekEntryResult!2138)

(assert (=> b!291887 (= lt!144330 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144325 k0!2524 (array!14735 (store (arr!6990 a!3312) i!1256 k0!2524) (size!7343 a!3312)) mask!3809))))

(declare-fun lt!144329 () SeekEntryResult!2138)

(assert (=> b!291887 (= lt!144329 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144325 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291887 (= lt!144325 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!291888 () Bool)

(declare-fun res!152996 () Bool)

(assert (=> b!291888 (=> (not res!152996) (not e!184679))))

(assert (=> b!291888 (= res!152996 (and (= (size!7343 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7343 a!3312))))))

(declare-fun b!291889 () Bool)

(declare-fun res!152994 () Bool)

(assert (=> b!291889 (=> (not res!152994) (not e!184676))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14734 (_ BitVec 32)) Bool)

(assert (=> b!291889 (= res!152994 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!291890 () Bool)

(declare-fun e!184680 () Bool)

(assert (=> b!291890 (= e!184680 (not true))))

(assert (=> b!291890 (= (index!10724 lt!144329) i!1256)))

(declare-fun b!291891 () Bool)

(assert (=> b!291891 (= e!184679 e!184676)))

(declare-fun res!152995 () Bool)

(assert (=> b!291891 (=> (not res!152995) (not e!184676))))

(assert (=> b!291891 (= res!152995 (or lt!144328 (= lt!144326 (MissingVacant!2138 i!1256))))))

(assert (=> b!291891 (= lt!144328 (= lt!144326 (MissingZero!2138 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14734 (_ BitVec 32)) SeekEntryResult!2138)

(assert (=> b!291891 (= lt!144326 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!291892 () Bool)

(assert (=> b!291892 (= e!184678 e!184680)))

(declare-fun res!152998 () Bool)

(assert (=> b!291892 (=> (not res!152998) (not e!184680))))

(declare-fun lt!144327 () Bool)

(assert (=> b!291892 (= res!152998 (and (or lt!144327 (not (undefined!2950 lt!144329))) (not lt!144327) (= (select (arr!6990 a!3312) (index!10724 lt!144329)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!291892 (= lt!144327 (not ((_ is Intermediate!2138) lt!144329)))))

(declare-fun b!291893 () Bool)

(declare-fun res!152999 () Bool)

(assert (=> b!291893 (=> (not res!152999) (not e!184679))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!291893 (= res!152999 (validKeyInArray!0 k0!2524))))

(assert (= (and start!28562 res!153001) b!291888))

(assert (= (and b!291888 res!152996) b!291893))

(assert (= (and b!291893 res!152999) b!291886))

(assert (= (and b!291886 res!153000) b!291891))

(assert (= (and b!291891 res!152995) b!291889))

(assert (= (and b!291889 res!152994) b!291887))

(assert (= (and b!291887 res!152997) b!291892))

(assert (= (and b!291892 res!152998) b!291890))

(declare-fun m!305171 () Bool)

(assert (=> b!291887 m!305171))

(declare-fun m!305173 () Bool)

(assert (=> b!291887 m!305173))

(declare-fun m!305175 () Bool)

(assert (=> b!291887 m!305175))

(declare-fun m!305177 () Bool)

(assert (=> b!291887 m!305177))

(declare-fun m!305179 () Bool)

(assert (=> b!291886 m!305179))

(declare-fun m!305181 () Bool)

(assert (=> start!28562 m!305181))

(declare-fun m!305183 () Bool)

(assert (=> start!28562 m!305183))

(declare-fun m!305185 () Bool)

(assert (=> b!291893 m!305185))

(declare-fun m!305187 () Bool)

(assert (=> b!291889 m!305187))

(declare-fun m!305189 () Bool)

(assert (=> b!291891 m!305189))

(declare-fun m!305191 () Bool)

(assert (=> b!291892 m!305191))

(check-sat (not b!291893) (not b!291887) (not start!28562) (not b!291886) (not b!291891) (not b!291889))
(check-sat)
