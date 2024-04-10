; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86388 () Bool)

(assert start!86388)

(declare-fun b!999769 () Bool)

(declare-fun e!563662 () Bool)

(declare-fun mask!3464 () (_ BitVec 32))

(assert (=> b!999769 (= e!563662 (bvslt mask!3464 #b00000000000000000000000000000000))))

(declare-fun b!999770 () Bool)

(declare-fun res!669255 () Bool)

(assert (=> b!999770 (=> (not res!669255) (not e!563662))))

(declare-datatypes ((array!63189 0))(
  ( (array!63190 (arr!30420 (Array (_ BitVec 32) (_ BitVec 64))) (size!30922 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63189)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9352 0))(
  ( (MissingZero!9352 (index!39779 (_ BitVec 32))) (Found!9352 (index!39780 (_ BitVec 32))) (Intermediate!9352 (undefined!10164 Bool) (index!39781 (_ BitVec 32)) (x!87212 (_ BitVec 32))) (Undefined!9352) (MissingVacant!9352 (index!39782 (_ BitVec 32))) )
))
(declare-fun lt!442114 () SeekEntryResult!9352)

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63189 (_ BitVec 32)) SeekEntryResult!9352)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!999770 (= res!669255 (not (= lt!442114 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30420 a!3219) i!1194 k!2224) j!170) mask!3464) (select (store (arr!30420 a!3219) i!1194 k!2224) j!170) (array!63190 (store (arr!30420 a!3219) i!1194 k!2224) (size!30922 a!3219)) mask!3464))))))

(declare-fun b!999771 () Bool)

(declare-fun res!669254 () Bool)

(declare-fun e!563660 () Bool)

(assert (=> b!999771 (=> (not res!669254) (not e!563660))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63189 (_ BitVec 32)) Bool)

(assert (=> b!999771 (= res!669254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun res!669257 () Bool)

(declare-fun e!563659 () Bool)

(assert (=> start!86388 (=> (not res!669257) (not e!563659))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86388 (= res!669257 (validMask!0 mask!3464))))

(assert (=> start!86388 e!563659))

(declare-fun array_inv!23544 (array!63189) Bool)

(assert (=> start!86388 (array_inv!23544 a!3219)))

(assert (=> start!86388 true))

(declare-fun b!999772 () Bool)

(declare-fun res!669251 () Bool)

(assert (=> b!999772 (=> (not res!669251) (not e!563660))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!999772 (= res!669251 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30922 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30922 a!3219))))))

(declare-fun b!999773 () Bool)

(assert (=> b!999773 (= e!563660 e!563662)))

(declare-fun res!669256 () Bool)

(assert (=> b!999773 (=> (not res!669256) (not e!563662))))

(declare-fun lt!442113 () SeekEntryResult!9352)

(assert (=> b!999773 (= res!669256 (= lt!442114 lt!442113))))

(assert (=> b!999773 (= lt!442113 (Intermediate!9352 false resIndex!38 resX!38))))

