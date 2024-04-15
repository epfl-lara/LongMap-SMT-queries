; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92356 () Bool)

(assert start!92356)

(declare-fun b!1049819 () Bool)

(declare-fun res!699031 () Bool)

(declare-fun e!595678 () Bool)

(assert (=> b!1049819 (=> res!699031 e!595678)))

(declare-datatypes ((List!22159 0))(
  ( (Nil!22156) (Cons!22155 (h!23364 (_ BitVec 64)) (t!31457 List!22159)) )
))
(declare-fun contains!6097 (List!22159 (_ BitVec 64)) Bool)

(assert (=> b!1049819 (= res!699031 (contains!6097 Nil!22156 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049820 () Bool)

(declare-fun res!699032 () Bool)

(assert (=> b!1049820 (=> res!699032 e!595678)))

(declare-fun noDuplicate!1522 (List!22159) Bool)

(assert (=> b!1049820 (= res!699032 (not (noDuplicate!1522 Nil!22156)))))

(declare-fun b!1049821 () Bool)

(declare-fun res!699033 () Bool)

(declare-fun e!595676 () Bool)

(assert (=> b!1049821 (=> (not res!699033) (not e!595676))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049821 (= res!699033 (validKeyInArray!0 k0!2747))))

(declare-fun e!595682 () Bool)

(declare-fun b!1049822 () Bool)

(declare-datatypes ((array!66098 0))(
  ( (array!66099 (arr!31788 (Array (_ BitVec 32) (_ BitVec 64))) (size!32326 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66098)

(declare-fun lt!463537 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66098 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049822 (= e!595682 (arrayContainsKey!0 a!3488 k0!2747 lt!463537))))

(declare-fun b!1049823 () Bool)

(declare-fun e!595683 () Bool)

(assert (=> b!1049823 (= e!595683 e!595678)))

(declare-fun res!699038 () Bool)

(assert (=> b!1049823 (=> res!699038 e!595678)))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1049823 (= res!699038 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32326 a!3488)))))

(assert (=> b!1049823 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34229 0))(
  ( (Unit!34230) )
))
(declare-fun lt!463536 () Unit!34229)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66098 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34229)

(assert (=> b!1049823 (= lt!463536 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!463537 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-fun arrayNoDuplicates!0 (array!66098 (_ BitVec 32) List!22159) Bool)

(assert (=> b!1049823 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22156)))

(declare-fun lt!463534 () Unit!34229)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66098 (_ BitVec 32) (_ BitVec 32)) Unit!34229)

