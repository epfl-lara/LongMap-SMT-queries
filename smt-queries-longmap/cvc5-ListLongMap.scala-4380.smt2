; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60308 () Bool)

(assert start!60308)

(declare-fun b!677076 () Bool)

(declare-fun res!443506 () Bool)

(declare-fun e!386039 () Bool)

(assert (=> b!677076 (=> (not res!443506) (not e!386039))))

(declare-fun e!386044 () Bool)

(assert (=> b!677076 (= res!443506 e!386044)))

(declare-fun res!443502 () Bool)

(assert (=> b!677076 (=> res!443502 e!386044)))

(declare-fun e!386042 () Bool)

(assert (=> b!677076 (= res!443502 e!386042)))

(declare-fun res!443522 () Bool)

(assert (=> b!677076 (=> (not res!443522) (not e!386042))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!677076 (= res!443522 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!677077 () Bool)

(declare-fun res!443514 () Bool)

(assert (=> b!677077 (=> (not res!443514) (not e!386039))))

(declare-datatypes ((array!39355 0))(
  ( (array!39356 (arr!18870 (Array (_ BitVec 32) (_ BitVec 64))) (size!19234 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39355)

(declare-datatypes ((List!12911 0))(
  ( (Nil!12908) (Cons!12907 (h!13952 (_ BitVec 64)) (t!19139 List!12911)) )
))
(declare-fun acc!681 () List!12911)

(declare-fun arrayNoDuplicates!0 (array!39355 (_ BitVec 32) List!12911) Bool)

(assert (=> b!677077 (= res!443514 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!677079 () Bool)

(assert (=> b!677079 (= e!386039 (not (bvsle from!3004 (size!19234 a!3626))))))

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!677079 (arrayNoDuplicates!0 (array!39356 (store (arr!18870 a!3626) i!1382 k!2843) (size!19234 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-datatypes ((Unit!23760 0))(
  ( (Unit!23761) )
))
(declare-fun lt!312808 () Unit!23760)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39355 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12911) Unit!23760)

(assert (=> b!677079 (= lt!312808 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!677080 () Bool)

(declare-fun e!386046 () Bool)

(assert (=> b!677080 (= e!386044 e!386046)))

(declare-fun res!443511 () Bool)

(assert (=> b!677080 (=> (not res!443511) (not e!386046))))

(assert (=> b!677080 (= res!443511 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!677081 () Bool)

(declare-fun e!386043 () Bool)

(declare-fun contains!3488 (List!12911 (_ BitVec 64)) Bool)

(assert (=> b!677081 (= e!386043 (not (contains!3488 acc!681 k!2843)))))

(declare-fun b!677082 () Bool)

(declare-fun res!443515 () Bool)

(assert (=> b!677082 (=> (not res!443515) (not e!386039))))

(assert (=> b!677082 (= res!443515 (not (contains!3488 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677083 () Bool)

(declare-fun res!443509 () Bool)

(assert (=> b!677083 (=> (not res!443509) (not e!386039))))

(assert (=> b!677083 (= res!443509 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!677084 () Bool)

(declare-fun res!443520 () Bool)

(assert (=> b!677084 (=> (not res!443520) (not e!386039))))

(assert (=> b!677084 (= res!443520 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!677085 () Bool)

(declare-fun res!443504 () Bool)

(assert (=> b!677085 (=> (not res!443504) (not e!386039))))

(assert (=> b!677085 (= res!443504 (not (contains!3488 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677086 () Bool)

(declare-fun e!386041 () Bool)

(assert (=> b!677086 (= e!386041 e!386043)))

(declare-fun res!443513 () Bool)

(assert (=> b!677086 (=> (not res!443513) (not e!386043))))

(assert (=> b!677086 (= res!443513 (bvsle from!3004 i!1382))))

(declare-fun b!677087 () Bool)

(declare-fun res!443521 () Bool)

(assert (=> b!677087 (=> (not res!443521) (not e!386039))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!677087 (= res!443521 (not (validKeyInArray!0 (select (arr!18870 a!3626) from!3004))))))

(declare-fun b!677088 () Bool)

(declare-fun res!443516 () Bool)

(assert (=> b!677088 (=> (not res!443516) (not e!386039))))

(assert (=> b!677088 (= res!443516 (validKeyInArray!0 k!2843))))

(declare-fun b!677089 () Bool)

(declare-fun res!443507 () Bool)

(assert (=> b!677089 (=> (not res!443507) (not e!386039))))

(assert (=> b!677089 (= res!443507 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12908))))

(declare-fun b!677090 () Bool)

(assert (=> b!677090 (= e!386046 (not (contains!3488 acc!681 k!2843)))))

(declare-fun b!677091 () Bool)

(declare-fun res!443518 () Bool)

(assert (=> b!677091 (=> (not res!443518) (not e!386039))))

(assert (=> b!677091 (= res!443518 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19234 a!3626))))))

(declare-fun b!677092 () Bool)

(assert (=> b!677092 (= e!386042 (contains!3488 acc!681 k!2843))))

(declare-fun b!677093 () Bool)

(declare-fun res!443503 () Bool)

(assert (=> b!677093 (=> (not res!443503) (not e!386039))))

(declare-fun noDuplicate!735 (List!12911) Bool)

(assert (=> b!677093 (= res!443503 (noDuplicate!735 acc!681))))

(declare-fun b!677094 () Bool)

(declare-fun res!443505 () Bool)

(assert (=> b!677094 (=> (not res!443505) (not e!386039))))

(assert (=> b!677094 (= res!443505 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19234 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun res!443519 () Bool)

(assert (=> start!60308 (=> (not res!443519) (not e!386039))))

(assert (=> start!60308 (= res!443519 (and (bvslt (size!19234 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19234 a!3626))))))

(assert (=> start!60308 e!386039))

(assert (=> start!60308 true))

(declare-fun array_inv!14666 (array!39355) Bool)

(assert (=> start!60308 (array_inv!14666 a!3626)))

(declare-fun b!677078 () Bool)

(declare-fun e!386040 () Bool)

(assert (=> b!677078 (= e!386040 (contains!3488 acc!681 k!2843))))

(declare-fun b!677095 () Bool)

(declare-fun res!443512 () Bool)

(assert (=> b!677095 (=> (not res!443512) (not e!386039))))

(declare-fun arrayContainsKey!0 (array!39355 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!677095 (= res!443512 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!677096 () Bool)

(declare-fun res!443510 () Bool)

(assert (=> b!677096 (=> (not res!443510) (not e!386039))))

(assert (=> b!677096 (= res!443510 e!386041)))

(declare-fun res!443508 () Bool)

(assert (=> b!677096 (=> res!443508 e!386041)))

(assert (=> b!677096 (= res!443508 e!386040)))

(declare-fun res!443517 () Bool)

(assert (=> b!677096 (=> (not res!443517) (not e!386040))))

(assert (=> b!677096 (= res!443517 (bvsgt from!3004 i!1382))))

(assert (= (and start!60308 res!443519) b!677093))

(assert (= (and b!677093 res!443503) b!677082))

(assert (= (and b!677082 res!443515) b!677085))

(assert (= (and b!677085 res!443504) b!677096))

(assert (= (and b!677096 res!443517) b!677078))

(assert (= (and b!677096 (not res!443508)) b!677086))

(assert (= (and b!677086 res!443513) b!677081))

(assert (= (and b!677096 res!443510) b!677089))

(assert (= (and b!677089 res!443507) b!677077))

(assert (= (and b!677077 res!443514) b!677091))

(assert (= (and b!677091 res!443518) b!677088))

(assert (= (and b!677088 res!443516) b!677095))

(assert (= (and b!677095 res!443512) b!677094))

(assert (= (and b!677094 res!443505) b!677087))

(assert (= (and b!677087 res!443521) b!677084))

(assert (= (and b!677084 res!443520) b!677076))

(assert (= (and b!677076 res!443522) b!677092))

(assert (= (and b!677076 (not res!443502)) b!677080))

(assert (= (and b!677080 res!443511) b!677090))

(assert (= (and b!677076 res!443506) b!677083))

(assert (= (and b!677083 res!443509) b!677079))

(declare-fun m!643547 () Bool)

(assert (=> b!677090 m!643547))

(declare-fun m!643549 () Bool)

(assert (=> b!677093 m!643549))

(declare-fun m!643551 () Bool)

(assert (=> b!677083 m!643551))

(declare-fun m!643553 () Bool)

(assert (=> b!677089 m!643553))

(assert (=> b!677092 m!643547))

(declare-fun m!643555 () Bool)

(assert (=> b!677079 m!643555))

(declare-fun m!643557 () Bool)

(assert (=> b!677079 m!643557))

(declare-fun m!643559 () Bool)

(assert (=> b!677079 m!643559))

(declare-fun m!643561 () Bool)

(assert (=> start!60308 m!643561))

(assert (=> b!677081 m!643547))

(declare-fun m!643563 () Bool)

(assert (=> b!677085 m!643563))

(declare-fun m!643565 () Bool)

(assert (=> b!677095 m!643565))

(declare-fun m!643567 () Bool)

(assert (=> b!677077 m!643567))

(declare-fun m!643569 () Bool)

(assert (=> b!677082 m!643569))

(assert (=> b!677078 m!643547))

(declare-fun m!643571 () Bool)

(assert (=> b!677087 m!643571))

(assert (=> b!677087 m!643571))

(declare-fun m!643573 () Bool)

(assert (=> b!677087 m!643573))

(declare-fun m!643575 () Bool)

(assert (=> b!677088 m!643575))

(push 1)

(assert (not b!677089))

(assert (not b!677092))

(assert (not b!677078))

(assert (not b!677083))

(assert (not start!60308))

(assert (not b!677088))

(assert (not b!677079))

(assert (not b!677077))

(assert (not b!677081))

(assert (not b!677093))

(assert (not b!677087))

(assert (not b!677082))

(assert (not b!677090))

(assert (not b!677095))

(assert (not b!677085))

(check-sat)

(pop 1)

(push 1)

(check-sat)

