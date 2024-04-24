; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61816 () Bool)

(assert start!61816)

(declare-fun b!691210 () Bool)

(declare-fun res!455494 () Bool)

(declare-fun e!393503 () Bool)

(assert (=> b!691210 (=> (not res!455494) (not e!393503))))

(declare-datatypes ((array!39775 0))(
  ( (array!39776 (arr!19053 (Array (_ BitVec 32) (_ BitVec 64))) (size!19436 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39775)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39775 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!691210 (= res!455494 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun res!455483 () Bool)

(assert (=> start!61816 (=> (not res!455483) (not e!393503))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!61816 (= res!455483 (and (bvslt (size!19436 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19436 a!3626))))))

(assert (=> start!61816 e!393503))

(assert (=> start!61816 true))

(declare-fun array_inv!14912 (array!39775) Bool)

(assert (=> start!61816 (array_inv!14912 a!3626)))

(declare-fun b!691211 () Bool)

(declare-fun res!455479 () Bool)

(assert (=> b!691211 (=> (not res!455479) (not e!393503))))

(declare-fun e!393504 () Bool)

(assert (=> b!691211 (= res!455479 e!393504)))

(declare-fun res!455486 () Bool)

(assert (=> b!691211 (=> res!455486 e!393504)))

(declare-fun e!393507 () Bool)

(assert (=> b!691211 (= res!455486 e!393507)))

(declare-fun res!455492 () Bool)

(assert (=> b!691211 (=> (not res!455492) (not e!393507))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!691211 (= res!455492 (bvsgt from!3004 i!1382))))

(declare-fun b!691212 () Bool)

(declare-fun res!455482 () Bool)

(assert (=> b!691212 (=> (not res!455482) (not e!393503))))

(assert (=> b!691212 (= res!455482 (= (select (arr!19053 a!3626) from!3004) k!2843))))

(declare-fun b!691213 () Bool)

(declare-fun res!455480 () Bool)

(assert (=> b!691213 (=> (not res!455480) (not e!393503))))

(assert (=> b!691213 (= res!455480 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19436 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!691214 () Bool)

(declare-fun res!455489 () Bool)

(assert (=> b!691214 (=> (not res!455489) (not e!393503))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!691214 (= res!455489 (validKeyInArray!0 k!2843))))

(declare-fun b!691215 () Bool)

(declare-fun res!455487 () Bool)

(assert (=> b!691215 (=> (not res!455487) (not e!393503))))

(declare-datatypes ((List!13001 0))(
  ( (Nil!12998) (Cons!12997 (h!14045 (_ BitVec 64)) (t!19260 List!13001)) )
))
(declare-fun acc!681 () List!13001)

(declare-fun contains!3653 (List!13001 (_ BitVec 64)) Bool)

(assert (=> b!691215 (= res!455487 (not (contains!3653 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691216 () Bool)

(declare-fun res!455484 () Bool)

(assert (=> b!691216 (=> (not res!455484) (not e!393503))))

(assert (=> b!691216 (= res!455484 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19436 a!3626))))))

(declare-fun b!691217 () Bool)

(declare-fun res!455490 () Bool)

(assert (=> b!691217 (=> (not res!455490) (not e!393503))))

(assert (=> b!691217 (= res!455490 (not (contains!3653 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691218 () Bool)

(declare-fun res!455485 () Bool)

(assert (=> b!691218 (=> (not res!455485) (not e!393503))))

(declare-fun arrayNoDuplicates!0 (array!39775 (_ BitVec 32) List!13001) Bool)

(assert (=> b!691218 (= res!455485 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!691219 () Bool)

(declare-fun e!393505 () Bool)

(assert (=> b!691219 (= e!393504 e!393505)))

(declare-fun res!455488 () Bool)

(assert (=> b!691219 (=> (not res!455488) (not e!393505))))

(assert (=> b!691219 (= res!455488 (bvsle from!3004 i!1382))))

(declare-fun b!691220 () Bool)

(declare-fun res!455481 () Bool)

(assert (=> b!691220 (=> (not res!455481) (not e!393503))))

(assert (=> b!691220 (= res!455481 (validKeyInArray!0 (select (arr!19053 a!3626) from!3004)))))

(declare-fun b!691221 () Bool)

(assert (=> b!691221 (= e!393505 (not (contains!3653 acc!681 k!2843)))))

(declare-fun b!691222 () Bool)

(declare-fun res!455491 () Bool)

(assert (=> b!691222 (=> (not res!455491) (not e!393503))))

(declare-fun noDuplicate!927 (List!13001) Bool)

(assert (=> b!691222 (= res!455491 (noDuplicate!927 acc!681))))

(declare-fun b!691223 () Bool)

(declare-fun res!455493 () Bool)

(assert (=> b!691223 (=> (not res!455493) (not e!393503))))

(assert (=> b!691223 (= res!455493 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12998))))

(declare-fun b!691224 () Bool)

(assert (=> b!691224 (= e!393507 (contains!3653 acc!681 k!2843))))

(declare-fun b!691225 () Bool)

(assert (=> b!691225 (= e!393503 (not true))))

(assert (=> b!691225 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(assert (= (and start!61816 res!455483) b!691222))

(assert (= (and b!691222 res!455491) b!691217))

(assert (= (and b!691217 res!455490) b!691215))

(assert (= (and b!691215 res!455487) b!691211))

(assert (= (and b!691211 res!455492) b!691224))

(assert (= (and b!691211 (not res!455486)) b!691219))

(assert (= (and b!691219 res!455488) b!691221))

(assert (= (and b!691211 res!455479) b!691223))

(assert (= (and b!691223 res!455493) b!691218))

(assert (= (and b!691218 res!455485) b!691216))

(assert (= (and b!691216 res!455484) b!691214))

(assert (= (and b!691214 res!455489) b!691210))

(assert (= (and b!691210 res!455494) b!691213))

(assert (= (and b!691213 res!455480) b!691220))

(assert (= (and b!691220 res!455481) b!691212))

(assert (= (and b!691212 res!455482) b!691225))

(declare-fun m!654931 () Bool)

(assert (=> b!691225 m!654931))

(declare-fun m!654933 () Bool)

(assert (=> b!691223 m!654933))

(declare-fun m!654935 () Bool)

(assert (=> b!691212 m!654935))

(declare-fun m!654937 () Bool)

(assert (=> b!691224 m!654937))

(assert (=> b!691221 m!654937))

(declare-fun m!654939 () Bool)

(assert (=> b!691214 m!654939))

(declare-fun m!654941 () Bool)

(assert (=> b!691217 m!654941))

(declare-fun m!654943 () Bool)

(assert (=> b!691215 m!654943))

(declare-fun m!654945 () Bool)

(assert (=> b!691222 m!654945))

(declare-fun m!654947 () Bool)

(assert (=> b!691218 m!654947))

(declare-fun m!654949 () Bool)

(assert (=> start!61816 m!654949))

(declare-fun m!654951 () Bool)

(assert (=> b!691210 m!654951))

(assert (=> b!691220 m!654935))

(assert (=> b!691220 m!654935))

(declare-fun m!654953 () Bool)

(assert (=> b!691220 m!654953))

(push 1)

(assert (not start!61816))

(assert (not b!691225))

(assert (not b!691210))

(assert (not b!691224))

(assert (not b!691214))

(assert (not b!691220))

(assert (not b!691215))

(assert (not b!691221))

(assert (not b!691223))

(assert (not b!691222))

(assert (not b!691218))

(assert (not b!691217))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

