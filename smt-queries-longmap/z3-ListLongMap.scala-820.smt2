; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19998 () Bool)

(assert start!19998)

(declare-fun b!195794 () Bool)

(declare-fun e!128881 () Bool)

(declare-fun tp_is_empty!4531 () Bool)

(assert (=> b!195794 (= e!128881 tp_is_empty!4531)))

(declare-fun b!195795 () Bool)

(declare-fun res!92355 () Bool)

(declare-fun e!128884 () Bool)

(assert (=> b!195795 (=> (not res!92355) (not e!128884))))

(declare-datatypes ((array!8301 0))(
  ( (array!8302 (arr!3902 (Array (_ BitVec 32) (_ BitVec 64))) (size!4228 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8301)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8301 (_ BitVec 32)) Bool)

(assert (=> b!195795 (= res!92355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!195796 () Bool)

(declare-fun res!92353 () Bool)

(assert (=> b!195796 (=> (not res!92353) (not e!128884))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!5689 0))(
  ( (V!5690 (val!2310 Int)) )
))
(declare-datatypes ((ValueCell!1922 0))(
  ( (ValueCellFull!1922 (v!4273 V!5689)) (EmptyCell!1922) )
))
(declare-datatypes ((array!8303 0))(
  ( (array!8304 (arr!3903 (Array (_ BitVec 32) ValueCell!1922)) (size!4229 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8303)

(assert (=> b!195796 (= res!92353 (and (= (size!4229 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4228 _keys!825) (size!4229 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!92354 () Bool)

(assert (=> start!19998 (=> (not res!92354) (not e!128884))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!19998 (= res!92354 (validMask!0 mask!1149))))

(assert (=> start!19998 e!128884))

(assert (=> start!19998 true))

(declare-fun e!128883 () Bool)

(declare-fun array_inv!2527 (array!8303) Bool)

(assert (=> start!19998 (and (array_inv!2527 _values!649) e!128883)))

(declare-fun array_inv!2528 (array!8301) Bool)

(assert (=> start!19998 (array_inv!2528 _keys!825)))

(declare-fun mapIsEmpty!7859 () Bool)

(declare-fun mapRes!7859 () Bool)

(assert (=> mapIsEmpty!7859 mapRes!7859))

(declare-fun b!195797 () Bool)

(declare-fun res!92352 () Bool)

(assert (=> b!195797 (=> (not res!92352) (not e!128884))))

(assert (=> b!195797 (= res!92352 (and (bvsle #b00000000000000000000000000000000 (size!4228 _keys!825)) (bvslt (size!4228 _keys!825) #b01111111111111111111111111111111)))))

(declare-fun b!195798 () Bool)

(declare-datatypes ((List!2434 0))(
  ( (Nil!2431) (Cons!2430 (h!3072 (_ BitVec 64)) (t!7356 List!2434)) )
))
(declare-fun noDuplicate!58 (List!2434) Bool)

(assert (=> b!195798 (= e!128884 (not (noDuplicate!58 Nil!2431)))))

(declare-fun b!195799 () Bool)

(declare-fun e!128882 () Bool)

(assert (=> b!195799 (= e!128882 tp_is_empty!4531)))

(declare-fun b!195800 () Bool)

(assert (=> b!195800 (= e!128883 (and e!128881 mapRes!7859))))

(declare-fun condMapEmpty!7859 () Bool)

(declare-fun mapDefault!7859 () ValueCell!1922)

(assert (=> b!195800 (= condMapEmpty!7859 (= (arr!3903 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1922)) mapDefault!7859)))))

(declare-fun mapNonEmpty!7859 () Bool)

(declare-fun tp!17147 () Bool)

(assert (=> mapNonEmpty!7859 (= mapRes!7859 (and tp!17147 e!128882))))

(declare-fun mapValue!7859 () ValueCell!1922)

(declare-fun mapRest!7859 () (Array (_ BitVec 32) ValueCell!1922))

(declare-fun mapKey!7859 () (_ BitVec 32))

(assert (=> mapNonEmpty!7859 (= (arr!3903 _values!649) (store mapRest!7859 mapKey!7859 mapValue!7859))))

(assert (= (and start!19998 res!92354) b!195796))

(assert (= (and b!195796 res!92353) b!195795))

(assert (= (and b!195795 res!92355) b!195797))

(assert (= (and b!195797 res!92352) b!195798))

(assert (= (and b!195800 condMapEmpty!7859) mapIsEmpty!7859))

(assert (= (and b!195800 (not condMapEmpty!7859)) mapNonEmpty!7859))

(get-info :version)

(assert (= (and mapNonEmpty!7859 ((_ is ValueCellFull!1922) mapValue!7859)) b!195799))

(assert (= (and b!195800 ((_ is ValueCellFull!1922) mapDefault!7859)) b!195794))

(assert (= start!19998 b!195800))

(declare-fun m!222773 () Bool)

(assert (=> b!195795 m!222773))

(declare-fun m!222775 () Bool)

(assert (=> start!19998 m!222775))

(declare-fun m!222777 () Bool)

(assert (=> start!19998 m!222777))

(declare-fun m!222779 () Bool)

(assert (=> start!19998 m!222779))

(declare-fun m!222781 () Bool)

(assert (=> b!195798 m!222781))

(declare-fun m!222783 () Bool)

(assert (=> mapNonEmpty!7859 m!222783))

(check-sat (not mapNonEmpty!7859) (not start!19998) (not b!195795) (not b!195798) tp_is_empty!4531)
(check-sat)
(get-model)

(declare-fun d!57405 () Bool)

(assert (=> d!57405 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!19998 d!57405))

(declare-fun d!57407 () Bool)

(assert (=> d!57407 (= (array_inv!2527 _values!649) (bvsge (size!4229 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!19998 d!57407))

(declare-fun d!57409 () Bool)

(assert (=> d!57409 (= (array_inv!2528 _keys!825) (bvsge (size!4228 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!19998 d!57409))

(declare-fun d!57411 () Bool)

(declare-fun res!92384 () Bool)

(declare-fun e!128919 () Bool)

(assert (=> d!57411 (=> res!92384 e!128919)))

(assert (=> d!57411 (= res!92384 ((_ is Nil!2431) Nil!2431))))

(assert (=> d!57411 (= (noDuplicate!58 Nil!2431) e!128919)))

(declare-fun b!195847 () Bool)

(declare-fun e!128920 () Bool)

(assert (=> b!195847 (= e!128919 e!128920)))

(declare-fun res!92385 () Bool)

(assert (=> b!195847 (=> (not res!92385) (not e!128920))))

(declare-fun contains!1363 (List!2434 (_ BitVec 64)) Bool)

(assert (=> b!195847 (= res!92385 (not (contains!1363 (t!7356 Nil!2431) (h!3072 Nil!2431))))))

(declare-fun b!195848 () Bool)

(assert (=> b!195848 (= e!128920 (noDuplicate!58 (t!7356 Nil!2431)))))

(assert (= (and d!57411 (not res!92384)) b!195847))

(assert (= (and b!195847 res!92385) b!195848))

(declare-fun m!222809 () Bool)

(assert (=> b!195847 m!222809))

(declare-fun m!222811 () Bool)

(assert (=> b!195848 m!222811))

(assert (=> b!195798 d!57411))

(declare-fun b!195858 () Bool)

(declare-fun e!128928 () Bool)

(declare-fun call!19749 () Bool)

(assert (=> b!195858 (= e!128928 call!19749)))

(declare-fun bm!19746 () Bool)

(assert (=> bm!19746 (= call!19749 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(declare-fun b!195859 () Bool)

(declare-fun e!128929 () Bool)

(assert (=> b!195859 (= e!128928 e!128929)))

(declare-fun lt!97370 () (_ BitVec 64))

(assert (=> b!195859 (= lt!97370 (select (arr!3902 _keys!825) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5890 0))(
  ( (Unit!5891) )
))
(declare-fun lt!97372 () Unit!5890)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8301 (_ BitVec 64) (_ BitVec 32)) Unit!5890)

(assert (=> b!195859 (= lt!97372 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!97370 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!8301 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!195859 (arrayContainsKey!0 _keys!825 lt!97370 #b00000000000000000000000000000000)))

(declare-fun lt!97371 () Unit!5890)

(assert (=> b!195859 (= lt!97371 lt!97372)))

(declare-fun res!92390 () Bool)

(declare-datatypes ((SeekEntryResult!703 0))(
  ( (MissingZero!703 (index!4982 (_ BitVec 32))) (Found!703 (index!4983 (_ BitVec 32))) (Intermediate!703 (undefined!1515 Bool) (index!4984 (_ BitVec 32)) (x!20823 (_ BitVec 32))) (Undefined!703) (MissingVacant!703 (index!4985 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8301 (_ BitVec 32)) SeekEntryResult!703)

(assert (=> b!195859 (= res!92390 (= (seekEntryOrOpen!0 (select (arr!3902 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!703 #b00000000000000000000000000000000)))))

(assert (=> b!195859 (=> (not res!92390) (not e!128929))))

(declare-fun b!195860 () Bool)

(assert (=> b!195860 (= e!128929 call!19749)))

(declare-fun b!195857 () Bool)

(declare-fun e!128927 () Bool)

(assert (=> b!195857 (= e!128927 e!128928)))

(declare-fun c!35406 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!195857 (= c!35406 (validKeyInArray!0 (select (arr!3902 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun d!57413 () Bool)

(declare-fun res!92391 () Bool)

(assert (=> d!57413 (=> res!92391 e!128927)))

(assert (=> d!57413 (= res!92391 (bvsge #b00000000000000000000000000000000 (size!4228 _keys!825)))))

(assert (=> d!57413 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!128927)))

(assert (= (and d!57413 (not res!92391)) b!195857))

(assert (= (and b!195857 c!35406) b!195859))

(assert (= (and b!195857 (not c!35406)) b!195858))

(assert (= (and b!195859 res!92390) b!195860))

(assert (= (or b!195860 b!195858) bm!19746))

(declare-fun m!222813 () Bool)

(assert (=> bm!19746 m!222813))

(declare-fun m!222815 () Bool)

(assert (=> b!195859 m!222815))

(declare-fun m!222817 () Bool)

(assert (=> b!195859 m!222817))

(declare-fun m!222819 () Bool)

(assert (=> b!195859 m!222819))

(assert (=> b!195859 m!222815))

(declare-fun m!222821 () Bool)

(assert (=> b!195859 m!222821))

(assert (=> b!195857 m!222815))

(assert (=> b!195857 m!222815))

(declare-fun m!222823 () Bool)

(assert (=> b!195857 m!222823))

(assert (=> b!195795 d!57413))

(declare-fun b!195867 () Bool)

(declare-fun e!128935 () Bool)

(assert (=> b!195867 (= e!128935 tp_is_empty!4531)))

(declare-fun b!195868 () Bool)

(declare-fun e!128934 () Bool)

(assert (=> b!195868 (= e!128934 tp_is_empty!4531)))

(declare-fun mapIsEmpty!7868 () Bool)

(declare-fun mapRes!7868 () Bool)

(assert (=> mapIsEmpty!7868 mapRes!7868))

(declare-fun mapNonEmpty!7868 () Bool)

(declare-fun tp!17156 () Bool)

(assert (=> mapNonEmpty!7868 (= mapRes!7868 (and tp!17156 e!128935))))

(declare-fun mapValue!7868 () ValueCell!1922)

(declare-fun mapKey!7868 () (_ BitVec 32))

(declare-fun mapRest!7868 () (Array (_ BitVec 32) ValueCell!1922))

(assert (=> mapNonEmpty!7868 (= mapRest!7859 (store mapRest!7868 mapKey!7868 mapValue!7868))))

(declare-fun condMapEmpty!7868 () Bool)

(declare-fun mapDefault!7868 () ValueCell!1922)

(assert (=> mapNonEmpty!7859 (= condMapEmpty!7868 (= mapRest!7859 ((as const (Array (_ BitVec 32) ValueCell!1922)) mapDefault!7868)))))

(assert (=> mapNonEmpty!7859 (= tp!17147 (and e!128934 mapRes!7868))))

(assert (= (and mapNonEmpty!7859 condMapEmpty!7868) mapIsEmpty!7868))

(assert (= (and mapNonEmpty!7859 (not condMapEmpty!7868)) mapNonEmpty!7868))

(assert (= (and mapNonEmpty!7868 ((_ is ValueCellFull!1922) mapValue!7868)) b!195867))

(assert (= (and mapNonEmpty!7859 ((_ is ValueCellFull!1922) mapDefault!7868)) b!195868))

(declare-fun m!222825 () Bool)

(assert (=> mapNonEmpty!7868 m!222825))

(check-sat (not mapNonEmpty!7868) (not b!195857) tp_is_empty!4531 (not b!195859) (not b!195848) (not bm!19746) (not b!195847))
(check-sat)
