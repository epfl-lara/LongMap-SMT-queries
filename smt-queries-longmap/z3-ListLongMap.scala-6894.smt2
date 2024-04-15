; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86718 () Bool)

(assert start!86718)

(declare-fun b!1005121 () Bool)

(declare-fun e!565996 () Bool)

(assert (=> b!1005121 (= e!565996 false)))

(declare-fun lt!444294 () Bool)

(declare-datatypes ((array!63364 0))(
  ( (array!63365 (arr!30504 (Array (_ BitVec 32) (_ BitVec 64))) (size!31008 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63364)

(declare-datatypes ((List!21246 0))(
  ( (Nil!21243) (Cons!21242 (h!22425 (_ BitVec 64)) (t!30238 List!21246)) )
))
(declare-fun arrayNoDuplicates!0 (array!63364 (_ BitVec 32) List!21246) Bool)

(assert (=> b!1005121 (= lt!444294 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21243))))

(declare-fun b!1005122 () Bool)

(declare-fun res!674334 () Bool)

(declare-fun e!565995 () Bool)

(assert (=> b!1005122 (=> (not res!674334) (not e!565995))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1005122 (= res!674334 (validKeyInArray!0 (select (arr!30504 a!3219) j!170)))))

(declare-fun b!1005123 () Bool)

(declare-fun res!674339 () Bool)

(assert (=> b!1005123 (=> (not res!674339) (not e!565996))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63364 (_ BitVec 32)) Bool)

(assert (=> b!1005123 (= res!674339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1005124 () Bool)

(declare-fun res!674338 () Bool)

(assert (=> b!1005124 (=> (not res!674338) (not e!565995))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63364 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1005124 (= res!674338 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1005125 () Bool)

(assert (=> b!1005125 (= e!565995 e!565996)))

(declare-fun res!674337 () Bool)

(assert (=> b!1005125 (=> (not res!674337) (not e!565996))))

(declare-datatypes ((SeekEntryResult!9461 0))(
  ( (MissingZero!9461 (index!40215 (_ BitVec 32))) (Found!9461 (index!40216 (_ BitVec 32))) (Intermediate!9461 (undefined!10273 Bool) (index!40217 (_ BitVec 32)) (x!87640 (_ BitVec 32))) (Undefined!9461) (MissingVacant!9461 (index!40218 (_ BitVec 32))) )
))
(declare-fun lt!444295 () SeekEntryResult!9461)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1005125 (= res!674337 (or (= lt!444295 (MissingVacant!9461 i!1194)) (= lt!444295 (MissingZero!9461 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63364 (_ BitVec 32)) SeekEntryResult!9461)

(assert (=> b!1005125 (= lt!444295 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1005126 () Bool)

(declare-fun res!674335 () Bool)

(assert (=> b!1005126 (=> (not res!674335) (not e!565995))))

(assert (=> b!1005126 (= res!674335 (validKeyInArray!0 k0!2224))))

(declare-fun b!1005127 () Bool)

(declare-fun res!674336 () Bool)

(assert (=> b!1005127 (=> (not res!674336) (not e!565995))))

(assert (=> b!1005127 (= res!674336 (and (= (size!31008 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31008 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31008 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!674333 () Bool)

(assert (=> start!86718 (=> (not res!674333) (not e!565995))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86718 (= res!674333 (validMask!0 mask!3464))))

(assert (=> start!86718 e!565995))

(declare-fun array_inv!23647 (array!63364) Bool)

(assert (=> start!86718 (array_inv!23647 a!3219)))

(assert (=> start!86718 true))

(assert (= (and start!86718 res!674333) b!1005127))

(assert (= (and b!1005127 res!674336) b!1005122))

(assert (= (and b!1005122 res!674334) b!1005126))

(assert (= (and b!1005126 res!674335) b!1005124))

(assert (= (and b!1005124 res!674338) b!1005125))

(assert (= (and b!1005125 res!674337) b!1005123))

(assert (= (and b!1005123 res!674339) b!1005121))

(declare-fun m!929875 () Bool)

(assert (=> b!1005124 m!929875))

(declare-fun m!929877 () Bool)

(assert (=> b!1005122 m!929877))

(assert (=> b!1005122 m!929877))

(declare-fun m!929879 () Bool)

(assert (=> b!1005122 m!929879))

(declare-fun m!929881 () Bool)

(assert (=> start!86718 m!929881))

(declare-fun m!929883 () Bool)

(assert (=> start!86718 m!929883))

(declare-fun m!929885 () Bool)

(assert (=> b!1005126 m!929885))

(declare-fun m!929887 () Bool)

(assert (=> b!1005121 m!929887))

(declare-fun m!929889 () Bool)

(assert (=> b!1005125 m!929889))

(declare-fun m!929891 () Bool)

(assert (=> b!1005123 m!929891))

(check-sat (not b!1005126) (not start!86718) (not b!1005123) (not b!1005124) (not b!1005125) (not b!1005121) (not b!1005122))
(check-sat)
