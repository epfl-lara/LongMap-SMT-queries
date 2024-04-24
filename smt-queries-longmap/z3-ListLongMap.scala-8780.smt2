; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106992 () Bool)

(assert start!106992)

(declare-fun b!1268614 () Bool)

(declare-fun e!722786 () Bool)

(declare-fun tp_is_empty!32593 () Bool)

(declare-fun tp!96587 () Bool)

(assert (=> b!1268614 (= e!722786 (and tp_is_empty!32593 tp!96587))))

(declare-fun b!1268613 () Bool)

(declare-fun e!722787 () Bool)

(declare-datatypes ((B!2072 0))(
  ( (B!2073 (val!16371 Int)) )
))
(declare-datatypes ((tuple2!21270 0))(
  ( (tuple2!21271 (_1!10646 (_ BitVec 64)) (_2!10646 B!2072)) )
))
(declare-datatypes ((List!28399 0))(
  ( (Nil!28396) (Cons!28395 (h!29613 tuple2!21270) (t!41918 List!28399)) )
))
(declare-fun l!874 () List!28399)

(declare-fun isStrictlySorted!808 (List!28399) Bool)

(assert (=> b!1268613 (= e!722787 (not (isStrictlySorted!808 (t!41918 l!874))))))

(declare-fun res!844111 () Bool)

(assert (=> start!106992 (=> (not res!844111) (not e!722787))))

(assert (=> start!106992 (= res!844111 (isStrictlySorted!808 l!874))))

(assert (=> start!106992 e!722787))

(assert (=> start!106992 e!722786))

(assert (=> start!106992 true))

(declare-fun b!1268611 () Bool)

(declare-fun res!844112 () Bool)

(assert (=> b!1268611 (=> (not res!844112) (not e!722787))))

(declare-fun key!235 () (_ BitVec 64))

(declare-fun containsKey!679 (List!28399 (_ BitVec 64)) Bool)

(assert (=> b!1268611 (= res!844112 (not (containsKey!679 l!874 key!235)))))

(declare-fun b!1268612 () Bool)

(declare-fun res!844110 () Bool)

(assert (=> b!1268612 (=> (not res!844110) (not e!722787))))

(get-info :version)

(assert (=> b!1268612 (= res!844110 ((_ is Cons!28395) l!874))))

(assert (= (and start!106992 res!844111) b!1268611))

(assert (= (and b!1268611 res!844112) b!1268612))

(assert (= (and b!1268612 res!844110) b!1268613))

(assert (= (and start!106992 ((_ is Cons!28395) l!874)) b!1268614))

(declare-fun m!1168303 () Bool)

(assert (=> b!1268613 m!1168303))

(declare-fun m!1168305 () Bool)

(assert (=> start!106992 m!1168305))

(declare-fun m!1168307 () Bool)

(assert (=> b!1268611 m!1168307))

(check-sat (not b!1268613) tp_is_empty!32593 (not start!106992) (not b!1268611) (not b!1268614))
(check-sat)
(get-model)

(declare-fun d!139891 () Bool)

(declare-fun res!844144 () Bool)

(declare-fun e!722813 () Bool)

(assert (=> d!139891 (=> res!844144 e!722813)))

(assert (=> d!139891 (= res!844144 (and ((_ is Cons!28395) l!874) (= (_1!10646 (h!29613 l!874)) key!235)))))

(assert (=> d!139891 (= (containsKey!679 l!874 key!235) e!722813)))

(declare-fun b!1268652 () Bool)

(declare-fun e!722815 () Bool)

(assert (=> b!1268652 (= e!722813 e!722815)))

(declare-fun res!844146 () Bool)

(assert (=> b!1268652 (=> (not res!844146) (not e!722815))))

(assert (=> b!1268652 (= res!844146 (and (or (not ((_ is Cons!28395) l!874)) (bvsle (_1!10646 (h!29613 l!874)) key!235)) ((_ is Cons!28395) l!874) (bvslt (_1!10646 (h!29613 l!874)) key!235)))))

(declare-fun b!1268654 () Bool)

(assert (=> b!1268654 (= e!722815 (containsKey!679 (t!41918 l!874) key!235))))

(assert (= (and d!139891 (not res!844144)) b!1268652))

(assert (= (and b!1268652 res!844146) b!1268654))

(declare-fun m!1168323 () Bool)

(assert (=> b!1268654 m!1168323))

(assert (=> b!1268611 d!139891))

(declare-fun d!139897 () Bool)

(declare-fun res!844161 () Bool)

(declare-fun e!722830 () Bool)

(assert (=> d!139897 (=> res!844161 e!722830)))

(assert (=> d!139897 (= res!844161 (or ((_ is Nil!28396) l!874) ((_ is Nil!28396) (t!41918 l!874))))))

(assert (=> d!139897 (= (isStrictlySorted!808 l!874) e!722830)))

(declare-fun b!1268669 () Bool)

(declare-fun e!722831 () Bool)

(assert (=> b!1268669 (= e!722830 e!722831)))

(declare-fun res!844162 () Bool)

(assert (=> b!1268669 (=> (not res!844162) (not e!722831))))

(assert (=> b!1268669 (= res!844162 (bvslt (_1!10646 (h!29613 l!874)) (_1!10646 (h!29613 (t!41918 l!874)))))))

(declare-fun b!1268670 () Bool)

(assert (=> b!1268670 (= e!722831 (isStrictlySorted!808 (t!41918 l!874)))))

(assert (= (and d!139897 (not res!844161)) b!1268669))

(assert (= (and b!1268669 res!844162) b!1268670))

(assert (=> b!1268670 m!1168303))

(assert (=> start!106992 d!139897))

(declare-fun d!139901 () Bool)

(declare-fun res!844167 () Bool)

(declare-fun e!722836 () Bool)

(assert (=> d!139901 (=> res!844167 e!722836)))

(assert (=> d!139901 (= res!844167 (or ((_ is Nil!28396) (t!41918 l!874)) ((_ is Nil!28396) (t!41918 (t!41918 l!874)))))))

(assert (=> d!139901 (= (isStrictlySorted!808 (t!41918 l!874)) e!722836)))

(declare-fun b!1268675 () Bool)

(declare-fun e!722837 () Bool)

(assert (=> b!1268675 (= e!722836 e!722837)))

(declare-fun res!844168 () Bool)

(assert (=> b!1268675 (=> (not res!844168) (not e!722837))))

(assert (=> b!1268675 (= res!844168 (bvslt (_1!10646 (h!29613 (t!41918 l!874))) (_1!10646 (h!29613 (t!41918 (t!41918 l!874))))))))

(declare-fun b!1268676 () Bool)

(assert (=> b!1268676 (= e!722837 (isStrictlySorted!808 (t!41918 (t!41918 l!874))))))

(assert (= (and d!139901 (not res!844167)) b!1268675))

(assert (= (and b!1268675 res!844168) b!1268676))

(declare-fun m!1168329 () Bool)

(assert (=> b!1268676 m!1168329))

(assert (=> b!1268613 d!139901))

(declare-fun b!1268694 () Bool)

(declare-fun e!722849 () Bool)

(declare-fun tp!96601 () Bool)

(assert (=> b!1268694 (= e!722849 (and tp_is_empty!32593 tp!96601))))

(assert (=> b!1268614 (= tp!96587 e!722849)))

(assert (= (and b!1268614 ((_ is Cons!28395) (t!41918 l!874))) b!1268694))

(check-sat (not b!1268694) (not b!1268670) (not b!1268654) (not b!1268676) tp_is_empty!32593)
(check-sat)
