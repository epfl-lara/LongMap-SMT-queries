; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102196 () Bool)

(assert start!102196)

(declare-fun b!1228690 () Bool)

(declare-fun res!816521 () Bool)

(declare-fun e!697808 () Bool)

(assert (=> b!1228690 (=> res!816521 e!697808)))

(declare-datatypes ((List!27037 0))(
  ( (Nil!27034) (Cons!27033 (h!28251 (_ BitVec 64)) (t!40492 List!27037)) )
))
(declare-fun contains!7108 (List!27037 (_ BitVec 64)) Bool)

(assert (=> b!1228690 (= res!816521 (contains!7108 Nil!27034 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228691 () Bool)

(assert (=> b!1228691 (= e!697808 true)))

(declare-datatypes ((Unit!40617 0))(
  ( (Unit!40618) )
))
(declare-fun lt!559392 () Unit!40617)

(declare-fun acc!823 () List!27037)

(declare-fun noDuplicateSubseq!31 (List!27037 List!27037) Unit!40617)

(assert (=> b!1228691 (= lt!559392 (noDuplicateSubseq!31 Nil!27034 acc!823))))

(declare-fun b!1228693 () Bool)

(declare-fun res!816522 () Bool)

(assert (=> b!1228693 (=> res!816522 e!697808)))

(assert (=> b!1228693 (= res!816522 (contains!7108 Nil!27034 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228694 () Bool)

(declare-fun res!816523 () Bool)

(declare-fun e!697806 () Bool)

(assert (=> b!1228694 (=> (not res!816523) (not e!697806))))

(declare-datatypes ((array!79269 0))(
  ( (array!79270 (arr!38251 (Array (_ BitVec 32) (_ BitVec 64))) (size!38788 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79269)

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79269 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1228694 (= res!816523 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1228695 () Bool)

(declare-fun res!816532 () Bool)

(assert (=> b!1228695 (=> (not res!816532) (not e!697806))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1228695 (= res!816532 (validKeyInArray!0 k!2913))))

(declare-fun b!1228696 () Bool)

(assert (=> b!1228696 (= e!697806 (not e!697808))))

(declare-fun res!816528 () Bool)

(assert (=> b!1228696 (=> res!816528 e!697808)))

(assert (=> b!1228696 (= res!816528 (bvsgt from!3184 (size!38788 a!3806)))))

(declare-fun arrayNoDuplicates!0 (array!79269 (_ BitVec 32) List!27037) Bool)

(assert (=> b!1228696 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27033 (select (arr!38251 a!3806) from!3184) acc!823))))

(declare-fun b!1228697 () Bool)

(declare-fun res!816524 () Bool)

(assert (=> b!1228697 (=> (not res!816524) (not e!697806))))

(assert (=> b!1228697 (= res!816524 (validKeyInArray!0 (select (arr!38251 a!3806) from!3184)))))

(declare-fun b!1228698 () Bool)

(declare-fun res!816525 () Bool)

(assert (=> b!1228698 (=> res!816525 e!697808)))

(declare-fun subseq!478 (List!27037 List!27037) Bool)

(assert (=> b!1228698 (= res!816525 (not (subseq!478 Nil!27034 acc!823)))))

(declare-fun res!816527 () Bool)

(assert (=> start!102196 (=> (not res!816527) (not e!697806))))

(assert (=> start!102196 (= res!816527 (bvslt (size!38788 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102196 e!697806))

(declare-fun array_inv!29189 (array!79269) Bool)

(assert (=> start!102196 (array_inv!29189 a!3806)))

(assert (=> start!102196 true))

(declare-fun b!1228692 () Bool)

(declare-fun res!816529 () Bool)

(assert (=> b!1228692 (=> (not res!816529) (not e!697806))))

(assert (=> b!1228692 (= res!816529 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1228699 () Bool)

(declare-fun res!816533 () Bool)

(assert (=> b!1228699 (=> (not res!816533) (not e!697806))))

(assert (=> b!1228699 (= res!816533 (not (contains!7108 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228700 () Bool)

(declare-fun res!816526 () Bool)

(assert (=> b!1228700 (=> (not res!816526) (not e!697806))))

(assert (=> b!1228700 (= res!816526 (not (contains!7108 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228701 () Bool)

(declare-fun res!816531 () Bool)

(assert (=> b!1228701 (=> (not res!816531) (not e!697806))))

(declare-fun noDuplicate!1689 (List!27037) Bool)

(assert (=> b!1228701 (= res!816531 (noDuplicate!1689 acc!823))))

(declare-fun b!1228702 () Bool)

(declare-fun res!816530 () Bool)

(assert (=> b!1228702 (=> (not res!816530) (not e!697806))))

(assert (=> b!1228702 (= res!816530 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38788 a!3806)) (bvslt from!3184 (size!38788 a!3806))))))

(assert (= (and start!102196 res!816527) b!1228695))

(assert (= (and b!1228695 res!816532) b!1228702))

(assert (= (and b!1228702 res!816530) b!1228701))

(assert (= (and b!1228701 res!816531) b!1228700))

(assert (= (and b!1228700 res!816526) b!1228699))

(assert (= (and b!1228699 res!816533) b!1228694))

(assert (= (and b!1228694 res!816523) b!1228692))

(assert (= (and b!1228692 res!816529) b!1228697))

(assert (= (and b!1228697 res!816524) b!1228696))

(assert (= (and b!1228696 (not res!816528)) b!1228690))

(assert (= (and b!1228690 (not res!816521)) b!1228693))

(assert (= (and b!1228693 (not res!816522)) b!1228698))

(assert (= (and b!1228698 (not res!816525)) b!1228691))

(declare-fun m!1133789 () Bool)

(assert (=> b!1228693 m!1133789))

(declare-fun m!1133791 () Bool)

(assert (=> b!1228692 m!1133791))

(declare-fun m!1133793 () Bool)

(assert (=> b!1228691 m!1133793))

(declare-fun m!1133795 () Bool)

(assert (=> b!1228696 m!1133795))

(declare-fun m!1133797 () Bool)

(assert (=> b!1228696 m!1133797))

(assert (=> b!1228697 m!1133795))

(assert (=> b!1228697 m!1133795))

(declare-fun m!1133799 () Bool)

(assert (=> b!1228697 m!1133799))

(declare-fun m!1133801 () Bool)

(assert (=> start!102196 m!1133801))

(declare-fun m!1133803 () Bool)

(assert (=> b!1228690 m!1133803))

(declare-fun m!1133805 () Bool)

(assert (=> b!1228700 m!1133805))

(declare-fun m!1133807 () Bool)

(assert (=> b!1228701 m!1133807))

(declare-fun m!1133809 () Bool)

(assert (=> b!1228695 m!1133809))

(declare-fun m!1133811 () Bool)

(assert (=> b!1228694 m!1133811))

(declare-fun m!1133813 () Bool)

(assert (=> b!1228699 m!1133813))

(declare-fun m!1133815 () Bool)

(assert (=> b!1228698 m!1133815))

(push 1)

(assert (not b!1228696))

(assert (not start!102196))

(assert (not b!1228701))

(assert (not b!1228699))

(assert (not b!1228694))

(assert (not b!1228693))

(assert (not b!1228698))

(assert (not b!1228692))

(assert (not b!1228695))

(assert (not b!1228697))

(assert (not b!1228691))

(assert (not b!1228700))

(assert (not b!1228690))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

