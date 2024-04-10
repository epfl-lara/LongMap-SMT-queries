; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60264 () Bool)

(assert start!60264)

(declare-fun b!675754 () Bool)

(declare-fun res!442192 () Bool)

(declare-fun e!385515 () Bool)

(assert (=> b!675754 (=> (not res!442192) (not e!385515))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!675754 (= res!442192 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun res!442185 () Bool)

(assert (=> start!60264 (=> (not res!442185) (not e!385515))))

(declare-datatypes ((array!39311 0))(
  ( (array!39312 (arr!18848 (Array (_ BitVec 32) (_ BitVec 64))) (size!19212 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39311)

(assert (=> start!60264 (= res!442185 (and (bvslt (size!19212 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19212 a!3626))))))

(assert (=> start!60264 e!385515))

(assert (=> start!60264 true))

(declare-fun array_inv!14644 (array!39311) Bool)

(assert (=> start!60264 (array_inv!14644 a!3626)))

(declare-fun b!675755 () Bool)

(declare-fun res!442187 () Bool)

(assert (=> b!675755 (=> (not res!442187) (not e!385515))))

(declare-datatypes ((List!12889 0))(
  ( (Nil!12886) (Cons!12885 (h!13930 (_ BitVec 64)) (t!19117 List!12889)) )
))
(declare-fun acc!681 () List!12889)

(declare-fun contains!3466 (List!12889 (_ BitVec 64)) Bool)

(assert (=> b!675755 (= res!442187 (not (contains!3466 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675756 () Bool)

(declare-fun e!385512 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!675756 (= e!385512 (contains!3466 acc!681 k!2843))))

(declare-fun b!675757 () Bool)

(declare-fun e!385516 () Bool)

(declare-fun e!385514 () Bool)

(assert (=> b!675757 (= e!385516 e!385514)))

(declare-fun res!442182 () Bool)

(assert (=> b!675757 (=> (not res!442182) (not e!385514))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!675757 (= res!442182 (bvsle from!3004 i!1382))))

(declare-fun b!675758 () Bool)

(declare-fun res!442183 () Bool)

(assert (=> b!675758 (=> (not res!442183) (not e!385515))))

(assert (=> b!675758 (= res!442183 (not (contains!3466 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675759 () Bool)

(declare-fun res!442189 () Bool)

(assert (=> b!675759 (=> (not res!442189) (not e!385515))))

(assert (=> b!675759 (= res!442189 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19212 a!3626))))))

(declare-fun b!675760 () Bool)

(declare-fun e!385517 () Bool)

(assert (=> b!675760 (= e!385517 (contains!3466 acc!681 k!2843))))

(declare-fun b!675761 () Bool)

(assert (=> b!675761 (= e!385515 false)))

(declare-fun lt!312742 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39311 (_ BitVec 32) List!12889) Bool)

(assert (=> b!675761 (= lt!312742 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!675762 () Bool)

(declare-fun res!442196 () Bool)

(assert (=> b!675762 (=> (not res!442196) (not e!385515))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!675762 (= res!442196 (not (validKeyInArray!0 (select (arr!18848 a!3626) from!3004))))))

(declare-fun b!675763 () Bool)

(declare-fun res!442194 () Bool)

(assert (=> b!675763 (=> (not res!442194) (not e!385515))))

(assert (=> b!675763 (= res!442194 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19212 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!675764 () Bool)

(declare-fun res!442197 () Bool)

(assert (=> b!675764 (=> (not res!442197) (not e!385515))))

(assert (=> b!675764 (= res!442197 (validKeyInArray!0 k!2843))))

(declare-fun b!675765 () Bool)

(declare-fun e!385511 () Bool)

(assert (=> b!675765 (= e!385511 (not (contains!3466 acc!681 k!2843)))))

(declare-fun b!675766 () Bool)

(declare-fun res!442190 () Bool)

(assert (=> b!675766 (=> (not res!442190) (not e!385515))))

(assert (=> b!675766 (= res!442190 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!675767 () Bool)

(declare-fun res!442186 () Bool)

(assert (=> b!675767 (=> (not res!442186) (not e!385515))))

(assert (=> b!675767 (= res!442186 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12886))))

(declare-fun b!675768 () Bool)

(declare-fun res!442191 () Bool)

(assert (=> b!675768 (=> (not res!442191) (not e!385515))))

(declare-fun noDuplicate!713 (List!12889) Bool)

(assert (=> b!675768 (= res!442191 (noDuplicate!713 acc!681))))

(declare-fun b!675769 () Bool)

(declare-fun res!442195 () Bool)

(assert (=> b!675769 (=> (not res!442195) (not e!385515))))

(assert (=> b!675769 (= res!442195 e!385516)))

(declare-fun res!442193 () Bool)

(assert (=> b!675769 (=> res!442193 e!385516)))

(assert (=> b!675769 (= res!442193 e!385517)))

(declare-fun res!442198 () Bool)

(assert (=> b!675769 (=> (not res!442198) (not e!385517))))

(assert (=> b!675769 (= res!442198 (bvsgt from!3004 i!1382))))

(declare-fun b!675770 () Bool)

(declare-fun res!442181 () Bool)

(assert (=> b!675770 (=> (not res!442181) (not e!385515))))

(declare-fun e!385513 () Bool)

(assert (=> b!675770 (= res!442181 e!385513)))

(declare-fun res!442180 () Bool)

(assert (=> b!675770 (=> res!442180 e!385513)))

(assert (=> b!675770 (= res!442180 e!385512)))

(declare-fun res!442188 () Bool)

(assert (=> b!675770 (=> (not res!442188) (not e!385512))))

(assert (=> b!675770 (= res!442188 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675771 () Bool)

(assert (=> b!675771 (= e!385513 e!385511)))

(declare-fun res!442184 () Bool)

(assert (=> b!675771 (=> (not res!442184) (not e!385511))))

(assert (=> b!675771 (= res!442184 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675772 () Bool)

(declare-fun res!442199 () Bool)

(assert (=> b!675772 (=> (not res!442199) (not e!385515))))

(declare-fun arrayContainsKey!0 (array!39311 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!675772 (= res!442199 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!675773 () Bool)

(assert (=> b!675773 (= e!385514 (not (contains!3466 acc!681 k!2843)))))

(assert (= (and start!60264 res!442185) b!675768))

(assert (= (and b!675768 res!442191) b!675755))

(assert (= (and b!675755 res!442187) b!675758))

(assert (= (and b!675758 res!442183) b!675769))

(assert (= (and b!675769 res!442198) b!675760))

(assert (= (and b!675769 (not res!442193)) b!675757))

(assert (= (and b!675757 res!442182) b!675773))

(assert (= (and b!675769 res!442195) b!675767))

(assert (= (and b!675767 res!442186) b!675766))

(assert (= (and b!675766 res!442190) b!675759))

(assert (= (and b!675759 res!442189) b!675764))

(assert (= (and b!675764 res!442197) b!675772))

(assert (= (and b!675772 res!442199) b!675763))

(assert (= (and b!675763 res!442194) b!675762))

(assert (= (and b!675762 res!442196) b!675754))

(assert (= (and b!675754 res!442192) b!675770))

(assert (= (and b!675770 res!442188) b!675756))

(assert (= (and b!675770 (not res!442180)) b!675771))

(assert (= (and b!675771 res!442184) b!675765))

(assert (= (and b!675770 res!442181) b!675761))

(declare-fun m!643019 () Bool)

(assert (=> b!675756 m!643019))

(declare-fun m!643021 () Bool)

(assert (=> b!675761 m!643021))

(assert (=> b!675765 m!643019))

(declare-fun m!643023 () Bool)

(assert (=> b!675758 m!643023))

(declare-fun m!643025 () Bool)

(assert (=> b!675755 m!643025))

(declare-fun m!643027 () Bool)

(assert (=> b!675764 m!643027))

(declare-fun m!643029 () Bool)

(assert (=> b!675768 m!643029))

(declare-fun m!643031 () Bool)

(assert (=> b!675772 m!643031))

(assert (=> b!675760 m!643019))

(declare-fun m!643033 () Bool)

(assert (=> start!60264 m!643033))

(assert (=> b!675773 m!643019))

(declare-fun m!643035 () Bool)

(assert (=> b!675762 m!643035))

(assert (=> b!675762 m!643035))

(declare-fun m!643037 () Bool)

(assert (=> b!675762 m!643037))

(declare-fun m!643039 () Bool)

(assert (=> b!675766 m!643039))

(declare-fun m!643041 () Bool)

(assert (=> b!675767 m!643041))

(push 1)

(assert (not b!675765))

(assert (not b!675761))

(assert (not b!675756))

(assert (not b!675766))

(assert (not b!675764))

(assert (not b!675772))

(assert (not b!675758))

(assert (not b!675755))

(assert (not start!60264))

(assert (not b!675760))

(assert (not b!675773))

(assert (not b!675768))

(assert (not b!675762))

(assert (not b!675767))

(check-sat)

(pop 1)

