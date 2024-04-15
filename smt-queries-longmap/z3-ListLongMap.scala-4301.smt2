; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59822 () Bool)

(assert start!59822)

(declare-fun b!660962 () Bool)

(declare-fun e!379689 () Bool)

(assert (=> b!660962 (= e!379689 (not true))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-datatypes ((array!38880 0))(
  ( (array!38881 (arr!18632 (Array (_ BitVec 32) (_ BitVec 64))) (size!18997 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38880)

(declare-fun arrayContainsKey!0 (array!38880 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!660962 (arrayContainsKey!0 (array!38881 (store (arr!18632 a!3626) i!1382 k0!2843) (size!18997 a!3626)) k0!2843 from!3004)))

(declare-fun b!660963 () Bool)

(declare-fun res!429188 () Bool)

(assert (=> b!660963 (=> (not res!429188) (not e!379689))))

(declare-datatypes ((List!12712 0))(
  ( (Nil!12709) (Cons!12708 (h!13753 (_ BitVec 64)) (t!18931 List!12712)) )
))
(declare-fun acc!681 () List!12712)

(declare-fun noDuplicate!503 (List!12712) Bool)

(assert (=> b!660963 (= res!429188 (noDuplicate!503 acc!681))))

(declare-fun b!660964 () Bool)

(declare-fun e!379691 () Bool)

(declare-fun e!379688 () Bool)

(assert (=> b!660964 (= e!379691 e!379688)))

(declare-fun res!429198 () Bool)

(assert (=> b!660964 (=> (not res!429198) (not e!379688))))

(assert (=> b!660964 (= res!429198 (bvsle from!3004 i!1382))))

(declare-fun b!660965 () Bool)

(declare-fun contains!3234 (List!12712 (_ BitVec 64)) Bool)

(assert (=> b!660965 (= e!379688 (not (contains!3234 acc!681 k0!2843)))))

(declare-fun b!660966 () Bool)

(declare-fun res!429186 () Bool)

(assert (=> b!660966 (=> (not res!429186) (not e!379689))))

(assert (=> b!660966 (= res!429186 (not (contains!3234 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!429195 () Bool)

(assert (=> start!59822 (=> (not res!429195) (not e!379689))))

(assert (=> start!59822 (= res!429195 (and (bvslt (size!18997 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18997 a!3626))))))

(assert (=> start!59822 e!379689))

(assert (=> start!59822 true))

(declare-fun array_inv!14515 (array!38880) Bool)

(assert (=> start!59822 (array_inv!14515 a!3626)))

(declare-fun b!660967 () Bool)

(declare-fun res!429191 () Bool)

(assert (=> b!660967 (=> (not res!429191) (not e!379689))))

(assert (=> b!660967 (= res!429191 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!660968 () Bool)

(declare-fun res!429187 () Bool)

(assert (=> b!660968 (=> (not res!429187) (not e!379689))))

(declare-fun arrayNoDuplicates!0 (array!38880 (_ BitVec 32) List!12712) Bool)

(assert (=> b!660968 (= res!429187 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12709))))

(declare-fun b!660969 () Bool)

(declare-fun res!429194 () Bool)

(assert (=> b!660969 (=> (not res!429194) (not e!379689))))

(assert (=> b!660969 (= res!429194 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!660970 () Bool)

(declare-fun res!429189 () Bool)

(assert (=> b!660970 (=> (not res!429189) (not e!379689))))

(assert (=> b!660970 (= res!429189 (not (contains!3234 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660971 () Bool)

(declare-fun res!429197 () Bool)

(assert (=> b!660971 (=> (not res!429197) (not e!379689))))

(assert (=> b!660971 (= res!429197 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!18997 a!3626))))))

(declare-fun b!660972 () Bool)

(declare-fun e!379690 () Bool)

(assert (=> b!660972 (= e!379690 (contains!3234 acc!681 k0!2843))))

(declare-fun b!660973 () Bool)

(declare-fun res!429190 () Bool)

(assert (=> b!660973 (=> (not res!429190) (not e!379689))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!660973 (= res!429190 (validKeyInArray!0 k0!2843))))

(declare-fun b!660974 () Bool)

(declare-fun res!429196 () Bool)

(assert (=> b!660974 (=> (not res!429196) (not e!379689))))

(assert (=> b!660974 (= res!429196 e!379691)))

(declare-fun res!429192 () Bool)

(assert (=> b!660974 (=> res!429192 e!379691)))

(assert (=> b!660974 (= res!429192 e!379690)))

(declare-fun res!429193 () Bool)

(assert (=> b!660974 (=> (not res!429193) (not e!379690))))

(assert (=> b!660974 (= res!429193 (bvsgt from!3004 i!1382))))

(declare-fun b!660975 () Bool)

(declare-fun res!429199 () Bool)

(assert (=> b!660975 (=> (not res!429199) (not e!379689))))

(assert (=> b!660975 (= res!429199 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!18997 a!3626)) (= from!3004 i!1382)))))

(assert (= (and start!59822 res!429195) b!660963))

(assert (= (and b!660963 res!429188) b!660970))

(assert (= (and b!660970 res!429189) b!660966))

(assert (= (and b!660966 res!429186) b!660974))

(assert (= (and b!660974 res!429193) b!660972))

(assert (= (and b!660974 (not res!429192)) b!660964))

(assert (= (and b!660964 res!429198) b!660965))

(assert (= (and b!660974 res!429196) b!660968))

(assert (= (and b!660968 res!429187) b!660969))

(assert (= (and b!660969 res!429194) b!660971))

(assert (= (and b!660971 res!429197) b!660973))

(assert (= (and b!660973 res!429190) b!660967))

(assert (= (and b!660967 res!429191) b!660975))

(assert (= (and b!660975 res!429199) b!660962))

(declare-fun m!632751 () Bool)

(assert (=> start!59822 m!632751))

(declare-fun m!632753 () Bool)

(assert (=> b!660965 m!632753))

(declare-fun m!632755 () Bool)

(assert (=> b!660963 m!632755))

(declare-fun m!632757 () Bool)

(assert (=> b!660968 m!632757))

(declare-fun m!632759 () Bool)

(assert (=> b!660969 m!632759))

(declare-fun m!632761 () Bool)

(assert (=> b!660966 m!632761))

(declare-fun m!632763 () Bool)

(assert (=> b!660973 m!632763))

(declare-fun m!632765 () Bool)

(assert (=> b!660962 m!632765))

(declare-fun m!632767 () Bool)

(assert (=> b!660962 m!632767))

(declare-fun m!632769 () Bool)

(assert (=> b!660967 m!632769))

(assert (=> b!660972 m!632753))

(declare-fun m!632771 () Bool)

(assert (=> b!660970 m!632771))

(check-sat (not b!660970) (not b!660963) (not b!660967) (not b!660966) (not b!660968) (not b!660965) (not b!660973) (not start!59822) (not b!660962) (not b!660972) (not b!660969))
(check-sat)
