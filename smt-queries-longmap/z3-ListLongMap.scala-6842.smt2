; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86320 () Bool)

(assert start!86320)

(declare-fun b!998572 () Bool)

(declare-fun res!667965 () Bool)

(declare-fun e!563286 () Bool)

(assert (=> b!998572 (=> (not res!667965) (not e!563286))))

(declare-datatypes ((array!63144 0))(
  ( (array!63145 (arr!30397 (Array (_ BitVec 32) (_ BitVec 64))) (size!30900 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63144)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!998572 (= res!667965 (validKeyInArray!0 (select (arr!30397 a!3219) j!170)))))

(declare-fun b!998573 () Bool)

(declare-fun res!667961 () Bool)

(declare-fun e!563285 () Bool)

(assert (=> b!998573 (=> (not res!667961) (not e!563285))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63144 (_ BitVec 32)) Bool)

(assert (=> b!998573 (= res!667961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!998574 () Bool)

(declare-fun res!667966 () Bool)

(assert (=> b!998574 (=> (not res!667966) (not e!563285))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!998574 (= res!667966 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30900 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30900 a!3219))))))

(declare-fun b!998575 () Bool)

(declare-fun res!667970 () Bool)

(assert (=> b!998575 (=> (not res!667970) (not e!563285))))

(declare-datatypes ((SeekEntryResult!9265 0))(
  ( (MissingZero!9265 (index!39431 (_ BitVec 32))) (Found!9265 (index!39432 (_ BitVec 32))) (Intermediate!9265 (undefined!10077 Bool) (index!39433 (_ BitVec 32)) (x!87017 (_ BitVec 32))) (Undefined!9265) (MissingVacant!9265 (index!39434 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63144 (_ BitVec 32)) SeekEntryResult!9265)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!998575 (= res!667970 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30397 a!3219) j!170) mask!3464) (select (arr!30397 a!3219) j!170) a!3219 mask!3464) (Intermediate!9265 false resIndex!38 resX!38)))))

(declare-fun res!667962 () Bool)

(assert (=> start!86320 (=> (not res!667962) (not e!563286))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86320 (= res!667962 (validMask!0 mask!3464))))

(assert (=> start!86320 e!563286))

(declare-fun array_inv!23533 (array!63144) Bool)

(assert (=> start!86320 (array_inv!23533 a!3219)))

(assert (=> start!86320 true))

(declare-fun b!998576 () Bool)

(declare-fun res!667969 () Bool)

(assert (=> b!998576 (=> (not res!667969) (not e!563286))))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!998576 (= res!667969 (validKeyInArray!0 k0!2224))))

(declare-fun b!998577 () Bool)

(declare-fun res!667967 () Bool)

(assert (=> b!998577 (=> (not res!667967) (not e!563285))))

(declare-datatypes ((List!21044 0))(
  ( (Nil!21041) (Cons!21040 (h!22214 (_ BitVec 64)) (t!30037 List!21044)) )
))
(declare-fun arrayNoDuplicates!0 (array!63144 (_ BitVec 32) List!21044) Bool)

(assert (=> b!998577 (= res!667967 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21041))))

(declare-fun b!998578 () Bool)

(assert (=> b!998578 (= e!563285 false)))

(declare-fun lt!441860 () SeekEntryResult!9265)

(assert (=> b!998578 (= lt!441860 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30397 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!998579 () Bool)

(declare-fun res!667963 () Bool)

(assert (=> b!998579 (=> (not res!667963) (not e!563286))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!998579 (= res!667963 (and (= (size!30900 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30900 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30900 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!998580 () Bool)

(declare-fun res!667964 () Bool)

(assert (=> b!998580 (=> (not res!667964) (not e!563286))))

(declare-fun arrayContainsKey!0 (array!63144 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!998580 (= res!667964 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!998581 () Bool)

(assert (=> b!998581 (= e!563286 e!563285)))

(declare-fun res!667968 () Bool)

(assert (=> b!998581 (=> (not res!667968) (not e!563285))))

(declare-fun lt!441859 () SeekEntryResult!9265)

(assert (=> b!998581 (= res!667968 (or (= lt!441859 (MissingVacant!9265 i!1194)) (= lt!441859 (MissingZero!9265 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63144 (_ BitVec 32)) SeekEntryResult!9265)

(assert (=> b!998581 (= lt!441859 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(assert (= (and start!86320 res!667962) b!998579))

(assert (= (and b!998579 res!667963) b!998572))

(assert (= (and b!998572 res!667965) b!998576))

(assert (= (and b!998576 res!667969) b!998580))

(assert (= (and b!998580 res!667964) b!998581))

(assert (= (and b!998581 res!667968) b!998573))

(assert (= (and b!998573 res!667961) b!998577))

(assert (= (and b!998577 res!667967) b!998574))

(assert (= (and b!998574 res!667966) b!998575))

(assert (= (and b!998575 res!667970) b!998578))

(declare-fun m!925751 () Bool)

(assert (=> b!998581 m!925751))

(declare-fun m!925753 () Bool)

(assert (=> b!998580 m!925753))

(declare-fun m!925755 () Bool)

(assert (=> b!998578 m!925755))

(assert (=> b!998578 m!925755))

(declare-fun m!925757 () Bool)

(assert (=> b!998578 m!925757))

(assert (=> b!998572 m!925755))

(assert (=> b!998572 m!925755))

(declare-fun m!925759 () Bool)

(assert (=> b!998572 m!925759))

(declare-fun m!925761 () Bool)

(assert (=> b!998576 m!925761))

(assert (=> b!998575 m!925755))

(assert (=> b!998575 m!925755))

(declare-fun m!925763 () Bool)

(assert (=> b!998575 m!925763))

(assert (=> b!998575 m!925763))

(assert (=> b!998575 m!925755))

(declare-fun m!925765 () Bool)

(assert (=> b!998575 m!925765))

(declare-fun m!925767 () Bool)

(assert (=> start!86320 m!925767))

(declare-fun m!925769 () Bool)

(assert (=> start!86320 m!925769))

(declare-fun m!925771 () Bool)

(assert (=> b!998573 m!925771))

(declare-fun m!925773 () Bool)

(assert (=> b!998577 m!925773))

(check-sat (not b!998580) (not b!998575) (not b!998576) (not b!998577) (not b!998578) (not start!86320) (not b!998581) (not b!998572) (not b!998573))
(check-sat)
