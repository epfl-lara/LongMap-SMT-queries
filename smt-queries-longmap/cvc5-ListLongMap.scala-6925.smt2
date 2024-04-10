; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87042 () Bool)

(assert start!87042)

(declare-fun b!1009552 () Bool)

(declare-fun e!567991 () Bool)

(declare-fun e!567987 () Bool)

(assert (=> b!1009552 (= e!567991 e!567987)))

(declare-fun res!678142 () Bool)

(assert (=> b!1009552 (=> (not res!678142) (not e!567987))))

(declare-datatypes ((SeekEntryResult!9560 0))(
  ( (MissingZero!9560 (index!40611 (_ BitVec 32))) (Found!9560 (index!40612 (_ BitVec 32))) (Intermediate!9560 (undefined!10372 Bool) (index!40613 (_ BitVec 32)) (x!88011 (_ BitVec 32))) (Undefined!9560) (MissingVacant!9560 (index!40614 (_ BitVec 32))) )
))
(declare-fun lt!446199 () SeekEntryResult!9560)

(declare-fun lt!446201 () SeekEntryResult!9560)

(assert (=> b!1009552 (= res!678142 (= lt!446199 lt!446201))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1009552 (= lt!446201 (Intermediate!9560 false resIndex!38 resX!38))))

(declare-datatypes ((array!63617 0))(
  ( (array!63618 (arr!30628 (Array (_ BitVec 32) (_ BitVec 64))) (size!31130 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63617)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63617 (_ BitVec 32)) SeekEntryResult!9560)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1009552 (= lt!446199 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30628 a!3219) j!170) mask!3464) (select (arr!30628 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009553 () Bool)

(declare-fun res!678145 () Bool)

(declare-fun e!567990 () Bool)

(assert (=> b!1009553 (=> (not res!678145) (not e!567990))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1009553 (= res!678145 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1009554 () Bool)

(declare-fun res!678150 () Bool)

(declare-fun e!567989 () Bool)

(assert (=> b!1009554 (=> (not res!678150) (not e!567989))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1009554 (= res!678150 (validKeyInArray!0 (select (arr!30628 a!3219) j!170)))))

(declare-fun b!1009555 () Bool)

(declare-fun res!678148 () Bool)

(assert (=> b!1009555 (=> (not res!678148) (not e!567991))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63617 (_ BitVec 32)) Bool)

(assert (=> b!1009555 (= res!678148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1009556 () Bool)

(declare-fun res!678146 () Bool)

(assert (=> b!1009556 (=> (not res!678146) (not e!567991))))

(declare-datatypes ((List!21304 0))(
  ( (Nil!21301) (Cons!21300 (h!22489 (_ BitVec 64)) (t!30305 List!21304)) )
))
(declare-fun arrayNoDuplicates!0 (array!63617 (_ BitVec 32) List!21304) Bool)

(assert (=> b!1009556 (= res!678146 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21301))))

(declare-fun b!1009557 () Bool)

(declare-fun res!678140 () Bool)

(assert (=> b!1009557 (=> (not res!678140) (not e!567989))))

(assert (=> b!1009557 (= res!678140 (and (= (size!31130 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31130 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31130 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!678141 () Bool)

(assert (=> start!87042 (=> (not res!678141) (not e!567989))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87042 (= res!678141 (validMask!0 mask!3464))))

(assert (=> start!87042 e!567989))

(declare-fun array_inv!23752 (array!63617) Bool)

(assert (=> start!87042 (array_inv!23752 a!3219)))

(assert (=> start!87042 true))

(declare-fun b!1009558 () Bool)

(declare-fun res!678143 () Bool)

(assert (=> b!1009558 (=> (not res!678143) (not e!567990))))

(declare-fun lt!446202 () SeekEntryResult!9560)

(declare-fun lt!446196 () array!63617)

(declare-fun lt!446200 () (_ BitVec 64))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1009558 (= res!678143 (not (= lt!446202 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446200 lt!446196 mask!3464))))))

(declare-fun b!1009559 () Bool)

(declare-fun res!678147 () Bool)

(assert (=> b!1009559 (=> (not res!678147) (not e!567989))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63617 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1009559 (= res!678147 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1009560 () Bool)

(assert (=> b!1009560 (= e!567989 e!567991)))

(declare-fun res!678153 () Bool)

(assert (=> b!1009560 (=> (not res!678153) (not e!567991))))

(declare-fun lt!446197 () SeekEntryResult!9560)

(assert (=> b!1009560 (= res!678153 (or (= lt!446197 (MissingVacant!9560 i!1194)) (= lt!446197 (MissingZero!9560 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63617 (_ BitVec 32)) SeekEntryResult!9560)

(assert (=> b!1009560 (= lt!446197 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1009561 () Bool)

(declare-fun e!567986 () Bool)

(assert (=> b!1009561 (= e!567987 e!567986)))

(declare-fun res!678149 () Bool)

(assert (=> b!1009561 (=> (not res!678149) (not e!567986))))

(assert (=> b!1009561 (= res!678149 (= lt!446202 lt!446201))))

(assert (=> b!1009561 (= lt!446202 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30628 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009562 () Bool)

(assert (=> b!1009562 (= e!567986 e!567990)))

(declare-fun res!678144 () Bool)

(assert (=> b!1009562 (=> (not res!678144) (not e!567990))))

(assert (=> b!1009562 (= res!678144 (not (= lt!446199 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446200 mask!3464) lt!446200 lt!446196 mask!3464))))))

(assert (=> b!1009562 (= lt!446200 (select (store (arr!30628 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1009562 (= lt!446196 (array!63618 (store (arr!30628 a!3219) i!1194 k!2224) (size!31130 a!3219)))))

(declare-fun b!1009563 () Bool)

(declare-fun res!678152 () Bool)

(assert (=> b!1009563 (=> (not res!678152) (not e!567991))))

(assert (=> b!1009563 (= res!678152 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31130 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31130 a!3219))))))

(declare-fun b!1009564 () Bool)

(declare-fun res!678151 () Bool)

(assert (=> b!1009564 (=> (not res!678151) (not e!567989))))

(assert (=> b!1009564 (= res!678151 (validKeyInArray!0 k!2224))))

(declare-fun b!1009565 () Bool)

(assert (=> b!1009565 (= e!567990 false)))

(declare-fun lt!446198 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1009565 (= lt!446198 (nextIndex!0 index!1507 x!1245 mask!3464))))

(assert (= (and start!87042 res!678141) b!1009557))

(assert (= (and b!1009557 res!678140) b!1009554))

(assert (= (and b!1009554 res!678150) b!1009564))

(assert (= (and b!1009564 res!678151) b!1009559))

(assert (= (and b!1009559 res!678147) b!1009560))

(assert (= (and b!1009560 res!678153) b!1009555))

(assert (= (and b!1009555 res!678148) b!1009556))

(assert (= (and b!1009556 res!678146) b!1009563))

(assert (= (and b!1009563 res!678152) b!1009552))

(assert (= (and b!1009552 res!678142) b!1009561))

(assert (= (and b!1009561 res!678149) b!1009562))

(assert (= (and b!1009562 res!678144) b!1009558))

(assert (= (and b!1009558 res!678143) b!1009553))

(assert (= (and b!1009553 res!678145) b!1009565))

(declare-fun m!934089 () Bool)

(assert (=> b!1009562 m!934089))

(assert (=> b!1009562 m!934089))

(declare-fun m!934091 () Bool)

(assert (=> b!1009562 m!934091))

(declare-fun m!934093 () Bool)

(assert (=> b!1009562 m!934093))

(declare-fun m!934095 () Bool)

(assert (=> b!1009562 m!934095))

(declare-fun m!934097 () Bool)

(assert (=> b!1009555 m!934097))

(declare-fun m!934099 () Bool)

(assert (=> b!1009558 m!934099))

(declare-fun m!934101 () Bool)

(assert (=> b!1009565 m!934101))

(declare-fun m!934103 () Bool)

(assert (=> b!1009560 m!934103))

(declare-fun m!934105 () Bool)

(assert (=> b!1009564 m!934105))

(declare-fun m!934107 () Bool)

(assert (=> start!87042 m!934107))

(declare-fun m!934109 () Bool)

(assert (=> start!87042 m!934109))

(declare-fun m!934111 () Bool)

(assert (=> b!1009561 m!934111))

(assert (=> b!1009561 m!934111))

(declare-fun m!934113 () Bool)

(assert (=> b!1009561 m!934113))

(assert (=> b!1009554 m!934111))

(assert (=> b!1009554 m!934111))

(declare-fun m!934115 () Bool)

(assert (=> b!1009554 m!934115))

(declare-fun m!934117 () Bool)

(assert (=> b!1009556 m!934117))

(declare-fun m!934119 () Bool)

(assert (=> b!1009559 m!934119))

(assert (=> b!1009552 m!934111))

(assert (=> b!1009552 m!934111))

(declare-fun m!934121 () Bool)

(assert (=> b!1009552 m!934121))

(assert (=> b!1009552 m!934121))

(assert (=> b!1009552 m!934111))

(declare-fun m!934123 () Bool)

(assert (=> b!1009552 m!934123))

(push 1)

