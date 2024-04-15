; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27098 () Bool)

(assert start!27098)

(declare-fun b!279839 () Bool)

(declare-fun res!142971 () Bool)

(declare-fun e!178333 () Bool)

(assert (=> b!279839 (=> (not res!142971) (not e!178333))))

(declare-datatypes ((List!4375 0))(
  ( (Nil!4372) (Cons!4371 (h!5041 (_ BitVec 64)) (t!9448 List!4375)) )
))
(declare-fun contains!1954 (List!4375 (_ BitVec 64)) Bool)

(assert (=> b!279839 (= res!142971 (not (contains!1954 Nil!4372 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!142965 () Bool)

(declare-fun e!178334 () Bool)

(assert (=> start!27098 (=> (not res!142965) (not e!178334))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27098 (= res!142965 (validMask!0 mask!3868))))

(assert (=> start!27098 e!178334))

(declare-datatypes ((array!13905 0))(
  ( (array!13906 (arr!6594 (Array (_ BitVec 32) (_ BitVec 64))) (size!6947 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13905)

(declare-fun array_inv!4566 (array!13905) Bool)

(assert (=> start!27098 (array_inv!4566 a!3325)))

(assert (=> start!27098 true))

(declare-fun b!279840 () Bool)

(declare-fun res!142969 () Bool)

(assert (=> b!279840 (=> (not res!142969) (not e!178334))))

(declare-fun arrayNoDuplicates!0 (array!13905 (_ BitVec 32) List!4375) Bool)

(assert (=> b!279840 (= res!142969 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4372))))

(declare-fun b!279841 () Bool)

(assert (=> b!279841 (= e!178334 e!178333)))

(declare-fun res!142960 () Bool)

(assert (=> b!279841 (=> (not res!142960) (not e!178333))))

(declare-datatypes ((SeekEntryResult!1751 0))(
  ( (MissingZero!1751 (index!9174 (_ BitVec 32))) (Found!1751 (index!9175 (_ BitVec 32))) (Intermediate!1751 (undefined!2563 Bool) (index!9176 (_ BitVec 32)) (x!27436 (_ BitVec 32))) (Undefined!1751) (MissingVacant!1751 (index!9177 (_ BitVec 32))) )
))
(declare-fun lt!138575 () SeekEntryResult!1751)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!279841 (= res!142960 (or (= lt!138575 (MissingZero!1751 i!1267)) (= lt!138575 (MissingVacant!1751 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13905 (_ BitVec 32)) SeekEntryResult!1751)

(assert (=> b!279841 (= lt!138575 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!279842 () Bool)

(declare-fun res!142964 () Bool)

(assert (=> b!279842 (=> (not res!142964) (not e!178333))))

(assert (=> b!279842 (= res!142964 (not (contains!1954 Nil!4372 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!279843 () Bool)

(declare-fun res!142963 () Bool)

(assert (=> b!279843 (=> (not res!142963) (not e!178334))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!279843 (= res!142963 (and (= (size!6947 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6947 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6947 a!3325))))))

(declare-fun b!279844 () Bool)

(declare-fun res!142970 () Bool)

(assert (=> b!279844 (=> (not res!142970) (not e!178334))))

(declare-fun arrayContainsKey!0 (array!13905 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!279844 (= res!142970 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!279845 () Bool)

(assert (=> b!279845 (= e!178333 false)))

(declare-fun lt!138576 () Bool)

(assert (=> b!279845 (= lt!138576 (contains!1954 Nil!4372 k0!2581))))

(declare-fun b!279846 () Bool)

(declare-fun res!142962 () Bool)

(assert (=> b!279846 (=> (not res!142962) (not e!178334))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!279846 (= res!142962 (validKeyInArray!0 k0!2581))))

(declare-fun b!279847 () Bool)

(declare-fun res!142968 () Bool)

(assert (=> b!279847 (=> (not res!142968) (not e!178333))))

(assert (=> b!279847 (= res!142968 (and (bvslt (size!6947 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6947 a!3325))))))

(declare-fun b!279848 () Bool)

(declare-fun res!142966 () Bool)

(assert (=> b!279848 (=> (not res!142966) (not e!178333))))

(assert (=> b!279848 (= res!142966 (not (= startIndex!26 i!1267)))))

(declare-fun b!279849 () Bool)

(declare-fun res!142967 () Bool)

(assert (=> b!279849 (=> (not res!142967) (not e!178333))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13905 (_ BitVec 32)) Bool)

(assert (=> b!279849 (= res!142967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!279850 () Bool)

(declare-fun res!142961 () Bool)

(assert (=> b!279850 (=> (not res!142961) (not e!178333))))

(declare-fun noDuplicate!163 (List!4375) Bool)

(assert (=> b!279850 (= res!142961 (noDuplicate!163 Nil!4372))))

(declare-fun b!279851 () Bool)

(declare-fun res!142972 () Bool)

(assert (=> b!279851 (=> (not res!142972) (not e!178333))))

(assert (=> b!279851 (= res!142972 (validKeyInArray!0 (select (arr!6594 a!3325) startIndex!26)))))

(assert (= (and start!27098 res!142965) b!279843))

(assert (= (and b!279843 res!142963) b!279846))

(assert (= (and b!279846 res!142962) b!279840))

(assert (= (and b!279840 res!142969) b!279844))

(assert (= (and b!279844 res!142970) b!279841))

(assert (= (and b!279841 res!142960) b!279849))

(assert (= (and b!279849 res!142967) b!279848))

(assert (= (and b!279848 res!142966) b!279851))

(assert (= (and b!279851 res!142972) b!279847))

(assert (= (and b!279847 res!142968) b!279850))

(assert (= (and b!279850 res!142961) b!279839))

(assert (= (and b!279839 res!142971) b!279842))

(assert (= (and b!279842 res!142964) b!279845))

(declare-fun m!293975 () Bool)

(assert (=> b!279840 m!293975))

(declare-fun m!293977 () Bool)

(assert (=> b!279850 m!293977))

(declare-fun m!293979 () Bool)

(assert (=> start!27098 m!293979))

(declare-fun m!293981 () Bool)

(assert (=> start!27098 m!293981))

(declare-fun m!293983 () Bool)

(assert (=> b!279851 m!293983))

(assert (=> b!279851 m!293983))

(declare-fun m!293985 () Bool)

(assert (=> b!279851 m!293985))

(declare-fun m!293987 () Bool)

(assert (=> b!279845 m!293987))

(declare-fun m!293989 () Bool)

(assert (=> b!279842 m!293989))

(declare-fun m!293991 () Bool)

(assert (=> b!279839 m!293991))

(declare-fun m!293993 () Bool)

(assert (=> b!279849 m!293993))

(declare-fun m!293995 () Bool)

(assert (=> b!279841 m!293995))

(declare-fun m!293997 () Bool)

(assert (=> b!279844 m!293997))

(declare-fun m!293999 () Bool)

(assert (=> b!279846 m!293999))

(check-sat (not b!279841) (not b!279844) (not b!279842) (not b!279849) (not b!279845) (not b!279839) (not b!279846) (not b!279840) (not start!27098) (not b!279850) (not b!279851))
(check-sat)