(assert (=> b!1049823 (= lt!463534 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1049824 () Bool)

(declare-fun e!595681 () Bool)

(declare-fun e!595680 () Bool)

(assert (=> b!1049824 (= e!595681 e!595680)))

(declare-fun res!699034 () Bool)

(assert (=> b!1049824 (=> (not res!699034) (not e!595680))))

(assert (=> b!1049824 (= res!699034 (not (= lt!463537 i!1381)))))

(declare-fun lt!463535 () array!66098)

(declare-fun arrayScanForKey!0 (array!66098 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049824 (= lt!463537 (arrayScanForKey!0 lt!463535 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1049825 () Bool)

(declare-fun res!699030 () Bool)

(assert (=> b!1049825 (=> (not res!699030) (not e!595676))))

(assert (=> b!1049825 (= res!699030 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22156))))

(declare-fun b!1049827 () Bool)

(assert (=> b!1049827 (= e!595680 (not e!595683))))

(declare-fun res!699037 () Bool)

(assert (=> b!1049827 (=> res!699037 e!595683)))

(assert (=> b!1049827 (= res!699037 (bvsle lt!463537 i!1381))))

(declare-fun e!595677 () Bool)

(assert (=> b!1049827 e!595677))

(declare-fun res!699039 () Bool)

(assert (=> b!1049827 (=> (not res!699039) (not e!595677))))

(assert (=> b!1049827 (= res!699039 (= (select (store (arr!31788 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463537) k0!2747))))

(declare-fun b!1049828 () Bool)

(assert (=> b!1049828 (= e!595677 e!595682)))

(declare-fun res!699035 () Bool)

(assert (=> b!1049828 (=> res!699035 e!595682)))

(assert (=> b!1049828 (= res!699035 (bvsle lt!463537 i!1381))))

(declare-fun b!1049826 () Bool)

(assert (=> b!1049826 (= e!595678 true)))

(declare-fun lt!463533 () Bool)

(assert (=> b!1049826 (= lt!463533 (contains!6097 Nil!22156 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!699040 () Bool)

(assert (=> start!92356 (=> (not res!699040) (not e!595676))))

(assert (=> start!92356 (= res!699040 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32326 a!3488)) (bvslt (size!32326 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92356 e!595676))

(assert (=> start!92356 true))

(declare-fun array_inv!24571 (array!66098) Bool)

(assert (=> start!92356 (array_inv!24571 a!3488)))

(declare-fun b!1049829 () Bool)

(assert (=> b!1049829 (= e!595676 e!595681)))

(declare-fun res!699036 () Bool)

(assert (=> b!1049829 (=> (not res!699036) (not e!595681))))

(assert (=> b!1049829 (= res!699036 (arrayContainsKey!0 lt!463535 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1049829 (= lt!463535 (array!66099 (store (arr!31788 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32326 a!3488)))))

(declare-fun b!1049830 () Bool)

(declare-fun res!699029 () Bool)

(assert (=> b!1049830 (=> (not res!699029) (not e!595676))))

(assert (=> b!1049830 (= res!699029 (= (select (arr!31788 a!3488) i!1381) k0!2747))))

(assert (= (and start!92356 res!699040) b!1049825))

(assert (= (and b!1049825 res!699030) b!1049821))

(assert (= (and b!1049821 res!699033) b!1049830))

(assert (= (and b!1049830 res!699029) b!1049829))

(assert (= (and b!1049829 res!699036) b!1049824))

(assert (= (and b!1049824 res!699034) b!1049827))

(assert (= (and b!1049827 res!699039) b!1049828))

(assert (= (and b!1049828 (not res!699035)) b!1049822))

(assert (= (and b!1049827 (not res!699037)) b!1049823))

(assert (= (and b!1049823 (not res!699038)) b!1049820))

(assert (= (and b!1049820 (not res!699032)) b!1049819))

(assert (= (and b!1049819 (not res!699031)) b!1049826))

(declare-fun m!970057 () Bool)

(assert (=> b!1049823 m!970057))

(declare-fun m!970059 () Bool)

(assert (=> b!1049823 m!970059))

(declare-fun m!970061 () Bool)

(assert (=> b!1049823 m!970061))

(declare-fun m!970063 () Bool)

(assert (=> b!1049823 m!970063))

(declare-fun m!970065 () Bool)

(assert (=> b!1049829 m!970065))

(declare-fun m!970067 () Bool)

(assert (=> b!1049829 m!970067))

(assert (=> b!1049827 m!970067))

(declare-fun m!970069 () Bool)

(assert (=> b!1049827 m!970069))

(declare-fun m!970071 () Bool)

(assert (=> b!1049819 m!970071))

(declare-fun m!970073 () Bool)

(assert (=> b!1049825 m!970073))

(declare-fun m!970075 () Bool)

(assert (=> b!1049830 m!970075))

(declare-fun m!970077 () Bool)

(assert (=> start!92356 m!970077))

(declare-fun m!970079 () Bool)

(assert (=> b!1049822 m!970079))

(declare-fun m!970081 () Bool)

(assert (=> b!1049821 m!970081))

(declare-fun m!970083 () Bool)

(assert (=> b!1049824 m!970083))

(declare-fun m!970085 () Bool)

(assert (=> b!1049826 m!970085))

(declare-fun m!970087 () Bool)

(assert (=> b!1049820 m!970087))

(check-sat (not b!1049824) (not b!1049829) (not b!1049821) (not start!92356) (not b!1049820) (not b!1049819) (not b!1049825) (not b!1049826) (not b!1049823) (not b!1049822))
(check-sat)
