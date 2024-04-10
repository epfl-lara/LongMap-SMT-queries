; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60248 () Bool)

(assert start!60248)

(declare-fun b!675274 () Bool)

(declare-fun res!441715 () Bool)

(declare-fun e!385325 () Bool)

(assert (=> b!675274 (=> (not res!441715) (not e!385325))))

(declare-datatypes ((array!39295 0))(
  ( (array!39296 (arr!18840 (Array (_ BitVec 32) (_ BitVec 64))) (size!19204 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39295)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!675274 (= res!441715 (not (validKeyInArray!0 (select (arr!18840 a!3626) from!3004))))))

(declare-fun res!441712 () Bool)

(assert (=> start!60248 (=> (not res!441712) (not e!385325))))

(assert (=> start!60248 (= res!441712 (and (bvslt (size!19204 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19204 a!3626))))))

(assert (=> start!60248 e!385325))

(assert (=> start!60248 true))

(declare-fun array_inv!14636 (array!39295) Bool)

(assert (=> start!60248 (array_inv!14636 a!3626)))

(declare-fun b!675275 () Bool)

(declare-fun res!441703 () Bool)

(assert (=> b!675275 (=> (not res!441703) (not e!385325))))

(declare-datatypes ((List!12881 0))(
  ( (Nil!12878) (Cons!12877 (h!13922 (_ BitVec 64)) (t!19109 List!12881)) )
))
(declare-fun acc!681 () List!12881)

(declare-fun arrayNoDuplicates!0 (array!39295 (_ BitVec 32) List!12881) Bool)

(assert (=> b!675275 (= res!441703 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!675276 () Bool)

(declare-fun res!441711 () Bool)

(assert (=> b!675276 (=> (not res!441711) (not e!385325))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!675276 (= res!441711 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19204 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!675277 () Bool)

(declare-fun res!441714 () Bool)

(assert (=> b!675277 (=> (not res!441714) (not e!385325))))

(assert (=> b!675277 (= res!441714 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12878))))

(declare-fun b!675278 () Bool)

(declare-fun e!385326 () Bool)

(declare-fun e!385319 () Bool)

(assert (=> b!675278 (= e!385326 e!385319)))

(declare-fun res!441708 () Bool)

(assert (=> b!675278 (=> (not res!441708) (not e!385319))))

(assert (=> b!675278 (= res!441708 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675279 () Bool)

(declare-fun e!385321 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3458 (List!12881 (_ BitVec 64)) Bool)

(assert (=> b!675279 (= e!385321 (contains!3458 acc!681 k!2843))))

(declare-fun b!675280 () Bool)

(declare-fun res!441704 () Bool)

(assert (=> b!675280 (=> (not res!441704) (not e!385325))))

(assert (=> b!675280 (= res!441704 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19204 a!3626))))))

(declare-fun b!675281 () Bool)

(declare-fun res!441709 () Bool)

(assert (=> b!675281 (=> (not res!441709) (not e!385325))))

(assert (=> b!675281 (= res!441709 (validKeyInArray!0 k!2843))))

(declare-fun b!675282 () Bool)

(declare-fun res!441717 () Bool)

(assert (=> b!675282 (=> (not res!441717) (not e!385325))))

(assert (=> b!675282 (= res!441717 (not (contains!3458 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675283 () Bool)

(declare-fun e!385323 () Bool)

(declare-fun e!385324 () Bool)

(assert (=> b!675283 (= e!385323 e!385324)))

(declare-fun res!441702 () Bool)

(assert (=> b!675283 (=> (not res!441702) (not e!385324))))

(assert (=> b!675283 (= res!441702 (bvsle from!3004 i!1382))))

(declare-fun b!675284 () Bool)

(assert (=> b!675284 (= e!385325 false)))

(declare-fun lt!312718 () Bool)

(assert (=> b!675284 (= lt!312718 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!675285 () Bool)

(declare-fun res!441710 () Bool)

(assert (=> b!675285 (=> (not res!441710) (not e!385325))))

(assert (=> b!675285 (= res!441710 (not (contains!3458 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675286 () Bool)

(assert (=> b!675286 (= e!385324 (not (contains!3458 acc!681 k!2843)))))

(declare-fun b!675287 () Bool)

(declare-fun res!441700 () Bool)

(assert (=> b!675287 (=> (not res!441700) (not e!385325))))

(assert (=> b!675287 (= res!441700 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!675288 () Bool)

(declare-fun res!441705 () Bool)

(assert (=> b!675288 (=> (not res!441705) (not e!385325))))

(assert (=> b!675288 (= res!441705 e!385326)))

(declare-fun res!441706 () Bool)

(assert (=> b!675288 (=> res!441706 e!385326)))

(assert (=> b!675288 (= res!441706 e!385321)))

(declare-fun res!441716 () Bool)

(assert (=> b!675288 (=> (not res!441716) (not e!385321))))

(assert (=> b!675288 (= res!441716 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675289 () Bool)

(declare-fun res!441713 () Bool)

(assert (=> b!675289 (=> (not res!441713) (not e!385325))))

(declare-fun noDuplicate!705 (List!12881) Bool)

(assert (=> b!675289 (= res!441713 (noDuplicate!705 acc!681))))

(declare-fun b!675290 () Bool)

(assert (=> b!675290 (= e!385319 (not (contains!3458 acc!681 k!2843)))))

(declare-fun b!675291 () Bool)

(declare-fun e!385322 () Bool)

(assert (=> b!675291 (= e!385322 (contains!3458 acc!681 k!2843))))

(declare-fun b!675292 () Bool)

(declare-fun res!441707 () Bool)

(assert (=> b!675292 (=> (not res!441707) (not e!385325))))

(declare-fun arrayContainsKey!0 (array!39295 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!675292 (= res!441707 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!675293 () Bool)

(declare-fun res!441718 () Bool)

(assert (=> b!675293 (=> (not res!441718) (not e!385325))))

(assert (=> b!675293 (= res!441718 e!385323)))

(declare-fun res!441719 () Bool)

(assert (=> b!675293 (=> res!441719 e!385323)))

(assert (=> b!675293 (= res!441719 e!385322)))

(declare-fun res!441701 () Bool)

(assert (=> b!675293 (=> (not res!441701) (not e!385322))))

(assert (=> b!675293 (= res!441701 (bvsgt from!3004 i!1382))))

(assert (= (and start!60248 res!441712) b!675289))

(assert (= (and b!675289 res!441713) b!675285))

(assert (= (and b!675285 res!441710) b!675282))

(assert (= (and b!675282 res!441717) b!675293))

(assert (= (and b!675293 res!441701) b!675291))

(assert (= (and b!675293 (not res!441719)) b!675283))

(assert (= (and b!675283 res!441702) b!675286))

(assert (= (and b!675293 res!441718) b!675277))

(assert (= (and b!675277 res!441714) b!675275))

(assert (= (and b!675275 res!441703) b!675280))

(assert (= (and b!675280 res!441704) b!675281))

(assert (= (and b!675281 res!441709) b!675292))

(assert (= (and b!675292 res!441707) b!675276))

(assert (= (and b!675276 res!441711) b!675274))

(assert (= (and b!675274 res!441715) b!675287))

(assert (= (and b!675287 res!441700) b!675288))

(assert (= (and b!675288 res!441716) b!675279))

(assert (= (and b!675288 (not res!441706)) b!675278))

(assert (= (and b!675278 res!441708) b!675290))

(assert (= (and b!675288 res!441705) b!675284))

(declare-fun m!642827 () Bool)

(assert (=> b!675284 m!642827))

(declare-fun m!642829 () Bool)

(assert (=> b!675286 m!642829))

(declare-fun m!642831 () Bool)

(assert (=> b!675281 m!642831))

(declare-fun m!642833 () Bool)

(assert (=> b!675274 m!642833))

(assert (=> b!675274 m!642833))

(declare-fun m!642835 () Bool)

(assert (=> b!675274 m!642835))

(assert (=> b!675290 m!642829))

(assert (=> b!675279 m!642829))

(declare-fun m!642837 () Bool)

(assert (=> b!675289 m!642837))

(declare-fun m!642839 () Bool)

(assert (=> b!675285 m!642839))

(declare-fun m!642841 () Bool)

(assert (=> start!60248 m!642841))

(declare-fun m!642843 () Bool)

(assert (=> b!675275 m!642843))

(declare-fun m!642845 () Bool)

(assert (=> b!675277 m!642845))

(declare-fun m!642847 () Bool)

(assert (=> b!675282 m!642847))

(declare-fun m!642849 () Bool)

(assert (=> b!675292 m!642849))

(assert (=> b!675291 m!642829))

(push 1)

(assert (not b!675277))

(assert (not b!675289))

(assert (not b!675285))

(assert (not start!60248))

(assert (not b!675279))

(assert (not b!675284))

(assert (not b!675286))

(assert (not b!675282))

(assert (not b!675290))

(assert (not b!675281))

(assert (not b!675274))

(assert (not b!675291))

(assert (not b!675275))

(assert (not b!675292))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

