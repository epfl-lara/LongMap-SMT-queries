; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114896 () Bool)

(assert start!114896)

(declare-fun b!1361631 () Bool)

(declare-fun res!905164 () Bool)

(declare-fun e!772627 () Bool)

(assert (=> b!1361631 (=> (not res!905164) (not e!772627))))

(declare-datatypes ((List!31800 0))(
  ( (Nil!31797) (Cons!31796 (h!33014 (_ BitVec 64)) (t!46468 List!31800)) )
))
(declare-fun acc!759 () List!31800)

(declare-fun noDuplicate!2343 (List!31800) Bool)

(assert (=> b!1361631 (= res!905164 (noDuplicate!2343 acc!759))))

(declare-fun b!1361633 () Bool)

(assert (=> b!1361633 (= e!772627 false)))

(declare-datatypes ((Unit!44756 0))(
  ( (Unit!44757) )
))
(declare-fun lt!600328 () Unit!44756)

(declare-fun e!772626 () Unit!44756)

(assert (=> b!1361633 (= lt!600328 e!772626)))

(declare-fun c!127681 () Bool)

(declare-datatypes ((array!92675 0))(
  ( (array!92676 (arr!44772 (Array (_ BitVec 32) (_ BitVec 64))) (size!45323 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92675)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1361633 (= c!127681 (validKeyInArray!0 (select (arr!44772 a!3742) from!3120)))))

(declare-fun b!1361634 () Bool)

(declare-fun res!905165 () Bool)

(assert (=> b!1361634 (=> (not res!905165) (not e!772627))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1361634 (= res!905165 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45323 a!3742))))))

(declare-fun b!1361635 () Bool)

(declare-fun lt!600330 () Unit!44756)

(assert (=> b!1361635 (= e!772626 lt!600330)))

(declare-fun lt!600329 () Unit!44756)

(declare-fun lemmaListSubSeqRefl!0 (List!31800) Unit!44756)

(assert (=> b!1361635 (= lt!600329 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!871 (List!31800 List!31800) Bool)

(assert (=> b!1361635 (subseq!871 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92675 List!31800 List!31800 (_ BitVec 32)) Unit!44756)

(declare-fun $colon$colon!873 (List!31800 (_ BitVec 64)) List!31800)

(assert (=> b!1361635 (= lt!600330 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!873 acc!759 (select (arr!44772 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92675 (_ BitVec 32) List!31800) Bool)

(assert (=> b!1361635 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1361636 () Bool)

(declare-fun res!905171 () Bool)

(assert (=> b!1361636 (=> (not res!905171) (not e!772627))))

(assert (=> b!1361636 (= res!905171 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31797))))

(declare-fun b!1361637 () Bool)

(declare-fun res!905169 () Bool)

(assert (=> b!1361637 (=> (not res!905169) (not e!772627))))

(declare-fun contains!9512 (List!31800 (_ BitVec 64)) Bool)

(assert (=> b!1361637 (= res!905169 (not (contains!9512 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361638 () Bool)

(declare-fun Unit!44758 () Unit!44756)

(assert (=> b!1361638 (= e!772626 Unit!44758)))

(declare-fun b!1361639 () Bool)

(declare-fun res!905167 () Bool)

(assert (=> b!1361639 (=> (not res!905167) (not e!772627))))

(assert (=> b!1361639 (= res!905167 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45323 a!3742)))))

(declare-fun b!1361640 () Bool)

(declare-fun res!905172 () Bool)

(assert (=> b!1361640 (=> (not res!905172) (not e!772627))))

(assert (=> b!1361640 (= res!905172 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1361641 () Bool)

(declare-fun res!905168 () Bool)

(assert (=> b!1361641 (=> (not res!905168) (not e!772627))))

(assert (=> b!1361641 (= res!905168 (not (contains!9512 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!905166 () Bool)

(assert (=> start!114896 (=> (not res!905166) (not e!772627))))

(assert (=> start!114896 (= res!905166 (and (bvslt (size!45323 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45323 a!3742))))))

(assert (=> start!114896 e!772627))

(assert (=> start!114896 true))

(declare-fun array_inv!34053 (array!92675) Bool)

(assert (=> start!114896 (array_inv!34053 a!3742)))

(declare-fun b!1361632 () Bool)

(declare-fun res!905170 () Bool)

(assert (=> b!1361632 (=> (not res!905170) (not e!772627))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1361632 (= res!905170 (not (validKeyInArray!0 l!3587)))))

(assert (= (and start!114896 res!905166) b!1361631))

(assert (= (and b!1361631 res!905164) b!1361641))

(assert (= (and b!1361641 res!905168) b!1361637))

(assert (= (and b!1361637 res!905169) b!1361636))

(assert (= (and b!1361636 res!905171) b!1361640))

(assert (= (and b!1361640 res!905172) b!1361634))

(assert (= (and b!1361634 res!905165) b!1361632))

(assert (= (and b!1361632 res!905170) b!1361639))

(assert (= (and b!1361639 res!905167) b!1361633))

(assert (= (and b!1361633 c!127681) b!1361635))

(assert (= (and b!1361633 (not c!127681)) b!1361638))

(declare-fun m!1247217 () Bool)

(assert (=> b!1361633 m!1247217))

(assert (=> b!1361633 m!1247217))

(declare-fun m!1247219 () Bool)

(assert (=> b!1361633 m!1247219))

(declare-fun m!1247221 () Bool)

(assert (=> b!1361641 m!1247221))

(declare-fun m!1247223 () Bool)

(assert (=> b!1361637 m!1247223))

(declare-fun m!1247225 () Bool)

(assert (=> b!1361635 m!1247225))

(assert (=> b!1361635 m!1247217))

(declare-fun m!1247227 () Bool)

(assert (=> b!1361635 m!1247227))

(declare-fun m!1247229 () Bool)

(assert (=> b!1361635 m!1247229))

(declare-fun m!1247231 () Bool)

(assert (=> b!1361635 m!1247231))

(assert (=> b!1361635 m!1247217))

(assert (=> b!1361635 m!1247227))

(declare-fun m!1247233 () Bool)

(assert (=> b!1361635 m!1247233))

(declare-fun m!1247235 () Bool)

(assert (=> b!1361632 m!1247235))

(declare-fun m!1247237 () Bool)

(assert (=> start!114896 m!1247237))

(declare-fun m!1247239 () Bool)

(assert (=> b!1361631 m!1247239))

(declare-fun m!1247241 () Bool)

(assert (=> b!1361640 m!1247241))

(declare-fun m!1247243 () Bool)

(assert (=> b!1361636 m!1247243))

(push 1)

(assert (not b!1361631))

(assert (not b!1361641))

(assert (not b!1361632))

(assert (not start!114896))

(assert (not b!1361636))

(assert (not b!1361637))

(assert (not b!1361640))

(assert (not b!1361633))

(assert (not b!1361635))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

