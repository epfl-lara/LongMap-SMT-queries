; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86572 () Bool)

(assert start!86572)

(declare-fun b!1003677 () Bool)

(declare-fun res!673169 () Bool)

(declare-fun e!565274 () Bool)

(assert (=> b!1003677 (=> (not res!673169) (not e!565274))))

(declare-datatypes ((array!63373 0))(
  ( (array!63374 (arr!30512 (Array (_ BitVec 32) (_ BitVec 64))) (size!31014 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63373)

(declare-datatypes ((List!21188 0))(
  ( (Nil!21185) (Cons!21184 (h!22361 (_ BitVec 64)) (t!30189 List!21188)) )
))
(declare-fun arrayNoDuplicates!0 (array!63373 (_ BitVec 32) List!21188) Bool)

(assert (=> b!1003677 (= res!673169 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21185))))

(declare-fun res!673155 () Bool)

(declare-fun e!565273 () Bool)

(assert (=> start!86572 (=> (not res!673155) (not e!565273))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86572 (= res!673155 (validMask!0 mask!3464))))

(assert (=> start!86572 e!565273))

(declare-fun array_inv!23636 (array!63373) Bool)

(assert (=> start!86572 (array_inv!23636 a!3219)))

(assert (=> start!86572 true))

(declare-fun b!1003678 () Bool)

(declare-fun e!565277 () Bool)

(assert (=> b!1003678 (= e!565277 false)))

(declare-fun lt!443799 () (_ BitVec 64))

(declare-fun lt!443795 () (_ BitVec 32))

(declare-fun lt!443798 () array!63373)

(declare-datatypes ((SeekEntryResult!9444 0))(
  ( (MissingZero!9444 (index!40147 (_ BitVec 32))) (Found!9444 (index!40148 (_ BitVec 32))) (Intermediate!9444 (undefined!10256 Bool) (index!40149 (_ BitVec 32)) (x!87552 (_ BitVec 32))) (Undefined!9444) (MissingVacant!9444 (index!40150 (_ BitVec 32))) )
))
(declare-fun lt!443801 () SeekEntryResult!9444)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63373 (_ BitVec 32)) SeekEntryResult!9444)

(assert (=> b!1003678 (= lt!443801 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443795 lt!443799 lt!443798 mask!3464))))

(declare-fun b!1003679 () Bool)

(declare-fun res!673165 () Bool)

(assert (=> b!1003679 (=> (not res!673165) (not e!565273))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1003679 (= res!673165 (validKeyInArray!0 k0!2224))))

(declare-fun b!1003680 () Bool)

(declare-fun res!673162 () Bool)

(assert (=> b!1003680 (=> (not res!673162) (not e!565273))))

