; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85418 () Bool)

(assert start!85418)

(declare-fun res!663940 () Bool)

(declare-fun e!560777 () Bool)

(assert (=> start!85418 (=> (not res!663940) (not e!560777))))

(declare-datatypes ((List!20894 0))(
  ( (Nil!20891) (Cons!20890 (h!22058 (_ BitVec 64)) (t!29887 List!20894)) )
))
(declare-fun l!3519 () List!20894)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5788 (List!20894 (_ BitVec 64)) Bool)

(assert (=> start!85418 (= res!663940 (not (contains!5788 l!3519 e!29)))))

(assert (=> start!85418 e!560777))

(assert (=> start!85418 true))

(declare-fun b!993792 () Bool)

(declare-fun e!560778 () Bool)

(assert (=> b!993792 (= e!560777 e!560778)))

(declare-fun res!663941 () Bool)

(assert (=> b!993792 (=> (not res!663941) (not e!560778))))

(declare-datatypes ((tuple2!14992 0))(
  ( (tuple2!14993 (_1!7507 (_ BitVec 64)) (_2!7507 List!20894)) )
))
(declare-datatypes ((Option!547 0))(
  ( (Some!546 (v!14367 tuple2!14992)) (None!545) )
))
(declare-fun lt!440696 () Option!547)

(declare-fun isEmpty!762 (Option!547) Bool)

(assert (=> b!993792 (= res!663941 (not (isEmpty!762 lt!440696)))))

(declare-fun unapply!28 (List!20894) Option!547)

(assert (=> b!993792 (= lt!440696 (unapply!28 l!3519))))

(declare-fun b!993793 () Bool)

(declare-fun get!15742 (Option!547) tuple2!14992)

(assert (=> b!993793 (= e!560778 (contains!5788 (_2!7507 (get!15742 lt!440696)) e!29))))

(assert (= (and start!85418 res!663940) b!993792))

(assert (= (and b!993792 res!663941) b!993793))

(declare-fun m!921881 () Bool)

(assert (=> start!85418 m!921881))

(declare-fun m!921883 () Bool)

(assert (=> b!993792 m!921883))

(declare-fun m!921885 () Bool)

(assert (=> b!993792 m!921885))

(declare-fun m!921887 () Bool)

(assert (=> b!993793 m!921887))

(declare-fun m!921889 () Bool)

(assert (=> b!993793 m!921889))

(check-sat (not start!85418) (not b!993792) (not b!993793))
(check-sat)
(get-model)

(declare-fun d!118653 () Bool)

(declare-fun lt!440707 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!458 (List!20894) (InoxSet (_ BitVec 64)))

(assert (=> d!118653 (= lt!440707 (select (content!458 l!3519) e!29))))

(declare-fun e!560800 () Bool)

(assert (=> d!118653 (= lt!440707 e!560800)))

(declare-fun res!663962 () Bool)

(assert (=> d!118653 (=> (not res!663962) (not e!560800))))

(get-info :version)

(assert (=> d!118653 (= res!663962 ((_ is Cons!20890) l!3519))))

(assert (=> d!118653 (= (contains!5788 l!3519 e!29) lt!440707)))

(declare-fun b!993814 () Bool)

(declare-fun e!560799 () Bool)

(assert (=> b!993814 (= e!560800 e!560799)))

(declare-fun res!663963 () Bool)

(assert (=> b!993814 (=> res!663963 e!560799)))

(assert (=> b!993814 (= res!663963 (= (h!22058 l!3519) e!29))))

(declare-fun b!993815 () Bool)

(assert (=> b!993815 (= e!560799 (contains!5788 (t!29887 l!3519) e!29))))

(assert (= (and d!118653 res!663962) b!993814))

(assert (= (and b!993814 (not res!663963)) b!993815))

(declare-fun m!921911 () Bool)

(assert (=> d!118653 m!921911))

(declare-fun m!921915 () Bool)

(assert (=> d!118653 m!921915))

(declare-fun m!921919 () Bool)

(assert (=> b!993815 m!921919))

(assert (=> start!85418 d!118653))

(declare-fun d!118661 () Bool)

(assert (=> d!118661 (= (isEmpty!762 lt!440696) (not ((_ is Some!546) lt!440696)))))

(assert (=> b!993792 d!118661))

(declare-fun d!118665 () Bool)

(assert (=> d!118665 (= (unapply!28 l!3519) (ite ((_ is Nil!20891) l!3519) None!545 (Some!546 (tuple2!14993 (h!22058 l!3519) (t!29887 l!3519)))))))

(assert (=> b!993792 d!118665))

(declare-fun d!118669 () Bool)

(declare-fun lt!440712 () Bool)

(assert (=> d!118669 (= lt!440712 (select (content!458 (_2!7507 (get!15742 lt!440696))) e!29))))

(declare-fun e!560810 () Bool)

(assert (=> d!118669 (= lt!440712 e!560810)))

(declare-fun res!663972 () Bool)

(assert (=> d!118669 (=> (not res!663972) (not e!560810))))

(assert (=> d!118669 (= res!663972 ((_ is Cons!20890) (_2!7507 (get!15742 lt!440696))))))

(assert (=> d!118669 (= (contains!5788 (_2!7507 (get!15742 lt!440696)) e!29) lt!440712)))

(declare-fun b!993824 () Bool)

(declare-fun e!560809 () Bool)

(assert (=> b!993824 (= e!560810 e!560809)))

(declare-fun res!663973 () Bool)

(assert (=> b!993824 (=> res!663973 e!560809)))

(assert (=> b!993824 (= res!663973 (= (h!22058 (_2!7507 (get!15742 lt!440696))) e!29))))

(declare-fun b!993825 () Bool)

(assert (=> b!993825 (= e!560809 (contains!5788 (t!29887 (_2!7507 (get!15742 lt!440696))) e!29))))

(assert (= (and d!118669 res!663972) b!993824))

(assert (= (and b!993824 (not res!663973)) b!993825))

(declare-fun m!921929 () Bool)

(assert (=> d!118669 m!921929))

(declare-fun m!921933 () Bool)

(assert (=> d!118669 m!921933))

(declare-fun m!921937 () Bool)

(assert (=> b!993825 m!921937))

(assert (=> b!993793 d!118669))

(declare-fun d!118675 () Bool)

(assert (=> d!118675 (= (get!15742 lt!440696) (v!14367 lt!440696))))

(assert (=> b!993793 d!118675))

(check-sat (not d!118669) (not b!993815) (not b!993825) (not d!118653))
(check-sat)
