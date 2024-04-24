; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60270 () Bool)

(assert start!60270)

(declare-fun b!674124 () Bool)

(declare-fun res!440539 () Bool)

(declare-fun e!384904 () Bool)

(assert (=> b!674124 (=> (not res!440539) (not e!384904))))

(declare-datatypes ((array!39255 0))(
  ( (array!39256 (arr!18817 (Array (_ BitVec 32) (_ BitVec 64))) (size!19181 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39255)

(declare-datatypes ((List!12765 0))(
  ( (Nil!12762) (Cons!12761 (h!13809 (_ BitVec 64)) (t!18985 List!12765)) )
))
(declare-fun arrayNoDuplicates!0 (array!39255 (_ BitVec 32) List!12765) Bool)

(assert (=> b!674124 (= res!440539 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12762))))

(declare-fun b!674125 () Bool)

(declare-fun e!384907 () Bool)

(declare-fun acc!681 () List!12765)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3417 (List!12765 (_ BitVec 64)) Bool)

(assert (=> b!674125 (= e!384907 (not (contains!3417 acc!681 k0!2843)))))

(declare-fun b!674126 () Bool)

(declare-fun res!440526 () Bool)

(assert (=> b!674126 (=> (not res!440526) (not e!384904))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!674126 (= res!440526 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19181 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!674127 () Bool)

(declare-fun res!440538 () Bool)

(assert (=> b!674127 (=> (not res!440538) (not e!384904))))

(assert (=> b!674127 (= res!440538 (not (contains!3417 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674128 () Bool)

(declare-fun res!440537 () Bool)

(declare-fun e!384902 () Bool)

(assert (=> b!674128 (=> (not res!440537) (not e!384902))))

(declare-fun lt!312638 () List!12765)

(declare-fun noDuplicate!691 (List!12765) Bool)

(assert (=> b!674128 (= res!440537 (noDuplicate!691 lt!312638))))

(declare-fun b!674129 () Bool)

(declare-fun e!384899 () Bool)

(assert (=> b!674129 (= e!384899 (contains!3417 acc!681 k0!2843))))

(declare-fun b!674130 () Bool)

(declare-fun res!440528 () Bool)

(assert (=> b!674130 (=> (not res!440528) (not e!384904))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!674130 (= res!440528 (validKeyInArray!0 k0!2843))))

(declare-fun b!674131 () Bool)

(declare-fun e!384901 () Bool)

(assert (=> b!674131 (= e!384901 e!384902)))

(declare-fun res!440535 () Bool)

(assert (=> b!674131 (=> (not res!440535) (not e!384902))))

(assert (=> b!674131 (= res!440535 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!287 (List!12765 (_ BitVec 64)) List!12765)

(assert (=> b!674131 (= lt!312638 ($colon$colon!287 acc!681 (select (arr!18817 a!3626) from!3004)))))

(declare-fun b!674132 () Bool)

(declare-fun res!440548 () Bool)

(assert (=> b!674132 (=> (not res!440548) (not e!384904))))

(assert (=> b!674132 (= res!440548 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19181 a!3626))))))

(declare-fun b!674133 () Bool)

(declare-fun res!440540 () Bool)

(assert (=> b!674133 (=> (not res!440540) (not e!384904))))

(assert (=> b!674133 (= res!440540 (validKeyInArray!0 (select (arr!18817 a!3626) from!3004)))))

(declare-fun b!674134 () Bool)

(declare-fun res!440543 () Bool)

(assert (=> b!674134 (=> (not res!440543) (not e!384904))))

(declare-fun arrayContainsKey!0 (array!39255 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!674134 (= res!440543 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!674135 () Bool)

(declare-fun res!440529 () Bool)

(assert (=> b!674135 (=> (not res!440529) (not e!384904))))

(declare-fun e!384900 () Bool)

(assert (=> b!674135 (= res!440529 e!384900)))

(declare-fun res!440544 () Bool)

(assert (=> b!674135 (=> res!440544 e!384900)))

(assert (=> b!674135 (= res!440544 e!384899)))

(declare-fun res!440532 () Bool)

(assert (=> b!674135 (=> (not res!440532) (not e!384899))))

(assert (=> b!674135 (= res!440532 (bvsgt from!3004 i!1382))))

(declare-fun b!674136 () Bool)

(declare-fun e!384909 () Bool)

(assert (=> b!674136 (= e!384909 (contains!3417 lt!312638 k0!2843))))

(declare-fun b!674137 () Bool)

(declare-fun res!440525 () Bool)

(assert (=> b!674137 (=> (not res!440525) (not e!384904))))

(assert (=> b!674137 (= res!440525 (noDuplicate!691 acc!681))))

(declare-fun b!674138 () Bool)

(declare-fun res!440542 () Bool)

(assert (=> b!674138 (=> (not res!440542) (not e!384902))))

(declare-fun e!384906 () Bool)

(assert (=> b!674138 (= res!440542 e!384906)))

(declare-fun res!440541 () Bool)

(assert (=> b!674138 (=> res!440541 e!384906)))

(assert (=> b!674138 (= res!440541 e!384909)))

(declare-fun res!440545 () Bool)

(assert (=> b!674138 (=> (not res!440545) (not e!384909))))

(assert (=> b!674138 (= res!440545 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!674139 () Bool)

(declare-fun e!384908 () Bool)

(assert (=> b!674139 (= e!384908 (not (contains!3417 lt!312638 k0!2843)))))

(declare-fun b!674140 () Bool)

(declare-datatypes ((Unit!23679 0))(
  ( (Unit!23680) )
))
(declare-fun e!384903 () Unit!23679)

(declare-fun Unit!23681 () Unit!23679)

(assert (=> b!674140 (= e!384903 Unit!23681)))

(assert (=> b!674140 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!312640 () Unit!23679)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39255 (_ BitVec 64) (_ BitVec 32)) Unit!23679)

(assert (=> b!674140 (= lt!312640 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!674140 false))

(declare-fun b!674141 () Bool)

(declare-fun Unit!23682 () Unit!23679)

(assert (=> b!674141 (= e!384903 Unit!23682)))

(declare-fun b!674142 () Bool)

(assert (=> b!674142 (= e!384900 e!384907)))

(declare-fun res!440547 () Bool)

(assert (=> b!674142 (=> (not res!440547) (not e!384907))))

(assert (=> b!674142 (= res!440547 (bvsle from!3004 i!1382))))

(declare-fun res!440531 () Bool)

(assert (=> start!60270 (=> (not res!440531) (not e!384904))))

(assert (=> start!60270 (= res!440531 (and (bvslt (size!19181 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19181 a!3626))))))

(assert (=> start!60270 e!384904))

(assert (=> start!60270 true))

(declare-fun array_inv!14676 (array!39255) Bool)

(assert (=> start!60270 (array_inv!14676 a!3626)))

(declare-fun b!674143 () Bool)

(declare-fun res!440533 () Bool)

(assert (=> b!674143 (=> (not res!440533) (not e!384904))))

(assert (=> b!674143 (= res!440533 (not (contains!3417 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674144 () Bool)

(declare-fun res!440536 () Bool)

(assert (=> b!674144 (=> (not res!440536) (not e!384902))))

(assert (=> b!674144 (= res!440536 (not (contains!3417 lt!312638 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674145 () Bool)

(assert (=> b!674145 (= e!384902 false)))

(declare-fun lt!312639 () Bool)

(assert (=> b!674145 (= lt!312639 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312638))))

(declare-fun b!674146 () Bool)

(assert (=> b!674146 (= e!384906 e!384908)))

(declare-fun res!440527 () Bool)

(assert (=> b!674146 (=> (not res!440527) (not e!384908))))

(assert (=> b!674146 (= res!440527 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!674147 () Bool)

(declare-fun res!440546 () Bool)

(assert (=> b!674147 (=> (not res!440546) (not e!384902))))

(assert (=> b!674147 (= res!440546 (not (contains!3417 lt!312638 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674148 () Bool)

(assert (=> b!674148 (= e!384904 e!384901)))

(declare-fun res!440530 () Bool)

(assert (=> b!674148 (=> (not res!440530) (not e!384901))))

(assert (=> b!674148 (= res!440530 (not (= (select (arr!18817 a!3626) from!3004) k0!2843)))))

(declare-fun lt!312637 () Unit!23679)

(assert (=> b!674148 (= lt!312637 e!384903)))

(declare-fun c!77168 () Bool)

(assert (=> b!674148 (= c!77168 (= (select (arr!18817 a!3626) from!3004) k0!2843))))

(declare-fun b!674149 () Bool)

(declare-fun res!440534 () Bool)

(assert (=> b!674149 (=> (not res!440534) (not e!384904))))

(assert (=> b!674149 (= res!440534 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!60270 res!440531) b!674137))

(assert (= (and b!674137 res!440525) b!674127))

(assert (= (and b!674127 res!440538) b!674143))

(assert (= (and b!674143 res!440533) b!674135))

(assert (= (and b!674135 res!440532) b!674129))

(assert (= (and b!674135 (not res!440544)) b!674142))

(assert (= (and b!674142 res!440547) b!674125))

(assert (= (and b!674135 res!440529) b!674124))

(assert (= (and b!674124 res!440539) b!674149))

(assert (= (and b!674149 res!440534) b!674132))

(assert (= (and b!674132 res!440548) b!674130))

(assert (= (and b!674130 res!440528) b!674134))

(assert (= (and b!674134 res!440543) b!674126))

(assert (= (and b!674126 res!440526) b!674133))

(assert (= (and b!674133 res!440540) b!674148))

(assert (= (and b!674148 c!77168) b!674140))

(assert (= (and b!674148 (not c!77168)) b!674141))

(assert (= (and b!674148 res!440530) b!674131))

(assert (= (and b!674131 res!440535) b!674128))

(assert (= (and b!674128 res!440537) b!674144))

(assert (= (and b!674144 res!440536) b!674147))

(assert (= (and b!674147 res!440546) b!674138))

(assert (= (and b!674138 res!440545) b!674136))

(assert (= (and b!674138 (not res!440541)) b!674146))

(assert (= (and b!674146 res!440527) b!674139))

(assert (= (and b!674138 res!440542) b!674145))

(declare-fun m!642811 () Bool)

(assert (=> b!674137 m!642811))

(declare-fun m!642813 () Bool)

(assert (=> b!674149 m!642813))

(declare-fun m!642815 () Bool)

(assert (=> b!674145 m!642815))

(declare-fun m!642817 () Bool)

(assert (=> start!60270 m!642817))

(declare-fun m!642819 () Bool)

(assert (=> b!674125 m!642819))

(declare-fun m!642821 () Bool)

(assert (=> b!674128 m!642821))

(declare-fun m!642823 () Bool)

(assert (=> b!674127 m!642823))

(declare-fun m!642825 () Bool)

(assert (=> b!674133 m!642825))

(assert (=> b!674133 m!642825))

(declare-fun m!642827 () Bool)

(assert (=> b!674133 m!642827))

(declare-fun m!642829 () Bool)

(assert (=> b!674139 m!642829))

(assert (=> b!674148 m!642825))

(declare-fun m!642831 () Bool)

(assert (=> b!674143 m!642831))

(declare-fun m!642833 () Bool)

(assert (=> b!674140 m!642833))

(declare-fun m!642835 () Bool)

(assert (=> b!674140 m!642835))

(declare-fun m!642837 () Bool)

(assert (=> b!674147 m!642837))

(assert (=> b!674129 m!642819))

(declare-fun m!642839 () Bool)

(assert (=> b!674134 m!642839))

(declare-fun m!642841 () Bool)

(assert (=> b!674144 m!642841))

(assert (=> b!674136 m!642829))

(declare-fun m!642843 () Bool)

(assert (=> b!674130 m!642843))

(declare-fun m!642845 () Bool)

(assert (=> b!674124 m!642845))

(assert (=> b!674131 m!642825))

(assert (=> b!674131 m!642825))

(declare-fun m!642847 () Bool)

(assert (=> b!674131 m!642847))

(check-sat (not b!674125) (not b!674129) (not b!674128) (not b!674149) (not b!674136) (not b!674140) (not start!60270) (not b!674127) (not b!674133) (not b!674124) (not b!674143) (not b!674131) (not b!674139) (not b!674144) (not b!674134) (not b!674137) (not b!674145) (not b!674147) (not b!674130))
(check-sat)
