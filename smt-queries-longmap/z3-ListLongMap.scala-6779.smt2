; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85262 () Bool)

(assert start!85262)

(declare-fun res!663532 () Bool)

(declare-fun e!560092 () Bool)

(assert (=> start!85262 (=> (not res!663532) (not e!560092))))

(declare-datatypes ((List!20943 0))(
  ( (Nil!20940) (Cons!20939 (h!22101 (_ BitVec 64)) (t!29935 List!20943)) )
))
(declare-fun l!3519 () List!20943)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5742 (List!20943 (_ BitVec 64)) Bool)

(assert (=> start!85262 (= res!663532 (not (contains!5742 l!3519 e!29)))))

(assert (=> start!85262 e!560092))

(assert (=> start!85262 true))

(declare-fun b!992694 () Bool)

(declare-fun e!560093 () Bool)

(assert (=> b!992694 (= e!560092 e!560093)))

(declare-fun res!663530 () Bool)

(assert (=> b!992694 (=> (not res!663530) (not e!560093))))

(declare-datatypes ((tuple2!15074 0))(
  ( (tuple2!15075 (_1!7548 (_ BitVec 64)) (_2!7548 List!20943)) )
))
(declare-datatypes ((Option!555 0))(
  ( (Some!554 (v!14375 tuple2!15074)) (None!553) )
))
(declare-fun lt!440123 () Option!555)

(declare-fun isEmpty!764 (Option!555) Bool)

(assert (=> b!992694 (= res!663530 (not (isEmpty!764 lt!440123)))))

(declare-fun unapply!31 (List!20943) Option!555)

(assert (=> b!992694 (= lt!440123 (unapply!31 l!3519))))

(declare-fun b!992695 () Bool)

(declare-fun e!560091 () Bool)

(assert (=> b!992695 (= e!560093 e!560091)))

(declare-fun res!663531 () Bool)

(assert (=> b!992695 (=> (not res!663531) (not e!560091))))

(declare-fun lt!440122 () tuple2!15074)

(assert (=> b!992695 (= res!663531 (not (contains!5742 (_2!7548 lt!440122) e!29)))))

(declare-fun get!15713 (Option!555) tuple2!15074)

(assert (=> b!992695 (= lt!440122 (get!15713 lt!440123))))

(declare-fun b!992696 () Bool)

(declare-fun ListPrimitiveSize!94 (List!20943) Int)

(assert (=> b!992696 (= e!560091 (>= (ListPrimitiveSize!94 (_2!7548 lt!440122)) (ListPrimitiveSize!94 l!3519)))))

(assert (= (and start!85262 res!663532) b!992694))

(assert (= (and b!992694 res!663530) b!992695))

(assert (= (and b!992695 res!663531) b!992696))

(declare-fun m!919895 () Bool)

(assert (=> start!85262 m!919895))

(declare-fun m!919897 () Bool)

(assert (=> b!992694 m!919897))

(declare-fun m!919899 () Bool)

(assert (=> b!992694 m!919899))

(declare-fun m!919901 () Bool)

(assert (=> b!992695 m!919901))

(declare-fun m!919903 () Bool)

(assert (=> b!992695 m!919903))

(declare-fun m!919905 () Bool)

(assert (=> b!992696 m!919905))

(declare-fun m!919907 () Bool)

(assert (=> b!992696 m!919907))

(check-sat (not b!992694) (not b!992695) (not start!85262) (not b!992696))
(check-sat)
(get-model)

(declare-fun d!118163 () Bool)

(get-info :version)

(assert (=> d!118163 (= (isEmpty!764 lt!440123) (not ((_ is Some!554) lt!440123)))))

(assert (=> b!992694 d!118163))

(declare-fun d!118167 () Bool)

(assert (=> d!118167 (= (unapply!31 l!3519) (ite ((_ is Nil!20940) l!3519) None!553 (Some!554 (tuple2!15075 (h!22101 l!3519) (t!29935 l!3519)))))))

(assert (=> b!992694 d!118167))

(declare-fun d!118174 () Bool)

(declare-fun lt!440144 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!459 (List!20943) (InoxSet (_ BitVec 64)))

(assert (=> d!118174 (= lt!440144 (select (content!459 (_2!7548 lt!440122)) e!29))))

(declare-fun e!560126 () Bool)

(assert (=> d!118174 (= lt!440144 e!560126)))

(declare-fun res!663566 () Bool)

(assert (=> d!118174 (=> (not res!663566) (not e!560126))))

(assert (=> d!118174 (= res!663566 ((_ is Cons!20939) (_2!7548 lt!440122)))))

(assert (=> d!118174 (= (contains!5742 (_2!7548 lt!440122) e!29) lt!440144)))

(declare-fun b!992730 () Bool)

(declare-fun e!560129 () Bool)

