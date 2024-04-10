; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59826 () Bool)

(assert start!59826)

(declare-fun b!661090 () Bool)

(declare-fun res!429162 () Bool)

(declare-fun e!379821 () Bool)

(assert (=> b!661090 (=> (not res!429162) (not e!379821))))

(declare-datatypes ((List!12670 0))(
  ( (Nil!12667) (Cons!12666 (h!13711 (_ BitVec 64)) (t!18898 List!12670)) )
))
(declare-fun acc!681 () List!12670)

(declare-fun contains!3247 (List!12670 (_ BitVec 64)) Bool)

(assert (=> b!661090 (= res!429162 (not (contains!3247 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661091 () Bool)

(declare-fun e!379819 () Bool)

(declare-fun e!379818 () Bool)

(assert (=> b!661091 (= e!379819 e!379818)))

(declare-fun res!429157 () Bool)

(assert (=> b!661091 (=> (not res!429157) (not e!379818))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!661091 (= res!429157 (bvsle from!3004 i!1382))))

(declare-fun b!661092 () Bool)

(declare-fun res!429160 () Bool)

(assert (=> b!661092 (=> (not res!429160) (not e!379821))))

(declare-fun noDuplicate!494 (List!12670) Bool)

(assert (=> b!661092 (= res!429160 (noDuplicate!494 acc!681))))

(declare-fun b!661093 () Bool)

(declare-fun res!429158 () Bool)

(assert (=> b!661093 (=> (not res!429158) (not e!379821))))

(declare-datatypes ((array!38873 0))(
  ( (array!38874 (arr!18629 (Array (_ BitVec 32) (_ BitVec 64))) (size!18993 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38873)

(assert (=> b!661093 (= res!429158 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!18993 a!3626))))))

(declare-fun b!661094 () Bool)

(declare-fun e!379820 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!661094 (= e!379820 (contains!3247 acc!681 k!2843))))

(declare-fun b!661095 () Bool)

(declare-fun res!429155 () Bool)

(assert (=> b!661095 (=> (not res!429155) (not e!379821))))

(assert (=> b!661095 (= res!429155 (not (contains!3247 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661096 () Bool)

(declare-fun res!429164 () Bool)

(assert (=> b!661096 (=> (not res!429164) (not e!379821))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!661096 (= res!429164 (validKeyInArray!0 k!2843))))

(declare-fun res!429159 () Bool)

(assert (=> start!59826 (=> (not res!429159) (not e!379821))))

(assert (=> start!59826 (= res!429159 (and (bvslt (size!18993 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18993 a!3626))))))

(assert (=> start!59826 e!379821))

(assert (=> start!59826 true))

(declare-fun array_inv!14425 (array!38873) Bool)

(assert (=> start!59826 (array_inv!14425 a!3626)))

(declare-fun b!661097 () Bool)

(assert (=> b!661097 (= e!379821 (not true))))

(declare-fun arrayContainsKey!0 (array!38873 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!661097 (arrayContainsKey!0 (array!38874 (store (arr!18629 a!3626) i!1382 k!2843) (size!18993 a!3626)) k!2843 from!3004)))

(declare-fun b!661098 () Bool)

(declare-fun res!429166 () Bool)

(assert (=> b!661098 (=> (not res!429166) (not e!379821))))

(assert (=> b!661098 (= res!429166 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!661099 () Bool)

(declare-fun res!429163 () Bool)

(assert (=> b!661099 (=> (not res!429163) (not e!379821))))

(declare-fun arrayNoDuplicates!0 (array!38873 (_ BitVec 32) List!12670) Bool)

(assert (=> b!661099 (= res!429163 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12667))))

(declare-fun b!661100 () Bool)

(declare-fun res!429167 () Bool)

(assert (=> b!661100 (=> (not res!429167) (not e!379821))))

(assert (=> b!661100 (= res!429167 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!18993 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!661101 () Bool)

(declare-fun res!429161 () Bool)

(assert (=> b!661101 (=> (not res!429161) (not e!379821))))

(assert (=> b!661101 (= res!429161 e!379819)))

(declare-fun res!429154 () Bool)

(assert (=> b!661101 (=> res!429154 e!379819)))

(assert (=> b!661101 (= res!429154 e!379820)))

(declare-fun res!429165 () Bool)

(assert (=> b!661101 (=> (not res!429165) (not e!379820))))

(assert (=> b!661101 (= res!429165 (bvsgt from!3004 i!1382))))

(declare-fun b!661102 () Bool)

(declare-fun res!429156 () Bool)

(assert (=> b!661102 (=> (not res!429156) (not e!379821))))

(assert (=> b!661102 (= res!429156 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!661103 () Bool)

(assert (=> b!661103 (= e!379818 (not (contains!3247 acc!681 k!2843)))))

(assert (= (and start!59826 res!429159) b!661092))

(assert (= (and b!661092 res!429160) b!661095))

(assert (= (and b!661095 res!429155) b!661090))

(assert (= (and b!661090 res!429162) b!661101))

(assert (= (and b!661101 res!429165) b!661094))

(assert (= (and b!661101 (not res!429154)) b!661091))

(assert (= (and b!661091 res!429157) b!661103))

(assert (= (and b!661101 res!429161) b!661099))

(assert (= (and b!661099 res!429163) b!661102))

(assert (= (and b!661102 res!429156) b!661093))

(assert (= (and b!661093 res!429158) b!661096))

(assert (= (and b!661096 res!429164) b!661098))

(assert (= (and b!661098 res!429166) b!661100))

(assert (= (and b!661100 res!429167) b!661097))

(declare-fun m!633445 () Bool)

(assert (=> b!661097 m!633445))

(declare-fun m!633447 () Bool)

(assert (=> b!661097 m!633447))

(declare-fun m!633449 () Bool)

(assert (=> b!661092 m!633449))

(declare-fun m!633451 () Bool)

(assert (=> b!661103 m!633451))

(declare-fun m!633453 () Bool)

(assert (=> b!661099 m!633453))

(declare-fun m!633455 () Bool)

(assert (=> b!661096 m!633455))

(declare-fun m!633457 () Bool)

(assert (=> b!661095 m!633457))

(declare-fun m!633459 () Bool)

(assert (=> b!661102 m!633459))

(declare-fun m!633461 () Bool)

(assert (=> b!661090 m!633461))

(assert (=> b!661094 m!633451))

(declare-fun m!633463 () Bool)

(assert (=> b!661098 m!633463))

(declare-fun m!633465 () Bool)

(assert (=> start!59826 m!633465))

(push 1)

(assert (not b!661090))

(assert (not b!661094))

(assert (not b!661099))

(assert (not start!59826))

(assert (not b!661092))

(assert (not b!661102))

(assert (not b!661098))

(assert (not b!661097))

(assert (not b!661103))

(assert (not b!661095))

(assert (not b!661096))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

