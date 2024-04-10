; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60312 () Bool)

(assert start!60312)

(declare-fun b!677202 () Bool)

(declare-fun res!443641 () Bool)

(declare-fun e!386089 () Bool)

(assert (=> b!677202 (=> (not res!443641) (not e!386089))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!677202 (= res!443641 (validKeyInArray!0 k!2843))))

(declare-fun res!443639 () Bool)

(assert (=> start!60312 (=> (not res!443639) (not e!386089))))

(declare-datatypes ((array!39359 0))(
  ( (array!39360 (arr!18872 (Array (_ BitVec 32) (_ BitVec 64))) (size!19236 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39359)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60312 (= res!443639 (and (bvslt (size!19236 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19236 a!3626))))))

(assert (=> start!60312 e!386089))

(assert (=> start!60312 true))

(declare-fun array_inv!14668 (array!39359) Bool)

(assert (=> start!60312 (array_inv!14668 a!3626)))

(declare-fun b!677203 () Bool)

(declare-fun e!386090 () Bool)

(declare-fun e!386093 () Bool)

(assert (=> b!677203 (= e!386090 e!386093)))

(declare-fun res!443637 () Bool)

(assert (=> b!677203 (=> (not res!443637) (not e!386093))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!677203 (= res!443637 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!677204 () Bool)

(declare-fun res!443628 () Bool)

(assert (=> b!677204 (=> (not res!443628) (not e!386089))))

(declare-datatypes ((List!12913 0))(
  ( (Nil!12910) (Cons!12909 (h!13954 (_ BitVec 64)) (t!19141 List!12913)) )
))
(declare-fun acc!681 () List!12913)

(declare-fun arrayNoDuplicates!0 (array!39359 (_ BitVec 32) List!12913) Bool)

(assert (=> b!677204 (= res!443628 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!677205 () Bool)

(declare-fun res!443640 () Bool)

(assert (=> b!677205 (=> (not res!443640) (not e!386089))))

(assert (=> b!677205 (= res!443640 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!677206 () Bool)

(declare-fun e!386087 () Bool)

(declare-fun contains!3490 (List!12913 (_ BitVec 64)) Bool)

(assert (=> b!677206 (= e!386087 (contains!3490 acc!681 k!2843))))

(declare-fun b!677207 () Bool)

(declare-fun res!443632 () Bool)

(assert (=> b!677207 (=> (not res!443632) (not e!386089))))

(assert (=> b!677207 (= res!443632 (not (contains!3490 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677208 () Bool)

(assert (=> b!677208 (= e!386089 (not (bvsle from!3004 (size!19236 a!3626))))))

(assert (=> b!677208 (arrayNoDuplicates!0 (array!39360 (store (arr!18872 a!3626) i!1382 k!2843) (size!19236 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-datatypes ((Unit!23764 0))(
  ( (Unit!23765) )
))
(declare-fun lt!312814 () Unit!23764)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39359 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12913) Unit!23764)

(assert (=> b!677208 (= lt!312814 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!677209 () Bool)

(declare-fun res!443634 () Bool)

(assert (=> b!677209 (=> (not res!443634) (not e!386089))))

(assert (=> b!677209 (= res!443634 (not (contains!3490 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677210 () Bool)

(declare-fun res!443648 () Bool)

(assert (=> b!677210 (=> (not res!443648) (not e!386089))))

(assert (=> b!677210 (= res!443648 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12910))))

(declare-fun b!677211 () Bool)

(declare-fun res!443642 () Bool)

(assert (=> b!677211 (=> (not res!443642) (not e!386089))))

(declare-fun e!386091 () Bool)

(assert (=> b!677211 (= res!443642 e!386091)))

(declare-fun res!443643 () Bool)

(assert (=> b!677211 (=> res!443643 e!386091)))

(assert (=> b!677211 (= res!443643 e!386087)))

(declare-fun res!443630 () Bool)

(assert (=> b!677211 (=> (not res!443630) (not e!386087))))

(assert (=> b!677211 (= res!443630 (bvsgt from!3004 i!1382))))

(declare-fun b!677212 () Bool)

(declare-fun res!443638 () Bool)

(assert (=> b!677212 (=> (not res!443638) (not e!386089))))

(declare-fun arrayContainsKey!0 (array!39359 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!677212 (= res!443638 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!677213 () Bool)

(declare-fun res!443635 () Bool)

(assert (=> b!677213 (=> (not res!443635) (not e!386089))))

(assert (=> b!677213 (= res!443635 e!386090)))

(declare-fun res!443629 () Bool)

(assert (=> b!677213 (=> res!443629 e!386090)))

(declare-fun e!386094 () Bool)

(assert (=> b!677213 (= res!443629 e!386094)))

(declare-fun res!443647 () Bool)

(assert (=> b!677213 (=> (not res!443647) (not e!386094))))

(assert (=> b!677213 (= res!443647 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!677214 () Bool)

(assert (=> b!677214 (= e!386094 (contains!3490 acc!681 k!2843))))

(declare-fun b!677215 () Bool)

(declare-fun e!386092 () Bool)

(assert (=> b!677215 (= e!386092 (not (contains!3490 acc!681 k!2843)))))

(declare-fun b!677216 () Bool)

(declare-fun res!443645 () Bool)

(assert (=> b!677216 (=> (not res!443645) (not e!386089))))

(declare-fun noDuplicate!737 (List!12913) Bool)

(assert (=> b!677216 (= res!443645 (noDuplicate!737 acc!681))))

(declare-fun b!677217 () Bool)

(assert (=> b!677217 (= e!386093 (not (contains!3490 acc!681 k!2843)))))

(declare-fun b!677218 () Bool)

(declare-fun res!443633 () Bool)

(assert (=> b!677218 (=> (not res!443633) (not e!386089))))

(assert (=> b!677218 (= res!443633 (not (validKeyInArray!0 (select (arr!18872 a!3626) from!3004))))))

(declare-fun b!677219 () Bool)

(assert (=> b!677219 (= e!386091 e!386092)))

(declare-fun res!443646 () Bool)

(assert (=> b!677219 (=> (not res!443646) (not e!386092))))

(assert (=> b!677219 (= res!443646 (bvsle from!3004 i!1382))))

(declare-fun b!677220 () Bool)

(declare-fun res!443644 () Bool)

(assert (=> b!677220 (=> (not res!443644) (not e!386089))))

(assert (=> b!677220 (= res!443644 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19236 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!677221 () Bool)

(declare-fun res!443631 () Bool)

(assert (=> b!677221 (=> (not res!443631) (not e!386089))))

(assert (=> b!677221 (= res!443631 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19236 a!3626))))))

(declare-fun b!677222 () Bool)

(declare-fun res!443636 () Bool)

(assert (=> b!677222 (=> (not res!443636) (not e!386089))))

(assert (=> b!677222 (= res!443636 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (= (and start!60312 res!443639) b!677216))

(assert (= (and b!677216 res!443645) b!677209))

(assert (= (and b!677209 res!443634) b!677207))

(assert (= (and b!677207 res!443632) b!677211))

(assert (= (and b!677211 res!443630) b!677206))

(assert (= (and b!677211 (not res!443643)) b!677219))

(assert (= (and b!677219 res!443646) b!677215))

(assert (= (and b!677211 res!443642) b!677210))

(assert (= (and b!677210 res!443648) b!677204))

(assert (= (and b!677204 res!443628) b!677221))

(assert (= (and b!677221 res!443631) b!677202))

(assert (= (and b!677202 res!443641) b!677212))

(assert (= (and b!677212 res!443638) b!677220))

(assert (= (and b!677220 res!443644) b!677218))

(assert (= (and b!677218 res!443633) b!677222))

(assert (= (and b!677222 res!443636) b!677213))

(assert (= (and b!677213 res!443647) b!677214))

(assert (= (and b!677213 (not res!443629)) b!677203))

(assert (= (and b!677203 res!443637) b!677217))

(assert (= (and b!677213 res!443635) b!677205))

(assert (= (and b!677205 res!443640) b!677208))

(declare-fun m!643607 () Bool)

(assert (=> b!677215 m!643607))

(assert (=> b!677214 m!643607))

(declare-fun m!643609 () Bool)

(assert (=> b!677212 m!643609))

(declare-fun m!643611 () Bool)

(assert (=> b!677209 m!643611))

(assert (=> b!677217 m!643607))

(declare-fun m!643613 () Bool)

(assert (=> b!677205 m!643613))

(declare-fun m!643615 () Bool)

(assert (=> b!677216 m!643615))

(declare-fun m!643617 () Bool)

(assert (=> b!677210 m!643617))

(declare-fun m!643619 () Bool)

(assert (=> b!677218 m!643619))

(assert (=> b!677218 m!643619))

(declare-fun m!643621 () Bool)

(assert (=> b!677218 m!643621))

(declare-fun m!643623 () Bool)

(assert (=> b!677207 m!643623))

(declare-fun m!643625 () Bool)

(assert (=> b!677204 m!643625))

(declare-fun m!643627 () Bool)

(assert (=> b!677208 m!643627))

(declare-fun m!643629 () Bool)

(assert (=> b!677208 m!643629))

(declare-fun m!643631 () Bool)

(assert (=> b!677208 m!643631))

(declare-fun m!643633 () Bool)

(assert (=> start!60312 m!643633))

(assert (=> b!677206 m!643607))

(declare-fun m!643635 () Bool)

(assert (=> b!677202 m!643635))

(push 1)

(assert (not b!677206))

(assert (not start!60312))

(assert (not b!677205))

(assert (not b!677218))

(assert (not b!677217))

(assert (not b!677207))

(assert (not b!677209))

(assert (not b!677215))

(assert (not b!677208))

(assert (not b!677214))

(assert (not b!677202))

(assert (not b!677212))

(assert (not b!677210))

(assert (not b!677204))

(assert (not b!677216))

(check-sat)

(pop 1)

(push 1)

(check-sat)

