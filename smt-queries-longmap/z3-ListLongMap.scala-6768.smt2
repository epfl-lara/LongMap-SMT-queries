; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85124 () Bool)

(assert start!85124)

(declare-fun res!663515 () Bool)

(declare-fun e!560285 () Bool)

(assert (=> start!85124 (=> (not res!663515) (not e!560285))))

(declare-datatypes ((List!20864 0))(
  ( (Nil!20861) (Cons!20860 (h!22028 (_ BitVec 64)) (t!29842 List!20864)) )
))
(declare-fun tail!21 () List!20864)

(declare-fun head!726 () (_ BitVec 64))

(declare-fun contains!5758 (List!20864 (_ BitVec 64)) Bool)

(assert (=> start!85124 (= res!663515 (not (contains!5758 tail!21 head!726)))))

(assert (=> start!85124 e!560285))

(assert (=> start!85124 true))

(declare-fun b!993119 () Bool)

(declare-fun res!663514 () Bool)

(assert (=> b!993119 (=> (not res!663514) (not e!560285))))

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!430 (List!20864) (InoxSet (_ BitVec 64)))

(assert (=> b!993119 (= res!663514 (not (select (content!430 tail!21) head!726)))))

(declare-fun b!993120 () Bool)

(declare-fun e!560286 () Bool)

(assert (=> b!993120 (= e!560285 e!560286)))

(declare-fun res!663513 () Bool)

(assert (=> b!993120 (=> (not res!663513) (not e!560286))))

(declare-datatypes ((tuple2!14944 0))(
  ( (tuple2!14945 (_1!7483 (_ BitVec 64)) (_2!7483 List!20864)) )
))
(declare-datatypes ((Option!523 0))(
  ( (Some!522 (v!14319 tuple2!14944)) (None!521) )
))
(declare-fun lt!440455 () Option!523)

(declare-fun isEmpty!738 (Option!523) Bool)

(assert (=> b!993120 (= res!663513 (not (isEmpty!738 lt!440455)))))

(declare-fun unapply!4 (List!20864) Option!523)

(declare-fun $colon$colon!560 (List!20864 (_ BitVec 64)) List!20864)

(assert (=> b!993120 (= lt!440455 (unapply!4 ($colon$colon!560 tail!21 head!726)))))

(declare-fun b!993121 () Bool)

(assert (=> b!993121 (= e!560286 false)))

(declare-fun lt!440456 () Bool)

(declare-fun get!15710 (Option!523) tuple2!14944)

(assert (=> b!993121 (= lt!440456 (contains!5758 (_2!7483 (get!15710 lt!440455)) head!726))))

(assert (= (and start!85124 res!663515) b!993119))

(assert (= (and b!993119 res!663514) b!993120))

(assert (= (and b!993120 res!663513) b!993121))

(declare-fun m!921191 () Bool)

(assert (=> start!85124 m!921191))

(declare-fun m!921193 () Bool)

(assert (=> b!993119 m!921193))

(declare-fun m!921195 () Bool)

(assert (=> b!993119 m!921195))

(declare-fun m!921197 () Bool)

(assert (=> b!993120 m!921197))

(declare-fun m!921199 () Bool)

(assert (=> b!993120 m!921199))

(assert (=> b!993120 m!921199))

(declare-fun m!921201 () Bool)

(assert (=> b!993120 m!921201))

(declare-fun m!921203 () Bool)

(assert (=> b!993121 m!921203))

(declare-fun m!921205 () Bool)

(assert (=> b!993121 m!921205))

(check-sat (not b!993120) (not b!993121) (not start!85124) (not b!993119))
(check-sat)
