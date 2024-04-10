; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86560 () Bool)

(assert start!86560)

(declare-fun b!1003389 () Bool)

(declare-fun res!672879 () Bool)

(declare-fun e!565151 () Bool)

(assert (=> b!1003389 (=> (not res!672879) (not e!565151))))

(declare-datatypes ((array!63361 0))(
  ( (array!63362 (arr!30506 (Array (_ BitVec 32) (_ BitVec 64))) (size!31008 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63361)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1003389 (= res!672879 (and (= (size!31008 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31008 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31008 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1003390 () Bool)

(declare-fun res!672872 () Bool)

(declare-fun e!565147 () Bool)

(assert (=> b!1003390 (=> (not res!672872) (not e!565147))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1003390 (= res!672872 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31008 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31008 a!3219))))))

(declare-fun b!1003391 () Bool)

(declare-fun res!672868 () Bool)

(assert (=> b!1003391 (=> (not res!672868) (not e!565151))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63361 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1003391 (= res!672868 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1003392 () Bool)

(declare-fun e!565149 () Bool)

(assert (=> b!1003392 (= e!565147 e!565149)))

(declare-fun res!672876 () Bool)

(assert (=> b!1003392 (=> (not res!672876) (not e!565149))))

(declare-datatypes ((SeekEntryResult!9438 0))(
  ( (MissingZero!9438 (index!40123 (_ BitVec 32))) (Found!9438 (index!40124 (_ BitVec 32))) (Intermediate!9438 (undefined!10250 Bool) (index!40125 (_ BitVec 32)) (x!87530 (_ BitVec 32))) (Undefined!9438) (MissingVacant!9438 (index!40126 (_ BitVec 32))) )
))
(declare-fun lt!443651 () SeekEntryResult!9438)

(declare-fun lt!443653 () SeekEntryResult!9438)

(assert (=> b!1003392 (= res!672876 (= lt!443651 lt!443653))))

(assert (=> b!1003392 (= lt!443653 (Intermediate!9438 false resIndex!38 resX!38))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63361 (_ BitVec 32)) SeekEntryResult!9438)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003392 (= lt!443651 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30506 a!3219) j!170) mask!3464) (select (arr!30506 a!3219) j!170) a!3219 mask!3464))))

(declare-fun res!672873 () Bool)

(assert (=> start!86560 (=> (not res!672873) (not e!565151))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86560 (= res!672873 (validMask!0 mask!3464))))

(assert (=> start!86560 e!565151))

(declare-fun array_inv!23630 (array!63361) Bool)

(assert (=> start!86560 (array_inv!23630 a!3219)))

(assert (=> start!86560 true))

(declare-fun b!1003393 () Bool)

(assert (=> b!1003393 (= e!565151 e!565147)))

(declare-fun res!672880 () Bool)

(assert (=> b!1003393 (=> (not res!672880) (not e!565147))))

(declare-fun lt!443655 () SeekEntryResult!9438)