(assert (=> b!992730 (= e!560126 e!560129)))

(declare-fun res!663568 () Bool)

(assert (=> b!992730 (=> res!663568 e!560129)))

(assert (=> b!992730 (= res!663568 (= (h!22101 (_2!7548 lt!440122)) e!29))))

(declare-fun b!992732 () Bool)

(assert (=> b!992732 (= e!560129 (contains!5742 (t!29935 (_2!7548 lt!440122)) e!29))))

(assert (= (and d!118174 res!663566) b!992730))

(assert (= (and b!992730 (not res!663568)) b!992732))

(declare-fun m!919945 () Bool)

(assert (=> d!118174 m!919945))

(declare-fun m!919949 () Bool)

(assert (=> d!118174 m!919949))

(declare-fun m!919953 () Bool)

(assert (=> b!992732 m!919953))

(assert (=> b!992695 d!118174))

(declare-fun d!118181 () Bool)

(assert (=> d!118181 (= (get!15713 lt!440123) (v!14375 lt!440123))))

(assert (=> b!992695 d!118181))

(declare-fun d!118185 () Bool)

(declare-fun lt!440146 () Bool)

(assert (=> d!118185 (= lt!440146 (select (content!459 l!3519) e!29))))

(declare-fun e!560132 () Bool)

(assert (=> d!118185 (= lt!440146 e!560132)))

(declare-fun res!663571 () Bool)

(assert (=> d!118185 (=> (not res!663571) (not e!560132))))

(assert (=> d!118185 (= res!663571 ((_ is Cons!20939) l!3519))))

(assert (=> d!118185 (= (contains!5742 l!3519 e!29) lt!440146)))

(declare-fun b!992735 () Bool)

(declare-fun e!560134 () Bool)

(assert (=> b!992735 (= e!560132 e!560134)))

(declare-fun res!663573 () Bool)

(assert (=> b!992735 (=> res!663573 e!560134)))

(assert (=> b!992735 (= res!663573 (= (h!22101 l!3519) e!29))))

(declare-fun b!992737 () Bool)

(assert (=> b!992737 (= e!560134 (contains!5742 (t!29935 l!3519) e!29))))

(assert (= (and d!118185 res!663571) b!992735))

(assert (= (and b!992735 (not res!663573)) b!992737))

(declare-fun m!919961 () Bool)

(assert (=> d!118185 m!919961))

(declare-fun m!919965 () Bool)

(assert (=> d!118185 m!919965))

(declare-fun m!919969 () Bool)

(assert (=> b!992737 m!919969))

(assert (=> start!85262 d!118185))

(declare-fun d!118191 () Bool)

(declare-fun lt!440153 () Int)

(assert (=> d!118191 (>= lt!440153 0)))

(declare-fun e!560141 () Int)

(assert (=> d!118191 (= lt!440153 e!560141)))

(declare-fun c!100724 () Bool)

(assert (=> d!118191 (= c!100724 ((_ is Nil!20940) (_2!7548 lt!440122)))))

(assert (=> d!118191 (= (ListPrimitiveSize!94 (_2!7548 lt!440122)) lt!440153)))

(declare-fun b!992748 () Bool)

(assert (=> b!992748 (= e!560141 0)))

(declare-fun b!992750 () Bool)

(assert (=> b!992750 (= e!560141 (+ 1 (ListPrimitiveSize!94 (t!29935 (_2!7548 lt!440122)))))))

(assert (= (and d!118191 c!100724) b!992748))

(assert (= (and d!118191 (not c!100724)) b!992750))

(declare-fun m!919975 () Bool)

(assert (=> b!992750 m!919975))

(assert (=> b!992696 d!118191))

(declare-fun d!118201 () Bool)

(declare-fun lt!440157 () Int)

(assert (=> d!118201 (>= lt!440157 0)))

(declare-fun e!560145 () Int)

(assert (=> d!118201 (= lt!440157 e!560145)))

(declare-fun c!100728 () Bool)

(assert (=> d!118201 (= c!100728 ((_ is Nil!20940) l!3519))))

(assert (=> d!118201 (= (ListPrimitiveSize!94 l!3519) lt!440157)))

(declare-fun b!992756 () Bool)

(assert (=> b!992756 (= e!560145 0)))

(declare-fun b!992758 () Bool)

(assert (=> b!992758 (= e!560145 (+ 1 (ListPrimitiveSize!94 (t!29935 l!3519))))))

(assert (= (and d!118201 c!100728) b!992756))

(assert (= (and d!118201 (not c!100728)) b!992758))

(declare-fun m!919979 () Bool)

(assert (=> b!992758 m!919979))

(assert (=> b!992696 d!118201))

(check-sat (not d!118185) (not d!118174) (not b!992750) (not b!992732) (not b!992758) (not b!992737))
(check-sat)
