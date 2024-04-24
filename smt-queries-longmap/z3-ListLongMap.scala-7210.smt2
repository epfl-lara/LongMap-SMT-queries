; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92556 () Bool)

(assert start!92556)

(declare-fun b!1050637 () Bool)

(declare-fun e!596181 () Bool)

(declare-fun e!596182 () Bool)

(assert (=> b!1050637 (= e!596181 e!596182)))

(declare-fun res!698967 () Bool)

(assert (=> b!1050637 (=> (not res!698967) (not e!596182))))

(declare-fun lt!463982 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050637 (= res!698967 (not (= lt!463982 i!1381)))))

(declare-datatypes ((array!66172 0))(
  ( (array!66173 (arr!31819 (Array (_ BitVec 32) (_ BitVec 64))) (size!32356 (_ BitVec 32))) )
))
(declare-fun lt!463980 () array!66172)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66172 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050637 (= lt!463982 (arrayScanForKey!0 lt!463980 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050638 () Bool)

(declare-fun res!698961 () Bool)

(declare-fun e!596183 () Bool)

(assert (=> b!1050638 (=> (not res!698961) (not e!596183))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050638 (= res!698961 (validKeyInArray!0 k0!2747))))

(declare-fun b!1050639 () Bool)

(declare-fun res!698959 () Bool)

(assert (=> b!1050639 (=> (not res!698959) (not e!596183))))

(declare-fun a!3488 () array!66172)

(declare-datatypes ((List!22101 0))(
  ( (Nil!22098) (Cons!22097 (h!23315 (_ BitVec 64)) (t!31400 List!22101)) )
))
(declare-fun arrayNoDuplicates!0 (array!66172 (_ BitVec 32) List!22101) Bool)

(assert (=> b!1050639 (= res!698959 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22098))))

(declare-fun b!1050640 () Bool)

(declare-fun e!596185 () Bool)

(assert (=> b!1050640 (= e!596185 true)))

(declare-fun lt!463978 () Bool)

(declare-fun contains!6131 (List!22101 (_ BitVec 64)) Bool)

(assert (=> b!1050640 (= lt!463978 (contains!6131 Nil!22098 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1050641 () Bool)

(declare-fun e!596179 () Bool)

(declare-fun e!596180 () Bool)

(assert (=> b!1050641 (= e!596179 e!596180)))

(declare-fun res!698966 () Bool)

(assert (=> b!1050641 (=> res!698966 e!596180)))

(assert (=> b!1050641 (= res!698966 (bvsle lt!463982 i!1381))))

(declare-fun b!1050642 () Bool)

(declare-fun e!596178 () Bool)

(assert (=> b!1050642 (= e!596178 e!596185)))

(declare-fun res!698965 () Bool)

(assert (=> b!1050642 (=> res!698965 e!596185)))

(assert (=> b!1050642 (= res!698965 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32356 a!3488)))))

(declare-fun arrayContainsKey!0 (array!66172 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050642 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34327 0))(
  ( (Unit!34328) )
))
(declare-fun lt!463981 () Unit!34327)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66172 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34327)

(assert (=> b!1050642 (= lt!463981 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!463982 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1050642 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22098)))

(declare-fun lt!463979 () Unit!34327)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66172 (_ BitVec 32) (_ BitVec 32)) Unit!34327)

