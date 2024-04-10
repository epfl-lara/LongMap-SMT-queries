; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103000 () Bool)

(assert start!103000)

(declare-fun b!1237387 () Bool)

(declare-fun res!825256 () Bool)

(declare-fun e!701292 () Bool)

(assert (=> b!1237387 (=> (not res!825256) (not e!701292))))

(declare-datatypes ((List!27267 0))(
  ( (Nil!27264) (Cons!27263 (h!28472 (_ BitVec 64)) (t!40730 List!27267)) )
))
(declare-fun acc!846 () List!27267)

(declare-fun noDuplicate!1926 (List!27267) Bool)

(assert (=> b!1237387 (= res!825256 (noDuplicate!1926 acc!846))))

(declare-fun b!1237388 () Bool)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> b!1237388 (= e!701292 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000)))))

(declare-fun lt!561032 () List!27267)

(declare-fun subseq!583 (List!27267 List!27267) Bool)

(assert (=> b!1237388 (subseq!583 acc!846 lt!561032)))

(declare-datatypes ((Unit!41064 0))(
  ( (Unit!41065) )
))
(declare-fun lt!561030 () Unit!41064)

(declare-fun subseqTail!70 (List!27267 List!27267) Unit!41064)

(assert (=> b!1237388 (= lt!561030 (subseqTail!70 lt!561032 lt!561032))))

(assert (=> b!1237388 (subseq!583 lt!561032 lt!561032)))

(declare-fun lt!561031 () Unit!41064)

(declare-fun lemmaListSubSeqRefl!0 (List!27267) Unit!41064)

(assert (=> b!1237388 (= lt!561031 (lemmaListSubSeqRefl!0 lt!561032))))

(declare-datatypes ((array!79776 0))(
  ( (array!79777 (arr!38494 (Array (_ BitVec 32) (_ BitVec 64))) (size!39030 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79776)

(assert (=> b!1237388 (= lt!561032 (Cons!27263 (select (arr!38494 a!3835) from!3213) acc!846))))

(declare-fun b!1237389 () Bool)

(declare-fun res!825258 () Bool)

(assert (=> b!1237389 (=> (not res!825258) (not e!701292))))

(declare-fun arrayNoDuplicates!0 (array!79776 (_ BitVec 32) List!27267) Bool)

(assert (=> b!1237389 (= res!825258 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1237390 () Bool)

(declare-fun res!825259 () Bool)

(assert (=> b!1237390 (=> (not res!825259) (not e!701292))))

(declare-fun k!2925 () (_ BitVec 64))

(declare-fun contains!7329 (List!27267 (_ BitVec 64)) Bool)

(assert (=> b!1237390 (= res!825259 (contains!7329 acc!846 k!2925))))

(declare-fun b!1237391 () Bool)

(declare-fun res!825261 () Bool)

(assert (=> b!1237391 (=> (not res!825261) (not e!701292))))

(assert (=> b!1237391 (= res!825261 (not (contains!7329 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!825262 () Bool)

(assert (=> start!103000 (=> (not res!825262) (not e!701292))))

(assert (=> start!103000 (= res!825262 (and (bvslt (size!39030 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39030 a!3835))))))

(assert (=> start!103000 e!701292))

(declare-fun array_inv!29342 (array!79776) Bool)

(assert (=> start!103000 (array_inv!29342 a!3835)))

(assert (=> start!103000 true))

(declare-fun b!1237392 () Bool)

(declare-fun res!825255 () Bool)

(assert (=> b!1237392 (=> (not res!825255) (not e!701292))))

(assert (=> b!1237392 (= res!825255 (not (contains!7329 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237393 () Bool)

(declare-fun res!825260 () Bool)

(assert (=> b!1237393 (=> (not res!825260) (not e!701292))))

(assert (=> b!1237393 (= res!825260 (not (= from!3213 (bvsub (size!39030 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1237394 () Bool)

(declare-fun res!825257 () Bool)

(assert (=> b!1237394 (=> (not res!825257) (not e!701292))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1237394 (= res!825257 (validKeyInArray!0 (select (arr!38494 a!3835) from!3213)))))

(assert (= (and start!103000 res!825262) b!1237387))

(assert (= (and b!1237387 res!825256) b!1237391))

(assert (= (and b!1237391 res!825261) b!1237392))

(assert (= (and b!1237392 res!825255) b!1237389))

(assert (= (and b!1237389 res!825258) b!1237390))

(assert (= (and b!1237390 res!825259) b!1237393))

(assert (= (and b!1237393 res!825260) b!1237394))

(assert (= (and b!1237394 res!825257) b!1237388))

(declare-fun m!1141105 () Bool)

(assert (=> b!1237392 m!1141105))

(declare-fun m!1141107 () Bool)

(assert (=> start!103000 m!1141107))

(declare-fun m!1141109 () Bool)

(assert (=> b!1237389 m!1141109))

(declare-fun m!1141111 () Bool)

(assert (=> b!1237391 m!1141111))

(declare-fun m!1141113 () Bool)

(assert (=> b!1237388 m!1141113))

(declare-fun m!1141115 () Bool)

(assert (=> b!1237388 m!1141115))

(declare-fun m!1141117 () Bool)

(assert (=> b!1237388 m!1141117))

(declare-fun m!1141119 () Bool)

(assert (=> b!1237388 m!1141119))

(declare-fun m!1141121 () Bool)

(assert (=> b!1237388 m!1141121))

(declare-fun m!1141123 () Bool)

(assert (=> b!1237387 m!1141123))

(assert (=> b!1237394 m!1141121))

(assert (=> b!1237394 m!1141121))

(declare-fun m!1141125 () Bool)

(assert (=> b!1237394 m!1141125))

(declare-fun m!1141127 () Bool)

(assert (=> b!1237390 m!1141127))

(push 1)

(assert (not b!1237390))

(assert (not b!1237389))

(assert (not b!1237388))

(assert (not b!1237392))

(assert (not b!1237387))

(assert (not b!1237394))

(assert (not start!103000))

(assert (not b!1237391))

