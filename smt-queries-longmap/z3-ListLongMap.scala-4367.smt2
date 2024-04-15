; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60218 () Bool)

(assert start!60218)

(declare-fun b!674326 () Bool)

(declare-fun res!440947 () Bool)

(declare-fun e!384869 () Bool)

(assert (=> b!674326 (=> (not res!440947) (not e!384869))))

(declare-datatypes ((List!12910 0))(
  ( (Nil!12907) (Cons!12906 (h!13951 (_ BitVec 64)) (t!19129 List!12910)) )
))
(declare-fun lt!312388 () List!12910)

(declare-datatypes ((array!39276 0))(
  ( (array!39277 (arr!18830 (Array (_ BitVec 32) (_ BitVec 64))) (size!19195 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39276)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39276 (_ BitVec 32) List!12910) Bool)

(assert (=> b!674326 (= res!440947 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312388))))

(declare-fun b!674327 () Bool)

(declare-fun e!384873 () Bool)

(declare-fun e!384866 () Bool)

(assert (=> b!674327 (= e!384873 e!384866)))

(declare-fun res!440965 () Bool)

(assert (=> b!674327 (=> (not res!440965) (not e!384866))))

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!674327 (= res!440965 (not (= (select (arr!18830 a!3626) from!3004) k0!2843)))))

(declare-datatypes ((Unit!23714 0))(
  ( (Unit!23715) )
))
(declare-fun lt!312387 () Unit!23714)

(declare-fun e!384868 () Unit!23714)

(assert (=> b!674327 (= lt!312387 e!384868)))

(declare-fun c!77058 () Bool)

(assert (=> b!674327 (= c!77058 (= (select (arr!18830 a!3626) from!3004) k0!2843))))

(declare-fun b!674328 () Bool)

(declare-fun res!440963 () Bool)

(assert (=> b!674328 (=> (not res!440963) (not e!384869))))

(declare-fun noDuplicate!701 (List!12910) Bool)

(assert (=> b!674328 (= res!440963 (noDuplicate!701 lt!312388))))

(declare-fun res!440957 () Bool)

(assert (=> start!60218 (=> (not res!440957) (not e!384873))))

(assert (=> start!60218 (= res!440957 (and (bvslt (size!19195 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19195 a!3626))))))

(assert (=> start!60218 e!384873))

(assert (=> start!60218 true))

(declare-fun array_inv!14713 (array!39276) Bool)

(assert (=> start!60218 (array_inv!14713 a!3626)))

(declare-fun b!674329 () Bool)

(declare-fun e!384875 () Bool)

(declare-fun acc!681 () List!12910)

(declare-fun contains!3432 (List!12910 (_ BitVec 64)) Bool)

(assert (=> b!674329 (= e!384875 (contains!3432 acc!681 k0!2843))))

(declare-fun b!674330 () Bool)

(declare-fun Unit!23716 () Unit!23714)

(assert (=> b!674330 (= e!384868 Unit!23716)))

(declare-fun arrayContainsKey!0 (array!39276 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!674330 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!312390 () Unit!23714)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39276 (_ BitVec 64) (_ BitVec 32)) Unit!23714)

