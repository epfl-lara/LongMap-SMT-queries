; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87034 () Bool)

(assert start!87034)

(declare-fun b!1007763 () Bool)

(declare-fun e!567328 () Bool)

(declare-fun e!567327 () Bool)

(assert (=> b!1007763 (= e!567328 e!567327)))

(declare-fun res!676099 () Bool)

(assert (=> b!1007763 (=> (not res!676099) (not e!567327))))

(declare-datatypes ((SeekEntryResult!9460 0))(
  ( (MissingZero!9460 (index!40211 (_ BitVec 32))) (Found!9460 (index!40212 (_ BitVec 32))) (Intermediate!9460 (undefined!10272 Bool) (index!40213 (_ BitVec 32)) (x!87768 (_ BitVec 32))) (Undefined!9460) (MissingVacant!9460 (index!40214 (_ BitVec 32))) )
))
(declare-fun lt!445289 () SeekEntryResult!9460)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1007763 (= res!676099 (or (= lt!445289 (MissingVacant!9460 i!1194)) (= lt!445289 (MissingZero!9460 i!1194))))))

(declare-datatypes ((array!63552 0))(
  ( (array!63553 (arr!30592 (Array (_ BitVec 32) (_ BitVec 64))) (size!31095 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63552)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63552 (_ BitVec 32)) SeekEntryResult!9460)

(assert (=> b!1007763 (= lt!445289 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1007764 () Bool)

(declare-fun res!676095 () Bool)

(assert (=> b!1007764 (=> (not res!676095) (not e!567328))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1007764 (= res!676095 (validKeyInArray!0 (select (arr!30592 a!3219) j!170)))))

(declare-fun b!1007765 () Bool)

(declare-fun res!676094 () Bool)

(assert (=> b!1007765 (=> (not res!676094) (not e!567327))))

(declare-datatypes ((List!21239 0))(
  ( (Nil!21236) (Cons!21235 (h!22427 (_ BitVec 64)) (t!30232 List!21239)) )
))
(declare-fun arrayNoDuplicates!0 (array!63552 (_ BitVec 32) List!21239) Bool)

(assert (=> b!1007765 (= res!676094 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21236))))

(declare-fun b!1007766 () Bool)

(declare-fun res!676100 () Bool)

(assert (=> b!1007766 (=> (not res!676100) (not e!567328))))

(declare-fun arrayContainsKey!0 (array!63552 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1007766 (= res!676100 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1007767 () Bool)

(declare-fun e!567330 () Bool)

(assert (=> b!1007767 (= e!567330 false)))

(declare-fun lt!445287 () SeekEntryResult!9460)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63552 (_ BitVec 32)) SeekEntryResult!9460)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007767 (= lt!445287 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30592 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30592 a!3219) i!1194 k0!2224) j!170) (array!63553 (store (arr!30592 a!3219) i!1194 k0!2224) (size!31095 a!3219)) mask!3464))))

(declare-fun b!1007768 () Bool)

(declare-fun res!676093 () Bool)

(assert (=> b!1007768 (=> (not res!676093) (not e!567330))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun lt!445288 () SeekEntryResult!9460)

(assert (=> b!1007768 (= res!676093 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30592 a!3219) j!170) a!3219 mask!3464) lt!445288))))

(declare-fun b!1007769 () Bool)

(declare-fun res!676098 () Bool)

(assert (=> b!1007769 (=> (not res!676098) (not e!567328))))

