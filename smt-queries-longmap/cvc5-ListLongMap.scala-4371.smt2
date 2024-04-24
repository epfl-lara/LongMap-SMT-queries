; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60316 () Bool)

(assert start!60316)

(declare-fun b!675798 () Bool)

(declare-fun res!442121 () Bool)

(declare-fun e!385585 () Bool)

(assert (=> b!675798 (=> (not res!442121) (not e!385585))))

(declare-datatypes ((array!39301 0))(
  ( (array!39302 (arr!18840 (Array (_ BitVec 32) (_ BitVec 64))) (size!19204 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39301)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39301 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!675798 (= res!442121 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun res!442113 () Bool)

(assert (=> start!60316 (=> (not res!442113) (not e!385585))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60316 (= res!442113 (and (bvslt (size!19204 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19204 a!3626))))))

(assert (=> start!60316 e!385585))

(assert (=> start!60316 true))

(declare-fun array_inv!14699 (array!39301) Bool)

(assert (=> start!60316 (array_inv!14699 a!3626)))

(declare-fun b!675799 () Bool)

(declare-fun e!385583 () Bool)

(declare-fun e!385586 () Bool)

(assert (=> b!675799 (= e!385583 e!385586)))

(declare-fun res!442118 () Bool)

(assert (=> b!675799 (=> (not res!442118) (not e!385586))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!675799 (= res!442118 (bvsle from!3004 i!1382))))

(declare-fun b!675800 () Bool)

(assert (=> b!675800 (= e!385585 false)))

(declare-fun lt!312835 () Bool)

(declare-datatypes ((List!12788 0))(
  ( (Nil!12785) (Cons!12784 (h!13832 (_ BitVec 64)) (t!19008 List!12788)) )
))
(declare-fun acc!681 () List!12788)

(declare-fun arrayNoDuplicates!0 (array!39301 (_ BitVec 32) List!12788) Bool)

(assert (=> b!675800 (= lt!312835 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!675801 () Bool)

(declare-fun contains!3440 (List!12788 (_ BitVec 64)) Bool)

(assert (=> b!675801 (= e!385586 (not (contains!3440 acc!681 k!2843)))))

(declare-fun b!675802 () Bool)

(declare-fun res!442131 () Bool)

(assert (=> b!675802 (=> (not res!442131) (not e!385585))))

(assert (=> b!675802 (= res!442131 e!385583)))

(declare-fun res!442123 () Bool)

(assert (=> b!675802 (=> res!442123 e!385583)))

(declare-fun e!385584 () Bool)

(assert (=> b!675802 (= res!442123 e!385584)))

(declare-fun res!442128 () Bool)

(assert (=> b!675802 (=> (not res!442128) (not e!385584))))

(assert (=> b!675802 (= res!442128 (bvsgt from!3004 i!1382))))

(declare-fun b!675803 () Bool)

(declare-fun res!442122 () Bool)

(assert (=> b!675803 (=> (not res!442122) (not e!385585))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!675803 (= res!442122 (validKeyInArray!0 k!2843))))

(declare-fun b!675804 () Bool)

(declare-fun res!442115 () Bool)

(assert (=> b!675804 (=> (not res!442115) (not e!385585))))

(declare-fun e!385587 () Bool)

(assert (=> b!675804 (= res!442115 e!385587)))

(declare-fun res!442124 () Bool)

(assert (=> b!675804 (=> res!442124 e!385587)))

(declare-fun e!385582 () Bool)

(assert (=> b!675804 (= res!442124 e!385582)))

(declare-fun res!442130 () Bool)

(assert (=> b!675804 (=> (not res!442130) (not e!385582))))

(assert (=> b!675804 (= res!442130 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675805 () Bool)

(declare-fun res!442114 () Bool)

(assert (=> b!675805 (=> (not res!442114) (not e!385585))))

(assert (=> b!675805 (= res!442114 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19204 a!3626))))))

(declare-fun b!675806 () Bool)

(declare-fun res!442127 () Bool)

(assert (=> b!675806 (=> (not res!442127) (not e!385585))))

(assert (=> b!675806 (= res!442127 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!675807 () Bool)

(declare-fun res!442125 () Bool)

(assert (=> b!675807 (=> (not res!442125) (not e!385585))))

(assert (=> b!675807 (= res!442125 (not (contains!3440 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675808 () Bool)

(declare-fun res!442129 () Bool)

(assert (=> b!675808 (=> (not res!442129) (not e!385585))))

(assert (=> b!675808 (= res!442129 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12785))))

(declare-fun b!675809 () Bool)

(declare-fun res!442126 () Bool)

(assert (=> b!675809 (=> (not res!442126) (not e!385585))))

(assert (=> b!675809 (= res!442126 (not (contains!3440 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675810 () Bool)

(declare-fun res!442120 () Bool)

(assert (=> b!675810 (=> (not res!442120) (not e!385585))))

(assert (=> b!675810 (= res!442120 (not (validKeyInArray!0 (select (arr!18840 a!3626) from!3004))))))

(declare-fun b!675811 () Bool)

(declare-fun res!442117 () Bool)

(assert (=> b!675811 (=> (not res!442117) (not e!385585))))

(assert (=> b!675811 (= res!442117 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!675812 () Bool)

(declare-fun res!442132 () Bool)

(assert (=> b!675812 (=> (not res!442132) (not e!385585))))

(assert (=> b!675812 (= res!442132 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19204 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!675813 () Bool)

(assert (=> b!675813 (= e!385584 (contains!3440 acc!681 k!2843))))

(declare-fun b!675814 () Bool)

(declare-fun e!385581 () Bool)

(assert (=> b!675814 (= e!385581 (not (contains!3440 acc!681 k!2843)))))

(declare-fun b!675815 () Bool)

(assert (=> b!675815 (= e!385582 (contains!3440 acc!681 k!2843))))

(declare-fun b!675816 () Bool)

(declare-fun res!442116 () Bool)

(assert (=> b!675816 (=> (not res!442116) (not e!385585))))

(declare-fun noDuplicate!714 (List!12788) Bool)

(assert (=> b!675816 (= res!442116 (noDuplicate!714 acc!681))))

(declare-fun b!675817 () Bool)

(assert (=> b!675817 (= e!385587 e!385581)))

(declare-fun res!442119 () Bool)

(assert (=> b!675817 (=> (not res!442119) (not e!385581))))

(assert (=> b!675817 (= res!442119 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(assert (= (and start!60316 res!442113) b!675816))

(assert (= (and b!675816 res!442116) b!675809))

(assert (= (and b!675809 res!442126) b!675807))

(assert (= (and b!675807 res!442125) b!675802))

(assert (= (and b!675802 res!442128) b!675813))

(assert (= (and b!675802 (not res!442123)) b!675799))

(assert (= (and b!675799 res!442118) b!675801))

(assert (= (and b!675802 res!442131) b!675808))

(assert (= (and b!675808 res!442129) b!675806))

(assert (= (and b!675806 res!442127) b!675805))

(assert (= (and b!675805 res!442114) b!675803))

(assert (= (and b!675803 res!442122) b!675798))

(assert (= (and b!675798 res!442121) b!675812))

(assert (= (and b!675812 res!442132) b!675810))

(assert (= (and b!675810 res!442120) b!675811))

(assert (= (and b!675811 res!442117) b!675804))

(assert (= (and b!675804 res!442130) b!675815))

(assert (= (and b!675804 (not res!442124)) b!675817))

(assert (= (and b!675817 res!442119) b!675814))

(assert (= (and b!675804 res!442115) b!675800))

(declare-fun m!643645 () Bool)

(assert (=> b!675798 m!643645))

(declare-fun m!643647 () Bool)

(assert (=> b!675810 m!643647))

(assert (=> b!675810 m!643647))

(declare-fun m!643649 () Bool)

(assert (=> b!675810 m!643649))

(declare-fun m!643651 () Bool)

(assert (=> b!675814 m!643651))

(declare-fun m!643653 () Bool)

(assert (=> b!675807 m!643653))

(declare-fun m!643655 () Bool)

(assert (=> b!675808 m!643655))

(assert (=> b!675801 m!643651))

(declare-fun m!643657 () Bool)

(assert (=> b!675803 m!643657))

(declare-fun m!643659 () Bool)

(assert (=> b!675800 m!643659))

(declare-fun m!643661 () Bool)

(assert (=> b!675806 m!643661))

(assert (=> b!675813 m!643651))

(declare-fun m!643663 () Bool)

(assert (=> b!675809 m!643663))

(assert (=> b!675815 m!643651))

(declare-fun m!643665 () Bool)

(assert (=> start!60316 m!643665))

(declare-fun m!643667 () Bool)

(assert (=> b!675816 m!643667))

(push 1)

(assert (not b!675807))

(assert (not b!675813))

(assert (not b!675815))

(assert (not b!675814))

(assert (not b!675798))

(assert (not b!675801))

(assert (not b!675816))

(assert (not b!675809))

(assert (not b!675810))

(assert (not b!675808))

(assert (not b!675803))

(assert (not b!675806))

(assert (not b!675800))

(assert (not start!60316))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

