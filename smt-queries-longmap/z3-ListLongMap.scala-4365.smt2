; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60206 () Bool)

(assert start!60206)

(declare-fun b!673840 () Bool)

(declare-fun e!384675 () Bool)

(declare-fun e!384674 () Bool)

(assert (=> b!673840 (= e!384675 e!384674)))

(declare-fun res!440498 () Bool)

(assert (=> b!673840 (=> (not res!440498) (not e!384674))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!673840 (= res!440498 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((array!39264 0))(
  ( (array!39265 (arr!18824 (Array (_ BitVec 32) (_ BitVec 64))) (size!19189 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39264)

(declare-datatypes ((List!12904 0))(
  ( (Nil!12901) (Cons!12900 (h!13945 (_ BitVec 64)) (t!19123 List!12904)) )
))
(declare-fun acc!681 () List!12904)

(declare-fun lt!312317 () List!12904)

(declare-fun $colon$colon!292 (List!12904 (_ BitVec 64)) List!12904)

(assert (=> b!673840 (= lt!312317 ($colon$colon!292 acc!681 (select (arr!18824 a!3626) from!3004)))))

(declare-fun b!673841 () Bool)

(declare-fun e!384676 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3426 (List!12904 (_ BitVec 64)) Bool)

(assert (=> b!673841 (= e!384676 (contains!3426 acc!681 k0!2843))))

(declare-fun b!673842 () Bool)

(declare-fun res!440496 () Bool)

(declare-fun e!384668 () Bool)

(assert (=> b!673842 (=> (not res!440496) (not e!384668))))

(assert (=> b!673842 (= res!440496 (not (contains!3426 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673843 () Bool)

(declare-fun res!440514 () Bool)

(assert (=> b!673843 (=> (not res!440514) (not e!384668))))

(declare-fun arrayNoDuplicates!0 (array!39264 (_ BitVec 32) List!12904) Bool)

(assert (=> b!673843 (= res!440514 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!673844 () Bool)

(declare-fun e!384667 () Bool)

(assert (=> b!673844 (= e!384667 (not (contains!3426 acc!681 k0!2843)))))

(declare-fun b!673845 () Bool)

(declare-fun res!440505 () Bool)

(assert (=> b!673845 (=> (not res!440505) (not e!384674))))

(assert (=> b!673845 (= res!440505 (not (contains!3426 lt!312317 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673846 () Bool)

(declare-fun res!440503 () Bool)

(assert (=> b!673846 (=> (not res!440503) (not e!384674))))

(assert (=> b!673846 (= res!440503 (not (contains!3426 lt!312317 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673847 () Bool)

(declare-fun res!440506 () Bool)

(assert (=> b!673847 (=> (not res!440506) (not e!384674))))

(declare-fun e!384672 () Bool)

(assert (=> b!673847 (= res!440506 e!384672)))

(declare-fun res!440517 () Bool)

(assert (=> b!673847 (=> res!440517 e!384672)))

(declare-fun e!384673 () Bool)

(assert (=> b!673847 (= res!440517 e!384673)))

(declare-fun res!440495 () Bool)

(assert (=> b!673847 (=> (not res!440495) (not e!384673))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!673847 (= res!440495 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!673848 () Bool)

(declare-datatypes ((Unit!23690 0))(
  ( (Unit!23691) )
))
(declare-fun e!384670 () Unit!23690)

(declare-fun Unit!23692 () Unit!23690)

(assert (=> b!673848 (= e!384670 Unit!23692)))

(declare-fun b!673849 () Bool)

(declare-fun res!440501 () Bool)

(assert (=> b!673849 (=> (not res!440501) (not e!384668))))

(declare-fun arrayContainsKey!0 (array!39264 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!673849 (= res!440501 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun res!440512 () Bool)

(assert (=> start!60206 (=> (not res!440512) (not e!384668))))

(assert (=> start!60206 (= res!440512 (and (bvslt (size!19189 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19189 a!3626))))))

(assert (=> start!60206 e!384668))

(assert (=> start!60206 true))

(declare-fun array_inv!14707 (array!39264) Bool)

(assert (=> start!60206 (array_inv!14707 a!3626)))

(declare-fun b!673850 () Bool)

(declare-fun res!440515 () Bool)

(assert (=> b!673850 (=> (not res!440515) (not e!384668))))

(declare-fun e!384669 () Bool)

(assert (=> b!673850 (= res!440515 e!384669)))

(declare-fun res!440502 () Bool)

(assert (=> b!673850 (=> res!440502 e!384669)))

(assert (=> b!673850 (= res!440502 e!384676)))

(declare-fun res!440518 () Bool)

(assert (=> b!673850 (=> (not res!440518) (not e!384676))))

(assert (=> b!673850 (= res!440518 (bvsgt from!3004 i!1382))))

(declare-fun b!673851 () Bool)

(assert (=> b!673851 (= e!384673 (contains!3426 lt!312317 k0!2843))))

(declare-fun b!673852 () Bool)

(assert (=> b!673852 (= e!384674 (not (bvsle from!3004 (size!19189 a!3626))))))

(assert (=> b!673852 (arrayNoDuplicates!0 (array!39265 (store (arr!18824 a!3626) i!1382 k0!2843) (size!19189 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) lt!312317)))

(declare-fun lt!312315 () Unit!23690)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39264 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12904) Unit!23690)

(assert (=> b!673852 (= lt!312315 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!312317))))

(declare-fun b!673853 () Bool)

(assert (=> b!673853 (= e!384669 e!384667)))

(declare-fun res!440509 () Bool)

(assert (=> b!673853 (=> (not res!440509) (not e!384667))))

(assert (=> b!673853 (= res!440509 (bvsle from!3004 i!1382))))

(declare-fun b!673854 () Bool)

(declare-fun e!384671 () Bool)

(assert (=> b!673854 (= e!384672 e!384671)))

(declare-fun res!440507 () Bool)

(assert (=> b!673854 (=> (not res!440507) (not e!384671))))

(assert (=> b!673854 (= res!440507 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!673855 () Bool)

(declare-fun res!440516 () Bool)

(assert (=> b!673855 (=> (not res!440516) (not e!384668))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!673855 (= res!440516 (validKeyInArray!0 k0!2843))))

(declare-fun b!673856 () Bool)

(declare-fun res!440511 () Bool)

(assert (=> b!673856 (=> (not res!440511) (not e!384668))))

(assert (=> b!673856 (= res!440511 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19189 a!3626))))))

(declare-fun b!673857 () Bool)

(assert (=> b!673857 (= e!384668 e!384675)))

(declare-fun res!440510 () Bool)

(assert (=> b!673857 (=> (not res!440510) (not e!384675))))

(assert (=> b!673857 (= res!440510 (not (= (select (arr!18824 a!3626) from!3004) k0!2843)))))

(declare-fun lt!312316 () Unit!23690)

(assert (=> b!673857 (= lt!312316 e!384670)))

(declare-fun c!77040 () Bool)

(assert (=> b!673857 (= c!77040 (= (select (arr!18824 a!3626) from!3004) k0!2843))))

(declare-fun b!673858 () Bool)

(declare-fun res!440494 () Bool)

(assert (=> b!673858 (=> (not res!440494) (not e!384674))))

(declare-fun noDuplicate!695 (List!12904) Bool)

(assert (=> b!673858 (= res!440494 (noDuplicate!695 lt!312317))))

(declare-fun b!673859 () Bool)

(declare-fun res!440499 () Bool)

(assert (=> b!673859 (=> (not res!440499) (not e!384668))))

(assert (=> b!673859 (= res!440499 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19189 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!673860 () Bool)

(declare-fun res!440504 () Bool)

(assert (=> b!673860 (=> (not res!440504) (not e!384668))))

(assert (=> b!673860 (= res!440504 (validKeyInArray!0 (select (arr!18824 a!3626) from!3004)))))

(declare-fun b!673861 () Bool)

(assert (=> b!673861 (= e!384671 (not (contains!3426 lt!312317 k0!2843)))))

(declare-fun b!673862 () Bool)

(declare-fun Unit!23693 () Unit!23690)

(assert (=> b!673862 (= e!384670 Unit!23693)))

(assert (=> b!673862 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!312318 () Unit!23690)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39264 (_ BitVec 64) (_ BitVec 32)) Unit!23690)

(assert (=> b!673862 (= lt!312318 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!673862 false))

(declare-fun b!673863 () Bool)

(declare-fun res!440497 () Bool)

(assert (=> b!673863 (=> (not res!440497) (not e!384674))))

(assert (=> b!673863 (= res!440497 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312317))))

(declare-fun b!673864 () Bool)

(declare-fun res!440508 () Bool)

(assert (=> b!673864 (=> (not res!440508) (not e!384668))))

(assert (=> b!673864 (= res!440508 (noDuplicate!695 acc!681))))

(declare-fun b!673865 () Bool)

(declare-fun res!440500 () Bool)

(assert (=> b!673865 (=> (not res!440500) (not e!384668))))

(assert (=> b!673865 (= res!440500 (not (contains!3426 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673866 () Bool)

(declare-fun res!440513 () Bool)

(assert (=> b!673866 (=> (not res!440513) (not e!384668))))

(assert (=> b!673866 (= res!440513 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12901))))

(assert (= (and start!60206 res!440512) b!673864))

(assert (= (and b!673864 res!440508) b!673842))

(assert (= (and b!673842 res!440496) b!673865))

(assert (= (and b!673865 res!440500) b!673850))

(assert (= (and b!673850 res!440518) b!673841))

(assert (= (and b!673850 (not res!440502)) b!673853))

(assert (= (and b!673853 res!440509) b!673844))

(assert (= (and b!673850 res!440515) b!673866))

(assert (= (and b!673866 res!440513) b!673843))

(assert (= (and b!673843 res!440514) b!673856))

(assert (= (and b!673856 res!440511) b!673855))

(assert (= (and b!673855 res!440516) b!673849))

(assert (= (and b!673849 res!440501) b!673859))

(assert (= (and b!673859 res!440499) b!673860))

(assert (= (and b!673860 res!440504) b!673857))

(assert (= (and b!673857 c!77040) b!673862))

(assert (= (and b!673857 (not c!77040)) b!673848))

(assert (= (and b!673857 res!440510) b!673840))

(assert (= (and b!673840 res!440498) b!673858))

(assert (= (and b!673858 res!440494) b!673846))

(assert (= (and b!673846 res!440503) b!673845))

(assert (= (and b!673845 res!440505) b!673847))

(assert (= (and b!673847 res!440495) b!673851))

(assert (= (and b!673847 (not res!440517)) b!673854))

(assert (= (and b!673854 res!440507) b!673861))

(assert (= (and b!673847 res!440506) b!673863))

(assert (= (and b!673863 res!440497) b!673852))

(declare-fun m!641445 () Bool)

(assert (=> b!673860 m!641445))

(assert (=> b!673860 m!641445))

(declare-fun m!641447 () Bool)

(assert (=> b!673860 m!641447))

(declare-fun m!641449 () Bool)

(assert (=> b!673844 m!641449))

(assert (=> b!673857 m!641445))

(declare-fun m!641451 () Bool)

(assert (=> b!673843 m!641451))

(declare-fun m!641453 () Bool)

(assert (=> b!673858 m!641453))

(declare-fun m!641455 () Bool)

(assert (=> start!60206 m!641455))

(declare-fun m!641457 () Bool)

(assert (=> b!673846 m!641457))

(declare-fun m!641459 () Bool)

(assert (=> b!673861 m!641459))

(declare-fun m!641461 () Bool)

(assert (=> b!673862 m!641461))

(declare-fun m!641463 () Bool)

(assert (=> b!673862 m!641463))

(declare-fun m!641465 () Bool)

(assert (=> b!673855 m!641465))

(declare-fun m!641467 () Bool)

(assert (=> b!673849 m!641467))

(declare-fun m!641469 () Bool)

(assert (=> b!673864 m!641469))

(assert (=> b!673841 m!641449))

(declare-fun m!641471 () Bool)

(assert (=> b!673865 m!641471))

(declare-fun m!641473 () Bool)

(assert (=> b!673845 m!641473))

(declare-fun m!641475 () Bool)

(assert (=> b!673852 m!641475))

(declare-fun m!641477 () Bool)

(assert (=> b!673852 m!641477))

(declare-fun m!641479 () Bool)

(assert (=> b!673852 m!641479))

(assert (=> b!673840 m!641445))

(assert (=> b!673840 m!641445))

(declare-fun m!641481 () Bool)

(assert (=> b!673840 m!641481))

(declare-fun m!641483 () Bool)

(assert (=> b!673842 m!641483))

(declare-fun m!641485 () Bool)

(assert (=> b!673863 m!641485))

(declare-fun m!641487 () Bool)

(assert (=> b!673866 m!641487))

(assert (=> b!673851 m!641459))

(check-sat (not b!673841) (not b!673866) (not b!673855) (not b!673843) (not b!673845) (not b!673861) (not b!673863) (not b!673864) (not start!60206) (not b!673846) (not b!673858) (not b!673849) (not b!673862) (not b!673844) (not b!673851) (not b!673840) (not b!673865) (not b!673842) (not b!673860) (not b!673852))
(check-sat)
