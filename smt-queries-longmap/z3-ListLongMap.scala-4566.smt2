; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63696 () Bool)

(assert start!63696)

(declare-fun b!716990 () Bool)

(declare-fun res!479778 () Bool)

(declare-fun e!402587 () Bool)

(assert (=> b!716990 (=> (not res!479778) (not e!402587))))

(declare-datatypes ((array!40592 0))(
  ( (array!40593 (arr!19429 (Array (_ BitVec 32) (_ BitVec 64))) (size!19850 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40592)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40592 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!716990 (= res!479778 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!716991 () Bool)

(declare-fun res!479777 () Bool)

(assert (=> b!716991 (=> (not res!479777) (not e!402587))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!716991 (= res!479777 (and (= (size!19850 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19850 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19850 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!716993 () Bool)

(declare-fun res!479779 () Bool)

(assert (=> b!716993 (=> (not res!479779) (not e!402587))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!716993 (= res!479779 (validKeyInArray!0 k0!2102))))

(declare-fun b!716994 () Bool)

(declare-fun res!479780 () Bool)

(assert (=> b!716994 (=> (not res!479780) (not e!402587))))

(assert (=> b!716994 (= res!479780 (validKeyInArray!0 (select (arr!19429 a!3186) j!159)))))

(declare-fun b!716992 () Bool)

(assert (=> b!716992 (= e!402587 false)))

(declare-datatypes ((SeekEntryResult!7029 0))(
  ( (MissingZero!7029 (index!30484 (_ BitVec 32))) (Found!7029 (index!30485 (_ BitVec 32))) (Intermediate!7029 (undefined!7841 Bool) (index!30486 (_ BitVec 32)) (x!61513 (_ BitVec 32))) (Undefined!7029) (MissingVacant!7029 (index!30487 (_ BitVec 32))) )
))
(declare-fun lt!318980 () SeekEntryResult!7029)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40592 (_ BitVec 32)) SeekEntryResult!7029)

(assert (=> b!716992 (= lt!318980 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!479776 () Bool)

(assert (=> start!63696 (=> (not res!479776) (not e!402587))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63696 (= res!479776 (validMask!0 mask!3328))))

(assert (=> start!63696 e!402587))

(declare-fun array_inv!15225 (array!40592) Bool)

(assert (=> start!63696 (array_inv!15225 a!3186)))

(assert (=> start!63696 true))

(assert (= (and start!63696 res!479776) b!716991))

(assert (= (and b!716991 res!479777) b!716994))

(assert (= (and b!716994 res!479780) b!716993))

(assert (= (and b!716993 res!479779) b!716990))

(assert (= (and b!716990 res!479778) b!716992))

(declare-fun m!672957 () Bool)

(assert (=> b!716993 m!672957))

(declare-fun m!672959 () Bool)

(assert (=> b!716992 m!672959))

(declare-fun m!672961 () Bool)

(assert (=> b!716990 m!672961))

(declare-fun m!672963 () Bool)

(assert (=> b!716994 m!672963))

(assert (=> b!716994 m!672963))

(declare-fun m!672965 () Bool)

(assert (=> b!716994 m!672965))

(declare-fun m!672967 () Bool)

(assert (=> start!63696 m!672967))

(declare-fun m!672969 () Bool)

(assert (=> start!63696 m!672969))

(check-sat (not b!716993) (not b!716994) (not start!63696) (not b!716990) (not b!716992))
