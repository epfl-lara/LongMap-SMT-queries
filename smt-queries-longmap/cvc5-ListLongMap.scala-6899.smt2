; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86756 () Bool)

(assert start!86756)

(declare-fun b!1005750 () Bool)

(declare-fun res!674840 () Bool)

(declare-fun e!566263 () Bool)

(assert (=> b!1005750 (=> (not res!674840) (not e!566263))))

(declare-datatypes ((array!63455 0))(
  ( (array!63456 (arr!30550 (Array (_ BitVec 32) (_ BitVec 64))) (size!31052 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63455)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63455 (_ BitVec 32)) Bool)

(assert (=> b!1005750 (= res!674840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1005751 () Bool)

(declare-fun res!674847 () Bool)

(declare-fun e!566261 () Bool)

(assert (=> b!1005751 (=> (not res!674847) (not e!566261))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63455 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1005751 (= res!674847 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1005752 () Bool)

(declare-fun res!674839 () Bool)

(assert (=> b!1005752 (=> (not res!674839) (not e!566261))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1005752 (= res!674839 (validKeyInArray!0 (select (arr!30550 a!3219) j!170)))))

(declare-fun res!674845 () Bool)

(assert (=> start!86756 (=> (not res!674845) (not e!566261))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86756 (= res!674845 (validMask!0 mask!3464))))

(assert (=> start!86756 e!566261))

(declare-fun array_inv!23674 (array!63455) Bool)

(assert (=> start!86756 (array_inv!23674 a!3219)))

(assert (=> start!86756 true))

(declare-fun b!1005753 () Bool)

(declare-fun res!674842 () Bool)

(assert (=> b!1005753 (=> (not res!674842) (not e!566263))))

(declare-datatypes ((List!21226 0))(
  ( (Nil!21223) (Cons!21222 (h!22405 (_ BitVec 64)) (t!30227 List!21226)) )
))
(declare-fun arrayNoDuplicates!0 (array!63455 (_ BitVec 32) List!21226) Bool)

(assert (=> b!1005753 (= res!674842 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21223))))

(declare-fun b!1005754 () Bool)

(assert (=> b!1005754 (= e!566263 false)))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9482 0))(
  ( (MissingZero!9482 (index!40299 (_ BitVec 32))) (Found!9482 (index!40300 (_ BitVec 32))) (Intermediate!9482 (undefined!10294 Bool) (index!40301 (_ BitVec 32)) (x!87706 (_ BitVec 32))) (Undefined!9482) (MissingVacant!9482 (index!40302 (_ BitVec 32))) )
))
(declare-fun lt!444616 () SeekEntryResult!9482)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63455 (_ BitVec 32)) SeekEntryResult!9482)

(assert (=> b!1005754 (= lt!444616 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30550 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1005755 () Bool)

(declare-fun res!674838 () Bool)

(assert (=> b!1005755 (=> (not res!674838) (not e!566263))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1005755 (= res!674838 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31052 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31052 a!3219))))))

(declare-fun b!1005756 () Bool)

(assert (=> b!1005756 (= e!566261 e!566263)))

(declare-fun res!674844 () Bool)

(assert (=> b!1005756 (=> (not res!674844) (not e!566263))))

(declare-fun lt!444617 () SeekEntryResult!9482)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1005756 (= res!674844 (or (= lt!444617 (MissingVacant!9482 i!1194)) (= lt!444617 (MissingZero!9482 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63455 (_ BitVec 32)) SeekEntryResult!9482)

(assert (=> b!1005756 (= lt!444617 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1005757 () Bool)

(declare-fun res!674841 () Bool)

(assert (=> b!1005757 (=> (not res!674841) (not e!566261))))

(assert (=> b!1005757 (= res!674841 (validKeyInArray!0 k!2224))))

(declare-fun b!1005758 () Bool)

(declare-fun res!674843 () Bool)

(assert (=> b!1005758 (=> (not res!674843) (not e!566261))))

(assert (=> b!1005758 (= res!674843 (and (= (size!31052 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31052 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31052 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1005759 () Bool)

(declare-fun res!674846 () Bool)

(assert (=> b!1005759 (=> (not res!674846) (not e!566263))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005759 (= res!674846 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30550 a!3219) j!170) mask!3464) (select (arr!30550 a!3219) j!170) a!3219 mask!3464) (Intermediate!9482 false resIndex!38 resX!38)))))

(assert (= (and start!86756 res!674845) b!1005758))

(assert (= (and b!1005758 res!674843) b!1005752))

(assert (= (and b!1005752 res!674839) b!1005757))

(assert (= (and b!1005757 res!674841) b!1005751))

(assert (= (and b!1005751 res!674847) b!1005756))

(assert (= (and b!1005756 res!674844) b!1005750))

(assert (= (and b!1005750 res!674840) b!1005753))

(assert (= (and b!1005753 res!674842) b!1005755))

(assert (= (and b!1005755 res!674838) b!1005759))

(assert (= (and b!1005759 res!674846) b!1005754))

(declare-fun m!930929 () Bool)

(assert (=> start!86756 m!930929))

(declare-fun m!930931 () Bool)

(assert (=> start!86756 m!930931))

(declare-fun m!930933 () Bool)

(assert (=> b!1005753 m!930933))

(declare-fun m!930935 () Bool)

(assert (=> b!1005751 m!930935))

(declare-fun m!930937 () Bool)

(assert (=> b!1005752 m!930937))

(assert (=> b!1005752 m!930937))

(declare-fun m!930939 () Bool)

(assert (=> b!1005752 m!930939))

(declare-fun m!930941 () Bool)

(assert (=> b!1005756 m!930941))

(assert (=> b!1005759 m!930937))

(assert (=> b!1005759 m!930937))

(declare-fun m!930943 () Bool)

(assert (=> b!1005759 m!930943))

(assert (=> b!1005759 m!930943))

(assert (=> b!1005759 m!930937))

(declare-fun m!930945 () Bool)

(assert (=> b!1005759 m!930945))

(declare-fun m!930947 () Bool)

(assert (=> b!1005757 m!930947))

(assert (=> b!1005754 m!930937))

(assert (=> b!1005754 m!930937))

(declare-fun m!930949 () Bool)

(assert (=> b!1005754 m!930949))

(declare-fun m!930951 () Bool)

(assert (=> b!1005750 m!930951))

(push 1)

