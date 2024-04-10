; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118158 () Bool)

(assert start!118158)

(declare-fun b!1382833 () Bool)

(declare-fun e!783765 () Bool)

(declare-datatypes ((List!32151 0))(
  ( (Nil!32148) (Cons!32147 (h!33356 (_ BitVec 64)) (t!46845 List!32151)) )
))
(declare-fun contains!9739 (List!32151 (_ BitVec 64)) Bool)

(assert (=> b!1382833 (= e!783765 (contains!9739 Nil!32148 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1382834 () Bool)

(declare-fun res!924427 () Bool)

(declare-fun e!783767 () Bool)

(assert (=> b!1382834 (=> (not res!924427) (not e!783767))))

(declare-fun noDuplicate!2597 (List!32151) Bool)

(assert (=> b!1382834 (= res!924427 (noDuplicate!2597 Nil!32148))))

(declare-fun res!924430 () Bool)

(assert (=> start!118158 (=> (not res!924430) (not e!783767))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118158 (= res!924430 (validMask!0 mask!2987))))

(assert (=> start!118158 e!783767))

(assert (=> start!118158 true))

(declare-datatypes ((array!94488 0))(
  ( (array!94489 (arr!45623 (Array (_ BitVec 32) (_ BitVec 64))) (size!46173 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94488)

(declare-fun array_inv!34651 (array!94488) Bool)

(assert (=> start!118158 (array_inv!34651 a!2938)))

(declare-fun b!1382835 () Bool)

(declare-fun res!924428 () Bool)

(assert (=> b!1382835 (=> (not res!924428) (not e!783767))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1382835 (= res!924428 (and (= (size!46173 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46173 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46173 a!2938))))))

(declare-fun b!1382836 () Bool)

(declare-fun res!924429 () Bool)

(assert (=> b!1382836 (=> (not res!924429) (not e!783767))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382836 (= res!924429 (validKeyInArray!0 (select (arr!45623 a!2938) i!1065)))))

(declare-fun b!1382837 () Bool)

(assert (=> b!1382837 (= e!783767 e!783765)))

(declare-fun res!924425 () Bool)

(assert (=> b!1382837 (=> res!924425 e!783765)))

(assert (=> b!1382837 (= res!924425 (contains!9739 Nil!32148 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1382838 () Bool)

(declare-fun res!924426 () Bool)

(assert (=> b!1382838 (=> (not res!924426) (not e!783767))))

(assert (=> b!1382838 (= res!924426 (and (bvsle #b00000000000000000000000000000000 (size!46173 a!2938)) (bvslt (size!46173 a!2938) #b01111111111111111111111111111111)))))

(assert (= (and start!118158 res!924430) b!1382835))

(assert (= (and b!1382835 res!924428) b!1382836))

(assert (= (and b!1382836 res!924429) b!1382838))

(assert (= (and b!1382838 res!924426) b!1382834))

(assert (= (and b!1382834 res!924427) b!1382837))

(assert (= (and b!1382837 (not res!924425)) b!1382833))

(declare-fun m!1267941 () Bool)

(assert (=> b!1382837 m!1267941))

(declare-fun m!1267943 () Bool)

(assert (=> start!118158 m!1267943))

(declare-fun m!1267945 () Bool)

(assert (=> start!118158 m!1267945))

(declare-fun m!1267947 () Bool)

(assert (=> b!1382834 m!1267947))

(declare-fun m!1267949 () Bool)

(assert (=> b!1382833 m!1267949))

(declare-fun m!1267951 () Bool)

(assert (=> b!1382836 m!1267951))

(assert (=> b!1382836 m!1267951))

(declare-fun m!1267953 () Bool)

(assert (=> b!1382836 m!1267953))

(push 1)

(assert (not b!1382834))

(assert (not b!1382836))

(assert (not b!1382837))

(assert (not start!118158))

(assert (not b!1382833))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!149255 () Bool)

(declare-fun lt!608482 () Bool)

(declare-fun content!759 (List!32151) (Set (_ BitVec 64)))

(assert (=> d!149255 (= lt!608482 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!759 Nil!32148)))))

(declare-fun e!783805 () Bool)

(assert (=> d!149255 (= lt!608482 e!783805)))

(declare-fun res!924486 () Bool)

(assert (=> d!149255 (=> (not res!924486) (not e!783805))))

(assert (=> d!149255 (= res!924486 (is-Cons!32147 Nil!32148))))

(assert (=> d!149255 (= (contains!9739 Nil!32148 #b0000000000000000000000000000000000000000000000000000000000000000) lt!608482)))

(declare-fun b!1382893 () Bool)

(declare-fun e!783804 () Bool)

(assert (=> b!1382893 (= e!783805 e!783804)))

(declare-fun res!924485 () Bool)

(assert (=> b!1382893 (=> res!924485 e!783804)))

(assert (=> b!1382893 (= res!924485 (= (h!33356 Nil!32148) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1382894 () Bool)

(assert (=> b!1382894 (= e!783804 (contains!9739 (t!46845 Nil!32148) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!149255 res!924486) b!1382893))

(assert (= (and b!1382893 (not res!924485)) b!1382894))

(declare-fun m!1267997 () Bool)

(assert (=> d!149255 m!1267997))

(declare-fun m!1267999 () Bool)

(assert (=> d!149255 m!1267999))

(declare-fun m!1268001 () Bool)

(assert (=> b!1382894 m!1268001))

(assert (=> b!1382837 d!149255))

(declare-fun d!149261 () Bool)

(assert (=> d!149261 (= (validMask!0 mask!2987) (and (or (= mask!2987 #b00000000000000000000000000000111) (= mask!2987 #b00000000000000000000000000001111) (= mask!2987 #b00000000000000000000000000011111) (= mask!2987 #b00000000000000000000000000111111) (= mask!2987 #b00000000000000000000000001111111) (= mask!2987 #b00000000000000000000000011111111) (= mask!2987 #b00000000000000000000000111111111) (= mask!2987 #b00000000000000000000001111111111) (= mask!2987 #b00000000000000000000011111111111) (= mask!2987 #b00000000000000000000111111111111) (= mask!2987 #b00000000000000000001111111111111) (= mask!2987 #b00000000000000000011111111111111) (= mask!2987 #b00000000000000000111111111111111) (= mask!2987 #b00000000000000001111111111111111) (= mask!2987 #b00000000000000011111111111111111) (= mask!2987 #b00000000000000111111111111111111) (= mask!2987 #b00000000000001111111111111111111) (= mask!2987 #b00000000000011111111111111111111) (= mask!2987 #b00000000000111111111111111111111) (= mask!2987 #b00000000001111111111111111111111) (= mask!2987 #b00000000011111111111111111111111) (= mask!2987 #b00000000111111111111111111111111) (= mask!2987 #b00000001111111111111111111111111) (= mask!2987 #b00000011111111111111111111111111) (= mask!2987 #b00000111111111111111111111111111) (= mask!2987 #b00001111111111111111111111111111) (= mask!2987 #b00011111111111111111111111111111) (= mask!2987 #b00111111111111111111111111111111)) (bvsle mask!2987 #b00111111111111111111111111111111)))))

(assert (=> start!118158 d!149261))

(declare-fun d!149269 () Bool)

(assert (=> d!149269 (= (array_inv!34651 a!2938) (bvsge (size!46173 a!2938) #b00000000000000000000000000000000))))

(assert (=> start!118158 d!149269))

