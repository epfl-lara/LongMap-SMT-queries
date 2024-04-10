; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60296 () Bool)

(assert start!60296)

(declare-fun b!676714 () Bool)

(declare-fun res!443155 () Bool)

(declare-fun e!385900 () Bool)

(assert (=> b!676714 (=> (not res!443155) (not e!385900))))

(declare-datatypes ((List!12905 0))(
  ( (Nil!12902) (Cons!12901 (h!13946 (_ BitVec 64)) (t!19133 List!12905)) )
))
(declare-fun acc!681 () List!12905)

(declare-fun contains!3482 (List!12905 (_ BitVec 64)) Bool)

(assert (=> b!676714 (= res!443155 (not (contains!3482 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676715 () Bool)

(declare-fun res!443145 () Bool)

(assert (=> b!676715 (=> (not res!443145) (not e!385900))))

(declare-fun noDuplicate!729 (List!12905) Bool)

(assert (=> b!676715 (= res!443145 (noDuplicate!729 acc!681))))

(declare-fun b!676716 () Bool)

(declare-fun res!443158 () Bool)

(assert (=> b!676716 (=> (not res!443158) (not e!385900))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39343 0))(
  ( (array!39344 (arr!18864 (Array (_ BitVec 32) (_ BitVec 64))) (size!19228 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39343)

(assert (=> b!676716 (= res!443158 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19228 a!3626))))))

(declare-fun b!676717 () Bool)

(declare-fun res!443151 () Bool)

(assert (=> b!676717 (=> (not res!443151) (not e!385900))))

(assert (=> b!676717 (= res!443151 (not (contains!3482 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676718 () Bool)

(declare-fun e!385901 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!676718 (= e!385901 (not (contains!3482 acc!681 k!2843)))))

(declare-fun b!676719 () Bool)

(declare-fun res!443146 () Bool)

(assert (=> b!676719 (=> (not res!443146) (not e!385900))))

(declare-fun e!385898 () Bool)

(assert (=> b!676719 (= res!443146 e!385898)))

(declare-fun res!443149 () Bool)

(assert (=> b!676719 (=> res!443149 e!385898)))

(declare-fun e!385897 () Bool)

(assert (=> b!676719 (= res!443149 e!385897)))

(declare-fun res!443154 () Bool)

(assert (=> b!676719 (=> (not res!443154) (not e!385897))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!676719 (= res!443154 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676720 () Bool)

(declare-fun e!385899 () Bool)

(assert (=> b!676720 (= e!385899 e!385901)))

(declare-fun res!443144 () Bool)

(assert (=> b!676720 (=> (not res!443144) (not e!385901))))

(assert (=> b!676720 (= res!443144 (bvsle from!3004 i!1382))))

(declare-fun b!676721 () Bool)

(assert (=> b!676721 (= e!385897 (contains!3482 acc!681 k!2843))))

(declare-fun b!676722 () Bool)

(declare-fun res!443152 () Bool)

(assert (=> b!676722 (=> (not res!443152) (not e!385900))))

(declare-fun arrayNoDuplicates!0 (array!39343 (_ BitVec 32) List!12905) Bool)

(assert (=> b!676722 (= res!443152 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12902))))

(declare-fun res!443143 () Bool)

(assert (=> start!60296 (=> (not res!443143) (not e!385900))))

(assert (=> start!60296 (= res!443143 (and (bvslt (size!19228 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19228 a!3626))))))

(assert (=> start!60296 e!385900))

(assert (=> start!60296 true))

(declare-fun array_inv!14660 (array!39343) Bool)

(assert (=> start!60296 (array_inv!14660 a!3626)))

(declare-fun b!676723 () Bool)

(declare-fun e!385902 () Bool)

(assert (=> b!676723 (= e!385902 (not (contains!3482 acc!681 k!2843)))))

(declare-fun b!676724 () Bool)

(declare-fun res!443147 () Bool)

(assert (=> b!676724 (=> (not res!443147) (not e!385900))))

(assert (=> b!676724 (= res!443147 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19228 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!676725 () Bool)

(declare-fun res!443156 () Bool)

(assert (=> b!676725 (=> (not res!443156) (not e!385900))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!676725 (= res!443156 (validKeyInArray!0 k!2843))))

(declare-fun b!676726 () Bool)

(declare-fun res!443142 () Bool)

(assert (=> b!676726 (=> (not res!443142) (not e!385900))))

(declare-fun arrayContainsKey!0 (array!39343 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!676726 (= res!443142 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!676727 () Bool)

(declare-fun res!443157 () Bool)

(assert (=> b!676727 (=> (not res!443157) (not e!385900))))

(assert (=> b!676727 (= res!443157 e!385899)))

(declare-fun res!443148 () Bool)

(assert (=> b!676727 (=> res!443148 e!385899)))

(declare-fun e!385895 () Bool)

(assert (=> b!676727 (= res!443148 e!385895)))

(declare-fun res!443150 () Bool)

(assert (=> b!676727 (=> (not res!443150) (not e!385895))))

(assert (=> b!676727 (= res!443150 (bvsgt from!3004 i!1382))))

(declare-fun b!676728 () Bool)

(assert (=> b!676728 (= e!385900 false)))

(declare-fun lt!312790 () Bool)

(assert (=> b!676728 (= lt!312790 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!676729 () Bool)

(assert (=> b!676729 (= e!385898 e!385902)))

(declare-fun res!443159 () Bool)

(assert (=> b!676729 (=> (not res!443159) (not e!385902))))

(assert (=> b!676729 (= res!443159 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676730 () Bool)

(assert (=> b!676730 (= e!385895 (contains!3482 acc!681 k!2843))))

(declare-fun b!676731 () Bool)

(declare-fun res!443141 () Bool)

(assert (=> b!676731 (=> (not res!443141) (not e!385900))))

(assert (=> b!676731 (= res!443141 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!676732 () Bool)

(declare-fun res!443140 () Bool)

(assert (=> b!676732 (=> (not res!443140) (not e!385900))))

(assert (=> b!676732 (= res!443140 (not (validKeyInArray!0 (select (arr!18864 a!3626) from!3004))))))

(declare-fun b!676733 () Bool)

(declare-fun res!443153 () Bool)

(assert (=> b!676733 (=> (not res!443153) (not e!385900))))

(assert (=> b!676733 (= res!443153 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!60296 res!443143) b!676715))

(assert (= (and b!676715 res!443145) b!676714))

(assert (= (and b!676714 res!443155) b!676717))

(assert (= (and b!676717 res!443151) b!676727))

(assert (= (and b!676727 res!443150) b!676730))

(assert (= (and b!676727 (not res!443148)) b!676720))

(assert (= (and b!676720 res!443144) b!676718))

(assert (= (and b!676727 res!443157) b!676722))

(assert (= (and b!676722 res!443152) b!676733))

(assert (= (and b!676733 res!443153) b!676716))

(assert (= (and b!676716 res!443158) b!676725))

(assert (= (and b!676725 res!443156) b!676726))

(assert (= (and b!676726 res!443142) b!676724))

(assert (= (and b!676724 res!443147) b!676732))

(assert (= (and b!676732 res!443140) b!676731))

(assert (= (and b!676731 res!443141) b!676719))

(assert (= (and b!676719 res!443154) b!676721))

(assert (= (and b!676719 (not res!443149)) b!676729))

(assert (= (and b!676729 res!443159) b!676723))

(assert (= (and b!676719 res!443146) b!676728))

(declare-fun m!643403 () Bool)

(assert (=> b!676732 m!643403))

(assert (=> b!676732 m!643403))

(declare-fun m!643405 () Bool)

(assert (=> b!676732 m!643405))

(declare-fun m!643407 () Bool)

(assert (=> b!676717 m!643407))

(declare-fun m!643409 () Bool)

(assert (=> b!676728 m!643409))

(declare-fun m!643411 () Bool)

(assert (=> b!676725 m!643411))

(declare-fun m!643413 () Bool)

(assert (=> b!676722 m!643413))

(declare-fun m!643415 () Bool)

(assert (=> b!676733 m!643415))

(declare-fun m!643417 () Bool)

(assert (=> b!676714 m!643417))

(declare-fun m!643419 () Bool)

(assert (=> b!676730 m!643419))

(assert (=> b!676723 m!643419))

(declare-fun m!643421 () Bool)

(assert (=> start!60296 m!643421))

(declare-fun m!643423 () Bool)

(assert (=> b!676715 m!643423))

(assert (=> b!676718 m!643419))

(assert (=> b!676721 m!643419))

(declare-fun m!643425 () Bool)

(assert (=> b!676726 m!643425))

(push 1)

(assert (not b!676715))

(assert (not b!676730))

(assert (not b!676723))

(assert (not b!676717))

(assert (not b!676714))

(assert (not b!676732))

(assert (not b!676721))

(assert (not b!676718))

(assert (not b!676725))

(assert (not b!676728))

(assert (not start!60296))

(assert (not b!676722))

(assert (not b!676733))

(assert (not b!676726))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

