; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86600 () Bool)

(assert start!86600)

(declare-fun b!1004349 () Bool)

(declare-fun e!565567 () Bool)

(declare-fun e!565573 () Bool)

(assert (=> b!1004349 (= e!565567 e!565573)))

(declare-fun res!673842 () Bool)

(assert (=> b!1004349 (=> (not res!673842) (not e!565573))))

(declare-datatypes ((SeekEntryResult!9458 0))(
  ( (MissingZero!9458 (index!40203 (_ BitVec 32))) (Found!9458 (index!40204 (_ BitVec 32))) (Intermediate!9458 (undefined!10270 Bool) (index!40205 (_ BitVec 32)) (x!87606 (_ BitVec 32))) (Undefined!9458) (MissingVacant!9458 (index!40206 (_ BitVec 32))) )
))
(declare-fun lt!444137 () SeekEntryResult!9458)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1004349 (= res!673842 (or (= lt!444137 (MissingVacant!9458 i!1194)) (= lt!444137 (MissingZero!9458 i!1194))))))

(declare-datatypes ((array!63401 0))(
  ( (array!63402 (arr!30526 (Array (_ BitVec 32) (_ BitVec 64))) (size!31028 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63401)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63401 (_ BitVec 32)) SeekEntryResult!9458)

(assert (=> b!1004349 (= lt!444137 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1004350 () Bool)

(declare-fun e!565571 () Bool)

(declare-fun e!565569 () Bool)

(assert (=> b!1004350 (= e!565571 e!565569)))

(declare-fun res!673839 () Bool)

(assert (=> b!1004350 (=> (not res!673839) (not e!565569))))

(declare-fun lt!444132 () (_ BitVec 64))

(declare-fun lt!444131 () SeekEntryResult!9458)

(declare-fun lt!444136 () array!63401)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63401 (_ BitVec 32)) SeekEntryResult!9458)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004350 (= res!673839 (not (= lt!444131 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444132 mask!3464) lt!444132 lt!444136 mask!3464))))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1004350 (= lt!444132 (select (store (arr!30526 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1004350 (= lt!444136 (array!63402 (store (arr!30526 a!3219) i!1194 k!2224) (size!31028 a!3219)))))

(declare-fun b!1004351 () Bool)

(declare-fun res!673841 () Bool)

(assert (=> b!1004351 (=> (not res!673841) (not e!565573))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1004351 (= res!673841 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31028 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31028 a!3219))))))

(declare-fun b!1004352 () Bool)

(declare-fun res!673835 () Bool)

(assert (=> b!1004352 (=> (not res!673835) (not e!565567))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1004352 (= res!673835 (validKeyInArray!0 k!2224))))

(declare-fun b!1004354 () Bool)

(declare-fun res!673838 () Bool)

(assert (=> b!1004354 (=> (not res!673838) (not e!565573))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63401 (_ BitVec 32)) Bool)

