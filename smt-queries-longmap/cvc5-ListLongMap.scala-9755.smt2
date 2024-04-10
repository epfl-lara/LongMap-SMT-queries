; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115610 () Bool)

(assert start!115610)

(declare-fun b!1367151 () Bool)

(declare-fun res!910684 () Bool)

(declare-fun e!774872 () Bool)

(assert (=> b!1367151 (=> (not res!910684) (not e!774872))))

(declare-datatypes ((List!31914 0))(
  ( (Nil!31911) (Cons!31910 (h!33119 (_ BitVec 64)) (t!46608 List!31914)) )
))
(declare-fun acc!866 () List!31914)

(declare-fun contains!9596 (List!31914 (_ BitVec 64)) Bool)

(assert (=> b!1367151 (= res!910684 (not (contains!9596 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367152 () Bool)

(declare-fun res!910677 () Bool)

(assert (=> b!1367152 (=> (not res!910677) (not e!774872))))

(declare-fun newAcc!98 () List!31914)

(assert (=> b!1367152 (= res!910677 (not (contains!9596 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367153 () Bool)

(declare-fun e!774873 () Bool)

(assert (=> b!1367153 (= e!774872 e!774873)))

(declare-fun res!910678 () Bool)

(assert (=> b!1367153 (=> (not res!910678) (not e!774873))))

(declare-datatypes ((array!92841 0))(
  ( (array!92842 (arr!44846 (Array (_ BitVec 32) (_ BitVec 64))) (size!45396 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92841)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92841 (_ BitVec 32) List!31914) Bool)

(assert (=> b!1367153 (= res!910678 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45129 0))(
  ( (Unit!45130) )
))
(declare-fun lt!601812 () Unit!45129)

(declare-fun noDuplicateSubseq!185 (List!31914 List!31914) Unit!45129)

(assert (=> b!1367153 (= lt!601812 (noDuplicateSubseq!185 newAcc!98 acc!866))))

(declare-fun b!1367154 () Bool)

(declare-fun res!910687 () Bool)

(assert (=> b!1367154 (=> (not res!910687) (not e!774872))))

(assert (=> b!1367154 (= res!910687 (not (contains!9596 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367156 () Bool)

(declare-fun res!910679 () Bool)

(assert (=> b!1367156 (=> (not res!910679) (not e!774872))))

(assert (=> b!1367156 (= res!910679 (not (contains!9596 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367157 () Bool)

(declare-fun res!910682 () Bool)

(assert (=> b!1367157 (=> (not res!910682) (not e!774873))))

(assert (=> b!1367157 (= res!910682 (bvslt from!3239 (size!45396 a!3861)))))

(declare-fun b!1367158 () Bool)

(declare-fun res!910681 () Bool)

(assert (=> b!1367158 (=> (not res!910681) (not e!774873))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1367158 (= res!910681 (validKeyInArray!0 (select (arr!44846 a!3861) from!3239)))))

(declare-fun b!1367159 () Bool)

(assert (=> b!1367159 (= e!774873 (not true))))

(declare-fun lt!601810 () Bool)

(declare-fun noDuplicate!2453 (List!31914) Bool)

(assert (=> b!1367159 (= lt!601810 (noDuplicate!2453 newAcc!98))))

(declare-fun lt!601813 () Unit!45129)

(declare-fun lt!601808 () List!31914)

(declare-fun lt!601809 () List!31914)

(assert (=> b!1367159 (= lt!601813 (noDuplicateSubseq!185 lt!601808 lt!601809))))

(assert (=> b!1367159 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601808)))

(declare-fun lt!601811 () Unit!45129)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92841 List!31914 List!31914 (_ BitVec 32)) Unit!45129)

(assert (=> b!1367159 (= lt!601811 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 lt!601809 lt!601808 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> b!1367159 (= lt!601808 (Cons!31910 (select (arr!44846 a!3861) from!3239) newAcc!98))))

(assert (=> b!1367159 (= lt!601809 (Cons!31910 (select (arr!44846 a!3861) from!3239) acc!866))))

(declare-fun res!910680 () Bool)

(assert (=> start!115610 (=> (not res!910680) (not e!774872))))

(assert (=> start!115610 (= res!910680 (and (bvslt (size!45396 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45396 a!3861))))))

(assert (=> start!115610 e!774872))

(declare-fun array_inv!33874 (array!92841) Bool)

(assert (=> start!115610 (array_inv!33874 a!3861)))

(assert (=> start!115610 true))

(declare-fun b!1367155 () Bool)

(declare-fun res!910685 () Bool)

(assert (=> b!1367155 (=> (not res!910685) (not e!774872))))

(assert (=> b!1367155 (= res!910685 (noDuplicate!2453 acc!866))))

(declare-fun b!1367160 () Bool)

(declare-fun res!910683 () Bool)

(assert (=> b!1367160 (=> (not res!910683) (not e!774873))))

(assert (=> b!1367160 (= res!910683 (not (contains!9596 acc!866 (select (arr!44846 a!3861) from!3239))))))

(declare-fun b!1367161 () Bool)

(declare-fun res!910686 () Bool)

(assert (=> b!1367161 (=> (not res!910686) (not e!774872))))

(declare-fun subseq!998 (List!31914 List!31914) Bool)

(assert (=> b!1367161 (= res!910686 (subseq!998 newAcc!98 acc!866))))

(assert (= (and start!115610 res!910680) b!1367155))

(assert (= (and b!1367155 res!910685) b!1367154))

(assert (= (and b!1367154 res!910687) b!1367151))

(assert (= (and b!1367151 res!910684) b!1367156))

(assert (= (and b!1367156 res!910679) b!1367152))

(assert (= (and b!1367152 res!910677) b!1367161))

(assert (= (and b!1367161 res!910686) b!1367153))

(assert (= (and b!1367153 res!910678) b!1367157))

(assert (= (and b!1367157 res!910682) b!1367158))

(assert (= (and b!1367158 res!910681) b!1367160))

(assert (= (and b!1367160 res!910683) b!1367159))

(declare-fun m!1251415 () Bool)

(assert (=> start!115610 m!1251415))

(declare-fun m!1251417 () Bool)

(assert (=> b!1367155 m!1251417))

(declare-fun m!1251419 () Bool)

(assert (=> b!1367159 m!1251419))

(declare-fun m!1251421 () Bool)

(assert (=> b!1367159 m!1251421))

(declare-fun m!1251423 () Bool)

(assert (=> b!1367159 m!1251423))

(declare-fun m!1251425 () Bool)

(assert (=> b!1367159 m!1251425))

(declare-fun m!1251427 () Bool)

(assert (=> b!1367159 m!1251427))

(declare-fun m!1251429 () Bool)

(assert (=> b!1367161 m!1251429))

(declare-fun m!1251431 () Bool)

(assert (=> b!1367156 m!1251431))

(declare-fun m!1251433 () Bool)

(assert (=> b!1367152 m!1251433))

(assert (=> b!1367158 m!1251423))

(assert (=> b!1367158 m!1251423))

(declare-fun m!1251435 () Bool)

(assert (=> b!1367158 m!1251435))

(declare-fun m!1251437 () Bool)

(assert (=> b!1367154 m!1251437))

(declare-fun m!1251439 () Bool)

(assert (=> b!1367151 m!1251439))

(declare-fun m!1251441 () Bool)

(assert (=> b!1367153 m!1251441))

(declare-fun m!1251443 () Bool)

(assert (=> b!1367153 m!1251443))

(assert (=> b!1367160 m!1251423))

(assert (=> b!1367160 m!1251423))

(declare-fun m!1251445 () Bool)

(assert (=> b!1367160 m!1251445))

(push 1)

