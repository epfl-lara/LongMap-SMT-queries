; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114894 () Bool)

(assert start!114894)

(declare-fun b!1362156 () Bool)

(declare-fun res!906197 () Bool)

(declare-fun e!772662 () Bool)

(assert (=> b!1362156 (=> (not res!906197) (not e!772662))))

(declare-datatypes ((List!31790 0))(
  ( (Nil!31787) (Cons!31786 (h!32995 (_ BitVec 64)) (t!46475 List!31790)) )
))
(declare-fun lt!600404 () List!31790)

(declare-fun noDuplicate!2356 (List!31790) Bool)

(assert (=> b!1362156 (= res!906197 (noDuplicate!2356 lt!600404))))

(declare-fun b!1362157 () Bool)

(declare-fun res!906205 () Bool)

(declare-fun e!772664 () Bool)

(assert (=> b!1362157 (=> (not res!906205) (not e!772664))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92629 0))(
  ( (array!92630 (arr!44749 (Array (_ BitVec 32) (_ BitVec 64))) (size!45299 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92629)

(assert (=> b!1362157 (= res!906205 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45299 a!3742)))))

(declare-fun res!906202 () Bool)

(assert (=> start!114894 (=> (not res!906202) (not e!772664))))

(assert (=> start!114894 (= res!906202 (and (bvslt (size!45299 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45299 a!3742))))))

(assert (=> start!114894 e!772664))

(assert (=> start!114894 true))

(declare-fun array_inv!33777 (array!92629) Bool)

(assert (=> start!114894 (array_inv!33777 a!3742)))

(declare-fun b!1362158 () Bool)

(declare-datatypes ((Unit!44907 0))(
  ( (Unit!44908) )
))
(declare-fun e!772665 () Unit!44907)

(declare-fun Unit!44909 () Unit!44907)

(assert (=> b!1362158 (= e!772665 Unit!44909)))

(declare-fun b!1362159 () Bool)

(assert (=> b!1362159 (= e!772662 (not true))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun i!1404 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92629 (_ BitVec 32) List!31790) Bool)

(assert (=> b!1362159 (arrayNoDuplicates!0 (array!92630 (store (arr!44749 a!3742) i!1404 l!3587) (size!45299 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) lt!600404)))

(declare-fun lt!600405 () Unit!44907)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92629 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31790) Unit!44907)

(assert (=> b!1362159 (= lt!600405 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) lt!600404))))

(declare-fun b!1362160 () Bool)

(declare-fun res!906203 () Bool)

(assert (=> b!1362160 (=> (not res!906203) (not e!772664))))

(declare-fun acc!759 () List!31790)

(assert (=> b!1362160 (= res!906203 (noDuplicate!2356 acc!759))))

(declare-fun b!1362161 () Bool)

(declare-fun res!906194 () Bool)

