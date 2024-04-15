; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86490 () Bool)

(assert start!86490)

(declare-fun b!1001683 () Bool)

(declare-fun res!671285 () Bool)

(declare-fun e!564365 () Bool)

(assert (=> b!1001683 (=> (not res!671285) (not e!564365))))

(declare-datatypes ((array!63238 0))(
  ( (array!63239 (arr!30444 (Array (_ BitVec 32) (_ BitVec 64))) (size!30948 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63238)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1001683 (= res!671285 (and (= (size!30948 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30948 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30948 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!671296 () Bool)

(assert (=> start!86490 (=> (not res!671296) (not e!564365))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86490 (= res!671296 (validMask!0 mask!3464))))

(assert (=> start!86490 e!564365))

(declare-fun array_inv!23587 (array!63238) Bool)

(assert (=> start!86490 (array_inv!23587 a!3219)))

(assert (=> start!86490 true))

(declare-fun b!1001684 () Bool)

(declare-fun res!671298 () Bool)

(declare-fun e!564366 () Bool)

(assert (=> b!1001684 (=> (not res!671298) (not e!564366))))

(declare-datatypes ((List!21186 0))(
  ( (Nil!21183) (Cons!21182 (h!22359 (_ BitVec 64)) (t!30178 List!21186)) )
))
(declare-fun arrayNoDuplicates!0 (array!63238 (_ BitVec 32) List!21186) Bool)

(assert (=> b!1001684 (= res!671298 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21183))))

(declare-fun b!1001685 () Bool)

(declare-fun res!671299 () Bool)

(declare-fun e!564368 () Bool)

(assert (=> b!1001685 (=> (not res!671299) (not e!564368))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1001685 (= res!671299 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1001686 () Bool)

(declare-fun e!564371 () Bool)

(assert (=> b!1001686 (= e!564366 e!564371)))

(declare-fun res!671292 () Bool)

(assert (=> b!1001686 (=> (not res!671292) (not e!564371))))

(declare-datatypes ((SeekEntryResult!9401 0))(
  ( (MissingZero!9401 (index!39975 (_ BitVec 32))) (Found!9401 (index!39976 (_ BitVec 32))) (Intermediate!9401 (undefined!10213 Bool) (index!39977 (_ BitVec 32)) (x!87408 (_ BitVec 32))) (Undefined!9401) (MissingVacant!9401 (index!39978 (_ BitVec 32))) )
))
(declare-fun lt!442681 () SeekEntryResult!9401)

(declare-fun lt!442678 () SeekEntryResult!9401)

(assert (=> b!1001686 (= res!671292 (= lt!442681 lt!442678))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1001686 (= lt!442678 (Intermediate!9401 false resIndex!38 resX!38))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63238 (_ BitVec 32)) SeekEntryResult!9401)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001686 (= lt!442681 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30444 a!3219) j!170) mask!3464) (select (arr!30444 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001687 () Bool)

(declare-fun res!671294 () Bool)

(assert (=> b!1001687 (=> (not res!671294) (not e!564365))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1001687 (= res!671294 (validKeyInArray!0 (select (arr!30444 a!3219) j!170)))))

(declare-fun b!1001688 () Bool)

(declare-fun res!671291 () Bool)

(declare-fun e!564369 () Bool)

(assert (=> b!1001688 (=> (not res!671291) (not e!564369))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun lt!442675 () (_ BitVec 32))

(assert (=> b!1001688 (= res!671291 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442675 (select (arr!30444 a!3219) j!170) a!3219 mask!3464) lt!442678))))

(declare-fun b!1001689 () Bool)

(assert (=> b!1001689 (= e!564369 false)))

(declare-fun lt!442677 () SeekEntryResult!9401)

(declare-fun lt!442680 () (_ BitVec 64))

(declare-fun lt!442679 () array!63238)

(assert (=> b!1001689 (= lt!442677 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442675 lt!442680 lt!442679 mask!3464))))

(declare-fun b!1001690 () Bool)

(declare-fun e!564370 () Bool)

(assert (=> b!1001690 (= e!564371 e!564370)))

(declare-fun res!671290 () Bool)

(assert (=> b!1001690 (=> (not res!671290) (not e!564370))))

(declare-fun lt!442674 () SeekEntryResult!9401)

(assert (=> b!1001690 (= res!671290 (= lt!442674 lt!442678))))

(assert (=> b!1001690 (= lt!442674 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30444 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001691 () Bool)

(assert (=> b!1001691 (= e!564365 e!564366)))

(declare-fun res!671289 () Bool)

(assert (=> b!1001691 (=> (not res!671289) (not e!564366))))

(declare-fun lt!442676 () SeekEntryResult!9401)

(assert (=> b!1001691 (= res!671289 (or (= lt!442676 (MissingVacant!9401 i!1194)) (= lt!442676 (MissingZero!9401 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63238 (_ BitVec 32)) SeekEntryResult!9401)

(assert (=> b!1001691 (= lt!442676 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1001692 () Bool)

(declare-fun res!671295 () Bool)

(assert (=> b!1001692 (=> (not res!671295) (not e!564368))))

(assert (=> b!1001692 (= res!671295 (not (= lt!442674 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442680 lt!442679 mask!3464))))))

(declare-fun b!1001693 () Bool)

(declare-fun res!671288 () Bool)

(assert (=> b!1001693 (=> (not res!671288) (not e!564366))))

(assert (=> b!1001693 (= res!671288 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30948 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30948 a!3219))))))

(declare-fun b!1001694 () Bool)

(assert (=> b!1001694 (= e!564370 e!564368)))

(declare-fun res!671300 () Bool)

(assert (=> b!1001694 (=> (not res!671300) (not e!564368))))

(assert (=> b!1001694 (= res!671300 (not (= lt!442681 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442680 mask!3464) lt!442680 lt!442679 mask!3464))))))

(assert (=> b!1001694 (= lt!442680 (select (store (arr!30444 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1001694 (= lt!442679 (array!63239 (store (arr!30444 a!3219) i!1194 k0!2224) (size!30948 a!3219)))))

(declare-fun b!1001695 () Bool)

(declare-fun res!671287 () Bool)

(assert (=> b!1001695 (=> (not res!671287) (not e!564365))))

(declare-fun arrayContainsKey!0 (array!63238 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1001695 (= res!671287 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1001696 () Bool)

(declare-fun res!671293 () Bool)

(assert (=> b!1001696 (=> (not res!671293) (not e!564366))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63238 (_ BitVec 32)) Bool)

(assert (=> b!1001696 (= res!671293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1001697 () Bool)

(assert (=> b!1001697 (= e!564368 e!564369)))

(declare-fun res!671297 () Bool)

(assert (=> b!1001697 (=> (not res!671297) (not e!564369))))

(assert (=> b!1001697 (= res!671297 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!442675 #b00000000000000000000000000000000) (bvslt lt!442675 (size!30948 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001697 (= lt!442675 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1001698 () Bool)

(declare-fun res!671286 () Bool)

(assert (=> b!1001698 (=> (not res!671286) (not e!564365))))

(assert (=> b!1001698 (= res!671286 (validKeyInArray!0 k0!2224))))

(assert (= (and start!86490 res!671296) b!1001683))

(assert (= (and b!1001683 res!671285) b!1001687))

(assert (= (and b!1001687 res!671294) b!1001698))

(assert (= (and b!1001698 res!671286) b!1001695))

(assert (= (and b!1001695 res!671287) b!1001691))

(assert (= (and b!1001691 res!671289) b!1001696))

(assert (= (and b!1001696 res!671293) b!1001684))

(assert (= (and b!1001684 res!671298) b!1001693))

(assert (= (and b!1001693 res!671288) b!1001686))

(assert (= (and b!1001686 res!671292) b!1001690))

(assert (= (and b!1001690 res!671290) b!1001694))

(assert (= (and b!1001694 res!671300) b!1001692))

(assert (= (and b!1001692 res!671295) b!1001685))

(assert (= (and b!1001685 res!671299) b!1001697))

(assert (= (and b!1001697 res!671297) b!1001688))

(assert (= (and b!1001688 res!671291) b!1001689))

(declare-fun m!927139 () Bool)

(assert (=> b!1001694 m!927139))

(assert (=> b!1001694 m!927139))

(declare-fun m!927141 () Bool)

(assert (=> b!1001694 m!927141))

(declare-fun m!927143 () Bool)

(assert (=> b!1001694 m!927143))

(declare-fun m!927145 () Bool)

(assert (=> b!1001694 m!927145))

(declare-fun m!927147 () Bool)

(assert (=> b!1001695 m!927147))

(declare-fun m!927149 () Bool)

(assert (=> b!1001688 m!927149))

(assert (=> b!1001688 m!927149))

(declare-fun m!927151 () Bool)

(assert (=> b!1001688 m!927151))

(declare-fun m!927153 () Bool)

(assert (=> b!1001698 m!927153))

(declare-fun m!927155 () Bool)

(assert (=> start!86490 m!927155))

(declare-fun m!927157 () Bool)

(assert (=> start!86490 m!927157))

(assert (=> b!1001686 m!927149))

(assert (=> b!1001686 m!927149))

(declare-fun m!927159 () Bool)

(assert (=> b!1001686 m!927159))

(assert (=> b!1001686 m!927159))

(assert (=> b!1001686 m!927149))

(declare-fun m!927161 () Bool)

(assert (=> b!1001686 m!927161))

(declare-fun m!927163 () Bool)

(assert (=> b!1001691 m!927163))

(declare-fun m!927165 () Bool)

(assert (=> b!1001684 m!927165))

(assert (=> b!1001690 m!927149))

(assert (=> b!1001690 m!927149))

(declare-fun m!927167 () Bool)

(assert (=> b!1001690 m!927167))

(declare-fun m!927169 () Bool)

(assert (=> b!1001696 m!927169))

(declare-fun m!927171 () Bool)

(assert (=> b!1001692 m!927171))

(declare-fun m!927173 () Bool)

(assert (=> b!1001697 m!927173))

(assert (=> b!1001687 m!927149))

(assert (=> b!1001687 m!927149))

(declare-fun m!927175 () Bool)

(assert (=> b!1001687 m!927175))

(declare-fun m!927177 () Bool)

(assert (=> b!1001689 m!927177))

(check-sat (not b!1001688) (not b!1001697) (not b!1001694) (not start!86490) (not b!1001690) (not b!1001691) (not b!1001698) (not b!1001686) (not b!1001696) (not b!1001692) (not b!1001689) (not b!1001684) (not b!1001695) (not b!1001687))
(check-sat)
