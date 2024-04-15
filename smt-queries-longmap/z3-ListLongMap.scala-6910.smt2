; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86868 () Bool)

(assert start!86868)

(declare-fun b!1006953 () Bool)

(declare-fun e!566739 () Bool)

(declare-fun e!566740 () Bool)

(assert (=> b!1006953 (= e!566739 e!566740)))

(declare-fun res!675982 () Bool)

(assert (=> b!1006953 (=> (not res!675982) (not e!566740))))

(declare-datatypes ((SeekEntryResult!9509 0))(
  ( (MissingZero!9509 (index!40407 (_ BitVec 32))) (Found!9509 (index!40408 (_ BitVec 32))) (Intermediate!9509 (undefined!10321 Bool) (index!40409 (_ BitVec 32)) (x!87822 (_ BitVec 32))) (Undefined!9509) (MissingVacant!9509 (index!40410 (_ BitVec 32))) )
))
(declare-fun lt!444835 () SeekEntryResult!9509)

(declare-fun lt!444836 () SeekEntryResult!9509)

(assert (=> b!1006953 (= res!675982 (= lt!444835 lt!444836))))

(declare-datatypes ((array!63463 0))(
  ( (array!63464 (arr!30552 (Array (_ BitVec 32) (_ BitVec 64))) (size!31056 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63463)

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63463 (_ BitVec 32)) SeekEntryResult!9509)

(assert (=> b!1006953 (= lt!444835 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30552 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1006954 () Bool)

(declare-fun res!675976 () Bool)

(declare-fun e!566741 () Bool)

(assert (=> b!1006954 (=> (not res!675976) (not e!566741))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63463 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1006954 (= res!675976 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1006955 () Bool)

(declare-fun e!566744 () Bool)

(assert (=> b!1006955 (= e!566741 e!566744)))

(declare-fun res!675981 () Bool)

(assert (=> b!1006955 (=> (not res!675981) (not e!566744))))

(declare-fun lt!444833 () SeekEntryResult!9509)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1006955 (= res!675981 (or (= lt!444833 (MissingVacant!9509 i!1194)) (= lt!444833 (MissingZero!9509 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63463 (_ BitVec 32)) SeekEntryResult!9509)

(assert (=> b!1006955 (= lt!444833 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1006956 () Bool)

(declare-fun res!675978 () Bool)

(declare-fun e!566742 () Bool)

(assert (=> b!1006956 (=> (not res!675978) (not e!566742))))

(declare-fun lt!444838 () array!63463)

(declare-fun lt!444832 () (_ BitVec 64))

(assert (=> b!1006956 (= res!675978 (not (= lt!444835 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444832 lt!444838 mask!3464))))))

(declare-fun b!1006957 () Bool)

(assert (=> b!1006957 (= e!566742 false)))

(declare-fun lt!444834 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1006957 (= lt!444834 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1006958 () Bool)

(declare-fun res!675977 () Bool)

(assert (=> b!1006958 (=> (not res!675977) (not e!566744))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63463 (_ BitVec 32)) Bool)

(assert (=> b!1006958 (= res!675977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1006959 () Bool)

(declare-fun res!675980 () Bool)

(assert (=> b!1006959 (=> (not res!675980) (not e!566744))))

(declare-datatypes ((List!21294 0))(
  ( (Nil!21291) (Cons!21290 (h!22476 (_ BitVec 64)) (t!30286 List!21294)) )
))
(declare-fun arrayNoDuplicates!0 (array!63463 (_ BitVec 32) List!21294) Bool)

(assert (=> b!1006959 (= res!675980 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21291))))

(declare-fun b!1006961 () Bool)

(declare-fun res!675975 () Bool)

(assert (=> b!1006961 (=> (not res!675975) (not e!566741))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1006961 (= res!675975 (validKeyInArray!0 (select (arr!30552 a!3219) j!170)))))

(declare-fun b!1006962 () Bool)

(assert (=> b!1006962 (= e!566740 e!566742)))

(declare-fun res!675983 () Bool)

(assert (=> b!1006962 (=> (not res!675983) (not e!566742))))

(declare-fun lt!444837 () SeekEntryResult!9509)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1006962 (= res!675983 (not (= lt!444837 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444832 mask!3464) lt!444832 lt!444838 mask!3464))))))

(assert (=> b!1006962 (= lt!444832 (select (store (arr!30552 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1006962 (= lt!444838 (array!63464 (store (arr!30552 a!3219) i!1194 k0!2224) (size!31056 a!3219)))))

(declare-fun b!1006960 () Bool)

(assert (=> b!1006960 (= e!566744 e!566739)))

(declare-fun res!675973 () Bool)

(assert (=> b!1006960 (=> (not res!675973) (not e!566739))))

(assert (=> b!1006960 (= res!675973 (= lt!444837 lt!444836))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1006960 (= lt!444836 (Intermediate!9509 false resIndex!38 resX!38))))

(assert (=> b!1006960 (= lt!444837 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30552 a!3219) j!170) mask!3464) (select (arr!30552 a!3219) j!170) a!3219 mask!3464))))

(declare-fun res!675970 () Bool)

(assert (=> start!86868 (=> (not res!675970) (not e!566741))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86868 (= res!675970 (validMask!0 mask!3464))))

(assert (=> start!86868 e!566741))

(declare-fun array_inv!23695 (array!63463) Bool)

(assert (=> start!86868 (array_inv!23695 a!3219)))

(assert (=> start!86868 true))

(declare-fun b!1006963 () Bool)

(declare-fun res!675974 () Bool)

(assert (=> b!1006963 (=> (not res!675974) (not e!566741))))

(assert (=> b!1006963 (= res!675974 (and (= (size!31056 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31056 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31056 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1006964 () Bool)

(declare-fun res!675979 () Bool)

(assert (=> b!1006964 (=> (not res!675979) (not e!566744))))

(assert (=> b!1006964 (= res!675979 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31056 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31056 a!3219))))))

(declare-fun b!1006965 () Bool)

(declare-fun res!675972 () Bool)

(assert (=> b!1006965 (=> (not res!675972) (not e!566742))))

(assert (=> b!1006965 (= res!675972 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1006966 () Bool)

(declare-fun res!675971 () Bool)

(assert (=> b!1006966 (=> (not res!675971) (not e!566741))))

(assert (=> b!1006966 (= res!675971 (validKeyInArray!0 k0!2224))))

(assert (= (and start!86868 res!675970) b!1006963))

(assert (= (and b!1006963 res!675974) b!1006961))

(assert (= (and b!1006961 res!675975) b!1006966))

(assert (= (and b!1006966 res!675971) b!1006954))

(assert (= (and b!1006954 res!675976) b!1006955))

(assert (= (and b!1006955 res!675981) b!1006958))

(assert (= (and b!1006958 res!675977) b!1006959))

(assert (= (and b!1006959 res!675980) b!1006964))

(assert (= (and b!1006964 res!675979) b!1006960))

(assert (= (and b!1006960 res!675973) b!1006953))

(assert (= (and b!1006953 res!675982) b!1006962))

(assert (= (and b!1006962 res!675983) b!1006956))

(assert (= (and b!1006956 res!675978) b!1006965))

(assert (= (and b!1006965 res!675972) b!1006957))

(declare-fun m!931369 () Bool)

(assert (=> b!1006966 m!931369))

(declare-fun m!931371 () Bool)

(assert (=> b!1006953 m!931371))

(assert (=> b!1006953 m!931371))

(declare-fun m!931373 () Bool)

(assert (=> b!1006953 m!931373))

(declare-fun m!931375 () Bool)

(assert (=> b!1006958 m!931375))

(declare-fun m!931377 () Bool)

(assert (=> b!1006956 m!931377))

(assert (=> b!1006960 m!931371))

(assert (=> b!1006960 m!931371))

(declare-fun m!931379 () Bool)

(assert (=> b!1006960 m!931379))

(assert (=> b!1006960 m!931379))

(assert (=> b!1006960 m!931371))

(declare-fun m!931381 () Bool)

(assert (=> b!1006960 m!931381))

(declare-fun m!931383 () Bool)

(assert (=> b!1006955 m!931383))

(declare-fun m!931385 () Bool)

(assert (=> b!1006957 m!931385))

(declare-fun m!931387 () Bool)

(assert (=> b!1006954 m!931387))

(declare-fun m!931389 () Bool)

(assert (=> b!1006959 m!931389))

(declare-fun m!931391 () Bool)

(assert (=> start!86868 m!931391))

(declare-fun m!931393 () Bool)

(assert (=> start!86868 m!931393))

(declare-fun m!931395 () Bool)

(assert (=> b!1006962 m!931395))

(assert (=> b!1006962 m!931395))

(declare-fun m!931397 () Bool)

(assert (=> b!1006962 m!931397))

(declare-fun m!931399 () Bool)

(assert (=> b!1006962 m!931399))

(declare-fun m!931401 () Bool)

(assert (=> b!1006962 m!931401))

(assert (=> b!1006961 m!931371))

(assert (=> b!1006961 m!931371))

(declare-fun m!931403 () Bool)

(assert (=> b!1006961 m!931403))

(check-sat (not b!1006956) (not start!86868) (not b!1006962) (not b!1006959) (not b!1006960) (not b!1006954) (not b!1006966) (not b!1006957) (not b!1006953) (not b!1006955) (not b!1006961) (not b!1006958))
(check-sat)
