; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61548 () Bool)

(assert start!61548)

(declare-fun b!688122 () Bool)

(declare-fun res!452990 () Bool)

(declare-fun e!391909 () Bool)

(assert (=> b!688122 (=> (not res!452990) (not e!391909))))

(declare-datatypes ((List!13101 0))(
  ( (Nil!13098) (Cons!13097 (h!14142 (_ BitVec 64)) (t!19356 List!13101)) )
))
(declare-fun acc!681 () List!13101)

(declare-fun noDuplicate!892 (List!13101) Bool)

(assert (=> b!688122 (= res!452990 (noDuplicate!892 acc!681))))

(declare-fun b!688123 () Bool)

(declare-datatypes ((Unit!24255 0))(
  ( (Unit!24256) )
))
(declare-fun e!391914 () Unit!24255)

(declare-fun Unit!24257 () Unit!24255)

(assert (=> b!688123 (= e!391914 Unit!24257)))

(declare-fun lt!315513 () Unit!24255)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun k!2843 () (_ BitVec 64))

(declare-datatypes ((array!39700 0))(
  ( (array!39701 (arr!19021 (Array (_ BitVec 32) (_ BitVec 64))) (size!19402 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39700)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39700 (_ BitVec 64) (_ BitVec 32)) Unit!24255)

(assert (=> b!688123 (= lt!315513 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!688123 false))

(declare-fun b!688124 () Bool)

(declare-fun e!391918 () Bool)

(declare-fun contains!3623 (List!13101 (_ BitVec 64)) Bool)

(assert (=> b!688124 (= e!391918 (contains!3623 acc!681 k!2843))))

(declare-fun b!688125 () Bool)

(declare-fun res!452997 () Bool)

(assert (=> b!688125 (=> (not res!452997) (not e!391909))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!688125 (= res!452997 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19402 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!688126 () Bool)

(declare-fun e!391912 () Bool)

(declare-fun e!391913 () Bool)

(assert (=> b!688126 (= e!391912 e!391913)))

(declare-fun res!453002 () Bool)

(assert (=> b!688126 (=> (not res!453002) (not e!391913))))

(assert (=> b!688126 (= res!453002 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!688127 () Bool)

(declare-fun res!452999 () Bool)

(assert (=> b!688127 (=> (not res!452999) (not e!391909))))

(assert (=> b!688127 (= res!452999 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19402 a!3626))))))

(declare-fun b!688128 () Bool)

(declare-fun e!391917 () Bool)

(declare-fun e!391911 () Bool)

(assert (=> b!688128 (= e!391917 e!391911)))

(declare-fun res!453001 () Bool)

(assert (=> b!688128 (=> (not res!453001) (not e!391911))))

(assert (=> b!688128 (= res!453001 (bvsle from!3004 i!1382))))

(declare-fun b!688130 () Bool)

(declare-fun e!391916 () Bool)

(assert (=> b!688130 (= e!391909 (not e!391916))))

(declare-fun res!453003 () Bool)

(assert (=> b!688130 (=> res!453003 e!391916)))

(assert (=> b!688130 (= res!453003 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun lt!315507 () List!13101)

(declare-fun arrayNoDuplicates!0 (array!39700 (_ BitVec 32) List!13101) Bool)

(assert (=> b!688130 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315507)))

(declare-fun lt!315504 () Unit!24255)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39700 (_ BitVec 64) (_ BitVec 32) List!13101 List!13101) Unit!24255)

(assert (=> b!688130 (= lt!315504 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315507))))

(declare-fun -!191 (List!13101 (_ BitVec 64)) List!13101)

(assert (=> b!688130 (= (-!191 lt!315507 k!2843) acc!681)))

(declare-fun $colon$colon!390 (List!13101 (_ BitVec 64)) List!13101)

(assert (=> b!688130 (= lt!315507 ($colon$colon!390 acc!681 k!2843))))

(declare-fun lt!315508 () Unit!24255)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13101) Unit!24255)

