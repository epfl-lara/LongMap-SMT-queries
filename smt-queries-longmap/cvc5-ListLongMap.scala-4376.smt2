; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60346 () Bool)

(assert start!60346)

(declare-fun b!676698 () Bool)

(declare-fun e!385945 () Bool)

(declare-fun e!385941 () Bool)

(assert (=> b!676698 (= e!385945 e!385941)))

(declare-fun res!443023 () Bool)

(assert (=> b!676698 (=> (not res!443023) (not e!385941))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!676698 (= res!443023 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676699 () Bool)

(declare-fun res!443015 () Bool)

(declare-fun e!385944 () Bool)

(assert (=> b!676699 (=> (not res!443015) (not e!385944))))

(assert (=> b!676699 (= res!443015 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!676700 () Bool)

(declare-fun res!443013 () Bool)

(assert (=> b!676700 (=> (not res!443013) (not e!385944))))

(declare-datatypes ((List!12803 0))(
  ( (Nil!12800) (Cons!12799 (h!13847 (_ BitVec 64)) (t!19023 List!12803)) )
))
(declare-fun acc!681 () List!12803)

(declare-fun contains!3455 (List!12803 (_ BitVec 64)) Bool)

(assert (=> b!676700 (= res!443013 (not (contains!3455 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676701 () Bool)

(declare-fun res!443029 () Bool)

(assert (=> b!676701 (=> (not res!443029) (not e!385944))))

(assert (=> b!676701 (= res!443029 (not (contains!3455 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676702 () Bool)

(declare-fun res!443019 () Bool)

(assert (=> b!676702 (=> (not res!443019) (not e!385944))))

(declare-fun e!385946 () Bool)

(assert (=> b!676702 (= res!443019 e!385946)))

(declare-fun res!443027 () Bool)

(assert (=> b!676702 (=> res!443027 e!385946)))

(declare-fun e!385940 () Bool)

(assert (=> b!676702 (= res!443027 e!385940)))

(declare-fun res!443022 () Bool)

(assert (=> b!676702 (=> (not res!443022) (not e!385940))))

(assert (=> b!676702 (= res!443022 (bvsgt from!3004 i!1382))))

(declare-fun b!676703 () Bool)

(declare-fun e!385947 () Bool)

(assert (=> b!676703 (= e!385946 e!385947)))

(declare-fun res!443016 () Bool)

(assert (=> b!676703 (=> (not res!443016) (not e!385947))))

(assert (=> b!676703 (= res!443016 (bvsle from!3004 i!1382))))

(declare-fun b!676704 () Bool)

(declare-fun res!443030 () Bool)

(assert (=> b!676704 (=> (not res!443030) (not e!385944))))

(declare-datatypes ((array!39331 0))(
  ( (array!39332 (arr!18855 (Array (_ BitVec 32) (_ BitVec 64))) (size!19219 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39331)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!676704 (= res!443030 (not (validKeyInArray!0 (select (arr!18855 a!3626) from!3004))))))

(declare-fun b!676705 () Bool)

(assert (=> b!676705 (= e!385944 false)))

(declare-fun lt!312880 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39331 (_ BitVec 32) List!12803) Bool)

(assert (=> b!676705 (= lt!312880 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!676706 () Bool)

(declare-fun res!443014 () Bool)

(assert (=> b!676706 (=> (not res!443014) (not e!385944))))

(assert (=> b!676706 (= res!443014 e!385945)))

(declare-fun res!443031 () Bool)

(assert (=> b!676706 (=> res!443031 e!385945)))

(declare-fun e!385943 () Bool)

(assert (=> b!676706 (= res!443031 e!385943)))

(declare-fun res!443020 () Bool)

(assert (=> b!676706 (=> (not res!443020) (not e!385943))))

(assert (=> b!676706 (= res!443020 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676707 () Bool)

(declare-fun res!443025 () Bool)

(assert (=> b!676707 (=> (not res!443025) (not e!385944))))

(assert (=> b!676707 (= res!443025 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19219 a!3626))))))

(declare-fun b!676708 () Bool)

(declare-fun res!443024 () Bool)

(assert (=> b!676708 (=> (not res!443024) (not e!385944))))

(assert (=> b!676708 (= res!443024 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!443021 () Bool)

(assert (=> start!60346 (=> (not res!443021) (not e!385944))))

(assert (=> start!60346 (= res!443021 (and (bvslt (size!19219 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19219 a!3626))))))

(assert (=> start!60346 e!385944))

(assert (=> start!60346 true))

(declare-fun array_inv!14714 (array!39331) Bool)

(assert (=> start!60346 (array_inv!14714 a!3626)))

(declare-fun b!676709 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!676709 (= e!385940 (contains!3455 acc!681 k!2843))))

(declare-fun b!676710 () Bool)

(declare-fun res!443018 () Bool)

(assert (=> b!676710 (=> (not res!443018) (not e!385944))))

(declare-fun arrayContainsKey!0 (array!39331 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!676710 (= res!443018 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!676711 () Bool)

(assert (=> b!676711 (= e!385941 (not (contains!3455 acc!681 k!2843)))))

(declare-fun b!676712 () Bool)

(declare-fun res!443026 () Bool)

(assert (=> b!676712 (=> (not res!443026) (not e!385944))))

(declare-fun noDuplicate!729 (List!12803) Bool)

(assert (=> b!676712 (= res!443026 (noDuplicate!729 acc!681))))

(declare-fun b!676713 () Bool)

(declare-fun res!443032 () Bool)

(assert (=> b!676713 (=> (not res!443032) (not e!385944))))

(assert (=> b!676713 (= res!443032 (validKeyInArray!0 k!2843))))

(declare-fun b!676714 () Bool)

(declare-fun res!443028 () Bool)

(assert (=> b!676714 (=> (not res!443028) (not e!385944))))

(assert (=> b!676714 (= res!443028 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19219 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!676715 () Bool)

(assert (=> b!676715 (= e!385947 (not (contains!3455 acc!681 k!2843)))))

(declare-fun b!676716 () Bool)

(assert (=> b!676716 (= e!385943 (contains!3455 acc!681 k!2843))))

(declare-fun b!676717 () Bool)

(declare-fun res!443017 () Bool)

(assert (=> b!676717 (=> (not res!443017) (not e!385944))))

(assert (=> b!676717 (= res!443017 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12800))))

(assert (= (and start!60346 res!443021) b!676712))

(assert (= (and b!676712 res!443026) b!676700))

(assert (= (and b!676700 res!443013) b!676701))

(assert (= (and b!676701 res!443029) b!676702))

(assert (= (and b!676702 res!443022) b!676709))

(assert (= (and b!676702 (not res!443027)) b!676703))

(assert (= (and b!676703 res!443016) b!676715))

(assert (= (and b!676702 res!443019) b!676717))

(assert (= (and b!676717 res!443017) b!676708))

(assert (= (and b!676708 res!443024) b!676707))

(assert (= (and b!676707 res!443025) b!676713))

(assert (= (and b!676713 res!443032) b!676710))

(assert (= (and b!676710 res!443018) b!676714))

(assert (= (and b!676714 res!443028) b!676704))

(assert (= (and b!676704 res!443030) b!676699))

(assert (= (and b!676699 res!443015) b!676706))

(assert (= (and b!676706 res!443020) b!676716))

(assert (= (and b!676706 (not res!443031)) b!676698))

(assert (= (and b!676698 res!443023) b!676711))

(assert (= (and b!676706 res!443014) b!676705))

(declare-fun m!644005 () Bool)

(assert (=> b!676701 m!644005))

(declare-fun m!644007 () Bool)

(assert (=> start!60346 m!644007))

(declare-fun m!644009 () Bool)

(assert (=> b!676704 m!644009))

(assert (=> b!676704 m!644009))

(declare-fun m!644011 () Bool)

(assert (=> b!676704 m!644011))

(declare-fun m!644013 () Bool)

(assert (=> b!676716 m!644013))

(declare-fun m!644015 () Bool)

(assert (=> b!676717 m!644015))

(declare-fun m!644017 () Bool)

(assert (=> b!676712 m!644017))

(declare-fun m!644019 () Bool)

(assert (=> b!676708 m!644019))

(declare-fun m!644021 () Bool)

(assert (=> b!676710 m!644021))

(assert (=> b!676711 m!644013))

(declare-fun m!644023 () Bool)

(assert (=> b!676705 m!644023))

(declare-fun m!644025 () Bool)

(assert (=> b!676713 m!644025))

(assert (=> b!676709 m!644013))

(assert (=> b!676715 m!644013))

(declare-fun m!644027 () Bool)

(assert (=> b!676700 m!644027))

(push 1)

(assert (not b!676713))

(assert (not b!676700))

(assert (not b!676709))

(assert (not b!676710))

(assert (not b!676716))

(assert (not b!676704))

(assert (not b!676701))

(assert (not b!676705))

(assert (not b!676708))

(assert (not b!676715))

(assert (not start!60346))

(assert (not b!676711))

(assert (not b!676717))

(assert (not b!676712))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

