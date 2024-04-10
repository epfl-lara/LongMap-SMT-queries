; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115446 () Bool)

(assert start!115446)

(declare-fun b!1365215 () Bool)

(declare-fun res!908800 () Bool)

(declare-fun e!774161 () Bool)

(assert (=> b!1365215 (=> (not res!908800) (not e!774161))))

(declare-datatypes ((List!31880 0))(
  ( (Nil!31877) (Cons!31876 (h!33085 (_ BitVec 64)) (t!46574 List!31880)) )
))
(declare-fun newAcc!98 () List!31880)

(declare-fun acc!866 () List!31880)

(declare-fun subseq!964 (List!31880 List!31880) Bool)

(assert (=> b!1365215 (= res!908800 (subseq!964 newAcc!98 acc!866))))

(declare-fun b!1365216 () Bool)

(declare-fun res!908797 () Bool)

(assert (=> b!1365216 (=> (not res!908797) (not e!774161))))

(declare-fun noDuplicate!2419 (List!31880) Bool)

(assert (=> b!1365216 (= res!908797 (noDuplicate!2419 acc!866))))

(declare-fun b!1365217 () Bool)

(declare-fun res!908801 () Bool)

(declare-fun e!774160 () Bool)

(assert (=> b!1365217 (=> (not res!908801) (not e!774160))))

