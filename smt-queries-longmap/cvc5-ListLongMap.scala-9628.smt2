; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113906 () Bool)

(assert start!113906)

(declare-fun b!1350791 () Bool)

(declare-fun e!768382 () Bool)

(declare-fun e!768380 () Bool)

(assert (=> b!1350791 (= e!768382 (not e!768380))))

(declare-fun res!896256 () Bool)

(assert (=> b!1350791 (=> res!896256 e!768380)))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1350791 (= res!896256 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-datatypes ((List!31533 0))(
  ( (Nil!31530) (Cons!31529 (h!32738 (_ BitVec 64)) (t!46191 List!31533)) )
))
(declare-fun lt!597055 () List!31533)

(declare-fun acc!759 () List!31533)

(declare-datatypes ((array!92088 0))(
  ( (array!92089 (arr!44492 (Array (_ BitVec 32) (_ BitVec 64))) (size!45042 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92088)

(declare-fun $colon$colon!677 (List!31533 (_ BitVec 64)) List!31533)

(assert (=> b!1350791 (= lt!597055 ($colon$colon!677 acc!759 (select (arr!44492 a!3742) from!3120)))))

(declare-fun subseq!662 (List!31533 List!31533) Bool)

(assert (=> b!1350791 (subseq!662 acc!759 acc!759)))

(declare-datatypes ((Unit!44238 0))(
  ( (Unit!44239) )
))
(declare-fun lt!597056 () Unit!44238)

(declare-fun lemmaListSubSeqRefl!0 (List!31533) Unit!44238)

(assert (=> b!1350791 (= lt!597056 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1350792 () Bool)

(declare-fun res!896258 () Bool)

(assert (=> b!1350792 (=> res!896258 e!768380)))

(declare-fun noDuplicate!2099 (List!31533) Bool)

(assert (=> b!1350792 (= res!896258 (not (noDuplicate!2099 lt!597055)))))

(declare-fun b!1350793 () Bool)

(declare-fun res!896259 () Bool)

(assert (=> b!1350793 (=> (not res!896259) (not e!768382))))

(declare-fun contains!9242 (List!31533 (_ BitVec 64)) Bool)

(assert (=> b!1350793 (= res!896259 (not (contains!9242 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350794 () Bool)

(declare-fun res!896250 () Bool)

(assert (=> b!1350794 (=> (not res!896250) (not e!768382))))

(assert (=> b!1350794 (= res!896250 (not (contains!9242 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350795 () Bool)

(assert (=> b!1350795 (= e!768380 true)))

(declare-fun lt!597057 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92088 (_ BitVec 32) List!31533) Bool)

(assert (=> b!1350795 (= lt!597057 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597055))))

(declare-fun lt!597058 () Unit!44238)

(declare-fun noDuplicateSubseq!113 (List!31533 List!31533) Unit!44238)

(assert (=> b!1350795 (= lt!597058 (noDuplicateSubseq!113 acc!759 lt!597055))))

(declare-fun b!1350796 () Bool)

(declare-fun res!896263 () Bool)

(assert (=> b!1350796 (=> (not res!896263) (not e!768382))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1350796 (= res!896263 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45042 a!3742))))))

(declare-fun b!1350797 () Bool)

(declare-fun res!896254 () Bool)

(assert (=> b!1350797 (=> (not res!896254) (not e!768382))))

(assert (=> b!1350797 (= res!896254 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1350798 () Bool)

(declare-fun res!896249 () Bool)

(assert (=> b!1350798 (=> res!896249 e!768380)))

(assert (=> b!1350798 (= res!896249 (contains!9242 lt!597055 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350799 () Bool)

(declare-fun res!896253 () Bool)

(assert (=> b!1350799 (=> (not res!896253) (not e!768382))))

(assert (=> b!1350799 (= res!896253 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45042 a!3742)))))

(declare-fun b!1350800 () Bool)

(declare-fun res!896257 () Bool)

(assert (=> b!1350800 (=> (not res!896257) (not e!768382))))

(assert (=> b!1350800 (= res!896257 (noDuplicate!2099 acc!759))))

(declare-fun b!1350801 () Bool)

(declare-fun res!896262 () Bool)

(assert (=> b!1350801 (=> (not res!896262) (not e!768382))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1350801 (= res!896262 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1350803 () Bool)

(declare-fun res!896251 () Bool)

(assert (=> b!1350803 (=> (not res!896251) (not e!768382))))

(assert (=> b!1350803 (= res!896251 (validKeyInArray!0 (select (arr!44492 a!3742) from!3120)))))

(declare-fun b!1350804 () Bool)

(declare-fun res!896260 () Bool)

(assert (=> b!1350804 (=> res!896260 e!768380)))

(assert (=> b!1350804 (= res!896260 (contains!9242 lt!597055 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350805 () Bool)

(declare-fun res!896261 () Bool)

(assert (=> b!1350805 (=> (not res!896261) (not e!768382))))

(assert (=> b!1350805 (= res!896261 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31530))))

(declare-fun res!896252 () Bool)

(assert (=> start!113906 (=> (not res!896252) (not e!768382))))

(assert (=> start!113906 (= res!896252 (and (bvslt (size!45042 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45042 a!3742))))))

(assert (=> start!113906 e!768382))

(assert (=> start!113906 true))

(declare-fun array_inv!33520 (array!92088) Bool)

(assert (=> start!113906 (array_inv!33520 a!3742)))

(declare-fun b!1350802 () Bool)

(declare-fun res!896255 () Bool)

(assert (=> b!1350802 (=> res!896255 e!768380)))

(assert (=> b!1350802 (= res!896255 (not (subseq!662 acc!759 lt!597055)))))

(assert (= (and start!113906 res!896252) b!1350800))

(assert (= (and b!1350800 res!896257) b!1350794))

(assert (= (and b!1350794 res!896250) b!1350793))

(assert (= (and b!1350793 res!896259) b!1350805))

(assert (= (and b!1350805 res!896261) b!1350797))

(assert (= (and b!1350797 res!896254) b!1350796))

(assert (= (and b!1350796 res!896263) b!1350801))

(assert (= (and b!1350801 res!896262) b!1350799))

(assert (= (and b!1350799 res!896253) b!1350803))

(assert (= (and b!1350803 res!896251) b!1350791))

(assert (= (and b!1350791 (not res!896256)) b!1350792))

(assert (= (and b!1350792 (not res!896258)) b!1350798))

(assert (= (and b!1350798 (not res!896249)) b!1350804))

(assert (= (and b!1350804 (not res!896260)) b!1350802))

(assert (= (and b!1350802 (not res!896255)) b!1350795))

(declare-fun m!1237945 () Bool)

(assert (=> b!1350793 m!1237945))

(declare-fun m!1237947 () Bool)

(assert (=> b!1350791 m!1237947))

(assert (=> b!1350791 m!1237947))

(declare-fun m!1237949 () Bool)

(assert (=> b!1350791 m!1237949))

(declare-fun m!1237951 () Bool)

(assert (=> b!1350791 m!1237951))

(declare-fun m!1237953 () Bool)

(assert (=> b!1350791 m!1237953))

(declare-fun m!1237955 () Bool)

(assert (=> b!1350801 m!1237955))

(declare-fun m!1237957 () Bool)

(assert (=> b!1350802 m!1237957))

(declare-fun m!1237959 () Bool)

(assert (=> b!1350804 m!1237959))

(declare-fun m!1237961 () Bool)

(assert (=> b!1350797 m!1237961))

(declare-fun m!1237963 () Bool)

(assert (=> b!1350805 m!1237963))

(declare-fun m!1237965 () Bool)

(assert (=> b!1350800 m!1237965))

(declare-fun m!1237967 () Bool)

(assert (=> b!1350795 m!1237967))

(declare-fun m!1237969 () Bool)

(assert (=> b!1350795 m!1237969))

(declare-fun m!1237971 () Bool)

(assert (=> b!1350794 m!1237971))

(declare-fun m!1237973 () Bool)

(assert (=> b!1350792 m!1237973))

(declare-fun m!1237975 () Bool)

(assert (=> b!1350798 m!1237975))

(declare-fun m!1237977 () Bool)

(assert (=> start!113906 m!1237977))

(assert (=> b!1350803 m!1237947))

(assert (=> b!1350803 m!1237947))

(declare-fun m!1237979 () Bool)

(assert (=> b!1350803 m!1237979))

(push 1)

(assert (not b!1350805))

(assert (not b!1350795))

(assert (not b!1350794))

(assert (not b!1350801))

(assert (not b!1350792))

(assert (not start!113906))

(assert (not b!1350802))

(assert (not b!1350804))

(assert (not b!1350793))

(assert (not b!1350797))

(assert (not b!1350803))

(assert (not b!1350800))

(assert (not b!1350798))

(assert (not b!1350791))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

