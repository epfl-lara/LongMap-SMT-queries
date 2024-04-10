; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60266 () Bool)

(assert start!60266)

(declare-fun b!675814 () Bool)

(declare-fun res!442259 () Bool)

(declare-fun e!385537 () Bool)

(assert (=> b!675814 (=> (not res!442259) (not e!385537))))

(declare-datatypes ((List!12890 0))(
  ( (Nil!12887) (Cons!12886 (h!13931 (_ BitVec 64)) (t!19118 List!12890)) )
))
(declare-fun acc!681 () List!12890)

(declare-fun noDuplicate!714 (List!12890) Bool)

(assert (=> b!675814 (= res!442259 (noDuplicate!714 acc!681))))

(declare-fun b!675815 () Bool)

(declare-fun res!442254 () Bool)

(assert (=> b!675815 (=> (not res!442254) (not e!385537))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!675815 (= res!442254 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!675816 () Bool)

(declare-fun e!385538 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3467 (List!12890 (_ BitVec 64)) Bool)

(assert (=> b!675816 (= e!385538 (not (contains!3467 acc!681 k!2843)))))

(declare-fun b!675817 () Bool)

(declare-fun res!442246 () Bool)

(assert (=> b!675817 (=> (not res!442246) (not e!385537))))

(declare-datatypes ((array!39313 0))(
  ( (array!39314 (arr!18849 (Array (_ BitVec 32) (_ BitVec 64))) (size!19213 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39313)

(declare-fun arrayNoDuplicates!0 (array!39313 (_ BitVec 32) List!12890) Bool)

(assert (=> b!675817 (= res!442246 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!675818 () Bool)

(declare-fun e!385542 () Bool)

(assert (=> b!675818 (= e!385542 (contains!3467 acc!681 k!2843))))

(declare-fun b!675819 () Bool)

(declare-fun e!385541 () Bool)

(assert (=> b!675819 (= e!385541 (contains!3467 acc!681 k!2843))))

(declare-fun b!675820 () Bool)

(declare-fun res!442241 () Bool)

(assert (=> b!675820 (=> (not res!442241) (not e!385537))))

(assert (=> b!675820 (= res!442241 (not (contains!3467 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675821 () Bool)

(declare-fun res!442243 () Bool)

(assert (=> b!675821 (=> (not res!442243) (not e!385537))))

(declare-fun e!385539 () Bool)

(assert (=> b!675821 (= res!442243 e!385539)))

(declare-fun res!442244 () Bool)

(assert (=> b!675821 (=> res!442244 e!385539)))

(assert (=> b!675821 (= res!442244 e!385541)))

(declare-fun res!442249 () Bool)

(assert (=> b!675821 (=> (not res!442249) (not e!385541))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!675821 (= res!442249 (bvsgt from!3004 i!1382))))

(declare-fun b!675822 () Bool)

(declare-fun res!442251 () Bool)

(assert (=> b!675822 (=> (not res!442251) (not e!385537))))

(declare-fun arrayContainsKey!0 (array!39313 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!675822 (= res!442251 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!675823 () Bool)

(declare-fun res!442250 () Bool)

(assert (=> b!675823 (=> (not res!442250) (not e!385537))))

(declare-fun e!385536 () Bool)

(assert (=> b!675823 (= res!442250 e!385536)))

(declare-fun res!442242 () Bool)

(assert (=> b!675823 (=> res!442242 e!385536)))

(assert (=> b!675823 (= res!442242 e!385542)))

(declare-fun res!442258 () Bool)

(assert (=> b!675823 (=> (not res!442258) (not e!385542))))

(assert (=> b!675823 (= res!442258 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun res!442253 () Bool)

(assert (=> start!60266 (=> (not res!442253) (not e!385537))))

(assert (=> start!60266 (= res!442253 (and (bvslt (size!19213 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19213 a!3626))))))

(assert (=> start!60266 e!385537))

(assert (=> start!60266 true))

(declare-fun array_inv!14645 (array!39313) Bool)

(assert (=> start!60266 (array_inv!14645 a!3626)))

(declare-fun b!675824 () Bool)

(declare-fun res!442247 () Bool)

(assert (=> b!675824 (=> (not res!442247) (not e!385537))))

(assert (=> b!675824 (= res!442247 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12887))))

(declare-fun b!675825 () Bool)

(declare-fun e!385535 () Bool)

(assert (=> b!675825 (= e!385539 e!385535)))

(declare-fun res!442252 () Bool)

(assert (=> b!675825 (=> (not res!442252) (not e!385535))))

(assert (=> b!675825 (= res!442252 (bvsle from!3004 i!1382))))

(declare-fun b!675826 () Bool)

(assert (=> b!675826 (= e!385536 e!385538)))

(declare-fun res!442255 () Bool)

(assert (=> b!675826 (=> (not res!442255) (not e!385538))))

(assert (=> b!675826 (= res!442255 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675827 () Bool)

(assert (=> b!675827 (= e!385535 (not (contains!3467 acc!681 k!2843)))))

(declare-fun b!675828 () Bool)

(declare-fun res!442256 () Bool)

(assert (=> b!675828 (=> (not res!442256) (not e!385537))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!675828 (= res!442256 (validKeyInArray!0 k!2843))))

(declare-fun b!675829 () Bool)

(declare-fun res!442240 () Bool)

(assert (=> b!675829 (=> (not res!442240) (not e!385537))))

(assert (=> b!675829 (= res!442240 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19213 a!3626))))))

(declare-fun b!675830 () Bool)

(declare-fun res!442248 () Bool)

(assert (=> b!675830 (=> (not res!442248) (not e!385537))))

(assert (=> b!675830 (= res!442248 (not (validKeyInArray!0 (select (arr!18849 a!3626) from!3004))))))

(declare-fun b!675831 () Bool)

(assert (=> b!675831 (= e!385537 false)))

(declare-fun lt!312745 () Bool)

(assert (=> b!675831 (= lt!312745 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!675832 () Bool)

(declare-fun res!442257 () Bool)

(assert (=> b!675832 (=> (not res!442257) (not e!385537))))

(assert (=> b!675832 (= res!442257 (not (contains!3467 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675833 () Bool)

(declare-fun res!442245 () Bool)

(assert (=> b!675833 (=> (not res!442245) (not e!385537))))

(assert (=> b!675833 (= res!442245 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19213 a!3626)) (not (= from!3004 i!1382))))))

(assert (= (and start!60266 res!442253) b!675814))

(assert (= (and b!675814 res!442259) b!675820))

(assert (= (and b!675820 res!442241) b!675832))

(assert (= (and b!675832 res!442257) b!675821))

(assert (= (and b!675821 res!442249) b!675819))

(assert (= (and b!675821 (not res!442244)) b!675825))

(assert (= (and b!675825 res!442252) b!675827))

(assert (= (and b!675821 res!442243) b!675824))

(assert (= (and b!675824 res!442247) b!675817))

(assert (= (and b!675817 res!442246) b!675829))

(assert (= (and b!675829 res!442240) b!675828))

(assert (= (and b!675828 res!442256) b!675822))

(assert (= (and b!675822 res!442251) b!675833))

(assert (= (and b!675833 res!442245) b!675830))

(assert (= (and b!675830 res!442248) b!675815))

(assert (= (and b!675815 res!442254) b!675823))

(assert (= (and b!675823 res!442258) b!675818))

(assert (= (and b!675823 (not res!442242)) b!675826))

(assert (= (and b!675826 res!442255) b!675816))

(assert (= (and b!675823 res!442250) b!675831))

(declare-fun m!643043 () Bool)

(assert (=> b!675827 m!643043))

(declare-fun m!643045 () Bool)

(assert (=> b!675820 m!643045))

(declare-fun m!643047 () Bool)

(assert (=> b!675828 m!643047))

(declare-fun m!643049 () Bool)

(assert (=> b!675814 m!643049))

(assert (=> b!675818 m!643043))

(declare-fun m!643051 () Bool)

(assert (=> start!60266 m!643051))

(declare-fun m!643053 () Bool)

(assert (=> b!675822 m!643053))

(declare-fun m!643055 () Bool)

(assert (=> b!675824 m!643055))

(declare-fun m!643057 () Bool)

(assert (=> b!675830 m!643057))

(assert (=> b!675830 m!643057))

(declare-fun m!643059 () Bool)

(assert (=> b!675830 m!643059))

(declare-fun m!643061 () Bool)

(assert (=> b!675831 m!643061))

(assert (=> b!675816 m!643043))

(assert (=> b!675819 m!643043))

(declare-fun m!643063 () Bool)

(assert (=> b!675817 m!643063))

(declare-fun m!643065 () Bool)

(assert (=> b!675832 m!643065))

(push 1)

(assert (not b!675830))

(assert (not b!675828))

(assert (not b!675827))

(assert (not b!675816))

(assert (not b!675814))

(assert (not b!675820))

(assert (not b!675819))

(assert (not b!675832))

(assert (not b!675817))

(assert (not b!675824))

(assert (not b!675822))

(assert (not b!675831))

(assert (not b!675818))

(assert (not start!60266))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

