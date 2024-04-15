; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86568 () Bool)

(assert start!86568)

(declare-fun b!1003555 () Bool)

(declare-fun e!565190 () Bool)

(declare-fun e!565189 () Bool)

(assert (=> b!1003555 (= e!565190 e!565189)))

(declare-fun res!673163 () Bool)

(assert (=> b!1003555 (=> (not res!673163) (not e!565189))))

(declare-datatypes ((SeekEntryResult!9440 0))(
  ( (MissingZero!9440 (index!40131 (_ BitVec 32))) (Found!9440 (index!40132 (_ BitVec 32))) (Intermediate!9440 (undefined!10252 Bool) (index!40133 (_ BitVec 32)) (x!87551 (_ BitVec 32))) (Undefined!9440) (MissingVacant!9440 (index!40134 (_ BitVec 32))) )
))
(declare-fun lt!443614 () SeekEntryResult!9440)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1003555 (= res!673163 (or (= lt!443614 (MissingVacant!9440 i!1194)) (= lt!443614 (MissingZero!9440 i!1194))))))

(declare-datatypes ((array!63316 0))(
  ( (array!63317 (arr!30483 (Array (_ BitVec 32) (_ BitVec 64))) (size!30987 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63316)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63316 (_ BitVec 32)) SeekEntryResult!9440)

(assert (=> b!1003555 (= lt!443614 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1003556 () Bool)

(declare-fun res!673158 () Bool)

(declare-fun e!565186 () Bool)

(assert (=> b!1003556 (=> (not res!673158) (not e!565186))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun lt!443610 () (_ BitVec 32))

(declare-fun lt!443612 () SeekEntryResult!9440)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63316 (_ BitVec 32)) SeekEntryResult!9440)

(assert (=> b!1003556 (= res!673158 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443610 (select (arr!30483 a!3219) j!170) a!3219 mask!3464) lt!443612))))

(declare-fun b!1003557 () Bool)

(declare-fun res!673161 () Bool)

(assert (=> b!1003557 (=> (not res!673161) (not e!565189))))

(declare-datatypes ((List!21225 0))(
  ( (Nil!21222) (Cons!21221 (h!22398 (_ BitVec 64)) (t!30217 List!21225)) )
))
(declare-fun arrayNoDuplicates!0 (array!63316 (_ BitVec 32) List!21225) Bool)

(assert (=> b!1003557 (= res!673161 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21222))))

(declare-fun b!1003558 () Bool)

(declare-fun res!673170 () Bool)

(assert (=> b!1003558 (=> (not res!673170) (not e!565190))))

