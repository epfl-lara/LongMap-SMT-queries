; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86498 () Bool)

(assert start!86498)

(declare-fun b!1001901 () Bool)

(declare-fun e!564499 () Bool)

(declare-fun e!564498 () Bool)

(assert (=> b!1001901 (= e!564499 e!564498)))

(declare-fun res!671385 () Bool)

(assert (=> b!1001901 (=> (not res!671385) (not e!564498))))

(declare-datatypes ((array!63299 0))(
  ( (array!63300 (arr!30475 (Array (_ BitVec 32) (_ BitVec 64))) (size!30977 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63299)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun lt!442908 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1001901 (= res!671385 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!442908 #b00000000000000000000000000000000) (bvslt lt!442908 (size!30977 a!3219))))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001901 (= lt!442908 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun res!671391 () Bool)

(declare-fun e!564497 () Bool)

(assert (=> start!86498 (=> (not res!671391) (not e!564497))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86498 (= res!671391 (validMask!0 mask!3464))))

(assert (=> start!86498 e!564497))

(declare-fun array_inv!23599 (array!63299) Bool)

(assert (=> start!86498 (array_inv!23599 a!3219)))

(assert (=> start!86498 true))

(declare-fun b!1001902 () Bool)

(declare-fun res!671379 () Bool)

(assert (=> b!1001902 (=> (not res!671379) (not e!564498))))

(declare-fun j!170 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9407 0))(
  ( (MissingZero!9407 (index!39999 (_ BitVec 32))) (Found!9407 (index!40000 (_ BitVec 32))) (Intermediate!9407 (undefined!10219 Bool) (index!40001 (_ BitVec 32)) (x!87419 (_ BitVec 32))) (Undefined!9407) (MissingVacant!9407 (index!40002 (_ BitVec 32))) )
))
(declare-fun lt!442909 () SeekEntryResult!9407)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63299 (_ BitVec 32)) SeekEntryResult!9407)

(assert (=> b!1001902 (= res!671379 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442908 (select (arr!30475 a!3219) j!170) a!3219 mask!3464) lt!442909))))

(declare-fun b!1001903 () Bool)

(declare-fun res!671389 () Bool)

