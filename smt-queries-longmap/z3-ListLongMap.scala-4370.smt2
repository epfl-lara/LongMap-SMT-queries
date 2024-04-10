; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60250 () Bool)

(assert start!60250)

(declare-fun b!675334 () Bool)

(declare-fun e!385350 () Bool)

(declare-fun e!385344 () Bool)

(assert (=> b!675334 (= e!385350 e!385344)))

(declare-fun res!441763 () Bool)

(assert (=> b!675334 (=> (not res!441763) (not e!385344))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!675334 (= res!441763 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675335 () Bool)

(declare-fun res!441762 () Bool)

(declare-fun e!385347 () Bool)

(assert (=> b!675335 (=> (not res!441762) (not e!385347))))

(declare-datatypes ((array!39297 0))(
  ( (array!39298 (arr!18841 (Array (_ BitVec 32) (_ BitVec 64))) (size!19205 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39297)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39297 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!675335 (= res!441762 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!675336 () Bool)

(declare-fun res!441772 () Bool)

(assert (=> b!675336 (=> (not res!441772) (not e!385347))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!675336 (= res!441772 (validKeyInArray!0 k0!2843))))

(declare-fun b!675337 () Bool)

(declare-fun res!441761 () Bool)

(assert (=> b!675337 (=> (not res!441761) (not e!385347))))

(declare-datatypes ((List!12882 0))(
  ( (Nil!12879) (Cons!12878 (h!13923 (_ BitVec 64)) (t!19110 List!12882)) )
))
(declare-fun acc!681 () List!12882)

(declare-fun contains!3459 (List!12882 (_ BitVec 64)) Bool)

(assert (=> b!675337 (= res!441761 (not (contains!3459 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675338 () Bool)

(declare-fun res!441777 () Bool)

(assert (=> b!675338 (=> (not res!441777) (not e!385347))))

(declare-fun arrayNoDuplicates!0 (array!39297 (_ BitVec 32) List!12882) Bool)

(assert (=> b!675338 (= res!441777 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!675339 () Bool)

(declare-fun res!441776 () Bool)

(assert (=> b!675339 (=> (not res!441776) (not e!385347))))

(declare-fun noDuplicate!706 (List!12882) Bool)

(assert (=> b!675339 (= res!441776 (noDuplicate!706 acc!681))))

(declare-fun res!441760 () Bool)

(assert (=> start!60250 (=> (not res!441760) (not e!385347))))

(assert (=> start!60250 (= res!441760 (and (bvslt (size!19205 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19205 a!3626))))))

(assert (=> start!60250 e!385347))

(assert (=> start!60250 true))

(declare-fun array_inv!14637 (array!39297) Bool)

(assert (=> start!60250 (array_inv!14637 a!3626)))

(declare-fun b!675340 () Bool)

(declare-fun res!441770 () Bool)

(assert (=> b!675340 (=> (not res!441770) (not e!385347))))

(assert (=> b!675340 (= res!441770 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19205 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!675341 () Bool)

(declare-fun e!385349 () Bool)

(assert (=> b!675341 (= e!385349 (contains!3459 acc!681 k0!2843))))

(declare-fun b!675342 () Bool)

(declare-fun res!441767 () Bool)

(assert (=> b!675342 (=> (not res!441767) (not e!385347))))

(assert (=> b!675342 (= res!441767 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12879))))

(declare-fun b!675343 () Bool)

(declare-fun res!441766 () Bool)

(assert (=> b!675343 (=> (not res!441766) (not e!385347))))

(assert (=> b!675343 (= res!441766 (not (validKeyInArray!0 (select (arr!18841 a!3626) from!3004))))))

(declare-fun b!675344 () Bool)

(declare-fun e!385346 () Bool)

(declare-fun e!385345 () Bool)

(assert (=> b!675344 (= e!385346 e!385345)))

(declare-fun res!441768 () Bool)

(assert (=> b!675344 (=> (not res!441768) (not e!385345))))

(assert (=> b!675344 (= res!441768 (bvsle from!3004 i!1382))))

(declare-fun b!675345 () Bool)

(declare-fun res!441765 () Bool)

(assert (=> b!675345 (=> (not res!441765) (not e!385347))))

(assert (=> b!675345 (= res!441765 (not (contains!3459 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675346 () Bool)

(declare-fun res!441764 () Bool)

(assert (=> b!675346 (=> (not res!441764) (not e!385347))))

(assert (=> b!675346 (= res!441764 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19205 a!3626))))))

(declare-fun b!675347 () Bool)

(declare-fun res!441771 () Bool)

(assert (=> b!675347 (=> (not res!441771) (not e!385347))))

(assert (=> b!675347 (= res!441771 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!675348 () Bool)

(declare-fun res!441779 () Bool)

(assert (=> b!675348 (=> (not res!441779) (not e!385347))))

(assert (=> b!675348 (= res!441779 e!385346)))

(declare-fun res!441775 () Bool)

(assert (=> b!675348 (=> res!441775 e!385346)))

(declare-fun e!385348 () Bool)

(assert (=> b!675348 (= res!441775 e!385348)))

(declare-fun res!441773 () Bool)

(assert (=> b!675348 (=> (not res!441773) (not e!385348))))

(assert (=> b!675348 (= res!441773 (bvsgt from!3004 i!1382))))

(declare-fun b!675349 () Bool)

(assert (=> b!675349 (= e!385345 (not (contains!3459 acc!681 k0!2843)))))

(declare-fun b!675350 () Bool)

(assert (=> b!675350 (= e!385347 false)))

(declare-fun lt!312721 () Bool)

(assert (=> b!675350 (= lt!312721 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!675351 () Bool)

(assert (=> b!675351 (= e!385344 (not (contains!3459 acc!681 k0!2843)))))

(declare-fun b!675352 () Bool)

(assert (=> b!675352 (= e!385348 (contains!3459 acc!681 k0!2843))))

(declare-fun b!675353 () Bool)

(declare-fun res!441778 () Bool)

(assert (=> b!675353 (=> (not res!441778) (not e!385347))))

(assert (=> b!675353 (= res!441778 e!385350)))

(declare-fun res!441774 () Bool)

(assert (=> b!675353 (=> res!441774 e!385350)))

(assert (=> b!675353 (= res!441774 e!385349)))

(declare-fun res!441769 () Bool)

(assert (=> b!675353 (=> (not res!441769) (not e!385349))))

(assert (=> b!675353 (= res!441769 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(assert (= (and start!60250 res!441760) b!675339))

(assert (= (and b!675339 res!441776) b!675345))

(assert (= (and b!675345 res!441765) b!675337))

(assert (= (and b!675337 res!441761) b!675348))

(assert (= (and b!675348 res!441773) b!675352))

(assert (= (and b!675348 (not res!441775)) b!675344))

(assert (= (and b!675344 res!441768) b!675349))

(assert (= (and b!675348 res!441779) b!675342))

(assert (= (and b!675342 res!441767) b!675338))

(assert (= (and b!675338 res!441777) b!675346))

(assert (= (and b!675346 res!441764) b!675336))

(assert (= (and b!675336 res!441772) b!675335))

(assert (= (and b!675335 res!441762) b!675340))

(assert (= (and b!675340 res!441770) b!675343))

(assert (= (and b!675343 res!441766) b!675347))

(assert (= (and b!675347 res!441771) b!675353))

(assert (= (and b!675353 res!441769) b!675341))

(assert (= (and b!675353 (not res!441774)) b!675334))

(assert (= (and b!675334 res!441763) b!675351))

(assert (= (and b!675353 res!441778) b!675350))

(declare-fun m!642851 () Bool)

(assert (=> b!675345 m!642851))

(declare-fun m!642853 () Bool)

(assert (=> b!675341 m!642853))

(declare-fun m!642855 () Bool)

(assert (=> b!675337 m!642855))

(assert (=> b!675352 m!642853))

(declare-fun m!642857 () Bool)

(assert (=> start!60250 m!642857))

(declare-fun m!642859 () Bool)

(assert (=> b!675342 m!642859))

(declare-fun m!642861 () Bool)

(assert (=> b!675350 m!642861))

(declare-fun m!642863 () Bool)

(assert (=> b!675338 m!642863))

(declare-fun m!642865 () Bool)

(assert (=> b!675343 m!642865))

(assert (=> b!675343 m!642865))

(declare-fun m!642867 () Bool)

(assert (=> b!675343 m!642867))

(declare-fun m!642869 () Bool)

(assert (=> b!675335 m!642869))

(assert (=> b!675351 m!642853))

(declare-fun m!642871 () Bool)

(assert (=> b!675336 m!642871))

(assert (=> b!675349 m!642853))

(declare-fun m!642873 () Bool)

(assert (=> b!675339 m!642873))

(check-sat (not b!675349) (not start!60250) (not b!675343) (not b!675339) (not b!675338) (not b!675345) (not b!675352) (not b!675341) (not b!675350) (not b!675337) (not b!675342) (not b!675336) (not b!675335) (not b!675351))
(check-sat)
