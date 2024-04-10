; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86288 () Bool)

(assert start!86288)

(declare-fun b!998732 () Bool)

(declare-fun res!668374 () Bool)

(declare-fun e!563208 () Bool)

(assert (=> b!998732 (=> (not res!668374) (not e!563208))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!998732 (= res!668374 (validKeyInArray!0 k!2224))))

(declare-fun b!998733 () Bool)

(declare-fun res!668372 () Bool)

(declare-fun e!563207 () Bool)

(assert (=> b!998733 (=> (not res!668372) (not e!563207))))

(declare-datatypes ((array!63140 0))(
  ( (array!63141 (arr!30397 (Array (_ BitVec 32) (_ BitVec 64))) (size!30899 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63140)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63140 (_ BitVec 32)) Bool)

(assert (=> b!998733 (= res!668372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!998734 () Bool)

(declare-fun res!668377 () Bool)

(assert (=> b!998734 (=> (not res!668377) (not e!563208))))

(declare-fun arrayContainsKey!0 (array!63140 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!998734 (= res!668377 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!998735 () Bool)

(declare-fun res!668376 () Bool)

(assert (=> b!998735 (=> (not res!668376) (not e!563208))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!998735 (= res!668376 (and (= (size!30899 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30899 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30899 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!998736 () Bool)

(declare-fun res!668373 () Bool)

(assert (=> b!998736 (=> (not res!668373) (not e!563207))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!998736 (= res!668373 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30899 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30899 a!3219))))))

(declare-fun b!998737 () Bool)

(declare-fun e!563206 () Bool)

(assert (=> b!998737 (= e!563207 e!563206)))

(declare-fun res!668378 () Bool)

(assert (=> b!998737 (=> (not res!668378) (not e!563206))))

(declare-datatypes ((SeekEntryResult!9329 0))(
  ( (MissingZero!9329 (index!39687 (_ BitVec 32))) (Found!9329 (index!39688 (_ BitVec 32))) (Intermediate!9329 (undefined!10141 Bool) (index!39689 (_ BitVec 32)) (x!87127 (_ BitVec 32))) (Undefined!9329) (MissingVacant!9329 (index!39690 (_ BitVec 32))) )
))
(declare-fun lt!441804 () SeekEntryResult!9329)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63140 (_ BitVec 32)) SeekEntryResult!9329)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!998737 (= res!668378 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30397 a!3219) j!170) mask!3464) (select (arr!30397 a!3219) j!170) a!3219 mask!3464) lt!441804))))

(assert (=> b!998737 (= lt!441804 (Intermediate!9329 false resIndex!38 resX!38))))

(declare-fun b!998738 () Bool)

(declare-fun res!668375 () Bool)

(assert (=> b!998738 (=> (not res!668375) (not e!563206))))

(assert (=> b!998738 (= res!668375 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30397 a!3219) j!170) a!3219 mask!3464) lt!441804))))

(declare-fun b!998740 () Bool)

(assert (=> b!998740 (= e!563208 e!563207)))

(declare-fun res!668379 () Bool)

(assert (=> b!998740 (=> (not res!668379) (not e!563207))))

(declare-fun lt!441806 () SeekEntryResult!9329)

(assert (=> b!998740 (= res!668379 (or (= lt!441806 (MissingVacant!9329 i!1194)) (= lt!441806 (MissingZero!9329 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63140 (_ BitVec 32)) SeekEntryResult!9329)

(assert (=> b!998740 (= lt!441806 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!998741 () Bool)

(declare-fun res!668370 () Bool)

(assert (=> b!998741 (=> (not res!668370) (not e!563208))))

(assert (=> b!998741 (= res!668370 (validKeyInArray!0 (select (arr!30397 a!3219) j!170)))))

(declare-fun b!998742 () Bool)

(declare-fun res!668371 () Bool)

(assert (=> b!998742 (=> (not res!668371) (not e!563207))))

(declare-datatypes ((List!21073 0))(
  ( (Nil!21070) (Cons!21069 (h!22243 (_ BitVec 64)) (t!30074 List!21073)) )
))
(declare-fun arrayNoDuplicates!0 (array!63140 (_ BitVec 32) List!21073) Bool)

(assert (=> b!998742 (= res!668371 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21070))))

(declare-fun res!668369 () Bool)

(assert (=> start!86288 (=> (not res!668369) (not e!563208))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86288 (= res!668369 (validMask!0 mask!3464))))

(assert (=> start!86288 e!563208))

(declare-fun array_inv!23521 (array!63140) Bool)

(assert (=> start!86288 (array_inv!23521 a!3219)))

(assert (=> start!86288 true))

(declare-fun b!998739 () Bool)

(assert (=> b!998739 (= e!563206 false)))

(declare-fun lt!441805 () (_ BitVec 32))

(assert (=> b!998739 (= lt!441805 (toIndex!0 (select (store (arr!30397 a!3219) i!1194 k!2224) j!170) mask!3464))))

(assert (= (and start!86288 res!668369) b!998735))

(assert (= (and b!998735 res!668376) b!998741))

(assert (= (and b!998741 res!668370) b!998732))

(assert (= (and b!998732 res!668374) b!998734))

(assert (= (and b!998734 res!668377) b!998740))

(assert (= (and b!998740 res!668379) b!998733))

(assert (= (and b!998733 res!668372) b!998742))

(assert (= (and b!998742 res!668371) b!998736))

(assert (= (and b!998736 res!668373) b!998737))

(assert (= (and b!998737 res!668378) b!998738))

(assert (= (and b!998738 res!668375) b!998739))

(declare-fun m!925133 () Bool)

(assert (=> start!86288 m!925133))

(declare-fun m!925135 () Bool)

(assert (=> start!86288 m!925135))

(declare-fun m!925137 () Bool)

(assert (=> b!998741 m!925137))

(assert (=> b!998741 m!925137))

(declare-fun m!925139 () Bool)

(assert (=> b!998741 m!925139))

(assert (=> b!998738 m!925137))

(assert (=> b!998738 m!925137))

(declare-fun m!925141 () Bool)

(assert (=> b!998738 m!925141))

(assert (=> b!998737 m!925137))

(assert (=> b!998737 m!925137))

(declare-fun m!925143 () Bool)

(assert (=> b!998737 m!925143))

(assert (=> b!998737 m!925143))

(assert (=> b!998737 m!925137))

(declare-fun m!925145 () Bool)

(assert (=> b!998737 m!925145))

(declare-fun m!925147 () Bool)

(assert (=> b!998734 m!925147))

(declare-fun m!925149 () Bool)

(assert (=> b!998732 m!925149))

(declare-fun m!925151 () Bool)

(assert (=> b!998739 m!925151))

(declare-fun m!925153 () Bool)

(assert (=> b!998739 m!925153))

(assert (=> b!998739 m!925153))

(declare-fun m!925155 () Bool)

(assert (=> b!998739 m!925155))

(declare-fun m!925157 () Bool)

(assert (=> b!998742 m!925157))

(declare-fun m!925159 () Bool)

(assert (=> b!998740 m!925159))

(declare-fun m!925161 () Bool)

(assert (=> b!998733 m!925161))

(push 1)