(assert (=> b!688130 (= lt!315508 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!226 (List!13101 List!13101) Bool)

(assert (=> b!688130 (subseq!226 acc!681 acc!681)))

(declare-fun lt!315511 () Unit!24255)

(declare-fun lemmaListSubSeqRefl!0 (List!13101) Unit!24255)

(assert (=> b!688130 (= lt!315511 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!688130 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315510 () Unit!24255)

(declare-fun e!391919 () Unit!24255)

(assert (=> b!688130 (= lt!315510 e!391919)))

(declare-fun c!77933 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!688130 (= c!77933 (validKeyInArray!0 (select (arr!19021 a!3626) from!3004)))))

(declare-fun lt!315506 () Unit!24255)

(assert (=> b!688130 (= lt!315506 e!391914)))

(declare-fun c!77934 () Bool)

(declare-fun arrayContainsKey!0 (array!39700 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!688130 (= c!77934 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!688130 (arrayContainsKey!0 (array!39701 (store (arr!19021 a!3626) i!1382 k!2843) (size!19402 a!3626)) k!2843 from!3004)))

(declare-fun b!688131 () Bool)

(assert (=> b!688131 (= e!391913 (not (contains!3623 lt!315507 k!2843)))))

(declare-fun b!688132 () Bool)

(declare-fun e!391915 () Bool)

(assert (=> b!688132 (= e!391915 (contains!3623 lt!315507 k!2843))))

(declare-fun b!688133 () Bool)

(declare-fun res!453009 () Bool)

(assert (=> b!688133 (=> res!453009 e!391916)))

(assert (=> b!688133 (= res!453009 (contains!3623 lt!315507 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!688134 () Bool)

(declare-fun res!453007 () Bool)

(assert (=> b!688134 (=> (not res!453007) (not e!391909))))

(assert (=> b!688134 (= res!453007 e!391917)))

(declare-fun res!453008 () Bool)

(assert (=> b!688134 (=> res!453008 e!391917)))

(assert (=> b!688134 (= res!453008 e!391918)))

(declare-fun res!452993 () Bool)

(assert (=> b!688134 (=> (not res!452993) (not e!391918))))

(assert (=> b!688134 (= res!452993 (bvsgt from!3004 i!1382))))

(declare-fun b!688135 () Bool)

(declare-fun lt!315512 () Unit!24255)

(assert (=> b!688135 (= e!391919 lt!315512)))

(declare-fun lt!315509 () Unit!24255)

(assert (=> b!688135 (= lt!315509 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!688135 (subseq!226 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39700 List!13101 List!13101 (_ BitVec 32)) Unit!24255)

(assert (=> b!688135 (= lt!315512 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!390 acc!681 (select (arr!19021 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!688135 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!688136 () Bool)

(declare-fun res!452994 () Bool)

(assert (=> b!688136 (=> (not res!452994) (not e!391909))))

(assert (=> b!688136 (= res!452994 (validKeyInArray!0 k!2843))))

(declare-fun b!688137 () Bool)

(assert (=> b!688137 (= e!391916 true)))

(declare-fun lt!315505 () Bool)

(assert (=> b!688137 (= lt!315505 e!391912)))

(declare-fun res!452992 () Bool)

(assert (=> b!688137 (=> res!452992 e!391912)))

(assert (=> b!688137 (= res!452992 e!391915)))

(declare-fun res!453004 () Bool)

(assert (=> b!688137 (=> (not res!453004) (not e!391915))))

(assert (=> b!688137 (= res!453004 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!688138 () Bool)

(declare-fun res!452996 () Bool)

(assert (=> b!688138 (=> (not res!452996) (not e!391909))))

(assert (=> b!688138 (= res!452996 (not (contains!3623 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!452991 () Bool)

(assert (=> start!61548 (=> (not res!452991) (not e!391909))))

(assert (=> start!61548 (= res!452991 (and (bvslt (size!19402 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19402 a!3626))))))

(assert (=> start!61548 e!391909))

(assert (=> start!61548 true))

(declare-fun array_inv!14904 (array!39700) Bool)

(assert (=> start!61548 (array_inv!14904 a!3626)))

(declare-fun b!688129 () Bool)

(declare-fun Unit!24258 () Unit!24255)

(assert (=> b!688129 (= e!391914 Unit!24258)))

(declare-fun b!688139 () Bool)

(declare-fun res!452995 () Bool)

(assert (=> b!688139 (=> (not res!452995) (not e!391909))))

(assert (=> b!688139 (= res!452995 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!688140 () Bool)

(declare-fun Unit!24259 () Unit!24255)

(assert (=> b!688140 (= e!391919 Unit!24259)))

(declare-fun b!688141 () Bool)

(declare-fun res!453000 () Bool)

(assert (=> b!688141 (=> res!453000 e!391916)))

(assert (=> b!688141 (= res!453000 (not (noDuplicate!892 lt!315507)))))

(declare-fun b!688142 () Bool)

(declare-fun res!453005 () Bool)

(assert (=> b!688142 (=> (not res!453005) (not e!391909))))

(assert (=> b!688142 (= res!453005 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!688143 () Bool)

(declare-fun res!452998 () Bool)

(assert (=> b!688143 (=> res!452998 e!391916)))

(assert (=> b!688143 (= res!452998 (contains!3623 lt!315507 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!688144 () Bool)

(declare-fun res!453010 () Bool)

(assert (=> b!688144 (=> (not res!453010) (not e!391909))))

(assert (=> b!688144 (= res!453010 (not (contains!3623 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!688145 () Bool)

(declare-fun res!453006 () Bool)

(assert (=> b!688145 (=> (not res!453006) (not e!391909))))

(assert (=> b!688145 (= res!453006 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13098))))

(declare-fun b!688146 () Bool)

(assert (=> b!688146 (= e!391911 (not (contains!3623 acc!681 k!2843)))))

(assert (= (and start!61548 res!452991) b!688122))

(assert (= (and b!688122 res!452990) b!688138))

(assert (= (and b!688138 res!452996) b!688144))

(assert (= (and b!688144 res!453010) b!688134))

(assert (= (and b!688134 res!452993) b!688124))

(assert (= (and b!688134 (not res!453008)) b!688128))

(assert (= (and b!688128 res!453001) b!688146))

(assert (= (and b!688134 res!453007) b!688145))

(assert (= (and b!688145 res!453006) b!688142))

(assert (= (and b!688142 res!453005) b!688127))

(assert (= (and b!688127 res!452999) b!688136))

(assert (= (and b!688136 res!452994) b!688139))

(assert (= (and b!688139 res!452995) b!688125))

(assert (= (and b!688125 res!452997) b!688130))

(assert (= (and b!688130 c!77934) b!688123))

(assert (= (and b!688130 (not c!77934)) b!688129))

(assert (= (and b!688130 c!77933) b!688135))

(assert (= (and b!688130 (not c!77933)) b!688140))

(assert (= (and b!688130 (not res!453003)) b!688141))

(assert (= (and b!688141 (not res!453000)) b!688143))

(assert (= (and b!688143 (not res!452998)) b!688133))

(assert (= (and b!688133 (not res!453009)) b!688137))

(assert (= (and b!688137 res!453004) b!688132))

(assert (= (and b!688137 (not res!452992)) b!688126))

(assert (= (and b!688126 res!453002) b!688131))

(declare-fun m!651533 () Bool)

(assert (=> b!688122 m!651533))

(declare-fun m!651535 () Bool)

(assert (=> start!61548 m!651535))

(declare-fun m!651537 () Bool)

(assert (=> b!688139 m!651537))

(declare-fun m!651539 () Bool)

(assert (=> b!688135 m!651539))

(declare-fun m!651541 () Bool)

(assert (=> b!688135 m!651541))

(declare-fun m!651543 () Bool)

(assert (=> b!688135 m!651543))

(declare-fun m!651545 () Bool)

(assert (=> b!688135 m!651545))

(assert (=> b!688135 m!651541))

(assert (=> b!688135 m!651543))

(declare-fun m!651547 () Bool)

(assert (=> b!688135 m!651547))

(declare-fun m!651549 () Bool)

(assert (=> b!688135 m!651549))

(declare-fun m!651551 () Bool)

(assert (=> b!688145 m!651551))

(declare-fun m!651553 () Bool)

(assert (=> b!688123 m!651553))

(declare-fun m!651555 () Bool)

(assert (=> b!688131 m!651555))

(declare-fun m!651557 () Bool)

(assert (=> b!688138 m!651557))

(declare-fun m!651559 () Bool)

(assert (=> b!688133 m!651559))

(assert (=> b!688132 m!651555))

(declare-fun m!651561 () Bool)

(assert (=> b!688142 m!651561))

(declare-fun m!651563 () Bool)

(assert (=> b!688136 m!651563))

(declare-fun m!651565 () Bool)

(assert (=> b!688124 m!651565))

(declare-fun m!651567 () Bool)

(assert (=> b!688144 m!651567))

(declare-fun m!651569 () Bool)

(assert (=> b!688143 m!651569))

(declare-fun m!651571 () Bool)

(assert (=> b!688141 m!651571))

(assert (=> b!688146 m!651565))

(assert (=> b!688130 m!651539))

(declare-fun m!651573 () Bool)

(assert (=> b!688130 m!651573))

(assert (=> b!688130 m!651541))

(declare-fun m!651575 () Bool)

(assert (=> b!688130 m!651575))

(declare-fun m!651577 () Bool)

(assert (=> b!688130 m!651577))

(declare-fun m!651579 () Bool)

(assert (=> b!688130 m!651579))

(declare-fun m!651581 () Bool)

(assert (=> b!688130 m!651581))

(assert (=> b!688130 m!651547))

(declare-fun m!651583 () Bool)

(assert (=> b!688130 m!651583))

(declare-fun m!651585 () Bool)

(assert (=> b!688130 m!651585))

(assert (=> b!688130 m!651541))

(declare-fun m!651587 () Bool)

(assert (=> b!688130 m!651587))

(declare-fun m!651589 () Bool)

(assert (=> b!688130 m!651589))

(assert (=> b!688130 m!651549))

(push 1)

(assert (not b!688130))

(assert (not b!688139))

(assert (not b!688131))

(assert (not b!688122))

(assert (not b!688133))

(assert (not b!688136))

(assert (not b!688135))

(assert (not b!688132))

(assert (not b!688138))

(assert (not b!688142))

(assert (not b!688146))

(assert (not start!61548))

(assert (not b!688123))

(assert (not b!688124))

(assert (not b!688143))

(assert (not b!688141))

(assert (not b!688144))

(assert (not b!688145))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

