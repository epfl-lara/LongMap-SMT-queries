; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60246 () Bool)

(assert start!60246)

(declare-fun b!675214 () Bool)

(declare-fun res!441657 () Bool)

(declare-fun e!385301 () Bool)

(assert (=> b!675214 (=> (not res!441657) (not e!385301))))

(declare-fun e!385295 () Bool)

(assert (=> b!675214 (= res!441657 e!385295)))

(declare-fun res!441645 () Bool)

(assert (=> b!675214 (=> res!441645 e!385295)))

(declare-fun e!385298 () Bool)

(assert (=> b!675214 (= res!441645 e!385298)))

(declare-fun res!441652 () Bool)

(assert (=> b!675214 (=> (not res!441652) (not e!385298))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!675214 (= res!441652 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675215 () Bool)

(declare-fun res!441644 () Bool)

(assert (=> b!675215 (=> (not res!441644) (not e!385301))))

(declare-datatypes ((array!39293 0))(
  ( (array!39294 (arr!18839 (Array (_ BitVec 32) (_ BitVec 64))) (size!19203 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39293)

(declare-datatypes ((List!12880 0))(
  ( (Nil!12877) (Cons!12876 (h!13921 (_ BitVec 64)) (t!19108 List!12880)) )
))
(declare-fun acc!681 () List!12880)

(declare-fun arrayNoDuplicates!0 (array!39293 (_ BitVec 32) List!12880) Bool)

(assert (=> b!675215 (= res!441644 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!675216 () Bool)

(declare-fun res!441646 () Bool)

(assert (=> b!675216 (=> (not res!441646) (not e!385301))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!675216 (= res!441646 (not (validKeyInArray!0 (select (arr!18839 a!3626) from!3004))))))

(declare-fun b!675218 () Bool)

(declare-fun e!385302 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3457 (List!12880 (_ BitVec 64)) Bool)

(assert (=> b!675218 (= e!385302 (not (contains!3457 acc!681 k!2843)))))

(declare-fun b!675219 () Bool)

(declare-fun res!441643 () Bool)

(assert (=> b!675219 (=> (not res!441643) (not e!385301))))

(assert (=> b!675219 (= res!441643 (not (contains!3457 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675220 () Bool)

(declare-fun res!441649 () Bool)

(assert (=> b!675220 (=> (not res!441649) (not e!385301))))

(assert (=> b!675220 (= res!441649 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12877))))

(declare-fun b!675221 () Bool)

(declare-fun res!441642 () Bool)

(assert (=> b!675221 (=> (not res!441642) (not e!385301))))

(assert (=> b!675221 (= res!441642 (validKeyInArray!0 k!2843))))

(declare-fun b!675222 () Bool)

(declare-fun e!385300 () Bool)

(assert (=> b!675222 (= e!385300 (not (contains!3457 acc!681 k!2843)))))

(declare-fun b!675223 () Bool)

(declare-fun res!441655 () Bool)

(assert (=> b!675223 (=> (not res!441655) (not e!385301))))

(declare-fun e!385296 () Bool)

(assert (=> b!675223 (= res!441655 e!385296)))

(declare-fun res!441656 () Bool)

(assert (=> b!675223 (=> res!441656 e!385296)))

(declare-fun e!385299 () Bool)

(assert (=> b!675223 (= res!441656 e!385299)))

(declare-fun res!441650 () Bool)

(assert (=> b!675223 (=> (not res!441650) (not e!385299))))

(assert (=> b!675223 (= res!441650 (bvsgt from!3004 i!1382))))

(declare-fun b!675224 () Bool)

(assert (=> b!675224 (= e!385296 e!385300)))

(declare-fun res!441658 () Bool)

(assert (=> b!675224 (=> (not res!441658) (not e!385300))))

(assert (=> b!675224 (= res!441658 (bvsle from!3004 i!1382))))

(declare-fun b!675225 () Bool)

(declare-fun res!441640 () Bool)

(assert (=> b!675225 (=> (not res!441640) (not e!385301))))

(assert (=> b!675225 (= res!441640 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19203 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!675226 () Bool)

(assert (=> b!675226 (= e!385301 false)))

(declare-fun lt!312715 () Bool)

(assert (=> b!675226 (= lt!312715 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!675227 () Bool)

(assert (=> b!675227 (= e!385295 e!385302)))

(declare-fun res!441653 () Bool)

(assert (=> b!675227 (=> (not res!441653) (not e!385302))))

(assert (=> b!675227 (= res!441653 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675228 () Bool)

(declare-fun res!441641 () Bool)

(assert (=> b!675228 (=> (not res!441641) (not e!385301))))

(assert (=> b!675228 (= res!441641 (not (contains!3457 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675229 () Bool)

(declare-fun res!441659 () Bool)

(assert (=> b!675229 (=> (not res!441659) (not e!385301))))

(assert (=> b!675229 (= res!441659 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19203 a!3626))))))

(declare-fun res!441648 () Bool)

(assert (=> start!60246 (=> (not res!441648) (not e!385301))))

(assert (=> start!60246 (= res!441648 (and (bvslt (size!19203 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19203 a!3626))))))

(assert (=> start!60246 e!385301))

(assert (=> start!60246 true))

(declare-fun array_inv!14635 (array!39293) Bool)

(assert (=> start!60246 (array_inv!14635 a!3626)))

(declare-fun b!675217 () Bool)

(assert (=> b!675217 (= e!385298 (contains!3457 acc!681 k!2843))))

(declare-fun b!675230 () Bool)

(assert (=> b!675230 (= e!385299 (contains!3457 acc!681 k!2843))))

(declare-fun b!675231 () Bool)

(declare-fun res!441647 () Bool)

(assert (=> b!675231 (=> (not res!441647) (not e!385301))))

(declare-fun arrayContainsKey!0 (array!39293 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!675231 (= res!441647 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!675232 () Bool)

(declare-fun res!441654 () Bool)

(assert (=> b!675232 (=> (not res!441654) (not e!385301))))

(assert (=> b!675232 (= res!441654 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!675233 () Bool)

(declare-fun res!441651 () Bool)

(assert (=> b!675233 (=> (not res!441651) (not e!385301))))

(declare-fun noDuplicate!704 (List!12880) Bool)

(assert (=> b!675233 (= res!441651 (noDuplicate!704 acc!681))))

(assert (= (and start!60246 res!441648) b!675233))

(assert (= (and b!675233 res!441651) b!675219))

(assert (= (and b!675219 res!441643) b!675228))

(assert (= (and b!675228 res!441641) b!675223))

(assert (= (and b!675223 res!441650) b!675230))

(assert (= (and b!675223 (not res!441656)) b!675224))

(assert (= (and b!675224 res!441658) b!675222))

(assert (= (and b!675223 res!441655) b!675220))

(assert (= (and b!675220 res!441649) b!675215))

(assert (= (and b!675215 res!441644) b!675229))

(assert (= (and b!675229 res!441659) b!675221))

(assert (= (and b!675221 res!441642) b!675231))

(assert (= (and b!675231 res!441647) b!675225))

(assert (= (and b!675225 res!441640) b!675216))

(assert (= (and b!675216 res!441646) b!675232))

(assert (= (and b!675232 res!441654) b!675214))

(assert (= (and b!675214 res!441652) b!675217))

(assert (= (and b!675214 (not res!441645)) b!675227))

(assert (= (and b!675227 res!441653) b!675218))

(assert (= (and b!675214 res!441657) b!675226))

(declare-fun m!642803 () Bool)

(assert (=> b!675226 m!642803))

(declare-fun m!642805 () Bool)

(assert (=> b!675231 m!642805))

(declare-fun m!642807 () Bool)

(assert (=> b!675216 m!642807))

(assert (=> b!675216 m!642807))

(declare-fun m!642809 () Bool)

(assert (=> b!675216 m!642809))

(declare-fun m!642811 () Bool)

(assert (=> b!675219 m!642811))

(declare-fun m!642813 () Bool)

(assert (=> b!675218 m!642813))

(declare-fun m!642815 () Bool)

(assert (=> b!675233 m!642815))

(declare-fun m!642817 () Bool)

(assert (=> start!60246 m!642817))

(assert (=> b!675230 m!642813))

(assert (=> b!675217 m!642813))

(declare-fun m!642819 () Bool)

(assert (=> b!675220 m!642819))

(assert (=> b!675222 m!642813))

(declare-fun m!642821 () Bool)

(assert (=> b!675228 m!642821))

(declare-fun m!642823 () Bool)

(assert (=> b!675215 m!642823))

(declare-fun m!642825 () Bool)

(assert (=> b!675221 m!642825))

(push 1)

(assert (not b!675222))

(assert (not b!675218))

(assert (not b!675221))

(assert (not b!675228))

(assert (not b!675226))

(assert (not b!675219))

(assert (not b!675231))

(assert (not b!675233))

(assert (not b!675215))

(assert (not start!60246))

(assert (not b!675216))

(assert (not b!675220))

(assert (not b!675217))

(assert (not b!675230))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

