; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137146 () Bool)

(assert start!137146)

(declare-fun b!1580400 () Bool)

(declare-fun e!881657 () Bool)

(declare-fun tp_is_empty!39207 () Bool)

(declare-fun tp!114471 () Bool)

(assert (=> b!1580400 (= e!881657 (and tp_is_empty!39207 tp!114471))))

(declare-fun b!1580397 () Bool)

(declare-fun res!1079654 () Bool)

(declare-fun e!881656 () Bool)

(assert (=> b!1580397 (=> (not res!1079654) (not e!881656))))

(declare-datatypes ((B!2662 0))(
  ( (B!2663 (val!19693 Int)) )
))
(declare-datatypes ((tuple2!25512 0))(
  ( (tuple2!25513 (_1!12767 (_ BitVec 64)) (_2!12767 B!2662)) )
))
(declare-datatypes ((List!36813 0))(
  ( (Nil!36810) (Cons!36809 (h!38352 tuple2!25512) (t!51727 List!36813)) )
))
(declare-fun l!1390 () List!36813)

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!917 (List!36813 (_ BitVec 64)) Bool)

(assert (=> b!1580397 (= res!1079654 (containsKey!917 l!1390 key!405))))

(declare-fun b!1580398 () Bool)

(declare-fun res!1079653 () Bool)

(assert (=> b!1580398 (=> (not res!1079653) (not e!881656))))

(declare-fun value!194 () B!2662)

(declare-fun contains!10485 (List!36813 tuple2!25512) Bool)

(assert (=> b!1580398 (= res!1079653 (contains!10485 l!1390 (tuple2!25513 key!405 value!194)))))

(declare-fun res!1079655 () Bool)

(assert (=> start!137146 (=> (not res!1079655) (not e!881656))))

(declare-fun isStrictlySorted!1071 (List!36813) Bool)

(assert (=> start!137146 (= res!1079655 (isStrictlySorted!1071 l!1390))))

(assert (=> start!137146 e!881656))

(assert (=> start!137146 e!881657))

(assert (=> start!137146 true))

(assert (=> start!137146 tp_is_empty!39207))

(declare-fun b!1580399 () Bool)

(declare-fun ListPrimitiveSize!194 (List!36813) Int)

(assert (=> b!1580399 (= e!881656 (< (ListPrimitiveSize!194 l!1390) 0))))

(assert (= (and start!137146 res!1079655) b!1580397))

(assert (= (and b!1580397 res!1079654) b!1580398))

(assert (= (and b!1580398 res!1079653) b!1580399))

(get-info :version)

(assert (= (and start!137146 ((_ is Cons!36809) l!1390)) b!1580400))

(declare-fun m!1451841 () Bool)

(assert (=> b!1580397 m!1451841))

(declare-fun m!1451843 () Bool)

(assert (=> b!1580398 m!1451843))

(declare-fun m!1451845 () Bool)

(assert (=> start!137146 m!1451845))

(declare-fun m!1451847 () Bool)

(assert (=> b!1580399 m!1451847))

(check-sat (not start!137146) (not b!1580399) (not b!1580400) (not b!1580398) tp_is_empty!39207 (not b!1580397))
(check-sat)
(get-model)

(declare-fun d!166409 () Bool)

(declare-fun res!1079679 () Bool)

(declare-fun e!881678 () Bool)

(assert (=> d!166409 (=> res!1079679 e!881678)))

(assert (=> d!166409 (= res!1079679 (and ((_ is Cons!36809) l!1390) (= (_1!12767 (h!38352 l!1390)) key!405)))))

(assert (=> d!166409 (= (containsKey!917 l!1390 key!405) e!881678)))

(declare-fun b!1580427 () Bool)

(declare-fun e!881679 () Bool)

(assert (=> b!1580427 (= e!881678 e!881679)))

(declare-fun res!1079680 () Bool)

(assert (=> b!1580427 (=> (not res!1079680) (not e!881679))))

(assert (=> b!1580427 (= res!1079680 (and (or (not ((_ is Cons!36809) l!1390)) (bvsle (_1!12767 (h!38352 l!1390)) key!405)) ((_ is Cons!36809) l!1390) (bvslt (_1!12767 (h!38352 l!1390)) key!405)))))

(declare-fun b!1580428 () Bool)

(assert (=> b!1580428 (= e!881679 (containsKey!917 (t!51727 l!1390) key!405))))

(assert (= (and d!166409 (not res!1079679)) b!1580427))

(assert (= (and b!1580427 res!1079680) b!1580428))

(declare-fun m!1451859 () Bool)

(assert (=> b!1580428 m!1451859))

(assert (=> b!1580397 d!166409))

(declare-fun d!166417 () Bool)

