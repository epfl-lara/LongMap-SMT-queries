; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60276 () Bool)

(assert start!60276)

(declare-fun b!676114 () Bool)

(declare-fun res!442545 () Bool)

(declare-fun e!385655 () Bool)

(assert (=> b!676114 (=> (not res!442545) (not e!385655))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39323 0))(
  ( (array!39324 (arr!18854 (Array (_ BitVec 32) (_ BitVec 64))) (size!19218 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39323)

(assert (=> b!676114 (= res!442545 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19218 a!3626))))))

(declare-fun b!676115 () Bool)

(declare-fun e!385661 () Bool)

(declare-fun e!385660 () Bool)

(assert (=> b!676115 (= e!385661 e!385660)))

(declare-fun res!442557 () Bool)

(assert (=> b!676115 (=> (not res!442557) (not e!385660))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!676115 (= res!442557 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676116 () Bool)

(declare-fun e!385657 () Bool)

(declare-fun e!385656 () Bool)

(assert (=> b!676116 (= e!385657 e!385656)))

(declare-fun res!442542 () Bool)

(assert (=> b!676116 (=> (not res!442542) (not e!385656))))

(assert (=> b!676116 (= res!442542 (bvsle from!3004 i!1382))))

(declare-fun b!676117 () Bool)

(declare-datatypes ((List!12895 0))(
  ( (Nil!12892) (Cons!12891 (h!13936 (_ BitVec 64)) (t!19123 List!12895)) )
))
(declare-fun acc!681 () List!12895)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3472 (List!12895 (_ BitVec 64)) Bool)

(assert (=> b!676117 (= e!385660 (not (contains!3472 acc!681 k!2843)))))

(declare-fun b!676118 () Bool)

(assert (=> b!676118 (= e!385655 false)))

(declare-fun lt!312760 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39323 (_ BitVec 32) List!12895) Bool)

