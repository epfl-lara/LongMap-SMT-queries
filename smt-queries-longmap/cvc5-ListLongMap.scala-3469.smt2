; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48144 () Bool)

(assert start!48144)

(declare-fun res!326044 () Bool)

(declare-fun e!309009 () Bool)

(assert (=> start!48144 (=> (not res!326044) (not e!309009))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48144 (= res!326044 (validMask!0 mask!3524))))

(assert (=> start!48144 e!309009))

(assert (=> start!48144 true))

(declare-datatypes ((array!33580 0))(
  ( (array!33581 (arr!16137 (Array (_ BitVec 32) (_ BitVec 64))) (size!16501 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33580)

(declare-fun array_inv!11933 (array!33580) Bool)

(assert (=> start!48144 (array_inv!11933 a!3235)))

(declare-fun b!530335 () Bool)

(declare-fun res!326049 () Bool)

(assert (=> b!530335 (=> (not res!326049) (not e!309009))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!530335 (= res!326049 (and (= (size!16501 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16501 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16501 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!530336 () Bool)

(declare-fun e!309008 () Bool)

(assert (=> b!530336 (= e!309008 true)))

(declare-fun lt!244702 () array!33580)

(declare-datatypes ((SeekEntryResult!4604 0))(
  ( (MissingZero!4604 (index!20640 (_ BitVec 32))) (Found!4604 (index!20641 (_ BitVec 32))) (Intermediate!4604 (undefined!5416 Bool) (index!20642 (_ BitVec 32)) (x!49610 (_ BitVec 32))) (Undefined!4604) (MissingVacant!4604 (index!20643 (_ BitVec 32))) )
))
(declare-fun lt!244697 () SeekEntryResult!4604)

(declare-fun lt!244699 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33580 (_ BitVec 32)) SeekEntryResult!4604)

(assert (=> b!530336 (= lt!244697 (seekEntryOrOpen!0 lt!244699 lt!244702 mask!3524))))

(assert (=> b!530336 false))

(declare-fun b!530337 () Bool)

(declare-fun e!309007 () Bool)

(assert (=> b!530337 (= e!309009 e!309007)))

(declare-fun res!326047 () Bool)

(assert (=> b!530337 (=> (not res!326047) (not e!309007))))

(declare-fun lt!244694 () SeekEntryResult!4604)

(assert (=> b!530337 (= res!326047 (or (= lt!244694 (MissingZero!4604 i!1204)) (= lt!244694 (MissingVacant!4604 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!530337 (= lt!244694 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!530338 () Bool)

(declare-fun e!309004 () Bool)

(assert (=> b!530338 (= e!309007 (not e!309004))))

(declare-fun res!326051 () Bool)

(assert (=> b!530338 (=> res!326051 e!309004)))

(declare-fun lt!244695 () SeekEntryResult!4604)

(declare-fun lt!244698 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33580 (_ BitVec 32)) SeekEntryResult!4604)

(assert (=> b!530338 (= res!326051 (= lt!244695 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244698 lt!244699 lt!244702 mask!3524)))))

(declare-fun lt!244701 () (_ BitVec 32))

(assert (=> b!530338 (= lt!244695 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244701 (select (arr!16137 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!530338 (= lt!244698 (toIndex!0 lt!244699 mask!3524))))

(assert (=> b!530338 (= lt!244699 (select (store (arr!16137 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!530338 (= lt!244701 (toIndex!0 (select (arr!16137 a!3235) j!176) mask!3524))))

(assert (=> b!530338 (= lt!244702 (array!33581 (store (arr!16137 a!3235) i!1204 k!2280) (size!16501 a!3235)))))

(declare-fun e!309005 () Bool)

(assert (=> b!530338 e!309005))

(declare-fun res!326045 () Bool)

(assert (=> b!530338 (=> (not res!326045) (not e!309005))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33580 (_ BitVec 32)) Bool)

(assert (=> b!530338 (= res!326045 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16820 0))(
  ( (Unit!16821) )
))
(declare-fun lt!244700 () Unit!16820)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33580 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16820)

(assert (=> b!530338 (= lt!244700 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!530339 () Bool)

(assert (=> b!530339 (= e!309005 (= (seekEntryOrOpen!0 (select (arr!16137 a!3235) j!176) a!3235 mask!3524) (Found!4604 j!176)))))

(declare-fun b!530340 () Bool)

(declare-fun res!326041 () Bool)

(assert (=> b!530340 (=> (not res!326041) (not e!309009))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530340 (= res!326041 (validKeyInArray!0 k!2280))))

(declare-fun b!530341 () Bool)

(declare-fun res!326046 () Bool)

(assert (=> b!530341 (=> (not res!326046) (not e!309009))))

(assert (=> b!530341 (= res!326046 (validKeyInArray!0 (select (arr!16137 a!3235) j!176)))))

(declare-fun b!530342 () Bool)

(declare-fun res!326043 () Bool)

(assert (=> b!530342 (=> (not res!326043) (not e!309007))))

(declare-datatypes ((List!10295 0))(
  ( (Nil!10292) (Cons!10291 (h!11231 (_ BitVec 64)) (t!16523 List!10295)) )
))
(declare-fun arrayNoDuplicates!0 (array!33580 (_ BitVec 32) List!10295) Bool)

(assert (=> b!530342 (= res!326043 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10292))))

(declare-fun b!530343 () Bool)

(declare-fun res!326042 () Bool)

(assert (=> b!530343 (=> (not res!326042) (not e!309007))))

(assert (=> b!530343 (= res!326042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!530344 () Bool)

(assert (=> b!530344 (= e!309004 e!309008)))

(declare-fun res!326050 () Bool)

(assert (=> b!530344 (=> res!326050 e!309008)))

(declare-fun lt!244696 () Bool)

(assert (=> b!530344 (= res!326050 (or (and (not lt!244696) (undefined!5416 lt!244695)) (and (not lt!244696) (not (undefined!5416 lt!244695)))))))

(assert (=> b!530344 (= lt!244696 (not (is-Intermediate!4604 lt!244695)))))

(declare-fun b!530345 () Bool)

(declare-fun res!326048 () Bool)

(assert (=> b!530345 (=> (not res!326048) (not e!309009))))

(declare-fun arrayContainsKey!0 (array!33580 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530345 (= res!326048 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!48144 res!326044) b!530335))

(assert (= (and b!530335 res!326049) b!530341))

(assert (= (and b!530341 res!326046) b!530340))

(assert (= (and b!530340 res!326041) b!530345))

(assert (= (and b!530345 res!326048) b!530337))

(assert (= (and b!530337 res!326047) b!530343))

(assert (= (and b!530343 res!326042) b!530342))

(assert (= (and b!530342 res!326043) b!530338))

(assert (= (and b!530338 res!326045) b!530339))

(assert (= (and b!530338 (not res!326051)) b!530344))

(assert (= (and b!530344 (not res!326050)) b!530336))

(declare-fun m!510903 () Bool)

(assert (=> b!530339 m!510903))

(assert (=> b!530339 m!510903))

(declare-fun m!510905 () Bool)

(assert (=> b!530339 m!510905))

(declare-fun m!510907 () Bool)

(assert (=> b!530342 m!510907))

(assert (=> b!530341 m!510903))

(assert (=> b!530341 m!510903))

(declare-fun m!510909 () Bool)

(assert (=> b!530341 m!510909))

(declare-fun m!510911 () Bool)

(assert (=> start!48144 m!510911))

(declare-fun m!510913 () Bool)

(assert (=> start!48144 m!510913))

(declare-fun m!510915 () Bool)

(assert (=> b!530336 m!510915))

(declare-fun m!510917 () Bool)

(assert (=> b!530343 m!510917))

(declare-fun m!510919 () Bool)

(assert (=> b!530337 m!510919))

(declare-fun m!510921 () Bool)

(assert (=> b!530338 m!510921))

(declare-fun m!510923 () Bool)

(assert (=> b!530338 m!510923))

(declare-fun m!510925 () Bool)

(assert (=> b!530338 m!510925))

(assert (=> b!530338 m!510903))

(declare-fun m!510927 () Bool)

(assert (=> b!530338 m!510927))

(declare-fun m!510929 () Bool)

(assert (=> b!530338 m!510929))

(assert (=> b!530338 m!510903))

(declare-fun m!510931 () Bool)

(assert (=> b!530338 m!510931))

(assert (=> b!530338 m!510903))

(declare-fun m!510933 () Bool)

(assert (=> b!530338 m!510933))

(declare-fun m!510935 () Bool)

(assert (=> b!530338 m!510935))

(declare-fun m!510937 () Bool)

(assert (=> b!530340 m!510937))

(declare-fun m!510939 () Bool)

(assert (=> b!530345 m!510939))

(push 1)