(assert (=> b!1003558 (= res!673170 (and (= (size!30987 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30987 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30987 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1003559 () Bool)

(declare-fun e!565185 () Bool)

(assert (=> b!1003559 (= e!565189 e!565185)))

(declare-fun res!673164 () Bool)

(assert (=> b!1003559 (=> (not res!673164) (not e!565185))))

(declare-fun lt!443613 () SeekEntryResult!9440)

(assert (=> b!1003559 (= res!673164 (= lt!443613 lt!443612))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1003559 (= lt!443612 (Intermediate!9440 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003559 (= lt!443613 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30483 a!3219) j!170) mask!3464) (select (arr!30483 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003560 () Bool)

(declare-fun e!565184 () Bool)

(declare-fun e!565188 () Bool)

(assert (=> b!1003560 (= e!565184 e!565188)))

(declare-fun res!673171 () Bool)

(assert (=> b!1003560 (=> (not res!673171) (not e!565188))))

(declare-fun lt!443615 () (_ BitVec 64))

(declare-fun lt!443611 () array!63316)

(assert (=> b!1003560 (= res!673171 (not (= lt!443613 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443615 mask!3464) lt!443615 lt!443611 mask!3464))))))

(assert (=> b!1003560 (= lt!443615 (select (store (arr!30483 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1003560 (= lt!443611 (array!63317 (store (arr!30483 a!3219) i!1194 k0!2224) (size!30987 a!3219)))))

(declare-fun b!1003561 () Bool)

(declare-fun res!673169 () Bool)

(assert (=> b!1003561 (=> (not res!673169) (not e!565188))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!443616 () SeekEntryResult!9440)

(assert (=> b!1003561 (= res!673169 (not (= lt!443616 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443615 lt!443611 mask!3464))))))

(declare-fun b!1003562 () Bool)

(declare-fun res!673168 () Bool)

(assert (=> b!1003562 (=> (not res!673168) (not e!565190))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1003562 (= res!673168 (validKeyInArray!0 (select (arr!30483 a!3219) j!170)))))

(declare-fun b!1003563 () Bool)

(declare-fun res!673166 () Bool)

(assert (=> b!1003563 (=> (not res!673166) (not e!565189))))

(assert (=> b!1003563 (= res!673166 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30987 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30987 a!3219))))))

(declare-fun b!1003564 () Bool)

(declare-fun res!673165 () Bool)

(assert (=> b!1003564 (=> (not res!673165) (not e!565189))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63316 (_ BitVec 32)) Bool)

(assert (=> b!1003564 (= res!673165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1003565 () Bool)

(assert (=> b!1003565 (= e!565188 e!565186)))

(declare-fun res!673159 () Bool)

(assert (=> b!1003565 (=> (not res!673159) (not e!565186))))

(assert (=> b!1003565 (= res!673159 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443610 #b00000000000000000000000000000000) (bvslt lt!443610 (size!30987 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003565 (= lt!443610 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1003566 () Bool)

(assert (=> b!1003566 (= e!565185 e!565184)))

(declare-fun res!673162 () Bool)

(assert (=> b!1003566 (=> (not res!673162) (not e!565184))))

(assert (=> b!1003566 (= res!673162 (= lt!443616 lt!443612))))

(assert (=> b!1003566 (= lt!443616 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30483 a!3219) j!170) a!3219 mask!3464))))

(declare-fun res!673167 () Bool)

(assert (=> start!86568 (=> (not res!673167) (not e!565190))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86568 (= res!673167 (validMask!0 mask!3464))))

(assert (=> start!86568 e!565190))

(declare-fun array_inv!23626 (array!63316) Bool)

(assert (=> start!86568 (array_inv!23626 a!3219)))

(assert (=> start!86568 true))

(declare-fun b!1003567 () Bool)

(declare-fun res!673157 () Bool)

(assert (=> b!1003567 (=> (not res!673157) (not e!565190))))

(assert (=> b!1003567 (= res!673157 (validKeyInArray!0 k0!2224))))

(declare-fun b!1003568 () Bool)

(assert (=> b!1003568 (= e!565186 false)))

(declare-fun lt!443617 () SeekEntryResult!9440)

(assert (=> b!1003568 (= lt!443617 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443610 lt!443615 lt!443611 mask!3464))))

(declare-fun b!1003569 () Bool)

(declare-fun res!673160 () Bool)

(assert (=> b!1003569 (=> (not res!673160) (not e!565190))))

(declare-fun arrayContainsKey!0 (array!63316 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1003569 (= res!673160 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1003570 () Bool)

(declare-fun res!673172 () Bool)

(assert (=> b!1003570 (=> (not res!673172) (not e!565188))))

(assert (=> b!1003570 (= res!673172 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(assert (= (and start!86568 res!673167) b!1003558))

(assert (= (and b!1003558 res!673170) b!1003562))

(assert (= (and b!1003562 res!673168) b!1003567))

(assert (= (and b!1003567 res!673157) b!1003569))

(assert (= (and b!1003569 res!673160) b!1003555))

(assert (= (and b!1003555 res!673163) b!1003564))

(assert (= (and b!1003564 res!673165) b!1003557))

(assert (= (and b!1003557 res!673161) b!1003563))

(assert (= (and b!1003563 res!673166) b!1003559))

(assert (= (and b!1003559 res!673164) b!1003566))

(assert (= (and b!1003566 res!673162) b!1003560))

(assert (= (and b!1003560 res!673171) b!1003561))

(assert (= (and b!1003561 res!673169) b!1003570))

(assert (= (and b!1003570 res!673172) b!1003565))

(assert (= (and b!1003565 res!673159) b!1003556))

(assert (= (and b!1003556 res!673158) b!1003568))

(declare-fun m!928699 () Bool)

(assert (=> b!1003567 m!928699))

(declare-fun m!928701 () Bool)

(assert (=> b!1003561 m!928701))

(declare-fun m!928703 () Bool)

(assert (=> b!1003564 m!928703))

(declare-fun m!928705 () Bool)

(assert (=> start!86568 m!928705))

(declare-fun m!928707 () Bool)

(assert (=> start!86568 m!928707))

(declare-fun m!928709 () Bool)

(assert (=> b!1003560 m!928709))

(assert (=> b!1003560 m!928709))

(declare-fun m!928711 () Bool)

(assert (=> b!1003560 m!928711))

(declare-fun m!928713 () Bool)

(assert (=> b!1003560 m!928713))

(declare-fun m!928715 () Bool)

(assert (=> b!1003560 m!928715))

(declare-fun m!928717 () Bool)

(assert (=> b!1003569 m!928717))

(declare-fun m!928719 () Bool)

(assert (=> b!1003557 m!928719))

(declare-fun m!928721 () Bool)

(assert (=> b!1003556 m!928721))

(assert (=> b!1003556 m!928721))

(declare-fun m!928723 () Bool)

(assert (=> b!1003556 m!928723))

(declare-fun m!928725 () Bool)

(assert (=> b!1003565 m!928725))

(assert (=> b!1003566 m!928721))

(assert (=> b!1003566 m!928721))

(declare-fun m!928727 () Bool)

(assert (=> b!1003566 m!928727))

(assert (=> b!1003562 m!928721))

(assert (=> b!1003562 m!928721))

(declare-fun m!928729 () Bool)

(assert (=> b!1003562 m!928729))

(declare-fun m!928731 () Bool)

(assert (=> b!1003568 m!928731))

(declare-fun m!928733 () Bool)

(assert (=> b!1003555 m!928733))

(assert (=> b!1003559 m!928721))

(assert (=> b!1003559 m!928721))

(declare-fun m!928735 () Bool)

(assert (=> b!1003559 m!928735))

(assert (=> b!1003559 m!928735))

(assert (=> b!1003559 m!928721))

(declare-fun m!928737 () Bool)

(assert (=> b!1003559 m!928737))

(check-sat (not b!1003559) (not b!1003562) (not b!1003566) (not b!1003564) (not b!1003569) (not b!1003565) (not b!1003560) (not b!1003556) (not b!1003567) (not b!1003555) (not b!1003557) (not b!1003561) (not start!86568) (not b!1003568))
(check-sat)
