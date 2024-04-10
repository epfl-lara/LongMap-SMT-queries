; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27092 () Bool)

(assert start!27092)

(declare-fun b!279908 () Bool)

(declare-fun res!142988 () Bool)

(declare-fun e!178417 () Bool)

(assert (=> b!279908 (=> (not res!142988) (not e!178417))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!279908 (= res!142988 (not (= startIndex!26 i!1267)))))

(declare-fun b!279909 () Bool)

(declare-fun res!142977 () Bool)

(declare-fun e!178418 () Bool)

(assert (=> b!279909 (=> (not res!142977) (not e!178418))))

(declare-datatypes ((array!13910 0))(
  ( (array!13911 (arr!6597 (Array (_ BitVec 32) (_ BitVec 64))) (size!6949 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13910)

(declare-datatypes ((List!4405 0))(
  ( (Nil!4402) (Cons!4401 (h!5071 (_ BitVec 64)) (t!9487 List!4405)) )
))
(declare-fun arrayNoDuplicates!0 (array!13910 (_ BitVec 32) List!4405) Bool)

(assert (=> b!279909 (= res!142977 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4402))))

(declare-fun b!279910 () Bool)

(declare-fun res!142989 () Bool)

(assert (=> b!279910 (=> (not res!142989) (not e!178417))))

(declare-fun noDuplicate!159 (List!4405) Bool)

(assert (=> b!279910 (= res!142989 (noDuplicate!159 Nil!4402))))

(declare-fun b!279912 () Bool)

(declare-fun res!142982 () Bool)

(assert (=> b!279912 (=> (not res!142982) (not e!178417))))

(declare-fun contains!1977 (List!4405 (_ BitVec 64)) Bool)

(assert (=> b!279912 (= res!142982 (not (contains!1977 Nil!4402 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!279913 () Bool)

(declare-fun res!142984 () Bool)

(assert (=> b!279913 (=> (not res!142984) (not e!178418))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13910 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!279913 (= res!142984 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!279914 () Bool)

(declare-fun res!142978 () Bool)

(assert (=> b!279914 (=> (not res!142978) (not e!178418))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!279914 (= res!142978 (validKeyInArray!0 k0!2581))))

(declare-fun b!279915 () Bool)

(declare-fun res!142979 () Bool)

(assert (=> b!279915 (=> (not res!142979) (not e!178417))))

(assert (=> b!279915 (= res!142979 (validKeyInArray!0 (select (arr!6597 a!3325) startIndex!26)))))

(declare-fun b!279916 () Bool)

(declare-fun res!142986 () Bool)

(assert (=> b!279916 (=> (not res!142986) (not e!178417))))

(assert (=> b!279916 (= res!142986 (and (bvslt (size!6949 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6949 a!3325))))))

(declare-fun b!279917 () Bool)

(declare-fun res!142981 () Bool)

(assert (=> b!279917 (=> (not res!142981) (not e!178417))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13910 (_ BitVec 32)) Bool)

(assert (=> b!279917 (= res!142981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!279918 () Bool)

(assert (=> b!279918 (= e!178418 e!178417)))

(declare-fun res!142980 () Bool)

(assert (=> b!279918 (=> (not res!142980) (not e!178417))))

(declare-datatypes ((SeekEntryResult!1755 0))(
  ( (MissingZero!1755 (index!9190 (_ BitVec 32))) (Found!1755 (index!9191 (_ BitVec 32))) (Intermediate!1755 (undefined!2567 Bool) (index!9192 (_ BitVec 32)) (x!27433 (_ BitVec 32))) (Undefined!1755) (MissingVacant!1755 (index!9193 (_ BitVec 32))) )
))
(declare-fun lt!138744 () SeekEntryResult!1755)

(assert (=> b!279918 (= res!142980 (or (= lt!138744 (MissingZero!1755 i!1267)) (= lt!138744 (MissingVacant!1755 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13910 (_ BitVec 32)) SeekEntryResult!1755)

(assert (=> b!279918 (= lt!138744 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!279911 () Bool)

(declare-fun res!142987 () Bool)

(assert (=> b!279911 (=> (not res!142987) (not e!178418))))

(assert (=> b!279911 (= res!142987 (and (= (size!6949 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6949 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6949 a!3325))))))

(declare-fun res!142985 () Bool)

(assert (=> start!27092 (=> (not res!142985) (not e!178418))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27092 (= res!142985 (validMask!0 mask!3868))))

(assert (=> start!27092 e!178418))

(declare-fun array_inv!4560 (array!13910) Bool)

(assert (=> start!27092 (array_inv!4560 a!3325)))

(assert (=> start!27092 true))

(declare-fun b!279919 () Bool)

(assert (=> b!279919 (= e!178417 false)))

(declare-fun lt!138745 () Bool)

(assert (=> b!279919 (= lt!138745 (contains!1977 Nil!4402 k0!2581))))

(declare-fun b!279920 () Bool)

(declare-fun res!142983 () Bool)

(assert (=> b!279920 (=> (not res!142983) (not e!178417))))

(assert (=> b!279920 (= res!142983 (not (contains!1977 Nil!4402 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!27092 res!142985) b!279911))

(assert (= (and b!279911 res!142987) b!279914))

(assert (= (and b!279914 res!142978) b!279909))

(assert (= (and b!279909 res!142977) b!279913))

(assert (= (and b!279913 res!142984) b!279918))

(assert (= (and b!279918 res!142980) b!279917))

(assert (= (and b!279917 res!142981) b!279908))

(assert (= (and b!279908 res!142988) b!279915))

(assert (= (and b!279915 res!142979) b!279916))

(assert (= (and b!279916 res!142986) b!279910))

(assert (= (and b!279910 res!142989) b!279920))

(assert (= (and b!279920 res!142983) b!279912))

(assert (= (and b!279912 res!142982) b!279919))

(declare-fun m!294515 () Bool)

(assert (=> b!279918 m!294515))

(declare-fun m!294517 () Bool)

(assert (=> start!27092 m!294517))

(declare-fun m!294519 () Bool)

(assert (=> start!27092 m!294519))

(declare-fun m!294521 () Bool)

(assert (=> b!279913 m!294521))

(declare-fun m!294523 () Bool)

(assert (=> b!279909 m!294523))

(declare-fun m!294525 () Bool)

(assert (=> b!279912 m!294525))

(declare-fun m!294527 () Bool)

(assert (=> b!279914 m!294527))

(declare-fun m!294529 () Bool)

(assert (=> b!279910 m!294529))

(declare-fun m!294531 () Bool)

(assert (=> b!279917 m!294531))

(declare-fun m!294533 () Bool)

(assert (=> b!279919 m!294533))

(declare-fun m!294535 () Bool)

(assert (=> b!279920 m!294535))

(declare-fun m!294537 () Bool)

(assert (=> b!279915 m!294537))

(assert (=> b!279915 m!294537))

(declare-fun m!294539 () Bool)

(assert (=> b!279915 m!294539))

(check-sat (not b!279915) (not b!279919) (not b!279910) (not b!279918) (not b!279914) (not b!279920) (not start!27092) (not b!279913) (not b!279909) (not b!279912) (not b!279917))
(check-sat)
