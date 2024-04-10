; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86916 () Bool)

(assert start!86916)

(declare-fun b!1008011 () Bool)

(declare-fun res!676911 () Bool)

(declare-fun e!567234 () Bool)

(assert (=> b!1008011 (=> (not res!676911) (not e!567234))))

(declare-datatypes ((array!63564 0))(
  ( (array!63565 (arr!30603 (Array (_ BitVec 32) (_ BitVec 64))) (size!31105 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63564)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1008011 (= res!676911 (and (= (size!31105 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31105 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31105 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1008012 () Bool)

(declare-fun res!676906 () Bool)

(declare-fun e!567235 () Bool)

(assert (=> b!1008012 (=> (not res!676906) (not e!567235))))

(declare-fun lt!445488 () array!63564)

(declare-fun lt!445486 () (_ BitVec 64))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9535 0))(
  ( (MissingZero!9535 (index!40511 (_ BitVec 32))) (Found!9535 (index!40512 (_ BitVec 32))) (Intermediate!9535 (undefined!10347 Bool) (index!40513 (_ BitVec 32)) (x!87901 (_ BitVec 32))) (Undefined!9535) (MissingVacant!9535 (index!40514 (_ BitVec 32))) )
))
(declare-fun lt!445484 () SeekEntryResult!9535)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63564 (_ BitVec 32)) SeekEntryResult!9535)

(assert (=> b!1008012 (= res!676906 (not (= lt!445484 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445486 lt!445488 mask!3464))))))

(declare-fun b!1008013 () Bool)

(declare-fun e!567230 () Bool)

(declare-fun e!567232 () Bool)

(assert (=> b!1008013 (= e!567230 e!567232)))

(declare-fun res!676916 () Bool)

(assert (=> b!1008013 (=> (not res!676916) (not e!567232))))

(declare-fun lt!445487 () SeekEntryResult!9535)

(declare-fun lt!445485 () SeekEntryResult!9535)

(assert (=> b!1008013 (= res!676916 (= lt!445487 lt!445485))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1008013 (= lt!445485 (Intermediate!9535 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008013 (= lt!445487 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30603 a!3219) j!170) mask!3464) (select (arr!30603 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008014 () Bool)

(declare-fun res!676915 () Bool)

(assert (=> b!1008014 (=> (not res!676915) (not e!567235))))

(assert (=> b!1008014 (= res!676915 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun res!676913 () Bool)

(assert (=> start!86916 (=> (not res!676913) (not e!567234))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86916 (= res!676913 (validMask!0 mask!3464))))

(assert (=> start!86916 e!567234))

(declare-fun array_inv!23727 (array!63564) Bool)

(assert (=> start!86916 (array_inv!23727 a!3219)))

(assert (=> start!86916 true))

(declare-fun b!1008015 () Bool)

(declare-fun res!676905 () Bool)

(assert (=> b!1008015 (=> (not res!676905) (not e!567230))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63564 (_ BitVec 32)) Bool)

(assert (=> b!1008015 (= res!676905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1008016 () Bool)

(declare-fun e!567233 () Bool)

(assert (=> b!1008016 (= e!567233 e!567235)))

(declare-fun res!676910 () Bool)

(assert (=> b!1008016 (=> (not res!676910) (not e!567235))))

(assert (=> b!1008016 (= res!676910 (not (= lt!445487 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445486 mask!3464) lt!445486 lt!445488 mask!3464))))))

(declare-fun k!2224 () (_ BitVec 64))

(assert (=> b!1008016 (= lt!445486 (select (store (arr!30603 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1008016 (= lt!445488 (array!63565 (store (arr!30603 a!3219) i!1194 k!2224) (size!31105 a!3219)))))

(declare-fun b!1008017 () Bool)

(assert (=> b!1008017 (= e!567235 false)))

(declare-fun lt!445490 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008017 (= lt!445490 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1008018 () Bool)

(declare-fun res!676914 () Bool)

(assert (=> b!1008018 (=> (not res!676914) (not e!567234))))

(declare-fun arrayContainsKey!0 (array!63564 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1008018 (= res!676914 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1008019 () Bool)

(declare-fun res!676904 () Bool)

(assert (=> b!1008019 (=> (not res!676904) (not e!567234))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1008019 (= res!676904 (validKeyInArray!0 (select (arr!30603 a!3219) j!170)))))

(declare-fun b!1008020 () Bool)

(declare-fun res!676912 () Bool)

(assert (=> b!1008020 (=> (not res!676912) (not e!567230))))

(declare-datatypes ((List!21279 0))(
  ( (Nil!21276) (Cons!21275 (h!22461 (_ BitVec 64)) (t!30280 List!21279)) )
))
(declare-fun arrayNoDuplicates!0 (array!63564 (_ BitVec 32) List!21279) Bool)

(assert (=> b!1008020 (= res!676912 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21276))))

(declare-fun b!1008021 () Bool)

(declare-fun res!676907 () Bool)

(assert (=> b!1008021 (=> (not res!676907) (not e!567230))))

(assert (=> b!1008021 (= res!676907 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31105 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31105 a!3219))))))

(declare-fun b!1008022 () Bool)

(assert (=> b!1008022 (= e!567234 e!567230)))

(declare-fun res!676909 () Bool)

(assert (=> b!1008022 (=> (not res!676909) (not e!567230))))

(declare-fun lt!445489 () SeekEntryResult!9535)

(assert (=> b!1008022 (= res!676909 (or (= lt!445489 (MissingVacant!9535 i!1194)) (= lt!445489 (MissingZero!9535 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63564 (_ BitVec 32)) SeekEntryResult!9535)

(assert (=> b!1008022 (= lt!445489 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1008023 () Bool)

(declare-fun res!676917 () Bool)

(assert (=> b!1008023 (=> (not res!676917) (not e!567234))))

(assert (=> b!1008023 (= res!676917 (validKeyInArray!0 k!2224))))

(declare-fun b!1008024 () Bool)

(assert (=> b!1008024 (= e!567232 e!567233)))

(declare-fun res!676908 () Bool)

(assert (=> b!1008024 (=> (not res!676908) (not e!567233))))

(assert (=> b!1008024 (= res!676908 (= lt!445484 lt!445485))))

(assert (=> b!1008024 (= lt!445484 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30603 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and start!86916 res!676913) b!1008011))

(assert (= (and b!1008011 res!676911) b!1008019))

(assert (= (and b!1008019 res!676904) b!1008023))

(assert (= (and b!1008023 res!676917) b!1008018))

(assert (= (and b!1008018 res!676914) b!1008022))

(assert (= (and b!1008022 res!676909) b!1008015))

(assert (= (and b!1008015 res!676905) b!1008020))

(assert (= (and b!1008020 res!676912) b!1008021))

(assert (= (and b!1008021 res!676907) b!1008013))

(assert (= (and b!1008013 res!676916) b!1008024))

(assert (= (and b!1008024 res!676908) b!1008016))

(assert (= (and b!1008016 res!676910) b!1008012))

(assert (= (and b!1008012 res!676906) b!1008014))

(assert (= (and b!1008014 res!676915) b!1008017))

(declare-fun m!932819 () Bool)

(assert (=> b!1008016 m!932819))

(assert (=> b!1008016 m!932819))

(declare-fun m!932821 () Bool)

(assert (=> b!1008016 m!932821))

(declare-fun m!932823 () Bool)

(assert (=> b!1008016 m!932823))

(declare-fun m!932825 () Bool)

(assert (=> b!1008016 m!932825))

(declare-fun m!932827 () Bool)

(assert (=> b!1008015 m!932827))

(declare-fun m!932829 () Bool)

(assert (=> b!1008023 m!932829))

(declare-fun m!932831 () Bool)

(assert (=> b!1008024 m!932831))

(assert (=> b!1008024 m!932831))

(declare-fun m!932833 () Bool)

(assert (=> b!1008024 m!932833))

(declare-fun m!932835 () Bool)

(assert (=> b!1008017 m!932835))

(declare-fun m!932837 () Bool)

(assert (=> b!1008022 m!932837))

(declare-fun m!932839 () Bool)

(assert (=> b!1008020 m!932839))

(declare-fun m!932841 () Bool)

(assert (=> b!1008018 m!932841))

(assert (=> b!1008013 m!932831))

(assert (=> b!1008013 m!932831))

(declare-fun m!932843 () Bool)

(assert (=> b!1008013 m!932843))

(assert (=> b!1008013 m!932843))

(assert (=> b!1008013 m!932831))

(declare-fun m!932845 () Bool)

(assert (=> b!1008013 m!932845))

(declare-fun m!932847 () Bool)

(assert (=> b!1008012 m!932847))

(declare-fun m!932849 () Bool)

(assert (=> start!86916 m!932849))

(declare-fun m!932851 () Bool)

(assert (=> start!86916 m!932851))

(assert (=> b!1008019 m!932831))

(assert (=> b!1008019 m!932831))

(declare-fun m!932853 () Bool)

(assert (=> b!1008019 m!932853))

(push 1)

