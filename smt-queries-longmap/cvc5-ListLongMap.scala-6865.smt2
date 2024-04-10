; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86444 () Bool)

(assert start!86444)

(declare-fun b!1000743 () Bool)

(declare-fun res!670224 () Bool)

(declare-fun e!563998 () Bool)

(assert (=> b!1000743 (=> (not res!670224) (not e!563998))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-datatypes ((array!63245 0))(
  ( (array!63246 (arr!30448 (Array (_ BitVec 32) (_ BitVec 64))) (size!30950 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63245)

(assert (=> b!1000743 (= res!670224 (and (= (size!30950 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30950 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30950 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1000744 () Bool)

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun e!563996 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000744 (= e!563996 (not (validKeyInArray!0 (select (store (arr!30448 a!3219) i!1194 k!2224) j!170))))))

(declare-fun b!1000745 () Bool)

(declare-fun res!670227 () Bool)

(declare-fun e!563997 () Bool)

(assert (=> b!1000745 (=> (not res!670227) (not e!563997))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1000745 (= res!670227 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30950 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30950 a!3219))))))

(declare-fun b!1000746 () Bool)

(declare-fun res!670232 () Bool)

(assert (=> b!1000746 (=> (not res!670232) (not e!563996))))

(declare-datatypes ((SeekEntryResult!9380 0))(
  ( (MissingZero!9380 (index!39891 (_ BitVec 32))) (Found!9380 (index!39892 (_ BitVec 32))) (Intermediate!9380 (undefined!10192 Bool) (index!39893 (_ BitVec 32)) (x!87320 (_ BitVec 32))) (Undefined!9380) (MissingVacant!9380 (index!39894 (_ BitVec 32))) )
))
(declare-fun lt!442367 () SeekEntryResult!9380)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63245 (_ BitVec 32)) SeekEntryResult!9380)

(assert (=> b!1000746 (= res!670232 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30448 a!3219) j!170) a!3219 mask!3464) lt!442367))))

(declare-fun b!1000747 () Bool)

(assert (=> b!1000747 (= e!563997 e!563996)))

(declare-fun res!670223 () Bool)

(assert (=> b!1000747 (=> (not res!670223) (not e!563996))))

(declare-fun lt!442365 () SeekEntryResult!9380)

(assert (=> b!1000747 (= res!670223 (= lt!442365 lt!442367))))

(assert (=> b!1000747 (= lt!442367 (Intermediate!9380 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000747 (= lt!442365 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30448 a!3219) j!170) mask!3464) (select (arr!30448 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1000748 () Bool)

(declare-fun res!670230 () Bool)

(assert (=> b!1000748 (=> (not res!670230) (not e!563997))))

(declare-datatypes ((List!21124 0))(
  ( (Nil!21121) (Cons!21120 (h!22297 (_ BitVec 64)) (t!30125 List!21124)) )
))
(declare-fun arrayNoDuplicates!0 (array!63245 (_ BitVec 32) List!21124) Bool)

(assert (=> b!1000748 (= res!670230 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21121))))

(declare-fun b!1000749 () Bool)

(declare-fun res!670225 () Bool)

(assert (=> b!1000749 (=> (not res!670225) (not e!563997))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63245 (_ BitVec 32)) Bool)

(assert (=> b!1000749 (= res!670225 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1000750 () Bool)

(declare-fun res!670231 () Bool)

(assert (=> b!1000750 (=> (not res!670231) (not e!563996))))

(assert (=> b!1000750 (= res!670231 (not (= lt!442365 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30448 a!3219) i!1194 k!2224) j!170) mask!3464) (select (store (arr!30448 a!3219) i!1194 k!2224) j!170) (array!63246 (store (arr!30448 a!3219) i!1194 k!2224) (size!30950 a!3219)) mask!3464))))))

(declare-fun b!1000751 () Bool)

(declare-fun res!670228 () Bool)

(assert (=> b!1000751 (=> (not res!670228) (not e!563998))))

