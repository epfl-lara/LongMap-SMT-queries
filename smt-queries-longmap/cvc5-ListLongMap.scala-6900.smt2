; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86762 () Bool)

(assert start!86762)

(declare-fun b!1005840 () Bool)

(declare-fun res!674930 () Bool)

(declare-fun e!566290 () Bool)

(assert (=> b!1005840 (=> (not res!674930) (not e!566290))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1005840 (= res!674930 (validKeyInArray!0 k!2224))))

(declare-fun b!1005841 () Bool)

(declare-fun e!566289 () Bool)

(assert (=> b!1005841 (= e!566289 false)))

(declare-datatypes ((array!63461 0))(
  ( (array!63462 (arr!30553 (Array (_ BitVec 32) (_ BitVec 64))) (size!31055 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63461)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9485 0))(
  ( (MissingZero!9485 (index!40311 (_ BitVec 32))) (Found!9485 (index!40312 (_ BitVec 32))) (Intermediate!9485 (undefined!10297 Bool) (index!40313 (_ BitVec 32)) (x!87717 (_ BitVec 32))) (Undefined!9485) (MissingVacant!9485 (index!40314 (_ BitVec 32))) )
))
(declare-fun lt!444635 () SeekEntryResult!9485)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63461 (_ BitVec 32)) SeekEntryResult!9485)

(assert (=> b!1005841 (= lt!444635 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30553 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1005842 () Bool)

(declare-fun res!674937 () Bool)

(assert (=> b!1005842 (=> (not res!674937) (not e!566290))))

(assert (=> b!1005842 (= res!674937 (validKeyInArray!0 (select (arr!30553 a!3219) j!170)))))

(declare-fun b!1005843 () Bool)

(declare-fun res!674929 () Bool)

(assert (=> b!1005843 (=> (not res!674929) (not e!566289))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63461 (_ BitVec 32)) Bool)

(assert (=> b!1005843 (= res!674929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1005844 () Bool)

(declare-fun res!674928 () Bool)

(assert (=> b!1005844 (=> (not res!674928) (not e!566290))))

(declare-fun arrayContainsKey!0 (array!63461 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1005844 (= res!674928 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun res!674933 () Bool)

(assert (=> start!86762 (=> (not res!674933) (not e!566290))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86762 (= res!674933 (validMask!0 mask!3464))))

(assert (=> start!86762 e!566290))

(declare-fun array_inv!23677 (array!63461) Bool)

(assert (=> start!86762 (array_inv!23677 a!3219)))

(assert (=> start!86762 true))

(declare-fun b!1005845 () Bool)

(declare-fun res!674934 () Bool)

(assert (=> b!1005845 (=> (not res!674934) (not e!566290))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1005845 (= res!674934 (and (= (size!31055 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31055 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31055 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1005846 () Bool)

(declare-fun res!674936 () Bool)

(assert (=> b!1005846 (=> (not res!674936) (not e!566289))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005846 (= res!674936 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30553 a!3219) j!170) mask!3464) (select (arr!30553 a!3219) j!170) a!3219 mask!3464) (Intermediate!9485 false resIndex!38 resX!38)))))

(declare-fun b!1005847 () Bool)

(assert (=> b!1005847 (= e!566290 e!566289)))

(declare-fun res!674931 () Bool)

(assert (=> b!1005847 (=> (not res!674931) (not e!566289))))

(declare-fun lt!444634 () SeekEntryResult!9485)

(assert (=> b!1005847 (= res!674931 (or (= lt!444634 (MissingVacant!9485 i!1194)) (= lt!444634 (MissingZero!9485 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63461 (_ BitVec 32)) SeekEntryResult!9485)

(assert (=> b!1005847 (= lt!444634 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1005848 () Bool)

(declare-fun res!674932 () Bool)

(assert (=> b!1005848 (=> (not res!674932) (not e!566289))))

(declare-datatypes ((List!21229 0))(
  ( (Nil!21226) (Cons!21225 (h!22408 (_ BitVec 64)) (t!30230 List!21229)) )
))
(declare-fun arrayNoDuplicates!0 (array!63461 (_ BitVec 32) List!21229) Bool)

(assert (=> b!1005848 (= res!674932 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21226))))

(declare-fun b!1005849 () Bool)

(declare-fun res!674935 () Bool)

(assert (=> b!1005849 (=> (not res!674935) (not e!566289))))

(assert (=> b!1005849 (= res!674935 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31055 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31055 a!3219))))))

(assert (= (and start!86762 res!674933) b!1005845))

(assert (= (and b!1005845 res!674934) b!1005842))

(assert (= (and b!1005842 res!674937) b!1005840))

(assert (= (and b!1005840 res!674930) b!1005844))

(assert (= (and b!1005844 res!674928) b!1005847))

(assert (= (and b!1005847 res!674931) b!1005843))

(assert (= (and b!1005843 res!674929) b!1005848))

(assert (= (and b!1005848 res!674932) b!1005849))

(assert (= (and b!1005849 res!674935) b!1005846))

(assert (= (and b!1005846 res!674936) b!1005841))

(declare-fun m!931001 () Bool)

(assert (=> b!1005843 m!931001))

(declare-fun m!931003 () Bool)

(assert (=> b!1005848 m!931003))

(declare-fun m!931005 () Bool)

(assert (=> b!1005842 m!931005))

(assert (=> b!1005842 m!931005))

(declare-fun m!931007 () Bool)

(assert (=> b!1005842 m!931007))

(assert (=> b!1005846 m!931005))

(assert (=> b!1005846 m!931005))

(declare-fun m!931009 () Bool)

(assert (=> b!1005846 m!931009))

(assert (=> b!1005846 m!931009))

(assert (=> b!1005846 m!931005))

(declare-fun m!931011 () Bool)

(assert (=> b!1005846 m!931011))

(declare-fun m!931013 () Bool)

(assert (=> b!1005840 m!931013))

(assert (=> b!1005841 m!931005))

(assert (=> b!1005841 m!931005))

(declare-fun m!931015 () Bool)

(assert (=> b!1005841 m!931015))

(declare-fun m!931017 () Bool)

(assert (=> b!1005847 m!931017))

(declare-fun m!931019 () Bool)

(assert (=> start!86762 m!931019))

(declare-fun m!931021 () Bool)

(assert (=> start!86762 m!931021))

(declare-fun m!931023 () Bool)

(assert (=> b!1005844 m!931023))

(push 1)

