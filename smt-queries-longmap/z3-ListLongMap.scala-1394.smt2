; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27218 () Bool)

(assert start!27218)

(declare-fun b!281769 () Bool)

(declare-fun res!144838 () Bool)

(declare-fun e!179015 () Bool)

(assert (=> b!281769 (=> (not res!144838) (not e!179015))))

(declare-datatypes ((array!14036 0))(
  ( (array!14037 (arr!6660 (Array (_ BitVec 32) (_ BitVec 64))) (size!7012 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14036)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14036 (_ BitVec 32)) Bool)

(assert (=> b!281769 (= res!144838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!144843 () Bool)

(declare-fun e!179017 () Bool)

(assert (=> start!27218 (=> (not res!144843) (not e!179017))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27218 (= res!144843 (validMask!0 mask!3868))))

(assert (=> start!27218 e!179017))

(declare-fun array_inv!4623 (array!14036) Bool)

(assert (=> start!27218 (array_inv!4623 a!3325)))

(assert (=> start!27218 true))

(declare-fun b!281770 () Bool)

(declare-fun res!144842 () Bool)

(assert (=> b!281770 (=> (not res!144842) (not e!179017))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14036 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281770 (= res!144842 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281771 () Bool)

(declare-fun res!144841 () Bool)

(assert (=> b!281771 (=> (not res!144841) (not e!179017))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!281771 (= res!144841 (and (= (size!7012 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7012 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7012 a!3325))))))

(declare-fun b!281772 () Bool)

(declare-fun res!144846 () Bool)

(assert (=> b!281772 (=> (not res!144846) (not e!179017))))

(declare-datatypes ((List!4468 0))(
  ( (Nil!4465) (Cons!4464 (h!5134 (_ BitVec 64)) (t!9550 List!4468)) )
))
(declare-fun arrayNoDuplicates!0 (array!14036 (_ BitVec 32) List!4468) Bool)

(assert (=> b!281772 (= res!144846 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4465))))

(declare-fun b!281773 () Bool)

(assert (=> b!281773 (= e!179017 e!179015)))

(declare-fun res!144844 () Bool)

(assert (=> b!281773 (=> (not res!144844) (not e!179015))))

(declare-datatypes ((SeekEntryResult!1818 0))(
  ( (MissingZero!1818 (index!9442 (_ BitVec 32))) (Found!1818 (index!9443 (_ BitVec 32))) (Intermediate!1818 (undefined!2630 Bool) (index!9444 (_ BitVec 32)) (x!27664 (_ BitVec 32))) (Undefined!1818) (MissingVacant!1818 (index!9445 (_ BitVec 32))) )
))
(declare-fun lt!139188 () SeekEntryResult!1818)

(assert (=> b!281773 (= res!144844 (or (= lt!139188 (MissingZero!1818 i!1267)) (= lt!139188 (MissingVacant!1818 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14036 (_ BitVec 32)) SeekEntryResult!1818)

(assert (=> b!281773 (= lt!139188 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!281774 () Bool)

(declare-fun res!144845 () Bool)

(declare-fun e!179016 () Bool)

(assert (=> b!281774 (=> (not res!144845) (not e!179016))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281774 (= res!144845 (validKeyInArray!0 (select (arr!6660 a!3325) startIndex!26)))))

(declare-fun b!281775 () Bool)

(assert (=> b!281775 (= e!179015 e!179016)))

(declare-fun res!144839 () Bool)

(assert (=> b!281775 (=> (not res!144839) (not e!179016))))

(assert (=> b!281775 (= res!144839 (not (= startIndex!26 i!1267)))))

(declare-fun lt!139189 () array!14036)

(assert (=> b!281775 (= lt!139189 (array!14037 (store (arr!6660 a!3325) i!1267 k0!2581) (size!7012 a!3325)))))

(declare-fun b!281776 () Bool)

(assert (=> b!281776 (= e!179016 (not (or (bvsgt #b00000000000000000000000000000000 (size!7012 a!3325)) (bvsle startIndex!26 (size!7012 a!3325)))))))

(assert (=> b!281776 (= (seekEntryOrOpen!0 (select (arr!6660 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6660 a!3325) i!1267 k0!2581) startIndex!26) lt!139189 mask!3868))))

(declare-datatypes ((Unit!8920 0))(
  ( (Unit!8921) )
))
(declare-fun lt!139186 () Unit!8920)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14036 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8920)

(assert (=> b!281776 (= lt!139186 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!281776 (arrayNoDuplicates!0 lt!139189 #b00000000000000000000000000000000 Nil!4465)))

(declare-fun lt!139187 () Unit!8920)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14036 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4468) Unit!8920)

(assert (=> b!281776 (= lt!139187 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4465))))

(declare-fun b!281777 () Bool)

(declare-fun res!144840 () Bool)

(assert (=> b!281777 (=> (not res!144840) (not e!179017))))

(assert (=> b!281777 (= res!144840 (validKeyInArray!0 k0!2581))))

(assert (= (and start!27218 res!144843) b!281771))

(assert (= (and b!281771 res!144841) b!281777))

(assert (= (and b!281777 res!144840) b!281772))

(assert (= (and b!281772 res!144846) b!281770))

(assert (= (and b!281770 res!144842) b!281773))

(assert (= (and b!281773 res!144844) b!281769))

(assert (= (and b!281769 res!144838) b!281775))

(assert (= (and b!281775 res!144839) b!281774))

(assert (= (and b!281774 res!144845) b!281776))

(declare-fun m!296135 () Bool)

(assert (=> b!281769 m!296135))

(declare-fun m!296137 () Bool)

(assert (=> start!27218 m!296137))

(declare-fun m!296139 () Bool)

(assert (=> start!27218 m!296139))

(declare-fun m!296141 () Bool)

(assert (=> b!281777 m!296141))

(declare-fun m!296143 () Bool)

(assert (=> b!281776 m!296143))

(declare-fun m!296145 () Bool)

(assert (=> b!281776 m!296145))

(declare-fun m!296147 () Bool)

(assert (=> b!281776 m!296147))

(declare-fun m!296149 () Bool)

(assert (=> b!281776 m!296149))

(declare-fun m!296151 () Bool)

(assert (=> b!281776 m!296151))

(assert (=> b!281776 m!296147))

(declare-fun m!296153 () Bool)

(assert (=> b!281776 m!296153))

(declare-fun m!296155 () Bool)

(assert (=> b!281776 m!296155))

(assert (=> b!281776 m!296155))

(declare-fun m!296157 () Bool)

(assert (=> b!281776 m!296157))

(declare-fun m!296159 () Bool)

(assert (=> b!281773 m!296159))

(assert (=> b!281775 m!296145))

(declare-fun m!296161 () Bool)

(assert (=> b!281772 m!296161))

(declare-fun m!296163 () Bool)

(assert (=> b!281770 m!296163))

(assert (=> b!281774 m!296147))

(assert (=> b!281774 m!296147))

(declare-fun m!296165 () Bool)

(assert (=> b!281774 m!296165))

(check-sat (not b!281772) (not b!281776) (not b!281769) (not b!281777) (not b!281773) (not b!281774) (not start!27218) (not b!281770))
(check-sat)
