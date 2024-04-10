; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84960 () Bool)

(assert start!84960)

(declare-fun res!663187 () Bool)

(declare-fun e!559715 () Bool)

(assert (=> start!84960 (=> (not res!663187) (not e!559715))))

(declare-datatypes ((List!20877 0))(
  ( (Nil!20874) (Cons!20873 (h!22035 (_ BitVec 64)) (t!29863 List!20877)) )
))
(declare-fun tail!21 () List!20877)

(declare-fun head!726 () (_ BitVec 64))

(declare-fun contains!5738 (List!20877 (_ BitVec 64)) Bool)

(assert (=> start!84960 (= res!663187 (not (contains!5738 tail!21 head!726)))))

(assert (=> start!84960 e!559715))

(assert (=> start!84960 true))

(declare-fun b!992234 () Bool)

(declare-fun res!663188 () Bool)

(assert (=> b!992234 (=> (not res!663188) (not e!559715))))

(declare-fun content!432 (List!20877) (Set (_ BitVec 64)))

(assert (=> b!992234 (= res!663188 (not (member head!726 (content!432 tail!21))))))

(declare-fun b!992235 () Bool)

(declare-fun e!559716 () Bool)

(assert (=> b!992235 (= e!559715 e!559716)))

(declare-fun res!663189 () Bool)

(assert (=> b!992235 (=> (not res!663189) (not e!559716))))

(declare-datatypes ((tuple2!14944 0))(
  ( (tuple2!14945 (_1!7483 (_ BitVec 64)) (_2!7483 List!20877)) )
))
(declare-datatypes ((Option!527 0))(
  ( (Some!526 (v!14324 tuple2!14944)) (None!525) )
))
(declare-fun lt!440106 () Option!527)

(declare-fun isEmpty!734 (Option!527) Bool)

(assert (=> b!992235 (= res!663189 (not (isEmpty!734 lt!440106)))))

(declare-fun unapply!6 (List!20877) Option!527)

(declare-fun $colon$colon!563 (List!20877 (_ BitVec 64)) List!20877)

(assert (=> b!992235 (= lt!440106 (unapply!6 ($colon$colon!563 tail!21 head!726)))))

(declare-fun b!992236 () Bool)

(assert (=> b!992236 (= e!559716 false)))

(declare-fun lt!440107 () Bool)

(declare-fun get!15683 (Option!527) tuple2!14944)

(assert (=> b!992236 (= lt!440107 (contains!5738 (_2!7483 (get!15683 lt!440106)) head!726))))

(assert (= (and start!84960 res!663187) b!992234))

(assert (= (and b!992234 res!663188) b!992235))

(assert (= (and b!992235 res!663189) b!992236))

(declare-fun m!919929 () Bool)

(assert (=> start!84960 m!919929))

(declare-fun m!919931 () Bool)

(assert (=> b!992234 m!919931))

(declare-fun m!919933 () Bool)

(assert (=> b!992234 m!919933))

(declare-fun m!919935 () Bool)

(assert (=> b!992235 m!919935))

(declare-fun m!919937 () Bool)

(assert (=> b!992235 m!919937))

(assert (=> b!992235 m!919937))

(declare-fun m!919939 () Bool)

(assert (=> b!992235 m!919939))

(declare-fun m!919941 () Bool)

(assert (=> b!992236 m!919941))

(declare-fun m!919943 () Bool)

(assert (=> b!992236 m!919943))

(push 1)

(assert (not b!992235))

(assert (not b!992234))

(assert (not start!84960))

(assert (not b!992236))