(declare-fun arrayContainsKey!0 (array!63245 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000751 (= res!670228 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1000752 () Bool)

(assert (=> b!1000752 (= e!563998 e!563997)))

(declare-fun res!670222 () Bool)

(assert (=> b!1000752 (=> (not res!670222) (not e!563997))))

(declare-fun lt!442366 () SeekEntryResult!9380)

(assert (=> b!1000752 (= res!670222 (or (= lt!442366 (MissingVacant!9380 i!1194)) (= lt!442366 (MissingZero!9380 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63245 (_ BitVec 32)) SeekEntryResult!9380)

(assert (=> b!1000752 (= lt!442366 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1000753 () Bool)

(declare-fun res!670221 () Bool)

(assert (=> b!1000753 (=> (not res!670221) (not e!563998))))

(assert (=> b!1000753 (= res!670221 (validKeyInArray!0 (select (arr!30448 a!3219) j!170)))))

(declare-fun res!670226 () Bool)

(assert (=> start!86444 (=> (not res!670226) (not e!563998))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86444 (= res!670226 (validMask!0 mask!3464))))

(assert (=> start!86444 e!563998))

(declare-fun array_inv!23572 (array!63245) Bool)

(assert (=> start!86444 (array_inv!23572 a!3219)))

(assert (=> start!86444 true))

(declare-fun b!1000754 () Bool)

(declare-fun res!670233 () Bool)

(assert (=> b!1000754 (=> (not res!670233) (not e!563996))))

(assert (=> b!1000754 (= res!670233 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvslt index!1507 (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsle x!1245 #b01111111111111111111111111111110)))))

(declare-fun b!1000755 () Bool)

(declare-fun res!670229 () Bool)

(assert (=> b!1000755 (=> (not res!670229) (not e!563998))))

(assert (=> b!1000755 (= res!670229 (validKeyInArray!0 k!2224))))

(assert (= (and start!86444 res!670226) b!1000743))

(assert (= (and b!1000743 res!670224) b!1000753))

(assert (= (and b!1000753 res!670221) b!1000755))

(assert (= (and b!1000755 res!670229) b!1000751))

(assert (= (and b!1000751 res!670228) b!1000752))

(assert (= (and b!1000752 res!670222) b!1000749))

(assert (= (and b!1000749 res!670225) b!1000748))

(assert (= (and b!1000748 res!670230) b!1000745))

(assert (= (and b!1000745 res!670227) b!1000747))

(assert (= (and b!1000747 res!670223) b!1000746))

(assert (= (and b!1000746 res!670232) b!1000750))

(assert (= (and b!1000750 res!670231) b!1000754))

(assert (= (and b!1000754 res!670233) b!1000744))

(declare-fun m!926879 () Bool)

(assert (=> start!86444 m!926879))

(declare-fun m!926881 () Bool)

(assert (=> start!86444 m!926881))

(declare-fun m!926883 () Bool)

(assert (=> b!1000751 m!926883))

(declare-fun m!926885 () Bool)

(assert (=> b!1000753 m!926885))

(assert (=> b!1000753 m!926885))

(declare-fun m!926887 () Bool)

(assert (=> b!1000753 m!926887))

(declare-fun m!926889 () Bool)

(assert (=> b!1000749 m!926889))

(declare-fun m!926891 () Bool)

(assert (=> b!1000755 m!926891))

(declare-fun m!926893 () Bool)

(assert (=> b!1000744 m!926893))

(declare-fun m!926895 () Bool)

(assert (=> b!1000744 m!926895))

(assert (=> b!1000744 m!926895))

(declare-fun m!926897 () Bool)

(assert (=> b!1000744 m!926897))

(declare-fun m!926899 () Bool)

(assert (=> b!1000752 m!926899))

(assert (=> b!1000747 m!926885))

(assert (=> b!1000747 m!926885))

(declare-fun m!926901 () Bool)

(assert (=> b!1000747 m!926901))

(assert (=> b!1000747 m!926901))

(assert (=> b!1000747 m!926885))

(declare-fun m!926903 () Bool)

(assert (=> b!1000747 m!926903))

(declare-fun m!926905 () Bool)

(assert (=> b!1000748 m!926905))

(assert (=> b!1000750 m!926893))

(assert (=> b!1000750 m!926895))

(assert (=> b!1000750 m!926895))

(declare-fun m!926907 () Bool)

(assert (=> b!1000750 m!926907))

(assert (=> b!1000750 m!926907))

(assert (=> b!1000750 m!926895))

(declare-fun m!926909 () Bool)

(assert (=> b!1000750 m!926909))

(assert (=> b!1000746 m!926885))

(assert (=> b!1000746 m!926885))

(declare-fun m!926911 () Bool)

(assert (=> b!1000746 m!926911))

(push 1)

