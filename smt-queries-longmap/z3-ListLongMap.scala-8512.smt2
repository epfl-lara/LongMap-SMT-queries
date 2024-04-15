; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103834 () Bool)

(assert start!103834)

(declare-fun res!828879 () Bool)

(declare-fun e!704732 () Bool)

(assert (=> start!103834 (=> (not res!828879) (not e!704732))))

(declare-datatypes ((array!79875 0))(
  ( (array!79876 (arr!38534 (Array (_ BitVec 32) (_ BitVec 64))) (size!39072 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!79875)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!103834 (= res!828879 (and (bvslt (size!39072 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39072 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39072 a!3892))))))

(assert (=> start!103834 e!704732))

(declare-fun array_inv!29517 (array!79875) Bool)

(assert (=> start!103834 (array_inv!29517 a!3892)))

(assert (=> start!103834 true))

(declare-fun b!1243060 () Bool)

(declare-datatypes ((List!27438 0))(
  ( (Nil!27435) (Cons!27434 (h!28643 (_ BitVec 64)) (t!40898 List!27438)) )
))
(declare-fun noDuplicate!1993 (List!27438) Bool)

(assert (=> b!1243060 (= e!704732 (not (noDuplicate!1993 Nil!27435)))))

(assert (= (and start!103834 res!828879) b!1243060))

(declare-fun m!1145251 () Bool)

(assert (=> start!103834 m!1145251))

(declare-fun m!1145253 () Bool)

(assert (=> b!1243060 m!1145253))

(check-sat (not b!1243060) (not start!103834))
(check-sat)
(get-model)

(declare-fun d!136919 () Bool)

(declare-fun res!828890 () Bool)

(declare-fun e!704750 () Bool)

(assert (=> d!136919 (=> res!828890 e!704750)))

(get-info :version)

(assert (=> d!136919 (= res!828890 ((_ is Nil!27435) Nil!27435))))

(assert (=> d!136919 (= (noDuplicate!1993 Nil!27435) e!704750)))

(declare-fun b!1243071 () Bool)

(declare-fun e!704751 () Bool)

(assert (=> b!1243071 (= e!704750 e!704751)))

(declare-fun res!828891 () Bool)

(assert (=> b!1243071 (=> (not res!828891) (not e!704751))))

(declare-fun contains!7370 (List!27438 (_ BitVec 64)) Bool)

(assert (=> b!1243071 (= res!828891 (not (contains!7370 (t!40898 Nil!27435) (h!28643 Nil!27435))))))

(declare-fun b!1243072 () Bool)

(assert (=> b!1243072 (= e!704751 (noDuplicate!1993 (t!40898 Nil!27435)))))

(assert (= (and d!136919 (not res!828890)) b!1243071))

(assert (= (and b!1243071 res!828891) b!1243072))

(declare-fun m!1145263 () Bool)

(assert (=> b!1243071 m!1145263))

(declare-fun m!1145265 () Bool)

(assert (=> b!1243072 m!1145265))

(assert (=> b!1243060 d!136919))

(declare-fun d!136921 () Bool)

(assert (=> d!136921 (= (array_inv!29517 a!3892) (bvsge (size!39072 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!103834 d!136921))

(check-sat (not b!1243071) (not b!1243072))
(check-sat)
