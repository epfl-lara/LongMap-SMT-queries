; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137552 () Bool)

(assert start!137552)

(declare-fun res!1080818 () Bool)

(declare-fun e!882829 () Bool)

(assert (=> start!137552 (=> (not res!1080818) (not e!882829))))

(declare-datatypes ((B!2734 0))(
  ( (B!2735 (val!19729 Int)) )
))
(declare-datatypes ((tuple2!25626 0))(
  ( (tuple2!25627 (_1!12824 (_ BitVec 64)) (_2!12824 B!2734)) )
))
(declare-datatypes ((List!36849 0))(
  ( (Nil!36846) (Cons!36845 (h!38388 tuple2!25626) (t!51763 List!36849)) )
))
(declare-fun l!1356 () List!36849)

(declare-fun isStrictlySorted!1104 (List!36849) Bool)

(assert (=> start!137552 (= res!1080818 (isStrictlySorted!1104 l!1356))))

(assert (=> start!137552 e!882829))

(declare-fun e!882830 () Bool)

(assert (=> start!137552 e!882830))

(assert (=> start!137552 true))

(declare-fun b!1582025 () Bool)

(declare-fun res!1080819 () Bool)

(assert (=> b!1582025 (=> (not res!1080819) (not e!882829))))

(declare-fun key!387 () (_ BitVec 64))

(declare-fun containsKey!950 (List!36849 (_ BitVec 64)) Bool)

(assert (=> b!1582025 (= res!1080819 (not (containsKey!950 l!1356 key!387)))))

(declare-fun b!1582026 () Bool)

(declare-fun ListPrimitiveSize!200 (List!36849) Int)

(assert (=> b!1582026 (= e!882829 (< (ListPrimitiveSize!200 l!1356) 0))))

(declare-fun b!1582027 () Bool)

(declare-fun tp_is_empty!39279 () Bool)

(declare-fun tp!114662 () Bool)

(assert (=> b!1582027 (= e!882830 (and tp_is_empty!39279 tp!114662))))

(assert (= (and start!137552 res!1080818) b!1582025))

(assert (= (and b!1582025 res!1080819) b!1582026))

(get-info :version)

(assert (= (and start!137552 ((_ is Cons!36845) l!1356)) b!1582027))

(declare-fun m!1452701 () Bool)

(assert (=> start!137552 m!1452701))

(declare-fun m!1452703 () Bool)

(assert (=> b!1582025 m!1452703))

(declare-fun m!1452705 () Bool)

(assert (=> b!1582026 m!1452705))

(check-sat tp_is_empty!39279 (not start!137552) (not b!1582027) (not b!1582025) (not b!1582026))
(check-sat)
(get-model)

(declare-fun d!166891 () Bool)

(declare-fun res!1080836 () Bool)

(declare-fun e!882850 () Bool)

(assert (=> d!166891 (=> res!1080836 e!882850)))

(assert (=> d!166891 (= res!1080836 (and ((_ is Cons!36845) l!1356) (= (_1!12824 (h!38388 l!1356)) key!387)))))

(assert (=> d!166891 (= (containsKey!950 l!1356 key!387) e!882850)))

(declare-fun b!1582053 () Bool)

(declare-fun e!882851 () Bool)

(assert (=> b!1582053 (= e!882850 e!882851)))

(declare-fun res!1080837 () Bool)

(assert (=> b!1582053 (=> (not res!1080837) (not e!882851))))

(assert (=> b!1582053 (= res!1080837 (and (or (not ((_ is Cons!36845) l!1356)) (bvsle (_1!12824 (h!38388 l!1356)) key!387)) ((_ is Cons!36845) l!1356) (bvslt (_1!12824 (h!38388 l!1356)) key!387)))))

(declare-fun b!1582054 () Bool)

(assert (=> b!1582054 (= e!882851 (containsKey!950 (t!51763 l!1356) key!387))))

(assert (= (and d!166891 (not res!1080836)) b!1582053))

(assert (= (and b!1582053 res!1080837) b!1582054))

(declare-fun m!1452717 () Bool)

(assert (=> b!1582054 m!1452717))

(assert (=> b!1582025 d!166891))

(declare-fun d!166901 () Bool)

(declare-fun res!1080848 () Bool)

(declare-fun e!882865 () Bool)

(assert (=> d!166901 (=> res!1080848 e!882865)))

(assert (=> d!166901 (= res!1080848 (or ((_ is Nil!36846) l!1356) ((_ is Nil!36846) (t!51763 l!1356))))))

(assert (=> d!166901 (= (isStrictlySorted!1104 l!1356) e!882865)))

(declare-fun b!1582071 () Bool)

(declare-fun e!882866 () Bool)

(assert (=> b!1582071 (= e!882865 e!882866)))

(declare-fun res!1080849 () Bool)

(assert (=> b!1582071 (=> (not res!1080849) (not e!882866))))

(assert (=> b!1582071 (= res!1080849 (bvslt (_1!12824 (h!38388 l!1356)) (_1!12824 (h!38388 (t!51763 l!1356)))))))

(declare-fun b!1582072 () Bool)

(assert (=> b!1582072 (= e!882866 (isStrictlySorted!1104 (t!51763 l!1356)))))

(assert (= (and d!166901 (not res!1080848)) b!1582071))

(assert (= (and b!1582071 res!1080849) b!1582072))

(declare-fun m!1452723 () Bool)

(assert (=> b!1582072 m!1452723))

(assert (=> start!137552 d!166901))

(declare-fun d!166907 () Bool)

(declare-fun lt!677043 () Int)

(assert (=> d!166907 (>= lt!677043 0)))

(declare-fun e!882879 () Int)

(assert (=> d!166907 (= lt!677043 e!882879)))

(declare-fun c!146641 () Bool)

(assert (=> d!166907 (= c!146641 ((_ is Nil!36846) l!1356))))

(assert (=> d!166907 (= (ListPrimitiveSize!200 l!1356) lt!677043)))

(declare-fun b!1582087 () Bool)

(assert (=> b!1582087 (= e!882879 0)))

(declare-fun b!1582088 () Bool)

(assert (=> b!1582088 (= e!882879 (+ 1 (ListPrimitiveSize!200 (t!51763 l!1356))))))

(assert (= (and d!166907 c!146641) b!1582087))

(assert (= (and d!166907 (not c!146641)) b!1582088))

(declare-fun m!1452727 () Bool)

(assert (=> b!1582088 m!1452727))

(assert (=> b!1582026 d!166907))

(declare-fun b!1582104 () Bool)

(declare-fun e!882889 () Bool)

(declare-fun tp!114673 () Bool)

(assert (=> b!1582104 (= e!882889 (and tp_is_empty!39279 tp!114673))))

(assert (=> b!1582027 (= tp!114662 e!882889)))

(assert (= (and b!1582027 ((_ is Cons!36845) (t!51763 l!1356))) b!1582104))

(check-sat tp_is_empty!39279 (not b!1582072) (not b!1582088) (not b!1582054) (not b!1582104))
(check-sat)