(assert (=> b!1050642 (= lt!463979 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun res!698969 () Bool)

(assert (=> start!92556 (=> (not res!698969) (not e!596183))))

(assert (=> start!92556 (= res!698969 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32356 a!3488)) (bvslt (size!32356 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92556 e!596183))

(assert (=> start!92556 true))

(declare-fun array_inv!24601 (array!66172) Bool)

(assert (=> start!92556 (array_inv!24601 a!3488)))

(declare-fun b!1050643 () Bool)

(declare-fun res!698960 () Bool)

(assert (=> b!1050643 (=> (not res!698960) (not e!596183))))

(assert (=> b!1050643 (= res!698960 (= (select (arr!31819 a!3488) i!1381) k0!2747))))

(declare-fun b!1050644 () Bool)

(assert (=> b!1050644 (= e!596180 (arrayContainsKey!0 a!3488 k0!2747 lt!463982))))

(declare-fun b!1050645 () Bool)

(declare-fun res!698968 () Bool)

(assert (=> b!1050645 (=> res!698968 e!596185)))

(declare-fun noDuplicate!1507 (List!22101) Bool)

(assert (=> b!1050645 (= res!698968 (not (noDuplicate!1507 Nil!22098)))))

(declare-fun b!1050646 () Bool)

(assert (=> b!1050646 (= e!596183 e!596181)))

(declare-fun res!698962 () Bool)

(assert (=> b!1050646 (=> (not res!698962) (not e!596181))))

(assert (=> b!1050646 (= res!698962 (arrayContainsKey!0 lt!463980 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050646 (= lt!463980 (array!66173 (store (arr!31819 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32356 a!3488)))))

(declare-fun b!1050647 () Bool)

(declare-fun res!698964 () Bool)

(assert (=> b!1050647 (=> res!698964 e!596185)))

(assert (=> b!1050647 (= res!698964 (contains!6131 Nil!22098 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1050648 () Bool)

(assert (=> b!1050648 (= e!596182 (not e!596178))))

(declare-fun res!698958 () Bool)

(assert (=> b!1050648 (=> res!698958 e!596178)))

(assert (=> b!1050648 (= res!698958 (bvsle lt!463982 i!1381))))

(assert (=> b!1050648 e!596179))

(declare-fun res!698963 () Bool)

(assert (=> b!1050648 (=> (not res!698963) (not e!596179))))

(assert (=> b!1050648 (= res!698963 (= (select (store (arr!31819 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463982) k0!2747))))

(assert (= (and start!92556 res!698969) b!1050639))

(assert (= (and b!1050639 res!698959) b!1050638))

(assert (= (and b!1050638 res!698961) b!1050643))

(assert (= (and b!1050643 res!698960) b!1050646))

(assert (= (and b!1050646 res!698962) b!1050637))

(assert (= (and b!1050637 res!698967) b!1050648))

(assert (= (and b!1050648 res!698963) b!1050641))

(assert (= (and b!1050641 (not res!698966)) b!1050644))

(assert (= (and b!1050648 (not res!698958)) b!1050642))

(assert (= (and b!1050642 (not res!698965)) b!1050645))

(assert (= (and b!1050645 (not res!698968)) b!1050647))

(assert (= (and b!1050647 (not res!698964)) b!1050640))

(declare-fun m!971765 () Bool)

(assert (=> b!1050647 m!971765))

(declare-fun m!971767 () Bool)

(assert (=> b!1050645 m!971767))

(declare-fun m!971769 () Bool)

(assert (=> b!1050640 m!971769))

(declare-fun m!971771 () Bool)

(assert (=> b!1050643 m!971771))

(declare-fun m!971773 () Bool)

(assert (=> b!1050648 m!971773))

(declare-fun m!971775 () Bool)

(assert (=> b!1050648 m!971775))

(declare-fun m!971777 () Bool)

(assert (=> b!1050638 m!971777))

(declare-fun m!971779 () Bool)

(assert (=> start!92556 m!971779))

(declare-fun m!971781 () Bool)

(assert (=> b!1050646 m!971781))

(assert (=> b!1050646 m!971773))

(declare-fun m!971783 () Bool)

(assert (=> b!1050642 m!971783))

(declare-fun m!971785 () Bool)

(assert (=> b!1050642 m!971785))

(declare-fun m!971787 () Bool)

(assert (=> b!1050642 m!971787))

(declare-fun m!971789 () Bool)

(assert (=> b!1050642 m!971789))

(declare-fun m!971791 () Bool)

(assert (=> b!1050639 m!971791))

(declare-fun m!971793 () Bool)

(assert (=> b!1050644 m!971793))

(declare-fun m!971795 () Bool)

(assert (=> b!1050637 m!971795))

(check-sat (not b!1050638) (not b!1050645) (not b!1050647) (not b!1050646) (not b!1050644) (not b!1050639) (not b!1050640) (not b!1050642) (not start!92556) (not b!1050637))
(check-sat)