(assert (=> b!676118 (= lt!312760 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!676119 () Bool)

(declare-fun e!385659 () Bool)

(assert (=> b!676119 (= e!385659 (contains!3472 acc!681 k!2843))))

(declare-fun b!676120 () Bool)

(declare-fun res!442553 () Bool)

(assert (=> b!676120 (=> (not res!442553) (not e!385655))))

(declare-fun arrayContainsKey!0 (array!39323 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!676120 (= res!442553 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!676121 () Bool)

(declare-fun res!442556 () Bool)

(assert (=> b!676121 (=> (not res!442556) (not e!385655))))

(assert (=> b!676121 (= res!442556 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!676122 () Bool)

(declare-fun res!442547 () Bool)

(assert (=> b!676122 (=> (not res!442547) (not e!385655))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!676122 (= res!442547 (validKeyInArray!0 k!2843))))

(declare-fun b!676123 () Bool)

(declare-fun res!442551 () Bool)

(assert (=> b!676123 (=> (not res!442551) (not e!385655))))

(assert (=> b!676123 (= res!442551 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19218 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!676124 () Bool)

(declare-fun res!442559 () Bool)

(assert (=> b!676124 (=> (not res!442559) (not e!385655))))

(assert (=> b!676124 (= res!442559 (not (validKeyInArray!0 (select (arr!18854 a!3626) from!3004))))))

(declare-fun b!676125 () Bool)

(declare-fun res!442543 () Bool)

(assert (=> b!676125 (=> (not res!442543) (not e!385655))))

(declare-fun noDuplicate!719 (List!12895) Bool)

(assert (=> b!676125 (= res!442543 (noDuplicate!719 acc!681))))

(declare-fun b!676126 () Bool)

(declare-fun res!442558 () Bool)

(assert (=> b!676126 (=> (not res!442558) (not e!385655))))

(assert (=> b!676126 (= res!442558 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!442554 () Bool)

(assert (=> start!60276 (=> (not res!442554) (not e!385655))))

(assert (=> start!60276 (= res!442554 (and (bvslt (size!19218 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19218 a!3626))))))

(assert (=> start!60276 e!385655))

(assert (=> start!60276 true))

(declare-fun array_inv!14650 (array!39323) Bool)

(assert (=> start!60276 (array_inv!14650 a!3626)))

(declare-fun b!676127 () Bool)

(assert (=> b!676127 (= e!385656 (not (contains!3472 acc!681 k!2843)))))

(declare-fun b!676128 () Bool)

(declare-fun res!442549 () Bool)

(assert (=> b!676128 (=> (not res!442549) (not e!385655))))

(assert (=> b!676128 (= res!442549 e!385661)))

(declare-fun res!442541 () Bool)

(assert (=> b!676128 (=> res!442541 e!385661)))

(assert (=> b!676128 (= res!442541 e!385659)))

(declare-fun res!442546 () Bool)

(assert (=> b!676128 (=> (not res!442546) (not e!385659))))

(assert (=> b!676128 (= res!442546 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676129 () Bool)

(declare-fun e!385658 () Bool)

(assert (=> b!676129 (= e!385658 (contains!3472 acc!681 k!2843))))

(declare-fun b!676130 () Bool)

(declare-fun res!442552 () Bool)

(assert (=> b!676130 (=> (not res!442552) (not e!385655))))

(assert (=> b!676130 (= res!442552 e!385657)))

(declare-fun res!442544 () Bool)

(assert (=> b!676130 (=> res!442544 e!385657)))

(assert (=> b!676130 (= res!442544 e!385658)))

(declare-fun res!442550 () Bool)

(assert (=> b!676130 (=> (not res!442550) (not e!385658))))

(assert (=> b!676130 (= res!442550 (bvsgt from!3004 i!1382))))

(declare-fun b!676131 () Bool)

(declare-fun res!442548 () Bool)

(assert (=> b!676131 (=> (not res!442548) (not e!385655))))

(assert (=> b!676131 (= res!442548 (not (contains!3472 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676132 () Bool)

(declare-fun res!442540 () Bool)

(assert (=> b!676132 (=> (not res!442540) (not e!385655))))

(assert (=> b!676132 (= res!442540 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12892))))

(declare-fun b!676133 () Bool)

(declare-fun res!442555 () Bool)

(assert (=> b!676133 (=> (not res!442555) (not e!385655))))

(assert (=> b!676133 (= res!442555 (not (contains!3472 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60276 res!442554) b!676125))

(assert (= (and b!676125 res!442543) b!676133))

(assert (= (and b!676133 res!442555) b!676131))

(assert (= (and b!676131 res!442548) b!676130))

(assert (= (and b!676130 res!442550) b!676129))

(assert (= (and b!676130 (not res!442544)) b!676116))

(assert (= (and b!676116 res!442542) b!676127))

(assert (= (and b!676130 res!442552) b!676132))

(assert (= (and b!676132 res!442540) b!676126))

(assert (= (and b!676126 res!442558) b!676114))

(assert (= (and b!676114 res!442545) b!676122))

(assert (= (and b!676122 res!442547) b!676120))

(assert (= (and b!676120 res!442553) b!676123))

(assert (= (and b!676123 res!442551) b!676124))

(assert (= (and b!676124 res!442559) b!676121))

(assert (= (and b!676121 res!442556) b!676128))

(assert (= (and b!676128 res!442546) b!676119))

(assert (= (and b!676128 (not res!442541)) b!676115))

(assert (= (and b!676115 res!442557) b!676117))

(assert (= (and b!676128 res!442549) b!676118))

(declare-fun m!643163 () Bool)

(assert (=> b!676118 m!643163))

(declare-fun m!643165 () Bool)

(assert (=> b!676126 m!643165))

(declare-fun m!643167 () Bool)

(assert (=> b!676117 m!643167))

(declare-fun m!643169 () Bool)

(assert (=> b!676120 m!643169))

(assert (=> b!676119 m!643167))

(declare-fun m!643171 () Bool)

(assert (=> b!676122 m!643171))

(declare-fun m!643173 () Bool)

(assert (=> b!676125 m!643173))

(declare-fun m!643175 () Bool)

(assert (=> b!676132 m!643175))

(assert (=> b!676127 m!643167))

(declare-fun m!643177 () Bool)

(assert (=> b!676131 m!643177))

(assert (=> b!676129 m!643167))

(declare-fun m!643179 () Bool)

(assert (=> start!60276 m!643179))

(declare-fun m!643181 () Bool)

(assert (=> b!676133 m!643181))

(declare-fun m!643183 () Bool)

(assert (=> b!676124 m!643183))

(assert (=> b!676124 m!643183))

(declare-fun m!643185 () Bool)

(assert (=> b!676124 m!643185))

(push 1)

(assert (not b!676126))

(assert (not start!60276))

(assert (not b!676131))

(assert (not b!676117))

(assert (not b!676125))

(assert (not b!676129))

(assert (not b!676118))

(assert (not b!676132))

(assert (not b!676120))

(assert (not b!676124))

(assert (not b!676119))

(assert (not b!676122))

(assert (not b!676127))

(assert (not b!676133))