(assert (=> b!1001903 (=> (not res!671389) (not e!564497))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63299 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1001903 (= res!671389 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1001904 () Bool)

(declare-fun res!671380 () Bool)

(assert (=> b!1001904 (=> (not res!671380) (not e!564499))))

(declare-fun lt!442912 () array!63299)

(declare-fun lt!442906 () (_ BitVec 64))

(declare-fun lt!442911 () SeekEntryResult!9407)

(assert (=> b!1001904 (= res!671380 (not (= lt!442911 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442906 lt!442912 mask!3464))))))

(declare-fun b!1001905 () Bool)

(declare-fun e!564500 () Bool)

(declare-fun e!564502 () Bool)

(assert (=> b!1001905 (= e!564500 e!564502)))

(declare-fun res!671392 () Bool)

(assert (=> b!1001905 (=> (not res!671392) (not e!564502))))

(declare-fun lt!442913 () SeekEntryResult!9407)

(assert (=> b!1001905 (= res!671392 (= lt!442913 lt!442909))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1001905 (= lt!442909 (Intermediate!9407 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001905 (= lt!442913 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30475 a!3219) j!170) mask!3464) (select (arr!30475 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001906 () Bool)

(declare-fun res!671381 () Bool)

(assert (=> b!1001906 (=> (not res!671381) (not e!564497))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1001906 (= res!671381 (validKeyInArray!0 (select (arr!30475 a!3219) j!170)))))

(declare-fun b!1001907 () Bool)

(declare-fun res!671382 () Bool)

(assert (=> b!1001907 (=> (not res!671382) (not e!564500))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63299 (_ BitVec 32)) Bool)

(assert (=> b!1001907 (= res!671382 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1001908 () Bool)

(declare-fun res!671386 () Bool)

(assert (=> b!1001908 (=> (not res!671386) (not e!564497))))

(assert (=> b!1001908 (= res!671386 (validKeyInArray!0 k!2224))))

(declare-fun b!1001909 () Bool)

(declare-fun res!671390 () Bool)

(assert (=> b!1001909 (=> (not res!671390) (not e!564500))))

(assert (=> b!1001909 (= res!671390 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30977 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30977 a!3219))))))

(declare-fun b!1001910 () Bool)

(assert (=> b!1001910 (= e!564498 false)))

(declare-fun lt!442910 () SeekEntryResult!9407)

(assert (=> b!1001910 (= lt!442910 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442908 lt!442906 lt!442912 mask!3464))))

(declare-fun b!1001911 () Bool)

(declare-fun e!564501 () Bool)

(assert (=> b!1001911 (= e!564501 e!564499)))

(declare-fun res!671393 () Bool)

(assert (=> b!1001911 (=> (not res!671393) (not e!564499))))

(assert (=> b!1001911 (= res!671393 (not (= lt!442913 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442906 mask!3464) lt!442906 lt!442912 mask!3464))))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1001911 (= lt!442906 (select (store (arr!30475 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1001911 (= lt!442912 (array!63300 (store (arr!30475 a!3219) i!1194 k!2224) (size!30977 a!3219)))))

(declare-fun b!1001912 () Bool)

(assert (=> b!1001912 (= e!564497 e!564500)))

(declare-fun res!671387 () Bool)

(assert (=> b!1001912 (=> (not res!671387) (not e!564500))))

(declare-fun lt!442907 () SeekEntryResult!9407)

(assert (=> b!1001912 (= res!671387 (or (= lt!442907 (MissingVacant!9407 i!1194)) (= lt!442907 (MissingZero!9407 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63299 (_ BitVec 32)) SeekEntryResult!9407)

(assert (=> b!1001912 (= lt!442907 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1001913 () Bool)

(declare-fun res!671394 () Bool)

(assert (=> b!1001913 (=> (not res!671394) (not e!564500))))

(declare-datatypes ((List!21151 0))(
  ( (Nil!21148) (Cons!21147 (h!22324 (_ BitVec 64)) (t!30152 List!21151)) )
))
(declare-fun arrayNoDuplicates!0 (array!63299 (_ BitVec 32) List!21151) Bool)

(assert (=> b!1001913 (= res!671394 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21148))))

(declare-fun b!1001914 () Bool)

(assert (=> b!1001914 (= e!564502 e!564501)))

(declare-fun res!671383 () Bool)

(assert (=> b!1001914 (=> (not res!671383) (not e!564501))))

(assert (=> b!1001914 (= res!671383 (= lt!442911 lt!442909))))

(assert (=> b!1001914 (= lt!442911 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30475 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001915 () Bool)

(declare-fun res!671388 () Bool)

(assert (=> b!1001915 (=> (not res!671388) (not e!564497))))

(assert (=> b!1001915 (= res!671388 (and (= (size!30977 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30977 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30977 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1001916 () Bool)

(declare-fun res!671384 () Bool)

(assert (=> b!1001916 (=> (not res!671384) (not e!564499))))

(assert (=> b!1001916 (= res!671384 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(assert (= (and start!86498 res!671391) b!1001915))

(assert (= (and b!1001915 res!671388) b!1001906))

(assert (= (and b!1001906 res!671381) b!1001908))

(assert (= (and b!1001908 res!671386) b!1001903))

(assert (= (and b!1001903 res!671389) b!1001912))

(assert (= (and b!1001912 res!671387) b!1001907))

(assert (= (and b!1001907 res!671382) b!1001913))

(assert (= (and b!1001913 res!671394) b!1001909))

(assert (= (and b!1001909 res!671390) b!1001905))

(assert (= (and b!1001905 res!671392) b!1001914))

(assert (= (and b!1001914 res!671383) b!1001911))

(assert (= (and b!1001911 res!671393) b!1001904))

(assert (= (and b!1001904 res!671380) b!1001916))

(assert (= (and b!1001916 res!671384) b!1001901))

(assert (= (and b!1001901 res!671385) b!1001902))

(assert (= (and b!1001902 res!671379) b!1001910))

(declare-fun m!927869 () Bool)

(assert (=> b!1001911 m!927869))

(assert (=> b!1001911 m!927869))

(declare-fun m!927871 () Bool)

(assert (=> b!1001911 m!927871))

(declare-fun m!927873 () Bool)

(assert (=> b!1001911 m!927873))

(declare-fun m!927875 () Bool)

(assert (=> b!1001911 m!927875))

(declare-fun m!927877 () Bool)

(assert (=> start!86498 m!927877))

(declare-fun m!927879 () Bool)

(assert (=> start!86498 m!927879))

(declare-fun m!927881 () Bool)

(assert (=> b!1001908 m!927881))

(declare-fun m!927883 () Bool)

(assert (=> b!1001907 m!927883))

(declare-fun m!927885 () Bool)

(assert (=> b!1001901 m!927885))

(declare-fun m!927887 () Bool)

(assert (=> b!1001904 m!927887))

(declare-fun m!927889 () Bool)

(assert (=> b!1001910 m!927889))

(declare-fun m!927891 () Bool)

(assert (=> b!1001902 m!927891))

(assert (=> b!1001902 m!927891))

(declare-fun m!927893 () Bool)

(assert (=> b!1001902 m!927893))

(assert (=> b!1001905 m!927891))

(assert (=> b!1001905 m!927891))

(declare-fun m!927895 () Bool)

(assert (=> b!1001905 m!927895))

(assert (=> b!1001905 m!927895))

(assert (=> b!1001905 m!927891))

(declare-fun m!927897 () Bool)

(assert (=> b!1001905 m!927897))

(declare-fun m!927899 () Bool)

(assert (=> b!1001913 m!927899))

(declare-fun m!927901 () Bool)

(assert (=> b!1001903 m!927901))

(assert (=> b!1001914 m!927891))

(assert (=> b!1001914 m!927891))

(declare-fun m!927903 () Bool)

(assert (=> b!1001914 m!927903))

(declare-fun m!927905 () Bool)

(assert (=> b!1001912 m!927905))

(assert (=> b!1001906 m!927891))

(assert (=> b!1001906 m!927891))

(declare-fun m!927907 () Bool)

(assert (=> b!1001906 m!927907))

(push 1)

