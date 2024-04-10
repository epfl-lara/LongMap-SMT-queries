; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86530 () Bool)

(assert start!86530)

(declare-fun b!1002669 () Bool)

(declare-fun e!564837 () Bool)

(declare-fun e!564835 () Bool)

(assert (=> b!1002669 (= e!564837 e!564835)))

(declare-fun res!672151 () Bool)

(assert (=> b!1002669 (=> (not res!672151) (not e!564835))))

(declare-datatypes ((SeekEntryResult!9423 0))(
  ( (MissingZero!9423 (index!40063 (_ BitVec 32))) (Found!9423 (index!40064 (_ BitVec 32))) (Intermediate!9423 (undefined!10235 Bool) (index!40065 (_ BitVec 32)) (x!87475 (_ BitVec 32))) (Undefined!9423) (MissingVacant!9423 (index!40066 (_ BitVec 32))) )
))
(declare-fun lt!443297 () SeekEntryResult!9423)

(declare-fun lt!443295 () SeekEntryResult!9423)

(assert (=> b!1002669 (= res!672151 (= lt!443297 lt!443295))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1002669 (= lt!443295 (Intermediate!9423 false resIndex!38 resX!38))))

(declare-datatypes ((array!63331 0))(
  ( (array!63332 (arr!30491 (Array (_ BitVec 32) (_ BitVec 64))) (size!30993 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63331)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63331 (_ BitVec 32)) SeekEntryResult!9423)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002669 (= lt!443297 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30491 a!3219) j!170) mask!3464) (select (arr!30491 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002670 () Bool)

(declare-fun e!564836 () Bool)

(assert (=> b!1002670 (= e!564836 e!564837)))

(declare-fun res!672153 () Bool)

(assert (=> b!1002670 (=> (not res!672153) (not e!564837))))

(declare-fun lt!443290 () SeekEntryResult!9423)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1002670 (= res!672153 (or (= lt!443290 (MissingVacant!9423 i!1194)) (= lt!443290 (MissingZero!9423 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63331 (_ BitVec 32)) SeekEntryResult!9423)

(assert (=> b!1002670 (= lt!443290 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1002671 () Bool)

(declare-fun e!564838 () Bool)

(assert (=> b!1002671 (= e!564835 e!564838)))

(declare-fun res!672150 () Bool)

(assert (=> b!1002671 (=> (not res!672150) (not e!564838))))

(declare-fun lt!443292 () SeekEntryResult!9423)

(assert (=> b!1002671 (= res!672150 (= lt!443292 lt!443295))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1002671 (= lt!443292 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30491 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002672 () Bool)

(declare-fun e!564832 () Bool)

(assert (=> b!1002672 (= e!564838 e!564832)))

(declare-fun res!672158 () Bool)

(assert (=> b!1002672 (=> (not res!672158) (not e!564832))))

(declare-fun lt!443294 () array!63331)

(declare-fun lt!443296 () (_ BitVec 64))

(assert (=> b!1002672 (= res!672158 (not (= lt!443297 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443296 mask!3464) lt!443296 lt!443294 mask!3464))))))

(assert (=> b!1002672 (= lt!443296 (select (store (arr!30491 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1002672 (= lt!443294 (array!63332 (store (arr!30491 a!3219) i!1194 k0!2224) (size!30993 a!3219)))))

(declare-fun b!1002673 () Bool)

(declare-fun res!672157 () Bool)

(assert (=> b!1002673 (=> (not res!672157) (not e!564836))))

(declare-fun arrayContainsKey!0 (array!63331 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1002673 (= res!672157 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1002674 () Bool)

(declare-fun res!672149 () Bool)

(assert (=> b!1002674 (=> (not res!672149) (not e!564837))))

(declare-datatypes ((List!21167 0))(
  ( (Nil!21164) (Cons!21163 (h!22340 (_ BitVec 64)) (t!30168 List!21167)) )
))
(declare-fun arrayNoDuplicates!0 (array!63331 (_ BitVec 32) List!21167) Bool)

(assert (=> b!1002674 (= res!672149 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21164))))

(declare-fun b!1002675 () Bool)

(declare-fun res!672156 () Bool)

(declare-fun e!564834 () Bool)

(assert (=> b!1002675 (=> (not res!672156) (not e!564834))))

(declare-fun lt!443293 () (_ BitVec 32))

(assert (=> b!1002675 (= res!672156 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443293 (select (arr!30491 a!3219) j!170) a!3219 mask!3464) lt!443295))))

(declare-fun b!1002676 () Bool)

(declare-fun res!672161 () Bool)

(assert (=> b!1002676 (=> (not res!672161) (not e!564836))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1002676 (= res!672161 (validKeyInArray!0 k0!2224))))

(declare-fun b!1002677 () Bool)

(assert (=> b!1002677 (= e!564834 false)))

(declare-fun lt!443291 () SeekEntryResult!9423)

(assert (=> b!1002677 (= lt!443291 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443293 lt!443296 lt!443294 mask!3464))))

(declare-fun b!1002678 () Bool)

(assert (=> b!1002678 (= e!564832 e!564834)))

(declare-fun res!672148 () Bool)

(assert (=> b!1002678 (=> (not res!672148) (not e!564834))))

(assert (=> b!1002678 (= res!672148 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443293 #b00000000000000000000000000000000) (bvslt lt!443293 (size!30993 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002678 (= lt!443293 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun res!672155 () Bool)

(assert (=> start!86530 (=> (not res!672155) (not e!564836))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86530 (= res!672155 (validMask!0 mask!3464))))

(assert (=> start!86530 e!564836))

(declare-fun array_inv!23615 (array!63331) Bool)

(assert (=> start!86530 (array_inv!23615 a!3219)))

(assert (=> start!86530 true))

(declare-fun b!1002679 () Bool)

(declare-fun res!672162 () Bool)

(assert (=> b!1002679 (=> (not res!672162) (not e!564837))))

(assert (=> b!1002679 (= res!672162 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30993 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30993 a!3219))))))

(declare-fun b!1002680 () Bool)

(declare-fun res!672147 () Bool)

(assert (=> b!1002680 (=> (not res!672147) (not e!564837))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63331 (_ BitVec 32)) Bool)

(assert (=> b!1002680 (= res!672147 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1002681 () Bool)

(declare-fun res!672154 () Bool)

(assert (=> b!1002681 (=> (not res!672154) (not e!564832))))

(assert (=> b!1002681 (= res!672154 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1002682 () Bool)

(declare-fun res!672152 () Bool)

(assert (=> b!1002682 (=> (not res!672152) (not e!564832))))

(assert (=> b!1002682 (= res!672152 (not (= lt!443292 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443296 lt!443294 mask!3464))))))

(declare-fun b!1002683 () Bool)

(declare-fun res!672160 () Bool)

(assert (=> b!1002683 (=> (not res!672160) (not e!564836))))

(assert (=> b!1002683 (= res!672160 (validKeyInArray!0 (select (arr!30491 a!3219) j!170)))))

(declare-fun b!1002684 () Bool)

(declare-fun res!672159 () Bool)

(assert (=> b!1002684 (=> (not res!672159) (not e!564836))))

(assert (=> b!1002684 (= res!672159 (and (= (size!30993 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30993 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30993 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!86530 res!672155) b!1002684))

(assert (= (and b!1002684 res!672159) b!1002683))

(assert (= (and b!1002683 res!672160) b!1002676))

(assert (= (and b!1002676 res!672161) b!1002673))

(assert (= (and b!1002673 res!672157) b!1002670))

(assert (= (and b!1002670 res!672153) b!1002680))

(assert (= (and b!1002680 res!672147) b!1002674))

(assert (= (and b!1002674 res!672149) b!1002679))

(assert (= (and b!1002679 res!672162) b!1002669))

(assert (= (and b!1002669 res!672151) b!1002671))

(assert (= (and b!1002671 res!672150) b!1002672))

(assert (= (and b!1002672 res!672158) b!1002682))

(assert (= (and b!1002682 res!672152) b!1002681))

(assert (= (and b!1002681 res!672154) b!1002678))

(assert (= (and b!1002678 res!672148) b!1002675))

(assert (= (and b!1002675 res!672156) b!1002677))

(declare-fun m!928509 () Bool)

(assert (=> b!1002669 m!928509))

(assert (=> b!1002669 m!928509))

(declare-fun m!928511 () Bool)

(assert (=> b!1002669 m!928511))

(assert (=> b!1002669 m!928511))

(assert (=> b!1002669 m!928509))

(declare-fun m!928513 () Bool)

(assert (=> b!1002669 m!928513))

(declare-fun m!928515 () Bool)

(assert (=> b!1002680 m!928515))

(declare-fun m!928517 () Bool)

(assert (=> b!1002678 m!928517))

(declare-fun m!928519 () Bool)

(assert (=> b!1002682 m!928519))

(declare-fun m!928521 () Bool)

(assert (=> b!1002672 m!928521))

(assert (=> b!1002672 m!928521))

(declare-fun m!928523 () Bool)

(assert (=> b!1002672 m!928523))

(declare-fun m!928525 () Bool)

(assert (=> b!1002672 m!928525))

(declare-fun m!928527 () Bool)

(assert (=> b!1002672 m!928527))

(declare-fun m!928529 () Bool)

(assert (=> b!1002673 m!928529))

(declare-fun m!928531 () Bool)

(assert (=> b!1002677 m!928531))

(assert (=> b!1002671 m!928509))

(assert (=> b!1002671 m!928509))

(declare-fun m!928533 () Bool)

(assert (=> b!1002671 m!928533))

(assert (=> b!1002683 m!928509))

(assert (=> b!1002683 m!928509))

(declare-fun m!928535 () Bool)

(assert (=> b!1002683 m!928535))

(declare-fun m!928537 () Bool)

(assert (=> b!1002670 m!928537))

(declare-fun m!928539 () Bool)

(assert (=> start!86530 m!928539))

(declare-fun m!928541 () Bool)

(assert (=> start!86530 m!928541))

(assert (=> b!1002675 m!928509))

(assert (=> b!1002675 m!928509))

(declare-fun m!928543 () Bool)

(assert (=> b!1002675 m!928543))

(declare-fun m!928545 () Bool)

(assert (=> b!1002676 m!928545))

(declare-fun m!928547 () Bool)

(assert (=> b!1002674 m!928547))

(check-sat (not b!1002676) (not b!1002678) (not b!1002673) (not b!1002677) (not b!1002680) (not b!1002682) (not b!1002683) (not start!86530) (not b!1002672) (not b!1002675) (not b!1002669) (not b!1002674) (not b!1002671) (not b!1002670))
(check-sat)
