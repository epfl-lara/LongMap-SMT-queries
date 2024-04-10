; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115482 () Bool)

(assert start!115482)

(declare-fun b!1366187 () Bool)

(declare-fun res!909764 () Bool)

(declare-fun e!774378 () Bool)

(assert (=> b!1366187 (=> (not res!909764) (not e!774378))))

(declare-datatypes ((array!92803 0))(
  ( (array!92804 (arr!44830 (Array (_ BitVec 32) (_ BitVec 64))) (size!45380 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92803)

(declare-datatypes ((List!31898 0))(
  ( (Nil!31895) (Cons!31894 (h!33103 (_ BitVec 64)) (t!46592 List!31898)) )
))
(declare-fun acc!866 () List!31898)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun contains!9580 (List!31898 (_ BitVec 64)) Bool)

(assert (=> b!1366187 (= res!909764 (not (contains!9580 acc!866 (select (arr!44830 a!3861) from!3239))))))

(declare-fun b!1366188 () Bool)

(declare-fun res!909770 () Bool)

(declare-fun e!774376 () Bool)

(assert (=> b!1366188 (=> (not res!909770) (not e!774376))))

(declare-fun lt!601498 () List!31898)

(assert (=> b!1366188 (= res!909770 (not (contains!9580 lt!601498 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366189 () Bool)

(declare-fun res!909765 () Bool)

(assert (=> b!1366189 (=> (not res!909765) (not e!774376))))

(declare-fun noDuplicate!2437 (List!31898) Bool)

(assert (=> b!1366189 (= res!909765 (noDuplicate!2437 lt!601498))))

(declare-fun b!1366190 () Bool)

(declare-fun res!909766 () Bool)

(assert (=> b!1366190 (=> (not res!909766) (not e!774378))))

(assert (=> b!1366190 (= res!909766 (bvslt from!3239 (size!45380 a!3861)))))

(declare-fun b!1366191 () Bool)

(declare-fun res!909772 () Bool)

(declare-fun e!774379 () Bool)

(assert (=> b!1366191 (=> (not res!909772) (not e!774379))))

(declare-fun newAcc!98 () List!31898)

(assert (=> b!1366191 (= res!909772 (not (contains!9580 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!909775 () Bool)

(assert (=> start!115482 (=> (not res!909775) (not e!774379))))

(assert (=> start!115482 (= res!909775 (and (bvslt (size!45380 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45380 a!3861))))))

(assert (=> start!115482 e!774379))

(declare-fun array_inv!33858 (array!92803) Bool)

(assert (=> start!115482 (array_inv!33858 a!3861)))

(assert (=> start!115482 true))

(declare-fun b!1366192 () Bool)

(assert (=> b!1366192 (= e!774379 e!774378)))

(declare-fun res!909762 () Bool)

(assert (=> b!1366192 (=> (not res!909762) (not e!774378))))

(declare-fun arrayNoDuplicates!0 (array!92803 (_ BitVec 32) List!31898) Bool)

(assert (=> b!1366192 (= res!909762 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45097 0))(
  ( (Unit!45098) )
))
(declare-fun lt!601496 () Unit!45097)

(declare-fun noDuplicateSubseq!169 (List!31898 List!31898) Unit!45097)

(assert (=> b!1366192 (= lt!601496 (noDuplicateSubseq!169 newAcc!98 acc!866))))

(declare-fun b!1366193 () Bool)

(declare-fun res!909774 () Bool)

(assert (=> b!1366193 (=> (not res!909774) (not e!774376))))

(declare-fun lt!601495 () List!31898)

(declare-fun subseq!982 (List!31898 List!31898) Bool)

(assert (=> b!1366193 (= res!909774 (subseq!982 lt!601495 lt!601498))))

(declare-fun b!1366194 () Bool)

(declare-fun res!909767 () Bool)

(assert (=> b!1366194 (=> (not res!909767) (not e!774379))))

(assert (=> b!1366194 (= res!909767 (noDuplicate!2437 acc!866))))

(declare-fun b!1366195 () Bool)

(declare-fun res!909778 () Bool)

(assert (=> b!1366195 (=> (not res!909778) (not e!774376))))

(assert (=> b!1366195 (= res!909778 (not (contains!9580 lt!601495 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366196 () Bool)

(declare-fun res!909768 () Bool)

(assert (=> b!1366196 (=> (not res!909768) (not e!774376))))

(assert (=> b!1366196 (= res!909768 (not (contains!9580 lt!601498 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366197 () Bool)

(declare-fun res!909771 () Bool)

(assert (=> b!1366197 (=> (not res!909771) (not e!774379))))

(assert (=> b!1366197 (= res!909771 (not (contains!9580 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366198 () Bool)

(declare-fun res!909761 () Bool)

(assert (=> b!1366198 (=> (not res!909761) (not e!774378))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1366198 (= res!909761 (validKeyInArray!0 (select (arr!44830 a!3861) from!3239)))))

(declare-fun b!1366199 () Bool)

(assert (=> b!1366199 (= e!774378 e!774376)))

(declare-fun res!909773 () Bool)

(assert (=> b!1366199 (=> (not res!909773) (not e!774376))))

(assert (=> b!1366199 (= res!909773 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(assert (=> b!1366199 (= lt!601495 (Cons!31894 (select (arr!44830 a!3861) from!3239) newAcc!98))))

(assert (=> b!1366199 (= lt!601498 (Cons!31894 (select (arr!44830 a!3861) from!3239) acc!866))))

(declare-fun b!1366200 () Bool)

(declare-fun res!909763 () Bool)

(assert (=> b!1366200 (=> (not res!909763) (not e!774376))))

(assert (=> b!1366200 (= res!909763 (not (contains!9580 lt!601495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366201 () Bool)

(assert (=> b!1366201 (= e!774376 false)))

(declare-fun lt!601497 () Bool)

(assert (=> b!1366201 (= lt!601497 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601498))))

(declare-fun lt!601494 () Unit!45097)

(assert (=> b!1366201 (= lt!601494 (noDuplicateSubseq!169 lt!601495 lt!601498))))

(declare-fun b!1366202 () Bool)

(declare-fun res!909777 () Bool)

(assert (=> b!1366202 (=> (not res!909777) (not e!774379))))

(assert (=> b!1366202 (= res!909777 (not (contains!9580 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366203 () Bool)

(declare-fun res!909769 () Bool)

(assert (=> b!1366203 (=> (not res!909769) (not e!774379))))

(assert (=> b!1366203 (= res!909769 (subseq!982 newAcc!98 acc!866))))

(declare-fun b!1366204 () Bool)

(declare-fun res!909776 () Bool)

(assert (=> b!1366204 (=> (not res!909776) (not e!774379))))

(assert (=> b!1366204 (= res!909776 (not (contains!9580 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115482 res!909775) b!1366194))

(assert (= (and b!1366194 res!909767) b!1366204))

(assert (= (and b!1366204 res!909776) b!1366197))

(assert (= (and b!1366197 res!909771) b!1366191))

(assert (= (and b!1366191 res!909772) b!1366202))

(assert (= (and b!1366202 res!909777) b!1366203))

(assert (= (and b!1366203 res!909769) b!1366192))

(assert (= (and b!1366192 res!909762) b!1366190))

(assert (= (and b!1366190 res!909766) b!1366198))

(assert (= (and b!1366198 res!909761) b!1366187))

(assert (= (and b!1366187 res!909764) b!1366199))

(assert (= (and b!1366199 res!909773) b!1366189))

(assert (= (and b!1366189 res!909765) b!1366188))

(assert (= (and b!1366188 res!909770) b!1366196))

(assert (= (and b!1366196 res!909768) b!1366200))

(assert (= (and b!1366200 res!909763) b!1366195))

(assert (= (and b!1366195 res!909778) b!1366193))

(assert (= (and b!1366193 res!909774) b!1366201))

(declare-fun m!1250541 () Bool)

(assert (=> b!1366198 m!1250541))

(assert (=> b!1366198 m!1250541))

(declare-fun m!1250543 () Bool)

(assert (=> b!1366198 m!1250543))

(declare-fun m!1250545 () Bool)

(assert (=> b!1366189 m!1250545))

(declare-fun m!1250547 () Bool)

(assert (=> b!1366201 m!1250547))

(declare-fun m!1250549 () Bool)

(assert (=> b!1366201 m!1250549))

(declare-fun m!1250551 () Bool)

(assert (=> b!1366197 m!1250551))

(declare-fun m!1250553 () Bool)

(assert (=> b!1366191 m!1250553))

(declare-fun m!1250555 () Bool)

(assert (=> b!1366203 m!1250555))

(declare-fun m!1250557 () Bool)

(assert (=> b!1366193 m!1250557))

(assert (=> b!1366199 m!1250541))

(declare-fun m!1250559 () Bool)

(assert (=> b!1366188 m!1250559))

(declare-fun m!1250561 () Bool)

(assert (=> b!1366195 m!1250561))

(declare-fun m!1250563 () Bool)

(assert (=> b!1366204 m!1250563))

(declare-fun m!1250565 () Bool)

(assert (=> b!1366194 m!1250565))

(declare-fun m!1250567 () Bool)

(assert (=> start!115482 m!1250567))

(declare-fun m!1250569 () Bool)

(assert (=> b!1366200 m!1250569))

(declare-fun m!1250571 () Bool)

(assert (=> b!1366196 m!1250571))

(declare-fun m!1250573 () Bool)

(assert (=> b!1366192 m!1250573))

(declare-fun m!1250575 () Bool)

(assert (=> b!1366192 m!1250575))

(declare-fun m!1250577 () Bool)

(assert (=> b!1366202 m!1250577))

(assert (=> b!1366187 m!1250541))

(assert (=> b!1366187 m!1250541))

(declare-fun m!1250579 () Bool)

(assert (=> b!1366187 m!1250579))

(push 1)

(assert (not b!1366187))

(assert (not b!1366198))

(assert (not b!1366196))

(assert (not b!1366201))

(assert (not start!115482))

(assert (not b!1366197))

(assert (not b!1366200))

(assert (not b!1366192))

(assert (not b!1366202))

(assert (not b!1366203))

(assert (not b!1366188))

(assert (not b!1366189))

(assert (not b!1366204))

(assert (not b!1366195))

