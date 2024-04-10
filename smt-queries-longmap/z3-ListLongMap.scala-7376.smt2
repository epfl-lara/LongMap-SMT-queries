; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93998 () Bool)

(assert start!93998)

(declare-fun b_free!21435 () Bool)

(declare-fun b_next!21435 () Bool)

(assert (=> start!93998 (= b_free!21435 (not b_next!21435))))

(declare-fun tp!75733 () Bool)

(declare-fun b_and!34167 () Bool)

(assert (=> start!93998 (= tp!75733 b_and!34167)))

(declare-fun mapNonEmpty!39544 () Bool)

(declare-fun mapRes!39544 () Bool)

(declare-fun tp!75734 () Bool)

(declare-fun e!605685 () Bool)

(assert (=> mapNonEmpty!39544 (= mapRes!39544 (and tp!75734 e!605685))))

(declare-fun mapKey!39544 () (_ BitVec 32))

(declare-datatypes ((V!38795 0))(
  ( (V!38796 (val!12673 Int)) )
))
(declare-datatypes ((ValueCell!11919 0))(
  ( (ValueCellFull!11919 (v!15284 V!38795)) (EmptyCell!11919) )
))
(declare-datatypes ((array!67489 0))(
  ( (array!67490 (arr!32450 (Array (_ BitVec 32) ValueCell!11919)) (size!32986 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67489)

(declare-fun mapRest!39544 () (Array (_ BitVec 32) ValueCell!11919))

(declare-fun mapValue!39544 () ValueCell!11919)

(assert (=> mapNonEmpty!39544 (= (arr!32450 _values!955) (store mapRest!39544 mapKey!39544 mapValue!39544))))

(declare-fun b!1063106 () Bool)

(declare-fun tp_is_empty!25245 () Bool)

(assert (=> b!1063106 (= e!605685 tp_is_empty!25245)))

(declare-fun b!1063107 () Bool)

(declare-fun res!709831 () Bool)

(declare-fun e!605686 () Bool)

(assert (=> b!1063107 (=> (not res!709831) (not e!605686))))

(declare-datatypes ((array!67491 0))(
  ( (array!67492 (arr!32451 (Array (_ BitVec 32) (_ BitVec 64))) (size!32987 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67491)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67491 (_ BitVec 32)) Bool)

(assert (=> b!1063107 (= res!709831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1063108 () Bool)

(declare-fun e!605688 () Bool)

(declare-fun e!605687 () Bool)

(assert (=> b!1063108 (= e!605688 e!605687)))

(declare-fun res!709829 () Bool)

(assert (=> b!1063108 (=> res!709829 e!605687)))

(declare-datatypes ((tuple2!16036 0))(
  ( (tuple2!16037 (_1!8029 (_ BitVec 64)) (_2!8029 V!38795)) )
))
(declare-datatypes ((List!22616 0))(
  ( (Nil!22613) (Cons!22612 (h!23821 tuple2!16036) (t!31929 List!22616)) )
))
(declare-datatypes ((ListLongMap!14005 0))(
  ( (ListLongMap!14006 (toList!7018 List!22616)) )
))
(declare-fun lt!468507 () ListLongMap!14005)

(declare-fun contains!6249 (ListLongMap!14005 (_ BitVec 64)) Bool)

(assert (=> b!1063108 (= res!709829 (contains!6249 lt!468507 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!38795)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38795)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!4001 (array!67491 array!67489 (_ BitVec 32) (_ BitVec 32) V!38795 V!38795 (_ BitVec 32) Int) ListLongMap!14005)

(assert (=> b!1063108 (= lt!468507 (getCurrentListMap!4001 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!709828 () Bool)

(assert (=> start!93998 (=> (not res!709828) (not e!605686))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93998 (= res!709828 (validMask!0 mask!1515))))

(assert (=> start!93998 e!605686))

(assert (=> start!93998 true))

(assert (=> start!93998 tp_is_empty!25245))

(declare-fun e!605684 () Bool)

(declare-fun array_inv!25136 (array!67489) Bool)

(assert (=> start!93998 (and (array_inv!25136 _values!955) e!605684)))

(assert (=> start!93998 tp!75733))

(declare-fun array_inv!25137 (array!67491) Bool)

(assert (=> start!93998 (array_inv!25137 _keys!1163)))

(declare-fun b!1063109 () Bool)

(assert (=> b!1063109 (= e!605687 true)))

(declare-fun -!581 (ListLongMap!14005 (_ BitVec 64)) ListLongMap!14005)

(assert (=> b!1063109 (= (-!581 lt!468507 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468507)))

(declare-datatypes ((Unit!34836 0))(
  ( (Unit!34837) )
))
(declare-fun lt!468506 () Unit!34836)

(declare-fun removeNotPresentStillSame!28 (ListLongMap!14005 (_ BitVec 64)) Unit!34836)

(assert (=> b!1063109 (= lt!468506 (removeNotPresentStillSame!28 lt!468507 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1063110 () Bool)

(declare-fun res!709832 () Bool)

(assert (=> b!1063110 (=> (not res!709832) (not e!605686))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1063110 (= res!709832 (and (= (size!32986 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32987 _keys!1163) (size!32986 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1063111 () Bool)

(declare-fun e!605689 () Bool)

(assert (=> b!1063111 (= e!605684 (and e!605689 mapRes!39544))))

(declare-fun condMapEmpty!39544 () Bool)

(declare-fun mapDefault!39544 () ValueCell!11919)

(assert (=> b!1063111 (= condMapEmpty!39544 (= (arr!32450 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11919)) mapDefault!39544)))))

(declare-fun b!1063112 () Bool)

(declare-fun res!709830 () Bool)

(assert (=> b!1063112 (=> (not res!709830) (not e!605686))))

(declare-datatypes ((List!22617 0))(
  ( (Nil!22614) (Cons!22613 (h!23822 (_ BitVec 64)) (t!31930 List!22617)) )
))
(declare-fun arrayNoDuplicates!0 (array!67491 (_ BitVec 32) List!22617) Bool)

(assert (=> b!1063112 (= res!709830 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22614))))

(declare-fun mapIsEmpty!39544 () Bool)

(assert (=> mapIsEmpty!39544 mapRes!39544))

(declare-fun b!1063113 () Bool)

(assert (=> b!1063113 (= e!605689 tp_is_empty!25245)))

(declare-fun b!1063114 () Bool)

(assert (=> b!1063114 (= e!605686 (not e!605688))))

(declare-fun res!709833 () Bool)

(assert (=> b!1063114 (=> res!709833 e!605688)))

(assert (=> b!1063114 (= res!709833 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!468508 () ListLongMap!14005)

(declare-fun lt!468509 () ListLongMap!14005)

(assert (=> b!1063114 (= lt!468508 lt!468509)))

(declare-fun lt!468510 () Unit!34836)

(declare-fun zeroValueAfter!47 () V!38795)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!648 (array!67491 array!67489 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38795 V!38795 V!38795 V!38795 (_ BitVec 32) Int) Unit!34836)

(assert (=> b!1063114 (= lt!468510 (lemmaNoChangeToArrayThenSameMapNoExtras!648 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3611 (array!67491 array!67489 (_ BitVec 32) (_ BitVec 32) V!38795 V!38795 (_ BitVec 32) Int) ListLongMap!14005)

(assert (=> b!1063114 (= lt!468509 (getCurrentListMapNoExtraKeys!3611 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063114 (= lt!468508 (getCurrentListMapNoExtraKeys!3611 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!93998 res!709828) b!1063110))

(assert (= (and b!1063110 res!709832) b!1063107))

(assert (= (and b!1063107 res!709831) b!1063112))

(assert (= (and b!1063112 res!709830) b!1063114))

(assert (= (and b!1063114 (not res!709833)) b!1063108))

(assert (= (and b!1063108 (not res!709829)) b!1063109))

(assert (= (and b!1063111 condMapEmpty!39544) mapIsEmpty!39544))

(assert (= (and b!1063111 (not condMapEmpty!39544)) mapNonEmpty!39544))

(get-info :version)

(assert (= (and mapNonEmpty!39544 ((_ is ValueCellFull!11919) mapValue!39544)) b!1063106))

(assert (= (and b!1063111 ((_ is ValueCellFull!11919) mapDefault!39544)) b!1063113))

(assert (= start!93998 b!1063111))

(declare-fun m!981809 () Bool)

(assert (=> b!1063109 m!981809))

(declare-fun m!981811 () Bool)

(assert (=> b!1063109 m!981811))

(declare-fun m!981813 () Bool)

(assert (=> b!1063108 m!981813))

(declare-fun m!981815 () Bool)

(assert (=> b!1063108 m!981815))

(declare-fun m!981817 () Bool)

(assert (=> b!1063114 m!981817))

(declare-fun m!981819 () Bool)

(assert (=> b!1063114 m!981819))

(declare-fun m!981821 () Bool)

(assert (=> b!1063114 m!981821))

(declare-fun m!981823 () Bool)

(assert (=> start!93998 m!981823))

(declare-fun m!981825 () Bool)

(assert (=> start!93998 m!981825))

(declare-fun m!981827 () Bool)

(assert (=> start!93998 m!981827))

(declare-fun m!981829 () Bool)

(assert (=> mapNonEmpty!39544 m!981829))

(declare-fun m!981831 () Bool)

(assert (=> b!1063112 m!981831))

(declare-fun m!981833 () Bool)

(assert (=> b!1063107 m!981833))

(check-sat (not b!1063112) (not b!1063108) (not b!1063114) (not b!1063107) tp_is_empty!25245 (not mapNonEmpty!39544) (not b_next!21435) (not start!93998) b_and!34167 (not b!1063109))
(check-sat b_and!34167 (not b_next!21435))