(assert (=> b!999773 (= lt!442114 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30420 a!3219) j!170) mask!3464) (select (arr!30420 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!999774 () Bool)

(declare-fun res!669248 () Bool)

(assert (=> b!999774 (=> (not res!669248) (not e!563659))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!999774 (= res!669248 (validKeyInArray!0 k!2224))))

(declare-fun b!999775 () Bool)

(assert (=> b!999775 (= e!563659 e!563660)))

(declare-fun res!669253 () Bool)

(assert (=> b!999775 (=> (not res!669253) (not e!563660))))

(declare-fun lt!442115 () SeekEntryResult!9352)

(assert (=> b!999775 (= res!669253 (or (= lt!442115 (MissingVacant!9352 i!1194)) (= lt!442115 (MissingZero!9352 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63189 (_ BitVec 32)) SeekEntryResult!9352)

(assert (=> b!999775 (= lt!442115 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!999776 () Bool)

(declare-fun res!669249 () Bool)

(assert (=> b!999776 (=> (not res!669249) (not e!563660))))

(declare-datatypes ((List!21096 0))(
  ( (Nil!21093) (Cons!21092 (h!22269 (_ BitVec 64)) (t!30097 List!21096)) )
))
(declare-fun arrayNoDuplicates!0 (array!63189 (_ BitVec 32) List!21096) Bool)

(assert (=> b!999776 (= res!669249 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21093))))

(declare-fun b!999777 () Bool)

(declare-fun res!669252 () Bool)

(assert (=> b!999777 (=> (not res!669252) (not e!563659))))

(declare-fun arrayContainsKey!0 (array!63189 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!999777 (= res!669252 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!999778 () Bool)

(declare-fun res!669247 () Bool)

(assert (=> b!999778 (=> (not res!669247) (not e!563662))))

(assert (=> b!999778 (= res!669247 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30420 a!3219) j!170) a!3219 mask!3464) lt!442113))))

(declare-fun b!999779 () Bool)

(declare-fun res!669250 () Bool)

(assert (=> b!999779 (=> (not res!669250) (not e!563659))))

(assert (=> b!999779 (= res!669250 (validKeyInArray!0 (select (arr!30420 a!3219) j!170)))))

(declare-fun b!999780 () Bool)

(declare-fun res!669258 () Bool)

(assert (=> b!999780 (=> (not res!669258) (not e!563659))))

(assert (=> b!999780 (= res!669258 (and (= (size!30922 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30922 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30922 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!86388 res!669257) b!999780))

(assert (= (and b!999780 res!669258) b!999779))

(assert (= (and b!999779 res!669250) b!999774))

(assert (= (and b!999774 res!669248) b!999777))

(assert (= (and b!999777 res!669252) b!999775))

(assert (= (and b!999775 res!669253) b!999771))

(assert (= (and b!999771 res!669254) b!999776))

(assert (= (and b!999776 res!669249) b!999772))

(assert (= (and b!999772 res!669251) b!999773))

(assert (= (and b!999773 res!669256) b!999778))

(assert (= (and b!999778 res!669247) b!999770))

(assert (= (and b!999770 res!669255) b!999769))

(declare-fun m!925983 () Bool)

(assert (=> b!999773 m!925983))

(assert (=> b!999773 m!925983))

(declare-fun m!925985 () Bool)

(assert (=> b!999773 m!925985))

(assert (=> b!999773 m!925985))

(assert (=> b!999773 m!925983))

(declare-fun m!925987 () Bool)

(assert (=> b!999773 m!925987))

(declare-fun m!925989 () Bool)

(assert (=> b!999771 m!925989))

(declare-fun m!925991 () Bool)

(assert (=> b!999770 m!925991))

(declare-fun m!925993 () Bool)

(assert (=> b!999770 m!925993))

(assert (=> b!999770 m!925993))

(declare-fun m!925995 () Bool)

(assert (=> b!999770 m!925995))

(assert (=> b!999770 m!925995))

(assert (=> b!999770 m!925993))

(declare-fun m!925997 () Bool)

(assert (=> b!999770 m!925997))

(declare-fun m!925999 () Bool)

(assert (=> b!999774 m!925999))

(assert (=> b!999779 m!925983))

(assert (=> b!999779 m!925983))

(declare-fun m!926001 () Bool)

(assert (=> b!999779 m!926001))

(declare-fun m!926003 () Bool)

(assert (=> b!999775 m!926003))

(assert (=> b!999778 m!925983))

(assert (=> b!999778 m!925983))

(declare-fun m!926005 () Bool)

(assert (=> b!999778 m!926005))

(declare-fun m!926007 () Bool)

(assert (=> b!999776 m!926007))

(declare-fun m!926009 () Bool)

(assert (=> start!86388 m!926009))

(declare-fun m!926011 () Bool)

(assert (=> start!86388 m!926011))

(declare-fun m!926013 () Bool)

(assert (=> b!999777 m!926013))

(push 1)

(assert (not b!999779))

(assert (not b!999775))

(assert (not b!999778))

(assert (not b!999771))

(assert (not b!999774))

(assert (not b!999777))

(assert (not start!86388))

(assert (not b!999776))

(assert (not b!999770))

(assert (not b!999773))

(check-sat)

(pop 1)

(push 1)

(check-sat)

