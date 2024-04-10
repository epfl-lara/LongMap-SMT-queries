; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101986 () Bool)

(assert start!101986)

(declare-fun b!1227910 () Bool)

(declare-fun e!697093 () Bool)

(declare-fun e!697092 () Bool)

(assert (=> b!1227910 (= e!697093 (not e!697092))))

(declare-fun res!816524 () Bool)

(assert (=> b!1227910 (=> res!816524 e!697092)))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79259 0))(
  ( (array!79260 (arr!38252 (Array (_ BitVec 32) (_ BitVec 64))) (size!38788 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79259)

(assert (=> b!1227910 (= res!816524 (bvsgt from!3184 (size!38788 a!3806)))))

(declare-datatypes ((List!27025 0))(
  ( (Nil!27022) (Cons!27021 (h!28230 (_ BitVec 64)) (t!40488 List!27025)) )
))
(declare-fun acc!823 () List!27025)

(declare-fun arrayNoDuplicates!0 (array!79259 (_ BitVec 32) List!27025) Bool)

(assert (=> b!1227910 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27021 (select (arr!38252 a!3806) from!3184) acc!823))))

(declare-fun b!1227911 () Bool)

(declare-fun res!816526 () Bool)

(assert (=> b!1227911 (=> res!816526 e!697092)))

(declare-fun contains!7087 (List!27025 (_ BitVec 64)) Bool)

(assert (=> b!1227911 (= res!816526 (contains!7087 Nil!27022 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227912 () Bool)

(declare-fun res!816531 () Bool)

(assert (=> b!1227912 (=> res!816531 e!697092)))

(assert (=> b!1227912 (= res!816531 (contains!7087 Nil!27022 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227913 () Bool)

(declare-fun res!816529 () Bool)

(assert (=> b!1227913 (=> (not res!816529) (not e!697093))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1227913 (= res!816529 (validKeyInArray!0 k!2913))))

(declare-fun res!816523 () Bool)

(assert (=> start!101986 (=> (not res!816523) (not e!697093))))

(assert (=> start!101986 (= res!816523 (bvslt (size!38788 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101986 e!697093))

(declare-fun array_inv!29100 (array!79259) Bool)

(assert (=> start!101986 (array_inv!29100 a!3806)))

(assert (=> start!101986 true))

(declare-fun b!1227914 () Bool)

(declare-fun res!816522 () Bool)

(assert (=> b!1227914 (=> (not res!816522) (not e!697093))))

(assert (=> b!1227914 (= res!816522 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1227915 () Bool)

(assert (=> b!1227915 (= e!697092 true)))

(declare-datatypes ((Unit!40670 0))(
  ( (Unit!40671) )
))
(declare-fun lt!558951 () Unit!40670)

(declare-fun noDuplicateSubseq!44 (List!27025 List!27025) Unit!40670)

(assert (=> b!1227915 (= lt!558951 (noDuplicateSubseq!44 Nil!27022 acc!823))))

(declare-fun b!1227916 () Bool)

(declare-fun res!816527 () Bool)

(assert (=> b!1227916 (=> (not res!816527) (not e!697093))))

(assert (=> b!1227916 (= res!816527 (not (contains!7087 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227917 () Bool)

(declare-fun res!816533 () Bool)

(assert (=> b!1227917 (=> (not res!816533) (not e!697093))))

(declare-fun noDuplicate!1684 (List!27025) Bool)

(assert (=> b!1227917 (= res!816533 (noDuplicate!1684 acc!823))))

(declare-fun b!1227918 () Bool)

(declare-fun res!816528 () Bool)

(assert (=> b!1227918 (=> (not res!816528) (not e!697093))))

(assert (=> b!1227918 (= res!816528 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38788 a!3806)) (bvslt from!3184 (size!38788 a!3806))))))

(declare-fun b!1227919 () Bool)

(declare-fun res!816532 () Bool)

(assert (=> b!1227919 (=> res!816532 e!697092)))

(declare-fun subseq!491 (List!27025 List!27025) Bool)

(assert (=> b!1227919 (= res!816532 (not (subseq!491 Nil!27022 acc!823)))))

(declare-fun b!1227920 () Bool)

(declare-fun res!816530 () Bool)

(assert (=> b!1227920 (=> (not res!816530) (not e!697093))))

(declare-fun arrayContainsKey!0 (array!79259 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1227920 (= res!816530 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1227921 () Bool)

(declare-fun res!816525 () Bool)

(assert (=> b!1227921 (=> (not res!816525) (not e!697093))))

(assert (=> b!1227921 (= res!816525 (validKeyInArray!0 (select (arr!38252 a!3806) from!3184)))))

(declare-fun b!1227922 () Bool)

(declare-fun res!816534 () Bool)

(assert (=> b!1227922 (=> (not res!816534) (not e!697093))))

(assert (=> b!1227922 (= res!816534 (not (contains!7087 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!101986 res!816523) b!1227913))

(assert (= (and b!1227913 res!816529) b!1227918))

(assert (= (and b!1227918 res!816528) b!1227917))

(assert (= (and b!1227917 res!816533) b!1227916))

(assert (= (and b!1227916 res!816527) b!1227922))

(assert (= (and b!1227922 res!816534) b!1227920))

(assert (= (and b!1227920 res!816530) b!1227914))

(assert (= (and b!1227914 res!816522) b!1227921))

(assert (= (and b!1227921 res!816525) b!1227910))

(assert (= (and b!1227910 (not res!816524)) b!1227911))

(assert (= (and b!1227911 (not res!816526)) b!1227912))

(assert (= (and b!1227912 (not res!816531)) b!1227919))

(assert (= (and b!1227919 (not res!816532)) b!1227915))

(declare-fun m!1132563 () Bool)

(assert (=> b!1227917 m!1132563))

(declare-fun m!1132565 () Bool)

(assert (=> b!1227919 m!1132565))

(declare-fun m!1132567 () Bool)

(assert (=> b!1227914 m!1132567))

(declare-fun m!1132569 () Bool)

(assert (=> start!101986 m!1132569))

(declare-fun m!1132571 () Bool)

(assert (=> b!1227910 m!1132571))

(declare-fun m!1132573 () Bool)

(assert (=> b!1227910 m!1132573))

(declare-fun m!1132575 () Bool)

(assert (=> b!1227916 m!1132575))

(assert (=> b!1227921 m!1132571))

(assert (=> b!1227921 m!1132571))

(declare-fun m!1132577 () Bool)

(assert (=> b!1227921 m!1132577))

(declare-fun m!1132579 () Bool)

(assert (=> b!1227913 m!1132579))

(declare-fun m!1132581 () Bool)

(assert (=> b!1227922 m!1132581))

(declare-fun m!1132583 () Bool)

(assert (=> b!1227920 m!1132583))

(declare-fun m!1132585 () Bool)

(assert (=> b!1227911 m!1132585))

(declare-fun m!1132587 () Bool)

(assert (=> b!1227915 m!1132587))

(declare-fun m!1132589 () Bool)

(assert (=> b!1227912 m!1132589))

(push 1)

(assert (not b!1227919))

(assert (not b!1227911))

(assert (not b!1227913))

(assert (not b!1227916))

(assert (not b!1227910))

(assert (not b!1227922))

(assert (not start!101986))

(assert (not b!1227921))

(assert (not b!1227915))

(assert (not b!1227912))

(assert (not b!1227917))

(assert (not b!1227920))

(assert (not b!1227914))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

