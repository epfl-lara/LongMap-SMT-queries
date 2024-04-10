; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137892 () Bool)

(assert start!137892)

(declare-fun res!1081664 () Bool)

(declare-fun e!883842 () Bool)

(assert (=> start!137892 (=> (not res!1081664) (not e!883842))))

(declare-datatypes ((B!2854 0))(
  ( (B!2855 (val!19789 Int)) )
))
(declare-datatypes ((tuple2!25746 0))(
  ( (tuple2!25747 (_1!12884 (_ BitVec 64)) (_2!12884 B!2854)) )
))
(declare-datatypes ((List!36909 0))(
  ( (Nil!36906) (Cons!36905 (h!38448 tuple2!25746) (t!51823 List!36909)) )
))
(declare-fun l!548 () List!36909)

(declare-fun isStrictlySorted!1143 (List!36909) Bool)

(assert (=> start!137892 (= res!1081664 (isStrictlySorted!1143 l!548))))

(assert (=> start!137892 e!883842))

(declare-fun e!883843 () Bool)

(assert (=> start!137892 e!883843))

(declare-fun b!1583427 () Bool)

(declare-fun ListPrimitiveSize!212 (List!36909) Int)

(assert (=> b!1583427 (= e!883842 (< (ListPrimitiveSize!212 l!548) 0))))

(declare-fun b!1583428 () Bool)

(declare-fun tp_is_empty!39387 () Bool)

(declare-fun tp!114952 () Bool)

(assert (=> b!1583428 (= e!883843 (and tp_is_empty!39387 tp!114952))))

(assert (= (and start!137892 res!1081664) b!1583427))

(get-info :version)

(assert (= (and start!137892 ((_ is Cons!36905) l!548)) b!1583428))

(declare-fun m!1453305 () Bool)

(assert (=> start!137892 m!1453305))

(declare-fun m!1453307 () Bool)

(assert (=> b!1583427 m!1453307))

(check-sat (not start!137892) (not b!1583427) (not b!1583428) tp_is_empty!39387)
(check-sat)
(get-model)

(declare-fun d!167229 () Bool)

(declare-fun res!1081672 () Bool)

(declare-fun e!883858 () Bool)

(assert (=> d!167229 (=> res!1081672 e!883858)))

(assert (=> d!167229 (= res!1081672 (or ((_ is Nil!36906) l!548) ((_ is Nil!36906) (t!51823 l!548))))))

(assert (=> d!167229 (= (isStrictlySorted!1143 l!548) e!883858)))

(declare-fun b!1583447 () Bool)

(declare-fun e!883859 () Bool)

(assert (=> b!1583447 (= e!883858 e!883859)))

(declare-fun res!1081673 () Bool)

(assert (=> b!1583447 (=> (not res!1081673) (not e!883859))))

(assert (=> b!1583447 (= res!1081673 (bvslt (_1!12884 (h!38448 l!548)) (_1!12884 (h!38448 (t!51823 l!548)))))))

(declare-fun b!1583448 () Bool)

(assert (=> b!1583448 (= e!883859 (isStrictlySorted!1143 (t!51823 l!548)))))

(assert (= (and d!167229 (not res!1081672)) b!1583447))

(assert (= (and b!1583447 res!1081673) b!1583448))

(declare-fun m!1453313 () Bool)

(assert (=> b!1583448 m!1453313))

(assert (=> start!137892 d!167229))

(declare-fun d!167235 () Bool)

(declare-fun lt!677175 () Int)

(assert (=> d!167235 (>= lt!677175 0)))

(declare-fun e!883872 () Int)

(assert (=> d!167235 (= lt!677175 e!883872)))

(declare-fun c!146738 () Bool)

(assert (=> d!167235 (= c!146738 ((_ is Nil!36906) l!548))))

(assert (=> d!167235 (= (ListPrimitiveSize!212 l!548) lt!677175)))

(declare-fun b!1583465 () Bool)

(assert (=> b!1583465 (= e!883872 0)))

(declare-fun b!1583466 () Bool)

(assert (=> b!1583466 (= e!883872 (+ 1 (ListPrimitiveSize!212 (t!51823 l!548))))))

(assert (= (and d!167235 c!146738) b!1583465))

(assert (= (and d!167235 (not c!146738)) b!1583466))

(declare-fun m!1453319 () Bool)

(assert (=> b!1583466 m!1453319))

(assert (=> b!1583427 d!167235))

(declare-fun b!1583475 () Bool)

(declare-fun e!883879 () Bool)

(declare-fun tp!114958 () Bool)

(assert (=> b!1583475 (= e!883879 (and tp_is_empty!39387 tp!114958))))

(assert (=> b!1583428 (= tp!114952 e!883879)))

(assert (= (and b!1583428 ((_ is Cons!36905) (t!51823 l!548))) b!1583475))

(check-sat (not b!1583466) (not b!1583448) (not b!1583475) tp_is_empty!39387)
(check-sat)
