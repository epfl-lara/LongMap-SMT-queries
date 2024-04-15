; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106744 () Bool)

(assert start!106744)

(declare-fun res!843507 () Bool)

(declare-fun e!721834 () Bool)

(assert (=> start!106744 (=> (not res!843507) (not e!721834))))

(declare-datatypes ((B!2070 0))(
  ( (B!2071 (val!16370 Int)) )
))
(declare-datatypes ((tuple2!21340 0))(
  ( (tuple2!21341 (_1!10681 (_ BitVec 64)) (_2!10681 B!2070)) )
))
(declare-datatypes ((List!28446 0))(
  ( (Nil!28443) (Cons!28442 (h!29651 tuple2!21340) (t!41964 List!28446)) )
))
(declare-fun l!874 () List!28446)

(declare-fun isStrictlySorted!815 (List!28446) Bool)

(assert (=> start!106744 (= res!843507 (isStrictlySorted!815 l!874))))

(assert (=> start!106744 e!721834))

(declare-fun e!721835 () Bool)

(assert (=> start!106744 e!721835))

(assert (=> start!106744 true))

(declare-fun b!1267144 () Bool)

(declare-fun res!843506 () Bool)

(assert (=> b!1267144 (=> (not res!843506) (not e!721834))))

(declare-fun key!235 () (_ BitVec 64))

(declare-fun containsKey!676 (List!28446 (_ BitVec 64)) Bool)

(assert (=> b!1267144 (= res!843506 (not (containsKey!676 l!874 key!235)))))

(declare-fun b!1267145 () Bool)

(declare-fun ListPrimitiveSize!159 (List!28446) Int)

(assert (=> b!1267145 (= e!721834 (< (ListPrimitiveSize!159 l!874) 0))))

(declare-fun b!1267146 () Bool)

(declare-fun tp_is_empty!32591 () Bool)

(declare-fun tp!96575 () Bool)

(assert (=> b!1267146 (= e!721835 (and tp_is_empty!32591 tp!96575))))

(assert (= (and start!106744 res!843507) b!1267144))

(assert (= (and b!1267144 res!843506) b!1267145))

(assert (= (and start!106744 (is-Cons!28442 l!874)) b!1267146))

(declare-fun m!1166147 () Bool)

(assert (=> start!106744 m!1166147))

(declare-fun m!1166149 () Bool)

(assert (=> b!1267144 m!1166149))

(declare-fun m!1166151 () Bool)

(assert (=> b!1267145 m!1166151))

(push 1)

(assert (not b!1267146))

(assert (not b!1267144))

(assert (not start!106744))

(assert (not b!1267145))

(assert tp_is_empty!32591)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!139289 () Bool)

(declare-fun res!843518 () Bool)

(declare-fun e!721846 () Bool)

(assert (=> d!139289 (=> res!843518 e!721846)))

(assert (=> d!139289 (= res!843518 (or (is-Nil!28443 l!874) (is-Nil!28443 (t!41964 l!874))))))

(assert (=> d!139289 (= (isStrictlySorted!815 l!874) e!721846)))

(declare-fun b!1267157 () Bool)

(declare-fun e!721847 () Bool)

(assert (=> b!1267157 (= e!721846 e!721847)))

(declare-fun res!843519 () Bool)

(assert (=> b!1267157 (=> (not res!843519) (not e!721847))))

(assert (=> b!1267157 (= res!843519 (bvslt (_1!10681 (h!29651 l!874)) (_1!10681 (h!29651 (t!41964 l!874)))))))

(declare-fun b!1267158 () Bool)

(assert (=> b!1267158 (= e!721847 (isStrictlySorted!815 (t!41964 l!874)))))

(assert (= (and d!139289 (not res!843518)) b!1267157))

(assert (= (and b!1267157 res!843519) b!1267158))

(declare-fun m!1166153 () Bool)

(assert (=> b!1267158 m!1166153))

(assert (=> start!106744 d!139289))

(declare-fun d!139295 () Bool)

(declare-fun lt!574146 () Int)

(assert (=> d!139295 (>= lt!574146 0)))

(declare-fun e!721858 () Int)

(assert (=> d!139295 (= lt!574146 e!721858)))

(declare-fun c!123540 () Bool)

(assert (=> d!139295 (= c!123540 (is-Nil!28443 l!874))))

(assert (=> d!139295 (= (ListPrimitiveSize!159 l!874) lt!574146)))

(declare-fun b!1267173 () Bool)

(assert (=> b!1267173 (= e!721858 0)))

(declare-fun b!1267174 () Bool)

(assert (=> b!1267174 (= e!721858 (+ 1 (ListPrimitiveSize!159 (t!41964 l!874))))))

(assert (= (and d!139295 c!123540) b!1267173))

(assert (= (and d!139295 (not c!123540)) b!1267174))

(declare-fun m!1166159 () Bool)

(assert (=> b!1267174 m!1166159))

(assert (=> b!1267145 d!139295))

(declare-fun d!139301 () Bool)

(declare-fun res!843540 () Bool)

(declare-fun e!721876 () Bool)

(assert (=> d!139301 (=> res!843540 e!721876)))

(assert (=> d!139301 (= res!843540 (and (is-Cons!28442 l!874) (= (_1!10681 (h!29651 l!874)) key!235)))))

(assert (=> d!139301 (= (containsKey!676 l!874 key!235) e!721876)))

(declare-fun b!1267195 () Bool)

(declare-fun e!721877 () Bool)

(assert (=> b!1267195 (= e!721876 e!721877)))

(declare-fun res!843541 () Bool)

(assert (=> b!1267195 (=> (not res!843541) (not e!721877))))

(assert (=> b!1267195 (= res!843541 (and (or (not (is-Cons!28442 l!874)) (bvsle (_1!10681 (h!29651 l!874)) key!235)) (is-Cons!28442 l!874) (bvslt (_1!10681 (h!29651 l!874)) key!235)))))

(declare-fun b!1267196 () Bool)

(assert (=> b!1267196 (= e!721877 (containsKey!676 (t!41964 l!874) key!235))))

(assert (= (and d!139301 (not res!843540)) b!1267195))

(assert (= (and b!1267195 res!843541) b!1267196))

(declare-fun m!1166165 () Bool)

(assert (=> b!1267196 m!1166165))

(assert (=> b!1267144 d!139301))

(declare-fun b!1267209 () Bool)

(declare-fun e!721885 () Bool)

(declare-fun tp!96580 () Bool)

(assert (=> b!1267209 (= e!721885 (and tp_is_empty!32591 tp!96580))))

(assert (=> b!1267146 (= tp!96575 e!721885)))

(assert (= (and b!1267146 (is-Cons!28442 (t!41964 l!874))) b!1267209))

(push 1)

(assert (not b!1267196))

(assert (not b!1267174))

(assert (not b!1267209))

(assert (not b!1267158))

(assert tp_is_empty!32591)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

