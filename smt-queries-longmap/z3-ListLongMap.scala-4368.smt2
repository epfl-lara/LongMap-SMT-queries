; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60238 () Bool)

(assert start!60238)

(declare-fun b!674946 () Bool)

(declare-fun res!441392 () Bool)

(declare-fun e!385194 () Bool)

(assert (=> b!674946 (=> (not res!441392) (not e!385194))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39285 0))(
  ( (array!39286 (arr!18835 (Array (_ BitVec 32) (_ BitVec 64))) (size!19199 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39285)

(assert (=> b!674946 (= res!441392 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19199 a!3626))))))

(declare-fun b!674947 () Bool)

(declare-fun res!441393 () Bool)

(assert (=> b!674947 (=> (not res!441393) (not e!385194))))

(declare-datatypes ((List!12876 0))(
  ( (Nil!12873) (Cons!12872 (h!13917 (_ BitVec 64)) (t!19104 List!12876)) )
))
(declare-fun acc!681 () List!12876)

(declare-fun contains!3453 (List!12876 (_ BitVec 64)) Bool)

(assert (=> b!674947 (= res!441393 (not (contains!3453 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674948 () Bool)

(declare-fun e!385195 () Bool)

(declare-fun e!385188 () Bool)

(assert (=> b!674948 (= e!385195 e!385188)))

(declare-fun res!441391 () Bool)

(assert (=> b!674948 (=> (not res!441391) (not e!385188))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!674948 (= res!441391 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!674949 () Bool)

(declare-fun res!441382 () Bool)

(declare-fun e!385193 () Bool)

(assert (=> b!674949 (=> (not res!441382) (not e!385193))))

(declare-fun lt!312692 () List!12876)

(assert (=> b!674949 (= res!441382 (not (contains!3453 lt!312692 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674950 () Bool)

(assert (=> b!674950 (= e!385193 (not true))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayNoDuplicates!0 (array!39285 (_ BitVec 32) List!12876) Bool)

(assert (=> b!674950 (arrayNoDuplicates!0 (array!39286 (store (arr!18835 a!3626) i!1382 k0!2843) (size!19199 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) lt!312692)))

(declare-datatypes ((Unit!23752 0))(
  ( (Unit!23753) )
))
(declare-fun lt!312693 () Unit!23752)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39285 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12876) Unit!23752)

(assert (=> b!674950 (= lt!312693 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!312692))))

(declare-fun b!674952 () Bool)

(declare-fun res!441388 () Bool)

(assert (=> b!674952 (=> (not res!441388) (not e!385194))))

(declare-fun noDuplicate!700 (List!12876) Bool)

(assert (=> b!674952 (= res!441388 (noDuplicate!700 acc!681))))

(declare-fun b!674953 () Bool)

(declare-fun e!385191 () Bool)

(declare-fun e!385192 () Bool)

(assert (=> b!674953 (= e!385191 e!385192)))

(declare-fun res!441403 () Bool)

(assert (=> b!674953 (=> (not res!441403) (not e!385192))))

(assert (=> b!674953 (= res!441403 (bvsle from!3004 i!1382))))

(declare-fun b!674954 () Bool)

(declare-fun res!441394 () Bool)

(assert (=> b!674954 (=> (not res!441394) (not e!385194))))

(assert (=> b!674954 (= res!441394 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!674955 () Bool)

(declare-fun res!441389 () Bool)

(assert (=> b!674955 (=> (not res!441389) (not e!385194))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!674955 (= res!441389 (validKeyInArray!0 (select (arr!18835 a!3626) from!3004)))))

(declare-fun b!674956 () Bool)

(declare-fun res!441383 () Bool)

(assert (=> b!674956 (=> (not res!441383) (not e!385194))))

(assert (=> b!674956 (= res!441383 (validKeyInArray!0 k0!2843))))

(declare-fun b!674957 () Bool)

(declare-fun res!441381 () Bool)

(assert (=> b!674957 (=> (not res!441381) (not e!385193))))

(assert (=> b!674957 (= res!441381 (not (contains!3453 lt!312692 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674958 () Bool)

(declare-fun res!441398 () Bool)

(assert (=> b!674958 (=> (not res!441398) (not e!385193))))

(assert (=> b!674958 (= res!441398 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312692))))

(declare-fun b!674959 () Bool)

(declare-fun res!441384 () Bool)

(assert (=> b!674959 (=> (not res!441384) (not e!385194))))

(assert (=> b!674959 (= res!441384 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19199 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!674960 () Bool)

(declare-fun res!441401 () Bool)

(assert (=> b!674960 (=> (not res!441401) (not e!385194))))

(declare-fun arrayContainsKey!0 (array!39285 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!674960 (= res!441401 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!674961 () Bool)

(declare-fun e!385197 () Bool)

(assert (=> b!674961 (= e!385197 (contains!3453 acc!681 k0!2843))))

(declare-fun b!674962 () Bool)

(assert (=> b!674962 (= e!385192 (not (contains!3453 acc!681 k0!2843)))))

(declare-fun b!674963 () Bool)

(assert (=> b!674963 (= e!385188 (not (contains!3453 lt!312692 k0!2843)))))

(declare-fun b!674964 () Bool)

(declare-fun e!385187 () Unit!23752)

(declare-fun Unit!23754 () Unit!23752)

(assert (=> b!674964 (= e!385187 Unit!23754)))

(assert (=> b!674964 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!312694 () Unit!23752)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39285 (_ BitVec 64) (_ BitVec 32)) Unit!23752)

(assert (=> b!674964 (= lt!312694 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!674964 false))

(declare-fun b!674965 () Bool)

(declare-fun res!441386 () Bool)

(assert (=> b!674965 (=> (not res!441386) (not e!385193))))

(assert (=> b!674965 (= res!441386 (noDuplicate!700 lt!312692))))

(declare-fun b!674966 () Bool)

(declare-fun res!441399 () Bool)

(assert (=> b!674966 (=> (not res!441399) (not e!385193))))

(assert (=> b!674966 (= res!441399 e!385195)))

(declare-fun res!441390 () Bool)

(assert (=> b!674966 (=> res!441390 e!385195)))

(declare-fun e!385196 () Bool)

(assert (=> b!674966 (= res!441390 e!385196)))

(declare-fun res!441402 () Bool)

(assert (=> b!674966 (=> (not res!441402) (not e!385196))))

(assert (=> b!674966 (= res!441402 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!674967 () Bool)

(declare-fun Unit!23755 () Unit!23752)

(assert (=> b!674967 (= e!385187 Unit!23755)))

(declare-fun b!674968 () Bool)

(declare-fun e!385190 () Bool)

(assert (=> b!674968 (= e!385194 e!385190)))

(declare-fun res!441380 () Bool)

(assert (=> b!674968 (=> (not res!441380) (not e!385190))))

(assert (=> b!674968 (= res!441380 (not (= (select (arr!18835 a!3626) from!3004) k0!2843)))))

(declare-fun lt!312691 () Unit!23752)

(assert (=> b!674968 (= lt!312691 e!385187)))

(declare-fun c!77150 () Bool)

(assert (=> b!674968 (= c!77150 (= (select (arr!18835 a!3626) from!3004) k0!2843))))

(declare-fun res!441404 () Bool)

(assert (=> start!60238 (=> (not res!441404) (not e!385194))))

(assert (=> start!60238 (= res!441404 (and (bvslt (size!19199 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19199 a!3626))))))

(assert (=> start!60238 e!385194))

(assert (=> start!60238 true))

(declare-fun array_inv!14631 (array!39285) Bool)

(assert (=> start!60238 (array_inv!14631 a!3626)))

(declare-fun b!674951 () Bool)

(declare-fun res!441387 () Bool)

(assert (=> b!674951 (=> (not res!441387) (not e!385194))))

(assert (=> b!674951 (= res!441387 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12873))))

(declare-fun b!674969 () Bool)

(assert (=> b!674969 (= e!385196 (contains!3453 lt!312692 k0!2843))))

(declare-fun b!674970 () Bool)

(assert (=> b!674970 (= e!385190 e!385193)))

(declare-fun res!441395 () Bool)

(assert (=> b!674970 (=> (not res!441395) (not e!385193))))

(assert (=> b!674970 (= res!441395 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!303 (List!12876 (_ BitVec 64)) List!12876)

(assert (=> b!674970 (= lt!312692 ($colon$colon!303 acc!681 (select (arr!18835 a!3626) from!3004)))))

(declare-fun b!674971 () Bool)

(declare-fun res!441396 () Bool)

(assert (=> b!674971 (=> (not res!441396) (not e!385194))))

(assert (=> b!674971 (= res!441396 (not (contains!3453 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674972 () Bool)

(declare-fun res!441397 () Bool)

(assert (=> b!674972 (=> (not res!441397) (not e!385194))))

(assert (=> b!674972 (= res!441397 e!385191)))

(declare-fun res!441385 () Bool)

(assert (=> b!674972 (=> res!441385 e!385191)))

(assert (=> b!674972 (= res!441385 e!385197)))

(declare-fun res!441400 () Bool)

(assert (=> b!674972 (=> (not res!441400) (not e!385197))))

(assert (=> b!674972 (= res!441400 (bvsgt from!3004 i!1382))))

(assert (= (and start!60238 res!441404) b!674952))

(assert (= (and b!674952 res!441388) b!674947))

(assert (= (and b!674947 res!441393) b!674971))

(assert (= (and b!674971 res!441396) b!674972))

(assert (= (and b!674972 res!441400) b!674961))

(assert (= (and b!674972 (not res!441385)) b!674953))

(assert (= (and b!674953 res!441403) b!674962))

(assert (= (and b!674972 res!441397) b!674951))

(assert (= (and b!674951 res!441387) b!674954))

(assert (= (and b!674954 res!441394) b!674946))

(assert (= (and b!674946 res!441392) b!674956))

(assert (= (and b!674956 res!441383) b!674960))

(assert (= (and b!674960 res!441401) b!674959))

(assert (= (and b!674959 res!441384) b!674955))

(assert (= (and b!674955 res!441389) b!674968))

(assert (= (and b!674968 c!77150) b!674964))

(assert (= (and b!674968 (not c!77150)) b!674967))

(assert (= (and b!674968 res!441380) b!674970))

(assert (= (and b!674970 res!441395) b!674965))

(assert (= (and b!674965 res!441386) b!674949))

(assert (= (and b!674949 res!441382) b!674957))

(assert (= (and b!674957 res!441381) b!674966))

(assert (= (and b!674966 res!441402) b!674969))

(assert (= (and b!674966 (not res!441390)) b!674948))

(assert (= (and b!674948 res!441391) b!674963))

(assert (= (and b!674966 res!441399) b!674958))

(assert (= (and b!674958 res!441398) b!674950))

(declare-fun m!642667 () Bool)

(assert (=> b!674963 m!642667))

(declare-fun m!642669 () Bool)

(assert (=> b!674960 m!642669))

(declare-fun m!642671 () Bool)

(assert (=> b!674956 m!642671))

(declare-fun m!642673 () Bool)

(assert (=> b!674962 m!642673))

(declare-fun m!642675 () Bool)

(assert (=> b!674971 m!642675))

(declare-fun m!642677 () Bool)

(assert (=> b!674955 m!642677))

(assert (=> b!674955 m!642677))

(declare-fun m!642679 () Bool)

(assert (=> b!674955 m!642679))

(assert (=> b!674968 m!642677))

(declare-fun m!642681 () Bool)

(assert (=> b!674949 m!642681))

(declare-fun m!642683 () Bool)

(assert (=> b!674965 m!642683))

(declare-fun m!642685 () Bool)

(assert (=> b!674954 m!642685))

(declare-fun m!642687 () Bool)

(assert (=> start!60238 m!642687))

(declare-fun m!642689 () Bool)

(assert (=> b!674947 m!642689))

(declare-fun m!642691 () Bool)

(assert (=> b!674951 m!642691))

(declare-fun m!642693 () Bool)

(assert (=> b!674964 m!642693))

(declare-fun m!642695 () Bool)

(assert (=> b!674964 m!642695))

(assert (=> b!674969 m!642667))

(declare-fun m!642697 () Bool)

(assert (=> b!674957 m!642697))

(declare-fun m!642699 () Bool)

(assert (=> b!674958 m!642699))

(assert (=> b!674970 m!642677))

(assert (=> b!674970 m!642677))

(declare-fun m!642701 () Bool)

(assert (=> b!674970 m!642701))

(assert (=> b!674961 m!642673))

(declare-fun m!642703 () Bool)

(assert (=> b!674950 m!642703))

(declare-fun m!642705 () Bool)

(assert (=> b!674950 m!642705))

(declare-fun m!642707 () Bool)

(assert (=> b!674950 m!642707))

(declare-fun m!642709 () Bool)

(assert (=> b!674952 m!642709))

(check-sat (not b!674954) (not b!674950) (not b!674949) (not b!674969) (not b!674952) (not b!674971) (not b!674962) (not b!674958) (not b!674956) (not b!674947) (not b!674963) (not b!674955) (not b!674960) (not b!674957) (not b!674961) (not b!674965) (not b!674964) (not b!674970) (not start!60238) (not b!674951))
(check-sat)
