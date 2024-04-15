; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117980 () Bool)

(assert start!117980)

(declare-fun res!923635 () Bool)

(declare-fun e!783328 () Bool)

(assert (=> start!117980 (=> (not res!923635) (not e!783328))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117980 (= res!923635 (validMask!0 mask!3034))))

(assert (=> start!117980 e!783328))

(assert (=> start!117980 true))

(declare-datatypes ((array!94323 0))(
  ( (array!94324 (arr!45544 (Array (_ BitVec 32) (_ BitVec 64))) (size!46096 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94323)

(declare-fun array_inv!34777 (array!94323) Bool)

(assert (=> start!117980 (array_inv!34777 a!2971)))

(declare-fun b!1381963 () Bool)

(declare-fun res!923634 () Bool)

(assert (=> b!1381963 (=> (not res!923634) (not e!783328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94323 (_ BitVec 32)) Bool)

(assert (=> b!1381963 (= res!923634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1381964 () Bool)

(declare-fun res!923636 () Bool)

(assert (=> b!1381964 (=> (not res!923636) (not e!783328))))

(declare-datatypes ((List!32156 0))(
  ( (Nil!32153) (Cons!32152 (h!33361 (_ BitVec 64)) (t!46842 List!32156)) )
))
(declare-fun arrayNoDuplicates!0 (array!94323 (_ BitVec 32) List!32156) Bool)

(assert (=> b!1381964 (= res!923636 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32153))))

(declare-fun b!1381965 () Bool)

(assert (=> b!1381965 (= e!783328 (not (bvsle #b00000000000000000000000000000000 (size!46096 a!2971))))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!94324 (store (arr!45544 a!2971) i!1094 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46096 a!2971)) mask!3034)))

(declare-datatypes ((Unit!45882 0))(
  ( (Unit!45883) )
))
(declare-fun lt!608150 () Unit!45882)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94323 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45882)

(assert (=> b!1381965 (= lt!608150 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2971 i!1094 #b00000000000000000000000000000000 mask!3034))))

(declare-fun b!1381966 () Bool)

(declare-fun res!923638 () Bool)

(assert (=> b!1381966 (=> (not res!923638) (not e!783328))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381966 (= res!923638 (validKeyInArray!0 (select (arr!45544 a!2971) i!1094)))))

(declare-fun b!1381967 () Bool)

(declare-fun res!923639 () Bool)

(assert (=> b!1381967 (=> (not res!923639) (not e!783328))))

(assert (=> b!1381967 (= res!923639 (and (not (= (select (arr!45544 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45544 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt #b00000000000000000000000000000000 (size!46096 a!2971))))))

(declare-fun b!1381968 () Bool)

(declare-fun res!923637 () Bool)

(assert (=> b!1381968 (=> (not res!923637) (not e!783328))))

(assert (=> b!1381968 (= res!923637 (and (= (size!46096 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46096 a!2971))))))

(assert (= (and start!117980 res!923635) b!1381968))

(assert (= (and b!1381968 res!923637) b!1381966))

(assert (= (and b!1381966 res!923638) b!1381964))

(assert (= (and b!1381964 res!923636) b!1381963))

(assert (= (and b!1381963 res!923634) b!1381967))

(assert (= (and b!1381967 res!923639) b!1381965))

(declare-fun m!1266705 () Bool)

(assert (=> b!1381967 m!1266705))

(assert (=> b!1381966 m!1266705))

(assert (=> b!1381966 m!1266705))

(declare-fun m!1266707 () Bool)

(assert (=> b!1381966 m!1266707))

(declare-fun m!1266709 () Bool)

(assert (=> start!117980 m!1266709))

(declare-fun m!1266711 () Bool)

(assert (=> start!117980 m!1266711))

(declare-fun m!1266713 () Bool)

(assert (=> b!1381963 m!1266713))

(declare-fun m!1266715 () Bool)

(assert (=> b!1381964 m!1266715))

(declare-fun m!1266717 () Bool)

(assert (=> b!1381965 m!1266717))

(declare-fun m!1266719 () Bool)

(assert (=> b!1381965 m!1266719))

(declare-fun m!1266721 () Bool)

(assert (=> b!1381965 m!1266721))

(check-sat (not start!117980) (not b!1381965) (not b!1381964) (not b!1381966) (not b!1381963))
(check-sat)