(assert (=> b!1007769 (= res!676098 (and (= (size!31095 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31095 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31095 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!676096 () Bool)

(assert (=> start!87034 (=> (not res!676096) (not e!567328))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87034 (= res!676096 (validMask!0 mask!3464))))

(assert (=> start!87034 e!567328))

(declare-fun array_inv!23728 (array!63552) Bool)

(assert (=> start!87034 (array_inv!23728 a!3219)))

(assert (=> start!87034 true))

(declare-fun b!1007770 () Bool)

(declare-fun res!676097 () Bool)

(assert (=> b!1007770 (=> (not res!676097) (not e!567328))))

(assert (=> b!1007770 (= res!676097 (validKeyInArray!0 k0!2224))))

(declare-fun b!1007771 () Bool)

(declare-fun res!676090 () Bool)

(assert (=> b!1007771 (=> (not res!676090) (not e!567327))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63552 (_ BitVec 32)) Bool)

(assert (=> b!1007771 (= res!676090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1007772 () Bool)

(declare-fun res!676091 () Bool)

(assert (=> b!1007772 (=> (not res!676091) (not e!567327))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1007772 (= res!676091 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31095 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31095 a!3219))))))

(declare-fun b!1007773 () Bool)

(assert (=> b!1007773 (= e!567327 e!567330)))

(declare-fun res!676092 () Bool)

(assert (=> b!1007773 (=> (not res!676092) (not e!567330))))

(assert (=> b!1007773 (= res!676092 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30592 a!3219) j!170) mask!3464) (select (arr!30592 a!3219) j!170) a!3219 mask!3464) lt!445288))))

(assert (=> b!1007773 (= lt!445288 (Intermediate!9460 false resIndex!38 resX!38))))

(assert (= (and start!87034 res!676096) b!1007769))

(assert (= (and b!1007769 res!676098) b!1007764))

(assert (= (and b!1007764 res!676095) b!1007770))

(assert (= (and b!1007770 res!676097) b!1007766))

(assert (= (and b!1007766 res!676100) b!1007763))

(assert (= (and b!1007763 res!676099) b!1007771))

(assert (= (and b!1007771 res!676090) b!1007765))

(assert (= (and b!1007765 res!676094) b!1007772))

(assert (= (and b!1007772 res!676091) b!1007773))

(assert (= (and b!1007773 res!676092) b!1007768))

(assert (= (and b!1007768 res!676093) b!1007767))

(declare-fun m!933137 () Bool)

(assert (=> b!1007773 m!933137))

(assert (=> b!1007773 m!933137))

(declare-fun m!933139 () Bool)

(assert (=> b!1007773 m!933139))

(assert (=> b!1007773 m!933139))

(assert (=> b!1007773 m!933137))

(declare-fun m!933141 () Bool)

(assert (=> b!1007773 m!933141))

(declare-fun m!933143 () Bool)

(assert (=> b!1007767 m!933143))

(declare-fun m!933145 () Bool)

(assert (=> b!1007767 m!933145))

(assert (=> b!1007767 m!933145))

(declare-fun m!933147 () Bool)

(assert (=> b!1007767 m!933147))

(assert (=> b!1007767 m!933147))

(assert (=> b!1007767 m!933145))

(declare-fun m!933149 () Bool)

(assert (=> b!1007767 m!933149))

(declare-fun m!933151 () Bool)

(assert (=> start!87034 m!933151))

(declare-fun m!933153 () Bool)

(assert (=> start!87034 m!933153))

(declare-fun m!933155 () Bool)

(assert (=> b!1007771 m!933155))

(declare-fun m!933157 () Bool)

(assert (=> b!1007766 m!933157))

(declare-fun m!933159 () Bool)

(assert (=> b!1007765 m!933159))

(assert (=> b!1007764 m!933137))

(assert (=> b!1007764 m!933137))

(declare-fun m!933161 () Bool)

(assert (=> b!1007764 m!933161))

(declare-fun m!933163 () Bool)

(assert (=> b!1007763 m!933163))

(assert (=> b!1007768 m!933137))

(assert (=> b!1007768 m!933137))

(declare-fun m!933165 () Bool)

(assert (=> b!1007768 m!933165))

(declare-fun m!933167 () Bool)

(assert (=> b!1007770 m!933167))

(check-sat (not b!1007770) (not start!87034) (not b!1007765) (not b!1007773) (not b!1007768) (not b!1007766) (not b!1007767) (not b!1007764) (not b!1007763) (not b!1007771))
(check-sat)