(assert (=> b!674330 (= lt!312390 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!674330 false))

(declare-fun b!674331 () Bool)

(declare-fun res!440945 () Bool)

(assert (=> b!674331 (=> (not res!440945) (not e!384873))))

(declare-fun e!384874 () Bool)

(assert (=> b!674331 (= res!440945 e!384874)))

(declare-fun res!440949 () Bool)

(assert (=> b!674331 (=> res!440949 e!384874)))

(assert (=> b!674331 (= res!440949 e!384875)))

(declare-fun res!440961 () Bool)

(assert (=> b!674331 (=> (not res!440961) (not e!384875))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!674331 (= res!440961 (bvsgt from!3004 i!1382))))

(declare-fun b!674332 () Bool)

(declare-fun res!440944 () Bool)

(assert (=> b!674332 (=> (not res!440944) (not e!384873))))

(assert (=> b!674332 (= res!440944 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!674333 () Bool)

(declare-fun res!440962 () Bool)

(assert (=> b!674333 (=> (not res!440962) (not e!384873))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!674333 (= res!440962 (validKeyInArray!0 k0!2843))))

(declare-fun b!674334 () Bool)

(declare-fun e!384865 () Bool)

(assert (=> b!674334 (= e!384865 (contains!3432 lt!312388 k0!2843))))

(declare-fun b!674335 () Bool)

(declare-fun res!440967 () Bool)

(assert (=> b!674335 (=> (not res!440967) (not e!384869))))

(assert (=> b!674335 (= res!440967 (not (contains!3432 lt!312388 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674336 () Bool)

(declare-fun res!440960 () Bool)

(assert (=> b!674336 (=> (not res!440960) (not e!384869))))

(declare-fun e!384871 () Bool)

(assert (=> b!674336 (= res!440960 e!384871)))

(declare-fun res!440968 () Bool)

(assert (=> b!674336 (=> res!440968 e!384871)))

(assert (=> b!674336 (= res!440968 e!384865)))

(declare-fun res!440966 () Bool)

(assert (=> b!674336 (=> (not res!440966) (not e!384865))))

(assert (=> b!674336 (= res!440966 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!674337 () Bool)

(declare-fun res!440958 () Bool)

(assert (=> b!674337 (=> (not res!440958) (not e!384873))))

(assert (=> b!674337 (= res!440958 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19195 a!3626))))))

(declare-fun b!674338 () Bool)

(declare-fun res!440946 () Bool)

(assert (=> b!674338 (=> (not res!440946) (not e!384873))))

(assert (=> b!674338 (= res!440946 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19195 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!674339 () Bool)

(declare-fun e!384872 () Bool)

(assert (=> b!674339 (= e!384872 (not (contains!3432 lt!312388 k0!2843)))))

(declare-fun b!674340 () Bool)

(assert (=> b!674340 (= e!384866 e!384869)))

(declare-fun res!440954 () Bool)

(assert (=> b!674340 (=> (not res!440954) (not e!384869))))

(assert (=> b!674340 (= res!440954 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!298 (List!12910 (_ BitVec 64)) List!12910)

(assert (=> b!674340 (= lt!312388 ($colon$colon!298 acc!681 (select (arr!18830 a!3626) from!3004)))))

(declare-fun b!674341 () Bool)

(declare-fun res!440959 () Bool)

(assert (=> b!674341 (=> (not res!440959) (not e!384873))))

(assert (=> b!674341 (= res!440959 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12907))))

(declare-fun b!674342 () Bool)

(declare-fun res!440950 () Bool)

(assert (=> b!674342 (=> (not res!440950) (not e!384873))))

(assert (=> b!674342 (= res!440950 (noDuplicate!701 acc!681))))

(declare-fun b!674343 () Bool)

(assert (=> b!674343 (= e!384871 e!384872)))

(declare-fun res!440955 () Bool)

(assert (=> b!674343 (=> (not res!440955) (not e!384872))))

(assert (=> b!674343 (= res!440955 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!674344 () Bool)

(declare-fun res!440964 () Bool)

(assert (=> b!674344 (=> (not res!440964) (not e!384873))))

(assert (=> b!674344 (= res!440964 (not (contains!3432 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674345 () Bool)

(declare-fun e!384867 () Bool)

(assert (=> b!674345 (= e!384874 e!384867)))

(declare-fun res!440952 () Bool)

(assert (=> b!674345 (=> (not res!440952) (not e!384867))))

(assert (=> b!674345 (= res!440952 (bvsle from!3004 i!1382))))

(declare-fun b!674346 () Bool)

(declare-fun res!440953 () Bool)

(assert (=> b!674346 (=> (not res!440953) (not e!384873))))

(assert (=> b!674346 (= res!440953 (validKeyInArray!0 (select (arr!18830 a!3626) from!3004)))))

(declare-fun b!674347 () Bool)

(assert (=> b!674347 (= e!384867 (not (contains!3432 acc!681 k0!2843)))))

(declare-fun b!674348 () Bool)

(declare-fun res!440956 () Bool)

(assert (=> b!674348 (=> (not res!440956) (not e!384873))))

(assert (=> b!674348 (= res!440956 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!674349 () Bool)

(declare-fun res!440948 () Bool)

(assert (=> b!674349 (=> (not res!440948) (not e!384869))))

(assert (=> b!674349 (= res!440948 (not (contains!3432 lt!312388 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674350 () Bool)

(declare-fun Unit!23717 () Unit!23714)

(assert (=> b!674350 (= e!384868 Unit!23717)))

(declare-fun b!674351 () Bool)

(assert (=> b!674351 (= e!384869 (not true))))

(assert (=> b!674351 (arrayNoDuplicates!0 (array!39277 (store (arr!18830 a!3626) i!1382 k0!2843) (size!19195 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) lt!312388)))

(declare-fun lt!312389 () Unit!23714)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39276 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12910) Unit!23714)

(assert (=> b!674351 (= lt!312389 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!312388))))

(declare-fun b!674352 () Bool)

(declare-fun res!440951 () Bool)

(assert (=> b!674352 (=> (not res!440951) (not e!384873))))

(assert (=> b!674352 (= res!440951 (not (contains!3432 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60218 res!440957) b!674342))

(assert (= (and b!674342 res!440950) b!674344))

(assert (= (and b!674344 res!440964) b!674352))

(assert (= (and b!674352 res!440951) b!674331))

(assert (= (and b!674331 res!440961) b!674329))

(assert (= (and b!674331 (not res!440949)) b!674345))

(assert (= (and b!674345 res!440952) b!674347))

(assert (= (and b!674331 res!440945) b!674341))

(assert (= (and b!674341 res!440959) b!674332))

(assert (= (and b!674332 res!440944) b!674337))

(assert (= (and b!674337 res!440958) b!674333))

(assert (= (and b!674333 res!440962) b!674348))

(assert (= (and b!674348 res!440956) b!674338))

(assert (= (and b!674338 res!440946) b!674346))

(assert (= (and b!674346 res!440953) b!674327))

(assert (= (and b!674327 c!77058) b!674330))

(assert (= (and b!674327 (not c!77058)) b!674350))

(assert (= (and b!674327 res!440965) b!674340))

(assert (= (and b!674340 res!440954) b!674328))

(assert (= (and b!674328 res!440963) b!674349))

(assert (= (and b!674349 res!440948) b!674335))

(assert (= (and b!674335 res!440967) b!674336))

(assert (= (and b!674336 res!440966) b!674334))

(assert (= (and b!674336 (not res!440968)) b!674343))

(assert (= (and b!674343 res!440955) b!674339))

(assert (= (and b!674336 res!440960) b!674326))

(assert (= (and b!674326 res!440947) b!674351))

(declare-fun m!641709 () Bool)

(assert (=> b!674351 m!641709))

(declare-fun m!641711 () Bool)

(assert (=> b!674351 m!641711))

(declare-fun m!641713 () Bool)

(assert (=> b!674351 m!641713))

(declare-fun m!641715 () Bool)

(assert (=> b!674326 m!641715))

(declare-fun m!641717 () Bool)

(assert (=> b!674333 m!641717))

(declare-fun m!641719 () Bool)

(assert (=> b!674328 m!641719))

(declare-fun m!641721 () Bool)

(assert (=> b!674342 m!641721))

(declare-fun m!641723 () Bool)

(assert (=> start!60218 m!641723))

(declare-fun m!641725 () Bool)

(assert (=> b!674329 m!641725))

(declare-fun m!641727 () Bool)

(assert (=> b!674344 m!641727))

(declare-fun m!641729 () Bool)

(assert (=> b!674330 m!641729))

(declare-fun m!641731 () Bool)

(assert (=> b!674330 m!641731))

(declare-fun m!641733 () Bool)

(assert (=> b!674327 m!641733))

(declare-fun m!641735 () Bool)

(assert (=> b!674334 m!641735))

(declare-fun m!641737 () Bool)

(assert (=> b!674349 m!641737))

(declare-fun m!641739 () Bool)

(assert (=> b!674348 m!641739))

(assert (=> b!674346 m!641733))

(assert (=> b!674346 m!641733))

(declare-fun m!641741 () Bool)

(assert (=> b!674346 m!641741))

(assert (=> b!674340 m!641733))

(assert (=> b!674340 m!641733))

(declare-fun m!641743 () Bool)

(assert (=> b!674340 m!641743))

(assert (=> b!674339 m!641735))

(declare-fun m!641745 () Bool)

(assert (=> b!674332 m!641745))

(declare-fun m!641747 () Bool)

(assert (=> b!674335 m!641747))

(declare-fun m!641749 () Bool)

(assert (=> b!674352 m!641749))

(assert (=> b!674347 m!641725))

(declare-fun m!641751 () Bool)

(assert (=> b!674341 m!641751))

(check-sat (not b!674332) (not b!674352) (not b!674351) (not b!674329) (not b!674346) (not b!674348) (not b!674340) (not b!674326) (not b!674341) (not b!674333) (not b!674335) (not start!60218) (not b!674347) (not b!674330) (not b!674344) (not b!674334) (not b!674328) (not b!674349) (not b!674342) (not b!674339))
(check-sat)