(assert (=> b!1362161 (=> (not res!906194) (not e!772664))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1362161 (= res!906194 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1362162 () Bool)

(declare-fun res!906199 () Bool)

(assert (=> b!1362162 (=> (not res!906199) (not e!772664))))

(assert (=> b!1362162 (= res!906199 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31787))))

(declare-fun b!1362163 () Bool)

(declare-fun res!906208 () Bool)

(assert (=> b!1362163 (=> (not res!906208) (not e!772662))))

(declare-fun contains!9499 (List!31790 (_ BitVec 64)) Bool)

(assert (=> b!1362163 (= res!906208 (not (contains!9499 lt!600404 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362164 () Bool)

(declare-fun res!906201 () Bool)

(assert (=> b!1362164 (=> (not res!906201) (not e!772662))))

(assert (=> b!1362164 (= res!906201 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!600404))))

(declare-fun b!1362165 () Bool)

(declare-fun res!906206 () Bool)

(assert (=> b!1362165 (=> (not res!906206) (not e!772664))))

(assert (=> b!1362165 (= res!906206 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1362166 () Bool)

(declare-fun res!906204 () Bool)

(assert (=> b!1362166 (=> (not res!906204) (not e!772664))))

(assert (=> b!1362166 (= res!906204 (not (contains!9499 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362167 () Bool)

(declare-fun e!772666 () Bool)

(assert (=> b!1362167 (= e!772664 e!772666)))

(declare-fun res!906200 () Bool)

(assert (=> b!1362167 (=> (not res!906200) (not e!772666))))

(declare-fun lt!600402 () Bool)

(assert (=> b!1362167 (= res!906200 (and (not (= from!3120 i!1404)) lt!600402))))

(declare-fun lt!600403 () Unit!44907)

(assert (=> b!1362167 (= lt!600403 e!772665)))

(declare-fun c!127421 () Bool)

(assert (=> b!1362167 (= c!127421 lt!600402)))

(assert (=> b!1362167 (= lt!600402 (validKeyInArray!0 (select (arr!44749 a!3742) from!3120)))))

(declare-fun b!1362168 () Bool)

(assert (=> b!1362168 (= e!772666 e!772662)))

(declare-fun res!906195 () Bool)

(assert (=> b!1362168 (=> (not res!906195) (not e!772662))))

(assert (=> b!1362168 (= res!906195 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!904 (List!31790 (_ BitVec 64)) List!31790)

(assert (=> b!1362168 (= lt!600404 ($colon$colon!904 acc!759 (select (arr!44749 a!3742) from!3120)))))

(declare-fun b!1362169 () Bool)

(declare-fun res!906196 () Bool)

(assert (=> b!1362169 (=> (not res!906196) (not e!772662))))

(assert (=> b!1362169 (= res!906196 (not (contains!9499 lt!600404 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362170 () Bool)

(declare-fun res!906198 () Bool)

(assert (=> b!1362170 (=> (not res!906198) (not e!772664))))

(assert (=> b!1362170 (= res!906198 (not (contains!9499 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362171 () Bool)

(declare-fun lt!600406 () Unit!44907)

(assert (=> b!1362171 (= e!772665 lt!600406)))

(declare-fun lt!600401 () Unit!44907)

(declare-fun lemmaListSubSeqRefl!0 (List!31790) Unit!44907)

(assert (=> b!1362171 (= lt!600401 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!901 (List!31790 List!31790) Bool)

(assert (=> b!1362171 (subseq!901 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92629 List!31790 List!31790 (_ BitVec 32)) Unit!44907)

(assert (=> b!1362171 (= lt!600406 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!904 acc!759 (select (arr!44749 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1362171 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1362172 () Bool)

(declare-fun res!906207 () Bool)

(assert (=> b!1362172 (=> (not res!906207) (not e!772664))))

(assert (=> b!1362172 (= res!906207 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45299 a!3742))))))

(assert (= (and start!114894 res!906202) b!1362160))

(assert (= (and b!1362160 res!906203) b!1362166))

(assert (= (and b!1362166 res!906204) b!1362170))

(assert (= (and b!1362170 res!906198) b!1362162))

(assert (= (and b!1362162 res!906199) b!1362165))

(assert (= (and b!1362165 res!906206) b!1362172))

(assert (= (and b!1362172 res!906207) b!1362161))

(assert (= (and b!1362161 res!906194) b!1362157))

(assert (= (and b!1362157 res!906205) b!1362167))

(assert (= (and b!1362167 c!127421) b!1362171))

(assert (= (and b!1362167 (not c!127421)) b!1362158))

(assert (= (and b!1362167 res!906200) b!1362168))

(assert (= (and b!1362168 res!906195) b!1362156))

(assert (= (and b!1362156 res!906197) b!1362163))

(assert (= (and b!1362163 res!906208) b!1362169))

(assert (= (and b!1362169 res!906196) b!1362164))

(assert (= (and b!1362164 res!906201) b!1362159))

(declare-fun m!1247113 () Bool)

(assert (=> b!1362162 m!1247113))

(declare-fun m!1247115 () Bool)

(assert (=> b!1362169 m!1247115))

(declare-fun m!1247117 () Bool)

(assert (=> b!1362159 m!1247117))

(declare-fun m!1247119 () Bool)

(assert (=> b!1362159 m!1247119))

(declare-fun m!1247121 () Bool)

(assert (=> b!1362159 m!1247121))

(declare-fun m!1247123 () Bool)

(assert (=> b!1362171 m!1247123))

(declare-fun m!1247125 () Bool)

(assert (=> b!1362171 m!1247125))

(declare-fun m!1247127 () Bool)

(assert (=> b!1362171 m!1247127))

(declare-fun m!1247129 () Bool)

(assert (=> b!1362171 m!1247129))

(declare-fun m!1247131 () Bool)

(assert (=> b!1362171 m!1247131))

(assert (=> b!1362171 m!1247125))

(assert (=> b!1362171 m!1247127))

(declare-fun m!1247133 () Bool)

(assert (=> b!1362171 m!1247133))

(declare-fun m!1247135 () Bool)

(assert (=> b!1362161 m!1247135))

(declare-fun m!1247137 () Bool)

(assert (=> b!1362166 m!1247137))

(declare-fun m!1247139 () Bool)

(assert (=> b!1362164 m!1247139))

(declare-fun m!1247141 () Bool)

(assert (=> b!1362156 m!1247141))

(assert (=> b!1362168 m!1247125))

(assert (=> b!1362168 m!1247125))

(assert (=> b!1362168 m!1247127))

(declare-fun m!1247143 () Bool)

(assert (=> b!1362163 m!1247143))

(declare-fun m!1247145 () Bool)

(assert (=> b!1362170 m!1247145))

(declare-fun m!1247147 () Bool)

(assert (=> b!1362160 m!1247147))

(assert (=> b!1362167 m!1247125))

(assert (=> b!1362167 m!1247125))

(declare-fun m!1247149 () Bool)

(assert (=> b!1362167 m!1247149))

(declare-fun m!1247151 () Bool)

(assert (=> start!114894 m!1247151))

(declare-fun m!1247153 () Bool)

(assert (=> b!1362165 m!1247153))

(push 1)