(declare-datatypes ((array!92767 0))(
  ( (array!92768 (arr!44812 (Array (_ BitVec 32) (_ BitVec 64))) (size!45362 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92767)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1365217 (= res!908801 (validKeyInArray!0 (select (arr!44812 a!3861) from!3239)))))

(declare-fun b!1365218 () Bool)

(declare-fun res!908792 () Bool)

(declare-fun e!774163 () Bool)

(assert (=> b!1365218 (=> (not res!908792) (not e!774163))))

(declare-fun lt!601228 () List!31880)

(declare-fun contains!9562 (List!31880 (_ BitVec 64)) Bool)

(assert (=> b!1365218 (= res!908792 (not (contains!9562 lt!601228 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365219 () Bool)

(assert (=> b!1365219 (= e!774161 e!774160)))

(declare-fun res!908793 () Bool)

(assert (=> b!1365219 (=> (not res!908793) (not e!774160))))

(declare-fun arrayNoDuplicates!0 (array!92767 (_ BitVec 32) List!31880) Bool)

(assert (=> b!1365219 (= res!908793 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45061 0))(
  ( (Unit!45062) )
))
(declare-fun lt!601224 () Unit!45061)

(declare-fun noDuplicateSubseq!151 (List!31880 List!31880) Unit!45061)

(assert (=> b!1365219 (= lt!601224 (noDuplicateSubseq!151 newAcc!98 acc!866))))

(declare-fun b!1365220 () Bool)

(declare-fun res!908798 () Bool)

(assert (=> b!1365220 (=> (not res!908798) (not e!774163))))

(declare-fun lt!601227 () List!31880)

(assert (=> b!1365220 (= res!908798 (not (contains!9562 lt!601227 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365221 () Bool)

(declare-fun res!908796 () Bool)

(assert (=> b!1365221 (=> (not res!908796) (not e!774163))))

(assert (=> b!1365221 (= res!908796 (not (contains!9562 lt!601227 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365222 () Bool)

(declare-fun res!908804 () Bool)

(assert (=> b!1365222 (=> (not res!908804) (not e!774161))))

(assert (=> b!1365222 (= res!908804 (not (contains!9562 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365223 () Bool)

(declare-fun res!908795 () Bool)

(assert (=> b!1365223 (=> (not res!908795) (not e!774163))))

(assert (=> b!1365223 (= res!908795 (subseq!964 lt!601228 lt!601227))))

(declare-fun b!1365224 () Bool)

(assert (=> b!1365224 (= e!774163 false)))

(declare-fun lt!601226 () Bool)

(assert (=> b!1365224 (= lt!601226 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601227))))

(declare-fun lt!601225 () Unit!45061)

(assert (=> b!1365224 (= lt!601225 (noDuplicateSubseq!151 lt!601228 lt!601227))))

(declare-fun b!1365225 () Bool)

(declare-fun res!908794 () Bool)

(assert (=> b!1365225 (=> (not res!908794) (not e!774161))))

(assert (=> b!1365225 (= res!908794 (not (contains!9562 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365226 () Bool)

(declare-fun res!908799 () Bool)

(assert (=> b!1365226 (=> (not res!908799) (not e!774163))))

(assert (=> b!1365226 (= res!908799 (not (contains!9562 lt!601228 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365227 () Bool)

(declare-fun res!908805 () Bool)

(assert (=> b!1365227 (=> (not res!908805) (not e!774160))))

(assert (=> b!1365227 (= res!908805 (bvslt from!3239 (size!45362 a!3861)))))

(declare-fun res!908791 () Bool)

(assert (=> start!115446 (=> (not res!908791) (not e!774161))))

(assert (=> start!115446 (= res!908791 (and (bvslt (size!45362 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45362 a!3861))))))

(assert (=> start!115446 e!774161))

(declare-fun array_inv!33840 (array!92767) Bool)

(assert (=> start!115446 (array_inv!33840 a!3861)))

(assert (=> start!115446 true))

(declare-fun b!1365228 () Bool)

(declare-fun res!908790 () Bool)

(assert (=> b!1365228 (=> (not res!908790) (not e!774163))))

(assert (=> b!1365228 (= res!908790 (noDuplicate!2419 lt!601227))))

(declare-fun b!1365229 () Bool)

(declare-fun res!908806 () Bool)

(assert (=> b!1365229 (=> (not res!908806) (not e!774161))))

(assert (=> b!1365229 (= res!908806 (not (contains!9562 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365230 () Bool)

(declare-fun res!908802 () Bool)

(assert (=> b!1365230 (=> (not res!908802) (not e!774161))))

(assert (=> b!1365230 (= res!908802 (not (contains!9562 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365231 () Bool)

(assert (=> b!1365231 (= e!774160 e!774163)))

(declare-fun res!908803 () Bool)

(assert (=> b!1365231 (=> (not res!908803) (not e!774163))))

(assert (=> b!1365231 (= res!908803 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(assert (=> b!1365231 (= lt!601228 (Cons!31876 (select (arr!44812 a!3861) from!3239) newAcc!98))))

(assert (=> b!1365231 (= lt!601227 (Cons!31876 (select (arr!44812 a!3861) from!3239) acc!866))))

(declare-fun b!1365232 () Bool)

(declare-fun res!908789 () Bool)

(assert (=> b!1365232 (=> (not res!908789) (not e!774160))))

(assert (=> b!1365232 (= res!908789 (not (contains!9562 acc!866 (select (arr!44812 a!3861) from!3239))))))

(assert (= (and start!115446 res!908791) b!1365216))

(assert (= (and b!1365216 res!908797) b!1365225))

(assert (= (and b!1365225 res!908794) b!1365230))

(assert (= (and b!1365230 res!908802) b!1365222))

(assert (= (and b!1365222 res!908804) b!1365229))

(assert (= (and b!1365229 res!908806) b!1365215))

(assert (= (and b!1365215 res!908800) b!1365219))

(assert (= (and b!1365219 res!908793) b!1365227))

(assert (= (and b!1365227 res!908805) b!1365217))

(assert (= (and b!1365217 res!908801) b!1365232))

(assert (= (and b!1365232 res!908789) b!1365231))

(assert (= (and b!1365231 res!908803) b!1365228))

(assert (= (and b!1365228 res!908790) b!1365221))

(assert (= (and b!1365221 res!908796) b!1365220))

(assert (= (and b!1365220 res!908798) b!1365226))

(assert (= (and b!1365226 res!908799) b!1365218))

(assert (= (and b!1365218 res!908792) b!1365223))

(assert (= (and b!1365223 res!908795) b!1365224))

(declare-fun m!1249821 () Bool)

(assert (=> b!1365221 m!1249821))

(declare-fun m!1249823 () Bool)

(assert (=> b!1365229 m!1249823))

(declare-fun m!1249825 () Bool)

(assert (=> b!1365215 m!1249825))

(declare-fun m!1249827 () Bool)

(assert (=> b!1365217 m!1249827))

(assert (=> b!1365217 m!1249827))

(declare-fun m!1249829 () Bool)

(assert (=> b!1365217 m!1249829))

(declare-fun m!1249831 () Bool)

(assert (=> b!1365223 m!1249831))

(declare-fun m!1249833 () Bool)

(assert (=> b!1365218 m!1249833))

(declare-fun m!1249835 () Bool)

(assert (=> b!1365230 m!1249835))

(assert (=> b!1365232 m!1249827))

(assert (=> b!1365232 m!1249827))

(declare-fun m!1249837 () Bool)

(assert (=> b!1365232 m!1249837))

(assert (=> b!1365231 m!1249827))

(declare-fun m!1249839 () Bool)

(assert (=> b!1365216 m!1249839))

(declare-fun m!1249841 () Bool)

(assert (=> start!115446 m!1249841))

(declare-fun m!1249843 () Bool)

(assert (=> b!1365220 m!1249843))

(declare-fun m!1249845 () Bool)

(assert (=> b!1365219 m!1249845))

(declare-fun m!1249847 () Bool)

(assert (=> b!1365219 m!1249847))

(declare-fun m!1249849 () Bool)

(assert (=> b!1365226 m!1249849))

(declare-fun m!1249851 () Bool)

(assert (=> b!1365225 m!1249851))

(declare-fun m!1249853 () Bool)

(assert (=> b!1365222 m!1249853))

(declare-fun m!1249855 () Bool)

(assert (=> b!1365224 m!1249855))

(declare-fun m!1249857 () Bool)

(assert (=> b!1365224 m!1249857))

(declare-fun m!1249859 () Bool)

(assert (=> b!1365228 m!1249859))

(push 1)

