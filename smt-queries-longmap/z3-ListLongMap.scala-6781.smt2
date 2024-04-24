; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85526 () Bool)

(assert start!85526)

(declare-fun res!664098 () Bool)

(declare-fun e!560973 () Bool)

(assert (=> start!85526 (=> (not res!664098) (not e!560973))))

(declare-datatypes ((List!20903 0))(
  ( (Nil!20900) (Cons!20899 (h!22067 (_ BitVec 64)) (t!29896 List!20903)) )
))
(declare-fun l!3519 () List!20903)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5797 (List!20903 (_ BitVec 64)) Bool)

(assert (=> start!85526 (= res!664098 (not (contains!5797 l!3519 e!29)))))

(assert (=> start!85526 e!560973))

(assert (=> start!85526 true))

(declare-fun b!994022 () Bool)

(declare-fun res!664099 () Bool)

(assert (=> b!994022 (=> (not res!664099) (not e!560973))))

(declare-datatypes ((tuple2!15010 0))(
  ( (tuple2!15011 (_1!7516 (_ BitVec 64)) (_2!7516 List!20903)) )
))
(declare-datatypes ((Option!556 0))(
  ( (Some!555 (v!14385 tuple2!15010)) (None!554) )
))
(declare-fun isEmpty!771 (Option!556) Bool)

(declare-fun unapply!37 (List!20903) Option!556)

(assert (=> b!994022 (= res!664099 (isEmpty!771 (unapply!37 l!3519)))))

(declare-fun b!994023 () Bool)

(declare-fun res!664100 () Bool)

(assert (=> b!994023 (=> (not res!664100) (not e!560973))))

(get-info :version)

(assert (=> b!994023 (= res!664100 ((_ is Nil!20900) l!3519))))

(declare-fun b!994024 () Bool)

(declare-fun -!452 (List!20903 (_ BitVec 64)) List!20903)

(assert (=> b!994024 (= e!560973 (not (= (-!452 l!3519 e!29) l!3519)))))

(assert (= (and start!85526 res!664098) b!994022))

(assert (= (and b!994022 res!664099) b!994023))

(assert (= (and b!994023 res!664100) b!994024))

(declare-fun m!922181 () Bool)

(assert (=> start!85526 m!922181))

(declare-fun m!922183 () Bool)

(assert (=> b!994022 m!922183))

(assert (=> b!994022 m!922183))

(declare-fun m!922185 () Bool)

(assert (=> b!994022 m!922185))

(declare-fun m!922187 () Bool)

(assert (=> b!994024 m!922187))

(check-sat (not start!85526) (not b!994024) (not b!994022))
(check-sat)
(get-model)

(declare-fun d!118777 () Bool)

(declare-fun lt!440823 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!466 (List!20903) (InoxSet (_ BitVec 64)))

(assert (=> d!118777 (= lt!440823 (select (content!466 l!3519) e!29))))

(declare-fun e!560992 () Bool)

(assert (=> d!118777 (= lt!440823 e!560992)))

(declare-fun res!664132 () Bool)

(assert (=> d!118777 (=> (not res!664132) (not e!560992))))

(assert (=> d!118777 (= res!664132 ((_ is Cons!20899) l!3519))))

(assert (=> d!118777 (= (contains!5797 l!3519 e!29) lt!440823)))

(declare-fun b!994055 () Bool)

(declare-fun e!560993 () Bool)

(assert (=> b!994055 (= e!560992 e!560993)))

(declare-fun res!664131 () Bool)

(assert (=> b!994055 (=> res!664131 e!560993)))

(assert (=> b!994055 (= res!664131 (= (h!22067 l!3519) e!29))))

(declare-fun b!994056 () Bool)

(assert (=> b!994056 (= e!560993 (contains!5797 (t!29896 l!3519) e!29))))

(assert (= (and d!118777 res!664132) b!994055))

(assert (= (and b!994055 (not res!664131)) b!994056))

(declare-fun m!922205 () Bool)

(assert (=> d!118777 m!922205))

(declare-fun m!922207 () Bool)

(assert (=> d!118777 m!922207))

(declare-fun m!922209 () Bool)

(assert (=> b!994056 m!922209))

(assert (=> start!85526 d!118777))

(declare-fun bm!42182 () Bool)

(declare-fun call!42185 () List!20903)

(assert (=> bm!42182 (= call!42185 (-!452 (t!29896 l!3519) e!29))))

(declare-fun b!994091 () Bool)

(declare-fun e!561020 () List!20903)

(assert (=> b!994091 (= e!561020 call!42185)))

(declare-fun d!118783 () Bool)

(declare-fun e!561019 () Bool)

(assert (=> d!118783 e!561019))

(declare-fun res!664143 () Bool)

(assert (=> d!118783 (=> (not res!664143) (not e!561019))))

(declare-fun lt!440832 () List!20903)

(declare-fun size!30714 (List!20903) Int)

(assert (=> d!118783 (= res!664143 (<= (size!30714 lt!440832) (size!30714 l!3519)))))

(declare-fun e!561021 () List!20903)

(assert (=> d!118783 (= lt!440832 e!561021)))

(declare-fun c!101115 () Bool)

(assert (=> d!118783 (= c!101115 ((_ is Cons!20899) l!3519))))

(assert (=> d!118783 (= (-!452 l!3519 e!29) lt!440832)))

(declare-fun b!994092 () Bool)

(assert (=> b!994092 (= e!561019 (= (content!466 lt!440832) ((_ map and) (content!466 l!3519) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) e!29 true)))))))

(declare-fun b!994093 () Bool)

(assert (=> b!994093 (= e!561021 Nil!20900)))

(declare-fun b!994094 () Bool)

(assert (=> b!994094 (= e!561021 e!561020)))

(declare-fun c!101114 () Bool)

(assert (=> b!994094 (= c!101114 (= e!29 (h!22067 l!3519)))))

(declare-fun b!994095 () Bool)

(assert (=> b!994095 (= e!561020 (Cons!20899 (h!22067 l!3519) call!42185))))

(assert (= (and d!118783 c!101115) b!994094))

(assert (= (and d!118783 (not c!101115)) b!994093))

(assert (= (and b!994094 c!101114) b!994091))

(assert (= (and b!994094 (not c!101114)) b!994095))

(assert (= (or b!994091 b!994095) bm!42182))

(assert (= (and d!118783 res!664143) b!994092))

(declare-fun m!922223 () Bool)

(assert (=> bm!42182 m!922223))

(declare-fun m!922225 () Bool)

(assert (=> d!118783 m!922225))

(declare-fun m!922227 () Bool)

(assert (=> d!118783 m!922227))

(declare-fun m!922229 () Bool)

(assert (=> b!994092 m!922229))

(assert (=> b!994092 m!922205))

(declare-fun m!922231 () Bool)

(assert (=> b!994092 m!922231))

(assert (=> b!994024 d!118783))

(declare-fun d!118789 () Bool)

(assert (=> d!118789 (= (isEmpty!771 (unapply!37 l!3519)) (not ((_ is Some!555) (unapply!37 l!3519))))))

(assert (=> b!994022 d!118789))

(declare-fun d!118793 () Bool)

(assert (=> d!118793 (= (unapply!37 l!3519) (ite ((_ is Nil!20900) l!3519) None!554 (Some!555 (tuple2!15011 (h!22067 l!3519) (t!29896 l!3519)))))))

(assert (=> b!994022 d!118793))

(check-sat (not b!994092) (not d!118777) (not b!994056) (not bm!42182) (not d!118783))
(check-sat)
