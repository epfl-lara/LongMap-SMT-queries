; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92486 () Bool)

(assert start!92486)

(declare-fun res!700822 () Bool)

(declare-fun e!597027 () Bool)

(assert (=> start!92486 (=> (not res!700822) (not e!597027))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66287 0))(
  ( (array!66288 (arr!31883 (Array (_ BitVec 32) (_ BitVec 64))) (size!32419 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66287)

(assert (=> start!92486 (= res!700822 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32419 a!3488)) (bvslt (size!32419 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92486 e!597027))

(assert (=> start!92486 true))

(declare-fun array_inv!24663 (array!66287) Bool)

(assert (=> start!92486 (array_inv!24663 a!3488)))

(declare-fun b!1051689 () Bool)

(declare-fun e!597025 () Bool)

(declare-fun e!597029 () Bool)

(assert (=> b!1051689 (= e!597025 e!597029)))

(declare-fun res!700817 () Bool)

(assert (=> b!1051689 (=> res!700817 e!597029)))

(declare-fun lt!464385 () (_ BitVec 32))

(declare-fun lt!464384 () (_ BitVec 32))

(assert (=> b!1051689 (= res!700817 (or (bvslt lt!464385 #b00000000000000000000000000000000) (bvsge lt!464384 (size!32419 a!3488)) (bvsge lt!464385 (size!32419 a!3488))))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66287 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051689 (arrayContainsKey!0 a!3488 k0!2747 lt!464384)))

(declare-datatypes ((Unit!34438 0))(
  ( (Unit!34439) )
))
(declare-fun lt!464388 () Unit!34438)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66287 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34438)

(assert (=> b!1051689 (= lt!464388 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!464384))))

(assert (=> b!1051689 (= lt!464384 (bvadd #b00000000000000000000000000000001 lt!464385))))

(declare-datatypes ((List!22195 0))(
  ( (Nil!22192) (Cons!22191 (h!23400 (_ BitVec 64)) (t!31502 List!22195)) )
))
(declare-fun arrayNoDuplicates!0 (array!66287 (_ BitVec 32) List!22195) Bool)

(assert (=> b!1051689 (arrayNoDuplicates!0 a!3488 lt!464385 Nil!22192)))

(declare-fun lt!464386 () Unit!34438)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66287 (_ BitVec 32) (_ BitVec 32)) Unit!34438)

(assert (=> b!1051689 (= lt!464386 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464385))))

(declare-fun b!1051690 () Bool)

(declare-fun e!597028 () Bool)

(declare-fun e!597026 () Bool)

(assert (=> b!1051690 (= e!597028 e!597026)))

(declare-fun res!700821 () Bool)

(assert (=> b!1051690 (=> res!700821 e!597026)))

(assert (=> b!1051690 (= res!700821 (or (bvsgt lt!464385 i!1381) (bvsle i!1381 lt!464385)))))

(declare-fun b!1051691 () Bool)

(assert (=> b!1051691 (= e!597026 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1051692 () Bool)

(declare-fun res!700824 () Bool)

(assert (=> b!1051692 (=> (not res!700824) (not e!597027))))

(assert (=> b!1051692 (= res!700824 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22192))))

(declare-fun b!1051693 () Bool)

(declare-fun res!700815 () Bool)

(assert (=> b!1051693 (=> (not res!700815) (not e!597027))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051693 (= res!700815 (validKeyInArray!0 k0!2747))))

(declare-fun b!1051694 () Bool)

(declare-fun res!700816 () Bool)

(assert (=> b!1051694 (=> res!700816 e!597029)))

(declare-fun noDuplicate!1522 (List!22195) Bool)

(assert (=> b!1051694 (= res!700816 (not (noDuplicate!1522 Nil!22192)))))

(declare-fun b!1051695 () Bool)

(declare-fun res!700819 () Bool)

(assert (=> b!1051695 (=> (not res!700819) (not e!597027))))

(assert (=> b!1051695 (= res!700819 (= (select (arr!31883 a!3488) i!1381) k0!2747))))

(declare-fun b!1051696 () Bool)

(declare-fun e!597031 () Bool)

(assert (=> b!1051696 (= e!597031 (not e!597025))))

(declare-fun res!700818 () Bool)

(assert (=> b!1051696 (=> res!700818 e!597025)))

(assert (=> b!1051696 (= res!700818 (or (bvsgt lt!464385 i!1381) (bvsle i!1381 lt!464385)))))

(assert (=> b!1051696 e!597028))

(declare-fun res!700823 () Bool)

(assert (=> b!1051696 (=> (not res!700823) (not e!597028))))

(assert (=> b!1051696 (= res!700823 (= (select (store (arr!31883 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464385) k0!2747))))

(declare-fun b!1051697 () Bool)

(declare-fun e!597030 () Bool)

(assert (=> b!1051697 (= e!597027 e!597030)))

(declare-fun res!700820 () Bool)

(assert (=> b!1051697 (=> (not res!700820) (not e!597030))))

(declare-fun lt!464387 () array!66287)

(assert (=> b!1051697 (= res!700820 (arrayContainsKey!0 lt!464387 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1051697 (= lt!464387 (array!66288 (store (arr!31883 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32419 a!3488)))))

(declare-fun b!1051698 () Bool)

(assert (=> b!1051698 (= e!597029 true)))

(declare-fun lt!464383 () Bool)

(declare-fun contains!6137 (List!22195 (_ BitVec 64)) Bool)

(assert (=> b!1051698 (= lt!464383 (contains!6137 Nil!22192 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1051699 () Bool)

(declare-fun res!700825 () Bool)

(assert (=> b!1051699 (=> res!700825 e!597029)))

(assert (=> b!1051699 (= res!700825 (contains!6137 Nil!22192 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1051700 () Bool)

(assert (=> b!1051700 (= e!597030 e!597031)))

(declare-fun res!700826 () Bool)

(assert (=> b!1051700 (=> (not res!700826) (not e!597031))))

(assert (=> b!1051700 (= res!700826 (not (= lt!464385 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66287 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051700 (= lt!464385 (arrayScanForKey!0 lt!464387 k0!2747 #b00000000000000000000000000000000))))

(assert (= (and start!92486 res!700822) b!1051692))

(assert (= (and b!1051692 res!700824) b!1051693))

(assert (= (and b!1051693 res!700815) b!1051695))

(assert (= (and b!1051695 res!700819) b!1051697))

(assert (= (and b!1051697 res!700820) b!1051700))

(assert (= (and b!1051700 res!700826) b!1051696))

(assert (= (and b!1051696 res!700823) b!1051690))

(assert (= (and b!1051690 (not res!700821)) b!1051691))

(assert (= (and b!1051696 (not res!700818)) b!1051689))

(assert (= (and b!1051689 (not res!700817)) b!1051694))

(assert (= (and b!1051694 (not res!700816)) b!1051699))

(assert (= (and b!1051699 (not res!700825)) b!1051698))

(declare-fun m!972151 () Bool)

(assert (=> b!1051699 m!972151))

(declare-fun m!972153 () Bool)

(assert (=> b!1051691 m!972153))

(declare-fun m!972155 () Bool)

(assert (=> b!1051698 m!972155))

(declare-fun m!972157 () Bool)

(assert (=> b!1051692 m!972157))

(declare-fun m!972159 () Bool)

(assert (=> b!1051694 m!972159))

(declare-fun m!972161 () Bool)

(assert (=> b!1051695 m!972161))

(declare-fun m!972163 () Bool)

(assert (=> b!1051700 m!972163))

(declare-fun m!972165 () Bool)

(assert (=> b!1051697 m!972165))

(declare-fun m!972167 () Bool)

(assert (=> b!1051697 m!972167))

(declare-fun m!972169 () Bool)

(assert (=> start!92486 m!972169))

(assert (=> b!1051696 m!972167))

(declare-fun m!972171 () Bool)

(assert (=> b!1051696 m!972171))

(declare-fun m!972173 () Bool)

(assert (=> b!1051689 m!972173))

(declare-fun m!972175 () Bool)

(assert (=> b!1051689 m!972175))

(declare-fun m!972177 () Bool)

(assert (=> b!1051689 m!972177))

(declare-fun m!972179 () Bool)

(assert (=> b!1051689 m!972179))

(declare-fun m!972181 () Bool)

(assert (=> b!1051693 m!972181))

(check-sat (not start!92486) (not b!1051699) (not b!1051689) (not b!1051691) (not b!1051693) (not b!1051698) (not b!1051692) (not b!1051694) (not b!1051700) (not b!1051697))
(check-sat)