(declare-fun arrayContainsKey!0 (array!63373 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1003680 (= res!673162 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1003681 () Bool)

(declare-fun e!565278 () Bool)

(declare-fun e!565279 () Bool)

(assert (=> b!1003681 (= e!565278 e!565279)))

(declare-fun res!673168 () Bool)

(assert (=> b!1003681 (=> (not res!673168) (not e!565279))))

(declare-fun lt!443796 () SeekEntryResult!9444)

(declare-fun lt!443797 () SeekEntryResult!9444)

(assert (=> b!1003681 (= res!673168 (= lt!443796 lt!443797))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1003681 (= lt!443796 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30512 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003682 () Bool)

(declare-fun res!673157 () Bool)

(assert (=> b!1003682 (=> (not res!673157) (not e!565274))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1003682 (= res!673157 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31014 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31014 a!3219))))))

(declare-fun b!1003683 () Bool)

(declare-fun e!565276 () Bool)

(assert (=> b!1003683 (= e!565279 e!565276)))

(declare-fun res!673164 () Bool)

(assert (=> b!1003683 (=> (not res!673164) (not e!565276))))

(declare-fun lt!443800 () SeekEntryResult!9444)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003683 (= res!673164 (not (= lt!443800 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443799 mask!3464) lt!443799 lt!443798 mask!3464))))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1003683 (= lt!443799 (select (store (arr!30512 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1003683 (= lt!443798 (array!63374 (store (arr!30512 a!3219) i!1194 k0!2224) (size!31014 a!3219)))))

(declare-fun b!1003684 () Bool)

(assert (=> b!1003684 (= e!565274 e!565278)))

(declare-fun res!673166 () Bool)

(assert (=> b!1003684 (=> (not res!673166) (not e!565278))))

(assert (=> b!1003684 (= res!673166 (= lt!443800 lt!443797))))

(assert (=> b!1003684 (= lt!443797 (Intermediate!9444 false resIndex!38 resX!38))))

(assert (=> b!1003684 (= lt!443800 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30512 a!3219) j!170) mask!3464) (select (arr!30512 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003685 () Bool)

(declare-fun res!673160 () Bool)

(assert (=> b!1003685 (=> (not res!673160) (not e!565276))))

(assert (=> b!1003685 (= res!673160 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1003686 () Bool)

(declare-fun res!673156 () Bool)

(assert (=> b!1003686 (=> (not res!673156) (not e!565273))))

(assert (=> b!1003686 (= res!673156 (and (= (size!31014 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31014 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31014 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1003687 () Bool)

(assert (=> b!1003687 (= e!565273 e!565274)))

(declare-fun res!673167 () Bool)

(assert (=> b!1003687 (=> (not res!673167) (not e!565274))))

(declare-fun lt!443794 () SeekEntryResult!9444)

(assert (=> b!1003687 (= res!673167 (or (= lt!443794 (MissingVacant!9444 i!1194)) (= lt!443794 (MissingZero!9444 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63373 (_ BitVec 32)) SeekEntryResult!9444)

(assert (=> b!1003687 (= lt!443794 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1003688 () Bool)

(assert (=> b!1003688 (= e!565276 e!565277)))

(declare-fun res!673158 () Bool)

(assert (=> b!1003688 (=> (not res!673158) (not e!565277))))

(assert (=> b!1003688 (= res!673158 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443795 #b00000000000000000000000000000000) (bvslt lt!443795 (size!31014 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003688 (= lt!443795 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1003689 () Bool)

(declare-fun res!673170 () Bool)

(assert (=> b!1003689 (=> (not res!673170) (not e!565274))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63373 (_ BitVec 32)) Bool)

(assert (=> b!1003689 (= res!673170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1003690 () Bool)

(declare-fun res!673161 () Bool)

(assert (=> b!1003690 (=> (not res!673161) (not e!565273))))

(assert (=> b!1003690 (= res!673161 (validKeyInArray!0 (select (arr!30512 a!3219) j!170)))))

(declare-fun b!1003691 () Bool)

(declare-fun res!673159 () Bool)

(assert (=> b!1003691 (=> (not res!673159) (not e!565276))))

(assert (=> b!1003691 (= res!673159 (not (= lt!443796 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443799 lt!443798 mask!3464))))))

(declare-fun b!1003692 () Bool)

(declare-fun res!673163 () Bool)

(assert (=> b!1003692 (=> (not res!673163) (not e!565277))))

(assert (=> b!1003692 (= res!673163 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443795 (select (arr!30512 a!3219) j!170) a!3219 mask!3464) lt!443797))))

(assert (= (and start!86572 res!673155) b!1003686))

(assert (= (and b!1003686 res!673156) b!1003690))

(assert (= (and b!1003690 res!673161) b!1003679))

(assert (= (and b!1003679 res!673165) b!1003680))

(assert (= (and b!1003680 res!673162) b!1003687))

(assert (= (and b!1003687 res!673167) b!1003689))

(assert (= (and b!1003689 res!673170) b!1003677))

(assert (= (and b!1003677 res!673169) b!1003682))

(assert (= (and b!1003682 res!673157) b!1003684))

(assert (= (and b!1003684 res!673166) b!1003681))

(assert (= (and b!1003681 res!673168) b!1003683))

(assert (= (and b!1003683 res!673164) b!1003691))

(assert (= (and b!1003691 res!673159) b!1003685))

(assert (= (and b!1003685 res!673160) b!1003688))

(assert (= (and b!1003688 res!673158) b!1003692))

(assert (= (and b!1003692 res!673163) b!1003678))

(declare-fun m!929349 () Bool)

(assert (=> b!1003683 m!929349))

(assert (=> b!1003683 m!929349))

(declare-fun m!929351 () Bool)

(assert (=> b!1003683 m!929351))

(declare-fun m!929353 () Bool)

(assert (=> b!1003683 m!929353))

(declare-fun m!929355 () Bool)

(assert (=> b!1003683 m!929355))

(declare-fun m!929357 () Bool)

(assert (=> b!1003679 m!929357))

(declare-fun m!929359 () Bool)

(assert (=> start!86572 m!929359))

(declare-fun m!929361 () Bool)

(assert (=> start!86572 m!929361))

(declare-fun m!929363 () Bool)

(assert (=> b!1003684 m!929363))

(assert (=> b!1003684 m!929363))

(declare-fun m!929365 () Bool)

(assert (=> b!1003684 m!929365))

(assert (=> b!1003684 m!929365))

(assert (=> b!1003684 m!929363))

(declare-fun m!929367 () Bool)

(assert (=> b!1003684 m!929367))

(declare-fun m!929369 () Bool)

(assert (=> b!1003687 m!929369))

(assert (=> b!1003681 m!929363))

(assert (=> b!1003681 m!929363))

(declare-fun m!929371 () Bool)

(assert (=> b!1003681 m!929371))

(assert (=> b!1003692 m!929363))

(assert (=> b!1003692 m!929363))

(declare-fun m!929373 () Bool)

(assert (=> b!1003692 m!929373))

(declare-fun m!929375 () Bool)

(assert (=> b!1003688 m!929375))

(assert (=> b!1003690 m!929363))

(assert (=> b!1003690 m!929363))

(declare-fun m!929377 () Bool)

(assert (=> b!1003690 m!929377))

(declare-fun m!929379 () Bool)

(assert (=> b!1003689 m!929379))

(declare-fun m!929381 () Bool)

(assert (=> b!1003678 m!929381))

(declare-fun m!929383 () Bool)

(assert (=> b!1003680 m!929383))

(declare-fun m!929385 () Bool)

(assert (=> b!1003677 m!929385))

(declare-fun m!929387 () Bool)

(assert (=> b!1003691 m!929387))

(check-sat (not b!1003678) (not b!1003683) (not b!1003681) (not b!1003684) (not b!1003679) (not b!1003691) (not b!1003690) (not b!1003680) (not b!1003692) (not b!1003687) (not b!1003688) (not b!1003677) (not start!86572) (not b!1003689))
(check-sat)
