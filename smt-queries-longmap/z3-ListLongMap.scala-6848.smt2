; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86290 () Bool)

(assert start!86290)

(declare-fun b!998765 () Bool)

(declare-fun res!668406 () Bool)

(declare-fun e!563218 () Bool)

(assert (=> b!998765 (=> (not res!668406) (not e!563218))))

(declare-datatypes ((array!63142 0))(
  ( (array!63143 (arr!30398 (Array (_ BitVec 32) (_ BitVec 64))) (size!30900 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63142)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!998765 (= res!668406 (validKeyInArray!0 (select (arr!30398 a!3219) j!170)))))

(declare-fun b!998766 () Bool)

(declare-fun e!563221 () Bool)

(declare-fun e!563220 () Bool)

(assert (=> b!998766 (= e!563221 e!563220)))

(declare-fun res!668411 () Bool)

(assert (=> b!998766 (=> (not res!668411) (not e!563220))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9330 0))(
  ( (MissingZero!9330 (index!39691 (_ BitVec 32))) (Found!9330 (index!39692 (_ BitVec 32))) (Intermediate!9330 (undefined!10142 Bool) (index!39693 (_ BitVec 32)) (x!87128 (_ BitVec 32))) (Undefined!9330) (MissingVacant!9330 (index!39694 (_ BitVec 32))) )
))
(declare-fun lt!441814 () SeekEntryResult!9330)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63142 (_ BitVec 32)) SeekEntryResult!9330)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!998766 (= res!668411 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30398 a!3219) j!170) mask!3464) (select (arr!30398 a!3219) j!170) a!3219 mask!3464) lt!441814))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!998766 (= lt!441814 (Intermediate!9330 false resIndex!38 resX!38))))

(declare-fun b!998767 () Bool)

(declare-fun res!668408 () Bool)

(assert (=> b!998767 (=> (not res!668408) (not e!563221))))

(declare-datatypes ((List!21074 0))(
  ( (Nil!21071) (Cons!21070 (h!22244 (_ BitVec 64)) (t!30075 List!21074)) )
))
(declare-fun arrayNoDuplicates!0 (array!63142 (_ BitVec 32) List!21074) Bool)

(assert (=> b!998767 (= res!668408 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21071))))

(declare-fun b!998768 () Bool)

(declare-fun res!668402 () Bool)

(assert (=> b!998768 (=> (not res!668402) (not e!563221))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!998768 (= res!668402 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30900 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30900 a!3219))))))

(declare-fun b!998769 () Bool)

(declare-fun res!668403 () Bool)

(assert (=> b!998769 (=> (not res!668403) (not e!563218))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63142 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!998769 (= res!668403 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!998770 () Bool)

(declare-fun res!668407 () Bool)

(assert (=> b!998770 (=> (not res!668407) (not e!563218))))

(assert (=> b!998770 (= res!668407 (validKeyInArray!0 k0!2224))))

(declare-fun b!998771 () Bool)

(declare-fun res!668409 () Bool)

(assert (=> b!998771 (=> (not res!668409) (not e!563221))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63142 (_ BitVec 32)) Bool)

(assert (=> b!998771 (= res!668409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!998772 () Bool)

(declare-fun res!668412 () Bool)

(assert (=> b!998772 (=> (not res!668412) (not e!563220))))

(assert (=> b!998772 (= res!668412 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30398 a!3219) j!170) a!3219 mask!3464) lt!441814))))

(declare-fun b!998774 () Bool)

(declare-fun res!668404 () Bool)

(assert (=> b!998774 (=> (not res!668404) (not e!563218))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!998774 (= res!668404 (and (= (size!30900 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30900 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30900 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!998775 () Bool)

(assert (=> b!998775 (= e!563220 false)))

(declare-fun lt!441815 () (_ BitVec 32))

(assert (=> b!998775 (= lt!441815 (toIndex!0 (select (store (arr!30398 a!3219) i!1194 k0!2224) j!170) mask!3464))))

(declare-fun b!998773 () Bool)

(assert (=> b!998773 (= e!563218 e!563221)))

(declare-fun res!668405 () Bool)

(assert (=> b!998773 (=> (not res!668405) (not e!563221))))

(declare-fun lt!441813 () SeekEntryResult!9330)

(assert (=> b!998773 (= res!668405 (or (= lt!441813 (MissingVacant!9330 i!1194)) (= lt!441813 (MissingZero!9330 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63142 (_ BitVec 32)) SeekEntryResult!9330)

(assert (=> b!998773 (= lt!441813 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun res!668410 () Bool)

(assert (=> start!86290 (=> (not res!668410) (not e!563218))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86290 (= res!668410 (validMask!0 mask!3464))))

(assert (=> start!86290 e!563218))

(declare-fun array_inv!23522 (array!63142) Bool)

(assert (=> start!86290 (array_inv!23522 a!3219)))

(assert (=> start!86290 true))

(assert (= (and start!86290 res!668410) b!998774))

(assert (= (and b!998774 res!668404) b!998765))

(assert (= (and b!998765 res!668406) b!998770))

(assert (= (and b!998770 res!668407) b!998769))

(assert (= (and b!998769 res!668403) b!998773))

(assert (= (and b!998773 res!668405) b!998771))

(assert (= (and b!998771 res!668409) b!998767))

(assert (= (and b!998767 res!668408) b!998768))

(assert (= (and b!998768 res!668402) b!998766))

(assert (= (and b!998766 res!668411) b!998772))

(assert (= (and b!998772 res!668412) b!998775))

(declare-fun m!925163 () Bool)

(assert (=> b!998770 m!925163))

(declare-fun m!925165 () Bool)

(assert (=> b!998765 m!925165))

(assert (=> b!998765 m!925165))

(declare-fun m!925167 () Bool)

(assert (=> b!998765 m!925167))

(assert (=> b!998772 m!925165))

(assert (=> b!998772 m!925165))

(declare-fun m!925169 () Bool)

(assert (=> b!998772 m!925169))

(declare-fun m!925171 () Bool)

(assert (=> b!998773 m!925171))

(declare-fun m!925173 () Bool)

(assert (=> b!998775 m!925173))

(declare-fun m!925175 () Bool)

(assert (=> b!998775 m!925175))

(assert (=> b!998775 m!925175))

(declare-fun m!925177 () Bool)

(assert (=> b!998775 m!925177))

(declare-fun m!925179 () Bool)

(assert (=> b!998771 m!925179))

(declare-fun m!925181 () Bool)

(assert (=> b!998769 m!925181))

(declare-fun m!925183 () Bool)

(assert (=> b!998767 m!925183))

(declare-fun m!925185 () Bool)

(assert (=> start!86290 m!925185))

(declare-fun m!925187 () Bool)

(assert (=> start!86290 m!925187))

(assert (=> b!998766 m!925165))

(assert (=> b!998766 m!925165))

(declare-fun m!925189 () Bool)

(assert (=> b!998766 m!925189))

(assert (=> b!998766 m!925189))

(assert (=> b!998766 m!925165))

(declare-fun m!925191 () Bool)

(assert (=> b!998766 m!925191))

(check-sat (not b!998771) (not b!998773) (not b!998772) (not b!998770) (not start!86290) (not b!998765) (not b!998775) (not b!998767) (not b!998769) (not b!998766))
(check-sat)
