; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84958 () Bool)

(assert start!84958)

(declare-fun res!663179 () Bool)

(declare-fun e!559709 () Bool)

(assert (=> start!84958 (=> (not res!663179) (not e!559709))))

(declare-datatypes ((List!20876 0))(
  ( (Nil!20873) (Cons!20872 (h!22034 (_ BitVec 64)) (t!29862 List!20876)) )
))
(declare-fun tail!21 () List!20876)

(declare-fun head!726 () (_ BitVec 64))

(declare-fun contains!5737 (List!20876 (_ BitVec 64)) Bool)

(assert (=> start!84958 (= res!663179 (not (contains!5737 tail!21 head!726)))))

(assert (=> start!84958 e!559709))

(assert (=> start!84958 true))

(declare-fun b!992225 () Bool)

(declare-fun res!663178 () Bool)

(assert (=> b!992225 (=> (not res!663178) (not e!559709))))

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!431 (List!20876) (InoxSet (_ BitVec 64)))

(assert (=> b!992225 (= res!663178 (not (select (content!431 tail!21) head!726)))))

(declare-fun b!992226 () Bool)

(declare-fun e!559710 () Bool)

(assert (=> b!992226 (= e!559709 e!559710)))

(declare-fun res!663180 () Bool)

(assert (=> b!992226 (=> (not res!663180) (not e!559710))))

(declare-datatypes ((tuple2!14942 0))(
  ( (tuple2!14943 (_1!7482 (_ BitVec 64)) (_2!7482 List!20876)) )
))
(declare-datatypes ((Option!526 0))(
  ( (Some!525 (v!14323 tuple2!14942)) (None!524) )
))
(declare-fun lt!440100 () Option!526)

(declare-fun isEmpty!733 (Option!526) Bool)

(assert (=> b!992226 (= res!663180 (not (isEmpty!733 lt!440100)))))

(declare-fun unapply!5 (List!20876) Option!526)

(declare-fun $colon$colon!562 (List!20876 (_ BitVec 64)) List!20876)

(assert (=> b!992226 (= lt!440100 (unapply!5 ($colon$colon!562 tail!21 head!726)))))

(declare-fun b!992227 () Bool)

(assert (=> b!992227 (= e!559710 false)))

(declare-fun lt!440101 () Bool)

(declare-fun get!15682 (Option!526) tuple2!14942)

(assert (=> b!992227 (= lt!440101 (contains!5737 (_2!7482 (get!15682 lt!440100)) head!726))))

(assert (= (and start!84958 res!663179) b!992225))

(assert (= (and b!992225 res!663178) b!992226))

(assert (= (and b!992226 res!663180) b!992227))

(declare-fun m!919913 () Bool)

(assert (=> start!84958 m!919913))

(declare-fun m!919915 () Bool)

(assert (=> b!992225 m!919915))

(declare-fun m!919917 () Bool)

(assert (=> b!992225 m!919917))

(declare-fun m!919919 () Bool)

(assert (=> b!992226 m!919919))

(declare-fun m!919921 () Bool)

(assert (=> b!992226 m!919921))

(assert (=> b!992226 m!919921))

(declare-fun m!919923 () Bool)

(assert (=> b!992226 m!919923))

(declare-fun m!919925 () Bool)

(assert (=> b!992227 m!919925))

(declare-fun m!919927 () Bool)

(assert (=> b!992227 m!919927))

(check-sat (not start!84958) (not b!992226) (not b!992227) (not b!992225))
(check-sat)
