; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92628 () Bool)

(assert start!92628)

(declare-fun b!1051840 () Bool)

(declare-fun res!700165 () Bool)

(declare-fun e!597008 () Bool)

(assert (=> b!1051840 (=> (not res!700165) (not e!597008))))

(declare-datatypes ((array!66244 0))(
  ( (array!66245 (arr!31855 (Array (_ BitVec 32) (_ BitVec 64))) (size!32392 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66244)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1051840 (= res!700165 (= (select (arr!31855 a!3488) i!1381) k0!2747))))

(declare-fun b!1051841 () Bool)

(declare-fun e!597007 () Bool)

(assert (=> b!1051841 (= e!597008 e!597007)))

(declare-fun res!700161 () Bool)

(assert (=> b!1051841 (=> (not res!700161) (not e!597007))))

(declare-fun lt!464513 () array!66244)

(declare-fun arrayContainsKey!0 (array!66244 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051841 (= res!700161 (arrayContainsKey!0 lt!464513 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1051841 (= lt!464513 (array!66245 (store (arr!31855 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32392 a!3488)))))

(declare-fun b!1051842 () Bool)

(declare-fun res!700163 () Bool)

(assert (=> b!1051842 (=> (not res!700163) (not e!597008))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051842 (= res!700163 (validKeyInArray!0 k0!2747))))

(declare-fun res!700164 () Bool)

(assert (=> start!92628 (=> (not res!700164) (not e!597008))))

(assert (=> start!92628 (= res!700164 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32392 a!3488)) (bvslt (size!32392 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92628 e!597008))

(assert (=> start!92628 true))

(declare-fun array_inv!24637 (array!66244) Bool)

(assert (=> start!92628 (array_inv!24637 a!3488)))

(declare-fun b!1051843 () Bool)

(declare-fun e!597010 () Bool)

(assert (=> b!1051843 (= e!597010 (not true))))

(declare-fun lt!464512 () (_ BitVec 32))

(assert (=> b!1051843 (= (select (store (arr!31855 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464512) k0!2747)))

(declare-fun b!1051844 () Bool)

(assert (=> b!1051844 (= e!597007 e!597010)))

(declare-fun res!700166 () Bool)

(assert (=> b!1051844 (=> (not res!700166) (not e!597010))))

(assert (=> b!1051844 (= res!700166 (not (= lt!464512 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66244 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051844 (= lt!464512 (arrayScanForKey!0 lt!464513 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1051845 () Bool)

(declare-fun res!700162 () Bool)

(assert (=> b!1051845 (=> (not res!700162) (not e!597008))))

(declare-datatypes ((List!22137 0))(
  ( (Nil!22134) (Cons!22133 (h!23351 (_ BitVec 64)) (t!31436 List!22137)) )
))
(declare-fun arrayNoDuplicates!0 (array!66244 (_ BitVec 32) List!22137) Bool)

(assert (=> b!1051845 (= res!700162 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22134))))

(assert (= (and start!92628 res!700164) b!1051845))

(assert (= (and b!1051845 res!700162) b!1051842))

(assert (= (and b!1051842 res!700163) b!1051840))

(assert (= (and b!1051840 res!700165) b!1051841))

(assert (= (and b!1051841 res!700161) b!1051844))

(assert (= (and b!1051844 res!700166) b!1051843))

(declare-fun m!972881 () Bool)

(assert (=> b!1051840 m!972881))

(declare-fun m!972883 () Bool)

(assert (=> b!1051844 m!972883))

(declare-fun m!972885 () Bool)

(assert (=> b!1051845 m!972885))

(declare-fun m!972887 () Bool)

(assert (=> b!1051841 m!972887))

(declare-fun m!972889 () Bool)

(assert (=> b!1051841 m!972889))

(assert (=> b!1051843 m!972889))

(declare-fun m!972891 () Bool)

(assert (=> b!1051843 m!972891))

(declare-fun m!972893 () Bool)

(assert (=> start!92628 m!972893))

(declare-fun m!972895 () Bool)

(assert (=> b!1051842 m!972895))

(check-sat (not start!92628) (not b!1051844) (not b!1051842) (not b!1051845) (not b!1051841))
(check-sat)
