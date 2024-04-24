; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116356 () Bool)

(assert start!116356)

(declare-fun b!1372945 () Bool)

(declare-fun res!915530 () Bool)

(declare-fun e!777889 () Bool)

(assert (=> b!1372945 (=> (not res!915530) (not e!777889))))

(declare-datatypes ((List!32047 0))(
  ( (Nil!32044) (Cons!32043 (h!33261 (_ BitVec 64)) (t!46733 List!32047)) )
))
(declare-fun newAcc!98 () List!32047)

(declare-fun contains!9732 (List!32047 (_ BitVec 64)) Bool)

(assert (=> b!1372945 (= res!915530 (not (contains!9732 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372946 () Bool)

(declare-fun res!915534 () Bool)

(declare-fun e!777886 () Bool)

(assert (=> b!1372946 (=> (not res!915534) (not e!777886))))

(declare-fun lt!603173 () List!32047)

(declare-fun lt!603172 () List!32047)

(declare-fun subseq!1091 (List!32047 List!32047) Bool)

(assert (=> b!1372946 (= res!915534 (subseq!1091 lt!603173 lt!603172))))

(declare-fun b!1372947 () Bool)

(declare-fun res!915546 () Bool)

(assert (=> b!1372947 (=> (not res!915546) (not e!777886))))

(assert (=> b!1372947 (= res!915546 (not (contains!9732 lt!603172 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372948 () Bool)

(declare-fun res!915544 () Bool)

(assert (=> b!1372948 (=> (not res!915544) (not e!777886))))

(assert (=> b!1372948 (= res!915544 (not (contains!9732 lt!603173 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372949 () Bool)

(declare-fun res!915542 () Bool)

(assert (=> b!1372949 (=> (not res!915542) (not e!777886))))

(assert (=> b!1372949 (= res!915542 (not (contains!9732 lt!603172 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372950 () Bool)

(declare-fun res!915540 () Bool)

(assert (=> b!1372950 (=> (not res!915540) (not e!777886))))

(assert (=> b!1372950 (= res!915540 (not (contains!9732 lt!603173 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372951 () Bool)

(declare-fun e!777888 () Bool)

(assert (=> b!1372951 (= e!777889 e!777888)))

(declare-fun res!915535 () Bool)

(assert (=> b!1372951 (=> (not res!915535) (not e!777888))))

(declare-datatypes ((array!93166 0))(
  ( (array!93167 (arr!44992 (Array (_ BitVec 32) (_ BitVec 64))) (size!45543 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93166)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun acc!866 () List!32047)

(declare-fun arrayNoDuplicates!0 (array!93166 (_ BitVec 32) List!32047) Bool)

(assert (=> b!1372951 (= res!915535 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45254 0))(
  ( (Unit!45255) )
))
(declare-fun lt!603171 () Unit!45254)

(declare-fun noDuplicateSubseq!278 (List!32047 List!32047) Unit!45254)

(assert (=> b!1372951 (= lt!603171 (noDuplicateSubseq!278 newAcc!98 acc!866))))

(declare-fun b!1372953 () Bool)

(declare-fun res!915538 () Bool)

(assert (=> b!1372953 (=> (not res!915538) (not e!777888))))

(assert (=> b!1372953 (= res!915538 (bvslt from!3239 (size!45543 a!3861)))))

(declare-fun b!1372954 () Bool)

(declare-fun res!915532 () Bool)

(assert (=> b!1372954 (=> (not res!915532) (not e!777889))))

(assert (=> b!1372954 (= res!915532 (not (contains!9732 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372955 () Bool)

(declare-fun e!777887 () Bool)

(assert (=> b!1372955 (= e!777887 (bvsge (bvsub (size!45543 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) (bvsub (size!45543 a!3861) from!3239)))))

(declare-fun b!1372956 () Bool)

(declare-fun res!915529 () Bool)

(assert (=> b!1372956 (=> (not res!915529) (not e!777889))))

(assert (=> b!1372956 (= res!915529 (not (contains!9732 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372957 () Bool)

(declare-fun res!915543 () Bool)

(assert (=> b!1372957 (=> (not res!915543) (not e!777886))))

(declare-fun noDuplicate!2563 (List!32047) Bool)

(assert (=> b!1372957 (= res!915543 (noDuplicate!2563 lt!603172))))

(declare-fun b!1372958 () Bool)

(assert (=> b!1372958 (= e!777888 e!777886)))

(declare-fun res!915528 () Bool)

(assert (=> b!1372958 (=> (not res!915528) (not e!777886))))

(assert (=> b!1372958 (= res!915528 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(assert (=> b!1372958 (= lt!603173 (Cons!32043 (select (arr!44992 a!3861) from!3239) newAcc!98))))

(assert (=> b!1372958 (= lt!603172 (Cons!32043 (select (arr!44992 a!3861) from!3239) acc!866))))

(declare-fun b!1372959 () Bool)

(declare-fun res!915536 () Bool)

(assert (=> b!1372959 (=> (not res!915536) (not e!777889))))

(assert (=> b!1372959 (= res!915536 (not (contains!9732 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372960 () Bool)

(assert (=> b!1372960 (= e!777886 e!777887)))

(declare-fun res!915539 () Bool)

(assert (=> b!1372960 (=> (not res!915539) (not e!777887))))

(assert (=> b!1372960 (= res!915539 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!603172))))

(declare-fun lt!603174 () Unit!45254)

(assert (=> b!1372960 (= lt!603174 (noDuplicateSubseq!278 lt!603173 lt!603172))))

(declare-fun b!1372961 () Bool)

(declare-fun res!915545 () Bool)

(assert (=> b!1372961 (=> (not res!915545) (not e!777888))))

(assert (=> b!1372961 (= res!915545 (not (contains!9732 acc!866 (select (arr!44992 a!3861) from!3239))))))

(declare-fun b!1372962 () Bool)

(declare-fun res!915531 () Bool)

(assert (=> b!1372962 (=> (not res!915531) (not e!777889))))

(assert (=> b!1372962 (= res!915531 (subseq!1091 newAcc!98 acc!866))))

(declare-fun b!1372963 () Bool)

(declare-fun res!915541 () Bool)

(assert (=> b!1372963 (=> (not res!915541) (not e!777889))))

(assert (=> b!1372963 (= res!915541 (noDuplicate!2563 acc!866))))

(declare-fun b!1372952 () Bool)

(declare-fun res!915533 () Bool)

(assert (=> b!1372952 (=> (not res!915533) (not e!777888))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1372952 (= res!915533 (validKeyInArray!0 (select (arr!44992 a!3861) from!3239)))))

(declare-fun res!915537 () Bool)

(assert (=> start!116356 (=> (not res!915537) (not e!777889))))

(assert (=> start!116356 (= res!915537 (and (bvslt (size!45543 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45543 a!3861))))))

(assert (=> start!116356 e!777889))

(declare-fun array_inv!34273 (array!93166) Bool)

(assert (=> start!116356 (array_inv!34273 a!3861)))

(assert (=> start!116356 true))

(assert (= (and start!116356 res!915537) b!1372963))

(assert (= (and b!1372963 res!915541) b!1372954))

(assert (= (and b!1372954 res!915532) b!1372959))

(assert (= (and b!1372959 res!915536) b!1372945))

(assert (= (and b!1372945 res!915530) b!1372956))

(assert (= (and b!1372956 res!915529) b!1372962))

(assert (= (and b!1372962 res!915531) b!1372951))

(assert (= (and b!1372951 res!915535) b!1372953))

(assert (= (and b!1372953 res!915538) b!1372952))

(assert (= (and b!1372952 res!915533) b!1372961))

(assert (= (and b!1372961 res!915545) b!1372958))

(assert (= (and b!1372958 res!915528) b!1372957))

(assert (= (and b!1372957 res!915543) b!1372947))

(assert (= (and b!1372947 res!915546) b!1372949))

(assert (= (and b!1372949 res!915542) b!1372950))

(assert (= (and b!1372950 res!915540) b!1372948))

(assert (= (and b!1372948 res!915544) b!1372946))

(assert (= (and b!1372946 res!915534) b!1372960))

(assert (= (and b!1372960 res!915539) b!1372955))

(declare-fun m!1256683 () Bool)

(assert (=> start!116356 m!1256683))

(declare-fun m!1256685 () Bool)

(assert (=> b!1372950 m!1256685))

(declare-fun m!1256687 () Bool)

(assert (=> b!1372952 m!1256687))

(assert (=> b!1372952 m!1256687))

(declare-fun m!1256689 () Bool)

(assert (=> b!1372952 m!1256689))

(declare-fun m!1256691 () Bool)

(assert (=> b!1372946 m!1256691))

(declare-fun m!1256693 () Bool)

(assert (=> b!1372948 m!1256693))

(assert (=> b!1372958 m!1256687))

(declare-fun m!1256695 () Bool)

(assert (=> b!1372954 m!1256695))

(declare-fun m!1256697 () Bool)

(assert (=> b!1372945 m!1256697))

(declare-fun m!1256699 () Bool)

(assert (=> b!1372962 m!1256699))

(declare-fun m!1256701 () Bool)

(assert (=> b!1372951 m!1256701))

(declare-fun m!1256703 () Bool)

(assert (=> b!1372951 m!1256703))

(assert (=> b!1372961 m!1256687))

(assert (=> b!1372961 m!1256687))

(declare-fun m!1256705 () Bool)

(assert (=> b!1372961 m!1256705))

(declare-fun m!1256707 () Bool)

(assert (=> b!1372959 m!1256707))

(declare-fun m!1256709 () Bool)

(assert (=> b!1372947 m!1256709))

(declare-fun m!1256711 () Bool)

(assert (=> b!1372949 m!1256711))

(declare-fun m!1256713 () Bool)

(assert (=> b!1372960 m!1256713))

(declare-fun m!1256715 () Bool)

(assert (=> b!1372960 m!1256715))

(declare-fun m!1256717 () Bool)

(assert (=> b!1372956 m!1256717))

(declare-fun m!1256719 () Bool)

(assert (=> b!1372963 m!1256719))

(declare-fun m!1256721 () Bool)

(assert (=> b!1372957 m!1256721))

(check-sat (not b!1372962) (not b!1372949) (not b!1372950) (not b!1372957) (not b!1372948) (not b!1372945) (not b!1372963) (not b!1372952) (not b!1372960) (not start!116356) (not b!1372951) (not b!1372956) (not b!1372959) (not b!1372961) (not b!1372954) (not b!1372946) (not b!1372947))
(check-sat)