(assert (=> b!1003393 (= res!672880 (or (= lt!443655 (MissingVacant!9438 i!1194)) (= lt!443655 (MissingZero!9438 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63361 (_ BitVec 32)) SeekEntryResult!9438)

(assert (=> b!1003393 (= lt!443655 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1003394 () Bool)

(declare-fun res!672870 () Bool)

(assert (=> b!1003394 (=> (not res!672870) (not e!565151))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1003394 (= res!672870 (validKeyInArray!0 k0!2224))))

(declare-fun b!1003395 () Bool)

(declare-fun e!565153 () Bool)

(declare-fun e!565150 () Bool)

(assert (=> b!1003395 (= e!565153 e!565150)))

(declare-fun res!672869 () Bool)

(assert (=> b!1003395 (=> (not res!672869) (not e!565150))))

(declare-fun lt!443652 () (_ BitVec 32))

(assert (=> b!1003395 (= res!672869 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443652 #b00000000000000000000000000000000) (bvslt lt!443652 (size!31008 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003395 (= lt!443652 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1003396 () Bool)

(declare-fun res!672878 () Bool)

(assert (=> b!1003396 (=> (not res!672878) (not e!565147))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63361 (_ BitVec 32)) Bool)

(assert (=> b!1003396 (= res!672878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1003397 () Bool)

(assert (=> b!1003397 (= e!565150 false)))

(declare-fun lt!443654 () (_ BitVec 64))

(declare-fun lt!443657 () array!63361)

(declare-fun lt!443656 () SeekEntryResult!9438)

(assert (=> b!1003397 (= lt!443656 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443652 lt!443654 lt!443657 mask!3464))))

(declare-fun b!1003398 () Bool)

(declare-fun e!565148 () Bool)

(assert (=> b!1003398 (= e!565149 e!565148)))

(declare-fun res!672867 () Bool)

(assert (=> b!1003398 (=> (not res!672867) (not e!565148))))

(declare-fun lt!443650 () SeekEntryResult!9438)

(assert (=> b!1003398 (= res!672867 (= lt!443650 lt!443653))))

(assert (=> b!1003398 (= lt!443650 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30506 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003399 () Bool)

(declare-fun res!672871 () Bool)

(assert (=> b!1003399 (=> (not res!672871) (not e!565150))))

(assert (=> b!1003399 (= res!672871 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443652 (select (arr!30506 a!3219) j!170) a!3219 mask!3464) lt!443653))))

(declare-fun b!1003400 () Bool)

(declare-fun res!672875 () Bool)

(assert (=> b!1003400 (=> (not res!672875) (not e!565153))))

(assert (=> b!1003400 (= res!672875 (not (= lt!443650 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443654 lt!443657 mask!3464))))))

(declare-fun b!1003401 () Bool)

(declare-fun res!672874 () Bool)

(assert (=> b!1003401 (=> (not res!672874) (not e!565151))))

(assert (=> b!1003401 (= res!672874 (validKeyInArray!0 (select (arr!30506 a!3219) j!170)))))

(declare-fun b!1003402 () Bool)

(declare-fun res!672881 () Bool)

(assert (=> b!1003402 (=> (not res!672881) (not e!565153))))

(assert (=> b!1003402 (= res!672881 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1003403 () Bool)

(assert (=> b!1003403 (= e!565148 e!565153)))

(declare-fun res!672877 () Bool)

(assert (=> b!1003403 (=> (not res!672877) (not e!565153))))

(assert (=> b!1003403 (= res!672877 (not (= lt!443651 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443654 mask!3464) lt!443654 lt!443657 mask!3464))))))

(assert (=> b!1003403 (= lt!443654 (select (store (arr!30506 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1003403 (= lt!443657 (array!63362 (store (arr!30506 a!3219) i!1194 k0!2224) (size!31008 a!3219)))))

(declare-fun b!1003404 () Bool)

(declare-fun res!672882 () Bool)

(assert (=> b!1003404 (=> (not res!672882) (not e!565147))))

(declare-datatypes ((List!21182 0))(
  ( (Nil!21179) (Cons!21178 (h!22355 (_ BitVec 64)) (t!30183 List!21182)) )
))
(declare-fun arrayNoDuplicates!0 (array!63361 (_ BitVec 32) List!21182) Bool)

(assert (=> b!1003404 (= res!672882 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21179))))

(assert (= (and start!86560 res!672873) b!1003389))

(assert (= (and b!1003389 res!672879) b!1003401))

(assert (= (and b!1003401 res!672874) b!1003394))

(assert (= (and b!1003394 res!672870) b!1003391))

(assert (= (and b!1003391 res!672868) b!1003393))

(assert (= (and b!1003393 res!672880) b!1003396))

(assert (= (and b!1003396 res!672878) b!1003404))

(assert (= (and b!1003404 res!672882) b!1003390))

(assert (= (and b!1003390 res!672872) b!1003392))

(assert (= (and b!1003392 res!672876) b!1003398))

(assert (= (and b!1003398 res!672867) b!1003403))

(assert (= (and b!1003403 res!672877) b!1003400))

(assert (= (and b!1003400 res!672875) b!1003402))

(assert (= (and b!1003402 res!672881) b!1003395))

(assert (= (and b!1003395 res!672869) b!1003399))

(assert (= (and b!1003399 res!672871) b!1003397))

(declare-fun m!929109 () Bool)

(assert (=> start!86560 m!929109))

(declare-fun m!929111 () Bool)

(assert (=> start!86560 m!929111))

(declare-fun m!929113 () Bool)

(assert (=> b!1003399 m!929113))

(assert (=> b!1003399 m!929113))

(declare-fun m!929115 () Bool)

(assert (=> b!1003399 m!929115))

(declare-fun m!929117 () Bool)

(assert (=> b!1003394 m!929117))

(declare-fun m!929119 () Bool)

(assert (=> b!1003400 m!929119))

(assert (=> b!1003392 m!929113))

(assert (=> b!1003392 m!929113))

(declare-fun m!929121 () Bool)

(assert (=> b!1003392 m!929121))

(assert (=> b!1003392 m!929121))

(assert (=> b!1003392 m!929113))

(declare-fun m!929123 () Bool)

(assert (=> b!1003392 m!929123))

(declare-fun m!929125 () Bool)

(assert (=> b!1003395 m!929125))

(assert (=> b!1003401 m!929113))

(assert (=> b!1003401 m!929113))

(declare-fun m!929127 () Bool)

(assert (=> b!1003401 m!929127))

(declare-fun m!929129 () Bool)

(assert (=> b!1003397 m!929129))

(declare-fun m!929131 () Bool)

(assert (=> b!1003393 m!929131))

(declare-fun m!929133 () Bool)

(assert (=> b!1003403 m!929133))

(assert (=> b!1003403 m!929133))

(declare-fun m!929135 () Bool)

(assert (=> b!1003403 m!929135))

(declare-fun m!929137 () Bool)

(assert (=> b!1003403 m!929137))

(declare-fun m!929139 () Bool)

(assert (=> b!1003403 m!929139))

(declare-fun m!929141 () Bool)

(assert (=> b!1003404 m!929141))

(declare-fun m!929143 () Bool)

(assert (=> b!1003396 m!929143))

(assert (=> b!1003398 m!929113))

(assert (=> b!1003398 m!929113))

(declare-fun m!929145 () Bool)

(assert (=> b!1003398 m!929145))

(declare-fun m!929147 () Bool)

(assert (=> b!1003391 m!929147))

(check-sat (not b!1003391) (not b!1003404) (not b!1003393) (not b!1003397) (not b!1003399) (not b!1003394) (not b!1003395) (not start!86560) (not b!1003398) (not b!1003403) (not b!1003392) (not b!1003400) (not b!1003396) (not b!1003401))
(check-sat)
