; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86358 () Bool)

(assert start!86358)

(declare-fun b!999171 () Bool)

(declare-fun e!563389 () Bool)

(assert (=> b!999171 (= e!563389 false)))

(declare-datatypes ((array!63106 0))(
  ( (array!63107 (arr!30378 (Array (_ BitVec 32) (_ BitVec 64))) (size!30882 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63106)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun lt!441784 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!999171 (= lt!441784 (toIndex!0 (select (store (arr!30378 a!3219) i!1194 k0!2224) j!170) mask!3464))))

(declare-fun b!999172 () Bool)

(declare-fun res!668773 () Bool)

(assert (=> b!999172 (=> (not res!668773) (not e!563389))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9335 0))(
  ( (MissingZero!9335 (index!39711 (_ BitVec 32))) (Found!9335 (index!39712 (_ BitVec 32))) (Intermediate!9335 (undefined!10147 Bool) (index!39713 (_ BitVec 32)) (x!87166 (_ BitVec 32))) (Undefined!9335) (MissingVacant!9335 (index!39714 (_ BitVec 32))) )
))
(declare-fun lt!441782 () SeekEntryResult!9335)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63106 (_ BitVec 32)) SeekEntryResult!9335)

(assert (=> b!999172 (= res!668773 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30378 a!3219) j!170) a!3219 mask!3464) lt!441782))))

(declare-fun b!999173 () Bool)

(declare-fun res!668774 () Bool)

(declare-fun e!563390 () Bool)

(assert (=> b!999173 (=> (not res!668774) (not e!563390))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!999173 (= res!668774 (validKeyInArray!0 (select (arr!30378 a!3219) j!170)))))

(declare-fun b!999174 () Bool)

(declare-fun res!668777 () Bool)

(declare-fun e!563388 () Bool)

(assert (=> b!999174 (=> (not res!668777) (not e!563388))))

(declare-datatypes ((List!21120 0))(
  ( (Nil!21117) (Cons!21116 (h!22293 (_ BitVec 64)) (t!30112 List!21120)) )
))
(declare-fun arrayNoDuplicates!0 (array!63106 (_ BitVec 32) List!21120) Bool)

(assert (=> b!999174 (= res!668777 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21117))))

(declare-fun b!999175 () Bool)

(declare-fun res!668779 () Bool)

(assert (=> b!999175 (=> (not res!668779) (not e!563388))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!999175 (= res!668779 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30882 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30882 a!3219))))))

(declare-fun b!999176 () Bool)

(assert (=> b!999176 (= e!563390 e!563388)))

(declare-fun res!668775 () Bool)

(assert (=> b!999176 (=> (not res!668775) (not e!563388))))

(declare-fun lt!441783 () SeekEntryResult!9335)

(assert (=> b!999176 (= res!668775 (or (= lt!441783 (MissingVacant!9335 i!1194)) (= lt!441783 (MissingZero!9335 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63106 (_ BitVec 32)) SeekEntryResult!9335)

(assert (=> b!999176 (= lt!441783 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!999177 () Bool)

(declare-fun res!668781 () Bool)

(assert (=> b!999177 (=> (not res!668781) (not e!563390))))

(declare-fun arrayContainsKey!0 (array!63106 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!999177 (= res!668781 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!999178 () Bool)

(declare-fun res!668783 () Bool)

(assert (=> b!999178 (=> (not res!668783) (not e!563390))))

(assert (=> b!999178 (= res!668783 (and (= (size!30882 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30882 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30882 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!999179 () Bool)

(assert (=> b!999179 (= e!563388 e!563389)))

(declare-fun res!668780 () Bool)

(assert (=> b!999179 (=> (not res!668780) (not e!563389))))

(assert (=> b!999179 (= res!668780 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30378 a!3219) j!170) mask!3464) (select (arr!30378 a!3219) j!170) a!3219 mask!3464) lt!441782))))

(assert (=> b!999179 (= lt!441782 (Intermediate!9335 false resIndex!38 resX!38))))

(declare-fun res!668778 () Bool)

(assert (=> start!86358 (=> (not res!668778) (not e!563390))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86358 (= res!668778 (validMask!0 mask!3464))))

(assert (=> start!86358 e!563390))

(declare-fun array_inv!23521 (array!63106) Bool)

(assert (=> start!86358 (array_inv!23521 a!3219)))

(assert (=> start!86358 true))

(declare-fun b!999180 () Bool)

(declare-fun res!668776 () Bool)

(assert (=> b!999180 (=> (not res!668776) (not e!563388))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63106 (_ BitVec 32)) Bool)

(assert (=> b!999180 (= res!668776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!999181 () Bool)

(declare-fun res!668782 () Bool)

(assert (=> b!999181 (=> (not res!668782) (not e!563390))))

(assert (=> b!999181 (= res!668782 (validKeyInArray!0 k0!2224))))

(assert (= (and start!86358 res!668778) b!999178))

(assert (= (and b!999178 res!668783) b!999173))

(assert (= (and b!999173 res!668774) b!999181))

(assert (= (and b!999181 res!668782) b!999177))

(assert (= (and b!999177 res!668781) b!999176))

(assert (= (and b!999176 res!668775) b!999180))

(assert (= (and b!999180 res!668776) b!999174))

(assert (= (and b!999174 res!668777) b!999175))

(assert (= (and b!999175 res!668779) b!999179))

(assert (= (and b!999179 res!668780) b!999172))

(assert (= (and b!999172 res!668773) b!999171))

(declare-fun m!924907 () Bool)

(assert (=> b!999176 m!924907))

(declare-fun m!924909 () Bool)

(assert (=> b!999172 m!924909))

(assert (=> b!999172 m!924909))

(declare-fun m!924911 () Bool)

(assert (=> b!999172 m!924911))

(declare-fun m!924913 () Bool)

(assert (=> b!999180 m!924913))

(declare-fun m!924915 () Bool)

(assert (=> b!999177 m!924915))

(assert (=> b!999179 m!924909))

(assert (=> b!999179 m!924909))

(declare-fun m!924917 () Bool)

(assert (=> b!999179 m!924917))

(assert (=> b!999179 m!924917))

(assert (=> b!999179 m!924909))

(declare-fun m!924919 () Bool)

(assert (=> b!999179 m!924919))

(assert (=> b!999173 m!924909))

(assert (=> b!999173 m!924909))

(declare-fun m!924921 () Bool)

(assert (=> b!999173 m!924921))

(declare-fun m!924923 () Bool)

(assert (=> b!999174 m!924923))

(declare-fun m!924925 () Bool)

(assert (=> start!86358 m!924925))

(declare-fun m!924927 () Bool)

(assert (=> start!86358 m!924927))

(declare-fun m!924929 () Bool)

(assert (=> b!999171 m!924929))

(declare-fun m!924931 () Bool)

(assert (=> b!999171 m!924931))

(assert (=> b!999171 m!924931))

(declare-fun m!924933 () Bool)

(assert (=> b!999171 m!924933))

(declare-fun m!924935 () Bool)

(assert (=> b!999181 m!924935))

(check-sat (not b!999171) (not b!999181) (not b!999176) (not b!999173) (not b!999179) (not b!999172) (not start!86358) (not b!999177) (not b!999180) (not b!999174))
(check-sat)
