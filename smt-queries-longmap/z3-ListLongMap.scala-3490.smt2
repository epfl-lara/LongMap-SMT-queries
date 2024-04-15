; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48396 () Bool)

(assert start!48396)

(declare-fun b!531655 () Bool)

(declare-fun e!309605 () Bool)

(declare-fun e!309606 () Bool)

(assert (=> b!531655 (= e!309605 e!309606)))

(declare-fun res!327288 () Bool)

(assert (=> b!531655 (=> (not res!327288) (not e!309606))))

(declare-datatypes ((SeekEntryResult!4654 0))(
  ( (MissingZero!4654 (index!20840 (_ BitVec 32))) (Found!4654 (index!20841 (_ BitVec 32))) (Intermediate!4654 (undefined!5466 Bool) (index!20842 (_ BitVec 32)) (x!49823 (_ BitVec 32))) (Undefined!4654) (MissingVacant!4654 (index!20843 (_ BitVec 32))) )
))
(declare-fun lt!244863 () SeekEntryResult!4654)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!531655 (= res!327288 (or (= lt!244863 (MissingZero!4654 i!1153)) (= lt!244863 (MissingVacant!4654 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-datatypes ((array!33714 0))(
  ( (array!33715 (arr!16199 (Array (_ BitVec 32) (_ BitVec 64))) (size!16564 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33714)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33714 (_ BitVec 32)) SeekEntryResult!4654)

(assert (=> b!531655 (= lt!244863 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!531656 () Bool)

(declare-fun res!327287 () Bool)

(assert (=> b!531656 (=> (not res!327287) (not e!309605))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!531656 (= res!327287 (and (= (size!16564 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16564 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16564 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!531657 () Bool)

(declare-fun res!327292 () Bool)

(assert (=> b!531657 (=> (not res!327292) (not e!309605))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!531657 (= res!327292 (validKeyInArray!0 k0!1998))))

(declare-fun b!531658 () Bool)

(declare-fun res!327290 () Bool)

(assert (=> b!531658 (=> (not res!327290) (not e!309605))))

(assert (=> b!531658 (= res!327290 (validKeyInArray!0 (select (arr!16199 a!3154) j!147)))))

(declare-fun b!531659 () Bool)

(declare-fun res!327289 () Bool)

(assert (=> b!531659 (=> (not res!327289) (not e!309605))))

(declare-fun arrayContainsKey!0 (array!33714 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!531659 (= res!327289 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!531660 () Bool)

(declare-fun res!327293 () Bool)

(assert (=> b!531660 (=> (not res!327293) (not e!309606))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33714 (_ BitVec 32)) Bool)

(assert (=> b!531660 (= res!327293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!327291 () Bool)

(assert (=> start!48396 (=> (not res!327291) (not e!309605))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48396 (= res!327291 (validMask!0 mask!3216))))

(assert (=> start!48396 e!309605))

(assert (=> start!48396 true))

(declare-fun array_inv!12082 (array!33714) Bool)

(assert (=> start!48396 (array_inv!12082 a!3154)))

(declare-fun b!531661 () Bool)

(assert (=> b!531661 (= e!309606 false)))

(declare-fun lt!244864 () Bool)

(declare-datatypes ((List!10357 0))(
  ( (Nil!10354) (Cons!10353 (h!11293 (_ BitVec 64)) (t!16576 List!10357)) )
))
(declare-fun arrayNoDuplicates!0 (array!33714 (_ BitVec 32) List!10357) Bool)

(assert (=> b!531661 (= lt!244864 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10354))))

(assert (= (and start!48396 res!327291) b!531656))

(assert (= (and b!531656 res!327287) b!531658))

(assert (= (and b!531658 res!327290) b!531657))

(assert (= (and b!531657 res!327292) b!531659))

(assert (= (and b!531659 res!327289) b!531655))

(assert (= (and b!531655 res!327288) b!531660))

(assert (= (and b!531660 res!327293) b!531661))

(declare-fun m!511507 () Bool)

(assert (=> b!531659 m!511507))

(declare-fun m!511509 () Bool)

(assert (=> b!531658 m!511509))

(assert (=> b!531658 m!511509))

(declare-fun m!511511 () Bool)

(assert (=> b!531658 m!511511))

(declare-fun m!511513 () Bool)

(assert (=> b!531660 m!511513))

(declare-fun m!511515 () Bool)

(assert (=> b!531655 m!511515))

(declare-fun m!511517 () Bool)

(assert (=> b!531661 m!511517))

(declare-fun m!511519 () Bool)

(assert (=> start!48396 m!511519))

(declare-fun m!511521 () Bool)

(assert (=> start!48396 m!511521))

(declare-fun m!511523 () Bool)

(assert (=> b!531657 m!511523))

(check-sat (not b!531659) (not b!531658) (not start!48396) (not b!531660) (not b!531655) (not b!531657) (not b!531661))
(check-sat)
