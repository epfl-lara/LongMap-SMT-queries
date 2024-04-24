; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108064 () Bool)

(assert start!108064)

(declare-fun res!847949 () Bool)

(declare-fun e!728431 () Bool)

(assert (=> start!108064 (=> (not res!847949) (not e!728431))))

(declare-datatypes ((B!2162 0))(
  ( (B!2163 (val!16677 Int)) )
))
(declare-datatypes ((tuple2!21444 0))(
  ( (tuple2!21445 (_1!10733 (_ BitVec 64)) (_2!10733 B!2162)) )
))
(declare-datatypes ((List!28631 0))(
  ( (Nil!28628) (Cons!28627 (h!29845 tuple2!21444) (t!42156 List!28631)) )
))
(declare-fun l!595 () List!28631)

(declare-fun isStrictlySorted!844 (List!28631) Bool)

(assert (=> start!108064 (= res!847949 (isStrictlySorted!844 l!595))))

(assert (=> start!108064 e!728431))

(declare-fun e!728432 () Bool)

(assert (=> start!108064 e!728432))

(assert (=> start!108064 true))

(declare-fun b!1276123 () Bool)

(declare-fun res!847948 () Bool)

(assert (=> b!1276123 (=> (not res!847948) (not e!728431))))

(declare-fun key!173 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1276123 (= res!847948 (and (not (= (_1!10733 (h!29845 l!595)) key!173)) ((_ is Cons!28627) l!595)))))

(declare-fun b!1276124 () Bool)

(declare-fun ListPrimitiveSize!166 (List!28631) Int)

(assert (=> b!1276124 (= e!728431 (>= (ListPrimitiveSize!166 (t!42156 l!595)) (ListPrimitiveSize!166 l!595)))))

(declare-fun b!1276125 () Bool)

(declare-fun tp_is_empty!33205 () Bool)

(declare-fun tp!98039 () Bool)

(assert (=> b!1276125 (= e!728432 (and tp_is_empty!33205 tp!98039))))

(assert (= (and start!108064 res!847949) b!1276123))

(assert (= (and b!1276123 res!847948) b!1276124))

(assert (= (and start!108064 ((_ is Cons!28627) l!595)) b!1276125))

(declare-fun m!1172975 () Bool)

(assert (=> start!108064 m!1172975))

(declare-fun m!1172977 () Bool)

(assert (=> b!1276124 m!1172977))

(declare-fun m!1172979 () Bool)

(assert (=> b!1276124 m!1172979))

(check-sat (not start!108064) (not b!1276124) (not b!1276125) tp_is_empty!33205)
(check-sat)
(get-model)

(declare-fun d!140673 () Bool)

(declare-fun res!847970 () Bool)

(declare-fun e!728453 () Bool)

(assert (=> d!140673 (=> res!847970 e!728453)))

(assert (=> d!140673 (= res!847970 (or ((_ is Nil!28628) l!595) ((_ is Nil!28628) (t!42156 l!595))))))

(assert (=> d!140673 (= (isStrictlySorted!844 l!595) e!728453)))

(declare-fun b!1276152 () Bool)

(declare-fun e!728454 () Bool)

(assert (=> b!1276152 (= e!728453 e!728454)))

(declare-fun res!847971 () Bool)

(assert (=> b!1276152 (=> (not res!847971) (not e!728454))))

(assert (=> b!1276152 (= res!847971 (bvslt (_1!10733 (h!29845 l!595)) (_1!10733 (h!29845 (t!42156 l!595)))))))

(declare-fun b!1276153 () Bool)

(assert (=> b!1276153 (= e!728454 (isStrictlySorted!844 (t!42156 l!595)))))

(assert (= (and d!140673 (not res!847970)) b!1276152))

(assert (= (and b!1276152 res!847971) b!1276153))

(declare-fun m!1172993 () Bool)

(assert (=> b!1276153 m!1172993))

(assert (=> start!108064 d!140673))

(declare-fun d!140679 () Bool)

(declare-fun lt!575778 () Int)

(assert (=> d!140679 (>= lt!575778 0)))

(declare-fun e!728467 () Int)

(assert (=> d!140679 (= lt!575778 e!728467)))

(declare-fun c!124284 () Bool)

(assert (=> d!140679 (= c!124284 ((_ is Nil!28628) (t!42156 l!595)))))

(assert (=> d!140679 (= (ListPrimitiveSize!166 (t!42156 l!595)) lt!575778)))

(declare-fun b!1276170 () Bool)

(assert (=> b!1276170 (= e!728467 0)))

(declare-fun b!1276171 () Bool)

(assert (=> b!1276171 (= e!728467 (+ 1 (ListPrimitiveSize!166 (t!42156 (t!42156 l!595)))))))

(assert (= (and d!140679 c!124284) b!1276170))

(assert (= (and d!140679 (not c!124284)) b!1276171))

(declare-fun m!1172999 () Bool)

(assert (=> b!1276171 m!1172999))

(assert (=> b!1276124 d!140679))

(declare-fun d!140685 () Bool)

(declare-fun lt!575780 () Int)

(assert (=> d!140685 (>= lt!575780 0)))

(declare-fun e!728469 () Int)

(assert (=> d!140685 (= lt!575780 e!728469)))

(declare-fun c!124286 () Bool)

(assert (=> d!140685 (= c!124286 ((_ is Nil!28628) l!595))))

(assert (=> d!140685 (= (ListPrimitiveSize!166 l!595) lt!575780)))

(declare-fun b!1276174 () Bool)

(assert (=> b!1276174 (= e!728469 0)))

(declare-fun b!1276175 () Bool)

(assert (=> b!1276175 (= e!728469 (+ 1 (ListPrimitiveSize!166 (t!42156 l!595))))))

(assert (= (and d!140685 c!124286) b!1276174))

(assert (= (and d!140685 (not c!124286)) b!1276175))

(assert (=> b!1276175 m!1172977))

(assert (=> b!1276124 d!140685))

(declare-fun b!1276190 () Bool)

(declare-fun e!728477 () Bool)

(declare-fun tp!98050 () Bool)

(assert (=> b!1276190 (= e!728477 (and tp_is_empty!33205 tp!98050))))

(assert (=> b!1276125 (= tp!98039 e!728477)))

(assert (= (and b!1276125 ((_ is Cons!28627) (t!42156 l!595))) b!1276190))

(check-sat (not b!1276171) (not b!1276175) (not b!1276153) (not b!1276190) tp_is_empty!33205)
(check-sat)
