; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60244 () Bool)

(assert start!60244)

(declare-fun b!675154 () Bool)

(declare-fun e!385275 () Bool)

(declare-datatypes ((List!12879 0))(
  ( (Nil!12876) (Cons!12875 (h!13920 (_ BitVec 64)) (t!19107 List!12879)) )
))
(declare-fun acc!681 () List!12879)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3456 (List!12879 (_ BitVec 64)) Bool)

(assert (=> b!675154 (= e!385275 (not (contains!3456 acc!681 k0!2843)))))

(declare-fun b!675155 () Bool)

(declare-fun e!385274 () Bool)

(assert (=> b!675155 (= e!385274 (contains!3456 acc!681 k0!2843))))

(declare-fun res!441599 () Bool)

(declare-fun e!385271 () Bool)

(assert (=> start!60244 (=> (not res!441599) (not e!385271))))

(declare-datatypes ((array!39291 0))(
  ( (array!39292 (arr!18838 (Array (_ BitVec 32) (_ BitVec 64))) (size!19202 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39291)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60244 (= res!441599 (and (bvslt (size!19202 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19202 a!3626))))))

(assert (=> start!60244 e!385271))

(assert (=> start!60244 true))

(declare-fun array_inv!14634 (array!39291) Bool)

(assert (=> start!60244 (array_inv!14634 a!3626)))

(declare-fun b!675156 () Bool)

(declare-fun e!385273 () Bool)

(assert (=> b!675156 (= e!385273 (not (contains!3456 acc!681 k0!2843)))))

(declare-fun b!675157 () Bool)

(declare-fun res!441588 () Bool)

(assert (=> b!675157 (=> (not res!441588) (not e!385271))))

(declare-fun e!385276 () Bool)

(assert (=> b!675157 (= res!441588 e!385276)))

(declare-fun res!441581 () Bool)

(assert (=> b!675157 (=> res!441581 e!385276)))

(declare-fun e!385277 () Bool)

(assert (=> b!675157 (= res!441581 e!385277)))

(declare-fun res!441585 () Bool)

(assert (=> b!675157 (=> (not res!441585) (not e!385277))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!675157 (= res!441585 (bvsgt from!3004 i!1382))))

(declare-fun b!675158 () Bool)

(declare-fun res!441591 () Bool)

(assert (=> b!675158 (=> (not res!441591) (not e!385271))))

(declare-fun arrayNoDuplicates!0 (array!39291 (_ BitVec 32) List!12879) Bool)

(assert (=> b!675158 (= res!441591 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!675159 () Bool)

(declare-fun res!441586 () Bool)

(assert (=> b!675159 (=> (not res!441586) (not e!385271))))

(assert (=> b!675159 (= res!441586 (not (contains!3456 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675160 () Bool)

(declare-fun res!441584 () Bool)

(assert (=> b!675160 (=> (not res!441584) (not e!385271))))

(declare-fun e!385278 () Bool)

(assert (=> b!675160 (= res!441584 e!385278)))

(declare-fun res!441590 () Bool)

(assert (=> b!675160 (=> res!441590 e!385278)))

(assert (=> b!675160 (= res!441590 e!385274)))

(declare-fun res!441583 () Bool)

(assert (=> b!675160 (=> (not res!441583) (not e!385274))))

(assert (=> b!675160 (= res!441583 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675161 () Bool)

(declare-fun res!441582 () Bool)

(assert (=> b!675161 (=> (not res!441582) (not e!385271))))

(assert (=> b!675161 (= res!441582 (not (contains!3456 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675162 () Bool)

(declare-fun res!441595 () Bool)

(assert (=> b!675162 (=> (not res!441595) (not e!385271))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!675162 (= res!441595 (validKeyInArray!0 k0!2843))))

(declare-fun b!675163 () Bool)

(assert (=> b!675163 (= e!385278 e!385273)))

(declare-fun res!441589 () Bool)

(assert (=> b!675163 (=> (not res!441589) (not e!385273))))

(assert (=> b!675163 (= res!441589 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675164 () Bool)

(declare-fun res!441593 () Bool)

(assert (=> b!675164 (=> (not res!441593) (not e!385271))))

(declare-fun noDuplicate!703 (List!12879) Bool)

(assert (=> b!675164 (= res!441593 (noDuplicate!703 acc!681))))

(declare-fun b!675165 () Bool)

(declare-fun res!441594 () Bool)

(assert (=> b!675165 (=> (not res!441594) (not e!385271))))

(assert (=> b!675165 (= res!441594 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12876))))

(declare-fun b!675166 () Bool)

(declare-fun res!441596 () Bool)

(assert (=> b!675166 (=> (not res!441596) (not e!385271))))

(assert (=> b!675166 (= res!441596 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!675167 () Bool)

(declare-fun res!441580 () Bool)

(assert (=> b!675167 (=> (not res!441580) (not e!385271))))

(assert (=> b!675167 (= res!441580 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19202 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!675168 () Bool)

(assert (=> b!675168 (= e!385276 e!385275)))

(declare-fun res!441587 () Bool)

(assert (=> b!675168 (=> (not res!441587) (not e!385275))))

(assert (=> b!675168 (= res!441587 (bvsle from!3004 i!1382))))

(declare-fun b!675169 () Bool)

(declare-fun res!441592 () Bool)

(assert (=> b!675169 (=> (not res!441592) (not e!385271))))

(declare-fun arrayContainsKey!0 (array!39291 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!675169 (= res!441592 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!675170 () Bool)

(declare-fun res!441597 () Bool)

(assert (=> b!675170 (=> (not res!441597) (not e!385271))))

(assert (=> b!675170 (= res!441597 (not (validKeyInArray!0 (select (arr!18838 a!3626) from!3004))))))

(declare-fun b!675171 () Bool)

(declare-fun res!441598 () Bool)

(assert (=> b!675171 (=> (not res!441598) (not e!385271))))

(assert (=> b!675171 (= res!441598 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19202 a!3626))))))

(declare-fun b!675172 () Bool)

(assert (=> b!675172 (= e!385271 false)))

(declare-fun lt!312712 () Bool)

(assert (=> b!675172 (= lt!312712 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!675173 () Bool)

(assert (=> b!675173 (= e!385277 (contains!3456 acc!681 k0!2843))))

(assert (= (and start!60244 res!441599) b!675164))

(assert (= (and b!675164 res!441593) b!675159))

(assert (= (and b!675159 res!441586) b!675161))

(assert (= (and b!675161 res!441582) b!675157))

(assert (= (and b!675157 res!441585) b!675173))

(assert (= (and b!675157 (not res!441581)) b!675168))

(assert (= (and b!675168 res!441587) b!675154))

(assert (= (and b!675157 res!441588) b!675165))

(assert (= (and b!675165 res!441594) b!675158))

(assert (= (and b!675158 res!441591) b!675171))

(assert (= (and b!675171 res!441598) b!675162))

(assert (= (and b!675162 res!441595) b!675169))

(assert (= (and b!675169 res!441592) b!675167))

(assert (= (and b!675167 res!441580) b!675170))

(assert (= (and b!675170 res!441597) b!675166))

(assert (= (and b!675166 res!441596) b!675160))

(assert (= (and b!675160 res!441583) b!675155))

(assert (= (and b!675160 (not res!441590)) b!675163))

(assert (= (and b!675163 res!441589) b!675156))

(assert (= (and b!675160 res!441584) b!675172))

(declare-fun m!642779 () Bool)

(assert (=> b!675154 m!642779))

(declare-fun m!642781 () Bool)

(assert (=> b!675164 m!642781))

(assert (=> b!675155 m!642779))

(declare-fun m!642783 () Bool)

(assert (=> b!675158 m!642783))

(declare-fun m!642785 () Bool)

(assert (=> b!675159 m!642785))

(declare-fun m!642787 () Bool)

(assert (=> b!675162 m!642787))

(declare-fun m!642789 () Bool)

(assert (=> b!675169 m!642789))

(declare-fun m!642791 () Bool)

(assert (=> b!675172 m!642791))

(declare-fun m!642793 () Bool)

(assert (=> b!675170 m!642793))

(assert (=> b!675170 m!642793))

(declare-fun m!642795 () Bool)

(assert (=> b!675170 m!642795))

(declare-fun m!642797 () Bool)

(assert (=> b!675161 m!642797))

(declare-fun m!642799 () Bool)

(assert (=> start!60244 m!642799))

(assert (=> b!675173 m!642779))

(assert (=> b!675156 m!642779))

(declare-fun m!642801 () Bool)

(assert (=> b!675165 m!642801))

(check-sat (not b!675173) (not b!675164) (not b!675161) (not b!675170) (not b!675169) (not b!675172) (not b!675154) (not b!675162) (not b!675165) (not start!60244) (not b!675158) (not b!675156) (not b!675155) (not b!675159))
(check-sat)
