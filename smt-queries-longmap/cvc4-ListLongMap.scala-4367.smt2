; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60234 () Bool)

(assert start!60234)

(declare-fun b!674784 () Bool)

(declare-fun res!441235 () Bool)

(declare-fun e!385124 () Bool)

(assert (=> b!674784 (=> (not res!441235) (not e!385124))))

(declare-datatypes ((List!12874 0))(
  ( (Nil!12871) (Cons!12870 (h!13915 (_ BitVec 64)) (t!19102 List!12874)) )
))
(declare-fun acc!681 () List!12874)

(declare-fun contains!3451 (List!12874 (_ BitVec 64)) Bool)

(assert (=> b!674784 (= res!441235 (not (contains!3451 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674785 () Bool)

(declare-fun e!385131 () Bool)

(assert (=> b!674785 (= e!385131 (not true))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-fun lt!312667 () List!12874)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun k!2843 () (_ BitVec 64))

(declare-datatypes ((array!39281 0))(
  ( (array!39282 (arr!18833 (Array (_ BitVec 32) (_ BitVec 64))) (size!19197 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39281)

(declare-fun arrayNoDuplicates!0 (array!39281 (_ BitVec 32) List!12874) Bool)

(assert (=> b!674785 (arrayNoDuplicates!0 (array!39282 (store (arr!18833 a!3626) i!1382 k!2843) (size!19197 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) lt!312667)))

(declare-datatypes ((Unit!23744 0))(
  ( (Unit!23745) )
))
(declare-fun lt!312669 () Unit!23744)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39281 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12874) Unit!23744)

(assert (=> b!674785 (= lt!312669 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!312667))))

(declare-fun b!674786 () Bool)

(declare-fun e!385123 () Bool)

(assert (=> b!674786 (= e!385123 (contains!3451 lt!312667 k!2843))))

(declare-fun b!674787 () Bool)

(declare-fun res!441234 () Bool)

(assert (=> b!674787 (=> (not res!441234) (not e!385124))))

(assert (=> b!674787 (= res!441234 (not (contains!3451 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674788 () Bool)

(declare-fun res!441242 () Bool)

(assert (=> b!674788 (=> (not res!441242) (not e!385124))))

(assert (=> b!674788 (= res!441242 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19197 a!3626))))))

(declare-fun b!674789 () Bool)

(declare-fun e!385126 () Bool)

(assert (=> b!674789 (= e!385126 (contains!3451 acc!681 k!2843))))

(declare-fun res!441240 () Bool)

(assert (=> start!60234 (=> (not res!441240) (not e!385124))))

(assert (=> start!60234 (= res!441240 (and (bvslt (size!19197 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19197 a!3626))))))

(assert (=> start!60234 e!385124))

(assert (=> start!60234 true))

(declare-fun array_inv!14629 (array!39281) Bool)

(assert (=> start!60234 (array_inv!14629 a!3626)))

(declare-fun b!674790 () Bool)

(declare-fun e!385130 () Bool)

(declare-fun e!385128 () Bool)

(assert (=> b!674790 (= e!385130 e!385128)))

(declare-fun res!441247 () Bool)

(assert (=> b!674790 (=> (not res!441247) (not e!385128))))

(assert (=> b!674790 (= res!441247 (bvsle from!3004 i!1382))))

(declare-fun b!674791 () Bool)

(declare-fun e!385122 () Unit!23744)

(declare-fun Unit!23746 () Unit!23744)

(assert (=> b!674791 (= e!385122 Unit!23746)))

(declare-fun b!674792 () Bool)

(declare-fun Unit!23747 () Unit!23744)

(assert (=> b!674792 (= e!385122 Unit!23747)))

(declare-fun arrayContainsKey!0 (array!39281 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!674792 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!312668 () Unit!23744)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39281 (_ BitVec 64) (_ BitVec 32)) Unit!23744)

(assert (=> b!674792 (= lt!312668 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!674792 false))

(declare-fun b!674793 () Bool)

(declare-fun res!441236 () Bool)

(assert (=> b!674793 (=> (not res!441236) (not e!385124))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!674793 (= res!441236 (validKeyInArray!0 k!2843))))

(declare-fun b!674794 () Bool)

(assert (=> b!674794 (= e!385128 (not (contains!3451 acc!681 k!2843)))))

(declare-fun b!674795 () Bool)

(declare-fun res!441244 () Bool)

(assert (=> b!674795 (=> (not res!441244) (not e!385124))))

(assert (=> b!674795 (= res!441244 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19197 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!674796 () Bool)

(declare-fun res!441252 () Bool)

(assert (=> b!674796 (=> (not res!441252) (not e!385124))))

(assert (=> b!674796 (= res!441252 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!674797 () Bool)

(declare-fun e!385127 () Bool)

(assert (=> b!674797 (= e!385127 e!385131)))

(declare-fun res!441246 () Bool)

(assert (=> b!674797 (=> (not res!441246) (not e!385131))))

(assert (=> b!674797 (= res!441246 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!301 (List!12874 (_ BitVec 64)) List!12874)

(assert (=> b!674797 (= lt!312667 ($colon$colon!301 acc!681 (select (arr!18833 a!3626) from!3004)))))

(declare-fun b!674798 () Bool)

(assert (=> b!674798 (= e!385124 e!385127)))

(declare-fun res!441245 () Bool)

(assert (=> b!674798 (=> (not res!441245) (not e!385127))))

(assert (=> b!674798 (= res!441245 (not (= (select (arr!18833 a!3626) from!3004) k!2843)))))

(declare-fun lt!312670 () Unit!23744)

(assert (=> b!674798 (= lt!312670 e!385122)))

(declare-fun c!77144 () Bool)

(assert (=> b!674798 (= c!77144 (= (select (arr!18833 a!3626) from!3004) k!2843))))

(declare-fun b!674799 () Bool)

(declare-fun res!441243 () Bool)

(assert (=> b!674799 (=> (not res!441243) (not e!385131))))

(assert (=> b!674799 (= res!441243 (not (contains!3451 lt!312667 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674800 () Bool)

(declare-fun res!441249 () Bool)

(assert (=> b!674800 (=> (not res!441249) (not e!385124))))

(declare-fun noDuplicate!698 (List!12874) Bool)

(assert (=> b!674800 (= res!441249 (noDuplicate!698 acc!681))))

(declare-fun b!674801 () Bool)

(declare-fun res!441230 () Bool)

(assert (=> b!674801 (=> (not res!441230) (not e!385131))))

(declare-fun e!385129 () Bool)

(assert (=> b!674801 (= res!441230 e!385129)))

(declare-fun res!441238 () Bool)

(assert (=> b!674801 (=> res!441238 e!385129)))

(assert (=> b!674801 (= res!441238 e!385123)))

(declare-fun res!441251 () Bool)

(assert (=> b!674801 (=> (not res!441251) (not e!385123))))

(assert (=> b!674801 (= res!441251 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!674802 () Bool)

(declare-fun res!441233 () Bool)

(assert (=> b!674802 (=> (not res!441233) (not e!385131))))

(assert (=> b!674802 (= res!441233 (not (contains!3451 lt!312667 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674803 () Bool)

(declare-fun res!441231 () Bool)

(assert (=> b!674803 (=> (not res!441231) (not e!385124))))

(assert (=> b!674803 (= res!441231 (validKeyInArray!0 (select (arr!18833 a!3626) from!3004)))))

(declare-fun b!674804 () Bool)

(declare-fun res!441237 () Bool)

(assert (=> b!674804 (=> (not res!441237) (not e!385124))))

(assert (=> b!674804 (= res!441237 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12871))))

(declare-fun b!674805 () Bool)

(declare-fun res!441248 () Bool)

(assert (=> b!674805 (=> (not res!441248) (not e!385131))))

(assert (=> b!674805 (= res!441248 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312667))))

(declare-fun b!674806 () Bool)

(declare-fun e!385125 () Bool)

(assert (=> b!674806 (= e!385125 (not (contains!3451 lt!312667 k!2843)))))

(declare-fun b!674807 () Bool)

(declare-fun res!441250 () Bool)

(assert (=> b!674807 (=> (not res!441250) (not e!385131))))

(assert (=> b!674807 (= res!441250 (noDuplicate!698 lt!312667))))

(declare-fun b!674808 () Bool)

(declare-fun res!441241 () Bool)

(assert (=> b!674808 (=> (not res!441241) (not e!385124))))

(assert (=> b!674808 (= res!441241 e!385130)))

(declare-fun res!441239 () Bool)

(assert (=> b!674808 (=> res!441239 e!385130)))

(assert (=> b!674808 (= res!441239 e!385126)))

(declare-fun res!441232 () Bool)

(assert (=> b!674808 (=> (not res!441232) (not e!385126))))

(assert (=> b!674808 (= res!441232 (bvsgt from!3004 i!1382))))

(declare-fun b!674809 () Bool)

(assert (=> b!674809 (= e!385129 e!385125)))

(declare-fun res!441254 () Bool)

(assert (=> b!674809 (=> (not res!441254) (not e!385125))))

(assert (=> b!674809 (= res!441254 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!674810 () Bool)

(declare-fun res!441253 () Bool)

(assert (=> b!674810 (=> (not res!441253) (not e!385124))))

(assert (=> b!674810 (= res!441253 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!60234 res!441240) b!674800))

(assert (= (and b!674800 res!441249) b!674784))

(assert (= (and b!674784 res!441235) b!674787))

(assert (= (and b!674787 res!441234) b!674808))

(assert (= (and b!674808 res!441232) b!674789))

(assert (= (and b!674808 (not res!441239)) b!674790))

(assert (= (and b!674790 res!441247) b!674794))

(assert (= (and b!674808 res!441241) b!674804))

(assert (= (and b!674804 res!441237) b!674810))

(assert (= (and b!674810 res!441253) b!674788))

(assert (= (and b!674788 res!441242) b!674793))

(assert (= (and b!674793 res!441236) b!674796))

(assert (= (and b!674796 res!441252) b!674795))

(assert (= (and b!674795 res!441244) b!674803))

(assert (= (and b!674803 res!441231) b!674798))

(assert (= (and b!674798 c!77144) b!674792))

(assert (= (and b!674798 (not c!77144)) b!674791))

(assert (= (and b!674798 res!441245) b!674797))

(assert (= (and b!674797 res!441246) b!674807))

(assert (= (and b!674807 res!441250) b!674799))

(assert (= (and b!674799 res!441243) b!674802))

(assert (= (and b!674802 res!441233) b!674801))

(assert (= (and b!674801 res!441251) b!674786))

(assert (= (and b!674801 (not res!441238)) b!674809))

(assert (= (and b!674809 res!441254) b!674806))

(assert (= (and b!674801 res!441230) b!674805))

(assert (= (and b!674805 res!441248) b!674785))

(declare-fun m!642579 () Bool)

(assert (=> b!674794 m!642579))

(declare-fun m!642581 () Bool)

(assert (=> b!674799 m!642581))

(declare-fun m!642583 () Bool)

(assert (=> b!674810 m!642583))

(declare-fun m!642585 () Bool)

(assert (=> b!674803 m!642585))

(assert (=> b!674803 m!642585))

(declare-fun m!642587 () Bool)

(assert (=> b!674803 m!642587))

(declare-fun m!642589 () Bool)

(assert (=> b!674792 m!642589))

(declare-fun m!642591 () Bool)

(assert (=> b!674792 m!642591))

(declare-fun m!642593 () Bool)

(assert (=> b!674786 m!642593))

(declare-fun m!642595 () Bool)

(assert (=> b!674807 m!642595))

(assert (=> b!674798 m!642585))

(declare-fun m!642597 () Bool)

(assert (=> b!674787 m!642597))

(assert (=> b!674797 m!642585))

(assert (=> b!674797 m!642585))

(declare-fun m!642599 () Bool)

(assert (=> b!674797 m!642599))

(declare-fun m!642601 () Bool)

(assert (=> b!674784 m!642601))

(declare-fun m!642603 () Bool)

(assert (=> start!60234 m!642603))

(declare-fun m!642605 () Bool)

(assert (=> b!674802 m!642605))

(declare-fun m!642607 () Bool)

(assert (=> b!674804 m!642607))

(declare-fun m!642609 () Bool)

(assert (=> b!674785 m!642609))

(declare-fun m!642611 () Bool)

(assert (=> b!674785 m!642611))

(declare-fun m!642613 () Bool)

(assert (=> b!674785 m!642613))

(declare-fun m!642615 () Bool)

(assert (=> b!674805 m!642615))

(declare-fun m!642617 () Bool)

(assert (=> b!674796 m!642617))

(assert (=> b!674806 m!642593))

(declare-fun m!642619 () Bool)

(assert (=> b!674793 m!642619))

(assert (=> b!674789 m!642579))

(declare-fun m!642621 () Bool)

(assert (=> b!674800 m!642621))

(push 1)

