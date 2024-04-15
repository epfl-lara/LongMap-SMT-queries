; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62012 () Bool)

(assert start!62012)

(declare-fun b!693461 () Bool)

(declare-fun res!457726 () Bool)

(declare-fun e!394556 () Bool)

(assert (=> b!693461 (=> (not res!457726) (not e!394556))))

(declare-datatypes ((array!39864 0))(
  ( (array!39865 (arr!19094 (Array (_ BitVec 32) (_ BitVec 64))) (size!19476 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39864)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!13174 0))(
  ( (Nil!13171) (Cons!13170 (h!14215 (_ BitVec 64)) (t!19444 List!13174)) )
))
(declare-fun acc!681 () List!13174)

(declare-fun arrayNoDuplicates!0 (array!39864 (_ BitVec 32) List!13174) Bool)

(assert (=> b!693461 (= res!457726 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!693462 () Bool)

(declare-fun res!457731 () Bool)

(assert (=> b!693462 (=> (not res!457731) (not e!394556))))

(declare-fun e!394558 () Bool)

(assert (=> b!693462 (= res!457731 e!394558)))

(declare-fun res!457733 () Bool)

(assert (=> b!693462 (=> res!457733 e!394558)))

(declare-fun e!394563 () Bool)

(assert (=> b!693462 (= res!457733 e!394563)))

(declare-fun res!457727 () Bool)

(assert (=> b!693462 (=> (not res!457727) (not e!394563))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!693462 (= res!457727 (bvsgt from!3004 i!1382))))

(declare-fun b!693463 () Bool)

(declare-fun res!457725 () Bool)

(assert (=> b!693463 (=> (not res!457725) (not e!394556))))

(assert (=> b!693463 (= res!457725 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19476 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!693464 () Bool)

(declare-fun e!394565 () Bool)

(declare-fun e!394561 () Bool)

(assert (=> b!693464 (= e!394565 e!394561)))

(declare-fun res!457732 () Bool)

(assert (=> b!693464 (=> (not res!457732) (not e!394561))))

(assert (=> b!693464 (= res!457732 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!693465 () Bool)

(declare-fun e!394564 () Bool)

(assert (=> b!693465 (= e!394556 e!394564)))

(declare-fun res!457730 () Bool)

(assert (=> b!693465 (=> (not res!457730) (not e!394564))))

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!693465 (= res!457730 (not (= (select (arr!19094 a!3626) from!3004) k0!2843)))))

(declare-datatypes ((Unit!24476 0))(
  ( (Unit!24477) )
))
(declare-fun lt!316546 () Unit!24476)

(declare-fun e!394560 () Unit!24476)

(assert (=> b!693465 (= lt!316546 e!394560)))

(declare-fun c!78240 () Bool)

(assert (=> b!693465 (= c!78240 (= (select (arr!19094 a!3626) from!3004) k0!2843))))

(declare-fun b!693467 () Bool)

(declare-fun res!457718 () Bool)

(assert (=> b!693467 (=> (not res!457718) (not e!394556))))

(assert (=> b!693467 (= res!457718 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13171))))

(declare-fun b!693468 () Bool)

(declare-fun res!457715 () Bool)

(declare-fun e!394562 () Bool)

(assert (=> b!693468 (=> (not res!457715) (not e!394562))))

(declare-fun lt!316545 () List!13174)

(declare-fun contains!3696 (List!13174 (_ BitVec 64)) Bool)

(assert (=> b!693468 (= res!457715 (not (contains!3696 lt!316545 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693469 () Bool)

(declare-fun res!457723 () Bool)

(assert (=> b!693469 (=> (not res!457723) (not e!394556))))

(assert (=> b!693469 (= res!457723 (not (contains!3696 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693470 () Bool)

(declare-fun res!457722 () Bool)

(assert (=> b!693470 (=> (not res!457722) (not e!394562))))

(assert (=> b!693470 (= res!457722 e!394565)))

(declare-fun res!457736 () Bool)

(assert (=> b!693470 (=> res!457736 e!394565)))

(declare-fun e!394557 () Bool)

(assert (=> b!693470 (= res!457736 e!394557)))

(declare-fun res!457737 () Bool)

(assert (=> b!693470 (=> (not res!457737) (not e!394557))))

(assert (=> b!693470 (= res!457737 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!693471 () Bool)

(declare-fun Unit!24478 () Unit!24476)

(assert (=> b!693471 (= e!394560 Unit!24478)))

(declare-fun arrayContainsKey!0 (array!39864 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!693471 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!316548 () Unit!24476)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39864 (_ BitVec 64) (_ BitVec 32)) Unit!24476)

(assert (=> b!693471 (= lt!316548 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!693471 false))

(declare-fun b!693472 () Bool)

(declare-fun res!457738 () Bool)

(assert (=> b!693472 (=> (not res!457738) (not e!394562))))

(assert (=> b!693472 (= res!457738 (not (contains!3696 lt!316545 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693473 () Bool)

(declare-fun e!394555 () Bool)

(assert (=> b!693473 (= e!394555 (not (contains!3696 acc!681 k0!2843)))))

(declare-fun b!693474 () Bool)

(declare-fun res!457717 () Bool)

(assert (=> b!693474 (=> (not res!457717) (not e!394556))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!693474 (= res!457717 (validKeyInArray!0 (select (arr!19094 a!3626) from!3004)))))

(declare-fun b!693475 () Bool)

(assert (=> b!693475 (= e!394563 (contains!3696 acc!681 k0!2843))))

(declare-fun b!693476 () Bool)

(declare-fun res!457721 () Bool)

(assert (=> b!693476 (=> (not res!457721) (not e!394556))))

(assert (=> b!693476 (= res!457721 (not (contains!3696 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693477 () Bool)

(declare-fun res!457716 () Bool)

(assert (=> b!693477 (=> (not res!457716) (not e!394556))))

(assert (=> b!693477 (= res!457716 (validKeyInArray!0 k0!2843))))

(declare-fun b!693478 () Bool)

(declare-fun res!457724 () Bool)

(assert (=> b!693478 (=> (not res!457724) (not e!394556))))

(declare-fun noDuplicate!965 (List!13174) Bool)

(assert (=> b!693478 (= res!457724 (noDuplicate!965 acc!681))))

(declare-fun b!693479 () Bool)

(assert (=> b!693479 (= e!394562 false)))

(declare-fun lt!316547 () Bool)

(assert (=> b!693479 (= lt!316547 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316545))))

(declare-fun b!693480 () Bool)

(assert (=> b!693480 (= e!394558 e!394555)))

(declare-fun res!457720 () Bool)

(assert (=> b!693480 (=> (not res!457720) (not e!394555))))

(assert (=> b!693480 (= res!457720 (bvsle from!3004 i!1382))))

(declare-fun b!693481 () Bool)

(declare-fun res!457734 () Bool)

(assert (=> b!693481 (=> (not res!457734) (not e!394562))))

(assert (=> b!693481 (= res!457734 (noDuplicate!965 lt!316545))))

(declare-fun b!693482 () Bool)

(declare-fun Unit!24479 () Unit!24476)

(assert (=> b!693482 (= e!394560 Unit!24479)))

(declare-fun b!693483 () Bool)

(assert (=> b!693483 (= e!394564 e!394562)))

(declare-fun res!457729 () Bool)

(assert (=> b!693483 (=> (not res!457729) (not e!394562))))

(assert (=> b!693483 (= res!457729 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!424 (List!13174 (_ BitVec 64)) List!13174)

(assert (=> b!693483 (= lt!316545 ($colon$colon!424 acc!681 (select (arr!19094 a!3626) from!3004)))))

(declare-fun b!693484 () Bool)

(declare-fun res!457735 () Bool)

(assert (=> b!693484 (=> (not res!457735) (not e!394556))))

(assert (=> b!693484 (= res!457735 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19476 a!3626))))))

(declare-fun res!457719 () Bool)

(assert (=> start!62012 (=> (not res!457719) (not e!394556))))

(assert (=> start!62012 (= res!457719 (and (bvslt (size!19476 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19476 a!3626))))))

(assert (=> start!62012 e!394556))

(assert (=> start!62012 true))

(declare-fun array_inv!14977 (array!39864) Bool)

(assert (=> start!62012 (array_inv!14977 a!3626)))

(declare-fun b!693466 () Bool)

(declare-fun res!457728 () Bool)

(assert (=> b!693466 (=> (not res!457728) (not e!394556))))

(assert (=> b!693466 (= res!457728 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!693485 () Bool)

(assert (=> b!693485 (= e!394557 (contains!3696 lt!316545 k0!2843))))

(declare-fun b!693486 () Bool)

(assert (=> b!693486 (= e!394561 (not (contains!3696 lt!316545 k0!2843)))))

(assert (= (and start!62012 res!457719) b!693478))

(assert (= (and b!693478 res!457724) b!693476))

(assert (= (and b!693476 res!457721) b!693469))

(assert (= (and b!693469 res!457723) b!693462))

(assert (= (and b!693462 res!457727) b!693475))

(assert (= (and b!693462 (not res!457733)) b!693480))

(assert (= (and b!693480 res!457720) b!693473))

(assert (= (and b!693462 res!457731) b!693467))

(assert (= (and b!693467 res!457718) b!693461))

(assert (= (and b!693461 res!457726) b!693484))

(assert (= (and b!693484 res!457735) b!693477))

(assert (= (and b!693477 res!457716) b!693466))

(assert (= (and b!693466 res!457728) b!693463))

(assert (= (and b!693463 res!457725) b!693474))

(assert (= (and b!693474 res!457717) b!693465))

(assert (= (and b!693465 c!78240) b!693471))

(assert (= (and b!693465 (not c!78240)) b!693482))

(assert (= (and b!693465 res!457730) b!693483))

(assert (= (and b!693483 res!457729) b!693481))

(assert (= (and b!693481 res!457734) b!693472))

(assert (= (and b!693472 res!457738) b!693468))

(assert (= (and b!693468 res!457715) b!693470))

(assert (= (and b!693470 res!457737) b!693485))

(assert (= (and b!693470 (not res!457736)) b!693464))

(assert (= (and b!693464 res!457732) b!693486))

(assert (= (and b!693470 res!457722) b!693479))

(declare-fun m!655155 () Bool)

(assert (=> b!693474 m!655155))

(assert (=> b!693474 m!655155))

(declare-fun m!655157 () Bool)

(assert (=> b!693474 m!655157))

(declare-fun m!655159 () Bool)

(assert (=> b!693475 m!655159))

(declare-fun m!655161 () Bool)

(assert (=> b!693467 m!655161))

(declare-fun m!655163 () Bool)

(assert (=> b!693471 m!655163))

(declare-fun m!655165 () Bool)

(assert (=> b!693471 m!655165))

(declare-fun m!655167 () Bool)

(assert (=> b!693461 m!655167))

(declare-fun m!655169 () Bool)

(assert (=> b!693472 m!655169))

(declare-fun m!655171 () Bool)

(assert (=> b!693468 m!655171))

(declare-fun m!655173 () Bool)

(assert (=> b!693476 m!655173))

(assert (=> b!693473 m!655159))

(assert (=> b!693483 m!655155))

(assert (=> b!693483 m!655155))

(declare-fun m!655175 () Bool)

(assert (=> b!693483 m!655175))

(declare-fun m!655177 () Bool)

(assert (=> b!693478 m!655177))

(assert (=> b!693465 m!655155))

(declare-fun m!655179 () Bool)

(assert (=> b!693481 m!655179))

(declare-fun m!655181 () Bool)

(assert (=> b!693479 m!655181))

(declare-fun m!655183 () Bool)

(assert (=> b!693485 m!655183))

(declare-fun m!655185 () Bool)

(assert (=> start!62012 m!655185))

(declare-fun m!655187 () Bool)

(assert (=> b!693477 m!655187))

(declare-fun m!655189 () Bool)

(assert (=> b!693469 m!655189))

(declare-fun m!655191 () Bool)

(assert (=> b!693466 m!655191))

(assert (=> b!693486 m!655183))

(check-sat (not b!693468) (not b!693469) (not b!693472) (not b!693471) (not b!693474) (not start!62012) (not b!693467) (not b!693483) (not b!693461) (not b!693478) (not b!693476) (not b!693475) (not b!693477) (not b!693481) (not b!693479) (not b!693486) (not b!693466) (not b!693473) (not b!693485))
(check-sat)
