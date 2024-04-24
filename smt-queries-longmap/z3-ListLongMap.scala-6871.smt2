; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86710 () Bool)

(assert start!86710)

(declare-fun b!1002715 () Bool)

(declare-fun res!671441 () Bool)

(declare-fun e!565114 () Bool)

(assert (=> b!1002715 (=> (not res!671441) (not e!565114))))

(declare-datatypes ((array!63330 0))(
  ( (array!63331 (arr!30484 (Array (_ BitVec 32) (_ BitVec 64))) (size!30987 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63330)

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63330 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1002715 (= res!671441 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1002716 () Bool)

(declare-fun e!565115 () Bool)

(declare-fun e!565111 () Bool)

(assert (=> b!1002716 (= e!565115 e!565111)))

(declare-fun res!671436 () Bool)

(assert (=> b!1002716 (=> (not res!671436) (not e!565111))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun lt!443170 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1002716 (= res!671436 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443170 #b00000000000000000000000000000000) (bvslt lt!443170 (size!30987 a!3219))))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002716 (= lt!443170 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1002717 () Bool)

(declare-fun e!565116 () Bool)

(declare-fun e!565110 () Bool)

(assert (=> b!1002717 (= e!565116 e!565110)))

(declare-fun res!671435 () Bool)

(assert (=> b!1002717 (=> (not res!671435) (not e!565110))))

(declare-datatypes ((SeekEntryResult!9352 0))(
  ( (MissingZero!9352 (index!39779 (_ BitVec 32))) (Found!9352 (index!39780 (_ BitVec 32))) (Intermediate!9352 (undefined!10164 Bool) (index!39781 (_ BitVec 32)) (x!87360 (_ BitVec 32))) (Undefined!9352) (MissingVacant!9352 (index!39782 (_ BitVec 32))) )
))
(declare-fun lt!443171 () SeekEntryResult!9352)

(declare-fun lt!443175 () SeekEntryResult!9352)

(assert (=> b!1002717 (= res!671435 (= lt!443171 lt!443175))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1002717 (= lt!443175 (Intermediate!9352 false resIndex!38 resX!38))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63330 (_ BitVec 32)) SeekEntryResult!9352)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002717 (= lt!443171 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30484 a!3219) j!170) mask!3464) (select (arr!30484 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002718 () Bool)

(declare-fun res!671445 () Bool)

(assert (=> b!1002718 (=> (not res!671445) (not e!565114))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1002718 (= res!671445 (validKeyInArray!0 k0!2224))))

(declare-fun b!1002719 () Bool)

(declare-fun res!671437 () Bool)

(assert (=> b!1002719 (=> (not res!671437) (not e!565115))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1002719 (= res!671437 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1002720 () Bool)

(declare-fun res!671443 () Bool)

(assert (=> b!1002720 (=> (not res!671443) (not e!565114))))

(assert (=> b!1002720 (= res!671443 (and (= (size!30987 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30987 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30987 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1002721 () Bool)

(declare-fun res!671446 () Bool)

(assert (=> b!1002721 (=> (not res!671446) (not e!565115))))

(declare-fun lt!443174 () array!63330)

(declare-fun lt!443177 () (_ BitVec 64))

(declare-fun lt!443176 () SeekEntryResult!9352)

(assert (=> b!1002721 (= res!671446 (not (= lt!443176 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443177 lt!443174 mask!3464))))))

(declare-fun b!1002722 () Bool)

(declare-fun res!671438 () Bool)

(assert (=> b!1002722 (=> (not res!671438) (not e!565116))))

(declare-datatypes ((List!21131 0))(
  ( (Nil!21128) (Cons!21127 (h!22313 (_ BitVec 64)) (t!30124 List!21131)) )
))
(declare-fun arrayNoDuplicates!0 (array!63330 (_ BitVec 32) List!21131) Bool)

(assert (=> b!1002722 (= res!671438 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21128))))

(declare-fun b!1002723 () Bool)

(assert (=> b!1002723 (= e!565114 e!565116)))

(declare-fun res!671433 () Bool)

(assert (=> b!1002723 (=> (not res!671433) (not e!565116))))

(declare-fun lt!443173 () SeekEntryResult!9352)

(assert (=> b!1002723 (= res!671433 (or (= lt!443173 (MissingVacant!9352 i!1194)) (= lt!443173 (MissingZero!9352 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63330 (_ BitVec 32)) SeekEntryResult!9352)

(assert (=> b!1002723 (= lt!443173 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1002724 () Bool)

(declare-fun res!671444 () Bool)

(assert (=> b!1002724 (=> (not res!671444) (not e!565116))))

(assert (=> b!1002724 (= res!671444 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30987 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30987 a!3219))))))

(declare-fun b!1002726 () Bool)

(declare-fun res!671442 () Bool)

(assert (=> b!1002726 (=> (not res!671442) (not e!565111))))

(assert (=> b!1002726 (= res!671442 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443170 (select (arr!30484 a!3219) j!170) a!3219 mask!3464) lt!443175))))

(declare-fun b!1002727 () Bool)

(declare-fun res!671447 () Bool)

(assert (=> b!1002727 (=> (not res!671447) (not e!565114))))

(assert (=> b!1002727 (= res!671447 (validKeyInArray!0 (select (arr!30484 a!3219) j!170)))))

(declare-fun b!1002728 () Bool)

(declare-fun res!671439 () Bool)

(assert (=> b!1002728 (=> (not res!671439) (not e!565116))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63330 (_ BitVec 32)) Bool)

(assert (=> b!1002728 (= res!671439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1002729 () Bool)

(declare-fun e!565112 () Bool)

(assert (=> b!1002729 (= e!565110 e!565112)))

(declare-fun res!671440 () Bool)

(assert (=> b!1002729 (=> (not res!671440) (not e!565112))))

(assert (=> b!1002729 (= res!671440 (= lt!443176 lt!443175))))

(assert (=> b!1002729 (= lt!443176 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30484 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002730 () Bool)

(assert (=> b!1002730 (= e!565111 false)))

(declare-fun lt!443172 () SeekEntryResult!9352)

(assert (=> b!1002730 (= lt!443172 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443170 lt!443177 lt!443174 mask!3464))))

(declare-fun b!1002725 () Bool)

(assert (=> b!1002725 (= e!565112 e!565115)))

(declare-fun res!671432 () Bool)

(assert (=> b!1002725 (=> (not res!671432) (not e!565115))))

(assert (=> b!1002725 (= res!671432 (not (= lt!443171 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443177 mask!3464) lt!443177 lt!443174 mask!3464))))))

(assert (=> b!1002725 (= lt!443177 (select (store (arr!30484 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1002725 (= lt!443174 (array!63331 (store (arr!30484 a!3219) i!1194 k0!2224) (size!30987 a!3219)))))

(declare-fun res!671434 () Bool)

(assert (=> start!86710 (=> (not res!671434) (not e!565114))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86710 (= res!671434 (validMask!0 mask!3464))))

(assert (=> start!86710 e!565114))

(declare-fun array_inv!23620 (array!63330) Bool)

(assert (=> start!86710 (array_inv!23620 a!3219)))

(assert (=> start!86710 true))

(assert (= (and start!86710 res!671434) b!1002720))

(assert (= (and b!1002720 res!671443) b!1002727))

(assert (= (and b!1002727 res!671447) b!1002718))

(assert (= (and b!1002718 res!671445) b!1002715))

(assert (= (and b!1002715 res!671441) b!1002723))

(assert (= (and b!1002723 res!671433) b!1002728))

(assert (= (and b!1002728 res!671439) b!1002722))

(assert (= (and b!1002722 res!671438) b!1002724))

(assert (= (and b!1002724 res!671444) b!1002717))

(assert (= (and b!1002717 res!671435) b!1002729))

(assert (= (and b!1002729 res!671440) b!1002725))

(assert (= (and b!1002725 res!671432) b!1002721))

(assert (= (and b!1002721 res!671446) b!1002719))

(assert (= (and b!1002719 res!671437) b!1002716))

(assert (= (and b!1002716 res!671436) b!1002726))

(assert (= (and b!1002726 res!671442) b!1002730))

(declare-fun m!929033 () Bool)

(assert (=> b!1002717 m!929033))

(assert (=> b!1002717 m!929033))

(declare-fun m!929035 () Bool)

(assert (=> b!1002717 m!929035))

(assert (=> b!1002717 m!929035))

(assert (=> b!1002717 m!929033))

(declare-fun m!929037 () Bool)

(assert (=> b!1002717 m!929037))

(declare-fun m!929039 () Bool)

(assert (=> b!1002722 m!929039))

(declare-fun m!929041 () Bool)

(assert (=> b!1002718 m!929041))

(declare-fun m!929043 () Bool)

(assert (=> b!1002730 m!929043))

(declare-fun m!929045 () Bool)

(assert (=> b!1002725 m!929045))

(assert (=> b!1002725 m!929045))

(declare-fun m!929047 () Bool)

(assert (=> b!1002725 m!929047))

(declare-fun m!929049 () Bool)

(assert (=> b!1002725 m!929049))

(declare-fun m!929051 () Bool)

(assert (=> b!1002725 m!929051))

(assert (=> b!1002729 m!929033))

(assert (=> b!1002729 m!929033))

(declare-fun m!929053 () Bool)

(assert (=> b!1002729 m!929053))

(declare-fun m!929055 () Bool)

(assert (=> start!86710 m!929055))

(declare-fun m!929057 () Bool)

(assert (=> start!86710 m!929057))

(declare-fun m!929059 () Bool)

(assert (=> b!1002715 m!929059))

(assert (=> b!1002727 m!929033))

(assert (=> b!1002727 m!929033))

(declare-fun m!929061 () Bool)

(assert (=> b!1002727 m!929061))

(declare-fun m!929063 () Bool)

(assert (=> b!1002723 m!929063))

(declare-fun m!929065 () Bool)

(assert (=> b!1002728 m!929065))

(declare-fun m!929067 () Bool)

(assert (=> b!1002716 m!929067))

(assert (=> b!1002726 m!929033))

(assert (=> b!1002726 m!929033))

(declare-fun m!929069 () Bool)

(assert (=> b!1002726 m!929069))

(declare-fun m!929071 () Bool)

(assert (=> b!1002721 m!929071))

(check-sat (not b!1002715) (not b!1002722) (not start!86710) (not b!1002726) (not b!1002730) (not b!1002718) (not b!1002717) (not b!1002721) (not b!1002723) (not b!1002729) (not b!1002727) (not b!1002728) (not b!1002725) (not b!1002716))
(check-sat)