(declare-fun res!1079687 () Bool)

(declare-fun e!881689 () Bool)

(assert (=> d!166417 (=> res!1079687 e!881689)))

(assert (=> d!166417 (= res!1079687 (or ((_ is Nil!36810) l!1390) ((_ is Nil!36810) (t!51727 l!1390))))))

(assert (=> d!166417 (= (isStrictlySorted!1071 l!1390) e!881689)))

(declare-fun b!1580441 () Bool)

(declare-fun e!881690 () Bool)

(assert (=> b!1580441 (= e!881689 e!881690)))

(declare-fun res!1079688 () Bool)

(assert (=> b!1580441 (=> (not res!1079688) (not e!881690))))

(assert (=> b!1580441 (= res!1079688 (bvslt (_1!12767 (h!38352 l!1390)) (_1!12767 (h!38352 (t!51727 l!1390)))))))

(declare-fun b!1580442 () Bool)

(assert (=> b!1580442 (= e!881690 (isStrictlySorted!1071 (t!51727 l!1390)))))

(assert (= (and d!166417 (not res!1079687)) b!1580441))

(assert (= (and b!1580441 res!1079688) b!1580442))

(declare-fun m!1451869 () Bool)

(assert (=> b!1580442 m!1451869))

(assert (=> start!137146 d!166417))

(declare-fun d!166423 () Bool)

(declare-fun lt!676776 () Int)

(assert (=> d!166423 (>= lt!676776 0)))

(declare-fun e!881703 () Int)

(assert (=> d!166423 (= lt!676776 e!881703)))

(declare-fun c!146529 () Bool)

(assert (=> d!166423 (= c!146529 ((_ is Nil!36810) l!1390))))

(assert (=> d!166423 (= (ListPrimitiveSize!194 l!1390) lt!676776)))

(declare-fun b!1580457 () Bool)

(assert (=> b!1580457 (= e!881703 0)))

(declare-fun b!1580458 () Bool)

(assert (=> b!1580458 (= e!881703 (+ 1 (ListPrimitiveSize!194 (t!51727 l!1390))))))

(assert (= (and d!166423 c!146529) b!1580457))

(assert (= (and d!166423 (not c!146529)) b!1580458))

(declare-fun m!1451873 () Bool)

(assert (=> b!1580458 m!1451873))

(assert (=> b!1580399 d!166423))

(declare-fun d!166427 () Bool)

(declare-fun lt!676782 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!833 (List!36813) (InoxSet tuple2!25512))

(assert (=> d!166427 (= lt!676782 (select (content!833 l!1390) (tuple2!25513 key!405 value!194)))))

(declare-fun e!881722 () Bool)

(assert (=> d!166427 (= lt!676782 e!881722)))

(declare-fun res!1079716 () Bool)

(assert (=> d!166427 (=> (not res!1079716) (not e!881722))))

(assert (=> d!166427 (= res!1079716 ((_ is Cons!36809) l!1390))))

(assert (=> d!166427 (= (contains!10485 l!1390 (tuple2!25513 key!405 value!194)) lt!676782)))

(declare-fun b!1580479 () Bool)

(declare-fun e!881723 () Bool)

(assert (=> b!1580479 (= e!881722 e!881723)))

(declare-fun res!1079715 () Bool)

(assert (=> b!1580479 (=> res!1079715 e!881723)))

(assert (=> b!1580479 (= res!1079715 (= (h!38352 l!1390) (tuple2!25513 key!405 value!194)))))

(declare-fun b!1580480 () Bool)

(assert (=> b!1580480 (= e!881723 (contains!10485 (t!51727 l!1390) (tuple2!25513 key!405 value!194)))))

(assert (= (and d!166427 res!1079716) b!1580479))

(assert (= (and b!1580479 (not res!1079715)) b!1580480))

(declare-fun m!1451883 () Bool)

(assert (=> d!166427 m!1451883))

(declare-fun m!1451885 () Bool)

(assert (=> d!166427 m!1451885))

(declare-fun m!1451887 () Bool)

(assert (=> b!1580480 m!1451887))

(assert (=> b!1580398 d!166427))

(declare-fun b!1580493 () Bool)

(declare-fun e!881731 () Bool)

(declare-fun tp!114479 () Bool)

(assert (=> b!1580493 (= e!881731 (and tp_is_empty!39207 tp!114479))))

(assert (=> b!1580400 (= tp!114471 e!881731)))

(assert (= (and b!1580400 ((_ is Cons!36809) (t!51727 l!1390))) b!1580493))

(check-sat (not b!1580442) (not b!1580428) (not b!1580480) tp_is_empty!39207 (not d!166427) (not b!1580458) (not b!1580493))
(check-sat)