(assert (=> b!1004354 (= res!673838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1004355 () Bool)

(declare-fun res!673833 () Bool)

(assert (=> b!1004355 (=> (not res!673833) (not e!565569))))

(assert (=> b!1004355 (= res!673833 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1004356 () Bool)

(declare-fun res!673832 () Bool)

(declare-fun e!565568 () Bool)

(assert (=> b!1004356 (=> (not res!673832) (not e!565568))))

(declare-fun lt!444130 () (_ BitVec 32))

(declare-fun lt!444135 () SeekEntryResult!9458)

(assert (=> b!1004356 (= res!673832 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!444130 (select (arr!30526 a!3219) j!170) a!3219 mask!3464) lt!444135))))

(declare-fun b!1004357 () Bool)

(declare-fun e!565570 () Bool)

(assert (=> b!1004357 (= e!565573 e!565570)))

(declare-fun res!673827 () Bool)

(assert (=> b!1004357 (=> (not res!673827) (not e!565570))))

(assert (=> b!1004357 (= res!673827 (= lt!444131 lt!444135))))

(assert (=> b!1004357 (= lt!444135 (Intermediate!9458 false resIndex!38 resX!38))))

(assert (=> b!1004357 (= lt!444131 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30526 a!3219) j!170) mask!3464) (select (arr!30526 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004358 () Bool)

(declare-fun res!673830 () Bool)

(assert (=> b!1004358 (=> (not res!673830) (not e!565573))))

(declare-datatypes ((List!21202 0))(
  ( (Nil!21199) (Cons!21198 (h!22375 (_ BitVec 64)) (t!30203 List!21202)) )
))
(declare-fun arrayNoDuplicates!0 (array!63401 (_ BitVec 32) List!21202) Bool)

(assert (=> b!1004358 (= res!673830 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21199))))

(declare-fun b!1004359 () Bool)

(assert (=> b!1004359 (= e!565570 e!565571)))

(declare-fun res!673836 () Bool)

(assert (=> b!1004359 (=> (not res!673836) (not e!565571))))

(declare-fun lt!444134 () SeekEntryResult!9458)

(assert (=> b!1004359 (= res!673836 (= lt!444134 lt!444135))))

(assert (=> b!1004359 (= lt!444134 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30526 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004360 () Bool)

(declare-fun res!673840 () Bool)

(assert (=> b!1004360 (=> (not res!673840) (not e!565567))))

(assert (=> b!1004360 (= res!673840 (and (= (size!31028 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31028 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31028 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1004361 () Bool)

(declare-fun res!673831 () Bool)

(assert (=> b!1004361 (=> (not res!673831) (not e!565567))))

(declare-fun arrayContainsKey!0 (array!63401 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1004361 (= res!673831 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1004362 () Bool)

(assert (=> b!1004362 (= e!565568 false)))

(declare-fun lt!444133 () SeekEntryResult!9458)

(assert (=> b!1004362 (= lt!444133 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!444130 lt!444132 lt!444136 mask!3464))))

(declare-fun b!1004353 () Bool)

(assert (=> b!1004353 (= e!565569 e!565568)))

(declare-fun res!673829 () Bool)

(assert (=> b!1004353 (=> (not res!673829) (not e!565568))))

(assert (=> b!1004353 (= res!673829 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!444130 #b00000000000000000000000000000000) (bvslt lt!444130 (size!31028 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004353 (= lt!444130 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun res!673834 () Bool)

(assert (=> start!86600 (=> (not res!673834) (not e!565567))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86600 (= res!673834 (validMask!0 mask!3464))))

(assert (=> start!86600 e!565567))

(declare-fun array_inv!23650 (array!63401) Bool)

(assert (=> start!86600 (array_inv!23650 a!3219)))

(assert (=> start!86600 true))

(declare-fun b!1004363 () Bool)

(declare-fun res!673837 () Bool)

(assert (=> b!1004363 (=> (not res!673837) (not e!565567))))

(assert (=> b!1004363 (= res!673837 (validKeyInArray!0 (select (arr!30526 a!3219) j!170)))))

(declare-fun b!1004364 () Bool)

(declare-fun res!673828 () Bool)

(assert (=> b!1004364 (=> (not res!673828) (not e!565569))))

(assert (=> b!1004364 (= res!673828 (not (= lt!444134 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444132 lt!444136 mask!3464))))))

(assert (= (and start!86600 res!673834) b!1004360))

(assert (= (and b!1004360 res!673840) b!1004363))

(assert (= (and b!1004363 res!673837) b!1004352))

(assert (= (and b!1004352 res!673835) b!1004361))

(assert (= (and b!1004361 res!673831) b!1004349))

(assert (= (and b!1004349 res!673842) b!1004354))

(assert (= (and b!1004354 res!673838) b!1004358))

(assert (= (and b!1004358 res!673830) b!1004351))

(assert (= (and b!1004351 res!673841) b!1004357))

(assert (= (and b!1004357 res!673827) b!1004359))

(assert (= (and b!1004359 res!673836) b!1004350))

(assert (= (and b!1004350 res!673839) b!1004364))

(assert (= (and b!1004364 res!673828) b!1004355))

(assert (= (and b!1004355 res!673833) b!1004353))

(assert (= (and b!1004353 res!673829) b!1004356))

(assert (= (and b!1004356 res!673832) b!1004362))

(declare-fun m!929909 () Bool)

(assert (=> b!1004357 m!929909))

(assert (=> b!1004357 m!929909))

(declare-fun m!929911 () Bool)

(assert (=> b!1004357 m!929911))

(assert (=> b!1004357 m!929911))

(assert (=> b!1004357 m!929909))

(declare-fun m!929913 () Bool)

(assert (=> b!1004357 m!929913))

(declare-fun m!929915 () Bool)

(assert (=> b!1004352 m!929915))

(declare-fun m!929917 () Bool)

(assert (=> start!86600 m!929917))

(declare-fun m!929919 () Bool)

(assert (=> start!86600 m!929919))

(declare-fun m!929921 () Bool)

(assert (=> b!1004361 m!929921))

(assert (=> b!1004359 m!929909))

(assert (=> b!1004359 m!929909))

(declare-fun m!929923 () Bool)

(assert (=> b!1004359 m!929923))

(declare-fun m!929925 () Bool)

(assert (=> b!1004349 m!929925))

(declare-fun m!929927 () Bool)

(assert (=> b!1004354 m!929927))

(declare-fun m!929929 () Bool)

(assert (=> b!1004358 m!929929))

(declare-fun m!929931 () Bool)

(assert (=> b!1004362 m!929931))

(assert (=> b!1004363 m!929909))

(assert (=> b!1004363 m!929909))

(declare-fun m!929933 () Bool)

(assert (=> b!1004363 m!929933))

(assert (=> b!1004356 m!929909))

(assert (=> b!1004356 m!929909))

(declare-fun m!929935 () Bool)

(assert (=> b!1004356 m!929935))

(declare-fun m!929937 () Bool)

(assert (=> b!1004353 m!929937))

(declare-fun m!929939 () Bool)

(assert (=> b!1004350 m!929939))

(assert (=> b!1004350 m!929939))

(declare-fun m!929941 () Bool)

(assert (=> b!1004350 m!929941))

(declare-fun m!929943 () Bool)

(assert (=> b!1004350 m!929943))

(declare-fun m!929945 () Bool)

(assert (=> b!1004350 m!929945))

(declare-fun m!929947 () Bool)

(assert (=> b!1004364 m!929947))

(push 1)

