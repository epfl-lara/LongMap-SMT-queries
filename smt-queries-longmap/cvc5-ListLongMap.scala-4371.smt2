; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60246 () Bool)

(assert start!60246)

(declare-fun b!675278 () Bool)

(declare-fun res!441874 () Bool)

(declare-fun e!385256 () Bool)

(assert (=> b!675278 (=> (not res!441874) (not e!385256))))

(declare-datatypes ((array!39304 0))(
  ( (array!39305 (arr!18844 (Array (_ BitVec 32) (_ BitVec 64))) (size!19209 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39304)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39304 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!675278 (= res!441874 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!675279 () Bool)

(declare-fun res!441865 () Bool)

(assert (=> b!675279 (=> (not res!441865) (not e!385256))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!675279 (= res!441865 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!675280 () Bool)

(declare-fun res!441875 () Bool)

(assert (=> b!675280 (=> (not res!441875) (not e!385256))))

(declare-datatypes ((List!12924 0))(
  ( (Nil!12921) (Cons!12920 (h!13965 (_ BitVec 64)) (t!19143 List!12924)) )
))
(declare-fun arrayNoDuplicates!0 (array!39304 (_ BitVec 32) List!12924) Bool)

(assert (=> b!675280 (= res!441875 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12921))))

(declare-fun b!675281 () Bool)

(declare-fun res!441882 () Bool)

(assert (=> b!675281 (=> (not res!441882) (not e!385256))))

(declare-fun acc!681 () List!12924)

(declare-fun contains!3446 (List!12924 (_ BitVec 64)) Bool)

(assert (=> b!675281 (= res!441882 (not (contains!3446 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675282 () Bool)

(declare-fun res!441878 () Bool)

(assert (=> b!675282 (=> (not res!441878) (not e!385256))))

(declare-fun e!385251 () Bool)

(assert (=> b!675282 (= res!441878 e!385251)))

(declare-fun res!441866 () Bool)

(assert (=> b!675282 (=> res!441866 e!385251)))

(declare-fun e!385253 () Bool)

(assert (=> b!675282 (= res!441866 e!385253)))

(declare-fun res!441876 () Bool)

(assert (=> b!675282 (=> (not res!441876) (not e!385253))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!675282 (= res!441876 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675283 () Bool)

(declare-fun res!441879 () Bool)

(assert (=> b!675283 (=> (not res!441879) (not e!385256))))

(assert (=> b!675283 (= res!441879 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19209 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!675284 () Bool)

(declare-fun e!385249 () Bool)

(assert (=> b!675284 (= e!385249 (contains!3446 acc!681 k!2843))))

(declare-fun b!675285 () Bool)

(declare-fun res!441864 () Bool)

(assert (=> b!675285 (=> (not res!441864) (not e!385256))))

(assert (=> b!675285 (= res!441864 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!675286 () Bool)

(declare-fun e!385254 () Bool)

(declare-fun e!385250 () Bool)

(assert (=> b!675286 (= e!385254 e!385250)))

(declare-fun res!441880 () Bool)

(assert (=> b!675286 (=> (not res!441880) (not e!385250))))

(assert (=> b!675286 (= res!441880 (bvsle from!3004 i!1382))))

(declare-fun b!675287 () Bool)

(declare-fun res!441871 () Bool)

(assert (=> b!675287 (=> (not res!441871) (not e!385256))))

(assert (=> b!675287 (= res!441871 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19209 a!3626))))))

(declare-fun b!675288 () Bool)

(assert (=> b!675288 (= e!385250 (not (contains!3446 acc!681 k!2843)))))

(declare-fun res!441868 () Bool)

(assert (=> start!60246 (=> (not res!441868) (not e!385256))))

(assert (=> start!60246 (= res!441868 (and (bvslt (size!19209 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19209 a!3626))))))

(assert (=> start!60246 e!385256))

(assert (=> start!60246 true))

(declare-fun array_inv!14727 (array!39304) Bool)

(assert (=> start!60246 (array_inv!14727 a!3626)))

(declare-fun b!675289 () Bool)

(assert (=> b!675289 (= e!385256 false)))

(declare-fun lt!312477 () Bool)

(assert (=> b!675289 (= lt!312477 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!675290 () Bool)

(declare-fun res!441867 () Bool)

(assert (=> b!675290 (=> (not res!441867) (not e!385256))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!675290 (= res!441867 (validKeyInArray!0 k!2843))))

(declare-fun b!675291 () Bool)

(declare-fun e!385252 () Bool)

(assert (=> b!675291 (= e!385251 e!385252)))

(declare-fun res!441877 () Bool)

(assert (=> b!675291 (=> (not res!441877) (not e!385252))))

(assert (=> b!675291 (= res!441877 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675292 () Bool)

(assert (=> b!675292 (= e!385253 (contains!3446 acc!681 k!2843))))

(declare-fun b!675293 () Bool)

(declare-fun res!441881 () Bool)

(assert (=> b!675293 (=> (not res!441881) (not e!385256))))

(assert (=> b!675293 (= res!441881 e!385254)))

(declare-fun res!441873 () Bool)

(assert (=> b!675293 (=> res!441873 e!385254)))

(assert (=> b!675293 (= res!441873 e!385249)))

(declare-fun res!441872 () Bool)

(assert (=> b!675293 (=> (not res!441872) (not e!385249))))

(assert (=> b!675293 (= res!441872 (bvsgt from!3004 i!1382))))

(declare-fun b!675294 () Bool)

(declare-fun res!441870 () Bool)

(assert (=> b!675294 (=> (not res!441870) (not e!385256))))

(declare-fun noDuplicate!715 (List!12924) Bool)

(assert (=> b!675294 (= res!441870 (noDuplicate!715 acc!681))))

(declare-fun b!675295 () Bool)

(assert (=> b!675295 (= e!385252 (not (contains!3446 acc!681 k!2843)))))

(declare-fun b!675296 () Bool)

(declare-fun res!441883 () Bool)

(assert (=> b!675296 (=> (not res!441883) (not e!385256))))

(assert (=> b!675296 (= res!441883 (not (validKeyInArray!0 (select (arr!18844 a!3626) from!3004))))))

(declare-fun b!675297 () Bool)

(declare-fun res!441869 () Bool)

(assert (=> b!675297 (=> (not res!441869) (not e!385256))))

(assert (=> b!675297 (= res!441869 (not (contains!3446 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60246 res!441868) b!675294))

(assert (= (and b!675294 res!441870) b!675297))

(assert (= (and b!675297 res!441869) b!675281))

(assert (= (and b!675281 res!441882) b!675293))

(assert (= (and b!675293 res!441872) b!675284))

(assert (= (and b!675293 (not res!441873)) b!675286))

(assert (= (and b!675286 res!441880) b!675288))

(assert (= (and b!675293 res!441881) b!675280))

(assert (= (and b!675280 res!441875) b!675285))

(assert (= (and b!675285 res!441864) b!675287))

(assert (= (and b!675287 res!441871) b!675290))

(assert (= (and b!675290 res!441867) b!675278))

(assert (= (and b!675278 res!441874) b!675283))

(assert (= (and b!675283 res!441879) b!675296))

(assert (= (and b!675296 res!441883) b!675279))

(assert (= (and b!675279 res!441865) b!675282))

(assert (= (and b!675282 res!441876) b!675292))

(assert (= (and b!675282 (not res!441866)) b!675291))

(assert (= (and b!675291 res!441877) b!675295))

(assert (= (and b!675282 res!441878) b!675289))

(declare-fun m!642165 () Bool)

(assert (=> b!675284 m!642165))

(declare-fun m!642167 () Bool)

(assert (=> b!675297 m!642167))

(assert (=> b!675292 m!642165))

(declare-fun m!642169 () Bool)

(assert (=> start!60246 m!642169))

(declare-fun m!642171 () Bool)

(assert (=> b!675285 m!642171))

(declare-fun m!642173 () Bool)

(assert (=> b!675278 m!642173))

(assert (=> b!675295 m!642165))

(declare-fun m!642175 () Bool)

(assert (=> b!675290 m!642175))

(declare-fun m!642177 () Bool)

(assert (=> b!675281 m!642177))

(declare-fun m!642179 () Bool)

(assert (=> b!675289 m!642179))

(declare-fun m!642181 () Bool)

(assert (=> b!675294 m!642181))

(declare-fun m!642183 () Bool)

(assert (=> b!675280 m!642183))

(declare-fun m!642185 () Bool)

(assert (=> b!675296 m!642185))

(assert (=> b!675296 m!642185))

(declare-fun m!642187 () Bool)

(assert (=> b!675296 m!642187))

(assert (=> b!675288 m!642165))

(push 1)

(assert (not start!60246))

(assert (not b!675285))

(assert (not b!675297))

(assert (not b!675294))

(assert (not b!675284))

(assert (not b!675290))

(assert (not b!675278))

(assert (not b!675288))

(assert (not b!675292))

(assert (not b!675296))

(assert (not b!675295))

(assert (not b!675281))

(assert (not b!675280))

(assert (not b!675289))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

