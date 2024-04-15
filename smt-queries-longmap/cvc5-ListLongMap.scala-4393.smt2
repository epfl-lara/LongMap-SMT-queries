; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60414 () Bool)

(assert start!60414)

(declare-fun b!678701 () Bool)

(declare-fun res!445251 () Bool)

(declare-fun e!386696 () Bool)

(assert (=> b!678701 (=> (not res!445251) (not e!386696))))

(declare-datatypes ((List!12990 0))(
  ( (Nil!12987) (Cons!12986 (h!14031 (_ BitVec 64)) (t!19209 List!12990)) )
))
(declare-fun acc!681 () List!12990)

(declare-fun noDuplicate!781 (List!12990) Bool)

(assert (=> b!678701 (= res!445251 (noDuplicate!781 acc!681))))

(declare-fun b!678702 () Bool)

(declare-fun res!445258 () Bool)

(assert (=> b!678702 (=> (not res!445258) (not e!386696))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39439 0))(
  ( (array!39440 (arr!18910 (Array (_ BitVec 32) (_ BitVec 64))) (size!19275 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39439)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!678702 (= res!445258 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19275 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!678703 () Bool)

(declare-fun res!445254 () Bool)

(assert (=> b!678703 (=> (not res!445254) (not e!386696))))

(assert (=> b!678703 (= res!445254 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19275 a!3626))))))

(declare-fun b!678704 () Bool)

(declare-fun res!445257 () Bool)

(assert (=> b!678704 (=> (not res!445257) (not e!386696))))

(declare-fun contains!3512 (List!12990 (_ BitVec 64)) Bool)

(assert (=> b!678704 (= res!445257 (not (contains!3512 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678706 () Bool)

(declare-fun res!445252 () Bool)

(assert (=> b!678706 (=> (not res!445252) (not e!386696))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39439 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!678706 (= res!445252 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!678707 () Bool)

(declare-fun e!386698 () Bool)

(declare-fun e!386695 () Bool)

(assert (=> b!678707 (= e!386698 e!386695)))

(declare-fun res!445247 () Bool)

(assert (=> b!678707 (=> (not res!445247) (not e!386695))))

(assert (=> b!678707 (= res!445247 (bvsle from!3004 i!1382))))

(declare-fun b!678708 () Bool)

(declare-fun res!445245 () Bool)

(assert (=> b!678708 (=> (not res!445245) (not e!386696))))

(assert (=> b!678708 (= res!445245 e!386698)))

(declare-fun res!445248 () Bool)

(assert (=> b!678708 (=> res!445248 e!386698)))

(declare-fun e!386699 () Bool)

(assert (=> b!678708 (= res!445248 e!386699)))

(declare-fun res!445246 () Bool)

(assert (=> b!678708 (=> (not res!445246) (not e!386699))))

(assert (=> b!678708 (= res!445246 (bvsgt from!3004 i!1382))))

(declare-fun b!678709 () Bool)

(assert (=> b!678709 (= e!386696 (not true))))

(assert (=> b!678709 (arrayContainsKey!0 (array!39440 (store (arr!18910 a!3626) i!1382 k!2843) (size!19275 a!3626)) k!2843 from!3004)))

(declare-fun b!678710 () Bool)

(assert (=> b!678710 (= e!386699 (contains!3512 acc!681 k!2843))))

(declare-fun b!678711 () Bool)

(declare-fun res!445249 () Bool)

(assert (=> b!678711 (=> (not res!445249) (not e!386696))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!678711 (= res!445249 (validKeyInArray!0 k!2843))))

(declare-fun b!678712 () Bool)

(assert (=> b!678712 (= e!386695 (not (contains!3512 acc!681 k!2843)))))

(declare-fun b!678713 () Bool)

(declare-fun res!445255 () Bool)

(assert (=> b!678713 (=> (not res!445255) (not e!386696))))

(assert (=> b!678713 (= res!445255 (not (contains!3512 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678714 () Bool)

(declare-fun res!445256 () Bool)

(assert (=> b!678714 (=> (not res!445256) (not e!386696))))

(declare-fun arrayNoDuplicates!0 (array!39439 (_ BitVec 32) List!12990) Bool)

(assert (=> b!678714 (= res!445256 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12987))))

(declare-fun res!445253 () Bool)

(assert (=> start!60414 (=> (not res!445253) (not e!386696))))

(assert (=> start!60414 (= res!445253 (and (bvslt (size!19275 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19275 a!3626))))))

(assert (=> start!60414 e!386696))

(assert (=> start!60414 true))

(declare-fun array_inv!14793 (array!39439) Bool)

(assert (=> start!60414 (array_inv!14793 a!3626)))

(declare-fun b!678705 () Bool)

(declare-fun res!445250 () Bool)

(assert (=> b!678705 (=> (not res!445250) (not e!386696))))

(assert (=> b!678705 (= res!445250 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!60414 res!445253) b!678701))

(assert (= (and b!678701 res!445251) b!678713))

(assert (= (and b!678713 res!445255) b!678704))

(assert (= (and b!678704 res!445257) b!678708))

(assert (= (and b!678708 res!445246) b!678710))

(assert (= (and b!678708 (not res!445248)) b!678707))

(assert (= (and b!678707 res!445247) b!678712))

(assert (= (and b!678708 res!445245) b!678714))

(assert (= (and b!678714 res!445256) b!678705))

(assert (= (and b!678705 res!445250) b!678703))

(assert (= (and b!678703 res!445254) b!678711))

(assert (= (and b!678711 res!445249) b!678706))

(assert (= (and b!678706 res!445252) b!678702))

(assert (= (and b!678702 res!445258) b!678709))

(declare-fun m!643775 () Bool)

(assert (=> b!678704 m!643775))

(declare-fun m!643777 () Bool)

(assert (=> b!678709 m!643777))

(declare-fun m!643779 () Bool)

(assert (=> b!678709 m!643779))

(declare-fun m!643781 () Bool)

(assert (=> b!678705 m!643781))

(declare-fun m!643783 () Bool)

(assert (=> b!678706 m!643783))

(declare-fun m!643785 () Bool)

(assert (=> b!678713 m!643785))

(declare-fun m!643787 () Bool)

(assert (=> b!678701 m!643787))

(declare-fun m!643789 () Bool)

(assert (=> b!678710 m!643789))

(assert (=> b!678712 m!643789))

(declare-fun m!643791 () Bool)

(assert (=> b!678714 m!643791))

(declare-fun m!643793 () Bool)

(assert (=> b!678711 m!643793))

(declare-fun m!643795 () Bool)

(assert (=> start!60414 m!643795))

(push 1)

(assert (not b!678710))

(assert (not b!678709))

(assert (not b!678712))

(assert (not b!678713))

(assert (not b!678705))

(assert (not b!678701))

(assert (not start!60414))

(assert (not b!678711))

(assert (not b!678704))

(assert (not b!678714))

(assert (not b!678706))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

