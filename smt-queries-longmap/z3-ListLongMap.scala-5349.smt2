; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71746 () Bool)

(assert start!71746)

(declare-fun b_free!13501 () Bool)

(declare-fun b_next!13501 () Bool)

(assert (=> start!71746 (= b_free!13501 (not b_next!13501))))

(declare-fun tp!47294 () Bool)

(declare-fun b_and!22569 () Bool)

(assert (=> start!71746 (= tp!47294 b_and!22569)))

(declare-fun mapIsEmpty!24474 () Bool)

(declare-fun mapRes!24474 () Bool)

(assert (=> mapIsEmpty!24474 mapRes!24474))

(declare-fun b!832659 () Bool)

(declare-fun res!566402 () Bool)

(declare-fun e!464420 () Bool)

(assert (=> b!832659 (=> (not res!566402) (not e!464420))))

(declare-datatypes ((array!46601 0))(
  ( (array!46602 (arr!22331 (Array (_ BitVec 32) (_ BitVec 64))) (size!22751 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46601)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46601 (_ BitVec 32)) Bool)

(assert (=> b!832659 (= res!566402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!832660 () Bool)

(declare-fun e!464419 () Bool)

(declare-fun tp_is_empty!15211 () Bool)

(assert (=> b!832660 (= e!464419 tp_is_empty!15211)))

(declare-fun b!832662 () Bool)

(declare-fun e!464417 () Bool)

(assert (=> b!832662 (= e!464417 tp_is_empty!15211)))

(declare-fun b!832663 () Bool)

(declare-fun e!464421 () Bool)

(assert (=> b!832663 (= e!464421 (and e!464417 mapRes!24474))))

(declare-fun condMapEmpty!24474 () Bool)

(declare-datatypes ((V!25283 0))(
  ( (V!25284 (val!7653 Int)) )
))
(declare-datatypes ((ValueCell!7190 0))(
  ( (ValueCellFull!7190 (v!10098 V!25283)) (EmptyCell!7190) )
))
(declare-datatypes ((array!46603 0))(
  ( (array!46604 (arr!22332 (Array (_ BitVec 32) ValueCell!7190)) (size!22752 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46603)

(declare-fun mapDefault!24474 () ValueCell!7190)

(assert (=> b!832663 (= condMapEmpty!24474 (= (arr!22332 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7190)) mapDefault!24474)))))

(declare-datatypes ((tuple2!10082 0))(
  ( (tuple2!10083 (_1!5052 (_ BitVec 64)) (_2!5052 V!25283)) )
))
(declare-datatypes ((List!15852 0))(
  ( (Nil!15849) (Cons!15848 (h!16984 tuple2!10082) (t!22212 List!15852)) )
))
(declare-datatypes ((ListLongMap!8907 0))(
  ( (ListLongMap!8908 (toList!4469 List!15852)) )
))
(declare-fun lt!377760 () ListLongMap!8907)

(declare-fun e!464418 () Bool)

(declare-fun lt!377761 () tuple2!10082)

(declare-fun lt!377756 () tuple2!10082)

(declare-fun lt!377755 () ListLongMap!8907)

(declare-fun b!832664 () Bool)

(declare-fun +!1991 (ListLongMap!8907 tuple2!10082) ListLongMap!8907)

(assert (=> b!832664 (= e!464418 (= lt!377755 (+!1991 (+!1991 lt!377760 lt!377756) lt!377761)))))

(declare-fun b!832665 () Bool)

(declare-fun e!464422 () Bool)

(assert (=> b!832665 (= e!464420 (not e!464422))))

(declare-fun res!566400 () Bool)

(assert (=> b!832665 (=> res!566400 e!464422)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!832665 (= res!566400 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!377759 () ListLongMap!8907)

(assert (=> b!832665 (= lt!377760 lt!377759)))

(declare-datatypes ((Unit!28510 0))(
  ( (Unit!28511) )
))
(declare-fun lt!377758 () Unit!28510)

(declare-fun zeroValueBefore!34 () V!25283)

(declare-fun zeroValueAfter!34 () V!25283)

(declare-fun minValue!754 () V!25283)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!606 (array!46601 array!46603 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25283 V!25283 V!25283 V!25283 (_ BitVec 32) Int) Unit!28510)

(assert (=> b!832665 (= lt!377758 (lemmaNoChangeToArrayThenSameMapNoExtras!606 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2539 (array!46601 array!46603 (_ BitVec 32) (_ BitVec 32) V!25283 V!25283 (_ BitVec 32) Int) ListLongMap!8907)

(assert (=> b!832665 (= lt!377759 (getCurrentListMapNoExtraKeys!2539 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!832665 (= lt!377760 (getCurrentListMapNoExtraKeys!2539 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!832666 () Bool)

(declare-fun res!566406 () Bool)

(assert (=> b!832666 (=> (not res!566406) (not e!464420))))

(declare-datatypes ((List!15853 0))(
  ( (Nil!15850) (Cons!15849 (h!16985 (_ BitVec 64)) (t!22213 List!15853)) )
))
(declare-fun arrayNoDuplicates!0 (array!46601 (_ BitVec 32) List!15853) Bool)

(assert (=> b!832666 (= res!566406 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15850))))

(declare-fun mapNonEmpty!24474 () Bool)

(declare-fun tp!47295 () Bool)

(assert (=> mapNonEmpty!24474 (= mapRes!24474 (and tp!47295 e!464419))))

(declare-fun mapRest!24474 () (Array (_ BitVec 32) ValueCell!7190))

(declare-fun mapKey!24474 () (_ BitVec 32))

(declare-fun mapValue!24474 () ValueCell!7190)

(assert (=> mapNonEmpty!24474 (= (arr!22332 _values!788) (store mapRest!24474 mapKey!24474 mapValue!24474))))

(declare-fun b!832667 () Bool)

(declare-fun res!566401 () Bool)

(assert (=> b!832667 (=> (not res!566401) (not e!464418))))

(declare-fun lt!377757 () ListLongMap!8907)

(assert (=> b!832667 (= res!566401 (= lt!377757 (+!1991 (+!1991 lt!377759 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!377756)))))

(declare-fun b!832668 () Bool)

(declare-fun res!566404 () Bool)

(assert (=> b!832668 (=> (not res!566404) (not e!464420))))

(assert (=> b!832668 (= res!566404 (and (= (size!22752 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22751 _keys!976) (size!22752 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!566403 () Bool)

(assert (=> start!71746 (=> (not res!566403) (not e!464420))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71746 (= res!566403 (validMask!0 mask!1312))))

(assert (=> start!71746 e!464420))

(assert (=> start!71746 tp_is_empty!15211))

(declare-fun array_inv!17827 (array!46601) Bool)

(assert (=> start!71746 (array_inv!17827 _keys!976)))

(assert (=> start!71746 true))

(declare-fun array_inv!17828 (array!46603) Bool)

(assert (=> start!71746 (and (array_inv!17828 _values!788) e!464421)))

(assert (=> start!71746 tp!47294))

(declare-fun b!832661 () Bool)

(assert (=> b!832661 (= e!464422 (= lt!377757 (+!1991 (+!1991 lt!377759 lt!377756) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> b!832661 e!464418))

(declare-fun res!566405 () Bool)

(assert (=> b!832661 (=> (not res!566405) (not e!464418))))

(assert (=> b!832661 (= res!566405 (= lt!377755 (+!1991 (+!1991 lt!377760 lt!377761) lt!377756)))))

(assert (=> b!832661 (= lt!377756 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!832661 (= lt!377761 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2561 (array!46601 array!46603 (_ BitVec 32) (_ BitVec 32) V!25283 V!25283 (_ BitVec 32) Int) ListLongMap!8907)

(assert (=> b!832661 (= lt!377757 (getCurrentListMap!2561 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!832661 (= lt!377755 (getCurrentListMap!2561 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!71746 res!566403) b!832668))

(assert (= (and b!832668 res!566404) b!832659))

(assert (= (and b!832659 res!566402) b!832666))

(assert (= (and b!832666 res!566406) b!832665))

(assert (= (and b!832665 (not res!566400)) b!832661))

(assert (= (and b!832661 res!566405) b!832667))

(assert (= (and b!832667 res!566401) b!832664))

(assert (= (and b!832663 condMapEmpty!24474) mapIsEmpty!24474))

(assert (= (and b!832663 (not condMapEmpty!24474)) mapNonEmpty!24474))

(get-info :version)

(assert (= (and mapNonEmpty!24474 ((_ is ValueCellFull!7190) mapValue!24474)) b!832660))

(assert (= (and b!832663 ((_ is ValueCellFull!7190) mapDefault!24474)) b!832662))

(assert (= start!71746 b!832663))

(declare-fun m!776931 () Bool)

(assert (=> start!71746 m!776931))

(declare-fun m!776933 () Bool)

(assert (=> start!71746 m!776933))

(declare-fun m!776935 () Bool)

(assert (=> start!71746 m!776935))

(declare-fun m!776937 () Bool)

(assert (=> b!832664 m!776937))

(assert (=> b!832664 m!776937))

(declare-fun m!776939 () Bool)

(assert (=> b!832664 m!776939))

(declare-fun m!776941 () Bool)

(assert (=> b!832666 m!776941))

(declare-fun m!776943 () Bool)

(assert (=> b!832667 m!776943))

(assert (=> b!832667 m!776943))

(declare-fun m!776945 () Bool)

(assert (=> b!832667 m!776945))

(declare-fun m!776947 () Bool)

(assert (=> b!832659 m!776947))

(declare-fun m!776949 () Bool)

(assert (=> b!832661 m!776949))

(declare-fun m!776951 () Bool)

(assert (=> b!832661 m!776951))

(assert (=> b!832661 m!776949))

(declare-fun m!776953 () Bool)

(assert (=> b!832661 m!776953))

(declare-fun m!776955 () Bool)

(assert (=> b!832661 m!776955))

(assert (=> b!832661 m!776953))

(declare-fun m!776957 () Bool)

(assert (=> b!832661 m!776957))

(declare-fun m!776959 () Bool)

(assert (=> b!832661 m!776959))

(declare-fun m!776961 () Bool)

(assert (=> mapNonEmpty!24474 m!776961))

(declare-fun m!776963 () Bool)

(assert (=> b!832665 m!776963))

(declare-fun m!776965 () Bool)

(assert (=> b!832665 m!776965))

(declare-fun m!776967 () Bool)

(assert (=> b!832665 m!776967))

(check-sat (not start!71746) (not b!832666) tp_is_empty!15211 (not b!832661) (not mapNonEmpty!24474) b_and!22569 (not b!832664) (not b!832659) (not b!832667) (not b_next!13501) (not b!832665))
(check-sat b_and!22569 (not b_next!13501))
(get-model)

(declare-fun d!106617 () Bool)

(declare-fun e!464467 () Bool)

(assert (=> d!106617 e!464467))

(declare-fun res!566454 () Bool)

(assert (=> d!106617 (=> (not res!566454) (not e!464467))))

(declare-fun lt!377815 () ListLongMap!8907)

(declare-fun contains!4189 (ListLongMap!8907 (_ BitVec 64)) Bool)

(assert (=> d!106617 (= res!566454 (contains!4189 lt!377815 (_1!5052 lt!377756)))))

(declare-fun lt!377814 () List!15852)

(assert (=> d!106617 (= lt!377815 (ListLongMap!8908 lt!377814))))

(declare-fun lt!377812 () Unit!28510)

(declare-fun lt!377813 () Unit!28510)

(assert (=> d!106617 (= lt!377812 lt!377813)))

(declare-datatypes ((Option!423 0))(
  ( (Some!422 (v!10101 V!25283)) (None!421) )
))
(declare-fun getValueByKey!417 (List!15852 (_ BitVec 64)) Option!423)

(assert (=> d!106617 (= (getValueByKey!417 lt!377814 (_1!5052 lt!377756)) (Some!422 (_2!5052 lt!377756)))))

(declare-fun lemmaContainsTupThenGetReturnValue!231 (List!15852 (_ BitVec 64) V!25283) Unit!28510)

(assert (=> d!106617 (= lt!377813 (lemmaContainsTupThenGetReturnValue!231 lt!377814 (_1!5052 lt!377756) (_2!5052 lt!377756)))))

(declare-fun insertStrictlySorted!270 (List!15852 (_ BitVec 64) V!25283) List!15852)

(assert (=> d!106617 (= lt!377814 (insertStrictlySorted!270 (toList!4469 (+!1991 lt!377759 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (_1!5052 lt!377756) (_2!5052 lt!377756)))))

(assert (=> d!106617 (= (+!1991 (+!1991 lt!377759 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!377756) lt!377815)))

(declare-fun b!832733 () Bool)

(declare-fun res!566453 () Bool)

(assert (=> b!832733 (=> (not res!566453) (not e!464467))))

(assert (=> b!832733 (= res!566453 (= (getValueByKey!417 (toList!4469 lt!377815) (_1!5052 lt!377756)) (Some!422 (_2!5052 lt!377756))))))

(declare-fun b!832734 () Bool)

(declare-fun contains!4190 (List!15852 tuple2!10082) Bool)

(assert (=> b!832734 (= e!464467 (contains!4190 (toList!4469 lt!377815) lt!377756))))

(assert (= (and d!106617 res!566454) b!832733))

(assert (= (and b!832733 res!566453) b!832734))

(declare-fun m!777045 () Bool)

(assert (=> d!106617 m!777045))

(declare-fun m!777047 () Bool)

(assert (=> d!106617 m!777047))

(declare-fun m!777049 () Bool)

(assert (=> d!106617 m!777049))

(declare-fun m!777051 () Bool)

(assert (=> d!106617 m!777051))

(declare-fun m!777053 () Bool)

(assert (=> b!832733 m!777053))

(declare-fun m!777055 () Bool)

(assert (=> b!832734 m!777055))

(assert (=> b!832667 d!106617))

(declare-fun d!106619 () Bool)

(declare-fun e!464468 () Bool)

(assert (=> d!106619 e!464468))

(declare-fun res!566456 () Bool)

(assert (=> d!106619 (=> (not res!566456) (not e!464468))))

(declare-fun lt!377819 () ListLongMap!8907)

(assert (=> d!106619 (= res!566456 (contains!4189 lt!377819 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!377818 () List!15852)

(assert (=> d!106619 (= lt!377819 (ListLongMap!8908 lt!377818))))

(declare-fun lt!377816 () Unit!28510)

(declare-fun lt!377817 () Unit!28510)

(assert (=> d!106619 (= lt!377816 lt!377817)))

(assert (=> d!106619 (= (getValueByKey!417 lt!377818 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!422 (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!106619 (= lt!377817 (lemmaContainsTupThenGetReturnValue!231 lt!377818 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!106619 (= lt!377818 (insertStrictlySorted!270 (toList!4469 lt!377759) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!106619 (= (+!1991 lt!377759 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!377819)))

(declare-fun b!832735 () Bool)

(declare-fun res!566455 () Bool)

(assert (=> b!832735 (=> (not res!566455) (not e!464468))))

(assert (=> b!832735 (= res!566455 (= (getValueByKey!417 (toList!4469 lt!377819) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!422 (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!832736 () Bool)

(assert (=> b!832736 (= e!464468 (contains!4190 (toList!4469 lt!377819) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!106619 res!566456) b!832735))

(assert (= (and b!832735 res!566455) b!832736))

(declare-fun m!777057 () Bool)

(assert (=> d!106619 m!777057))

(declare-fun m!777059 () Bool)

(assert (=> d!106619 m!777059))

(declare-fun m!777061 () Bool)

(assert (=> d!106619 m!777061))

(declare-fun m!777063 () Bool)

(assert (=> d!106619 m!777063))

(declare-fun m!777065 () Bool)

(assert (=> b!832735 m!777065))

(declare-fun m!777067 () Bool)

(assert (=> b!832736 m!777067))

(assert (=> b!832667 d!106619))

(declare-fun d!106621 () Bool)

(declare-fun e!464469 () Bool)

(assert (=> d!106621 e!464469))

(declare-fun res!566458 () Bool)

(assert (=> d!106621 (=> (not res!566458) (not e!464469))))

(declare-fun lt!377823 () ListLongMap!8907)

(assert (=> d!106621 (= res!566458 (contains!4189 lt!377823 (_1!5052 lt!377761)))))

(declare-fun lt!377822 () List!15852)

(assert (=> d!106621 (= lt!377823 (ListLongMap!8908 lt!377822))))

(declare-fun lt!377820 () Unit!28510)

(declare-fun lt!377821 () Unit!28510)

(assert (=> d!106621 (= lt!377820 lt!377821)))

(assert (=> d!106621 (= (getValueByKey!417 lt!377822 (_1!5052 lt!377761)) (Some!422 (_2!5052 lt!377761)))))

(assert (=> d!106621 (= lt!377821 (lemmaContainsTupThenGetReturnValue!231 lt!377822 (_1!5052 lt!377761) (_2!5052 lt!377761)))))

(assert (=> d!106621 (= lt!377822 (insertStrictlySorted!270 (toList!4469 (+!1991 lt!377760 lt!377756)) (_1!5052 lt!377761) (_2!5052 lt!377761)))))

(assert (=> d!106621 (= (+!1991 (+!1991 lt!377760 lt!377756) lt!377761) lt!377823)))

(declare-fun b!832737 () Bool)

(declare-fun res!566457 () Bool)

(assert (=> b!832737 (=> (not res!566457) (not e!464469))))

(assert (=> b!832737 (= res!566457 (= (getValueByKey!417 (toList!4469 lt!377823) (_1!5052 lt!377761)) (Some!422 (_2!5052 lt!377761))))))

(declare-fun b!832738 () Bool)

(assert (=> b!832738 (= e!464469 (contains!4190 (toList!4469 lt!377823) lt!377761))))

(assert (= (and d!106621 res!566458) b!832737))

(assert (= (and b!832737 res!566457) b!832738))

(declare-fun m!777069 () Bool)

(assert (=> d!106621 m!777069))

(declare-fun m!777071 () Bool)

(assert (=> d!106621 m!777071))

(declare-fun m!777073 () Bool)

(assert (=> d!106621 m!777073))

(declare-fun m!777075 () Bool)

(assert (=> d!106621 m!777075))

(declare-fun m!777077 () Bool)

(assert (=> b!832737 m!777077))

(declare-fun m!777079 () Bool)

(assert (=> b!832738 m!777079))

(assert (=> b!832664 d!106621))

(declare-fun d!106623 () Bool)

(declare-fun e!464470 () Bool)

(assert (=> d!106623 e!464470))

(declare-fun res!566460 () Bool)

(assert (=> d!106623 (=> (not res!566460) (not e!464470))))

(declare-fun lt!377827 () ListLongMap!8907)

(assert (=> d!106623 (= res!566460 (contains!4189 lt!377827 (_1!5052 lt!377756)))))

(declare-fun lt!377826 () List!15852)

(assert (=> d!106623 (= lt!377827 (ListLongMap!8908 lt!377826))))

(declare-fun lt!377824 () Unit!28510)

(declare-fun lt!377825 () Unit!28510)

(assert (=> d!106623 (= lt!377824 lt!377825)))

(assert (=> d!106623 (= (getValueByKey!417 lt!377826 (_1!5052 lt!377756)) (Some!422 (_2!5052 lt!377756)))))

(assert (=> d!106623 (= lt!377825 (lemmaContainsTupThenGetReturnValue!231 lt!377826 (_1!5052 lt!377756) (_2!5052 lt!377756)))))

(assert (=> d!106623 (= lt!377826 (insertStrictlySorted!270 (toList!4469 lt!377760) (_1!5052 lt!377756) (_2!5052 lt!377756)))))

(assert (=> d!106623 (= (+!1991 lt!377760 lt!377756) lt!377827)))

(declare-fun b!832739 () Bool)

(declare-fun res!566459 () Bool)

(assert (=> b!832739 (=> (not res!566459) (not e!464470))))

(assert (=> b!832739 (= res!566459 (= (getValueByKey!417 (toList!4469 lt!377827) (_1!5052 lt!377756)) (Some!422 (_2!5052 lt!377756))))))

(declare-fun b!832740 () Bool)

(assert (=> b!832740 (= e!464470 (contains!4190 (toList!4469 lt!377827) lt!377756))))

(assert (= (and d!106623 res!566460) b!832739))

(assert (= (and b!832739 res!566459) b!832740))

(declare-fun m!777081 () Bool)

(assert (=> d!106623 m!777081))

(declare-fun m!777083 () Bool)

(assert (=> d!106623 m!777083))

(declare-fun m!777085 () Bool)

(assert (=> d!106623 m!777085))

(declare-fun m!777087 () Bool)

(assert (=> d!106623 m!777087))

(declare-fun m!777089 () Bool)

(assert (=> b!832739 m!777089))

(declare-fun m!777091 () Bool)

(assert (=> b!832740 m!777091))

(assert (=> b!832664 d!106623))

(declare-fun d!106625 () Bool)

(declare-fun res!566465 () Bool)

(declare-fun e!464477 () Bool)

(assert (=> d!106625 (=> res!566465 e!464477)))

(assert (=> d!106625 (= res!566465 (bvsge #b00000000000000000000000000000000 (size!22751 _keys!976)))))

(assert (=> d!106625 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!464477)))

(declare-fun b!832749 () Bool)

(declare-fun e!464479 () Bool)

(declare-fun e!464478 () Bool)

(assert (=> b!832749 (= e!464479 e!464478)))

(declare-fun lt!377836 () (_ BitVec 64))

(assert (=> b!832749 (= lt!377836 (select (arr!22331 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!377835 () Unit!28510)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46601 (_ BitVec 64) (_ BitVec 32)) Unit!28510)

(assert (=> b!832749 (= lt!377835 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!377836 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46601 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!832749 (arrayContainsKey!0 _keys!976 lt!377836 #b00000000000000000000000000000000)))

(declare-fun lt!377834 () Unit!28510)

(assert (=> b!832749 (= lt!377834 lt!377835)))

(declare-fun res!566466 () Bool)

(declare-datatypes ((SeekEntryResult!8696 0))(
  ( (MissingZero!8696 (index!37155 (_ BitVec 32))) (Found!8696 (index!37156 (_ BitVec 32))) (Intermediate!8696 (undefined!9508 Bool) (index!37157 (_ BitVec 32)) (x!70105 (_ BitVec 32))) (Undefined!8696) (MissingVacant!8696 (index!37158 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46601 (_ BitVec 32)) SeekEntryResult!8696)

(assert (=> b!832749 (= res!566466 (= (seekEntryOrOpen!0 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8696 #b00000000000000000000000000000000)))))

(assert (=> b!832749 (=> (not res!566466) (not e!464478))))

(declare-fun b!832750 () Bool)

(declare-fun call!36406 () Bool)

(assert (=> b!832750 (= e!464479 call!36406)))

(declare-fun b!832751 () Bool)

(assert (=> b!832751 (= e!464477 e!464479)))

(declare-fun c!90604 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!832751 (= c!90604 (validKeyInArray!0 (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!832752 () Bool)

(assert (=> b!832752 (= e!464478 call!36406)))

(declare-fun bm!36403 () Bool)

(assert (=> bm!36403 (= call!36406 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(assert (= (and d!106625 (not res!566465)) b!832751))

(assert (= (and b!832751 c!90604) b!832749))

(assert (= (and b!832751 (not c!90604)) b!832750))

(assert (= (and b!832749 res!566466) b!832752))

(assert (= (or b!832752 b!832750) bm!36403))

(declare-fun m!777093 () Bool)

(assert (=> b!832749 m!777093))

(declare-fun m!777095 () Bool)

(assert (=> b!832749 m!777095))

(declare-fun m!777097 () Bool)

(assert (=> b!832749 m!777097))

(assert (=> b!832749 m!777093))

(declare-fun m!777099 () Bool)

(assert (=> b!832749 m!777099))

(assert (=> b!832751 m!777093))

(assert (=> b!832751 m!777093))

(declare-fun m!777101 () Bool)

(assert (=> b!832751 m!777101))

(declare-fun m!777103 () Bool)

(assert (=> bm!36403 m!777103))

(assert (=> b!832659 d!106625))

(declare-fun d!106627 () Bool)

(assert (=> d!106627 (= (getCurrentListMapNoExtraKeys!2539 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2539 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!377839 () Unit!28510)

(declare-fun choose!1428 (array!46601 array!46603 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25283 V!25283 V!25283 V!25283 (_ BitVec 32) Int) Unit!28510)

(assert (=> d!106627 (= lt!377839 (choose!1428 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!106627 (validMask!0 mask!1312)))

(assert (=> d!106627 (= (lemmaNoChangeToArrayThenSameMapNoExtras!606 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!377839)))

(declare-fun bs!23272 () Bool)

(assert (= bs!23272 d!106627))

(assert (=> bs!23272 m!776967))

(assert (=> bs!23272 m!776965))

(declare-fun m!777105 () Bool)

(assert (=> bs!23272 m!777105))

(assert (=> bs!23272 m!776931))

(assert (=> b!832665 d!106627))

(declare-fun b!832777 () Bool)

(declare-fun e!464495 () Bool)

(declare-fun e!464500 () Bool)

(assert (=> b!832777 (= e!464495 e!464500)))

(assert (=> b!832777 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22751 _keys!976)))))

(declare-fun res!566476 () Bool)

(declare-fun lt!377854 () ListLongMap!8907)

(assert (=> b!832777 (= res!566476 (contains!4189 lt!377854 (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!832777 (=> (not res!566476) (not e!464500))))

(declare-fun b!832778 () Bool)

(declare-fun e!464498 () Bool)

(declare-fun isEmpty!663 (ListLongMap!8907) Bool)

(assert (=> b!832778 (= e!464498 (isEmpty!663 lt!377854))))

(declare-fun b!832779 () Bool)

(declare-fun e!464496 () ListLongMap!8907)

(declare-fun e!464497 () ListLongMap!8907)

(assert (=> b!832779 (= e!464496 e!464497)))

(declare-fun c!90614 () Bool)

(assert (=> b!832779 (= c!90614 (validKeyInArray!0 (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!832780 () Bool)

(assert (=> b!832780 (= e!464498 (= lt!377854 (getCurrentListMapNoExtraKeys!2539 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun bm!36406 () Bool)

(declare-fun call!36409 () ListLongMap!8907)

(assert (=> bm!36406 (= call!36409 (getCurrentListMapNoExtraKeys!2539 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!832781 () Bool)

(declare-fun e!464494 () Bool)

(assert (=> b!832781 (= e!464494 e!464495)))

(declare-fun c!90615 () Bool)

(declare-fun e!464499 () Bool)

(assert (=> b!832781 (= c!90615 e!464499)))

(declare-fun res!566475 () Bool)

(assert (=> b!832781 (=> (not res!566475) (not e!464499))))

(assert (=> b!832781 (= res!566475 (bvslt #b00000000000000000000000000000000 (size!22751 _keys!976)))))

(declare-fun b!832782 () Bool)

(assert (=> b!832782 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22751 _keys!976)))))

(assert (=> b!832782 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22752 _values!788)))))

(declare-fun apply!373 (ListLongMap!8907 (_ BitVec 64)) V!25283)

(declare-fun get!11826 (ValueCell!7190 V!25283) V!25283)

(declare-fun dynLambda!981 (Int (_ BitVec 64)) V!25283)

(assert (=> b!832782 (= e!464500 (= (apply!373 lt!377854 (select (arr!22331 _keys!976) #b00000000000000000000000000000000)) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!106629 () Bool)

(assert (=> d!106629 e!464494))

(declare-fun res!566477 () Bool)

(assert (=> d!106629 (=> (not res!566477) (not e!464494))))

(assert (=> d!106629 (= res!566477 (not (contains!4189 lt!377854 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106629 (= lt!377854 e!464496)))

(declare-fun c!90613 () Bool)

(assert (=> d!106629 (= c!90613 (bvsge #b00000000000000000000000000000000 (size!22751 _keys!976)))))

(assert (=> d!106629 (validMask!0 mask!1312)))

(assert (=> d!106629 (= (getCurrentListMapNoExtraKeys!2539 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!377854)))

(declare-fun b!832783 () Bool)

(assert (=> b!832783 (= e!464495 e!464498)))

(declare-fun c!90616 () Bool)

(assert (=> b!832783 (= c!90616 (bvslt #b00000000000000000000000000000000 (size!22751 _keys!976)))))

(declare-fun b!832784 () Bool)

(declare-fun res!566478 () Bool)

(assert (=> b!832784 (=> (not res!566478) (not e!464494))))

(assert (=> b!832784 (= res!566478 (not (contains!4189 lt!377854 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!832785 () Bool)

(assert (=> b!832785 (= e!464497 call!36409)))

(declare-fun b!832786 () Bool)

(assert (=> b!832786 (= e!464496 (ListLongMap!8908 Nil!15849))))

(declare-fun b!832787 () Bool)

(declare-fun lt!377859 () Unit!28510)

(declare-fun lt!377855 () Unit!28510)

(assert (=> b!832787 (= lt!377859 lt!377855)))

(declare-fun lt!377860 () V!25283)

(declare-fun lt!377858 () (_ BitVec 64))

(declare-fun lt!377857 () ListLongMap!8907)

(declare-fun lt!377856 () (_ BitVec 64))

(assert (=> b!832787 (not (contains!4189 (+!1991 lt!377857 (tuple2!10083 lt!377856 lt!377860)) lt!377858))))

(declare-fun addStillNotContains!200 (ListLongMap!8907 (_ BitVec 64) V!25283 (_ BitVec 64)) Unit!28510)

(assert (=> b!832787 (= lt!377855 (addStillNotContains!200 lt!377857 lt!377856 lt!377860 lt!377858))))

(assert (=> b!832787 (= lt!377858 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!832787 (= lt!377860 (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!832787 (= lt!377856 (select (arr!22331 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!832787 (= lt!377857 call!36409)))

(assert (=> b!832787 (= e!464497 (+!1991 call!36409 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!832788 () Bool)

(assert (=> b!832788 (= e!464499 (validKeyInArray!0 (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!832788 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!106629 c!90613) b!832786))

(assert (= (and d!106629 (not c!90613)) b!832779))

(assert (= (and b!832779 c!90614) b!832787))

(assert (= (and b!832779 (not c!90614)) b!832785))

(assert (= (or b!832787 b!832785) bm!36406))

(assert (= (and d!106629 res!566477) b!832784))

(assert (= (and b!832784 res!566478) b!832781))

(assert (= (and b!832781 res!566475) b!832788))

(assert (= (and b!832781 c!90615) b!832777))

(assert (= (and b!832781 (not c!90615)) b!832783))

(assert (= (and b!832777 res!566476) b!832782))

(assert (= (and b!832783 c!90616) b!832780))

(assert (= (and b!832783 (not c!90616)) b!832778))

(declare-fun b_lambda!11417 () Bool)

(assert (=> (not b_lambda!11417) (not b!832782)))

(declare-fun t!22218 () Bool)

(declare-fun tb!4219 () Bool)

(assert (=> (and start!71746 (= defaultEntry!796 defaultEntry!796) t!22218) tb!4219))

(declare-fun result!8013 () Bool)

(assert (=> tb!4219 (= result!8013 tp_is_empty!15211)))

(assert (=> b!832782 t!22218))

(declare-fun b_and!22575 () Bool)

(assert (= b_and!22569 (and (=> t!22218 result!8013) b_and!22575)))

(declare-fun b_lambda!11419 () Bool)

(assert (=> (not b_lambda!11419) (not b!832787)))

(assert (=> b!832787 t!22218))

(declare-fun b_and!22577 () Bool)

(assert (= b_and!22575 (and (=> t!22218 result!8013) b_and!22577)))

(assert (=> b!832782 m!777093))

(declare-fun m!777107 () Bool)

(assert (=> b!832782 m!777107))

(declare-fun m!777109 () Bool)

(assert (=> b!832782 m!777109))

(assert (=> b!832782 m!777093))

(declare-fun m!777111 () Bool)

(assert (=> b!832782 m!777111))

(assert (=> b!832782 m!777107))

(assert (=> b!832782 m!777109))

(declare-fun m!777113 () Bool)

(assert (=> b!832782 m!777113))

(assert (=> b!832779 m!777093))

(assert (=> b!832779 m!777093))

(assert (=> b!832779 m!777101))

(assert (=> b!832788 m!777093))

(assert (=> b!832788 m!777093))

(assert (=> b!832788 m!777101))

(declare-fun m!777115 () Bool)

(assert (=> b!832778 m!777115))

(declare-fun m!777117 () Bool)

(assert (=> b!832787 m!777117))

(assert (=> b!832787 m!777093))

(assert (=> b!832787 m!777107))

(assert (=> b!832787 m!777109))

(assert (=> b!832787 m!777117))

(declare-fun m!777119 () Bool)

(assert (=> b!832787 m!777119))

(declare-fun m!777121 () Bool)

(assert (=> b!832787 m!777121))

(declare-fun m!777123 () Bool)

(assert (=> b!832787 m!777123))

(assert (=> b!832787 m!777107))

(assert (=> b!832787 m!777109))

(assert (=> b!832787 m!777113))

(assert (=> b!832777 m!777093))

(assert (=> b!832777 m!777093))

(declare-fun m!777125 () Bool)

(assert (=> b!832777 m!777125))

(declare-fun m!777127 () Bool)

(assert (=> b!832780 m!777127))

(assert (=> bm!36406 m!777127))

(declare-fun m!777129 () Bool)

(assert (=> d!106629 m!777129))

(assert (=> d!106629 m!776931))

(declare-fun m!777131 () Bool)

(assert (=> b!832784 m!777131))

(assert (=> b!832665 d!106629))

(declare-fun b!832791 () Bool)

(declare-fun e!464502 () Bool)

(declare-fun e!464507 () Bool)

(assert (=> b!832791 (= e!464502 e!464507)))

(assert (=> b!832791 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22751 _keys!976)))))

(declare-fun res!566480 () Bool)

(declare-fun lt!377861 () ListLongMap!8907)

(assert (=> b!832791 (= res!566480 (contains!4189 lt!377861 (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!832791 (=> (not res!566480) (not e!464507))))

(declare-fun b!832792 () Bool)

(declare-fun e!464505 () Bool)

(assert (=> b!832792 (= e!464505 (isEmpty!663 lt!377861))))

(declare-fun b!832793 () Bool)

(declare-fun e!464503 () ListLongMap!8907)

(declare-fun e!464504 () ListLongMap!8907)

(assert (=> b!832793 (= e!464503 e!464504)))

(declare-fun c!90618 () Bool)

(assert (=> b!832793 (= c!90618 (validKeyInArray!0 (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!832794 () Bool)

(assert (=> b!832794 (= e!464505 (= lt!377861 (getCurrentListMapNoExtraKeys!2539 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun bm!36407 () Bool)

(declare-fun call!36410 () ListLongMap!8907)

(assert (=> bm!36407 (= call!36410 (getCurrentListMapNoExtraKeys!2539 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!832795 () Bool)

(declare-fun e!464501 () Bool)

(assert (=> b!832795 (= e!464501 e!464502)))

(declare-fun c!90619 () Bool)

(declare-fun e!464506 () Bool)

(assert (=> b!832795 (= c!90619 e!464506)))

(declare-fun res!566479 () Bool)

(assert (=> b!832795 (=> (not res!566479) (not e!464506))))

(assert (=> b!832795 (= res!566479 (bvslt #b00000000000000000000000000000000 (size!22751 _keys!976)))))

(declare-fun b!832796 () Bool)

(assert (=> b!832796 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22751 _keys!976)))))

(assert (=> b!832796 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22752 _values!788)))))

(assert (=> b!832796 (= e!464507 (= (apply!373 lt!377861 (select (arr!22331 _keys!976) #b00000000000000000000000000000000)) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!106631 () Bool)

(assert (=> d!106631 e!464501))

(declare-fun res!566481 () Bool)

(assert (=> d!106631 (=> (not res!566481) (not e!464501))))

(assert (=> d!106631 (= res!566481 (not (contains!4189 lt!377861 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106631 (= lt!377861 e!464503)))

(declare-fun c!90617 () Bool)

(assert (=> d!106631 (= c!90617 (bvsge #b00000000000000000000000000000000 (size!22751 _keys!976)))))

(assert (=> d!106631 (validMask!0 mask!1312)))

(assert (=> d!106631 (= (getCurrentListMapNoExtraKeys!2539 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!377861)))

(declare-fun b!832797 () Bool)

(assert (=> b!832797 (= e!464502 e!464505)))

(declare-fun c!90620 () Bool)

(assert (=> b!832797 (= c!90620 (bvslt #b00000000000000000000000000000000 (size!22751 _keys!976)))))

(declare-fun b!832798 () Bool)

(declare-fun res!566482 () Bool)

(assert (=> b!832798 (=> (not res!566482) (not e!464501))))

(assert (=> b!832798 (= res!566482 (not (contains!4189 lt!377861 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!832799 () Bool)

(assert (=> b!832799 (= e!464504 call!36410)))

(declare-fun b!832800 () Bool)

(assert (=> b!832800 (= e!464503 (ListLongMap!8908 Nil!15849))))

(declare-fun b!832801 () Bool)

(declare-fun lt!377866 () Unit!28510)

(declare-fun lt!377862 () Unit!28510)

(assert (=> b!832801 (= lt!377866 lt!377862)))

(declare-fun lt!377863 () (_ BitVec 64))

(declare-fun lt!377867 () V!25283)

(declare-fun lt!377865 () (_ BitVec 64))

(declare-fun lt!377864 () ListLongMap!8907)

(assert (=> b!832801 (not (contains!4189 (+!1991 lt!377864 (tuple2!10083 lt!377863 lt!377867)) lt!377865))))

(assert (=> b!832801 (= lt!377862 (addStillNotContains!200 lt!377864 lt!377863 lt!377867 lt!377865))))

(assert (=> b!832801 (= lt!377865 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!832801 (= lt!377867 (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!832801 (= lt!377863 (select (arr!22331 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!832801 (= lt!377864 call!36410)))

(assert (=> b!832801 (= e!464504 (+!1991 call!36410 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!832802 () Bool)

(assert (=> b!832802 (= e!464506 (validKeyInArray!0 (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!832802 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!106631 c!90617) b!832800))

(assert (= (and d!106631 (not c!90617)) b!832793))

(assert (= (and b!832793 c!90618) b!832801))

(assert (= (and b!832793 (not c!90618)) b!832799))

(assert (= (or b!832801 b!832799) bm!36407))

(assert (= (and d!106631 res!566481) b!832798))

(assert (= (and b!832798 res!566482) b!832795))

(assert (= (and b!832795 res!566479) b!832802))

(assert (= (and b!832795 c!90619) b!832791))

(assert (= (and b!832795 (not c!90619)) b!832797))

(assert (= (and b!832791 res!566480) b!832796))

(assert (= (and b!832797 c!90620) b!832794))

(assert (= (and b!832797 (not c!90620)) b!832792))

(declare-fun b_lambda!11421 () Bool)

(assert (=> (not b_lambda!11421) (not b!832796)))

(assert (=> b!832796 t!22218))

(declare-fun b_and!22579 () Bool)

(assert (= b_and!22577 (and (=> t!22218 result!8013) b_and!22579)))

(declare-fun b_lambda!11423 () Bool)

(assert (=> (not b_lambda!11423) (not b!832801)))

(assert (=> b!832801 t!22218))

(declare-fun b_and!22581 () Bool)

(assert (= b_and!22579 (and (=> t!22218 result!8013) b_and!22581)))

(assert (=> b!832796 m!777093))

(assert (=> b!832796 m!777107))

(assert (=> b!832796 m!777109))

(assert (=> b!832796 m!777093))

(declare-fun m!777133 () Bool)

(assert (=> b!832796 m!777133))

(assert (=> b!832796 m!777107))

(assert (=> b!832796 m!777109))

(assert (=> b!832796 m!777113))

(assert (=> b!832793 m!777093))

(assert (=> b!832793 m!777093))

(assert (=> b!832793 m!777101))

(assert (=> b!832802 m!777093))

(assert (=> b!832802 m!777093))

(assert (=> b!832802 m!777101))

(declare-fun m!777135 () Bool)

(assert (=> b!832792 m!777135))

(declare-fun m!777137 () Bool)

(assert (=> b!832801 m!777137))

(assert (=> b!832801 m!777093))

(assert (=> b!832801 m!777107))

(assert (=> b!832801 m!777109))

(assert (=> b!832801 m!777137))

(declare-fun m!777139 () Bool)

(assert (=> b!832801 m!777139))

(declare-fun m!777141 () Bool)

(assert (=> b!832801 m!777141))

(declare-fun m!777143 () Bool)

(assert (=> b!832801 m!777143))

(assert (=> b!832801 m!777107))

(assert (=> b!832801 m!777109))

(assert (=> b!832801 m!777113))

(assert (=> b!832791 m!777093))

(assert (=> b!832791 m!777093))

(declare-fun m!777145 () Bool)

(assert (=> b!832791 m!777145))

(declare-fun m!777147 () Bool)

(assert (=> b!832794 m!777147))

(assert (=> bm!36407 m!777147))

(declare-fun m!777149 () Bool)

(assert (=> d!106631 m!777149))

(assert (=> d!106631 m!776931))

(declare-fun m!777151 () Bool)

(assert (=> b!832798 m!777151))

(assert (=> b!832665 d!106631))

(declare-fun d!106633 () Bool)

(assert (=> d!106633 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!71746 d!106633))

(declare-fun d!106635 () Bool)

(assert (=> d!106635 (= (array_inv!17827 _keys!976) (bvsge (size!22751 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!71746 d!106635))

(declare-fun d!106637 () Bool)

(assert (=> d!106637 (= (array_inv!17828 _values!788) (bvsge (size!22752 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!71746 d!106637))

(declare-fun b!832813 () Bool)

(declare-fun e!464516 () Bool)

(declare-fun contains!4191 (List!15853 (_ BitVec 64)) Bool)

(assert (=> b!832813 (= e!464516 (contains!4191 Nil!15850 (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!832814 () Bool)

(declare-fun e!464517 () Bool)

(declare-fun call!36413 () Bool)

(assert (=> b!832814 (= e!464517 call!36413)))

(declare-fun b!832815 () Bool)

(declare-fun e!464519 () Bool)

(declare-fun e!464518 () Bool)

(assert (=> b!832815 (= e!464519 e!464518)))

(declare-fun res!566491 () Bool)

(assert (=> b!832815 (=> (not res!566491) (not e!464518))))

(assert (=> b!832815 (= res!566491 (not e!464516))))

(declare-fun res!566489 () Bool)

(assert (=> b!832815 (=> (not res!566489) (not e!464516))))

(assert (=> b!832815 (= res!566489 (validKeyInArray!0 (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!832816 () Bool)

(assert (=> b!832816 (= e!464518 e!464517)))

(declare-fun c!90623 () Bool)

(assert (=> b!832816 (= c!90623 (validKeyInArray!0 (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!832817 () Bool)

(assert (=> b!832817 (= e!464517 call!36413)))

(declare-fun bm!36410 () Bool)

(assert (=> bm!36410 (= call!36413 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!90623 (Cons!15849 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) Nil!15850) Nil!15850)))))

(declare-fun d!106639 () Bool)

(declare-fun res!566490 () Bool)

(assert (=> d!106639 (=> res!566490 e!464519)))

(assert (=> d!106639 (= res!566490 (bvsge #b00000000000000000000000000000000 (size!22751 _keys!976)))))

(assert (=> d!106639 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15850) e!464519)))

(assert (= (and d!106639 (not res!566490)) b!832815))

(assert (= (and b!832815 res!566489) b!832813))

(assert (= (and b!832815 res!566491) b!832816))

(assert (= (and b!832816 c!90623) b!832814))

(assert (= (and b!832816 (not c!90623)) b!832817))

(assert (= (or b!832814 b!832817) bm!36410))

(assert (=> b!832813 m!777093))

(assert (=> b!832813 m!777093))

(declare-fun m!777153 () Bool)

(assert (=> b!832813 m!777153))

(assert (=> b!832815 m!777093))

(assert (=> b!832815 m!777093))

(assert (=> b!832815 m!777101))

(assert (=> b!832816 m!777093))

(assert (=> b!832816 m!777093))

(assert (=> b!832816 m!777101))

(assert (=> bm!36410 m!777093))

(declare-fun m!777155 () Bool)

(assert (=> bm!36410 m!777155))

(assert (=> b!832666 d!106639))

(declare-fun d!106641 () Bool)

(declare-fun e!464520 () Bool)

(assert (=> d!106641 e!464520))

(declare-fun res!566493 () Bool)

(assert (=> d!106641 (=> (not res!566493) (not e!464520))))

(declare-fun lt!377871 () ListLongMap!8907)

(assert (=> d!106641 (= res!566493 (contains!4189 lt!377871 (_1!5052 lt!377761)))))

(declare-fun lt!377870 () List!15852)

(assert (=> d!106641 (= lt!377871 (ListLongMap!8908 lt!377870))))

(declare-fun lt!377868 () Unit!28510)

(declare-fun lt!377869 () Unit!28510)

(assert (=> d!106641 (= lt!377868 lt!377869)))

(assert (=> d!106641 (= (getValueByKey!417 lt!377870 (_1!5052 lt!377761)) (Some!422 (_2!5052 lt!377761)))))

(assert (=> d!106641 (= lt!377869 (lemmaContainsTupThenGetReturnValue!231 lt!377870 (_1!5052 lt!377761) (_2!5052 lt!377761)))))

(assert (=> d!106641 (= lt!377870 (insertStrictlySorted!270 (toList!4469 lt!377760) (_1!5052 lt!377761) (_2!5052 lt!377761)))))

(assert (=> d!106641 (= (+!1991 lt!377760 lt!377761) lt!377871)))

(declare-fun b!832818 () Bool)

(declare-fun res!566492 () Bool)

(assert (=> b!832818 (=> (not res!566492) (not e!464520))))

(assert (=> b!832818 (= res!566492 (= (getValueByKey!417 (toList!4469 lt!377871) (_1!5052 lt!377761)) (Some!422 (_2!5052 lt!377761))))))

(declare-fun b!832819 () Bool)

(assert (=> b!832819 (= e!464520 (contains!4190 (toList!4469 lt!377871) lt!377761))))

(assert (= (and d!106641 res!566493) b!832818))

(assert (= (and b!832818 res!566492) b!832819))

(declare-fun m!777157 () Bool)

(assert (=> d!106641 m!777157))

(declare-fun m!777159 () Bool)

(assert (=> d!106641 m!777159))

(declare-fun m!777161 () Bool)

(assert (=> d!106641 m!777161))

(declare-fun m!777163 () Bool)

(assert (=> d!106641 m!777163))

(declare-fun m!777165 () Bool)

(assert (=> b!832818 m!777165))

(declare-fun m!777167 () Bool)

(assert (=> b!832819 m!777167))

(assert (=> b!832661 d!106641))

(declare-fun d!106643 () Bool)

(declare-fun e!464521 () Bool)

(assert (=> d!106643 e!464521))

(declare-fun res!566495 () Bool)

(assert (=> d!106643 (=> (not res!566495) (not e!464521))))

(declare-fun lt!377875 () ListLongMap!8907)

(assert (=> d!106643 (= res!566495 (contains!4189 lt!377875 (_1!5052 lt!377756)))))

(declare-fun lt!377874 () List!15852)

(assert (=> d!106643 (= lt!377875 (ListLongMap!8908 lt!377874))))

(declare-fun lt!377872 () Unit!28510)

(declare-fun lt!377873 () Unit!28510)

(assert (=> d!106643 (= lt!377872 lt!377873)))

(assert (=> d!106643 (= (getValueByKey!417 lt!377874 (_1!5052 lt!377756)) (Some!422 (_2!5052 lt!377756)))))

(assert (=> d!106643 (= lt!377873 (lemmaContainsTupThenGetReturnValue!231 lt!377874 (_1!5052 lt!377756) (_2!5052 lt!377756)))))

(assert (=> d!106643 (= lt!377874 (insertStrictlySorted!270 (toList!4469 lt!377759) (_1!5052 lt!377756) (_2!5052 lt!377756)))))

(assert (=> d!106643 (= (+!1991 lt!377759 lt!377756) lt!377875)))

(declare-fun b!832820 () Bool)

(declare-fun res!566494 () Bool)

(assert (=> b!832820 (=> (not res!566494) (not e!464521))))

(assert (=> b!832820 (= res!566494 (= (getValueByKey!417 (toList!4469 lt!377875) (_1!5052 lt!377756)) (Some!422 (_2!5052 lt!377756))))))

(declare-fun b!832821 () Bool)

(assert (=> b!832821 (= e!464521 (contains!4190 (toList!4469 lt!377875) lt!377756))))

(assert (= (and d!106643 res!566495) b!832820))

(assert (= (and b!832820 res!566494) b!832821))

(declare-fun m!777169 () Bool)

(assert (=> d!106643 m!777169))

(declare-fun m!777171 () Bool)

(assert (=> d!106643 m!777171))

(declare-fun m!777173 () Bool)

(assert (=> d!106643 m!777173))

(declare-fun m!777175 () Bool)

(assert (=> d!106643 m!777175))

(declare-fun m!777177 () Bool)

(assert (=> b!832820 m!777177))

(declare-fun m!777179 () Bool)

(assert (=> b!832821 m!777179))

(assert (=> b!832661 d!106643))

(declare-fun b!832864 () Bool)

(declare-fun e!464556 () ListLongMap!8907)

(declare-fun call!36434 () ListLongMap!8907)

(assert (=> b!832864 (= e!464556 (+!1991 call!36434 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!832865 () Bool)

(declare-fun e!464560 () ListLongMap!8907)

(assert (=> b!832865 (= e!464556 e!464560)))

(declare-fun c!90639 () Bool)

(assert (=> b!832865 (= c!90639 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!832866 () Bool)

(declare-fun c!90637 () Bool)

(assert (=> b!832866 (= c!90637 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!464552 () ListLongMap!8907)

(assert (=> b!832866 (= e!464560 e!464552)))

(declare-fun bm!36425 () Bool)

(declare-fun call!36429 () Bool)

(declare-fun lt!377925 () ListLongMap!8907)

(assert (=> bm!36425 (= call!36429 (contains!4189 lt!377925 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!832867 () Bool)

(declare-fun e!464549 () Bool)

(declare-fun e!464555 () Bool)

(assert (=> b!832867 (= e!464549 e!464555)))

(declare-fun res!566515 () Bool)

(assert (=> b!832867 (=> (not res!566515) (not e!464555))))

(assert (=> b!832867 (= res!566515 (contains!4189 lt!377925 (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!832867 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22751 _keys!976)))))

(declare-fun bm!36426 () Bool)

(declare-fun call!36428 () ListLongMap!8907)

(declare-fun call!36430 () ListLongMap!8907)

(assert (=> bm!36426 (= call!36428 call!36430)))

(declare-fun b!832868 () Bool)

(declare-fun e!464558 () Bool)

(assert (=> b!832868 (= e!464558 (validKeyInArray!0 (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!832869 () Bool)

(declare-fun e!464550 () Bool)

(declare-fun call!36432 () Bool)

(assert (=> b!832869 (= e!464550 (not call!36432))))

(declare-fun b!832870 () Bool)

(declare-fun res!566518 () Bool)

(declare-fun e!464554 () Bool)

(assert (=> b!832870 (=> (not res!566518) (not e!464554))))

(assert (=> b!832870 (= res!566518 e!464550)))

(declare-fun c!90638 () Bool)

(assert (=> b!832870 (= c!90638 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!106645 () Bool)

(assert (=> d!106645 e!464554))

(declare-fun res!566521 () Bool)

(assert (=> d!106645 (=> (not res!566521) (not e!464554))))

(assert (=> d!106645 (= res!566521 (or (bvsge #b00000000000000000000000000000000 (size!22751 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22751 _keys!976)))))))

(declare-fun lt!377938 () ListLongMap!8907)

(assert (=> d!106645 (= lt!377925 lt!377938)))

(declare-fun lt!377920 () Unit!28510)

(declare-fun e!464548 () Unit!28510)

(assert (=> d!106645 (= lt!377920 e!464548)))

(declare-fun c!90641 () Bool)

(assert (=> d!106645 (= c!90641 e!464558)))

(declare-fun res!566517 () Bool)

(assert (=> d!106645 (=> (not res!566517) (not e!464558))))

(assert (=> d!106645 (= res!566517 (bvslt #b00000000000000000000000000000000 (size!22751 _keys!976)))))

(assert (=> d!106645 (= lt!377938 e!464556)))

(declare-fun c!90636 () Bool)

(assert (=> d!106645 (= c!90636 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!106645 (validMask!0 mask!1312)))

(assert (=> d!106645 (= (getCurrentListMap!2561 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!377925)))

(declare-fun b!832871 () Bool)

(declare-fun call!36433 () ListLongMap!8907)

(assert (=> b!832871 (= e!464552 call!36433)))

(declare-fun b!832872 () Bool)

(declare-fun e!464557 () Bool)

(assert (=> b!832872 (= e!464557 (not call!36429))))

(declare-fun bm!36427 () Bool)

(assert (=> bm!36427 (= call!36432 (contains!4189 lt!377925 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!832873 () Bool)

(assert (=> b!832873 (= e!464554 e!464557)))

(declare-fun c!90640 () Bool)

(assert (=> b!832873 (= c!90640 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!832874 () Bool)

(declare-fun e!464553 () Bool)

(assert (=> b!832874 (= e!464553 (validKeyInArray!0 (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!36428 () Bool)

(assert (=> bm!36428 (= call!36434 (+!1991 (ite c!90636 call!36430 (ite c!90639 call!36428 call!36433)) (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!832875 () Bool)

(declare-fun call!36431 () ListLongMap!8907)

(assert (=> b!832875 (= e!464560 call!36431)))

(declare-fun b!832876 () Bool)

(declare-fun lt!377927 () Unit!28510)

(assert (=> b!832876 (= e!464548 lt!377927)))

(declare-fun lt!377936 () ListLongMap!8907)

(assert (=> b!832876 (= lt!377936 (getCurrentListMapNoExtraKeys!2539 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!377935 () (_ BitVec 64))

(assert (=> b!832876 (= lt!377935 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!377926 () (_ BitVec 64))

(assert (=> b!832876 (= lt!377926 (select (arr!22331 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!377930 () Unit!28510)

(declare-fun addStillContains!324 (ListLongMap!8907 (_ BitVec 64) V!25283 (_ BitVec 64)) Unit!28510)

(assert (=> b!832876 (= lt!377930 (addStillContains!324 lt!377936 lt!377935 zeroValueBefore!34 lt!377926))))

(assert (=> b!832876 (contains!4189 (+!1991 lt!377936 (tuple2!10083 lt!377935 zeroValueBefore!34)) lt!377926)))

(declare-fun lt!377940 () Unit!28510)

(assert (=> b!832876 (= lt!377940 lt!377930)))

(declare-fun lt!377921 () ListLongMap!8907)

(assert (=> b!832876 (= lt!377921 (getCurrentListMapNoExtraKeys!2539 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!377933 () (_ BitVec 64))

(assert (=> b!832876 (= lt!377933 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!377924 () (_ BitVec 64))

(assert (=> b!832876 (= lt!377924 (select (arr!22331 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!377941 () Unit!28510)

(declare-fun addApplyDifferent!324 (ListLongMap!8907 (_ BitVec 64) V!25283 (_ BitVec 64)) Unit!28510)

(assert (=> b!832876 (= lt!377941 (addApplyDifferent!324 lt!377921 lt!377933 minValue!754 lt!377924))))

(assert (=> b!832876 (= (apply!373 (+!1991 lt!377921 (tuple2!10083 lt!377933 minValue!754)) lt!377924) (apply!373 lt!377921 lt!377924))))

(declare-fun lt!377932 () Unit!28510)

(assert (=> b!832876 (= lt!377932 lt!377941)))

(declare-fun lt!377923 () ListLongMap!8907)

(assert (=> b!832876 (= lt!377923 (getCurrentListMapNoExtraKeys!2539 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!377929 () (_ BitVec 64))

(assert (=> b!832876 (= lt!377929 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!377931 () (_ BitVec 64))

(assert (=> b!832876 (= lt!377931 (select (arr!22331 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!377922 () Unit!28510)

(assert (=> b!832876 (= lt!377922 (addApplyDifferent!324 lt!377923 lt!377929 zeroValueBefore!34 lt!377931))))

(assert (=> b!832876 (= (apply!373 (+!1991 lt!377923 (tuple2!10083 lt!377929 zeroValueBefore!34)) lt!377931) (apply!373 lt!377923 lt!377931))))

(declare-fun lt!377939 () Unit!28510)

(assert (=> b!832876 (= lt!377939 lt!377922)))

(declare-fun lt!377934 () ListLongMap!8907)

(assert (=> b!832876 (= lt!377934 (getCurrentListMapNoExtraKeys!2539 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!377928 () (_ BitVec 64))

(assert (=> b!832876 (= lt!377928 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!377937 () (_ BitVec 64))

(assert (=> b!832876 (= lt!377937 (select (arr!22331 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!832876 (= lt!377927 (addApplyDifferent!324 lt!377934 lt!377928 minValue!754 lt!377937))))

(assert (=> b!832876 (= (apply!373 (+!1991 lt!377934 (tuple2!10083 lt!377928 minValue!754)) lt!377937) (apply!373 lt!377934 lt!377937))))

(declare-fun b!832877 () Bool)

(assert (=> b!832877 (= e!464555 (= (apply!373 lt!377925 (select (arr!22331 _keys!976) #b00000000000000000000000000000000)) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!832877 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22752 _values!788)))))

(assert (=> b!832877 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22751 _keys!976)))))

(declare-fun bm!36429 () Bool)

(assert (=> bm!36429 (= call!36431 call!36434)))

(declare-fun b!832878 () Bool)

(assert (=> b!832878 (= e!464552 call!36431)))

(declare-fun b!832879 () Bool)

(declare-fun e!464551 () Bool)

(assert (=> b!832879 (= e!464557 e!464551)))

(declare-fun res!566514 () Bool)

(assert (=> b!832879 (= res!566514 call!36429)))

(assert (=> b!832879 (=> (not res!566514) (not e!464551))))

(declare-fun b!832880 () Bool)

(declare-fun res!566519 () Bool)

(assert (=> b!832880 (=> (not res!566519) (not e!464554))))

(assert (=> b!832880 (= res!566519 e!464549)))

(declare-fun res!566516 () Bool)

(assert (=> b!832880 (=> res!566516 e!464549)))

(assert (=> b!832880 (= res!566516 (not e!464553))))

(declare-fun res!566520 () Bool)

(assert (=> b!832880 (=> (not res!566520) (not e!464553))))

(assert (=> b!832880 (= res!566520 (bvslt #b00000000000000000000000000000000 (size!22751 _keys!976)))))

(declare-fun b!832881 () Bool)

(declare-fun Unit!28514 () Unit!28510)

(assert (=> b!832881 (= e!464548 Unit!28514)))

(declare-fun bm!36430 () Bool)

(assert (=> bm!36430 (= call!36433 call!36428)))

(declare-fun bm!36431 () Bool)

(assert (=> bm!36431 (= call!36430 (getCurrentListMapNoExtraKeys!2539 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!832882 () Bool)

(declare-fun e!464559 () Bool)

(assert (=> b!832882 (= e!464559 (= (apply!373 lt!377925 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun b!832883 () Bool)

(assert (=> b!832883 (= e!464550 e!464559)))

(declare-fun res!566522 () Bool)

(assert (=> b!832883 (= res!566522 call!36432)))

(assert (=> b!832883 (=> (not res!566522) (not e!464559))))

(declare-fun b!832884 () Bool)

(assert (=> b!832884 (= e!464551 (= (apply!373 lt!377925 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(assert (= (and d!106645 c!90636) b!832864))

(assert (= (and d!106645 (not c!90636)) b!832865))

(assert (= (and b!832865 c!90639) b!832875))

(assert (= (and b!832865 (not c!90639)) b!832866))

(assert (= (and b!832866 c!90637) b!832878))

(assert (= (and b!832866 (not c!90637)) b!832871))

(assert (= (or b!832878 b!832871) bm!36430))

(assert (= (or b!832875 bm!36430) bm!36426))

(assert (= (or b!832875 b!832878) bm!36429))

(assert (= (or b!832864 bm!36426) bm!36431))

(assert (= (or b!832864 bm!36429) bm!36428))

(assert (= (and d!106645 res!566517) b!832868))

(assert (= (and d!106645 c!90641) b!832876))

(assert (= (and d!106645 (not c!90641)) b!832881))

(assert (= (and d!106645 res!566521) b!832880))

(assert (= (and b!832880 res!566520) b!832874))

(assert (= (and b!832880 (not res!566516)) b!832867))

(assert (= (and b!832867 res!566515) b!832877))

(assert (= (and b!832880 res!566519) b!832870))

(assert (= (and b!832870 c!90638) b!832883))

(assert (= (and b!832870 (not c!90638)) b!832869))

(assert (= (and b!832883 res!566522) b!832882))

(assert (= (or b!832883 b!832869) bm!36427))

(assert (= (and b!832870 res!566518) b!832873))

(assert (= (and b!832873 c!90640) b!832879))

(assert (= (and b!832873 (not c!90640)) b!832872))

(assert (= (and b!832879 res!566514) b!832884))

(assert (= (or b!832879 b!832872) bm!36425))

(declare-fun b_lambda!11425 () Bool)

(assert (=> (not b_lambda!11425) (not b!832877)))

(assert (=> b!832877 t!22218))

(declare-fun b_and!22583 () Bool)

(assert (= b_and!22581 (and (=> t!22218 result!8013) b_and!22583)))

(declare-fun m!777181 () Bool)

(assert (=> b!832864 m!777181))

(assert (=> b!832867 m!777093))

(assert (=> b!832867 m!777093))

(declare-fun m!777183 () Bool)

(assert (=> b!832867 m!777183))

(assert (=> d!106645 m!776931))

(assert (=> b!832868 m!777093))

(assert (=> b!832868 m!777093))

(assert (=> b!832868 m!777101))

(declare-fun m!777185 () Bool)

(assert (=> bm!36428 m!777185))

(assert (=> bm!36431 m!776967))

(declare-fun m!777187 () Bool)

(assert (=> bm!36427 m!777187))

(declare-fun m!777189 () Bool)

(assert (=> bm!36425 m!777189))

(declare-fun m!777191 () Bool)

(assert (=> b!832882 m!777191))

(assert (=> b!832877 m!777093))

(assert (=> b!832877 m!777107))

(assert (=> b!832877 m!777107))

(assert (=> b!832877 m!777109))

(assert (=> b!832877 m!777113))

(assert (=> b!832877 m!777093))

(declare-fun m!777193 () Bool)

(assert (=> b!832877 m!777193))

(assert (=> b!832877 m!777109))

(declare-fun m!777195 () Bool)

(assert (=> b!832884 m!777195))

(declare-fun m!777197 () Bool)

(assert (=> b!832876 m!777197))

(declare-fun m!777199 () Bool)

(assert (=> b!832876 m!777199))

(declare-fun m!777201 () Bool)

(assert (=> b!832876 m!777201))

(assert (=> b!832876 m!777093))

(declare-fun m!777203 () Bool)

(assert (=> b!832876 m!777203))

(declare-fun m!777205 () Bool)

(assert (=> b!832876 m!777205))

(declare-fun m!777207 () Bool)

(assert (=> b!832876 m!777207))

(declare-fun m!777209 () Bool)

(assert (=> b!832876 m!777209))

(assert (=> b!832876 m!776967))

(assert (=> b!832876 m!777207))

(declare-fun m!777211 () Bool)

(assert (=> b!832876 m!777211))

(assert (=> b!832876 m!777199))

(declare-fun m!777213 () Bool)

(assert (=> b!832876 m!777213))

(declare-fun m!777215 () Bool)

(assert (=> b!832876 m!777215))

(declare-fun m!777217 () Bool)

(assert (=> b!832876 m!777217))

(declare-fun m!777219 () Bool)

(assert (=> b!832876 m!777219))

(declare-fun m!777221 () Bool)

(assert (=> b!832876 m!777221))

(assert (=> b!832876 m!777203))

(assert (=> b!832876 m!777217))

(declare-fun m!777223 () Bool)

(assert (=> b!832876 m!777223))

(declare-fun m!777225 () Bool)

(assert (=> b!832876 m!777225))

(assert (=> b!832874 m!777093))

(assert (=> b!832874 m!777093))

(assert (=> b!832874 m!777101))

(assert (=> b!832661 d!106645))

(declare-fun b!832885 () Bool)

(declare-fun e!464569 () ListLongMap!8907)

(declare-fun call!36441 () ListLongMap!8907)

(assert (=> b!832885 (= e!464569 (+!1991 call!36441 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!832886 () Bool)

(declare-fun e!464573 () ListLongMap!8907)

(assert (=> b!832886 (= e!464569 e!464573)))

(declare-fun c!90645 () Bool)

(assert (=> b!832886 (= c!90645 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!832887 () Bool)

(declare-fun c!90643 () Bool)

(assert (=> b!832887 (= c!90643 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!464565 () ListLongMap!8907)

(assert (=> b!832887 (= e!464573 e!464565)))

(declare-fun bm!36432 () Bool)

(declare-fun call!36436 () Bool)

(declare-fun lt!377947 () ListLongMap!8907)

(assert (=> bm!36432 (= call!36436 (contains!4189 lt!377947 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!832888 () Bool)

(declare-fun e!464562 () Bool)

(declare-fun e!464568 () Bool)

(assert (=> b!832888 (= e!464562 e!464568)))

(declare-fun res!566524 () Bool)

(assert (=> b!832888 (=> (not res!566524) (not e!464568))))

(assert (=> b!832888 (= res!566524 (contains!4189 lt!377947 (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!832888 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22751 _keys!976)))))

(declare-fun bm!36433 () Bool)

(declare-fun call!36435 () ListLongMap!8907)

(declare-fun call!36437 () ListLongMap!8907)

(assert (=> bm!36433 (= call!36435 call!36437)))

(declare-fun b!832889 () Bool)

(declare-fun e!464571 () Bool)

(assert (=> b!832889 (= e!464571 (validKeyInArray!0 (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!832890 () Bool)

(declare-fun e!464563 () Bool)

(declare-fun call!36439 () Bool)

(assert (=> b!832890 (= e!464563 (not call!36439))))

(declare-fun b!832891 () Bool)

(declare-fun res!566527 () Bool)

(declare-fun e!464567 () Bool)

(assert (=> b!832891 (=> (not res!566527) (not e!464567))))

(assert (=> b!832891 (= res!566527 e!464563)))

(declare-fun c!90644 () Bool)

(assert (=> b!832891 (= c!90644 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!106647 () Bool)

(assert (=> d!106647 e!464567))

(declare-fun res!566530 () Bool)

(assert (=> d!106647 (=> (not res!566530) (not e!464567))))

(assert (=> d!106647 (= res!566530 (or (bvsge #b00000000000000000000000000000000 (size!22751 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22751 _keys!976)))))))

(declare-fun lt!377960 () ListLongMap!8907)

(assert (=> d!106647 (= lt!377947 lt!377960)))

(declare-fun lt!377942 () Unit!28510)

(declare-fun e!464561 () Unit!28510)

(assert (=> d!106647 (= lt!377942 e!464561)))

(declare-fun c!90647 () Bool)

(assert (=> d!106647 (= c!90647 e!464571)))

(declare-fun res!566526 () Bool)

(assert (=> d!106647 (=> (not res!566526) (not e!464571))))

(assert (=> d!106647 (= res!566526 (bvslt #b00000000000000000000000000000000 (size!22751 _keys!976)))))

(assert (=> d!106647 (= lt!377960 e!464569)))

(declare-fun c!90642 () Bool)

(assert (=> d!106647 (= c!90642 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!106647 (validMask!0 mask!1312)))

(assert (=> d!106647 (= (getCurrentListMap!2561 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!377947)))

(declare-fun b!832892 () Bool)

(declare-fun call!36440 () ListLongMap!8907)

(assert (=> b!832892 (= e!464565 call!36440)))

(declare-fun b!832893 () Bool)

(declare-fun e!464570 () Bool)

(assert (=> b!832893 (= e!464570 (not call!36436))))

(declare-fun bm!36434 () Bool)

(assert (=> bm!36434 (= call!36439 (contains!4189 lt!377947 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!832894 () Bool)

(assert (=> b!832894 (= e!464567 e!464570)))

(declare-fun c!90646 () Bool)

(assert (=> b!832894 (= c!90646 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!832895 () Bool)

(declare-fun e!464566 () Bool)

(assert (=> b!832895 (= e!464566 (validKeyInArray!0 (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!36435 () Bool)

(assert (=> bm!36435 (= call!36441 (+!1991 (ite c!90642 call!36437 (ite c!90645 call!36435 call!36440)) (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!832896 () Bool)

(declare-fun call!36438 () ListLongMap!8907)

(assert (=> b!832896 (= e!464573 call!36438)))

(declare-fun b!832897 () Bool)

(declare-fun lt!377949 () Unit!28510)

(assert (=> b!832897 (= e!464561 lt!377949)))

(declare-fun lt!377958 () ListLongMap!8907)

(assert (=> b!832897 (= lt!377958 (getCurrentListMapNoExtraKeys!2539 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!377957 () (_ BitVec 64))

(assert (=> b!832897 (= lt!377957 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!377948 () (_ BitVec 64))

(assert (=> b!832897 (= lt!377948 (select (arr!22331 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!377952 () Unit!28510)

(assert (=> b!832897 (= lt!377952 (addStillContains!324 lt!377958 lt!377957 zeroValueAfter!34 lt!377948))))

(assert (=> b!832897 (contains!4189 (+!1991 lt!377958 (tuple2!10083 lt!377957 zeroValueAfter!34)) lt!377948)))

(declare-fun lt!377962 () Unit!28510)

(assert (=> b!832897 (= lt!377962 lt!377952)))

(declare-fun lt!377943 () ListLongMap!8907)

(assert (=> b!832897 (= lt!377943 (getCurrentListMapNoExtraKeys!2539 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!377955 () (_ BitVec 64))

(assert (=> b!832897 (= lt!377955 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!377946 () (_ BitVec 64))

(assert (=> b!832897 (= lt!377946 (select (arr!22331 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!377963 () Unit!28510)

(assert (=> b!832897 (= lt!377963 (addApplyDifferent!324 lt!377943 lt!377955 minValue!754 lt!377946))))

(assert (=> b!832897 (= (apply!373 (+!1991 lt!377943 (tuple2!10083 lt!377955 minValue!754)) lt!377946) (apply!373 lt!377943 lt!377946))))

(declare-fun lt!377954 () Unit!28510)

(assert (=> b!832897 (= lt!377954 lt!377963)))

(declare-fun lt!377945 () ListLongMap!8907)

(assert (=> b!832897 (= lt!377945 (getCurrentListMapNoExtraKeys!2539 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!377951 () (_ BitVec 64))

(assert (=> b!832897 (= lt!377951 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!377953 () (_ BitVec 64))

(assert (=> b!832897 (= lt!377953 (select (arr!22331 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!377944 () Unit!28510)

(assert (=> b!832897 (= lt!377944 (addApplyDifferent!324 lt!377945 lt!377951 zeroValueAfter!34 lt!377953))))

(assert (=> b!832897 (= (apply!373 (+!1991 lt!377945 (tuple2!10083 lt!377951 zeroValueAfter!34)) lt!377953) (apply!373 lt!377945 lt!377953))))

(declare-fun lt!377961 () Unit!28510)

(assert (=> b!832897 (= lt!377961 lt!377944)))

(declare-fun lt!377956 () ListLongMap!8907)

(assert (=> b!832897 (= lt!377956 (getCurrentListMapNoExtraKeys!2539 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!377950 () (_ BitVec 64))

(assert (=> b!832897 (= lt!377950 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!377959 () (_ BitVec 64))

(assert (=> b!832897 (= lt!377959 (select (arr!22331 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!832897 (= lt!377949 (addApplyDifferent!324 lt!377956 lt!377950 minValue!754 lt!377959))))

(assert (=> b!832897 (= (apply!373 (+!1991 lt!377956 (tuple2!10083 lt!377950 minValue!754)) lt!377959) (apply!373 lt!377956 lt!377959))))

(declare-fun b!832898 () Bool)

(assert (=> b!832898 (= e!464568 (= (apply!373 lt!377947 (select (arr!22331 _keys!976) #b00000000000000000000000000000000)) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!832898 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22752 _values!788)))))

(assert (=> b!832898 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22751 _keys!976)))))

(declare-fun bm!36436 () Bool)

(assert (=> bm!36436 (= call!36438 call!36441)))

(declare-fun b!832899 () Bool)

(assert (=> b!832899 (= e!464565 call!36438)))

(declare-fun b!832900 () Bool)

(declare-fun e!464564 () Bool)

(assert (=> b!832900 (= e!464570 e!464564)))

(declare-fun res!566523 () Bool)

(assert (=> b!832900 (= res!566523 call!36436)))

(assert (=> b!832900 (=> (not res!566523) (not e!464564))))

(declare-fun b!832901 () Bool)

(declare-fun res!566528 () Bool)

(assert (=> b!832901 (=> (not res!566528) (not e!464567))))

(assert (=> b!832901 (= res!566528 e!464562)))

(declare-fun res!566525 () Bool)

(assert (=> b!832901 (=> res!566525 e!464562)))

(assert (=> b!832901 (= res!566525 (not e!464566))))

(declare-fun res!566529 () Bool)

(assert (=> b!832901 (=> (not res!566529) (not e!464566))))

(assert (=> b!832901 (= res!566529 (bvslt #b00000000000000000000000000000000 (size!22751 _keys!976)))))

(declare-fun b!832902 () Bool)

(declare-fun Unit!28515 () Unit!28510)

(assert (=> b!832902 (= e!464561 Unit!28515)))

(declare-fun bm!36437 () Bool)

(assert (=> bm!36437 (= call!36440 call!36435)))

(declare-fun bm!36438 () Bool)

(assert (=> bm!36438 (= call!36437 (getCurrentListMapNoExtraKeys!2539 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!832903 () Bool)

(declare-fun e!464572 () Bool)

(assert (=> b!832903 (= e!464572 (= (apply!373 lt!377947 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun b!832904 () Bool)

(assert (=> b!832904 (= e!464563 e!464572)))

(declare-fun res!566531 () Bool)

(assert (=> b!832904 (= res!566531 call!36439)))

(assert (=> b!832904 (=> (not res!566531) (not e!464572))))

(declare-fun b!832905 () Bool)

(assert (=> b!832905 (= e!464564 (= (apply!373 lt!377947 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(assert (= (and d!106647 c!90642) b!832885))

(assert (= (and d!106647 (not c!90642)) b!832886))

(assert (= (and b!832886 c!90645) b!832896))

(assert (= (and b!832886 (not c!90645)) b!832887))

(assert (= (and b!832887 c!90643) b!832899))

(assert (= (and b!832887 (not c!90643)) b!832892))

(assert (= (or b!832899 b!832892) bm!36437))

(assert (= (or b!832896 bm!36437) bm!36433))

(assert (= (or b!832896 b!832899) bm!36436))

(assert (= (or b!832885 bm!36433) bm!36438))

(assert (= (or b!832885 bm!36436) bm!36435))

(assert (= (and d!106647 res!566526) b!832889))

(assert (= (and d!106647 c!90647) b!832897))

(assert (= (and d!106647 (not c!90647)) b!832902))

(assert (= (and d!106647 res!566530) b!832901))

(assert (= (and b!832901 res!566529) b!832895))

(assert (= (and b!832901 (not res!566525)) b!832888))

(assert (= (and b!832888 res!566524) b!832898))

(assert (= (and b!832901 res!566528) b!832891))

(assert (= (and b!832891 c!90644) b!832904))

(assert (= (and b!832891 (not c!90644)) b!832890))

(assert (= (and b!832904 res!566531) b!832903))

(assert (= (or b!832904 b!832890) bm!36434))

(assert (= (and b!832891 res!566527) b!832894))

(assert (= (and b!832894 c!90646) b!832900))

(assert (= (and b!832894 (not c!90646)) b!832893))

(assert (= (and b!832900 res!566523) b!832905))

(assert (= (or b!832900 b!832893) bm!36432))

(declare-fun b_lambda!11427 () Bool)

(assert (=> (not b_lambda!11427) (not b!832898)))

(assert (=> b!832898 t!22218))

(declare-fun b_and!22585 () Bool)

(assert (= b_and!22583 (and (=> t!22218 result!8013) b_and!22585)))

(declare-fun m!777227 () Bool)

(assert (=> b!832885 m!777227))

(assert (=> b!832888 m!777093))

(assert (=> b!832888 m!777093))

(declare-fun m!777229 () Bool)

(assert (=> b!832888 m!777229))

(assert (=> d!106647 m!776931))

(assert (=> b!832889 m!777093))

(assert (=> b!832889 m!777093))

(assert (=> b!832889 m!777101))

(declare-fun m!777231 () Bool)

(assert (=> bm!36435 m!777231))

(assert (=> bm!36438 m!776965))

(declare-fun m!777233 () Bool)

(assert (=> bm!36434 m!777233))

(declare-fun m!777235 () Bool)

(assert (=> bm!36432 m!777235))

(declare-fun m!777237 () Bool)

(assert (=> b!832903 m!777237))

(assert (=> b!832898 m!777093))

(assert (=> b!832898 m!777107))

(assert (=> b!832898 m!777107))

(assert (=> b!832898 m!777109))

(assert (=> b!832898 m!777113))

(assert (=> b!832898 m!777093))

(declare-fun m!777239 () Bool)

(assert (=> b!832898 m!777239))

(assert (=> b!832898 m!777109))

(declare-fun m!777241 () Bool)

(assert (=> b!832905 m!777241))

(declare-fun m!777243 () Bool)

(assert (=> b!832897 m!777243))

(declare-fun m!777245 () Bool)

(assert (=> b!832897 m!777245))

(declare-fun m!777247 () Bool)

(assert (=> b!832897 m!777247))

(assert (=> b!832897 m!777093))

(declare-fun m!777249 () Bool)

(assert (=> b!832897 m!777249))

(declare-fun m!777251 () Bool)

(assert (=> b!832897 m!777251))

(declare-fun m!777253 () Bool)

(assert (=> b!832897 m!777253))

(declare-fun m!777255 () Bool)

(assert (=> b!832897 m!777255))

(assert (=> b!832897 m!776965))

(assert (=> b!832897 m!777253))

(declare-fun m!777257 () Bool)

(assert (=> b!832897 m!777257))

(assert (=> b!832897 m!777245))

(declare-fun m!777259 () Bool)

(assert (=> b!832897 m!777259))

(declare-fun m!777261 () Bool)

(assert (=> b!832897 m!777261))

(declare-fun m!777263 () Bool)

(assert (=> b!832897 m!777263))

(declare-fun m!777265 () Bool)

(assert (=> b!832897 m!777265))

(declare-fun m!777267 () Bool)

(assert (=> b!832897 m!777267))

(assert (=> b!832897 m!777249))

(assert (=> b!832897 m!777263))

(declare-fun m!777269 () Bool)

(assert (=> b!832897 m!777269))

(declare-fun m!777271 () Bool)

(assert (=> b!832897 m!777271))

(assert (=> b!832895 m!777093))

(assert (=> b!832895 m!777093))

(assert (=> b!832895 m!777101))

(assert (=> b!832661 d!106647))

(declare-fun d!106649 () Bool)

(declare-fun e!464574 () Bool)

(assert (=> d!106649 e!464574))

(declare-fun res!566533 () Bool)

(assert (=> d!106649 (=> (not res!566533) (not e!464574))))

(declare-fun lt!377967 () ListLongMap!8907)

(assert (=> d!106649 (= res!566533 (contains!4189 lt!377967 (_1!5052 lt!377756)))))

(declare-fun lt!377966 () List!15852)

(assert (=> d!106649 (= lt!377967 (ListLongMap!8908 lt!377966))))

(declare-fun lt!377964 () Unit!28510)

(declare-fun lt!377965 () Unit!28510)

(assert (=> d!106649 (= lt!377964 lt!377965)))

(assert (=> d!106649 (= (getValueByKey!417 lt!377966 (_1!5052 lt!377756)) (Some!422 (_2!5052 lt!377756)))))

(assert (=> d!106649 (= lt!377965 (lemmaContainsTupThenGetReturnValue!231 lt!377966 (_1!5052 lt!377756) (_2!5052 lt!377756)))))

(assert (=> d!106649 (= lt!377966 (insertStrictlySorted!270 (toList!4469 (+!1991 lt!377760 lt!377761)) (_1!5052 lt!377756) (_2!5052 lt!377756)))))

(assert (=> d!106649 (= (+!1991 (+!1991 lt!377760 lt!377761) lt!377756) lt!377967)))

(declare-fun b!832906 () Bool)

(declare-fun res!566532 () Bool)

(assert (=> b!832906 (=> (not res!566532) (not e!464574))))

(assert (=> b!832906 (= res!566532 (= (getValueByKey!417 (toList!4469 lt!377967) (_1!5052 lt!377756)) (Some!422 (_2!5052 lt!377756))))))

(declare-fun b!832907 () Bool)

(assert (=> b!832907 (= e!464574 (contains!4190 (toList!4469 lt!377967) lt!377756))))

(assert (= (and d!106649 res!566533) b!832906))

(assert (= (and b!832906 res!566532) b!832907))

(declare-fun m!777273 () Bool)

(assert (=> d!106649 m!777273))

(declare-fun m!777275 () Bool)

(assert (=> d!106649 m!777275))

(declare-fun m!777277 () Bool)

(assert (=> d!106649 m!777277))

(declare-fun m!777279 () Bool)

(assert (=> d!106649 m!777279))

(declare-fun m!777281 () Bool)

(assert (=> b!832906 m!777281))

(declare-fun m!777283 () Bool)

(assert (=> b!832907 m!777283))

(assert (=> b!832661 d!106649))

(declare-fun d!106651 () Bool)

(declare-fun e!464575 () Bool)

(assert (=> d!106651 e!464575))

(declare-fun res!566535 () Bool)

(assert (=> d!106651 (=> (not res!566535) (not e!464575))))

(declare-fun lt!377971 () ListLongMap!8907)

(assert (=> d!106651 (= res!566535 (contains!4189 lt!377971 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!377970 () List!15852)

(assert (=> d!106651 (= lt!377971 (ListLongMap!8908 lt!377970))))

(declare-fun lt!377968 () Unit!28510)

(declare-fun lt!377969 () Unit!28510)

(assert (=> d!106651 (= lt!377968 lt!377969)))

(assert (=> d!106651 (= (getValueByKey!417 lt!377970 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!422 (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!106651 (= lt!377969 (lemmaContainsTupThenGetReturnValue!231 lt!377970 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!106651 (= lt!377970 (insertStrictlySorted!270 (toList!4469 (+!1991 lt!377759 lt!377756)) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!106651 (= (+!1991 (+!1991 lt!377759 lt!377756) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!377971)))

(declare-fun b!832908 () Bool)

(declare-fun res!566534 () Bool)

(assert (=> b!832908 (=> (not res!566534) (not e!464575))))

(assert (=> b!832908 (= res!566534 (= (getValueByKey!417 (toList!4469 lt!377971) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!422 (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!832909 () Bool)

(assert (=> b!832909 (= e!464575 (contains!4190 (toList!4469 lt!377971) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!106651 res!566535) b!832908))

(assert (= (and b!832908 res!566534) b!832909))

(declare-fun m!777285 () Bool)

(assert (=> d!106651 m!777285))

(declare-fun m!777287 () Bool)

(assert (=> d!106651 m!777287))

(declare-fun m!777289 () Bool)

(assert (=> d!106651 m!777289))

(declare-fun m!777291 () Bool)

(assert (=> d!106651 m!777291))

(declare-fun m!777293 () Bool)

(assert (=> b!832908 m!777293))

(declare-fun m!777295 () Bool)

(assert (=> b!832909 m!777295))

(assert (=> b!832661 d!106651))

(declare-fun mapNonEmpty!24483 () Bool)

(declare-fun mapRes!24483 () Bool)

(declare-fun tp!47310 () Bool)

(declare-fun e!464581 () Bool)

(assert (=> mapNonEmpty!24483 (= mapRes!24483 (and tp!47310 e!464581))))

(declare-fun mapValue!24483 () ValueCell!7190)

(declare-fun mapRest!24483 () (Array (_ BitVec 32) ValueCell!7190))

(declare-fun mapKey!24483 () (_ BitVec 32))

(assert (=> mapNonEmpty!24483 (= mapRest!24474 (store mapRest!24483 mapKey!24483 mapValue!24483))))

(declare-fun mapIsEmpty!24483 () Bool)

(assert (=> mapIsEmpty!24483 mapRes!24483))

(declare-fun b!832916 () Bool)

(assert (=> b!832916 (= e!464581 tp_is_empty!15211)))

(declare-fun b!832917 () Bool)

(declare-fun e!464580 () Bool)

(assert (=> b!832917 (= e!464580 tp_is_empty!15211)))

(declare-fun condMapEmpty!24483 () Bool)

(declare-fun mapDefault!24483 () ValueCell!7190)

(assert (=> mapNonEmpty!24474 (= condMapEmpty!24483 (= mapRest!24474 ((as const (Array (_ BitVec 32) ValueCell!7190)) mapDefault!24483)))))

(assert (=> mapNonEmpty!24474 (= tp!47295 (and e!464580 mapRes!24483))))

(assert (= (and mapNonEmpty!24474 condMapEmpty!24483) mapIsEmpty!24483))

(assert (= (and mapNonEmpty!24474 (not condMapEmpty!24483)) mapNonEmpty!24483))

(assert (= (and mapNonEmpty!24483 ((_ is ValueCellFull!7190) mapValue!24483)) b!832916))

(assert (= (and mapNonEmpty!24474 ((_ is ValueCellFull!7190) mapDefault!24483)) b!832917))

(declare-fun m!777297 () Bool)

(assert (=> mapNonEmpty!24483 m!777297))

(declare-fun b_lambda!11429 () Bool)

(assert (= b_lambda!11417 (or (and start!71746 b_free!13501) b_lambda!11429)))

(declare-fun b_lambda!11431 () Bool)

(assert (= b_lambda!11419 (or (and start!71746 b_free!13501) b_lambda!11431)))

(declare-fun b_lambda!11433 () Bool)

(assert (= b_lambda!11427 (or (and start!71746 b_free!13501) b_lambda!11433)))

(declare-fun b_lambda!11435 () Bool)

(assert (= b_lambda!11425 (or (and start!71746 b_free!13501) b_lambda!11435)))

(declare-fun b_lambda!11437 () Bool)

(assert (= b_lambda!11423 (or (and start!71746 b_free!13501) b_lambda!11437)))

(declare-fun b_lambda!11439 () Bool)

(assert (= b_lambda!11421 (or (and start!71746 b_free!13501) b_lambda!11439)))

(check-sat (not b!832818) (not d!106627) (not d!106617) (not bm!36410) (not b_next!13501) (not b!832906) (not b!832794) (not b!832888) (not b!832889) (not mapNonEmpty!24483) (not b!832787) (not b!832884) (not b_lambda!11433) (not b!832777) (not b!832782) (not b!832784) (not b!832788) (not b!832821) (not b!832749) (not d!106641) (not d!106621) (not b!832885) (not b!832738) (not b!832778) (not b!832791) (not b!832877) (not b!832801) tp_is_empty!15211 (not b!832816) (not d!106645) (not b!832905) (not b!832802) (not b!832820) (not bm!36403) (not b!832895) (not b!832739) (not b_lambda!11429) (not bm!36434) (not bm!36406) (not b!832867) (not b_lambda!11437) (not bm!36428) (not b_lambda!11439) (not b!832898) (not d!106619) (not b!832819) (not b!832792) (not b!832779) (not d!106647) (not b!832874) (not bm!36431) (not d!106631) (not b_lambda!11431) (not b!832897) (not b!832908) (not b_lambda!11435) (not b!832751) (not b!832903) (not bm!36435) (not bm!36425) (not b!832798) (not b!832737) (not b!832868) (not b!832876) (not b!832735) (not bm!36438) (not b!832815) (not d!106623) (not b!832909) (not b!832864) (not b!832907) (not b!832813) (not bm!36427) (not b!832793) (not d!106629) (not d!106649) (not b!832736) (not bm!36407) (not b!832796) (not d!106651) (not b!832780) (not bm!36432) (not d!106643) (not b!832740) (not b!832734) (not b!832882) b_and!22585 (not b!832733))
(check-sat b_and!22585 (not b_next!13501))
(get-model)

(declare-fun d!106653 () Bool)

(declare-fun e!464587 () Bool)

(assert (=> d!106653 e!464587))

(declare-fun res!566538 () Bool)

(assert (=> d!106653 (=> res!566538 e!464587)))

(declare-fun lt!377980 () Bool)

(assert (=> d!106653 (= res!566538 (not lt!377980))))

(declare-fun lt!377983 () Bool)

(assert (=> d!106653 (= lt!377980 lt!377983)))

(declare-fun lt!377981 () Unit!28510)

(declare-fun e!464586 () Unit!28510)

(assert (=> d!106653 (= lt!377981 e!464586)))

(declare-fun c!90650 () Bool)

(assert (=> d!106653 (= c!90650 lt!377983)))

(declare-fun containsKey!402 (List!15852 (_ BitVec 64)) Bool)

(assert (=> d!106653 (= lt!377983 (containsKey!402 (toList!4469 lt!377971) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!106653 (= (contains!4189 lt!377971 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!377980)))

(declare-fun b!832924 () Bool)

(declare-fun lt!377982 () Unit!28510)

(assert (=> b!832924 (= e!464586 lt!377982)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!311 (List!15852 (_ BitVec 64)) Unit!28510)

(assert (=> b!832924 (= lt!377982 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377971) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun isDefined!312 (Option!423) Bool)

(assert (=> b!832924 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377971) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!832925 () Bool)

(declare-fun Unit!28516 () Unit!28510)

(assert (=> b!832925 (= e!464586 Unit!28516)))

(declare-fun b!832926 () Bool)

(assert (=> b!832926 (= e!464587 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377971) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (= (and d!106653 c!90650) b!832924))

(assert (= (and d!106653 (not c!90650)) b!832925))

(assert (= (and d!106653 (not res!566538)) b!832926))

(declare-fun m!777299 () Bool)

(assert (=> d!106653 m!777299))

(declare-fun m!777301 () Bool)

(assert (=> b!832924 m!777301))

(assert (=> b!832924 m!777293))

(assert (=> b!832924 m!777293))

(declare-fun m!777303 () Bool)

(assert (=> b!832924 m!777303))

(assert (=> b!832926 m!777293))

(assert (=> b!832926 m!777293))

(assert (=> b!832926 m!777303))

(assert (=> d!106651 d!106653))

(declare-fun d!106655 () Bool)

(declare-fun c!90655 () Bool)

(assert (=> d!106655 (= c!90655 (and ((_ is Cons!15848) lt!377970) (= (_1!5052 (h!16984 lt!377970)) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!464592 () Option!423)

(assert (=> d!106655 (= (getValueByKey!417 lt!377970 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!464592)))

(declare-fun b!832937 () Bool)

(declare-fun e!464593 () Option!423)

(assert (=> b!832937 (= e!464593 (getValueByKey!417 (t!22212 lt!377970) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!832938 () Bool)

(assert (=> b!832938 (= e!464593 None!421)))

(declare-fun b!832936 () Bool)

(assert (=> b!832936 (= e!464592 e!464593)))

(declare-fun c!90656 () Bool)

(assert (=> b!832936 (= c!90656 (and ((_ is Cons!15848) lt!377970) (not (= (_1!5052 (h!16984 lt!377970)) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun b!832935 () Bool)

(assert (=> b!832935 (= e!464592 (Some!422 (_2!5052 (h!16984 lt!377970))))))

(assert (= (and d!106655 c!90655) b!832935))

(assert (= (and d!106655 (not c!90655)) b!832936))

(assert (= (and b!832936 c!90656) b!832937))

(assert (= (and b!832936 (not c!90656)) b!832938))

(declare-fun m!777305 () Bool)

(assert (=> b!832937 m!777305))

(assert (=> d!106651 d!106655))

(declare-fun d!106657 () Bool)

(assert (=> d!106657 (= (getValueByKey!417 lt!377970 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!422 (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!377986 () Unit!28510)

(declare-fun choose!1429 (List!15852 (_ BitVec 64) V!25283) Unit!28510)

(assert (=> d!106657 (= lt!377986 (choose!1429 lt!377970 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun e!464596 () Bool)

(assert (=> d!106657 e!464596))

(declare-fun res!566543 () Bool)

(assert (=> d!106657 (=> (not res!566543) (not e!464596))))

(declare-fun isStrictlySorted!430 (List!15852) Bool)

(assert (=> d!106657 (= res!566543 (isStrictlySorted!430 lt!377970))))

(assert (=> d!106657 (= (lemmaContainsTupThenGetReturnValue!231 lt!377970 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!377986)))

(declare-fun b!832943 () Bool)

(declare-fun res!566544 () Bool)

(assert (=> b!832943 (=> (not res!566544) (not e!464596))))

(assert (=> b!832943 (= res!566544 (containsKey!402 lt!377970 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!832944 () Bool)

(assert (=> b!832944 (= e!464596 (contains!4190 lt!377970 (tuple2!10083 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (= (and d!106657 res!566543) b!832943))

(assert (= (and b!832943 res!566544) b!832944))

(assert (=> d!106657 m!777287))

(declare-fun m!777307 () Bool)

(assert (=> d!106657 m!777307))

(declare-fun m!777309 () Bool)

(assert (=> d!106657 m!777309))

(declare-fun m!777311 () Bool)

(assert (=> b!832943 m!777311))

(declare-fun m!777313 () Bool)

(assert (=> b!832944 m!777313))

(assert (=> d!106651 d!106657))

(declare-fun e!464608 () List!15852)

(declare-fun call!36449 () List!15852)

(declare-fun bm!36445 () Bool)

(declare-fun c!90665 () Bool)

(declare-fun $colon$colon!534 (List!15852 tuple2!10082) List!15852)

(assert (=> bm!36445 (= call!36449 ($colon$colon!534 e!464608 (ite c!90665 (h!16984 (toList!4469 (+!1991 lt!377759 lt!377756))) (tuple2!10083 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun c!90668 () Bool)

(assert (=> bm!36445 (= c!90668 c!90665)))

(declare-fun bm!36446 () Bool)

(declare-fun call!36450 () List!15852)

(assert (=> bm!36446 (= call!36450 call!36449)))

(declare-fun bm!36447 () Bool)

(declare-fun call!36448 () List!15852)

(assert (=> bm!36447 (= call!36448 call!36450)))

(declare-fun c!90666 () Bool)

(declare-fun b!832965 () Bool)

(assert (=> b!832965 (= c!90666 (and ((_ is Cons!15848) (toList!4469 (+!1991 lt!377759 lt!377756))) (bvsgt (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377759 lt!377756)))) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!464607 () List!15852)

(declare-fun e!464610 () List!15852)

(assert (=> b!832965 (= e!464607 e!464610)))

(declare-fun b!832966 () Bool)

(assert (=> b!832966 (= e!464610 call!36448)))

(declare-fun b!832967 () Bool)

(assert (=> b!832967 (= e!464608 (insertStrictlySorted!270 (t!22212 (toList!4469 (+!1991 lt!377759 lt!377756))) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!832968 () Bool)

(declare-fun e!464609 () List!15852)

(assert (=> b!832968 (= e!464609 call!36449)))

(declare-fun b!832969 () Bool)

(declare-fun e!464611 () Bool)

(declare-fun lt!377989 () List!15852)

(assert (=> b!832969 (= e!464611 (contains!4190 lt!377989 (tuple2!10083 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun c!90667 () Bool)

(declare-fun b!832970 () Bool)

(assert (=> b!832970 (= e!464608 (ite c!90667 (t!22212 (toList!4469 (+!1991 lt!377759 lt!377756))) (ite c!90666 (Cons!15848 (h!16984 (toList!4469 (+!1991 lt!377759 lt!377756))) (t!22212 (toList!4469 (+!1991 lt!377759 lt!377756)))) Nil!15849)))))

(declare-fun b!832971 () Bool)

(assert (=> b!832971 (= e!464609 e!464607)))

(assert (=> b!832971 (= c!90667 (and ((_ is Cons!15848) (toList!4469 (+!1991 lt!377759 lt!377756))) (= (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377759 lt!377756)))) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!832972 () Bool)

(assert (=> b!832972 (= e!464607 call!36450)))

(declare-fun b!832973 () Bool)

(declare-fun res!566550 () Bool)

(assert (=> b!832973 (=> (not res!566550) (not e!464611))))

(assert (=> b!832973 (= res!566550 (containsKey!402 lt!377989 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun d!106659 () Bool)

(assert (=> d!106659 e!464611))

(declare-fun res!566549 () Bool)

(assert (=> d!106659 (=> (not res!566549) (not e!464611))))

(assert (=> d!106659 (= res!566549 (isStrictlySorted!430 lt!377989))))

(assert (=> d!106659 (= lt!377989 e!464609)))

(assert (=> d!106659 (= c!90665 (and ((_ is Cons!15848) (toList!4469 (+!1991 lt!377759 lt!377756))) (bvslt (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377759 lt!377756)))) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!106659 (isStrictlySorted!430 (toList!4469 (+!1991 lt!377759 lt!377756)))))

(assert (=> d!106659 (= (insertStrictlySorted!270 (toList!4469 (+!1991 lt!377759 lt!377756)) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!377989)))

(declare-fun b!832974 () Bool)

(assert (=> b!832974 (= e!464610 call!36448)))

(assert (= (and d!106659 c!90665) b!832968))

(assert (= (and d!106659 (not c!90665)) b!832971))

(assert (= (and b!832971 c!90667) b!832972))

(assert (= (and b!832971 (not c!90667)) b!832965))

(assert (= (and b!832965 c!90666) b!832966))

(assert (= (and b!832965 (not c!90666)) b!832974))

(assert (= (or b!832966 b!832974) bm!36447))

(assert (= (or b!832972 bm!36447) bm!36446))

(assert (= (or b!832968 bm!36446) bm!36445))

(assert (= (and bm!36445 c!90668) b!832967))

(assert (= (and bm!36445 (not c!90668)) b!832970))

(assert (= (and d!106659 res!566549) b!832973))

(assert (= (and b!832973 res!566550) b!832969))

(declare-fun m!777315 () Bool)

(assert (=> bm!36445 m!777315))

(declare-fun m!777317 () Bool)

(assert (=> b!832969 m!777317))

(declare-fun m!777319 () Bool)

(assert (=> b!832967 m!777319))

(declare-fun m!777321 () Bool)

(assert (=> b!832973 m!777321))

(declare-fun m!777323 () Bool)

(assert (=> d!106659 m!777323))

(declare-fun m!777325 () Bool)

(assert (=> d!106659 m!777325))

(assert (=> d!106651 d!106659))

(declare-fun d!106661 () Bool)

(declare-fun lt!377992 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!388 (List!15852) (InoxSet tuple2!10082))

(assert (=> d!106661 (= lt!377992 (select (content!388 (toList!4469 lt!377875)) lt!377756))))

(declare-fun e!464617 () Bool)

(assert (=> d!106661 (= lt!377992 e!464617)))

(declare-fun res!566556 () Bool)

(assert (=> d!106661 (=> (not res!566556) (not e!464617))))

(assert (=> d!106661 (= res!566556 ((_ is Cons!15848) (toList!4469 lt!377875)))))

(assert (=> d!106661 (= (contains!4190 (toList!4469 lt!377875) lt!377756) lt!377992)))

(declare-fun b!832979 () Bool)

(declare-fun e!464616 () Bool)

(assert (=> b!832979 (= e!464617 e!464616)))

(declare-fun res!566555 () Bool)

(assert (=> b!832979 (=> res!566555 e!464616)))

(assert (=> b!832979 (= res!566555 (= (h!16984 (toList!4469 lt!377875)) lt!377756))))

(declare-fun b!832980 () Bool)

(assert (=> b!832980 (= e!464616 (contains!4190 (t!22212 (toList!4469 lt!377875)) lt!377756))))

(assert (= (and d!106661 res!566556) b!832979))

(assert (= (and b!832979 (not res!566555)) b!832980))

(declare-fun m!777327 () Bool)

(assert (=> d!106661 m!777327))

(declare-fun m!777329 () Bool)

(assert (=> d!106661 m!777329))

(declare-fun m!777331 () Bool)

(assert (=> b!832980 m!777331))

(assert (=> b!832821 d!106661))

(declare-fun d!106663 () Bool)

(declare-fun e!464618 () Bool)

(assert (=> d!106663 e!464618))

(declare-fun res!566558 () Bool)

(assert (=> d!106663 (=> (not res!566558) (not e!464618))))

(declare-fun lt!377996 () ListLongMap!8907)

(assert (=> d!106663 (= res!566558 (contains!4189 lt!377996 (_1!5052 (tuple2!10083 lt!377950 minValue!754))))))

(declare-fun lt!377995 () List!15852)

(assert (=> d!106663 (= lt!377996 (ListLongMap!8908 lt!377995))))

(declare-fun lt!377993 () Unit!28510)

(declare-fun lt!377994 () Unit!28510)

(assert (=> d!106663 (= lt!377993 lt!377994)))

(assert (=> d!106663 (= (getValueByKey!417 lt!377995 (_1!5052 (tuple2!10083 lt!377950 minValue!754))) (Some!422 (_2!5052 (tuple2!10083 lt!377950 minValue!754))))))

(assert (=> d!106663 (= lt!377994 (lemmaContainsTupThenGetReturnValue!231 lt!377995 (_1!5052 (tuple2!10083 lt!377950 minValue!754)) (_2!5052 (tuple2!10083 lt!377950 minValue!754))))))

(assert (=> d!106663 (= lt!377995 (insertStrictlySorted!270 (toList!4469 lt!377956) (_1!5052 (tuple2!10083 lt!377950 minValue!754)) (_2!5052 (tuple2!10083 lt!377950 minValue!754))))))

(assert (=> d!106663 (= (+!1991 lt!377956 (tuple2!10083 lt!377950 minValue!754)) lt!377996)))

(declare-fun b!832981 () Bool)

(declare-fun res!566557 () Bool)

(assert (=> b!832981 (=> (not res!566557) (not e!464618))))

(assert (=> b!832981 (= res!566557 (= (getValueByKey!417 (toList!4469 lt!377996) (_1!5052 (tuple2!10083 lt!377950 minValue!754))) (Some!422 (_2!5052 (tuple2!10083 lt!377950 minValue!754)))))))

(declare-fun b!832982 () Bool)

(assert (=> b!832982 (= e!464618 (contains!4190 (toList!4469 lt!377996) (tuple2!10083 lt!377950 minValue!754)))))

(assert (= (and d!106663 res!566558) b!832981))

(assert (= (and b!832981 res!566557) b!832982))

(declare-fun m!777333 () Bool)

(assert (=> d!106663 m!777333))

(declare-fun m!777335 () Bool)

(assert (=> d!106663 m!777335))

(declare-fun m!777337 () Bool)

(assert (=> d!106663 m!777337))

(declare-fun m!777339 () Bool)

(assert (=> d!106663 m!777339))

(declare-fun m!777341 () Bool)

(assert (=> b!832981 m!777341))

(declare-fun m!777343 () Bool)

(assert (=> b!832982 m!777343))

(assert (=> b!832897 d!106663))

(declare-fun d!106665 () Bool)

(declare-fun e!464620 () Bool)

(assert (=> d!106665 e!464620))

(declare-fun res!566559 () Bool)

(assert (=> d!106665 (=> res!566559 e!464620)))

(declare-fun lt!377997 () Bool)

(assert (=> d!106665 (= res!566559 (not lt!377997))))

(declare-fun lt!378000 () Bool)

(assert (=> d!106665 (= lt!377997 lt!378000)))

(declare-fun lt!377998 () Unit!28510)

(declare-fun e!464619 () Unit!28510)

(assert (=> d!106665 (= lt!377998 e!464619)))

(declare-fun c!90669 () Bool)

(assert (=> d!106665 (= c!90669 lt!378000)))

(assert (=> d!106665 (= lt!378000 (containsKey!402 (toList!4469 (+!1991 lt!377958 (tuple2!10083 lt!377957 zeroValueAfter!34))) lt!377948))))

(assert (=> d!106665 (= (contains!4189 (+!1991 lt!377958 (tuple2!10083 lt!377957 zeroValueAfter!34)) lt!377948) lt!377997)))

(declare-fun b!832983 () Bool)

(declare-fun lt!377999 () Unit!28510)

(assert (=> b!832983 (= e!464619 lt!377999)))

(assert (=> b!832983 (= lt!377999 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 (+!1991 lt!377958 (tuple2!10083 lt!377957 zeroValueAfter!34))) lt!377948))))

(assert (=> b!832983 (isDefined!312 (getValueByKey!417 (toList!4469 (+!1991 lt!377958 (tuple2!10083 lt!377957 zeroValueAfter!34))) lt!377948))))

(declare-fun b!832984 () Bool)

(declare-fun Unit!28517 () Unit!28510)

(assert (=> b!832984 (= e!464619 Unit!28517)))

(declare-fun b!832985 () Bool)

(assert (=> b!832985 (= e!464620 (isDefined!312 (getValueByKey!417 (toList!4469 (+!1991 lt!377958 (tuple2!10083 lt!377957 zeroValueAfter!34))) lt!377948)))))

(assert (= (and d!106665 c!90669) b!832983))

(assert (= (and d!106665 (not c!90669)) b!832984))

(assert (= (and d!106665 (not res!566559)) b!832985))

(declare-fun m!777345 () Bool)

(assert (=> d!106665 m!777345))

(declare-fun m!777347 () Bool)

(assert (=> b!832983 m!777347))

(declare-fun m!777349 () Bool)

(assert (=> b!832983 m!777349))

(assert (=> b!832983 m!777349))

(declare-fun m!777351 () Bool)

(assert (=> b!832983 m!777351))

(assert (=> b!832985 m!777349))

(assert (=> b!832985 m!777349))

(assert (=> b!832985 m!777351))

(assert (=> b!832897 d!106665))

(assert (=> b!832897 d!106629))

(declare-fun d!106667 () Bool)

(declare-fun get!11827 (Option!423) V!25283)

(assert (=> d!106667 (= (apply!373 (+!1991 lt!377943 (tuple2!10083 lt!377955 minValue!754)) lt!377946) (get!11827 (getValueByKey!417 (toList!4469 (+!1991 lt!377943 (tuple2!10083 lt!377955 minValue!754))) lt!377946)))))

(declare-fun bs!23273 () Bool)

(assert (= bs!23273 d!106667))

(declare-fun m!777353 () Bool)

(assert (=> bs!23273 m!777353))

(assert (=> bs!23273 m!777353))

(declare-fun m!777355 () Bool)

(assert (=> bs!23273 m!777355))

(assert (=> b!832897 d!106667))

(declare-fun d!106669 () Bool)

(assert (=> d!106669 (= (apply!373 lt!377945 lt!377953) (get!11827 (getValueByKey!417 (toList!4469 lt!377945) lt!377953)))))

(declare-fun bs!23274 () Bool)

(assert (= bs!23274 d!106669))

(declare-fun m!777357 () Bool)

(assert (=> bs!23274 m!777357))

(assert (=> bs!23274 m!777357))

(declare-fun m!777359 () Bool)

(assert (=> bs!23274 m!777359))

(assert (=> b!832897 d!106669))

(declare-fun d!106671 () Bool)

(assert (=> d!106671 (= (apply!373 (+!1991 lt!377945 (tuple2!10083 lt!377951 zeroValueAfter!34)) lt!377953) (get!11827 (getValueByKey!417 (toList!4469 (+!1991 lt!377945 (tuple2!10083 lt!377951 zeroValueAfter!34))) lt!377953)))))

(declare-fun bs!23275 () Bool)

(assert (= bs!23275 d!106671))

(declare-fun m!777361 () Bool)

(assert (=> bs!23275 m!777361))

(assert (=> bs!23275 m!777361))

(declare-fun m!777363 () Bool)

(assert (=> bs!23275 m!777363))

(assert (=> b!832897 d!106671))

(declare-fun d!106673 () Bool)

(declare-fun e!464621 () Bool)

(assert (=> d!106673 e!464621))

(declare-fun res!566561 () Bool)

(assert (=> d!106673 (=> (not res!566561) (not e!464621))))

(declare-fun lt!378004 () ListLongMap!8907)

(assert (=> d!106673 (= res!566561 (contains!4189 lt!378004 (_1!5052 (tuple2!10083 lt!377955 minValue!754))))))

(declare-fun lt!378003 () List!15852)

(assert (=> d!106673 (= lt!378004 (ListLongMap!8908 lt!378003))))

(declare-fun lt!378001 () Unit!28510)

(declare-fun lt!378002 () Unit!28510)

(assert (=> d!106673 (= lt!378001 lt!378002)))

(assert (=> d!106673 (= (getValueByKey!417 lt!378003 (_1!5052 (tuple2!10083 lt!377955 minValue!754))) (Some!422 (_2!5052 (tuple2!10083 lt!377955 minValue!754))))))

(assert (=> d!106673 (= lt!378002 (lemmaContainsTupThenGetReturnValue!231 lt!378003 (_1!5052 (tuple2!10083 lt!377955 minValue!754)) (_2!5052 (tuple2!10083 lt!377955 minValue!754))))))

(assert (=> d!106673 (= lt!378003 (insertStrictlySorted!270 (toList!4469 lt!377943) (_1!5052 (tuple2!10083 lt!377955 minValue!754)) (_2!5052 (tuple2!10083 lt!377955 minValue!754))))))

(assert (=> d!106673 (= (+!1991 lt!377943 (tuple2!10083 lt!377955 minValue!754)) lt!378004)))

(declare-fun b!832986 () Bool)

(declare-fun res!566560 () Bool)

(assert (=> b!832986 (=> (not res!566560) (not e!464621))))

(assert (=> b!832986 (= res!566560 (= (getValueByKey!417 (toList!4469 lt!378004) (_1!5052 (tuple2!10083 lt!377955 minValue!754))) (Some!422 (_2!5052 (tuple2!10083 lt!377955 minValue!754)))))))

(declare-fun b!832987 () Bool)

(assert (=> b!832987 (= e!464621 (contains!4190 (toList!4469 lt!378004) (tuple2!10083 lt!377955 minValue!754)))))

(assert (= (and d!106673 res!566561) b!832986))

(assert (= (and b!832986 res!566560) b!832987))

(declare-fun m!777365 () Bool)

(assert (=> d!106673 m!777365))

(declare-fun m!777367 () Bool)

(assert (=> d!106673 m!777367))

(declare-fun m!777369 () Bool)

(assert (=> d!106673 m!777369))

(declare-fun m!777371 () Bool)

(assert (=> d!106673 m!777371))

(declare-fun m!777373 () Bool)

(assert (=> b!832986 m!777373))

(declare-fun m!777375 () Bool)

(assert (=> b!832987 m!777375))

(assert (=> b!832897 d!106673))

(declare-fun d!106675 () Bool)

(declare-fun e!464622 () Bool)

(assert (=> d!106675 e!464622))

(declare-fun res!566563 () Bool)

(assert (=> d!106675 (=> (not res!566563) (not e!464622))))

(declare-fun lt!378008 () ListLongMap!8907)

(assert (=> d!106675 (= res!566563 (contains!4189 lt!378008 (_1!5052 (tuple2!10083 lt!377957 zeroValueAfter!34))))))

(declare-fun lt!378007 () List!15852)

(assert (=> d!106675 (= lt!378008 (ListLongMap!8908 lt!378007))))

(declare-fun lt!378005 () Unit!28510)

(declare-fun lt!378006 () Unit!28510)

(assert (=> d!106675 (= lt!378005 lt!378006)))

(assert (=> d!106675 (= (getValueByKey!417 lt!378007 (_1!5052 (tuple2!10083 lt!377957 zeroValueAfter!34))) (Some!422 (_2!5052 (tuple2!10083 lt!377957 zeroValueAfter!34))))))

(assert (=> d!106675 (= lt!378006 (lemmaContainsTupThenGetReturnValue!231 lt!378007 (_1!5052 (tuple2!10083 lt!377957 zeroValueAfter!34)) (_2!5052 (tuple2!10083 lt!377957 zeroValueAfter!34))))))

(assert (=> d!106675 (= lt!378007 (insertStrictlySorted!270 (toList!4469 lt!377958) (_1!5052 (tuple2!10083 lt!377957 zeroValueAfter!34)) (_2!5052 (tuple2!10083 lt!377957 zeroValueAfter!34))))))

(assert (=> d!106675 (= (+!1991 lt!377958 (tuple2!10083 lt!377957 zeroValueAfter!34)) lt!378008)))

(declare-fun b!832988 () Bool)

(declare-fun res!566562 () Bool)

(assert (=> b!832988 (=> (not res!566562) (not e!464622))))

(assert (=> b!832988 (= res!566562 (= (getValueByKey!417 (toList!4469 lt!378008) (_1!5052 (tuple2!10083 lt!377957 zeroValueAfter!34))) (Some!422 (_2!5052 (tuple2!10083 lt!377957 zeroValueAfter!34)))))))

(declare-fun b!832989 () Bool)

(assert (=> b!832989 (= e!464622 (contains!4190 (toList!4469 lt!378008) (tuple2!10083 lt!377957 zeroValueAfter!34)))))

(assert (= (and d!106675 res!566563) b!832988))

(assert (= (and b!832988 res!566562) b!832989))

(declare-fun m!777377 () Bool)

(assert (=> d!106675 m!777377))

(declare-fun m!777379 () Bool)

(assert (=> d!106675 m!777379))

(declare-fun m!777381 () Bool)

(assert (=> d!106675 m!777381))

(declare-fun m!777383 () Bool)

(assert (=> d!106675 m!777383))

(declare-fun m!777385 () Bool)

(assert (=> b!832988 m!777385))

(declare-fun m!777387 () Bool)

(assert (=> b!832989 m!777387))

(assert (=> b!832897 d!106675))

(declare-fun d!106677 () Bool)

(assert (=> d!106677 (= (apply!373 (+!1991 lt!377956 (tuple2!10083 lt!377950 minValue!754)) lt!377959) (get!11827 (getValueByKey!417 (toList!4469 (+!1991 lt!377956 (tuple2!10083 lt!377950 minValue!754))) lt!377959)))))

(declare-fun bs!23276 () Bool)

(assert (= bs!23276 d!106677))

(declare-fun m!777389 () Bool)

(assert (=> bs!23276 m!777389))

(assert (=> bs!23276 m!777389))

(declare-fun m!777391 () Bool)

(assert (=> bs!23276 m!777391))

(assert (=> b!832897 d!106677))

(declare-fun d!106679 () Bool)

(assert (=> d!106679 (= (apply!373 (+!1991 lt!377945 (tuple2!10083 lt!377951 zeroValueAfter!34)) lt!377953) (apply!373 lt!377945 lt!377953))))

(declare-fun lt!378011 () Unit!28510)

(declare-fun choose!1430 (ListLongMap!8907 (_ BitVec 64) V!25283 (_ BitVec 64)) Unit!28510)

(assert (=> d!106679 (= lt!378011 (choose!1430 lt!377945 lt!377951 zeroValueAfter!34 lt!377953))))

(declare-fun e!464625 () Bool)

(assert (=> d!106679 e!464625))

(declare-fun res!566566 () Bool)

(assert (=> d!106679 (=> (not res!566566) (not e!464625))))

(assert (=> d!106679 (= res!566566 (contains!4189 lt!377945 lt!377953))))

(assert (=> d!106679 (= (addApplyDifferent!324 lt!377945 lt!377951 zeroValueAfter!34 lt!377953) lt!378011)))

(declare-fun b!832993 () Bool)

(assert (=> b!832993 (= e!464625 (not (= lt!377953 lt!377951)))))

(assert (= (and d!106679 res!566566) b!832993))

(declare-fun m!777393 () Bool)

(assert (=> d!106679 m!777393))

(assert (=> d!106679 m!777261))

(declare-fun m!777395 () Bool)

(assert (=> d!106679 m!777395))

(assert (=> d!106679 m!777253))

(assert (=> d!106679 m!777255))

(assert (=> d!106679 m!777253))

(assert (=> b!832897 d!106679))

(declare-fun d!106681 () Bool)

(assert (=> d!106681 (contains!4189 (+!1991 lt!377958 (tuple2!10083 lt!377957 zeroValueAfter!34)) lt!377948)))

(declare-fun lt!378014 () Unit!28510)

(declare-fun choose!1431 (ListLongMap!8907 (_ BitVec 64) V!25283 (_ BitVec 64)) Unit!28510)

(assert (=> d!106681 (= lt!378014 (choose!1431 lt!377958 lt!377957 zeroValueAfter!34 lt!377948))))

(assert (=> d!106681 (contains!4189 lt!377958 lt!377948)))

(assert (=> d!106681 (= (addStillContains!324 lt!377958 lt!377957 zeroValueAfter!34 lt!377948) lt!378014)))

(declare-fun bs!23277 () Bool)

(assert (= bs!23277 d!106681))

(assert (=> bs!23277 m!777263))

(assert (=> bs!23277 m!777263))

(assert (=> bs!23277 m!777265))

(declare-fun m!777397 () Bool)

(assert (=> bs!23277 m!777397))

(declare-fun m!777399 () Bool)

(assert (=> bs!23277 m!777399))

(assert (=> b!832897 d!106681))

(declare-fun d!106683 () Bool)

(declare-fun e!464626 () Bool)

(assert (=> d!106683 e!464626))

(declare-fun res!566568 () Bool)

(assert (=> d!106683 (=> (not res!566568) (not e!464626))))

(declare-fun lt!378018 () ListLongMap!8907)

(assert (=> d!106683 (= res!566568 (contains!4189 lt!378018 (_1!5052 (tuple2!10083 lt!377951 zeroValueAfter!34))))))

(declare-fun lt!378017 () List!15852)

(assert (=> d!106683 (= lt!378018 (ListLongMap!8908 lt!378017))))

(declare-fun lt!378015 () Unit!28510)

(declare-fun lt!378016 () Unit!28510)

(assert (=> d!106683 (= lt!378015 lt!378016)))

(assert (=> d!106683 (= (getValueByKey!417 lt!378017 (_1!5052 (tuple2!10083 lt!377951 zeroValueAfter!34))) (Some!422 (_2!5052 (tuple2!10083 lt!377951 zeroValueAfter!34))))))

(assert (=> d!106683 (= lt!378016 (lemmaContainsTupThenGetReturnValue!231 lt!378017 (_1!5052 (tuple2!10083 lt!377951 zeroValueAfter!34)) (_2!5052 (tuple2!10083 lt!377951 zeroValueAfter!34))))))

(assert (=> d!106683 (= lt!378017 (insertStrictlySorted!270 (toList!4469 lt!377945) (_1!5052 (tuple2!10083 lt!377951 zeroValueAfter!34)) (_2!5052 (tuple2!10083 lt!377951 zeroValueAfter!34))))))

(assert (=> d!106683 (= (+!1991 lt!377945 (tuple2!10083 lt!377951 zeroValueAfter!34)) lt!378018)))

(declare-fun b!832995 () Bool)

(declare-fun res!566567 () Bool)

(assert (=> b!832995 (=> (not res!566567) (not e!464626))))

(assert (=> b!832995 (= res!566567 (= (getValueByKey!417 (toList!4469 lt!378018) (_1!5052 (tuple2!10083 lt!377951 zeroValueAfter!34))) (Some!422 (_2!5052 (tuple2!10083 lt!377951 zeroValueAfter!34)))))))

(declare-fun b!832996 () Bool)

(assert (=> b!832996 (= e!464626 (contains!4190 (toList!4469 lt!378018) (tuple2!10083 lt!377951 zeroValueAfter!34)))))

(assert (= (and d!106683 res!566568) b!832995))

(assert (= (and b!832995 res!566567) b!832996))

(declare-fun m!777401 () Bool)

(assert (=> d!106683 m!777401))

(declare-fun m!777403 () Bool)

(assert (=> d!106683 m!777403))

(declare-fun m!777405 () Bool)

(assert (=> d!106683 m!777405))

(declare-fun m!777407 () Bool)

(assert (=> d!106683 m!777407))

(declare-fun m!777409 () Bool)

(assert (=> b!832995 m!777409))

(declare-fun m!777411 () Bool)

(assert (=> b!832996 m!777411))

(assert (=> b!832897 d!106683))

(declare-fun d!106685 () Bool)

(assert (=> d!106685 (= (apply!373 lt!377956 lt!377959) (get!11827 (getValueByKey!417 (toList!4469 lt!377956) lt!377959)))))

(declare-fun bs!23278 () Bool)

(assert (= bs!23278 d!106685))

(declare-fun m!777413 () Bool)

(assert (=> bs!23278 m!777413))

(assert (=> bs!23278 m!777413))

(declare-fun m!777415 () Bool)

(assert (=> bs!23278 m!777415))

(assert (=> b!832897 d!106685))

(declare-fun d!106687 () Bool)

(assert (=> d!106687 (= (apply!373 (+!1991 lt!377956 (tuple2!10083 lt!377950 minValue!754)) lt!377959) (apply!373 lt!377956 lt!377959))))

(declare-fun lt!378019 () Unit!28510)

(assert (=> d!106687 (= lt!378019 (choose!1430 lt!377956 lt!377950 minValue!754 lt!377959))))

(declare-fun e!464627 () Bool)

(assert (=> d!106687 e!464627))

(declare-fun res!566569 () Bool)

(assert (=> d!106687 (=> (not res!566569) (not e!464627))))

(assert (=> d!106687 (= res!566569 (contains!4189 lt!377956 lt!377959))))

(assert (=> d!106687 (= (addApplyDifferent!324 lt!377956 lt!377950 minValue!754 lt!377959) lt!378019)))

(declare-fun b!832997 () Bool)

(assert (=> b!832997 (= e!464627 (not (= lt!377959 lt!377950)))))

(assert (= (and d!106687 res!566569) b!832997))

(declare-fun m!777417 () Bool)

(assert (=> d!106687 m!777417))

(assert (=> d!106687 m!777267))

(declare-fun m!777419 () Bool)

(assert (=> d!106687 m!777419))

(assert (=> d!106687 m!777249))

(assert (=> d!106687 m!777251))

(assert (=> d!106687 m!777249))

(assert (=> b!832897 d!106687))

(declare-fun d!106689 () Bool)

(assert (=> d!106689 (= (apply!373 (+!1991 lt!377943 (tuple2!10083 lt!377955 minValue!754)) lt!377946) (apply!373 lt!377943 lt!377946))))

(declare-fun lt!378020 () Unit!28510)

(assert (=> d!106689 (= lt!378020 (choose!1430 lt!377943 lt!377955 minValue!754 lt!377946))))

(declare-fun e!464628 () Bool)

(assert (=> d!106689 e!464628))

(declare-fun res!566570 () Bool)

(assert (=> d!106689 (=> (not res!566570) (not e!464628))))

(assert (=> d!106689 (= res!566570 (contains!4189 lt!377943 lt!377946))))

(assert (=> d!106689 (= (addApplyDifferent!324 lt!377943 lt!377955 minValue!754 lt!377946) lt!378020)))

(declare-fun b!832998 () Bool)

(assert (=> b!832998 (= e!464628 (not (= lt!377946 lt!377955)))))

(assert (= (and d!106689 res!566570) b!832998))

(declare-fun m!777421 () Bool)

(assert (=> d!106689 m!777421))

(assert (=> d!106689 m!777257))

(declare-fun m!777423 () Bool)

(assert (=> d!106689 m!777423))

(assert (=> d!106689 m!777245))

(assert (=> d!106689 m!777247))

(assert (=> d!106689 m!777245))

(assert (=> b!832897 d!106689))

(declare-fun d!106691 () Bool)

(assert (=> d!106691 (= (apply!373 lt!377943 lt!377946) (get!11827 (getValueByKey!417 (toList!4469 lt!377943) lt!377946)))))

(declare-fun bs!23279 () Bool)

(assert (= bs!23279 d!106691))

(declare-fun m!777425 () Bool)

(assert (=> bs!23279 m!777425))

(assert (=> bs!23279 m!777425))

(declare-fun m!777427 () Bool)

(assert (=> bs!23279 m!777427))

(assert (=> b!832897 d!106691))

(declare-fun d!106693 () Bool)

(assert (=> d!106693 (= (apply!373 lt!377925 #b0000000000000000000000000000000000000000000000000000000000000000) (get!11827 (getValueByKey!417 (toList!4469 lt!377925) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!23280 () Bool)

(assert (= bs!23280 d!106693))

(declare-fun m!777429 () Bool)

(assert (=> bs!23280 m!777429))

(assert (=> bs!23280 m!777429))

(declare-fun m!777431 () Bool)

(assert (=> bs!23280 m!777431))

(assert (=> b!832882 d!106693))

(declare-fun d!106695 () Bool)

(declare-fun e!464630 () Bool)

(assert (=> d!106695 e!464630))

(declare-fun res!566571 () Bool)

(assert (=> d!106695 (=> res!566571 e!464630)))

(declare-fun lt!378021 () Bool)

(assert (=> d!106695 (= res!566571 (not lt!378021))))

(declare-fun lt!378024 () Bool)

(assert (=> d!106695 (= lt!378021 lt!378024)))

(declare-fun lt!378022 () Unit!28510)

(declare-fun e!464629 () Unit!28510)

(assert (=> d!106695 (= lt!378022 e!464629)))

(declare-fun c!90670 () Bool)

(assert (=> d!106695 (= c!90670 lt!378024)))

(assert (=> d!106695 (= lt!378024 (containsKey!402 (toList!4469 lt!377925) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> d!106695 (= (contains!4189 lt!377925 (select (arr!22331 _keys!976) #b00000000000000000000000000000000)) lt!378021)))

(declare-fun b!832999 () Bool)

(declare-fun lt!378023 () Unit!28510)

(assert (=> b!832999 (= e!464629 lt!378023)))

(assert (=> b!832999 (= lt!378023 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377925) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!832999 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377925) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!833000 () Bool)

(declare-fun Unit!28518 () Unit!28510)

(assert (=> b!833000 (= e!464629 Unit!28518)))

(declare-fun b!833001 () Bool)

(assert (=> b!833001 (= e!464630 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377925) (select (arr!22331 _keys!976) #b00000000000000000000000000000000))))))

(assert (= (and d!106695 c!90670) b!832999))

(assert (= (and d!106695 (not c!90670)) b!833000))

(assert (= (and d!106695 (not res!566571)) b!833001))

(assert (=> d!106695 m!777093))

(declare-fun m!777433 () Bool)

(assert (=> d!106695 m!777433))

(assert (=> b!832999 m!777093))

(declare-fun m!777435 () Bool)

(assert (=> b!832999 m!777435))

(assert (=> b!832999 m!777093))

(declare-fun m!777437 () Bool)

(assert (=> b!832999 m!777437))

(assert (=> b!832999 m!777437))

(declare-fun m!777439 () Bool)

(assert (=> b!832999 m!777439))

(assert (=> b!833001 m!777093))

(assert (=> b!833001 m!777437))

(assert (=> b!833001 m!777437))

(assert (=> b!833001 m!777439))

(assert (=> b!832867 d!106695))

(declare-fun d!106697 () Bool)

(assert (=> d!106697 (= (validKeyInArray!0 (select (arr!22331 _keys!976) #b00000000000000000000000000000000)) (and (not (= (select (arr!22331 _keys!976) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!22331 _keys!976) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!832816 d!106697))

(declare-fun d!106699 () Bool)

(assert (=> d!106699 (= (apply!373 lt!377925 #b1000000000000000000000000000000000000000000000000000000000000000) (get!11827 (getValueByKey!417 (toList!4469 lt!377925) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!23281 () Bool)

(assert (= bs!23281 d!106699))

(declare-fun m!777441 () Bool)

(assert (=> bs!23281 m!777441))

(assert (=> bs!23281 m!777441))

(declare-fun m!777443 () Bool)

(assert (=> bs!23281 m!777443))

(assert (=> b!832884 d!106699))

(assert (=> b!832868 d!106697))

(assert (=> b!832793 d!106697))

(declare-fun d!106701 () Bool)

(declare-fun c!90671 () Bool)

(assert (=> d!106701 (= c!90671 (and ((_ is Cons!15848) (toList!4469 lt!377967)) (= (_1!5052 (h!16984 (toList!4469 lt!377967))) (_1!5052 lt!377756))))))

(declare-fun e!464631 () Option!423)

(assert (=> d!106701 (= (getValueByKey!417 (toList!4469 lt!377967) (_1!5052 lt!377756)) e!464631)))

(declare-fun b!833004 () Bool)

(declare-fun e!464632 () Option!423)

(assert (=> b!833004 (= e!464632 (getValueByKey!417 (t!22212 (toList!4469 lt!377967)) (_1!5052 lt!377756)))))

(declare-fun b!833005 () Bool)

(assert (=> b!833005 (= e!464632 None!421)))

(declare-fun b!833003 () Bool)

(assert (=> b!833003 (= e!464631 e!464632)))

(declare-fun c!90672 () Bool)

(assert (=> b!833003 (= c!90672 (and ((_ is Cons!15848) (toList!4469 lt!377967)) (not (= (_1!5052 (h!16984 (toList!4469 lt!377967))) (_1!5052 lt!377756)))))))

(declare-fun b!833002 () Bool)

(assert (=> b!833002 (= e!464631 (Some!422 (_2!5052 (h!16984 (toList!4469 lt!377967)))))))

(assert (= (and d!106701 c!90671) b!833002))

(assert (= (and d!106701 (not c!90671)) b!833003))

(assert (= (and b!833003 c!90672) b!833004))

(assert (= (and b!833003 (not c!90672)) b!833005))

(declare-fun m!777445 () Bool)

(assert (=> b!833004 m!777445))

(assert (=> b!832906 d!106701))

(declare-fun d!106703 () Bool)

(declare-fun e!464634 () Bool)

(assert (=> d!106703 e!464634))

(declare-fun res!566572 () Bool)

(assert (=> d!106703 (=> res!566572 e!464634)))

(declare-fun lt!378025 () Bool)

(assert (=> d!106703 (= res!566572 (not lt!378025))))

(declare-fun lt!378028 () Bool)

(assert (=> d!106703 (= lt!378025 lt!378028)))

(declare-fun lt!378026 () Unit!28510)

(declare-fun e!464633 () Unit!28510)

(assert (=> d!106703 (= lt!378026 e!464633)))

(declare-fun c!90673 () Bool)

(assert (=> d!106703 (= c!90673 lt!378028)))

(assert (=> d!106703 (= lt!378028 (containsKey!402 (toList!4469 lt!377854) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> d!106703 (= (contains!4189 lt!377854 (select (arr!22331 _keys!976) #b00000000000000000000000000000000)) lt!378025)))

(declare-fun b!833006 () Bool)

(declare-fun lt!378027 () Unit!28510)

(assert (=> b!833006 (= e!464633 lt!378027)))

(assert (=> b!833006 (= lt!378027 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377854) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!833006 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377854) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!833007 () Bool)

(declare-fun Unit!28519 () Unit!28510)

(assert (=> b!833007 (= e!464633 Unit!28519)))

(declare-fun b!833008 () Bool)

(assert (=> b!833008 (= e!464634 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377854) (select (arr!22331 _keys!976) #b00000000000000000000000000000000))))))

(assert (= (and d!106703 c!90673) b!833006))

(assert (= (and d!106703 (not c!90673)) b!833007))

(assert (= (and d!106703 (not res!566572)) b!833008))

(assert (=> d!106703 m!777093))

(declare-fun m!777447 () Bool)

(assert (=> d!106703 m!777447))

(assert (=> b!833006 m!777093))

(declare-fun m!777449 () Bool)

(assert (=> b!833006 m!777449))

(assert (=> b!833006 m!777093))

(declare-fun m!777451 () Bool)

(assert (=> b!833006 m!777451))

(assert (=> b!833006 m!777451))

(declare-fun m!777453 () Bool)

(assert (=> b!833006 m!777453))

(assert (=> b!833008 m!777093))

(assert (=> b!833008 m!777451))

(assert (=> b!833008 m!777451))

(assert (=> b!833008 m!777453))

(assert (=> b!832777 d!106703))

(assert (=> d!106627 d!106631))

(assert (=> d!106627 d!106629))

(declare-fun d!106705 () Bool)

(assert (=> d!106705 (= (getCurrentListMapNoExtraKeys!2539 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2539 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!106705 true))

(declare-fun _$13!49 () Unit!28510)

(assert (=> d!106705 (= (choose!1428 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) _$13!49)))

(declare-fun bs!23282 () Bool)

(assert (= bs!23282 d!106705))

(assert (=> bs!23282 m!776967))

(assert (=> bs!23282 m!776965))

(assert (=> d!106627 d!106705))

(assert (=> d!106627 d!106633))

(declare-fun d!106707 () Bool)

(declare-fun e!464636 () Bool)

(assert (=> d!106707 e!464636))

(declare-fun res!566573 () Bool)

(assert (=> d!106707 (=> res!566573 e!464636)))

(declare-fun lt!378029 () Bool)

(assert (=> d!106707 (= res!566573 (not lt!378029))))

(declare-fun lt!378032 () Bool)

(assert (=> d!106707 (= lt!378029 lt!378032)))

(declare-fun lt!378030 () Unit!28510)

(declare-fun e!464635 () Unit!28510)

(assert (=> d!106707 (= lt!378030 e!464635)))

(declare-fun c!90674 () Bool)

(assert (=> d!106707 (= c!90674 lt!378032)))

(assert (=> d!106707 (= lt!378032 (containsKey!402 (toList!4469 lt!377854) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!106707 (= (contains!4189 lt!377854 #b0000000000000000000000000000000000000000000000000000000000000000) lt!378029)))

(declare-fun b!833009 () Bool)

(declare-fun lt!378031 () Unit!28510)

(assert (=> b!833009 (= e!464635 lt!378031)))

(assert (=> b!833009 (= lt!378031 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377854) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!833009 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377854) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!833010 () Bool)

(declare-fun Unit!28520 () Unit!28510)

(assert (=> b!833010 (= e!464635 Unit!28520)))

(declare-fun b!833011 () Bool)

(assert (=> b!833011 (= e!464636 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377854) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106707 c!90674) b!833009))

(assert (= (and d!106707 (not c!90674)) b!833010))

(assert (= (and d!106707 (not res!566573)) b!833011))

(declare-fun m!777455 () Bool)

(assert (=> d!106707 m!777455))

(declare-fun m!777457 () Bool)

(assert (=> b!833009 m!777457))

(declare-fun m!777459 () Bool)

(assert (=> b!833009 m!777459))

(assert (=> b!833009 m!777459))

(declare-fun m!777461 () Bool)

(assert (=> b!833009 m!777461))

(assert (=> b!833011 m!777459))

(assert (=> b!833011 m!777459))

(assert (=> b!833011 m!777461))

(assert (=> d!106629 d!106707))

(assert (=> d!106629 d!106633))

(declare-fun b!833012 () Bool)

(declare-fun e!464637 () Bool)

(assert (=> b!833012 (= e!464637 (contains!4191 (ite c!90623 (Cons!15849 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) Nil!15850) Nil!15850) (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!833013 () Bool)

(declare-fun e!464638 () Bool)

(declare-fun call!36451 () Bool)

(assert (=> b!833013 (= e!464638 call!36451)))

(declare-fun b!833014 () Bool)

(declare-fun e!464640 () Bool)

(declare-fun e!464639 () Bool)

(assert (=> b!833014 (= e!464640 e!464639)))

(declare-fun res!566576 () Bool)

(assert (=> b!833014 (=> (not res!566576) (not e!464639))))

(assert (=> b!833014 (= res!566576 (not e!464637))))

(declare-fun res!566574 () Bool)

(assert (=> b!833014 (=> (not res!566574) (not e!464637))))

(assert (=> b!833014 (= res!566574 (validKeyInArray!0 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!833015 () Bool)

(assert (=> b!833015 (= e!464639 e!464638)))

(declare-fun c!90675 () Bool)

(assert (=> b!833015 (= c!90675 (validKeyInArray!0 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!833016 () Bool)

(assert (=> b!833016 (= e!464638 call!36451)))

(declare-fun bm!36448 () Bool)

(assert (=> bm!36448 (= call!36451 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!90675 (Cons!15849 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!90623 (Cons!15849 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) Nil!15850) Nil!15850)) (ite c!90623 (Cons!15849 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) Nil!15850) Nil!15850))))))

(declare-fun d!106709 () Bool)

(declare-fun res!566575 () Bool)

(assert (=> d!106709 (=> res!566575 e!464640)))

(assert (=> d!106709 (= res!566575 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22751 _keys!976)))))

(assert (=> d!106709 (= (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!90623 (Cons!15849 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) Nil!15850) Nil!15850)) e!464640)))

(assert (= (and d!106709 (not res!566575)) b!833014))

(assert (= (and b!833014 res!566574) b!833012))

(assert (= (and b!833014 res!566576) b!833015))

(assert (= (and b!833015 c!90675) b!833013))

(assert (= (and b!833015 (not c!90675)) b!833016))

(assert (= (or b!833013 b!833016) bm!36448))

(declare-fun m!777463 () Bool)

(assert (=> b!833012 m!777463))

(assert (=> b!833012 m!777463))

(declare-fun m!777465 () Bool)

(assert (=> b!833012 m!777465))

(assert (=> b!833014 m!777463))

(assert (=> b!833014 m!777463))

(declare-fun m!777467 () Bool)

(assert (=> b!833014 m!777467))

(assert (=> b!833015 m!777463))

(assert (=> b!833015 m!777463))

(assert (=> b!833015 m!777467))

(assert (=> bm!36448 m!777463))

(declare-fun m!777469 () Bool)

(assert (=> bm!36448 m!777469))

(assert (=> bm!36410 d!106709))

(declare-fun d!106711 () Bool)

(declare-fun e!464642 () Bool)

(assert (=> d!106711 e!464642))

(declare-fun res!566577 () Bool)

(assert (=> d!106711 (=> res!566577 e!464642)))

(declare-fun lt!378033 () Bool)

(assert (=> d!106711 (= res!566577 (not lt!378033))))

(declare-fun lt!378036 () Bool)

(assert (=> d!106711 (= lt!378033 lt!378036)))

(declare-fun lt!378034 () Unit!28510)

(declare-fun e!464641 () Unit!28510)

(assert (=> d!106711 (= lt!378034 e!464641)))

(declare-fun c!90676 () Bool)

(assert (=> d!106711 (= c!90676 lt!378036)))

(assert (=> d!106711 (= lt!378036 (containsKey!402 (toList!4469 lt!377861) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> d!106711 (= (contains!4189 lt!377861 (select (arr!22331 _keys!976) #b00000000000000000000000000000000)) lt!378033)))

(declare-fun b!833017 () Bool)

(declare-fun lt!378035 () Unit!28510)

(assert (=> b!833017 (= e!464641 lt!378035)))

(assert (=> b!833017 (= lt!378035 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377861) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!833017 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377861) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!833018 () Bool)

(declare-fun Unit!28521 () Unit!28510)

(assert (=> b!833018 (= e!464641 Unit!28521)))

(declare-fun b!833019 () Bool)

(assert (=> b!833019 (= e!464642 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377861) (select (arr!22331 _keys!976) #b00000000000000000000000000000000))))))

(assert (= (and d!106711 c!90676) b!833017))

(assert (= (and d!106711 (not c!90676)) b!833018))

(assert (= (and d!106711 (not res!566577)) b!833019))

(assert (=> d!106711 m!777093))

(declare-fun m!777471 () Bool)

(assert (=> d!106711 m!777471))

(assert (=> b!833017 m!777093))

(declare-fun m!777473 () Bool)

(assert (=> b!833017 m!777473))

(assert (=> b!833017 m!777093))

(declare-fun m!777475 () Bool)

(assert (=> b!833017 m!777475))

(assert (=> b!833017 m!777475))

(declare-fun m!777477 () Bool)

(assert (=> b!833017 m!777477))

(assert (=> b!833019 m!777093))

(assert (=> b!833019 m!777475))

(assert (=> b!833019 m!777475))

(assert (=> b!833019 m!777477))

(assert (=> b!832791 d!106711))

(declare-fun d!106713 () Bool)

(declare-fun c!90677 () Bool)

(assert (=> d!106713 (= c!90677 (and ((_ is Cons!15848) (toList!4469 lt!377971)) (= (_1!5052 (h!16984 (toList!4469 lt!377971))) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!464643 () Option!423)

(assert (=> d!106713 (= (getValueByKey!417 (toList!4469 lt!377971) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!464643)))

(declare-fun b!833022 () Bool)

(declare-fun e!464644 () Option!423)

(assert (=> b!833022 (= e!464644 (getValueByKey!417 (t!22212 (toList!4469 lt!377971)) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!833023 () Bool)

(assert (=> b!833023 (= e!464644 None!421)))

(declare-fun b!833021 () Bool)

(assert (=> b!833021 (= e!464643 e!464644)))

(declare-fun c!90678 () Bool)

(assert (=> b!833021 (= c!90678 (and ((_ is Cons!15848) (toList!4469 lt!377971)) (not (= (_1!5052 (h!16984 (toList!4469 lt!377971))) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun b!833020 () Bool)

(assert (=> b!833020 (= e!464643 (Some!422 (_2!5052 (h!16984 (toList!4469 lt!377971)))))))

(assert (= (and d!106713 c!90677) b!833020))

(assert (= (and d!106713 (not c!90677)) b!833021))

(assert (= (and b!833021 c!90678) b!833022))

(assert (= (and b!833021 (not c!90678)) b!833023))

(declare-fun m!777479 () Bool)

(assert (=> b!833022 m!777479))

(assert (=> b!832908 d!106713))

(declare-fun b!833024 () Bool)

(declare-fun e!464646 () Bool)

(declare-fun e!464651 () Bool)

(assert (=> b!833024 (= e!464646 e!464651)))

(assert (=> b!833024 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22751 _keys!976)))))

(declare-fun res!566579 () Bool)

(declare-fun lt!378037 () ListLongMap!8907)

(assert (=> b!833024 (= res!566579 (contains!4189 lt!378037 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!833024 (=> (not res!566579) (not e!464651))))

(declare-fun b!833025 () Bool)

(declare-fun e!464649 () Bool)

(assert (=> b!833025 (= e!464649 (isEmpty!663 lt!378037))))

(declare-fun b!833026 () Bool)

(declare-fun e!464647 () ListLongMap!8907)

(declare-fun e!464648 () ListLongMap!8907)

(assert (=> b!833026 (= e!464647 e!464648)))

(declare-fun c!90680 () Bool)

(assert (=> b!833026 (= c!90680 (validKeyInArray!0 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!833027 () Bool)

(assert (=> b!833027 (= e!464649 (= lt!378037 (getCurrentListMapNoExtraKeys!2539 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun bm!36449 () Bool)

(declare-fun call!36452 () ListLongMap!8907)

(assert (=> bm!36449 (= call!36452 (getCurrentListMapNoExtraKeys!2539 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!833028 () Bool)

(declare-fun e!464645 () Bool)

(assert (=> b!833028 (= e!464645 e!464646)))

(declare-fun c!90681 () Bool)

(declare-fun e!464650 () Bool)

(assert (=> b!833028 (= c!90681 e!464650)))

(declare-fun res!566578 () Bool)

(assert (=> b!833028 (=> (not res!566578) (not e!464650))))

(assert (=> b!833028 (= res!566578 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22751 _keys!976)))))

(declare-fun b!833029 () Bool)

(assert (=> b!833029 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22751 _keys!976)))))

(assert (=> b!833029 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22752 _values!788)))))

(assert (=> b!833029 (= e!464651 (= (apply!373 lt!378037 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!11826 (select (arr!22332 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!106715 () Bool)

(assert (=> d!106715 e!464645))

(declare-fun res!566580 () Bool)

(assert (=> d!106715 (=> (not res!566580) (not e!464645))))

(assert (=> d!106715 (= res!566580 (not (contains!4189 lt!378037 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106715 (= lt!378037 e!464647)))

(declare-fun c!90679 () Bool)

(assert (=> d!106715 (= c!90679 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22751 _keys!976)))))

(assert (=> d!106715 (validMask!0 mask!1312)))

(assert (=> d!106715 (= (getCurrentListMapNoExtraKeys!2539 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796) lt!378037)))

(declare-fun b!833030 () Bool)

(assert (=> b!833030 (= e!464646 e!464649)))

(declare-fun c!90682 () Bool)

(assert (=> b!833030 (= c!90682 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22751 _keys!976)))))

(declare-fun b!833031 () Bool)

(declare-fun res!566581 () Bool)

(assert (=> b!833031 (=> (not res!566581) (not e!464645))))

(assert (=> b!833031 (= res!566581 (not (contains!4189 lt!378037 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!833032 () Bool)

(assert (=> b!833032 (= e!464648 call!36452)))

(declare-fun b!833033 () Bool)

(assert (=> b!833033 (= e!464647 (ListLongMap!8908 Nil!15849))))

(declare-fun b!833034 () Bool)

(declare-fun lt!378042 () Unit!28510)

(declare-fun lt!378038 () Unit!28510)

(assert (=> b!833034 (= lt!378042 lt!378038)))

(declare-fun lt!378040 () ListLongMap!8907)

(declare-fun lt!378043 () V!25283)

(declare-fun lt!378039 () (_ BitVec 64))

(declare-fun lt!378041 () (_ BitVec 64))

(assert (=> b!833034 (not (contains!4189 (+!1991 lt!378040 (tuple2!10083 lt!378039 lt!378043)) lt!378041))))

(assert (=> b!833034 (= lt!378038 (addStillNotContains!200 lt!378040 lt!378039 lt!378043 lt!378041))))

(assert (=> b!833034 (= lt!378041 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!833034 (= lt!378043 (get!11826 (select (arr!22332 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!833034 (= lt!378039 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!833034 (= lt!378040 call!36452)))

(assert (=> b!833034 (= e!464648 (+!1991 call!36452 (tuple2!10083 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11826 (select (arr!22332 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!833035 () Bool)

(assert (=> b!833035 (= e!464650 (validKeyInArray!0 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!833035 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (= (and d!106715 c!90679) b!833033))

(assert (= (and d!106715 (not c!90679)) b!833026))

(assert (= (and b!833026 c!90680) b!833034))

(assert (= (and b!833026 (not c!90680)) b!833032))

(assert (= (or b!833034 b!833032) bm!36449))

(assert (= (and d!106715 res!566580) b!833031))

(assert (= (and b!833031 res!566581) b!833028))

(assert (= (and b!833028 res!566578) b!833035))

(assert (= (and b!833028 c!90681) b!833024))

(assert (= (and b!833028 (not c!90681)) b!833030))

(assert (= (and b!833024 res!566579) b!833029))

(assert (= (and b!833030 c!90682) b!833027))

(assert (= (and b!833030 (not c!90682)) b!833025))

(declare-fun b_lambda!11441 () Bool)

(assert (=> (not b_lambda!11441) (not b!833029)))

(assert (=> b!833029 t!22218))

(declare-fun b_and!22587 () Bool)

(assert (= b_and!22585 (and (=> t!22218 result!8013) b_and!22587)))

(declare-fun b_lambda!11443 () Bool)

(assert (=> (not b_lambda!11443) (not b!833034)))

(assert (=> b!833034 t!22218))

(declare-fun b_and!22589 () Bool)

(assert (= b_and!22587 (and (=> t!22218 result!8013) b_and!22589)))

(assert (=> b!833029 m!777463))

(declare-fun m!777481 () Bool)

(assert (=> b!833029 m!777481))

(assert (=> b!833029 m!777109))

(assert (=> b!833029 m!777463))

(declare-fun m!777483 () Bool)

(assert (=> b!833029 m!777483))

(assert (=> b!833029 m!777481))

(assert (=> b!833029 m!777109))

(declare-fun m!777485 () Bool)

(assert (=> b!833029 m!777485))

(assert (=> b!833026 m!777463))

(assert (=> b!833026 m!777463))

(assert (=> b!833026 m!777467))

(assert (=> b!833035 m!777463))

(assert (=> b!833035 m!777463))

(assert (=> b!833035 m!777467))

(declare-fun m!777487 () Bool)

(assert (=> b!833025 m!777487))

(declare-fun m!777489 () Bool)

(assert (=> b!833034 m!777489))

(assert (=> b!833034 m!777463))

(assert (=> b!833034 m!777481))

(assert (=> b!833034 m!777109))

(assert (=> b!833034 m!777489))

(declare-fun m!777491 () Bool)

(assert (=> b!833034 m!777491))

(declare-fun m!777493 () Bool)

(assert (=> b!833034 m!777493))

(declare-fun m!777495 () Bool)

(assert (=> b!833034 m!777495))

(assert (=> b!833034 m!777481))

(assert (=> b!833034 m!777109))

(assert (=> b!833034 m!777485))

(assert (=> b!833024 m!777463))

(assert (=> b!833024 m!777463))

(declare-fun m!777497 () Bool)

(assert (=> b!833024 m!777497))

(declare-fun m!777499 () Bool)

(assert (=> b!833027 m!777499))

(assert (=> bm!36449 m!777499))

(declare-fun m!777501 () Bool)

(assert (=> d!106715 m!777501))

(assert (=> d!106715 m!776931))

(declare-fun m!777503 () Bool)

(assert (=> b!833031 m!777503))

(assert (=> bm!36407 d!106715))

(declare-fun d!106717 () Bool)

(declare-fun lt!378044 () Bool)

(assert (=> d!106717 (= lt!378044 (select (content!388 (toList!4469 lt!377815)) lt!377756))))

(declare-fun e!464653 () Bool)

(assert (=> d!106717 (= lt!378044 e!464653)))

(declare-fun res!566583 () Bool)

(assert (=> d!106717 (=> (not res!566583) (not e!464653))))

(assert (=> d!106717 (= res!566583 ((_ is Cons!15848) (toList!4469 lt!377815)))))

(assert (=> d!106717 (= (contains!4190 (toList!4469 lt!377815) lt!377756) lt!378044)))

(declare-fun b!833036 () Bool)

(declare-fun e!464652 () Bool)

(assert (=> b!833036 (= e!464653 e!464652)))

(declare-fun res!566582 () Bool)

(assert (=> b!833036 (=> res!566582 e!464652)))

(assert (=> b!833036 (= res!566582 (= (h!16984 (toList!4469 lt!377815)) lt!377756))))

(declare-fun b!833037 () Bool)

(assert (=> b!833037 (= e!464652 (contains!4190 (t!22212 (toList!4469 lt!377815)) lt!377756))))

(assert (= (and d!106717 res!566583) b!833036))

(assert (= (and b!833036 (not res!566582)) b!833037))

(declare-fun m!777505 () Bool)

(assert (=> d!106717 m!777505))

(declare-fun m!777507 () Bool)

(assert (=> d!106717 m!777507))

(declare-fun m!777509 () Bool)

(assert (=> b!833037 m!777509))

(assert (=> b!832734 d!106717))

(assert (=> bm!36438 d!106629))

(assert (=> b!832779 d!106697))

(declare-fun d!106719 () Bool)

(declare-fun e!464655 () Bool)

(assert (=> d!106719 e!464655))

(declare-fun res!566584 () Bool)

(assert (=> d!106719 (=> res!566584 e!464655)))

(declare-fun lt!378045 () Bool)

(assert (=> d!106719 (= res!566584 (not lt!378045))))

(declare-fun lt!378048 () Bool)

(assert (=> d!106719 (= lt!378045 lt!378048)))

(declare-fun lt!378046 () Unit!28510)

(declare-fun e!464654 () Unit!28510)

(assert (=> d!106719 (= lt!378046 e!464654)))

(declare-fun c!90683 () Bool)

(assert (=> d!106719 (= c!90683 lt!378048)))

(assert (=> d!106719 (= lt!378048 (containsKey!402 (toList!4469 lt!377947) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!106719 (= (contains!4189 lt!377947 #b1000000000000000000000000000000000000000000000000000000000000000) lt!378045)))

(declare-fun b!833038 () Bool)

(declare-fun lt!378047 () Unit!28510)

(assert (=> b!833038 (= e!464654 lt!378047)))

(assert (=> b!833038 (= lt!378047 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377947) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!833038 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377947) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!833039 () Bool)

(declare-fun Unit!28522 () Unit!28510)

(assert (=> b!833039 (= e!464654 Unit!28522)))

(declare-fun b!833040 () Bool)

(assert (=> b!833040 (= e!464655 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377947) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106719 c!90683) b!833038))

(assert (= (and d!106719 (not c!90683)) b!833039))

(assert (= (and d!106719 (not res!566584)) b!833040))

(declare-fun m!777511 () Bool)

(assert (=> d!106719 m!777511))

(declare-fun m!777513 () Bool)

(assert (=> b!833038 m!777513))

(declare-fun m!777515 () Bool)

(assert (=> b!833038 m!777515))

(assert (=> b!833038 m!777515))

(declare-fun m!777517 () Bool)

(assert (=> b!833038 m!777517))

(assert (=> b!833040 m!777515))

(assert (=> b!833040 m!777515))

(assert (=> b!833040 m!777517))

(assert (=> bm!36432 d!106719))

(declare-fun d!106721 () Bool)

(assert (=> d!106721 (= (apply!373 lt!377854 (select (arr!22331 _keys!976) #b00000000000000000000000000000000)) (get!11827 (getValueByKey!417 (toList!4469 lt!377854) (select (arr!22331 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun bs!23283 () Bool)

(assert (= bs!23283 d!106721))

(assert (=> bs!23283 m!777093))

(assert (=> bs!23283 m!777451))

(assert (=> bs!23283 m!777451))

(declare-fun m!777519 () Bool)

(assert (=> bs!23283 m!777519))

(assert (=> b!832782 d!106721))

(declare-fun d!106723 () Bool)

(declare-fun c!90686 () Bool)

(assert (=> d!106723 (= c!90686 ((_ is ValueCellFull!7190) (select (arr!22332 _values!788) #b00000000000000000000000000000000)))))

(declare-fun e!464658 () V!25283)

(assert (=> d!106723 (= (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)) e!464658)))

(declare-fun b!833045 () Bool)

(declare-fun get!11828 (ValueCell!7190 V!25283) V!25283)

(assert (=> b!833045 (= e!464658 (get!11828 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!833046 () Bool)

(declare-fun get!11829 (ValueCell!7190 V!25283) V!25283)

(assert (=> b!833046 (= e!464658 (get!11829 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106723 c!90686) b!833045))

(assert (= (and d!106723 (not c!90686)) b!833046))

(assert (=> b!833045 m!777107))

(assert (=> b!833045 m!777109))

(declare-fun m!777521 () Bool)

(assert (=> b!833045 m!777521))

(assert (=> b!833046 m!777107))

(assert (=> b!833046 m!777109))

(declare-fun m!777523 () Bool)

(assert (=> b!833046 m!777523))

(assert (=> b!832782 d!106723))

(declare-fun d!106725 () Bool)

(declare-fun e!464660 () Bool)

(assert (=> d!106725 e!464660))

(declare-fun res!566585 () Bool)

(assert (=> d!106725 (=> res!566585 e!464660)))

(declare-fun lt!378049 () Bool)

(assert (=> d!106725 (= res!566585 (not lt!378049))))

(declare-fun lt!378052 () Bool)

(assert (=> d!106725 (= lt!378049 lt!378052)))

(declare-fun lt!378050 () Unit!28510)

(declare-fun e!464659 () Unit!28510)

(assert (=> d!106725 (= lt!378050 e!464659)))

(declare-fun c!90687 () Bool)

(assert (=> d!106725 (= c!90687 lt!378052)))

(assert (=> d!106725 (= lt!378052 (containsKey!402 (toList!4469 (+!1991 lt!377936 (tuple2!10083 lt!377935 zeroValueBefore!34))) lt!377926))))

(assert (=> d!106725 (= (contains!4189 (+!1991 lt!377936 (tuple2!10083 lt!377935 zeroValueBefore!34)) lt!377926) lt!378049)))

(declare-fun b!833047 () Bool)

(declare-fun lt!378051 () Unit!28510)

(assert (=> b!833047 (= e!464659 lt!378051)))

(assert (=> b!833047 (= lt!378051 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 (+!1991 lt!377936 (tuple2!10083 lt!377935 zeroValueBefore!34))) lt!377926))))

(assert (=> b!833047 (isDefined!312 (getValueByKey!417 (toList!4469 (+!1991 lt!377936 (tuple2!10083 lt!377935 zeroValueBefore!34))) lt!377926))))

(declare-fun b!833048 () Bool)

(declare-fun Unit!28523 () Unit!28510)

(assert (=> b!833048 (= e!464659 Unit!28523)))

(declare-fun b!833049 () Bool)

(assert (=> b!833049 (= e!464660 (isDefined!312 (getValueByKey!417 (toList!4469 (+!1991 lt!377936 (tuple2!10083 lt!377935 zeroValueBefore!34))) lt!377926)))))

(assert (= (and d!106725 c!90687) b!833047))

(assert (= (and d!106725 (not c!90687)) b!833048))

(assert (= (and d!106725 (not res!566585)) b!833049))

(declare-fun m!777525 () Bool)

(assert (=> d!106725 m!777525))

(declare-fun m!777527 () Bool)

(assert (=> b!833047 m!777527))

(declare-fun m!777529 () Bool)

(assert (=> b!833047 m!777529))

(assert (=> b!833047 m!777529))

(declare-fun m!777531 () Bool)

(assert (=> b!833047 m!777531))

(assert (=> b!833049 m!777529))

(assert (=> b!833049 m!777529))

(assert (=> b!833049 m!777531))

(assert (=> b!832876 d!106725))

(declare-fun d!106727 () Bool)

(assert (=> d!106727 (= (apply!373 (+!1991 lt!377934 (tuple2!10083 lt!377928 minValue!754)) lt!377937) (get!11827 (getValueByKey!417 (toList!4469 (+!1991 lt!377934 (tuple2!10083 lt!377928 minValue!754))) lt!377937)))))

(declare-fun bs!23284 () Bool)

(assert (= bs!23284 d!106727))

(declare-fun m!777533 () Bool)

(assert (=> bs!23284 m!777533))

(assert (=> bs!23284 m!777533))

(declare-fun m!777535 () Bool)

(assert (=> bs!23284 m!777535))

(assert (=> b!832876 d!106727))

(declare-fun d!106729 () Bool)

(assert (=> d!106729 (= (apply!373 lt!377934 lt!377937) (get!11827 (getValueByKey!417 (toList!4469 lt!377934) lt!377937)))))

(declare-fun bs!23285 () Bool)

(assert (= bs!23285 d!106729))

(declare-fun m!777537 () Bool)

(assert (=> bs!23285 m!777537))

(assert (=> bs!23285 m!777537))

(declare-fun m!777539 () Bool)

(assert (=> bs!23285 m!777539))

(assert (=> b!832876 d!106729))

(declare-fun d!106731 () Bool)

(declare-fun e!464661 () Bool)

(assert (=> d!106731 e!464661))

(declare-fun res!566587 () Bool)

(assert (=> d!106731 (=> (not res!566587) (not e!464661))))

(declare-fun lt!378056 () ListLongMap!8907)

(assert (=> d!106731 (= res!566587 (contains!4189 lt!378056 (_1!5052 (tuple2!10083 lt!377928 minValue!754))))))

(declare-fun lt!378055 () List!15852)

(assert (=> d!106731 (= lt!378056 (ListLongMap!8908 lt!378055))))

(declare-fun lt!378053 () Unit!28510)

(declare-fun lt!378054 () Unit!28510)

(assert (=> d!106731 (= lt!378053 lt!378054)))

(assert (=> d!106731 (= (getValueByKey!417 lt!378055 (_1!5052 (tuple2!10083 lt!377928 minValue!754))) (Some!422 (_2!5052 (tuple2!10083 lt!377928 minValue!754))))))

(assert (=> d!106731 (= lt!378054 (lemmaContainsTupThenGetReturnValue!231 lt!378055 (_1!5052 (tuple2!10083 lt!377928 minValue!754)) (_2!5052 (tuple2!10083 lt!377928 minValue!754))))))

(assert (=> d!106731 (= lt!378055 (insertStrictlySorted!270 (toList!4469 lt!377934) (_1!5052 (tuple2!10083 lt!377928 minValue!754)) (_2!5052 (tuple2!10083 lt!377928 minValue!754))))))

(assert (=> d!106731 (= (+!1991 lt!377934 (tuple2!10083 lt!377928 minValue!754)) lt!378056)))

(declare-fun b!833050 () Bool)

(declare-fun res!566586 () Bool)

(assert (=> b!833050 (=> (not res!566586) (not e!464661))))

(assert (=> b!833050 (= res!566586 (= (getValueByKey!417 (toList!4469 lt!378056) (_1!5052 (tuple2!10083 lt!377928 minValue!754))) (Some!422 (_2!5052 (tuple2!10083 lt!377928 minValue!754)))))))

(declare-fun b!833051 () Bool)

(assert (=> b!833051 (= e!464661 (contains!4190 (toList!4469 lt!378056) (tuple2!10083 lt!377928 minValue!754)))))

(assert (= (and d!106731 res!566587) b!833050))

(assert (= (and b!833050 res!566586) b!833051))

(declare-fun m!777541 () Bool)

(assert (=> d!106731 m!777541))

(declare-fun m!777543 () Bool)

(assert (=> d!106731 m!777543))

(declare-fun m!777545 () Bool)

(assert (=> d!106731 m!777545))

(declare-fun m!777547 () Bool)

(assert (=> d!106731 m!777547))

(declare-fun m!777549 () Bool)

(assert (=> b!833050 m!777549))

(declare-fun m!777551 () Bool)

(assert (=> b!833051 m!777551))

(assert (=> b!832876 d!106731))

(declare-fun d!106733 () Bool)

(assert (=> d!106733 (= (apply!373 (+!1991 lt!377923 (tuple2!10083 lt!377929 zeroValueBefore!34)) lt!377931) (get!11827 (getValueByKey!417 (toList!4469 (+!1991 lt!377923 (tuple2!10083 lt!377929 zeroValueBefore!34))) lt!377931)))))

(declare-fun bs!23286 () Bool)

(assert (= bs!23286 d!106733))

(declare-fun m!777553 () Bool)

(assert (=> bs!23286 m!777553))

(assert (=> bs!23286 m!777553))

(declare-fun m!777555 () Bool)

(assert (=> bs!23286 m!777555))

(assert (=> b!832876 d!106733))

(declare-fun d!106735 () Bool)

(declare-fun e!464662 () Bool)

(assert (=> d!106735 e!464662))

(declare-fun res!566589 () Bool)

(assert (=> d!106735 (=> (not res!566589) (not e!464662))))

(declare-fun lt!378060 () ListLongMap!8907)

(assert (=> d!106735 (= res!566589 (contains!4189 lt!378060 (_1!5052 (tuple2!10083 lt!377935 zeroValueBefore!34))))))

(declare-fun lt!378059 () List!15852)

(assert (=> d!106735 (= lt!378060 (ListLongMap!8908 lt!378059))))

(declare-fun lt!378057 () Unit!28510)

(declare-fun lt!378058 () Unit!28510)

(assert (=> d!106735 (= lt!378057 lt!378058)))

(assert (=> d!106735 (= (getValueByKey!417 lt!378059 (_1!5052 (tuple2!10083 lt!377935 zeroValueBefore!34))) (Some!422 (_2!5052 (tuple2!10083 lt!377935 zeroValueBefore!34))))))

(assert (=> d!106735 (= lt!378058 (lemmaContainsTupThenGetReturnValue!231 lt!378059 (_1!5052 (tuple2!10083 lt!377935 zeroValueBefore!34)) (_2!5052 (tuple2!10083 lt!377935 zeroValueBefore!34))))))

(assert (=> d!106735 (= lt!378059 (insertStrictlySorted!270 (toList!4469 lt!377936) (_1!5052 (tuple2!10083 lt!377935 zeroValueBefore!34)) (_2!5052 (tuple2!10083 lt!377935 zeroValueBefore!34))))))

(assert (=> d!106735 (= (+!1991 lt!377936 (tuple2!10083 lt!377935 zeroValueBefore!34)) lt!378060)))

(declare-fun b!833052 () Bool)

(declare-fun res!566588 () Bool)

(assert (=> b!833052 (=> (not res!566588) (not e!464662))))

(assert (=> b!833052 (= res!566588 (= (getValueByKey!417 (toList!4469 lt!378060) (_1!5052 (tuple2!10083 lt!377935 zeroValueBefore!34))) (Some!422 (_2!5052 (tuple2!10083 lt!377935 zeroValueBefore!34)))))))

(declare-fun b!833053 () Bool)

(assert (=> b!833053 (= e!464662 (contains!4190 (toList!4469 lt!378060) (tuple2!10083 lt!377935 zeroValueBefore!34)))))

(assert (= (and d!106735 res!566589) b!833052))

(assert (= (and b!833052 res!566588) b!833053))

(declare-fun m!777557 () Bool)

(assert (=> d!106735 m!777557))

(declare-fun m!777559 () Bool)

(assert (=> d!106735 m!777559))

(declare-fun m!777561 () Bool)

(assert (=> d!106735 m!777561))

(declare-fun m!777563 () Bool)

(assert (=> d!106735 m!777563))

(declare-fun m!777565 () Bool)

(assert (=> b!833052 m!777565))

(declare-fun m!777567 () Bool)

(assert (=> b!833053 m!777567))

(assert (=> b!832876 d!106735))

(declare-fun d!106737 () Bool)

(assert (=> d!106737 (= (apply!373 (+!1991 lt!377921 (tuple2!10083 lt!377933 minValue!754)) lt!377924) (get!11827 (getValueByKey!417 (toList!4469 (+!1991 lt!377921 (tuple2!10083 lt!377933 minValue!754))) lt!377924)))))

(declare-fun bs!23287 () Bool)

(assert (= bs!23287 d!106737))

(declare-fun m!777569 () Bool)

(assert (=> bs!23287 m!777569))

(assert (=> bs!23287 m!777569))

(declare-fun m!777571 () Bool)

(assert (=> bs!23287 m!777571))

(assert (=> b!832876 d!106737))

(assert (=> b!832876 d!106631))

(declare-fun d!106739 () Bool)

(assert (=> d!106739 (= (apply!373 (+!1991 lt!377923 (tuple2!10083 lt!377929 zeroValueBefore!34)) lt!377931) (apply!373 lt!377923 lt!377931))))

(declare-fun lt!378061 () Unit!28510)

(assert (=> d!106739 (= lt!378061 (choose!1430 lt!377923 lt!377929 zeroValueBefore!34 lt!377931))))

(declare-fun e!464663 () Bool)

(assert (=> d!106739 e!464663))

(declare-fun res!566590 () Bool)

(assert (=> d!106739 (=> (not res!566590) (not e!464663))))

(assert (=> d!106739 (= res!566590 (contains!4189 lt!377923 lt!377931))))

(assert (=> d!106739 (= (addApplyDifferent!324 lt!377923 lt!377929 zeroValueBefore!34 lt!377931) lt!378061)))

(declare-fun b!833054 () Bool)

(assert (=> b!833054 (= e!464663 (not (= lt!377931 lt!377929)))))

(assert (= (and d!106739 res!566590) b!833054))

(declare-fun m!777573 () Bool)

(assert (=> d!106739 m!777573))

(assert (=> d!106739 m!777215))

(declare-fun m!777575 () Bool)

(assert (=> d!106739 m!777575))

(assert (=> d!106739 m!777207))

(assert (=> d!106739 m!777209))

(assert (=> d!106739 m!777207))

(assert (=> b!832876 d!106739))

(declare-fun d!106741 () Bool)

(declare-fun e!464664 () Bool)

(assert (=> d!106741 e!464664))

(declare-fun res!566592 () Bool)

(assert (=> d!106741 (=> (not res!566592) (not e!464664))))

(declare-fun lt!378065 () ListLongMap!8907)

(assert (=> d!106741 (= res!566592 (contains!4189 lt!378065 (_1!5052 (tuple2!10083 lt!377929 zeroValueBefore!34))))))

(declare-fun lt!378064 () List!15852)

(assert (=> d!106741 (= lt!378065 (ListLongMap!8908 lt!378064))))

(declare-fun lt!378062 () Unit!28510)

(declare-fun lt!378063 () Unit!28510)

(assert (=> d!106741 (= lt!378062 lt!378063)))

(assert (=> d!106741 (= (getValueByKey!417 lt!378064 (_1!5052 (tuple2!10083 lt!377929 zeroValueBefore!34))) (Some!422 (_2!5052 (tuple2!10083 lt!377929 zeroValueBefore!34))))))

(assert (=> d!106741 (= lt!378063 (lemmaContainsTupThenGetReturnValue!231 lt!378064 (_1!5052 (tuple2!10083 lt!377929 zeroValueBefore!34)) (_2!5052 (tuple2!10083 lt!377929 zeroValueBefore!34))))))

(assert (=> d!106741 (= lt!378064 (insertStrictlySorted!270 (toList!4469 lt!377923) (_1!5052 (tuple2!10083 lt!377929 zeroValueBefore!34)) (_2!5052 (tuple2!10083 lt!377929 zeroValueBefore!34))))))

(assert (=> d!106741 (= (+!1991 lt!377923 (tuple2!10083 lt!377929 zeroValueBefore!34)) lt!378065)))

(declare-fun b!833055 () Bool)

(declare-fun res!566591 () Bool)

(assert (=> b!833055 (=> (not res!566591) (not e!464664))))

(assert (=> b!833055 (= res!566591 (= (getValueByKey!417 (toList!4469 lt!378065) (_1!5052 (tuple2!10083 lt!377929 zeroValueBefore!34))) (Some!422 (_2!5052 (tuple2!10083 lt!377929 zeroValueBefore!34)))))))

(declare-fun b!833056 () Bool)

(assert (=> b!833056 (= e!464664 (contains!4190 (toList!4469 lt!378065) (tuple2!10083 lt!377929 zeroValueBefore!34)))))

(assert (= (and d!106741 res!566592) b!833055))

(assert (= (and b!833055 res!566591) b!833056))

(declare-fun m!777577 () Bool)

(assert (=> d!106741 m!777577))

(declare-fun m!777579 () Bool)

(assert (=> d!106741 m!777579))

(declare-fun m!777581 () Bool)

(assert (=> d!106741 m!777581))

(declare-fun m!777583 () Bool)

(assert (=> d!106741 m!777583))

(declare-fun m!777585 () Bool)

(assert (=> b!833055 m!777585))

(declare-fun m!777587 () Bool)

(assert (=> b!833056 m!777587))

(assert (=> b!832876 d!106741))

(declare-fun d!106743 () Bool)

(declare-fun e!464665 () Bool)

(assert (=> d!106743 e!464665))

(declare-fun res!566594 () Bool)

(assert (=> d!106743 (=> (not res!566594) (not e!464665))))

(declare-fun lt!378069 () ListLongMap!8907)

(assert (=> d!106743 (= res!566594 (contains!4189 lt!378069 (_1!5052 (tuple2!10083 lt!377933 minValue!754))))))

(declare-fun lt!378068 () List!15852)

(assert (=> d!106743 (= lt!378069 (ListLongMap!8908 lt!378068))))

(declare-fun lt!378066 () Unit!28510)

(declare-fun lt!378067 () Unit!28510)

(assert (=> d!106743 (= lt!378066 lt!378067)))

(assert (=> d!106743 (= (getValueByKey!417 lt!378068 (_1!5052 (tuple2!10083 lt!377933 minValue!754))) (Some!422 (_2!5052 (tuple2!10083 lt!377933 minValue!754))))))

(assert (=> d!106743 (= lt!378067 (lemmaContainsTupThenGetReturnValue!231 lt!378068 (_1!5052 (tuple2!10083 lt!377933 minValue!754)) (_2!5052 (tuple2!10083 lt!377933 minValue!754))))))

(assert (=> d!106743 (= lt!378068 (insertStrictlySorted!270 (toList!4469 lt!377921) (_1!5052 (tuple2!10083 lt!377933 minValue!754)) (_2!5052 (tuple2!10083 lt!377933 minValue!754))))))

(assert (=> d!106743 (= (+!1991 lt!377921 (tuple2!10083 lt!377933 minValue!754)) lt!378069)))

(declare-fun b!833057 () Bool)

(declare-fun res!566593 () Bool)

(assert (=> b!833057 (=> (not res!566593) (not e!464665))))

(assert (=> b!833057 (= res!566593 (= (getValueByKey!417 (toList!4469 lt!378069) (_1!5052 (tuple2!10083 lt!377933 minValue!754))) (Some!422 (_2!5052 (tuple2!10083 lt!377933 minValue!754)))))))

(declare-fun b!833058 () Bool)

(assert (=> b!833058 (= e!464665 (contains!4190 (toList!4469 lt!378069) (tuple2!10083 lt!377933 minValue!754)))))

(assert (= (and d!106743 res!566594) b!833057))

(assert (= (and b!833057 res!566593) b!833058))

(declare-fun m!777589 () Bool)

(assert (=> d!106743 m!777589))

(declare-fun m!777591 () Bool)

(assert (=> d!106743 m!777591))

(declare-fun m!777593 () Bool)

(assert (=> d!106743 m!777593))

(declare-fun m!777595 () Bool)

(assert (=> d!106743 m!777595))

(declare-fun m!777597 () Bool)

(assert (=> b!833057 m!777597))

(declare-fun m!777599 () Bool)

(assert (=> b!833058 m!777599))

(assert (=> b!832876 d!106743))

(declare-fun d!106745 () Bool)

(assert (=> d!106745 (= (apply!373 lt!377923 lt!377931) (get!11827 (getValueByKey!417 (toList!4469 lt!377923) lt!377931)))))

(declare-fun bs!23288 () Bool)

(assert (= bs!23288 d!106745))

(declare-fun m!777601 () Bool)

(assert (=> bs!23288 m!777601))

(assert (=> bs!23288 m!777601))

(declare-fun m!777603 () Bool)

(assert (=> bs!23288 m!777603))

(assert (=> b!832876 d!106745))

(declare-fun d!106747 () Bool)

(assert (=> d!106747 (= (apply!373 (+!1991 lt!377934 (tuple2!10083 lt!377928 minValue!754)) lt!377937) (apply!373 lt!377934 lt!377937))))

(declare-fun lt!378070 () Unit!28510)

(assert (=> d!106747 (= lt!378070 (choose!1430 lt!377934 lt!377928 minValue!754 lt!377937))))

(declare-fun e!464666 () Bool)

(assert (=> d!106747 e!464666))

(declare-fun res!566595 () Bool)

(assert (=> d!106747 (=> (not res!566595) (not e!464666))))

(assert (=> d!106747 (= res!566595 (contains!4189 lt!377934 lt!377937))))

(assert (=> d!106747 (= (addApplyDifferent!324 lt!377934 lt!377928 minValue!754 lt!377937) lt!378070)))

(declare-fun b!833059 () Bool)

(assert (=> b!833059 (= e!464666 (not (= lt!377937 lt!377928)))))

(assert (= (and d!106747 res!566595) b!833059))

(declare-fun m!777605 () Bool)

(assert (=> d!106747 m!777605))

(assert (=> d!106747 m!777221))

(declare-fun m!777607 () Bool)

(assert (=> d!106747 m!777607))

(assert (=> d!106747 m!777203))

(assert (=> d!106747 m!777205))

(assert (=> d!106747 m!777203))

(assert (=> b!832876 d!106747))

(declare-fun d!106749 () Bool)

(assert (=> d!106749 (= (apply!373 lt!377921 lt!377924) (get!11827 (getValueByKey!417 (toList!4469 lt!377921) lt!377924)))))

(declare-fun bs!23289 () Bool)

(assert (= bs!23289 d!106749))

(declare-fun m!777609 () Bool)

(assert (=> bs!23289 m!777609))

(assert (=> bs!23289 m!777609))

(declare-fun m!777611 () Bool)

(assert (=> bs!23289 m!777611))

(assert (=> b!832876 d!106749))

(declare-fun d!106751 () Bool)

(assert (=> d!106751 (= (apply!373 (+!1991 lt!377921 (tuple2!10083 lt!377933 minValue!754)) lt!377924) (apply!373 lt!377921 lt!377924))))

(declare-fun lt!378071 () Unit!28510)

(assert (=> d!106751 (= lt!378071 (choose!1430 lt!377921 lt!377933 minValue!754 lt!377924))))

(declare-fun e!464667 () Bool)

(assert (=> d!106751 e!464667))

(declare-fun res!566596 () Bool)

(assert (=> d!106751 (=> (not res!566596) (not e!464667))))

(assert (=> d!106751 (= res!566596 (contains!4189 lt!377921 lt!377924))))

(assert (=> d!106751 (= (addApplyDifferent!324 lt!377921 lt!377933 minValue!754 lt!377924) lt!378071)))

(declare-fun b!833060 () Bool)

(assert (=> b!833060 (= e!464667 (not (= lt!377924 lt!377933)))))

(assert (= (and d!106751 res!566596) b!833060))

(declare-fun m!777613 () Bool)

(assert (=> d!106751 m!777613))

(assert (=> d!106751 m!777211))

(declare-fun m!777615 () Bool)

(assert (=> d!106751 m!777615))

(assert (=> d!106751 m!777199))

(assert (=> d!106751 m!777201))

(assert (=> d!106751 m!777199))

(assert (=> b!832876 d!106751))

(declare-fun d!106753 () Bool)

(assert (=> d!106753 (contains!4189 (+!1991 lt!377936 (tuple2!10083 lt!377935 zeroValueBefore!34)) lt!377926)))

(declare-fun lt!378072 () Unit!28510)

(assert (=> d!106753 (= lt!378072 (choose!1431 lt!377936 lt!377935 zeroValueBefore!34 lt!377926))))

(assert (=> d!106753 (contains!4189 lt!377936 lt!377926)))

(assert (=> d!106753 (= (addStillContains!324 lt!377936 lt!377935 zeroValueBefore!34 lt!377926) lt!378072)))

(declare-fun bs!23290 () Bool)

(assert (= bs!23290 d!106753))

(assert (=> bs!23290 m!777217))

(assert (=> bs!23290 m!777217))

(assert (=> bs!23290 m!777219))

(declare-fun m!777617 () Bool)

(assert (=> bs!23290 m!777617))

(declare-fun m!777619 () Bool)

(assert (=> bs!23290 m!777619))

(assert (=> b!832876 d!106753))

(declare-fun d!106755 () Bool)

(declare-fun lt!378073 () Bool)

(assert (=> d!106755 (= lt!378073 (select (content!388 (toList!4469 lt!377823)) lt!377761))))

(declare-fun e!464669 () Bool)

(assert (=> d!106755 (= lt!378073 e!464669)))

(declare-fun res!566598 () Bool)

(assert (=> d!106755 (=> (not res!566598) (not e!464669))))

(assert (=> d!106755 (= res!566598 ((_ is Cons!15848) (toList!4469 lt!377823)))))

(assert (=> d!106755 (= (contains!4190 (toList!4469 lt!377823) lt!377761) lt!378073)))

(declare-fun b!833061 () Bool)

(declare-fun e!464668 () Bool)

(assert (=> b!833061 (= e!464669 e!464668)))

(declare-fun res!566597 () Bool)

(assert (=> b!833061 (=> res!566597 e!464668)))

(assert (=> b!833061 (= res!566597 (= (h!16984 (toList!4469 lt!377823)) lt!377761))))

(declare-fun b!833062 () Bool)

(assert (=> b!833062 (= e!464668 (contains!4190 (t!22212 (toList!4469 lt!377823)) lt!377761))))

(assert (= (and d!106755 res!566598) b!833061))

(assert (= (and b!833061 (not res!566597)) b!833062))

(declare-fun m!777621 () Bool)

(assert (=> d!106755 m!777621))

(declare-fun m!777623 () Bool)

(assert (=> d!106755 m!777623))

(declare-fun m!777625 () Bool)

(assert (=> b!833062 m!777625))

(assert (=> b!832738 d!106755))

(assert (=> d!106647 d!106633))

(declare-fun d!106757 () Bool)

(declare-fun e!464671 () Bool)

(assert (=> d!106757 e!464671))

(declare-fun res!566599 () Bool)

(assert (=> d!106757 (=> res!566599 e!464671)))

(declare-fun lt!378074 () Bool)

(assert (=> d!106757 (= res!566599 (not lt!378074))))

(declare-fun lt!378077 () Bool)

(assert (=> d!106757 (= lt!378074 lt!378077)))

(declare-fun lt!378075 () Unit!28510)

(declare-fun e!464670 () Unit!28510)

(assert (=> d!106757 (= lt!378075 e!464670)))

(declare-fun c!90688 () Bool)

(assert (=> d!106757 (= c!90688 lt!378077)))

(assert (=> d!106757 (= lt!378077 (containsKey!402 (toList!4469 lt!377871) (_1!5052 lt!377761)))))

(assert (=> d!106757 (= (contains!4189 lt!377871 (_1!5052 lt!377761)) lt!378074)))

(declare-fun b!833063 () Bool)

(declare-fun lt!378076 () Unit!28510)

(assert (=> b!833063 (= e!464670 lt!378076)))

(assert (=> b!833063 (= lt!378076 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377871) (_1!5052 lt!377761)))))

(assert (=> b!833063 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377871) (_1!5052 lt!377761)))))

(declare-fun b!833064 () Bool)

(declare-fun Unit!28524 () Unit!28510)

(assert (=> b!833064 (= e!464670 Unit!28524)))

(declare-fun b!833065 () Bool)

(assert (=> b!833065 (= e!464671 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377871) (_1!5052 lt!377761))))))

(assert (= (and d!106757 c!90688) b!833063))

(assert (= (and d!106757 (not c!90688)) b!833064))

(assert (= (and d!106757 (not res!566599)) b!833065))

(declare-fun m!777627 () Bool)

(assert (=> d!106757 m!777627))

(declare-fun m!777629 () Bool)

(assert (=> b!833063 m!777629))

(assert (=> b!833063 m!777165))

(assert (=> b!833063 m!777165))

(declare-fun m!777631 () Bool)

(assert (=> b!833063 m!777631))

(assert (=> b!833065 m!777165))

(assert (=> b!833065 m!777165))

(assert (=> b!833065 m!777631))

(assert (=> d!106641 d!106757))

(declare-fun d!106759 () Bool)

(declare-fun c!90689 () Bool)

(assert (=> d!106759 (= c!90689 (and ((_ is Cons!15848) lt!377870) (= (_1!5052 (h!16984 lt!377870)) (_1!5052 lt!377761))))))

(declare-fun e!464672 () Option!423)

(assert (=> d!106759 (= (getValueByKey!417 lt!377870 (_1!5052 lt!377761)) e!464672)))

(declare-fun b!833068 () Bool)

(declare-fun e!464673 () Option!423)

(assert (=> b!833068 (= e!464673 (getValueByKey!417 (t!22212 lt!377870) (_1!5052 lt!377761)))))

(declare-fun b!833069 () Bool)

(assert (=> b!833069 (= e!464673 None!421)))

(declare-fun b!833067 () Bool)

(assert (=> b!833067 (= e!464672 e!464673)))

(declare-fun c!90690 () Bool)

(assert (=> b!833067 (= c!90690 (and ((_ is Cons!15848) lt!377870) (not (= (_1!5052 (h!16984 lt!377870)) (_1!5052 lt!377761)))))))

(declare-fun b!833066 () Bool)

(assert (=> b!833066 (= e!464672 (Some!422 (_2!5052 (h!16984 lt!377870))))))

(assert (= (and d!106759 c!90689) b!833066))

(assert (= (and d!106759 (not c!90689)) b!833067))

(assert (= (and b!833067 c!90690) b!833068))

(assert (= (and b!833067 (not c!90690)) b!833069))

(declare-fun m!777633 () Bool)

(assert (=> b!833068 m!777633))

(assert (=> d!106641 d!106759))

(declare-fun d!106761 () Bool)

(assert (=> d!106761 (= (getValueByKey!417 lt!377870 (_1!5052 lt!377761)) (Some!422 (_2!5052 lt!377761)))))

(declare-fun lt!378078 () Unit!28510)

(assert (=> d!106761 (= lt!378078 (choose!1429 lt!377870 (_1!5052 lt!377761) (_2!5052 lt!377761)))))

(declare-fun e!464674 () Bool)

(assert (=> d!106761 e!464674))

(declare-fun res!566600 () Bool)

(assert (=> d!106761 (=> (not res!566600) (not e!464674))))

(assert (=> d!106761 (= res!566600 (isStrictlySorted!430 lt!377870))))

(assert (=> d!106761 (= (lemmaContainsTupThenGetReturnValue!231 lt!377870 (_1!5052 lt!377761) (_2!5052 lt!377761)) lt!378078)))

(declare-fun b!833070 () Bool)

(declare-fun res!566601 () Bool)

(assert (=> b!833070 (=> (not res!566601) (not e!464674))))

(assert (=> b!833070 (= res!566601 (containsKey!402 lt!377870 (_1!5052 lt!377761)))))

(declare-fun b!833071 () Bool)

(assert (=> b!833071 (= e!464674 (contains!4190 lt!377870 (tuple2!10083 (_1!5052 lt!377761) (_2!5052 lt!377761))))))

(assert (= (and d!106761 res!566600) b!833070))

(assert (= (and b!833070 res!566601) b!833071))

(assert (=> d!106761 m!777159))

(declare-fun m!777635 () Bool)

(assert (=> d!106761 m!777635))

(declare-fun m!777637 () Bool)

(assert (=> d!106761 m!777637))

(declare-fun m!777639 () Bool)

(assert (=> b!833070 m!777639))

(declare-fun m!777641 () Bool)

(assert (=> b!833071 m!777641))

(assert (=> d!106641 d!106761))

(declare-fun e!464676 () List!15852)

(declare-fun bm!36450 () Bool)

(declare-fun c!90691 () Bool)

(declare-fun call!36454 () List!15852)

(assert (=> bm!36450 (= call!36454 ($colon$colon!534 e!464676 (ite c!90691 (h!16984 (toList!4469 lt!377760)) (tuple2!10083 (_1!5052 lt!377761) (_2!5052 lt!377761)))))))

(declare-fun c!90694 () Bool)

(assert (=> bm!36450 (= c!90694 c!90691)))

(declare-fun bm!36451 () Bool)

(declare-fun call!36455 () List!15852)

(assert (=> bm!36451 (= call!36455 call!36454)))

(declare-fun bm!36452 () Bool)

(declare-fun call!36453 () List!15852)

(assert (=> bm!36452 (= call!36453 call!36455)))

(declare-fun b!833072 () Bool)

(declare-fun c!90692 () Bool)

(assert (=> b!833072 (= c!90692 (and ((_ is Cons!15848) (toList!4469 lt!377760)) (bvsgt (_1!5052 (h!16984 (toList!4469 lt!377760))) (_1!5052 lt!377761))))))

(declare-fun e!464675 () List!15852)

(declare-fun e!464678 () List!15852)

(assert (=> b!833072 (= e!464675 e!464678)))

(declare-fun b!833073 () Bool)

(assert (=> b!833073 (= e!464678 call!36453)))

(declare-fun b!833074 () Bool)

(assert (=> b!833074 (= e!464676 (insertStrictlySorted!270 (t!22212 (toList!4469 lt!377760)) (_1!5052 lt!377761) (_2!5052 lt!377761)))))

(declare-fun b!833075 () Bool)

(declare-fun e!464677 () List!15852)

(assert (=> b!833075 (= e!464677 call!36454)))

(declare-fun b!833076 () Bool)

(declare-fun e!464679 () Bool)

(declare-fun lt!378079 () List!15852)

(assert (=> b!833076 (= e!464679 (contains!4190 lt!378079 (tuple2!10083 (_1!5052 lt!377761) (_2!5052 lt!377761))))))

(declare-fun b!833077 () Bool)

(declare-fun c!90693 () Bool)

(assert (=> b!833077 (= e!464676 (ite c!90693 (t!22212 (toList!4469 lt!377760)) (ite c!90692 (Cons!15848 (h!16984 (toList!4469 lt!377760)) (t!22212 (toList!4469 lt!377760))) Nil!15849)))))

(declare-fun b!833078 () Bool)

(assert (=> b!833078 (= e!464677 e!464675)))

(assert (=> b!833078 (= c!90693 (and ((_ is Cons!15848) (toList!4469 lt!377760)) (= (_1!5052 (h!16984 (toList!4469 lt!377760))) (_1!5052 lt!377761))))))

(declare-fun b!833079 () Bool)

(assert (=> b!833079 (= e!464675 call!36455)))

(declare-fun b!833080 () Bool)

(declare-fun res!566603 () Bool)

(assert (=> b!833080 (=> (not res!566603) (not e!464679))))

(assert (=> b!833080 (= res!566603 (containsKey!402 lt!378079 (_1!5052 lt!377761)))))

(declare-fun d!106763 () Bool)

(assert (=> d!106763 e!464679))

(declare-fun res!566602 () Bool)

(assert (=> d!106763 (=> (not res!566602) (not e!464679))))

(assert (=> d!106763 (= res!566602 (isStrictlySorted!430 lt!378079))))

(assert (=> d!106763 (= lt!378079 e!464677)))

(assert (=> d!106763 (= c!90691 (and ((_ is Cons!15848) (toList!4469 lt!377760)) (bvslt (_1!5052 (h!16984 (toList!4469 lt!377760))) (_1!5052 lt!377761))))))

(assert (=> d!106763 (isStrictlySorted!430 (toList!4469 lt!377760))))

(assert (=> d!106763 (= (insertStrictlySorted!270 (toList!4469 lt!377760) (_1!5052 lt!377761) (_2!5052 lt!377761)) lt!378079)))

(declare-fun b!833081 () Bool)

(assert (=> b!833081 (= e!464678 call!36453)))

(assert (= (and d!106763 c!90691) b!833075))

(assert (= (and d!106763 (not c!90691)) b!833078))

(assert (= (and b!833078 c!90693) b!833079))

(assert (= (and b!833078 (not c!90693)) b!833072))

(assert (= (and b!833072 c!90692) b!833073))

(assert (= (and b!833072 (not c!90692)) b!833081))

(assert (= (or b!833073 b!833081) bm!36452))

(assert (= (or b!833079 bm!36452) bm!36451))

(assert (= (or b!833075 bm!36451) bm!36450))

(assert (= (and bm!36450 c!90694) b!833074))

(assert (= (and bm!36450 (not c!90694)) b!833077))

(assert (= (and d!106763 res!566602) b!833080))

(assert (= (and b!833080 res!566603) b!833076))

(declare-fun m!777643 () Bool)

(assert (=> bm!36450 m!777643))

(declare-fun m!777645 () Bool)

(assert (=> b!833076 m!777645))

(declare-fun m!777647 () Bool)

(assert (=> b!833074 m!777647))

(declare-fun m!777649 () Bool)

(assert (=> b!833080 m!777649))

(declare-fun m!777651 () Bool)

(assert (=> d!106763 m!777651))

(declare-fun m!777653 () Bool)

(assert (=> d!106763 m!777653))

(assert (=> d!106641 d!106763))

(declare-fun d!106765 () Bool)

(assert (=> d!106765 (= (apply!373 lt!377861 (select (arr!22331 _keys!976) #b00000000000000000000000000000000)) (get!11827 (getValueByKey!417 (toList!4469 lt!377861) (select (arr!22331 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun bs!23291 () Bool)

(assert (= bs!23291 d!106765))

(assert (=> bs!23291 m!777093))

(assert (=> bs!23291 m!777475))

(assert (=> bs!23291 m!777475))

(declare-fun m!777655 () Bool)

(assert (=> bs!23291 m!777655))

(assert (=> b!832796 d!106765))

(assert (=> b!832796 d!106723))

(declare-fun b!833082 () Bool)

(declare-fun e!464681 () Bool)

(declare-fun e!464686 () Bool)

(assert (=> b!833082 (= e!464681 e!464686)))

(assert (=> b!833082 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22751 _keys!976)))))

(declare-fun res!566605 () Bool)

(declare-fun lt!378080 () ListLongMap!8907)

(assert (=> b!833082 (= res!566605 (contains!4189 lt!378080 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!833082 (=> (not res!566605) (not e!464686))))

(declare-fun b!833083 () Bool)

(declare-fun e!464684 () Bool)

(assert (=> b!833083 (= e!464684 (isEmpty!663 lt!378080))))

(declare-fun b!833084 () Bool)

(declare-fun e!464682 () ListLongMap!8907)

(declare-fun e!464683 () ListLongMap!8907)

(assert (=> b!833084 (= e!464682 e!464683)))

(declare-fun c!90696 () Bool)

(assert (=> b!833084 (= c!90696 (validKeyInArray!0 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!833085 () Bool)

(assert (=> b!833085 (= e!464684 (= lt!378080 (getCurrentListMapNoExtraKeys!2539 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun bm!36453 () Bool)

(declare-fun call!36456 () ListLongMap!8907)

(assert (=> bm!36453 (= call!36456 (getCurrentListMapNoExtraKeys!2539 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!833086 () Bool)

(declare-fun e!464680 () Bool)

(assert (=> b!833086 (= e!464680 e!464681)))

(declare-fun c!90697 () Bool)

(declare-fun e!464685 () Bool)

(assert (=> b!833086 (= c!90697 e!464685)))

(declare-fun res!566604 () Bool)

(assert (=> b!833086 (=> (not res!566604) (not e!464685))))

(assert (=> b!833086 (= res!566604 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22751 _keys!976)))))

(declare-fun b!833087 () Bool)

(assert (=> b!833087 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22751 _keys!976)))))

(assert (=> b!833087 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22752 _values!788)))))

(assert (=> b!833087 (= e!464686 (= (apply!373 lt!378080 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!11826 (select (arr!22332 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!106767 () Bool)

(assert (=> d!106767 e!464680))

(declare-fun res!566606 () Bool)

(assert (=> d!106767 (=> (not res!566606) (not e!464680))))

(assert (=> d!106767 (= res!566606 (not (contains!4189 lt!378080 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106767 (= lt!378080 e!464682)))

(declare-fun c!90695 () Bool)

(assert (=> d!106767 (= c!90695 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22751 _keys!976)))))

(assert (=> d!106767 (validMask!0 mask!1312)))

(assert (=> d!106767 (= (getCurrentListMapNoExtraKeys!2539 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796) lt!378080)))

(declare-fun b!833088 () Bool)

(assert (=> b!833088 (= e!464681 e!464684)))

(declare-fun c!90698 () Bool)

(assert (=> b!833088 (= c!90698 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22751 _keys!976)))))

(declare-fun b!833089 () Bool)

(declare-fun res!566607 () Bool)

(assert (=> b!833089 (=> (not res!566607) (not e!464680))))

(assert (=> b!833089 (= res!566607 (not (contains!4189 lt!378080 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!833090 () Bool)

(assert (=> b!833090 (= e!464683 call!36456)))

(declare-fun b!833091 () Bool)

(assert (=> b!833091 (= e!464682 (ListLongMap!8908 Nil!15849))))

(declare-fun b!833092 () Bool)

(declare-fun lt!378085 () Unit!28510)

(declare-fun lt!378081 () Unit!28510)

(assert (=> b!833092 (= lt!378085 lt!378081)))

(declare-fun lt!378086 () V!25283)

(declare-fun lt!378084 () (_ BitVec 64))

(declare-fun lt!378083 () ListLongMap!8907)

(declare-fun lt!378082 () (_ BitVec 64))

(assert (=> b!833092 (not (contains!4189 (+!1991 lt!378083 (tuple2!10083 lt!378082 lt!378086)) lt!378084))))

(assert (=> b!833092 (= lt!378081 (addStillNotContains!200 lt!378083 lt!378082 lt!378086 lt!378084))))

(assert (=> b!833092 (= lt!378084 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!833092 (= lt!378086 (get!11826 (select (arr!22332 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!833092 (= lt!378082 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!833092 (= lt!378083 call!36456)))

(assert (=> b!833092 (= e!464683 (+!1991 call!36456 (tuple2!10083 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11826 (select (arr!22332 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!833093 () Bool)

(assert (=> b!833093 (= e!464685 (validKeyInArray!0 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!833093 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (= (and d!106767 c!90695) b!833091))

(assert (= (and d!106767 (not c!90695)) b!833084))

(assert (= (and b!833084 c!90696) b!833092))

(assert (= (and b!833084 (not c!90696)) b!833090))

(assert (= (or b!833092 b!833090) bm!36453))

(assert (= (and d!106767 res!566606) b!833089))

(assert (= (and b!833089 res!566607) b!833086))

(assert (= (and b!833086 res!566604) b!833093))

(assert (= (and b!833086 c!90697) b!833082))

(assert (= (and b!833086 (not c!90697)) b!833088))

(assert (= (and b!833082 res!566605) b!833087))

(assert (= (and b!833088 c!90698) b!833085))

(assert (= (and b!833088 (not c!90698)) b!833083))

(declare-fun b_lambda!11445 () Bool)

(assert (=> (not b_lambda!11445) (not b!833087)))

(assert (=> b!833087 t!22218))

(declare-fun b_and!22591 () Bool)

(assert (= b_and!22589 (and (=> t!22218 result!8013) b_and!22591)))

(declare-fun b_lambda!11447 () Bool)

(assert (=> (not b_lambda!11447) (not b!833092)))

(assert (=> b!833092 t!22218))

(declare-fun b_and!22593 () Bool)

(assert (= b_and!22591 (and (=> t!22218 result!8013) b_and!22593)))

(assert (=> b!833087 m!777463))

(assert (=> b!833087 m!777481))

(assert (=> b!833087 m!777109))

(assert (=> b!833087 m!777463))

(declare-fun m!777657 () Bool)

(assert (=> b!833087 m!777657))

(assert (=> b!833087 m!777481))

(assert (=> b!833087 m!777109))

(assert (=> b!833087 m!777485))

(assert (=> b!833084 m!777463))

(assert (=> b!833084 m!777463))

(assert (=> b!833084 m!777467))

(assert (=> b!833093 m!777463))

(assert (=> b!833093 m!777463))

(assert (=> b!833093 m!777467))

(declare-fun m!777659 () Bool)

(assert (=> b!833083 m!777659))

(declare-fun m!777661 () Bool)

(assert (=> b!833092 m!777661))

(assert (=> b!833092 m!777463))

(assert (=> b!833092 m!777481))

(assert (=> b!833092 m!777109))

(assert (=> b!833092 m!777661))

(declare-fun m!777663 () Bool)

(assert (=> b!833092 m!777663))

(declare-fun m!777665 () Bool)

(assert (=> b!833092 m!777665))

(declare-fun m!777667 () Bool)

(assert (=> b!833092 m!777667))

(assert (=> b!833092 m!777481))

(assert (=> b!833092 m!777109))

(assert (=> b!833092 m!777485))

(assert (=> b!833082 m!777463))

(assert (=> b!833082 m!777463))

(declare-fun m!777669 () Bool)

(assert (=> b!833082 m!777669))

(declare-fun m!777671 () Bool)

(assert (=> b!833085 m!777671))

(assert (=> bm!36453 m!777671))

(declare-fun m!777673 () Bool)

(assert (=> d!106767 m!777673))

(assert (=> d!106767 m!776931))

(declare-fun m!777675 () Bool)

(assert (=> b!833089 m!777675))

(assert (=> bm!36406 d!106767))

(declare-fun d!106769 () Bool)

(declare-fun lt!378087 () Bool)

(assert (=> d!106769 (= lt!378087 (select (content!388 (toList!4469 lt!377819)) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun e!464688 () Bool)

(assert (=> d!106769 (= lt!378087 e!464688)))

(declare-fun res!566609 () Bool)

(assert (=> d!106769 (=> (not res!566609) (not e!464688))))

(assert (=> d!106769 (= res!566609 ((_ is Cons!15848) (toList!4469 lt!377819)))))

(assert (=> d!106769 (= (contains!4190 (toList!4469 lt!377819) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!378087)))

(declare-fun b!833094 () Bool)

(declare-fun e!464687 () Bool)

(assert (=> b!833094 (= e!464688 e!464687)))

(declare-fun res!566608 () Bool)

(assert (=> b!833094 (=> res!566608 e!464687)))

(assert (=> b!833094 (= res!566608 (= (h!16984 (toList!4469 lt!377819)) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!833095 () Bool)

(assert (=> b!833095 (= e!464687 (contains!4190 (t!22212 (toList!4469 lt!377819)) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!106769 res!566609) b!833094))

(assert (= (and b!833094 (not res!566608)) b!833095))

(declare-fun m!777677 () Bool)

(assert (=> d!106769 m!777677))

(declare-fun m!777679 () Bool)

(assert (=> d!106769 m!777679))

(declare-fun m!777681 () Bool)

(assert (=> b!833095 m!777681))

(assert (=> b!832736 d!106769))

(declare-fun d!106771 () Bool)

(declare-fun e!464689 () Bool)

(assert (=> d!106771 e!464689))

(declare-fun res!566611 () Bool)

(assert (=> d!106771 (=> (not res!566611) (not e!464689))))

(declare-fun lt!378091 () ListLongMap!8907)

(assert (=> d!106771 (= res!566611 (contains!4189 lt!378091 (_1!5052 (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun lt!378090 () List!15852)

(assert (=> d!106771 (= lt!378091 (ListLongMap!8908 lt!378090))))

(declare-fun lt!378088 () Unit!28510)

(declare-fun lt!378089 () Unit!28510)

(assert (=> d!106771 (= lt!378088 lt!378089)))

(assert (=> d!106771 (= (getValueByKey!417 lt!378090 (_1!5052 (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) (Some!422 (_2!5052 (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!106771 (= lt!378089 (lemmaContainsTupThenGetReturnValue!231 lt!378090 (_1!5052 (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5052 (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!106771 (= lt!378090 (insertStrictlySorted!270 (toList!4469 (ite c!90636 call!36430 (ite c!90639 call!36428 call!36433))) (_1!5052 (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5052 (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!106771 (= (+!1991 (ite c!90636 call!36430 (ite c!90639 call!36428 call!36433)) (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!378091)))

(declare-fun b!833096 () Bool)

(declare-fun res!566610 () Bool)

(assert (=> b!833096 (=> (not res!566610) (not e!464689))))

(assert (=> b!833096 (= res!566610 (= (getValueByKey!417 (toList!4469 lt!378091) (_1!5052 (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) (Some!422 (_2!5052 (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!833097 () Bool)

(assert (=> b!833097 (= e!464689 (contains!4190 (toList!4469 lt!378091) (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (= (and d!106771 res!566611) b!833096))

(assert (= (and b!833096 res!566610) b!833097))

(declare-fun m!777683 () Bool)

(assert (=> d!106771 m!777683))

(declare-fun m!777685 () Bool)

(assert (=> d!106771 m!777685))

(declare-fun m!777687 () Bool)

(assert (=> d!106771 m!777687))

(declare-fun m!777689 () Bool)

(assert (=> d!106771 m!777689))

(declare-fun m!777691 () Bool)

(assert (=> b!833096 m!777691))

(declare-fun m!777693 () Bool)

(assert (=> b!833097 m!777693))

(assert (=> bm!36428 d!106771))

(assert (=> d!106645 d!106633))

(declare-fun d!106773 () Bool)

(declare-fun e!464691 () Bool)

(assert (=> d!106773 e!464691))

(declare-fun res!566612 () Bool)

(assert (=> d!106773 (=> res!566612 e!464691)))

(declare-fun lt!378092 () Bool)

(assert (=> d!106773 (= res!566612 (not lt!378092))))

(declare-fun lt!378095 () Bool)

(assert (=> d!106773 (= lt!378092 lt!378095)))

(declare-fun lt!378093 () Unit!28510)

(declare-fun e!464690 () Unit!28510)

(assert (=> d!106773 (= lt!378093 e!464690)))

(declare-fun c!90699 () Bool)

(assert (=> d!106773 (= c!90699 lt!378095)))

(assert (=> d!106773 (= lt!378095 (containsKey!402 (toList!4469 lt!377854) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!106773 (= (contains!4189 lt!377854 #b1000000000000000000000000000000000000000000000000000000000000000) lt!378092)))

(declare-fun b!833098 () Bool)

(declare-fun lt!378094 () Unit!28510)

(assert (=> b!833098 (= e!464690 lt!378094)))

(assert (=> b!833098 (= lt!378094 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377854) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!833098 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377854) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!833099 () Bool)

(declare-fun Unit!28525 () Unit!28510)

(assert (=> b!833099 (= e!464690 Unit!28525)))

(declare-fun b!833100 () Bool)

(assert (=> b!833100 (= e!464691 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377854) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106773 c!90699) b!833098))

(assert (= (and d!106773 (not c!90699)) b!833099))

(assert (= (and d!106773 (not res!566612)) b!833100))

(declare-fun m!777695 () Bool)

(assert (=> d!106773 m!777695))

(declare-fun m!777697 () Bool)

(assert (=> b!833098 m!777697))

(declare-fun m!777699 () Bool)

(assert (=> b!833098 m!777699))

(assert (=> b!833098 m!777699))

(declare-fun m!777701 () Bool)

(assert (=> b!833098 m!777701))

(assert (=> b!833100 m!777699))

(assert (=> b!833100 m!777699))

(assert (=> b!833100 m!777701))

(assert (=> b!832784 d!106773))

(declare-fun d!106775 () Bool)

(declare-fun lt!378096 () Bool)

(assert (=> d!106775 (= lt!378096 (select (content!388 (toList!4469 lt!377827)) lt!377756))))

(declare-fun e!464693 () Bool)

(assert (=> d!106775 (= lt!378096 e!464693)))

(declare-fun res!566614 () Bool)

(assert (=> d!106775 (=> (not res!566614) (not e!464693))))

(assert (=> d!106775 (= res!566614 ((_ is Cons!15848) (toList!4469 lt!377827)))))

(assert (=> d!106775 (= (contains!4190 (toList!4469 lt!377827) lt!377756) lt!378096)))

(declare-fun b!833101 () Bool)

(declare-fun e!464692 () Bool)

(assert (=> b!833101 (= e!464693 e!464692)))

(declare-fun res!566613 () Bool)

(assert (=> b!833101 (=> res!566613 e!464692)))

(assert (=> b!833101 (= res!566613 (= (h!16984 (toList!4469 lt!377827)) lt!377756))))

(declare-fun b!833102 () Bool)

(assert (=> b!833102 (= e!464692 (contains!4190 (t!22212 (toList!4469 lt!377827)) lt!377756))))

(assert (= (and d!106775 res!566614) b!833101))

(assert (= (and b!833101 (not res!566613)) b!833102))

(declare-fun m!777703 () Bool)

(assert (=> d!106775 m!777703))

(declare-fun m!777705 () Bool)

(assert (=> d!106775 m!777705))

(declare-fun m!777707 () Bool)

(assert (=> b!833102 m!777707))

(assert (=> b!832740 d!106775))

(declare-fun d!106777 () Bool)

(declare-fun e!464695 () Bool)

(assert (=> d!106777 e!464695))

(declare-fun res!566615 () Bool)

(assert (=> d!106777 (=> res!566615 e!464695)))

(declare-fun lt!378097 () Bool)

(assert (=> d!106777 (= res!566615 (not lt!378097))))

(declare-fun lt!378100 () Bool)

(assert (=> d!106777 (= lt!378097 lt!378100)))

(declare-fun lt!378098 () Unit!28510)

(declare-fun e!464694 () Unit!28510)

(assert (=> d!106777 (= lt!378098 e!464694)))

(declare-fun c!90700 () Bool)

(assert (=> d!106777 (= c!90700 lt!378100)))

(assert (=> d!106777 (= lt!378100 (containsKey!402 (toList!4469 lt!377875) (_1!5052 lt!377756)))))

(assert (=> d!106777 (= (contains!4189 lt!377875 (_1!5052 lt!377756)) lt!378097)))

(declare-fun b!833103 () Bool)

(declare-fun lt!378099 () Unit!28510)

(assert (=> b!833103 (= e!464694 lt!378099)))

(assert (=> b!833103 (= lt!378099 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377875) (_1!5052 lt!377756)))))

(assert (=> b!833103 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377875) (_1!5052 lt!377756)))))

(declare-fun b!833104 () Bool)

(declare-fun Unit!28526 () Unit!28510)

(assert (=> b!833104 (= e!464694 Unit!28526)))

(declare-fun b!833105 () Bool)

(assert (=> b!833105 (= e!464695 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377875) (_1!5052 lt!377756))))))

(assert (= (and d!106777 c!90700) b!833103))

(assert (= (and d!106777 (not c!90700)) b!833104))

(assert (= (and d!106777 (not res!566615)) b!833105))

(declare-fun m!777709 () Bool)

(assert (=> d!106777 m!777709))

(declare-fun m!777711 () Bool)

(assert (=> b!833103 m!777711))

(assert (=> b!833103 m!777177))

(assert (=> b!833103 m!777177))

(declare-fun m!777713 () Bool)

(assert (=> b!833103 m!777713))

(assert (=> b!833105 m!777177))

(assert (=> b!833105 m!777177))

(assert (=> b!833105 m!777713))

(assert (=> d!106643 d!106777))

(declare-fun d!106779 () Bool)

(declare-fun c!90701 () Bool)

(assert (=> d!106779 (= c!90701 (and ((_ is Cons!15848) lt!377874) (= (_1!5052 (h!16984 lt!377874)) (_1!5052 lt!377756))))))

(declare-fun e!464696 () Option!423)

(assert (=> d!106779 (= (getValueByKey!417 lt!377874 (_1!5052 lt!377756)) e!464696)))

(declare-fun b!833108 () Bool)

(declare-fun e!464697 () Option!423)

(assert (=> b!833108 (= e!464697 (getValueByKey!417 (t!22212 lt!377874) (_1!5052 lt!377756)))))

(declare-fun b!833109 () Bool)

(assert (=> b!833109 (= e!464697 None!421)))

(declare-fun b!833107 () Bool)

(assert (=> b!833107 (= e!464696 e!464697)))

(declare-fun c!90702 () Bool)

(assert (=> b!833107 (= c!90702 (and ((_ is Cons!15848) lt!377874) (not (= (_1!5052 (h!16984 lt!377874)) (_1!5052 lt!377756)))))))

(declare-fun b!833106 () Bool)

(assert (=> b!833106 (= e!464696 (Some!422 (_2!5052 (h!16984 lt!377874))))))

(assert (= (and d!106779 c!90701) b!833106))

(assert (= (and d!106779 (not c!90701)) b!833107))

(assert (= (and b!833107 c!90702) b!833108))

(assert (= (and b!833107 (not c!90702)) b!833109))

(declare-fun m!777715 () Bool)

(assert (=> b!833108 m!777715))

(assert (=> d!106643 d!106779))

(declare-fun d!106781 () Bool)

(assert (=> d!106781 (= (getValueByKey!417 lt!377874 (_1!5052 lt!377756)) (Some!422 (_2!5052 lt!377756)))))

(declare-fun lt!378101 () Unit!28510)

(assert (=> d!106781 (= lt!378101 (choose!1429 lt!377874 (_1!5052 lt!377756) (_2!5052 lt!377756)))))

(declare-fun e!464698 () Bool)

(assert (=> d!106781 e!464698))

(declare-fun res!566616 () Bool)

(assert (=> d!106781 (=> (not res!566616) (not e!464698))))

(assert (=> d!106781 (= res!566616 (isStrictlySorted!430 lt!377874))))

(assert (=> d!106781 (= (lemmaContainsTupThenGetReturnValue!231 lt!377874 (_1!5052 lt!377756) (_2!5052 lt!377756)) lt!378101)))

(declare-fun b!833110 () Bool)

(declare-fun res!566617 () Bool)

(assert (=> b!833110 (=> (not res!566617) (not e!464698))))

(assert (=> b!833110 (= res!566617 (containsKey!402 lt!377874 (_1!5052 lt!377756)))))

(declare-fun b!833111 () Bool)

(assert (=> b!833111 (= e!464698 (contains!4190 lt!377874 (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))))))

(assert (= (and d!106781 res!566616) b!833110))

(assert (= (and b!833110 res!566617) b!833111))

(assert (=> d!106781 m!777171))

(declare-fun m!777717 () Bool)

(assert (=> d!106781 m!777717))

(declare-fun m!777719 () Bool)

(assert (=> d!106781 m!777719))

(declare-fun m!777721 () Bool)

(assert (=> b!833110 m!777721))

(declare-fun m!777723 () Bool)

(assert (=> b!833111 m!777723))

(assert (=> d!106643 d!106781))

(declare-fun e!464700 () List!15852)

(declare-fun call!36458 () List!15852)

(declare-fun c!90703 () Bool)

(declare-fun bm!36454 () Bool)

(assert (=> bm!36454 (= call!36458 ($colon$colon!534 e!464700 (ite c!90703 (h!16984 (toList!4469 lt!377759)) (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756)))))))

(declare-fun c!90706 () Bool)

(assert (=> bm!36454 (= c!90706 c!90703)))

(declare-fun bm!36455 () Bool)

(declare-fun call!36459 () List!15852)

(assert (=> bm!36455 (= call!36459 call!36458)))

(declare-fun bm!36456 () Bool)

(declare-fun call!36457 () List!15852)

(assert (=> bm!36456 (= call!36457 call!36459)))

(declare-fun b!833112 () Bool)

(declare-fun c!90704 () Bool)

(assert (=> b!833112 (= c!90704 (and ((_ is Cons!15848) (toList!4469 lt!377759)) (bvsgt (_1!5052 (h!16984 (toList!4469 lt!377759))) (_1!5052 lt!377756))))))

(declare-fun e!464699 () List!15852)

(declare-fun e!464702 () List!15852)

(assert (=> b!833112 (= e!464699 e!464702)))

(declare-fun b!833113 () Bool)

(assert (=> b!833113 (= e!464702 call!36457)))

(declare-fun b!833114 () Bool)

(assert (=> b!833114 (= e!464700 (insertStrictlySorted!270 (t!22212 (toList!4469 lt!377759)) (_1!5052 lt!377756) (_2!5052 lt!377756)))))

(declare-fun b!833115 () Bool)

(declare-fun e!464701 () List!15852)

(assert (=> b!833115 (= e!464701 call!36458)))

(declare-fun b!833116 () Bool)

(declare-fun e!464703 () Bool)

(declare-fun lt!378102 () List!15852)

(assert (=> b!833116 (= e!464703 (contains!4190 lt!378102 (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))))))

(declare-fun c!90705 () Bool)

(declare-fun b!833117 () Bool)

(assert (=> b!833117 (= e!464700 (ite c!90705 (t!22212 (toList!4469 lt!377759)) (ite c!90704 (Cons!15848 (h!16984 (toList!4469 lt!377759)) (t!22212 (toList!4469 lt!377759))) Nil!15849)))))

(declare-fun b!833118 () Bool)

(assert (=> b!833118 (= e!464701 e!464699)))

(assert (=> b!833118 (= c!90705 (and ((_ is Cons!15848) (toList!4469 lt!377759)) (= (_1!5052 (h!16984 (toList!4469 lt!377759))) (_1!5052 lt!377756))))))

(declare-fun b!833119 () Bool)

(assert (=> b!833119 (= e!464699 call!36459)))

(declare-fun b!833120 () Bool)

(declare-fun res!566619 () Bool)

(assert (=> b!833120 (=> (not res!566619) (not e!464703))))

(assert (=> b!833120 (= res!566619 (containsKey!402 lt!378102 (_1!5052 lt!377756)))))

(declare-fun d!106783 () Bool)

(assert (=> d!106783 e!464703))

(declare-fun res!566618 () Bool)

(assert (=> d!106783 (=> (not res!566618) (not e!464703))))

(assert (=> d!106783 (= res!566618 (isStrictlySorted!430 lt!378102))))

(assert (=> d!106783 (= lt!378102 e!464701)))

(assert (=> d!106783 (= c!90703 (and ((_ is Cons!15848) (toList!4469 lt!377759)) (bvslt (_1!5052 (h!16984 (toList!4469 lt!377759))) (_1!5052 lt!377756))))))

(assert (=> d!106783 (isStrictlySorted!430 (toList!4469 lt!377759))))

(assert (=> d!106783 (= (insertStrictlySorted!270 (toList!4469 lt!377759) (_1!5052 lt!377756) (_2!5052 lt!377756)) lt!378102)))

(declare-fun b!833121 () Bool)

(assert (=> b!833121 (= e!464702 call!36457)))

(assert (= (and d!106783 c!90703) b!833115))

(assert (= (and d!106783 (not c!90703)) b!833118))

(assert (= (and b!833118 c!90705) b!833119))

(assert (= (and b!833118 (not c!90705)) b!833112))

(assert (= (and b!833112 c!90704) b!833113))

(assert (= (and b!833112 (not c!90704)) b!833121))

(assert (= (or b!833113 b!833121) bm!36456))

(assert (= (or b!833119 bm!36456) bm!36455))

(assert (= (or b!833115 bm!36455) bm!36454))

(assert (= (and bm!36454 c!90706) b!833114))

(assert (= (and bm!36454 (not c!90706)) b!833117))

(assert (= (and d!106783 res!566618) b!833120))

(assert (= (and b!833120 res!566619) b!833116))

(declare-fun m!777725 () Bool)

(assert (=> bm!36454 m!777725))

(declare-fun m!777727 () Bool)

(assert (=> b!833116 m!777727))

(declare-fun m!777729 () Bool)

(assert (=> b!833114 m!777729))

(declare-fun m!777731 () Bool)

(assert (=> b!833120 m!777731))

(declare-fun m!777733 () Bool)

(assert (=> d!106783 m!777733))

(declare-fun m!777735 () Bool)

(assert (=> d!106783 m!777735))

(assert (=> d!106643 d!106783))

(declare-fun d!106785 () Bool)

(declare-fun e!464705 () Bool)

(assert (=> d!106785 e!464705))

(declare-fun res!566620 () Bool)

(assert (=> d!106785 (=> res!566620 e!464705)))

(declare-fun lt!378103 () Bool)

(assert (=> d!106785 (= res!566620 (not lt!378103))))

(declare-fun lt!378106 () Bool)

(assert (=> d!106785 (= lt!378103 lt!378106)))

(declare-fun lt!378104 () Unit!28510)

(declare-fun e!464704 () Unit!28510)

(assert (=> d!106785 (= lt!378104 e!464704)))

(declare-fun c!90707 () Bool)

(assert (=> d!106785 (= c!90707 lt!378106)))

(assert (=> d!106785 (= lt!378106 (containsKey!402 (toList!4469 lt!377861) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!106785 (= (contains!4189 lt!377861 #b1000000000000000000000000000000000000000000000000000000000000000) lt!378103)))

(declare-fun b!833122 () Bool)

(declare-fun lt!378105 () Unit!28510)

(assert (=> b!833122 (= e!464704 lt!378105)))

(assert (=> b!833122 (= lt!378105 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377861) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!833122 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377861) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!833123 () Bool)

(declare-fun Unit!28527 () Unit!28510)

(assert (=> b!833123 (= e!464704 Unit!28527)))

(declare-fun b!833124 () Bool)

(assert (=> b!833124 (= e!464705 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377861) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106785 c!90707) b!833122))

(assert (= (and d!106785 (not c!90707)) b!833123))

(assert (= (and d!106785 (not res!566620)) b!833124))

(declare-fun m!777737 () Bool)

(assert (=> d!106785 m!777737))

(declare-fun m!777739 () Bool)

(assert (=> b!833122 m!777739))

(declare-fun m!777741 () Bool)

(assert (=> b!833122 m!777741))

(assert (=> b!833122 m!777741))

(declare-fun m!777743 () Bool)

(assert (=> b!833122 m!777743))

(assert (=> b!833124 m!777741))

(assert (=> b!833124 m!777741))

(assert (=> b!833124 m!777743))

(assert (=> b!832798 d!106785))

(assert (=> b!832802 d!106697))

(declare-fun d!106787 () Bool)

(declare-fun e!464707 () Bool)

(assert (=> d!106787 e!464707))

(declare-fun res!566621 () Bool)

(assert (=> d!106787 (=> res!566621 e!464707)))

(declare-fun lt!378107 () Bool)

(assert (=> d!106787 (= res!566621 (not lt!378107))))

(declare-fun lt!378110 () Bool)

(assert (=> d!106787 (= lt!378107 lt!378110)))

(declare-fun lt!378108 () Unit!28510)

(declare-fun e!464706 () Unit!28510)

(assert (=> d!106787 (= lt!378108 e!464706)))

(declare-fun c!90708 () Bool)

(assert (=> d!106787 (= c!90708 lt!378110)))

(assert (=> d!106787 (= lt!378110 (containsKey!402 (toList!4469 lt!377947) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!106787 (= (contains!4189 lt!377947 #b0000000000000000000000000000000000000000000000000000000000000000) lt!378107)))

(declare-fun b!833125 () Bool)

(declare-fun lt!378109 () Unit!28510)

(assert (=> b!833125 (= e!464706 lt!378109)))

(assert (=> b!833125 (= lt!378109 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377947) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!833125 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377947) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!833126 () Bool)

(declare-fun Unit!28528 () Unit!28510)

(assert (=> b!833126 (= e!464706 Unit!28528)))

(declare-fun b!833127 () Bool)

(assert (=> b!833127 (= e!464707 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377947) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106787 c!90708) b!833125))

(assert (= (and d!106787 (not c!90708)) b!833126))

(assert (= (and d!106787 (not res!566621)) b!833127))

(declare-fun m!777745 () Bool)

(assert (=> d!106787 m!777745))

(declare-fun m!777747 () Bool)

(assert (=> b!833125 m!777747))

(declare-fun m!777749 () Bool)

(assert (=> b!833125 m!777749))

(assert (=> b!833125 m!777749))

(declare-fun m!777751 () Bool)

(assert (=> b!833125 m!777751))

(assert (=> b!833127 m!777749))

(assert (=> b!833127 m!777749))

(assert (=> b!833127 m!777751))

(assert (=> bm!36434 d!106787))

(assert (=> bm!36431 d!106631))

(declare-fun d!106789 () Bool)

(declare-fun c!90709 () Bool)

(assert (=> d!106789 (= c!90709 (and ((_ is Cons!15848) (toList!4469 lt!377871)) (= (_1!5052 (h!16984 (toList!4469 lt!377871))) (_1!5052 lt!377761))))))

(declare-fun e!464708 () Option!423)

(assert (=> d!106789 (= (getValueByKey!417 (toList!4469 lt!377871) (_1!5052 lt!377761)) e!464708)))

(declare-fun b!833130 () Bool)

(declare-fun e!464709 () Option!423)

(assert (=> b!833130 (= e!464709 (getValueByKey!417 (t!22212 (toList!4469 lt!377871)) (_1!5052 lt!377761)))))

(declare-fun b!833131 () Bool)

(assert (=> b!833131 (= e!464709 None!421)))

(declare-fun b!833129 () Bool)

(assert (=> b!833129 (= e!464708 e!464709)))

(declare-fun c!90710 () Bool)

(assert (=> b!833129 (= c!90710 (and ((_ is Cons!15848) (toList!4469 lt!377871)) (not (= (_1!5052 (h!16984 (toList!4469 lt!377871))) (_1!5052 lt!377761)))))))

(declare-fun b!833128 () Bool)

(assert (=> b!833128 (= e!464708 (Some!422 (_2!5052 (h!16984 (toList!4469 lt!377871)))))))

(assert (= (and d!106789 c!90709) b!833128))

(assert (= (and d!106789 (not c!90709)) b!833129))

(assert (= (and b!833129 c!90710) b!833130))

(assert (= (and b!833129 (not c!90710)) b!833131))

(declare-fun m!777753 () Bool)

(assert (=> b!833130 m!777753))

(assert (=> b!832818 d!106789))

(assert (=> b!832788 d!106697))

(assert (=> b!832895 d!106697))

(declare-fun d!106791 () Bool)

(declare-fun e!464711 () Bool)

(assert (=> d!106791 e!464711))

(declare-fun res!566622 () Bool)

(assert (=> d!106791 (=> res!566622 e!464711)))

(declare-fun lt!378111 () Bool)

(assert (=> d!106791 (= res!566622 (not lt!378111))))

(declare-fun lt!378114 () Bool)

(assert (=> d!106791 (= lt!378111 lt!378114)))

(declare-fun lt!378112 () Unit!28510)

(declare-fun e!464710 () Unit!28510)

(assert (=> d!106791 (= lt!378112 e!464710)))

(declare-fun c!90711 () Bool)

(assert (=> d!106791 (= c!90711 lt!378114)))

(assert (=> d!106791 (= lt!378114 (containsKey!402 (toList!4469 lt!377819) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!106791 (= (contains!4189 lt!377819 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!378111)))

(declare-fun b!833132 () Bool)

(declare-fun lt!378113 () Unit!28510)

(assert (=> b!833132 (= e!464710 lt!378113)))

(assert (=> b!833132 (= lt!378113 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377819) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> b!833132 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377819) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!833133 () Bool)

(declare-fun Unit!28529 () Unit!28510)

(assert (=> b!833133 (= e!464710 Unit!28529)))

(declare-fun b!833134 () Bool)

(assert (=> b!833134 (= e!464711 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377819) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (= (and d!106791 c!90711) b!833132))

(assert (= (and d!106791 (not c!90711)) b!833133))

(assert (= (and d!106791 (not res!566622)) b!833134))

(declare-fun m!777755 () Bool)

(assert (=> d!106791 m!777755))

(declare-fun m!777757 () Bool)

(assert (=> b!833132 m!777757))

(assert (=> b!833132 m!777065))

(assert (=> b!833132 m!777065))

(declare-fun m!777759 () Bool)

(assert (=> b!833132 m!777759))

(assert (=> b!833134 m!777065))

(assert (=> b!833134 m!777065))

(assert (=> b!833134 m!777759))

(assert (=> d!106619 d!106791))

(declare-fun d!106793 () Bool)

(declare-fun c!90712 () Bool)

(assert (=> d!106793 (= c!90712 (and ((_ is Cons!15848) lt!377818) (= (_1!5052 (h!16984 lt!377818)) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!464712 () Option!423)

(assert (=> d!106793 (= (getValueByKey!417 lt!377818 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!464712)))

(declare-fun b!833137 () Bool)

(declare-fun e!464713 () Option!423)

(assert (=> b!833137 (= e!464713 (getValueByKey!417 (t!22212 lt!377818) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!833138 () Bool)

(assert (=> b!833138 (= e!464713 None!421)))

(declare-fun b!833136 () Bool)

(assert (=> b!833136 (= e!464712 e!464713)))

(declare-fun c!90713 () Bool)

(assert (=> b!833136 (= c!90713 (and ((_ is Cons!15848) lt!377818) (not (= (_1!5052 (h!16984 lt!377818)) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun b!833135 () Bool)

(assert (=> b!833135 (= e!464712 (Some!422 (_2!5052 (h!16984 lt!377818))))))

(assert (= (and d!106793 c!90712) b!833135))

(assert (= (and d!106793 (not c!90712)) b!833136))

(assert (= (and b!833136 c!90713) b!833137))

(assert (= (and b!833136 (not c!90713)) b!833138))

(declare-fun m!777761 () Bool)

(assert (=> b!833137 m!777761))

(assert (=> d!106619 d!106793))

(declare-fun d!106795 () Bool)

(assert (=> d!106795 (= (getValueByKey!417 lt!377818 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!422 (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!378115 () Unit!28510)

(assert (=> d!106795 (= lt!378115 (choose!1429 lt!377818 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun e!464714 () Bool)

(assert (=> d!106795 e!464714))

(declare-fun res!566623 () Bool)

(assert (=> d!106795 (=> (not res!566623) (not e!464714))))

(assert (=> d!106795 (= res!566623 (isStrictlySorted!430 lt!377818))))

(assert (=> d!106795 (= (lemmaContainsTupThenGetReturnValue!231 lt!377818 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!378115)))

(declare-fun b!833139 () Bool)

(declare-fun res!566624 () Bool)

(assert (=> b!833139 (=> (not res!566624) (not e!464714))))

(assert (=> b!833139 (= res!566624 (containsKey!402 lt!377818 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!833140 () Bool)

(assert (=> b!833140 (= e!464714 (contains!4190 lt!377818 (tuple2!10083 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (= (and d!106795 res!566623) b!833139))

(assert (= (and b!833139 res!566624) b!833140))

(assert (=> d!106795 m!777059))

(declare-fun m!777763 () Bool)

(assert (=> d!106795 m!777763))

(declare-fun m!777765 () Bool)

(assert (=> d!106795 m!777765))

(declare-fun m!777767 () Bool)

(assert (=> b!833139 m!777767))

(declare-fun m!777769 () Bool)

(assert (=> b!833140 m!777769))

(assert (=> d!106619 d!106795))

(declare-fun bm!36457 () Bool)

(declare-fun e!464716 () List!15852)

(declare-fun call!36461 () List!15852)

(declare-fun c!90714 () Bool)

(assert (=> bm!36457 (= call!36461 ($colon$colon!534 e!464716 (ite c!90714 (h!16984 (toList!4469 lt!377759)) (tuple2!10083 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun c!90717 () Bool)

(assert (=> bm!36457 (= c!90717 c!90714)))

(declare-fun bm!36458 () Bool)

(declare-fun call!36462 () List!15852)

(assert (=> bm!36458 (= call!36462 call!36461)))

(declare-fun bm!36459 () Bool)

(declare-fun call!36460 () List!15852)

(assert (=> bm!36459 (= call!36460 call!36462)))

(declare-fun b!833141 () Bool)

(declare-fun c!90715 () Bool)

(assert (=> b!833141 (= c!90715 (and ((_ is Cons!15848) (toList!4469 lt!377759)) (bvsgt (_1!5052 (h!16984 (toList!4469 lt!377759))) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!464715 () List!15852)

(declare-fun e!464718 () List!15852)

(assert (=> b!833141 (= e!464715 e!464718)))

(declare-fun b!833142 () Bool)

(assert (=> b!833142 (= e!464718 call!36460)))

(declare-fun b!833143 () Bool)

(assert (=> b!833143 (= e!464716 (insertStrictlySorted!270 (t!22212 (toList!4469 lt!377759)) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!833144 () Bool)

(declare-fun e!464717 () List!15852)

(assert (=> b!833144 (= e!464717 call!36461)))

(declare-fun b!833145 () Bool)

(declare-fun e!464719 () Bool)

(declare-fun lt!378116 () List!15852)

(assert (=> b!833145 (= e!464719 (contains!4190 lt!378116 (tuple2!10083 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!833146 () Bool)

(declare-fun c!90716 () Bool)

(assert (=> b!833146 (= e!464716 (ite c!90716 (t!22212 (toList!4469 lt!377759)) (ite c!90715 (Cons!15848 (h!16984 (toList!4469 lt!377759)) (t!22212 (toList!4469 lt!377759))) Nil!15849)))))

(declare-fun b!833147 () Bool)

(assert (=> b!833147 (= e!464717 e!464715)))

(assert (=> b!833147 (= c!90716 (and ((_ is Cons!15848) (toList!4469 lt!377759)) (= (_1!5052 (h!16984 (toList!4469 lt!377759))) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!833148 () Bool)

(assert (=> b!833148 (= e!464715 call!36462)))

(declare-fun b!833149 () Bool)

(declare-fun res!566626 () Bool)

(assert (=> b!833149 (=> (not res!566626) (not e!464719))))

(assert (=> b!833149 (= res!566626 (containsKey!402 lt!378116 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun d!106797 () Bool)

(assert (=> d!106797 e!464719))

(declare-fun res!566625 () Bool)

(assert (=> d!106797 (=> (not res!566625) (not e!464719))))

(assert (=> d!106797 (= res!566625 (isStrictlySorted!430 lt!378116))))

(assert (=> d!106797 (= lt!378116 e!464717)))

(assert (=> d!106797 (= c!90714 (and ((_ is Cons!15848) (toList!4469 lt!377759)) (bvslt (_1!5052 (h!16984 (toList!4469 lt!377759))) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!106797 (isStrictlySorted!430 (toList!4469 lt!377759))))

(assert (=> d!106797 (= (insertStrictlySorted!270 (toList!4469 lt!377759) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!378116)))

(declare-fun b!833150 () Bool)

(assert (=> b!833150 (= e!464718 call!36460)))

(assert (= (and d!106797 c!90714) b!833144))

(assert (= (and d!106797 (not c!90714)) b!833147))

(assert (= (and b!833147 c!90716) b!833148))

(assert (= (and b!833147 (not c!90716)) b!833141))

(assert (= (and b!833141 c!90715) b!833142))

(assert (= (and b!833141 (not c!90715)) b!833150))

(assert (= (or b!833142 b!833150) bm!36459))

(assert (= (or b!833148 bm!36459) bm!36458))

(assert (= (or b!833144 bm!36458) bm!36457))

(assert (= (and bm!36457 c!90717) b!833143))

(assert (= (and bm!36457 (not c!90717)) b!833146))

(assert (= (and d!106797 res!566625) b!833149))

(assert (= (and b!833149 res!566626) b!833145))

(declare-fun m!777771 () Bool)

(assert (=> bm!36457 m!777771))

(declare-fun m!777773 () Bool)

(assert (=> b!833145 m!777773))

(declare-fun m!777775 () Bool)

(assert (=> b!833143 m!777775))

(declare-fun m!777777 () Bool)

(assert (=> b!833149 m!777777))

(declare-fun m!777779 () Bool)

(assert (=> d!106797 m!777779))

(assert (=> d!106797 m!777735))

(assert (=> d!106619 d!106797))

(declare-fun d!106799 () Bool)

(assert (=> d!106799 (= (apply!373 lt!377947 (select (arr!22331 _keys!976) #b00000000000000000000000000000000)) (get!11827 (getValueByKey!417 (toList!4469 lt!377947) (select (arr!22331 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun bs!23292 () Bool)

(assert (= bs!23292 d!106799))

(assert (=> bs!23292 m!777093))

(declare-fun m!777781 () Bool)

(assert (=> bs!23292 m!777781))

(assert (=> bs!23292 m!777781))

(declare-fun m!777783 () Bool)

(assert (=> bs!23292 m!777783))

(assert (=> b!832898 d!106799))

(assert (=> b!832898 d!106723))

(declare-fun d!106801 () Bool)

(declare-fun lt!378119 () Bool)

(declare-fun content!389 (List!15853) (InoxSet (_ BitVec 64)))

(assert (=> d!106801 (= lt!378119 (select (content!389 Nil!15850) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun e!464724 () Bool)

(assert (=> d!106801 (= lt!378119 e!464724)))

(declare-fun res!566632 () Bool)

(assert (=> d!106801 (=> (not res!566632) (not e!464724))))

(assert (=> d!106801 (= res!566632 ((_ is Cons!15849) Nil!15850))))

(assert (=> d!106801 (= (contains!4191 Nil!15850 (select (arr!22331 _keys!976) #b00000000000000000000000000000000)) lt!378119)))

(declare-fun b!833155 () Bool)

(declare-fun e!464725 () Bool)

(assert (=> b!833155 (= e!464724 e!464725)))

(declare-fun res!566631 () Bool)

(assert (=> b!833155 (=> res!566631 e!464725)))

(assert (=> b!833155 (= res!566631 (= (h!16985 Nil!15850) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!833156 () Bool)

(assert (=> b!833156 (= e!464725 (contains!4191 (t!22213 Nil!15850) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!106801 res!566632) b!833155))

(assert (= (and b!833155 (not res!566631)) b!833156))

(declare-fun m!777785 () Bool)

(assert (=> d!106801 m!777785))

(assert (=> d!106801 m!777093))

(declare-fun m!777787 () Bool)

(assert (=> d!106801 m!777787))

(assert (=> b!833156 m!777093))

(declare-fun m!777789 () Bool)

(assert (=> b!833156 m!777789))

(assert (=> b!832813 d!106801))

(declare-fun d!106803 () Bool)

(declare-fun e!464727 () Bool)

(assert (=> d!106803 e!464727))

(declare-fun res!566633 () Bool)

(assert (=> d!106803 (=> res!566633 e!464727)))

(declare-fun lt!378120 () Bool)

(assert (=> d!106803 (= res!566633 (not lt!378120))))

(declare-fun lt!378123 () Bool)

(assert (=> d!106803 (= lt!378120 lt!378123)))

(declare-fun lt!378121 () Unit!28510)

(declare-fun e!464726 () Unit!28510)

(assert (=> d!106803 (= lt!378121 e!464726)))

(declare-fun c!90718 () Bool)

(assert (=> d!106803 (= c!90718 lt!378123)))

(assert (=> d!106803 (= lt!378123 (containsKey!402 (toList!4469 lt!377925) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!106803 (= (contains!4189 lt!377925 #b1000000000000000000000000000000000000000000000000000000000000000) lt!378120)))

(declare-fun b!833157 () Bool)

(declare-fun lt!378122 () Unit!28510)

(assert (=> b!833157 (= e!464726 lt!378122)))

(assert (=> b!833157 (= lt!378122 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377925) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!833157 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377925) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!833158 () Bool)

(declare-fun Unit!28530 () Unit!28510)

(assert (=> b!833158 (= e!464726 Unit!28530)))

(declare-fun b!833159 () Bool)

(assert (=> b!833159 (= e!464727 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377925) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106803 c!90718) b!833157))

(assert (= (and d!106803 (not c!90718)) b!833158))

(assert (= (and d!106803 (not res!566633)) b!833159))

(declare-fun m!777791 () Bool)

(assert (=> d!106803 m!777791))

(declare-fun m!777793 () Bool)

(assert (=> b!833157 m!777793))

(assert (=> b!833157 m!777441))

(assert (=> b!833157 m!777441))

(declare-fun m!777795 () Bool)

(assert (=> b!833157 m!777795))

(assert (=> b!833159 m!777441))

(assert (=> b!833159 m!777441))

(assert (=> b!833159 m!777795))

(assert (=> bm!36425 d!106803))

(declare-fun d!106805 () Bool)

(declare-fun c!90719 () Bool)

(assert (=> d!106805 (= c!90719 (and ((_ is Cons!15848) (toList!4469 lt!377875)) (= (_1!5052 (h!16984 (toList!4469 lt!377875))) (_1!5052 lt!377756))))))

(declare-fun e!464728 () Option!423)

(assert (=> d!106805 (= (getValueByKey!417 (toList!4469 lt!377875) (_1!5052 lt!377756)) e!464728)))

(declare-fun b!833162 () Bool)

(declare-fun e!464729 () Option!423)

(assert (=> b!833162 (= e!464729 (getValueByKey!417 (t!22212 (toList!4469 lt!377875)) (_1!5052 lt!377756)))))

(declare-fun b!833163 () Bool)

(assert (=> b!833163 (= e!464729 None!421)))

(declare-fun b!833161 () Bool)

(assert (=> b!833161 (= e!464728 e!464729)))

(declare-fun c!90720 () Bool)

(assert (=> b!833161 (= c!90720 (and ((_ is Cons!15848) (toList!4469 lt!377875)) (not (= (_1!5052 (h!16984 (toList!4469 lt!377875))) (_1!5052 lt!377756)))))))

(declare-fun b!833160 () Bool)

(assert (=> b!833160 (= e!464728 (Some!422 (_2!5052 (h!16984 (toList!4469 lt!377875)))))))

(assert (= (and d!106805 c!90719) b!833160))

(assert (= (and d!106805 (not c!90719)) b!833161))

(assert (= (and b!833161 c!90720) b!833162))

(assert (= (and b!833161 (not c!90720)) b!833163))

(declare-fun m!777797 () Bool)

(assert (=> b!833162 m!777797))

(assert (=> b!832820 d!106805))

(declare-fun d!106807 () Bool)

(declare-fun e!464731 () Bool)

(assert (=> d!106807 e!464731))

(declare-fun res!566634 () Bool)

(assert (=> d!106807 (=> res!566634 e!464731)))

(declare-fun lt!378124 () Bool)

(assert (=> d!106807 (= res!566634 (not lt!378124))))

(declare-fun lt!378127 () Bool)

(assert (=> d!106807 (= lt!378124 lt!378127)))

(declare-fun lt!378125 () Unit!28510)

(declare-fun e!464730 () Unit!28510)

(assert (=> d!106807 (= lt!378125 e!464730)))

(declare-fun c!90721 () Bool)

(assert (=> d!106807 (= c!90721 lt!378127)))

(assert (=> d!106807 (= lt!378127 (containsKey!402 (toList!4469 lt!377827) (_1!5052 lt!377756)))))

(assert (=> d!106807 (= (contains!4189 lt!377827 (_1!5052 lt!377756)) lt!378124)))

(declare-fun b!833164 () Bool)

(declare-fun lt!378126 () Unit!28510)

(assert (=> b!833164 (= e!464730 lt!378126)))

(assert (=> b!833164 (= lt!378126 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377827) (_1!5052 lt!377756)))))

(assert (=> b!833164 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377827) (_1!5052 lt!377756)))))

(declare-fun b!833165 () Bool)

(declare-fun Unit!28531 () Unit!28510)

(assert (=> b!833165 (= e!464730 Unit!28531)))

(declare-fun b!833166 () Bool)

(assert (=> b!833166 (= e!464731 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377827) (_1!5052 lt!377756))))))

(assert (= (and d!106807 c!90721) b!833164))

(assert (= (and d!106807 (not c!90721)) b!833165))

(assert (= (and d!106807 (not res!566634)) b!833166))

(declare-fun m!777799 () Bool)

(assert (=> d!106807 m!777799))

(declare-fun m!777801 () Bool)

(assert (=> b!833164 m!777801))

(assert (=> b!833164 m!777089))

(assert (=> b!833164 m!777089))

(declare-fun m!777803 () Bool)

(assert (=> b!833164 m!777803))

(assert (=> b!833166 m!777089))

(assert (=> b!833166 m!777089))

(assert (=> b!833166 m!777803))

(assert (=> d!106623 d!106807))

(declare-fun d!106809 () Bool)

(declare-fun c!90722 () Bool)

(assert (=> d!106809 (= c!90722 (and ((_ is Cons!15848) lt!377826) (= (_1!5052 (h!16984 lt!377826)) (_1!5052 lt!377756))))))

(declare-fun e!464732 () Option!423)

(assert (=> d!106809 (= (getValueByKey!417 lt!377826 (_1!5052 lt!377756)) e!464732)))

(declare-fun b!833169 () Bool)

(declare-fun e!464733 () Option!423)

(assert (=> b!833169 (= e!464733 (getValueByKey!417 (t!22212 lt!377826) (_1!5052 lt!377756)))))

(declare-fun b!833170 () Bool)

(assert (=> b!833170 (= e!464733 None!421)))

(declare-fun b!833168 () Bool)

(assert (=> b!833168 (= e!464732 e!464733)))

(declare-fun c!90723 () Bool)

(assert (=> b!833168 (= c!90723 (and ((_ is Cons!15848) lt!377826) (not (= (_1!5052 (h!16984 lt!377826)) (_1!5052 lt!377756)))))))

(declare-fun b!833167 () Bool)

(assert (=> b!833167 (= e!464732 (Some!422 (_2!5052 (h!16984 lt!377826))))))

(assert (= (and d!106809 c!90722) b!833167))

(assert (= (and d!106809 (not c!90722)) b!833168))

(assert (= (and b!833168 c!90723) b!833169))

(assert (= (and b!833168 (not c!90723)) b!833170))

(declare-fun m!777805 () Bool)

(assert (=> b!833169 m!777805))

(assert (=> d!106623 d!106809))

(declare-fun d!106811 () Bool)

(assert (=> d!106811 (= (getValueByKey!417 lt!377826 (_1!5052 lt!377756)) (Some!422 (_2!5052 lt!377756)))))

(declare-fun lt!378128 () Unit!28510)

(assert (=> d!106811 (= lt!378128 (choose!1429 lt!377826 (_1!5052 lt!377756) (_2!5052 lt!377756)))))

(declare-fun e!464734 () Bool)

(assert (=> d!106811 e!464734))

(declare-fun res!566635 () Bool)

(assert (=> d!106811 (=> (not res!566635) (not e!464734))))

(assert (=> d!106811 (= res!566635 (isStrictlySorted!430 lt!377826))))

(assert (=> d!106811 (= (lemmaContainsTupThenGetReturnValue!231 lt!377826 (_1!5052 lt!377756) (_2!5052 lt!377756)) lt!378128)))

(declare-fun b!833171 () Bool)

(declare-fun res!566636 () Bool)

(assert (=> b!833171 (=> (not res!566636) (not e!464734))))

(assert (=> b!833171 (= res!566636 (containsKey!402 lt!377826 (_1!5052 lt!377756)))))

(declare-fun b!833172 () Bool)

(assert (=> b!833172 (= e!464734 (contains!4190 lt!377826 (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))))))

(assert (= (and d!106811 res!566635) b!833171))

(assert (= (and b!833171 res!566636) b!833172))

(assert (=> d!106811 m!777083))

(declare-fun m!777807 () Bool)

(assert (=> d!106811 m!777807))

(declare-fun m!777809 () Bool)

(assert (=> d!106811 m!777809))

(declare-fun m!777811 () Bool)

(assert (=> b!833171 m!777811))

(declare-fun m!777813 () Bool)

(assert (=> b!833172 m!777813))

(assert (=> d!106623 d!106811))

(declare-fun c!90724 () Bool)

(declare-fun call!36464 () List!15852)

(declare-fun e!464736 () List!15852)

(declare-fun bm!36460 () Bool)

(assert (=> bm!36460 (= call!36464 ($colon$colon!534 e!464736 (ite c!90724 (h!16984 (toList!4469 lt!377760)) (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756)))))))

(declare-fun c!90727 () Bool)

(assert (=> bm!36460 (= c!90727 c!90724)))

(declare-fun bm!36461 () Bool)

(declare-fun call!36465 () List!15852)

(assert (=> bm!36461 (= call!36465 call!36464)))

(declare-fun bm!36462 () Bool)

(declare-fun call!36463 () List!15852)

(assert (=> bm!36462 (= call!36463 call!36465)))

(declare-fun b!833173 () Bool)

(declare-fun c!90725 () Bool)

(assert (=> b!833173 (= c!90725 (and ((_ is Cons!15848) (toList!4469 lt!377760)) (bvsgt (_1!5052 (h!16984 (toList!4469 lt!377760))) (_1!5052 lt!377756))))))

(declare-fun e!464735 () List!15852)

(declare-fun e!464738 () List!15852)

(assert (=> b!833173 (= e!464735 e!464738)))

(declare-fun b!833174 () Bool)

(assert (=> b!833174 (= e!464738 call!36463)))

(declare-fun b!833175 () Bool)

(assert (=> b!833175 (= e!464736 (insertStrictlySorted!270 (t!22212 (toList!4469 lt!377760)) (_1!5052 lt!377756) (_2!5052 lt!377756)))))

(declare-fun b!833176 () Bool)

(declare-fun e!464737 () List!15852)

(assert (=> b!833176 (= e!464737 call!36464)))

(declare-fun b!833177 () Bool)

(declare-fun e!464739 () Bool)

(declare-fun lt!378129 () List!15852)

(assert (=> b!833177 (= e!464739 (contains!4190 lt!378129 (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))))))

(declare-fun b!833178 () Bool)

(declare-fun c!90726 () Bool)

(assert (=> b!833178 (= e!464736 (ite c!90726 (t!22212 (toList!4469 lt!377760)) (ite c!90725 (Cons!15848 (h!16984 (toList!4469 lt!377760)) (t!22212 (toList!4469 lt!377760))) Nil!15849)))))

(declare-fun b!833179 () Bool)

(assert (=> b!833179 (= e!464737 e!464735)))

(assert (=> b!833179 (= c!90726 (and ((_ is Cons!15848) (toList!4469 lt!377760)) (= (_1!5052 (h!16984 (toList!4469 lt!377760))) (_1!5052 lt!377756))))))

(declare-fun b!833180 () Bool)

(assert (=> b!833180 (= e!464735 call!36465)))

(declare-fun b!833181 () Bool)

(declare-fun res!566638 () Bool)

(assert (=> b!833181 (=> (not res!566638) (not e!464739))))

(assert (=> b!833181 (= res!566638 (containsKey!402 lt!378129 (_1!5052 lt!377756)))))

(declare-fun d!106813 () Bool)

(assert (=> d!106813 e!464739))

(declare-fun res!566637 () Bool)

(assert (=> d!106813 (=> (not res!566637) (not e!464739))))

(assert (=> d!106813 (= res!566637 (isStrictlySorted!430 lt!378129))))

(assert (=> d!106813 (= lt!378129 e!464737)))

(assert (=> d!106813 (= c!90724 (and ((_ is Cons!15848) (toList!4469 lt!377760)) (bvslt (_1!5052 (h!16984 (toList!4469 lt!377760))) (_1!5052 lt!377756))))))

(assert (=> d!106813 (isStrictlySorted!430 (toList!4469 lt!377760))))

(assert (=> d!106813 (= (insertStrictlySorted!270 (toList!4469 lt!377760) (_1!5052 lt!377756) (_2!5052 lt!377756)) lt!378129)))

(declare-fun b!833182 () Bool)

(assert (=> b!833182 (= e!464738 call!36463)))

(assert (= (and d!106813 c!90724) b!833176))

(assert (= (and d!106813 (not c!90724)) b!833179))

(assert (= (and b!833179 c!90726) b!833180))

(assert (= (and b!833179 (not c!90726)) b!833173))

(assert (= (and b!833173 c!90725) b!833174))

(assert (= (and b!833173 (not c!90725)) b!833182))

(assert (= (or b!833174 b!833182) bm!36462))

(assert (= (or b!833180 bm!36462) bm!36461))

(assert (= (or b!833176 bm!36461) bm!36460))

(assert (= (and bm!36460 c!90727) b!833175))

(assert (= (and bm!36460 (not c!90727)) b!833178))

(assert (= (and d!106813 res!566637) b!833181))

(assert (= (and b!833181 res!566638) b!833177))

(declare-fun m!777815 () Bool)

(assert (=> bm!36460 m!777815))

(declare-fun m!777817 () Bool)

(assert (=> b!833177 m!777817))

(declare-fun m!777819 () Bool)

(assert (=> b!833175 m!777819))

(declare-fun m!777821 () Bool)

(assert (=> b!833181 m!777821))

(declare-fun m!777823 () Bool)

(assert (=> d!106813 m!777823))

(assert (=> d!106813 m!777653))

(assert (=> d!106623 d!106813))

(declare-fun d!106815 () Bool)

(declare-fun e!464741 () Bool)

(assert (=> d!106815 e!464741))

(declare-fun res!566639 () Bool)

(assert (=> d!106815 (=> res!566639 e!464741)))

(declare-fun lt!378130 () Bool)

(assert (=> d!106815 (= res!566639 (not lt!378130))))

(declare-fun lt!378133 () Bool)

(assert (=> d!106815 (= lt!378130 lt!378133)))

(declare-fun lt!378131 () Unit!28510)

(declare-fun e!464740 () Unit!28510)

(assert (=> d!106815 (= lt!378131 e!464740)))

(declare-fun c!90728 () Bool)

(assert (=> d!106815 (= c!90728 lt!378133)))

(assert (=> d!106815 (= lt!378133 (containsKey!402 (toList!4469 lt!377823) (_1!5052 lt!377761)))))

(assert (=> d!106815 (= (contains!4189 lt!377823 (_1!5052 lt!377761)) lt!378130)))

(declare-fun b!833183 () Bool)

(declare-fun lt!378132 () Unit!28510)

(assert (=> b!833183 (= e!464740 lt!378132)))

(assert (=> b!833183 (= lt!378132 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377823) (_1!5052 lt!377761)))))

(assert (=> b!833183 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377823) (_1!5052 lt!377761)))))

(declare-fun b!833184 () Bool)

(declare-fun Unit!28532 () Unit!28510)

(assert (=> b!833184 (= e!464740 Unit!28532)))

(declare-fun b!833185 () Bool)

(assert (=> b!833185 (= e!464741 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377823) (_1!5052 lt!377761))))))

(assert (= (and d!106815 c!90728) b!833183))

(assert (= (and d!106815 (not c!90728)) b!833184))

(assert (= (and d!106815 (not res!566639)) b!833185))

(declare-fun m!777825 () Bool)

(assert (=> d!106815 m!777825))

(declare-fun m!777827 () Bool)

(assert (=> b!833183 m!777827))

(assert (=> b!833183 m!777077))

(assert (=> b!833183 m!777077))

(declare-fun m!777829 () Bool)

(assert (=> b!833183 m!777829))

(assert (=> b!833185 m!777077))

(assert (=> b!833185 m!777077))

(assert (=> b!833185 m!777829))

(assert (=> d!106621 d!106815))

(declare-fun d!106817 () Bool)

(declare-fun c!90729 () Bool)

(assert (=> d!106817 (= c!90729 (and ((_ is Cons!15848) lt!377822) (= (_1!5052 (h!16984 lt!377822)) (_1!5052 lt!377761))))))

(declare-fun e!464742 () Option!423)

(assert (=> d!106817 (= (getValueByKey!417 lt!377822 (_1!5052 lt!377761)) e!464742)))

(declare-fun b!833188 () Bool)

(declare-fun e!464743 () Option!423)

(assert (=> b!833188 (= e!464743 (getValueByKey!417 (t!22212 lt!377822) (_1!5052 lt!377761)))))

(declare-fun b!833189 () Bool)

(assert (=> b!833189 (= e!464743 None!421)))

(declare-fun b!833187 () Bool)

(assert (=> b!833187 (= e!464742 e!464743)))

(declare-fun c!90730 () Bool)

(assert (=> b!833187 (= c!90730 (and ((_ is Cons!15848) lt!377822) (not (= (_1!5052 (h!16984 lt!377822)) (_1!5052 lt!377761)))))))

(declare-fun b!833186 () Bool)

(assert (=> b!833186 (= e!464742 (Some!422 (_2!5052 (h!16984 lt!377822))))))

(assert (= (and d!106817 c!90729) b!833186))

(assert (= (and d!106817 (not c!90729)) b!833187))

(assert (= (and b!833187 c!90730) b!833188))

(assert (= (and b!833187 (not c!90730)) b!833189))

(declare-fun m!777831 () Bool)

(assert (=> b!833188 m!777831))

(assert (=> d!106621 d!106817))

(declare-fun d!106819 () Bool)

(assert (=> d!106819 (= (getValueByKey!417 lt!377822 (_1!5052 lt!377761)) (Some!422 (_2!5052 lt!377761)))))

(declare-fun lt!378134 () Unit!28510)

(assert (=> d!106819 (= lt!378134 (choose!1429 lt!377822 (_1!5052 lt!377761) (_2!5052 lt!377761)))))

(declare-fun e!464744 () Bool)

(assert (=> d!106819 e!464744))

(declare-fun res!566640 () Bool)

(assert (=> d!106819 (=> (not res!566640) (not e!464744))))

(assert (=> d!106819 (= res!566640 (isStrictlySorted!430 lt!377822))))

(assert (=> d!106819 (= (lemmaContainsTupThenGetReturnValue!231 lt!377822 (_1!5052 lt!377761) (_2!5052 lt!377761)) lt!378134)))

(declare-fun b!833190 () Bool)

(declare-fun res!566641 () Bool)

(assert (=> b!833190 (=> (not res!566641) (not e!464744))))

(assert (=> b!833190 (= res!566641 (containsKey!402 lt!377822 (_1!5052 lt!377761)))))

(declare-fun b!833191 () Bool)

(assert (=> b!833191 (= e!464744 (contains!4190 lt!377822 (tuple2!10083 (_1!5052 lt!377761) (_2!5052 lt!377761))))))

(assert (= (and d!106819 res!566640) b!833190))

(assert (= (and b!833190 res!566641) b!833191))

(assert (=> d!106819 m!777071))

(declare-fun m!777833 () Bool)

(assert (=> d!106819 m!777833))

(declare-fun m!777835 () Bool)

(assert (=> d!106819 m!777835))

(declare-fun m!777837 () Bool)

(assert (=> b!833190 m!777837))

(declare-fun m!777839 () Bool)

(assert (=> b!833191 m!777839))

(assert (=> d!106621 d!106819))

(declare-fun call!36467 () List!15852)

(declare-fun c!90731 () Bool)

(declare-fun e!464746 () List!15852)

(declare-fun bm!36463 () Bool)

(assert (=> bm!36463 (= call!36467 ($colon$colon!534 e!464746 (ite c!90731 (h!16984 (toList!4469 (+!1991 lt!377760 lt!377756))) (tuple2!10083 (_1!5052 lt!377761) (_2!5052 lt!377761)))))))

(declare-fun c!90734 () Bool)

(assert (=> bm!36463 (= c!90734 c!90731)))

(declare-fun bm!36464 () Bool)

(declare-fun call!36468 () List!15852)

(assert (=> bm!36464 (= call!36468 call!36467)))

(declare-fun bm!36465 () Bool)

(declare-fun call!36466 () List!15852)

(assert (=> bm!36465 (= call!36466 call!36468)))

(declare-fun c!90732 () Bool)

(declare-fun b!833192 () Bool)

(assert (=> b!833192 (= c!90732 (and ((_ is Cons!15848) (toList!4469 (+!1991 lt!377760 lt!377756))) (bvsgt (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377760 lt!377756)))) (_1!5052 lt!377761))))))

(declare-fun e!464745 () List!15852)

(declare-fun e!464748 () List!15852)

(assert (=> b!833192 (= e!464745 e!464748)))

(declare-fun b!833193 () Bool)

(assert (=> b!833193 (= e!464748 call!36466)))

(declare-fun b!833194 () Bool)

(assert (=> b!833194 (= e!464746 (insertStrictlySorted!270 (t!22212 (toList!4469 (+!1991 lt!377760 lt!377756))) (_1!5052 lt!377761) (_2!5052 lt!377761)))))

(declare-fun b!833195 () Bool)

(declare-fun e!464747 () List!15852)

(assert (=> b!833195 (= e!464747 call!36467)))

(declare-fun b!833196 () Bool)

(declare-fun e!464749 () Bool)

(declare-fun lt!378135 () List!15852)

(assert (=> b!833196 (= e!464749 (contains!4190 lt!378135 (tuple2!10083 (_1!5052 lt!377761) (_2!5052 lt!377761))))))

(declare-fun b!833197 () Bool)

(declare-fun c!90733 () Bool)

(assert (=> b!833197 (= e!464746 (ite c!90733 (t!22212 (toList!4469 (+!1991 lt!377760 lt!377756))) (ite c!90732 (Cons!15848 (h!16984 (toList!4469 (+!1991 lt!377760 lt!377756))) (t!22212 (toList!4469 (+!1991 lt!377760 lt!377756)))) Nil!15849)))))

(declare-fun b!833198 () Bool)

(assert (=> b!833198 (= e!464747 e!464745)))

(assert (=> b!833198 (= c!90733 (and ((_ is Cons!15848) (toList!4469 (+!1991 lt!377760 lt!377756))) (= (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377760 lt!377756)))) (_1!5052 lt!377761))))))

(declare-fun b!833199 () Bool)

(assert (=> b!833199 (= e!464745 call!36468)))

(declare-fun b!833200 () Bool)

(declare-fun res!566643 () Bool)

(assert (=> b!833200 (=> (not res!566643) (not e!464749))))

(assert (=> b!833200 (= res!566643 (containsKey!402 lt!378135 (_1!5052 lt!377761)))))

(declare-fun d!106821 () Bool)

(assert (=> d!106821 e!464749))

(declare-fun res!566642 () Bool)

(assert (=> d!106821 (=> (not res!566642) (not e!464749))))

(assert (=> d!106821 (= res!566642 (isStrictlySorted!430 lt!378135))))

(assert (=> d!106821 (= lt!378135 e!464747)))

(assert (=> d!106821 (= c!90731 (and ((_ is Cons!15848) (toList!4469 (+!1991 lt!377760 lt!377756))) (bvslt (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377760 lt!377756)))) (_1!5052 lt!377761))))))

(assert (=> d!106821 (isStrictlySorted!430 (toList!4469 (+!1991 lt!377760 lt!377756)))))

(assert (=> d!106821 (= (insertStrictlySorted!270 (toList!4469 (+!1991 lt!377760 lt!377756)) (_1!5052 lt!377761) (_2!5052 lt!377761)) lt!378135)))

(declare-fun b!833201 () Bool)

(assert (=> b!833201 (= e!464748 call!36466)))

(assert (= (and d!106821 c!90731) b!833195))

(assert (= (and d!106821 (not c!90731)) b!833198))

(assert (= (and b!833198 c!90733) b!833199))

(assert (= (and b!833198 (not c!90733)) b!833192))

(assert (= (and b!833192 c!90732) b!833193))

(assert (= (and b!833192 (not c!90732)) b!833201))

(assert (= (or b!833193 b!833201) bm!36465))

(assert (= (or b!833199 bm!36465) bm!36464))

(assert (= (or b!833195 bm!36464) bm!36463))

(assert (= (and bm!36463 c!90734) b!833194))

(assert (= (and bm!36463 (not c!90734)) b!833197))

(assert (= (and d!106821 res!566642) b!833200))

(assert (= (and b!833200 res!566643) b!833196))

(declare-fun m!777841 () Bool)

(assert (=> bm!36463 m!777841))

(declare-fun m!777843 () Bool)

(assert (=> b!833196 m!777843))

(declare-fun m!777845 () Bool)

(assert (=> b!833194 m!777845))

(declare-fun m!777847 () Bool)

(assert (=> b!833200 m!777847))

(declare-fun m!777849 () Bool)

(assert (=> d!106821 m!777849))

(declare-fun m!777851 () Bool)

(assert (=> d!106821 m!777851))

(assert (=> d!106621 d!106821))

(assert (=> b!832815 d!106697))

(declare-fun d!106823 () Bool)

(declare-fun e!464751 () Bool)

(assert (=> d!106823 e!464751))

(declare-fun res!566644 () Bool)

(assert (=> d!106823 (=> res!566644 e!464751)))

(declare-fun lt!378136 () Bool)

(assert (=> d!106823 (= res!566644 (not lt!378136))))

(declare-fun lt!378139 () Bool)

(assert (=> d!106823 (= lt!378136 lt!378139)))

(declare-fun lt!378137 () Unit!28510)

(declare-fun e!464750 () Unit!28510)

(assert (=> d!106823 (= lt!378137 e!464750)))

(declare-fun c!90735 () Bool)

(assert (=> d!106823 (= c!90735 lt!378139)))

(assert (=> d!106823 (= lt!378139 (containsKey!402 (toList!4469 lt!377861) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!106823 (= (contains!4189 lt!377861 #b0000000000000000000000000000000000000000000000000000000000000000) lt!378136)))

(declare-fun b!833202 () Bool)

(declare-fun lt!378138 () Unit!28510)

(assert (=> b!833202 (= e!464750 lt!378138)))

(assert (=> b!833202 (= lt!378138 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377861) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!833202 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377861) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!833203 () Bool)

(declare-fun Unit!28533 () Unit!28510)

(assert (=> b!833203 (= e!464750 Unit!28533)))

(declare-fun b!833204 () Bool)

(assert (=> b!833204 (= e!464751 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377861) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106823 c!90735) b!833202))

(assert (= (and d!106823 (not c!90735)) b!833203))

(assert (= (and d!106823 (not res!566644)) b!833204))

(declare-fun m!777853 () Bool)

(assert (=> d!106823 m!777853))

(declare-fun m!777855 () Bool)

(assert (=> b!833202 m!777855))

(declare-fun m!777857 () Bool)

(assert (=> b!833202 m!777857))

(assert (=> b!833202 m!777857))

(declare-fun m!777859 () Bool)

(assert (=> b!833202 m!777859))

(assert (=> b!833204 m!777857))

(assert (=> b!833204 m!777857))

(assert (=> b!833204 m!777859))

(assert (=> d!106631 d!106823))

(assert (=> d!106631 d!106633))

(declare-fun d!106825 () Bool)

(declare-fun isEmpty!664 (List!15852) Bool)

(assert (=> d!106825 (= (isEmpty!663 lt!377854) (isEmpty!664 (toList!4469 lt!377854)))))

(declare-fun bs!23293 () Bool)

(assert (= bs!23293 d!106825))

(declare-fun m!777861 () Bool)

(assert (=> bs!23293 m!777861))

(assert (=> b!832778 d!106825))

(declare-fun d!106827 () Bool)

(assert (=> d!106827 (= (isEmpty!663 lt!377861) (isEmpty!664 (toList!4469 lt!377861)))))

(declare-fun bs!23294 () Bool)

(assert (= bs!23294 d!106827))

(declare-fun m!777863 () Bool)

(assert (=> bs!23294 m!777863))

(assert (=> b!832792 d!106827))

(declare-fun d!106829 () Bool)

(declare-fun e!464752 () Bool)

(assert (=> d!106829 e!464752))

(declare-fun res!566646 () Bool)

(assert (=> d!106829 (=> (not res!566646) (not e!464752))))

(declare-fun lt!378143 () ListLongMap!8907)

(assert (=> d!106829 (= res!566646 (contains!4189 lt!378143 (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!378142 () List!15852)

(assert (=> d!106829 (= lt!378143 (ListLongMap!8908 lt!378142))))

(declare-fun lt!378140 () Unit!28510)

(declare-fun lt!378141 () Unit!28510)

(assert (=> d!106829 (= lt!378140 lt!378141)))

(assert (=> d!106829 (= (getValueByKey!417 lt!378142 (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!422 (_2!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!106829 (= lt!378141 (lemmaContainsTupThenGetReturnValue!231 lt!378142 (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!106829 (= lt!378142 (insertStrictlySorted!270 (toList!4469 call!36441) (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!106829 (= (+!1991 call!36441 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) lt!378143)))

(declare-fun b!833205 () Bool)

(declare-fun res!566645 () Bool)

(assert (=> b!833205 (=> (not res!566645) (not e!464752))))

(assert (=> b!833205 (= res!566645 (= (getValueByKey!417 (toList!4469 lt!378143) (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!422 (_2!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!833206 () Bool)

(assert (=> b!833206 (= e!464752 (contains!4190 (toList!4469 lt!378143) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!106829 res!566646) b!833205))

(assert (= (and b!833205 res!566645) b!833206))

(declare-fun m!777865 () Bool)

(assert (=> d!106829 m!777865))

(declare-fun m!777867 () Bool)

(assert (=> d!106829 m!777867))

(declare-fun m!777869 () Bool)

(assert (=> d!106829 m!777869))

(declare-fun m!777871 () Bool)

(assert (=> d!106829 m!777871))

(declare-fun m!777873 () Bool)

(assert (=> b!833205 m!777873))

(declare-fun m!777875 () Bool)

(assert (=> b!833206 m!777875))

(assert (=> b!832885 d!106829))

(declare-fun d!106831 () Bool)

(declare-fun e!464754 () Bool)

(assert (=> d!106831 e!464754))

(declare-fun res!566647 () Bool)

(assert (=> d!106831 (=> res!566647 e!464754)))

(declare-fun lt!378144 () Bool)

(assert (=> d!106831 (= res!566647 (not lt!378144))))

(declare-fun lt!378147 () Bool)

(assert (=> d!106831 (= lt!378144 lt!378147)))

(declare-fun lt!378145 () Unit!28510)

(declare-fun e!464753 () Unit!28510)

(assert (=> d!106831 (= lt!378145 e!464753)))

(declare-fun c!90736 () Bool)

(assert (=> d!106831 (= c!90736 lt!378147)))

(assert (=> d!106831 (= lt!378147 (containsKey!402 (toList!4469 lt!377947) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> d!106831 (= (contains!4189 lt!377947 (select (arr!22331 _keys!976) #b00000000000000000000000000000000)) lt!378144)))

(declare-fun b!833207 () Bool)

(declare-fun lt!378146 () Unit!28510)

(assert (=> b!833207 (= e!464753 lt!378146)))

(assert (=> b!833207 (= lt!378146 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377947) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!833207 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377947) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!833208 () Bool)

(declare-fun Unit!28534 () Unit!28510)

(assert (=> b!833208 (= e!464753 Unit!28534)))

(declare-fun b!833209 () Bool)

(assert (=> b!833209 (= e!464754 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377947) (select (arr!22331 _keys!976) #b00000000000000000000000000000000))))))

(assert (= (and d!106831 c!90736) b!833207))

(assert (= (and d!106831 (not c!90736)) b!833208))

(assert (= (and d!106831 (not res!566647)) b!833209))

(assert (=> d!106831 m!777093))

(declare-fun m!777877 () Bool)

(assert (=> d!106831 m!777877))

(assert (=> b!833207 m!777093))

(declare-fun m!777879 () Bool)

(assert (=> b!833207 m!777879))

(assert (=> b!833207 m!777093))

(assert (=> b!833207 m!777781))

(assert (=> b!833207 m!777781))

(declare-fun m!777881 () Bool)

(assert (=> b!833207 m!777881))

(assert (=> b!833209 m!777093))

(assert (=> b!833209 m!777781))

(assert (=> b!833209 m!777781))

(assert (=> b!833209 m!777881))

(assert (=> b!832888 d!106831))

(assert (=> b!832874 d!106697))

(declare-fun d!106833 () Bool)

(assert (=> d!106833 (arrayContainsKey!0 _keys!976 lt!377836 #b00000000000000000000000000000000)))

(declare-fun lt!378150 () Unit!28510)

(declare-fun choose!13 (array!46601 (_ BitVec 64) (_ BitVec 32)) Unit!28510)

(assert (=> d!106833 (= lt!378150 (choose!13 _keys!976 lt!377836 #b00000000000000000000000000000000))))

(assert (=> d!106833 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!106833 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!377836 #b00000000000000000000000000000000) lt!378150)))

(declare-fun bs!23295 () Bool)

(assert (= bs!23295 d!106833))

(assert (=> bs!23295 m!777097))

(declare-fun m!777883 () Bool)

(assert (=> bs!23295 m!777883))

(assert (=> b!832749 d!106833))

(declare-fun d!106835 () Bool)

(declare-fun res!566652 () Bool)

(declare-fun e!464759 () Bool)

(assert (=> d!106835 (=> res!566652 e!464759)))

(assert (=> d!106835 (= res!566652 (= (select (arr!22331 _keys!976) #b00000000000000000000000000000000) lt!377836))))

(assert (=> d!106835 (= (arrayContainsKey!0 _keys!976 lt!377836 #b00000000000000000000000000000000) e!464759)))

(declare-fun b!833214 () Bool)

(declare-fun e!464760 () Bool)

(assert (=> b!833214 (= e!464759 e!464760)))

(declare-fun res!566653 () Bool)

(assert (=> b!833214 (=> (not res!566653) (not e!464760))))

(assert (=> b!833214 (= res!566653 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22751 _keys!976)))))

(declare-fun b!833215 () Bool)

(assert (=> b!833215 (= e!464760 (arrayContainsKey!0 _keys!976 lt!377836 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!106835 (not res!566652)) b!833214))

(assert (= (and b!833214 res!566653) b!833215))

(assert (=> d!106835 m!777093))

(declare-fun m!777885 () Bool)

(assert (=> b!833215 m!777885))

(assert (=> b!832749 d!106835))

(declare-fun b!833228 () Bool)

(declare-fun c!90744 () Bool)

(declare-fun lt!378159 () (_ BitVec 64))

(assert (=> b!833228 (= c!90744 (= lt!378159 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!464767 () SeekEntryResult!8696)

(declare-fun e!464768 () SeekEntryResult!8696)

(assert (=> b!833228 (= e!464767 e!464768)))

(declare-fun b!833229 () Bool)

(declare-fun e!464769 () SeekEntryResult!8696)

(assert (=> b!833229 (= e!464769 Undefined!8696)))

(declare-fun b!833230 () Bool)

(declare-fun lt!378158 () SeekEntryResult!8696)

(assert (=> b!833230 (= e!464768 (MissingZero!8696 (index!37157 lt!378158)))))

(declare-fun d!106837 () Bool)

(declare-fun lt!378157 () SeekEntryResult!8696)

(assert (=> d!106837 (and (or ((_ is Undefined!8696) lt!378157) (not ((_ is Found!8696) lt!378157)) (and (bvsge (index!37156 lt!378157) #b00000000000000000000000000000000) (bvslt (index!37156 lt!378157) (size!22751 _keys!976)))) (or ((_ is Undefined!8696) lt!378157) ((_ is Found!8696) lt!378157) (not ((_ is MissingZero!8696) lt!378157)) (and (bvsge (index!37155 lt!378157) #b00000000000000000000000000000000) (bvslt (index!37155 lt!378157) (size!22751 _keys!976)))) (or ((_ is Undefined!8696) lt!378157) ((_ is Found!8696) lt!378157) ((_ is MissingZero!8696) lt!378157) (not ((_ is MissingVacant!8696) lt!378157)) (and (bvsge (index!37158 lt!378157) #b00000000000000000000000000000000) (bvslt (index!37158 lt!378157) (size!22751 _keys!976)))) (or ((_ is Undefined!8696) lt!378157) (ite ((_ is Found!8696) lt!378157) (= (select (arr!22331 _keys!976) (index!37156 lt!378157)) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!8696) lt!378157) (= (select (arr!22331 _keys!976) (index!37155 lt!378157)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8696) lt!378157) (= (select (arr!22331 _keys!976) (index!37158 lt!378157)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!106837 (= lt!378157 e!464769)))

(declare-fun c!90743 () Bool)

(assert (=> d!106837 (= c!90743 (and ((_ is Intermediate!8696) lt!378158) (undefined!9508 lt!378158)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!46601 (_ BitVec 32)) SeekEntryResult!8696)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!106837 (= lt!378158 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) mask!1312) (select (arr!22331 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312))))

(assert (=> d!106837 (validMask!0 mask!1312)))

(assert (=> d!106837 (= (seekEntryOrOpen!0 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) lt!378157)))

(declare-fun b!833231 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!46601 (_ BitVec 32)) SeekEntryResult!8696)

(assert (=> b!833231 (= e!464768 (seekKeyOrZeroReturnVacant!0 (x!70105 lt!378158) (index!37157 lt!378158) (index!37157 lt!378158) (select (arr!22331 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312))))

(declare-fun b!833232 () Bool)

(assert (=> b!833232 (= e!464767 (Found!8696 (index!37157 lt!378158)))))

(declare-fun b!833233 () Bool)

(assert (=> b!833233 (= e!464769 e!464767)))

(assert (=> b!833233 (= lt!378159 (select (arr!22331 _keys!976) (index!37157 lt!378158)))))

(declare-fun c!90745 () Bool)

(assert (=> b!833233 (= c!90745 (= lt!378159 (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!106837 c!90743) b!833229))

(assert (= (and d!106837 (not c!90743)) b!833233))

(assert (= (and b!833233 c!90745) b!833232))

(assert (= (and b!833233 (not c!90745)) b!833228))

(assert (= (and b!833228 c!90744) b!833230))

(assert (= (and b!833228 (not c!90744)) b!833231))

(declare-fun m!777887 () Bool)

(assert (=> d!106837 m!777887))

(assert (=> d!106837 m!777093))

(declare-fun m!777889 () Bool)

(assert (=> d!106837 m!777889))

(declare-fun m!777891 () Bool)

(assert (=> d!106837 m!777891))

(declare-fun m!777893 () Bool)

(assert (=> d!106837 m!777893))

(declare-fun m!777895 () Bool)

(assert (=> d!106837 m!777895))

(assert (=> d!106837 m!777093))

(assert (=> d!106837 m!777887))

(assert (=> d!106837 m!776931))

(assert (=> b!833231 m!777093))

(declare-fun m!777897 () Bool)

(assert (=> b!833231 m!777897))

(declare-fun m!777899 () Bool)

(assert (=> b!833233 m!777899))

(assert (=> b!832749 d!106837))

(declare-fun d!106839 () Bool)

(declare-fun lt!378160 () Bool)

(assert (=> d!106839 (= lt!378160 (select (content!388 (toList!4469 lt!377971)) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun e!464771 () Bool)

(assert (=> d!106839 (= lt!378160 e!464771)))

(declare-fun res!566655 () Bool)

(assert (=> d!106839 (=> (not res!566655) (not e!464771))))

(assert (=> d!106839 (= res!566655 ((_ is Cons!15848) (toList!4469 lt!377971)))))

(assert (=> d!106839 (= (contains!4190 (toList!4469 lt!377971) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!378160)))

(declare-fun b!833234 () Bool)

(declare-fun e!464770 () Bool)

(assert (=> b!833234 (= e!464771 e!464770)))

(declare-fun res!566654 () Bool)

(assert (=> b!833234 (=> res!566654 e!464770)))

(assert (=> b!833234 (= res!566654 (= (h!16984 (toList!4469 lt!377971)) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!833235 () Bool)

(assert (=> b!833235 (= e!464770 (contains!4190 (t!22212 (toList!4469 lt!377971)) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!106839 res!566655) b!833234))

(assert (= (and b!833234 (not res!566654)) b!833235))

(declare-fun m!777901 () Bool)

(assert (=> d!106839 m!777901))

(declare-fun m!777903 () Bool)

(assert (=> d!106839 m!777903))

(declare-fun m!777905 () Bool)

(assert (=> b!833235 m!777905))

(assert (=> b!832909 d!106839))

(assert (=> b!832780 d!106767))

(declare-fun d!106841 () Bool)

(declare-fun c!90746 () Bool)

(assert (=> d!106841 (= c!90746 (and ((_ is Cons!15848) (toList!4469 lt!377819)) (= (_1!5052 (h!16984 (toList!4469 lt!377819))) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!464772 () Option!423)

(assert (=> d!106841 (= (getValueByKey!417 (toList!4469 lt!377819) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!464772)))

(declare-fun b!833238 () Bool)

(declare-fun e!464773 () Option!423)

(assert (=> b!833238 (= e!464773 (getValueByKey!417 (t!22212 (toList!4469 lt!377819)) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!833239 () Bool)

(assert (=> b!833239 (= e!464773 None!421)))

(declare-fun b!833237 () Bool)

(assert (=> b!833237 (= e!464772 e!464773)))

(declare-fun c!90747 () Bool)

(assert (=> b!833237 (= c!90747 (and ((_ is Cons!15848) (toList!4469 lt!377819)) (not (= (_1!5052 (h!16984 (toList!4469 lt!377819))) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun b!833236 () Bool)

(assert (=> b!833236 (= e!464772 (Some!422 (_2!5052 (h!16984 (toList!4469 lt!377819)))))))

(assert (= (and d!106841 c!90746) b!833236))

(assert (= (and d!106841 (not c!90746)) b!833237))

(assert (= (and b!833237 c!90747) b!833238))

(assert (= (and b!833237 (not c!90747)) b!833239))

(declare-fun m!777907 () Bool)

(assert (=> b!833238 m!777907))

(assert (=> b!832735 d!106841))

(declare-fun d!106843 () Bool)

(assert (=> d!106843 (= (apply!373 lt!377947 #b0000000000000000000000000000000000000000000000000000000000000000) (get!11827 (getValueByKey!417 (toList!4469 lt!377947) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!23296 () Bool)

(assert (= bs!23296 d!106843))

(assert (=> bs!23296 m!777749))

(assert (=> bs!23296 m!777749))

(declare-fun m!777909 () Bool)

(assert (=> bs!23296 m!777909))

(assert (=> b!832903 d!106843))

(declare-fun d!106845 () Bool)

(declare-fun lt!378161 () Bool)

(assert (=> d!106845 (= lt!378161 (select (content!388 (toList!4469 lt!377967)) lt!377756))))

(declare-fun e!464775 () Bool)

(assert (=> d!106845 (= lt!378161 e!464775)))

(declare-fun res!566657 () Bool)

(assert (=> d!106845 (=> (not res!566657) (not e!464775))))

(assert (=> d!106845 (= res!566657 ((_ is Cons!15848) (toList!4469 lt!377967)))))

(assert (=> d!106845 (= (contains!4190 (toList!4469 lt!377967) lt!377756) lt!378161)))

(declare-fun b!833240 () Bool)

(declare-fun e!464774 () Bool)

(assert (=> b!833240 (= e!464775 e!464774)))

(declare-fun res!566656 () Bool)

(assert (=> b!833240 (=> res!566656 e!464774)))

(assert (=> b!833240 (= res!566656 (= (h!16984 (toList!4469 lt!377967)) lt!377756))))

(declare-fun b!833241 () Bool)

(assert (=> b!833241 (= e!464774 (contains!4190 (t!22212 (toList!4469 lt!377967)) lt!377756))))

(assert (= (and d!106845 res!566657) b!833240))

(assert (= (and b!833240 (not res!566656)) b!833241))

(declare-fun m!777911 () Bool)

(assert (=> d!106845 m!777911))

(declare-fun m!777913 () Bool)

(assert (=> d!106845 m!777913))

(declare-fun m!777915 () Bool)

(assert (=> b!833241 m!777915))

(assert (=> b!832907 d!106845))

(assert (=> b!832794 d!106715))

(declare-fun d!106847 () Bool)

(declare-fun e!464777 () Bool)

(assert (=> d!106847 e!464777))

(declare-fun res!566658 () Bool)

(assert (=> d!106847 (=> res!566658 e!464777)))

(declare-fun lt!378162 () Bool)

(assert (=> d!106847 (= res!566658 (not lt!378162))))

(declare-fun lt!378165 () Bool)

(assert (=> d!106847 (= lt!378162 lt!378165)))

(declare-fun lt!378163 () Unit!28510)

(declare-fun e!464776 () Unit!28510)

(assert (=> d!106847 (= lt!378163 e!464776)))

(declare-fun c!90748 () Bool)

(assert (=> d!106847 (= c!90748 lt!378165)))

(assert (=> d!106847 (= lt!378165 (containsKey!402 (toList!4469 lt!377925) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!106847 (= (contains!4189 lt!377925 #b0000000000000000000000000000000000000000000000000000000000000000) lt!378162)))

(declare-fun b!833242 () Bool)

(declare-fun lt!378164 () Unit!28510)

(assert (=> b!833242 (= e!464776 lt!378164)))

(assert (=> b!833242 (= lt!378164 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377925) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!833242 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377925) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!833243 () Bool)

(declare-fun Unit!28535 () Unit!28510)

(assert (=> b!833243 (= e!464776 Unit!28535)))

(declare-fun b!833244 () Bool)

(assert (=> b!833244 (= e!464777 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377925) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106847 c!90748) b!833242))

(assert (= (and d!106847 (not c!90748)) b!833243))

(assert (= (and d!106847 (not res!566658)) b!833244))

(declare-fun m!777917 () Bool)

(assert (=> d!106847 m!777917))

(declare-fun m!777919 () Bool)

(assert (=> b!833242 m!777919))

(assert (=> b!833242 m!777429))

(assert (=> b!833242 m!777429))

(declare-fun m!777921 () Bool)

(assert (=> b!833242 m!777921))

(assert (=> b!833244 m!777429))

(assert (=> b!833244 m!777429))

(assert (=> b!833244 m!777921))

(assert (=> bm!36427 d!106847))

(declare-fun d!106849 () Bool)

(declare-fun c!90749 () Bool)

(assert (=> d!106849 (= c!90749 (and ((_ is Cons!15848) (toList!4469 lt!377815)) (= (_1!5052 (h!16984 (toList!4469 lt!377815))) (_1!5052 lt!377756))))))

(declare-fun e!464778 () Option!423)

(assert (=> d!106849 (= (getValueByKey!417 (toList!4469 lt!377815) (_1!5052 lt!377756)) e!464778)))

(declare-fun b!833247 () Bool)

(declare-fun e!464779 () Option!423)

(assert (=> b!833247 (= e!464779 (getValueByKey!417 (t!22212 (toList!4469 lt!377815)) (_1!5052 lt!377756)))))

(declare-fun b!833248 () Bool)

(assert (=> b!833248 (= e!464779 None!421)))

(declare-fun b!833246 () Bool)

(assert (=> b!833246 (= e!464778 e!464779)))

(declare-fun c!90750 () Bool)

(assert (=> b!833246 (= c!90750 (and ((_ is Cons!15848) (toList!4469 lt!377815)) (not (= (_1!5052 (h!16984 (toList!4469 lt!377815))) (_1!5052 lt!377756)))))))

(declare-fun b!833245 () Bool)

(assert (=> b!833245 (= e!464778 (Some!422 (_2!5052 (h!16984 (toList!4469 lt!377815)))))))

(assert (= (and d!106849 c!90749) b!833245))

(assert (= (and d!106849 (not c!90749)) b!833246))

(assert (= (and b!833246 c!90750) b!833247))

(assert (= (and b!833246 (not c!90750)) b!833248))

(declare-fun m!777923 () Bool)

(assert (=> b!833247 m!777923))

(assert (=> b!832733 d!106849))

(declare-fun d!106851 () Bool)

(declare-fun c!90751 () Bool)

(assert (=> d!106851 (= c!90751 (and ((_ is Cons!15848) (toList!4469 lt!377827)) (= (_1!5052 (h!16984 (toList!4469 lt!377827))) (_1!5052 lt!377756))))))

(declare-fun e!464780 () Option!423)

(assert (=> d!106851 (= (getValueByKey!417 (toList!4469 lt!377827) (_1!5052 lt!377756)) e!464780)))

(declare-fun b!833251 () Bool)

(declare-fun e!464781 () Option!423)

(assert (=> b!833251 (= e!464781 (getValueByKey!417 (t!22212 (toList!4469 lt!377827)) (_1!5052 lt!377756)))))

(declare-fun b!833252 () Bool)

(assert (=> b!833252 (= e!464781 None!421)))

(declare-fun b!833250 () Bool)

(assert (=> b!833250 (= e!464780 e!464781)))

(declare-fun c!90752 () Bool)

(assert (=> b!833250 (= c!90752 (and ((_ is Cons!15848) (toList!4469 lt!377827)) (not (= (_1!5052 (h!16984 (toList!4469 lt!377827))) (_1!5052 lt!377756)))))))

(declare-fun b!833249 () Bool)

(assert (=> b!833249 (= e!464780 (Some!422 (_2!5052 (h!16984 (toList!4469 lt!377827)))))))

(assert (= (and d!106851 c!90751) b!833249))

(assert (= (and d!106851 (not c!90751)) b!833250))

(assert (= (and b!833250 c!90752) b!833251))

(assert (= (and b!833250 (not c!90752)) b!833252))

(declare-fun m!777925 () Bool)

(assert (=> b!833251 m!777925))

(assert (=> b!832739 d!106851))

(assert (=> b!832889 d!106697))

(assert (=> b!832751 d!106697))

(declare-fun d!106853 () Bool)

(declare-fun c!90753 () Bool)

(assert (=> d!106853 (= c!90753 (and ((_ is Cons!15848) (toList!4469 lt!377823)) (= (_1!5052 (h!16984 (toList!4469 lt!377823))) (_1!5052 lt!377761))))))

(declare-fun e!464782 () Option!423)

(assert (=> d!106853 (= (getValueByKey!417 (toList!4469 lt!377823) (_1!5052 lt!377761)) e!464782)))

(declare-fun b!833255 () Bool)

(declare-fun e!464783 () Option!423)

(assert (=> b!833255 (= e!464783 (getValueByKey!417 (t!22212 (toList!4469 lt!377823)) (_1!5052 lt!377761)))))

(declare-fun b!833256 () Bool)

(assert (=> b!833256 (= e!464783 None!421)))

(declare-fun b!833254 () Bool)

(assert (=> b!833254 (= e!464782 e!464783)))

(declare-fun c!90754 () Bool)

(assert (=> b!833254 (= c!90754 (and ((_ is Cons!15848) (toList!4469 lt!377823)) (not (= (_1!5052 (h!16984 (toList!4469 lt!377823))) (_1!5052 lt!377761)))))))

(declare-fun b!833253 () Bool)

(assert (=> b!833253 (= e!464782 (Some!422 (_2!5052 (h!16984 (toList!4469 lt!377823)))))))

(assert (= (and d!106853 c!90753) b!833253))

(assert (= (and d!106853 (not c!90753)) b!833254))

(assert (= (and b!833254 c!90754) b!833255))

(assert (= (and b!833254 (not c!90754)) b!833256))

(declare-fun m!777927 () Bool)

(assert (=> b!833255 m!777927))

(assert (=> b!832737 d!106853))

(declare-fun d!106855 () Bool)

(assert (=> d!106855 (= (apply!373 lt!377947 #b1000000000000000000000000000000000000000000000000000000000000000) (get!11827 (getValueByKey!417 (toList!4469 lt!377947) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!23297 () Bool)

(assert (= bs!23297 d!106855))

(assert (=> bs!23297 m!777515))

(assert (=> bs!23297 m!777515))

(declare-fun m!777929 () Bool)

(assert (=> bs!23297 m!777929))

(assert (=> b!832905 d!106855))

(declare-fun d!106857 () Bool)

(assert (=> d!106857 (= (apply!373 lt!377925 (select (arr!22331 _keys!976) #b00000000000000000000000000000000)) (get!11827 (getValueByKey!417 (toList!4469 lt!377925) (select (arr!22331 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun bs!23298 () Bool)

(assert (= bs!23298 d!106857))

(assert (=> bs!23298 m!777093))

(assert (=> bs!23298 m!777437))

(assert (=> bs!23298 m!777437))

(declare-fun m!777931 () Bool)

(assert (=> bs!23298 m!777931))

(assert (=> b!832877 d!106857))

(assert (=> b!832877 d!106723))

(declare-fun d!106859 () Bool)

(declare-fun res!566659 () Bool)

(declare-fun e!464784 () Bool)

(assert (=> d!106859 (=> res!566659 e!464784)))

(assert (=> d!106859 (= res!566659 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22751 _keys!976)))))

(assert (=> d!106859 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312) e!464784)))

(declare-fun b!833257 () Bool)

(declare-fun e!464786 () Bool)

(declare-fun e!464785 () Bool)

(assert (=> b!833257 (= e!464786 e!464785)))

(declare-fun lt!378168 () (_ BitVec 64))

(assert (=> b!833257 (= lt!378168 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!378167 () Unit!28510)

(assert (=> b!833257 (= lt!378167 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!378168 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!833257 (arrayContainsKey!0 _keys!976 lt!378168 #b00000000000000000000000000000000)))

(declare-fun lt!378166 () Unit!28510)

(assert (=> b!833257 (= lt!378166 lt!378167)))

(declare-fun res!566660 () Bool)

(assert (=> b!833257 (= res!566660 (= (seekEntryOrOpen!0 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!976 mask!1312) (Found!8696 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!833257 (=> (not res!566660) (not e!464785))))

(declare-fun b!833258 () Bool)

(declare-fun call!36469 () Bool)

(assert (=> b!833258 (= e!464786 call!36469)))

(declare-fun b!833259 () Bool)

(assert (=> b!833259 (= e!464784 e!464786)))

(declare-fun c!90755 () Bool)

(assert (=> b!833259 (= c!90755 (validKeyInArray!0 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!833260 () Bool)

(assert (=> b!833260 (= e!464785 call!36469)))

(declare-fun bm!36466 () Bool)

(assert (=> bm!36466 (= call!36469 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(assert (= (and d!106859 (not res!566659)) b!833259))

(assert (= (and b!833259 c!90755) b!833257))

(assert (= (and b!833259 (not c!90755)) b!833258))

(assert (= (and b!833257 res!566660) b!833260))

(assert (= (or b!833260 b!833258) bm!36466))

(assert (=> b!833257 m!777463))

(declare-fun m!777933 () Bool)

(assert (=> b!833257 m!777933))

(declare-fun m!777935 () Bool)

(assert (=> b!833257 m!777935))

(assert (=> b!833257 m!777463))

(declare-fun m!777937 () Bool)

(assert (=> b!833257 m!777937))

(assert (=> b!833259 m!777463))

(assert (=> b!833259 m!777463))

(assert (=> b!833259 m!777467))

(declare-fun m!777939 () Bool)

(assert (=> bm!36466 m!777939))

(assert (=> bm!36403 d!106859))

(declare-fun d!106861 () Bool)

(declare-fun e!464787 () Bool)

(assert (=> d!106861 e!464787))

(declare-fun res!566662 () Bool)

(assert (=> d!106861 (=> (not res!566662) (not e!464787))))

(declare-fun lt!378172 () ListLongMap!8907)

(assert (=> d!106861 (= res!566662 (contains!4189 lt!378172 (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!378171 () List!15852)

(assert (=> d!106861 (= lt!378172 (ListLongMap!8908 lt!378171))))

(declare-fun lt!378169 () Unit!28510)

(declare-fun lt!378170 () Unit!28510)

(assert (=> d!106861 (= lt!378169 lt!378170)))

(assert (=> d!106861 (= (getValueByKey!417 lt!378171 (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!422 (_2!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!106861 (= lt!378170 (lemmaContainsTupThenGetReturnValue!231 lt!378171 (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!106861 (= lt!378171 (insertStrictlySorted!270 (toList!4469 call!36434) (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!106861 (= (+!1991 call!36434 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) lt!378172)))

(declare-fun b!833261 () Bool)

(declare-fun res!566661 () Bool)

(assert (=> b!833261 (=> (not res!566661) (not e!464787))))

(assert (=> b!833261 (= res!566661 (= (getValueByKey!417 (toList!4469 lt!378172) (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!422 (_2!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!833262 () Bool)

(assert (=> b!833262 (= e!464787 (contains!4190 (toList!4469 lt!378172) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!106861 res!566662) b!833261))

(assert (= (and b!833261 res!566661) b!833262))

(declare-fun m!777941 () Bool)

(assert (=> d!106861 m!777941))

(declare-fun m!777943 () Bool)

(assert (=> d!106861 m!777943))

(declare-fun m!777945 () Bool)

(assert (=> d!106861 m!777945))

(declare-fun m!777947 () Bool)

(assert (=> d!106861 m!777947))

(declare-fun m!777949 () Bool)

(assert (=> b!833261 m!777949))

(declare-fun m!777951 () Bool)

(assert (=> b!833262 m!777951))

(assert (=> b!832864 d!106861))

(assert (=> b!832787 d!106723))

(declare-fun d!106863 () Bool)

(declare-fun e!464788 () Bool)

(assert (=> d!106863 e!464788))

(declare-fun res!566664 () Bool)

(assert (=> d!106863 (=> (not res!566664) (not e!464788))))

(declare-fun lt!378176 () ListLongMap!8907)

(assert (=> d!106863 (= res!566664 (contains!4189 lt!378176 (_1!5052 (tuple2!10083 lt!377856 lt!377860))))))

(declare-fun lt!378175 () List!15852)

(assert (=> d!106863 (= lt!378176 (ListLongMap!8908 lt!378175))))

(declare-fun lt!378173 () Unit!28510)

(declare-fun lt!378174 () Unit!28510)

(assert (=> d!106863 (= lt!378173 lt!378174)))

(assert (=> d!106863 (= (getValueByKey!417 lt!378175 (_1!5052 (tuple2!10083 lt!377856 lt!377860))) (Some!422 (_2!5052 (tuple2!10083 lt!377856 lt!377860))))))

(assert (=> d!106863 (= lt!378174 (lemmaContainsTupThenGetReturnValue!231 lt!378175 (_1!5052 (tuple2!10083 lt!377856 lt!377860)) (_2!5052 (tuple2!10083 lt!377856 lt!377860))))))

(assert (=> d!106863 (= lt!378175 (insertStrictlySorted!270 (toList!4469 lt!377857) (_1!5052 (tuple2!10083 lt!377856 lt!377860)) (_2!5052 (tuple2!10083 lt!377856 lt!377860))))))

(assert (=> d!106863 (= (+!1991 lt!377857 (tuple2!10083 lt!377856 lt!377860)) lt!378176)))

(declare-fun b!833263 () Bool)

(declare-fun res!566663 () Bool)

(assert (=> b!833263 (=> (not res!566663) (not e!464788))))

(assert (=> b!833263 (= res!566663 (= (getValueByKey!417 (toList!4469 lt!378176) (_1!5052 (tuple2!10083 lt!377856 lt!377860))) (Some!422 (_2!5052 (tuple2!10083 lt!377856 lt!377860)))))))

(declare-fun b!833264 () Bool)

(assert (=> b!833264 (= e!464788 (contains!4190 (toList!4469 lt!378176) (tuple2!10083 lt!377856 lt!377860)))))

(assert (= (and d!106863 res!566664) b!833263))

(assert (= (and b!833263 res!566663) b!833264))

(declare-fun m!777953 () Bool)

(assert (=> d!106863 m!777953))

(declare-fun m!777955 () Bool)

(assert (=> d!106863 m!777955))

(declare-fun m!777957 () Bool)

(assert (=> d!106863 m!777957))

(declare-fun m!777959 () Bool)

(assert (=> d!106863 m!777959))

(declare-fun m!777961 () Bool)

(assert (=> b!833263 m!777961))

(declare-fun m!777963 () Bool)

(assert (=> b!833264 m!777963))

(assert (=> b!832787 d!106863))

(declare-fun d!106865 () Bool)

(declare-fun e!464789 () Bool)

(assert (=> d!106865 e!464789))

(declare-fun res!566666 () Bool)

(assert (=> d!106865 (=> (not res!566666) (not e!464789))))

(declare-fun lt!378180 () ListLongMap!8907)

(assert (=> d!106865 (= res!566666 (contains!4189 lt!378180 (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!378179 () List!15852)

(assert (=> d!106865 (= lt!378180 (ListLongMap!8908 lt!378179))))

(declare-fun lt!378177 () Unit!28510)

(declare-fun lt!378178 () Unit!28510)

(assert (=> d!106865 (= lt!378177 lt!378178)))

(assert (=> d!106865 (= (getValueByKey!417 lt!378179 (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!422 (_2!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!106865 (= lt!378178 (lemmaContainsTupThenGetReturnValue!231 lt!378179 (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!106865 (= lt!378179 (insertStrictlySorted!270 (toList!4469 call!36409) (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!106865 (= (+!1991 call!36409 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!378180)))

(declare-fun b!833265 () Bool)

(declare-fun res!566665 () Bool)

(assert (=> b!833265 (=> (not res!566665) (not e!464789))))

(assert (=> b!833265 (= res!566665 (= (getValueByKey!417 (toList!4469 lt!378180) (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!422 (_2!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!833266 () Bool)

(assert (=> b!833266 (= e!464789 (contains!4190 (toList!4469 lt!378180) (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!106865 res!566666) b!833265))

(assert (= (and b!833265 res!566665) b!833266))

(declare-fun m!777965 () Bool)

(assert (=> d!106865 m!777965))

(declare-fun m!777967 () Bool)

(assert (=> d!106865 m!777967))

(declare-fun m!777969 () Bool)

(assert (=> d!106865 m!777969))

(declare-fun m!777971 () Bool)

(assert (=> d!106865 m!777971))

(declare-fun m!777973 () Bool)

(assert (=> b!833265 m!777973))

(declare-fun m!777975 () Bool)

(assert (=> b!833266 m!777975))

(assert (=> b!832787 d!106865))

(declare-fun d!106867 () Bool)

(assert (=> d!106867 (not (contains!4189 (+!1991 lt!377857 (tuple2!10083 lt!377856 lt!377860)) lt!377858))))

(declare-fun lt!378183 () Unit!28510)

(declare-fun choose!1432 (ListLongMap!8907 (_ BitVec 64) V!25283 (_ BitVec 64)) Unit!28510)

(assert (=> d!106867 (= lt!378183 (choose!1432 lt!377857 lt!377856 lt!377860 lt!377858))))

(declare-fun e!464792 () Bool)

(assert (=> d!106867 e!464792))

(declare-fun res!566669 () Bool)

(assert (=> d!106867 (=> (not res!566669) (not e!464792))))

(assert (=> d!106867 (= res!566669 (not (contains!4189 lt!377857 lt!377858)))))

(assert (=> d!106867 (= (addStillNotContains!200 lt!377857 lt!377856 lt!377860 lt!377858) lt!378183)))

(declare-fun b!833270 () Bool)

(assert (=> b!833270 (= e!464792 (not (= lt!377856 lt!377858)))))

(assert (= (and d!106867 res!566669) b!833270))

(assert (=> d!106867 m!777117))

(assert (=> d!106867 m!777117))

(assert (=> d!106867 m!777119))

(declare-fun m!777977 () Bool)

(assert (=> d!106867 m!777977))

(declare-fun m!777979 () Bool)

(assert (=> d!106867 m!777979))

(assert (=> b!832787 d!106867))

(declare-fun d!106869 () Bool)

(declare-fun e!464794 () Bool)

(assert (=> d!106869 e!464794))

(declare-fun res!566670 () Bool)

(assert (=> d!106869 (=> res!566670 e!464794)))

(declare-fun lt!378184 () Bool)

(assert (=> d!106869 (= res!566670 (not lt!378184))))

(declare-fun lt!378187 () Bool)

(assert (=> d!106869 (= lt!378184 lt!378187)))

(declare-fun lt!378185 () Unit!28510)

(declare-fun e!464793 () Unit!28510)

(assert (=> d!106869 (= lt!378185 e!464793)))

(declare-fun c!90756 () Bool)

(assert (=> d!106869 (= c!90756 lt!378187)))

(assert (=> d!106869 (= lt!378187 (containsKey!402 (toList!4469 (+!1991 lt!377857 (tuple2!10083 lt!377856 lt!377860))) lt!377858))))

(assert (=> d!106869 (= (contains!4189 (+!1991 lt!377857 (tuple2!10083 lt!377856 lt!377860)) lt!377858) lt!378184)))

(declare-fun b!833271 () Bool)

(declare-fun lt!378186 () Unit!28510)

(assert (=> b!833271 (= e!464793 lt!378186)))

(assert (=> b!833271 (= lt!378186 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 (+!1991 lt!377857 (tuple2!10083 lt!377856 lt!377860))) lt!377858))))

(assert (=> b!833271 (isDefined!312 (getValueByKey!417 (toList!4469 (+!1991 lt!377857 (tuple2!10083 lt!377856 lt!377860))) lt!377858))))

(declare-fun b!833272 () Bool)

(declare-fun Unit!28536 () Unit!28510)

(assert (=> b!833272 (= e!464793 Unit!28536)))

(declare-fun b!833273 () Bool)

(assert (=> b!833273 (= e!464794 (isDefined!312 (getValueByKey!417 (toList!4469 (+!1991 lt!377857 (tuple2!10083 lt!377856 lt!377860))) lt!377858)))))

(assert (= (and d!106869 c!90756) b!833271))

(assert (= (and d!106869 (not c!90756)) b!833272))

(assert (= (and d!106869 (not res!566670)) b!833273))

(declare-fun m!777981 () Bool)

(assert (=> d!106869 m!777981))

(declare-fun m!777983 () Bool)

(assert (=> b!833271 m!777983))

(declare-fun m!777985 () Bool)

(assert (=> b!833271 m!777985))

(assert (=> b!833271 m!777985))

(declare-fun m!777987 () Bool)

(assert (=> b!833271 m!777987))

(assert (=> b!833273 m!777985))

(assert (=> b!833273 m!777985))

(assert (=> b!833273 m!777987))

(assert (=> b!832787 d!106869))

(declare-fun d!106871 () Bool)

(assert (=> d!106871 (not (contains!4189 (+!1991 lt!377864 (tuple2!10083 lt!377863 lt!377867)) lt!377865))))

(declare-fun lt!378188 () Unit!28510)

(assert (=> d!106871 (= lt!378188 (choose!1432 lt!377864 lt!377863 lt!377867 lt!377865))))

(declare-fun e!464795 () Bool)

(assert (=> d!106871 e!464795))

(declare-fun res!566671 () Bool)

(assert (=> d!106871 (=> (not res!566671) (not e!464795))))

(assert (=> d!106871 (= res!566671 (not (contains!4189 lt!377864 lt!377865)))))

(assert (=> d!106871 (= (addStillNotContains!200 lt!377864 lt!377863 lt!377867 lt!377865) lt!378188)))

(declare-fun b!833274 () Bool)

(assert (=> b!833274 (= e!464795 (not (= lt!377863 lt!377865)))))

(assert (= (and d!106871 res!566671) b!833274))

(assert (=> d!106871 m!777137))

(assert (=> d!106871 m!777137))

(assert (=> d!106871 m!777139))

(declare-fun m!777989 () Bool)

(assert (=> d!106871 m!777989))

(declare-fun m!777991 () Bool)

(assert (=> d!106871 m!777991))

(assert (=> b!832801 d!106871))

(declare-fun d!106873 () Bool)

(declare-fun e!464796 () Bool)

(assert (=> d!106873 e!464796))

(declare-fun res!566673 () Bool)

(assert (=> d!106873 (=> (not res!566673) (not e!464796))))

(declare-fun lt!378192 () ListLongMap!8907)

(assert (=> d!106873 (= res!566673 (contains!4189 lt!378192 (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!378191 () List!15852)

(assert (=> d!106873 (= lt!378192 (ListLongMap!8908 lt!378191))))

(declare-fun lt!378189 () Unit!28510)

(declare-fun lt!378190 () Unit!28510)

(assert (=> d!106873 (= lt!378189 lt!378190)))

(assert (=> d!106873 (= (getValueByKey!417 lt!378191 (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!422 (_2!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!106873 (= lt!378190 (lemmaContainsTupThenGetReturnValue!231 lt!378191 (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!106873 (= lt!378191 (insertStrictlySorted!270 (toList!4469 call!36410) (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!106873 (= (+!1991 call!36410 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!378192)))

(declare-fun b!833275 () Bool)

(declare-fun res!566672 () Bool)

(assert (=> b!833275 (=> (not res!566672) (not e!464796))))

(assert (=> b!833275 (= res!566672 (= (getValueByKey!417 (toList!4469 lt!378192) (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!422 (_2!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!833276 () Bool)

(assert (=> b!833276 (= e!464796 (contains!4190 (toList!4469 lt!378192) (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!106873 res!566673) b!833275))

(assert (= (and b!833275 res!566672) b!833276))

(declare-fun m!777993 () Bool)

(assert (=> d!106873 m!777993))

(declare-fun m!777995 () Bool)

(assert (=> d!106873 m!777995))

(declare-fun m!777997 () Bool)

(assert (=> d!106873 m!777997))

(declare-fun m!777999 () Bool)

(assert (=> d!106873 m!777999))

(declare-fun m!778001 () Bool)

(assert (=> b!833275 m!778001))

(declare-fun m!778003 () Bool)

(assert (=> b!833276 m!778003))

(assert (=> b!832801 d!106873))

(declare-fun d!106875 () Bool)

(declare-fun e!464798 () Bool)

(assert (=> d!106875 e!464798))

(declare-fun res!566674 () Bool)

(assert (=> d!106875 (=> res!566674 e!464798)))

(declare-fun lt!378193 () Bool)

(assert (=> d!106875 (= res!566674 (not lt!378193))))

(declare-fun lt!378196 () Bool)

(assert (=> d!106875 (= lt!378193 lt!378196)))

(declare-fun lt!378194 () Unit!28510)

(declare-fun e!464797 () Unit!28510)

(assert (=> d!106875 (= lt!378194 e!464797)))

(declare-fun c!90757 () Bool)

(assert (=> d!106875 (= c!90757 lt!378196)))

(assert (=> d!106875 (= lt!378196 (containsKey!402 (toList!4469 (+!1991 lt!377864 (tuple2!10083 lt!377863 lt!377867))) lt!377865))))

(assert (=> d!106875 (= (contains!4189 (+!1991 lt!377864 (tuple2!10083 lt!377863 lt!377867)) lt!377865) lt!378193)))

(declare-fun b!833277 () Bool)

(declare-fun lt!378195 () Unit!28510)

(assert (=> b!833277 (= e!464797 lt!378195)))

(assert (=> b!833277 (= lt!378195 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 (+!1991 lt!377864 (tuple2!10083 lt!377863 lt!377867))) lt!377865))))

(assert (=> b!833277 (isDefined!312 (getValueByKey!417 (toList!4469 (+!1991 lt!377864 (tuple2!10083 lt!377863 lt!377867))) lt!377865))))

(declare-fun b!833278 () Bool)

(declare-fun Unit!28537 () Unit!28510)

(assert (=> b!833278 (= e!464797 Unit!28537)))

(declare-fun b!833279 () Bool)

(assert (=> b!833279 (= e!464798 (isDefined!312 (getValueByKey!417 (toList!4469 (+!1991 lt!377864 (tuple2!10083 lt!377863 lt!377867))) lt!377865)))))

(assert (= (and d!106875 c!90757) b!833277))

(assert (= (and d!106875 (not c!90757)) b!833278))

(assert (= (and d!106875 (not res!566674)) b!833279))

(declare-fun m!778005 () Bool)

(assert (=> d!106875 m!778005))

(declare-fun m!778007 () Bool)

(assert (=> b!833277 m!778007))

(declare-fun m!778009 () Bool)

(assert (=> b!833277 m!778009))

(assert (=> b!833277 m!778009))

(declare-fun m!778011 () Bool)

(assert (=> b!833277 m!778011))

(assert (=> b!833279 m!778009))

(assert (=> b!833279 m!778009))

(assert (=> b!833279 m!778011))

(assert (=> b!832801 d!106875))

(assert (=> b!832801 d!106723))

(declare-fun d!106877 () Bool)

(declare-fun e!464799 () Bool)

(assert (=> d!106877 e!464799))

(declare-fun res!566676 () Bool)

(assert (=> d!106877 (=> (not res!566676) (not e!464799))))

(declare-fun lt!378200 () ListLongMap!8907)

(assert (=> d!106877 (= res!566676 (contains!4189 lt!378200 (_1!5052 (tuple2!10083 lt!377863 lt!377867))))))

(declare-fun lt!378199 () List!15852)

(assert (=> d!106877 (= lt!378200 (ListLongMap!8908 lt!378199))))

(declare-fun lt!378197 () Unit!28510)

(declare-fun lt!378198 () Unit!28510)

(assert (=> d!106877 (= lt!378197 lt!378198)))

(assert (=> d!106877 (= (getValueByKey!417 lt!378199 (_1!5052 (tuple2!10083 lt!377863 lt!377867))) (Some!422 (_2!5052 (tuple2!10083 lt!377863 lt!377867))))))

(assert (=> d!106877 (= lt!378198 (lemmaContainsTupThenGetReturnValue!231 lt!378199 (_1!5052 (tuple2!10083 lt!377863 lt!377867)) (_2!5052 (tuple2!10083 lt!377863 lt!377867))))))

(assert (=> d!106877 (= lt!378199 (insertStrictlySorted!270 (toList!4469 lt!377864) (_1!5052 (tuple2!10083 lt!377863 lt!377867)) (_2!5052 (tuple2!10083 lt!377863 lt!377867))))))

(assert (=> d!106877 (= (+!1991 lt!377864 (tuple2!10083 lt!377863 lt!377867)) lt!378200)))

(declare-fun b!833280 () Bool)

(declare-fun res!566675 () Bool)

(assert (=> b!833280 (=> (not res!566675) (not e!464799))))

(assert (=> b!833280 (= res!566675 (= (getValueByKey!417 (toList!4469 lt!378200) (_1!5052 (tuple2!10083 lt!377863 lt!377867))) (Some!422 (_2!5052 (tuple2!10083 lt!377863 lt!377867)))))))

(declare-fun b!833281 () Bool)

(assert (=> b!833281 (= e!464799 (contains!4190 (toList!4469 lt!378200) (tuple2!10083 lt!377863 lt!377867)))))

(assert (= (and d!106877 res!566676) b!833280))

(assert (= (and b!833280 res!566675) b!833281))

(declare-fun m!778013 () Bool)

(assert (=> d!106877 m!778013))

(declare-fun m!778015 () Bool)

(assert (=> d!106877 m!778015))

(declare-fun m!778017 () Bool)

(assert (=> d!106877 m!778017))

(declare-fun m!778019 () Bool)

(assert (=> d!106877 m!778019))

(declare-fun m!778021 () Bool)

(assert (=> b!833280 m!778021))

(declare-fun m!778023 () Bool)

(assert (=> b!833281 m!778023))

(assert (=> b!832801 d!106877))

(declare-fun d!106879 () Bool)

(declare-fun lt!378201 () Bool)

(assert (=> d!106879 (= lt!378201 (select (content!388 (toList!4469 lt!377871)) lt!377761))))

(declare-fun e!464801 () Bool)

(assert (=> d!106879 (= lt!378201 e!464801)))

(declare-fun res!566678 () Bool)

(assert (=> d!106879 (=> (not res!566678) (not e!464801))))

(assert (=> d!106879 (= res!566678 ((_ is Cons!15848) (toList!4469 lt!377871)))))

(assert (=> d!106879 (= (contains!4190 (toList!4469 lt!377871) lt!377761) lt!378201)))

(declare-fun b!833282 () Bool)

(declare-fun e!464800 () Bool)

(assert (=> b!833282 (= e!464801 e!464800)))

(declare-fun res!566677 () Bool)

(assert (=> b!833282 (=> res!566677 e!464800)))

(assert (=> b!833282 (= res!566677 (= (h!16984 (toList!4469 lt!377871)) lt!377761))))

(declare-fun b!833283 () Bool)

(assert (=> b!833283 (= e!464800 (contains!4190 (t!22212 (toList!4469 lt!377871)) lt!377761))))

(assert (= (and d!106879 res!566678) b!833282))

(assert (= (and b!833282 (not res!566677)) b!833283))

(declare-fun m!778025 () Bool)

(assert (=> d!106879 m!778025))

(declare-fun m!778027 () Bool)

(assert (=> d!106879 m!778027))

(declare-fun m!778029 () Bool)

(assert (=> b!833283 m!778029))

(assert (=> b!832819 d!106879))

(declare-fun d!106881 () Bool)

(declare-fun e!464803 () Bool)

(assert (=> d!106881 e!464803))

(declare-fun res!566679 () Bool)

(assert (=> d!106881 (=> res!566679 e!464803)))

(declare-fun lt!378202 () Bool)

(assert (=> d!106881 (= res!566679 (not lt!378202))))

(declare-fun lt!378205 () Bool)

(assert (=> d!106881 (= lt!378202 lt!378205)))

(declare-fun lt!378203 () Unit!28510)

(declare-fun e!464802 () Unit!28510)

(assert (=> d!106881 (= lt!378203 e!464802)))

(declare-fun c!90758 () Bool)

(assert (=> d!106881 (= c!90758 lt!378205)))

(assert (=> d!106881 (= lt!378205 (containsKey!402 (toList!4469 lt!377815) (_1!5052 lt!377756)))))

(assert (=> d!106881 (= (contains!4189 lt!377815 (_1!5052 lt!377756)) lt!378202)))

(declare-fun b!833284 () Bool)

(declare-fun lt!378204 () Unit!28510)

(assert (=> b!833284 (= e!464802 lt!378204)))

(assert (=> b!833284 (= lt!378204 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377815) (_1!5052 lt!377756)))))

(assert (=> b!833284 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377815) (_1!5052 lt!377756)))))

(declare-fun b!833285 () Bool)

(declare-fun Unit!28538 () Unit!28510)

(assert (=> b!833285 (= e!464802 Unit!28538)))

(declare-fun b!833286 () Bool)

(assert (=> b!833286 (= e!464803 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377815) (_1!5052 lt!377756))))))

(assert (= (and d!106881 c!90758) b!833284))

(assert (= (and d!106881 (not c!90758)) b!833285))

(assert (= (and d!106881 (not res!566679)) b!833286))

(declare-fun m!778031 () Bool)

(assert (=> d!106881 m!778031))

(declare-fun m!778033 () Bool)

(assert (=> b!833284 m!778033))

(assert (=> b!833284 m!777053))

(assert (=> b!833284 m!777053))

(declare-fun m!778035 () Bool)

(assert (=> b!833284 m!778035))

(assert (=> b!833286 m!777053))

(assert (=> b!833286 m!777053))

(assert (=> b!833286 m!778035))

(assert (=> d!106617 d!106881))

(declare-fun d!106883 () Bool)

(declare-fun c!90759 () Bool)

(assert (=> d!106883 (= c!90759 (and ((_ is Cons!15848) lt!377814) (= (_1!5052 (h!16984 lt!377814)) (_1!5052 lt!377756))))))

(declare-fun e!464804 () Option!423)

(assert (=> d!106883 (= (getValueByKey!417 lt!377814 (_1!5052 lt!377756)) e!464804)))

(declare-fun b!833289 () Bool)

(declare-fun e!464805 () Option!423)

(assert (=> b!833289 (= e!464805 (getValueByKey!417 (t!22212 lt!377814) (_1!5052 lt!377756)))))

(declare-fun b!833290 () Bool)

(assert (=> b!833290 (= e!464805 None!421)))

(declare-fun b!833288 () Bool)

(assert (=> b!833288 (= e!464804 e!464805)))

(declare-fun c!90760 () Bool)

(assert (=> b!833288 (= c!90760 (and ((_ is Cons!15848) lt!377814) (not (= (_1!5052 (h!16984 lt!377814)) (_1!5052 lt!377756)))))))

(declare-fun b!833287 () Bool)

(assert (=> b!833287 (= e!464804 (Some!422 (_2!5052 (h!16984 lt!377814))))))

(assert (= (and d!106883 c!90759) b!833287))

(assert (= (and d!106883 (not c!90759)) b!833288))

(assert (= (and b!833288 c!90760) b!833289))

(assert (= (and b!833288 (not c!90760)) b!833290))

(declare-fun m!778037 () Bool)

(assert (=> b!833289 m!778037))

(assert (=> d!106617 d!106883))

(declare-fun d!106885 () Bool)

(assert (=> d!106885 (= (getValueByKey!417 lt!377814 (_1!5052 lt!377756)) (Some!422 (_2!5052 lt!377756)))))

(declare-fun lt!378206 () Unit!28510)

(assert (=> d!106885 (= lt!378206 (choose!1429 lt!377814 (_1!5052 lt!377756) (_2!5052 lt!377756)))))

(declare-fun e!464806 () Bool)

(assert (=> d!106885 e!464806))

(declare-fun res!566680 () Bool)

(assert (=> d!106885 (=> (not res!566680) (not e!464806))))

(assert (=> d!106885 (= res!566680 (isStrictlySorted!430 lt!377814))))

(assert (=> d!106885 (= (lemmaContainsTupThenGetReturnValue!231 lt!377814 (_1!5052 lt!377756) (_2!5052 lt!377756)) lt!378206)))

(declare-fun b!833291 () Bool)

(declare-fun res!566681 () Bool)

(assert (=> b!833291 (=> (not res!566681) (not e!464806))))

(assert (=> b!833291 (= res!566681 (containsKey!402 lt!377814 (_1!5052 lt!377756)))))

(declare-fun b!833292 () Bool)

(assert (=> b!833292 (= e!464806 (contains!4190 lt!377814 (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))))))

(assert (= (and d!106885 res!566680) b!833291))

(assert (= (and b!833291 res!566681) b!833292))

(assert (=> d!106885 m!777047))

(declare-fun m!778039 () Bool)

(assert (=> d!106885 m!778039))

(declare-fun m!778041 () Bool)

(assert (=> d!106885 m!778041))

(declare-fun m!778043 () Bool)

(assert (=> b!833291 m!778043))

(declare-fun m!778045 () Bool)

(assert (=> b!833292 m!778045))

(assert (=> d!106617 d!106885))

(declare-fun bm!36467 () Bool)

(declare-fun c!90761 () Bool)

(declare-fun e!464808 () List!15852)

(declare-fun call!36471 () List!15852)

(assert (=> bm!36467 (= call!36471 ($colon$colon!534 e!464808 (ite c!90761 (h!16984 (toList!4469 (+!1991 lt!377759 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756)))))))

(declare-fun c!90764 () Bool)

(assert (=> bm!36467 (= c!90764 c!90761)))

(declare-fun bm!36468 () Bool)

(declare-fun call!36472 () List!15852)

(assert (=> bm!36468 (= call!36472 call!36471)))

(declare-fun bm!36469 () Bool)

(declare-fun call!36470 () List!15852)

(assert (=> bm!36469 (= call!36470 call!36472)))

(declare-fun c!90762 () Bool)

(declare-fun b!833293 () Bool)

(assert (=> b!833293 (= c!90762 (and ((_ is Cons!15848) (toList!4469 (+!1991 lt!377759 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (bvsgt (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377759 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (_1!5052 lt!377756))))))

(declare-fun e!464807 () List!15852)

(declare-fun e!464810 () List!15852)

(assert (=> b!833293 (= e!464807 e!464810)))

(declare-fun b!833294 () Bool)

(assert (=> b!833294 (= e!464810 call!36470)))

(declare-fun b!833295 () Bool)

(assert (=> b!833295 (= e!464808 (insertStrictlySorted!270 (t!22212 (toList!4469 (+!1991 lt!377759 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (_1!5052 lt!377756) (_2!5052 lt!377756)))))

(declare-fun b!833296 () Bool)

(declare-fun e!464809 () List!15852)

(assert (=> b!833296 (= e!464809 call!36471)))

(declare-fun b!833297 () Bool)

(declare-fun e!464811 () Bool)

(declare-fun lt!378207 () List!15852)

(assert (=> b!833297 (= e!464811 (contains!4190 lt!378207 (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))))))

(declare-fun c!90763 () Bool)

(declare-fun b!833298 () Bool)

(assert (=> b!833298 (= e!464808 (ite c!90763 (t!22212 (toList!4469 (+!1991 lt!377759 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (ite c!90762 (Cons!15848 (h!16984 (toList!4469 (+!1991 lt!377759 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (t!22212 (toList!4469 (+!1991 lt!377759 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) Nil!15849)))))

(declare-fun b!833299 () Bool)

(assert (=> b!833299 (= e!464809 e!464807)))

(assert (=> b!833299 (= c!90763 (and ((_ is Cons!15848) (toList!4469 (+!1991 lt!377759 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (= (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377759 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (_1!5052 lt!377756))))))

(declare-fun b!833300 () Bool)

(assert (=> b!833300 (= e!464807 call!36472)))

(declare-fun b!833301 () Bool)

(declare-fun res!566683 () Bool)

(assert (=> b!833301 (=> (not res!566683) (not e!464811))))

(assert (=> b!833301 (= res!566683 (containsKey!402 lt!378207 (_1!5052 lt!377756)))))

(declare-fun d!106887 () Bool)

(assert (=> d!106887 e!464811))

(declare-fun res!566682 () Bool)

(assert (=> d!106887 (=> (not res!566682) (not e!464811))))

(assert (=> d!106887 (= res!566682 (isStrictlySorted!430 lt!378207))))

(assert (=> d!106887 (= lt!378207 e!464809)))

(assert (=> d!106887 (= c!90761 (and ((_ is Cons!15848) (toList!4469 (+!1991 lt!377759 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (bvslt (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377759 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (_1!5052 lt!377756))))))

(assert (=> d!106887 (isStrictlySorted!430 (toList!4469 (+!1991 lt!377759 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!106887 (= (insertStrictlySorted!270 (toList!4469 (+!1991 lt!377759 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (_1!5052 lt!377756) (_2!5052 lt!377756)) lt!378207)))

(declare-fun b!833302 () Bool)

(assert (=> b!833302 (= e!464810 call!36470)))

(assert (= (and d!106887 c!90761) b!833296))

(assert (= (and d!106887 (not c!90761)) b!833299))

(assert (= (and b!833299 c!90763) b!833300))

(assert (= (and b!833299 (not c!90763)) b!833293))

(assert (= (and b!833293 c!90762) b!833294))

(assert (= (and b!833293 (not c!90762)) b!833302))

(assert (= (or b!833294 b!833302) bm!36469))

(assert (= (or b!833300 bm!36469) bm!36468))

(assert (= (or b!833296 bm!36468) bm!36467))

(assert (= (and bm!36467 c!90764) b!833295))

(assert (= (and bm!36467 (not c!90764)) b!833298))

(assert (= (and d!106887 res!566682) b!833301))

(assert (= (and b!833301 res!566683) b!833297))

(declare-fun m!778047 () Bool)

(assert (=> bm!36467 m!778047))

(declare-fun m!778049 () Bool)

(assert (=> b!833297 m!778049))

(declare-fun m!778051 () Bool)

(assert (=> b!833295 m!778051))

(declare-fun m!778053 () Bool)

(assert (=> b!833301 m!778053))

(declare-fun m!778055 () Bool)

(assert (=> d!106887 m!778055))

(declare-fun m!778057 () Bool)

(assert (=> d!106887 m!778057))

(assert (=> d!106617 d!106887))

(declare-fun d!106889 () Bool)

(declare-fun e!464813 () Bool)

(assert (=> d!106889 e!464813))

(declare-fun res!566684 () Bool)

(assert (=> d!106889 (=> res!566684 e!464813)))

(declare-fun lt!378208 () Bool)

(assert (=> d!106889 (= res!566684 (not lt!378208))))

(declare-fun lt!378211 () Bool)

(assert (=> d!106889 (= lt!378208 lt!378211)))

(declare-fun lt!378209 () Unit!28510)

(declare-fun e!464812 () Unit!28510)

(assert (=> d!106889 (= lt!378209 e!464812)))

(declare-fun c!90765 () Bool)

(assert (=> d!106889 (= c!90765 lt!378211)))

(assert (=> d!106889 (= lt!378211 (containsKey!402 (toList!4469 lt!377967) (_1!5052 lt!377756)))))

(assert (=> d!106889 (= (contains!4189 lt!377967 (_1!5052 lt!377756)) lt!378208)))

(declare-fun b!833303 () Bool)

(declare-fun lt!378210 () Unit!28510)

(assert (=> b!833303 (= e!464812 lt!378210)))

(assert (=> b!833303 (= lt!378210 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377967) (_1!5052 lt!377756)))))

(assert (=> b!833303 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377967) (_1!5052 lt!377756)))))

(declare-fun b!833304 () Bool)

(declare-fun Unit!28539 () Unit!28510)

(assert (=> b!833304 (= e!464812 Unit!28539)))

(declare-fun b!833305 () Bool)

(assert (=> b!833305 (= e!464813 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377967) (_1!5052 lt!377756))))))

(assert (= (and d!106889 c!90765) b!833303))

(assert (= (and d!106889 (not c!90765)) b!833304))

(assert (= (and d!106889 (not res!566684)) b!833305))

(declare-fun m!778059 () Bool)

(assert (=> d!106889 m!778059))

(declare-fun m!778061 () Bool)

(assert (=> b!833303 m!778061))

(assert (=> b!833303 m!777281))

(assert (=> b!833303 m!777281))

(declare-fun m!778063 () Bool)

(assert (=> b!833303 m!778063))

(assert (=> b!833305 m!777281))

(assert (=> b!833305 m!777281))

(assert (=> b!833305 m!778063))

(assert (=> d!106649 d!106889))

(declare-fun d!106891 () Bool)

(declare-fun c!90766 () Bool)

(assert (=> d!106891 (= c!90766 (and ((_ is Cons!15848) lt!377966) (= (_1!5052 (h!16984 lt!377966)) (_1!5052 lt!377756))))))

(declare-fun e!464814 () Option!423)

(assert (=> d!106891 (= (getValueByKey!417 lt!377966 (_1!5052 lt!377756)) e!464814)))

(declare-fun b!833308 () Bool)

(declare-fun e!464815 () Option!423)

(assert (=> b!833308 (= e!464815 (getValueByKey!417 (t!22212 lt!377966) (_1!5052 lt!377756)))))

(declare-fun b!833309 () Bool)

(assert (=> b!833309 (= e!464815 None!421)))

(declare-fun b!833307 () Bool)

(assert (=> b!833307 (= e!464814 e!464815)))

(declare-fun c!90767 () Bool)

(assert (=> b!833307 (= c!90767 (and ((_ is Cons!15848) lt!377966) (not (= (_1!5052 (h!16984 lt!377966)) (_1!5052 lt!377756)))))))

(declare-fun b!833306 () Bool)

(assert (=> b!833306 (= e!464814 (Some!422 (_2!5052 (h!16984 lt!377966))))))

(assert (= (and d!106891 c!90766) b!833306))

(assert (= (and d!106891 (not c!90766)) b!833307))

(assert (= (and b!833307 c!90767) b!833308))

(assert (= (and b!833307 (not c!90767)) b!833309))

(declare-fun m!778065 () Bool)

(assert (=> b!833308 m!778065))

(assert (=> d!106649 d!106891))

(declare-fun d!106893 () Bool)

(assert (=> d!106893 (= (getValueByKey!417 lt!377966 (_1!5052 lt!377756)) (Some!422 (_2!5052 lt!377756)))))

(declare-fun lt!378212 () Unit!28510)

(assert (=> d!106893 (= lt!378212 (choose!1429 lt!377966 (_1!5052 lt!377756) (_2!5052 lt!377756)))))

(declare-fun e!464816 () Bool)

(assert (=> d!106893 e!464816))

(declare-fun res!566685 () Bool)

(assert (=> d!106893 (=> (not res!566685) (not e!464816))))

(assert (=> d!106893 (= res!566685 (isStrictlySorted!430 lt!377966))))

(assert (=> d!106893 (= (lemmaContainsTupThenGetReturnValue!231 lt!377966 (_1!5052 lt!377756) (_2!5052 lt!377756)) lt!378212)))

(declare-fun b!833310 () Bool)

(declare-fun res!566686 () Bool)

(assert (=> b!833310 (=> (not res!566686) (not e!464816))))

(assert (=> b!833310 (= res!566686 (containsKey!402 lt!377966 (_1!5052 lt!377756)))))

(declare-fun b!833311 () Bool)

(assert (=> b!833311 (= e!464816 (contains!4190 lt!377966 (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))))))

(assert (= (and d!106893 res!566685) b!833310))

(assert (= (and b!833310 res!566686) b!833311))

(assert (=> d!106893 m!777275))

(declare-fun m!778067 () Bool)

(assert (=> d!106893 m!778067))

(declare-fun m!778069 () Bool)

(assert (=> d!106893 m!778069))

(declare-fun m!778071 () Bool)

(assert (=> b!833310 m!778071))

(declare-fun m!778073 () Bool)

(assert (=> b!833311 m!778073))

(assert (=> d!106649 d!106893))

(declare-fun call!36474 () List!15852)

(declare-fun bm!36470 () Bool)

(declare-fun e!464818 () List!15852)

(declare-fun c!90768 () Bool)

(assert (=> bm!36470 (= call!36474 ($colon$colon!534 e!464818 (ite c!90768 (h!16984 (toList!4469 (+!1991 lt!377760 lt!377761))) (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756)))))))

(declare-fun c!90771 () Bool)

(assert (=> bm!36470 (= c!90771 c!90768)))

(declare-fun bm!36471 () Bool)

(declare-fun call!36475 () List!15852)

(assert (=> bm!36471 (= call!36475 call!36474)))

(declare-fun bm!36472 () Bool)

(declare-fun call!36473 () List!15852)

(assert (=> bm!36472 (= call!36473 call!36475)))

(declare-fun c!90769 () Bool)

(declare-fun b!833312 () Bool)

(assert (=> b!833312 (= c!90769 (and ((_ is Cons!15848) (toList!4469 (+!1991 lt!377760 lt!377761))) (bvsgt (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377760 lt!377761)))) (_1!5052 lt!377756))))))

(declare-fun e!464817 () List!15852)

(declare-fun e!464820 () List!15852)

(assert (=> b!833312 (= e!464817 e!464820)))

(declare-fun b!833313 () Bool)

(assert (=> b!833313 (= e!464820 call!36473)))

(declare-fun b!833314 () Bool)

(assert (=> b!833314 (= e!464818 (insertStrictlySorted!270 (t!22212 (toList!4469 (+!1991 lt!377760 lt!377761))) (_1!5052 lt!377756) (_2!5052 lt!377756)))))

(declare-fun b!833315 () Bool)

(declare-fun e!464819 () List!15852)

(assert (=> b!833315 (= e!464819 call!36474)))

(declare-fun b!833316 () Bool)

(declare-fun e!464821 () Bool)

(declare-fun lt!378213 () List!15852)

(assert (=> b!833316 (= e!464821 (contains!4190 lt!378213 (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))))))

(declare-fun b!833317 () Bool)

(declare-fun c!90770 () Bool)

(assert (=> b!833317 (= e!464818 (ite c!90770 (t!22212 (toList!4469 (+!1991 lt!377760 lt!377761))) (ite c!90769 (Cons!15848 (h!16984 (toList!4469 (+!1991 lt!377760 lt!377761))) (t!22212 (toList!4469 (+!1991 lt!377760 lt!377761)))) Nil!15849)))))

(declare-fun b!833318 () Bool)

(assert (=> b!833318 (= e!464819 e!464817)))

(assert (=> b!833318 (= c!90770 (and ((_ is Cons!15848) (toList!4469 (+!1991 lt!377760 lt!377761))) (= (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377760 lt!377761)))) (_1!5052 lt!377756))))))

(declare-fun b!833319 () Bool)

(assert (=> b!833319 (= e!464817 call!36475)))

(declare-fun b!833320 () Bool)

(declare-fun res!566688 () Bool)

(assert (=> b!833320 (=> (not res!566688) (not e!464821))))

(assert (=> b!833320 (= res!566688 (containsKey!402 lt!378213 (_1!5052 lt!377756)))))

(declare-fun d!106895 () Bool)

(assert (=> d!106895 e!464821))

(declare-fun res!566687 () Bool)

(assert (=> d!106895 (=> (not res!566687) (not e!464821))))

(assert (=> d!106895 (= res!566687 (isStrictlySorted!430 lt!378213))))

(assert (=> d!106895 (= lt!378213 e!464819)))

(assert (=> d!106895 (= c!90768 (and ((_ is Cons!15848) (toList!4469 (+!1991 lt!377760 lt!377761))) (bvslt (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377760 lt!377761)))) (_1!5052 lt!377756))))))

(assert (=> d!106895 (isStrictlySorted!430 (toList!4469 (+!1991 lt!377760 lt!377761)))))

(assert (=> d!106895 (= (insertStrictlySorted!270 (toList!4469 (+!1991 lt!377760 lt!377761)) (_1!5052 lt!377756) (_2!5052 lt!377756)) lt!378213)))

(declare-fun b!833321 () Bool)

(assert (=> b!833321 (= e!464820 call!36473)))

(assert (= (and d!106895 c!90768) b!833315))

(assert (= (and d!106895 (not c!90768)) b!833318))

(assert (= (and b!833318 c!90770) b!833319))

(assert (= (and b!833318 (not c!90770)) b!833312))

(assert (= (and b!833312 c!90769) b!833313))

(assert (= (and b!833312 (not c!90769)) b!833321))

(assert (= (or b!833313 b!833321) bm!36472))

(assert (= (or b!833319 bm!36472) bm!36471))

(assert (= (or b!833315 bm!36471) bm!36470))

(assert (= (and bm!36470 c!90771) b!833314))

(assert (= (and bm!36470 (not c!90771)) b!833317))

(assert (= (and d!106895 res!566687) b!833320))

(assert (= (and b!833320 res!566688) b!833316))

(declare-fun m!778075 () Bool)

(assert (=> bm!36470 m!778075))

(declare-fun m!778077 () Bool)

(assert (=> b!833316 m!778077))

(declare-fun m!778079 () Bool)

(assert (=> b!833314 m!778079))

(declare-fun m!778081 () Bool)

(assert (=> b!833320 m!778081))

(declare-fun m!778083 () Bool)

(assert (=> d!106895 m!778083))

(declare-fun m!778085 () Bool)

(assert (=> d!106895 m!778085))

(assert (=> d!106649 d!106895))

(declare-fun d!106897 () Bool)

(declare-fun e!464822 () Bool)

(assert (=> d!106897 e!464822))

(declare-fun res!566690 () Bool)

(assert (=> d!106897 (=> (not res!566690) (not e!464822))))

(declare-fun lt!378217 () ListLongMap!8907)

(assert (=> d!106897 (= res!566690 (contains!4189 lt!378217 (_1!5052 (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun lt!378216 () List!15852)

(assert (=> d!106897 (= lt!378217 (ListLongMap!8908 lt!378216))))

(declare-fun lt!378214 () Unit!28510)

(declare-fun lt!378215 () Unit!28510)

(assert (=> d!106897 (= lt!378214 lt!378215)))

(assert (=> d!106897 (= (getValueByKey!417 lt!378216 (_1!5052 (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) (Some!422 (_2!5052 (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!106897 (= lt!378215 (lemmaContainsTupThenGetReturnValue!231 lt!378216 (_1!5052 (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5052 (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!106897 (= lt!378216 (insertStrictlySorted!270 (toList!4469 (ite c!90642 call!36437 (ite c!90645 call!36435 call!36440))) (_1!5052 (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5052 (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!106897 (= (+!1991 (ite c!90642 call!36437 (ite c!90645 call!36435 call!36440)) (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!378217)))

(declare-fun b!833322 () Bool)

(declare-fun res!566689 () Bool)

(assert (=> b!833322 (=> (not res!566689) (not e!464822))))

(assert (=> b!833322 (= res!566689 (= (getValueByKey!417 (toList!4469 lt!378217) (_1!5052 (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) (Some!422 (_2!5052 (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!833323 () Bool)

(assert (=> b!833323 (= e!464822 (contains!4190 (toList!4469 lt!378217) (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (= (and d!106897 res!566690) b!833322))

(assert (= (and b!833322 res!566689) b!833323))

(declare-fun m!778087 () Bool)

(assert (=> d!106897 m!778087))

(declare-fun m!778089 () Bool)

(assert (=> d!106897 m!778089))

(declare-fun m!778091 () Bool)

(assert (=> d!106897 m!778091))

(declare-fun m!778093 () Bool)

(assert (=> d!106897 m!778093))

(declare-fun m!778095 () Bool)

(assert (=> b!833322 m!778095))

(declare-fun m!778097 () Bool)

(assert (=> b!833323 m!778097))

(assert (=> bm!36435 d!106897))

(declare-fun mapNonEmpty!24484 () Bool)

(declare-fun mapRes!24484 () Bool)

(declare-fun tp!47311 () Bool)

(declare-fun e!464824 () Bool)

(assert (=> mapNonEmpty!24484 (= mapRes!24484 (and tp!47311 e!464824))))

(declare-fun mapRest!24484 () (Array (_ BitVec 32) ValueCell!7190))

(declare-fun mapKey!24484 () (_ BitVec 32))

(declare-fun mapValue!24484 () ValueCell!7190)

(assert (=> mapNonEmpty!24484 (= mapRest!24483 (store mapRest!24484 mapKey!24484 mapValue!24484))))

(declare-fun mapIsEmpty!24484 () Bool)

(assert (=> mapIsEmpty!24484 mapRes!24484))

(declare-fun b!833324 () Bool)

(assert (=> b!833324 (= e!464824 tp_is_empty!15211)))

(declare-fun b!833325 () Bool)

(declare-fun e!464823 () Bool)

(assert (=> b!833325 (= e!464823 tp_is_empty!15211)))

(declare-fun condMapEmpty!24484 () Bool)

(declare-fun mapDefault!24484 () ValueCell!7190)

(assert (=> mapNonEmpty!24483 (= condMapEmpty!24484 (= mapRest!24483 ((as const (Array (_ BitVec 32) ValueCell!7190)) mapDefault!24484)))))

(assert (=> mapNonEmpty!24483 (= tp!47310 (and e!464823 mapRes!24484))))

(assert (= (and mapNonEmpty!24483 condMapEmpty!24484) mapIsEmpty!24484))

(assert (= (and mapNonEmpty!24483 (not condMapEmpty!24484)) mapNonEmpty!24484))

(assert (= (and mapNonEmpty!24484 ((_ is ValueCellFull!7190) mapValue!24484)) b!833324))

(assert (= (and mapNonEmpty!24483 ((_ is ValueCellFull!7190) mapDefault!24484)) b!833325))

(declare-fun m!778099 () Bool)

(assert (=> mapNonEmpty!24484 m!778099))

(declare-fun b_lambda!11449 () Bool)

(assert (= b_lambda!11445 (or (and start!71746 b_free!13501) b_lambda!11449)))

(declare-fun b_lambda!11451 () Bool)

(assert (= b_lambda!11441 (or (and start!71746 b_free!13501) b_lambda!11451)))

(declare-fun b_lambda!11453 () Bool)

(assert (= b_lambda!11447 (or (and start!71746 b_free!13501) b_lambda!11453)))

(declare-fun b_lambda!11455 () Bool)

(assert (= b_lambda!11443 (or (and start!71746 b_free!13501) b_lambda!11455)))

(check-sat (not bm!36453) (not d!106685) (not b!833162) (not b!833025) (not d!106677) (not b_lambda!11433) (not b!833089) (not b!833063) (not bm!36450) (not b!833053) (not d!106679) (not b!833280) (not b!833311) (not b!833103) (not b!833050) (not d!106693) (not d!106765) (not b!833295) (not bm!36449) (not b!833051) (not b!833231) (not b!833177) (not b!832980) (not d!106829) (not d!106797) (not d!106767) (not d!106725) (not b!833143) (not b!833045) (not b!833031) (not b_lambda!11453) (not b!833040) (not d!106895) (not b!833092) (not d!106839) (not b!833175) (not d!106843) (not b!833057) (not d!106881) (not d!106735) tp_is_empty!15211 (not b!833241) (not b!833098) (not d!106749) (not d!106741) (not b!833102) (not b!833266) (not b!833012) (not bm!36460) (not b!833100) (not d!106803) (not b!833235) (not d!106727) (not d!106867) (not bm!36454) (not d!106885) (not b!833255) (not b!833004) (not d!106705) (not b!832985) (not b!833074) (not bm!36448) (not b!833281) (not d!106781) (not d!106807) (not d!106831) (not b!833183) (not d!106667) (not b!832944) b_and!22593 (not d!106753) (not d!106801) (not b!833009) (not b!833080) (not b!832982) (not b!833071) (not b!833164) (not b!832926) (not b!833056) (not b!833244) (not b!833289) (not b!833029) (not b!833159) (not b!833310) (not d!106687) (not mapNonEmpty!24484) (not b!833265) (not b!833271) (not d!106893) (not b_lambda!11429) (not b!833011) (not b!833276) (not b!833034) (not b_lambda!11437) (not d!106659) (not d!106657) (not b!833058) (not d!106747) (not b!833181) (not b!832943) (not b!833001) (not b!833322) (not d!106757) (not b!833263) (not d!106821) (not b!833205) (not b_lambda!11439) (not b!833204) (not b!832983) (not d!106819) (not b!833273) (not b!833283) (not b!833139) (not b!833301) (not d!106845) (not b!833116) (not d!106739) (not b!833087) (not b!833171) (not b!833096) (not b!833209) (not d!106673) (not d!106707) (not d!106889) (not b!833038) (not d!106869) (not b!833157) (not d!106775) (not b_next!13501) (not b!833127) (not b!833065) (not b!833172) (not b!833320) (not d!106663) (not d!106799) (not d!106691) (not b!833132) (not d!106699) (not b!833259) (not b!832924) (not d!106887) (not d!106795) (not b!833286) (not b!833166) (not b!833215) (not b!833292) (not b!833019) (not d!106669) (not d!106729) (not d!106653) (not d!106703) (not d!106777) (not bm!36467) (not d!106855) (not b!833238) (not b!833093) (not b!833207) (not d!106791) (not b!833108) (not b!833130) (not d!106737) (not d!106761) (not b!833083) (not b!833120) (not d!106833) (not b!833049) (not bm!36466) (not b!833015) (not b_lambda!11431) (not d!106875) (not d!106661) (not d!106719) (not b_lambda!11449) (not b!833026) (not d!106683) (not b!833082) (not b!833291) (not b!833196) (not b!833137) (not b_lambda!11435) (not bm!36457) (not d!106745) (not b!833068) (not d!106877) (not b!833156) (not b!832995) (not b!832969) (not d!106785) (not b!833188) (not bm!36463) (not d!106871) (not b!833316) (not b!833277) (not d!106715) (not d!106879) (not b!833149) (not b!833169) (not d!106711) (not b!833035) (not b!833194) (not b!833070) (not b!832989) (not b!833105) (not b!833257) (not d!106665) (not b!833085) (not b!832967) (not b!833046) (not d!106873) (not d!106815) (not d!106751) (not b!833008) (not d!106825) (not b!833055) (not b!833037) (not b!832988) (not b!833206) (not b!833297) (not b_lambda!11451) (not b!832996) (not b!833076) (not b!833145) (not b!832999) (not d!106783) (not d!106847) (not b!833017) (not b!833062) (not b!833305) (not b!832987) (not b!833124) (not b!833185) (not d!106823) (not d!106865) (not b!833284) (not b!833014) (not b!833202) (not b!833134) (not d!106857) (not d!106689) (not b!833264) (not d!106771) (not b!832937) (not b!832973) (not b!833247) (not d!106787) (not d!106743) (not b!833279) (not b_lambda!11455) (not b!833006) (not d!106811) (not b!833191) (not b!833095) (not b!833125) (not bm!36470) (not b!833097) (not b!833323) (not b!833052) (not d!106733) (not b!833261) (not b!833122) (not b!833303) (not b!833251) (not d!106763) (not b!833275) (not b!833111) (not d!106813) (not b!833262) (not d!106755) (not bm!36445) (not d!106773) (not d!106769) (not d!106897) (not b!833110) (not d!106827) (not d!106681) (not b!833022) (not b!833047) (not b!833314) (not b!833190) (not d!106861) (not d!106717) (not d!106863) (not d!106695) (not d!106721) (not b!832981) (not b!833200) (not d!106675) (not b!833027) (not d!106837) (not b!833024) (not b!833114) (not b!833242) (not b!833084) (not b!833308) (not d!106731) (not d!106671) (not b!833140) (not b!832986))
(check-sat b_and!22593 (not b_next!13501))
(get-model)

(declare-fun d!106899 () Bool)

(declare-fun res!566695 () Bool)

(declare-fun e!464829 () Bool)

(assert (=> d!106899 (=> res!566695 e!464829)))

(assert (=> d!106899 (= res!566695 (and ((_ is Cons!15848) (toList!4469 lt!377861)) (= (_1!5052 (h!16984 (toList!4469 lt!377861))) (select (arr!22331 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!106899 (= (containsKey!402 (toList!4469 lt!377861) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)) e!464829)))

(declare-fun b!833330 () Bool)

(declare-fun e!464830 () Bool)

(assert (=> b!833330 (= e!464829 e!464830)))

(declare-fun res!566696 () Bool)

(assert (=> b!833330 (=> (not res!566696) (not e!464830))))

(assert (=> b!833330 (= res!566696 (and (or (not ((_ is Cons!15848) (toList!4469 lt!377861))) (bvsle (_1!5052 (h!16984 (toList!4469 lt!377861))) (select (arr!22331 _keys!976) #b00000000000000000000000000000000))) ((_ is Cons!15848) (toList!4469 lt!377861)) (bvslt (_1!5052 (h!16984 (toList!4469 lt!377861))) (select (arr!22331 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun b!833331 () Bool)

(assert (=> b!833331 (= e!464830 (containsKey!402 (t!22212 (toList!4469 lt!377861)) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!106899 (not res!566695)) b!833330))

(assert (= (and b!833330 res!566696) b!833331))

(assert (=> b!833331 m!777093))

(declare-fun m!778101 () Bool)

(assert (=> b!833331 m!778101))

(assert (=> d!106711 d!106899))

(declare-fun d!106901 () Bool)

(declare-fun lt!378218 () Bool)

(assert (=> d!106901 (= lt!378218 (select (content!388 lt!378135) (tuple2!10083 (_1!5052 lt!377761) (_2!5052 lt!377761))))))

(declare-fun e!464832 () Bool)

(assert (=> d!106901 (= lt!378218 e!464832)))

(declare-fun res!566698 () Bool)

(assert (=> d!106901 (=> (not res!566698) (not e!464832))))

(assert (=> d!106901 (= res!566698 ((_ is Cons!15848) lt!378135))))

(assert (=> d!106901 (= (contains!4190 lt!378135 (tuple2!10083 (_1!5052 lt!377761) (_2!5052 lt!377761))) lt!378218)))

(declare-fun b!833332 () Bool)

(declare-fun e!464831 () Bool)

(assert (=> b!833332 (= e!464832 e!464831)))

(declare-fun res!566697 () Bool)

(assert (=> b!833332 (=> res!566697 e!464831)))

(assert (=> b!833332 (= res!566697 (= (h!16984 lt!378135) (tuple2!10083 (_1!5052 lt!377761) (_2!5052 lt!377761))))))

(declare-fun b!833333 () Bool)

(assert (=> b!833333 (= e!464831 (contains!4190 (t!22212 lt!378135) (tuple2!10083 (_1!5052 lt!377761) (_2!5052 lt!377761))))))

(assert (= (and d!106901 res!566698) b!833332))

(assert (= (and b!833332 (not res!566697)) b!833333))

(declare-fun m!778103 () Bool)

(assert (=> d!106901 m!778103))

(declare-fun m!778105 () Bool)

(assert (=> d!106901 m!778105))

(declare-fun m!778107 () Bool)

(assert (=> b!833333 m!778107))

(assert (=> b!833196 d!106901))

(assert (=> d!106679 d!106683))

(declare-fun d!106903 () Bool)

(assert (=> d!106903 (= (apply!373 (+!1991 lt!377945 (tuple2!10083 lt!377951 zeroValueAfter!34)) lt!377953) (apply!373 lt!377945 lt!377953))))

(assert (=> d!106903 true))

(declare-fun _$34!1150 () Unit!28510)

(assert (=> d!106903 (= (choose!1430 lt!377945 lt!377951 zeroValueAfter!34 lt!377953) _$34!1150)))

(declare-fun bs!23299 () Bool)

(assert (= bs!23299 d!106903))

(assert (=> bs!23299 m!777253))

(assert (=> bs!23299 m!777253))

(assert (=> bs!23299 m!777255))

(assert (=> bs!23299 m!777261))

(assert (=> d!106679 d!106903))

(declare-fun d!106905 () Bool)

(declare-fun e!464834 () Bool)

(assert (=> d!106905 e!464834))

(declare-fun res!566699 () Bool)

(assert (=> d!106905 (=> res!566699 e!464834)))

(declare-fun lt!378219 () Bool)

(assert (=> d!106905 (= res!566699 (not lt!378219))))

(declare-fun lt!378222 () Bool)

(assert (=> d!106905 (= lt!378219 lt!378222)))

(declare-fun lt!378220 () Unit!28510)

(declare-fun e!464833 () Unit!28510)

(assert (=> d!106905 (= lt!378220 e!464833)))

(declare-fun c!90772 () Bool)

(assert (=> d!106905 (= c!90772 lt!378222)))

(assert (=> d!106905 (= lt!378222 (containsKey!402 (toList!4469 lt!377945) lt!377953))))

(assert (=> d!106905 (= (contains!4189 lt!377945 lt!377953) lt!378219)))

(declare-fun b!833335 () Bool)

(declare-fun lt!378221 () Unit!28510)

(assert (=> b!833335 (= e!464833 lt!378221)))

(assert (=> b!833335 (= lt!378221 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377945) lt!377953))))

(assert (=> b!833335 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377945) lt!377953))))

(declare-fun b!833336 () Bool)

(declare-fun Unit!28540 () Unit!28510)

(assert (=> b!833336 (= e!464833 Unit!28540)))

(declare-fun b!833337 () Bool)

(assert (=> b!833337 (= e!464834 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377945) lt!377953)))))

(assert (= (and d!106905 c!90772) b!833335))

(assert (= (and d!106905 (not c!90772)) b!833336))

(assert (= (and d!106905 (not res!566699)) b!833337))

(declare-fun m!778109 () Bool)

(assert (=> d!106905 m!778109))

(declare-fun m!778111 () Bool)

(assert (=> b!833335 m!778111))

(assert (=> b!833335 m!777357))

(assert (=> b!833335 m!777357))

(declare-fun m!778113 () Bool)

(assert (=> b!833335 m!778113))

(assert (=> b!833337 m!777357))

(assert (=> b!833337 m!777357))

(assert (=> b!833337 m!778113))

(assert (=> d!106679 d!106905))

(assert (=> d!106679 d!106669))

(assert (=> d!106679 d!106671))

(declare-fun d!106907 () Bool)

(declare-fun c!90773 () Bool)

(assert (=> d!106907 (= c!90773 (and ((_ is Cons!15848) (t!22212 (toList!4469 lt!377815))) (= (_1!5052 (h!16984 (t!22212 (toList!4469 lt!377815)))) (_1!5052 lt!377756))))))

(declare-fun e!464835 () Option!423)

(assert (=> d!106907 (= (getValueByKey!417 (t!22212 (toList!4469 lt!377815)) (_1!5052 lt!377756)) e!464835)))

(declare-fun b!833340 () Bool)

(declare-fun e!464836 () Option!423)

(assert (=> b!833340 (= e!464836 (getValueByKey!417 (t!22212 (t!22212 (toList!4469 lt!377815))) (_1!5052 lt!377756)))))

(declare-fun b!833341 () Bool)

(assert (=> b!833341 (= e!464836 None!421)))

(declare-fun b!833339 () Bool)

(assert (=> b!833339 (= e!464835 e!464836)))

(declare-fun c!90774 () Bool)

(assert (=> b!833339 (= c!90774 (and ((_ is Cons!15848) (t!22212 (toList!4469 lt!377815))) (not (= (_1!5052 (h!16984 (t!22212 (toList!4469 lt!377815)))) (_1!5052 lt!377756)))))))

(declare-fun b!833338 () Bool)

(assert (=> b!833338 (= e!464835 (Some!422 (_2!5052 (h!16984 (t!22212 (toList!4469 lt!377815))))))))

(assert (= (and d!106907 c!90773) b!833338))

(assert (= (and d!106907 (not c!90773)) b!833339))

(assert (= (and b!833339 c!90774) b!833340))

(assert (= (and b!833339 (not c!90774)) b!833341))

(declare-fun m!778115 () Bool)

(assert (=> b!833340 m!778115))

(assert (=> b!833247 d!106907))

(assert (=> d!106811 d!106809))

(declare-fun d!106909 () Bool)

(assert (=> d!106909 (= (getValueByKey!417 lt!377826 (_1!5052 lt!377756)) (Some!422 (_2!5052 lt!377756)))))

(assert (=> d!106909 true))

(declare-fun _$22!576 () Unit!28510)

(assert (=> d!106909 (= (choose!1429 lt!377826 (_1!5052 lt!377756) (_2!5052 lt!377756)) _$22!576)))

(declare-fun bs!23300 () Bool)

(assert (= bs!23300 d!106909))

(assert (=> bs!23300 m!777083))

(assert (=> d!106811 d!106909))

(declare-fun d!106911 () Bool)

(declare-fun res!566704 () Bool)

(declare-fun e!464841 () Bool)

(assert (=> d!106911 (=> res!566704 e!464841)))

(assert (=> d!106911 (= res!566704 (or ((_ is Nil!15849) lt!377826) ((_ is Nil!15849) (t!22212 lt!377826))))))

(assert (=> d!106911 (= (isStrictlySorted!430 lt!377826) e!464841)))

(declare-fun b!833346 () Bool)

(declare-fun e!464842 () Bool)

(assert (=> b!833346 (= e!464841 e!464842)))

(declare-fun res!566705 () Bool)

(assert (=> b!833346 (=> (not res!566705) (not e!464842))))

(assert (=> b!833346 (= res!566705 (bvslt (_1!5052 (h!16984 lt!377826)) (_1!5052 (h!16984 (t!22212 lt!377826)))))))

(declare-fun b!833347 () Bool)

(assert (=> b!833347 (= e!464842 (isStrictlySorted!430 (t!22212 lt!377826)))))

(assert (= (and d!106911 (not res!566704)) b!833346))

(assert (= (and b!833346 res!566705) b!833347))

(declare-fun m!778117 () Bool)

(assert (=> b!833347 m!778117))

(assert (=> d!106811 d!106911))

(declare-fun d!106913 () Bool)

(declare-fun res!566706 () Bool)

(declare-fun e!464843 () Bool)

(assert (=> d!106913 (=> res!566706 e!464843)))

(assert (=> d!106913 (= res!566706 (and ((_ is Cons!15848) lt!378207) (= (_1!5052 (h!16984 lt!378207)) (_1!5052 lt!377756))))))

(assert (=> d!106913 (= (containsKey!402 lt!378207 (_1!5052 lt!377756)) e!464843)))

(declare-fun b!833348 () Bool)

(declare-fun e!464844 () Bool)

(assert (=> b!833348 (= e!464843 e!464844)))

(declare-fun res!566707 () Bool)

(assert (=> b!833348 (=> (not res!566707) (not e!464844))))

(assert (=> b!833348 (= res!566707 (and (or (not ((_ is Cons!15848) lt!378207)) (bvsle (_1!5052 (h!16984 lt!378207)) (_1!5052 lt!377756))) ((_ is Cons!15848) lt!378207) (bvslt (_1!5052 (h!16984 lt!378207)) (_1!5052 lt!377756))))))

(declare-fun b!833349 () Bool)

(assert (=> b!833349 (= e!464844 (containsKey!402 (t!22212 lt!378207) (_1!5052 lt!377756)))))

(assert (= (and d!106913 (not res!566706)) b!833348))

(assert (= (and b!833348 res!566707) b!833349))

(declare-fun m!778119 () Bool)

(assert (=> b!833349 m!778119))

(assert (=> b!833301 d!106913))

(declare-fun d!106915 () Bool)

(declare-fun lt!378223 () Bool)

(assert (=> d!106915 (= lt!378223 (select (content!388 lt!377870) (tuple2!10083 (_1!5052 lt!377761) (_2!5052 lt!377761))))))

(declare-fun e!464846 () Bool)

(assert (=> d!106915 (= lt!378223 e!464846)))

(declare-fun res!566709 () Bool)

(assert (=> d!106915 (=> (not res!566709) (not e!464846))))

(assert (=> d!106915 (= res!566709 ((_ is Cons!15848) lt!377870))))

(assert (=> d!106915 (= (contains!4190 lt!377870 (tuple2!10083 (_1!5052 lt!377761) (_2!5052 lt!377761))) lt!378223)))

(declare-fun b!833350 () Bool)

(declare-fun e!464845 () Bool)

(assert (=> b!833350 (= e!464846 e!464845)))

(declare-fun res!566708 () Bool)

(assert (=> b!833350 (=> res!566708 e!464845)))

(assert (=> b!833350 (= res!566708 (= (h!16984 lt!377870) (tuple2!10083 (_1!5052 lt!377761) (_2!5052 lt!377761))))))

(declare-fun b!833351 () Bool)

(assert (=> b!833351 (= e!464845 (contains!4190 (t!22212 lt!377870) (tuple2!10083 (_1!5052 lt!377761) (_2!5052 lt!377761))))))

(assert (= (and d!106915 res!566709) b!833350))

(assert (= (and b!833350 (not res!566708)) b!833351))

(declare-fun m!778121 () Bool)

(assert (=> d!106915 m!778121))

(declare-fun m!778123 () Bool)

(assert (=> d!106915 m!778123))

(declare-fun m!778125 () Bool)

(assert (=> b!833351 m!778125))

(assert (=> b!833071 d!106915))

(declare-fun d!106917 () Bool)

(assert (=> d!106917 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377925) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!378226 () Unit!28510)

(declare-fun choose!1433 (List!15852 (_ BitVec 64)) Unit!28510)

(assert (=> d!106917 (= lt!378226 (choose!1433 (toList!4469 lt!377925) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!464849 () Bool)

(assert (=> d!106917 e!464849))

(declare-fun res!566712 () Bool)

(assert (=> d!106917 (=> (not res!566712) (not e!464849))))

(assert (=> d!106917 (= res!566712 (isStrictlySorted!430 (toList!4469 lt!377925)))))

(assert (=> d!106917 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377925) #b0000000000000000000000000000000000000000000000000000000000000000) lt!378226)))

(declare-fun b!833354 () Bool)

(assert (=> b!833354 (= e!464849 (containsKey!402 (toList!4469 lt!377925) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!106917 res!566712) b!833354))

(assert (=> d!106917 m!777429))

(assert (=> d!106917 m!777429))

(assert (=> d!106917 m!777921))

(declare-fun m!778127 () Bool)

(assert (=> d!106917 m!778127))

(declare-fun m!778129 () Bool)

(assert (=> d!106917 m!778129))

(assert (=> b!833354 m!777917))

(assert (=> b!833242 d!106917))

(declare-fun d!106919 () Bool)

(declare-fun isEmpty!665 (Option!423) Bool)

(assert (=> d!106919 (= (isDefined!312 (getValueByKey!417 (toList!4469 lt!377925) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!665 (getValueByKey!417 (toList!4469 lt!377925) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23301 () Bool)

(assert (= bs!23301 d!106919))

(assert (=> bs!23301 m!777429))

(declare-fun m!778131 () Bool)

(assert (=> bs!23301 m!778131))

(assert (=> b!833242 d!106919))

(declare-fun d!106921 () Bool)

(declare-fun c!90775 () Bool)

(assert (=> d!106921 (= c!90775 (and ((_ is Cons!15848) (toList!4469 lt!377925)) (= (_1!5052 (h!16984 (toList!4469 lt!377925))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!464850 () Option!423)

(assert (=> d!106921 (= (getValueByKey!417 (toList!4469 lt!377925) #b0000000000000000000000000000000000000000000000000000000000000000) e!464850)))

(declare-fun b!833357 () Bool)

(declare-fun e!464851 () Option!423)

(assert (=> b!833357 (= e!464851 (getValueByKey!417 (t!22212 (toList!4469 lt!377925)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!833358 () Bool)

(assert (=> b!833358 (= e!464851 None!421)))

(declare-fun b!833356 () Bool)

(assert (=> b!833356 (= e!464850 e!464851)))

(declare-fun c!90776 () Bool)

(assert (=> b!833356 (= c!90776 (and ((_ is Cons!15848) (toList!4469 lt!377925)) (not (= (_1!5052 (h!16984 (toList!4469 lt!377925))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!833355 () Bool)

(assert (=> b!833355 (= e!464850 (Some!422 (_2!5052 (h!16984 (toList!4469 lt!377925)))))))

(assert (= (and d!106921 c!90775) b!833355))

(assert (= (and d!106921 (not c!90775)) b!833356))

(assert (= (and b!833356 c!90776) b!833357))

(assert (= (and b!833356 (not c!90776)) b!833358))

(declare-fun m!778133 () Bool)

(assert (=> b!833357 m!778133))

(assert (=> b!833242 d!106921))

(declare-fun d!106923 () Bool)

(assert (=> d!106923 (= ($colon$colon!534 e!464716 (ite c!90714 (h!16984 (toList!4469 lt!377759)) (tuple2!10083 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (Cons!15848 (ite c!90714 (h!16984 (toList!4469 lt!377759)) (tuple2!10083 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) e!464716))))

(assert (=> bm!36457 d!106923))

(declare-fun c!90777 () Bool)

(declare-fun d!106925 () Bool)

(assert (=> d!106925 (= c!90777 (and ((_ is Cons!15848) (toList!4469 lt!378069)) (= (_1!5052 (h!16984 (toList!4469 lt!378069))) (_1!5052 (tuple2!10083 lt!377933 minValue!754)))))))

(declare-fun e!464852 () Option!423)

(assert (=> d!106925 (= (getValueByKey!417 (toList!4469 lt!378069) (_1!5052 (tuple2!10083 lt!377933 minValue!754))) e!464852)))

(declare-fun b!833361 () Bool)

(declare-fun e!464853 () Option!423)

(assert (=> b!833361 (= e!464853 (getValueByKey!417 (t!22212 (toList!4469 lt!378069)) (_1!5052 (tuple2!10083 lt!377933 minValue!754))))))

(declare-fun b!833362 () Bool)

(assert (=> b!833362 (= e!464853 None!421)))

(declare-fun b!833360 () Bool)

(assert (=> b!833360 (= e!464852 e!464853)))

(declare-fun c!90778 () Bool)

(assert (=> b!833360 (= c!90778 (and ((_ is Cons!15848) (toList!4469 lt!378069)) (not (= (_1!5052 (h!16984 (toList!4469 lt!378069))) (_1!5052 (tuple2!10083 lt!377933 minValue!754))))))))

(declare-fun b!833359 () Bool)

(assert (=> b!833359 (= e!464852 (Some!422 (_2!5052 (h!16984 (toList!4469 lt!378069)))))))

(assert (= (and d!106925 c!90777) b!833359))

(assert (= (and d!106925 (not c!90777)) b!833360))

(assert (= (and b!833360 c!90778) b!833361))

(assert (= (and b!833360 (not c!90778)) b!833362))

(declare-fun m!778135 () Bool)

(assert (=> b!833361 m!778135))

(assert (=> b!833057 d!106925))

(declare-fun d!106927 () Bool)

(assert (=> d!106927 (= (isDefined!312 (getValueByKey!417 (toList!4469 lt!377823) (_1!5052 lt!377761))) (not (isEmpty!665 (getValueByKey!417 (toList!4469 lt!377823) (_1!5052 lt!377761)))))))

(declare-fun bs!23302 () Bool)

(assert (= bs!23302 d!106927))

(assert (=> bs!23302 m!777077))

(declare-fun m!778137 () Bool)

(assert (=> bs!23302 m!778137))

(assert (=> b!833185 d!106927))

(assert (=> b!833185 d!106853))

(declare-fun b!833363 () Bool)

(declare-fun e!464855 () Bool)

(declare-fun e!464860 () Bool)

(assert (=> b!833363 (= e!464855 e!464860)))

(assert (=> b!833363 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22751 _keys!976)))))

(declare-fun res!566714 () Bool)

(declare-fun lt!378227 () ListLongMap!8907)

(assert (=> b!833363 (= res!566714 (contains!4189 lt!378227 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!833363 (=> (not res!566714) (not e!464860))))

(declare-fun b!833364 () Bool)

(declare-fun e!464858 () Bool)

(assert (=> b!833364 (= e!464858 (isEmpty!663 lt!378227))))

(declare-fun b!833365 () Bool)

(declare-fun e!464856 () ListLongMap!8907)

(declare-fun e!464857 () ListLongMap!8907)

(assert (=> b!833365 (= e!464856 e!464857)))

(declare-fun c!90780 () Bool)

(assert (=> b!833365 (= c!90780 (validKeyInArray!0 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!833366 () Bool)

(assert (=> b!833366 (= e!464858 (= lt!378227 (getCurrentListMapNoExtraKeys!2539 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun call!36476 () ListLongMap!8907)

(declare-fun bm!36473 () Bool)

(assert (=> bm!36473 (= call!36476 (getCurrentListMapNoExtraKeys!2539 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!833367 () Bool)

(declare-fun e!464854 () Bool)

(assert (=> b!833367 (= e!464854 e!464855)))

(declare-fun c!90781 () Bool)

(declare-fun e!464859 () Bool)

(assert (=> b!833367 (= c!90781 e!464859)))

(declare-fun res!566713 () Bool)

(assert (=> b!833367 (=> (not res!566713) (not e!464859))))

(assert (=> b!833367 (= res!566713 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22751 _keys!976)))))

(declare-fun b!833368 () Bool)

(assert (=> b!833368 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22751 _keys!976)))))

(assert (=> b!833368 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22752 _values!788)))))

(assert (=> b!833368 (= e!464860 (= (apply!373 lt!378227 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))) (get!11826 (select (arr!22332 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!106929 () Bool)

(assert (=> d!106929 e!464854))

(declare-fun res!566715 () Bool)

(assert (=> d!106929 (=> (not res!566715) (not e!464854))))

(assert (=> d!106929 (= res!566715 (not (contains!4189 lt!378227 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106929 (= lt!378227 e!464856)))

(declare-fun c!90779 () Bool)

(assert (=> d!106929 (= c!90779 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22751 _keys!976)))))

(assert (=> d!106929 (validMask!0 mask!1312)))

(assert (=> d!106929 (= (getCurrentListMapNoExtraKeys!2539 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796) lt!378227)))

(declare-fun b!833369 () Bool)

(assert (=> b!833369 (= e!464855 e!464858)))

(declare-fun c!90782 () Bool)

(assert (=> b!833369 (= c!90782 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22751 _keys!976)))))

(declare-fun b!833370 () Bool)

(declare-fun res!566716 () Bool)

(assert (=> b!833370 (=> (not res!566716) (not e!464854))))

(assert (=> b!833370 (= res!566716 (not (contains!4189 lt!378227 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!833371 () Bool)

(assert (=> b!833371 (= e!464857 call!36476)))

(declare-fun b!833372 () Bool)

(assert (=> b!833372 (= e!464856 (ListLongMap!8908 Nil!15849))))

(declare-fun b!833373 () Bool)

(declare-fun lt!378232 () Unit!28510)

(declare-fun lt!378228 () Unit!28510)

(assert (=> b!833373 (= lt!378232 lt!378228)))

(declare-fun lt!378229 () (_ BitVec 64))

(declare-fun lt!378233 () V!25283)

(declare-fun lt!378231 () (_ BitVec 64))

(declare-fun lt!378230 () ListLongMap!8907)

(assert (=> b!833373 (not (contains!4189 (+!1991 lt!378230 (tuple2!10083 lt!378229 lt!378233)) lt!378231))))

(assert (=> b!833373 (= lt!378228 (addStillNotContains!200 lt!378230 lt!378229 lt!378233 lt!378231))))

(assert (=> b!833373 (= lt!378231 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!833373 (= lt!378233 (get!11826 (select (arr!22332 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!833373 (= lt!378229 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!833373 (= lt!378230 call!36476)))

(assert (=> b!833373 (= e!464857 (+!1991 call!36476 (tuple2!10083 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (get!11826 (select (arr!22332 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!833374 () Bool)

(assert (=> b!833374 (= e!464859 (validKeyInArray!0 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!833374 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (= (and d!106929 c!90779) b!833372))

(assert (= (and d!106929 (not c!90779)) b!833365))

(assert (= (and b!833365 c!90780) b!833373))

(assert (= (and b!833365 (not c!90780)) b!833371))

(assert (= (or b!833373 b!833371) bm!36473))

(assert (= (and d!106929 res!566715) b!833370))

(assert (= (and b!833370 res!566716) b!833367))

(assert (= (and b!833367 res!566713) b!833374))

(assert (= (and b!833367 c!90781) b!833363))

(assert (= (and b!833367 (not c!90781)) b!833369))

(assert (= (and b!833363 res!566714) b!833368))

(assert (= (and b!833369 c!90782) b!833366))

(assert (= (and b!833369 (not c!90782)) b!833364))

(declare-fun b_lambda!11457 () Bool)

(assert (=> (not b_lambda!11457) (not b!833368)))

(assert (=> b!833368 t!22218))

(declare-fun b_and!22595 () Bool)

(assert (= b_and!22593 (and (=> t!22218 result!8013) b_and!22595)))

(declare-fun b_lambda!11459 () Bool)

(assert (=> (not b_lambda!11459) (not b!833373)))

(assert (=> b!833373 t!22218))

(declare-fun b_and!22597 () Bool)

(assert (= b_and!22595 (and (=> t!22218 result!8013) b_and!22597)))

(declare-fun m!778139 () Bool)

(assert (=> b!833368 m!778139))

(declare-fun m!778141 () Bool)

(assert (=> b!833368 m!778141))

(assert (=> b!833368 m!777109))

(assert (=> b!833368 m!778139))

(declare-fun m!778143 () Bool)

(assert (=> b!833368 m!778143))

(assert (=> b!833368 m!778141))

(assert (=> b!833368 m!777109))

(declare-fun m!778145 () Bool)

(assert (=> b!833368 m!778145))

(assert (=> b!833365 m!778139))

(assert (=> b!833365 m!778139))

(declare-fun m!778147 () Bool)

(assert (=> b!833365 m!778147))

(assert (=> b!833374 m!778139))

(assert (=> b!833374 m!778139))

(assert (=> b!833374 m!778147))

(declare-fun m!778149 () Bool)

(assert (=> b!833364 m!778149))

(declare-fun m!778151 () Bool)

(assert (=> b!833373 m!778151))

(assert (=> b!833373 m!778139))

(assert (=> b!833373 m!778141))

(assert (=> b!833373 m!777109))

(assert (=> b!833373 m!778151))

(declare-fun m!778153 () Bool)

(assert (=> b!833373 m!778153))

(declare-fun m!778155 () Bool)

(assert (=> b!833373 m!778155))

(declare-fun m!778157 () Bool)

(assert (=> b!833373 m!778157))

(assert (=> b!833373 m!778141))

(assert (=> b!833373 m!777109))

(assert (=> b!833373 m!778145))

(assert (=> b!833363 m!778139))

(assert (=> b!833363 m!778139))

(declare-fun m!778159 () Bool)

(assert (=> b!833363 m!778159))

(declare-fun m!778161 () Bool)

(assert (=> b!833366 m!778161))

(assert (=> bm!36473 m!778161))

(declare-fun m!778163 () Bool)

(assert (=> d!106929 m!778163))

(assert (=> d!106929 m!776931))

(declare-fun m!778165 () Bool)

(assert (=> b!833370 m!778165))

(assert (=> b!833085 d!106929))

(declare-fun d!106931 () Bool)

(declare-fun res!566717 () Bool)

(declare-fun e!464861 () Bool)

(assert (=> d!106931 (=> res!566717 e!464861)))

(assert (=> d!106931 (= res!566717 (and ((_ is Cons!15848) lt!377970) (= (_1!5052 (h!16984 lt!377970)) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!106931 (= (containsKey!402 lt!377970 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!464861)))

(declare-fun b!833375 () Bool)

(declare-fun e!464862 () Bool)

(assert (=> b!833375 (= e!464861 e!464862)))

(declare-fun res!566718 () Bool)

(assert (=> b!833375 (=> (not res!566718) (not e!464862))))

(assert (=> b!833375 (= res!566718 (and (or (not ((_ is Cons!15848) lt!377970)) (bvsle (_1!5052 (h!16984 lt!377970)) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) ((_ is Cons!15848) lt!377970) (bvslt (_1!5052 (h!16984 lt!377970)) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!833376 () Bool)

(assert (=> b!833376 (= e!464862 (containsKey!402 (t!22212 lt!377970) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and d!106931 (not res!566717)) b!833375))

(assert (= (and b!833375 res!566718) b!833376))

(declare-fun m!778167 () Bool)

(assert (=> b!833376 m!778167))

(assert (=> b!832943 d!106931))

(declare-fun d!106933 () Bool)

(declare-fun lt!378234 () Bool)

(assert (=> d!106933 (= lt!378234 (select (content!388 (t!22212 (toList!4469 lt!377967))) lt!377756))))

(declare-fun e!464864 () Bool)

(assert (=> d!106933 (= lt!378234 e!464864)))

(declare-fun res!566720 () Bool)

(assert (=> d!106933 (=> (not res!566720) (not e!464864))))

(assert (=> d!106933 (= res!566720 ((_ is Cons!15848) (t!22212 (toList!4469 lt!377967))))))

(assert (=> d!106933 (= (contains!4190 (t!22212 (toList!4469 lt!377967)) lt!377756) lt!378234)))

(declare-fun b!833377 () Bool)

(declare-fun e!464863 () Bool)

(assert (=> b!833377 (= e!464864 e!464863)))

(declare-fun res!566719 () Bool)

(assert (=> b!833377 (=> res!566719 e!464863)))

(assert (=> b!833377 (= res!566719 (= (h!16984 (t!22212 (toList!4469 lt!377967))) lt!377756))))

(declare-fun b!833378 () Bool)

(assert (=> b!833378 (= e!464863 (contains!4190 (t!22212 (t!22212 (toList!4469 lt!377967))) lt!377756))))

(assert (= (and d!106933 res!566720) b!833377))

(assert (= (and b!833377 (not res!566719)) b!833378))

(declare-fun m!778169 () Bool)

(assert (=> d!106933 m!778169))

(declare-fun m!778171 () Bool)

(assert (=> d!106933 m!778171))

(declare-fun m!778173 () Bool)

(assert (=> b!833378 m!778173))

(assert (=> b!833241 d!106933))

(declare-fun d!106935 () Bool)

(declare-fun res!566721 () Bool)

(declare-fun e!464865 () Bool)

(assert (=> d!106935 (=> res!566721 e!464865)))

(assert (=> d!106935 (= res!566721 (and ((_ is Cons!15848) lt!377822) (= (_1!5052 (h!16984 lt!377822)) (_1!5052 lt!377761))))))

(assert (=> d!106935 (= (containsKey!402 lt!377822 (_1!5052 lt!377761)) e!464865)))

(declare-fun b!833379 () Bool)

(declare-fun e!464866 () Bool)

(assert (=> b!833379 (= e!464865 e!464866)))

(declare-fun res!566722 () Bool)

(assert (=> b!833379 (=> (not res!566722) (not e!464866))))

(assert (=> b!833379 (= res!566722 (and (or (not ((_ is Cons!15848) lt!377822)) (bvsle (_1!5052 (h!16984 lt!377822)) (_1!5052 lt!377761))) ((_ is Cons!15848) lt!377822) (bvslt (_1!5052 (h!16984 lt!377822)) (_1!5052 lt!377761))))))

(declare-fun b!833380 () Bool)

(assert (=> b!833380 (= e!464866 (containsKey!402 (t!22212 lt!377822) (_1!5052 lt!377761)))))

(assert (= (and d!106935 (not res!566721)) b!833379))

(assert (= (and b!833379 res!566722) b!833380))

(declare-fun m!778175 () Bool)

(assert (=> b!833380 m!778175))

(assert (=> b!833190 d!106935))

(declare-fun d!106937 () Bool)

(assert (=> d!106937 (arrayContainsKey!0 _keys!976 lt!378168 #b00000000000000000000000000000000)))

(declare-fun lt!378235 () Unit!28510)

(assert (=> d!106937 (= lt!378235 (choose!13 _keys!976 lt!378168 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> d!106937 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (=> d!106937 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!378168 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!378235)))

(declare-fun bs!23303 () Bool)

(assert (= bs!23303 d!106937))

(assert (=> bs!23303 m!777935))

(declare-fun m!778177 () Bool)

(assert (=> bs!23303 m!778177))

(assert (=> b!833257 d!106937))

(declare-fun d!106939 () Bool)

(declare-fun res!566723 () Bool)

(declare-fun e!464867 () Bool)

(assert (=> d!106939 (=> res!566723 e!464867)))

(assert (=> d!106939 (= res!566723 (= (select (arr!22331 _keys!976) #b00000000000000000000000000000000) lt!378168))))

(assert (=> d!106939 (= (arrayContainsKey!0 _keys!976 lt!378168 #b00000000000000000000000000000000) e!464867)))

(declare-fun b!833381 () Bool)

(declare-fun e!464868 () Bool)

(assert (=> b!833381 (= e!464867 e!464868)))

(declare-fun res!566724 () Bool)

(assert (=> b!833381 (=> (not res!566724) (not e!464868))))

(assert (=> b!833381 (= res!566724 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22751 _keys!976)))))

(declare-fun b!833382 () Bool)

(assert (=> b!833382 (= e!464868 (arrayContainsKey!0 _keys!976 lt!378168 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!106939 (not res!566723)) b!833381))

(assert (= (and b!833381 res!566724) b!833382))

(assert (=> d!106939 m!777093))

(declare-fun m!778179 () Bool)

(assert (=> b!833382 m!778179))

(assert (=> b!833257 d!106939))

(declare-fun b!833383 () Bool)

(declare-fun c!90784 () Bool)

(declare-fun lt!378238 () (_ BitVec 64))

(assert (=> b!833383 (= c!90784 (= lt!378238 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!464869 () SeekEntryResult!8696)

(declare-fun e!464870 () SeekEntryResult!8696)

(assert (=> b!833383 (= e!464869 e!464870)))

(declare-fun b!833384 () Bool)

(declare-fun e!464871 () SeekEntryResult!8696)

(assert (=> b!833384 (= e!464871 Undefined!8696)))

(declare-fun b!833385 () Bool)

(declare-fun lt!378237 () SeekEntryResult!8696)

(assert (=> b!833385 (= e!464870 (MissingZero!8696 (index!37157 lt!378237)))))

(declare-fun d!106941 () Bool)

(declare-fun lt!378236 () SeekEntryResult!8696)

(assert (=> d!106941 (and (or ((_ is Undefined!8696) lt!378236) (not ((_ is Found!8696) lt!378236)) (and (bvsge (index!37156 lt!378236) #b00000000000000000000000000000000) (bvslt (index!37156 lt!378236) (size!22751 _keys!976)))) (or ((_ is Undefined!8696) lt!378236) ((_ is Found!8696) lt!378236) (not ((_ is MissingZero!8696) lt!378236)) (and (bvsge (index!37155 lt!378236) #b00000000000000000000000000000000) (bvslt (index!37155 lt!378236) (size!22751 _keys!976)))) (or ((_ is Undefined!8696) lt!378236) ((_ is Found!8696) lt!378236) ((_ is MissingZero!8696) lt!378236) (not ((_ is MissingVacant!8696) lt!378236)) (and (bvsge (index!37158 lt!378236) #b00000000000000000000000000000000) (bvslt (index!37158 lt!378236) (size!22751 _keys!976)))) (or ((_ is Undefined!8696) lt!378236) (ite ((_ is Found!8696) lt!378236) (= (select (arr!22331 _keys!976) (index!37156 lt!378236)) (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (ite ((_ is MissingZero!8696) lt!378236) (= (select (arr!22331 _keys!976) (index!37155 lt!378236)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8696) lt!378236) (= (select (arr!22331 _keys!976) (index!37158 lt!378236)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!106941 (= lt!378236 e!464871)))

(declare-fun c!90783 () Bool)

(assert (=> d!106941 (= c!90783 (and ((_ is Intermediate!8696) lt!378237) (undefined!9508 lt!378237)))))

(assert (=> d!106941 (= lt!378237 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) mask!1312) (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!976 mask!1312))))

(assert (=> d!106941 (validMask!0 mask!1312)))

(assert (=> d!106941 (= (seekEntryOrOpen!0 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!976 mask!1312) lt!378236)))

(declare-fun b!833386 () Bool)

(assert (=> b!833386 (= e!464870 (seekKeyOrZeroReturnVacant!0 (x!70105 lt!378237) (index!37157 lt!378237) (index!37157 lt!378237) (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!976 mask!1312))))

(declare-fun b!833387 () Bool)

(assert (=> b!833387 (= e!464869 (Found!8696 (index!37157 lt!378237)))))

(declare-fun b!833388 () Bool)

(assert (=> b!833388 (= e!464871 e!464869)))

(assert (=> b!833388 (= lt!378238 (select (arr!22331 _keys!976) (index!37157 lt!378237)))))

(declare-fun c!90785 () Bool)

(assert (=> b!833388 (= c!90785 (= lt!378238 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!106941 c!90783) b!833384))

(assert (= (and d!106941 (not c!90783)) b!833388))

(assert (= (and b!833388 c!90785) b!833387))

(assert (= (and b!833388 (not c!90785)) b!833383))

(assert (= (and b!833383 c!90784) b!833385))

(assert (= (and b!833383 (not c!90784)) b!833386))

(declare-fun m!778181 () Bool)

(assert (=> d!106941 m!778181))

(assert (=> d!106941 m!777463))

(declare-fun m!778183 () Bool)

(assert (=> d!106941 m!778183))

(declare-fun m!778185 () Bool)

(assert (=> d!106941 m!778185))

(declare-fun m!778187 () Bool)

(assert (=> d!106941 m!778187))

(declare-fun m!778189 () Bool)

(assert (=> d!106941 m!778189))

(assert (=> d!106941 m!777463))

(assert (=> d!106941 m!778181))

(assert (=> d!106941 m!776931))

(assert (=> b!833386 m!777463))

(declare-fun m!778191 () Bool)

(assert (=> b!833386 m!778191))

(declare-fun m!778193 () Bool)

(assert (=> b!833388 m!778193))

(assert (=> b!833257 d!106941))

(declare-fun d!106943 () Bool)

(declare-fun e!464873 () Bool)

(assert (=> d!106943 e!464873))

(declare-fun res!566725 () Bool)

(assert (=> d!106943 (=> res!566725 e!464873)))

(declare-fun lt!378239 () Bool)

(assert (=> d!106943 (= res!566725 (not lt!378239))))

(declare-fun lt!378242 () Bool)

(assert (=> d!106943 (= lt!378239 lt!378242)))

(declare-fun lt!378240 () Unit!28510)

(declare-fun e!464872 () Unit!28510)

(assert (=> d!106943 (= lt!378240 e!464872)))

(declare-fun c!90786 () Bool)

(assert (=> d!106943 (= c!90786 lt!378242)))

(assert (=> d!106943 (= lt!378242 (containsKey!402 (toList!4469 lt!378056) (_1!5052 (tuple2!10083 lt!377928 minValue!754))))))

(assert (=> d!106943 (= (contains!4189 lt!378056 (_1!5052 (tuple2!10083 lt!377928 minValue!754))) lt!378239)))

(declare-fun b!833389 () Bool)

(declare-fun lt!378241 () Unit!28510)

(assert (=> b!833389 (= e!464872 lt!378241)))

(assert (=> b!833389 (= lt!378241 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!378056) (_1!5052 (tuple2!10083 lt!377928 minValue!754))))))

(assert (=> b!833389 (isDefined!312 (getValueByKey!417 (toList!4469 lt!378056) (_1!5052 (tuple2!10083 lt!377928 minValue!754))))))

(declare-fun b!833390 () Bool)

(declare-fun Unit!28541 () Unit!28510)

(assert (=> b!833390 (= e!464872 Unit!28541)))

(declare-fun b!833391 () Bool)

(assert (=> b!833391 (= e!464873 (isDefined!312 (getValueByKey!417 (toList!4469 lt!378056) (_1!5052 (tuple2!10083 lt!377928 minValue!754)))))))

(assert (= (and d!106943 c!90786) b!833389))

(assert (= (and d!106943 (not c!90786)) b!833390))

(assert (= (and d!106943 (not res!566725)) b!833391))

(declare-fun m!778195 () Bool)

(assert (=> d!106943 m!778195))

(declare-fun m!778197 () Bool)

(assert (=> b!833389 m!778197))

(assert (=> b!833389 m!777549))

(assert (=> b!833389 m!777549))

(declare-fun m!778199 () Bool)

(assert (=> b!833389 m!778199))

(assert (=> b!833391 m!777549))

(assert (=> b!833391 m!777549))

(assert (=> b!833391 m!778199))

(assert (=> d!106731 d!106943))

(declare-fun d!106945 () Bool)

(declare-fun c!90787 () Bool)

(assert (=> d!106945 (= c!90787 (and ((_ is Cons!15848) lt!378055) (= (_1!5052 (h!16984 lt!378055)) (_1!5052 (tuple2!10083 lt!377928 minValue!754)))))))

(declare-fun e!464874 () Option!423)

(assert (=> d!106945 (= (getValueByKey!417 lt!378055 (_1!5052 (tuple2!10083 lt!377928 minValue!754))) e!464874)))

(declare-fun e!464875 () Option!423)

(declare-fun b!833394 () Bool)

(assert (=> b!833394 (= e!464875 (getValueByKey!417 (t!22212 lt!378055) (_1!5052 (tuple2!10083 lt!377928 minValue!754))))))

(declare-fun b!833395 () Bool)

(assert (=> b!833395 (= e!464875 None!421)))

(declare-fun b!833393 () Bool)

(assert (=> b!833393 (= e!464874 e!464875)))

(declare-fun c!90788 () Bool)

(assert (=> b!833393 (= c!90788 (and ((_ is Cons!15848) lt!378055) (not (= (_1!5052 (h!16984 lt!378055)) (_1!5052 (tuple2!10083 lt!377928 minValue!754))))))))

(declare-fun b!833392 () Bool)

(assert (=> b!833392 (= e!464874 (Some!422 (_2!5052 (h!16984 lt!378055))))))

(assert (= (and d!106945 c!90787) b!833392))

(assert (= (and d!106945 (not c!90787)) b!833393))

(assert (= (and b!833393 c!90788) b!833394))

(assert (= (and b!833393 (not c!90788)) b!833395))

(declare-fun m!778201 () Bool)

(assert (=> b!833394 m!778201))

(assert (=> d!106731 d!106945))

(declare-fun d!106947 () Bool)

(assert (=> d!106947 (= (getValueByKey!417 lt!378055 (_1!5052 (tuple2!10083 lt!377928 minValue!754))) (Some!422 (_2!5052 (tuple2!10083 lt!377928 minValue!754))))))

(declare-fun lt!378243 () Unit!28510)

(assert (=> d!106947 (= lt!378243 (choose!1429 lt!378055 (_1!5052 (tuple2!10083 lt!377928 minValue!754)) (_2!5052 (tuple2!10083 lt!377928 minValue!754))))))

(declare-fun e!464876 () Bool)

(assert (=> d!106947 e!464876))

(declare-fun res!566726 () Bool)

(assert (=> d!106947 (=> (not res!566726) (not e!464876))))

(assert (=> d!106947 (= res!566726 (isStrictlySorted!430 lt!378055))))

(assert (=> d!106947 (= (lemmaContainsTupThenGetReturnValue!231 lt!378055 (_1!5052 (tuple2!10083 lt!377928 minValue!754)) (_2!5052 (tuple2!10083 lt!377928 minValue!754))) lt!378243)))

(declare-fun b!833396 () Bool)

(declare-fun res!566727 () Bool)

(assert (=> b!833396 (=> (not res!566727) (not e!464876))))

(assert (=> b!833396 (= res!566727 (containsKey!402 lt!378055 (_1!5052 (tuple2!10083 lt!377928 minValue!754))))))

(declare-fun b!833397 () Bool)

(assert (=> b!833397 (= e!464876 (contains!4190 lt!378055 (tuple2!10083 (_1!5052 (tuple2!10083 lt!377928 minValue!754)) (_2!5052 (tuple2!10083 lt!377928 minValue!754)))))))

(assert (= (and d!106947 res!566726) b!833396))

(assert (= (and b!833396 res!566727) b!833397))

(assert (=> d!106947 m!777543))

(declare-fun m!778203 () Bool)

(assert (=> d!106947 m!778203))

(declare-fun m!778205 () Bool)

(assert (=> d!106947 m!778205))

(declare-fun m!778207 () Bool)

(assert (=> b!833396 m!778207))

(declare-fun m!778209 () Bool)

(assert (=> b!833397 m!778209))

(assert (=> d!106731 d!106947))

(declare-fun bm!36474 () Bool)

(declare-fun e!464878 () List!15852)

(declare-fun c!90789 () Bool)

(declare-fun call!36478 () List!15852)

(assert (=> bm!36474 (= call!36478 ($colon$colon!534 e!464878 (ite c!90789 (h!16984 (toList!4469 lt!377934)) (tuple2!10083 (_1!5052 (tuple2!10083 lt!377928 minValue!754)) (_2!5052 (tuple2!10083 lt!377928 minValue!754))))))))

(declare-fun c!90792 () Bool)

(assert (=> bm!36474 (= c!90792 c!90789)))

(declare-fun bm!36475 () Bool)

(declare-fun call!36479 () List!15852)

(assert (=> bm!36475 (= call!36479 call!36478)))

(declare-fun bm!36476 () Bool)

(declare-fun call!36477 () List!15852)

(assert (=> bm!36476 (= call!36477 call!36479)))

(declare-fun b!833398 () Bool)

(declare-fun c!90790 () Bool)

(assert (=> b!833398 (= c!90790 (and ((_ is Cons!15848) (toList!4469 lt!377934)) (bvsgt (_1!5052 (h!16984 (toList!4469 lt!377934))) (_1!5052 (tuple2!10083 lt!377928 minValue!754)))))))

(declare-fun e!464877 () List!15852)

(declare-fun e!464880 () List!15852)

(assert (=> b!833398 (= e!464877 e!464880)))

(declare-fun b!833399 () Bool)

(assert (=> b!833399 (= e!464880 call!36477)))

(declare-fun b!833400 () Bool)

(assert (=> b!833400 (= e!464878 (insertStrictlySorted!270 (t!22212 (toList!4469 lt!377934)) (_1!5052 (tuple2!10083 lt!377928 minValue!754)) (_2!5052 (tuple2!10083 lt!377928 minValue!754))))))

(declare-fun b!833401 () Bool)

(declare-fun e!464879 () List!15852)

(assert (=> b!833401 (= e!464879 call!36478)))

(declare-fun b!833402 () Bool)

(declare-fun lt!378244 () List!15852)

(declare-fun e!464881 () Bool)

(assert (=> b!833402 (= e!464881 (contains!4190 lt!378244 (tuple2!10083 (_1!5052 (tuple2!10083 lt!377928 minValue!754)) (_2!5052 (tuple2!10083 lt!377928 minValue!754)))))))

(declare-fun c!90791 () Bool)

(declare-fun b!833403 () Bool)

(assert (=> b!833403 (= e!464878 (ite c!90791 (t!22212 (toList!4469 lt!377934)) (ite c!90790 (Cons!15848 (h!16984 (toList!4469 lt!377934)) (t!22212 (toList!4469 lt!377934))) Nil!15849)))))

(declare-fun b!833404 () Bool)

(assert (=> b!833404 (= e!464879 e!464877)))

(assert (=> b!833404 (= c!90791 (and ((_ is Cons!15848) (toList!4469 lt!377934)) (= (_1!5052 (h!16984 (toList!4469 lt!377934))) (_1!5052 (tuple2!10083 lt!377928 minValue!754)))))))

(declare-fun b!833405 () Bool)

(assert (=> b!833405 (= e!464877 call!36479)))

(declare-fun b!833406 () Bool)

(declare-fun res!566729 () Bool)

(assert (=> b!833406 (=> (not res!566729) (not e!464881))))

(assert (=> b!833406 (= res!566729 (containsKey!402 lt!378244 (_1!5052 (tuple2!10083 lt!377928 minValue!754))))))

(declare-fun d!106949 () Bool)

(assert (=> d!106949 e!464881))

(declare-fun res!566728 () Bool)

(assert (=> d!106949 (=> (not res!566728) (not e!464881))))

(assert (=> d!106949 (= res!566728 (isStrictlySorted!430 lt!378244))))

(assert (=> d!106949 (= lt!378244 e!464879)))

(assert (=> d!106949 (= c!90789 (and ((_ is Cons!15848) (toList!4469 lt!377934)) (bvslt (_1!5052 (h!16984 (toList!4469 lt!377934))) (_1!5052 (tuple2!10083 lt!377928 minValue!754)))))))

(assert (=> d!106949 (isStrictlySorted!430 (toList!4469 lt!377934))))

(assert (=> d!106949 (= (insertStrictlySorted!270 (toList!4469 lt!377934) (_1!5052 (tuple2!10083 lt!377928 minValue!754)) (_2!5052 (tuple2!10083 lt!377928 minValue!754))) lt!378244)))

(declare-fun b!833407 () Bool)

(assert (=> b!833407 (= e!464880 call!36477)))

(assert (= (and d!106949 c!90789) b!833401))

(assert (= (and d!106949 (not c!90789)) b!833404))

(assert (= (and b!833404 c!90791) b!833405))

(assert (= (and b!833404 (not c!90791)) b!833398))

(assert (= (and b!833398 c!90790) b!833399))

(assert (= (and b!833398 (not c!90790)) b!833407))

(assert (= (or b!833399 b!833407) bm!36476))

(assert (= (or b!833405 bm!36476) bm!36475))

(assert (= (or b!833401 bm!36475) bm!36474))

(assert (= (and bm!36474 c!90792) b!833400))

(assert (= (and bm!36474 (not c!90792)) b!833403))

(assert (= (and d!106949 res!566728) b!833406))

(assert (= (and b!833406 res!566729) b!833402))

(declare-fun m!778211 () Bool)

(assert (=> bm!36474 m!778211))

(declare-fun m!778213 () Bool)

(assert (=> b!833402 m!778213))

(declare-fun m!778215 () Bool)

(assert (=> b!833400 m!778215))

(declare-fun m!778217 () Bool)

(assert (=> b!833406 m!778217))

(declare-fun m!778219 () Bool)

(assert (=> d!106949 m!778219))

(declare-fun m!778221 () Bool)

(assert (=> d!106949 m!778221))

(assert (=> d!106731 d!106949))

(declare-fun d!106951 () Bool)

(assert (=> d!106951 (= ($colon$colon!534 e!464700 (ite c!90703 (h!16984 (toList!4469 lt!377759)) (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756)))) (Cons!15848 (ite c!90703 (h!16984 (toList!4469 lt!377759)) (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))) e!464700))))

(assert (=> bm!36454 d!106951))

(declare-fun d!106953 () Bool)

(assert (=> d!106953 (= (get!11828 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!10098 (select (arr!22332 _values!788) #b00000000000000000000000000000000)))))

(assert (=> b!833045 d!106953))

(declare-fun d!106955 () Bool)

(declare-fun e!464883 () Bool)

(assert (=> d!106955 e!464883))

(declare-fun res!566730 () Bool)

(assert (=> d!106955 (=> res!566730 e!464883)))

(declare-fun lt!378245 () Bool)

(assert (=> d!106955 (= res!566730 (not lt!378245))))

(declare-fun lt!378248 () Bool)

(assert (=> d!106955 (= lt!378245 lt!378248)))

(declare-fun lt!378246 () Unit!28510)

(declare-fun e!464882 () Unit!28510)

(assert (=> d!106955 (= lt!378246 e!464882)))

(declare-fun c!90793 () Bool)

(assert (=> d!106955 (= c!90793 lt!378248)))

(assert (=> d!106955 (= lt!378248 (containsKey!402 (toList!4469 lt!378037) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!106955 (= (contains!4189 lt!378037 #b0000000000000000000000000000000000000000000000000000000000000000) lt!378245)))

(declare-fun b!833408 () Bool)

(declare-fun lt!378247 () Unit!28510)

(assert (=> b!833408 (= e!464882 lt!378247)))

(assert (=> b!833408 (= lt!378247 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!378037) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!833408 (isDefined!312 (getValueByKey!417 (toList!4469 lt!378037) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!833409 () Bool)

(declare-fun Unit!28542 () Unit!28510)

(assert (=> b!833409 (= e!464882 Unit!28542)))

(declare-fun b!833410 () Bool)

(assert (=> b!833410 (= e!464883 (isDefined!312 (getValueByKey!417 (toList!4469 lt!378037) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106955 c!90793) b!833408))

(assert (= (and d!106955 (not c!90793)) b!833409))

(assert (= (and d!106955 (not res!566730)) b!833410))

(declare-fun m!778223 () Bool)

(assert (=> d!106955 m!778223))

(declare-fun m!778225 () Bool)

(assert (=> b!833408 m!778225))

(declare-fun m!778227 () Bool)

(assert (=> b!833408 m!778227))

(assert (=> b!833408 m!778227))

(declare-fun m!778229 () Bool)

(assert (=> b!833408 m!778229))

(assert (=> b!833410 m!778227))

(assert (=> b!833410 m!778227))

(assert (=> b!833410 m!778229))

(assert (=> d!106715 d!106955))

(assert (=> d!106715 d!106633))

(declare-fun d!106957 () Bool)

(declare-fun e!464885 () Bool)

(assert (=> d!106957 e!464885))

(declare-fun res!566731 () Bool)

(assert (=> d!106957 (=> res!566731 e!464885)))

(declare-fun lt!378249 () Bool)

(assert (=> d!106957 (= res!566731 (not lt!378249))))

(declare-fun lt!378252 () Bool)

(assert (=> d!106957 (= lt!378249 lt!378252)))

(declare-fun lt!378250 () Unit!28510)

(declare-fun e!464884 () Unit!28510)

(assert (=> d!106957 (= lt!378250 e!464884)))

(declare-fun c!90794 () Bool)

(assert (=> d!106957 (= c!90794 lt!378252)))

(assert (=> d!106957 (= lt!378252 (containsKey!402 (toList!4469 (+!1991 lt!378083 (tuple2!10083 lt!378082 lt!378086))) lt!378084))))

(assert (=> d!106957 (= (contains!4189 (+!1991 lt!378083 (tuple2!10083 lt!378082 lt!378086)) lt!378084) lt!378249)))

(declare-fun b!833411 () Bool)

(declare-fun lt!378251 () Unit!28510)

(assert (=> b!833411 (= e!464884 lt!378251)))

(assert (=> b!833411 (= lt!378251 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 (+!1991 lt!378083 (tuple2!10083 lt!378082 lt!378086))) lt!378084))))

(assert (=> b!833411 (isDefined!312 (getValueByKey!417 (toList!4469 (+!1991 lt!378083 (tuple2!10083 lt!378082 lt!378086))) lt!378084))))

(declare-fun b!833412 () Bool)

(declare-fun Unit!28543 () Unit!28510)

(assert (=> b!833412 (= e!464884 Unit!28543)))

(declare-fun b!833413 () Bool)

(assert (=> b!833413 (= e!464885 (isDefined!312 (getValueByKey!417 (toList!4469 (+!1991 lt!378083 (tuple2!10083 lt!378082 lt!378086))) lt!378084)))))

(assert (= (and d!106957 c!90794) b!833411))

(assert (= (and d!106957 (not c!90794)) b!833412))

(assert (= (and d!106957 (not res!566731)) b!833413))

(declare-fun m!778231 () Bool)

(assert (=> d!106957 m!778231))

(declare-fun m!778233 () Bool)

(assert (=> b!833411 m!778233))

(declare-fun m!778235 () Bool)

(assert (=> b!833411 m!778235))

(assert (=> b!833411 m!778235))

(declare-fun m!778237 () Bool)

(assert (=> b!833411 m!778237))

(assert (=> b!833413 m!778235))

(assert (=> b!833413 m!778235))

(assert (=> b!833413 m!778237))

(assert (=> b!833092 d!106957))

(declare-fun d!106959 () Bool)

(declare-fun c!90795 () Bool)

(assert (=> d!106959 (= c!90795 ((_ is ValueCellFull!7190) (select (arr!22332 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!464886 () V!25283)

(assert (=> d!106959 (= (get!11826 (select (arr!22332 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)) e!464886)))

(declare-fun b!833414 () Bool)

(assert (=> b!833414 (= e!464886 (get!11828 (select (arr!22332 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!833415 () Bool)

(assert (=> b!833415 (= e!464886 (get!11829 (select (arr!22332 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106959 c!90795) b!833414))

(assert (= (and d!106959 (not c!90795)) b!833415))

(assert (=> b!833414 m!777481))

(assert (=> b!833414 m!777109))

(declare-fun m!778239 () Bool)

(assert (=> b!833414 m!778239))

(assert (=> b!833415 m!777481))

(assert (=> b!833415 m!777109))

(declare-fun m!778241 () Bool)

(assert (=> b!833415 m!778241))

(assert (=> b!833092 d!106959))

(declare-fun d!106961 () Bool)

(declare-fun e!464887 () Bool)

(assert (=> d!106961 e!464887))

(declare-fun res!566733 () Bool)

(assert (=> d!106961 (=> (not res!566733) (not e!464887))))

(declare-fun lt!378256 () ListLongMap!8907)

(assert (=> d!106961 (= res!566733 (contains!4189 lt!378256 (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11826 (select (arr!22332 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!378255 () List!15852)

(assert (=> d!106961 (= lt!378256 (ListLongMap!8908 lt!378255))))

(declare-fun lt!378253 () Unit!28510)

(declare-fun lt!378254 () Unit!28510)

(assert (=> d!106961 (= lt!378253 lt!378254)))

(assert (=> d!106961 (= (getValueByKey!417 lt!378255 (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11826 (select (arr!22332 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!422 (_2!5052 (tuple2!10083 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11826 (select (arr!22332 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!106961 (= lt!378254 (lemmaContainsTupThenGetReturnValue!231 lt!378255 (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11826 (select (arr!22332 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5052 (tuple2!10083 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11826 (select (arr!22332 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!106961 (= lt!378255 (insertStrictlySorted!270 (toList!4469 call!36456) (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11826 (select (arr!22332 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5052 (tuple2!10083 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11826 (select (arr!22332 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!106961 (= (+!1991 call!36456 (tuple2!10083 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11826 (select (arr!22332 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!378256)))

(declare-fun b!833416 () Bool)

(declare-fun res!566732 () Bool)

(assert (=> b!833416 (=> (not res!566732) (not e!464887))))

(assert (=> b!833416 (= res!566732 (= (getValueByKey!417 (toList!4469 lt!378256) (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11826 (select (arr!22332 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!422 (_2!5052 (tuple2!10083 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11826 (select (arr!22332 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!833417 () Bool)

(assert (=> b!833417 (= e!464887 (contains!4190 (toList!4469 lt!378256) (tuple2!10083 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11826 (select (arr!22332 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!106961 res!566733) b!833416))

(assert (= (and b!833416 res!566732) b!833417))

(declare-fun m!778243 () Bool)

(assert (=> d!106961 m!778243))

(declare-fun m!778245 () Bool)

(assert (=> d!106961 m!778245))

(declare-fun m!778247 () Bool)

(assert (=> d!106961 m!778247))

(declare-fun m!778249 () Bool)

(assert (=> d!106961 m!778249))

(declare-fun m!778251 () Bool)

(assert (=> b!833416 m!778251))

(declare-fun m!778253 () Bool)

(assert (=> b!833417 m!778253))

(assert (=> b!833092 d!106961))

(declare-fun d!106963 () Bool)

(declare-fun e!464888 () Bool)

(assert (=> d!106963 e!464888))

(declare-fun res!566735 () Bool)

(assert (=> d!106963 (=> (not res!566735) (not e!464888))))

(declare-fun lt!378260 () ListLongMap!8907)

(assert (=> d!106963 (= res!566735 (contains!4189 lt!378260 (_1!5052 (tuple2!10083 lt!378082 lt!378086))))))

(declare-fun lt!378259 () List!15852)

(assert (=> d!106963 (= lt!378260 (ListLongMap!8908 lt!378259))))

(declare-fun lt!378257 () Unit!28510)

(declare-fun lt!378258 () Unit!28510)

(assert (=> d!106963 (= lt!378257 lt!378258)))

(assert (=> d!106963 (= (getValueByKey!417 lt!378259 (_1!5052 (tuple2!10083 lt!378082 lt!378086))) (Some!422 (_2!5052 (tuple2!10083 lt!378082 lt!378086))))))

(assert (=> d!106963 (= lt!378258 (lemmaContainsTupThenGetReturnValue!231 lt!378259 (_1!5052 (tuple2!10083 lt!378082 lt!378086)) (_2!5052 (tuple2!10083 lt!378082 lt!378086))))))

(assert (=> d!106963 (= lt!378259 (insertStrictlySorted!270 (toList!4469 lt!378083) (_1!5052 (tuple2!10083 lt!378082 lt!378086)) (_2!5052 (tuple2!10083 lt!378082 lt!378086))))))

(assert (=> d!106963 (= (+!1991 lt!378083 (tuple2!10083 lt!378082 lt!378086)) lt!378260)))

(declare-fun b!833418 () Bool)

(declare-fun res!566734 () Bool)

(assert (=> b!833418 (=> (not res!566734) (not e!464888))))

(assert (=> b!833418 (= res!566734 (= (getValueByKey!417 (toList!4469 lt!378260) (_1!5052 (tuple2!10083 lt!378082 lt!378086))) (Some!422 (_2!5052 (tuple2!10083 lt!378082 lt!378086)))))))

(declare-fun b!833419 () Bool)

(assert (=> b!833419 (= e!464888 (contains!4190 (toList!4469 lt!378260) (tuple2!10083 lt!378082 lt!378086)))))

(assert (= (and d!106963 res!566735) b!833418))

(assert (= (and b!833418 res!566734) b!833419))

(declare-fun m!778255 () Bool)

(assert (=> d!106963 m!778255))

(declare-fun m!778257 () Bool)

(assert (=> d!106963 m!778257))

(declare-fun m!778259 () Bool)

(assert (=> d!106963 m!778259))

(declare-fun m!778261 () Bool)

(assert (=> d!106963 m!778261))

(declare-fun m!778263 () Bool)

(assert (=> b!833418 m!778263))

(declare-fun m!778265 () Bool)

(assert (=> b!833419 m!778265))

(assert (=> b!833092 d!106963))

(declare-fun d!106965 () Bool)

(assert (=> d!106965 (not (contains!4189 (+!1991 lt!378083 (tuple2!10083 lt!378082 lt!378086)) lt!378084))))

(declare-fun lt!378261 () Unit!28510)

(assert (=> d!106965 (= lt!378261 (choose!1432 lt!378083 lt!378082 lt!378086 lt!378084))))

(declare-fun e!464889 () Bool)

(assert (=> d!106965 e!464889))

(declare-fun res!566736 () Bool)

(assert (=> d!106965 (=> (not res!566736) (not e!464889))))

(assert (=> d!106965 (= res!566736 (not (contains!4189 lt!378083 lt!378084)))))

(assert (=> d!106965 (= (addStillNotContains!200 lt!378083 lt!378082 lt!378086 lt!378084) lt!378261)))

(declare-fun b!833420 () Bool)

(assert (=> b!833420 (= e!464889 (not (= lt!378082 lt!378084)))))

(assert (= (and d!106965 res!566736) b!833420))

(assert (=> d!106965 m!777661))

(assert (=> d!106965 m!777661))

(assert (=> d!106965 m!777663))

(declare-fun m!778267 () Bool)

(assert (=> d!106965 m!778267))

(declare-fun m!778269 () Bool)

(assert (=> d!106965 m!778269))

(assert (=> b!833092 d!106965))

(declare-fun d!106967 () Bool)

(declare-fun c!90796 () Bool)

(assert (=> d!106967 (= c!90796 (and ((_ is Cons!15848) (t!22212 (toList!4469 lt!377819))) (= (_1!5052 (h!16984 (t!22212 (toList!4469 lt!377819)))) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!464890 () Option!423)

(assert (=> d!106967 (= (getValueByKey!417 (t!22212 (toList!4469 lt!377819)) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!464890)))

(declare-fun b!833423 () Bool)

(declare-fun e!464891 () Option!423)

(assert (=> b!833423 (= e!464891 (getValueByKey!417 (t!22212 (t!22212 (toList!4469 lt!377819))) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!833424 () Bool)

(assert (=> b!833424 (= e!464891 None!421)))

(declare-fun b!833422 () Bool)

(assert (=> b!833422 (= e!464890 e!464891)))

(declare-fun c!90797 () Bool)

(assert (=> b!833422 (= c!90797 (and ((_ is Cons!15848) (t!22212 (toList!4469 lt!377819))) (not (= (_1!5052 (h!16984 (t!22212 (toList!4469 lt!377819)))) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun b!833421 () Bool)

(assert (=> b!833421 (= e!464890 (Some!422 (_2!5052 (h!16984 (t!22212 (toList!4469 lt!377819))))))))

(assert (= (and d!106967 c!90796) b!833421))

(assert (= (and d!106967 (not c!90796)) b!833422))

(assert (= (and b!833422 c!90797) b!833423))

(assert (= (and b!833422 (not c!90797)) b!833424))

(declare-fun m!778271 () Bool)

(assert (=> b!833423 m!778271))

(assert (=> b!833238 d!106967))

(declare-fun d!106969 () Bool)

(assert (=> d!106969 (= (isEmpty!663 lt!378037) (isEmpty!664 (toList!4469 lt!378037)))))

(declare-fun bs!23304 () Bool)

(assert (= bs!23304 d!106969))

(declare-fun m!778273 () Bool)

(assert (=> bs!23304 m!778273))

(assert (=> b!833025 d!106969))

(declare-fun d!106971 () Bool)

(declare-fun res!566737 () Bool)

(declare-fun e!464892 () Bool)

(assert (=> d!106971 (=> res!566737 e!464892)))

(assert (=> d!106971 (= res!566737 (and ((_ is Cons!15848) (toList!4469 lt!377925)) (= (_1!5052 (h!16984 (toList!4469 lt!377925))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106971 (= (containsKey!402 (toList!4469 lt!377925) #b0000000000000000000000000000000000000000000000000000000000000000) e!464892)))

(declare-fun b!833425 () Bool)

(declare-fun e!464893 () Bool)

(assert (=> b!833425 (= e!464892 e!464893)))

(declare-fun res!566738 () Bool)

(assert (=> b!833425 (=> (not res!566738) (not e!464893))))

(assert (=> b!833425 (= res!566738 (and (or (not ((_ is Cons!15848) (toList!4469 lt!377925))) (bvsle (_1!5052 (h!16984 (toList!4469 lt!377925))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15848) (toList!4469 lt!377925)) (bvslt (_1!5052 (h!16984 (toList!4469 lt!377925))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!833426 () Bool)

(assert (=> b!833426 (= e!464893 (containsKey!402 (t!22212 (toList!4469 lt!377925)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!106971 (not res!566737)) b!833425))

(assert (= (and b!833425 res!566738) b!833426))

(declare-fun m!778275 () Bool)

(assert (=> b!833426 m!778275))

(assert (=> d!106847 d!106971))

(declare-fun d!106973 () Bool)

(assert (=> d!106973 (= (isDefined!312 (getValueByKey!417 (toList!4469 lt!377925) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!665 (getValueByKey!417 (toList!4469 lt!377925) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23305 () Bool)

(assert (= bs!23305 d!106973))

(assert (=> bs!23305 m!777441))

(declare-fun m!778277 () Bool)

(assert (=> bs!23305 m!778277))

(assert (=> b!833159 d!106973))

(declare-fun d!106975 () Bool)

(declare-fun c!90798 () Bool)

(assert (=> d!106975 (= c!90798 (and ((_ is Cons!15848) (toList!4469 lt!377925)) (= (_1!5052 (h!16984 (toList!4469 lt!377925))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!464894 () Option!423)

(assert (=> d!106975 (= (getValueByKey!417 (toList!4469 lt!377925) #b1000000000000000000000000000000000000000000000000000000000000000) e!464894)))

(declare-fun b!833429 () Bool)

(declare-fun e!464895 () Option!423)

(assert (=> b!833429 (= e!464895 (getValueByKey!417 (t!22212 (toList!4469 lt!377925)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!833430 () Bool)

(assert (=> b!833430 (= e!464895 None!421)))

(declare-fun b!833428 () Bool)

(assert (=> b!833428 (= e!464894 e!464895)))

(declare-fun c!90799 () Bool)

(assert (=> b!833428 (= c!90799 (and ((_ is Cons!15848) (toList!4469 lt!377925)) (not (= (_1!5052 (h!16984 (toList!4469 lt!377925))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!833427 () Bool)

(assert (=> b!833427 (= e!464894 (Some!422 (_2!5052 (h!16984 (toList!4469 lt!377925)))))))

(assert (= (and d!106975 c!90798) b!833427))

(assert (= (and d!106975 (not c!90798)) b!833428))

(assert (= (and b!833428 c!90799) b!833429))

(assert (= (and b!833428 (not c!90799)) b!833430))

(declare-fun m!778279 () Bool)

(assert (=> b!833429 m!778279))

(assert (=> b!833159 d!106975))

(declare-fun d!106977 () Bool)

(declare-fun c!90800 () Bool)

(assert (=> d!106977 (= c!90800 (and ((_ is Cons!15848) (toList!4469 lt!378056)) (= (_1!5052 (h!16984 (toList!4469 lt!378056))) (_1!5052 (tuple2!10083 lt!377928 minValue!754)))))))

(declare-fun e!464896 () Option!423)

(assert (=> d!106977 (= (getValueByKey!417 (toList!4469 lt!378056) (_1!5052 (tuple2!10083 lt!377928 minValue!754))) e!464896)))

(declare-fun b!833433 () Bool)

(declare-fun e!464897 () Option!423)

(assert (=> b!833433 (= e!464897 (getValueByKey!417 (t!22212 (toList!4469 lt!378056)) (_1!5052 (tuple2!10083 lt!377928 minValue!754))))))

(declare-fun b!833434 () Bool)

(assert (=> b!833434 (= e!464897 None!421)))

(declare-fun b!833432 () Bool)

(assert (=> b!833432 (= e!464896 e!464897)))

(declare-fun c!90801 () Bool)

(assert (=> b!833432 (= c!90801 (and ((_ is Cons!15848) (toList!4469 lt!378056)) (not (= (_1!5052 (h!16984 (toList!4469 lt!378056))) (_1!5052 (tuple2!10083 lt!377928 minValue!754))))))))

(declare-fun b!833431 () Bool)

(assert (=> b!833431 (= e!464896 (Some!422 (_2!5052 (h!16984 (toList!4469 lt!378056)))))))

(assert (= (and d!106977 c!90800) b!833431))

(assert (= (and d!106977 (not c!90800)) b!833432))

(assert (= (and b!833432 c!90801) b!833433))

(assert (= (and b!833432 (not c!90801)) b!833434))

(declare-fun m!778281 () Bool)

(assert (=> b!833433 m!778281))

(assert (=> b!833050 d!106977))

(declare-fun d!106979 () Bool)

(declare-fun res!566739 () Bool)

(declare-fun e!464898 () Bool)

(assert (=> d!106979 (=> res!566739 e!464898)))

(assert (=> d!106979 (= res!566739 (or ((_ is Nil!15849) lt!378129) ((_ is Nil!15849) (t!22212 lt!378129))))))

(assert (=> d!106979 (= (isStrictlySorted!430 lt!378129) e!464898)))

(declare-fun b!833435 () Bool)

(declare-fun e!464899 () Bool)

(assert (=> b!833435 (= e!464898 e!464899)))

(declare-fun res!566740 () Bool)

(assert (=> b!833435 (=> (not res!566740) (not e!464899))))

(assert (=> b!833435 (= res!566740 (bvslt (_1!5052 (h!16984 lt!378129)) (_1!5052 (h!16984 (t!22212 lt!378129)))))))

(declare-fun b!833436 () Bool)

(assert (=> b!833436 (= e!464899 (isStrictlySorted!430 (t!22212 lt!378129)))))

(assert (= (and d!106979 (not res!566739)) b!833435))

(assert (= (and b!833435 res!566740) b!833436))

(declare-fun m!778283 () Bool)

(assert (=> b!833436 m!778283))

(assert (=> d!106813 d!106979))

(declare-fun d!106981 () Bool)

(declare-fun res!566741 () Bool)

(declare-fun e!464900 () Bool)

(assert (=> d!106981 (=> res!566741 e!464900)))

(assert (=> d!106981 (= res!566741 (or ((_ is Nil!15849) (toList!4469 lt!377760)) ((_ is Nil!15849) (t!22212 (toList!4469 lt!377760)))))))

(assert (=> d!106981 (= (isStrictlySorted!430 (toList!4469 lt!377760)) e!464900)))

(declare-fun b!833437 () Bool)

(declare-fun e!464901 () Bool)

(assert (=> b!833437 (= e!464900 e!464901)))

(declare-fun res!566742 () Bool)

(assert (=> b!833437 (=> (not res!566742) (not e!464901))))

(assert (=> b!833437 (= res!566742 (bvslt (_1!5052 (h!16984 (toList!4469 lt!377760))) (_1!5052 (h!16984 (t!22212 (toList!4469 lt!377760))))))))

(declare-fun b!833438 () Bool)

(assert (=> b!833438 (= e!464901 (isStrictlySorted!430 (t!22212 (toList!4469 lt!377760))))))

(assert (= (and d!106981 (not res!566741)) b!833437))

(assert (= (and b!833437 res!566742) b!833438))

(declare-fun m!778285 () Bool)

(assert (=> b!833438 m!778285))

(assert (=> d!106813 d!106981))

(declare-fun d!106983 () Bool)

(declare-fun lt!378262 () Bool)

(assert (=> d!106983 (= lt!378262 (select (content!388 lt!378079) (tuple2!10083 (_1!5052 lt!377761) (_2!5052 lt!377761))))))

(declare-fun e!464903 () Bool)

(assert (=> d!106983 (= lt!378262 e!464903)))

(declare-fun res!566744 () Bool)

(assert (=> d!106983 (=> (not res!566744) (not e!464903))))

(assert (=> d!106983 (= res!566744 ((_ is Cons!15848) lt!378079))))

(assert (=> d!106983 (= (contains!4190 lt!378079 (tuple2!10083 (_1!5052 lt!377761) (_2!5052 lt!377761))) lt!378262)))

(declare-fun b!833439 () Bool)

(declare-fun e!464902 () Bool)

(assert (=> b!833439 (= e!464903 e!464902)))

(declare-fun res!566743 () Bool)

(assert (=> b!833439 (=> res!566743 e!464902)))

(assert (=> b!833439 (= res!566743 (= (h!16984 lt!378079) (tuple2!10083 (_1!5052 lt!377761) (_2!5052 lt!377761))))))

(declare-fun b!833440 () Bool)

(assert (=> b!833440 (= e!464902 (contains!4190 (t!22212 lt!378079) (tuple2!10083 (_1!5052 lt!377761) (_2!5052 lt!377761))))))

(assert (= (and d!106983 res!566744) b!833439))

(assert (= (and b!833439 (not res!566743)) b!833440))

(declare-fun m!778287 () Bool)

(assert (=> d!106983 m!778287))

(declare-fun m!778289 () Bool)

(assert (=> d!106983 m!778289))

(declare-fun m!778291 () Bool)

(assert (=> b!833440 m!778291))

(assert (=> b!833076 d!106983))

(declare-fun e!464905 () List!15852)

(declare-fun c!90802 () Bool)

(declare-fun call!36481 () List!15852)

(declare-fun bm!36477 () Bool)

(assert (=> bm!36477 (= call!36481 ($colon$colon!534 e!464905 (ite c!90802 (h!16984 (t!22212 (toList!4469 (+!1991 lt!377760 lt!377761)))) (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756)))))))

(declare-fun c!90805 () Bool)

(assert (=> bm!36477 (= c!90805 c!90802)))

(declare-fun bm!36478 () Bool)

(declare-fun call!36482 () List!15852)

(assert (=> bm!36478 (= call!36482 call!36481)))

(declare-fun bm!36479 () Bool)

(declare-fun call!36480 () List!15852)

(assert (=> bm!36479 (= call!36480 call!36482)))

(declare-fun b!833441 () Bool)

(declare-fun c!90803 () Bool)

(assert (=> b!833441 (= c!90803 (and ((_ is Cons!15848) (t!22212 (toList!4469 (+!1991 lt!377760 lt!377761)))) (bvsgt (_1!5052 (h!16984 (t!22212 (toList!4469 (+!1991 lt!377760 lt!377761))))) (_1!5052 lt!377756))))))

(declare-fun e!464904 () List!15852)

(declare-fun e!464907 () List!15852)

(assert (=> b!833441 (= e!464904 e!464907)))

(declare-fun b!833442 () Bool)

(assert (=> b!833442 (= e!464907 call!36480)))

(declare-fun b!833443 () Bool)

(assert (=> b!833443 (= e!464905 (insertStrictlySorted!270 (t!22212 (t!22212 (toList!4469 (+!1991 lt!377760 lt!377761)))) (_1!5052 lt!377756) (_2!5052 lt!377756)))))

(declare-fun b!833444 () Bool)

(declare-fun e!464906 () List!15852)

(assert (=> b!833444 (= e!464906 call!36481)))

(declare-fun b!833445 () Bool)

(declare-fun e!464908 () Bool)

(declare-fun lt!378263 () List!15852)

(assert (=> b!833445 (= e!464908 (contains!4190 lt!378263 (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))))))

(declare-fun c!90804 () Bool)

(declare-fun b!833446 () Bool)

(assert (=> b!833446 (= e!464905 (ite c!90804 (t!22212 (t!22212 (toList!4469 (+!1991 lt!377760 lt!377761)))) (ite c!90803 (Cons!15848 (h!16984 (t!22212 (toList!4469 (+!1991 lt!377760 lt!377761)))) (t!22212 (t!22212 (toList!4469 (+!1991 lt!377760 lt!377761))))) Nil!15849)))))

(declare-fun b!833447 () Bool)

(assert (=> b!833447 (= e!464906 e!464904)))

(assert (=> b!833447 (= c!90804 (and ((_ is Cons!15848) (t!22212 (toList!4469 (+!1991 lt!377760 lt!377761)))) (= (_1!5052 (h!16984 (t!22212 (toList!4469 (+!1991 lt!377760 lt!377761))))) (_1!5052 lt!377756))))))

(declare-fun b!833448 () Bool)

(assert (=> b!833448 (= e!464904 call!36482)))

(declare-fun b!833449 () Bool)

(declare-fun res!566746 () Bool)

(assert (=> b!833449 (=> (not res!566746) (not e!464908))))

(assert (=> b!833449 (= res!566746 (containsKey!402 lt!378263 (_1!5052 lt!377756)))))

(declare-fun d!106985 () Bool)

(assert (=> d!106985 e!464908))

(declare-fun res!566745 () Bool)

(assert (=> d!106985 (=> (not res!566745) (not e!464908))))

(assert (=> d!106985 (= res!566745 (isStrictlySorted!430 lt!378263))))

(assert (=> d!106985 (= lt!378263 e!464906)))

(assert (=> d!106985 (= c!90802 (and ((_ is Cons!15848) (t!22212 (toList!4469 (+!1991 lt!377760 lt!377761)))) (bvslt (_1!5052 (h!16984 (t!22212 (toList!4469 (+!1991 lt!377760 lt!377761))))) (_1!5052 lt!377756))))))

(assert (=> d!106985 (isStrictlySorted!430 (t!22212 (toList!4469 (+!1991 lt!377760 lt!377761))))))

(assert (=> d!106985 (= (insertStrictlySorted!270 (t!22212 (toList!4469 (+!1991 lt!377760 lt!377761))) (_1!5052 lt!377756) (_2!5052 lt!377756)) lt!378263)))

(declare-fun b!833450 () Bool)

(assert (=> b!833450 (= e!464907 call!36480)))

(assert (= (and d!106985 c!90802) b!833444))

(assert (= (and d!106985 (not c!90802)) b!833447))

(assert (= (and b!833447 c!90804) b!833448))

(assert (= (and b!833447 (not c!90804)) b!833441))

(assert (= (and b!833441 c!90803) b!833442))

(assert (= (and b!833441 (not c!90803)) b!833450))

(assert (= (or b!833442 b!833450) bm!36479))

(assert (= (or b!833448 bm!36479) bm!36478))

(assert (= (or b!833444 bm!36478) bm!36477))

(assert (= (and bm!36477 c!90805) b!833443))

(assert (= (and bm!36477 (not c!90805)) b!833446))

(assert (= (and d!106985 res!566745) b!833449))

(assert (= (and b!833449 res!566746) b!833445))

(declare-fun m!778293 () Bool)

(assert (=> bm!36477 m!778293))

(declare-fun m!778295 () Bool)

(assert (=> b!833445 m!778295))

(declare-fun m!778297 () Bool)

(assert (=> b!833443 m!778297))

(declare-fun m!778299 () Bool)

(assert (=> b!833449 m!778299))

(declare-fun m!778301 () Bool)

(assert (=> d!106985 m!778301))

(declare-fun m!778303 () Bool)

(assert (=> d!106985 m!778303))

(assert (=> b!833314 d!106985))

(declare-fun d!106987 () Bool)

(declare-fun c!90806 () Bool)

(assert (=> d!106987 (= c!90806 (and ((_ is Cons!15848) (t!22212 (toList!4469 lt!377871))) (= (_1!5052 (h!16984 (t!22212 (toList!4469 lt!377871)))) (_1!5052 lt!377761))))))

(declare-fun e!464909 () Option!423)

(assert (=> d!106987 (= (getValueByKey!417 (t!22212 (toList!4469 lt!377871)) (_1!5052 lt!377761)) e!464909)))

(declare-fun b!833453 () Bool)

(declare-fun e!464910 () Option!423)

(assert (=> b!833453 (= e!464910 (getValueByKey!417 (t!22212 (t!22212 (toList!4469 lt!377871))) (_1!5052 lt!377761)))))

(declare-fun b!833454 () Bool)

(assert (=> b!833454 (= e!464910 None!421)))

(declare-fun b!833452 () Bool)

(assert (=> b!833452 (= e!464909 e!464910)))

(declare-fun c!90807 () Bool)

(assert (=> b!833452 (= c!90807 (and ((_ is Cons!15848) (t!22212 (toList!4469 lt!377871))) (not (= (_1!5052 (h!16984 (t!22212 (toList!4469 lt!377871)))) (_1!5052 lt!377761)))))))

(declare-fun b!833451 () Bool)

(assert (=> b!833451 (= e!464909 (Some!422 (_2!5052 (h!16984 (t!22212 (toList!4469 lt!377871))))))))

(assert (= (and d!106987 c!90806) b!833451))

(assert (= (and d!106987 (not c!90806)) b!833452))

(assert (= (and b!833452 c!90807) b!833453))

(assert (= (and b!833452 (not c!90807)) b!833454))

(declare-fun m!778305 () Bool)

(assert (=> b!833453 m!778305))

(assert (=> b!833130 d!106987))

(declare-fun d!106989 () Bool)

(declare-fun c!90808 () Bool)

(assert (=> d!106989 (= c!90808 (and ((_ is Cons!15848) (t!22212 lt!377966)) (= (_1!5052 (h!16984 (t!22212 lt!377966))) (_1!5052 lt!377756))))))

(declare-fun e!464911 () Option!423)

(assert (=> d!106989 (= (getValueByKey!417 (t!22212 lt!377966) (_1!5052 lt!377756)) e!464911)))

(declare-fun b!833457 () Bool)

(declare-fun e!464912 () Option!423)

(assert (=> b!833457 (= e!464912 (getValueByKey!417 (t!22212 (t!22212 lt!377966)) (_1!5052 lt!377756)))))

(declare-fun b!833458 () Bool)

(assert (=> b!833458 (= e!464912 None!421)))

(declare-fun b!833456 () Bool)

(assert (=> b!833456 (= e!464911 e!464912)))

(declare-fun c!90809 () Bool)

(assert (=> b!833456 (= c!90809 (and ((_ is Cons!15848) (t!22212 lt!377966)) (not (= (_1!5052 (h!16984 (t!22212 lt!377966))) (_1!5052 lt!377756)))))))

(declare-fun b!833455 () Bool)

(assert (=> b!833455 (= e!464911 (Some!422 (_2!5052 (h!16984 (t!22212 lt!377966)))))))

(assert (= (and d!106989 c!90808) b!833455))

(assert (= (and d!106989 (not c!90808)) b!833456))

(assert (= (and b!833456 c!90809) b!833457))

(assert (= (and b!833456 (not c!90809)) b!833458))

(declare-fun m!778307 () Bool)

(assert (=> b!833457 m!778307))

(assert (=> b!833308 d!106989))

(declare-fun d!106991 () Bool)

(declare-fun lt!378264 () Bool)

(assert (=> d!106991 (= lt!378264 (select (content!388 lt!377818) (tuple2!10083 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!464914 () Bool)

(assert (=> d!106991 (= lt!378264 e!464914)))

(declare-fun res!566748 () Bool)

(assert (=> d!106991 (=> (not res!566748) (not e!464914))))

(assert (=> d!106991 (= res!566748 ((_ is Cons!15848) lt!377818))))

(assert (=> d!106991 (= (contains!4190 lt!377818 (tuple2!10083 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) lt!378264)))

(declare-fun b!833459 () Bool)

(declare-fun e!464913 () Bool)

(assert (=> b!833459 (= e!464914 e!464913)))

(declare-fun res!566747 () Bool)

(assert (=> b!833459 (=> res!566747 e!464913)))

(assert (=> b!833459 (= res!566747 (= (h!16984 lt!377818) (tuple2!10083 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!833460 () Bool)

(assert (=> b!833460 (= e!464913 (contains!4190 (t!22212 lt!377818) (tuple2!10083 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (= (and d!106991 res!566748) b!833459))

(assert (= (and b!833459 (not res!566747)) b!833460))

(declare-fun m!778309 () Bool)

(assert (=> d!106991 m!778309))

(declare-fun m!778311 () Bool)

(assert (=> d!106991 m!778311))

(declare-fun m!778313 () Bool)

(assert (=> b!833460 m!778313))

(assert (=> b!833140 d!106991))

(assert (=> d!106681 d!106665))

(assert (=> d!106681 d!106675))

(declare-fun d!106993 () Bool)

(assert (=> d!106993 (contains!4189 (+!1991 lt!377958 (tuple2!10083 lt!377957 zeroValueAfter!34)) lt!377948)))

(assert (=> d!106993 true))

(declare-fun _$35!428 () Unit!28510)

(assert (=> d!106993 (= (choose!1431 lt!377958 lt!377957 zeroValueAfter!34 lt!377948) _$35!428)))

(declare-fun bs!23306 () Bool)

(assert (= bs!23306 d!106993))

(assert (=> bs!23306 m!777263))

(assert (=> bs!23306 m!777263))

(assert (=> bs!23306 m!777265))

(assert (=> d!106681 d!106993))

(declare-fun d!106995 () Bool)

(declare-fun e!464916 () Bool)

(assert (=> d!106995 e!464916))

(declare-fun res!566749 () Bool)

(assert (=> d!106995 (=> res!566749 e!464916)))

(declare-fun lt!378265 () Bool)

(assert (=> d!106995 (= res!566749 (not lt!378265))))

(declare-fun lt!378268 () Bool)

(assert (=> d!106995 (= lt!378265 lt!378268)))

(declare-fun lt!378266 () Unit!28510)

(declare-fun e!464915 () Unit!28510)

(assert (=> d!106995 (= lt!378266 e!464915)))

(declare-fun c!90810 () Bool)

(assert (=> d!106995 (= c!90810 lt!378268)))

(assert (=> d!106995 (= lt!378268 (containsKey!402 (toList!4469 lt!377958) lt!377948))))

(assert (=> d!106995 (= (contains!4189 lt!377958 lt!377948) lt!378265)))

(declare-fun b!833462 () Bool)

(declare-fun lt!378267 () Unit!28510)

(assert (=> b!833462 (= e!464915 lt!378267)))

(assert (=> b!833462 (= lt!378267 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377958) lt!377948))))

(assert (=> b!833462 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377958) lt!377948))))

(declare-fun b!833463 () Bool)

(declare-fun Unit!28544 () Unit!28510)

(assert (=> b!833463 (= e!464915 Unit!28544)))

(declare-fun b!833464 () Bool)

(assert (=> b!833464 (= e!464916 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377958) lt!377948)))))

(assert (= (and d!106995 c!90810) b!833462))

(assert (= (and d!106995 (not c!90810)) b!833463))

(assert (= (and d!106995 (not res!566749)) b!833464))

(declare-fun m!778315 () Bool)

(assert (=> d!106995 m!778315))

(declare-fun m!778317 () Bool)

(assert (=> b!833462 m!778317))

(declare-fun m!778319 () Bool)

(assert (=> b!833462 m!778319))

(assert (=> b!833462 m!778319))

(declare-fun m!778321 () Bool)

(assert (=> b!833462 m!778321))

(assert (=> b!833464 m!778319))

(assert (=> b!833464 m!778319))

(assert (=> b!833464 m!778321))

(assert (=> d!106681 d!106995))

(declare-fun d!106997 () Bool)

(assert (=> d!106997 (= (isDefined!312 (getValueByKey!417 (toList!4469 lt!377871) (_1!5052 lt!377761))) (not (isEmpty!665 (getValueByKey!417 (toList!4469 lt!377871) (_1!5052 lt!377761)))))))

(declare-fun bs!23307 () Bool)

(assert (= bs!23307 d!106997))

(assert (=> bs!23307 m!777165))

(declare-fun m!778323 () Bool)

(assert (=> bs!23307 m!778323))

(assert (=> b!833065 d!106997))

(assert (=> b!833065 d!106789))

(assert (=> d!106885 d!106883))

(declare-fun d!106999 () Bool)

(assert (=> d!106999 (= (getValueByKey!417 lt!377814 (_1!5052 lt!377756)) (Some!422 (_2!5052 lt!377756)))))

(assert (=> d!106999 true))

(declare-fun _$22!577 () Unit!28510)

(assert (=> d!106999 (= (choose!1429 lt!377814 (_1!5052 lt!377756) (_2!5052 lt!377756)) _$22!577)))

(declare-fun bs!23308 () Bool)

(assert (= bs!23308 d!106999))

(assert (=> bs!23308 m!777047))

(assert (=> d!106885 d!106999))

(declare-fun d!107001 () Bool)

(declare-fun res!566750 () Bool)

(declare-fun e!464917 () Bool)

(assert (=> d!107001 (=> res!566750 e!464917)))

(assert (=> d!107001 (= res!566750 (or ((_ is Nil!15849) lt!377814) ((_ is Nil!15849) (t!22212 lt!377814))))))

(assert (=> d!107001 (= (isStrictlySorted!430 lt!377814) e!464917)))

(declare-fun b!833465 () Bool)

(declare-fun e!464918 () Bool)

(assert (=> b!833465 (= e!464917 e!464918)))

(declare-fun res!566751 () Bool)

(assert (=> b!833465 (=> (not res!566751) (not e!464918))))

(assert (=> b!833465 (= res!566751 (bvslt (_1!5052 (h!16984 lt!377814)) (_1!5052 (h!16984 (t!22212 lt!377814)))))))

(declare-fun b!833466 () Bool)

(assert (=> b!833466 (= e!464918 (isStrictlySorted!430 (t!22212 lt!377814)))))

(assert (= (and d!107001 (not res!566750)) b!833465))

(assert (= (and b!833465 res!566751) b!833466))

(declare-fun m!778325 () Bool)

(assert (=> b!833466 m!778325))

(assert (=> d!106885 d!107001))

(declare-fun d!107003 () Bool)

(declare-fun c!90811 () Bool)

(assert (=> d!107003 (= c!90811 (and ((_ is Cons!15848) (t!22212 (toList!4469 lt!377823))) (= (_1!5052 (h!16984 (t!22212 (toList!4469 lt!377823)))) (_1!5052 lt!377761))))))

(declare-fun e!464919 () Option!423)

(assert (=> d!107003 (= (getValueByKey!417 (t!22212 (toList!4469 lt!377823)) (_1!5052 lt!377761)) e!464919)))

(declare-fun b!833469 () Bool)

(declare-fun e!464920 () Option!423)

(assert (=> b!833469 (= e!464920 (getValueByKey!417 (t!22212 (t!22212 (toList!4469 lt!377823))) (_1!5052 lt!377761)))))

(declare-fun b!833470 () Bool)

(assert (=> b!833470 (= e!464920 None!421)))

(declare-fun b!833468 () Bool)

(assert (=> b!833468 (= e!464919 e!464920)))

(declare-fun c!90812 () Bool)

(assert (=> b!833468 (= c!90812 (and ((_ is Cons!15848) (t!22212 (toList!4469 lt!377823))) (not (= (_1!5052 (h!16984 (t!22212 (toList!4469 lt!377823)))) (_1!5052 lt!377761)))))))

(declare-fun b!833467 () Bool)

(assert (=> b!833467 (= e!464919 (Some!422 (_2!5052 (h!16984 (t!22212 (toList!4469 lt!377823))))))))

(assert (= (and d!107003 c!90811) b!833467))

(assert (= (and d!107003 (not c!90811)) b!833468))

(assert (= (and b!833468 c!90812) b!833469))

(assert (= (and b!833468 (not c!90812)) b!833470))

(declare-fun m!778327 () Bool)

(assert (=> b!833469 m!778327))

(assert (=> b!833255 d!107003))

(declare-fun d!107005 () Bool)

(declare-fun lt!378269 () Bool)

(assert (=> d!107005 (= lt!378269 (select (content!388 lt!377874) (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))))))

(declare-fun e!464922 () Bool)

(assert (=> d!107005 (= lt!378269 e!464922)))

(declare-fun res!566753 () Bool)

(assert (=> d!107005 (=> (not res!566753) (not e!464922))))

(assert (=> d!107005 (= res!566753 ((_ is Cons!15848) lt!377874))))

(assert (=> d!107005 (= (contains!4190 lt!377874 (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))) lt!378269)))

(declare-fun b!833471 () Bool)

(declare-fun e!464921 () Bool)

(assert (=> b!833471 (= e!464922 e!464921)))

(declare-fun res!566752 () Bool)

(assert (=> b!833471 (=> res!566752 e!464921)))

(assert (=> b!833471 (= res!566752 (= (h!16984 lt!377874) (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))))))

(declare-fun b!833472 () Bool)

(assert (=> b!833472 (= e!464921 (contains!4190 (t!22212 lt!377874) (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))))))

(assert (= (and d!107005 res!566753) b!833471))

(assert (= (and b!833471 (not res!566752)) b!833472))

(declare-fun m!778329 () Bool)

(assert (=> d!107005 m!778329))

(declare-fun m!778331 () Bool)

(assert (=> d!107005 m!778331))

(declare-fun m!778333 () Bool)

(assert (=> b!833472 m!778333))

(assert (=> b!833111 d!107005))

(declare-fun d!107007 () Bool)

(declare-fun res!566754 () Bool)

(declare-fun e!464923 () Bool)

(assert (=> d!107007 (=> res!566754 e!464923)))

(assert (=> d!107007 (= res!566754 (and ((_ is Cons!15848) lt!377870) (= (_1!5052 (h!16984 lt!377870)) (_1!5052 lt!377761))))))

(assert (=> d!107007 (= (containsKey!402 lt!377870 (_1!5052 lt!377761)) e!464923)))

(declare-fun b!833473 () Bool)

(declare-fun e!464924 () Bool)

(assert (=> b!833473 (= e!464923 e!464924)))

(declare-fun res!566755 () Bool)

(assert (=> b!833473 (=> (not res!566755) (not e!464924))))

(assert (=> b!833473 (= res!566755 (and (or (not ((_ is Cons!15848) lt!377870)) (bvsle (_1!5052 (h!16984 lt!377870)) (_1!5052 lt!377761))) ((_ is Cons!15848) lt!377870) (bvslt (_1!5052 (h!16984 lt!377870)) (_1!5052 lt!377761))))))

(declare-fun b!833474 () Bool)

(assert (=> b!833474 (= e!464924 (containsKey!402 (t!22212 lt!377870) (_1!5052 lt!377761)))))

(assert (= (and d!107007 (not res!566754)) b!833473))

(assert (= (and b!833473 res!566755) b!833474))

(declare-fun m!778335 () Bool)

(assert (=> b!833474 m!778335))

(assert (=> b!833070 d!107007))

(declare-fun d!107009 () Bool)

(assert (=> d!107009 (= (isDefined!312 (getValueByKey!417 (toList!4469 lt!377947) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!665 (getValueByKey!417 (toList!4469 lt!377947) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23309 () Bool)

(assert (= bs!23309 d!107009))

(assert (=> bs!23309 m!777749))

(declare-fun m!778337 () Bool)

(assert (=> bs!23309 m!778337))

(assert (=> b!833127 d!107009))

(declare-fun d!107011 () Bool)

(declare-fun c!90813 () Bool)

(assert (=> d!107011 (= c!90813 (and ((_ is Cons!15848) (toList!4469 lt!377947)) (= (_1!5052 (h!16984 (toList!4469 lt!377947))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!464925 () Option!423)

(assert (=> d!107011 (= (getValueByKey!417 (toList!4469 lt!377947) #b0000000000000000000000000000000000000000000000000000000000000000) e!464925)))

(declare-fun b!833477 () Bool)

(declare-fun e!464926 () Option!423)

(assert (=> b!833477 (= e!464926 (getValueByKey!417 (t!22212 (toList!4469 lt!377947)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!833478 () Bool)

(assert (=> b!833478 (= e!464926 None!421)))

(declare-fun b!833476 () Bool)

(assert (=> b!833476 (= e!464925 e!464926)))

(declare-fun c!90814 () Bool)

(assert (=> b!833476 (= c!90814 (and ((_ is Cons!15848) (toList!4469 lt!377947)) (not (= (_1!5052 (h!16984 (toList!4469 lt!377947))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!833475 () Bool)

(assert (=> b!833475 (= e!464925 (Some!422 (_2!5052 (h!16984 (toList!4469 lt!377947)))))))

(assert (= (and d!107011 c!90813) b!833475))

(assert (= (and d!107011 (not c!90813)) b!833476))

(assert (= (and b!833476 c!90814) b!833477))

(assert (= (and b!833476 (not c!90814)) b!833478))

(declare-fun m!778339 () Bool)

(assert (=> b!833477 m!778339))

(assert (=> b!833127 d!107011))

(declare-fun d!107013 () Bool)

(assert (=> d!107013 (= (validKeyInArray!0 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (and (not (= (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!833084 d!107013))

(declare-fun d!107015 () Bool)

(assert (=> d!107015 (isDefined!312 (getValueByKey!417 (toList!4469 (+!1991 lt!377936 (tuple2!10083 lt!377935 zeroValueBefore!34))) lt!377926))))

(declare-fun lt!378270 () Unit!28510)

(assert (=> d!107015 (= lt!378270 (choose!1433 (toList!4469 (+!1991 lt!377936 (tuple2!10083 lt!377935 zeroValueBefore!34))) lt!377926))))

(declare-fun e!464927 () Bool)

(assert (=> d!107015 e!464927))

(declare-fun res!566756 () Bool)

(assert (=> d!107015 (=> (not res!566756) (not e!464927))))

(assert (=> d!107015 (= res!566756 (isStrictlySorted!430 (toList!4469 (+!1991 lt!377936 (tuple2!10083 lt!377935 zeroValueBefore!34)))))))

(assert (=> d!107015 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 (+!1991 lt!377936 (tuple2!10083 lt!377935 zeroValueBefore!34))) lt!377926) lt!378270)))

(declare-fun b!833479 () Bool)

(assert (=> b!833479 (= e!464927 (containsKey!402 (toList!4469 (+!1991 lt!377936 (tuple2!10083 lt!377935 zeroValueBefore!34))) lt!377926))))

(assert (= (and d!107015 res!566756) b!833479))

(assert (=> d!107015 m!777529))

(assert (=> d!107015 m!777529))

(assert (=> d!107015 m!777531))

(declare-fun m!778341 () Bool)

(assert (=> d!107015 m!778341))

(declare-fun m!778343 () Bool)

(assert (=> d!107015 m!778343))

(assert (=> b!833479 m!777525))

(assert (=> b!833047 d!107015))

(declare-fun d!107017 () Bool)

(assert (=> d!107017 (= (isDefined!312 (getValueByKey!417 (toList!4469 (+!1991 lt!377936 (tuple2!10083 lt!377935 zeroValueBefore!34))) lt!377926)) (not (isEmpty!665 (getValueByKey!417 (toList!4469 (+!1991 lt!377936 (tuple2!10083 lt!377935 zeroValueBefore!34))) lt!377926))))))

(declare-fun bs!23310 () Bool)

(assert (= bs!23310 d!107017))

(assert (=> bs!23310 m!777529))

(declare-fun m!778345 () Bool)

(assert (=> bs!23310 m!778345))

(assert (=> b!833047 d!107017))

(declare-fun c!90815 () Bool)

(declare-fun d!107019 () Bool)

(assert (=> d!107019 (= c!90815 (and ((_ is Cons!15848) (toList!4469 (+!1991 lt!377936 (tuple2!10083 lt!377935 zeroValueBefore!34)))) (= (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377936 (tuple2!10083 lt!377935 zeroValueBefore!34))))) lt!377926)))))

(declare-fun e!464928 () Option!423)

(assert (=> d!107019 (= (getValueByKey!417 (toList!4469 (+!1991 lt!377936 (tuple2!10083 lt!377935 zeroValueBefore!34))) lt!377926) e!464928)))

(declare-fun e!464929 () Option!423)

(declare-fun b!833482 () Bool)

(assert (=> b!833482 (= e!464929 (getValueByKey!417 (t!22212 (toList!4469 (+!1991 lt!377936 (tuple2!10083 lt!377935 zeroValueBefore!34)))) lt!377926))))

(declare-fun b!833483 () Bool)

(assert (=> b!833483 (= e!464929 None!421)))

(declare-fun b!833481 () Bool)

(assert (=> b!833481 (= e!464928 e!464929)))

(declare-fun c!90816 () Bool)

(assert (=> b!833481 (= c!90816 (and ((_ is Cons!15848) (toList!4469 (+!1991 lt!377936 (tuple2!10083 lt!377935 zeroValueBefore!34)))) (not (= (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377936 (tuple2!10083 lt!377935 zeroValueBefore!34))))) lt!377926))))))

(declare-fun b!833480 () Bool)

(assert (=> b!833480 (= e!464928 (Some!422 (_2!5052 (h!16984 (toList!4469 (+!1991 lt!377936 (tuple2!10083 lt!377935 zeroValueBefore!34)))))))))

(assert (= (and d!107019 c!90815) b!833480))

(assert (= (and d!107019 (not c!90815)) b!833481))

(assert (= (and b!833481 c!90816) b!833482))

(assert (= (and b!833481 (not c!90816)) b!833483))

(declare-fun m!778347 () Bool)

(assert (=> b!833482 m!778347))

(assert (=> b!833047 d!107019))

(assert (=> d!106867 d!106869))

(assert (=> d!106867 d!106863))

(declare-fun d!107021 () Bool)

(assert (=> d!107021 (not (contains!4189 (+!1991 lt!377857 (tuple2!10083 lt!377856 lt!377860)) lt!377858))))

(assert (=> d!107021 true))

(declare-fun _$36!347 () Unit!28510)

(assert (=> d!107021 (= (choose!1432 lt!377857 lt!377856 lt!377860 lt!377858) _$36!347)))

(declare-fun bs!23311 () Bool)

(assert (= bs!23311 d!107021))

(assert (=> bs!23311 m!777117))

(assert (=> bs!23311 m!777117))

(assert (=> bs!23311 m!777119))

(assert (=> d!106867 d!107021))

(declare-fun d!107023 () Bool)

(declare-fun e!464931 () Bool)

(assert (=> d!107023 e!464931))

(declare-fun res!566757 () Bool)

(assert (=> d!107023 (=> res!566757 e!464931)))

(declare-fun lt!378271 () Bool)

(assert (=> d!107023 (= res!566757 (not lt!378271))))

(declare-fun lt!378274 () Bool)

(assert (=> d!107023 (= lt!378271 lt!378274)))

(declare-fun lt!378272 () Unit!28510)

(declare-fun e!464930 () Unit!28510)

(assert (=> d!107023 (= lt!378272 e!464930)))

(declare-fun c!90817 () Bool)

(assert (=> d!107023 (= c!90817 lt!378274)))

(assert (=> d!107023 (= lt!378274 (containsKey!402 (toList!4469 lt!377857) lt!377858))))

(assert (=> d!107023 (= (contains!4189 lt!377857 lt!377858) lt!378271)))

(declare-fun b!833485 () Bool)

(declare-fun lt!378273 () Unit!28510)

(assert (=> b!833485 (= e!464930 lt!378273)))

(assert (=> b!833485 (= lt!378273 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377857) lt!377858))))

(assert (=> b!833485 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377857) lt!377858))))

(declare-fun b!833486 () Bool)

(declare-fun Unit!28545 () Unit!28510)

(assert (=> b!833486 (= e!464930 Unit!28545)))

(declare-fun b!833487 () Bool)

(assert (=> b!833487 (= e!464931 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377857) lt!377858)))))

(assert (= (and d!107023 c!90817) b!833485))

(assert (= (and d!107023 (not c!90817)) b!833486))

(assert (= (and d!107023 (not res!566757)) b!833487))

(declare-fun m!778349 () Bool)

(assert (=> d!107023 m!778349))

(declare-fun m!778351 () Bool)

(assert (=> b!833485 m!778351))

(declare-fun m!778353 () Bool)

(assert (=> b!833485 m!778353))

(assert (=> b!833485 m!778353))

(declare-fun m!778355 () Bool)

(assert (=> b!833485 m!778355))

(assert (=> b!833487 m!778353))

(assert (=> b!833487 m!778353))

(assert (=> b!833487 m!778355))

(assert (=> d!106867 d!107023))

(declare-fun d!107025 () Bool)

(assert (=> d!107025 (= (get!11827 (getValueByKey!417 (toList!4469 (+!1991 lt!377945 (tuple2!10083 lt!377951 zeroValueAfter!34))) lt!377953)) (v!10101 (getValueByKey!417 (toList!4469 (+!1991 lt!377945 (tuple2!10083 lt!377951 zeroValueAfter!34))) lt!377953)))))

(assert (=> d!106671 d!107025))

(declare-fun c!90818 () Bool)

(declare-fun d!107027 () Bool)

(assert (=> d!107027 (= c!90818 (and ((_ is Cons!15848) (toList!4469 (+!1991 lt!377945 (tuple2!10083 lt!377951 zeroValueAfter!34)))) (= (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377945 (tuple2!10083 lt!377951 zeroValueAfter!34))))) lt!377953)))))

(declare-fun e!464932 () Option!423)

(assert (=> d!107027 (= (getValueByKey!417 (toList!4469 (+!1991 lt!377945 (tuple2!10083 lt!377951 zeroValueAfter!34))) lt!377953) e!464932)))

(declare-fun e!464933 () Option!423)

(declare-fun b!833490 () Bool)

(assert (=> b!833490 (= e!464933 (getValueByKey!417 (t!22212 (toList!4469 (+!1991 lt!377945 (tuple2!10083 lt!377951 zeroValueAfter!34)))) lt!377953))))

(declare-fun b!833491 () Bool)

(assert (=> b!833491 (= e!464933 None!421)))

(declare-fun b!833489 () Bool)

(assert (=> b!833489 (= e!464932 e!464933)))

(declare-fun c!90819 () Bool)

(assert (=> b!833489 (= c!90819 (and ((_ is Cons!15848) (toList!4469 (+!1991 lt!377945 (tuple2!10083 lt!377951 zeroValueAfter!34)))) (not (= (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377945 (tuple2!10083 lt!377951 zeroValueAfter!34))))) lt!377953))))))

(declare-fun b!833488 () Bool)

(assert (=> b!833488 (= e!464932 (Some!422 (_2!5052 (h!16984 (toList!4469 (+!1991 lt!377945 (tuple2!10083 lt!377951 zeroValueAfter!34)))))))))

(assert (= (and d!107027 c!90818) b!833488))

(assert (= (and d!107027 (not c!90818)) b!833489))

(assert (= (and b!833489 c!90819) b!833490))

(assert (= (and b!833489 (not c!90819)) b!833491))

(declare-fun m!778357 () Bool)

(assert (=> b!833490 m!778357))

(assert (=> d!106671 d!107027))

(declare-fun d!107029 () Bool)

(assert (=> d!107029 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377967) (_1!5052 lt!377756)))))

(declare-fun lt!378275 () Unit!28510)

(assert (=> d!107029 (= lt!378275 (choose!1433 (toList!4469 lt!377967) (_1!5052 lt!377756)))))

(declare-fun e!464934 () Bool)

(assert (=> d!107029 e!464934))

(declare-fun res!566758 () Bool)

(assert (=> d!107029 (=> (not res!566758) (not e!464934))))

(assert (=> d!107029 (= res!566758 (isStrictlySorted!430 (toList!4469 lt!377967)))))

(assert (=> d!107029 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377967) (_1!5052 lt!377756)) lt!378275)))

(declare-fun b!833492 () Bool)

(assert (=> b!833492 (= e!464934 (containsKey!402 (toList!4469 lt!377967) (_1!5052 lt!377756)))))

(assert (= (and d!107029 res!566758) b!833492))

(assert (=> d!107029 m!777281))

(assert (=> d!107029 m!777281))

(assert (=> d!107029 m!778063))

(declare-fun m!778359 () Bool)

(assert (=> d!107029 m!778359))

(declare-fun m!778361 () Bool)

(assert (=> d!107029 m!778361))

(assert (=> b!833492 m!778059))

(assert (=> b!833303 d!107029))

(declare-fun d!107031 () Bool)

(assert (=> d!107031 (= (isDefined!312 (getValueByKey!417 (toList!4469 lt!377967) (_1!5052 lt!377756))) (not (isEmpty!665 (getValueByKey!417 (toList!4469 lt!377967) (_1!5052 lt!377756)))))))

(declare-fun bs!23312 () Bool)

(assert (= bs!23312 d!107031))

(assert (=> bs!23312 m!777281))

(declare-fun m!778363 () Bool)

(assert (=> bs!23312 m!778363))

(assert (=> b!833303 d!107031))

(assert (=> b!833303 d!106701))

(declare-fun d!107033 () Bool)

(assert (=> d!107033 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377854) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun lt!378276 () Unit!28510)

(assert (=> d!107033 (= lt!378276 (choose!1433 (toList!4469 lt!377854) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun e!464935 () Bool)

(assert (=> d!107033 e!464935))

(declare-fun res!566759 () Bool)

(assert (=> d!107033 (=> (not res!566759) (not e!464935))))

(assert (=> d!107033 (= res!566759 (isStrictlySorted!430 (toList!4469 lt!377854)))))

(assert (=> d!107033 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377854) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)) lt!378276)))

(declare-fun b!833493 () Bool)

(assert (=> b!833493 (= e!464935 (containsKey!402 (toList!4469 lt!377854) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!107033 res!566759) b!833493))

(assert (=> d!107033 m!777093))

(assert (=> d!107033 m!777451))

(assert (=> d!107033 m!777451))

(assert (=> d!107033 m!777453))

(assert (=> d!107033 m!777093))

(declare-fun m!778365 () Bool)

(assert (=> d!107033 m!778365))

(declare-fun m!778367 () Bool)

(assert (=> d!107033 m!778367))

(assert (=> b!833493 m!777093))

(assert (=> b!833493 m!777447))

(assert (=> b!833006 d!107033))

(declare-fun d!107035 () Bool)

(assert (=> d!107035 (= (isDefined!312 (getValueByKey!417 (toList!4469 lt!377854) (select (arr!22331 _keys!976) #b00000000000000000000000000000000))) (not (isEmpty!665 (getValueByKey!417 (toList!4469 lt!377854) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun bs!23313 () Bool)

(assert (= bs!23313 d!107035))

(assert (=> bs!23313 m!777451))

(declare-fun m!778369 () Bool)

(assert (=> bs!23313 m!778369))

(assert (=> b!833006 d!107035))

(declare-fun d!107037 () Bool)

(declare-fun c!90820 () Bool)

(assert (=> d!107037 (= c!90820 (and ((_ is Cons!15848) (toList!4469 lt!377854)) (= (_1!5052 (h!16984 (toList!4469 lt!377854))) (select (arr!22331 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun e!464936 () Option!423)

(assert (=> d!107037 (= (getValueByKey!417 (toList!4469 lt!377854) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)) e!464936)))

(declare-fun b!833496 () Bool)

(declare-fun e!464937 () Option!423)

(assert (=> b!833496 (= e!464937 (getValueByKey!417 (t!22212 (toList!4469 lt!377854)) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!833497 () Bool)

(assert (=> b!833497 (= e!464937 None!421)))

(declare-fun b!833495 () Bool)

(assert (=> b!833495 (= e!464936 e!464937)))

(declare-fun c!90821 () Bool)

(assert (=> b!833495 (= c!90821 (and ((_ is Cons!15848) (toList!4469 lt!377854)) (not (= (_1!5052 (h!16984 (toList!4469 lt!377854))) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun b!833494 () Bool)

(assert (=> b!833494 (= e!464936 (Some!422 (_2!5052 (h!16984 (toList!4469 lt!377854)))))))

(assert (= (and d!107037 c!90820) b!833494))

(assert (= (and d!107037 (not c!90820)) b!833495))

(assert (= (and b!833495 c!90821) b!833496))

(assert (= (and b!833495 (not c!90821)) b!833497))

(assert (=> b!833496 m!777093))

(declare-fun m!778371 () Bool)

(assert (=> b!833496 m!778371))

(assert (=> b!833006 d!107037))

(declare-fun d!107039 () Bool)

(assert (=> d!107039 (= (isDefined!312 (getValueByKey!417 (toList!4469 lt!377854) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!665 (getValueByKey!417 (toList!4469 lt!377854) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23314 () Bool)

(assert (= bs!23314 d!107039))

(assert (=> bs!23314 m!777459))

(declare-fun m!778373 () Bool)

(assert (=> bs!23314 m!778373))

(assert (=> b!833011 d!107039))

(declare-fun d!107041 () Bool)

(declare-fun c!90822 () Bool)

(assert (=> d!107041 (= c!90822 (and ((_ is Cons!15848) (toList!4469 lt!377854)) (= (_1!5052 (h!16984 (toList!4469 lt!377854))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!464938 () Option!423)

(assert (=> d!107041 (= (getValueByKey!417 (toList!4469 lt!377854) #b0000000000000000000000000000000000000000000000000000000000000000) e!464938)))

(declare-fun b!833500 () Bool)

(declare-fun e!464939 () Option!423)

(assert (=> b!833500 (= e!464939 (getValueByKey!417 (t!22212 (toList!4469 lt!377854)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!833501 () Bool)

(assert (=> b!833501 (= e!464939 None!421)))

(declare-fun b!833499 () Bool)

(assert (=> b!833499 (= e!464938 e!464939)))

(declare-fun c!90823 () Bool)

(assert (=> b!833499 (= c!90823 (and ((_ is Cons!15848) (toList!4469 lt!377854)) (not (= (_1!5052 (h!16984 (toList!4469 lt!377854))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!833498 () Bool)

(assert (=> b!833498 (= e!464938 (Some!422 (_2!5052 (h!16984 (toList!4469 lt!377854)))))))

(assert (= (and d!107041 c!90822) b!833498))

(assert (= (and d!107041 (not c!90822)) b!833499))

(assert (= (and b!833499 c!90823) b!833500))

(assert (= (and b!833499 (not c!90823)) b!833501))

(declare-fun m!778375 () Bool)

(assert (=> b!833500 m!778375))

(assert (=> b!833011 d!107041))

(declare-fun d!107043 () Bool)

(assert (=> d!107043 (= (get!11827 (getValueByKey!417 (toList!4469 lt!377947) (select (arr!22331 _keys!976) #b00000000000000000000000000000000))) (v!10101 (getValueByKey!417 (toList!4469 lt!377947) (select (arr!22331 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!106799 d!107043))

(declare-fun d!107045 () Bool)

(declare-fun c!90824 () Bool)

(assert (=> d!107045 (= c!90824 (and ((_ is Cons!15848) (toList!4469 lt!377947)) (= (_1!5052 (h!16984 (toList!4469 lt!377947))) (select (arr!22331 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun e!464940 () Option!423)

(assert (=> d!107045 (= (getValueByKey!417 (toList!4469 lt!377947) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)) e!464940)))

(declare-fun b!833504 () Bool)

(declare-fun e!464941 () Option!423)

(assert (=> b!833504 (= e!464941 (getValueByKey!417 (t!22212 (toList!4469 lt!377947)) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!833505 () Bool)

(assert (=> b!833505 (= e!464941 None!421)))

(declare-fun b!833503 () Bool)

(assert (=> b!833503 (= e!464940 e!464941)))

(declare-fun c!90825 () Bool)

(assert (=> b!833503 (= c!90825 (and ((_ is Cons!15848) (toList!4469 lt!377947)) (not (= (_1!5052 (h!16984 (toList!4469 lt!377947))) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun b!833502 () Bool)

(assert (=> b!833502 (= e!464940 (Some!422 (_2!5052 (h!16984 (toList!4469 lt!377947)))))))

(assert (= (and d!107045 c!90824) b!833502))

(assert (= (and d!107045 (not c!90824)) b!833503))

(assert (= (and b!833503 c!90825) b!833504))

(assert (= (and b!833503 (not c!90825)) b!833505))

(assert (=> b!833504 m!777093))

(declare-fun m!778377 () Bool)

(assert (=> b!833504 m!778377))

(assert (=> d!106799 d!107045))

(declare-fun lt!378277 () Bool)

(declare-fun d!107047 () Bool)

(assert (=> d!107047 (= lt!378277 (select (content!388 (toList!4469 lt!378018)) (tuple2!10083 lt!377951 zeroValueAfter!34)))))

(declare-fun e!464943 () Bool)

(assert (=> d!107047 (= lt!378277 e!464943)))

(declare-fun res!566761 () Bool)

(assert (=> d!107047 (=> (not res!566761) (not e!464943))))

(assert (=> d!107047 (= res!566761 ((_ is Cons!15848) (toList!4469 lt!378018)))))

(assert (=> d!107047 (= (contains!4190 (toList!4469 lt!378018) (tuple2!10083 lt!377951 zeroValueAfter!34)) lt!378277)))

(declare-fun b!833506 () Bool)

(declare-fun e!464942 () Bool)

(assert (=> b!833506 (= e!464943 e!464942)))

(declare-fun res!566760 () Bool)

(assert (=> b!833506 (=> res!566760 e!464942)))

(assert (=> b!833506 (= res!566760 (= (h!16984 (toList!4469 lt!378018)) (tuple2!10083 lt!377951 zeroValueAfter!34)))))

(declare-fun b!833507 () Bool)

(assert (=> b!833507 (= e!464942 (contains!4190 (t!22212 (toList!4469 lt!378018)) (tuple2!10083 lt!377951 zeroValueAfter!34)))))

(assert (= (and d!107047 res!566761) b!833506))

(assert (= (and b!833506 (not res!566760)) b!833507))

(declare-fun m!778379 () Bool)

(assert (=> d!107047 m!778379))

(declare-fun m!778381 () Bool)

(assert (=> d!107047 m!778381))

(declare-fun m!778383 () Bool)

(assert (=> b!833507 m!778383))

(assert (=> b!832996 d!107047))

(declare-fun d!107049 () Bool)

(declare-fun lt!378278 () Bool)

(assert (=> d!107049 (= lt!378278 (select (content!388 lt!378116) (tuple2!10083 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!464945 () Bool)

(assert (=> d!107049 (= lt!378278 e!464945)))

(declare-fun res!566763 () Bool)

(assert (=> d!107049 (=> (not res!566763) (not e!464945))))

(assert (=> d!107049 (= res!566763 ((_ is Cons!15848) lt!378116))))

(assert (=> d!107049 (= (contains!4190 lt!378116 (tuple2!10083 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) lt!378278)))

(declare-fun b!833508 () Bool)

(declare-fun e!464944 () Bool)

(assert (=> b!833508 (= e!464945 e!464944)))

(declare-fun res!566762 () Bool)

(assert (=> b!833508 (=> res!566762 e!464944)))

(assert (=> b!833508 (= res!566762 (= (h!16984 lt!378116) (tuple2!10083 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!833509 () Bool)

(assert (=> b!833509 (= e!464944 (contains!4190 (t!22212 lt!378116) (tuple2!10083 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (= (and d!107049 res!566763) b!833508))

(assert (= (and b!833508 (not res!566762)) b!833509))

(declare-fun m!778385 () Bool)

(assert (=> d!107049 m!778385))

(declare-fun m!778387 () Bool)

(assert (=> d!107049 m!778387))

(declare-fun m!778389 () Bool)

(assert (=> b!833509 m!778389))

(assert (=> b!833145 d!107049))

(assert (=> d!106753 d!106725))

(assert (=> d!106753 d!106735))

(declare-fun d!107051 () Bool)

(assert (=> d!107051 (contains!4189 (+!1991 lt!377936 (tuple2!10083 lt!377935 zeroValueBefore!34)) lt!377926)))

(assert (=> d!107051 true))

(declare-fun _$35!429 () Unit!28510)

(assert (=> d!107051 (= (choose!1431 lt!377936 lt!377935 zeroValueBefore!34 lt!377926) _$35!429)))

(declare-fun bs!23315 () Bool)

(assert (= bs!23315 d!107051))

(assert (=> bs!23315 m!777217))

(assert (=> bs!23315 m!777217))

(assert (=> bs!23315 m!777219))

(assert (=> d!106753 d!107051))

(declare-fun d!107053 () Bool)

(declare-fun e!464947 () Bool)

(assert (=> d!107053 e!464947))

(declare-fun res!566764 () Bool)

(assert (=> d!107053 (=> res!566764 e!464947)))

(declare-fun lt!378279 () Bool)

(assert (=> d!107053 (= res!566764 (not lt!378279))))

(declare-fun lt!378282 () Bool)

(assert (=> d!107053 (= lt!378279 lt!378282)))

(declare-fun lt!378280 () Unit!28510)

(declare-fun e!464946 () Unit!28510)

(assert (=> d!107053 (= lt!378280 e!464946)))

(declare-fun c!90826 () Bool)

(assert (=> d!107053 (= c!90826 lt!378282)))

(assert (=> d!107053 (= lt!378282 (containsKey!402 (toList!4469 lt!377936) lt!377926))))

(assert (=> d!107053 (= (contains!4189 lt!377936 lt!377926) lt!378279)))

(declare-fun b!833510 () Bool)

(declare-fun lt!378281 () Unit!28510)

(assert (=> b!833510 (= e!464946 lt!378281)))

(assert (=> b!833510 (= lt!378281 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377936) lt!377926))))

(assert (=> b!833510 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377936) lt!377926))))

(declare-fun b!833511 () Bool)

(declare-fun Unit!28546 () Unit!28510)

(assert (=> b!833511 (= e!464946 Unit!28546)))

(declare-fun b!833512 () Bool)

(assert (=> b!833512 (= e!464947 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377936) lt!377926)))))

(assert (= (and d!107053 c!90826) b!833510))

(assert (= (and d!107053 (not c!90826)) b!833511))

(assert (= (and d!107053 (not res!566764)) b!833512))

(declare-fun m!778391 () Bool)

(assert (=> d!107053 m!778391))

(declare-fun m!778393 () Bool)

(assert (=> b!833510 m!778393))

(declare-fun m!778395 () Bool)

(assert (=> b!833510 m!778395))

(assert (=> b!833510 m!778395))

(declare-fun m!778397 () Bool)

(assert (=> b!833510 m!778397))

(assert (=> b!833512 m!778395))

(assert (=> b!833512 m!778395))

(assert (=> b!833512 m!778397))

(assert (=> d!106753 d!107053))

(declare-fun e!464948 () Bool)

(declare-fun b!833513 () Bool)

(assert (=> b!833513 (= e!464948 (contains!4191 (ite c!90675 (Cons!15849 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!90623 (Cons!15849 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) Nil!15850) Nil!15850)) (ite c!90623 (Cons!15849 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) Nil!15850) Nil!15850)) (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!833514 () Bool)

(declare-fun e!464949 () Bool)

(declare-fun call!36483 () Bool)

(assert (=> b!833514 (= e!464949 call!36483)))

(declare-fun b!833515 () Bool)

(declare-fun e!464951 () Bool)

(declare-fun e!464950 () Bool)

(assert (=> b!833515 (= e!464951 e!464950)))

(declare-fun res!566767 () Bool)

(assert (=> b!833515 (=> (not res!566767) (not e!464950))))

(assert (=> b!833515 (= res!566767 (not e!464948))))

(declare-fun res!566765 () Bool)

(assert (=> b!833515 (=> (not res!566765) (not e!464948))))

(assert (=> b!833515 (= res!566765 (validKeyInArray!0 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!833516 () Bool)

(assert (=> b!833516 (= e!464950 e!464949)))

(declare-fun c!90827 () Bool)

(assert (=> b!833516 (= c!90827 (validKeyInArray!0 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!833517 () Bool)

(assert (=> b!833517 (= e!464949 call!36483)))

(declare-fun bm!36480 () Bool)

(assert (=> bm!36480 (= call!36483 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!90827 (Cons!15849 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (ite c!90675 (Cons!15849 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!90623 (Cons!15849 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) Nil!15850) Nil!15850)) (ite c!90623 (Cons!15849 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) Nil!15850) Nil!15850))) (ite c!90675 (Cons!15849 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!90623 (Cons!15849 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) Nil!15850) Nil!15850)) (ite c!90623 (Cons!15849 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) Nil!15850) Nil!15850)))))))

(declare-fun d!107055 () Bool)

(declare-fun res!566766 () Bool)

(assert (=> d!107055 (=> res!566766 e!464951)))

(assert (=> d!107055 (= res!566766 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22751 _keys!976)))))

(assert (=> d!107055 (= (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!90675 (Cons!15849 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!90623 (Cons!15849 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) Nil!15850) Nil!15850)) (ite c!90623 (Cons!15849 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) Nil!15850) Nil!15850))) e!464951)))

(assert (= (and d!107055 (not res!566766)) b!833515))

(assert (= (and b!833515 res!566765) b!833513))

(assert (= (and b!833515 res!566767) b!833516))

(assert (= (and b!833516 c!90827) b!833514))

(assert (= (and b!833516 (not c!90827)) b!833517))

(assert (= (or b!833514 b!833517) bm!36480))

(assert (=> b!833513 m!778139))

(assert (=> b!833513 m!778139))

(declare-fun m!778399 () Bool)

(assert (=> b!833513 m!778399))

(assert (=> b!833515 m!778139))

(assert (=> b!833515 m!778139))

(assert (=> b!833515 m!778147))

(assert (=> b!833516 m!778139))

(assert (=> b!833516 m!778139))

(assert (=> b!833516 m!778147))

(assert (=> bm!36480 m!778139))

(declare-fun m!778401 () Bool)

(assert (=> bm!36480 m!778401))

(assert (=> bm!36448 d!107055))

(declare-fun d!107057 () Bool)

(assert (=> d!107057 (= ($colon$colon!534 e!464736 (ite c!90724 (h!16984 (toList!4469 lt!377760)) (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756)))) (Cons!15848 (ite c!90724 (h!16984 (toList!4469 lt!377760)) (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))) e!464736))))

(assert (=> bm!36460 d!107057))

(declare-fun d!107059 () Bool)

(assert (=> d!107059 (= (isDefined!312 (getValueByKey!417 (toList!4469 lt!377819) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (not (isEmpty!665 (getValueByKey!417 (toList!4469 lt!377819) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun bs!23316 () Bool)

(assert (= bs!23316 d!107059))

(assert (=> bs!23316 m!777065))

(declare-fun m!778403 () Bool)

(assert (=> bs!23316 m!778403))

(assert (=> b!833134 d!107059))

(assert (=> b!833134 d!106841))

(declare-fun d!107061 () Bool)

(assert (=> d!107061 (isDefined!312 (getValueByKey!417 (toList!4469 (+!1991 lt!377857 (tuple2!10083 lt!377856 lt!377860))) lt!377858))))

(declare-fun lt!378283 () Unit!28510)

(assert (=> d!107061 (= lt!378283 (choose!1433 (toList!4469 (+!1991 lt!377857 (tuple2!10083 lt!377856 lt!377860))) lt!377858))))

(declare-fun e!464952 () Bool)

(assert (=> d!107061 e!464952))

(declare-fun res!566768 () Bool)

(assert (=> d!107061 (=> (not res!566768) (not e!464952))))

(assert (=> d!107061 (= res!566768 (isStrictlySorted!430 (toList!4469 (+!1991 lt!377857 (tuple2!10083 lt!377856 lt!377860)))))))

(assert (=> d!107061 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 (+!1991 lt!377857 (tuple2!10083 lt!377856 lt!377860))) lt!377858) lt!378283)))

(declare-fun b!833518 () Bool)

(assert (=> b!833518 (= e!464952 (containsKey!402 (toList!4469 (+!1991 lt!377857 (tuple2!10083 lt!377856 lt!377860))) lt!377858))))

(assert (= (and d!107061 res!566768) b!833518))

(assert (=> d!107061 m!777985))

(assert (=> d!107061 m!777985))

(assert (=> d!107061 m!777987))

(declare-fun m!778405 () Bool)

(assert (=> d!107061 m!778405))

(declare-fun m!778407 () Bool)

(assert (=> d!107061 m!778407))

(assert (=> b!833518 m!777981))

(assert (=> b!833271 d!107061))

(declare-fun d!107063 () Bool)

(assert (=> d!107063 (= (isDefined!312 (getValueByKey!417 (toList!4469 (+!1991 lt!377857 (tuple2!10083 lt!377856 lt!377860))) lt!377858)) (not (isEmpty!665 (getValueByKey!417 (toList!4469 (+!1991 lt!377857 (tuple2!10083 lt!377856 lt!377860))) lt!377858))))))

(declare-fun bs!23317 () Bool)

(assert (= bs!23317 d!107063))

(assert (=> bs!23317 m!777985))

(declare-fun m!778409 () Bool)

(assert (=> bs!23317 m!778409))

(assert (=> b!833271 d!107063))

(declare-fun d!107065 () Bool)

(declare-fun c!90828 () Bool)

(assert (=> d!107065 (= c!90828 (and ((_ is Cons!15848) (toList!4469 (+!1991 lt!377857 (tuple2!10083 lt!377856 lt!377860)))) (= (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377857 (tuple2!10083 lt!377856 lt!377860))))) lt!377858)))))

(declare-fun e!464953 () Option!423)

(assert (=> d!107065 (= (getValueByKey!417 (toList!4469 (+!1991 lt!377857 (tuple2!10083 lt!377856 lt!377860))) lt!377858) e!464953)))

(declare-fun e!464954 () Option!423)

(declare-fun b!833521 () Bool)

(assert (=> b!833521 (= e!464954 (getValueByKey!417 (t!22212 (toList!4469 (+!1991 lt!377857 (tuple2!10083 lt!377856 lt!377860)))) lt!377858))))

(declare-fun b!833522 () Bool)

(assert (=> b!833522 (= e!464954 None!421)))

(declare-fun b!833520 () Bool)

(assert (=> b!833520 (= e!464953 e!464954)))

(declare-fun c!90829 () Bool)

(assert (=> b!833520 (= c!90829 (and ((_ is Cons!15848) (toList!4469 (+!1991 lt!377857 (tuple2!10083 lt!377856 lt!377860)))) (not (= (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377857 (tuple2!10083 lt!377856 lt!377860))))) lt!377858))))))

(declare-fun b!833519 () Bool)

(assert (=> b!833519 (= e!464953 (Some!422 (_2!5052 (h!16984 (toList!4469 (+!1991 lt!377857 (tuple2!10083 lt!377856 lt!377860)))))))))

(assert (= (and d!107065 c!90828) b!833519))

(assert (= (and d!107065 (not c!90828)) b!833520))

(assert (= (and b!833520 c!90829) b!833521))

(assert (= (and b!833520 (not c!90829)) b!833522))

(declare-fun m!778411 () Bool)

(assert (=> b!833521 m!778411))

(assert (=> b!833271 d!107065))

(declare-fun d!107067 () Bool)

(declare-fun e!464956 () Bool)

(assert (=> d!107067 e!464956))

(declare-fun res!566769 () Bool)

(assert (=> d!107067 (=> res!566769 e!464956)))

(declare-fun lt!378284 () Bool)

(assert (=> d!107067 (= res!566769 (not lt!378284))))

(declare-fun lt!378287 () Bool)

(assert (=> d!107067 (= lt!378284 lt!378287)))

(declare-fun lt!378285 () Unit!28510)

(declare-fun e!464955 () Unit!28510)

(assert (=> d!107067 (= lt!378285 e!464955)))

(declare-fun c!90830 () Bool)

(assert (=> d!107067 (= c!90830 lt!378287)))

(assert (=> d!107067 (= lt!378287 (containsKey!402 (toList!4469 lt!378037) (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!107067 (= (contains!4189 lt!378037 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!378284)))

(declare-fun b!833523 () Bool)

(declare-fun lt!378286 () Unit!28510)

(assert (=> b!833523 (= e!464955 lt!378286)))

(assert (=> b!833523 (= lt!378286 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!378037) (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!833523 (isDefined!312 (getValueByKey!417 (toList!4469 lt!378037) (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!833524 () Bool)

(declare-fun Unit!28547 () Unit!28510)

(assert (=> b!833524 (= e!464955 Unit!28547)))

(declare-fun b!833525 () Bool)

(assert (=> b!833525 (= e!464956 (isDefined!312 (getValueByKey!417 (toList!4469 lt!378037) (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))))

(assert (= (and d!107067 c!90830) b!833523))

(assert (= (and d!107067 (not c!90830)) b!833524))

(assert (= (and d!107067 (not res!566769)) b!833525))

(assert (=> d!107067 m!777463))

(declare-fun m!778413 () Bool)

(assert (=> d!107067 m!778413))

(assert (=> b!833523 m!777463))

(declare-fun m!778415 () Bool)

(assert (=> b!833523 m!778415))

(assert (=> b!833523 m!777463))

(declare-fun m!778417 () Bool)

(assert (=> b!833523 m!778417))

(assert (=> b!833523 m!778417))

(declare-fun m!778419 () Bool)

(assert (=> b!833523 m!778419))

(assert (=> b!833525 m!777463))

(assert (=> b!833525 m!778417))

(assert (=> b!833525 m!778417))

(assert (=> b!833525 m!778419))

(assert (=> b!833024 d!107067))

(declare-fun d!107069 () Bool)

(assert (=> d!107069 (= (get!11827 (getValueByKey!417 (toList!4469 lt!377921) lt!377924)) (v!10101 (getValueByKey!417 (toList!4469 lt!377921) lt!377924)))))

(assert (=> d!106749 d!107069))

(declare-fun d!107071 () Bool)

(declare-fun c!90831 () Bool)

(assert (=> d!107071 (= c!90831 (and ((_ is Cons!15848) (toList!4469 lt!377921)) (= (_1!5052 (h!16984 (toList!4469 lt!377921))) lt!377924)))))

(declare-fun e!464957 () Option!423)

(assert (=> d!107071 (= (getValueByKey!417 (toList!4469 lt!377921) lt!377924) e!464957)))

(declare-fun b!833528 () Bool)

(declare-fun e!464958 () Option!423)

(assert (=> b!833528 (= e!464958 (getValueByKey!417 (t!22212 (toList!4469 lt!377921)) lt!377924))))

(declare-fun b!833529 () Bool)

(assert (=> b!833529 (= e!464958 None!421)))

(declare-fun b!833527 () Bool)

(assert (=> b!833527 (= e!464957 e!464958)))

(declare-fun c!90832 () Bool)

(assert (=> b!833527 (= c!90832 (and ((_ is Cons!15848) (toList!4469 lt!377921)) (not (= (_1!5052 (h!16984 (toList!4469 lt!377921))) lt!377924))))))

(declare-fun b!833526 () Bool)

(assert (=> b!833526 (= e!464957 (Some!422 (_2!5052 (h!16984 (toList!4469 lt!377921)))))))

(assert (= (and d!107071 c!90831) b!833526))

(assert (= (and d!107071 (not c!90831)) b!833527))

(assert (= (and b!833527 c!90832) b!833528))

(assert (= (and b!833527 (not c!90832)) b!833529))

(declare-fun m!778421 () Bool)

(assert (=> b!833528 m!778421))

(assert (=> d!106749 d!107071))

(declare-fun d!107073 () Bool)

(assert (=> d!107073 (= (get!11827 (getValueByKey!417 (toList!4469 lt!377923) lt!377931)) (v!10101 (getValueByKey!417 (toList!4469 lt!377923) lt!377931)))))

(assert (=> d!106745 d!107073))

(declare-fun d!107075 () Bool)

(declare-fun c!90833 () Bool)

(assert (=> d!107075 (= c!90833 (and ((_ is Cons!15848) (toList!4469 lt!377923)) (= (_1!5052 (h!16984 (toList!4469 lt!377923))) lt!377931)))))

(declare-fun e!464959 () Option!423)

(assert (=> d!107075 (= (getValueByKey!417 (toList!4469 lt!377923) lt!377931) e!464959)))

(declare-fun b!833532 () Bool)

(declare-fun e!464960 () Option!423)

(assert (=> b!833532 (= e!464960 (getValueByKey!417 (t!22212 (toList!4469 lt!377923)) lt!377931))))

(declare-fun b!833533 () Bool)

(assert (=> b!833533 (= e!464960 None!421)))

(declare-fun b!833531 () Bool)

(assert (=> b!833531 (= e!464959 e!464960)))

(declare-fun c!90834 () Bool)

(assert (=> b!833531 (= c!90834 (and ((_ is Cons!15848) (toList!4469 lt!377923)) (not (= (_1!5052 (h!16984 (toList!4469 lt!377923))) lt!377931))))))

(declare-fun b!833530 () Bool)

(assert (=> b!833530 (= e!464959 (Some!422 (_2!5052 (h!16984 (toList!4469 lt!377923)))))))

(assert (= (and d!107075 c!90833) b!833530))

(assert (= (and d!107075 (not c!90833)) b!833531))

(assert (= (and b!833531 c!90834) b!833532))

(assert (= (and b!833531 (not c!90834)) b!833533))

(declare-fun m!778423 () Bool)

(assert (=> b!833532 m!778423))

(assert (=> d!106745 d!107075))

(declare-fun d!107077 () Bool)

(assert (=> d!107077 (= (isEmpty!664 (toList!4469 lt!377854)) ((_ is Nil!15849) (toList!4469 lt!377854)))))

(assert (=> d!106825 d!107077))

(declare-fun d!107079 () Bool)

(declare-fun res!566770 () Bool)

(declare-fun e!464961 () Bool)

(assert (=> d!107079 (=> res!566770 e!464961)))

(assert (=> d!107079 (= res!566770 (and ((_ is Cons!15848) lt!377818) (= (_1!5052 (h!16984 lt!377818)) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!107079 (= (containsKey!402 lt!377818 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!464961)))

(declare-fun b!833534 () Bool)

(declare-fun e!464962 () Bool)

(assert (=> b!833534 (= e!464961 e!464962)))

(declare-fun res!566771 () Bool)

(assert (=> b!833534 (=> (not res!566771) (not e!464962))))

(assert (=> b!833534 (= res!566771 (and (or (not ((_ is Cons!15848) lt!377818)) (bvsle (_1!5052 (h!16984 lt!377818)) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) ((_ is Cons!15848) lt!377818) (bvslt (_1!5052 (h!16984 lt!377818)) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!833535 () Bool)

(assert (=> b!833535 (= e!464962 (containsKey!402 (t!22212 lt!377818) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and d!107079 (not res!566770)) b!833534))

(assert (= (and b!833534 res!566771) b!833535))

(declare-fun m!778425 () Bool)

(assert (=> b!833535 m!778425))

(assert (=> b!833139 d!107079))

(declare-fun d!107081 () Bool)

(declare-fun e!464964 () Bool)

(assert (=> d!107081 e!464964))

(declare-fun res!566772 () Bool)

(assert (=> d!107081 (=> res!566772 e!464964)))

(declare-fun lt!378288 () Bool)

(assert (=> d!107081 (= res!566772 (not lt!378288))))

(declare-fun lt!378291 () Bool)

(assert (=> d!107081 (= lt!378288 lt!378291)))

(declare-fun lt!378289 () Unit!28510)

(declare-fun e!464963 () Unit!28510)

(assert (=> d!107081 (= lt!378289 e!464963)))

(declare-fun c!90835 () Bool)

(assert (=> d!107081 (= c!90835 lt!378291)))

(assert (=> d!107081 (= lt!378291 (containsKey!402 (toList!4469 lt!378018) (_1!5052 (tuple2!10083 lt!377951 zeroValueAfter!34))))))

(assert (=> d!107081 (= (contains!4189 lt!378018 (_1!5052 (tuple2!10083 lt!377951 zeroValueAfter!34))) lt!378288)))

(declare-fun b!833536 () Bool)

(declare-fun lt!378290 () Unit!28510)

(assert (=> b!833536 (= e!464963 lt!378290)))

(assert (=> b!833536 (= lt!378290 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!378018) (_1!5052 (tuple2!10083 lt!377951 zeroValueAfter!34))))))

(assert (=> b!833536 (isDefined!312 (getValueByKey!417 (toList!4469 lt!378018) (_1!5052 (tuple2!10083 lt!377951 zeroValueAfter!34))))))

(declare-fun b!833537 () Bool)

(declare-fun Unit!28548 () Unit!28510)

(assert (=> b!833537 (= e!464963 Unit!28548)))

(declare-fun b!833538 () Bool)

(assert (=> b!833538 (= e!464964 (isDefined!312 (getValueByKey!417 (toList!4469 lt!378018) (_1!5052 (tuple2!10083 lt!377951 zeroValueAfter!34)))))))

(assert (= (and d!107081 c!90835) b!833536))

(assert (= (and d!107081 (not c!90835)) b!833537))

(assert (= (and d!107081 (not res!566772)) b!833538))

(declare-fun m!778427 () Bool)

(assert (=> d!107081 m!778427))

(declare-fun m!778429 () Bool)

(assert (=> b!833536 m!778429))

(assert (=> b!833536 m!777409))

(assert (=> b!833536 m!777409))

(declare-fun m!778431 () Bool)

(assert (=> b!833536 m!778431))

(assert (=> b!833538 m!777409))

(assert (=> b!833538 m!777409))

(assert (=> b!833538 m!778431))

(assert (=> d!106683 d!107081))

(declare-fun d!107083 () Bool)

(declare-fun c!90836 () Bool)

(assert (=> d!107083 (= c!90836 (and ((_ is Cons!15848) lt!378017) (= (_1!5052 (h!16984 lt!378017)) (_1!5052 (tuple2!10083 lt!377951 zeroValueAfter!34)))))))

(declare-fun e!464965 () Option!423)

(assert (=> d!107083 (= (getValueByKey!417 lt!378017 (_1!5052 (tuple2!10083 lt!377951 zeroValueAfter!34))) e!464965)))

(declare-fun e!464966 () Option!423)

(declare-fun b!833541 () Bool)

(assert (=> b!833541 (= e!464966 (getValueByKey!417 (t!22212 lt!378017) (_1!5052 (tuple2!10083 lt!377951 zeroValueAfter!34))))))

(declare-fun b!833542 () Bool)

(assert (=> b!833542 (= e!464966 None!421)))

(declare-fun b!833540 () Bool)

(assert (=> b!833540 (= e!464965 e!464966)))

(declare-fun c!90837 () Bool)

(assert (=> b!833540 (= c!90837 (and ((_ is Cons!15848) lt!378017) (not (= (_1!5052 (h!16984 lt!378017)) (_1!5052 (tuple2!10083 lt!377951 zeroValueAfter!34))))))))

(declare-fun b!833539 () Bool)

(assert (=> b!833539 (= e!464965 (Some!422 (_2!5052 (h!16984 lt!378017))))))

(assert (= (and d!107083 c!90836) b!833539))

(assert (= (and d!107083 (not c!90836)) b!833540))

(assert (= (and b!833540 c!90837) b!833541))

(assert (= (and b!833540 (not c!90837)) b!833542))

(declare-fun m!778433 () Bool)

(assert (=> b!833541 m!778433))

(assert (=> d!106683 d!107083))

(declare-fun d!107085 () Bool)

(assert (=> d!107085 (= (getValueByKey!417 lt!378017 (_1!5052 (tuple2!10083 lt!377951 zeroValueAfter!34))) (Some!422 (_2!5052 (tuple2!10083 lt!377951 zeroValueAfter!34))))))

(declare-fun lt!378292 () Unit!28510)

(assert (=> d!107085 (= lt!378292 (choose!1429 lt!378017 (_1!5052 (tuple2!10083 lt!377951 zeroValueAfter!34)) (_2!5052 (tuple2!10083 lt!377951 zeroValueAfter!34))))))

(declare-fun e!464967 () Bool)

(assert (=> d!107085 e!464967))

(declare-fun res!566773 () Bool)

(assert (=> d!107085 (=> (not res!566773) (not e!464967))))

(assert (=> d!107085 (= res!566773 (isStrictlySorted!430 lt!378017))))

(assert (=> d!107085 (= (lemmaContainsTupThenGetReturnValue!231 lt!378017 (_1!5052 (tuple2!10083 lt!377951 zeroValueAfter!34)) (_2!5052 (tuple2!10083 lt!377951 zeroValueAfter!34))) lt!378292)))

(declare-fun b!833543 () Bool)

(declare-fun res!566774 () Bool)

(assert (=> b!833543 (=> (not res!566774) (not e!464967))))

(assert (=> b!833543 (= res!566774 (containsKey!402 lt!378017 (_1!5052 (tuple2!10083 lt!377951 zeroValueAfter!34))))))

(declare-fun b!833544 () Bool)

(assert (=> b!833544 (= e!464967 (contains!4190 lt!378017 (tuple2!10083 (_1!5052 (tuple2!10083 lt!377951 zeroValueAfter!34)) (_2!5052 (tuple2!10083 lt!377951 zeroValueAfter!34)))))))

(assert (= (and d!107085 res!566773) b!833543))

(assert (= (and b!833543 res!566774) b!833544))

(assert (=> d!107085 m!777403))

(declare-fun m!778435 () Bool)

(assert (=> d!107085 m!778435))

(declare-fun m!778437 () Bool)

(assert (=> d!107085 m!778437))

(declare-fun m!778439 () Bool)

(assert (=> b!833543 m!778439))

(declare-fun m!778441 () Bool)

(assert (=> b!833544 m!778441))

(assert (=> d!106683 d!107085))

(declare-fun bm!36481 () Bool)

(declare-fun c!90838 () Bool)

(declare-fun e!464969 () List!15852)

(declare-fun call!36485 () List!15852)

(assert (=> bm!36481 (= call!36485 ($colon$colon!534 e!464969 (ite c!90838 (h!16984 (toList!4469 lt!377945)) (tuple2!10083 (_1!5052 (tuple2!10083 lt!377951 zeroValueAfter!34)) (_2!5052 (tuple2!10083 lt!377951 zeroValueAfter!34))))))))

(declare-fun c!90841 () Bool)

(assert (=> bm!36481 (= c!90841 c!90838)))

(declare-fun bm!36482 () Bool)

(declare-fun call!36486 () List!15852)

(assert (=> bm!36482 (= call!36486 call!36485)))

(declare-fun bm!36483 () Bool)

(declare-fun call!36484 () List!15852)

(assert (=> bm!36483 (= call!36484 call!36486)))

(declare-fun b!833545 () Bool)

(declare-fun c!90839 () Bool)

(assert (=> b!833545 (= c!90839 (and ((_ is Cons!15848) (toList!4469 lt!377945)) (bvsgt (_1!5052 (h!16984 (toList!4469 lt!377945))) (_1!5052 (tuple2!10083 lt!377951 zeroValueAfter!34)))))))

(declare-fun e!464968 () List!15852)

(declare-fun e!464971 () List!15852)

(assert (=> b!833545 (= e!464968 e!464971)))

(declare-fun b!833546 () Bool)

(assert (=> b!833546 (= e!464971 call!36484)))

(declare-fun b!833547 () Bool)

(assert (=> b!833547 (= e!464969 (insertStrictlySorted!270 (t!22212 (toList!4469 lt!377945)) (_1!5052 (tuple2!10083 lt!377951 zeroValueAfter!34)) (_2!5052 (tuple2!10083 lt!377951 zeroValueAfter!34))))))

(declare-fun b!833548 () Bool)

(declare-fun e!464970 () List!15852)

(assert (=> b!833548 (= e!464970 call!36485)))

(declare-fun lt!378293 () List!15852)

(declare-fun e!464972 () Bool)

(declare-fun b!833549 () Bool)

(assert (=> b!833549 (= e!464972 (contains!4190 lt!378293 (tuple2!10083 (_1!5052 (tuple2!10083 lt!377951 zeroValueAfter!34)) (_2!5052 (tuple2!10083 lt!377951 zeroValueAfter!34)))))))

(declare-fun b!833550 () Bool)

(declare-fun c!90840 () Bool)

(assert (=> b!833550 (= e!464969 (ite c!90840 (t!22212 (toList!4469 lt!377945)) (ite c!90839 (Cons!15848 (h!16984 (toList!4469 lt!377945)) (t!22212 (toList!4469 lt!377945))) Nil!15849)))))

(declare-fun b!833551 () Bool)

(assert (=> b!833551 (= e!464970 e!464968)))

(assert (=> b!833551 (= c!90840 (and ((_ is Cons!15848) (toList!4469 lt!377945)) (= (_1!5052 (h!16984 (toList!4469 lt!377945))) (_1!5052 (tuple2!10083 lt!377951 zeroValueAfter!34)))))))

(declare-fun b!833552 () Bool)

(assert (=> b!833552 (= e!464968 call!36486)))

(declare-fun b!833553 () Bool)

(declare-fun res!566776 () Bool)

(assert (=> b!833553 (=> (not res!566776) (not e!464972))))

(assert (=> b!833553 (= res!566776 (containsKey!402 lt!378293 (_1!5052 (tuple2!10083 lt!377951 zeroValueAfter!34))))))

(declare-fun d!107087 () Bool)

(assert (=> d!107087 e!464972))

(declare-fun res!566775 () Bool)

(assert (=> d!107087 (=> (not res!566775) (not e!464972))))

(assert (=> d!107087 (= res!566775 (isStrictlySorted!430 lt!378293))))

(assert (=> d!107087 (= lt!378293 e!464970)))

(assert (=> d!107087 (= c!90838 (and ((_ is Cons!15848) (toList!4469 lt!377945)) (bvslt (_1!5052 (h!16984 (toList!4469 lt!377945))) (_1!5052 (tuple2!10083 lt!377951 zeroValueAfter!34)))))))

(assert (=> d!107087 (isStrictlySorted!430 (toList!4469 lt!377945))))

(assert (=> d!107087 (= (insertStrictlySorted!270 (toList!4469 lt!377945) (_1!5052 (tuple2!10083 lt!377951 zeroValueAfter!34)) (_2!5052 (tuple2!10083 lt!377951 zeroValueAfter!34))) lt!378293)))

(declare-fun b!833554 () Bool)

(assert (=> b!833554 (= e!464971 call!36484)))

(assert (= (and d!107087 c!90838) b!833548))

(assert (= (and d!107087 (not c!90838)) b!833551))

(assert (= (and b!833551 c!90840) b!833552))

(assert (= (and b!833551 (not c!90840)) b!833545))

(assert (= (and b!833545 c!90839) b!833546))

(assert (= (and b!833545 (not c!90839)) b!833554))

(assert (= (or b!833546 b!833554) bm!36483))

(assert (= (or b!833552 bm!36483) bm!36482))

(assert (= (or b!833548 bm!36482) bm!36481))

(assert (= (and bm!36481 c!90841) b!833547))

(assert (= (and bm!36481 (not c!90841)) b!833550))

(assert (= (and d!107087 res!566775) b!833553))

(assert (= (and b!833553 res!566776) b!833549))

(declare-fun m!778443 () Bool)

(assert (=> bm!36481 m!778443))

(declare-fun m!778445 () Bool)

(assert (=> b!833549 m!778445))

(declare-fun m!778447 () Bool)

(assert (=> b!833547 m!778447))

(declare-fun m!778449 () Bool)

(assert (=> b!833553 m!778449))

(declare-fun m!778451 () Bool)

(assert (=> d!107087 m!778451))

(declare-fun m!778453 () Bool)

(assert (=> d!107087 m!778453))

(assert (=> d!106683 d!107087))

(declare-fun bm!36484 () Bool)

(declare-fun call!36488 () List!15852)

(declare-fun e!464974 () List!15852)

(declare-fun c!90842 () Bool)

(assert (=> bm!36484 (= call!36488 ($colon$colon!534 e!464974 (ite c!90842 (h!16984 (t!22212 (toList!4469 (+!1991 lt!377760 lt!377756)))) (tuple2!10083 (_1!5052 lt!377761) (_2!5052 lt!377761)))))))

(declare-fun c!90845 () Bool)

(assert (=> bm!36484 (= c!90845 c!90842)))

(declare-fun bm!36485 () Bool)

(declare-fun call!36489 () List!15852)

(assert (=> bm!36485 (= call!36489 call!36488)))

(declare-fun bm!36486 () Bool)

(declare-fun call!36487 () List!15852)

(assert (=> bm!36486 (= call!36487 call!36489)))

(declare-fun b!833555 () Bool)

(declare-fun c!90843 () Bool)

(assert (=> b!833555 (= c!90843 (and ((_ is Cons!15848) (t!22212 (toList!4469 (+!1991 lt!377760 lt!377756)))) (bvsgt (_1!5052 (h!16984 (t!22212 (toList!4469 (+!1991 lt!377760 lt!377756))))) (_1!5052 lt!377761))))))

(declare-fun e!464973 () List!15852)

(declare-fun e!464976 () List!15852)

(assert (=> b!833555 (= e!464973 e!464976)))

(declare-fun b!833556 () Bool)

(assert (=> b!833556 (= e!464976 call!36487)))

(declare-fun b!833557 () Bool)

(assert (=> b!833557 (= e!464974 (insertStrictlySorted!270 (t!22212 (t!22212 (toList!4469 (+!1991 lt!377760 lt!377756)))) (_1!5052 lt!377761) (_2!5052 lt!377761)))))

(declare-fun b!833558 () Bool)

(declare-fun e!464975 () List!15852)

(assert (=> b!833558 (= e!464975 call!36488)))

(declare-fun b!833559 () Bool)

(declare-fun e!464977 () Bool)

(declare-fun lt!378294 () List!15852)

(assert (=> b!833559 (= e!464977 (contains!4190 lt!378294 (tuple2!10083 (_1!5052 lt!377761) (_2!5052 lt!377761))))))

(declare-fun c!90844 () Bool)

(declare-fun b!833560 () Bool)

(assert (=> b!833560 (= e!464974 (ite c!90844 (t!22212 (t!22212 (toList!4469 (+!1991 lt!377760 lt!377756)))) (ite c!90843 (Cons!15848 (h!16984 (t!22212 (toList!4469 (+!1991 lt!377760 lt!377756)))) (t!22212 (t!22212 (toList!4469 (+!1991 lt!377760 lt!377756))))) Nil!15849)))))

(declare-fun b!833561 () Bool)

(assert (=> b!833561 (= e!464975 e!464973)))

(assert (=> b!833561 (= c!90844 (and ((_ is Cons!15848) (t!22212 (toList!4469 (+!1991 lt!377760 lt!377756)))) (= (_1!5052 (h!16984 (t!22212 (toList!4469 (+!1991 lt!377760 lt!377756))))) (_1!5052 lt!377761))))))

(declare-fun b!833562 () Bool)

(assert (=> b!833562 (= e!464973 call!36489)))

(declare-fun b!833563 () Bool)

(declare-fun res!566778 () Bool)

(assert (=> b!833563 (=> (not res!566778) (not e!464977))))

(assert (=> b!833563 (= res!566778 (containsKey!402 lt!378294 (_1!5052 lt!377761)))))

(declare-fun d!107089 () Bool)

(assert (=> d!107089 e!464977))

(declare-fun res!566777 () Bool)

(assert (=> d!107089 (=> (not res!566777) (not e!464977))))

(assert (=> d!107089 (= res!566777 (isStrictlySorted!430 lt!378294))))

(assert (=> d!107089 (= lt!378294 e!464975)))

(assert (=> d!107089 (= c!90842 (and ((_ is Cons!15848) (t!22212 (toList!4469 (+!1991 lt!377760 lt!377756)))) (bvslt (_1!5052 (h!16984 (t!22212 (toList!4469 (+!1991 lt!377760 lt!377756))))) (_1!5052 lt!377761))))))

(assert (=> d!107089 (isStrictlySorted!430 (t!22212 (toList!4469 (+!1991 lt!377760 lt!377756))))))

(assert (=> d!107089 (= (insertStrictlySorted!270 (t!22212 (toList!4469 (+!1991 lt!377760 lt!377756))) (_1!5052 lt!377761) (_2!5052 lt!377761)) lt!378294)))

(declare-fun b!833564 () Bool)

(assert (=> b!833564 (= e!464976 call!36487)))

(assert (= (and d!107089 c!90842) b!833558))

(assert (= (and d!107089 (not c!90842)) b!833561))

(assert (= (and b!833561 c!90844) b!833562))

(assert (= (and b!833561 (not c!90844)) b!833555))

(assert (= (and b!833555 c!90843) b!833556))

(assert (= (and b!833555 (not c!90843)) b!833564))

(assert (= (or b!833556 b!833564) bm!36486))

(assert (= (or b!833562 bm!36486) bm!36485))

(assert (= (or b!833558 bm!36485) bm!36484))

(assert (= (and bm!36484 c!90845) b!833557))

(assert (= (and bm!36484 (not c!90845)) b!833560))

(assert (= (and d!107089 res!566777) b!833563))

(assert (= (and b!833563 res!566778) b!833559))

(declare-fun m!778455 () Bool)

(assert (=> bm!36484 m!778455))

(declare-fun m!778457 () Bool)

(assert (=> b!833559 m!778457))

(declare-fun m!778459 () Bool)

(assert (=> b!833557 m!778459))

(declare-fun m!778461 () Bool)

(assert (=> b!833563 m!778461))

(declare-fun m!778463 () Bool)

(assert (=> d!107089 m!778463))

(declare-fun m!778465 () Bool)

(assert (=> d!107089 m!778465))

(assert (=> b!833194 d!107089))

(declare-fun d!107091 () Bool)

(declare-fun res!566779 () Bool)

(declare-fun e!464978 () Bool)

(assert (=> d!107091 (=> res!566779 e!464978)))

(assert (=> d!107091 (= res!566779 (and ((_ is Cons!15848) (toList!4469 lt!377967)) (= (_1!5052 (h!16984 (toList!4469 lt!377967))) (_1!5052 lt!377756))))))

(assert (=> d!107091 (= (containsKey!402 (toList!4469 lt!377967) (_1!5052 lt!377756)) e!464978)))

(declare-fun b!833565 () Bool)

(declare-fun e!464979 () Bool)

(assert (=> b!833565 (= e!464978 e!464979)))

(declare-fun res!566780 () Bool)

(assert (=> b!833565 (=> (not res!566780) (not e!464979))))

(assert (=> b!833565 (= res!566780 (and (or (not ((_ is Cons!15848) (toList!4469 lt!377967))) (bvsle (_1!5052 (h!16984 (toList!4469 lt!377967))) (_1!5052 lt!377756))) ((_ is Cons!15848) (toList!4469 lt!377967)) (bvslt (_1!5052 (h!16984 (toList!4469 lt!377967))) (_1!5052 lt!377756))))))

(declare-fun b!833566 () Bool)

(assert (=> b!833566 (= e!464979 (containsKey!402 (t!22212 (toList!4469 lt!377967)) (_1!5052 lt!377756)))))

(assert (= (and d!107091 (not res!566779)) b!833565))

(assert (= (and b!833565 res!566780) b!833566))

(declare-fun m!778467 () Bool)

(assert (=> b!833566 m!778467))

(assert (=> d!106889 d!107091))

(declare-fun d!107093 () Bool)

(declare-fun lt!378295 () Bool)

(assert (=> d!107093 (= lt!378295 (select (content!388 lt!378102) (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))))))

(declare-fun e!464981 () Bool)

(assert (=> d!107093 (= lt!378295 e!464981)))

(declare-fun res!566782 () Bool)

(assert (=> d!107093 (=> (not res!566782) (not e!464981))))

(assert (=> d!107093 (= res!566782 ((_ is Cons!15848) lt!378102))))

(assert (=> d!107093 (= (contains!4190 lt!378102 (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))) lt!378295)))

(declare-fun b!833567 () Bool)

(declare-fun e!464980 () Bool)

(assert (=> b!833567 (= e!464981 e!464980)))

(declare-fun res!566781 () Bool)

(assert (=> b!833567 (=> res!566781 e!464980)))

(assert (=> b!833567 (= res!566781 (= (h!16984 lt!378102) (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))))))

(declare-fun b!833568 () Bool)

(assert (=> b!833568 (= e!464980 (contains!4190 (t!22212 lt!378102) (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))))))

(assert (= (and d!107093 res!566782) b!833567))

(assert (= (and b!833567 (not res!566781)) b!833568))

(declare-fun m!778469 () Bool)

(assert (=> d!107093 m!778469))

(declare-fun m!778471 () Bool)

(assert (=> d!107093 m!778471))

(declare-fun m!778473 () Bool)

(assert (=> b!833568 m!778473))

(assert (=> b!833116 d!107093))

(declare-fun d!107095 () Bool)

(declare-fun res!566783 () Bool)

(declare-fun e!464982 () Bool)

(assert (=> d!107095 (=> res!566783 e!464982)))

(assert (=> d!107095 (= res!566783 (and ((_ is Cons!15848) (toList!4469 (+!1991 lt!377936 (tuple2!10083 lt!377935 zeroValueBefore!34)))) (= (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377936 (tuple2!10083 lt!377935 zeroValueBefore!34))))) lt!377926)))))

(assert (=> d!107095 (= (containsKey!402 (toList!4469 (+!1991 lt!377936 (tuple2!10083 lt!377935 zeroValueBefore!34))) lt!377926) e!464982)))

(declare-fun b!833569 () Bool)

(declare-fun e!464983 () Bool)

(assert (=> b!833569 (= e!464982 e!464983)))

(declare-fun res!566784 () Bool)

(assert (=> b!833569 (=> (not res!566784) (not e!464983))))

(assert (=> b!833569 (= res!566784 (and (or (not ((_ is Cons!15848) (toList!4469 (+!1991 lt!377936 (tuple2!10083 lt!377935 zeroValueBefore!34))))) (bvsle (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377936 (tuple2!10083 lt!377935 zeroValueBefore!34))))) lt!377926)) ((_ is Cons!15848) (toList!4469 (+!1991 lt!377936 (tuple2!10083 lt!377935 zeroValueBefore!34)))) (bvslt (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377936 (tuple2!10083 lt!377935 zeroValueBefore!34))))) lt!377926)))))

(declare-fun b!833570 () Bool)

(assert (=> b!833570 (= e!464983 (containsKey!402 (t!22212 (toList!4469 (+!1991 lt!377936 (tuple2!10083 lt!377935 zeroValueBefore!34)))) lt!377926))))

(assert (= (and d!107095 (not res!566783)) b!833569))

(assert (= (and b!833569 res!566784) b!833570))

(declare-fun m!778475 () Bool)

(assert (=> b!833570 m!778475))

(assert (=> d!106725 d!107095))

(declare-fun d!107097 () Bool)

(declare-fun c!90848 () Bool)

(assert (=> d!107097 (= c!90848 ((_ is Nil!15849) (toList!4469 lt!377823)))))

(declare-fun e!464986 () (InoxSet tuple2!10082))

(assert (=> d!107097 (= (content!388 (toList!4469 lt!377823)) e!464986)))

(declare-fun b!833575 () Bool)

(assert (=> b!833575 (= e!464986 ((as const (Array tuple2!10082 Bool)) false))))

(declare-fun b!833576 () Bool)

(assert (=> b!833576 (= e!464986 ((_ map or) (store ((as const (Array tuple2!10082 Bool)) false) (h!16984 (toList!4469 lt!377823)) true) (content!388 (t!22212 (toList!4469 lt!377823)))))))

(assert (= (and d!107097 c!90848) b!833575))

(assert (= (and d!107097 (not c!90848)) b!833576))

(declare-fun m!778477 () Bool)

(assert (=> b!833576 m!778477))

(declare-fun m!778479 () Bool)

(assert (=> b!833576 m!778479))

(assert (=> d!106755 d!107097))

(declare-fun d!107099 () Bool)

(declare-fun res!566785 () Bool)

(declare-fun e!464987 () Bool)

(assert (=> d!107099 (=> res!566785 e!464987)))

(assert (=> d!107099 (= res!566785 (or ((_ is Nil!15849) lt!378207) ((_ is Nil!15849) (t!22212 lt!378207))))))

(assert (=> d!107099 (= (isStrictlySorted!430 lt!378207) e!464987)))

(declare-fun b!833577 () Bool)

(declare-fun e!464988 () Bool)

(assert (=> b!833577 (= e!464987 e!464988)))

(declare-fun res!566786 () Bool)

(assert (=> b!833577 (=> (not res!566786) (not e!464988))))

(assert (=> b!833577 (= res!566786 (bvslt (_1!5052 (h!16984 lt!378207)) (_1!5052 (h!16984 (t!22212 lt!378207)))))))

(declare-fun b!833578 () Bool)

(assert (=> b!833578 (= e!464988 (isStrictlySorted!430 (t!22212 lt!378207)))))

(assert (= (and d!107099 (not res!566785)) b!833577))

(assert (= (and b!833577 res!566786) b!833578))

(declare-fun m!778481 () Bool)

(assert (=> b!833578 m!778481))

(assert (=> d!106887 d!107099))

(declare-fun d!107101 () Bool)

(declare-fun res!566787 () Bool)

(declare-fun e!464989 () Bool)

(assert (=> d!107101 (=> res!566787 e!464989)))

(assert (=> d!107101 (= res!566787 (or ((_ is Nil!15849) (toList!4469 (+!1991 lt!377759 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) ((_ is Nil!15849) (t!22212 (toList!4469 (+!1991 lt!377759 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))))

(assert (=> d!107101 (= (isStrictlySorted!430 (toList!4469 (+!1991 lt!377759 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) e!464989)))

(declare-fun b!833579 () Bool)

(declare-fun e!464990 () Bool)

(assert (=> b!833579 (= e!464989 e!464990)))

(declare-fun res!566788 () Bool)

(assert (=> b!833579 (=> (not res!566788) (not e!464990))))

(assert (=> b!833579 (= res!566788 (bvslt (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377759 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (_1!5052 (h!16984 (t!22212 (toList!4469 (+!1991 lt!377759 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))))

(declare-fun b!833580 () Bool)

(assert (=> b!833580 (= e!464990 (isStrictlySorted!430 (t!22212 (toList!4469 (+!1991 lt!377759 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(assert (= (and d!107101 (not res!566787)) b!833579))

(assert (= (and b!833579 res!566788) b!833580))

(declare-fun m!778483 () Bool)

(assert (=> b!833580 m!778483))

(assert (=> d!106887 d!107101))

(assert (=> d!106761 d!106759))

(declare-fun d!107103 () Bool)

(assert (=> d!107103 (= (getValueByKey!417 lt!377870 (_1!5052 lt!377761)) (Some!422 (_2!5052 lt!377761)))))

(assert (=> d!107103 true))

(declare-fun _$22!578 () Unit!28510)

(assert (=> d!107103 (= (choose!1429 lt!377870 (_1!5052 lt!377761) (_2!5052 lt!377761)) _$22!578)))

(declare-fun bs!23318 () Bool)

(assert (= bs!23318 d!107103))

(assert (=> bs!23318 m!777159))

(assert (=> d!106761 d!107103))

(declare-fun d!107105 () Bool)

(declare-fun res!566789 () Bool)

(declare-fun e!464991 () Bool)

(assert (=> d!107105 (=> res!566789 e!464991)))

(assert (=> d!107105 (= res!566789 (or ((_ is Nil!15849) lt!377870) ((_ is Nil!15849) (t!22212 lt!377870))))))

(assert (=> d!107105 (= (isStrictlySorted!430 lt!377870) e!464991)))

(declare-fun b!833581 () Bool)

(declare-fun e!464992 () Bool)

(assert (=> b!833581 (= e!464991 e!464992)))

(declare-fun res!566790 () Bool)

(assert (=> b!833581 (=> (not res!566790) (not e!464992))))

(assert (=> b!833581 (= res!566790 (bvslt (_1!5052 (h!16984 lt!377870)) (_1!5052 (h!16984 (t!22212 lt!377870)))))))

(declare-fun b!833582 () Bool)

(assert (=> b!833582 (= e!464992 (isStrictlySorted!430 (t!22212 lt!377870)))))

(assert (= (and d!107105 (not res!566789)) b!833581))

(assert (= (and b!833581 res!566790) b!833582))

(declare-fun m!778485 () Bool)

(assert (=> b!833582 m!778485))

(assert (=> d!106761 d!107105))

(declare-fun d!107107 () Bool)

(declare-fun res!566791 () Bool)

(declare-fun e!464993 () Bool)

(assert (=> d!107107 (=> res!566791 e!464993)))

(assert (=> d!107107 (= res!566791 (and ((_ is Cons!15848) lt!378102) (= (_1!5052 (h!16984 lt!378102)) (_1!5052 lt!377756))))))

(assert (=> d!107107 (= (containsKey!402 lt!378102 (_1!5052 lt!377756)) e!464993)))

(declare-fun b!833583 () Bool)

(declare-fun e!464994 () Bool)

(assert (=> b!833583 (= e!464993 e!464994)))

(declare-fun res!566792 () Bool)

(assert (=> b!833583 (=> (not res!566792) (not e!464994))))

(assert (=> b!833583 (= res!566792 (and (or (not ((_ is Cons!15848) lt!378102)) (bvsle (_1!5052 (h!16984 lt!378102)) (_1!5052 lt!377756))) ((_ is Cons!15848) lt!378102) (bvslt (_1!5052 (h!16984 lt!378102)) (_1!5052 lt!377756))))))

(declare-fun b!833584 () Bool)

(assert (=> b!833584 (= e!464994 (containsKey!402 (t!22212 lt!378102) (_1!5052 lt!377756)))))

(assert (= (and d!107107 (not res!566791)) b!833583))

(assert (= (and b!833583 res!566792) b!833584))

(declare-fun m!778487 () Bool)

(assert (=> b!833584 m!778487))

(assert (=> b!833120 d!107107))

(assert (=> d!106705 d!106631))

(assert (=> d!106705 d!106629))

(declare-fun d!107109 () Bool)

(assert (=> d!107109 (= (get!11827 (getValueByKey!417 (toList!4469 (+!1991 lt!377921 (tuple2!10083 lt!377933 minValue!754))) lt!377924)) (v!10101 (getValueByKey!417 (toList!4469 (+!1991 lt!377921 (tuple2!10083 lt!377933 minValue!754))) lt!377924)))))

(assert (=> d!106737 d!107109))

(declare-fun c!90849 () Bool)

(declare-fun d!107111 () Bool)

(assert (=> d!107111 (= c!90849 (and ((_ is Cons!15848) (toList!4469 (+!1991 lt!377921 (tuple2!10083 lt!377933 minValue!754)))) (= (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377921 (tuple2!10083 lt!377933 minValue!754))))) lt!377924)))))

(declare-fun e!464995 () Option!423)

(assert (=> d!107111 (= (getValueByKey!417 (toList!4469 (+!1991 lt!377921 (tuple2!10083 lt!377933 minValue!754))) lt!377924) e!464995)))

(declare-fun b!833587 () Bool)

(declare-fun e!464996 () Option!423)

(assert (=> b!833587 (= e!464996 (getValueByKey!417 (t!22212 (toList!4469 (+!1991 lt!377921 (tuple2!10083 lt!377933 minValue!754)))) lt!377924))))

(declare-fun b!833588 () Bool)

(assert (=> b!833588 (= e!464996 None!421)))

(declare-fun b!833586 () Bool)

(assert (=> b!833586 (= e!464995 e!464996)))

(declare-fun c!90850 () Bool)

(assert (=> b!833586 (= c!90850 (and ((_ is Cons!15848) (toList!4469 (+!1991 lt!377921 (tuple2!10083 lt!377933 minValue!754)))) (not (= (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377921 (tuple2!10083 lt!377933 minValue!754))))) lt!377924))))))

(declare-fun b!833585 () Bool)

(assert (=> b!833585 (= e!464995 (Some!422 (_2!5052 (h!16984 (toList!4469 (+!1991 lt!377921 (tuple2!10083 lt!377933 minValue!754)))))))))

(assert (= (and d!107111 c!90849) b!833585))

(assert (= (and d!107111 (not c!90849)) b!833586))

(assert (= (and b!833586 c!90850) b!833587))

(assert (= (and b!833586 (not c!90850)) b!833588))

(declare-fun m!778489 () Bool)

(assert (=> b!833587 m!778489))

(assert (=> d!106737 d!107111))

(declare-fun d!107113 () Bool)

(assert (=> d!107113 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377815) (_1!5052 lt!377756)))))

(declare-fun lt!378296 () Unit!28510)

(assert (=> d!107113 (= lt!378296 (choose!1433 (toList!4469 lt!377815) (_1!5052 lt!377756)))))

(declare-fun e!464997 () Bool)

(assert (=> d!107113 e!464997))

(declare-fun res!566793 () Bool)

(assert (=> d!107113 (=> (not res!566793) (not e!464997))))

(assert (=> d!107113 (= res!566793 (isStrictlySorted!430 (toList!4469 lt!377815)))))

(assert (=> d!107113 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377815) (_1!5052 lt!377756)) lt!378296)))

(declare-fun b!833589 () Bool)

(assert (=> b!833589 (= e!464997 (containsKey!402 (toList!4469 lt!377815) (_1!5052 lt!377756)))))

(assert (= (and d!107113 res!566793) b!833589))

(assert (=> d!107113 m!777053))

(assert (=> d!107113 m!777053))

(assert (=> d!107113 m!778035))

(declare-fun m!778491 () Bool)

(assert (=> d!107113 m!778491))

(declare-fun m!778493 () Bool)

(assert (=> d!107113 m!778493))

(assert (=> b!833589 m!778031))

(assert (=> b!833284 d!107113))

(declare-fun d!107115 () Bool)

(assert (=> d!107115 (= (isDefined!312 (getValueByKey!417 (toList!4469 lt!377815) (_1!5052 lt!377756))) (not (isEmpty!665 (getValueByKey!417 (toList!4469 lt!377815) (_1!5052 lt!377756)))))))

(declare-fun bs!23319 () Bool)

(assert (= bs!23319 d!107115))

(assert (=> bs!23319 m!777053))

(declare-fun m!778495 () Bool)

(assert (=> bs!23319 m!778495))

(assert (=> b!833284 d!107115))

(assert (=> b!833284 d!106849))

(declare-fun c!90851 () Bool)

(declare-fun d!107117 () Bool)

(assert (=> d!107117 (= c!90851 (and ((_ is Cons!15848) (toList!4469 lt!378065)) (= (_1!5052 (h!16984 (toList!4469 lt!378065))) (_1!5052 (tuple2!10083 lt!377929 zeroValueBefore!34)))))))

(declare-fun e!464998 () Option!423)

(assert (=> d!107117 (= (getValueByKey!417 (toList!4469 lt!378065) (_1!5052 (tuple2!10083 lt!377929 zeroValueBefore!34))) e!464998)))

(declare-fun b!833592 () Bool)

(declare-fun e!464999 () Option!423)

(assert (=> b!833592 (= e!464999 (getValueByKey!417 (t!22212 (toList!4469 lt!378065)) (_1!5052 (tuple2!10083 lt!377929 zeroValueBefore!34))))))

(declare-fun b!833593 () Bool)

(assert (=> b!833593 (= e!464999 None!421)))

(declare-fun b!833591 () Bool)

(assert (=> b!833591 (= e!464998 e!464999)))

(declare-fun c!90852 () Bool)

(assert (=> b!833591 (= c!90852 (and ((_ is Cons!15848) (toList!4469 lt!378065)) (not (= (_1!5052 (h!16984 (toList!4469 lt!378065))) (_1!5052 (tuple2!10083 lt!377929 zeroValueBefore!34))))))))

(declare-fun b!833590 () Bool)

(assert (=> b!833590 (= e!464998 (Some!422 (_2!5052 (h!16984 (toList!4469 lt!378065)))))))

(assert (= (and d!107117 c!90851) b!833590))

(assert (= (and d!107117 (not c!90851)) b!833591))

(assert (= (and b!833591 c!90852) b!833592))

(assert (= (and b!833591 (not c!90852)) b!833593))

(declare-fun m!778497 () Bool)

(assert (=> b!833592 m!778497))

(assert (=> b!833055 d!107117))

(declare-fun d!107119 () Bool)

(assert (=> d!107119 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377854) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!378297 () Unit!28510)

(assert (=> d!107119 (= lt!378297 (choose!1433 (toList!4469 lt!377854) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!465000 () Bool)

(assert (=> d!107119 e!465000))

(declare-fun res!566794 () Bool)

(assert (=> d!107119 (=> (not res!566794) (not e!465000))))

(assert (=> d!107119 (= res!566794 (isStrictlySorted!430 (toList!4469 lt!377854)))))

(assert (=> d!107119 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377854) #b1000000000000000000000000000000000000000000000000000000000000000) lt!378297)))

(declare-fun b!833594 () Bool)

(assert (=> b!833594 (= e!465000 (containsKey!402 (toList!4469 lt!377854) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!107119 res!566794) b!833594))

(assert (=> d!107119 m!777699))

(assert (=> d!107119 m!777699))

(assert (=> d!107119 m!777701))

(declare-fun m!778499 () Bool)

(assert (=> d!107119 m!778499))

(assert (=> d!107119 m!778367))

(assert (=> b!833594 m!777695))

(assert (=> b!833098 d!107119))

(declare-fun d!107121 () Bool)

(assert (=> d!107121 (= (isDefined!312 (getValueByKey!417 (toList!4469 lt!377854) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!665 (getValueByKey!417 (toList!4469 lt!377854) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23320 () Bool)

(assert (= bs!23320 d!107121))

(assert (=> bs!23320 m!777699))

(declare-fun m!778501 () Bool)

(assert (=> bs!23320 m!778501))

(assert (=> b!833098 d!107121))

(declare-fun d!107123 () Bool)

(declare-fun c!90853 () Bool)

(assert (=> d!107123 (= c!90853 (and ((_ is Cons!15848) (toList!4469 lt!377854)) (= (_1!5052 (h!16984 (toList!4469 lt!377854))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!465001 () Option!423)

(assert (=> d!107123 (= (getValueByKey!417 (toList!4469 lt!377854) #b1000000000000000000000000000000000000000000000000000000000000000) e!465001)))

(declare-fun b!833597 () Bool)

(declare-fun e!465002 () Option!423)

(assert (=> b!833597 (= e!465002 (getValueByKey!417 (t!22212 (toList!4469 lt!377854)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!833598 () Bool)

(assert (=> b!833598 (= e!465002 None!421)))

(declare-fun b!833596 () Bool)

(assert (=> b!833596 (= e!465001 e!465002)))

(declare-fun c!90854 () Bool)

(assert (=> b!833596 (= c!90854 (and ((_ is Cons!15848) (toList!4469 lt!377854)) (not (= (_1!5052 (h!16984 (toList!4469 lt!377854))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!833595 () Bool)

(assert (=> b!833595 (= e!465001 (Some!422 (_2!5052 (h!16984 (toList!4469 lt!377854)))))))

(assert (= (and d!107123 c!90853) b!833595))

(assert (= (and d!107123 (not c!90853)) b!833596))

(assert (= (and b!833596 c!90854) b!833597))

(assert (= (and b!833596 (not c!90854)) b!833598))

(declare-fun m!778503 () Bool)

(assert (=> b!833597 m!778503))

(assert (=> b!833098 d!107123))

(assert (=> b!833035 d!107013))

(declare-fun d!107125 () Bool)

(declare-fun lt!378298 () Bool)

(assert (=> d!107125 (= lt!378298 (select (content!388 (t!22212 (toList!4469 lt!377871))) lt!377761))))

(declare-fun e!465004 () Bool)

(assert (=> d!107125 (= lt!378298 e!465004)))

(declare-fun res!566796 () Bool)

(assert (=> d!107125 (=> (not res!566796) (not e!465004))))

(assert (=> d!107125 (= res!566796 ((_ is Cons!15848) (t!22212 (toList!4469 lt!377871))))))

(assert (=> d!107125 (= (contains!4190 (t!22212 (toList!4469 lt!377871)) lt!377761) lt!378298)))

(declare-fun b!833599 () Bool)

(declare-fun e!465003 () Bool)

(assert (=> b!833599 (= e!465004 e!465003)))

(declare-fun res!566795 () Bool)

(assert (=> b!833599 (=> res!566795 e!465003)))

(assert (=> b!833599 (= res!566795 (= (h!16984 (t!22212 (toList!4469 lt!377871))) lt!377761))))

(declare-fun b!833600 () Bool)

(assert (=> b!833600 (= e!465003 (contains!4190 (t!22212 (t!22212 (toList!4469 lt!377871))) lt!377761))))

(assert (= (and d!107125 res!566796) b!833599))

(assert (= (and b!833599 (not res!566795)) b!833600))

(declare-fun m!778505 () Bool)

(assert (=> d!107125 m!778505))

(declare-fun m!778507 () Bool)

(assert (=> d!107125 m!778507))

(declare-fun m!778509 () Bool)

(assert (=> b!833600 m!778509))

(assert (=> b!833283 d!107125))

(assert (=> b!833244 d!106919))

(assert (=> b!833244 d!106921))

(declare-fun d!107127 () Bool)

(assert (=> d!107127 (isDefined!312 (getValueByKey!417 (toList!4469 (+!1991 lt!377864 (tuple2!10083 lt!377863 lt!377867))) lt!377865))))

(declare-fun lt!378299 () Unit!28510)

(assert (=> d!107127 (= lt!378299 (choose!1433 (toList!4469 (+!1991 lt!377864 (tuple2!10083 lt!377863 lt!377867))) lt!377865))))

(declare-fun e!465005 () Bool)

(assert (=> d!107127 e!465005))

(declare-fun res!566797 () Bool)

(assert (=> d!107127 (=> (not res!566797) (not e!465005))))

(assert (=> d!107127 (= res!566797 (isStrictlySorted!430 (toList!4469 (+!1991 lt!377864 (tuple2!10083 lt!377863 lt!377867)))))))

(assert (=> d!107127 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 (+!1991 lt!377864 (tuple2!10083 lt!377863 lt!377867))) lt!377865) lt!378299)))

(declare-fun b!833601 () Bool)

(assert (=> b!833601 (= e!465005 (containsKey!402 (toList!4469 (+!1991 lt!377864 (tuple2!10083 lt!377863 lt!377867))) lt!377865))))

(assert (= (and d!107127 res!566797) b!833601))

(assert (=> d!107127 m!778009))

(assert (=> d!107127 m!778009))

(assert (=> d!107127 m!778011))

(declare-fun m!778511 () Bool)

(assert (=> d!107127 m!778511))

(declare-fun m!778513 () Bool)

(assert (=> d!107127 m!778513))

(assert (=> b!833601 m!778005))

(assert (=> b!833277 d!107127))

(declare-fun d!107129 () Bool)

(assert (=> d!107129 (= (isDefined!312 (getValueByKey!417 (toList!4469 (+!1991 lt!377864 (tuple2!10083 lt!377863 lt!377867))) lt!377865)) (not (isEmpty!665 (getValueByKey!417 (toList!4469 (+!1991 lt!377864 (tuple2!10083 lt!377863 lt!377867))) lt!377865))))))

(declare-fun bs!23321 () Bool)

(assert (= bs!23321 d!107129))

(assert (=> bs!23321 m!778009))

(declare-fun m!778515 () Bool)

(assert (=> bs!23321 m!778515))

(assert (=> b!833277 d!107129))

(declare-fun d!107131 () Bool)

(declare-fun c!90855 () Bool)

(assert (=> d!107131 (= c!90855 (and ((_ is Cons!15848) (toList!4469 (+!1991 lt!377864 (tuple2!10083 lt!377863 lt!377867)))) (= (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377864 (tuple2!10083 lt!377863 lt!377867))))) lt!377865)))))

(declare-fun e!465006 () Option!423)

(assert (=> d!107131 (= (getValueByKey!417 (toList!4469 (+!1991 lt!377864 (tuple2!10083 lt!377863 lt!377867))) lt!377865) e!465006)))

(declare-fun e!465007 () Option!423)

(declare-fun b!833604 () Bool)

(assert (=> b!833604 (= e!465007 (getValueByKey!417 (t!22212 (toList!4469 (+!1991 lt!377864 (tuple2!10083 lt!377863 lt!377867)))) lt!377865))))

(declare-fun b!833605 () Bool)

(assert (=> b!833605 (= e!465007 None!421)))

(declare-fun b!833603 () Bool)

(assert (=> b!833603 (= e!465006 e!465007)))

(declare-fun c!90856 () Bool)

(assert (=> b!833603 (= c!90856 (and ((_ is Cons!15848) (toList!4469 (+!1991 lt!377864 (tuple2!10083 lt!377863 lt!377867)))) (not (= (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377864 (tuple2!10083 lt!377863 lt!377867))))) lt!377865))))))

(declare-fun b!833602 () Bool)

(assert (=> b!833602 (= e!465006 (Some!422 (_2!5052 (h!16984 (toList!4469 (+!1991 lt!377864 (tuple2!10083 lt!377863 lt!377867)))))))))

(assert (= (and d!107131 c!90855) b!833602))

(assert (= (and d!107131 (not c!90855)) b!833603))

(assert (= (and b!833603 c!90856) b!833604))

(assert (= (and b!833603 (not c!90856)) b!833605))

(declare-fun m!778517 () Bool)

(assert (=> b!833604 m!778517))

(assert (=> b!833277 d!107131))

(declare-fun d!107133 () Bool)

(declare-fun res!566798 () Bool)

(declare-fun e!465008 () Bool)

(assert (=> d!107133 (=> res!566798 e!465008)))

(assert (=> d!107133 (= res!566798 (and ((_ is Cons!15848) (toList!4469 (+!1991 lt!377958 (tuple2!10083 lt!377957 zeroValueAfter!34)))) (= (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377958 (tuple2!10083 lt!377957 zeroValueAfter!34))))) lt!377948)))))

(assert (=> d!107133 (= (containsKey!402 (toList!4469 (+!1991 lt!377958 (tuple2!10083 lt!377957 zeroValueAfter!34))) lt!377948) e!465008)))

(declare-fun b!833606 () Bool)

(declare-fun e!465009 () Bool)

(assert (=> b!833606 (= e!465008 e!465009)))

(declare-fun res!566799 () Bool)

(assert (=> b!833606 (=> (not res!566799) (not e!465009))))

(assert (=> b!833606 (= res!566799 (and (or (not ((_ is Cons!15848) (toList!4469 (+!1991 lt!377958 (tuple2!10083 lt!377957 zeroValueAfter!34))))) (bvsle (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377958 (tuple2!10083 lt!377957 zeroValueAfter!34))))) lt!377948)) ((_ is Cons!15848) (toList!4469 (+!1991 lt!377958 (tuple2!10083 lt!377957 zeroValueAfter!34)))) (bvslt (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377958 (tuple2!10083 lt!377957 zeroValueAfter!34))))) lt!377948)))))

(declare-fun b!833607 () Bool)

(assert (=> b!833607 (= e!465009 (containsKey!402 (t!22212 (toList!4469 (+!1991 lt!377958 (tuple2!10083 lt!377957 zeroValueAfter!34)))) lt!377948))))

(assert (= (and d!107133 (not res!566798)) b!833606))

(assert (= (and b!833606 res!566799) b!833607))

(declare-fun m!778519 () Bool)

(assert (=> b!833607 m!778519))

(assert (=> d!106665 d!107133))

(assert (=> b!833259 d!107013))

(assert (=> d!106871 d!106875))

(assert (=> d!106871 d!106877))

(declare-fun d!107135 () Bool)

(assert (=> d!107135 (not (contains!4189 (+!1991 lt!377864 (tuple2!10083 lt!377863 lt!377867)) lt!377865))))

(assert (=> d!107135 true))

(declare-fun _$36!348 () Unit!28510)

(assert (=> d!107135 (= (choose!1432 lt!377864 lt!377863 lt!377867 lt!377865) _$36!348)))

(declare-fun bs!23322 () Bool)

(assert (= bs!23322 d!107135))

(assert (=> bs!23322 m!777137))

(assert (=> bs!23322 m!777137))

(assert (=> bs!23322 m!777139))

(assert (=> d!106871 d!107135))

(declare-fun d!107137 () Bool)

(declare-fun e!465011 () Bool)

(assert (=> d!107137 e!465011))

(declare-fun res!566800 () Bool)

(assert (=> d!107137 (=> res!566800 e!465011)))

(declare-fun lt!378300 () Bool)

(assert (=> d!107137 (= res!566800 (not lt!378300))))

(declare-fun lt!378303 () Bool)

(assert (=> d!107137 (= lt!378300 lt!378303)))

(declare-fun lt!378301 () Unit!28510)

(declare-fun e!465010 () Unit!28510)

(assert (=> d!107137 (= lt!378301 e!465010)))

(declare-fun c!90857 () Bool)

(assert (=> d!107137 (= c!90857 lt!378303)))

(assert (=> d!107137 (= lt!378303 (containsKey!402 (toList!4469 lt!377864) lt!377865))))

(assert (=> d!107137 (= (contains!4189 lt!377864 lt!377865) lt!378300)))

(declare-fun b!833608 () Bool)

(declare-fun lt!378302 () Unit!28510)

(assert (=> b!833608 (= e!465010 lt!378302)))

(assert (=> b!833608 (= lt!378302 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377864) lt!377865))))

(assert (=> b!833608 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377864) lt!377865))))

(declare-fun b!833609 () Bool)

(declare-fun Unit!28549 () Unit!28510)

(assert (=> b!833609 (= e!465010 Unit!28549)))

(declare-fun b!833610 () Bool)

(assert (=> b!833610 (= e!465011 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377864) lt!377865)))))

(assert (= (and d!107137 c!90857) b!833608))

(assert (= (and d!107137 (not c!90857)) b!833609))

(assert (= (and d!107137 (not res!566800)) b!833610))

(declare-fun m!778521 () Bool)

(assert (=> d!107137 m!778521))

(declare-fun m!778523 () Bool)

(assert (=> b!833608 m!778523))

(declare-fun m!778525 () Bool)

(assert (=> b!833608 m!778525))

(assert (=> b!833608 m!778525))

(declare-fun m!778527 () Bool)

(assert (=> b!833608 m!778527))

(assert (=> b!833610 m!778525))

(assert (=> b!833610 m!778525))

(assert (=> b!833610 m!778527))

(assert (=> d!106871 d!107137))

(declare-fun d!107139 () Bool)

(declare-fun lt!378304 () Bool)

(assert (=> d!107139 (= lt!378304 (select (content!389 (ite c!90623 (Cons!15849 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) Nil!15850) Nil!15850)) (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!465012 () Bool)

(assert (=> d!107139 (= lt!378304 e!465012)))

(declare-fun res!566802 () Bool)

(assert (=> d!107139 (=> (not res!566802) (not e!465012))))

(assert (=> d!107139 (= res!566802 ((_ is Cons!15849) (ite c!90623 (Cons!15849 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) Nil!15850) Nil!15850)))))

(assert (=> d!107139 (= (contains!4191 (ite c!90623 (Cons!15849 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) Nil!15850) Nil!15850) (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!378304)))

(declare-fun b!833611 () Bool)

(declare-fun e!465013 () Bool)

(assert (=> b!833611 (= e!465012 e!465013)))

(declare-fun res!566801 () Bool)

(assert (=> b!833611 (=> res!566801 e!465013)))

(assert (=> b!833611 (= res!566801 (= (h!16985 (ite c!90623 (Cons!15849 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) Nil!15850) Nil!15850)) (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!833612 () Bool)

(assert (=> b!833612 (= e!465013 (contains!4191 (t!22213 (ite c!90623 (Cons!15849 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) Nil!15850) Nil!15850)) (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!107139 res!566802) b!833611))

(assert (= (and b!833611 (not res!566801)) b!833612))

(declare-fun m!778529 () Bool)

(assert (=> d!107139 m!778529))

(assert (=> d!107139 m!777463))

(declare-fun m!778531 () Bool)

(assert (=> d!107139 m!778531))

(assert (=> b!833612 m!777463))

(declare-fun m!778533 () Bool)

(assert (=> b!833612 m!778533))

(assert (=> b!833012 d!107139))

(declare-fun d!107141 () Bool)

(declare-fun lt!378305 () Bool)

(assert (=> d!107141 (= lt!378305 (select (content!388 lt!377966) (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))))))

(declare-fun e!465015 () Bool)

(assert (=> d!107141 (= lt!378305 e!465015)))

(declare-fun res!566804 () Bool)

(assert (=> d!107141 (=> (not res!566804) (not e!465015))))

(assert (=> d!107141 (= res!566804 ((_ is Cons!15848) lt!377966))))

(assert (=> d!107141 (= (contains!4190 lt!377966 (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))) lt!378305)))

(declare-fun b!833613 () Bool)

(declare-fun e!465014 () Bool)

(assert (=> b!833613 (= e!465015 e!465014)))

(declare-fun res!566803 () Bool)

(assert (=> b!833613 (=> res!566803 e!465014)))

(assert (=> b!833613 (= res!566803 (= (h!16984 lt!377966) (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))))))

(declare-fun b!833614 () Bool)

(assert (=> b!833614 (= e!465014 (contains!4190 (t!22212 lt!377966) (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))))))

(assert (= (and d!107141 res!566804) b!833613))

(assert (= (and b!833613 (not res!566803)) b!833614))

(declare-fun m!778535 () Bool)

(assert (=> d!107141 m!778535))

(declare-fun m!778537 () Bool)

(assert (=> d!107141 m!778537))

(declare-fun m!778539 () Bool)

(assert (=> b!833614 m!778539))

(assert (=> b!833311 d!107141))

(declare-fun d!107143 () Bool)

(declare-fun res!566805 () Bool)

(declare-fun e!465016 () Bool)

(assert (=> d!107143 (=> res!566805 e!465016)))

(assert (=> d!107143 (= res!566805 (and ((_ is Cons!15848) (toList!4469 lt!377815)) (= (_1!5052 (h!16984 (toList!4469 lt!377815))) (_1!5052 lt!377756))))))

(assert (=> d!107143 (= (containsKey!402 (toList!4469 lt!377815) (_1!5052 lt!377756)) e!465016)))

(declare-fun b!833615 () Bool)

(declare-fun e!465017 () Bool)

(assert (=> b!833615 (= e!465016 e!465017)))

(declare-fun res!566806 () Bool)

(assert (=> b!833615 (=> (not res!566806) (not e!465017))))

(assert (=> b!833615 (= res!566806 (and (or (not ((_ is Cons!15848) (toList!4469 lt!377815))) (bvsle (_1!5052 (h!16984 (toList!4469 lt!377815))) (_1!5052 lt!377756))) ((_ is Cons!15848) (toList!4469 lt!377815)) (bvslt (_1!5052 (h!16984 (toList!4469 lt!377815))) (_1!5052 lt!377756))))))

(declare-fun b!833616 () Bool)

(assert (=> b!833616 (= e!465017 (containsKey!402 (t!22212 (toList!4469 lt!377815)) (_1!5052 lt!377756)))))

(assert (= (and d!107143 (not res!566805)) b!833615))

(assert (= (and b!833615 res!566806) b!833616))

(declare-fun m!778541 () Bool)

(assert (=> b!833616 m!778541))

(assert (=> d!106881 d!107143))

(declare-fun d!107145 () Bool)

(assert (=> d!107145 (= ($colon$colon!534 e!464746 (ite c!90731 (h!16984 (toList!4469 (+!1991 lt!377760 lt!377756))) (tuple2!10083 (_1!5052 lt!377761) (_2!5052 lt!377761)))) (Cons!15848 (ite c!90731 (h!16984 (toList!4469 (+!1991 lt!377760 lt!377756))) (tuple2!10083 (_1!5052 lt!377761) (_2!5052 lt!377761))) e!464746))))

(assert (=> bm!36463 d!107145))

(declare-fun d!107147 () Bool)

(declare-fun lt!378306 () Bool)

(assert (=> d!107147 (= lt!378306 (select (content!388 (toList!4469 lt!378180)) (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!465019 () Bool)

(assert (=> d!107147 (= lt!378306 e!465019)))

(declare-fun res!566808 () Bool)

(assert (=> d!107147 (=> (not res!566808) (not e!465019))))

(assert (=> d!107147 (= res!566808 ((_ is Cons!15848) (toList!4469 lt!378180)))))

(assert (=> d!107147 (= (contains!4190 (toList!4469 lt!378180) (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!378306)))

(declare-fun b!833617 () Bool)

(declare-fun e!465018 () Bool)

(assert (=> b!833617 (= e!465019 e!465018)))

(declare-fun res!566807 () Bool)

(assert (=> b!833617 (=> res!566807 e!465018)))

(assert (=> b!833617 (= res!566807 (= (h!16984 (toList!4469 lt!378180)) (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!833618 () Bool)

(assert (=> b!833618 (= e!465018 (contains!4190 (t!22212 (toList!4469 lt!378180)) (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!107147 res!566808) b!833617))

(assert (= (and b!833617 (not res!566807)) b!833618))

(declare-fun m!778543 () Bool)

(assert (=> d!107147 m!778543))

(declare-fun m!778545 () Bool)

(assert (=> d!107147 m!778545))

(declare-fun m!778547 () Bool)

(assert (=> b!833618 m!778547))

(assert (=> b!833266 d!107147))

(declare-fun d!107149 () Bool)

(declare-fun res!566809 () Bool)

(declare-fun e!465020 () Bool)

(assert (=> d!107149 (=> res!566809 e!465020)))

(assert (=> d!107149 (= res!566809 (or ((_ is Nil!15849) lt!378079) ((_ is Nil!15849) (t!22212 lt!378079))))))

(assert (=> d!107149 (= (isStrictlySorted!430 lt!378079) e!465020)))

(declare-fun b!833619 () Bool)

(declare-fun e!465021 () Bool)

(assert (=> b!833619 (= e!465020 e!465021)))

(declare-fun res!566810 () Bool)

(assert (=> b!833619 (=> (not res!566810) (not e!465021))))

(assert (=> b!833619 (= res!566810 (bvslt (_1!5052 (h!16984 lt!378079)) (_1!5052 (h!16984 (t!22212 lt!378079)))))))

(declare-fun b!833620 () Bool)

(assert (=> b!833620 (= e!465021 (isStrictlySorted!430 (t!22212 lt!378079)))))

(assert (= (and d!107149 (not res!566809)) b!833619))

(assert (= (and b!833619 res!566810) b!833620))

(declare-fun m!778549 () Bool)

(assert (=> b!833620 m!778549))

(assert (=> d!106763 d!107149))

(assert (=> d!106763 d!106981))

(declare-fun d!107151 () Bool)

(declare-fun c!90858 () Bool)

(assert (=> d!107151 (= c!90858 (and ((_ is Cons!15848) (t!22212 (toList!4469 lt!377967))) (= (_1!5052 (h!16984 (t!22212 (toList!4469 lt!377967)))) (_1!5052 lt!377756))))))

(declare-fun e!465022 () Option!423)

(assert (=> d!107151 (= (getValueByKey!417 (t!22212 (toList!4469 lt!377967)) (_1!5052 lt!377756)) e!465022)))

(declare-fun b!833623 () Bool)

(declare-fun e!465023 () Option!423)

(assert (=> b!833623 (= e!465023 (getValueByKey!417 (t!22212 (t!22212 (toList!4469 lt!377967))) (_1!5052 lt!377756)))))

(declare-fun b!833624 () Bool)

(assert (=> b!833624 (= e!465023 None!421)))

(declare-fun b!833622 () Bool)

(assert (=> b!833622 (= e!465022 e!465023)))

(declare-fun c!90859 () Bool)

(assert (=> b!833622 (= c!90859 (and ((_ is Cons!15848) (t!22212 (toList!4469 lt!377967))) (not (= (_1!5052 (h!16984 (t!22212 (toList!4469 lt!377967)))) (_1!5052 lt!377756)))))))

(declare-fun b!833621 () Bool)

(assert (=> b!833621 (= e!465022 (Some!422 (_2!5052 (h!16984 (t!22212 (toList!4469 lt!377967))))))))

(assert (= (and d!107151 c!90858) b!833621))

(assert (= (and d!107151 (not c!90858)) b!833622))

(assert (= (and b!833622 c!90859) b!833623))

(assert (= (and b!833622 (not c!90859)) b!833624))

(declare-fun m!778551 () Bool)

(assert (=> b!833623 m!778551))

(assert (=> b!833004 d!107151))

(declare-fun d!107153 () Bool)

(declare-fun res!566811 () Bool)

(declare-fun e!465024 () Bool)

(assert (=> d!107153 (=> res!566811 e!465024)))

(assert (=> d!107153 (= res!566811 (and ((_ is Cons!15848) (toList!4469 lt!377971)) (= (_1!5052 (h!16984 (toList!4469 lt!377971))) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!107153 (= (containsKey!402 (toList!4469 lt!377971) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!465024)))

(declare-fun b!833625 () Bool)

(declare-fun e!465025 () Bool)

(assert (=> b!833625 (= e!465024 e!465025)))

(declare-fun res!566812 () Bool)

(assert (=> b!833625 (=> (not res!566812) (not e!465025))))

(assert (=> b!833625 (= res!566812 (and (or (not ((_ is Cons!15848) (toList!4469 lt!377971))) (bvsle (_1!5052 (h!16984 (toList!4469 lt!377971))) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) ((_ is Cons!15848) (toList!4469 lt!377971)) (bvslt (_1!5052 (h!16984 (toList!4469 lt!377971))) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!833626 () Bool)

(assert (=> b!833626 (= e!465025 (containsKey!402 (t!22212 (toList!4469 lt!377971)) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and d!107153 (not res!566811)) b!833625))

(assert (= (and b!833625 res!566812) b!833626))

(declare-fun m!778553 () Bool)

(assert (=> b!833626 m!778553))

(assert (=> d!106653 d!107153))

(assert (=> d!106795 d!106793))

(declare-fun d!107155 () Bool)

(assert (=> d!107155 (= (getValueByKey!417 lt!377818 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!422 (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!107155 true))

(declare-fun _$22!579 () Unit!28510)

(assert (=> d!107155 (= (choose!1429 lt!377818 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) _$22!579)))

(declare-fun bs!23323 () Bool)

(assert (= bs!23323 d!107155))

(assert (=> bs!23323 m!777059))

(assert (=> d!106795 d!107155))

(declare-fun d!107157 () Bool)

(declare-fun res!566813 () Bool)

(declare-fun e!465026 () Bool)

(assert (=> d!107157 (=> res!566813 e!465026)))

(assert (=> d!107157 (= res!566813 (or ((_ is Nil!15849) lt!377818) ((_ is Nil!15849) (t!22212 lt!377818))))))

(assert (=> d!107157 (= (isStrictlySorted!430 lt!377818) e!465026)))

(declare-fun b!833627 () Bool)

(declare-fun e!465027 () Bool)

(assert (=> b!833627 (= e!465026 e!465027)))

(declare-fun res!566814 () Bool)

(assert (=> b!833627 (=> (not res!566814) (not e!465027))))

(assert (=> b!833627 (= res!566814 (bvslt (_1!5052 (h!16984 lt!377818)) (_1!5052 (h!16984 (t!22212 lt!377818)))))))

(declare-fun b!833628 () Bool)

(assert (=> b!833628 (= e!465027 (isStrictlySorted!430 (t!22212 lt!377818)))))

(assert (= (and d!107157 (not res!566813)) b!833627))

(assert (= (and b!833627 res!566814) b!833628))

(declare-fun m!778555 () Bool)

(assert (=> b!833628 m!778555))

(assert (=> d!106795 d!107157))

(declare-fun d!107159 () Bool)

(assert (=> d!107159 (= (get!11827 (getValueByKey!417 (toList!4469 (+!1991 lt!377956 (tuple2!10083 lt!377950 minValue!754))) lt!377959)) (v!10101 (getValueByKey!417 (toList!4469 (+!1991 lt!377956 (tuple2!10083 lt!377950 minValue!754))) lt!377959)))))

(assert (=> d!106677 d!107159))

(declare-fun d!107161 () Bool)

(declare-fun c!90860 () Bool)

(assert (=> d!107161 (= c!90860 (and ((_ is Cons!15848) (toList!4469 (+!1991 lt!377956 (tuple2!10083 lt!377950 minValue!754)))) (= (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377956 (tuple2!10083 lt!377950 minValue!754))))) lt!377959)))))

(declare-fun e!465028 () Option!423)

(assert (=> d!107161 (= (getValueByKey!417 (toList!4469 (+!1991 lt!377956 (tuple2!10083 lt!377950 minValue!754))) lt!377959) e!465028)))

(declare-fun e!465029 () Option!423)

(declare-fun b!833631 () Bool)

(assert (=> b!833631 (= e!465029 (getValueByKey!417 (t!22212 (toList!4469 (+!1991 lt!377956 (tuple2!10083 lt!377950 minValue!754)))) lt!377959))))

(declare-fun b!833632 () Bool)

(assert (=> b!833632 (= e!465029 None!421)))

(declare-fun b!833630 () Bool)

(assert (=> b!833630 (= e!465028 e!465029)))

(declare-fun c!90861 () Bool)

(assert (=> b!833630 (= c!90861 (and ((_ is Cons!15848) (toList!4469 (+!1991 lt!377956 (tuple2!10083 lt!377950 minValue!754)))) (not (= (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377956 (tuple2!10083 lt!377950 minValue!754))))) lt!377959))))))

(declare-fun b!833629 () Bool)

(assert (=> b!833629 (= e!465028 (Some!422 (_2!5052 (h!16984 (toList!4469 (+!1991 lt!377956 (tuple2!10083 lt!377950 minValue!754)))))))))

(assert (= (and d!107161 c!90860) b!833629))

(assert (= (and d!107161 (not c!90860)) b!833630))

(assert (= (and b!833630 c!90861) b!833631))

(assert (= (and b!833630 (not c!90861)) b!833632))

(declare-fun m!778557 () Bool)

(assert (=> b!833631 m!778557))

(assert (=> d!106677 d!107161))

(declare-fun d!107163 () Bool)

(assert (=> d!107163 (= (get!11827 (getValueByKey!417 (toList!4469 lt!377861) (select (arr!22331 _keys!976) #b00000000000000000000000000000000))) (v!10101 (getValueByKey!417 (toList!4469 lt!377861) (select (arr!22331 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!106765 d!107163))

(declare-fun d!107165 () Bool)

(declare-fun c!90862 () Bool)

(assert (=> d!107165 (= c!90862 (and ((_ is Cons!15848) (toList!4469 lt!377861)) (= (_1!5052 (h!16984 (toList!4469 lt!377861))) (select (arr!22331 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun e!465030 () Option!423)

(assert (=> d!107165 (= (getValueByKey!417 (toList!4469 lt!377861) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)) e!465030)))

(declare-fun b!833635 () Bool)

(declare-fun e!465031 () Option!423)

(assert (=> b!833635 (= e!465031 (getValueByKey!417 (t!22212 (toList!4469 lt!377861)) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!833636 () Bool)

(assert (=> b!833636 (= e!465031 None!421)))

(declare-fun b!833634 () Bool)

(assert (=> b!833634 (= e!465030 e!465031)))

(declare-fun c!90863 () Bool)

(assert (=> b!833634 (= c!90863 (and ((_ is Cons!15848) (toList!4469 lt!377861)) (not (= (_1!5052 (h!16984 (toList!4469 lt!377861))) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun b!833633 () Bool)

(assert (=> b!833633 (= e!465030 (Some!422 (_2!5052 (h!16984 (toList!4469 lt!377861)))))))

(assert (= (and d!107165 c!90862) b!833633))

(assert (= (and d!107165 (not c!90862)) b!833634))

(assert (= (and b!833634 c!90863) b!833635))

(assert (= (and b!833634 (not c!90863)) b!833636))

(assert (=> b!833635 m!777093))

(declare-fun m!778559 () Bool)

(assert (=> b!833635 m!778559))

(assert (=> d!106765 d!107165))

(declare-fun d!107167 () Bool)

(declare-fun lt!378312 () SeekEntryResult!8696)

(assert (=> d!107167 (and (or ((_ is Undefined!8696) lt!378312) (not ((_ is Found!8696) lt!378312)) (and (bvsge (index!37156 lt!378312) #b00000000000000000000000000000000) (bvslt (index!37156 lt!378312) (size!22751 _keys!976)))) (or ((_ is Undefined!8696) lt!378312) ((_ is Found!8696) lt!378312) (not ((_ is MissingVacant!8696) lt!378312)) (not (= (index!37158 lt!378312) (index!37157 lt!378158))) (and (bvsge (index!37158 lt!378312) #b00000000000000000000000000000000) (bvslt (index!37158 lt!378312) (size!22751 _keys!976)))) (or ((_ is Undefined!8696) lt!378312) (ite ((_ is Found!8696) lt!378312) (= (select (arr!22331 _keys!976) (index!37156 lt!378312)) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)) (and ((_ is MissingVacant!8696) lt!378312) (= (index!37158 lt!378312) (index!37157 lt!378158)) (= (select (arr!22331 _keys!976) (index!37158 lt!378312)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!465038 () SeekEntryResult!8696)

(assert (=> d!107167 (= lt!378312 e!465038)))

(declare-fun c!90871 () Bool)

(assert (=> d!107167 (= c!90871 (bvsge (x!70105 lt!378158) #b01111111111111111111111111111110))))

(declare-fun lt!378311 () (_ BitVec 64))

(assert (=> d!107167 (= lt!378311 (select (arr!22331 _keys!976) (index!37157 lt!378158)))))

(assert (=> d!107167 (validMask!0 mask!1312)))

(assert (=> d!107167 (= (seekKeyOrZeroReturnVacant!0 (x!70105 lt!378158) (index!37157 lt!378158) (index!37157 lt!378158) (select (arr!22331 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) lt!378312)))

(declare-fun b!833649 () Bool)

(declare-fun e!465039 () SeekEntryResult!8696)

(assert (=> b!833649 (= e!465039 (MissingVacant!8696 (index!37157 lt!378158)))))

(declare-fun b!833650 () Bool)

(declare-fun c!90872 () Bool)

(assert (=> b!833650 (= c!90872 (= lt!378311 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!465040 () SeekEntryResult!8696)

(assert (=> b!833650 (= e!465040 e!465039)))

(declare-fun b!833651 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!833651 (= e!465039 (seekKeyOrZeroReturnVacant!0 (bvadd (x!70105 lt!378158) #b00000000000000000000000000000001) (nextIndex!0 (index!37157 lt!378158) (bvadd (x!70105 lt!378158) #b00000000000000000000000000000001) mask!1312) (index!37157 lt!378158) (select (arr!22331 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312))))

(declare-fun b!833652 () Bool)

(assert (=> b!833652 (= e!465038 e!465040)))

(declare-fun c!90870 () Bool)

(assert (=> b!833652 (= c!90870 (= lt!378311 (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!833653 () Bool)

(assert (=> b!833653 (= e!465038 Undefined!8696)))

(declare-fun b!833654 () Bool)

(assert (=> b!833654 (= e!465040 (Found!8696 (index!37157 lt!378158)))))

(assert (= (and d!107167 c!90871) b!833653))

(assert (= (and d!107167 (not c!90871)) b!833652))

(assert (= (and b!833652 c!90870) b!833654))

(assert (= (and b!833652 (not c!90870)) b!833650))

(assert (= (and b!833650 c!90872) b!833649))

(assert (= (and b!833650 (not c!90872)) b!833651))

(declare-fun m!778561 () Bool)

(assert (=> d!107167 m!778561))

(declare-fun m!778563 () Bool)

(assert (=> d!107167 m!778563))

(assert (=> d!107167 m!777899))

(assert (=> d!107167 m!776931))

(declare-fun m!778565 () Bool)

(assert (=> b!833651 m!778565))

(assert (=> b!833651 m!778565))

(assert (=> b!833651 m!777093))

(declare-fun m!778567 () Bool)

(assert (=> b!833651 m!778567))

(assert (=> b!833231 d!107167))

(declare-fun d!107169 () Bool)

(declare-fun res!566815 () Bool)

(declare-fun e!465041 () Bool)

(assert (=> d!107169 (=> res!566815 e!465041)))

(assert (=> d!107169 (= res!566815 (and ((_ is Cons!15848) (toList!4469 (+!1991 lt!377864 (tuple2!10083 lt!377863 lt!377867)))) (= (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377864 (tuple2!10083 lt!377863 lt!377867))))) lt!377865)))))

(assert (=> d!107169 (= (containsKey!402 (toList!4469 (+!1991 lt!377864 (tuple2!10083 lt!377863 lt!377867))) lt!377865) e!465041)))

(declare-fun b!833655 () Bool)

(declare-fun e!465042 () Bool)

(assert (=> b!833655 (= e!465041 e!465042)))

(declare-fun res!566816 () Bool)

(assert (=> b!833655 (=> (not res!566816) (not e!465042))))

(assert (=> b!833655 (= res!566816 (and (or (not ((_ is Cons!15848) (toList!4469 (+!1991 lt!377864 (tuple2!10083 lt!377863 lt!377867))))) (bvsle (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377864 (tuple2!10083 lt!377863 lt!377867))))) lt!377865)) ((_ is Cons!15848) (toList!4469 (+!1991 lt!377864 (tuple2!10083 lt!377863 lt!377867)))) (bvslt (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377864 (tuple2!10083 lt!377863 lt!377867))))) lt!377865)))))

(declare-fun b!833656 () Bool)

(assert (=> b!833656 (= e!465042 (containsKey!402 (t!22212 (toList!4469 (+!1991 lt!377864 (tuple2!10083 lt!377863 lt!377867)))) lt!377865))))

(assert (= (and d!107169 (not res!566815)) b!833655))

(assert (= (and b!833655 res!566816) b!833656))

(declare-fun m!778569 () Bool)

(assert (=> b!833656 m!778569))

(assert (=> d!106875 d!107169))

(declare-fun d!107171 () Bool)

(declare-fun lt!378313 () Bool)

(assert (=> d!107171 (= lt!378313 (select (content!388 (t!22212 (toList!4469 lt!377971))) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun e!465044 () Bool)

(assert (=> d!107171 (= lt!378313 e!465044)))

(declare-fun res!566818 () Bool)

(assert (=> d!107171 (=> (not res!566818) (not e!465044))))

(assert (=> d!107171 (= res!566818 ((_ is Cons!15848) (t!22212 (toList!4469 lt!377971))))))

(assert (=> d!107171 (= (contains!4190 (t!22212 (toList!4469 lt!377971)) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!378313)))

(declare-fun b!833657 () Bool)

(declare-fun e!465043 () Bool)

(assert (=> b!833657 (= e!465044 e!465043)))

(declare-fun res!566817 () Bool)

(assert (=> b!833657 (=> res!566817 e!465043)))

(assert (=> b!833657 (= res!566817 (= (h!16984 (t!22212 (toList!4469 lt!377971))) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!833658 () Bool)

(assert (=> b!833658 (= e!465043 (contains!4190 (t!22212 (t!22212 (toList!4469 lt!377971))) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!107171 res!566818) b!833657))

(assert (= (and b!833657 (not res!566817)) b!833658))

(declare-fun m!778571 () Bool)

(assert (=> d!107171 m!778571))

(declare-fun m!778573 () Bool)

(assert (=> d!107171 m!778573))

(declare-fun m!778575 () Bool)

(assert (=> b!833658 m!778575))

(assert (=> b!833235 d!107171))

(declare-fun d!107173 () Bool)

(declare-fun res!566819 () Bool)

(declare-fun e!465045 () Bool)

(assert (=> d!107173 (=> res!566819 e!465045)))

(assert (=> d!107173 (= res!566819 (and ((_ is Cons!15848) (toList!4469 lt!377854)) (= (_1!5052 (h!16984 (toList!4469 lt!377854))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107173 (= (containsKey!402 (toList!4469 lt!377854) #b1000000000000000000000000000000000000000000000000000000000000000) e!465045)))

(declare-fun b!833659 () Bool)

(declare-fun e!465046 () Bool)

(assert (=> b!833659 (= e!465045 e!465046)))

(declare-fun res!566820 () Bool)

(assert (=> b!833659 (=> (not res!566820) (not e!465046))))

(assert (=> b!833659 (= res!566820 (and (or (not ((_ is Cons!15848) (toList!4469 lt!377854))) (bvsle (_1!5052 (h!16984 (toList!4469 lt!377854))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15848) (toList!4469 lt!377854)) (bvslt (_1!5052 (h!16984 (toList!4469 lt!377854))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!833660 () Bool)

(assert (=> b!833660 (= e!465046 (containsKey!402 (t!22212 (toList!4469 lt!377854)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!107173 (not res!566819)) b!833659))

(assert (= (and b!833659 res!566820) b!833660))

(declare-fun m!778577 () Bool)

(assert (=> b!833660 m!778577))

(assert (=> d!106773 d!107173))

(declare-fun b!833661 () Bool)

(declare-fun e!465048 () Bool)

(declare-fun e!465053 () Bool)

(assert (=> b!833661 (= e!465048 e!465053)))

(assert (=> b!833661 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22751 _keys!976)))))

(declare-fun res!566822 () Bool)

(declare-fun lt!378314 () ListLongMap!8907)

(assert (=> b!833661 (= res!566822 (contains!4189 lt!378314 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!833661 (=> (not res!566822) (not e!465053))))

(declare-fun b!833662 () Bool)

(declare-fun e!465051 () Bool)

(assert (=> b!833662 (= e!465051 (isEmpty!663 lt!378314))))

(declare-fun b!833663 () Bool)

(declare-fun e!465049 () ListLongMap!8907)

(declare-fun e!465050 () ListLongMap!8907)

(assert (=> b!833663 (= e!465049 e!465050)))

(declare-fun c!90874 () Bool)

(assert (=> b!833663 (= c!90874 (validKeyInArray!0 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!833664 () Bool)

(assert (=> b!833664 (= e!465051 (= lt!378314 (getCurrentListMapNoExtraKeys!2539 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun call!36490 () ListLongMap!8907)

(declare-fun bm!36487 () Bool)

(assert (=> bm!36487 (= call!36490 (getCurrentListMapNoExtraKeys!2539 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!833665 () Bool)

(declare-fun e!465047 () Bool)

(assert (=> b!833665 (= e!465047 e!465048)))

(declare-fun c!90875 () Bool)

(declare-fun e!465052 () Bool)

(assert (=> b!833665 (= c!90875 e!465052)))

(declare-fun res!566821 () Bool)

(assert (=> b!833665 (=> (not res!566821) (not e!465052))))

(assert (=> b!833665 (= res!566821 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22751 _keys!976)))))

(declare-fun b!833666 () Bool)

(assert (=> b!833666 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22751 _keys!976)))))

(assert (=> b!833666 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22752 _values!788)))))

(assert (=> b!833666 (= e!465053 (= (apply!373 lt!378314 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))) (get!11826 (select (arr!22332 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!107175 () Bool)

(assert (=> d!107175 e!465047))

(declare-fun res!566823 () Bool)

(assert (=> d!107175 (=> (not res!566823) (not e!465047))))

(assert (=> d!107175 (= res!566823 (not (contains!4189 lt!378314 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107175 (= lt!378314 e!465049)))

(declare-fun c!90873 () Bool)

(assert (=> d!107175 (= c!90873 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22751 _keys!976)))))

(assert (=> d!107175 (validMask!0 mask!1312)))

(assert (=> d!107175 (= (getCurrentListMapNoExtraKeys!2539 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796) lt!378314)))

(declare-fun b!833667 () Bool)

(assert (=> b!833667 (= e!465048 e!465051)))

(declare-fun c!90876 () Bool)

(assert (=> b!833667 (= c!90876 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22751 _keys!976)))))

(declare-fun b!833668 () Bool)

(declare-fun res!566824 () Bool)

(assert (=> b!833668 (=> (not res!566824) (not e!465047))))

(assert (=> b!833668 (= res!566824 (not (contains!4189 lt!378314 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!833669 () Bool)

(assert (=> b!833669 (= e!465050 call!36490)))

(declare-fun b!833670 () Bool)

(assert (=> b!833670 (= e!465049 (ListLongMap!8908 Nil!15849))))

(declare-fun b!833671 () Bool)

(declare-fun lt!378319 () Unit!28510)

(declare-fun lt!378315 () Unit!28510)

(assert (=> b!833671 (= lt!378319 lt!378315)))

(declare-fun lt!378316 () (_ BitVec 64))

(declare-fun lt!378317 () ListLongMap!8907)

(declare-fun lt!378320 () V!25283)

(declare-fun lt!378318 () (_ BitVec 64))

(assert (=> b!833671 (not (contains!4189 (+!1991 lt!378317 (tuple2!10083 lt!378316 lt!378320)) lt!378318))))

(assert (=> b!833671 (= lt!378315 (addStillNotContains!200 lt!378317 lt!378316 lt!378320 lt!378318))))

(assert (=> b!833671 (= lt!378318 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!833671 (= lt!378320 (get!11826 (select (arr!22332 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!833671 (= lt!378316 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!833671 (= lt!378317 call!36490)))

(assert (=> b!833671 (= e!465050 (+!1991 call!36490 (tuple2!10083 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (get!11826 (select (arr!22332 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!833672 () Bool)

(assert (=> b!833672 (= e!465052 (validKeyInArray!0 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!833672 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (= (and d!107175 c!90873) b!833670))

(assert (= (and d!107175 (not c!90873)) b!833663))

(assert (= (and b!833663 c!90874) b!833671))

(assert (= (and b!833663 (not c!90874)) b!833669))

(assert (= (or b!833671 b!833669) bm!36487))

(assert (= (and d!107175 res!566823) b!833668))

(assert (= (and b!833668 res!566824) b!833665))

(assert (= (and b!833665 res!566821) b!833672))

(assert (= (and b!833665 c!90875) b!833661))

(assert (= (and b!833665 (not c!90875)) b!833667))

(assert (= (and b!833661 res!566822) b!833666))

(assert (= (and b!833667 c!90876) b!833664))

(assert (= (and b!833667 (not c!90876)) b!833662))

(declare-fun b_lambda!11461 () Bool)

(assert (=> (not b_lambda!11461) (not b!833666)))

(assert (=> b!833666 t!22218))

(declare-fun b_and!22599 () Bool)

(assert (= b_and!22597 (and (=> t!22218 result!8013) b_and!22599)))

(declare-fun b_lambda!11463 () Bool)

(assert (=> (not b_lambda!11463) (not b!833671)))

(assert (=> b!833671 t!22218))

(declare-fun b_and!22601 () Bool)

(assert (= b_and!22599 (and (=> t!22218 result!8013) b_and!22601)))

(assert (=> b!833666 m!778139))

(assert (=> b!833666 m!778141))

(assert (=> b!833666 m!777109))

(assert (=> b!833666 m!778139))

(declare-fun m!778579 () Bool)

(assert (=> b!833666 m!778579))

(assert (=> b!833666 m!778141))

(assert (=> b!833666 m!777109))

(assert (=> b!833666 m!778145))

(assert (=> b!833663 m!778139))

(assert (=> b!833663 m!778139))

(assert (=> b!833663 m!778147))

(assert (=> b!833672 m!778139))

(assert (=> b!833672 m!778139))

(assert (=> b!833672 m!778147))

(declare-fun m!778581 () Bool)

(assert (=> b!833662 m!778581))

(declare-fun m!778583 () Bool)

(assert (=> b!833671 m!778583))

(assert (=> b!833671 m!778139))

(assert (=> b!833671 m!778141))

(assert (=> b!833671 m!777109))

(assert (=> b!833671 m!778583))

(declare-fun m!778585 () Bool)

(assert (=> b!833671 m!778585))

(declare-fun m!778587 () Bool)

(assert (=> b!833671 m!778587))

(declare-fun m!778589 () Bool)

(assert (=> b!833671 m!778589))

(assert (=> b!833671 m!778141))

(assert (=> b!833671 m!777109))

(assert (=> b!833671 m!778145))

(assert (=> b!833661 m!778139))

(assert (=> b!833661 m!778139))

(declare-fun m!778591 () Bool)

(assert (=> b!833661 m!778591))

(declare-fun m!778593 () Bool)

(assert (=> b!833664 m!778593))

(assert (=> bm!36487 m!778593))

(declare-fun m!778595 () Bool)

(assert (=> d!107175 m!778595))

(assert (=> d!107175 m!776931))

(declare-fun m!778597 () Bool)

(assert (=> b!833668 m!778597))

(assert (=> b!833027 d!107175))

(assert (=> d!106781 d!106779))

(declare-fun d!107177 () Bool)

(assert (=> d!107177 (= (getValueByKey!417 lt!377874 (_1!5052 lt!377756)) (Some!422 (_2!5052 lt!377756)))))

(assert (=> d!107177 true))

(declare-fun _$22!580 () Unit!28510)

(assert (=> d!107177 (= (choose!1429 lt!377874 (_1!5052 lt!377756) (_2!5052 lt!377756)) _$22!580)))

(declare-fun bs!23324 () Bool)

(assert (= bs!23324 d!107177))

(assert (=> bs!23324 m!777171))

(assert (=> d!106781 d!107177))

(declare-fun d!107179 () Bool)

(declare-fun res!566825 () Bool)

(declare-fun e!465054 () Bool)

(assert (=> d!107179 (=> res!566825 e!465054)))

(assert (=> d!107179 (= res!566825 (or ((_ is Nil!15849) lt!377874) ((_ is Nil!15849) (t!22212 lt!377874))))))

(assert (=> d!107179 (= (isStrictlySorted!430 lt!377874) e!465054)))

(declare-fun b!833673 () Bool)

(declare-fun e!465055 () Bool)

(assert (=> b!833673 (= e!465054 e!465055)))

(declare-fun res!566826 () Bool)

(assert (=> b!833673 (=> (not res!566826) (not e!465055))))

(assert (=> b!833673 (= res!566826 (bvslt (_1!5052 (h!16984 lt!377874)) (_1!5052 (h!16984 (t!22212 lt!377874)))))))

(declare-fun b!833674 () Bool)

(assert (=> b!833674 (= e!465055 (isStrictlySorted!430 (t!22212 lt!377874)))))

(assert (= (and d!107179 (not res!566825)) b!833673))

(assert (= (and b!833673 res!566826) b!833674))

(declare-fun m!778599 () Bool)

(assert (=> b!833674 m!778599))

(assert (=> d!106781 d!107179))

(declare-fun d!107181 () Bool)

(assert (=> d!107181 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377947) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!378321 () Unit!28510)

(assert (=> d!107181 (= lt!378321 (choose!1433 (toList!4469 lt!377947) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!465056 () Bool)

(assert (=> d!107181 e!465056))

(declare-fun res!566827 () Bool)

(assert (=> d!107181 (=> (not res!566827) (not e!465056))))

(assert (=> d!107181 (= res!566827 (isStrictlySorted!430 (toList!4469 lt!377947)))))

(assert (=> d!107181 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377947) #b1000000000000000000000000000000000000000000000000000000000000000) lt!378321)))

(declare-fun b!833675 () Bool)

(assert (=> b!833675 (= e!465056 (containsKey!402 (toList!4469 lt!377947) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!107181 res!566827) b!833675))

(assert (=> d!107181 m!777515))

(assert (=> d!107181 m!777515))

(assert (=> d!107181 m!777517))

(declare-fun m!778601 () Bool)

(assert (=> d!107181 m!778601))

(declare-fun m!778603 () Bool)

(assert (=> d!107181 m!778603))

(assert (=> b!833675 m!777511))

(assert (=> b!833038 d!107181))

(declare-fun d!107183 () Bool)

(assert (=> d!107183 (= (isDefined!312 (getValueByKey!417 (toList!4469 lt!377947) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!665 (getValueByKey!417 (toList!4469 lt!377947) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23325 () Bool)

(assert (= bs!23325 d!107183))

(assert (=> bs!23325 m!777515))

(declare-fun m!778605 () Bool)

(assert (=> bs!23325 m!778605))

(assert (=> b!833038 d!107183))

(declare-fun d!107185 () Bool)

(declare-fun c!90877 () Bool)

(assert (=> d!107185 (= c!90877 (and ((_ is Cons!15848) (toList!4469 lt!377947)) (= (_1!5052 (h!16984 (toList!4469 lt!377947))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!465057 () Option!423)

(assert (=> d!107185 (= (getValueByKey!417 (toList!4469 lt!377947) #b1000000000000000000000000000000000000000000000000000000000000000) e!465057)))

(declare-fun b!833678 () Bool)

(declare-fun e!465058 () Option!423)

(assert (=> b!833678 (= e!465058 (getValueByKey!417 (t!22212 (toList!4469 lt!377947)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!833679 () Bool)

(assert (=> b!833679 (= e!465058 None!421)))

(declare-fun b!833677 () Bool)

(assert (=> b!833677 (= e!465057 e!465058)))

(declare-fun c!90878 () Bool)

(assert (=> b!833677 (= c!90878 (and ((_ is Cons!15848) (toList!4469 lt!377947)) (not (= (_1!5052 (h!16984 (toList!4469 lt!377947))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!833676 () Bool)

(assert (=> b!833676 (= e!465057 (Some!422 (_2!5052 (h!16984 (toList!4469 lt!377947)))))))

(assert (= (and d!107185 c!90877) b!833676))

(assert (= (and d!107185 (not c!90877)) b!833677))

(assert (= (and b!833677 c!90878) b!833678))

(assert (= (and b!833677 (not c!90878)) b!833679))

(declare-fun m!778607 () Bool)

(assert (=> b!833678 m!778607))

(assert (=> b!833038 d!107185))

(declare-fun d!107187 () Bool)

(assert (=> d!107187 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377947) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun lt!378322 () Unit!28510)

(assert (=> d!107187 (= lt!378322 (choose!1433 (toList!4469 lt!377947) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun e!465059 () Bool)

(assert (=> d!107187 e!465059))

(declare-fun res!566828 () Bool)

(assert (=> d!107187 (=> (not res!566828) (not e!465059))))

(assert (=> d!107187 (= res!566828 (isStrictlySorted!430 (toList!4469 lt!377947)))))

(assert (=> d!107187 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377947) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)) lt!378322)))

(declare-fun b!833680 () Bool)

(assert (=> b!833680 (= e!465059 (containsKey!402 (toList!4469 lt!377947) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!107187 res!566828) b!833680))

(assert (=> d!107187 m!777093))

(assert (=> d!107187 m!777781))

(assert (=> d!107187 m!777781))

(assert (=> d!107187 m!777881))

(assert (=> d!107187 m!777093))

(declare-fun m!778609 () Bool)

(assert (=> d!107187 m!778609))

(assert (=> d!107187 m!778603))

(assert (=> b!833680 m!777093))

(assert (=> b!833680 m!777877))

(assert (=> b!833207 d!107187))

(declare-fun d!107189 () Bool)

(assert (=> d!107189 (= (isDefined!312 (getValueByKey!417 (toList!4469 lt!377947) (select (arr!22331 _keys!976) #b00000000000000000000000000000000))) (not (isEmpty!665 (getValueByKey!417 (toList!4469 lt!377947) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun bs!23326 () Bool)

(assert (= bs!23326 d!107189))

(assert (=> bs!23326 m!777781))

(declare-fun m!778611 () Bool)

(assert (=> bs!23326 m!778611))

(assert (=> b!833207 d!107189))

(assert (=> b!833207 d!107045))

(declare-fun d!107191 () Bool)

(assert (=> d!107191 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377861) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!378323 () Unit!28510)

(assert (=> d!107191 (= lt!378323 (choose!1433 (toList!4469 lt!377861) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!465060 () Bool)

(assert (=> d!107191 e!465060))

(declare-fun res!566829 () Bool)

(assert (=> d!107191 (=> (not res!566829) (not e!465060))))

(assert (=> d!107191 (= res!566829 (isStrictlySorted!430 (toList!4469 lt!377861)))))

(assert (=> d!107191 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377861) #b1000000000000000000000000000000000000000000000000000000000000000) lt!378323)))

(declare-fun b!833681 () Bool)

(assert (=> b!833681 (= e!465060 (containsKey!402 (toList!4469 lt!377861) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!107191 res!566829) b!833681))

(assert (=> d!107191 m!777741))

(assert (=> d!107191 m!777741))

(assert (=> d!107191 m!777743))

(declare-fun m!778613 () Bool)

(assert (=> d!107191 m!778613))

(declare-fun m!778615 () Bool)

(assert (=> d!107191 m!778615))

(assert (=> b!833681 m!777737))

(assert (=> b!833122 d!107191))

(declare-fun d!107193 () Bool)

(assert (=> d!107193 (= (isDefined!312 (getValueByKey!417 (toList!4469 lt!377861) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!665 (getValueByKey!417 (toList!4469 lt!377861) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23327 () Bool)

(assert (= bs!23327 d!107193))

(assert (=> bs!23327 m!777741))

(declare-fun m!778617 () Bool)

(assert (=> bs!23327 m!778617))

(assert (=> b!833122 d!107193))

(declare-fun d!107195 () Bool)

(declare-fun c!90879 () Bool)

(assert (=> d!107195 (= c!90879 (and ((_ is Cons!15848) (toList!4469 lt!377861)) (= (_1!5052 (h!16984 (toList!4469 lt!377861))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!465061 () Option!423)

(assert (=> d!107195 (= (getValueByKey!417 (toList!4469 lt!377861) #b1000000000000000000000000000000000000000000000000000000000000000) e!465061)))

(declare-fun b!833684 () Bool)

(declare-fun e!465062 () Option!423)

(assert (=> b!833684 (= e!465062 (getValueByKey!417 (t!22212 (toList!4469 lt!377861)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!833685 () Bool)

(assert (=> b!833685 (= e!465062 None!421)))

(declare-fun b!833683 () Bool)

(assert (=> b!833683 (= e!465061 e!465062)))

(declare-fun c!90880 () Bool)

(assert (=> b!833683 (= c!90880 (and ((_ is Cons!15848) (toList!4469 lt!377861)) (not (= (_1!5052 (h!16984 (toList!4469 lt!377861))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!833682 () Bool)

(assert (=> b!833682 (= e!465061 (Some!422 (_2!5052 (h!16984 (toList!4469 lt!377861)))))))

(assert (= (and d!107195 c!90879) b!833682))

(assert (= (and d!107195 (not c!90879)) b!833683))

(assert (= (and b!833683 c!90880) b!833684))

(assert (= (and b!833683 (not c!90880)) b!833685))

(declare-fun m!778619 () Bool)

(assert (=> b!833684 m!778619))

(assert (=> b!833122 d!107195))

(declare-fun d!107197 () Bool)

(assert (=> d!107197 (= (get!11827 (getValueByKey!417 (toList!4469 lt!377934) lt!377937)) (v!10101 (getValueByKey!417 (toList!4469 lt!377934) lt!377937)))))

(assert (=> d!106729 d!107197))

(declare-fun d!107199 () Bool)

(declare-fun c!90881 () Bool)

(assert (=> d!107199 (= c!90881 (and ((_ is Cons!15848) (toList!4469 lt!377934)) (= (_1!5052 (h!16984 (toList!4469 lt!377934))) lt!377937)))))

(declare-fun e!465063 () Option!423)

(assert (=> d!107199 (= (getValueByKey!417 (toList!4469 lt!377934) lt!377937) e!465063)))

(declare-fun b!833688 () Bool)

(declare-fun e!465064 () Option!423)

(assert (=> b!833688 (= e!465064 (getValueByKey!417 (t!22212 (toList!4469 lt!377934)) lt!377937))))

(declare-fun b!833689 () Bool)

(assert (=> b!833689 (= e!465064 None!421)))

(declare-fun b!833687 () Bool)

(assert (=> b!833687 (= e!465063 e!465064)))

(declare-fun c!90882 () Bool)

(assert (=> b!833687 (= c!90882 (and ((_ is Cons!15848) (toList!4469 lt!377934)) (not (= (_1!5052 (h!16984 (toList!4469 lt!377934))) lt!377937))))))

(declare-fun b!833686 () Bool)

(assert (=> b!833686 (= e!465063 (Some!422 (_2!5052 (h!16984 (toList!4469 lt!377934)))))))

(assert (= (and d!107199 c!90881) b!833686))

(assert (= (and d!107199 (not c!90881)) b!833687))

(assert (= (and b!833687 c!90882) b!833688))

(assert (= (and b!833687 (not c!90882)) b!833689))

(declare-fun m!778621 () Bool)

(assert (=> b!833688 m!778621))

(assert (=> d!106729 d!107199))

(declare-fun d!107201 () Bool)

(declare-fun e!465066 () Bool)

(assert (=> d!107201 e!465066))

(declare-fun res!566830 () Bool)

(assert (=> d!107201 (=> res!566830 e!465066)))

(declare-fun lt!378324 () Bool)

(assert (=> d!107201 (= res!566830 (not lt!378324))))

(declare-fun lt!378327 () Bool)

(assert (=> d!107201 (= lt!378324 lt!378327)))

(declare-fun lt!378325 () Unit!28510)

(declare-fun e!465065 () Unit!28510)

(assert (=> d!107201 (= lt!378325 e!465065)))

(declare-fun c!90883 () Bool)

(assert (=> d!107201 (= c!90883 lt!378327)))

(assert (=> d!107201 (= lt!378327 (containsKey!402 (toList!4469 lt!378180) (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!107201 (= (contains!4189 lt!378180 (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!378324)))

(declare-fun b!833690 () Bool)

(declare-fun lt!378326 () Unit!28510)

(assert (=> b!833690 (= e!465065 lt!378326)))

(assert (=> b!833690 (= lt!378326 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!378180) (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!833690 (isDefined!312 (getValueByKey!417 (toList!4469 lt!378180) (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!833691 () Bool)

(declare-fun Unit!28550 () Unit!28510)

(assert (=> b!833691 (= e!465065 Unit!28550)))

(declare-fun b!833692 () Bool)

(assert (=> b!833692 (= e!465066 (isDefined!312 (getValueByKey!417 (toList!4469 lt!378180) (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!107201 c!90883) b!833690))

(assert (= (and d!107201 (not c!90883)) b!833691))

(assert (= (and d!107201 (not res!566830)) b!833692))

(declare-fun m!778623 () Bool)

(assert (=> d!107201 m!778623))

(declare-fun m!778625 () Bool)

(assert (=> b!833690 m!778625))

(assert (=> b!833690 m!777973))

(assert (=> b!833690 m!777973))

(declare-fun m!778627 () Bool)

(assert (=> b!833690 m!778627))

(assert (=> b!833692 m!777973))

(assert (=> b!833692 m!777973))

(assert (=> b!833692 m!778627))

(assert (=> d!106865 d!107201))

(declare-fun c!90884 () Bool)

(declare-fun d!107203 () Bool)

(assert (=> d!107203 (= c!90884 (and ((_ is Cons!15848) lt!378179) (= (_1!5052 (h!16984 lt!378179)) (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!465067 () Option!423)

(assert (=> d!107203 (= (getValueByKey!417 lt!378179 (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!465067)))

(declare-fun b!833695 () Bool)

(declare-fun e!465068 () Option!423)

(assert (=> b!833695 (= e!465068 (getValueByKey!417 (t!22212 lt!378179) (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!833696 () Bool)

(assert (=> b!833696 (= e!465068 None!421)))

(declare-fun b!833694 () Bool)

(assert (=> b!833694 (= e!465067 e!465068)))

(declare-fun c!90885 () Bool)

(assert (=> b!833694 (= c!90885 (and ((_ is Cons!15848) lt!378179) (not (= (_1!5052 (h!16984 lt!378179)) (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!833693 () Bool)

(assert (=> b!833693 (= e!465067 (Some!422 (_2!5052 (h!16984 lt!378179))))))

(assert (= (and d!107203 c!90884) b!833693))

(assert (= (and d!107203 (not c!90884)) b!833694))

(assert (= (and b!833694 c!90885) b!833695))

(assert (= (and b!833694 (not c!90885)) b!833696))

(declare-fun m!778629 () Bool)

(assert (=> b!833695 m!778629))

(assert (=> d!106865 d!107203))

(declare-fun d!107205 () Bool)

(assert (=> d!107205 (= (getValueByKey!417 lt!378179 (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!422 (_2!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!378328 () Unit!28510)

(assert (=> d!107205 (= lt!378328 (choose!1429 lt!378179 (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!465069 () Bool)

(assert (=> d!107205 e!465069))

(declare-fun res!566831 () Bool)

(assert (=> d!107205 (=> (not res!566831) (not e!465069))))

(assert (=> d!107205 (= res!566831 (isStrictlySorted!430 lt!378179))))

(assert (=> d!107205 (= (lemmaContainsTupThenGetReturnValue!231 lt!378179 (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!378328)))

(declare-fun b!833697 () Bool)

(declare-fun res!566832 () Bool)

(assert (=> b!833697 (=> (not res!566832) (not e!465069))))

(assert (=> b!833697 (= res!566832 (containsKey!402 lt!378179 (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!833698 () Bool)

(assert (=> b!833698 (= e!465069 (contains!4190 lt!378179 (tuple2!10083 (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!107205 res!566831) b!833697))

(assert (= (and b!833697 res!566832) b!833698))

(assert (=> d!107205 m!777967))

(declare-fun m!778631 () Bool)

(assert (=> d!107205 m!778631))

(declare-fun m!778633 () Bool)

(assert (=> d!107205 m!778633))

(declare-fun m!778635 () Bool)

(assert (=> b!833697 m!778635))

(declare-fun m!778637 () Bool)

(assert (=> b!833698 m!778637))

(assert (=> d!106865 d!107205))

(declare-fun bm!36488 () Bool)

(declare-fun call!36492 () List!15852)

(declare-fun e!465071 () List!15852)

(declare-fun c!90886 () Bool)

(assert (=> bm!36488 (= call!36492 ($colon$colon!534 e!465071 (ite c!90886 (h!16984 (toList!4469 call!36409)) (tuple2!10083 (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!90889 () Bool)

(assert (=> bm!36488 (= c!90889 c!90886)))

(declare-fun bm!36489 () Bool)

(declare-fun call!36493 () List!15852)

(assert (=> bm!36489 (= call!36493 call!36492)))

(declare-fun bm!36490 () Bool)

(declare-fun call!36491 () List!15852)

(assert (=> bm!36490 (= call!36491 call!36493)))

(declare-fun b!833699 () Bool)

(declare-fun c!90887 () Bool)

(assert (=> b!833699 (= c!90887 (and ((_ is Cons!15848) (toList!4469 call!36409)) (bvsgt (_1!5052 (h!16984 (toList!4469 call!36409))) (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!465070 () List!15852)

(declare-fun e!465073 () List!15852)

(assert (=> b!833699 (= e!465070 e!465073)))

(declare-fun b!833700 () Bool)

(assert (=> b!833700 (= e!465073 call!36491)))

(declare-fun b!833701 () Bool)

(assert (=> b!833701 (= e!465071 (insertStrictlySorted!270 (t!22212 (toList!4469 call!36409)) (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!833702 () Bool)

(declare-fun e!465072 () List!15852)

(assert (=> b!833702 (= e!465072 call!36492)))

(declare-fun b!833703 () Bool)

(declare-fun lt!378329 () List!15852)

(declare-fun e!465074 () Bool)

(assert (=> b!833703 (= e!465074 (contains!4190 lt!378329 (tuple2!10083 (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!833704 () Bool)

(declare-fun c!90888 () Bool)

(assert (=> b!833704 (= e!465071 (ite c!90888 (t!22212 (toList!4469 call!36409)) (ite c!90887 (Cons!15848 (h!16984 (toList!4469 call!36409)) (t!22212 (toList!4469 call!36409))) Nil!15849)))))

(declare-fun b!833705 () Bool)

(assert (=> b!833705 (= e!465072 e!465070)))

(assert (=> b!833705 (= c!90888 (and ((_ is Cons!15848) (toList!4469 call!36409)) (= (_1!5052 (h!16984 (toList!4469 call!36409))) (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!833706 () Bool)

(assert (=> b!833706 (= e!465070 call!36493)))

(declare-fun b!833707 () Bool)

(declare-fun res!566834 () Bool)

(assert (=> b!833707 (=> (not res!566834) (not e!465074))))

(assert (=> b!833707 (= res!566834 (containsKey!402 lt!378329 (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun d!107207 () Bool)

(assert (=> d!107207 e!465074))

(declare-fun res!566833 () Bool)

(assert (=> d!107207 (=> (not res!566833) (not e!465074))))

(assert (=> d!107207 (= res!566833 (isStrictlySorted!430 lt!378329))))

(assert (=> d!107207 (= lt!378329 e!465072)))

(assert (=> d!107207 (= c!90886 (and ((_ is Cons!15848) (toList!4469 call!36409)) (bvslt (_1!5052 (h!16984 (toList!4469 call!36409))) (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!107207 (isStrictlySorted!430 (toList!4469 call!36409))))

(assert (=> d!107207 (= (insertStrictlySorted!270 (toList!4469 call!36409) (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!378329)))

(declare-fun b!833708 () Bool)

(assert (=> b!833708 (= e!465073 call!36491)))

(assert (= (and d!107207 c!90886) b!833702))

(assert (= (and d!107207 (not c!90886)) b!833705))

(assert (= (and b!833705 c!90888) b!833706))

(assert (= (and b!833705 (not c!90888)) b!833699))

(assert (= (and b!833699 c!90887) b!833700))

(assert (= (and b!833699 (not c!90887)) b!833708))

(assert (= (or b!833700 b!833708) bm!36490))

(assert (= (or b!833706 bm!36490) bm!36489))

(assert (= (or b!833702 bm!36489) bm!36488))

(assert (= (and bm!36488 c!90889) b!833701))

(assert (= (and bm!36488 (not c!90889)) b!833704))

(assert (= (and d!107207 res!566833) b!833707))

(assert (= (and b!833707 res!566834) b!833703))

(declare-fun m!778639 () Bool)

(assert (=> bm!36488 m!778639))

(declare-fun m!778641 () Bool)

(assert (=> b!833703 m!778641))

(declare-fun m!778643 () Bool)

(assert (=> b!833701 m!778643))

(declare-fun m!778645 () Bool)

(assert (=> b!833707 m!778645))

(declare-fun m!778647 () Bool)

(assert (=> d!107207 m!778647))

(declare-fun m!778649 () Bool)

(assert (=> d!107207 m!778649))

(assert (=> d!106865 d!107207))

(declare-fun d!107209 () Bool)

(declare-fun c!90890 () Bool)

(assert (=> d!107209 (= c!90890 ((_ is Nil!15849) (toList!4469 lt!377967)))))

(declare-fun e!465075 () (InoxSet tuple2!10082))

(assert (=> d!107209 (= (content!388 (toList!4469 lt!377967)) e!465075)))

(declare-fun b!833709 () Bool)

(assert (=> b!833709 (= e!465075 ((as const (Array tuple2!10082 Bool)) false))))

(declare-fun b!833710 () Bool)

(assert (=> b!833710 (= e!465075 ((_ map or) (store ((as const (Array tuple2!10082 Bool)) false) (h!16984 (toList!4469 lt!377967)) true) (content!388 (t!22212 (toList!4469 lt!377967)))))))

(assert (= (and d!107209 c!90890) b!833709))

(assert (= (and d!107209 (not c!90890)) b!833710))

(declare-fun m!778651 () Bool)

(assert (=> b!833710 m!778651))

(assert (=> b!833710 m!778169))

(assert (=> d!106845 d!107209))

(declare-fun d!107211 () Bool)

(declare-fun res!566835 () Bool)

(declare-fun e!465076 () Bool)

(assert (=> d!107211 (=> res!566835 e!465076)))

(assert (=> d!107211 (= res!566835 (and ((_ is Cons!15848) lt!378129) (= (_1!5052 (h!16984 lt!378129)) (_1!5052 lt!377756))))))

(assert (=> d!107211 (= (containsKey!402 lt!378129 (_1!5052 lt!377756)) e!465076)))

(declare-fun b!833711 () Bool)

(declare-fun e!465077 () Bool)

(assert (=> b!833711 (= e!465076 e!465077)))

(declare-fun res!566836 () Bool)

(assert (=> b!833711 (=> (not res!566836) (not e!465077))))

(assert (=> b!833711 (= res!566836 (and (or (not ((_ is Cons!15848) lt!378129)) (bvsle (_1!5052 (h!16984 lt!378129)) (_1!5052 lt!377756))) ((_ is Cons!15848) lt!378129) (bvslt (_1!5052 (h!16984 lt!378129)) (_1!5052 lt!377756))))))

(declare-fun b!833712 () Bool)

(assert (=> b!833712 (= e!465077 (containsKey!402 (t!22212 lt!378129) (_1!5052 lt!377756)))))

(assert (= (and d!107211 (not res!566835)) b!833711))

(assert (= (and b!833711 res!566836) b!833712))

(declare-fun m!778653 () Bool)

(assert (=> b!833712 m!778653))

(assert (=> b!833181 d!107211))

(declare-fun d!107213 () Bool)

(declare-fun lt!378330 () Bool)

(assert (=> d!107213 (= lt!378330 (select (content!388 lt!378213) (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))))))

(declare-fun e!465079 () Bool)

(assert (=> d!107213 (= lt!378330 e!465079)))

(declare-fun res!566838 () Bool)

(assert (=> d!107213 (=> (not res!566838) (not e!465079))))

(assert (=> d!107213 (= res!566838 ((_ is Cons!15848) lt!378213))))

(assert (=> d!107213 (= (contains!4190 lt!378213 (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))) lt!378330)))

(declare-fun b!833713 () Bool)

(declare-fun e!465078 () Bool)

(assert (=> b!833713 (= e!465079 e!465078)))

(declare-fun res!566837 () Bool)

(assert (=> b!833713 (=> res!566837 e!465078)))

(assert (=> b!833713 (= res!566837 (= (h!16984 lt!378213) (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))))))

(declare-fun b!833714 () Bool)

(assert (=> b!833714 (= e!465078 (contains!4190 (t!22212 lt!378213) (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))))))

(assert (= (and d!107213 res!566838) b!833713))

(assert (= (and b!833713 (not res!566837)) b!833714))

(declare-fun m!778655 () Bool)

(assert (=> d!107213 m!778655))

(declare-fun m!778657 () Bool)

(assert (=> d!107213 m!778657))

(declare-fun m!778659 () Bool)

(assert (=> b!833714 m!778659))

(assert (=> b!833316 d!107213))

(assert (=> d!106739 d!106741))

(declare-fun d!107215 () Bool)

(declare-fun e!465081 () Bool)

(assert (=> d!107215 e!465081))

(declare-fun res!566839 () Bool)

(assert (=> d!107215 (=> res!566839 e!465081)))

(declare-fun lt!378331 () Bool)

(assert (=> d!107215 (= res!566839 (not lt!378331))))

(declare-fun lt!378334 () Bool)

(assert (=> d!107215 (= lt!378331 lt!378334)))

(declare-fun lt!378332 () Unit!28510)

(declare-fun e!465080 () Unit!28510)

(assert (=> d!107215 (= lt!378332 e!465080)))

(declare-fun c!90891 () Bool)

(assert (=> d!107215 (= c!90891 lt!378334)))

(assert (=> d!107215 (= lt!378334 (containsKey!402 (toList!4469 lt!377923) lt!377931))))

(assert (=> d!107215 (= (contains!4189 lt!377923 lt!377931) lt!378331)))

(declare-fun b!833715 () Bool)

(declare-fun lt!378333 () Unit!28510)

(assert (=> b!833715 (= e!465080 lt!378333)))

(assert (=> b!833715 (= lt!378333 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377923) lt!377931))))

(assert (=> b!833715 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377923) lt!377931))))

(declare-fun b!833716 () Bool)

(declare-fun Unit!28551 () Unit!28510)

(assert (=> b!833716 (= e!465080 Unit!28551)))

(declare-fun b!833717 () Bool)

(assert (=> b!833717 (= e!465081 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377923) lt!377931)))))

(assert (= (and d!107215 c!90891) b!833715))

(assert (= (and d!107215 (not c!90891)) b!833716))

(assert (= (and d!107215 (not res!566839)) b!833717))

(declare-fun m!778661 () Bool)

(assert (=> d!107215 m!778661))

(declare-fun m!778663 () Bool)

(assert (=> b!833715 m!778663))

(assert (=> b!833715 m!777601))

(assert (=> b!833715 m!777601))

(declare-fun m!778665 () Bool)

(assert (=> b!833715 m!778665))

(assert (=> b!833717 m!777601))

(assert (=> b!833717 m!777601))

(assert (=> b!833717 m!778665))

(assert (=> d!106739 d!107215))

(assert (=> d!106739 d!106745))

(assert (=> d!106739 d!106733))

(declare-fun d!107217 () Bool)

(assert (=> d!107217 (= (apply!373 (+!1991 lt!377923 (tuple2!10083 lt!377929 zeroValueBefore!34)) lt!377931) (apply!373 lt!377923 lt!377931))))

(assert (=> d!107217 true))

(declare-fun _$34!1151 () Unit!28510)

(assert (=> d!107217 (= (choose!1430 lt!377923 lt!377929 zeroValueBefore!34 lt!377931) _$34!1151)))

(declare-fun bs!23328 () Bool)

(assert (= bs!23328 d!107217))

(assert (=> bs!23328 m!777207))

(assert (=> bs!23328 m!777207))

(assert (=> bs!23328 m!777209))

(assert (=> bs!23328 m!777215))

(assert (=> d!106739 d!107217))

(assert (=> bm!36453 d!106929))

(declare-fun d!107219 () Bool)

(declare-fun lt!378335 () Bool)

(assert (=> d!107219 (= lt!378335 (select (content!388 (t!22212 (toList!4469 lt!377815))) lt!377756))))

(declare-fun e!465083 () Bool)

(assert (=> d!107219 (= lt!378335 e!465083)))

(declare-fun res!566841 () Bool)

(assert (=> d!107219 (=> (not res!566841) (not e!465083))))

(assert (=> d!107219 (= res!566841 ((_ is Cons!15848) (t!22212 (toList!4469 lt!377815))))))

(assert (=> d!107219 (= (contains!4190 (t!22212 (toList!4469 lt!377815)) lt!377756) lt!378335)))

(declare-fun b!833718 () Bool)

(declare-fun e!465082 () Bool)

(assert (=> b!833718 (= e!465083 e!465082)))

(declare-fun res!566840 () Bool)

(assert (=> b!833718 (=> res!566840 e!465082)))

(assert (=> b!833718 (= res!566840 (= (h!16984 (t!22212 (toList!4469 lt!377815))) lt!377756))))

(declare-fun b!833719 () Bool)

(assert (=> b!833719 (= e!465082 (contains!4190 (t!22212 (t!22212 (toList!4469 lt!377815))) lt!377756))))

(assert (= (and d!107219 res!566841) b!833718))

(assert (= (and b!833718 (not res!566840)) b!833719))

(declare-fun m!778667 () Bool)

(assert (=> d!107219 m!778667))

(declare-fun m!778669 () Bool)

(assert (=> d!107219 m!778669))

(declare-fun m!778671 () Bool)

(assert (=> b!833719 m!778671))

(assert (=> b!833037 d!107219))

(declare-fun d!107221 () Bool)

(declare-fun lt!378336 () Bool)

(assert (=> d!107221 (= lt!378336 (select (content!388 (toList!4469 lt!378069)) (tuple2!10083 lt!377933 minValue!754)))))

(declare-fun e!465085 () Bool)

(assert (=> d!107221 (= lt!378336 e!465085)))

(declare-fun res!566843 () Bool)

(assert (=> d!107221 (=> (not res!566843) (not e!465085))))

(assert (=> d!107221 (= res!566843 ((_ is Cons!15848) (toList!4469 lt!378069)))))

(assert (=> d!107221 (= (contains!4190 (toList!4469 lt!378069) (tuple2!10083 lt!377933 minValue!754)) lt!378336)))

(declare-fun b!833720 () Bool)

(declare-fun e!465084 () Bool)

(assert (=> b!833720 (= e!465085 e!465084)))

(declare-fun res!566842 () Bool)

(assert (=> b!833720 (=> res!566842 e!465084)))

(assert (=> b!833720 (= res!566842 (= (h!16984 (toList!4469 lt!378069)) (tuple2!10083 lt!377933 minValue!754)))))

(declare-fun b!833721 () Bool)

(assert (=> b!833721 (= e!465084 (contains!4190 (t!22212 (toList!4469 lt!378069)) (tuple2!10083 lt!377933 minValue!754)))))

(assert (= (and d!107221 res!566843) b!833720))

(assert (= (and b!833720 (not res!566842)) b!833721))

(declare-fun m!778673 () Bool)

(assert (=> d!107221 m!778673))

(declare-fun m!778675 () Bool)

(assert (=> d!107221 m!778675))

(declare-fun m!778677 () Bool)

(assert (=> b!833721 m!778677))

(assert (=> b!833058 d!107221))

(declare-fun d!107223 () Bool)

(assert (=> d!107223 (not (contains!4189 (+!1991 lt!378040 (tuple2!10083 lt!378039 lt!378043)) lt!378041))))

(declare-fun lt!378337 () Unit!28510)

(assert (=> d!107223 (= lt!378337 (choose!1432 lt!378040 lt!378039 lt!378043 lt!378041))))

(declare-fun e!465086 () Bool)

(assert (=> d!107223 e!465086))

(declare-fun res!566844 () Bool)

(assert (=> d!107223 (=> (not res!566844) (not e!465086))))

(assert (=> d!107223 (= res!566844 (not (contains!4189 lt!378040 lt!378041)))))

(assert (=> d!107223 (= (addStillNotContains!200 lt!378040 lt!378039 lt!378043 lt!378041) lt!378337)))

(declare-fun b!833722 () Bool)

(assert (=> b!833722 (= e!465086 (not (= lt!378039 lt!378041)))))

(assert (= (and d!107223 res!566844) b!833722))

(assert (=> d!107223 m!777489))

(assert (=> d!107223 m!777489))

(assert (=> d!107223 m!777491))

(declare-fun m!778679 () Bool)

(assert (=> d!107223 m!778679))

(declare-fun m!778681 () Bool)

(assert (=> d!107223 m!778681))

(assert (=> b!833034 d!107223))

(declare-fun d!107225 () Bool)

(declare-fun e!465088 () Bool)

(assert (=> d!107225 e!465088))

(declare-fun res!566845 () Bool)

(assert (=> d!107225 (=> res!566845 e!465088)))

(declare-fun lt!378338 () Bool)

(assert (=> d!107225 (= res!566845 (not lt!378338))))

(declare-fun lt!378341 () Bool)

(assert (=> d!107225 (= lt!378338 lt!378341)))

(declare-fun lt!378339 () Unit!28510)

(declare-fun e!465087 () Unit!28510)

(assert (=> d!107225 (= lt!378339 e!465087)))

(declare-fun c!90892 () Bool)

(assert (=> d!107225 (= c!90892 lt!378341)))

(assert (=> d!107225 (= lt!378341 (containsKey!402 (toList!4469 (+!1991 lt!378040 (tuple2!10083 lt!378039 lt!378043))) lt!378041))))

(assert (=> d!107225 (= (contains!4189 (+!1991 lt!378040 (tuple2!10083 lt!378039 lt!378043)) lt!378041) lt!378338)))

(declare-fun b!833723 () Bool)

(declare-fun lt!378340 () Unit!28510)

(assert (=> b!833723 (= e!465087 lt!378340)))

(assert (=> b!833723 (= lt!378340 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 (+!1991 lt!378040 (tuple2!10083 lt!378039 lt!378043))) lt!378041))))

(assert (=> b!833723 (isDefined!312 (getValueByKey!417 (toList!4469 (+!1991 lt!378040 (tuple2!10083 lt!378039 lt!378043))) lt!378041))))

(declare-fun b!833724 () Bool)

(declare-fun Unit!28552 () Unit!28510)

(assert (=> b!833724 (= e!465087 Unit!28552)))

(declare-fun b!833725 () Bool)

(assert (=> b!833725 (= e!465088 (isDefined!312 (getValueByKey!417 (toList!4469 (+!1991 lt!378040 (tuple2!10083 lt!378039 lt!378043))) lt!378041)))))

(assert (= (and d!107225 c!90892) b!833723))

(assert (= (and d!107225 (not c!90892)) b!833724))

(assert (= (and d!107225 (not res!566845)) b!833725))

(declare-fun m!778683 () Bool)

(assert (=> d!107225 m!778683))

(declare-fun m!778685 () Bool)

(assert (=> b!833723 m!778685))

(declare-fun m!778687 () Bool)

(assert (=> b!833723 m!778687))

(assert (=> b!833723 m!778687))

(declare-fun m!778689 () Bool)

(assert (=> b!833723 m!778689))

(assert (=> b!833725 m!778687))

(assert (=> b!833725 m!778687))

(assert (=> b!833725 m!778689))

(assert (=> b!833034 d!107225))

(declare-fun d!107227 () Bool)

(declare-fun e!465089 () Bool)

(assert (=> d!107227 e!465089))

(declare-fun res!566847 () Bool)

(assert (=> d!107227 (=> (not res!566847) (not e!465089))))

(declare-fun lt!378345 () ListLongMap!8907)

(assert (=> d!107227 (= res!566847 (contains!4189 lt!378345 (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11826 (select (arr!22332 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!378344 () List!15852)

(assert (=> d!107227 (= lt!378345 (ListLongMap!8908 lt!378344))))

(declare-fun lt!378342 () Unit!28510)

(declare-fun lt!378343 () Unit!28510)

(assert (=> d!107227 (= lt!378342 lt!378343)))

(assert (=> d!107227 (= (getValueByKey!417 lt!378344 (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11826 (select (arr!22332 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!422 (_2!5052 (tuple2!10083 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11826 (select (arr!22332 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!107227 (= lt!378343 (lemmaContainsTupThenGetReturnValue!231 lt!378344 (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11826 (select (arr!22332 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5052 (tuple2!10083 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11826 (select (arr!22332 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!107227 (= lt!378344 (insertStrictlySorted!270 (toList!4469 call!36452) (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11826 (select (arr!22332 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5052 (tuple2!10083 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11826 (select (arr!22332 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!107227 (= (+!1991 call!36452 (tuple2!10083 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11826 (select (arr!22332 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!378345)))

(declare-fun b!833726 () Bool)

(declare-fun res!566846 () Bool)

(assert (=> b!833726 (=> (not res!566846) (not e!465089))))

(assert (=> b!833726 (= res!566846 (= (getValueByKey!417 (toList!4469 lt!378345) (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11826 (select (arr!22332 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!422 (_2!5052 (tuple2!10083 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11826 (select (arr!22332 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!833727 () Bool)

(assert (=> b!833727 (= e!465089 (contains!4190 (toList!4469 lt!378345) (tuple2!10083 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11826 (select (arr!22332 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!107227 res!566847) b!833726))

(assert (= (and b!833726 res!566846) b!833727))

(declare-fun m!778691 () Bool)

(assert (=> d!107227 m!778691))

(declare-fun m!778693 () Bool)

(assert (=> d!107227 m!778693))

(declare-fun m!778695 () Bool)

(assert (=> d!107227 m!778695))

(declare-fun m!778697 () Bool)

(assert (=> d!107227 m!778697))

(declare-fun m!778699 () Bool)

(assert (=> b!833726 m!778699))

(declare-fun m!778701 () Bool)

(assert (=> b!833727 m!778701))

(assert (=> b!833034 d!107227))

(assert (=> b!833034 d!106959))

(declare-fun d!107229 () Bool)

(declare-fun e!465090 () Bool)

(assert (=> d!107229 e!465090))

(declare-fun res!566849 () Bool)

(assert (=> d!107229 (=> (not res!566849) (not e!465090))))

(declare-fun lt!378349 () ListLongMap!8907)

(assert (=> d!107229 (= res!566849 (contains!4189 lt!378349 (_1!5052 (tuple2!10083 lt!378039 lt!378043))))))

(declare-fun lt!378348 () List!15852)

(assert (=> d!107229 (= lt!378349 (ListLongMap!8908 lt!378348))))

(declare-fun lt!378346 () Unit!28510)

(declare-fun lt!378347 () Unit!28510)

(assert (=> d!107229 (= lt!378346 lt!378347)))

(assert (=> d!107229 (= (getValueByKey!417 lt!378348 (_1!5052 (tuple2!10083 lt!378039 lt!378043))) (Some!422 (_2!5052 (tuple2!10083 lt!378039 lt!378043))))))

(assert (=> d!107229 (= lt!378347 (lemmaContainsTupThenGetReturnValue!231 lt!378348 (_1!5052 (tuple2!10083 lt!378039 lt!378043)) (_2!5052 (tuple2!10083 lt!378039 lt!378043))))))

(assert (=> d!107229 (= lt!378348 (insertStrictlySorted!270 (toList!4469 lt!378040) (_1!5052 (tuple2!10083 lt!378039 lt!378043)) (_2!5052 (tuple2!10083 lt!378039 lt!378043))))))

(assert (=> d!107229 (= (+!1991 lt!378040 (tuple2!10083 lt!378039 lt!378043)) lt!378349)))

(declare-fun b!833728 () Bool)

(declare-fun res!566848 () Bool)

(assert (=> b!833728 (=> (not res!566848) (not e!465090))))

(assert (=> b!833728 (= res!566848 (= (getValueByKey!417 (toList!4469 lt!378349) (_1!5052 (tuple2!10083 lt!378039 lt!378043))) (Some!422 (_2!5052 (tuple2!10083 lt!378039 lt!378043)))))))

(declare-fun b!833729 () Bool)

(assert (=> b!833729 (= e!465090 (contains!4190 (toList!4469 lt!378349) (tuple2!10083 lt!378039 lt!378043)))))

(assert (= (and d!107229 res!566849) b!833728))

(assert (= (and b!833728 res!566848) b!833729))

(declare-fun m!778703 () Bool)

(assert (=> d!107229 m!778703))

(declare-fun m!778705 () Bool)

(assert (=> d!107229 m!778705))

(declare-fun m!778707 () Bool)

(assert (=> d!107229 m!778707))

(declare-fun m!778709 () Bool)

(assert (=> d!107229 m!778709))

(declare-fun m!778711 () Bool)

(assert (=> b!833728 m!778711))

(declare-fun m!778713 () Bool)

(assert (=> b!833729 m!778713))

(assert (=> b!833034 d!107229))

(assert (=> b!833049 d!107017))

(assert (=> b!833049 d!107019))

(assert (=> b!833305 d!107031))

(assert (=> b!833305 d!106701))

(declare-fun b!833748 () Bool)

(declare-fun lt!378354 () SeekEntryResult!8696)

(assert (=> b!833748 (and (bvsge (index!37157 lt!378354) #b00000000000000000000000000000000) (bvslt (index!37157 lt!378354) (size!22751 _keys!976)))))

(declare-fun res!566856 () Bool)

(assert (=> b!833748 (= res!566856 (= (select (arr!22331 _keys!976) (index!37157 lt!378354)) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun e!465104 () Bool)

(assert (=> b!833748 (=> res!566856 e!465104)))

(declare-fun e!465105 () Bool)

(assert (=> b!833748 (= e!465105 e!465104)))

(declare-fun d!107231 () Bool)

(declare-fun e!465103 () Bool)

(assert (=> d!107231 e!465103))

(declare-fun c!90901 () Bool)

(assert (=> d!107231 (= c!90901 (and ((_ is Intermediate!8696) lt!378354) (undefined!9508 lt!378354)))))

(declare-fun e!465101 () SeekEntryResult!8696)

(assert (=> d!107231 (= lt!378354 e!465101)))

(declare-fun c!90899 () Bool)

(assert (=> d!107231 (= c!90899 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!378355 () (_ BitVec 64))

(assert (=> d!107231 (= lt!378355 (select (arr!22331 _keys!976) (toIndex!0 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) mask!1312)))))

(assert (=> d!107231 (validMask!0 mask!1312)))

(assert (=> d!107231 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) mask!1312) (select (arr!22331 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) lt!378354)))

(declare-fun b!833749 () Bool)

(assert (=> b!833749 (and (bvsge (index!37157 lt!378354) #b00000000000000000000000000000000) (bvslt (index!37157 lt!378354) (size!22751 _keys!976)))))

(assert (=> b!833749 (= e!465104 (= (select (arr!22331 _keys!976) (index!37157 lt!378354)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!833750 () Bool)

(declare-fun e!465102 () SeekEntryResult!8696)

(assert (=> b!833750 (= e!465101 e!465102)))

(declare-fun c!90900 () Bool)

(assert (=> b!833750 (= c!90900 (or (= lt!378355 (select (arr!22331 _keys!976) #b00000000000000000000000000000000)) (= (bvadd lt!378355 lt!378355) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!833751 () Bool)

(assert (=> b!833751 (= e!465102 (Intermediate!8696 false (toIndex!0 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) mask!1312) #b00000000000000000000000000000000))))

(declare-fun b!833752 () Bool)

(assert (=> b!833752 (= e!465103 e!465105)))

(declare-fun res!566858 () Bool)

(assert (=> b!833752 (= res!566858 (and ((_ is Intermediate!8696) lt!378354) (not (undefined!9508 lt!378354)) (bvslt (x!70105 lt!378354) #b01111111111111111111111111111110) (bvsge (x!70105 lt!378354) #b00000000000000000000000000000000) (bvsge (x!70105 lt!378354) #b00000000000000000000000000000000)))))

(assert (=> b!833752 (=> (not res!566858) (not e!465105))))

(declare-fun b!833753 () Bool)

(assert (=> b!833753 (= e!465101 (Intermediate!8696 true (toIndex!0 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) mask!1312) #b00000000000000000000000000000000))))

(declare-fun b!833754 () Bool)

(assert (=> b!833754 (= e!465102 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) mask!1312) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!1312) (select (arr!22331 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312))))

(declare-fun b!833755 () Bool)

(assert (=> b!833755 (= e!465103 (bvsge (x!70105 lt!378354) #b01111111111111111111111111111110))))

(declare-fun b!833756 () Bool)

(assert (=> b!833756 (and (bvsge (index!37157 lt!378354) #b00000000000000000000000000000000) (bvslt (index!37157 lt!378354) (size!22751 _keys!976)))))

(declare-fun res!566857 () Bool)

(assert (=> b!833756 (= res!566857 (= (select (arr!22331 _keys!976) (index!37157 lt!378354)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!833756 (=> res!566857 e!465104)))

(assert (= (and d!107231 c!90899) b!833753))

(assert (= (and d!107231 (not c!90899)) b!833750))

(assert (= (and b!833750 c!90900) b!833751))

(assert (= (and b!833750 (not c!90900)) b!833754))

(assert (= (and d!107231 c!90901) b!833755))

(assert (= (and d!107231 (not c!90901)) b!833752))

(assert (= (and b!833752 res!566858) b!833748))

(assert (= (and b!833748 (not res!566856)) b!833756))

(assert (= (and b!833756 (not res!566857)) b!833749))

(assert (=> d!107231 m!777887))

(declare-fun m!778715 () Bool)

(assert (=> d!107231 m!778715))

(assert (=> d!107231 m!776931))

(declare-fun m!778717 () Bool)

(assert (=> b!833749 m!778717))

(assert (=> b!833748 m!778717))

(assert (=> b!833754 m!777887))

(declare-fun m!778719 () Bool)

(assert (=> b!833754 m!778719))

(assert (=> b!833754 m!778719))

(assert (=> b!833754 m!777093))

(declare-fun m!778721 () Bool)

(assert (=> b!833754 m!778721))

(assert (=> b!833756 m!778717))

(assert (=> d!106837 d!107231))

(declare-fun d!107233 () Bool)

(declare-fun lt!378361 () (_ BitVec 32))

(declare-fun lt!378360 () (_ BitVec 32))

(assert (=> d!107233 (= lt!378361 (bvmul (bvxor lt!378360 (bvlshr lt!378360 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!107233 (= lt!378360 ((_ extract 31 0) (bvand (bvxor (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (bvlshr (select (arr!22331 _keys!976) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!107233 (and (bvsge mask!1312 #b00000000000000000000000000000000) (let ((res!566859 (let ((h!16989 ((_ extract 31 0) (bvand (bvxor (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (bvlshr (select (arr!22331 _keys!976) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!70116 (bvmul (bvxor h!16989 (bvlshr h!16989 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!70116 (bvlshr x!70116 #b00000000000000000000000000001101)) mask!1312))))) (and (bvslt res!566859 (bvadd mask!1312 #b00000000000000000000000000000001)) (bvsge res!566859 #b00000000000000000000000000000000))))))

(assert (=> d!107233 (= (toIndex!0 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) mask!1312) (bvand (bvxor lt!378361 (bvlshr lt!378361 #b00000000000000000000000000001101)) mask!1312))))

(assert (=> d!106837 d!107233))

(assert (=> d!106837 d!106633))

(declare-fun d!107235 () Bool)

(assert (=> d!107235 (= ($colon$colon!534 e!464676 (ite c!90691 (h!16984 (toList!4469 lt!377760)) (tuple2!10083 (_1!5052 lt!377761) (_2!5052 lt!377761)))) (Cons!15848 (ite c!90691 (h!16984 (toList!4469 lt!377760)) (tuple2!10083 (_1!5052 lt!377761) (_2!5052 lt!377761))) e!464676))))

(assert (=> bm!36450 d!107235))

(declare-fun d!107237 () Bool)

(declare-fun res!566860 () Bool)

(declare-fun e!465106 () Bool)

(assert (=> d!107237 (=> res!566860 e!465106)))

(assert (=> d!107237 (= res!566860 (and ((_ is Cons!15848) lt!377966) (= (_1!5052 (h!16984 lt!377966)) (_1!5052 lt!377756))))))

(assert (=> d!107237 (= (containsKey!402 lt!377966 (_1!5052 lt!377756)) e!465106)))

(declare-fun b!833757 () Bool)

(declare-fun e!465107 () Bool)

(assert (=> b!833757 (= e!465106 e!465107)))

(declare-fun res!566861 () Bool)

(assert (=> b!833757 (=> (not res!566861) (not e!465107))))

(assert (=> b!833757 (= res!566861 (and (or (not ((_ is Cons!15848) lt!377966)) (bvsle (_1!5052 (h!16984 lt!377966)) (_1!5052 lt!377756))) ((_ is Cons!15848) lt!377966) (bvslt (_1!5052 (h!16984 lt!377966)) (_1!5052 lt!377756))))))

(declare-fun b!833758 () Bool)

(assert (=> b!833758 (= e!465107 (containsKey!402 (t!22212 lt!377966) (_1!5052 lt!377756)))))

(assert (= (and d!107237 (not res!566860)) b!833757))

(assert (= (and b!833757 res!566861) b!833758))

(declare-fun m!778723 () Bool)

(assert (=> b!833758 m!778723))

(assert (=> b!833310 d!107237))

(declare-fun c!90902 () Bool)

(declare-fun d!107239 () Bool)

(assert (=> d!107239 (= c!90902 (and ((_ is Cons!15848) (toList!4469 lt!378180)) (= (_1!5052 (h!16984 (toList!4469 lt!378180))) (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!465108 () Option!423)

(assert (=> d!107239 (= (getValueByKey!417 (toList!4469 lt!378180) (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!465108)))

(declare-fun e!465109 () Option!423)

(declare-fun b!833761 () Bool)

(assert (=> b!833761 (= e!465109 (getValueByKey!417 (t!22212 (toList!4469 lt!378180)) (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!833762 () Bool)

(assert (=> b!833762 (= e!465109 None!421)))

(declare-fun b!833760 () Bool)

(assert (=> b!833760 (= e!465108 e!465109)))

(declare-fun c!90903 () Bool)

(assert (=> b!833760 (= c!90903 (and ((_ is Cons!15848) (toList!4469 lt!378180)) (not (= (_1!5052 (h!16984 (toList!4469 lt!378180))) (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!833759 () Bool)

(assert (=> b!833759 (= e!465108 (Some!422 (_2!5052 (h!16984 (toList!4469 lt!378180)))))))

(assert (= (and d!107239 c!90902) b!833759))

(assert (= (and d!107239 (not c!90902)) b!833760))

(assert (= (and b!833760 c!90903) b!833761))

(assert (= (and b!833760 (not c!90903)) b!833762))

(declare-fun m!778725 () Bool)

(assert (=> b!833761 m!778725))

(assert (=> b!833265 d!107239))

(assert (=> b!833008 d!107035))

(assert (=> b!833008 d!107037))

(declare-fun d!107241 () Bool)

(assert (=> d!107241 (= (get!11829 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!833046 d!107241))

(declare-fun d!107243 () Bool)

(declare-fun lt!378362 () Bool)

(assert (=> d!107243 (= lt!378362 (select (content!388 lt!377822) (tuple2!10083 (_1!5052 lt!377761) (_2!5052 lt!377761))))))

(declare-fun e!465111 () Bool)

(assert (=> d!107243 (= lt!378362 e!465111)))

(declare-fun res!566863 () Bool)

(assert (=> d!107243 (=> (not res!566863) (not e!465111))))

(assert (=> d!107243 (= res!566863 ((_ is Cons!15848) lt!377822))))

(assert (=> d!107243 (= (contains!4190 lt!377822 (tuple2!10083 (_1!5052 lt!377761) (_2!5052 lt!377761))) lt!378362)))

(declare-fun b!833763 () Bool)

(declare-fun e!465110 () Bool)

(assert (=> b!833763 (= e!465111 e!465110)))

(declare-fun res!566862 () Bool)

(assert (=> b!833763 (=> res!566862 e!465110)))

(assert (=> b!833763 (= res!566862 (= (h!16984 lt!377822) (tuple2!10083 (_1!5052 lt!377761) (_2!5052 lt!377761))))))

(declare-fun b!833764 () Bool)

(assert (=> b!833764 (= e!465110 (contains!4190 (t!22212 lt!377822) (tuple2!10083 (_1!5052 lt!377761) (_2!5052 lt!377761))))))

(assert (= (and d!107243 res!566863) b!833763))

(assert (= (and b!833763 (not res!566862)) b!833764))

(declare-fun m!778727 () Bool)

(assert (=> d!107243 m!778727))

(declare-fun m!778729 () Bool)

(assert (=> d!107243 m!778729))

(declare-fun m!778731 () Bool)

(assert (=> b!833764 m!778731))

(assert (=> b!833191 d!107243))

(declare-fun d!107245 () Bool)

(declare-fun res!566864 () Bool)

(declare-fun e!465112 () Bool)

(assert (=> d!107245 (=> res!566864 e!465112)))

(assert (=> d!107245 (= res!566864 (or ((_ is Nil!15849) lt!378116) ((_ is Nil!15849) (t!22212 lt!378116))))))

(assert (=> d!107245 (= (isStrictlySorted!430 lt!378116) e!465112)))

(declare-fun b!833765 () Bool)

(declare-fun e!465113 () Bool)

(assert (=> b!833765 (= e!465112 e!465113)))

(declare-fun res!566865 () Bool)

(assert (=> b!833765 (=> (not res!566865) (not e!465113))))

(assert (=> b!833765 (= res!566865 (bvslt (_1!5052 (h!16984 lt!378116)) (_1!5052 (h!16984 (t!22212 lt!378116)))))))

(declare-fun b!833766 () Bool)

(assert (=> b!833766 (= e!465113 (isStrictlySorted!430 (t!22212 lt!378116)))))

(assert (= (and d!107245 (not res!566864)) b!833765))

(assert (= (and b!833765 res!566865) b!833766))

(declare-fun m!778733 () Bool)

(assert (=> b!833766 m!778733))

(assert (=> d!106797 d!107245))

(declare-fun d!107247 () Bool)

(declare-fun res!566866 () Bool)

(declare-fun e!465114 () Bool)

(assert (=> d!107247 (=> res!566866 e!465114)))

(assert (=> d!107247 (= res!566866 (or ((_ is Nil!15849) (toList!4469 lt!377759)) ((_ is Nil!15849) (t!22212 (toList!4469 lt!377759)))))))

(assert (=> d!107247 (= (isStrictlySorted!430 (toList!4469 lt!377759)) e!465114)))

(declare-fun b!833767 () Bool)

(declare-fun e!465115 () Bool)

(assert (=> b!833767 (= e!465114 e!465115)))

(declare-fun res!566867 () Bool)

(assert (=> b!833767 (=> (not res!566867) (not e!465115))))

(assert (=> b!833767 (= res!566867 (bvslt (_1!5052 (h!16984 (toList!4469 lt!377759))) (_1!5052 (h!16984 (t!22212 (toList!4469 lt!377759))))))))

(declare-fun b!833768 () Bool)

(assert (=> b!833768 (= e!465115 (isStrictlySorted!430 (t!22212 (toList!4469 lt!377759))))))

(assert (= (and d!107247 (not res!566866)) b!833767))

(assert (= (and b!833767 res!566867) b!833768))

(declare-fun m!778735 () Bool)

(assert (=> b!833768 m!778735))

(assert (=> d!106797 d!107247))

(declare-fun d!107249 () Bool)

(assert (=> d!107249 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377861) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun lt!378363 () Unit!28510)

(assert (=> d!107249 (= lt!378363 (choose!1433 (toList!4469 lt!377861) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun e!465116 () Bool)

(assert (=> d!107249 e!465116))

(declare-fun res!566868 () Bool)

(assert (=> d!107249 (=> (not res!566868) (not e!465116))))

(assert (=> d!107249 (= res!566868 (isStrictlySorted!430 (toList!4469 lt!377861)))))

(assert (=> d!107249 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377861) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)) lt!378363)))

(declare-fun b!833769 () Bool)

(assert (=> b!833769 (= e!465116 (containsKey!402 (toList!4469 lt!377861) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!107249 res!566868) b!833769))

(assert (=> d!107249 m!777093))

(assert (=> d!107249 m!777475))

(assert (=> d!107249 m!777475))

(assert (=> d!107249 m!777477))

(assert (=> d!107249 m!777093))

(declare-fun m!778737 () Bool)

(assert (=> d!107249 m!778737))

(assert (=> d!107249 m!778615))

(assert (=> b!833769 m!777093))

(assert (=> b!833769 m!777471))

(assert (=> b!833017 d!107249))

(declare-fun d!107251 () Bool)

(assert (=> d!107251 (= (isDefined!312 (getValueByKey!417 (toList!4469 lt!377861) (select (arr!22331 _keys!976) #b00000000000000000000000000000000))) (not (isEmpty!665 (getValueByKey!417 (toList!4469 lt!377861) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun bs!23329 () Bool)

(assert (= bs!23329 d!107251))

(assert (=> bs!23329 m!777475))

(declare-fun m!778739 () Bool)

(assert (=> bs!23329 m!778739))

(assert (=> b!833017 d!107251))

(assert (=> b!833017 d!107165))

(declare-fun d!107253 () Bool)

(declare-fun lt!378364 () Bool)

(assert (=> d!107253 (= lt!378364 (select (content!388 lt!377970) (tuple2!10083 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!465118 () Bool)

(assert (=> d!107253 (= lt!378364 e!465118)))

(declare-fun res!566870 () Bool)

(assert (=> d!107253 (=> (not res!566870) (not e!465118))))

(assert (=> d!107253 (= res!566870 ((_ is Cons!15848) lt!377970))))

(assert (=> d!107253 (= (contains!4190 lt!377970 (tuple2!10083 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) lt!378364)))

(declare-fun b!833770 () Bool)

(declare-fun e!465117 () Bool)

(assert (=> b!833770 (= e!465118 e!465117)))

(declare-fun res!566869 () Bool)

(assert (=> b!833770 (=> res!566869 e!465117)))

(assert (=> b!833770 (= res!566869 (= (h!16984 lt!377970) (tuple2!10083 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!833771 () Bool)

(assert (=> b!833771 (= e!465117 (contains!4190 (t!22212 lt!377970) (tuple2!10083 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (= (and d!107253 res!566870) b!833770))

(assert (= (and b!833770 (not res!566869)) b!833771))

(declare-fun m!778741 () Bool)

(assert (=> d!107253 m!778741))

(declare-fun m!778743 () Bool)

(assert (=> d!107253 m!778743))

(declare-fun m!778745 () Bool)

(assert (=> b!833771 m!778745))

(assert (=> b!832944 d!107253))

(assert (=> b!833093 d!107013))

(declare-fun d!107255 () Bool)

(declare-fun res!566871 () Bool)

(declare-fun e!465119 () Bool)

(assert (=> d!107255 (=> res!566871 e!465119)))

(assert (=> d!107255 (= res!566871 (and ((_ is Cons!15848) (toList!4469 lt!377947)) (= (_1!5052 (h!16984 (toList!4469 lt!377947))) (select (arr!22331 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!107255 (= (containsKey!402 (toList!4469 lt!377947) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)) e!465119)))

(declare-fun b!833772 () Bool)

(declare-fun e!465120 () Bool)

(assert (=> b!833772 (= e!465119 e!465120)))

(declare-fun res!566872 () Bool)

(assert (=> b!833772 (=> (not res!566872) (not e!465120))))

(assert (=> b!833772 (= res!566872 (and (or (not ((_ is Cons!15848) (toList!4469 lt!377947))) (bvsle (_1!5052 (h!16984 (toList!4469 lt!377947))) (select (arr!22331 _keys!976) #b00000000000000000000000000000000))) ((_ is Cons!15848) (toList!4469 lt!377947)) (bvslt (_1!5052 (h!16984 (toList!4469 lt!377947))) (select (arr!22331 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun b!833773 () Bool)

(assert (=> b!833773 (= e!465120 (containsKey!402 (t!22212 (toList!4469 lt!377947)) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!107255 (not res!566871)) b!833772))

(assert (= (and b!833772 res!566872) b!833773))

(assert (=> b!833773 m!777093))

(declare-fun m!778747 () Bool)

(assert (=> b!833773 m!778747))

(assert (=> d!106831 d!107255))

(declare-fun d!107257 () Bool)

(declare-fun res!566873 () Bool)

(declare-fun e!465121 () Bool)

(assert (=> d!107257 (=> res!566873 e!465121)))

(assert (=> d!107257 (= res!566873 (and ((_ is Cons!15848) (toList!4469 lt!377947)) (= (_1!5052 (h!16984 (toList!4469 lt!377947))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107257 (= (containsKey!402 (toList!4469 lt!377947) #b1000000000000000000000000000000000000000000000000000000000000000) e!465121)))

(declare-fun b!833774 () Bool)

(declare-fun e!465122 () Bool)

(assert (=> b!833774 (= e!465121 e!465122)))

(declare-fun res!566874 () Bool)

(assert (=> b!833774 (=> (not res!566874) (not e!465122))))

(assert (=> b!833774 (= res!566874 (and (or (not ((_ is Cons!15848) (toList!4469 lt!377947))) (bvsle (_1!5052 (h!16984 (toList!4469 lt!377947))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15848) (toList!4469 lt!377947)) (bvslt (_1!5052 (h!16984 (toList!4469 lt!377947))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!833775 () Bool)

(assert (=> b!833775 (= e!465122 (containsKey!402 (t!22212 (toList!4469 lt!377947)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!107257 (not res!566873)) b!833774))

(assert (= (and b!833774 res!566874) b!833775))

(declare-fun m!778749 () Bool)

(assert (=> b!833775 m!778749))

(assert (=> d!106719 d!107257))

(declare-fun d!107259 () Bool)

(assert (=> d!107259 (= (get!11827 (getValueByKey!417 (toList!4469 lt!377925) (select (arr!22331 _keys!976) #b00000000000000000000000000000000))) (v!10101 (getValueByKey!417 (toList!4469 lt!377925) (select (arr!22331 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!106857 d!107259))

(declare-fun d!107261 () Bool)

(declare-fun c!90904 () Bool)

(assert (=> d!107261 (= c!90904 (and ((_ is Cons!15848) (toList!4469 lt!377925)) (= (_1!5052 (h!16984 (toList!4469 lt!377925))) (select (arr!22331 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun e!465123 () Option!423)

(assert (=> d!107261 (= (getValueByKey!417 (toList!4469 lt!377925) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)) e!465123)))

(declare-fun b!833778 () Bool)

(declare-fun e!465124 () Option!423)

(assert (=> b!833778 (= e!465124 (getValueByKey!417 (t!22212 (toList!4469 lt!377925)) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!833779 () Bool)

(assert (=> b!833779 (= e!465124 None!421)))

(declare-fun b!833777 () Bool)

(assert (=> b!833777 (= e!465123 e!465124)))

(declare-fun c!90905 () Bool)

(assert (=> b!833777 (= c!90905 (and ((_ is Cons!15848) (toList!4469 lt!377925)) (not (= (_1!5052 (h!16984 (toList!4469 lt!377925))) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun b!833776 () Bool)

(assert (=> b!833776 (= e!465123 (Some!422 (_2!5052 (h!16984 (toList!4469 lt!377925)))))))

(assert (= (and d!107261 c!90904) b!833776))

(assert (= (and d!107261 (not c!90904)) b!833777))

(assert (= (and b!833777 c!90905) b!833778))

(assert (= (and b!833777 (not c!90905)) b!833779))

(assert (=> b!833778 m!777093))

(declare-fun m!778751 () Bool)

(assert (=> b!833778 m!778751))

(assert (=> d!106857 d!107261))

(assert (=> b!833026 d!107013))

(declare-fun e!465126 () List!15852)

(declare-fun c!90906 () Bool)

(declare-fun call!36495 () List!15852)

(declare-fun bm!36491 () Bool)

(assert (=> bm!36491 (= call!36495 ($colon$colon!534 e!465126 (ite c!90906 (h!16984 (t!22212 (toList!4469 (+!1991 lt!377759 lt!377756)))) (tuple2!10083 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun c!90909 () Bool)

(assert (=> bm!36491 (= c!90909 c!90906)))

(declare-fun bm!36492 () Bool)

(declare-fun call!36496 () List!15852)

(assert (=> bm!36492 (= call!36496 call!36495)))

(declare-fun bm!36493 () Bool)

(declare-fun call!36494 () List!15852)

(assert (=> bm!36493 (= call!36494 call!36496)))

(declare-fun b!833780 () Bool)

(declare-fun c!90907 () Bool)

(assert (=> b!833780 (= c!90907 (and ((_ is Cons!15848) (t!22212 (toList!4469 (+!1991 lt!377759 lt!377756)))) (bvsgt (_1!5052 (h!16984 (t!22212 (toList!4469 (+!1991 lt!377759 lt!377756))))) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!465125 () List!15852)

(declare-fun e!465128 () List!15852)

(assert (=> b!833780 (= e!465125 e!465128)))

(declare-fun b!833781 () Bool)

(assert (=> b!833781 (= e!465128 call!36494)))

(declare-fun b!833782 () Bool)

(assert (=> b!833782 (= e!465126 (insertStrictlySorted!270 (t!22212 (t!22212 (toList!4469 (+!1991 lt!377759 lt!377756)))) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!833783 () Bool)

(declare-fun e!465127 () List!15852)

(assert (=> b!833783 (= e!465127 call!36495)))

(declare-fun b!833784 () Bool)

(declare-fun e!465129 () Bool)

(declare-fun lt!378365 () List!15852)

(assert (=> b!833784 (= e!465129 (contains!4190 lt!378365 (tuple2!10083 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!833785 () Bool)

(declare-fun c!90908 () Bool)

(assert (=> b!833785 (= e!465126 (ite c!90908 (t!22212 (t!22212 (toList!4469 (+!1991 lt!377759 lt!377756)))) (ite c!90907 (Cons!15848 (h!16984 (t!22212 (toList!4469 (+!1991 lt!377759 lt!377756)))) (t!22212 (t!22212 (toList!4469 (+!1991 lt!377759 lt!377756))))) Nil!15849)))))

(declare-fun b!833786 () Bool)

(assert (=> b!833786 (= e!465127 e!465125)))

(assert (=> b!833786 (= c!90908 (and ((_ is Cons!15848) (t!22212 (toList!4469 (+!1991 lt!377759 lt!377756)))) (= (_1!5052 (h!16984 (t!22212 (toList!4469 (+!1991 lt!377759 lt!377756))))) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!833787 () Bool)

(assert (=> b!833787 (= e!465125 call!36496)))

(declare-fun b!833788 () Bool)

(declare-fun res!566876 () Bool)

(assert (=> b!833788 (=> (not res!566876) (not e!465129))))

(assert (=> b!833788 (= res!566876 (containsKey!402 lt!378365 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun d!107263 () Bool)

(assert (=> d!107263 e!465129))

(declare-fun res!566875 () Bool)

(assert (=> d!107263 (=> (not res!566875) (not e!465129))))

(assert (=> d!107263 (= res!566875 (isStrictlySorted!430 lt!378365))))

(assert (=> d!107263 (= lt!378365 e!465127)))

(assert (=> d!107263 (= c!90906 (and ((_ is Cons!15848) (t!22212 (toList!4469 (+!1991 lt!377759 lt!377756)))) (bvslt (_1!5052 (h!16984 (t!22212 (toList!4469 (+!1991 lt!377759 lt!377756))))) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!107263 (isStrictlySorted!430 (t!22212 (toList!4469 (+!1991 lt!377759 lt!377756))))))

(assert (=> d!107263 (= (insertStrictlySorted!270 (t!22212 (toList!4469 (+!1991 lt!377759 lt!377756))) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!378365)))

(declare-fun b!833789 () Bool)

(assert (=> b!833789 (= e!465128 call!36494)))

(assert (= (and d!107263 c!90906) b!833783))

(assert (= (and d!107263 (not c!90906)) b!833786))

(assert (= (and b!833786 c!90908) b!833787))

(assert (= (and b!833786 (not c!90908)) b!833780))

(assert (= (and b!833780 c!90907) b!833781))

(assert (= (and b!833780 (not c!90907)) b!833789))

(assert (= (or b!833781 b!833789) bm!36493))

(assert (= (or b!833787 bm!36493) bm!36492))

(assert (= (or b!833783 bm!36492) bm!36491))

(assert (= (and bm!36491 c!90909) b!833782))

(assert (= (and bm!36491 (not c!90909)) b!833785))

(assert (= (and d!107263 res!566875) b!833788))

(assert (= (and b!833788 res!566876) b!833784))

(declare-fun m!778753 () Bool)

(assert (=> bm!36491 m!778753))

(declare-fun m!778755 () Bool)

(assert (=> b!833784 m!778755))

(declare-fun m!778757 () Bool)

(assert (=> b!833782 m!778757))

(declare-fun m!778759 () Bool)

(assert (=> b!833788 m!778759))

(declare-fun m!778761 () Bool)

(assert (=> d!107263 m!778761))

(declare-fun m!778763 () Bool)

(assert (=> d!107263 m!778763))

(assert (=> b!832967 d!107263))

(declare-fun d!107265 () Bool)

(declare-fun res!566877 () Bool)

(declare-fun e!465130 () Bool)

(assert (=> d!107265 (=> res!566877 e!465130)))

(assert (=> d!107265 (= res!566877 (and ((_ is Cons!15848) (toList!4469 lt!377861)) (= (_1!5052 (h!16984 (toList!4469 lt!377861))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107265 (= (containsKey!402 (toList!4469 lt!377861) #b1000000000000000000000000000000000000000000000000000000000000000) e!465130)))

(declare-fun b!833790 () Bool)

(declare-fun e!465131 () Bool)

(assert (=> b!833790 (= e!465130 e!465131)))

(declare-fun res!566878 () Bool)

(assert (=> b!833790 (=> (not res!566878) (not e!465131))))

(assert (=> b!833790 (= res!566878 (and (or (not ((_ is Cons!15848) (toList!4469 lt!377861))) (bvsle (_1!5052 (h!16984 (toList!4469 lt!377861))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15848) (toList!4469 lt!377861)) (bvslt (_1!5052 (h!16984 (toList!4469 lt!377861))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!833791 () Bool)

(assert (=> b!833791 (= e!465131 (containsKey!402 (t!22212 (toList!4469 lt!377861)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!107265 (not res!566877)) b!833790))

(assert (= (and b!833790 res!566878) b!833791))

(declare-fun m!778765 () Bool)

(assert (=> b!833791 m!778765))

(assert (=> d!106785 d!107265))

(declare-fun d!107267 () Bool)

(declare-fun res!566879 () Bool)

(declare-fun e!465132 () Bool)

(assert (=> d!107267 (=> res!566879 e!465132)))

(assert (=> d!107267 (= res!566879 (or ((_ is Nil!15849) lt!378102) ((_ is Nil!15849) (t!22212 lt!378102))))))

(assert (=> d!107267 (= (isStrictlySorted!430 lt!378102) e!465132)))

(declare-fun b!833792 () Bool)

(declare-fun e!465133 () Bool)

(assert (=> b!833792 (= e!465132 e!465133)))

(declare-fun res!566880 () Bool)

(assert (=> b!833792 (=> (not res!566880) (not e!465133))))

(assert (=> b!833792 (= res!566880 (bvslt (_1!5052 (h!16984 lt!378102)) (_1!5052 (h!16984 (t!22212 lt!378102)))))))

(declare-fun b!833793 () Bool)

(assert (=> b!833793 (= e!465133 (isStrictlySorted!430 (t!22212 lt!378102)))))

(assert (= (and d!107267 (not res!566879)) b!833792))

(assert (= (and b!833792 res!566880) b!833793))

(declare-fun m!778767 () Bool)

(assert (=> b!833793 m!778767))

(assert (=> d!106783 d!107267))

(assert (=> d!106783 d!107247))

(declare-fun lt!378366 () Bool)

(declare-fun d!107269 () Bool)

(assert (=> d!107269 (= lt!378366 (select (content!388 (toList!4469 lt!378056)) (tuple2!10083 lt!377928 minValue!754)))))

(declare-fun e!465135 () Bool)

(assert (=> d!107269 (= lt!378366 e!465135)))

(declare-fun res!566882 () Bool)

(assert (=> d!107269 (=> (not res!566882) (not e!465135))))

(assert (=> d!107269 (= res!566882 ((_ is Cons!15848) (toList!4469 lt!378056)))))

(assert (=> d!107269 (= (contains!4190 (toList!4469 lt!378056) (tuple2!10083 lt!377928 minValue!754)) lt!378366)))

(declare-fun b!833794 () Bool)

(declare-fun e!465134 () Bool)

(assert (=> b!833794 (= e!465135 e!465134)))

(declare-fun res!566881 () Bool)

(assert (=> b!833794 (=> res!566881 e!465134)))

(assert (=> b!833794 (= res!566881 (= (h!16984 (toList!4469 lt!378056)) (tuple2!10083 lt!377928 minValue!754)))))

(declare-fun b!833795 () Bool)

(assert (=> b!833795 (= e!465134 (contains!4190 (t!22212 (toList!4469 lt!378056)) (tuple2!10083 lt!377928 minValue!754)))))

(assert (= (and d!107269 res!566882) b!833794))

(assert (= (and b!833794 (not res!566881)) b!833795))

(declare-fun m!778769 () Bool)

(assert (=> d!107269 m!778769))

(declare-fun m!778771 () Bool)

(assert (=> d!107269 m!778771))

(declare-fun m!778773 () Bool)

(assert (=> b!833795 m!778773))

(assert (=> b!833051 d!107269))

(declare-fun d!107271 () Bool)

(assert (=> d!107271 (= (get!11827 (getValueByKey!417 (toList!4469 lt!377945) lt!377953)) (v!10101 (getValueByKey!417 (toList!4469 lt!377945) lt!377953)))))

(assert (=> d!106669 d!107271))

(declare-fun d!107273 () Bool)

(declare-fun c!90910 () Bool)

(assert (=> d!107273 (= c!90910 (and ((_ is Cons!15848) (toList!4469 lt!377945)) (= (_1!5052 (h!16984 (toList!4469 lt!377945))) lt!377953)))))

(declare-fun e!465136 () Option!423)

(assert (=> d!107273 (= (getValueByKey!417 (toList!4469 lt!377945) lt!377953) e!465136)))

(declare-fun b!833798 () Bool)

(declare-fun e!465137 () Option!423)

(assert (=> b!833798 (= e!465137 (getValueByKey!417 (t!22212 (toList!4469 lt!377945)) lt!377953))))

(declare-fun b!833799 () Bool)

(assert (=> b!833799 (= e!465137 None!421)))

(declare-fun b!833797 () Bool)

(assert (=> b!833797 (= e!465136 e!465137)))

(declare-fun c!90911 () Bool)

(assert (=> b!833797 (= c!90911 (and ((_ is Cons!15848) (toList!4469 lt!377945)) (not (= (_1!5052 (h!16984 (toList!4469 lt!377945))) lt!377953))))))

(declare-fun b!833796 () Bool)

(assert (=> b!833796 (= e!465136 (Some!422 (_2!5052 (h!16984 (toList!4469 lt!377945)))))))

(assert (= (and d!107273 c!90910) b!833796))

(assert (= (and d!107273 (not c!90910)) b!833797))

(assert (= (and b!833797 c!90911) b!833798))

(assert (= (and b!833797 (not c!90911)) b!833799))

(declare-fun m!778775 () Bool)

(assert (=> b!833798 m!778775))

(assert (=> d!106669 d!107273))

(declare-fun d!107275 () Bool)

(declare-fun e!465139 () Bool)

(assert (=> d!107275 e!465139))

(declare-fun res!566883 () Bool)

(assert (=> d!107275 (=> res!566883 e!465139)))

(declare-fun lt!378367 () Bool)

(assert (=> d!107275 (= res!566883 (not lt!378367))))

(declare-fun lt!378370 () Bool)

(assert (=> d!107275 (= lt!378367 lt!378370)))

(declare-fun lt!378368 () Unit!28510)

(declare-fun e!465138 () Unit!28510)

(assert (=> d!107275 (= lt!378368 e!465138)))

(declare-fun c!90912 () Bool)

(assert (=> d!107275 (= c!90912 lt!378370)))

(assert (=> d!107275 (= lt!378370 (containsKey!402 (toList!4469 lt!378069) (_1!5052 (tuple2!10083 lt!377933 minValue!754))))))

(assert (=> d!107275 (= (contains!4189 lt!378069 (_1!5052 (tuple2!10083 lt!377933 minValue!754))) lt!378367)))

(declare-fun b!833800 () Bool)

(declare-fun lt!378369 () Unit!28510)

(assert (=> b!833800 (= e!465138 lt!378369)))

(assert (=> b!833800 (= lt!378369 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!378069) (_1!5052 (tuple2!10083 lt!377933 minValue!754))))))

(assert (=> b!833800 (isDefined!312 (getValueByKey!417 (toList!4469 lt!378069) (_1!5052 (tuple2!10083 lt!377933 minValue!754))))))

(declare-fun b!833801 () Bool)

(declare-fun Unit!28553 () Unit!28510)

(assert (=> b!833801 (= e!465138 Unit!28553)))

(declare-fun b!833802 () Bool)

(assert (=> b!833802 (= e!465139 (isDefined!312 (getValueByKey!417 (toList!4469 lt!378069) (_1!5052 (tuple2!10083 lt!377933 minValue!754)))))))

(assert (= (and d!107275 c!90912) b!833800))

(assert (= (and d!107275 (not c!90912)) b!833801))

(assert (= (and d!107275 (not res!566883)) b!833802))

(declare-fun m!778777 () Bool)

(assert (=> d!107275 m!778777))

(declare-fun m!778779 () Bool)

(assert (=> b!833800 m!778779))

(assert (=> b!833800 m!777597))

(assert (=> b!833800 m!777597))

(declare-fun m!778781 () Bool)

(assert (=> b!833800 m!778781))

(assert (=> b!833802 m!777597))

(assert (=> b!833802 m!777597))

(assert (=> b!833802 m!778781))

(assert (=> d!106743 d!107275))

(declare-fun c!90913 () Bool)

(declare-fun d!107277 () Bool)

(assert (=> d!107277 (= c!90913 (and ((_ is Cons!15848) lt!378068) (= (_1!5052 (h!16984 lt!378068)) (_1!5052 (tuple2!10083 lt!377933 minValue!754)))))))

(declare-fun e!465140 () Option!423)

(assert (=> d!107277 (= (getValueByKey!417 lt!378068 (_1!5052 (tuple2!10083 lt!377933 minValue!754))) e!465140)))

(declare-fun b!833805 () Bool)

(declare-fun e!465141 () Option!423)

(assert (=> b!833805 (= e!465141 (getValueByKey!417 (t!22212 lt!378068) (_1!5052 (tuple2!10083 lt!377933 minValue!754))))))

(declare-fun b!833806 () Bool)

(assert (=> b!833806 (= e!465141 None!421)))

(declare-fun b!833804 () Bool)

(assert (=> b!833804 (= e!465140 e!465141)))

(declare-fun c!90914 () Bool)

(assert (=> b!833804 (= c!90914 (and ((_ is Cons!15848) lt!378068) (not (= (_1!5052 (h!16984 lt!378068)) (_1!5052 (tuple2!10083 lt!377933 minValue!754))))))))

(declare-fun b!833803 () Bool)

(assert (=> b!833803 (= e!465140 (Some!422 (_2!5052 (h!16984 lt!378068))))))

(assert (= (and d!107277 c!90913) b!833803))

(assert (= (and d!107277 (not c!90913)) b!833804))

(assert (= (and b!833804 c!90914) b!833805))

(assert (= (and b!833804 (not c!90914)) b!833806))

(declare-fun m!778783 () Bool)

(assert (=> b!833805 m!778783))

(assert (=> d!106743 d!107277))

(declare-fun d!107279 () Bool)

(assert (=> d!107279 (= (getValueByKey!417 lt!378068 (_1!5052 (tuple2!10083 lt!377933 minValue!754))) (Some!422 (_2!5052 (tuple2!10083 lt!377933 minValue!754))))))

(declare-fun lt!378371 () Unit!28510)

(assert (=> d!107279 (= lt!378371 (choose!1429 lt!378068 (_1!5052 (tuple2!10083 lt!377933 minValue!754)) (_2!5052 (tuple2!10083 lt!377933 minValue!754))))))

(declare-fun e!465142 () Bool)

(assert (=> d!107279 e!465142))

(declare-fun res!566884 () Bool)

(assert (=> d!107279 (=> (not res!566884) (not e!465142))))

(assert (=> d!107279 (= res!566884 (isStrictlySorted!430 lt!378068))))

(assert (=> d!107279 (= (lemmaContainsTupThenGetReturnValue!231 lt!378068 (_1!5052 (tuple2!10083 lt!377933 minValue!754)) (_2!5052 (tuple2!10083 lt!377933 minValue!754))) lt!378371)))

(declare-fun b!833807 () Bool)

(declare-fun res!566885 () Bool)

(assert (=> b!833807 (=> (not res!566885) (not e!465142))))

(assert (=> b!833807 (= res!566885 (containsKey!402 lt!378068 (_1!5052 (tuple2!10083 lt!377933 minValue!754))))))

(declare-fun b!833808 () Bool)

(assert (=> b!833808 (= e!465142 (contains!4190 lt!378068 (tuple2!10083 (_1!5052 (tuple2!10083 lt!377933 minValue!754)) (_2!5052 (tuple2!10083 lt!377933 minValue!754)))))))

(assert (= (and d!107279 res!566884) b!833807))

(assert (= (and b!833807 res!566885) b!833808))

(assert (=> d!107279 m!777591))

(declare-fun m!778785 () Bool)

(assert (=> d!107279 m!778785))

(declare-fun m!778787 () Bool)

(assert (=> d!107279 m!778787))

(declare-fun m!778789 () Bool)

(assert (=> b!833807 m!778789))

(declare-fun m!778791 () Bool)

(assert (=> b!833808 m!778791))

(assert (=> d!106743 d!107279))

(declare-fun bm!36494 () Bool)

(declare-fun c!90915 () Bool)

(declare-fun call!36498 () List!15852)

(declare-fun e!465144 () List!15852)

(assert (=> bm!36494 (= call!36498 ($colon$colon!534 e!465144 (ite c!90915 (h!16984 (toList!4469 lt!377921)) (tuple2!10083 (_1!5052 (tuple2!10083 lt!377933 minValue!754)) (_2!5052 (tuple2!10083 lt!377933 minValue!754))))))))

(declare-fun c!90918 () Bool)

(assert (=> bm!36494 (= c!90918 c!90915)))

(declare-fun bm!36495 () Bool)

(declare-fun call!36499 () List!15852)

(assert (=> bm!36495 (= call!36499 call!36498)))

(declare-fun bm!36496 () Bool)

(declare-fun call!36497 () List!15852)

(assert (=> bm!36496 (= call!36497 call!36499)))

(declare-fun c!90916 () Bool)

(declare-fun b!833809 () Bool)

(assert (=> b!833809 (= c!90916 (and ((_ is Cons!15848) (toList!4469 lt!377921)) (bvsgt (_1!5052 (h!16984 (toList!4469 lt!377921))) (_1!5052 (tuple2!10083 lt!377933 minValue!754)))))))

(declare-fun e!465143 () List!15852)

(declare-fun e!465146 () List!15852)

(assert (=> b!833809 (= e!465143 e!465146)))

(declare-fun b!833810 () Bool)

(assert (=> b!833810 (= e!465146 call!36497)))

(declare-fun b!833811 () Bool)

(assert (=> b!833811 (= e!465144 (insertStrictlySorted!270 (t!22212 (toList!4469 lt!377921)) (_1!5052 (tuple2!10083 lt!377933 minValue!754)) (_2!5052 (tuple2!10083 lt!377933 minValue!754))))))

(declare-fun b!833812 () Bool)

(declare-fun e!465145 () List!15852)

(assert (=> b!833812 (= e!465145 call!36498)))

(declare-fun b!833813 () Bool)

(declare-fun e!465147 () Bool)

(declare-fun lt!378372 () List!15852)

(assert (=> b!833813 (= e!465147 (contains!4190 lt!378372 (tuple2!10083 (_1!5052 (tuple2!10083 lt!377933 minValue!754)) (_2!5052 (tuple2!10083 lt!377933 minValue!754)))))))

(declare-fun b!833814 () Bool)

(declare-fun c!90917 () Bool)

(assert (=> b!833814 (= e!465144 (ite c!90917 (t!22212 (toList!4469 lt!377921)) (ite c!90916 (Cons!15848 (h!16984 (toList!4469 lt!377921)) (t!22212 (toList!4469 lt!377921))) Nil!15849)))))

(declare-fun b!833815 () Bool)

(assert (=> b!833815 (= e!465145 e!465143)))

(assert (=> b!833815 (= c!90917 (and ((_ is Cons!15848) (toList!4469 lt!377921)) (= (_1!5052 (h!16984 (toList!4469 lt!377921))) (_1!5052 (tuple2!10083 lt!377933 minValue!754)))))))

(declare-fun b!833816 () Bool)

(assert (=> b!833816 (= e!465143 call!36499)))

(declare-fun b!833817 () Bool)

(declare-fun res!566887 () Bool)

(assert (=> b!833817 (=> (not res!566887) (not e!465147))))

(assert (=> b!833817 (= res!566887 (containsKey!402 lt!378372 (_1!5052 (tuple2!10083 lt!377933 minValue!754))))))

(declare-fun d!107281 () Bool)

(assert (=> d!107281 e!465147))

(declare-fun res!566886 () Bool)

(assert (=> d!107281 (=> (not res!566886) (not e!465147))))

(assert (=> d!107281 (= res!566886 (isStrictlySorted!430 lt!378372))))

(assert (=> d!107281 (= lt!378372 e!465145)))

(assert (=> d!107281 (= c!90915 (and ((_ is Cons!15848) (toList!4469 lt!377921)) (bvslt (_1!5052 (h!16984 (toList!4469 lt!377921))) (_1!5052 (tuple2!10083 lt!377933 minValue!754)))))))

(assert (=> d!107281 (isStrictlySorted!430 (toList!4469 lt!377921))))

(assert (=> d!107281 (= (insertStrictlySorted!270 (toList!4469 lt!377921) (_1!5052 (tuple2!10083 lt!377933 minValue!754)) (_2!5052 (tuple2!10083 lt!377933 minValue!754))) lt!378372)))

(declare-fun b!833818 () Bool)

(assert (=> b!833818 (= e!465146 call!36497)))

(assert (= (and d!107281 c!90915) b!833812))

(assert (= (and d!107281 (not c!90915)) b!833815))

(assert (= (and b!833815 c!90917) b!833816))

(assert (= (and b!833815 (not c!90917)) b!833809))

(assert (= (and b!833809 c!90916) b!833810))

(assert (= (and b!833809 (not c!90916)) b!833818))

(assert (= (or b!833810 b!833818) bm!36496))

(assert (= (or b!833816 bm!36496) bm!36495))

(assert (= (or b!833812 bm!36495) bm!36494))

(assert (= (and bm!36494 c!90918) b!833811))

(assert (= (and bm!36494 (not c!90918)) b!833814))

(assert (= (and d!107281 res!566886) b!833817))

(assert (= (and b!833817 res!566887) b!833813))

(declare-fun m!778793 () Bool)

(assert (=> bm!36494 m!778793))

(declare-fun m!778795 () Bool)

(assert (=> b!833813 m!778795))

(declare-fun m!778797 () Bool)

(assert (=> b!833811 m!778797))

(declare-fun m!778799 () Bool)

(assert (=> b!833817 m!778799))

(declare-fun m!778801 () Bool)

(assert (=> d!107281 m!778801))

(declare-fun m!778803 () Bool)

(assert (=> d!107281 m!778803))

(assert (=> d!106743 d!107281))

(assert (=> b!833273 d!107063))

(assert (=> b!833273 d!107065))

(declare-fun lt!378373 () Bool)

(declare-fun d!107283 () Bool)

(assert (=> d!107283 (= lt!378373 (select (content!388 (toList!4469 lt!378008)) (tuple2!10083 lt!377957 zeroValueAfter!34)))))

(declare-fun e!465149 () Bool)

(assert (=> d!107283 (= lt!378373 e!465149)))

(declare-fun res!566889 () Bool)

(assert (=> d!107283 (=> (not res!566889) (not e!465149))))

(assert (=> d!107283 (= res!566889 ((_ is Cons!15848) (toList!4469 lt!378008)))))

(assert (=> d!107283 (= (contains!4190 (toList!4469 lt!378008) (tuple2!10083 lt!377957 zeroValueAfter!34)) lt!378373)))

(declare-fun b!833819 () Bool)

(declare-fun e!465148 () Bool)

(assert (=> b!833819 (= e!465149 e!465148)))

(declare-fun res!566888 () Bool)

(assert (=> b!833819 (=> res!566888 e!465148)))

(assert (=> b!833819 (= res!566888 (= (h!16984 (toList!4469 lt!378008)) (tuple2!10083 lt!377957 zeroValueAfter!34)))))

(declare-fun b!833820 () Bool)

(assert (=> b!833820 (= e!465148 (contains!4190 (t!22212 (toList!4469 lt!378008)) (tuple2!10083 lt!377957 zeroValueAfter!34)))))

(assert (= (and d!107283 res!566889) b!833819))

(assert (= (and b!833819 (not res!566888)) b!833820))

(declare-fun m!778805 () Bool)

(assert (=> d!107283 m!778805))

(declare-fun m!778807 () Bool)

(assert (=> d!107283 m!778807))

(declare-fun m!778809 () Bool)

(assert (=> b!833820 m!778809))

(assert (=> b!832989 d!107283))

(declare-fun d!107285 () Bool)

(assert (=> d!107285 (= (get!11827 (getValueByKey!417 (toList!4469 lt!377956) lt!377959)) (v!10101 (getValueByKey!417 (toList!4469 lt!377956) lt!377959)))))

(assert (=> d!106685 d!107285))

(declare-fun d!107287 () Bool)

(declare-fun c!90919 () Bool)

(assert (=> d!107287 (= c!90919 (and ((_ is Cons!15848) (toList!4469 lt!377956)) (= (_1!5052 (h!16984 (toList!4469 lt!377956))) lt!377959)))))

(declare-fun e!465150 () Option!423)

(assert (=> d!107287 (= (getValueByKey!417 (toList!4469 lt!377956) lt!377959) e!465150)))

(declare-fun b!833823 () Bool)

(declare-fun e!465151 () Option!423)

(assert (=> b!833823 (= e!465151 (getValueByKey!417 (t!22212 (toList!4469 lt!377956)) lt!377959))))

(declare-fun b!833824 () Bool)

(assert (=> b!833824 (= e!465151 None!421)))

(declare-fun b!833822 () Bool)

(assert (=> b!833822 (= e!465150 e!465151)))

(declare-fun c!90920 () Bool)

(assert (=> b!833822 (= c!90920 (and ((_ is Cons!15848) (toList!4469 lt!377956)) (not (= (_1!5052 (h!16984 (toList!4469 lt!377956))) lt!377959))))))

(declare-fun b!833821 () Bool)

(assert (=> b!833821 (= e!465150 (Some!422 (_2!5052 (h!16984 (toList!4469 lt!377956)))))))

(assert (= (and d!107287 c!90919) b!833821))

(assert (= (and d!107287 (not c!90919)) b!833822))

(assert (= (and b!833822 c!90920) b!833823))

(assert (= (and b!833822 (not c!90920)) b!833824))

(declare-fun m!778811 () Bool)

(assert (=> b!833823 m!778811))

(assert (=> d!106685 d!107287))

(declare-fun d!107289 () Bool)

(assert (=> d!107289 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377875) (_1!5052 lt!377756)))))

(declare-fun lt!378374 () Unit!28510)

(assert (=> d!107289 (= lt!378374 (choose!1433 (toList!4469 lt!377875) (_1!5052 lt!377756)))))

(declare-fun e!465152 () Bool)

(assert (=> d!107289 e!465152))

(declare-fun res!566890 () Bool)

(assert (=> d!107289 (=> (not res!566890) (not e!465152))))

(assert (=> d!107289 (= res!566890 (isStrictlySorted!430 (toList!4469 lt!377875)))))

(assert (=> d!107289 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377875) (_1!5052 lt!377756)) lt!378374)))

(declare-fun b!833825 () Bool)

(assert (=> b!833825 (= e!465152 (containsKey!402 (toList!4469 lt!377875) (_1!5052 lt!377756)))))

(assert (= (and d!107289 res!566890) b!833825))

(assert (=> d!107289 m!777177))

(assert (=> d!107289 m!777177))

(assert (=> d!107289 m!777713))

(declare-fun m!778813 () Bool)

(assert (=> d!107289 m!778813))

(declare-fun m!778815 () Bool)

(assert (=> d!107289 m!778815))

(assert (=> b!833825 m!777709))

(assert (=> b!833103 d!107289))

(declare-fun d!107291 () Bool)

(assert (=> d!107291 (= (isDefined!312 (getValueByKey!417 (toList!4469 lt!377875) (_1!5052 lt!377756))) (not (isEmpty!665 (getValueByKey!417 (toList!4469 lt!377875) (_1!5052 lt!377756)))))))

(declare-fun bs!23330 () Bool)

(assert (= bs!23330 d!107291))

(assert (=> bs!23330 m!777177))

(declare-fun m!778817 () Bool)

(assert (=> bs!23330 m!778817))

(assert (=> b!833103 d!107291))

(assert (=> b!833103 d!106805))

(declare-fun d!107293 () Bool)

(assert (=> d!107293 (= (apply!373 lt!378037 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!11827 (getValueByKey!417 (toList!4469 lt!378037) (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))))

(declare-fun bs!23331 () Bool)

(assert (= bs!23331 d!107293))

(assert (=> bs!23331 m!777463))

(assert (=> bs!23331 m!778417))

(assert (=> bs!23331 m!778417))

(declare-fun m!778819 () Bool)

(assert (=> bs!23331 m!778819))

(assert (=> b!833029 d!107293))

(assert (=> b!833029 d!106959))

(assert (=> b!833286 d!107115))

(assert (=> b!833286 d!106849))

(declare-fun d!107295 () Bool)

(declare-fun lt!378375 () Bool)

(assert (=> d!107295 (= lt!378375 (select (content!388 (t!22212 (toList!4469 lt!377827))) lt!377756))))

(declare-fun e!465154 () Bool)

(assert (=> d!107295 (= lt!378375 e!465154)))

(declare-fun res!566892 () Bool)

(assert (=> d!107295 (=> (not res!566892) (not e!465154))))

(assert (=> d!107295 (= res!566892 ((_ is Cons!15848) (t!22212 (toList!4469 lt!377827))))))

(assert (=> d!107295 (= (contains!4190 (t!22212 (toList!4469 lt!377827)) lt!377756) lt!378375)))

(declare-fun b!833826 () Bool)

(declare-fun e!465153 () Bool)

(assert (=> b!833826 (= e!465154 e!465153)))

(declare-fun res!566891 () Bool)

(assert (=> b!833826 (=> res!566891 e!465153)))

(assert (=> b!833826 (= res!566891 (= (h!16984 (t!22212 (toList!4469 lt!377827))) lt!377756))))

(declare-fun b!833827 () Bool)

(assert (=> b!833827 (= e!465153 (contains!4190 (t!22212 (t!22212 (toList!4469 lt!377827))) lt!377756))))

(assert (= (and d!107295 res!566892) b!833826))

(assert (= (and b!833826 (not res!566891)) b!833827))

(declare-fun m!778821 () Bool)

(assert (=> d!107295 m!778821))

(declare-fun m!778823 () Bool)

(assert (=> d!107295 m!778823))

(declare-fun m!778825 () Bool)

(assert (=> b!833827 m!778825))

(assert (=> b!833102 d!107295))

(declare-fun d!107297 () Bool)

(assert (=> d!107297 (= (get!11827 (getValueByKey!417 (toList!4469 lt!377925) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!10101 (getValueByKey!417 (toList!4469 lt!377925) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106699 d!107297))

(assert (=> d!106699 d!106975))

(declare-fun d!107299 () Bool)

(declare-fun e!465156 () Bool)

(assert (=> d!107299 e!465156))

(declare-fun res!566893 () Bool)

(assert (=> d!107299 (=> res!566893 e!465156)))

(declare-fun lt!378376 () Bool)

(assert (=> d!107299 (= res!566893 (not lt!378376))))

(declare-fun lt!378379 () Bool)

(assert (=> d!107299 (= lt!378376 lt!378379)))

(declare-fun lt!378377 () Unit!28510)

(declare-fun e!465155 () Unit!28510)

(assert (=> d!107299 (= lt!378377 e!465155)))

(declare-fun c!90921 () Bool)

(assert (=> d!107299 (= c!90921 lt!378379)))

(assert (=> d!107299 (= lt!378379 (containsKey!402 (toList!4469 lt!377996) (_1!5052 (tuple2!10083 lt!377950 minValue!754))))))

(assert (=> d!107299 (= (contains!4189 lt!377996 (_1!5052 (tuple2!10083 lt!377950 minValue!754))) lt!378376)))

(declare-fun b!833828 () Bool)

(declare-fun lt!378378 () Unit!28510)

(assert (=> b!833828 (= e!465155 lt!378378)))

(assert (=> b!833828 (= lt!378378 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377996) (_1!5052 (tuple2!10083 lt!377950 minValue!754))))))

(assert (=> b!833828 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377996) (_1!5052 (tuple2!10083 lt!377950 minValue!754))))))

(declare-fun b!833829 () Bool)

(declare-fun Unit!28554 () Unit!28510)

(assert (=> b!833829 (= e!465155 Unit!28554)))

(declare-fun b!833830 () Bool)

(assert (=> b!833830 (= e!465156 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377996) (_1!5052 (tuple2!10083 lt!377950 minValue!754)))))))

(assert (= (and d!107299 c!90921) b!833828))

(assert (= (and d!107299 (not c!90921)) b!833829))

(assert (= (and d!107299 (not res!566893)) b!833830))

(declare-fun m!778827 () Bool)

(assert (=> d!107299 m!778827))

(declare-fun m!778829 () Bool)

(assert (=> b!833828 m!778829))

(assert (=> b!833828 m!777341))

(assert (=> b!833828 m!777341))

(declare-fun m!778831 () Bool)

(assert (=> b!833828 m!778831))

(assert (=> b!833830 m!777341))

(assert (=> b!833830 m!777341))

(assert (=> b!833830 m!778831))

(assert (=> d!106663 d!107299))

(declare-fun c!90922 () Bool)

(declare-fun d!107301 () Bool)

(assert (=> d!107301 (= c!90922 (and ((_ is Cons!15848) lt!377995) (= (_1!5052 (h!16984 lt!377995)) (_1!5052 (tuple2!10083 lt!377950 minValue!754)))))))

(declare-fun e!465157 () Option!423)

(assert (=> d!107301 (= (getValueByKey!417 lt!377995 (_1!5052 (tuple2!10083 lt!377950 minValue!754))) e!465157)))

(declare-fun b!833833 () Bool)

(declare-fun e!465158 () Option!423)

(assert (=> b!833833 (= e!465158 (getValueByKey!417 (t!22212 lt!377995) (_1!5052 (tuple2!10083 lt!377950 minValue!754))))))

(declare-fun b!833834 () Bool)

(assert (=> b!833834 (= e!465158 None!421)))

(declare-fun b!833832 () Bool)

(assert (=> b!833832 (= e!465157 e!465158)))

(declare-fun c!90923 () Bool)

(assert (=> b!833832 (= c!90923 (and ((_ is Cons!15848) lt!377995) (not (= (_1!5052 (h!16984 lt!377995)) (_1!5052 (tuple2!10083 lt!377950 minValue!754))))))))

(declare-fun b!833831 () Bool)

(assert (=> b!833831 (= e!465157 (Some!422 (_2!5052 (h!16984 lt!377995))))))

(assert (= (and d!107301 c!90922) b!833831))

(assert (= (and d!107301 (not c!90922)) b!833832))

(assert (= (and b!833832 c!90923) b!833833))

(assert (= (and b!833832 (not c!90923)) b!833834))

(declare-fun m!778833 () Bool)

(assert (=> b!833833 m!778833))

(assert (=> d!106663 d!107301))

(declare-fun d!107303 () Bool)

(assert (=> d!107303 (= (getValueByKey!417 lt!377995 (_1!5052 (tuple2!10083 lt!377950 minValue!754))) (Some!422 (_2!5052 (tuple2!10083 lt!377950 minValue!754))))))

(declare-fun lt!378380 () Unit!28510)

(assert (=> d!107303 (= lt!378380 (choose!1429 lt!377995 (_1!5052 (tuple2!10083 lt!377950 minValue!754)) (_2!5052 (tuple2!10083 lt!377950 minValue!754))))))

(declare-fun e!465159 () Bool)

(assert (=> d!107303 e!465159))

(declare-fun res!566894 () Bool)

(assert (=> d!107303 (=> (not res!566894) (not e!465159))))

(assert (=> d!107303 (= res!566894 (isStrictlySorted!430 lt!377995))))

(assert (=> d!107303 (= (lemmaContainsTupThenGetReturnValue!231 lt!377995 (_1!5052 (tuple2!10083 lt!377950 minValue!754)) (_2!5052 (tuple2!10083 lt!377950 minValue!754))) lt!378380)))

(declare-fun b!833835 () Bool)

(declare-fun res!566895 () Bool)

(assert (=> b!833835 (=> (not res!566895) (not e!465159))))

(assert (=> b!833835 (= res!566895 (containsKey!402 lt!377995 (_1!5052 (tuple2!10083 lt!377950 minValue!754))))))

(declare-fun b!833836 () Bool)

(assert (=> b!833836 (= e!465159 (contains!4190 lt!377995 (tuple2!10083 (_1!5052 (tuple2!10083 lt!377950 minValue!754)) (_2!5052 (tuple2!10083 lt!377950 minValue!754)))))))

(assert (= (and d!107303 res!566894) b!833835))

(assert (= (and b!833835 res!566895) b!833836))

(assert (=> d!107303 m!777335))

(declare-fun m!778835 () Bool)

(assert (=> d!107303 m!778835))

(declare-fun m!778837 () Bool)

(assert (=> d!107303 m!778837))

(declare-fun m!778839 () Bool)

(assert (=> b!833835 m!778839))

(declare-fun m!778841 () Bool)

(assert (=> b!833836 m!778841))

(assert (=> d!106663 d!107303))

(declare-fun c!90924 () Bool)

(declare-fun call!36501 () List!15852)

(declare-fun e!465161 () List!15852)

(declare-fun bm!36497 () Bool)

(assert (=> bm!36497 (= call!36501 ($colon$colon!534 e!465161 (ite c!90924 (h!16984 (toList!4469 lt!377956)) (tuple2!10083 (_1!5052 (tuple2!10083 lt!377950 minValue!754)) (_2!5052 (tuple2!10083 lt!377950 minValue!754))))))))

(declare-fun c!90927 () Bool)

(assert (=> bm!36497 (= c!90927 c!90924)))

(declare-fun bm!36498 () Bool)

(declare-fun call!36502 () List!15852)

(assert (=> bm!36498 (= call!36502 call!36501)))

(declare-fun bm!36499 () Bool)

(declare-fun call!36500 () List!15852)

(assert (=> bm!36499 (= call!36500 call!36502)))

(declare-fun c!90925 () Bool)

(declare-fun b!833837 () Bool)

(assert (=> b!833837 (= c!90925 (and ((_ is Cons!15848) (toList!4469 lt!377956)) (bvsgt (_1!5052 (h!16984 (toList!4469 lt!377956))) (_1!5052 (tuple2!10083 lt!377950 minValue!754)))))))

(declare-fun e!465160 () List!15852)

(declare-fun e!465163 () List!15852)

(assert (=> b!833837 (= e!465160 e!465163)))

(declare-fun b!833838 () Bool)

(assert (=> b!833838 (= e!465163 call!36500)))

(declare-fun b!833839 () Bool)

(assert (=> b!833839 (= e!465161 (insertStrictlySorted!270 (t!22212 (toList!4469 lt!377956)) (_1!5052 (tuple2!10083 lt!377950 minValue!754)) (_2!5052 (tuple2!10083 lt!377950 minValue!754))))))

(declare-fun b!833840 () Bool)

(declare-fun e!465162 () List!15852)

(assert (=> b!833840 (= e!465162 call!36501)))

(declare-fun e!465164 () Bool)

(declare-fun b!833841 () Bool)

(declare-fun lt!378381 () List!15852)

(assert (=> b!833841 (= e!465164 (contains!4190 lt!378381 (tuple2!10083 (_1!5052 (tuple2!10083 lt!377950 minValue!754)) (_2!5052 (tuple2!10083 lt!377950 minValue!754)))))))

(declare-fun c!90926 () Bool)

(declare-fun b!833842 () Bool)

(assert (=> b!833842 (= e!465161 (ite c!90926 (t!22212 (toList!4469 lt!377956)) (ite c!90925 (Cons!15848 (h!16984 (toList!4469 lt!377956)) (t!22212 (toList!4469 lt!377956))) Nil!15849)))))

(declare-fun b!833843 () Bool)

(assert (=> b!833843 (= e!465162 e!465160)))

(assert (=> b!833843 (= c!90926 (and ((_ is Cons!15848) (toList!4469 lt!377956)) (= (_1!5052 (h!16984 (toList!4469 lt!377956))) (_1!5052 (tuple2!10083 lt!377950 minValue!754)))))))

(declare-fun b!833844 () Bool)

(assert (=> b!833844 (= e!465160 call!36502)))

(declare-fun b!833845 () Bool)

(declare-fun res!566897 () Bool)

(assert (=> b!833845 (=> (not res!566897) (not e!465164))))

(assert (=> b!833845 (= res!566897 (containsKey!402 lt!378381 (_1!5052 (tuple2!10083 lt!377950 minValue!754))))))

(declare-fun d!107305 () Bool)

(assert (=> d!107305 e!465164))

(declare-fun res!566896 () Bool)

(assert (=> d!107305 (=> (not res!566896) (not e!465164))))

(assert (=> d!107305 (= res!566896 (isStrictlySorted!430 lt!378381))))

(assert (=> d!107305 (= lt!378381 e!465162)))

(assert (=> d!107305 (= c!90924 (and ((_ is Cons!15848) (toList!4469 lt!377956)) (bvslt (_1!5052 (h!16984 (toList!4469 lt!377956))) (_1!5052 (tuple2!10083 lt!377950 minValue!754)))))))

(assert (=> d!107305 (isStrictlySorted!430 (toList!4469 lt!377956))))

(assert (=> d!107305 (= (insertStrictlySorted!270 (toList!4469 lt!377956) (_1!5052 (tuple2!10083 lt!377950 minValue!754)) (_2!5052 (tuple2!10083 lt!377950 minValue!754))) lt!378381)))

(declare-fun b!833846 () Bool)

(assert (=> b!833846 (= e!465163 call!36500)))

(assert (= (and d!107305 c!90924) b!833840))

(assert (= (and d!107305 (not c!90924)) b!833843))

(assert (= (and b!833843 c!90926) b!833844))

(assert (= (and b!833843 (not c!90926)) b!833837))

(assert (= (and b!833837 c!90925) b!833838))

(assert (= (and b!833837 (not c!90925)) b!833846))

(assert (= (or b!833838 b!833846) bm!36499))

(assert (= (or b!833844 bm!36499) bm!36498))

(assert (= (or b!833840 bm!36498) bm!36497))

(assert (= (and bm!36497 c!90927) b!833839))

(assert (= (and bm!36497 (not c!90927)) b!833842))

(assert (= (and d!107305 res!566896) b!833845))

(assert (= (and b!833845 res!566897) b!833841))

(declare-fun m!778843 () Bool)

(assert (=> bm!36497 m!778843))

(declare-fun m!778845 () Bool)

(assert (=> b!833841 m!778845))

(declare-fun m!778847 () Bool)

(assert (=> b!833839 m!778847))

(declare-fun m!778849 () Bool)

(assert (=> b!833845 m!778849))

(declare-fun m!778851 () Bool)

(assert (=> d!107305 m!778851))

(declare-fun m!778853 () Bool)

(assert (=> d!107305 m!778853))

(assert (=> d!106663 d!107305))

(assert (=> d!106893 d!106891))

(declare-fun d!107307 () Bool)

(assert (=> d!107307 (= (getValueByKey!417 lt!377966 (_1!5052 lt!377756)) (Some!422 (_2!5052 lt!377756)))))

(assert (=> d!107307 true))

(declare-fun _$22!581 () Unit!28510)

(assert (=> d!107307 (= (choose!1429 lt!377966 (_1!5052 lt!377756) (_2!5052 lt!377756)) _$22!581)))

(declare-fun bs!23332 () Bool)

(assert (= bs!23332 d!107307))

(assert (=> bs!23332 m!777275))

(assert (=> d!106893 d!107307))

(declare-fun d!107309 () Bool)

(declare-fun res!566898 () Bool)

(declare-fun e!465165 () Bool)

(assert (=> d!107309 (=> res!566898 e!465165)))

(assert (=> d!107309 (= res!566898 (or ((_ is Nil!15849) lt!377966) ((_ is Nil!15849) (t!22212 lt!377966))))))

(assert (=> d!107309 (= (isStrictlySorted!430 lt!377966) e!465165)))

(declare-fun b!833847 () Bool)

(declare-fun e!465166 () Bool)

(assert (=> b!833847 (= e!465165 e!465166)))

(declare-fun res!566899 () Bool)

(assert (=> b!833847 (=> (not res!566899) (not e!465166))))

(assert (=> b!833847 (= res!566899 (bvslt (_1!5052 (h!16984 lt!377966)) (_1!5052 (h!16984 (t!22212 lt!377966)))))))

(declare-fun b!833848 () Bool)

(assert (=> b!833848 (= e!465166 (isStrictlySorted!430 (t!22212 lt!377966)))))

(assert (= (and d!107309 (not res!566898)) b!833847))

(assert (= (and b!833847 res!566899) b!833848))

(declare-fun m!778855 () Bool)

(assert (=> b!833848 m!778855))

(assert (=> d!106893 d!107309))

(declare-fun d!107311 () Bool)

(declare-fun res!566900 () Bool)

(declare-fun e!465167 () Bool)

(assert (=> d!107311 (=> res!566900 e!465167)))

(assert (=> d!107311 (= res!566900 (and ((_ is Cons!15848) lt!378135) (= (_1!5052 (h!16984 lt!378135)) (_1!5052 lt!377761))))))

(assert (=> d!107311 (= (containsKey!402 lt!378135 (_1!5052 lt!377761)) e!465167)))

(declare-fun b!833849 () Bool)

(declare-fun e!465168 () Bool)

(assert (=> b!833849 (= e!465167 e!465168)))

(declare-fun res!566901 () Bool)

(assert (=> b!833849 (=> (not res!566901) (not e!465168))))

(assert (=> b!833849 (= res!566901 (and (or (not ((_ is Cons!15848) lt!378135)) (bvsle (_1!5052 (h!16984 lt!378135)) (_1!5052 lt!377761))) ((_ is Cons!15848) lt!378135) (bvslt (_1!5052 (h!16984 lt!378135)) (_1!5052 lt!377761))))))

(declare-fun b!833850 () Bool)

(assert (=> b!833850 (= e!465168 (containsKey!402 (t!22212 lt!378135) (_1!5052 lt!377761)))))

(assert (= (and d!107311 (not res!566900)) b!833849))

(assert (= (and b!833849 res!566901) b!833850))

(declare-fun m!778857 () Bool)

(assert (=> b!833850 m!778857))

(assert (=> b!833200 d!107311))

(declare-fun d!107313 () Bool)

(declare-fun lt!378382 () Bool)

(assert (=> d!107313 (= lt!378382 (select (content!388 (toList!4469 lt!378091)) (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun e!465170 () Bool)

(assert (=> d!107313 (= lt!378382 e!465170)))

(declare-fun res!566903 () Bool)

(assert (=> d!107313 (=> (not res!566903) (not e!465170))))

(assert (=> d!107313 (= res!566903 ((_ is Cons!15848) (toList!4469 lt!378091)))))

(assert (=> d!107313 (= (contains!4190 (toList!4469 lt!378091) (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!378382)))

(declare-fun b!833851 () Bool)

(declare-fun e!465169 () Bool)

(assert (=> b!833851 (= e!465170 e!465169)))

(declare-fun res!566902 () Bool)

(assert (=> b!833851 (=> res!566902 e!465169)))

(assert (=> b!833851 (= res!566902 (= (h!16984 (toList!4469 lt!378091)) (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!833852 () Bool)

(assert (=> b!833852 (= e!465169 (contains!4190 (t!22212 (toList!4469 lt!378091)) (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (= (and d!107313 res!566903) b!833851))

(assert (= (and b!833851 (not res!566902)) b!833852))

(declare-fun m!778859 () Bool)

(assert (=> d!107313 m!778859))

(declare-fun m!778861 () Bool)

(assert (=> d!107313 m!778861))

(declare-fun m!778863 () Bool)

(assert (=> b!833852 m!778863))

(assert (=> b!833097 d!107313))

(declare-fun d!107315 () Bool)

(declare-fun res!566904 () Bool)

(declare-fun e!465171 () Bool)

(assert (=> d!107315 (=> res!566904 e!465171)))

(assert (=> d!107315 (= res!566904 (and ((_ is Cons!15848) (toList!4469 lt!377819)) (= (_1!5052 (h!16984 (toList!4469 lt!377819))) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!107315 (= (containsKey!402 (toList!4469 lt!377819) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!465171)))

(declare-fun b!833853 () Bool)

(declare-fun e!465172 () Bool)

(assert (=> b!833853 (= e!465171 e!465172)))

(declare-fun res!566905 () Bool)

(assert (=> b!833853 (=> (not res!566905) (not e!465172))))

(assert (=> b!833853 (= res!566905 (and (or (not ((_ is Cons!15848) (toList!4469 lt!377819))) (bvsle (_1!5052 (h!16984 (toList!4469 lt!377819))) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) ((_ is Cons!15848) (toList!4469 lt!377819)) (bvslt (_1!5052 (h!16984 (toList!4469 lt!377819))) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!833854 () Bool)

(assert (=> b!833854 (= e!465172 (containsKey!402 (t!22212 (toList!4469 lt!377819)) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and d!107315 (not res!566904)) b!833853))

(assert (= (and b!833853 res!566905) b!833854))

(declare-fun m!778865 () Bool)

(assert (=> b!833854 m!778865))

(assert (=> d!106791 d!107315))

(declare-fun c!90928 () Bool)

(declare-fun d!107317 () Bool)

(assert (=> d!107317 (= c!90928 (and ((_ is Cons!15848) (toList!4469 lt!378060)) (= (_1!5052 (h!16984 (toList!4469 lt!378060))) (_1!5052 (tuple2!10083 lt!377935 zeroValueBefore!34)))))))

(declare-fun e!465173 () Option!423)

(assert (=> d!107317 (= (getValueByKey!417 (toList!4469 lt!378060) (_1!5052 (tuple2!10083 lt!377935 zeroValueBefore!34))) e!465173)))

(declare-fun b!833857 () Bool)

(declare-fun e!465174 () Option!423)

(assert (=> b!833857 (= e!465174 (getValueByKey!417 (t!22212 (toList!4469 lt!378060)) (_1!5052 (tuple2!10083 lt!377935 zeroValueBefore!34))))))

(declare-fun b!833858 () Bool)

(assert (=> b!833858 (= e!465174 None!421)))

(declare-fun b!833856 () Bool)

(assert (=> b!833856 (= e!465173 e!465174)))

(declare-fun c!90929 () Bool)

(assert (=> b!833856 (= c!90929 (and ((_ is Cons!15848) (toList!4469 lt!378060)) (not (= (_1!5052 (h!16984 (toList!4469 lt!378060))) (_1!5052 (tuple2!10083 lt!377935 zeroValueBefore!34))))))))

(declare-fun b!833855 () Bool)

(assert (=> b!833855 (= e!465173 (Some!422 (_2!5052 (h!16984 (toList!4469 lt!378060)))))))

(assert (= (and d!107317 c!90928) b!833855))

(assert (= (and d!107317 (not c!90928)) b!833856))

(assert (= (and b!833856 c!90929) b!833857))

(assert (= (and b!833856 (not c!90929)) b!833858))

(declare-fun m!778867 () Bool)

(assert (=> b!833857 m!778867))

(assert (=> b!833052 d!107317))

(declare-fun d!107319 () Bool)

(declare-fun lt!378383 () Bool)

(assert (=> d!107319 (= lt!378383 (select (content!388 (toList!4469 lt!378192)) (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!465176 () Bool)

(assert (=> d!107319 (= lt!378383 e!465176)))

(declare-fun res!566907 () Bool)

(assert (=> d!107319 (=> (not res!566907) (not e!465176))))

(assert (=> d!107319 (= res!566907 ((_ is Cons!15848) (toList!4469 lt!378192)))))

(assert (=> d!107319 (= (contains!4190 (toList!4469 lt!378192) (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!378383)))

(declare-fun b!833859 () Bool)

(declare-fun e!465175 () Bool)

(assert (=> b!833859 (= e!465176 e!465175)))

(declare-fun res!566906 () Bool)

(assert (=> b!833859 (=> res!566906 e!465175)))

(assert (=> b!833859 (= res!566906 (= (h!16984 (toList!4469 lt!378192)) (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!833860 () Bool)

(assert (=> b!833860 (= e!465175 (contains!4190 (t!22212 (toList!4469 lt!378192)) (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!107319 res!566907) b!833859))

(assert (= (and b!833859 (not res!566906)) b!833860))

(declare-fun m!778869 () Bool)

(assert (=> d!107319 m!778869))

(declare-fun m!778871 () Bool)

(assert (=> d!107319 m!778871))

(declare-fun m!778873 () Bool)

(assert (=> b!833860 m!778873))

(assert (=> b!833276 d!107319))

(declare-fun d!107321 () Bool)

(declare-fun lt!378384 () Bool)

(assert (=> d!107321 (= lt!378384 (select (content!388 (t!22212 (toList!4469 lt!377819))) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun e!465178 () Bool)

(assert (=> d!107321 (= lt!378384 e!465178)))

(declare-fun res!566909 () Bool)

(assert (=> d!107321 (=> (not res!566909) (not e!465178))))

(assert (=> d!107321 (= res!566909 ((_ is Cons!15848) (t!22212 (toList!4469 lt!377819))))))

(assert (=> d!107321 (= (contains!4190 (t!22212 (toList!4469 lt!377819)) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!378384)))

(declare-fun b!833861 () Bool)

(declare-fun e!465177 () Bool)

(assert (=> b!833861 (= e!465178 e!465177)))

(declare-fun res!566908 () Bool)

(assert (=> b!833861 (=> res!566908 e!465177)))

(assert (=> b!833861 (= res!566908 (= (h!16984 (t!22212 (toList!4469 lt!377819))) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!833862 () Bool)

(assert (=> b!833862 (= e!465177 (contains!4190 (t!22212 (t!22212 (toList!4469 lt!377819))) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!107321 res!566909) b!833861))

(assert (= (and b!833861 (not res!566908)) b!833862))

(declare-fun m!778875 () Bool)

(assert (=> d!107321 m!778875))

(declare-fun m!778877 () Bool)

(assert (=> d!107321 m!778877))

(declare-fun m!778879 () Bool)

(assert (=> b!833862 m!778879))

(assert (=> b!833095 d!107321))

(assert (=> b!833014 d!107013))

(assert (=> b!833279 d!107129))

(assert (=> b!833279 d!107131))

(declare-fun lt!378385 () Bool)

(declare-fun d!107323 () Bool)

(assert (=> d!107323 (= lt!378385 (select (content!388 (toList!4469 lt!378217)) (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun e!465180 () Bool)

(assert (=> d!107323 (= lt!378385 e!465180)))

(declare-fun res!566911 () Bool)

(assert (=> d!107323 (=> (not res!566911) (not e!465180))))

(assert (=> d!107323 (= res!566911 ((_ is Cons!15848) (toList!4469 lt!378217)))))

(assert (=> d!107323 (= (contains!4190 (toList!4469 lt!378217) (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!378385)))

(declare-fun b!833863 () Bool)

(declare-fun e!465179 () Bool)

(assert (=> b!833863 (= e!465180 e!465179)))

(declare-fun res!566910 () Bool)

(assert (=> b!833863 (=> res!566910 e!465179)))

(assert (=> b!833863 (= res!566910 (= (h!16984 (toList!4469 lt!378217)) (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!833864 () Bool)

(assert (=> b!833864 (= e!465179 (contains!4190 (t!22212 (toList!4469 lt!378217)) (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (= (and d!107323 res!566911) b!833863))

(assert (= (and b!833863 (not res!566910)) b!833864))

(declare-fun m!778881 () Bool)

(assert (=> d!107323 m!778881))

(declare-fun m!778883 () Bool)

(assert (=> d!107323 m!778883))

(declare-fun m!778885 () Bool)

(assert (=> b!833864 m!778885))

(assert (=> b!833323 d!107323))

(declare-fun d!107325 () Bool)

(declare-fun res!566912 () Bool)

(declare-fun e!465181 () Bool)

(assert (=> d!107325 (=> res!566912 e!465181)))

(assert (=> d!107325 (= res!566912 (and ((_ is Cons!15848) lt!377814) (= (_1!5052 (h!16984 lt!377814)) (_1!5052 lt!377756))))))

(assert (=> d!107325 (= (containsKey!402 lt!377814 (_1!5052 lt!377756)) e!465181)))

(declare-fun b!833865 () Bool)

(declare-fun e!465182 () Bool)

(assert (=> b!833865 (= e!465181 e!465182)))

(declare-fun res!566913 () Bool)

(assert (=> b!833865 (=> (not res!566913) (not e!465182))))

(assert (=> b!833865 (= res!566913 (and (or (not ((_ is Cons!15848) lt!377814)) (bvsle (_1!5052 (h!16984 lt!377814)) (_1!5052 lt!377756))) ((_ is Cons!15848) lt!377814) (bvslt (_1!5052 (h!16984 lt!377814)) (_1!5052 lt!377756))))))

(declare-fun b!833866 () Bool)

(assert (=> b!833866 (= e!465182 (containsKey!402 (t!22212 lt!377814) (_1!5052 lt!377756)))))

(assert (= (and d!107325 (not res!566912)) b!833865))

(assert (= (and b!833865 res!566913) b!833866))

(declare-fun m!778887 () Bool)

(assert (=> b!833866 m!778887))

(assert (=> b!833291 d!107325))

(declare-fun d!107327 () Bool)

(assert (=> d!107327 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377925) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun lt!378386 () Unit!28510)

(assert (=> d!107327 (= lt!378386 (choose!1433 (toList!4469 lt!377925) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun e!465183 () Bool)

(assert (=> d!107327 e!465183))

(declare-fun res!566914 () Bool)

(assert (=> d!107327 (=> (not res!566914) (not e!465183))))

(assert (=> d!107327 (= res!566914 (isStrictlySorted!430 (toList!4469 lt!377925)))))

(assert (=> d!107327 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377925) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)) lt!378386)))

(declare-fun b!833867 () Bool)

(assert (=> b!833867 (= e!465183 (containsKey!402 (toList!4469 lt!377925) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!107327 res!566914) b!833867))

(assert (=> d!107327 m!777093))

(assert (=> d!107327 m!777437))

(assert (=> d!107327 m!777437))

(assert (=> d!107327 m!777439))

(assert (=> d!107327 m!777093))

(declare-fun m!778889 () Bool)

(assert (=> d!107327 m!778889))

(assert (=> d!107327 m!778129))

(assert (=> b!833867 m!777093))

(assert (=> b!833867 m!777433))

(assert (=> b!832999 d!107327))

(declare-fun d!107329 () Bool)

(assert (=> d!107329 (= (isDefined!312 (getValueByKey!417 (toList!4469 lt!377925) (select (arr!22331 _keys!976) #b00000000000000000000000000000000))) (not (isEmpty!665 (getValueByKey!417 (toList!4469 lt!377925) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun bs!23333 () Bool)

(assert (= bs!23333 d!107329))

(assert (=> bs!23333 m!777437))

(declare-fun m!778891 () Bool)

(assert (=> bs!23333 m!778891))

(assert (=> b!832999 d!107329))

(assert (=> b!832999 d!107261))

(assert (=> b!833100 d!107121))

(assert (=> b!833100 d!107123))

(declare-fun d!107331 () Bool)

(assert (=> d!107331 (= (get!11827 (getValueByKey!417 (toList!4469 lt!377947) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!10101 (getValueByKey!417 (toList!4469 lt!377947) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106855 d!107331))

(assert (=> d!106855 d!107185))

(declare-fun d!107333 () Bool)

(assert (=> d!107333 (= ($colon$colon!534 e!464608 (ite c!90665 (h!16984 (toList!4469 (+!1991 lt!377759 lt!377756))) (tuple2!10083 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (Cons!15848 (ite c!90665 (h!16984 (toList!4469 (+!1991 lt!377759 lt!377756))) (tuple2!10083 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) e!464608))))

(assert (=> bm!36445 d!107333))

(declare-fun d!107335 () Bool)

(declare-fun res!566915 () Bool)

(declare-fun e!465184 () Bool)

(assert (=> d!107335 (=> res!566915 e!465184)))

(assert (=> d!107335 (= res!566915 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22751 _keys!976)))))

(assert (=> d!107335 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!976 mask!1312) e!465184)))

(declare-fun b!833868 () Bool)

(declare-fun e!465186 () Bool)

(declare-fun e!465185 () Bool)

(assert (=> b!833868 (= e!465186 e!465185)))

(declare-fun lt!378389 () (_ BitVec 64))

(assert (=> b!833868 (= lt!378389 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!378388 () Unit!28510)

(assert (=> b!833868 (= lt!378388 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!378389 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!833868 (arrayContainsKey!0 _keys!976 lt!378389 #b00000000000000000000000000000000)))

(declare-fun lt!378387 () Unit!28510)

(assert (=> b!833868 (= lt!378387 lt!378388)))

(declare-fun res!566916 () Bool)

(assert (=> b!833868 (= res!566916 (= (seekEntryOrOpen!0 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) _keys!976 mask!1312) (Found!8696 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!833868 (=> (not res!566916) (not e!465185))))

(declare-fun b!833869 () Bool)

(declare-fun call!36503 () Bool)

(assert (=> b!833869 (= e!465186 call!36503)))

(declare-fun b!833870 () Bool)

(assert (=> b!833870 (= e!465184 e!465186)))

(declare-fun c!90930 () Bool)

(assert (=> b!833870 (= c!90930 (validKeyInArray!0 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!833871 () Bool)

(assert (=> b!833871 (= e!465185 call!36503)))

(declare-fun bm!36500 () Bool)

(assert (=> bm!36500 (= call!36503 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(assert (= (and d!107335 (not res!566915)) b!833870))

(assert (= (and b!833870 c!90930) b!833868))

(assert (= (and b!833870 (not c!90930)) b!833869))

(assert (= (and b!833868 res!566916) b!833871))

(assert (= (or b!833871 b!833869) bm!36500))

(assert (=> b!833868 m!778139))

(declare-fun m!778893 () Bool)

(assert (=> b!833868 m!778893))

(declare-fun m!778895 () Bool)

(assert (=> b!833868 m!778895))

(assert (=> b!833868 m!778139))

(declare-fun m!778897 () Bool)

(assert (=> b!833868 m!778897))

(assert (=> b!833870 m!778139))

(assert (=> b!833870 m!778139))

(assert (=> b!833870 m!778147))

(declare-fun m!778899 () Bool)

(assert (=> bm!36500 m!778899))

(assert (=> bm!36466 d!107335))

(declare-fun d!107337 () Bool)

(declare-fun res!566917 () Bool)

(declare-fun e!465187 () Bool)

(assert (=> d!107337 (=> res!566917 e!465187)))

(assert (=> d!107337 (= res!566917 (and ((_ is Cons!15848) (toList!4469 lt!377875)) (= (_1!5052 (h!16984 (toList!4469 lt!377875))) (_1!5052 lt!377756))))))

(assert (=> d!107337 (= (containsKey!402 (toList!4469 lt!377875) (_1!5052 lt!377756)) e!465187)))

(declare-fun b!833872 () Bool)

(declare-fun e!465188 () Bool)

(assert (=> b!833872 (= e!465187 e!465188)))

(declare-fun res!566918 () Bool)

(assert (=> b!833872 (=> (not res!566918) (not e!465188))))

(assert (=> b!833872 (= res!566918 (and (or (not ((_ is Cons!15848) (toList!4469 lt!377875))) (bvsle (_1!5052 (h!16984 (toList!4469 lt!377875))) (_1!5052 lt!377756))) ((_ is Cons!15848) (toList!4469 lt!377875)) (bvslt (_1!5052 (h!16984 (toList!4469 lt!377875))) (_1!5052 lt!377756))))))

(declare-fun b!833873 () Bool)

(assert (=> b!833873 (= e!465188 (containsKey!402 (t!22212 (toList!4469 lt!377875)) (_1!5052 lt!377756)))))

(assert (= (and d!107337 (not res!566917)) b!833872))

(assert (= (and b!833872 res!566918) b!833873))

(declare-fun m!778901 () Bool)

(assert (=> b!833873 m!778901))

(assert (=> d!106777 d!107337))

(declare-fun d!107339 () Bool)

(declare-fun c!90931 () Bool)

(assert (=> d!107339 (= c!90931 (and ((_ is Cons!15848) (t!22212 (toList!4469 lt!377827))) (= (_1!5052 (h!16984 (t!22212 (toList!4469 lt!377827)))) (_1!5052 lt!377756))))))

(declare-fun e!465189 () Option!423)

(assert (=> d!107339 (= (getValueByKey!417 (t!22212 (toList!4469 lt!377827)) (_1!5052 lt!377756)) e!465189)))

(declare-fun b!833876 () Bool)

(declare-fun e!465190 () Option!423)

(assert (=> b!833876 (= e!465190 (getValueByKey!417 (t!22212 (t!22212 (toList!4469 lt!377827))) (_1!5052 lt!377756)))))

(declare-fun b!833877 () Bool)

(assert (=> b!833877 (= e!465190 None!421)))

(declare-fun b!833875 () Bool)

(assert (=> b!833875 (= e!465189 e!465190)))

(declare-fun c!90932 () Bool)

(assert (=> b!833875 (= c!90932 (and ((_ is Cons!15848) (t!22212 (toList!4469 lt!377827))) (not (= (_1!5052 (h!16984 (t!22212 (toList!4469 lt!377827)))) (_1!5052 lt!377756)))))))

(declare-fun b!833874 () Bool)

(assert (=> b!833874 (= e!465189 (Some!422 (_2!5052 (h!16984 (t!22212 (toList!4469 lt!377827))))))))

(assert (= (and d!107339 c!90931) b!833874))

(assert (= (and d!107339 (not c!90931)) b!833875))

(assert (= (and b!833875 c!90932) b!833876))

(assert (= (and b!833875 (not c!90932)) b!833877))

(declare-fun m!778903 () Bool)

(assert (=> b!833876 m!778903))

(assert (=> b!833251 d!107339))

(declare-fun lt!378390 () Bool)

(declare-fun d!107341 () Bool)

(assert (=> d!107341 (= lt!378390 (select (content!388 (toList!4469 lt!378176)) (tuple2!10083 lt!377856 lt!377860)))))

(declare-fun e!465192 () Bool)

(assert (=> d!107341 (= lt!378390 e!465192)))

(declare-fun res!566920 () Bool)

(assert (=> d!107341 (=> (not res!566920) (not e!465192))))

(assert (=> d!107341 (= res!566920 ((_ is Cons!15848) (toList!4469 lt!378176)))))

(assert (=> d!107341 (= (contains!4190 (toList!4469 lt!378176) (tuple2!10083 lt!377856 lt!377860)) lt!378390)))

(declare-fun b!833878 () Bool)

(declare-fun e!465191 () Bool)

(assert (=> b!833878 (= e!465192 e!465191)))

(declare-fun res!566919 () Bool)

(assert (=> b!833878 (=> res!566919 e!465191)))

(assert (=> b!833878 (= res!566919 (= (h!16984 (toList!4469 lt!378176)) (tuple2!10083 lt!377856 lt!377860)))))

(declare-fun b!833879 () Bool)

(assert (=> b!833879 (= e!465191 (contains!4190 (t!22212 (toList!4469 lt!378176)) (tuple2!10083 lt!377856 lt!377860)))))

(assert (= (and d!107341 res!566920) b!833878))

(assert (= (and b!833878 (not res!566919)) b!833879))

(declare-fun m!778905 () Bool)

(assert (=> d!107341 m!778905))

(declare-fun m!778907 () Bool)

(assert (=> d!107341 m!778907))

(declare-fun m!778909 () Bool)

(assert (=> b!833879 m!778909))

(assert (=> b!833264 d!107341))

(declare-fun c!90933 () Bool)

(declare-fun d!107343 () Bool)

(assert (=> d!107343 (= c!90933 (and ((_ is Cons!15848) (toList!4469 lt!377996)) (= (_1!5052 (h!16984 (toList!4469 lt!377996))) (_1!5052 (tuple2!10083 lt!377950 minValue!754)))))))

(declare-fun e!465193 () Option!423)

(assert (=> d!107343 (= (getValueByKey!417 (toList!4469 lt!377996) (_1!5052 (tuple2!10083 lt!377950 minValue!754))) e!465193)))

(declare-fun b!833882 () Bool)

(declare-fun e!465194 () Option!423)

(assert (=> b!833882 (= e!465194 (getValueByKey!417 (t!22212 (toList!4469 lt!377996)) (_1!5052 (tuple2!10083 lt!377950 minValue!754))))))

(declare-fun b!833883 () Bool)

(assert (=> b!833883 (= e!465194 None!421)))

(declare-fun b!833881 () Bool)

(assert (=> b!833881 (= e!465193 e!465194)))

(declare-fun c!90934 () Bool)

(assert (=> b!833881 (= c!90934 (and ((_ is Cons!15848) (toList!4469 lt!377996)) (not (= (_1!5052 (h!16984 (toList!4469 lt!377996))) (_1!5052 (tuple2!10083 lt!377950 minValue!754))))))))

(declare-fun b!833880 () Bool)

(assert (=> b!833880 (= e!465193 (Some!422 (_2!5052 (h!16984 (toList!4469 lt!377996)))))))

(assert (= (and d!107343 c!90933) b!833880))

(assert (= (and d!107343 (not c!90933)) b!833881))

(assert (= (and b!833881 c!90934) b!833882))

(assert (= (and b!833881 (not c!90934)) b!833883))

(declare-fun m!778911 () Bool)

(assert (=> b!833882 m!778911))

(assert (=> b!832981 d!107343))

(declare-fun d!107345 () Bool)

(declare-fun e!465196 () Bool)

(assert (=> d!107345 e!465196))

(declare-fun res!566921 () Bool)

(assert (=> d!107345 (=> res!566921 e!465196)))

(declare-fun lt!378391 () Bool)

(assert (=> d!107345 (= res!566921 (not lt!378391))))

(declare-fun lt!378394 () Bool)

(assert (=> d!107345 (= lt!378391 lt!378394)))

(declare-fun lt!378392 () Unit!28510)

(declare-fun e!465195 () Unit!28510)

(assert (=> d!107345 (= lt!378392 e!465195)))

(declare-fun c!90935 () Bool)

(assert (=> d!107345 (= c!90935 lt!378394)))

(assert (=> d!107345 (= lt!378394 (containsKey!402 (toList!4469 lt!378008) (_1!5052 (tuple2!10083 lt!377957 zeroValueAfter!34))))))

(assert (=> d!107345 (= (contains!4189 lt!378008 (_1!5052 (tuple2!10083 lt!377957 zeroValueAfter!34))) lt!378391)))

(declare-fun b!833884 () Bool)

(declare-fun lt!378393 () Unit!28510)

(assert (=> b!833884 (= e!465195 lt!378393)))

(assert (=> b!833884 (= lt!378393 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!378008) (_1!5052 (tuple2!10083 lt!377957 zeroValueAfter!34))))))

(assert (=> b!833884 (isDefined!312 (getValueByKey!417 (toList!4469 lt!378008) (_1!5052 (tuple2!10083 lt!377957 zeroValueAfter!34))))))

(declare-fun b!833885 () Bool)

(declare-fun Unit!28555 () Unit!28510)

(assert (=> b!833885 (= e!465195 Unit!28555)))

(declare-fun b!833886 () Bool)

(assert (=> b!833886 (= e!465196 (isDefined!312 (getValueByKey!417 (toList!4469 lt!378008) (_1!5052 (tuple2!10083 lt!377957 zeroValueAfter!34)))))))

(assert (= (and d!107345 c!90935) b!833884))

(assert (= (and d!107345 (not c!90935)) b!833885))

(assert (= (and d!107345 (not res!566921)) b!833886))

(declare-fun m!778913 () Bool)

(assert (=> d!107345 m!778913))

(declare-fun m!778915 () Bool)

(assert (=> b!833884 m!778915))

(assert (=> b!833884 m!777385))

(assert (=> b!833884 m!777385))

(declare-fun m!778917 () Bool)

(assert (=> b!833884 m!778917))

(assert (=> b!833886 m!777385))

(assert (=> b!833886 m!777385))

(assert (=> b!833886 m!778917))

(assert (=> d!106675 d!107345))

(declare-fun c!90936 () Bool)

(declare-fun d!107347 () Bool)

(assert (=> d!107347 (= c!90936 (and ((_ is Cons!15848) lt!378007) (= (_1!5052 (h!16984 lt!378007)) (_1!5052 (tuple2!10083 lt!377957 zeroValueAfter!34)))))))

(declare-fun e!465197 () Option!423)

(assert (=> d!107347 (= (getValueByKey!417 lt!378007 (_1!5052 (tuple2!10083 lt!377957 zeroValueAfter!34))) e!465197)))

(declare-fun b!833889 () Bool)

(declare-fun e!465198 () Option!423)

(assert (=> b!833889 (= e!465198 (getValueByKey!417 (t!22212 lt!378007) (_1!5052 (tuple2!10083 lt!377957 zeroValueAfter!34))))))

(declare-fun b!833890 () Bool)

(assert (=> b!833890 (= e!465198 None!421)))

(declare-fun b!833888 () Bool)

(assert (=> b!833888 (= e!465197 e!465198)))

(declare-fun c!90937 () Bool)

(assert (=> b!833888 (= c!90937 (and ((_ is Cons!15848) lt!378007) (not (= (_1!5052 (h!16984 lt!378007)) (_1!5052 (tuple2!10083 lt!377957 zeroValueAfter!34))))))))

(declare-fun b!833887 () Bool)

(assert (=> b!833887 (= e!465197 (Some!422 (_2!5052 (h!16984 lt!378007))))))

(assert (= (and d!107347 c!90936) b!833887))

(assert (= (and d!107347 (not c!90936)) b!833888))

(assert (= (and b!833888 c!90937) b!833889))

(assert (= (and b!833888 (not c!90937)) b!833890))

(declare-fun m!778919 () Bool)

(assert (=> b!833889 m!778919))

(assert (=> d!106675 d!107347))

(declare-fun d!107349 () Bool)

(assert (=> d!107349 (= (getValueByKey!417 lt!378007 (_1!5052 (tuple2!10083 lt!377957 zeroValueAfter!34))) (Some!422 (_2!5052 (tuple2!10083 lt!377957 zeroValueAfter!34))))))

(declare-fun lt!378395 () Unit!28510)

(assert (=> d!107349 (= lt!378395 (choose!1429 lt!378007 (_1!5052 (tuple2!10083 lt!377957 zeroValueAfter!34)) (_2!5052 (tuple2!10083 lt!377957 zeroValueAfter!34))))))

(declare-fun e!465199 () Bool)

(assert (=> d!107349 e!465199))

(declare-fun res!566922 () Bool)

(assert (=> d!107349 (=> (not res!566922) (not e!465199))))

(assert (=> d!107349 (= res!566922 (isStrictlySorted!430 lt!378007))))

(assert (=> d!107349 (= (lemmaContainsTupThenGetReturnValue!231 lt!378007 (_1!5052 (tuple2!10083 lt!377957 zeroValueAfter!34)) (_2!5052 (tuple2!10083 lt!377957 zeroValueAfter!34))) lt!378395)))

(declare-fun b!833891 () Bool)

(declare-fun res!566923 () Bool)

(assert (=> b!833891 (=> (not res!566923) (not e!465199))))

(assert (=> b!833891 (= res!566923 (containsKey!402 lt!378007 (_1!5052 (tuple2!10083 lt!377957 zeroValueAfter!34))))))

(declare-fun b!833892 () Bool)

(assert (=> b!833892 (= e!465199 (contains!4190 lt!378007 (tuple2!10083 (_1!5052 (tuple2!10083 lt!377957 zeroValueAfter!34)) (_2!5052 (tuple2!10083 lt!377957 zeroValueAfter!34)))))))

(assert (= (and d!107349 res!566922) b!833891))

(assert (= (and b!833891 res!566923) b!833892))

(assert (=> d!107349 m!777379))

(declare-fun m!778921 () Bool)

(assert (=> d!107349 m!778921))

(declare-fun m!778923 () Bool)

(assert (=> d!107349 m!778923))

(declare-fun m!778925 () Bool)

(assert (=> b!833891 m!778925))

(declare-fun m!778927 () Bool)

(assert (=> b!833892 m!778927))

(assert (=> d!106675 d!107349))

(declare-fun e!465201 () List!15852)

(declare-fun bm!36501 () Bool)

(declare-fun call!36505 () List!15852)

(declare-fun c!90938 () Bool)

(assert (=> bm!36501 (= call!36505 ($colon$colon!534 e!465201 (ite c!90938 (h!16984 (toList!4469 lt!377958)) (tuple2!10083 (_1!5052 (tuple2!10083 lt!377957 zeroValueAfter!34)) (_2!5052 (tuple2!10083 lt!377957 zeroValueAfter!34))))))))

(declare-fun c!90941 () Bool)

(assert (=> bm!36501 (= c!90941 c!90938)))

(declare-fun bm!36502 () Bool)

(declare-fun call!36506 () List!15852)

(assert (=> bm!36502 (= call!36506 call!36505)))

(declare-fun bm!36503 () Bool)

(declare-fun call!36504 () List!15852)

(assert (=> bm!36503 (= call!36504 call!36506)))

(declare-fun c!90939 () Bool)

(declare-fun b!833893 () Bool)

(assert (=> b!833893 (= c!90939 (and ((_ is Cons!15848) (toList!4469 lt!377958)) (bvsgt (_1!5052 (h!16984 (toList!4469 lt!377958))) (_1!5052 (tuple2!10083 lt!377957 zeroValueAfter!34)))))))

(declare-fun e!465200 () List!15852)

(declare-fun e!465203 () List!15852)

(assert (=> b!833893 (= e!465200 e!465203)))

(declare-fun b!833894 () Bool)

(assert (=> b!833894 (= e!465203 call!36504)))

(declare-fun b!833895 () Bool)

(assert (=> b!833895 (= e!465201 (insertStrictlySorted!270 (t!22212 (toList!4469 lt!377958)) (_1!5052 (tuple2!10083 lt!377957 zeroValueAfter!34)) (_2!5052 (tuple2!10083 lt!377957 zeroValueAfter!34))))))

(declare-fun b!833896 () Bool)

(declare-fun e!465202 () List!15852)

(assert (=> b!833896 (= e!465202 call!36505)))

(declare-fun lt!378396 () List!15852)

(declare-fun e!465204 () Bool)

(declare-fun b!833897 () Bool)

(assert (=> b!833897 (= e!465204 (contains!4190 lt!378396 (tuple2!10083 (_1!5052 (tuple2!10083 lt!377957 zeroValueAfter!34)) (_2!5052 (tuple2!10083 lt!377957 zeroValueAfter!34)))))))

(declare-fun b!833898 () Bool)

(declare-fun c!90940 () Bool)

(assert (=> b!833898 (= e!465201 (ite c!90940 (t!22212 (toList!4469 lt!377958)) (ite c!90939 (Cons!15848 (h!16984 (toList!4469 lt!377958)) (t!22212 (toList!4469 lt!377958))) Nil!15849)))))

(declare-fun b!833899 () Bool)

(assert (=> b!833899 (= e!465202 e!465200)))

(assert (=> b!833899 (= c!90940 (and ((_ is Cons!15848) (toList!4469 lt!377958)) (= (_1!5052 (h!16984 (toList!4469 lt!377958))) (_1!5052 (tuple2!10083 lt!377957 zeroValueAfter!34)))))))

(declare-fun b!833900 () Bool)

(assert (=> b!833900 (= e!465200 call!36506)))

(declare-fun b!833901 () Bool)

(declare-fun res!566925 () Bool)

(assert (=> b!833901 (=> (not res!566925) (not e!465204))))

(assert (=> b!833901 (= res!566925 (containsKey!402 lt!378396 (_1!5052 (tuple2!10083 lt!377957 zeroValueAfter!34))))))

(declare-fun d!107351 () Bool)

(assert (=> d!107351 e!465204))

(declare-fun res!566924 () Bool)

(assert (=> d!107351 (=> (not res!566924) (not e!465204))))

(assert (=> d!107351 (= res!566924 (isStrictlySorted!430 lt!378396))))

(assert (=> d!107351 (= lt!378396 e!465202)))

(assert (=> d!107351 (= c!90938 (and ((_ is Cons!15848) (toList!4469 lt!377958)) (bvslt (_1!5052 (h!16984 (toList!4469 lt!377958))) (_1!5052 (tuple2!10083 lt!377957 zeroValueAfter!34)))))))

(assert (=> d!107351 (isStrictlySorted!430 (toList!4469 lt!377958))))

(assert (=> d!107351 (= (insertStrictlySorted!270 (toList!4469 lt!377958) (_1!5052 (tuple2!10083 lt!377957 zeroValueAfter!34)) (_2!5052 (tuple2!10083 lt!377957 zeroValueAfter!34))) lt!378396)))

(declare-fun b!833902 () Bool)

(assert (=> b!833902 (= e!465203 call!36504)))

(assert (= (and d!107351 c!90938) b!833896))

(assert (= (and d!107351 (not c!90938)) b!833899))

(assert (= (and b!833899 c!90940) b!833900))

(assert (= (and b!833899 (not c!90940)) b!833893))

(assert (= (and b!833893 c!90939) b!833894))

(assert (= (and b!833893 (not c!90939)) b!833902))

(assert (= (or b!833894 b!833902) bm!36503))

(assert (= (or b!833900 bm!36503) bm!36502))

(assert (= (or b!833896 bm!36502) bm!36501))

(assert (= (and bm!36501 c!90941) b!833895))

(assert (= (and bm!36501 (not c!90941)) b!833898))

(assert (= (and d!107351 res!566924) b!833901))

(assert (= (and b!833901 res!566925) b!833897))

(declare-fun m!778929 () Bool)

(assert (=> bm!36501 m!778929))

(declare-fun m!778931 () Bool)

(assert (=> b!833897 m!778931))

(declare-fun m!778933 () Bool)

(assert (=> b!833895 m!778933))

(declare-fun m!778935 () Bool)

(assert (=> b!833901 m!778935))

(declare-fun m!778937 () Bool)

(assert (=> d!107351 m!778937))

(declare-fun m!778939 () Bool)

(assert (=> d!107351 m!778939))

(assert (=> d!106675 d!107351))

(declare-fun d!107353 () Bool)

(declare-fun e!465206 () Bool)

(assert (=> d!107353 e!465206))

(declare-fun res!566926 () Bool)

(assert (=> d!107353 (=> res!566926 e!465206)))

(declare-fun lt!378397 () Bool)

(assert (=> d!107353 (= res!566926 (not lt!378397))))

(declare-fun lt!378400 () Bool)

(assert (=> d!107353 (= lt!378397 lt!378400)))

(declare-fun lt!378398 () Unit!28510)

(declare-fun e!465205 () Unit!28510)

(assert (=> d!107353 (= lt!378398 e!465205)))

(declare-fun c!90942 () Bool)

(assert (=> d!107353 (= c!90942 lt!378400)))

(assert (=> d!107353 (= lt!378400 (containsKey!402 (toList!4469 lt!378091) (_1!5052 (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!107353 (= (contains!4189 lt!378091 (_1!5052 (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) lt!378397)))

(declare-fun b!833903 () Bool)

(declare-fun lt!378399 () Unit!28510)

(assert (=> b!833903 (= e!465205 lt!378399)))

(assert (=> b!833903 (= lt!378399 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!378091) (_1!5052 (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> b!833903 (isDefined!312 (getValueByKey!417 (toList!4469 lt!378091) (_1!5052 (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!833904 () Bool)

(declare-fun Unit!28556 () Unit!28510)

(assert (=> b!833904 (= e!465205 Unit!28556)))

(declare-fun b!833905 () Bool)

(assert (=> b!833905 (= e!465206 (isDefined!312 (getValueByKey!417 (toList!4469 lt!378091) (_1!5052 (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (= (and d!107353 c!90942) b!833903))

(assert (= (and d!107353 (not c!90942)) b!833904))

(assert (= (and d!107353 (not res!566926)) b!833905))

(declare-fun m!778941 () Bool)

(assert (=> d!107353 m!778941))

(declare-fun m!778943 () Bool)

(assert (=> b!833903 m!778943))

(assert (=> b!833903 m!777691))

(assert (=> b!833903 m!777691))

(declare-fun m!778945 () Bool)

(assert (=> b!833903 m!778945))

(assert (=> b!833905 m!777691))

(assert (=> b!833905 m!777691))

(assert (=> b!833905 m!778945))

(assert (=> d!106771 d!107353))

(declare-fun c!90943 () Bool)

(declare-fun d!107355 () Bool)

(assert (=> d!107355 (= c!90943 (and ((_ is Cons!15848) lt!378090) (= (_1!5052 (h!16984 lt!378090)) (_1!5052 (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun e!465207 () Option!423)

(assert (=> d!107355 (= (getValueByKey!417 lt!378090 (_1!5052 (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) e!465207)))

(declare-fun b!833908 () Bool)

(declare-fun e!465208 () Option!423)

(assert (=> b!833908 (= e!465208 (getValueByKey!417 (t!22212 lt!378090) (_1!5052 (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!833909 () Bool)

(assert (=> b!833909 (= e!465208 None!421)))

(declare-fun b!833907 () Bool)

(assert (=> b!833907 (= e!465207 e!465208)))

(declare-fun c!90944 () Bool)

(assert (=> b!833907 (= c!90944 (and ((_ is Cons!15848) lt!378090) (not (= (_1!5052 (h!16984 lt!378090)) (_1!5052 (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))))

(declare-fun b!833906 () Bool)

(assert (=> b!833906 (= e!465207 (Some!422 (_2!5052 (h!16984 lt!378090))))))

(assert (= (and d!107355 c!90943) b!833906))

(assert (= (and d!107355 (not c!90943)) b!833907))

(assert (= (and b!833907 c!90944) b!833908))

(assert (= (and b!833907 (not c!90944)) b!833909))

(declare-fun m!778947 () Bool)

(assert (=> b!833908 m!778947))

(assert (=> d!106771 d!107355))

(declare-fun d!107357 () Bool)

(assert (=> d!107357 (= (getValueByKey!417 lt!378090 (_1!5052 (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) (Some!422 (_2!5052 (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun lt!378401 () Unit!28510)

(assert (=> d!107357 (= lt!378401 (choose!1429 lt!378090 (_1!5052 (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5052 (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun e!465209 () Bool)

(assert (=> d!107357 e!465209))

(declare-fun res!566927 () Bool)

(assert (=> d!107357 (=> (not res!566927) (not e!465209))))

(assert (=> d!107357 (= res!566927 (isStrictlySorted!430 lt!378090))))

(assert (=> d!107357 (= (lemmaContainsTupThenGetReturnValue!231 lt!378090 (_1!5052 (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5052 (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) lt!378401)))

(declare-fun b!833910 () Bool)

(declare-fun res!566928 () Bool)

(assert (=> b!833910 (=> (not res!566928) (not e!465209))))

(assert (=> b!833910 (= res!566928 (containsKey!402 lt!378090 (_1!5052 (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!833911 () Bool)

(assert (=> b!833911 (= e!465209 (contains!4190 lt!378090 (tuple2!10083 (_1!5052 (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5052 (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (= (and d!107357 res!566927) b!833910))

(assert (= (and b!833910 res!566928) b!833911))

(assert (=> d!107357 m!777685))

(declare-fun m!778949 () Bool)

(assert (=> d!107357 m!778949))

(declare-fun m!778951 () Bool)

(assert (=> d!107357 m!778951))

(declare-fun m!778953 () Bool)

(assert (=> b!833910 m!778953))

(declare-fun m!778955 () Bool)

(assert (=> b!833911 m!778955))

(assert (=> d!106771 d!107357))

(declare-fun bm!36504 () Bool)

(declare-fun call!36508 () List!15852)

(declare-fun c!90945 () Bool)

(declare-fun e!465211 () List!15852)

(assert (=> bm!36504 (= call!36508 ($colon$colon!534 e!465211 (ite c!90945 (h!16984 (toList!4469 (ite c!90636 call!36430 (ite c!90639 call!36428 call!36433)))) (tuple2!10083 (_1!5052 (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5052 (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))))

(declare-fun c!90948 () Bool)

(assert (=> bm!36504 (= c!90948 c!90945)))

(declare-fun bm!36505 () Bool)

(declare-fun call!36509 () List!15852)

(assert (=> bm!36505 (= call!36509 call!36508)))

(declare-fun bm!36506 () Bool)

(declare-fun call!36507 () List!15852)

(assert (=> bm!36506 (= call!36507 call!36509)))

(declare-fun b!833912 () Bool)

(declare-fun c!90946 () Bool)

(assert (=> b!833912 (= c!90946 (and ((_ is Cons!15848) (toList!4469 (ite c!90636 call!36430 (ite c!90639 call!36428 call!36433)))) (bvsgt (_1!5052 (h!16984 (toList!4469 (ite c!90636 call!36430 (ite c!90639 call!36428 call!36433))))) (_1!5052 (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun e!465210 () List!15852)

(declare-fun e!465213 () List!15852)

(assert (=> b!833912 (= e!465210 e!465213)))

(declare-fun b!833913 () Bool)

(assert (=> b!833913 (= e!465213 call!36507)))

(declare-fun b!833914 () Bool)

(assert (=> b!833914 (= e!465211 (insertStrictlySorted!270 (t!22212 (toList!4469 (ite c!90636 call!36430 (ite c!90639 call!36428 call!36433)))) (_1!5052 (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5052 (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!833915 () Bool)

(declare-fun e!465212 () List!15852)

(assert (=> b!833915 (= e!465212 call!36508)))

(declare-fun b!833916 () Bool)

(declare-fun lt!378402 () List!15852)

(declare-fun e!465214 () Bool)

(assert (=> b!833916 (= e!465214 (contains!4190 lt!378402 (tuple2!10083 (_1!5052 (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5052 (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!833917 () Bool)

(declare-fun c!90947 () Bool)

(assert (=> b!833917 (= e!465211 (ite c!90947 (t!22212 (toList!4469 (ite c!90636 call!36430 (ite c!90639 call!36428 call!36433)))) (ite c!90946 (Cons!15848 (h!16984 (toList!4469 (ite c!90636 call!36430 (ite c!90639 call!36428 call!36433)))) (t!22212 (toList!4469 (ite c!90636 call!36430 (ite c!90639 call!36428 call!36433))))) Nil!15849)))))

(declare-fun b!833918 () Bool)

(assert (=> b!833918 (= e!465212 e!465210)))

(assert (=> b!833918 (= c!90947 (and ((_ is Cons!15848) (toList!4469 (ite c!90636 call!36430 (ite c!90639 call!36428 call!36433)))) (= (_1!5052 (h!16984 (toList!4469 (ite c!90636 call!36430 (ite c!90639 call!36428 call!36433))))) (_1!5052 (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!833919 () Bool)

(assert (=> b!833919 (= e!465210 call!36509)))

(declare-fun b!833920 () Bool)

(declare-fun res!566930 () Bool)

(assert (=> b!833920 (=> (not res!566930) (not e!465214))))

(assert (=> b!833920 (= res!566930 (containsKey!402 lt!378402 (_1!5052 (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun d!107359 () Bool)

(assert (=> d!107359 e!465214))

(declare-fun res!566929 () Bool)

(assert (=> d!107359 (=> (not res!566929) (not e!465214))))

(assert (=> d!107359 (= res!566929 (isStrictlySorted!430 lt!378402))))

(assert (=> d!107359 (= lt!378402 e!465212)))

(assert (=> d!107359 (= c!90945 (and ((_ is Cons!15848) (toList!4469 (ite c!90636 call!36430 (ite c!90639 call!36428 call!36433)))) (bvslt (_1!5052 (h!16984 (toList!4469 (ite c!90636 call!36430 (ite c!90639 call!36428 call!36433))))) (_1!5052 (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (=> d!107359 (isStrictlySorted!430 (toList!4469 (ite c!90636 call!36430 (ite c!90639 call!36428 call!36433))))))

(assert (=> d!107359 (= (insertStrictlySorted!270 (toList!4469 (ite c!90636 call!36430 (ite c!90639 call!36428 call!36433))) (_1!5052 (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5052 (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) lt!378402)))

(declare-fun b!833921 () Bool)

(assert (=> b!833921 (= e!465213 call!36507)))

(assert (= (and d!107359 c!90945) b!833915))

(assert (= (and d!107359 (not c!90945)) b!833918))

(assert (= (and b!833918 c!90947) b!833919))

(assert (= (and b!833918 (not c!90947)) b!833912))

(assert (= (and b!833912 c!90946) b!833913))

(assert (= (and b!833912 (not c!90946)) b!833921))

(assert (= (or b!833913 b!833921) bm!36506))

(assert (= (or b!833919 bm!36506) bm!36505))

(assert (= (or b!833915 bm!36505) bm!36504))

(assert (= (and bm!36504 c!90948) b!833914))

(assert (= (and bm!36504 (not c!90948)) b!833917))

(assert (= (and d!107359 res!566929) b!833920))

(assert (= (and b!833920 res!566930) b!833916))

(declare-fun m!778957 () Bool)

(assert (=> bm!36504 m!778957))

(declare-fun m!778959 () Bool)

(assert (=> b!833916 m!778959))

(declare-fun m!778961 () Bool)

(assert (=> b!833914 m!778961))

(declare-fun m!778963 () Bool)

(assert (=> b!833920 m!778963))

(declare-fun m!778965 () Bool)

(assert (=> d!107359 m!778965))

(declare-fun m!778967 () Bool)

(assert (=> d!107359 m!778967))

(assert (=> d!106771 d!107359))

(declare-fun d!107361 () Bool)

(declare-fun e!465216 () Bool)

(assert (=> d!107361 e!465216))

(declare-fun res!566931 () Bool)

(assert (=> d!107361 (=> res!566931 e!465216)))

(declare-fun lt!378403 () Bool)

(assert (=> d!107361 (= res!566931 (not lt!378403))))

(declare-fun lt!378406 () Bool)

(assert (=> d!107361 (= lt!378403 lt!378406)))

(declare-fun lt!378404 () Unit!28510)

(declare-fun e!465215 () Unit!28510)

(assert (=> d!107361 (= lt!378404 e!465215)))

(declare-fun c!90949 () Bool)

(assert (=> d!107361 (= c!90949 lt!378406)))

(assert (=> d!107361 (= lt!378406 (containsKey!402 (toList!4469 lt!378192) (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!107361 (= (contains!4189 lt!378192 (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!378403)))

(declare-fun b!833922 () Bool)

(declare-fun lt!378405 () Unit!28510)

(assert (=> b!833922 (= e!465215 lt!378405)))

(assert (=> b!833922 (= lt!378405 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!378192) (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!833922 (isDefined!312 (getValueByKey!417 (toList!4469 lt!378192) (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!833923 () Bool)

(declare-fun Unit!28557 () Unit!28510)

(assert (=> b!833923 (= e!465215 Unit!28557)))

(declare-fun b!833924 () Bool)

(assert (=> b!833924 (= e!465216 (isDefined!312 (getValueByKey!417 (toList!4469 lt!378192) (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!107361 c!90949) b!833922))

(assert (= (and d!107361 (not c!90949)) b!833923))

(assert (= (and d!107361 (not res!566931)) b!833924))

(declare-fun m!778969 () Bool)

(assert (=> d!107361 m!778969))

(declare-fun m!778971 () Bool)

(assert (=> b!833922 m!778971))

(assert (=> b!833922 m!778001))

(assert (=> b!833922 m!778001))

(declare-fun m!778973 () Bool)

(assert (=> b!833922 m!778973))

(assert (=> b!833924 m!778001))

(assert (=> b!833924 m!778001))

(assert (=> b!833924 m!778973))

(assert (=> d!106873 d!107361))

(declare-fun d!107363 () Bool)

(declare-fun c!90950 () Bool)

(assert (=> d!107363 (= c!90950 (and ((_ is Cons!15848) lt!378191) (= (_1!5052 (h!16984 lt!378191)) (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!465217 () Option!423)

(assert (=> d!107363 (= (getValueByKey!417 lt!378191 (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!465217)))

(declare-fun e!465218 () Option!423)

(declare-fun b!833927 () Bool)

(assert (=> b!833927 (= e!465218 (getValueByKey!417 (t!22212 lt!378191) (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!833928 () Bool)

(assert (=> b!833928 (= e!465218 None!421)))

(declare-fun b!833926 () Bool)

(assert (=> b!833926 (= e!465217 e!465218)))

(declare-fun c!90951 () Bool)

(assert (=> b!833926 (= c!90951 (and ((_ is Cons!15848) lt!378191) (not (= (_1!5052 (h!16984 lt!378191)) (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!833925 () Bool)

(assert (=> b!833925 (= e!465217 (Some!422 (_2!5052 (h!16984 lt!378191))))))

(assert (= (and d!107363 c!90950) b!833925))

(assert (= (and d!107363 (not c!90950)) b!833926))

(assert (= (and b!833926 c!90951) b!833927))

(assert (= (and b!833926 (not c!90951)) b!833928))

(declare-fun m!778975 () Bool)

(assert (=> b!833927 m!778975))

(assert (=> d!106873 d!107363))

(declare-fun d!107365 () Bool)

(assert (=> d!107365 (= (getValueByKey!417 lt!378191 (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!422 (_2!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!378407 () Unit!28510)

(assert (=> d!107365 (= lt!378407 (choose!1429 lt!378191 (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!465219 () Bool)

(assert (=> d!107365 e!465219))

(declare-fun res!566932 () Bool)

(assert (=> d!107365 (=> (not res!566932) (not e!465219))))

(assert (=> d!107365 (= res!566932 (isStrictlySorted!430 lt!378191))))

(assert (=> d!107365 (= (lemmaContainsTupThenGetReturnValue!231 lt!378191 (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!378407)))

(declare-fun b!833929 () Bool)

(declare-fun res!566933 () Bool)

(assert (=> b!833929 (=> (not res!566933) (not e!465219))))

(assert (=> b!833929 (= res!566933 (containsKey!402 lt!378191 (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!833930 () Bool)

(assert (=> b!833930 (= e!465219 (contains!4190 lt!378191 (tuple2!10083 (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!107365 res!566932) b!833929))

(assert (= (and b!833929 res!566933) b!833930))

(assert (=> d!107365 m!777995))

(declare-fun m!778977 () Bool)

(assert (=> d!107365 m!778977))

(declare-fun m!778979 () Bool)

(assert (=> d!107365 m!778979))

(declare-fun m!778981 () Bool)

(assert (=> b!833929 m!778981))

(declare-fun m!778983 () Bool)

(assert (=> b!833930 m!778983))

(assert (=> d!106873 d!107365))

(declare-fun call!36511 () List!15852)

(declare-fun bm!36507 () Bool)

(declare-fun e!465221 () List!15852)

(declare-fun c!90952 () Bool)

(assert (=> bm!36507 (= call!36511 ($colon$colon!534 e!465221 (ite c!90952 (h!16984 (toList!4469 call!36410)) (tuple2!10083 (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!90955 () Bool)

(assert (=> bm!36507 (= c!90955 c!90952)))

(declare-fun bm!36508 () Bool)

(declare-fun call!36512 () List!15852)

(assert (=> bm!36508 (= call!36512 call!36511)))

(declare-fun bm!36509 () Bool)

(declare-fun call!36510 () List!15852)

(assert (=> bm!36509 (= call!36510 call!36512)))

(declare-fun c!90953 () Bool)

(declare-fun b!833931 () Bool)

(assert (=> b!833931 (= c!90953 (and ((_ is Cons!15848) (toList!4469 call!36410)) (bvsgt (_1!5052 (h!16984 (toList!4469 call!36410))) (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!465220 () List!15852)

(declare-fun e!465223 () List!15852)

(assert (=> b!833931 (= e!465220 e!465223)))

(declare-fun b!833932 () Bool)

(assert (=> b!833932 (= e!465223 call!36510)))

(declare-fun b!833933 () Bool)

(assert (=> b!833933 (= e!465221 (insertStrictlySorted!270 (t!22212 (toList!4469 call!36410)) (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!833934 () Bool)

(declare-fun e!465222 () List!15852)

(assert (=> b!833934 (= e!465222 call!36511)))

(declare-fun e!465224 () Bool)

(declare-fun lt!378408 () List!15852)

(declare-fun b!833935 () Bool)

(assert (=> b!833935 (= e!465224 (contains!4190 lt!378408 (tuple2!10083 (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!833936 () Bool)

(declare-fun c!90954 () Bool)

(assert (=> b!833936 (= e!465221 (ite c!90954 (t!22212 (toList!4469 call!36410)) (ite c!90953 (Cons!15848 (h!16984 (toList!4469 call!36410)) (t!22212 (toList!4469 call!36410))) Nil!15849)))))

(declare-fun b!833937 () Bool)

(assert (=> b!833937 (= e!465222 e!465220)))

(assert (=> b!833937 (= c!90954 (and ((_ is Cons!15848) (toList!4469 call!36410)) (= (_1!5052 (h!16984 (toList!4469 call!36410))) (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!833938 () Bool)

(assert (=> b!833938 (= e!465220 call!36512)))

(declare-fun b!833939 () Bool)

(declare-fun res!566935 () Bool)

(assert (=> b!833939 (=> (not res!566935) (not e!465224))))

(assert (=> b!833939 (= res!566935 (containsKey!402 lt!378408 (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun d!107367 () Bool)

(assert (=> d!107367 e!465224))

(declare-fun res!566934 () Bool)

(assert (=> d!107367 (=> (not res!566934) (not e!465224))))

(assert (=> d!107367 (= res!566934 (isStrictlySorted!430 lt!378408))))

(assert (=> d!107367 (= lt!378408 e!465222)))

(assert (=> d!107367 (= c!90952 (and ((_ is Cons!15848) (toList!4469 call!36410)) (bvslt (_1!5052 (h!16984 (toList!4469 call!36410))) (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!107367 (isStrictlySorted!430 (toList!4469 call!36410))))

(assert (=> d!107367 (= (insertStrictlySorted!270 (toList!4469 call!36410) (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!378408)))

(declare-fun b!833940 () Bool)

(assert (=> b!833940 (= e!465223 call!36510)))

(assert (= (and d!107367 c!90952) b!833934))

(assert (= (and d!107367 (not c!90952)) b!833937))

(assert (= (and b!833937 c!90954) b!833938))

(assert (= (and b!833937 (not c!90954)) b!833931))

(assert (= (and b!833931 c!90953) b!833932))

(assert (= (and b!833931 (not c!90953)) b!833940))

(assert (= (or b!833932 b!833940) bm!36509))

(assert (= (or b!833938 bm!36509) bm!36508))

(assert (= (or b!833934 bm!36508) bm!36507))

(assert (= (and bm!36507 c!90955) b!833933))

(assert (= (and bm!36507 (not c!90955)) b!833936))

(assert (= (and d!107367 res!566934) b!833939))

(assert (= (and b!833939 res!566935) b!833935))

(declare-fun m!778985 () Bool)

(assert (=> bm!36507 m!778985))

(declare-fun m!778987 () Bool)

(assert (=> b!833935 m!778987))

(declare-fun m!778989 () Bool)

(assert (=> b!833933 m!778989))

(declare-fun m!778991 () Bool)

(assert (=> b!833939 m!778991))

(declare-fun m!778993 () Bool)

(assert (=> d!107367 m!778993))

(declare-fun m!778995 () Bool)

(assert (=> d!107367 m!778995))

(assert (=> d!106873 d!107367))

(declare-fun d!107369 () Bool)

(declare-fun lt!378409 () Bool)

(assert (=> d!107369 (= lt!378409 (select (content!388 (toList!4469 lt!378143)) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun e!465226 () Bool)

(assert (=> d!107369 (= lt!378409 e!465226)))

(declare-fun res!566937 () Bool)

(assert (=> d!107369 (=> (not res!566937) (not e!465226))))

(assert (=> d!107369 (= res!566937 ((_ is Cons!15848) (toList!4469 lt!378143)))))

(assert (=> d!107369 (= (contains!4190 (toList!4469 lt!378143) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) lt!378409)))

(declare-fun b!833941 () Bool)

(declare-fun e!465225 () Bool)

(assert (=> b!833941 (= e!465226 e!465225)))

(declare-fun res!566936 () Bool)

(assert (=> b!833941 (=> res!566936 e!465225)))

(assert (=> b!833941 (= res!566936 (= (h!16984 (toList!4469 lt!378143)) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!833942 () Bool)

(assert (=> b!833942 (= e!465225 (contains!4190 (t!22212 (toList!4469 lt!378143)) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!107369 res!566937) b!833941))

(assert (= (and b!833941 (not res!566936)) b!833942))

(declare-fun m!778997 () Bool)

(assert (=> d!107369 m!778997))

(declare-fun m!778999 () Bool)

(assert (=> d!107369 m!778999))

(declare-fun m!779001 () Bool)

(assert (=> b!833942 m!779001))

(assert (=> b!833206 d!107369))

(declare-fun d!107371 () Bool)

(declare-fun res!566938 () Bool)

(declare-fun e!465227 () Bool)

(assert (=> d!107371 (=> res!566938 e!465227)))

(assert (=> d!107371 (= res!566938 (and ((_ is Cons!15848) (toList!4469 lt!377925)) (= (_1!5052 (h!16984 (toList!4469 lt!377925))) (select (arr!22331 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!107371 (= (containsKey!402 (toList!4469 lt!377925) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)) e!465227)))

(declare-fun b!833943 () Bool)

(declare-fun e!465228 () Bool)

(assert (=> b!833943 (= e!465227 e!465228)))

(declare-fun res!566939 () Bool)

(assert (=> b!833943 (=> (not res!566939) (not e!465228))))

(assert (=> b!833943 (= res!566939 (and (or (not ((_ is Cons!15848) (toList!4469 lt!377925))) (bvsle (_1!5052 (h!16984 (toList!4469 lt!377925))) (select (arr!22331 _keys!976) #b00000000000000000000000000000000))) ((_ is Cons!15848) (toList!4469 lt!377925)) (bvslt (_1!5052 (h!16984 (toList!4469 lt!377925))) (select (arr!22331 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun b!833944 () Bool)

(assert (=> b!833944 (= e!465228 (containsKey!402 (t!22212 (toList!4469 lt!377925)) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!107371 (not res!566938)) b!833943))

(assert (= (and b!833943 res!566939) b!833944))

(assert (=> b!833944 m!777093))

(declare-fun m!779003 () Bool)

(assert (=> b!833944 m!779003))

(assert (=> d!106695 d!107371))

(declare-fun call!36514 () List!15852)

(declare-fun c!90956 () Bool)

(declare-fun e!465230 () List!15852)

(declare-fun bm!36510 () Bool)

(assert (=> bm!36510 (= call!36514 ($colon$colon!534 e!465230 (ite c!90956 (h!16984 (t!22212 (toList!4469 lt!377760))) (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756)))))))

(declare-fun c!90959 () Bool)

(assert (=> bm!36510 (= c!90959 c!90956)))

(declare-fun bm!36511 () Bool)

(declare-fun call!36515 () List!15852)

(assert (=> bm!36511 (= call!36515 call!36514)))

(declare-fun bm!36512 () Bool)

(declare-fun call!36513 () List!15852)

(assert (=> bm!36512 (= call!36513 call!36515)))

(declare-fun b!833945 () Bool)

(declare-fun c!90957 () Bool)

(assert (=> b!833945 (= c!90957 (and ((_ is Cons!15848) (t!22212 (toList!4469 lt!377760))) (bvsgt (_1!5052 (h!16984 (t!22212 (toList!4469 lt!377760)))) (_1!5052 lt!377756))))))

(declare-fun e!465229 () List!15852)

(declare-fun e!465232 () List!15852)

(assert (=> b!833945 (= e!465229 e!465232)))

(declare-fun b!833946 () Bool)

(assert (=> b!833946 (= e!465232 call!36513)))

(declare-fun b!833947 () Bool)

(assert (=> b!833947 (= e!465230 (insertStrictlySorted!270 (t!22212 (t!22212 (toList!4469 lt!377760))) (_1!5052 lt!377756) (_2!5052 lt!377756)))))

(declare-fun b!833948 () Bool)

(declare-fun e!465231 () List!15852)

(assert (=> b!833948 (= e!465231 call!36514)))

(declare-fun b!833949 () Bool)

(declare-fun e!465233 () Bool)

(declare-fun lt!378410 () List!15852)

(assert (=> b!833949 (= e!465233 (contains!4190 lt!378410 (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))))))

(declare-fun c!90958 () Bool)

(declare-fun b!833950 () Bool)

(assert (=> b!833950 (= e!465230 (ite c!90958 (t!22212 (t!22212 (toList!4469 lt!377760))) (ite c!90957 (Cons!15848 (h!16984 (t!22212 (toList!4469 lt!377760))) (t!22212 (t!22212 (toList!4469 lt!377760)))) Nil!15849)))))

(declare-fun b!833951 () Bool)

(assert (=> b!833951 (= e!465231 e!465229)))

(assert (=> b!833951 (= c!90958 (and ((_ is Cons!15848) (t!22212 (toList!4469 lt!377760))) (= (_1!5052 (h!16984 (t!22212 (toList!4469 lt!377760)))) (_1!5052 lt!377756))))))

(declare-fun b!833952 () Bool)

(assert (=> b!833952 (= e!465229 call!36515)))

(declare-fun b!833953 () Bool)

(declare-fun res!566941 () Bool)

(assert (=> b!833953 (=> (not res!566941) (not e!465233))))

(assert (=> b!833953 (= res!566941 (containsKey!402 lt!378410 (_1!5052 lt!377756)))))

(declare-fun d!107373 () Bool)

(assert (=> d!107373 e!465233))

(declare-fun res!566940 () Bool)

(assert (=> d!107373 (=> (not res!566940) (not e!465233))))

(assert (=> d!107373 (= res!566940 (isStrictlySorted!430 lt!378410))))

(assert (=> d!107373 (= lt!378410 e!465231)))

(assert (=> d!107373 (= c!90956 (and ((_ is Cons!15848) (t!22212 (toList!4469 lt!377760))) (bvslt (_1!5052 (h!16984 (t!22212 (toList!4469 lt!377760)))) (_1!5052 lt!377756))))))

(assert (=> d!107373 (isStrictlySorted!430 (t!22212 (toList!4469 lt!377760)))))

(assert (=> d!107373 (= (insertStrictlySorted!270 (t!22212 (toList!4469 lt!377760)) (_1!5052 lt!377756) (_2!5052 lt!377756)) lt!378410)))

(declare-fun b!833954 () Bool)

(assert (=> b!833954 (= e!465232 call!36513)))

(assert (= (and d!107373 c!90956) b!833948))

(assert (= (and d!107373 (not c!90956)) b!833951))

(assert (= (and b!833951 c!90958) b!833952))

(assert (= (and b!833951 (not c!90958)) b!833945))

(assert (= (and b!833945 c!90957) b!833946))

(assert (= (and b!833945 (not c!90957)) b!833954))

(assert (= (or b!833946 b!833954) bm!36512))

(assert (= (or b!833952 bm!36512) bm!36511))

(assert (= (or b!833948 bm!36511) bm!36510))

(assert (= (and bm!36510 c!90959) b!833947))

(assert (= (and bm!36510 (not c!90959)) b!833950))

(assert (= (and d!107373 res!566940) b!833953))

(assert (= (and b!833953 res!566941) b!833949))

(declare-fun m!779005 () Bool)

(assert (=> bm!36510 m!779005))

(declare-fun m!779007 () Bool)

(assert (=> b!833949 m!779007))

(declare-fun m!779009 () Bool)

(assert (=> b!833947 m!779009))

(declare-fun m!779011 () Bool)

(assert (=> b!833953 m!779011))

(declare-fun m!779013 () Bool)

(assert (=> d!107373 m!779013))

(assert (=> d!107373 m!778285))

(assert (=> b!833175 d!107373))

(declare-fun d!107375 () Bool)

(declare-fun c!90960 () Bool)

(assert (=> d!107375 (= c!90960 (and ((_ is Cons!15848) (t!22212 lt!377826)) (= (_1!5052 (h!16984 (t!22212 lt!377826))) (_1!5052 lt!377756))))))

(declare-fun e!465234 () Option!423)

(assert (=> d!107375 (= (getValueByKey!417 (t!22212 lt!377826) (_1!5052 lt!377756)) e!465234)))

(declare-fun b!833957 () Bool)

(declare-fun e!465235 () Option!423)

(assert (=> b!833957 (= e!465235 (getValueByKey!417 (t!22212 (t!22212 lt!377826)) (_1!5052 lt!377756)))))

(declare-fun b!833958 () Bool)

(assert (=> b!833958 (= e!465235 None!421)))

(declare-fun b!833956 () Bool)

(assert (=> b!833956 (= e!465234 e!465235)))

(declare-fun c!90961 () Bool)

(assert (=> b!833956 (= c!90961 (and ((_ is Cons!15848) (t!22212 lt!377826)) (not (= (_1!5052 (h!16984 (t!22212 lt!377826))) (_1!5052 lt!377756)))))))

(declare-fun b!833955 () Bool)

(assert (=> b!833955 (= e!465234 (Some!422 (_2!5052 (h!16984 (t!22212 lt!377826)))))))

(assert (= (and d!107375 c!90960) b!833955))

(assert (= (and d!107375 (not c!90960)) b!833956))

(assert (= (and b!833956 c!90961) b!833957))

(assert (= (and b!833956 (not c!90961)) b!833958))

(declare-fun m!779015 () Bool)

(assert (=> b!833957 m!779015))

(assert (=> b!833169 d!107375))

(declare-fun d!107377 () Bool)

(declare-fun res!566942 () Bool)

(declare-fun e!465236 () Bool)

(assert (=> d!107377 (=> res!566942 e!465236)))

(assert (=> d!107377 (= res!566942 (or ((_ is Nil!15849) lt!378213) ((_ is Nil!15849) (t!22212 lt!378213))))))

(assert (=> d!107377 (= (isStrictlySorted!430 lt!378213) e!465236)))

(declare-fun b!833959 () Bool)

(declare-fun e!465237 () Bool)

(assert (=> b!833959 (= e!465236 e!465237)))

(declare-fun res!566943 () Bool)

(assert (=> b!833959 (=> (not res!566943) (not e!465237))))

(assert (=> b!833959 (= res!566943 (bvslt (_1!5052 (h!16984 lt!378213)) (_1!5052 (h!16984 (t!22212 lt!378213)))))))

(declare-fun b!833960 () Bool)

(assert (=> b!833960 (= e!465237 (isStrictlySorted!430 (t!22212 lt!378213)))))

(assert (= (and d!107377 (not res!566942)) b!833959))

(assert (= (and b!833959 res!566943) b!833960))

(declare-fun m!779017 () Bool)

(assert (=> b!833960 m!779017))

(assert (=> d!106895 d!107377))

(declare-fun d!107379 () Bool)

(declare-fun res!566944 () Bool)

(declare-fun e!465238 () Bool)

(assert (=> d!107379 (=> res!566944 e!465238)))

(assert (=> d!107379 (= res!566944 (or ((_ is Nil!15849) (toList!4469 (+!1991 lt!377760 lt!377761))) ((_ is Nil!15849) (t!22212 (toList!4469 (+!1991 lt!377760 lt!377761))))))))

(assert (=> d!107379 (= (isStrictlySorted!430 (toList!4469 (+!1991 lt!377760 lt!377761))) e!465238)))

(declare-fun b!833961 () Bool)

(declare-fun e!465239 () Bool)

(assert (=> b!833961 (= e!465238 e!465239)))

(declare-fun res!566945 () Bool)

(assert (=> b!833961 (=> (not res!566945) (not e!465239))))

(assert (=> b!833961 (= res!566945 (bvslt (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377760 lt!377761)))) (_1!5052 (h!16984 (t!22212 (toList!4469 (+!1991 lt!377760 lt!377761)))))))))

(declare-fun b!833962 () Bool)

(assert (=> b!833962 (= e!465239 (isStrictlySorted!430 (t!22212 (toList!4469 (+!1991 lt!377760 lt!377761)))))))

(assert (= (and d!107379 (not res!566944)) b!833961))

(assert (= (and b!833961 res!566945) b!833962))

(assert (=> b!833962 m!778303))

(assert (=> d!106895 d!107379))

(declare-fun d!107381 () Bool)

(declare-fun res!566946 () Bool)

(declare-fun e!465240 () Bool)

(assert (=> d!107381 (=> res!566946 e!465240)))

(assert (=> d!107381 (= res!566946 (and ((_ is Cons!15848) lt!378079) (= (_1!5052 (h!16984 lt!378079)) (_1!5052 lt!377761))))))

(assert (=> d!107381 (= (containsKey!402 lt!378079 (_1!5052 lt!377761)) e!465240)))

(declare-fun b!833963 () Bool)

(declare-fun e!465241 () Bool)

(assert (=> b!833963 (= e!465240 e!465241)))

(declare-fun res!566947 () Bool)

(assert (=> b!833963 (=> (not res!566947) (not e!465241))))

(assert (=> b!833963 (= res!566947 (and (or (not ((_ is Cons!15848) lt!378079)) (bvsle (_1!5052 (h!16984 lt!378079)) (_1!5052 lt!377761))) ((_ is Cons!15848) lt!378079) (bvslt (_1!5052 (h!16984 lt!378079)) (_1!5052 lt!377761))))))

(declare-fun b!833964 () Bool)

(assert (=> b!833964 (= e!465241 (containsKey!402 (t!22212 lt!378079) (_1!5052 lt!377761)))))

(assert (= (and d!107381 (not res!566946)) b!833963))

(assert (= (and b!833963 res!566947) b!833964))

(declare-fun m!779019 () Bool)

(assert (=> b!833964 m!779019))

(assert (=> b!833080 d!107381))

(declare-fun d!107383 () Bool)

(declare-fun c!90962 () Bool)

(assert (=> d!107383 (= c!90962 ((_ is Nil!15849) (toList!4469 lt!377871)))))

(declare-fun e!465242 () (InoxSet tuple2!10082))

(assert (=> d!107383 (= (content!388 (toList!4469 lt!377871)) e!465242)))

(declare-fun b!833965 () Bool)

(assert (=> b!833965 (= e!465242 ((as const (Array tuple2!10082 Bool)) false))))

(declare-fun b!833966 () Bool)

(assert (=> b!833966 (= e!465242 ((_ map or) (store ((as const (Array tuple2!10082 Bool)) false) (h!16984 (toList!4469 lt!377871)) true) (content!388 (t!22212 (toList!4469 lt!377871)))))))

(assert (= (and d!107383 c!90962) b!833965))

(assert (= (and d!107383 (not c!90962)) b!833966))

(declare-fun m!779021 () Bool)

(assert (=> b!833966 m!779021))

(assert (=> b!833966 m!778505))

(assert (=> d!106879 d!107383))

(declare-fun d!107385 () Bool)

(declare-fun c!90963 () Bool)

(assert (=> d!107385 (= c!90963 (and ((_ is Cons!15848) (toList!4469 lt!378008)) (= (_1!5052 (h!16984 (toList!4469 lt!378008))) (_1!5052 (tuple2!10083 lt!377957 zeroValueAfter!34)))))))

(declare-fun e!465243 () Option!423)

(assert (=> d!107385 (= (getValueByKey!417 (toList!4469 lt!378008) (_1!5052 (tuple2!10083 lt!377957 zeroValueAfter!34))) e!465243)))

(declare-fun e!465244 () Option!423)

(declare-fun b!833969 () Bool)

(assert (=> b!833969 (= e!465244 (getValueByKey!417 (t!22212 (toList!4469 lt!378008)) (_1!5052 (tuple2!10083 lt!377957 zeroValueAfter!34))))))

(declare-fun b!833970 () Bool)

(assert (=> b!833970 (= e!465244 None!421)))

(declare-fun b!833968 () Bool)

(assert (=> b!833968 (= e!465243 e!465244)))

(declare-fun c!90964 () Bool)

(assert (=> b!833968 (= c!90964 (and ((_ is Cons!15848) (toList!4469 lt!378008)) (not (= (_1!5052 (h!16984 (toList!4469 lt!378008))) (_1!5052 (tuple2!10083 lt!377957 zeroValueAfter!34))))))))

(declare-fun b!833967 () Bool)

(assert (=> b!833967 (= e!465243 (Some!422 (_2!5052 (h!16984 (toList!4469 lt!378008)))))))

(assert (= (and d!107385 c!90963) b!833967))

(assert (= (and d!107385 (not c!90963)) b!833968))

(assert (= (and b!833968 c!90964) b!833969))

(assert (= (and b!833968 (not c!90964)) b!833970))

(declare-fun m!779023 () Bool)

(assert (=> b!833969 m!779023))

(assert (=> b!832988 d!107385))

(declare-fun d!107387 () Bool)

(declare-fun e!465246 () Bool)

(assert (=> d!107387 e!465246))

(declare-fun res!566948 () Bool)

(assert (=> d!107387 (=> res!566948 e!465246)))

(declare-fun lt!378411 () Bool)

(assert (=> d!107387 (= res!566948 (not lt!378411))))

(declare-fun lt!378414 () Bool)

(assert (=> d!107387 (= lt!378411 lt!378414)))

(declare-fun lt!378412 () Unit!28510)

(declare-fun e!465245 () Unit!28510)

(assert (=> d!107387 (= lt!378412 e!465245)))

(declare-fun c!90965 () Bool)

(assert (=> d!107387 (= c!90965 lt!378414)))

(assert (=> d!107387 (= lt!378414 (containsKey!402 (toList!4469 lt!378217) (_1!5052 (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!107387 (= (contains!4189 lt!378217 (_1!5052 (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) lt!378411)))

(declare-fun b!833971 () Bool)

(declare-fun lt!378413 () Unit!28510)

(assert (=> b!833971 (= e!465245 lt!378413)))

(assert (=> b!833971 (= lt!378413 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!378217) (_1!5052 (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> b!833971 (isDefined!312 (getValueByKey!417 (toList!4469 lt!378217) (_1!5052 (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!833972 () Bool)

(declare-fun Unit!28558 () Unit!28510)

(assert (=> b!833972 (= e!465245 Unit!28558)))

(declare-fun b!833973 () Bool)

(assert (=> b!833973 (= e!465246 (isDefined!312 (getValueByKey!417 (toList!4469 lt!378217) (_1!5052 (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (= (and d!107387 c!90965) b!833971))

(assert (= (and d!107387 (not c!90965)) b!833972))

(assert (= (and d!107387 (not res!566948)) b!833973))

(declare-fun m!779025 () Bool)

(assert (=> d!107387 m!779025))

(declare-fun m!779027 () Bool)

(assert (=> b!833971 m!779027))

(assert (=> b!833971 m!778095))

(assert (=> b!833971 m!778095))

(declare-fun m!779029 () Bool)

(assert (=> b!833971 m!779029))

(assert (=> b!833973 m!778095))

(assert (=> b!833973 m!778095))

(assert (=> b!833973 m!779029))

(assert (=> d!106897 d!107387))

(declare-fun d!107389 () Bool)

(declare-fun c!90966 () Bool)

(assert (=> d!107389 (= c!90966 (and ((_ is Cons!15848) lt!378216) (= (_1!5052 (h!16984 lt!378216)) (_1!5052 (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun e!465247 () Option!423)

(assert (=> d!107389 (= (getValueByKey!417 lt!378216 (_1!5052 (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) e!465247)))

(declare-fun e!465248 () Option!423)

(declare-fun b!833976 () Bool)

(assert (=> b!833976 (= e!465248 (getValueByKey!417 (t!22212 lt!378216) (_1!5052 (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!833977 () Bool)

(assert (=> b!833977 (= e!465248 None!421)))

(declare-fun b!833975 () Bool)

(assert (=> b!833975 (= e!465247 e!465248)))

(declare-fun c!90967 () Bool)

(assert (=> b!833975 (= c!90967 (and ((_ is Cons!15848) lt!378216) (not (= (_1!5052 (h!16984 lt!378216)) (_1!5052 (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))))

(declare-fun b!833974 () Bool)

(assert (=> b!833974 (= e!465247 (Some!422 (_2!5052 (h!16984 lt!378216))))))

(assert (= (and d!107389 c!90966) b!833974))

(assert (= (and d!107389 (not c!90966)) b!833975))

(assert (= (and b!833975 c!90967) b!833976))

(assert (= (and b!833975 (not c!90967)) b!833977))

(declare-fun m!779031 () Bool)

(assert (=> b!833976 m!779031))

(assert (=> d!106897 d!107389))

(declare-fun d!107391 () Bool)

(assert (=> d!107391 (= (getValueByKey!417 lt!378216 (_1!5052 (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) (Some!422 (_2!5052 (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun lt!378415 () Unit!28510)

(assert (=> d!107391 (= lt!378415 (choose!1429 lt!378216 (_1!5052 (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5052 (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun e!465249 () Bool)

(assert (=> d!107391 e!465249))

(declare-fun res!566949 () Bool)

(assert (=> d!107391 (=> (not res!566949) (not e!465249))))

(assert (=> d!107391 (= res!566949 (isStrictlySorted!430 lt!378216))))

(assert (=> d!107391 (= (lemmaContainsTupThenGetReturnValue!231 lt!378216 (_1!5052 (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5052 (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) lt!378415)))

(declare-fun b!833978 () Bool)

(declare-fun res!566950 () Bool)

(assert (=> b!833978 (=> (not res!566950) (not e!465249))))

(assert (=> b!833978 (= res!566950 (containsKey!402 lt!378216 (_1!5052 (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!833979 () Bool)

(assert (=> b!833979 (= e!465249 (contains!4190 lt!378216 (tuple2!10083 (_1!5052 (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5052 (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (= (and d!107391 res!566949) b!833978))

(assert (= (and b!833978 res!566950) b!833979))

(assert (=> d!107391 m!778089))

(declare-fun m!779033 () Bool)

(assert (=> d!107391 m!779033))

(declare-fun m!779035 () Bool)

(assert (=> d!107391 m!779035))

(declare-fun m!779037 () Bool)

(assert (=> b!833978 m!779037))

(declare-fun m!779039 () Bool)

(assert (=> b!833979 m!779039))

(assert (=> d!106897 d!107391))

(declare-fun c!90968 () Bool)

(declare-fun bm!36513 () Bool)

(declare-fun e!465251 () List!15852)

(declare-fun call!36517 () List!15852)

(assert (=> bm!36513 (= call!36517 ($colon$colon!534 e!465251 (ite c!90968 (h!16984 (toList!4469 (ite c!90642 call!36437 (ite c!90645 call!36435 call!36440)))) (tuple2!10083 (_1!5052 (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5052 (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))))

(declare-fun c!90971 () Bool)

(assert (=> bm!36513 (= c!90971 c!90968)))

(declare-fun bm!36514 () Bool)

(declare-fun call!36518 () List!15852)

(assert (=> bm!36514 (= call!36518 call!36517)))

(declare-fun bm!36515 () Bool)

(declare-fun call!36516 () List!15852)

(assert (=> bm!36515 (= call!36516 call!36518)))

(declare-fun b!833980 () Bool)

(declare-fun c!90969 () Bool)

(assert (=> b!833980 (= c!90969 (and ((_ is Cons!15848) (toList!4469 (ite c!90642 call!36437 (ite c!90645 call!36435 call!36440)))) (bvsgt (_1!5052 (h!16984 (toList!4469 (ite c!90642 call!36437 (ite c!90645 call!36435 call!36440))))) (_1!5052 (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun e!465250 () List!15852)

(declare-fun e!465253 () List!15852)

(assert (=> b!833980 (= e!465250 e!465253)))

(declare-fun b!833981 () Bool)

(assert (=> b!833981 (= e!465253 call!36516)))

(declare-fun b!833982 () Bool)

(assert (=> b!833982 (= e!465251 (insertStrictlySorted!270 (t!22212 (toList!4469 (ite c!90642 call!36437 (ite c!90645 call!36435 call!36440)))) (_1!5052 (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5052 (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!833983 () Bool)

(declare-fun e!465252 () List!15852)

(assert (=> b!833983 (= e!465252 call!36517)))

(declare-fun b!833984 () Bool)

(declare-fun lt!378416 () List!15852)

(declare-fun e!465254 () Bool)

(assert (=> b!833984 (= e!465254 (contains!4190 lt!378416 (tuple2!10083 (_1!5052 (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5052 (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun c!90970 () Bool)

(declare-fun b!833985 () Bool)

(assert (=> b!833985 (= e!465251 (ite c!90970 (t!22212 (toList!4469 (ite c!90642 call!36437 (ite c!90645 call!36435 call!36440)))) (ite c!90969 (Cons!15848 (h!16984 (toList!4469 (ite c!90642 call!36437 (ite c!90645 call!36435 call!36440)))) (t!22212 (toList!4469 (ite c!90642 call!36437 (ite c!90645 call!36435 call!36440))))) Nil!15849)))))

(declare-fun b!833986 () Bool)

(assert (=> b!833986 (= e!465252 e!465250)))

(assert (=> b!833986 (= c!90970 (and ((_ is Cons!15848) (toList!4469 (ite c!90642 call!36437 (ite c!90645 call!36435 call!36440)))) (= (_1!5052 (h!16984 (toList!4469 (ite c!90642 call!36437 (ite c!90645 call!36435 call!36440))))) (_1!5052 (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!833987 () Bool)

(assert (=> b!833987 (= e!465250 call!36518)))

(declare-fun b!833988 () Bool)

(declare-fun res!566952 () Bool)

(assert (=> b!833988 (=> (not res!566952) (not e!465254))))

(assert (=> b!833988 (= res!566952 (containsKey!402 lt!378416 (_1!5052 (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun d!107393 () Bool)

(assert (=> d!107393 e!465254))

(declare-fun res!566951 () Bool)

(assert (=> d!107393 (=> (not res!566951) (not e!465254))))

(assert (=> d!107393 (= res!566951 (isStrictlySorted!430 lt!378416))))

(assert (=> d!107393 (= lt!378416 e!465252)))

(assert (=> d!107393 (= c!90968 (and ((_ is Cons!15848) (toList!4469 (ite c!90642 call!36437 (ite c!90645 call!36435 call!36440)))) (bvslt (_1!5052 (h!16984 (toList!4469 (ite c!90642 call!36437 (ite c!90645 call!36435 call!36440))))) (_1!5052 (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (=> d!107393 (isStrictlySorted!430 (toList!4469 (ite c!90642 call!36437 (ite c!90645 call!36435 call!36440))))))

(assert (=> d!107393 (= (insertStrictlySorted!270 (toList!4469 (ite c!90642 call!36437 (ite c!90645 call!36435 call!36440))) (_1!5052 (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5052 (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) lt!378416)))

(declare-fun b!833989 () Bool)

(assert (=> b!833989 (= e!465253 call!36516)))

(assert (= (and d!107393 c!90968) b!833983))

(assert (= (and d!107393 (not c!90968)) b!833986))

(assert (= (and b!833986 c!90970) b!833987))

(assert (= (and b!833986 (not c!90970)) b!833980))

(assert (= (and b!833980 c!90969) b!833981))

(assert (= (and b!833980 (not c!90969)) b!833989))

(assert (= (or b!833981 b!833989) bm!36515))

(assert (= (or b!833987 bm!36515) bm!36514))

(assert (= (or b!833983 bm!36514) bm!36513))

(assert (= (and bm!36513 c!90971) b!833982))

(assert (= (and bm!36513 (not c!90971)) b!833985))

(assert (= (and d!107393 res!566951) b!833988))

(assert (= (and b!833988 res!566952) b!833984))

(declare-fun m!779041 () Bool)

(assert (=> bm!36513 m!779041))

(declare-fun m!779043 () Bool)

(assert (=> b!833984 m!779043))

(declare-fun m!779045 () Bool)

(assert (=> b!833982 m!779045))

(declare-fun m!779047 () Bool)

(assert (=> b!833988 m!779047))

(declare-fun m!779049 () Bool)

(assert (=> d!107393 m!779049))

(declare-fun m!779051 () Bool)

(assert (=> d!107393 m!779051))

(assert (=> d!106897 d!107393))

(declare-fun c!90972 () Bool)

(declare-fun d!107395 () Bool)

(assert (=> d!107395 (= c!90972 (and ((_ is Cons!15848) (toList!4469 lt!378091)) (= (_1!5052 (h!16984 (toList!4469 lt!378091))) (_1!5052 (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun e!465255 () Option!423)

(assert (=> d!107395 (= (getValueByKey!417 (toList!4469 lt!378091) (_1!5052 (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) e!465255)))

(declare-fun b!833992 () Bool)

(declare-fun e!465256 () Option!423)

(assert (=> b!833992 (= e!465256 (getValueByKey!417 (t!22212 (toList!4469 lt!378091)) (_1!5052 (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!833993 () Bool)

(assert (=> b!833993 (= e!465256 None!421)))

(declare-fun b!833991 () Bool)

(assert (=> b!833991 (= e!465255 e!465256)))

(declare-fun c!90973 () Bool)

(assert (=> b!833991 (= c!90973 (and ((_ is Cons!15848) (toList!4469 lt!378091)) (not (= (_1!5052 (h!16984 (toList!4469 lt!378091))) (_1!5052 (ite (or c!90636 c!90639) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))))

(declare-fun b!833990 () Bool)

(assert (=> b!833990 (= e!465255 (Some!422 (_2!5052 (h!16984 (toList!4469 lt!378091)))))))

(assert (= (and d!107395 c!90972) b!833990))

(assert (= (and d!107395 (not c!90972)) b!833991))

(assert (= (and b!833991 c!90973) b!833992))

(assert (= (and b!833991 (not c!90973)) b!833993))

(declare-fun m!779053 () Bool)

(assert (=> b!833992 m!779053))

(assert (=> b!833096 d!107395))

(assert (=> d!106819 d!106817))

(declare-fun d!107397 () Bool)

(assert (=> d!107397 (= (getValueByKey!417 lt!377822 (_1!5052 lt!377761)) (Some!422 (_2!5052 lt!377761)))))

(assert (=> d!107397 true))

(declare-fun _$22!582 () Unit!28510)

(assert (=> d!107397 (= (choose!1429 lt!377822 (_1!5052 lt!377761) (_2!5052 lt!377761)) _$22!582)))

(declare-fun bs!23334 () Bool)

(assert (= bs!23334 d!107397))

(assert (=> bs!23334 m!777071))

(assert (=> d!106819 d!107397))

(declare-fun d!107399 () Bool)

(declare-fun res!566953 () Bool)

(declare-fun e!465257 () Bool)

(assert (=> d!107399 (=> res!566953 e!465257)))

(assert (=> d!107399 (= res!566953 (or ((_ is Nil!15849) lt!377822) ((_ is Nil!15849) (t!22212 lt!377822))))))

(assert (=> d!107399 (= (isStrictlySorted!430 lt!377822) e!465257)))

(declare-fun b!833994 () Bool)

(declare-fun e!465258 () Bool)

(assert (=> b!833994 (= e!465257 e!465258)))

(declare-fun res!566954 () Bool)

(assert (=> b!833994 (=> (not res!566954) (not e!465258))))

(assert (=> b!833994 (= res!566954 (bvslt (_1!5052 (h!16984 lt!377822)) (_1!5052 (h!16984 (t!22212 lt!377822)))))))

(declare-fun b!833995 () Bool)

(assert (=> b!833995 (= e!465258 (isStrictlySorted!430 (t!22212 lt!377822)))))

(assert (= (and d!107399 (not res!566953)) b!833994))

(assert (= (and b!833994 res!566954) b!833995))

(declare-fun m!779055 () Bool)

(assert (=> b!833995 m!779055))

(assert (=> d!106819 d!107399))

(declare-fun d!107401 () Bool)

(declare-fun lt!378417 () Bool)

(assert (=> d!107401 (= lt!378417 (select (content!388 (toList!4469 lt!378065)) (tuple2!10083 lt!377929 zeroValueBefore!34)))))

(declare-fun e!465260 () Bool)

(assert (=> d!107401 (= lt!378417 e!465260)))

(declare-fun res!566956 () Bool)

(assert (=> d!107401 (=> (not res!566956) (not e!465260))))

(assert (=> d!107401 (= res!566956 ((_ is Cons!15848) (toList!4469 lt!378065)))))

(assert (=> d!107401 (= (contains!4190 (toList!4469 lt!378065) (tuple2!10083 lt!377929 zeroValueBefore!34)) lt!378417)))

(declare-fun b!833996 () Bool)

(declare-fun e!465259 () Bool)

(assert (=> b!833996 (= e!465260 e!465259)))

(declare-fun res!566955 () Bool)

(assert (=> b!833996 (=> res!566955 e!465259)))

(assert (=> b!833996 (= res!566955 (= (h!16984 (toList!4469 lt!378065)) (tuple2!10083 lt!377929 zeroValueBefore!34)))))

(declare-fun b!833997 () Bool)

(assert (=> b!833997 (= e!465259 (contains!4190 (t!22212 (toList!4469 lt!378065)) (tuple2!10083 lt!377929 zeroValueBefore!34)))))

(assert (= (and d!107401 res!566956) b!833996))

(assert (= (and b!833996 (not res!566955)) b!833997))

(declare-fun m!779057 () Bool)

(assert (=> d!107401 m!779057))

(declare-fun m!779059 () Bool)

(assert (=> d!107401 m!779059))

(declare-fun m!779061 () Bool)

(assert (=> b!833997 m!779061))

(assert (=> b!833056 d!107401))

(declare-fun d!107403 () Bool)

(declare-fun c!90974 () Bool)

(assert (=> d!107403 (= c!90974 (and ((_ is Cons!15848) (toList!4469 lt!378192)) (= (_1!5052 (h!16984 (toList!4469 lt!378192))) (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!465261 () Option!423)

(assert (=> d!107403 (= (getValueByKey!417 (toList!4469 lt!378192) (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!465261)))

(declare-fun b!834000 () Bool)

(declare-fun e!465262 () Option!423)

(assert (=> b!834000 (= e!465262 (getValueByKey!417 (t!22212 (toList!4469 lt!378192)) (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!834001 () Bool)

(assert (=> b!834001 (= e!465262 None!421)))

(declare-fun b!833999 () Bool)

(assert (=> b!833999 (= e!465261 e!465262)))

(declare-fun c!90975 () Bool)

(assert (=> b!833999 (= c!90975 (and ((_ is Cons!15848) (toList!4469 lt!378192)) (not (= (_1!5052 (h!16984 (toList!4469 lt!378192))) (_1!5052 (tuple2!10083 (select (arr!22331 _keys!976) #b00000000000000000000000000000000) (get!11826 (select (arr!22332 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!833998 () Bool)

(assert (=> b!833998 (= e!465261 (Some!422 (_2!5052 (h!16984 (toList!4469 lt!378192)))))))

(assert (= (and d!107403 c!90974) b!833998))

(assert (= (and d!107403 (not c!90974)) b!833999))

(assert (= (and b!833999 c!90975) b!834000))

(assert (= (and b!833999 (not c!90975)) b!834001))

(declare-fun m!779063 () Bool)

(assert (=> b!834000 m!779063))

(assert (=> b!833275 d!107403))

(assert (=> b!833040 d!107183))

(assert (=> b!833040 d!107185))

(declare-fun d!107405 () Bool)

(declare-fun e!465264 () Bool)

(assert (=> d!107405 e!465264))

(declare-fun res!566957 () Bool)

(assert (=> d!107405 (=> res!566957 e!465264)))

(declare-fun lt!378418 () Bool)

(assert (=> d!107405 (= res!566957 (not lt!378418))))

(declare-fun lt!378421 () Bool)

(assert (=> d!107405 (= lt!378418 lt!378421)))

(declare-fun lt!378419 () Unit!28510)

(declare-fun e!465263 () Unit!28510)

(assert (=> d!107405 (= lt!378419 e!465263)))

(declare-fun c!90976 () Bool)

(assert (=> d!107405 (= c!90976 lt!378421)))

(assert (=> d!107405 (= lt!378421 (containsKey!402 (toList!4469 lt!378176) (_1!5052 (tuple2!10083 lt!377856 lt!377860))))))

(assert (=> d!107405 (= (contains!4189 lt!378176 (_1!5052 (tuple2!10083 lt!377856 lt!377860))) lt!378418)))

(declare-fun b!834002 () Bool)

(declare-fun lt!378420 () Unit!28510)

(assert (=> b!834002 (= e!465263 lt!378420)))

(assert (=> b!834002 (= lt!378420 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!378176) (_1!5052 (tuple2!10083 lt!377856 lt!377860))))))

(assert (=> b!834002 (isDefined!312 (getValueByKey!417 (toList!4469 lt!378176) (_1!5052 (tuple2!10083 lt!377856 lt!377860))))))

(declare-fun b!834003 () Bool)

(declare-fun Unit!28559 () Unit!28510)

(assert (=> b!834003 (= e!465263 Unit!28559)))

(declare-fun b!834004 () Bool)

(assert (=> b!834004 (= e!465264 (isDefined!312 (getValueByKey!417 (toList!4469 lt!378176) (_1!5052 (tuple2!10083 lt!377856 lt!377860)))))))

(assert (= (and d!107405 c!90976) b!834002))

(assert (= (and d!107405 (not c!90976)) b!834003))

(assert (= (and d!107405 (not res!566957)) b!834004))

(declare-fun m!779065 () Bool)

(assert (=> d!107405 m!779065))

(declare-fun m!779067 () Bool)

(assert (=> b!834002 m!779067))

(assert (=> b!834002 m!777961))

(assert (=> b!834002 m!777961))

(declare-fun m!779069 () Bool)

(assert (=> b!834002 m!779069))

(assert (=> b!834004 m!777961))

(assert (=> b!834004 m!777961))

(assert (=> b!834004 m!779069))

(assert (=> d!106863 d!107405))

(declare-fun c!90977 () Bool)

(declare-fun d!107407 () Bool)

(assert (=> d!107407 (= c!90977 (and ((_ is Cons!15848) lt!378175) (= (_1!5052 (h!16984 lt!378175)) (_1!5052 (tuple2!10083 lt!377856 lt!377860)))))))

(declare-fun e!465265 () Option!423)

(assert (=> d!107407 (= (getValueByKey!417 lt!378175 (_1!5052 (tuple2!10083 lt!377856 lt!377860))) e!465265)))

(declare-fun e!465266 () Option!423)

(declare-fun b!834007 () Bool)

(assert (=> b!834007 (= e!465266 (getValueByKey!417 (t!22212 lt!378175) (_1!5052 (tuple2!10083 lt!377856 lt!377860))))))

(declare-fun b!834008 () Bool)

(assert (=> b!834008 (= e!465266 None!421)))

(declare-fun b!834006 () Bool)

(assert (=> b!834006 (= e!465265 e!465266)))

(declare-fun c!90978 () Bool)

(assert (=> b!834006 (= c!90978 (and ((_ is Cons!15848) lt!378175) (not (= (_1!5052 (h!16984 lt!378175)) (_1!5052 (tuple2!10083 lt!377856 lt!377860))))))))

(declare-fun b!834005 () Bool)

(assert (=> b!834005 (= e!465265 (Some!422 (_2!5052 (h!16984 lt!378175))))))

(assert (= (and d!107407 c!90977) b!834005))

(assert (= (and d!107407 (not c!90977)) b!834006))

(assert (= (and b!834006 c!90978) b!834007))

(assert (= (and b!834006 (not c!90978)) b!834008))

(declare-fun m!779071 () Bool)

(assert (=> b!834007 m!779071))

(assert (=> d!106863 d!107407))

(declare-fun d!107409 () Bool)

(assert (=> d!107409 (= (getValueByKey!417 lt!378175 (_1!5052 (tuple2!10083 lt!377856 lt!377860))) (Some!422 (_2!5052 (tuple2!10083 lt!377856 lt!377860))))))

(declare-fun lt!378422 () Unit!28510)

(assert (=> d!107409 (= lt!378422 (choose!1429 lt!378175 (_1!5052 (tuple2!10083 lt!377856 lt!377860)) (_2!5052 (tuple2!10083 lt!377856 lt!377860))))))

(declare-fun e!465267 () Bool)

(assert (=> d!107409 e!465267))

(declare-fun res!566958 () Bool)

(assert (=> d!107409 (=> (not res!566958) (not e!465267))))

(assert (=> d!107409 (= res!566958 (isStrictlySorted!430 lt!378175))))

(assert (=> d!107409 (= (lemmaContainsTupThenGetReturnValue!231 lt!378175 (_1!5052 (tuple2!10083 lt!377856 lt!377860)) (_2!5052 (tuple2!10083 lt!377856 lt!377860))) lt!378422)))

(declare-fun b!834009 () Bool)

(declare-fun res!566959 () Bool)

(assert (=> b!834009 (=> (not res!566959) (not e!465267))))

(assert (=> b!834009 (= res!566959 (containsKey!402 lt!378175 (_1!5052 (tuple2!10083 lt!377856 lt!377860))))))

(declare-fun b!834010 () Bool)

(assert (=> b!834010 (= e!465267 (contains!4190 lt!378175 (tuple2!10083 (_1!5052 (tuple2!10083 lt!377856 lt!377860)) (_2!5052 (tuple2!10083 lt!377856 lt!377860)))))))

(assert (= (and d!107409 res!566958) b!834009))

(assert (= (and b!834009 res!566959) b!834010))

(assert (=> d!107409 m!777955))

(declare-fun m!779073 () Bool)

(assert (=> d!107409 m!779073))

(declare-fun m!779075 () Bool)

(assert (=> d!107409 m!779075))

(declare-fun m!779077 () Bool)

(assert (=> b!834009 m!779077))

(declare-fun m!779079 () Bool)

(assert (=> b!834010 m!779079))

(assert (=> d!106863 d!107409))

(declare-fun c!90979 () Bool)

(declare-fun bm!36516 () Bool)

(declare-fun e!465269 () List!15852)

(declare-fun call!36520 () List!15852)

(assert (=> bm!36516 (= call!36520 ($colon$colon!534 e!465269 (ite c!90979 (h!16984 (toList!4469 lt!377857)) (tuple2!10083 (_1!5052 (tuple2!10083 lt!377856 lt!377860)) (_2!5052 (tuple2!10083 lt!377856 lt!377860))))))))

(declare-fun c!90982 () Bool)

(assert (=> bm!36516 (= c!90982 c!90979)))

(declare-fun bm!36517 () Bool)

(declare-fun call!36521 () List!15852)

(assert (=> bm!36517 (= call!36521 call!36520)))

(declare-fun bm!36518 () Bool)

(declare-fun call!36519 () List!15852)

(assert (=> bm!36518 (= call!36519 call!36521)))

(declare-fun c!90980 () Bool)

(declare-fun b!834011 () Bool)

(assert (=> b!834011 (= c!90980 (and ((_ is Cons!15848) (toList!4469 lt!377857)) (bvsgt (_1!5052 (h!16984 (toList!4469 lt!377857))) (_1!5052 (tuple2!10083 lt!377856 lt!377860)))))))

(declare-fun e!465268 () List!15852)

(declare-fun e!465271 () List!15852)

(assert (=> b!834011 (= e!465268 e!465271)))

(declare-fun b!834012 () Bool)

(assert (=> b!834012 (= e!465271 call!36519)))

(declare-fun b!834013 () Bool)

(assert (=> b!834013 (= e!465269 (insertStrictlySorted!270 (t!22212 (toList!4469 lt!377857)) (_1!5052 (tuple2!10083 lt!377856 lt!377860)) (_2!5052 (tuple2!10083 lt!377856 lt!377860))))))

(declare-fun b!834014 () Bool)

(declare-fun e!465270 () List!15852)

(assert (=> b!834014 (= e!465270 call!36520)))

(declare-fun e!465272 () Bool)

(declare-fun b!834015 () Bool)

(declare-fun lt!378423 () List!15852)

(assert (=> b!834015 (= e!465272 (contains!4190 lt!378423 (tuple2!10083 (_1!5052 (tuple2!10083 lt!377856 lt!377860)) (_2!5052 (tuple2!10083 lt!377856 lt!377860)))))))

(declare-fun c!90981 () Bool)

(declare-fun b!834016 () Bool)

(assert (=> b!834016 (= e!465269 (ite c!90981 (t!22212 (toList!4469 lt!377857)) (ite c!90980 (Cons!15848 (h!16984 (toList!4469 lt!377857)) (t!22212 (toList!4469 lt!377857))) Nil!15849)))))

(declare-fun b!834017 () Bool)

(assert (=> b!834017 (= e!465270 e!465268)))

(assert (=> b!834017 (= c!90981 (and ((_ is Cons!15848) (toList!4469 lt!377857)) (= (_1!5052 (h!16984 (toList!4469 lt!377857))) (_1!5052 (tuple2!10083 lt!377856 lt!377860)))))))

(declare-fun b!834018 () Bool)

(assert (=> b!834018 (= e!465268 call!36521)))

(declare-fun b!834019 () Bool)

(declare-fun res!566961 () Bool)

(assert (=> b!834019 (=> (not res!566961) (not e!465272))))

(assert (=> b!834019 (= res!566961 (containsKey!402 lt!378423 (_1!5052 (tuple2!10083 lt!377856 lt!377860))))))

(declare-fun d!107411 () Bool)

(assert (=> d!107411 e!465272))

(declare-fun res!566960 () Bool)

(assert (=> d!107411 (=> (not res!566960) (not e!465272))))

(assert (=> d!107411 (= res!566960 (isStrictlySorted!430 lt!378423))))

(assert (=> d!107411 (= lt!378423 e!465270)))

(assert (=> d!107411 (= c!90979 (and ((_ is Cons!15848) (toList!4469 lt!377857)) (bvslt (_1!5052 (h!16984 (toList!4469 lt!377857))) (_1!5052 (tuple2!10083 lt!377856 lt!377860)))))))

(assert (=> d!107411 (isStrictlySorted!430 (toList!4469 lt!377857))))

(assert (=> d!107411 (= (insertStrictlySorted!270 (toList!4469 lt!377857) (_1!5052 (tuple2!10083 lt!377856 lt!377860)) (_2!5052 (tuple2!10083 lt!377856 lt!377860))) lt!378423)))

(declare-fun b!834020 () Bool)

(assert (=> b!834020 (= e!465271 call!36519)))

(assert (= (and d!107411 c!90979) b!834014))

(assert (= (and d!107411 (not c!90979)) b!834017))

(assert (= (and b!834017 c!90981) b!834018))

(assert (= (and b!834017 (not c!90981)) b!834011))

(assert (= (and b!834011 c!90980) b!834012))

(assert (= (and b!834011 (not c!90980)) b!834020))

(assert (= (or b!834012 b!834020) bm!36518))

(assert (= (or b!834018 bm!36518) bm!36517))

(assert (= (or b!834014 bm!36517) bm!36516))

(assert (= (and bm!36516 c!90982) b!834013))

(assert (= (and bm!36516 (not c!90982)) b!834016))

(assert (= (and d!107411 res!566960) b!834019))

(assert (= (and b!834019 res!566961) b!834015))

(declare-fun m!779081 () Bool)

(assert (=> bm!36516 m!779081))

(declare-fun m!779083 () Bool)

(assert (=> b!834015 m!779083))

(declare-fun m!779085 () Bool)

(assert (=> b!834013 m!779085))

(declare-fun m!779087 () Bool)

(assert (=> b!834019 m!779087))

(declare-fun m!779089 () Bool)

(assert (=> d!107411 m!779089))

(declare-fun m!779091 () Bool)

(assert (=> d!107411 m!779091))

(assert (=> d!106863 d!107411))

(declare-fun d!107413 () Bool)

(assert (=> d!107413 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377827) (_1!5052 lt!377756)))))

(declare-fun lt!378424 () Unit!28510)

(assert (=> d!107413 (= lt!378424 (choose!1433 (toList!4469 lt!377827) (_1!5052 lt!377756)))))

(declare-fun e!465273 () Bool)

(assert (=> d!107413 e!465273))

(declare-fun res!566962 () Bool)

(assert (=> d!107413 (=> (not res!566962) (not e!465273))))

(assert (=> d!107413 (= res!566962 (isStrictlySorted!430 (toList!4469 lt!377827)))))

(assert (=> d!107413 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377827) (_1!5052 lt!377756)) lt!378424)))

(declare-fun b!834021 () Bool)

(assert (=> b!834021 (= e!465273 (containsKey!402 (toList!4469 lt!377827) (_1!5052 lt!377756)))))

(assert (= (and d!107413 res!566962) b!834021))

(assert (=> d!107413 m!777089))

(assert (=> d!107413 m!777089))

(assert (=> d!107413 m!777803))

(declare-fun m!779093 () Bool)

(assert (=> d!107413 m!779093))

(declare-fun m!779095 () Bool)

(assert (=> d!107413 m!779095))

(assert (=> b!834021 m!777799))

(assert (=> b!833164 d!107413))

(declare-fun d!107415 () Bool)

(assert (=> d!107415 (= (isDefined!312 (getValueByKey!417 (toList!4469 lt!377827) (_1!5052 lt!377756))) (not (isEmpty!665 (getValueByKey!417 (toList!4469 lt!377827) (_1!5052 lt!377756)))))))

(declare-fun bs!23335 () Bool)

(assert (= bs!23335 d!107415))

(assert (=> bs!23335 m!777089))

(declare-fun m!779097 () Bool)

(assert (=> bs!23335 m!779097))

(assert (=> b!833164 d!107415))

(assert (=> b!833164 d!106851))

(assert (=> b!833209 d!107189))

(assert (=> b!833209 d!107045))

(assert (=> d!106687 d!106663))

(declare-fun d!107417 () Bool)

(assert (=> d!107417 (= (apply!373 (+!1991 lt!377956 (tuple2!10083 lt!377950 minValue!754)) lt!377959) (apply!373 lt!377956 lt!377959))))

(assert (=> d!107417 true))

(declare-fun _$34!1152 () Unit!28510)

(assert (=> d!107417 (= (choose!1430 lt!377956 lt!377950 minValue!754 lt!377959) _$34!1152)))

(declare-fun bs!23336 () Bool)

(assert (= bs!23336 d!107417))

(assert (=> bs!23336 m!777249))

(assert (=> bs!23336 m!777249))

(assert (=> bs!23336 m!777251))

(assert (=> bs!23336 m!777267))

(assert (=> d!106687 d!107417))

(assert (=> d!106687 d!106685))

(declare-fun d!107419 () Bool)

(declare-fun e!465275 () Bool)

(assert (=> d!107419 e!465275))

(declare-fun res!566963 () Bool)

(assert (=> d!107419 (=> res!566963 e!465275)))

(declare-fun lt!378425 () Bool)

(assert (=> d!107419 (= res!566963 (not lt!378425))))

(declare-fun lt!378428 () Bool)

(assert (=> d!107419 (= lt!378425 lt!378428)))

(declare-fun lt!378426 () Unit!28510)

(declare-fun e!465274 () Unit!28510)

(assert (=> d!107419 (= lt!378426 e!465274)))

(declare-fun c!90983 () Bool)

(assert (=> d!107419 (= c!90983 lt!378428)))

(assert (=> d!107419 (= lt!378428 (containsKey!402 (toList!4469 lt!377956) lt!377959))))

(assert (=> d!107419 (= (contains!4189 lt!377956 lt!377959) lt!378425)))

(declare-fun b!834022 () Bool)

(declare-fun lt!378427 () Unit!28510)

(assert (=> b!834022 (= e!465274 lt!378427)))

(assert (=> b!834022 (= lt!378427 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377956) lt!377959))))

(assert (=> b!834022 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377956) lt!377959))))

(declare-fun b!834023 () Bool)

(declare-fun Unit!28560 () Unit!28510)

(assert (=> b!834023 (= e!465274 Unit!28560)))

(declare-fun b!834024 () Bool)

(assert (=> b!834024 (= e!465275 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377956) lt!377959)))))

(assert (= (and d!107419 c!90983) b!834022))

(assert (= (and d!107419 (not c!90983)) b!834023))

(assert (= (and d!107419 (not res!566963)) b!834024))

(declare-fun m!779099 () Bool)

(assert (=> d!107419 m!779099))

(declare-fun m!779101 () Bool)

(assert (=> b!834022 m!779101))

(assert (=> b!834022 m!777413))

(assert (=> b!834022 m!777413))

(declare-fun m!779103 () Bool)

(assert (=> b!834022 m!779103))

(assert (=> b!834024 m!777413))

(assert (=> b!834024 m!777413))

(assert (=> b!834024 m!779103))

(assert (=> d!106687 d!107419))

(assert (=> d!106687 d!106677))

(assert (=> b!833124 d!107193))

(assert (=> b!833124 d!107195))

(declare-fun d!107421 () Bool)

(assert (=> d!107421 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377971) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!378429 () Unit!28510)

(assert (=> d!107421 (= lt!378429 (choose!1433 (toList!4469 lt!377971) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun e!465276 () Bool)

(assert (=> d!107421 e!465276))

(declare-fun res!566964 () Bool)

(assert (=> d!107421 (=> (not res!566964) (not e!465276))))

(assert (=> d!107421 (= res!566964 (isStrictlySorted!430 (toList!4469 lt!377971)))))

(assert (=> d!107421 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377971) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!378429)))

(declare-fun b!834025 () Bool)

(assert (=> b!834025 (= e!465276 (containsKey!402 (toList!4469 lt!377971) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and d!107421 res!566964) b!834025))

(assert (=> d!107421 m!777293))

(assert (=> d!107421 m!777293))

(assert (=> d!107421 m!777303))

(declare-fun m!779105 () Bool)

(assert (=> d!107421 m!779105))

(declare-fun m!779107 () Bool)

(assert (=> d!107421 m!779107))

(assert (=> b!834025 m!777299))

(assert (=> b!832924 d!107421))

(declare-fun d!107423 () Bool)

(assert (=> d!107423 (= (isDefined!312 (getValueByKey!417 (toList!4469 lt!377971) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (not (isEmpty!665 (getValueByKey!417 (toList!4469 lt!377971) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun bs!23337 () Bool)

(assert (= bs!23337 d!107423))

(assert (=> bs!23337 m!777293))

(declare-fun m!779109 () Bool)

(assert (=> bs!23337 m!779109))

(assert (=> b!832924 d!107423))

(assert (=> b!832924 d!106713))

(declare-fun d!107425 () Bool)

(assert (=> d!107425 (= (apply!373 lt!378080 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!11827 (getValueByKey!417 (toList!4469 lt!378080) (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))))

(declare-fun bs!23338 () Bool)

(assert (= bs!23338 d!107425))

(assert (=> bs!23338 m!777463))

(declare-fun m!779111 () Bool)

(assert (=> bs!23338 m!779111))

(assert (=> bs!23338 m!779111))

(declare-fun m!779113 () Bool)

(assert (=> bs!23338 m!779113))

(assert (=> b!833087 d!107425))

(assert (=> b!833087 d!106959))

(assert (=> d!106657 d!106655))

(declare-fun d!107427 () Bool)

(assert (=> d!107427 (= (getValueByKey!417 lt!377970 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!422 (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!107427 true))

(declare-fun _$22!583 () Unit!28510)

(assert (=> d!107427 (= (choose!1429 lt!377970 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) _$22!583)))

(declare-fun bs!23339 () Bool)

(assert (= bs!23339 d!107427))

(assert (=> bs!23339 m!777287))

(assert (=> d!106657 d!107427))

(declare-fun d!107429 () Bool)

(declare-fun res!566965 () Bool)

(declare-fun e!465277 () Bool)

(assert (=> d!107429 (=> res!566965 e!465277)))

(assert (=> d!107429 (= res!566965 (or ((_ is Nil!15849) lt!377970) ((_ is Nil!15849) (t!22212 lt!377970))))))

(assert (=> d!107429 (= (isStrictlySorted!430 lt!377970) e!465277)))

(declare-fun b!834026 () Bool)

(declare-fun e!465278 () Bool)

(assert (=> b!834026 (= e!465277 e!465278)))

(declare-fun res!566966 () Bool)

(assert (=> b!834026 (=> (not res!566966) (not e!465278))))

(assert (=> b!834026 (= res!566966 (bvslt (_1!5052 (h!16984 lt!377970)) (_1!5052 (h!16984 (t!22212 lt!377970)))))))

(declare-fun b!834027 () Bool)

(assert (=> b!834027 (= e!465278 (isStrictlySorted!430 (t!22212 lt!377970)))))

(assert (= (and d!107429 (not res!566965)) b!834026))

(assert (= (and b!834026 res!566966) b!834027))

(declare-fun m!779115 () Bool)

(assert (=> b!834027 m!779115))

(assert (=> d!106657 d!107429))

(declare-fun d!107431 () Bool)

(assert (=> d!107431 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377861) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!378430 () Unit!28510)

(assert (=> d!107431 (= lt!378430 (choose!1433 (toList!4469 lt!377861) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!465279 () Bool)

(assert (=> d!107431 e!465279))

(declare-fun res!566967 () Bool)

(assert (=> d!107431 (=> (not res!566967) (not e!465279))))

(assert (=> d!107431 (= res!566967 (isStrictlySorted!430 (toList!4469 lt!377861)))))

(assert (=> d!107431 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377861) #b0000000000000000000000000000000000000000000000000000000000000000) lt!378430)))

(declare-fun b!834028 () Bool)

(assert (=> b!834028 (= e!465279 (containsKey!402 (toList!4469 lt!377861) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!107431 res!566967) b!834028))

(assert (=> d!107431 m!777857))

(assert (=> d!107431 m!777857))

(assert (=> d!107431 m!777859))

(declare-fun m!779117 () Bool)

(assert (=> d!107431 m!779117))

(assert (=> d!107431 m!778615))

(assert (=> b!834028 m!777853))

(assert (=> b!833202 d!107431))

(declare-fun d!107433 () Bool)

(assert (=> d!107433 (= (isDefined!312 (getValueByKey!417 (toList!4469 lt!377861) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!665 (getValueByKey!417 (toList!4469 lt!377861) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23340 () Bool)

(assert (= bs!23340 d!107433))

(assert (=> bs!23340 m!777857))

(declare-fun m!779119 () Bool)

(assert (=> bs!23340 m!779119))

(assert (=> b!833202 d!107433))

(declare-fun d!107435 () Bool)

(declare-fun c!90984 () Bool)

(assert (=> d!107435 (= c!90984 (and ((_ is Cons!15848) (toList!4469 lt!377861)) (= (_1!5052 (h!16984 (toList!4469 lt!377861))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!465280 () Option!423)

(assert (=> d!107435 (= (getValueByKey!417 (toList!4469 lt!377861) #b0000000000000000000000000000000000000000000000000000000000000000) e!465280)))

(declare-fun b!834031 () Bool)

(declare-fun e!465281 () Option!423)

(assert (=> b!834031 (= e!465281 (getValueByKey!417 (t!22212 (toList!4469 lt!377861)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!834032 () Bool)

(assert (=> b!834032 (= e!465281 None!421)))

(declare-fun b!834030 () Bool)

(assert (=> b!834030 (= e!465280 e!465281)))

(declare-fun c!90985 () Bool)

(assert (=> b!834030 (= c!90985 (and ((_ is Cons!15848) (toList!4469 lt!377861)) (not (= (_1!5052 (h!16984 (toList!4469 lt!377861))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!834029 () Bool)

(assert (=> b!834029 (= e!465280 (Some!422 (_2!5052 (h!16984 (toList!4469 lt!377861)))))))

(assert (= (and d!107435 c!90984) b!834029))

(assert (= (and d!107435 (not c!90984)) b!834030))

(assert (= (and b!834030 c!90985) b!834031))

(assert (= (and b!834030 (not c!90985)) b!834032))

(declare-fun m!779121 () Bool)

(assert (=> b!834031 m!779121))

(assert (=> b!833202 d!107435))

(declare-fun d!107437 () Bool)

(declare-fun c!90986 () Bool)

(assert (=> d!107437 (= c!90986 (and ((_ is Cons!15848) (t!22212 (toList!4469 lt!377971))) (= (_1!5052 (h!16984 (t!22212 (toList!4469 lt!377971)))) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!465282 () Option!423)

(assert (=> d!107437 (= (getValueByKey!417 (t!22212 (toList!4469 lt!377971)) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!465282)))

(declare-fun b!834035 () Bool)

(declare-fun e!465283 () Option!423)

(assert (=> b!834035 (= e!465283 (getValueByKey!417 (t!22212 (t!22212 (toList!4469 lt!377971))) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!834036 () Bool)

(assert (=> b!834036 (= e!465283 None!421)))

(declare-fun b!834034 () Bool)

(assert (=> b!834034 (= e!465282 e!465283)))

(declare-fun c!90987 () Bool)

(assert (=> b!834034 (= c!90987 (and ((_ is Cons!15848) (t!22212 (toList!4469 lt!377971))) (not (= (_1!5052 (h!16984 (t!22212 (toList!4469 lt!377971)))) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun b!834033 () Bool)

(assert (=> b!834033 (= e!465282 (Some!422 (_2!5052 (h!16984 (t!22212 (toList!4469 lt!377971))))))))

(assert (= (and d!107437 c!90986) b!834033))

(assert (= (and d!107437 (not c!90986)) b!834034))

(assert (= (and b!834034 c!90987) b!834035))

(assert (= (and b!834034 (not c!90987)) b!834036))

(declare-fun m!779123 () Bool)

(assert (=> b!834035 m!779123))

(assert (=> b!833022 d!107437))

(declare-fun d!107439 () Bool)

(declare-fun c!90988 () Bool)

(assert (=> d!107439 (= c!90988 (and ((_ is Cons!15848) (toList!4469 lt!378217)) (= (_1!5052 (h!16984 (toList!4469 lt!378217))) (_1!5052 (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun e!465284 () Option!423)

(assert (=> d!107439 (= (getValueByKey!417 (toList!4469 lt!378217) (_1!5052 (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) e!465284)))

(declare-fun b!834039 () Bool)

(declare-fun e!465285 () Option!423)

(assert (=> b!834039 (= e!465285 (getValueByKey!417 (t!22212 (toList!4469 lt!378217)) (_1!5052 (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!834040 () Bool)

(assert (=> b!834040 (= e!465285 None!421)))

(declare-fun b!834038 () Bool)

(assert (=> b!834038 (= e!465284 e!465285)))

(declare-fun c!90989 () Bool)

(assert (=> b!834038 (= c!90989 (and ((_ is Cons!15848) (toList!4469 lt!378217)) (not (= (_1!5052 (h!16984 (toList!4469 lt!378217))) (_1!5052 (ite (or c!90642 c!90645) (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))))

(declare-fun b!834037 () Bool)

(assert (=> b!834037 (= e!465284 (Some!422 (_2!5052 (h!16984 (toList!4469 lt!378217)))))))

(assert (= (and d!107439 c!90988) b!834037))

(assert (= (and d!107439 (not c!90988)) b!834038))

(assert (= (and b!834038 c!90989) b!834039))

(assert (= (and b!834038 (not c!90989)) b!834040))

(declare-fun m!779125 () Bool)

(assert (=> b!834039 m!779125))

(assert (=> b!833322 d!107439))

(assert (=> b!833019 d!107251))

(assert (=> b!833019 d!107165))

(declare-fun d!107441 () Bool)

(declare-fun c!90990 () Bool)

(assert (=> d!107441 (= c!90990 (and ((_ is Cons!15848) (toList!4469 lt!378176)) (= (_1!5052 (h!16984 (toList!4469 lt!378176))) (_1!5052 (tuple2!10083 lt!377856 lt!377860)))))))

(declare-fun e!465286 () Option!423)

(assert (=> d!107441 (= (getValueByKey!417 (toList!4469 lt!378176) (_1!5052 (tuple2!10083 lt!377856 lt!377860))) e!465286)))

(declare-fun e!465287 () Option!423)

(declare-fun b!834043 () Bool)

(assert (=> b!834043 (= e!465287 (getValueByKey!417 (t!22212 (toList!4469 lt!378176)) (_1!5052 (tuple2!10083 lt!377856 lt!377860))))))

(declare-fun b!834044 () Bool)

(assert (=> b!834044 (= e!465287 None!421)))

(declare-fun b!834042 () Bool)

(assert (=> b!834042 (= e!465286 e!465287)))

(declare-fun c!90991 () Bool)

(assert (=> b!834042 (= c!90991 (and ((_ is Cons!15848) (toList!4469 lt!378176)) (not (= (_1!5052 (h!16984 (toList!4469 lt!378176))) (_1!5052 (tuple2!10083 lt!377856 lt!377860))))))))

(declare-fun b!834041 () Bool)

(assert (=> b!834041 (= e!465286 (Some!422 (_2!5052 (h!16984 (toList!4469 lt!378176)))))))

(assert (= (and d!107441 c!90990) b!834041))

(assert (= (and d!107441 (not c!90990)) b!834042))

(assert (= (and b!834042 c!90991) b!834043))

(assert (= (and b!834042 (not c!90991)) b!834044))

(declare-fun m!779127 () Bool)

(assert (=> b!834043 m!779127))

(assert (=> b!833263 d!107441))

(assert (=> d!106833 d!106835))

(declare-fun d!107443 () Bool)

(assert (=> d!107443 (arrayContainsKey!0 _keys!976 lt!377836 #b00000000000000000000000000000000)))

(assert (=> d!107443 true))

(declare-fun _$60!397 () Unit!28510)

(assert (=> d!107443 (= (choose!13 _keys!976 lt!377836 #b00000000000000000000000000000000) _$60!397)))

(declare-fun bs!23341 () Bool)

(assert (= bs!23341 d!107443))

(assert (=> bs!23341 m!777097))

(assert (=> d!106833 d!107443))

(declare-fun d!107445 () Bool)

(declare-fun e!465289 () Bool)

(assert (=> d!107445 e!465289))

(declare-fun res!566968 () Bool)

(assert (=> d!107445 (=> res!566968 e!465289)))

(declare-fun lt!378431 () Bool)

(assert (=> d!107445 (= res!566968 (not lt!378431))))

(declare-fun lt!378434 () Bool)

(assert (=> d!107445 (= lt!378431 lt!378434)))

(declare-fun lt!378432 () Unit!28510)

(declare-fun e!465288 () Unit!28510)

(assert (=> d!107445 (= lt!378432 e!465288)))

(declare-fun c!90992 () Bool)

(assert (=> d!107445 (= c!90992 lt!378434)))

(assert (=> d!107445 (= lt!378434 (containsKey!402 (toList!4469 lt!378143) (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!107445 (= (contains!4189 lt!378143 (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!378431)))

(declare-fun b!834045 () Bool)

(declare-fun lt!378433 () Unit!28510)

(assert (=> b!834045 (= e!465288 lt!378433)))

(assert (=> b!834045 (= lt!378433 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!378143) (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> b!834045 (isDefined!312 (getValueByKey!417 (toList!4469 lt!378143) (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!834046 () Bool)

(declare-fun Unit!28561 () Unit!28510)

(assert (=> b!834046 (= e!465288 Unit!28561)))

(declare-fun b!834047 () Bool)

(assert (=> b!834047 (= e!465289 (isDefined!312 (getValueByKey!417 (toList!4469 lt!378143) (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (= (and d!107445 c!90992) b!834045))

(assert (= (and d!107445 (not c!90992)) b!834046))

(assert (= (and d!107445 (not res!566968)) b!834047))

(declare-fun m!779129 () Bool)

(assert (=> d!107445 m!779129))

(declare-fun m!779131 () Bool)

(assert (=> b!834045 m!779131))

(assert (=> b!834045 m!777873))

(assert (=> b!834045 m!777873))

(declare-fun m!779133 () Bool)

(assert (=> b!834045 m!779133))

(assert (=> b!834047 m!777873))

(assert (=> b!834047 m!777873))

(assert (=> b!834047 m!779133))

(assert (=> d!106829 d!107445))

(declare-fun d!107447 () Bool)

(declare-fun c!90993 () Bool)

(assert (=> d!107447 (= c!90993 (and ((_ is Cons!15848) lt!378142) (= (_1!5052 (h!16984 lt!378142)) (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun e!465290 () Option!423)

(assert (=> d!107447 (= (getValueByKey!417 lt!378142 (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) e!465290)))

(declare-fun b!834050 () Bool)

(declare-fun e!465291 () Option!423)

(assert (=> b!834050 (= e!465291 (getValueByKey!417 (t!22212 lt!378142) (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!834051 () Bool)

(assert (=> b!834051 (= e!465291 None!421)))

(declare-fun b!834049 () Bool)

(assert (=> b!834049 (= e!465290 e!465291)))

(declare-fun c!90994 () Bool)

(assert (=> b!834049 (= c!90994 (and ((_ is Cons!15848) lt!378142) (not (= (_1!5052 (h!16984 lt!378142)) (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!834048 () Bool)

(assert (=> b!834048 (= e!465290 (Some!422 (_2!5052 (h!16984 lt!378142))))))

(assert (= (and d!107447 c!90993) b!834048))

(assert (= (and d!107447 (not c!90993)) b!834049))

(assert (= (and b!834049 c!90994) b!834050))

(assert (= (and b!834049 (not c!90994)) b!834051))

(declare-fun m!779135 () Bool)

(assert (=> b!834050 m!779135))

(assert (=> d!106829 d!107447))

(declare-fun d!107449 () Bool)

(assert (=> d!107449 (= (getValueByKey!417 lt!378142 (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!422 (_2!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!378435 () Unit!28510)

(assert (=> d!107449 (= lt!378435 (choose!1429 lt!378142 (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun e!465292 () Bool)

(assert (=> d!107449 e!465292))

(declare-fun res!566969 () Bool)

(assert (=> d!107449 (=> (not res!566969) (not e!465292))))

(assert (=> d!107449 (= res!566969 (isStrictlySorted!430 lt!378142))))

(assert (=> d!107449 (= (lemmaContainsTupThenGetReturnValue!231 lt!378142 (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!378435)))

(declare-fun b!834052 () Bool)

(declare-fun res!566970 () Bool)

(assert (=> b!834052 (=> (not res!566970) (not e!465292))))

(assert (=> b!834052 (= res!566970 (containsKey!402 lt!378142 (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!834053 () Bool)

(assert (=> b!834053 (= e!465292 (contains!4190 lt!378142 (tuple2!10083 (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (= (and d!107449 res!566969) b!834052))

(assert (= (and b!834052 res!566970) b!834053))

(assert (=> d!107449 m!777867))

(declare-fun m!779137 () Bool)

(assert (=> d!107449 m!779137))

(declare-fun m!779139 () Bool)

(assert (=> d!107449 m!779139))

(declare-fun m!779141 () Bool)

(assert (=> b!834052 m!779141))

(declare-fun m!779143 () Bool)

(assert (=> b!834053 m!779143))

(assert (=> d!106829 d!107449))

(declare-fun c!90995 () Bool)

(declare-fun e!465294 () List!15852)

(declare-fun bm!36519 () Bool)

(declare-fun call!36523 () List!15852)

(assert (=> bm!36519 (= call!36523 ($colon$colon!534 e!465294 (ite c!90995 (h!16984 (toList!4469 call!36441)) (tuple2!10083 (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun c!90998 () Bool)

(assert (=> bm!36519 (= c!90998 c!90995)))

(declare-fun bm!36520 () Bool)

(declare-fun call!36524 () List!15852)

(assert (=> bm!36520 (= call!36524 call!36523)))

(declare-fun bm!36521 () Bool)

(declare-fun call!36522 () List!15852)

(assert (=> bm!36521 (= call!36522 call!36524)))

(declare-fun b!834054 () Bool)

(declare-fun c!90996 () Bool)

(assert (=> b!834054 (= c!90996 (and ((_ is Cons!15848) (toList!4469 call!36441)) (bvsgt (_1!5052 (h!16984 (toList!4469 call!36441))) (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun e!465293 () List!15852)

(declare-fun e!465296 () List!15852)

(assert (=> b!834054 (= e!465293 e!465296)))

(declare-fun b!834055 () Bool)

(assert (=> b!834055 (= e!465296 call!36522)))

(declare-fun b!834056 () Bool)

(assert (=> b!834056 (= e!465294 (insertStrictlySorted!270 (t!22212 (toList!4469 call!36441)) (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!834057 () Bool)

(declare-fun e!465295 () List!15852)

(assert (=> b!834057 (= e!465295 call!36523)))

(declare-fun b!834058 () Bool)

(declare-fun e!465297 () Bool)

(declare-fun lt!378436 () List!15852)

(assert (=> b!834058 (= e!465297 (contains!4190 lt!378436 (tuple2!10083 (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!834059 () Bool)

(declare-fun c!90997 () Bool)

(assert (=> b!834059 (= e!465294 (ite c!90997 (t!22212 (toList!4469 call!36441)) (ite c!90996 (Cons!15848 (h!16984 (toList!4469 call!36441)) (t!22212 (toList!4469 call!36441))) Nil!15849)))))

(declare-fun b!834060 () Bool)

(assert (=> b!834060 (= e!465295 e!465293)))

(assert (=> b!834060 (= c!90997 (and ((_ is Cons!15848) (toList!4469 call!36441)) (= (_1!5052 (h!16984 (toList!4469 call!36441))) (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!834061 () Bool)

(assert (=> b!834061 (= e!465293 call!36524)))

(declare-fun b!834062 () Bool)

(declare-fun res!566972 () Bool)

(assert (=> b!834062 (=> (not res!566972) (not e!465297))))

(assert (=> b!834062 (= res!566972 (containsKey!402 lt!378436 (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun d!107451 () Bool)

(assert (=> d!107451 e!465297))

(declare-fun res!566971 () Bool)

(assert (=> d!107451 (=> (not res!566971) (not e!465297))))

(assert (=> d!107451 (= res!566971 (isStrictlySorted!430 lt!378436))))

(assert (=> d!107451 (= lt!378436 e!465295)))

(assert (=> d!107451 (= c!90995 (and ((_ is Cons!15848) (toList!4469 call!36441)) (bvslt (_1!5052 (h!16984 (toList!4469 call!36441))) (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!107451 (isStrictlySorted!430 (toList!4469 call!36441))))

(assert (=> d!107451 (= (insertStrictlySorted!270 (toList!4469 call!36441) (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!378436)))

(declare-fun b!834063 () Bool)

(assert (=> b!834063 (= e!465296 call!36522)))

(assert (= (and d!107451 c!90995) b!834057))

(assert (= (and d!107451 (not c!90995)) b!834060))

(assert (= (and b!834060 c!90997) b!834061))

(assert (= (and b!834060 (not c!90997)) b!834054))

(assert (= (and b!834054 c!90996) b!834055))

(assert (= (and b!834054 (not c!90996)) b!834063))

(assert (= (or b!834055 b!834063) bm!36521))

(assert (= (or b!834061 bm!36521) bm!36520))

(assert (= (or b!834057 bm!36520) bm!36519))

(assert (= (and bm!36519 c!90998) b!834056))

(assert (= (and bm!36519 (not c!90998)) b!834059))

(assert (= (and d!107451 res!566971) b!834062))

(assert (= (and b!834062 res!566972) b!834058))

(declare-fun m!779145 () Bool)

(assert (=> bm!36519 m!779145))

(declare-fun m!779147 () Bool)

(assert (=> b!834058 m!779147))

(declare-fun m!779149 () Bool)

(assert (=> b!834056 m!779149))

(declare-fun m!779151 () Bool)

(assert (=> b!834062 m!779151))

(declare-fun m!779153 () Bool)

(assert (=> d!107451 m!779153))

(declare-fun m!779155 () Bool)

(assert (=> d!107451 m!779155))

(assert (=> d!106829 d!107451))

(declare-fun d!107453 () Bool)

(declare-fun res!566973 () Bool)

(declare-fun e!465298 () Bool)

(assert (=> d!107453 (=> res!566973 e!465298)))

(assert (=> d!107453 (= res!566973 (and ((_ is Cons!15848) (toList!4469 lt!377827)) (= (_1!5052 (h!16984 (toList!4469 lt!377827))) (_1!5052 lt!377756))))))

(assert (=> d!107453 (= (containsKey!402 (toList!4469 lt!377827) (_1!5052 lt!377756)) e!465298)))

(declare-fun b!834064 () Bool)

(declare-fun e!465299 () Bool)

(assert (=> b!834064 (= e!465298 e!465299)))

(declare-fun res!566974 () Bool)

(assert (=> b!834064 (=> (not res!566974) (not e!465299))))

(assert (=> b!834064 (= res!566974 (and (or (not ((_ is Cons!15848) (toList!4469 lt!377827))) (bvsle (_1!5052 (h!16984 (toList!4469 lt!377827))) (_1!5052 lt!377756))) ((_ is Cons!15848) (toList!4469 lt!377827)) (bvslt (_1!5052 (h!16984 (toList!4469 lt!377827))) (_1!5052 lt!377756))))))

(declare-fun b!834065 () Bool)

(assert (=> b!834065 (= e!465299 (containsKey!402 (t!22212 (toList!4469 lt!377827)) (_1!5052 lt!377756)))))

(assert (= (and d!107453 (not res!566973)) b!834064))

(assert (= (and b!834064 res!566974) b!834065))

(declare-fun m!779157 () Bool)

(assert (=> b!834065 m!779157))

(assert (=> d!106807 d!107453))

(declare-fun d!107455 () Bool)

(declare-fun c!90999 () Bool)

(assert (=> d!107455 (= c!90999 ((_ is Nil!15849) (toList!4469 lt!377971)))))

(declare-fun e!465300 () (InoxSet tuple2!10082))

(assert (=> d!107455 (= (content!388 (toList!4469 lt!377971)) e!465300)))

(declare-fun b!834066 () Bool)

(assert (=> b!834066 (= e!465300 ((as const (Array tuple2!10082 Bool)) false))))

(declare-fun b!834067 () Bool)

(assert (=> b!834067 (= e!465300 ((_ map or) (store ((as const (Array tuple2!10082 Bool)) false) (h!16984 (toList!4469 lt!377971)) true) (content!388 (t!22212 (toList!4469 lt!377971)))))))

(assert (= (and d!107455 c!90999) b!834066))

(assert (= (and d!107455 (not c!90999)) b!834067))

(declare-fun m!779159 () Bool)

(assert (=> b!834067 m!779159))

(assert (=> b!834067 m!778571))

(assert (=> d!106839 d!107455))

(declare-fun d!107457 () Bool)

(assert (=> d!107457 (isDefined!312 (getValueByKey!417 (toList!4469 (+!1991 lt!377958 (tuple2!10083 lt!377957 zeroValueAfter!34))) lt!377948))))

(declare-fun lt!378437 () Unit!28510)

(assert (=> d!107457 (= lt!378437 (choose!1433 (toList!4469 (+!1991 lt!377958 (tuple2!10083 lt!377957 zeroValueAfter!34))) lt!377948))))

(declare-fun e!465301 () Bool)

(assert (=> d!107457 e!465301))

(declare-fun res!566975 () Bool)

(assert (=> d!107457 (=> (not res!566975) (not e!465301))))

(assert (=> d!107457 (= res!566975 (isStrictlySorted!430 (toList!4469 (+!1991 lt!377958 (tuple2!10083 lt!377957 zeroValueAfter!34)))))))

(assert (=> d!107457 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 (+!1991 lt!377958 (tuple2!10083 lt!377957 zeroValueAfter!34))) lt!377948) lt!378437)))

(declare-fun b!834068 () Bool)

(assert (=> b!834068 (= e!465301 (containsKey!402 (toList!4469 (+!1991 lt!377958 (tuple2!10083 lt!377957 zeroValueAfter!34))) lt!377948))))

(assert (= (and d!107457 res!566975) b!834068))

(assert (=> d!107457 m!777349))

(assert (=> d!107457 m!777349))

(assert (=> d!107457 m!777351))

(declare-fun m!779161 () Bool)

(assert (=> d!107457 m!779161))

(declare-fun m!779163 () Bool)

(assert (=> d!107457 m!779163))

(assert (=> b!834068 m!777345))

(assert (=> b!832983 d!107457))

(declare-fun d!107459 () Bool)

(assert (=> d!107459 (= (isDefined!312 (getValueByKey!417 (toList!4469 (+!1991 lt!377958 (tuple2!10083 lt!377957 zeroValueAfter!34))) lt!377948)) (not (isEmpty!665 (getValueByKey!417 (toList!4469 (+!1991 lt!377958 (tuple2!10083 lt!377957 zeroValueAfter!34))) lt!377948))))))

(declare-fun bs!23342 () Bool)

(assert (= bs!23342 d!107459))

(assert (=> bs!23342 m!777349))

(declare-fun m!779165 () Bool)

(assert (=> bs!23342 m!779165))

(assert (=> b!832983 d!107459))

(declare-fun c!91000 () Bool)

(declare-fun d!107461 () Bool)

(assert (=> d!107461 (= c!91000 (and ((_ is Cons!15848) (toList!4469 (+!1991 lt!377958 (tuple2!10083 lt!377957 zeroValueAfter!34)))) (= (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377958 (tuple2!10083 lt!377957 zeroValueAfter!34))))) lt!377948)))))

(declare-fun e!465302 () Option!423)

(assert (=> d!107461 (= (getValueByKey!417 (toList!4469 (+!1991 lt!377958 (tuple2!10083 lt!377957 zeroValueAfter!34))) lt!377948) e!465302)))

(declare-fun b!834071 () Bool)

(declare-fun e!465303 () Option!423)

(assert (=> b!834071 (= e!465303 (getValueByKey!417 (t!22212 (toList!4469 (+!1991 lt!377958 (tuple2!10083 lt!377957 zeroValueAfter!34)))) lt!377948))))

(declare-fun b!834072 () Bool)

(assert (=> b!834072 (= e!465303 None!421)))

(declare-fun b!834070 () Bool)

(assert (=> b!834070 (= e!465302 e!465303)))

(declare-fun c!91001 () Bool)

(assert (=> b!834070 (= c!91001 (and ((_ is Cons!15848) (toList!4469 (+!1991 lt!377958 (tuple2!10083 lt!377957 zeroValueAfter!34)))) (not (= (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377958 (tuple2!10083 lt!377957 zeroValueAfter!34))))) lt!377948))))))

(declare-fun b!834069 () Bool)

(assert (=> b!834069 (= e!465302 (Some!422 (_2!5052 (h!16984 (toList!4469 (+!1991 lt!377958 (tuple2!10083 lt!377957 zeroValueAfter!34)))))))))

(assert (= (and d!107461 c!91000) b!834069))

(assert (= (and d!107461 (not c!91000)) b!834070))

(assert (= (and b!834070 c!91001) b!834071))

(assert (= (and b!834070 (not c!91001)) b!834072))

(declare-fun m!779167 () Bool)

(assert (=> b!834071 m!779167))

(assert (=> b!832983 d!107461))

(declare-fun d!107463 () Bool)

(assert (=> d!107463 (= ($colon$colon!534 e!464818 (ite c!90768 (h!16984 (toList!4469 (+!1991 lt!377760 lt!377761))) (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756)))) (Cons!15848 (ite c!90768 (h!16984 (toList!4469 (+!1991 lt!377760 lt!377761))) (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))) e!464818))))

(assert (=> bm!36470 d!107463))

(declare-fun d!107465 () Bool)

(assert (=> d!107465 (= (get!11827 (getValueByKey!417 (toList!4469 (+!1991 lt!377934 (tuple2!10083 lt!377928 minValue!754))) lt!377937)) (v!10101 (getValueByKey!417 (toList!4469 (+!1991 lt!377934 (tuple2!10083 lt!377928 minValue!754))) lt!377937)))))

(assert (=> d!106727 d!107465))

(declare-fun c!91002 () Bool)

(declare-fun d!107467 () Bool)

(assert (=> d!107467 (= c!91002 (and ((_ is Cons!15848) (toList!4469 (+!1991 lt!377934 (tuple2!10083 lt!377928 minValue!754)))) (= (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377934 (tuple2!10083 lt!377928 minValue!754))))) lt!377937)))))

(declare-fun e!465304 () Option!423)

(assert (=> d!107467 (= (getValueByKey!417 (toList!4469 (+!1991 lt!377934 (tuple2!10083 lt!377928 minValue!754))) lt!377937) e!465304)))

(declare-fun b!834075 () Bool)

(declare-fun e!465305 () Option!423)

(assert (=> b!834075 (= e!465305 (getValueByKey!417 (t!22212 (toList!4469 (+!1991 lt!377934 (tuple2!10083 lt!377928 minValue!754)))) lt!377937))))

(declare-fun b!834076 () Bool)

(assert (=> b!834076 (= e!465305 None!421)))

(declare-fun b!834074 () Bool)

(assert (=> b!834074 (= e!465304 e!465305)))

(declare-fun c!91003 () Bool)

(assert (=> b!834074 (= c!91003 (and ((_ is Cons!15848) (toList!4469 (+!1991 lt!377934 (tuple2!10083 lt!377928 minValue!754)))) (not (= (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377934 (tuple2!10083 lt!377928 minValue!754))))) lt!377937))))))

(declare-fun b!834073 () Bool)

(assert (=> b!834073 (= e!465304 (Some!422 (_2!5052 (h!16984 (toList!4469 (+!1991 lt!377934 (tuple2!10083 lt!377928 minValue!754)))))))))

(assert (= (and d!107467 c!91002) b!834073))

(assert (= (and d!107467 (not c!91002)) b!834074))

(assert (= (and b!834074 c!91003) b!834075))

(assert (= (and b!834074 (not c!91003)) b!834076))

(declare-fun m!779169 () Bool)

(assert (=> b!834075 m!779169))

(assert (=> d!106727 d!107467))

(declare-fun d!107469 () Bool)

(declare-fun res!566976 () Bool)

(declare-fun e!465306 () Bool)

(assert (=> d!107469 (=> res!566976 e!465306)))

(assert (=> d!107469 (= res!566976 (and ((_ is Cons!15848) lt!378116) (= (_1!5052 (h!16984 lt!378116)) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!107469 (= (containsKey!402 lt!378116 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!465306)))

(declare-fun b!834077 () Bool)

(declare-fun e!465307 () Bool)

(assert (=> b!834077 (= e!465306 e!465307)))

(declare-fun res!566977 () Bool)

(assert (=> b!834077 (=> (not res!566977) (not e!465307))))

(assert (=> b!834077 (= res!566977 (and (or (not ((_ is Cons!15848) lt!378116)) (bvsle (_1!5052 (h!16984 lt!378116)) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) ((_ is Cons!15848) lt!378116) (bvslt (_1!5052 (h!16984 lt!378116)) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!834078 () Bool)

(assert (=> b!834078 (= e!465307 (containsKey!402 (t!22212 lt!378116) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and d!107469 (not res!566976)) b!834077))

(assert (= (and b!834077 res!566977) b!834078))

(declare-fun m!779171 () Bool)

(assert (=> b!834078 m!779171))

(assert (=> b!833149 d!107469))

(declare-fun d!107471 () Bool)

(declare-fun e!465309 () Bool)

(assert (=> d!107471 e!465309))

(declare-fun res!566978 () Bool)

(assert (=> d!107471 (=> res!566978 e!465309)))

(declare-fun lt!378438 () Bool)

(assert (=> d!107471 (= res!566978 (not lt!378438))))

(declare-fun lt!378441 () Bool)

(assert (=> d!107471 (= lt!378438 lt!378441)))

(declare-fun lt!378439 () Unit!28510)

(declare-fun e!465308 () Unit!28510)

(assert (=> d!107471 (= lt!378439 e!465308)))

(declare-fun c!91004 () Bool)

(assert (=> d!107471 (= c!91004 lt!378441)))

(assert (=> d!107471 (= lt!378441 (containsKey!402 (toList!4469 lt!378065) (_1!5052 (tuple2!10083 lt!377929 zeroValueBefore!34))))))

(assert (=> d!107471 (= (contains!4189 lt!378065 (_1!5052 (tuple2!10083 lt!377929 zeroValueBefore!34))) lt!378438)))

(declare-fun b!834079 () Bool)

(declare-fun lt!378440 () Unit!28510)

(assert (=> b!834079 (= e!465308 lt!378440)))

(assert (=> b!834079 (= lt!378440 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!378065) (_1!5052 (tuple2!10083 lt!377929 zeroValueBefore!34))))))

(assert (=> b!834079 (isDefined!312 (getValueByKey!417 (toList!4469 lt!378065) (_1!5052 (tuple2!10083 lt!377929 zeroValueBefore!34))))))

(declare-fun b!834080 () Bool)

(declare-fun Unit!28562 () Unit!28510)

(assert (=> b!834080 (= e!465308 Unit!28562)))

(declare-fun b!834081 () Bool)

(assert (=> b!834081 (= e!465309 (isDefined!312 (getValueByKey!417 (toList!4469 lt!378065) (_1!5052 (tuple2!10083 lt!377929 zeroValueBefore!34)))))))

(assert (= (and d!107471 c!91004) b!834079))

(assert (= (and d!107471 (not c!91004)) b!834080))

(assert (= (and d!107471 (not res!566978)) b!834081))

(declare-fun m!779173 () Bool)

(assert (=> d!107471 m!779173))

(declare-fun m!779175 () Bool)

(assert (=> b!834079 m!779175))

(assert (=> b!834079 m!777585))

(assert (=> b!834079 m!777585))

(declare-fun m!779177 () Bool)

(assert (=> b!834079 m!779177))

(assert (=> b!834081 m!777585))

(assert (=> b!834081 m!777585))

(assert (=> b!834081 m!779177))

(assert (=> d!106741 d!107471))

(declare-fun d!107473 () Bool)

(declare-fun c!91005 () Bool)

(assert (=> d!107473 (= c!91005 (and ((_ is Cons!15848) lt!378064) (= (_1!5052 (h!16984 lt!378064)) (_1!5052 (tuple2!10083 lt!377929 zeroValueBefore!34)))))))

(declare-fun e!465310 () Option!423)

(assert (=> d!107473 (= (getValueByKey!417 lt!378064 (_1!5052 (tuple2!10083 lt!377929 zeroValueBefore!34))) e!465310)))

(declare-fun b!834084 () Bool)

(declare-fun e!465311 () Option!423)

(assert (=> b!834084 (= e!465311 (getValueByKey!417 (t!22212 lt!378064) (_1!5052 (tuple2!10083 lt!377929 zeroValueBefore!34))))))

(declare-fun b!834085 () Bool)

(assert (=> b!834085 (= e!465311 None!421)))

(declare-fun b!834083 () Bool)

(assert (=> b!834083 (= e!465310 e!465311)))

(declare-fun c!91006 () Bool)

(assert (=> b!834083 (= c!91006 (and ((_ is Cons!15848) lt!378064) (not (= (_1!5052 (h!16984 lt!378064)) (_1!5052 (tuple2!10083 lt!377929 zeroValueBefore!34))))))))

(declare-fun b!834082 () Bool)

(assert (=> b!834082 (= e!465310 (Some!422 (_2!5052 (h!16984 lt!378064))))))

(assert (= (and d!107473 c!91005) b!834082))

(assert (= (and d!107473 (not c!91005)) b!834083))

(assert (= (and b!834083 c!91006) b!834084))

(assert (= (and b!834083 (not c!91006)) b!834085))

(declare-fun m!779179 () Bool)

(assert (=> b!834084 m!779179))

(assert (=> d!106741 d!107473))

(declare-fun d!107475 () Bool)

(assert (=> d!107475 (= (getValueByKey!417 lt!378064 (_1!5052 (tuple2!10083 lt!377929 zeroValueBefore!34))) (Some!422 (_2!5052 (tuple2!10083 lt!377929 zeroValueBefore!34))))))

(declare-fun lt!378442 () Unit!28510)

(assert (=> d!107475 (= lt!378442 (choose!1429 lt!378064 (_1!5052 (tuple2!10083 lt!377929 zeroValueBefore!34)) (_2!5052 (tuple2!10083 lt!377929 zeroValueBefore!34))))))

(declare-fun e!465312 () Bool)

(assert (=> d!107475 e!465312))

(declare-fun res!566979 () Bool)

(assert (=> d!107475 (=> (not res!566979) (not e!465312))))

(assert (=> d!107475 (= res!566979 (isStrictlySorted!430 lt!378064))))

(assert (=> d!107475 (= (lemmaContainsTupThenGetReturnValue!231 lt!378064 (_1!5052 (tuple2!10083 lt!377929 zeroValueBefore!34)) (_2!5052 (tuple2!10083 lt!377929 zeroValueBefore!34))) lt!378442)))

(declare-fun b!834086 () Bool)

(declare-fun res!566980 () Bool)

(assert (=> b!834086 (=> (not res!566980) (not e!465312))))

(assert (=> b!834086 (= res!566980 (containsKey!402 lt!378064 (_1!5052 (tuple2!10083 lt!377929 zeroValueBefore!34))))))

(declare-fun b!834087 () Bool)

(assert (=> b!834087 (= e!465312 (contains!4190 lt!378064 (tuple2!10083 (_1!5052 (tuple2!10083 lt!377929 zeroValueBefore!34)) (_2!5052 (tuple2!10083 lt!377929 zeroValueBefore!34)))))))

(assert (= (and d!107475 res!566979) b!834086))

(assert (= (and b!834086 res!566980) b!834087))

(assert (=> d!107475 m!777579))

(declare-fun m!779181 () Bool)

(assert (=> d!107475 m!779181))

(declare-fun m!779183 () Bool)

(assert (=> d!107475 m!779183))

(declare-fun m!779185 () Bool)

(assert (=> b!834086 m!779185))

(declare-fun m!779187 () Bool)

(assert (=> b!834087 m!779187))

(assert (=> d!106741 d!107475))

(declare-fun bm!36522 () Bool)

(declare-fun c!91007 () Bool)

(declare-fun e!465314 () List!15852)

(declare-fun call!36526 () List!15852)

(assert (=> bm!36522 (= call!36526 ($colon$colon!534 e!465314 (ite c!91007 (h!16984 (toList!4469 lt!377923)) (tuple2!10083 (_1!5052 (tuple2!10083 lt!377929 zeroValueBefore!34)) (_2!5052 (tuple2!10083 lt!377929 zeroValueBefore!34))))))))

(declare-fun c!91010 () Bool)

(assert (=> bm!36522 (= c!91010 c!91007)))

(declare-fun bm!36523 () Bool)

(declare-fun call!36527 () List!15852)

(assert (=> bm!36523 (= call!36527 call!36526)))

(declare-fun bm!36524 () Bool)

(declare-fun call!36525 () List!15852)

(assert (=> bm!36524 (= call!36525 call!36527)))

(declare-fun c!91008 () Bool)

(declare-fun b!834088 () Bool)

(assert (=> b!834088 (= c!91008 (and ((_ is Cons!15848) (toList!4469 lt!377923)) (bvsgt (_1!5052 (h!16984 (toList!4469 lt!377923))) (_1!5052 (tuple2!10083 lt!377929 zeroValueBefore!34)))))))

(declare-fun e!465313 () List!15852)

(declare-fun e!465316 () List!15852)

(assert (=> b!834088 (= e!465313 e!465316)))

(declare-fun b!834089 () Bool)

(assert (=> b!834089 (= e!465316 call!36525)))

(declare-fun b!834090 () Bool)

(assert (=> b!834090 (= e!465314 (insertStrictlySorted!270 (t!22212 (toList!4469 lt!377923)) (_1!5052 (tuple2!10083 lt!377929 zeroValueBefore!34)) (_2!5052 (tuple2!10083 lt!377929 zeroValueBefore!34))))))

(declare-fun b!834091 () Bool)

(declare-fun e!465315 () List!15852)

(assert (=> b!834091 (= e!465315 call!36526)))

(declare-fun b!834092 () Bool)

(declare-fun lt!378443 () List!15852)

(declare-fun e!465317 () Bool)

(assert (=> b!834092 (= e!465317 (contains!4190 lt!378443 (tuple2!10083 (_1!5052 (tuple2!10083 lt!377929 zeroValueBefore!34)) (_2!5052 (tuple2!10083 lt!377929 zeroValueBefore!34)))))))

(declare-fun c!91009 () Bool)

(declare-fun b!834093 () Bool)

(assert (=> b!834093 (= e!465314 (ite c!91009 (t!22212 (toList!4469 lt!377923)) (ite c!91008 (Cons!15848 (h!16984 (toList!4469 lt!377923)) (t!22212 (toList!4469 lt!377923))) Nil!15849)))))

(declare-fun b!834094 () Bool)

(assert (=> b!834094 (= e!465315 e!465313)))

(assert (=> b!834094 (= c!91009 (and ((_ is Cons!15848) (toList!4469 lt!377923)) (= (_1!5052 (h!16984 (toList!4469 lt!377923))) (_1!5052 (tuple2!10083 lt!377929 zeroValueBefore!34)))))))

(declare-fun b!834095 () Bool)

(assert (=> b!834095 (= e!465313 call!36527)))

(declare-fun b!834096 () Bool)

(declare-fun res!566982 () Bool)

(assert (=> b!834096 (=> (not res!566982) (not e!465317))))

(assert (=> b!834096 (= res!566982 (containsKey!402 lt!378443 (_1!5052 (tuple2!10083 lt!377929 zeroValueBefore!34))))))

(declare-fun d!107477 () Bool)

(assert (=> d!107477 e!465317))

(declare-fun res!566981 () Bool)

(assert (=> d!107477 (=> (not res!566981) (not e!465317))))

(assert (=> d!107477 (= res!566981 (isStrictlySorted!430 lt!378443))))

(assert (=> d!107477 (= lt!378443 e!465315)))

(assert (=> d!107477 (= c!91007 (and ((_ is Cons!15848) (toList!4469 lt!377923)) (bvslt (_1!5052 (h!16984 (toList!4469 lt!377923))) (_1!5052 (tuple2!10083 lt!377929 zeroValueBefore!34)))))))

(assert (=> d!107477 (isStrictlySorted!430 (toList!4469 lt!377923))))

(assert (=> d!107477 (= (insertStrictlySorted!270 (toList!4469 lt!377923) (_1!5052 (tuple2!10083 lt!377929 zeroValueBefore!34)) (_2!5052 (tuple2!10083 lt!377929 zeroValueBefore!34))) lt!378443)))

(declare-fun b!834097 () Bool)

(assert (=> b!834097 (= e!465316 call!36525)))

(assert (= (and d!107477 c!91007) b!834091))

(assert (= (and d!107477 (not c!91007)) b!834094))

(assert (= (and b!834094 c!91009) b!834095))

(assert (= (and b!834094 (not c!91009)) b!834088))

(assert (= (and b!834088 c!91008) b!834089))

(assert (= (and b!834088 (not c!91008)) b!834097))

(assert (= (or b!834089 b!834097) bm!36524))

(assert (= (or b!834095 bm!36524) bm!36523))

(assert (= (or b!834091 bm!36523) bm!36522))

(assert (= (and bm!36522 c!91010) b!834090))

(assert (= (and bm!36522 (not c!91010)) b!834093))

(assert (= (and d!107477 res!566981) b!834096))

(assert (= (and b!834096 res!566982) b!834092))

(declare-fun m!779189 () Bool)

(assert (=> bm!36522 m!779189))

(declare-fun m!779191 () Bool)

(assert (=> b!834092 m!779191))

(declare-fun m!779193 () Bool)

(assert (=> b!834090 m!779193))

(declare-fun m!779195 () Bool)

(assert (=> b!834096 m!779195))

(declare-fun m!779197 () Bool)

(assert (=> d!107477 m!779197))

(declare-fun m!779199 () Bool)

(assert (=> d!107477 m!779199))

(assert (=> d!106741 d!107477))

(declare-fun d!107479 () Bool)

(declare-fun res!566983 () Bool)

(declare-fun e!465318 () Bool)

(assert (=> d!107479 (=> res!566983 e!465318)))

(assert (=> d!107479 (= res!566983 (and ((_ is Cons!15848) (toList!4469 lt!377861)) (= (_1!5052 (h!16984 (toList!4469 lt!377861))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107479 (= (containsKey!402 (toList!4469 lt!377861) #b0000000000000000000000000000000000000000000000000000000000000000) e!465318)))

(declare-fun b!834098 () Bool)

(declare-fun e!465319 () Bool)

(assert (=> b!834098 (= e!465318 e!465319)))

(declare-fun res!566984 () Bool)

(assert (=> b!834098 (=> (not res!566984) (not e!465319))))

(assert (=> b!834098 (= res!566984 (and (or (not ((_ is Cons!15848) (toList!4469 lt!377861))) (bvsle (_1!5052 (h!16984 (toList!4469 lt!377861))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15848) (toList!4469 lt!377861)) (bvslt (_1!5052 (h!16984 (toList!4469 lt!377861))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!834099 () Bool)

(assert (=> b!834099 (= e!465319 (containsKey!402 (t!22212 (toList!4469 lt!377861)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!107479 (not res!566983)) b!834098))

(assert (= (and b!834098 res!566984) b!834099))

(declare-fun m!779201 () Bool)

(assert (=> b!834099 m!779201))

(assert (=> d!106823 d!107479))

(assert (=> bm!36449 d!107175))

(declare-fun d!107481 () Bool)

(declare-fun res!566985 () Bool)

(declare-fun e!465320 () Bool)

(assert (=> d!107481 (=> res!566985 e!465320)))

(assert (=> d!107481 (= res!566985 (or ((_ is Nil!15849) lt!377989) ((_ is Nil!15849) (t!22212 lt!377989))))))

(assert (=> d!107481 (= (isStrictlySorted!430 lt!377989) e!465320)))

(declare-fun b!834100 () Bool)

(declare-fun e!465321 () Bool)

(assert (=> b!834100 (= e!465320 e!465321)))

(declare-fun res!566986 () Bool)

(assert (=> b!834100 (=> (not res!566986) (not e!465321))))

(assert (=> b!834100 (= res!566986 (bvslt (_1!5052 (h!16984 lt!377989)) (_1!5052 (h!16984 (t!22212 lt!377989)))))))

(declare-fun b!834101 () Bool)

(assert (=> b!834101 (= e!465321 (isStrictlySorted!430 (t!22212 lt!377989)))))

(assert (= (and d!107481 (not res!566985)) b!834100))

(assert (= (and b!834100 res!566986) b!834101))

(declare-fun m!779203 () Bool)

(assert (=> b!834101 m!779203))

(assert (=> d!106659 d!107481))

(declare-fun d!107483 () Bool)

(declare-fun res!566987 () Bool)

(declare-fun e!465322 () Bool)

(assert (=> d!107483 (=> res!566987 e!465322)))

(assert (=> d!107483 (= res!566987 (or ((_ is Nil!15849) (toList!4469 (+!1991 lt!377759 lt!377756))) ((_ is Nil!15849) (t!22212 (toList!4469 (+!1991 lt!377759 lt!377756))))))))

(assert (=> d!107483 (= (isStrictlySorted!430 (toList!4469 (+!1991 lt!377759 lt!377756))) e!465322)))

(declare-fun b!834102 () Bool)

(declare-fun e!465323 () Bool)

(assert (=> b!834102 (= e!465322 e!465323)))

(declare-fun res!566988 () Bool)

(assert (=> b!834102 (=> (not res!566988) (not e!465323))))

(assert (=> b!834102 (= res!566988 (bvslt (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377759 lt!377756)))) (_1!5052 (h!16984 (t!22212 (toList!4469 (+!1991 lt!377759 lt!377756)))))))))

(declare-fun b!834103 () Bool)

(assert (=> b!834103 (= e!465323 (isStrictlySorted!430 (t!22212 (toList!4469 (+!1991 lt!377759 lt!377756)))))))

(assert (= (and d!107483 (not res!566987)) b!834102))

(assert (= (and b!834102 res!566988) b!834103))

(assert (=> b!834103 m!778763))

(assert (=> d!106659 d!107483))

(declare-fun d!107485 () Bool)

(declare-fun res!566989 () Bool)

(declare-fun e!465324 () Bool)

(assert (=> d!107485 (=> res!566989 e!465324)))

(assert (=> d!107485 (= res!566989 (or ((_ is Nil!15849) lt!378135) ((_ is Nil!15849) (t!22212 lt!378135))))))

(assert (=> d!107485 (= (isStrictlySorted!430 lt!378135) e!465324)))

(declare-fun b!834104 () Bool)

(declare-fun e!465325 () Bool)

(assert (=> b!834104 (= e!465324 e!465325)))

(declare-fun res!566990 () Bool)

(assert (=> b!834104 (=> (not res!566990) (not e!465325))))

(assert (=> b!834104 (= res!566990 (bvslt (_1!5052 (h!16984 lt!378135)) (_1!5052 (h!16984 (t!22212 lt!378135)))))))

(declare-fun b!834105 () Bool)

(assert (=> b!834105 (= e!465325 (isStrictlySorted!430 (t!22212 lt!378135)))))

(assert (= (and d!107485 (not res!566989)) b!834104))

(assert (= (and b!834104 res!566990) b!834105))

(declare-fun m!779205 () Bool)

(assert (=> b!834105 m!779205))

(assert (=> d!106821 d!107485))

(declare-fun d!107487 () Bool)

(declare-fun res!566991 () Bool)

(declare-fun e!465326 () Bool)

(assert (=> d!107487 (=> res!566991 e!465326)))

(assert (=> d!107487 (= res!566991 (or ((_ is Nil!15849) (toList!4469 (+!1991 lt!377760 lt!377756))) ((_ is Nil!15849) (t!22212 (toList!4469 (+!1991 lt!377760 lt!377756))))))))

(assert (=> d!107487 (= (isStrictlySorted!430 (toList!4469 (+!1991 lt!377760 lt!377756))) e!465326)))

(declare-fun b!834106 () Bool)

(declare-fun e!465327 () Bool)

(assert (=> b!834106 (= e!465326 e!465327)))

(declare-fun res!566992 () Bool)

(assert (=> b!834106 (=> (not res!566992) (not e!465327))))

(assert (=> b!834106 (= res!566992 (bvslt (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377760 lt!377756)))) (_1!5052 (h!16984 (t!22212 (toList!4469 (+!1991 lt!377760 lt!377756)))))))))

(declare-fun b!834107 () Bool)

(assert (=> b!834107 (= e!465327 (isStrictlySorted!430 (t!22212 (toList!4469 (+!1991 lt!377760 lt!377756)))))))

(assert (= (and d!107487 (not res!566991)) b!834106))

(assert (= (and b!834106 res!566992) b!834107))

(assert (=> b!834107 m!778465))

(assert (=> d!106821 d!107487))

(declare-fun d!107489 () Bool)

(declare-fun lt!378444 () Bool)

(assert (=> d!107489 (= lt!378444 (select (content!388 lt!377989) (tuple2!10083 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!465329 () Bool)

(assert (=> d!107489 (= lt!378444 e!465329)))

(declare-fun res!566994 () Bool)

(assert (=> d!107489 (=> (not res!566994) (not e!465329))))

(assert (=> d!107489 (= res!566994 ((_ is Cons!15848) lt!377989))))

(assert (=> d!107489 (= (contains!4190 lt!377989 (tuple2!10083 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) lt!378444)))

(declare-fun b!834108 () Bool)

(declare-fun e!465328 () Bool)

(assert (=> b!834108 (= e!465329 e!465328)))

(declare-fun res!566993 () Bool)

(assert (=> b!834108 (=> res!566993 e!465328)))

(assert (=> b!834108 (= res!566993 (= (h!16984 lt!377989) (tuple2!10083 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!834109 () Bool)

(assert (=> b!834109 (= e!465328 (contains!4190 (t!22212 lt!377989) (tuple2!10083 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (= (and d!107489 res!566994) b!834108))

(assert (= (and b!834108 (not res!566993)) b!834109))

(declare-fun m!779207 () Bool)

(assert (=> d!107489 m!779207))

(declare-fun m!779209 () Bool)

(assert (=> d!107489 m!779209))

(declare-fun m!779211 () Bool)

(assert (=> b!834109 m!779211))

(assert (=> b!832969 d!107489))

(declare-fun e!465331 () List!15852)

(declare-fun call!36529 () List!15852)

(declare-fun c!91011 () Bool)

(declare-fun bm!36525 () Bool)

(assert (=> bm!36525 (= call!36529 ($colon$colon!534 e!465331 (ite c!91011 (h!16984 (t!22212 (toList!4469 (+!1991 lt!377759 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756)))))))

(declare-fun c!91014 () Bool)

(assert (=> bm!36525 (= c!91014 c!91011)))

(declare-fun bm!36526 () Bool)

(declare-fun call!36530 () List!15852)

(assert (=> bm!36526 (= call!36530 call!36529)))

(declare-fun bm!36527 () Bool)

(declare-fun call!36528 () List!15852)

(assert (=> bm!36527 (= call!36528 call!36530)))

(declare-fun c!91012 () Bool)

(declare-fun b!834110 () Bool)

(assert (=> b!834110 (= c!91012 (and ((_ is Cons!15848) (t!22212 (toList!4469 (+!1991 lt!377759 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (bvsgt (_1!5052 (h!16984 (t!22212 (toList!4469 (+!1991 lt!377759 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))) (_1!5052 lt!377756))))))

(declare-fun e!465330 () List!15852)

(declare-fun e!465333 () List!15852)

(assert (=> b!834110 (= e!465330 e!465333)))

(declare-fun b!834111 () Bool)

(assert (=> b!834111 (= e!465333 call!36528)))

(declare-fun b!834112 () Bool)

(assert (=> b!834112 (= e!465331 (insertStrictlySorted!270 (t!22212 (t!22212 (toList!4469 (+!1991 lt!377759 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (_1!5052 lt!377756) (_2!5052 lt!377756)))))

(declare-fun b!834113 () Bool)

(declare-fun e!465332 () List!15852)

(assert (=> b!834113 (= e!465332 call!36529)))

(declare-fun b!834114 () Bool)

(declare-fun e!465334 () Bool)

(declare-fun lt!378445 () List!15852)

(assert (=> b!834114 (= e!465334 (contains!4190 lt!378445 (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))))))

(declare-fun c!91013 () Bool)

(declare-fun b!834115 () Bool)

(assert (=> b!834115 (= e!465331 (ite c!91013 (t!22212 (t!22212 (toList!4469 (+!1991 lt!377759 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (ite c!91012 (Cons!15848 (h!16984 (t!22212 (toList!4469 (+!1991 lt!377759 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (t!22212 (t!22212 (toList!4469 (+!1991 lt!377759 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))) Nil!15849)))))

(declare-fun b!834116 () Bool)

(assert (=> b!834116 (= e!465332 e!465330)))

(assert (=> b!834116 (= c!91013 (and ((_ is Cons!15848) (t!22212 (toList!4469 (+!1991 lt!377759 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (= (_1!5052 (h!16984 (t!22212 (toList!4469 (+!1991 lt!377759 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))) (_1!5052 lt!377756))))))

(declare-fun b!834117 () Bool)

(assert (=> b!834117 (= e!465330 call!36530)))

(declare-fun b!834118 () Bool)

(declare-fun res!566996 () Bool)

(assert (=> b!834118 (=> (not res!566996) (not e!465334))))

(assert (=> b!834118 (= res!566996 (containsKey!402 lt!378445 (_1!5052 lt!377756)))))

(declare-fun d!107491 () Bool)

(assert (=> d!107491 e!465334))

(declare-fun res!566995 () Bool)

(assert (=> d!107491 (=> (not res!566995) (not e!465334))))

(assert (=> d!107491 (= res!566995 (isStrictlySorted!430 lt!378445))))

(assert (=> d!107491 (= lt!378445 e!465332)))

(assert (=> d!107491 (= c!91011 (and ((_ is Cons!15848) (t!22212 (toList!4469 (+!1991 lt!377759 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (bvslt (_1!5052 (h!16984 (t!22212 (toList!4469 (+!1991 lt!377759 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))) (_1!5052 lt!377756))))))

(assert (=> d!107491 (isStrictlySorted!430 (t!22212 (toList!4469 (+!1991 lt!377759 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!107491 (= (insertStrictlySorted!270 (t!22212 (toList!4469 (+!1991 lt!377759 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (_1!5052 lt!377756) (_2!5052 lt!377756)) lt!378445)))

(declare-fun b!834119 () Bool)

(assert (=> b!834119 (= e!465333 call!36528)))

(assert (= (and d!107491 c!91011) b!834113))

(assert (= (and d!107491 (not c!91011)) b!834116))

(assert (= (and b!834116 c!91013) b!834117))

(assert (= (and b!834116 (not c!91013)) b!834110))

(assert (= (and b!834110 c!91012) b!834111))

(assert (= (and b!834110 (not c!91012)) b!834119))

(assert (= (or b!834111 b!834119) bm!36527))

(assert (= (or b!834117 bm!36527) bm!36526))

(assert (= (or b!834113 bm!36526) bm!36525))

(assert (= (and bm!36525 c!91014) b!834112))

(assert (= (and bm!36525 (not c!91014)) b!834115))

(assert (= (and d!107491 res!566995) b!834118))

(assert (= (and b!834118 res!566996) b!834114))

(declare-fun m!779213 () Bool)

(assert (=> bm!36525 m!779213))

(declare-fun m!779215 () Bool)

(assert (=> b!834114 m!779215))

(declare-fun m!779217 () Bool)

(assert (=> b!834112 m!779217))

(declare-fun m!779219 () Bool)

(assert (=> b!834118 m!779219))

(declare-fun m!779221 () Bool)

(assert (=> d!107491 m!779221))

(assert (=> d!107491 m!778483))

(assert (=> b!833295 d!107491))

(declare-fun d!107493 () Bool)

(declare-fun c!91015 () Bool)

(assert (=> d!107493 (= c!91015 ((_ is Nil!15849) (toList!4469 lt!377815)))))

(declare-fun e!465335 () (InoxSet tuple2!10082))

(assert (=> d!107493 (= (content!388 (toList!4469 lt!377815)) e!465335)))

(declare-fun b!834120 () Bool)

(assert (=> b!834120 (= e!465335 ((as const (Array tuple2!10082 Bool)) false))))

(declare-fun b!834121 () Bool)

(assert (=> b!834121 (= e!465335 ((_ map or) (store ((as const (Array tuple2!10082 Bool)) false) (h!16984 (toList!4469 lt!377815)) true) (content!388 (t!22212 (toList!4469 lt!377815)))))))

(assert (= (and d!107493 c!91015) b!834120))

(assert (= (and d!107493 (not c!91015)) b!834121))

(declare-fun m!779223 () Bool)

(assert (=> b!834121 m!779223))

(assert (=> b!834121 m!778667))

(assert (=> d!106717 d!107493))

(declare-fun d!107495 () Bool)

(declare-fun c!91016 () Bool)

(assert (=> d!107495 (= c!91016 (and ((_ is Cons!15848) (t!22212 lt!377814)) (= (_1!5052 (h!16984 (t!22212 lt!377814))) (_1!5052 lt!377756))))))

(declare-fun e!465336 () Option!423)

(assert (=> d!107495 (= (getValueByKey!417 (t!22212 lt!377814) (_1!5052 lt!377756)) e!465336)))

(declare-fun b!834124 () Bool)

(declare-fun e!465337 () Option!423)

(assert (=> b!834124 (= e!465337 (getValueByKey!417 (t!22212 (t!22212 lt!377814)) (_1!5052 lt!377756)))))

(declare-fun b!834125 () Bool)

(assert (=> b!834125 (= e!465337 None!421)))

(declare-fun b!834123 () Bool)

(assert (=> b!834123 (= e!465336 e!465337)))

(declare-fun c!91017 () Bool)

(assert (=> b!834123 (= c!91017 (and ((_ is Cons!15848) (t!22212 lt!377814)) (not (= (_1!5052 (h!16984 (t!22212 lt!377814))) (_1!5052 lt!377756)))))))

(declare-fun b!834122 () Bool)

(assert (=> b!834122 (= e!465336 (Some!422 (_2!5052 (h!16984 (t!22212 lt!377814)))))))

(assert (= (and d!107495 c!91016) b!834122))

(assert (= (and d!107495 (not c!91016)) b!834123))

(assert (= (and b!834123 c!91017) b!834124))

(assert (= (and b!834123 (not c!91017)) b!834125))

(declare-fun m!779225 () Bool)

(assert (=> b!834124 m!779225))

(assert (=> b!833289 d!107495))

(declare-fun d!107497 () Bool)

(declare-fun c!91018 () Bool)

(assert (=> d!107497 (= c!91018 (and ((_ is Cons!15848) (toList!4469 lt!378143)) (= (_1!5052 (h!16984 (toList!4469 lt!378143))) (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun e!465338 () Option!423)

(assert (=> d!107497 (= (getValueByKey!417 (toList!4469 lt!378143) (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) e!465338)))

(declare-fun b!834128 () Bool)

(declare-fun e!465339 () Option!423)

(assert (=> b!834128 (= e!465339 (getValueByKey!417 (t!22212 (toList!4469 lt!378143)) (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!834129 () Bool)

(assert (=> b!834129 (= e!465339 None!421)))

(declare-fun b!834127 () Bool)

(assert (=> b!834127 (= e!465338 e!465339)))

(declare-fun c!91019 () Bool)

(assert (=> b!834127 (= c!91019 (and ((_ is Cons!15848) (toList!4469 lt!378143)) (not (= (_1!5052 (h!16984 (toList!4469 lt!378143))) (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!834126 () Bool)

(assert (=> b!834126 (= e!465338 (Some!422 (_2!5052 (h!16984 (toList!4469 lt!378143)))))))

(assert (= (and d!107497 c!91018) b!834126))

(assert (= (and d!107497 (not c!91018)) b!834127))

(assert (= (and b!834127 c!91019) b!834128))

(assert (= (and b!834127 (not c!91019)) b!834129))

(declare-fun m!779227 () Bool)

(assert (=> b!834128 m!779227))

(assert (=> b!833205 d!107497))

(declare-fun d!107499 () Bool)

(declare-fun res!566997 () Bool)

(declare-fun e!465340 () Bool)

(assert (=> d!107499 (=> res!566997 e!465340)))

(assert (=> d!107499 (= res!566997 (and ((_ is Cons!15848) lt!377989) (= (_1!5052 (h!16984 lt!377989)) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!107499 (= (containsKey!402 lt!377989 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!465340)))

(declare-fun b!834130 () Bool)

(declare-fun e!465341 () Bool)

(assert (=> b!834130 (= e!465340 e!465341)))

(declare-fun res!566998 () Bool)

(assert (=> b!834130 (=> (not res!566998) (not e!465341))))

(assert (=> b!834130 (= res!566998 (and (or (not ((_ is Cons!15848) lt!377989)) (bvsle (_1!5052 (h!16984 lt!377989)) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) ((_ is Cons!15848) lt!377989) (bvslt (_1!5052 (h!16984 lt!377989)) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!834131 () Bool)

(assert (=> b!834131 (= e!465341 (containsKey!402 (t!22212 lt!377989) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and d!107499 (not res!566997)) b!834130))

(assert (= (and b!834130 res!566998) b!834131))

(declare-fun m!779229 () Bool)

(assert (=> b!834131 m!779229))

(assert (=> b!832973 d!107499))

(declare-fun d!107501 () Bool)

(declare-fun res!566999 () Bool)

(declare-fun e!465342 () Bool)

(assert (=> d!107501 (=> res!566999 e!465342)))

(assert (=> d!107501 (= res!566999 (and ((_ is Cons!15848) (toList!4469 lt!377854)) (= (_1!5052 (h!16984 (toList!4469 lt!377854))) (select (arr!22331 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!107501 (= (containsKey!402 (toList!4469 lt!377854) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)) e!465342)))

(declare-fun b!834132 () Bool)

(declare-fun e!465343 () Bool)

(assert (=> b!834132 (= e!465342 e!465343)))

(declare-fun res!567000 () Bool)

(assert (=> b!834132 (=> (not res!567000) (not e!465343))))

(assert (=> b!834132 (= res!567000 (and (or (not ((_ is Cons!15848) (toList!4469 lt!377854))) (bvsle (_1!5052 (h!16984 (toList!4469 lt!377854))) (select (arr!22331 _keys!976) #b00000000000000000000000000000000))) ((_ is Cons!15848) (toList!4469 lt!377854)) (bvslt (_1!5052 (h!16984 (toList!4469 lt!377854))) (select (arr!22331 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun b!834133 () Bool)

(assert (=> b!834133 (= e!465343 (containsKey!402 (t!22212 (toList!4469 lt!377854)) (select (arr!22331 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!107501 (not res!566999)) b!834132))

(assert (= (and b!834132 res!567000) b!834133))

(assert (=> b!834133 m!777093))

(declare-fun m!779231 () Bool)

(assert (=> b!834133 m!779231))

(assert (=> d!106703 d!107501))

(assert (=> b!833105 d!107291))

(assert (=> b!833105 d!106805))

(declare-fun d!107503 () Bool)

(declare-fun c!91020 () Bool)

(assert (=> d!107503 (= c!91020 (and ((_ is Cons!15848) (t!22212 lt!377822)) (= (_1!5052 (h!16984 (t!22212 lt!377822))) (_1!5052 lt!377761))))))

(declare-fun e!465344 () Option!423)

(assert (=> d!107503 (= (getValueByKey!417 (t!22212 lt!377822) (_1!5052 lt!377761)) e!465344)))

(declare-fun b!834136 () Bool)

(declare-fun e!465345 () Option!423)

(assert (=> b!834136 (= e!465345 (getValueByKey!417 (t!22212 (t!22212 lt!377822)) (_1!5052 lt!377761)))))

(declare-fun b!834137 () Bool)

(assert (=> b!834137 (= e!465345 None!421)))

(declare-fun b!834135 () Bool)

(assert (=> b!834135 (= e!465344 e!465345)))

(declare-fun c!91021 () Bool)

(assert (=> b!834135 (= c!91021 (and ((_ is Cons!15848) (t!22212 lt!377822)) (not (= (_1!5052 (h!16984 (t!22212 lt!377822))) (_1!5052 lt!377761)))))))

(declare-fun b!834134 () Bool)

(assert (=> b!834134 (= e!465344 (Some!422 (_2!5052 (h!16984 (t!22212 lt!377822)))))))

(assert (= (and d!107503 c!91020) b!834134))

(assert (= (and d!107503 (not c!91020)) b!834135))

(assert (= (and b!834135 c!91021) b!834136))

(assert (= (and b!834135 (not c!91021)) b!834137))

(declare-fun m!779233 () Bool)

(assert (=> b!834136 m!779233))

(assert (=> b!833188 d!107503))

(declare-fun lt!378446 () Bool)

(declare-fun d!107505 () Bool)

(assert (=> d!107505 (= lt!378446 (select (content!388 (toList!4469 lt!378004)) (tuple2!10083 lt!377955 minValue!754)))))

(declare-fun e!465347 () Bool)

(assert (=> d!107505 (= lt!378446 e!465347)))

(declare-fun res!567002 () Bool)

(assert (=> d!107505 (=> (not res!567002) (not e!465347))))

(assert (=> d!107505 (= res!567002 ((_ is Cons!15848) (toList!4469 lt!378004)))))

(assert (=> d!107505 (= (contains!4190 (toList!4469 lt!378004) (tuple2!10083 lt!377955 minValue!754)) lt!378446)))

(declare-fun b!834138 () Bool)

(declare-fun e!465346 () Bool)

(assert (=> b!834138 (= e!465347 e!465346)))

(declare-fun res!567001 () Bool)

(assert (=> b!834138 (=> res!567001 e!465346)))

(assert (=> b!834138 (= res!567001 (= (h!16984 (toList!4469 lt!378004)) (tuple2!10083 lt!377955 minValue!754)))))

(declare-fun b!834139 () Bool)

(assert (=> b!834139 (= e!465346 (contains!4190 (t!22212 (toList!4469 lt!378004)) (tuple2!10083 lt!377955 minValue!754)))))

(assert (= (and d!107505 res!567002) b!834138))

(assert (= (and b!834138 (not res!567001)) b!834139))

(declare-fun m!779235 () Bool)

(assert (=> d!107505 m!779235))

(declare-fun m!779237 () Bool)

(assert (=> d!107505 m!779237))

(declare-fun m!779239 () Bool)

(assert (=> b!834139 m!779239))

(assert (=> b!832987 d!107505))

(declare-fun d!107507 () Bool)

(declare-fun e!465349 () Bool)

(assert (=> d!107507 e!465349))

(declare-fun res!567003 () Bool)

(assert (=> d!107507 (=> res!567003 e!465349)))

(declare-fun lt!378447 () Bool)

(assert (=> d!107507 (= res!567003 (not lt!378447))))

(declare-fun lt!378450 () Bool)

(assert (=> d!107507 (= lt!378447 lt!378450)))

(declare-fun lt!378448 () Unit!28510)

(declare-fun e!465348 () Unit!28510)

(assert (=> d!107507 (= lt!378448 e!465348)))

(declare-fun c!91022 () Bool)

(assert (=> d!107507 (= c!91022 lt!378450)))

(assert (=> d!107507 (= lt!378450 (containsKey!402 (toList!4469 lt!378080) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!107507 (= (contains!4189 lt!378080 #b0000000000000000000000000000000000000000000000000000000000000000) lt!378447)))

(declare-fun b!834140 () Bool)

(declare-fun lt!378449 () Unit!28510)

(assert (=> b!834140 (= e!465348 lt!378449)))

(assert (=> b!834140 (= lt!378449 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!378080) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!834140 (isDefined!312 (getValueByKey!417 (toList!4469 lt!378080) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!834141 () Bool)

(declare-fun Unit!28563 () Unit!28510)

(assert (=> b!834141 (= e!465348 Unit!28563)))

(declare-fun b!834142 () Bool)

(assert (=> b!834142 (= e!465349 (isDefined!312 (getValueByKey!417 (toList!4469 lt!378080) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!107507 c!91022) b!834140))

(assert (= (and d!107507 (not c!91022)) b!834141))

(assert (= (and d!107507 (not res!567003)) b!834142))

(declare-fun m!779241 () Bool)

(assert (=> d!107507 m!779241))

(declare-fun m!779243 () Bool)

(assert (=> b!834140 m!779243))

(declare-fun m!779245 () Bool)

(assert (=> b!834140 m!779245))

(assert (=> b!834140 m!779245))

(declare-fun m!779247 () Bool)

(assert (=> b!834140 m!779247))

(assert (=> b!834142 m!779245))

(assert (=> b!834142 m!779245))

(assert (=> b!834142 m!779247))

(assert (=> d!106767 d!107507))

(assert (=> d!106767 d!106633))

(declare-fun d!107509 () Bool)

(assert (=> d!107509 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377823) (_1!5052 lt!377761)))))

(declare-fun lt!378451 () Unit!28510)

(assert (=> d!107509 (= lt!378451 (choose!1433 (toList!4469 lt!377823) (_1!5052 lt!377761)))))

(declare-fun e!465350 () Bool)

(assert (=> d!107509 e!465350))

(declare-fun res!567004 () Bool)

(assert (=> d!107509 (=> (not res!567004) (not e!465350))))

(assert (=> d!107509 (= res!567004 (isStrictlySorted!430 (toList!4469 lt!377823)))))

(assert (=> d!107509 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377823) (_1!5052 lt!377761)) lt!378451)))

(declare-fun b!834143 () Bool)

(assert (=> b!834143 (= e!465350 (containsKey!402 (toList!4469 lt!377823) (_1!5052 lt!377761)))))

(assert (= (and d!107509 res!567004) b!834143))

(assert (=> d!107509 m!777077))

(assert (=> d!107509 m!777077))

(assert (=> d!107509 m!777829))

(declare-fun m!779249 () Bool)

(assert (=> d!107509 m!779249))

(declare-fun m!779251 () Bool)

(assert (=> d!107509 m!779251))

(assert (=> b!834143 m!777825))

(assert (=> b!833183 d!107509))

(assert (=> b!833183 d!106927))

(assert (=> b!833183 d!106853))

(declare-fun d!107511 () Bool)

(assert (=> d!107511 (= (isEmpty!663 lt!378080) (isEmpty!664 (toList!4469 lt!378080)))))

(declare-fun bs!23343 () Bool)

(assert (= bs!23343 d!107511))

(declare-fun m!779253 () Bool)

(assert (=> bs!23343 m!779253))

(assert (=> b!833083 d!107511))

(declare-fun d!107513 () Bool)

(declare-fun c!91023 () Bool)

(assert (=> d!107513 (= c!91023 (and ((_ is Cons!15848) (t!22212 lt!377970)) (= (_1!5052 (h!16984 (t!22212 lt!377970))) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!465351 () Option!423)

(assert (=> d!107513 (= (getValueByKey!417 (t!22212 lt!377970) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!465351)))

(declare-fun b!834146 () Bool)

(declare-fun e!465352 () Option!423)

(assert (=> b!834146 (= e!465352 (getValueByKey!417 (t!22212 (t!22212 lt!377970)) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!834147 () Bool)

(assert (=> b!834147 (= e!465352 None!421)))

(declare-fun b!834145 () Bool)

(assert (=> b!834145 (= e!465351 e!465352)))

(declare-fun c!91024 () Bool)

(assert (=> b!834145 (= c!91024 (and ((_ is Cons!15848) (t!22212 lt!377970)) (not (= (_1!5052 (h!16984 (t!22212 lt!377970))) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun b!834144 () Bool)

(assert (=> b!834144 (= e!465351 (Some!422 (_2!5052 (h!16984 (t!22212 lt!377970)))))))

(assert (= (and d!107513 c!91023) b!834144))

(assert (= (and d!107513 (not c!91023)) b!834145))

(assert (= (and b!834145 c!91024) b!834146))

(assert (= (and b!834145 (not c!91024)) b!834147))

(declare-fun m!779255 () Bool)

(assert (=> b!834146 m!779255))

(assert (=> b!832937 d!107513))

(declare-fun d!107515 () Bool)

(declare-fun e!465354 () Bool)

(assert (=> d!107515 e!465354))

(declare-fun res!567005 () Bool)

(assert (=> d!107515 (=> res!567005 e!465354)))

(declare-fun lt!378452 () Bool)

(assert (=> d!107515 (= res!567005 (not lt!378452))))

(declare-fun lt!378455 () Bool)

(assert (=> d!107515 (= lt!378452 lt!378455)))

(declare-fun lt!378453 () Unit!28510)

(declare-fun e!465353 () Unit!28510)

(assert (=> d!107515 (= lt!378453 e!465353)))

(declare-fun c!91025 () Bool)

(assert (=> d!107515 (= c!91025 lt!378455)))

(assert (=> d!107515 (= lt!378455 (containsKey!402 (toList!4469 lt!378037) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!107515 (= (contains!4189 lt!378037 #b1000000000000000000000000000000000000000000000000000000000000000) lt!378452)))

(declare-fun b!834148 () Bool)

(declare-fun lt!378454 () Unit!28510)

(assert (=> b!834148 (= e!465353 lt!378454)))

(assert (=> b!834148 (= lt!378454 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!378037) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!834148 (isDefined!312 (getValueByKey!417 (toList!4469 lt!378037) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!834149 () Bool)

(declare-fun Unit!28564 () Unit!28510)

(assert (=> b!834149 (= e!465353 Unit!28564)))

(declare-fun b!834150 () Bool)

(assert (=> b!834150 (= e!465354 (isDefined!312 (getValueByKey!417 (toList!4469 lt!378037) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!107515 c!91025) b!834148))

(assert (= (and d!107515 (not c!91025)) b!834149))

(assert (= (and d!107515 (not res!567005)) b!834150))

(declare-fun m!779257 () Bool)

(assert (=> d!107515 m!779257))

(declare-fun m!779259 () Bool)

(assert (=> b!834148 m!779259))

(declare-fun m!779261 () Bool)

(assert (=> b!834148 m!779261))

(assert (=> b!834148 m!779261))

(declare-fun m!779263 () Bool)

(assert (=> b!834148 m!779263))

(assert (=> b!834150 m!779261))

(assert (=> b!834150 m!779261))

(assert (=> b!834150 m!779263))

(assert (=> b!833031 d!107515))

(declare-fun d!107517 () Bool)

(assert (=> d!107517 (= (isEmpty!664 (toList!4469 lt!377861)) ((_ is Nil!15849) (toList!4469 lt!377861)))))

(assert (=> d!106827 d!107517))

(declare-fun d!107519 () Bool)

(declare-fun lt!378456 () Bool)

(assert (=> d!107519 (= lt!378456 (select (content!388 (toList!4469 lt!378200)) (tuple2!10083 lt!377863 lt!377867)))))

(declare-fun e!465356 () Bool)

(assert (=> d!107519 (= lt!378456 e!465356)))

(declare-fun res!567007 () Bool)

(assert (=> d!107519 (=> (not res!567007) (not e!465356))))

(assert (=> d!107519 (= res!567007 ((_ is Cons!15848) (toList!4469 lt!378200)))))

(assert (=> d!107519 (= (contains!4190 (toList!4469 lt!378200) (tuple2!10083 lt!377863 lt!377867)) lt!378456)))

(declare-fun b!834151 () Bool)

(declare-fun e!465355 () Bool)

(assert (=> b!834151 (= e!465356 e!465355)))

(declare-fun res!567006 () Bool)

(assert (=> b!834151 (=> res!567006 e!465355)))

(assert (=> b!834151 (= res!567006 (= (h!16984 (toList!4469 lt!378200)) (tuple2!10083 lt!377863 lt!377867)))))

(declare-fun b!834152 () Bool)

(assert (=> b!834152 (= e!465355 (contains!4190 (t!22212 (toList!4469 lt!378200)) (tuple2!10083 lt!377863 lt!377867)))))

(assert (= (and d!107519 res!567007) b!834151))

(assert (= (and b!834151 (not res!567006)) b!834152))

(declare-fun m!779265 () Bool)

(assert (=> d!107519 m!779265))

(declare-fun m!779267 () Bool)

(assert (=> d!107519 m!779267))

(declare-fun m!779269 () Bool)

(assert (=> b!834152 m!779269))

(assert (=> b!833281 d!107519))

(declare-fun d!107521 () Bool)

(declare-fun c!91026 () Bool)

(assert (=> d!107521 (= c!91026 (and ((_ is Cons!15848) (toList!4469 lt!378018)) (= (_1!5052 (h!16984 (toList!4469 lt!378018))) (_1!5052 (tuple2!10083 lt!377951 zeroValueAfter!34)))))))

(declare-fun e!465357 () Option!423)

(assert (=> d!107521 (= (getValueByKey!417 (toList!4469 lt!378018) (_1!5052 (tuple2!10083 lt!377951 zeroValueAfter!34))) e!465357)))

(declare-fun b!834155 () Bool)

(declare-fun e!465358 () Option!423)

(assert (=> b!834155 (= e!465358 (getValueByKey!417 (t!22212 (toList!4469 lt!378018)) (_1!5052 (tuple2!10083 lt!377951 zeroValueAfter!34))))))

(declare-fun b!834156 () Bool)

(assert (=> b!834156 (= e!465358 None!421)))

(declare-fun b!834154 () Bool)

(assert (=> b!834154 (= e!465357 e!465358)))

(declare-fun c!91027 () Bool)

(assert (=> b!834154 (= c!91027 (and ((_ is Cons!15848) (toList!4469 lt!378018)) (not (= (_1!5052 (h!16984 (toList!4469 lt!378018))) (_1!5052 (tuple2!10083 lt!377951 zeroValueAfter!34))))))))

(declare-fun b!834153 () Bool)

(assert (=> b!834153 (= e!465357 (Some!422 (_2!5052 (h!16984 (toList!4469 lt!378018)))))))

(assert (= (and d!107521 c!91026) b!834153))

(assert (= (and d!107521 (not c!91026)) b!834154))

(assert (= (and b!834154 c!91027) b!834155))

(assert (= (and b!834154 (not c!91027)) b!834156))

(declare-fun m!779271 () Bool)

(assert (=> b!834155 m!779271))

(assert (=> b!832995 d!107521))

(declare-fun d!107523 () Bool)

(assert (=> d!107523 (= (get!11827 (getValueByKey!417 (toList!4469 lt!377943) lt!377946)) (v!10101 (getValueByKey!417 (toList!4469 lt!377943) lt!377946)))))

(assert (=> d!106691 d!107523))

(declare-fun d!107525 () Bool)

(declare-fun c!91028 () Bool)

(assert (=> d!107525 (= c!91028 (and ((_ is Cons!15848) (toList!4469 lt!377943)) (= (_1!5052 (h!16984 (toList!4469 lt!377943))) lt!377946)))))

(declare-fun e!465359 () Option!423)

(assert (=> d!107525 (= (getValueByKey!417 (toList!4469 lt!377943) lt!377946) e!465359)))

(declare-fun b!834159 () Bool)

(declare-fun e!465360 () Option!423)

(assert (=> b!834159 (= e!465360 (getValueByKey!417 (t!22212 (toList!4469 lt!377943)) lt!377946))))

(declare-fun b!834160 () Bool)

(assert (=> b!834160 (= e!465360 None!421)))

(declare-fun b!834158 () Bool)

(assert (=> b!834158 (= e!465359 e!465360)))

(declare-fun c!91029 () Bool)

(assert (=> b!834158 (= c!91029 (and ((_ is Cons!15848) (toList!4469 lt!377943)) (not (= (_1!5052 (h!16984 (toList!4469 lt!377943))) lt!377946))))))

(declare-fun b!834157 () Bool)

(assert (=> b!834157 (= e!465359 (Some!422 (_2!5052 (h!16984 (toList!4469 lt!377943)))))))

(assert (= (and d!107525 c!91028) b!834157))

(assert (= (and d!107525 (not c!91028)) b!834158))

(assert (= (and b!834158 c!91029) b!834159))

(assert (= (and b!834158 (not c!91029)) b!834160))

(declare-fun m!779273 () Bool)

(assert (=> b!834159 m!779273))

(assert (=> d!106691 d!107525))

(declare-fun d!107527 () Bool)

(declare-fun res!567008 () Bool)

(declare-fun e!465361 () Bool)

(assert (=> d!107527 (=> res!567008 e!465361)))

(assert (=> d!107527 (= res!567008 (and ((_ is Cons!15848) lt!377874) (= (_1!5052 (h!16984 lt!377874)) (_1!5052 lt!377756))))))

(assert (=> d!107527 (= (containsKey!402 lt!377874 (_1!5052 lt!377756)) e!465361)))

(declare-fun b!834161 () Bool)

(declare-fun e!465362 () Bool)

(assert (=> b!834161 (= e!465361 e!465362)))

(declare-fun res!567009 () Bool)

(assert (=> b!834161 (=> (not res!567009) (not e!465362))))

(assert (=> b!834161 (= res!567009 (and (or (not ((_ is Cons!15848) lt!377874)) (bvsle (_1!5052 (h!16984 lt!377874)) (_1!5052 lt!377756))) ((_ is Cons!15848) lt!377874) (bvslt (_1!5052 (h!16984 lt!377874)) (_1!5052 lt!377756))))))

(declare-fun b!834162 () Bool)

(assert (=> b!834162 (= e!465362 (containsKey!402 (t!22212 lt!377874) (_1!5052 lt!377756)))))

(assert (= (and d!107527 (not res!567008)) b!834161))

(assert (= (and b!834161 res!567009) b!834162))

(declare-fun m!779275 () Bool)

(assert (=> b!834162 m!779275))

(assert (=> b!833110 d!107527))

(assert (=> b!833001 d!107329))

(assert (=> b!833001 d!107261))

(declare-fun d!107529 () Bool)

(declare-fun lt!378457 () Bool)

(assert (=> d!107529 (= lt!378457 (select (content!388 lt!377826) (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))))))

(declare-fun e!465364 () Bool)

(assert (=> d!107529 (= lt!378457 e!465364)))

(declare-fun res!567011 () Bool)

(assert (=> d!107529 (=> (not res!567011) (not e!465364))))

(assert (=> d!107529 (= res!567011 ((_ is Cons!15848) lt!377826))))

(assert (=> d!107529 (= (contains!4190 lt!377826 (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))) lt!378457)))

(declare-fun b!834163 () Bool)

(declare-fun e!465363 () Bool)

(assert (=> b!834163 (= e!465364 e!465363)))

(declare-fun res!567010 () Bool)

(assert (=> b!834163 (=> res!567010 e!465363)))

(assert (=> b!834163 (= res!567010 (= (h!16984 lt!377826) (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))))))

(declare-fun b!834164 () Bool)

(assert (=> b!834164 (= e!465363 (contains!4190 (t!22212 lt!377826) (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))))))

(assert (= (and d!107529 res!567011) b!834163))

(assert (= (and b!834163 (not res!567010)) b!834164))

(declare-fun m!779277 () Bool)

(assert (=> d!107529 m!779277))

(declare-fun m!779279 () Bool)

(assert (=> d!107529 m!779279))

(declare-fun m!779281 () Bool)

(assert (=> b!834164 m!779281))

(assert (=> b!833172 d!107529))

(declare-fun d!107531 () Bool)

(declare-fun lt!378458 () Bool)

(assert (=> d!107531 (= lt!378458 (select (content!388 (toList!4469 lt!378172)) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun e!465366 () Bool)

(assert (=> d!107531 (= lt!378458 e!465366)))

(declare-fun res!567013 () Bool)

(assert (=> d!107531 (=> (not res!567013) (not e!465366))))

(assert (=> d!107531 (= res!567013 ((_ is Cons!15848) (toList!4469 lt!378172)))))

(assert (=> d!107531 (= (contains!4190 (toList!4469 lt!378172) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) lt!378458)))

(declare-fun b!834165 () Bool)

(declare-fun e!465365 () Bool)

(assert (=> b!834165 (= e!465366 e!465365)))

(declare-fun res!567012 () Bool)

(assert (=> b!834165 (=> res!567012 e!465365)))

(assert (=> b!834165 (= res!567012 (= (h!16984 (toList!4469 lt!378172)) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!834166 () Bool)

(assert (=> b!834166 (= e!465365 (contains!4190 (t!22212 (toList!4469 lt!378172)) (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!107531 res!567013) b!834165))

(assert (= (and b!834165 (not res!567012)) b!834166))

(declare-fun m!779283 () Bool)

(assert (=> d!107531 m!779283))

(declare-fun m!779285 () Bool)

(assert (=> d!107531 m!779285))

(declare-fun m!779287 () Bool)

(assert (=> b!834166 m!779287))

(assert (=> b!833262 d!107531))

(declare-fun d!107533 () Bool)

(declare-fun c!91030 () Bool)

(assert (=> d!107533 (= c!91030 (and ((_ is Cons!15848) (t!22212 (toList!4469 lt!377875))) (= (_1!5052 (h!16984 (t!22212 (toList!4469 lt!377875)))) (_1!5052 lt!377756))))))

(declare-fun e!465367 () Option!423)

(assert (=> d!107533 (= (getValueByKey!417 (t!22212 (toList!4469 lt!377875)) (_1!5052 lt!377756)) e!465367)))

(declare-fun b!834169 () Bool)

(declare-fun e!465368 () Option!423)

(assert (=> b!834169 (= e!465368 (getValueByKey!417 (t!22212 (t!22212 (toList!4469 lt!377875))) (_1!5052 lt!377756)))))

(declare-fun b!834170 () Bool)

(assert (=> b!834170 (= e!465368 None!421)))

(declare-fun b!834168 () Bool)

(assert (=> b!834168 (= e!465367 e!465368)))

(declare-fun c!91031 () Bool)

(assert (=> b!834168 (= c!91031 (and ((_ is Cons!15848) (t!22212 (toList!4469 lt!377875))) (not (= (_1!5052 (h!16984 (t!22212 (toList!4469 lt!377875)))) (_1!5052 lt!377756)))))))

(declare-fun b!834167 () Bool)

(assert (=> b!834167 (= e!465367 (Some!422 (_2!5052 (h!16984 (t!22212 (toList!4469 lt!377875))))))))

(assert (= (and d!107533 c!91030) b!834167))

(assert (= (and d!107533 (not c!91030)) b!834168))

(assert (= (and b!834168 c!91031) b!834169))

(assert (= (and b!834168 (not c!91031)) b!834170))

(declare-fun m!779289 () Bool)

(assert (=> b!834169 m!779289))

(assert (=> b!833162 d!107533))

(declare-fun d!107535 () Bool)

(assert (=> d!107535 (= (get!11827 (getValueByKey!417 (toList!4469 (+!1991 lt!377943 (tuple2!10083 lt!377955 minValue!754))) lt!377946)) (v!10101 (getValueByKey!417 (toList!4469 (+!1991 lt!377943 (tuple2!10083 lt!377955 minValue!754))) lt!377946)))))

(assert (=> d!106667 d!107535))

(declare-fun c!91032 () Bool)

(declare-fun d!107537 () Bool)

(assert (=> d!107537 (= c!91032 (and ((_ is Cons!15848) (toList!4469 (+!1991 lt!377943 (tuple2!10083 lt!377955 minValue!754)))) (= (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377943 (tuple2!10083 lt!377955 minValue!754))))) lt!377946)))))

(declare-fun e!465369 () Option!423)

(assert (=> d!107537 (= (getValueByKey!417 (toList!4469 (+!1991 lt!377943 (tuple2!10083 lt!377955 minValue!754))) lt!377946) e!465369)))

(declare-fun e!465370 () Option!423)

(declare-fun b!834173 () Bool)

(assert (=> b!834173 (= e!465370 (getValueByKey!417 (t!22212 (toList!4469 (+!1991 lt!377943 (tuple2!10083 lt!377955 minValue!754)))) lt!377946))))

(declare-fun b!834174 () Bool)

(assert (=> b!834174 (= e!465370 None!421)))

(declare-fun b!834172 () Bool)

(assert (=> b!834172 (= e!465369 e!465370)))

(declare-fun c!91033 () Bool)

(assert (=> b!834172 (= c!91033 (and ((_ is Cons!15848) (toList!4469 (+!1991 lt!377943 (tuple2!10083 lt!377955 minValue!754)))) (not (= (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377943 (tuple2!10083 lt!377955 minValue!754))))) lt!377946))))))

(declare-fun b!834171 () Bool)

(assert (=> b!834171 (= e!465369 (Some!422 (_2!5052 (h!16984 (toList!4469 (+!1991 lt!377943 (tuple2!10083 lt!377955 minValue!754)))))))))

(assert (= (and d!107537 c!91032) b!834171))

(assert (= (and d!107537 (not c!91032)) b!834172))

(assert (= (and b!834172 c!91033) b!834173))

(assert (= (and b!834172 (not c!91033)) b!834174))

(declare-fun m!779291 () Bool)

(assert (=> b!834173 m!779291))

(assert (=> d!106667 d!107537))

(declare-fun d!107539 () Bool)

(declare-fun res!567014 () Bool)

(declare-fun e!465371 () Bool)

(assert (=> d!107539 (=> res!567014 e!465371)))

(assert (=> d!107539 (= res!567014 (and ((_ is Cons!15848) (toList!4469 (+!1991 lt!377857 (tuple2!10083 lt!377856 lt!377860)))) (= (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377857 (tuple2!10083 lt!377856 lt!377860))))) lt!377858)))))

(assert (=> d!107539 (= (containsKey!402 (toList!4469 (+!1991 lt!377857 (tuple2!10083 lt!377856 lt!377860))) lt!377858) e!465371)))

(declare-fun b!834175 () Bool)

(declare-fun e!465372 () Bool)

(assert (=> b!834175 (= e!465371 e!465372)))

(declare-fun res!567015 () Bool)

(assert (=> b!834175 (=> (not res!567015) (not e!465372))))

(assert (=> b!834175 (= res!567015 (and (or (not ((_ is Cons!15848) (toList!4469 (+!1991 lt!377857 (tuple2!10083 lt!377856 lt!377860))))) (bvsle (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377857 (tuple2!10083 lt!377856 lt!377860))))) lt!377858)) ((_ is Cons!15848) (toList!4469 (+!1991 lt!377857 (tuple2!10083 lt!377856 lt!377860)))) (bvslt (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377857 (tuple2!10083 lt!377856 lt!377860))))) lt!377858)))))

(declare-fun b!834176 () Bool)

(assert (=> b!834176 (= e!465372 (containsKey!402 (t!22212 (toList!4469 (+!1991 lt!377857 (tuple2!10083 lt!377856 lt!377860)))) lt!377858))))

(assert (= (and d!107539 (not res!567014)) b!834175))

(assert (= (and b!834175 res!567015) b!834176))

(declare-fun m!779293 () Bool)

(assert (=> b!834176 m!779293))

(assert (=> d!106869 d!107539))

(declare-fun d!107541 () Bool)

(declare-fun e!465374 () Bool)

(assert (=> d!107541 e!465374))

(declare-fun res!567016 () Bool)

(assert (=> d!107541 (=> res!567016 e!465374)))

(declare-fun lt!378459 () Bool)

(assert (=> d!107541 (= res!567016 (not lt!378459))))

(declare-fun lt!378462 () Bool)

(assert (=> d!107541 (= lt!378459 lt!378462)))

(declare-fun lt!378460 () Unit!28510)

(declare-fun e!465373 () Unit!28510)

(assert (=> d!107541 (= lt!378460 e!465373)))

(declare-fun c!91034 () Bool)

(assert (=> d!107541 (= c!91034 lt!378462)))

(assert (=> d!107541 (= lt!378462 (containsKey!402 (toList!4469 lt!378004) (_1!5052 (tuple2!10083 lt!377955 minValue!754))))))

(assert (=> d!107541 (= (contains!4189 lt!378004 (_1!5052 (tuple2!10083 lt!377955 minValue!754))) lt!378459)))

(declare-fun b!834177 () Bool)

(declare-fun lt!378461 () Unit!28510)

(assert (=> b!834177 (= e!465373 lt!378461)))

(assert (=> b!834177 (= lt!378461 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!378004) (_1!5052 (tuple2!10083 lt!377955 minValue!754))))))

(assert (=> b!834177 (isDefined!312 (getValueByKey!417 (toList!4469 lt!378004) (_1!5052 (tuple2!10083 lt!377955 minValue!754))))))

(declare-fun b!834178 () Bool)

(declare-fun Unit!28565 () Unit!28510)

(assert (=> b!834178 (= e!465373 Unit!28565)))

(declare-fun b!834179 () Bool)

(assert (=> b!834179 (= e!465374 (isDefined!312 (getValueByKey!417 (toList!4469 lt!378004) (_1!5052 (tuple2!10083 lt!377955 minValue!754)))))))

(assert (= (and d!107541 c!91034) b!834177))

(assert (= (and d!107541 (not c!91034)) b!834178))

(assert (= (and d!107541 (not res!567016)) b!834179))

(declare-fun m!779295 () Bool)

(assert (=> d!107541 m!779295))

(declare-fun m!779297 () Bool)

(assert (=> b!834177 m!779297))

(assert (=> b!834177 m!777373))

(assert (=> b!834177 m!777373))

(declare-fun m!779299 () Bool)

(assert (=> b!834177 m!779299))

(assert (=> b!834179 m!777373))

(assert (=> b!834179 m!777373))

(assert (=> b!834179 m!779299))

(assert (=> d!106673 d!107541))

(declare-fun d!107543 () Bool)

(declare-fun c!91035 () Bool)

(assert (=> d!107543 (= c!91035 (and ((_ is Cons!15848) lt!378003) (= (_1!5052 (h!16984 lt!378003)) (_1!5052 (tuple2!10083 lt!377955 minValue!754)))))))

(declare-fun e!465375 () Option!423)

(assert (=> d!107543 (= (getValueByKey!417 lt!378003 (_1!5052 (tuple2!10083 lt!377955 minValue!754))) e!465375)))

(declare-fun b!834182 () Bool)

(declare-fun e!465376 () Option!423)

(assert (=> b!834182 (= e!465376 (getValueByKey!417 (t!22212 lt!378003) (_1!5052 (tuple2!10083 lt!377955 minValue!754))))))

(declare-fun b!834183 () Bool)

(assert (=> b!834183 (= e!465376 None!421)))

(declare-fun b!834181 () Bool)

(assert (=> b!834181 (= e!465375 e!465376)))

(declare-fun c!91036 () Bool)

(assert (=> b!834181 (= c!91036 (and ((_ is Cons!15848) lt!378003) (not (= (_1!5052 (h!16984 lt!378003)) (_1!5052 (tuple2!10083 lt!377955 minValue!754))))))))

(declare-fun b!834180 () Bool)

(assert (=> b!834180 (= e!465375 (Some!422 (_2!5052 (h!16984 lt!378003))))))

(assert (= (and d!107543 c!91035) b!834180))

(assert (= (and d!107543 (not c!91035)) b!834181))

(assert (= (and b!834181 c!91036) b!834182))

(assert (= (and b!834181 (not c!91036)) b!834183))

(declare-fun m!779301 () Bool)

(assert (=> b!834182 m!779301))

(assert (=> d!106673 d!107543))

(declare-fun d!107545 () Bool)

(assert (=> d!107545 (= (getValueByKey!417 lt!378003 (_1!5052 (tuple2!10083 lt!377955 minValue!754))) (Some!422 (_2!5052 (tuple2!10083 lt!377955 minValue!754))))))

(declare-fun lt!378463 () Unit!28510)

(assert (=> d!107545 (= lt!378463 (choose!1429 lt!378003 (_1!5052 (tuple2!10083 lt!377955 minValue!754)) (_2!5052 (tuple2!10083 lt!377955 minValue!754))))))

(declare-fun e!465377 () Bool)

(assert (=> d!107545 e!465377))

(declare-fun res!567017 () Bool)

(assert (=> d!107545 (=> (not res!567017) (not e!465377))))

(assert (=> d!107545 (= res!567017 (isStrictlySorted!430 lt!378003))))

(assert (=> d!107545 (= (lemmaContainsTupThenGetReturnValue!231 lt!378003 (_1!5052 (tuple2!10083 lt!377955 minValue!754)) (_2!5052 (tuple2!10083 lt!377955 minValue!754))) lt!378463)))

(declare-fun b!834184 () Bool)

(declare-fun res!567018 () Bool)

(assert (=> b!834184 (=> (not res!567018) (not e!465377))))

(assert (=> b!834184 (= res!567018 (containsKey!402 lt!378003 (_1!5052 (tuple2!10083 lt!377955 minValue!754))))))

(declare-fun b!834185 () Bool)

(assert (=> b!834185 (= e!465377 (contains!4190 lt!378003 (tuple2!10083 (_1!5052 (tuple2!10083 lt!377955 minValue!754)) (_2!5052 (tuple2!10083 lt!377955 minValue!754)))))))

(assert (= (and d!107545 res!567017) b!834184))

(assert (= (and b!834184 res!567018) b!834185))

(assert (=> d!107545 m!777367))

(declare-fun m!779303 () Bool)

(assert (=> d!107545 m!779303))

(declare-fun m!779305 () Bool)

(assert (=> d!107545 m!779305))

(declare-fun m!779307 () Bool)

(assert (=> b!834184 m!779307))

(declare-fun m!779309 () Bool)

(assert (=> b!834185 m!779309))

(assert (=> d!106673 d!107545))

(declare-fun bm!36528 () Bool)

(declare-fun call!36532 () List!15852)

(declare-fun c!91037 () Bool)

(declare-fun e!465379 () List!15852)

(assert (=> bm!36528 (= call!36532 ($colon$colon!534 e!465379 (ite c!91037 (h!16984 (toList!4469 lt!377943)) (tuple2!10083 (_1!5052 (tuple2!10083 lt!377955 minValue!754)) (_2!5052 (tuple2!10083 lt!377955 minValue!754))))))))

(declare-fun c!91040 () Bool)

(assert (=> bm!36528 (= c!91040 c!91037)))

(declare-fun bm!36529 () Bool)

(declare-fun call!36533 () List!15852)

(assert (=> bm!36529 (= call!36533 call!36532)))

(declare-fun bm!36530 () Bool)

(declare-fun call!36531 () List!15852)

(assert (=> bm!36530 (= call!36531 call!36533)))

(declare-fun b!834186 () Bool)

(declare-fun c!91038 () Bool)

(assert (=> b!834186 (= c!91038 (and ((_ is Cons!15848) (toList!4469 lt!377943)) (bvsgt (_1!5052 (h!16984 (toList!4469 lt!377943))) (_1!5052 (tuple2!10083 lt!377955 minValue!754)))))))

(declare-fun e!465378 () List!15852)

(declare-fun e!465381 () List!15852)

(assert (=> b!834186 (= e!465378 e!465381)))

(declare-fun b!834187 () Bool)

(assert (=> b!834187 (= e!465381 call!36531)))

(declare-fun b!834188 () Bool)

(assert (=> b!834188 (= e!465379 (insertStrictlySorted!270 (t!22212 (toList!4469 lt!377943)) (_1!5052 (tuple2!10083 lt!377955 minValue!754)) (_2!5052 (tuple2!10083 lt!377955 minValue!754))))))

(declare-fun b!834189 () Bool)

(declare-fun e!465380 () List!15852)

(assert (=> b!834189 (= e!465380 call!36532)))

(declare-fun b!834190 () Bool)

(declare-fun e!465382 () Bool)

(declare-fun lt!378464 () List!15852)

(assert (=> b!834190 (= e!465382 (contains!4190 lt!378464 (tuple2!10083 (_1!5052 (tuple2!10083 lt!377955 minValue!754)) (_2!5052 (tuple2!10083 lt!377955 minValue!754)))))))

(declare-fun c!91039 () Bool)

(declare-fun b!834191 () Bool)

(assert (=> b!834191 (= e!465379 (ite c!91039 (t!22212 (toList!4469 lt!377943)) (ite c!91038 (Cons!15848 (h!16984 (toList!4469 lt!377943)) (t!22212 (toList!4469 lt!377943))) Nil!15849)))))

(declare-fun b!834192 () Bool)

(assert (=> b!834192 (= e!465380 e!465378)))

(assert (=> b!834192 (= c!91039 (and ((_ is Cons!15848) (toList!4469 lt!377943)) (= (_1!5052 (h!16984 (toList!4469 lt!377943))) (_1!5052 (tuple2!10083 lt!377955 minValue!754)))))))

(declare-fun b!834193 () Bool)

(assert (=> b!834193 (= e!465378 call!36533)))

(declare-fun b!834194 () Bool)

(declare-fun res!567020 () Bool)

(assert (=> b!834194 (=> (not res!567020) (not e!465382))))

(assert (=> b!834194 (= res!567020 (containsKey!402 lt!378464 (_1!5052 (tuple2!10083 lt!377955 minValue!754))))))

(declare-fun d!107547 () Bool)

(assert (=> d!107547 e!465382))

(declare-fun res!567019 () Bool)

(assert (=> d!107547 (=> (not res!567019) (not e!465382))))

(assert (=> d!107547 (= res!567019 (isStrictlySorted!430 lt!378464))))

(assert (=> d!107547 (= lt!378464 e!465380)))

(assert (=> d!107547 (= c!91037 (and ((_ is Cons!15848) (toList!4469 lt!377943)) (bvslt (_1!5052 (h!16984 (toList!4469 lt!377943))) (_1!5052 (tuple2!10083 lt!377955 minValue!754)))))))

(assert (=> d!107547 (isStrictlySorted!430 (toList!4469 lt!377943))))

(assert (=> d!107547 (= (insertStrictlySorted!270 (toList!4469 lt!377943) (_1!5052 (tuple2!10083 lt!377955 minValue!754)) (_2!5052 (tuple2!10083 lt!377955 minValue!754))) lt!378464)))

(declare-fun b!834195 () Bool)

(assert (=> b!834195 (= e!465381 call!36531)))

(assert (= (and d!107547 c!91037) b!834189))

(assert (= (and d!107547 (not c!91037)) b!834192))

(assert (= (and b!834192 c!91039) b!834193))

(assert (= (and b!834192 (not c!91039)) b!834186))

(assert (= (and b!834186 c!91038) b!834187))

(assert (= (and b!834186 (not c!91038)) b!834195))

(assert (= (or b!834187 b!834195) bm!36530))

(assert (= (or b!834193 bm!36530) bm!36529))

(assert (= (or b!834189 bm!36529) bm!36528))

(assert (= (and bm!36528 c!91040) b!834188))

(assert (= (and bm!36528 (not c!91040)) b!834191))

(assert (= (and d!107547 res!567019) b!834194))

(assert (= (and b!834194 res!567020) b!834190))

(declare-fun m!779311 () Bool)

(assert (=> bm!36528 m!779311))

(declare-fun m!779313 () Bool)

(assert (=> b!834190 m!779313))

(declare-fun m!779315 () Bool)

(assert (=> b!834188 m!779315))

(declare-fun m!779317 () Bool)

(assert (=> b!834194 m!779317))

(declare-fun m!779319 () Bool)

(assert (=> d!107547 m!779319))

(declare-fun m!779321 () Bool)

(assert (=> d!107547 m!779321))

(assert (=> d!106673 d!107547))

(declare-fun d!107549 () Bool)

(assert (=> d!107549 (= (get!11827 (getValueByKey!417 (toList!4469 (+!1991 lt!377923 (tuple2!10083 lt!377929 zeroValueBefore!34))) lt!377931)) (v!10101 (getValueByKey!417 (toList!4469 (+!1991 lt!377923 (tuple2!10083 lt!377929 zeroValueBefore!34))) lt!377931)))))

(assert (=> d!106733 d!107549))

(declare-fun c!91041 () Bool)

(declare-fun d!107551 () Bool)

(assert (=> d!107551 (= c!91041 (and ((_ is Cons!15848) (toList!4469 (+!1991 lt!377923 (tuple2!10083 lt!377929 zeroValueBefore!34)))) (= (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377923 (tuple2!10083 lt!377929 zeroValueBefore!34))))) lt!377931)))))

(declare-fun e!465383 () Option!423)

(assert (=> d!107551 (= (getValueByKey!417 (toList!4469 (+!1991 lt!377923 (tuple2!10083 lt!377929 zeroValueBefore!34))) lt!377931) e!465383)))

(declare-fun b!834198 () Bool)

(declare-fun e!465384 () Option!423)

(assert (=> b!834198 (= e!465384 (getValueByKey!417 (t!22212 (toList!4469 (+!1991 lt!377923 (tuple2!10083 lt!377929 zeroValueBefore!34)))) lt!377931))))

(declare-fun b!834199 () Bool)

(assert (=> b!834199 (= e!465384 None!421)))

(declare-fun b!834197 () Bool)

(assert (=> b!834197 (= e!465383 e!465384)))

(declare-fun c!91042 () Bool)

(assert (=> b!834197 (= c!91042 (and ((_ is Cons!15848) (toList!4469 (+!1991 lt!377923 (tuple2!10083 lt!377929 zeroValueBefore!34)))) (not (= (_1!5052 (h!16984 (toList!4469 (+!1991 lt!377923 (tuple2!10083 lt!377929 zeroValueBefore!34))))) lt!377931))))))

(declare-fun b!834196 () Bool)

(assert (=> b!834196 (= e!465383 (Some!422 (_2!5052 (h!16984 (toList!4469 (+!1991 lt!377923 (tuple2!10083 lt!377929 zeroValueBefore!34)))))))))

(assert (= (and d!107551 c!91041) b!834196))

(assert (= (and d!107551 (not c!91041)) b!834197))

(assert (= (and b!834197 c!91042) b!834198))

(assert (= (and b!834197 (not c!91042)) b!834199))

(declare-fun m!779323 () Bool)

(assert (=> b!834198 m!779323))

(assert (=> d!106733 d!107551))

(declare-fun d!107553 () Bool)

(assert (=> d!107553 (= (content!389 Nil!15850) ((as const (Array (_ BitVec 64) Bool)) false))))

(assert (=> d!106801 d!107553))

(declare-fun d!107555 () Bool)

(assert (=> d!107555 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377925) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!378465 () Unit!28510)

(assert (=> d!107555 (= lt!378465 (choose!1433 (toList!4469 lt!377925) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!465385 () Bool)

(assert (=> d!107555 e!465385))

(declare-fun res!567021 () Bool)

(assert (=> d!107555 (=> (not res!567021) (not e!465385))))

(assert (=> d!107555 (= res!567021 (isStrictlySorted!430 (toList!4469 lt!377925)))))

(assert (=> d!107555 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377925) #b1000000000000000000000000000000000000000000000000000000000000000) lt!378465)))

(declare-fun b!834200 () Bool)

(assert (=> b!834200 (= e!465385 (containsKey!402 (toList!4469 lt!377925) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!107555 res!567021) b!834200))

(assert (=> d!107555 m!777441))

(assert (=> d!107555 m!777441))

(assert (=> d!107555 m!777795))

(declare-fun m!779325 () Bool)

(assert (=> d!107555 m!779325))

(assert (=> d!107555 m!778129))

(assert (=> b!834200 m!777791))

(assert (=> b!833157 d!107555))

(assert (=> b!833157 d!106973))

(assert (=> b!833157 d!106975))

(declare-fun d!107557 () Bool)

(assert (=> d!107557 (= ($colon$colon!534 e!464808 (ite c!90761 (h!16984 (toList!4469 (+!1991 lt!377759 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756)))) (Cons!15848 (ite c!90761 (h!16984 (toList!4469 (+!1991 lt!377759 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))) e!464808))))

(assert (=> bm!36467 d!107557))

(declare-fun c!91043 () Bool)

(declare-fun call!36535 () List!15852)

(declare-fun e!465387 () List!15852)

(declare-fun bm!36531 () Bool)

(assert (=> bm!36531 (= call!36535 ($colon$colon!534 e!465387 (ite c!91043 (h!16984 (t!22212 (toList!4469 lt!377760))) (tuple2!10083 (_1!5052 lt!377761) (_2!5052 lt!377761)))))))

(declare-fun c!91046 () Bool)

(assert (=> bm!36531 (= c!91046 c!91043)))

(declare-fun bm!36532 () Bool)

(declare-fun call!36536 () List!15852)

(assert (=> bm!36532 (= call!36536 call!36535)))

(declare-fun bm!36533 () Bool)

(declare-fun call!36534 () List!15852)

(assert (=> bm!36533 (= call!36534 call!36536)))

(declare-fun b!834201 () Bool)

(declare-fun c!91044 () Bool)

(assert (=> b!834201 (= c!91044 (and ((_ is Cons!15848) (t!22212 (toList!4469 lt!377760))) (bvsgt (_1!5052 (h!16984 (t!22212 (toList!4469 lt!377760)))) (_1!5052 lt!377761))))))

(declare-fun e!465386 () List!15852)

(declare-fun e!465389 () List!15852)

(assert (=> b!834201 (= e!465386 e!465389)))

(declare-fun b!834202 () Bool)

(assert (=> b!834202 (= e!465389 call!36534)))

(declare-fun b!834203 () Bool)

(assert (=> b!834203 (= e!465387 (insertStrictlySorted!270 (t!22212 (t!22212 (toList!4469 lt!377760))) (_1!5052 lt!377761) (_2!5052 lt!377761)))))

(declare-fun b!834204 () Bool)

(declare-fun e!465388 () List!15852)

(assert (=> b!834204 (= e!465388 call!36535)))

(declare-fun b!834205 () Bool)

(declare-fun e!465390 () Bool)

(declare-fun lt!378466 () List!15852)

(assert (=> b!834205 (= e!465390 (contains!4190 lt!378466 (tuple2!10083 (_1!5052 lt!377761) (_2!5052 lt!377761))))))

(declare-fun c!91045 () Bool)

(declare-fun b!834206 () Bool)

(assert (=> b!834206 (= e!465387 (ite c!91045 (t!22212 (t!22212 (toList!4469 lt!377760))) (ite c!91044 (Cons!15848 (h!16984 (t!22212 (toList!4469 lt!377760))) (t!22212 (t!22212 (toList!4469 lt!377760)))) Nil!15849)))))

(declare-fun b!834207 () Bool)

(assert (=> b!834207 (= e!465388 e!465386)))

(assert (=> b!834207 (= c!91045 (and ((_ is Cons!15848) (t!22212 (toList!4469 lt!377760))) (= (_1!5052 (h!16984 (t!22212 (toList!4469 lt!377760)))) (_1!5052 lt!377761))))))

(declare-fun b!834208 () Bool)

(assert (=> b!834208 (= e!465386 call!36536)))

(declare-fun b!834209 () Bool)

(declare-fun res!567023 () Bool)

(assert (=> b!834209 (=> (not res!567023) (not e!465390))))

(assert (=> b!834209 (= res!567023 (containsKey!402 lt!378466 (_1!5052 lt!377761)))))

(declare-fun d!107559 () Bool)

(assert (=> d!107559 e!465390))

(declare-fun res!567022 () Bool)

(assert (=> d!107559 (=> (not res!567022) (not e!465390))))

(assert (=> d!107559 (= res!567022 (isStrictlySorted!430 lt!378466))))

(assert (=> d!107559 (= lt!378466 e!465388)))

(assert (=> d!107559 (= c!91043 (and ((_ is Cons!15848) (t!22212 (toList!4469 lt!377760))) (bvslt (_1!5052 (h!16984 (t!22212 (toList!4469 lt!377760)))) (_1!5052 lt!377761))))))

(assert (=> d!107559 (isStrictlySorted!430 (t!22212 (toList!4469 lt!377760)))))

(assert (=> d!107559 (= (insertStrictlySorted!270 (t!22212 (toList!4469 lt!377760)) (_1!5052 lt!377761) (_2!5052 lt!377761)) lt!378466)))

(declare-fun b!834210 () Bool)

(assert (=> b!834210 (= e!465389 call!36534)))

(assert (= (and d!107559 c!91043) b!834204))

(assert (= (and d!107559 (not c!91043)) b!834207))

(assert (= (and b!834207 c!91045) b!834208))

(assert (= (and b!834207 (not c!91045)) b!834201))

(assert (= (and b!834201 c!91044) b!834202))

(assert (= (and b!834201 (not c!91044)) b!834210))

(assert (= (or b!834202 b!834210) bm!36533))

(assert (= (or b!834208 bm!36533) bm!36532))

(assert (= (or b!834204 bm!36532) bm!36531))

(assert (= (and bm!36531 c!91046) b!834203))

(assert (= (and bm!36531 (not c!91046)) b!834206))

(assert (= (and d!107559 res!567022) b!834209))

(assert (= (and b!834209 res!567023) b!834205))

(declare-fun m!779327 () Bool)

(assert (=> bm!36531 m!779327))

(declare-fun m!779329 () Bool)

(assert (=> b!834205 m!779329))

(declare-fun m!779331 () Bool)

(assert (=> b!834203 m!779331))

(declare-fun m!779333 () Bool)

(assert (=> b!834209 m!779333))

(declare-fun m!779335 () Bool)

(assert (=> d!107559 m!779335))

(assert (=> d!107559 m!778285))

(assert (=> b!833074 d!107559))

(declare-fun d!107561 () Bool)

(declare-fun c!91047 () Bool)

(assert (=> d!107561 (= c!91047 (and ((_ is Cons!15848) (t!22212 lt!377870)) (= (_1!5052 (h!16984 (t!22212 lt!377870))) (_1!5052 lt!377761))))))

(declare-fun e!465391 () Option!423)

(assert (=> d!107561 (= (getValueByKey!417 (t!22212 lt!377870) (_1!5052 lt!377761)) e!465391)))

(declare-fun b!834213 () Bool)

(declare-fun e!465392 () Option!423)

(assert (=> b!834213 (= e!465392 (getValueByKey!417 (t!22212 (t!22212 lt!377870)) (_1!5052 lt!377761)))))

(declare-fun b!834214 () Bool)

(assert (=> b!834214 (= e!465392 None!421)))

(declare-fun b!834212 () Bool)

(assert (=> b!834212 (= e!465391 e!465392)))

(declare-fun c!91048 () Bool)

(assert (=> b!834212 (= c!91048 (and ((_ is Cons!15848) (t!22212 lt!377870)) (not (= (_1!5052 (h!16984 (t!22212 lt!377870))) (_1!5052 lt!377761)))))))

(declare-fun b!834211 () Bool)

(assert (=> b!834211 (= e!465391 (Some!422 (_2!5052 (h!16984 (t!22212 lt!377870)))))))

(assert (= (and d!107561 c!91047) b!834211))

(assert (= (and d!107561 (not c!91047)) b!834212))

(assert (= (and b!834212 c!91048) b!834213))

(assert (= (and b!834212 (not c!91048)) b!834214))

(declare-fun m!779337 () Bool)

(assert (=> b!834213 m!779337))

(assert (=> b!833068 d!107561))

(declare-fun d!107563 () Bool)

(declare-fun res!567024 () Bool)

(declare-fun e!465393 () Bool)

(assert (=> d!107563 (=> res!567024 e!465393)))

(assert (=> d!107563 (= res!567024 (and ((_ is Cons!15848) (toList!4469 lt!377823)) (= (_1!5052 (h!16984 (toList!4469 lt!377823))) (_1!5052 lt!377761))))))

(assert (=> d!107563 (= (containsKey!402 (toList!4469 lt!377823) (_1!5052 lt!377761)) e!465393)))

(declare-fun b!834215 () Bool)

(declare-fun e!465394 () Bool)

(assert (=> b!834215 (= e!465393 e!465394)))

(declare-fun res!567025 () Bool)

(assert (=> b!834215 (=> (not res!567025) (not e!465394))))

(assert (=> b!834215 (= res!567025 (and (or (not ((_ is Cons!15848) (toList!4469 lt!377823))) (bvsle (_1!5052 (h!16984 (toList!4469 lt!377823))) (_1!5052 lt!377761))) ((_ is Cons!15848) (toList!4469 lt!377823)) (bvslt (_1!5052 (h!16984 (toList!4469 lt!377823))) (_1!5052 lt!377761))))))

(declare-fun b!834216 () Bool)

(assert (=> b!834216 (= e!465394 (containsKey!402 (t!22212 (toList!4469 lt!377823)) (_1!5052 lt!377761)))))

(assert (= (and d!107563 (not res!567024)) b!834215))

(assert (= (and b!834215 res!567025) b!834216))

(declare-fun m!779339 () Bool)

(assert (=> b!834216 m!779339))

(assert (=> d!106815 d!107563))

(declare-fun d!107565 () Bool)

(declare-fun c!91049 () Bool)

(assert (=> d!107565 (= c!91049 (and ((_ is Cons!15848) (toList!4469 lt!378004)) (= (_1!5052 (h!16984 (toList!4469 lt!378004))) (_1!5052 (tuple2!10083 lt!377955 minValue!754)))))))

(declare-fun e!465395 () Option!423)

(assert (=> d!107565 (= (getValueByKey!417 (toList!4469 lt!378004) (_1!5052 (tuple2!10083 lt!377955 minValue!754))) e!465395)))

(declare-fun b!834219 () Bool)

(declare-fun e!465396 () Option!423)

(assert (=> b!834219 (= e!465396 (getValueByKey!417 (t!22212 (toList!4469 lt!378004)) (_1!5052 (tuple2!10083 lt!377955 minValue!754))))))

(declare-fun b!834220 () Bool)

(assert (=> b!834220 (= e!465396 None!421)))

(declare-fun b!834218 () Bool)

(assert (=> b!834218 (= e!465395 e!465396)))

(declare-fun c!91050 () Bool)

(assert (=> b!834218 (= c!91050 (and ((_ is Cons!15848) (toList!4469 lt!378004)) (not (= (_1!5052 (h!16984 (toList!4469 lt!378004))) (_1!5052 (tuple2!10083 lt!377955 minValue!754))))))))

(declare-fun b!834217 () Bool)

(assert (=> b!834217 (= e!465395 (Some!422 (_2!5052 (h!16984 (toList!4469 lt!378004)))))))

(assert (= (and d!107565 c!91049) b!834217))

(assert (= (and d!107565 (not c!91049)) b!834218))

(assert (= (and b!834218 c!91050) b!834219))

(assert (= (and b!834218 (not c!91050)) b!834220))

(declare-fun m!779341 () Bool)

(assert (=> b!834219 m!779341))

(assert (=> b!832986 d!107565))

(declare-fun d!107567 () Bool)

(declare-fun lt!378467 () Bool)

(assert (=> d!107567 (= lt!378467 (select (content!388 lt!378129) (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))))))

(declare-fun e!465398 () Bool)

(assert (=> d!107567 (= lt!378467 e!465398)))

(declare-fun res!567027 () Bool)

(assert (=> d!107567 (=> (not res!567027) (not e!465398))))

(assert (=> d!107567 (= res!567027 ((_ is Cons!15848) lt!378129))))

(assert (=> d!107567 (= (contains!4190 lt!378129 (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))) lt!378467)))

(declare-fun b!834221 () Bool)

(declare-fun e!465397 () Bool)

(assert (=> b!834221 (= e!465398 e!465397)))

(declare-fun res!567026 () Bool)

(assert (=> b!834221 (=> res!567026 e!465397)))

(assert (=> b!834221 (= res!567026 (= (h!16984 lt!378129) (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))))))

(declare-fun b!834222 () Bool)

(assert (=> b!834222 (= e!465397 (contains!4190 (t!22212 lt!378129) (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))))))

(assert (= (and d!107567 res!567027) b!834221))

(assert (= (and b!834221 (not res!567026)) b!834222))

(declare-fun m!779343 () Bool)

(assert (=> d!107567 m!779343))

(declare-fun m!779345 () Bool)

(assert (=> d!107567 m!779345))

(declare-fun m!779347 () Bool)

(assert (=> b!834222 m!779347))

(assert (=> b!833177 d!107567))

(declare-fun d!107569 () Bool)

(declare-fun c!91051 () Bool)

(assert (=> d!107569 (= c!91051 ((_ is Nil!15849) (toList!4469 lt!377827)))))

(declare-fun e!465399 () (InoxSet tuple2!10082))

(assert (=> d!107569 (= (content!388 (toList!4469 lt!377827)) e!465399)))

(declare-fun b!834223 () Bool)

(assert (=> b!834223 (= e!465399 ((as const (Array tuple2!10082 Bool)) false))))

(declare-fun b!834224 () Bool)

(assert (=> b!834224 (= e!465399 ((_ map or) (store ((as const (Array tuple2!10082 Bool)) false) (h!16984 (toList!4469 lt!377827)) true) (content!388 (t!22212 (toList!4469 lt!377827)))))))

(assert (= (and d!107569 c!91051) b!834223))

(assert (= (and d!107569 (not c!91051)) b!834224))

(declare-fun m!779349 () Bool)

(assert (=> b!834224 m!779349))

(assert (=> b!834224 m!778821))

(assert (=> d!106775 d!107569))

(declare-fun d!107571 () Bool)

(assert (not d!107571))

(assert (=> b!833156 d!107571))

(declare-fun d!107573 () Bool)

(declare-fun e!465401 () Bool)

(assert (=> d!107573 e!465401))

(declare-fun res!567028 () Bool)

(assert (=> d!107573 (=> res!567028 e!465401)))

(declare-fun lt!378468 () Bool)

(assert (=> d!107573 (= res!567028 (not lt!378468))))

(declare-fun lt!378471 () Bool)

(assert (=> d!107573 (= lt!378468 lt!378471)))

(declare-fun lt!378469 () Unit!28510)

(declare-fun e!465400 () Unit!28510)

(assert (=> d!107573 (= lt!378469 e!465400)))

(declare-fun c!91052 () Bool)

(assert (=> d!107573 (= c!91052 lt!378471)))

(assert (=> d!107573 (= lt!378471 (containsKey!402 (toList!4469 lt!378200) (_1!5052 (tuple2!10083 lt!377863 lt!377867))))))

(assert (=> d!107573 (= (contains!4189 lt!378200 (_1!5052 (tuple2!10083 lt!377863 lt!377867))) lt!378468)))

(declare-fun b!834225 () Bool)

(declare-fun lt!378470 () Unit!28510)

(assert (=> b!834225 (= e!465400 lt!378470)))

(assert (=> b!834225 (= lt!378470 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!378200) (_1!5052 (tuple2!10083 lt!377863 lt!377867))))))

(assert (=> b!834225 (isDefined!312 (getValueByKey!417 (toList!4469 lt!378200) (_1!5052 (tuple2!10083 lt!377863 lt!377867))))))

(declare-fun b!834226 () Bool)

(declare-fun Unit!28566 () Unit!28510)

(assert (=> b!834226 (= e!465400 Unit!28566)))

(declare-fun b!834227 () Bool)

(assert (=> b!834227 (= e!465401 (isDefined!312 (getValueByKey!417 (toList!4469 lt!378200) (_1!5052 (tuple2!10083 lt!377863 lt!377867)))))))

(assert (= (and d!107573 c!91052) b!834225))

(assert (= (and d!107573 (not c!91052)) b!834226))

(assert (= (and d!107573 (not res!567028)) b!834227))

(declare-fun m!779351 () Bool)

(assert (=> d!107573 m!779351))

(declare-fun m!779353 () Bool)

(assert (=> b!834225 m!779353))

(assert (=> b!834225 m!778021))

(assert (=> b!834225 m!778021))

(declare-fun m!779355 () Bool)

(assert (=> b!834225 m!779355))

(assert (=> b!834227 m!778021))

(assert (=> b!834227 m!778021))

(assert (=> b!834227 m!779355))

(assert (=> d!106877 d!107573))

(declare-fun c!91053 () Bool)

(declare-fun d!107575 () Bool)

(assert (=> d!107575 (= c!91053 (and ((_ is Cons!15848) lt!378199) (= (_1!5052 (h!16984 lt!378199)) (_1!5052 (tuple2!10083 lt!377863 lt!377867)))))))

(declare-fun e!465402 () Option!423)

(assert (=> d!107575 (= (getValueByKey!417 lt!378199 (_1!5052 (tuple2!10083 lt!377863 lt!377867))) e!465402)))

(declare-fun b!834230 () Bool)

(declare-fun e!465403 () Option!423)

(assert (=> b!834230 (= e!465403 (getValueByKey!417 (t!22212 lt!378199) (_1!5052 (tuple2!10083 lt!377863 lt!377867))))))

(declare-fun b!834231 () Bool)

(assert (=> b!834231 (= e!465403 None!421)))

(declare-fun b!834229 () Bool)

(assert (=> b!834229 (= e!465402 e!465403)))

(declare-fun c!91054 () Bool)

(assert (=> b!834229 (= c!91054 (and ((_ is Cons!15848) lt!378199) (not (= (_1!5052 (h!16984 lt!378199)) (_1!5052 (tuple2!10083 lt!377863 lt!377867))))))))

(declare-fun b!834228 () Bool)

(assert (=> b!834228 (= e!465402 (Some!422 (_2!5052 (h!16984 lt!378199))))))

(assert (= (and d!107575 c!91053) b!834228))

(assert (= (and d!107575 (not c!91053)) b!834229))

(assert (= (and b!834229 c!91054) b!834230))

(assert (= (and b!834229 (not c!91054)) b!834231))

(declare-fun m!779357 () Bool)

(assert (=> b!834230 m!779357))

(assert (=> d!106877 d!107575))

(declare-fun d!107577 () Bool)

(assert (=> d!107577 (= (getValueByKey!417 lt!378199 (_1!5052 (tuple2!10083 lt!377863 lt!377867))) (Some!422 (_2!5052 (tuple2!10083 lt!377863 lt!377867))))))

(declare-fun lt!378472 () Unit!28510)

(assert (=> d!107577 (= lt!378472 (choose!1429 lt!378199 (_1!5052 (tuple2!10083 lt!377863 lt!377867)) (_2!5052 (tuple2!10083 lt!377863 lt!377867))))))

(declare-fun e!465404 () Bool)

(assert (=> d!107577 e!465404))

(declare-fun res!567029 () Bool)

(assert (=> d!107577 (=> (not res!567029) (not e!465404))))

(assert (=> d!107577 (= res!567029 (isStrictlySorted!430 lt!378199))))

(assert (=> d!107577 (= (lemmaContainsTupThenGetReturnValue!231 lt!378199 (_1!5052 (tuple2!10083 lt!377863 lt!377867)) (_2!5052 (tuple2!10083 lt!377863 lt!377867))) lt!378472)))

(declare-fun b!834232 () Bool)

(declare-fun res!567030 () Bool)

(assert (=> b!834232 (=> (not res!567030) (not e!465404))))

(assert (=> b!834232 (= res!567030 (containsKey!402 lt!378199 (_1!5052 (tuple2!10083 lt!377863 lt!377867))))))

(declare-fun b!834233 () Bool)

(assert (=> b!834233 (= e!465404 (contains!4190 lt!378199 (tuple2!10083 (_1!5052 (tuple2!10083 lt!377863 lt!377867)) (_2!5052 (tuple2!10083 lt!377863 lt!377867)))))))

(assert (= (and d!107577 res!567029) b!834232))

(assert (= (and b!834232 res!567030) b!834233))

(assert (=> d!107577 m!778015))

(declare-fun m!779359 () Bool)

(assert (=> d!107577 m!779359))

(declare-fun m!779361 () Bool)

(assert (=> d!107577 m!779361))

(declare-fun m!779363 () Bool)

(assert (=> b!834232 m!779363))

(declare-fun m!779365 () Bool)

(assert (=> b!834233 m!779365))

(assert (=> d!106877 d!107577))

(declare-fun bm!36534 () Bool)

(declare-fun c!91055 () Bool)

(declare-fun e!465406 () List!15852)

(declare-fun call!36538 () List!15852)

(assert (=> bm!36534 (= call!36538 ($colon$colon!534 e!465406 (ite c!91055 (h!16984 (toList!4469 lt!377864)) (tuple2!10083 (_1!5052 (tuple2!10083 lt!377863 lt!377867)) (_2!5052 (tuple2!10083 lt!377863 lt!377867))))))))

(declare-fun c!91058 () Bool)

(assert (=> bm!36534 (= c!91058 c!91055)))

(declare-fun bm!36535 () Bool)

(declare-fun call!36539 () List!15852)

(assert (=> bm!36535 (= call!36539 call!36538)))

(declare-fun bm!36536 () Bool)

(declare-fun call!36537 () List!15852)

(assert (=> bm!36536 (= call!36537 call!36539)))

(declare-fun b!834234 () Bool)

(declare-fun c!91056 () Bool)

(assert (=> b!834234 (= c!91056 (and ((_ is Cons!15848) (toList!4469 lt!377864)) (bvsgt (_1!5052 (h!16984 (toList!4469 lt!377864))) (_1!5052 (tuple2!10083 lt!377863 lt!377867)))))))

(declare-fun e!465405 () List!15852)

(declare-fun e!465408 () List!15852)

(assert (=> b!834234 (= e!465405 e!465408)))

(declare-fun b!834235 () Bool)

(assert (=> b!834235 (= e!465408 call!36537)))

(declare-fun b!834236 () Bool)

(assert (=> b!834236 (= e!465406 (insertStrictlySorted!270 (t!22212 (toList!4469 lt!377864)) (_1!5052 (tuple2!10083 lt!377863 lt!377867)) (_2!5052 (tuple2!10083 lt!377863 lt!377867))))))

(declare-fun b!834237 () Bool)

(declare-fun e!465407 () List!15852)

(assert (=> b!834237 (= e!465407 call!36538)))

(declare-fun lt!378473 () List!15852)

(declare-fun e!465409 () Bool)

(declare-fun b!834238 () Bool)

(assert (=> b!834238 (= e!465409 (contains!4190 lt!378473 (tuple2!10083 (_1!5052 (tuple2!10083 lt!377863 lt!377867)) (_2!5052 (tuple2!10083 lt!377863 lt!377867)))))))

(declare-fun c!91057 () Bool)

(declare-fun b!834239 () Bool)

(assert (=> b!834239 (= e!465406 (ite c!91057 (t!22212 (toList!4469 lt!377864)) (ite c!91056 (Cons!15848 (h!16984 (toList!4469 lt!377864)) (t!22212 (toList!4469 lt!377864))) Nil!15849)))))

(declare-fun b!834240 () Bool)

(assert (=> b!834240 (= e!465407 e!465405)))

(assert (=> b!834240 (= c!91057 (and ((_ is Cons!15848) (toList!4469 lt!377864)) (= (_1!5052 (h!16984 (toList!4469 lt!377864))) (_1!5052 (tuple2!10083 lt!377863 lt!377867)))))))

(declare-fun b!834241 () Bool)

(assert (=> b!834241 (= e!465405 call!36539)))

(declare-fun b!834242 () Bool)

(declare-fun res!567032 () Bool)

(assert (=> b!834242 (=> (not res!567032) (not e!465409))))

(assert (=> b!834242 (= res!567032 (containsKey!402 lt!378473 (_1!5052 (tuple2!10083 lt!377863 lt!377867))))))

(declare-fun d!107579 () Bool)

(assert (=> d!107579 e!465409))

(declare-fun res!567031 () Bool)

(assert (=> d!107579 (=> (not res!567031) (not e!465409))))

(assert (=> d!107579 (= res!567031 (isStrictlySorted!430 lt!378473))))

(assert (=> d!107579 (= lt!378473 e!465407)))

(assert (=> d!107579 (= c!91055 (and ((_ is Cons!15848) (toList!4469 lt!377864)) (bvslt (_1!5052 (h!16984 (toList!4469 lt!377864))) (_1!5052 (tuple2!10083 lt!377863 lt!377867)))))))

(assert (=> d!107579 (isStrictlySorted!430 (toList!4469 lt!377864))))

(assert (=> d!107579 (= (insertStrictlySorted!270 (toList!4469 lt!377864) (_1!5052 (tuple2!10083 lt!377863 lt!377867)) (_2!5052 (tuple2!10083 lt!377863 lt!377867))) lt!378473)))

(declare-fun b!834243 () Bool)

(assert (=> b!834243 (= e!465408 call!36537)))

(assert (= (and d!107579 c!91055) b!834237))

(assert (= (and d!107579 (not c!91055)) b!834240))

(assert (= (and b!834240 c!91057) b!834241))

(assert (= (and b!834240 (not c!91057)) b!834234))

(assert (= (and b!834234 c!91056) b!834235))

(assert (= (and b!834234 (not c!91056)) b!834243))

(assert (= (or b!834235 b!834243) bm!36536))

(assert (= (or b!834241 bm!36536) bm!36535))

(assert (= (or b!834237 bm!36535) bm!36534))

(assert (= (and bm!36534 c!91058) b!834236))

(assert (= (and bm!36534 (not c!91058)) b!834239))

(assert (= (and d!107579 res!567031) b!834242))

(assert (= (and b!834242 res!567032) b!834238))

(declare-fun m!779367 () Bool)

(assert (=> bm!36534 m!779367))

(declare-fun m!779369 () Bool)

(assert (=> b!834238 m!779369))

(declare-fun m!779371 () Bool)

(assert (=> b!834236 m!779371))

(declare-fun m!779373 () Bool)

(assert (=> b!834242 m!779373))

(declare-fun m!779375 () Bool)

(assert (=> d!107579 m!779375))

(declare-fun m!779377 () Bool)

(assert (=> d!107579 m!779377))

(assert (=> d!106877 d!107579))

(declare-fun d!107581 () Bool)

(declare-fun e!465411 () Bool)

(assert (=> d!107581 e!465411))

(declare-fun res!567033 () Bool)

(assert (=> d!107581 (=> res!567033 e!465411)))

(declare-fun lt!378474 () Bool)

(assert (=> d!107581 (= res!567033 (not lt!378474))))

(declare-fun lt!378477 () Bool)

(assert (=> d!107581 (= lt!378474 lt!378477)))

(declare-fun lt!378475 () Unit!28510)

(declare-fun e!465410 () Unit!28510)

(assert (=> d!107581 (= lt!378475 e!465410)))

(declare-fun c!91059 () Bool)

(assert (=> d!107581 (= c!91059 lt!378477)))

(assert (=> d!107581 (= lt!378477 (containsKey!402 (toList!4469 lt!377921) lt!377924))))

(assert (=> d!107581 (= (contains!4189 lt!377921 lt!377924) lt!378474)))

(declare-fun b!834244 () Bool)

(declare-fun lt!378476 () Unit!28510)

(assert (=> b!834244 (= e!465410 lt!378476)))

(assert (=> b!834244 (= lt!378476 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377921) lt!377924))))

(assert (=> b!834244 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377921) lt!377924))))

(declare-fun b!834245 () Bool)

(declare-fun Unit!28567 () Unit!28510)

(assert (=> b!834245 (= e!465410 Unit!28567)))

(declare-fun b!834246 () Bool)

(assert (=> b!834246 (= e!465411 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377921) lt!377924)))))

(assert (= (and d!107581 c!91059) b!834244))

(assert (= (and d!107581 (not c!91059)) b!834245))

(assert (= (and d!107581 (not res!567033)) b!834246))

(declare-fun m!779379 () Bool)

(assert (=> d!107581 m!779379))

(declare-fun m!779381 () Bool)

(assert (=> b!834244 m!779381))

(assert (=> b!834244 m!777609))

(assert (=> b!834244 m!777609))

(declare-fun m!779383 () Bool)

(assert (=> b!834244 m!779383))

(assert (=> b!834246 m!777609))

(assert (=> b!834246 m!777609))

(assert (=> b!834246 m!779383))

(assert (=> d!106751 d!107581))

(assert (=> d!106751 d!106743))

(declare-fun d!107583 () Bool)

(assert (=> d!107583 (= (apply!373 (+!1991 lt!377921 (tuple2!10083 lt!377933 minValue!754)) lt!377924) (apply!373 lt!377921 lt!377924))))

(assert (=> d!107583 true))

(declare-fun _$34!1153 () Unit!28510)

(assert (=> d!107583 (= (choose!1430 lt!377921 lt!377933 minValue!754 lt!377924) _$34!1153)))

(declare-fun bs!23344 () Bool)

(assert (= bs!23344 d!107583))

(assert (=> bs!23344 m!777199))

(assert (=> bs!23344 m!777199))

(assert (=> bs!23344 m!777201))

(assert (=> bs!23344 m!777211))

(assert (=> d!106751 d!107583))

(assert (=> d!106751 d!106749))

(assert (=> d!106751 d!106737))

(declare-fun d!107585 () Bool)

(assert (=> d!107585 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377871) (_1!5052 lt!377761)))))

(declare-fun lt!378478 () Unit!28510)

(assert (=> d!107585 (= lt!378478 (choose!1433 (toList!4469 lt!377871) (_1!5052 lt!377761)))))

(declare-fun e!465412 () Bool)

(assert (=> d!107585 e!465412))

(declare-fun res!567034 () Bool)

(assert (=> d!107585 (=> (not res!567034) (not e!465412))))

(assert (=> d!107585 (= res!567034 (isStrictlySorted!430 (toList!4469 lt!377871)))))

(assert (=> d!107585 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377871) (_1!5052 lt!377761)) lt!378478)))

(declare-fun b!834247 () Bool)

(assert (=> b!834247 (= e!465412 (containsKey!402 (toList!4469 lt!377871) (_1!5052 lt!377761)))))

(assert (= (and d!107585 res!567034) b!834247))

(assert (=> d!107585 m!777165))

(assert (=> d!107585 m!777165))

(assert (=> d!107585 m!777631))

(declare-fun m!779385 () Bool)

(assert (=> d!107585 m!779385))

(declare-fun m!779387 () Bool)

(assert (=> d!107585 m!779387))

(assert (=> b!834247 m!777627))

(assert (=> b!833063 d!107585))

(assert (=> b!833063 d!106997))

(assert (=> b!833063 d!106789))

(declare-fun d!107587 () Bool)

(declare-fun e!465414 () Bool)

(assert (=> d!107587 e!465414))

(declare-fun res!567035 () Bool)

(assert (=> d!107587 (=> res!567035 e!465414)))

(declare-fun lt!378479 () Bool)

(assert (=> d!107587 (= res!567035 (not lt!378479))))

(declare-fun lt!378482 () Bool)

(assert (=> d!107587 (= lt!378479 lt!378482)))

(declare-fun lt!378480 () Unit!28510)

(declare-fun e!465413 () Unit!28510)

(assert (=> d!107587 (= lt!378480 e!465413)))

(declare-fun c!91060 () Bool)

(assert (=> d!107587 (= c!91060 lt!378482)))

(assert (=> d!107587 (= lt!378482 (containsKey!402 (toList!4469 lt!378172) (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!107587 (= (contains!4189 lt!378172 (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!378479)))

(declare-fun b!834248 () Bool)

(declare-fun lt!378481 () Unit!28510)

(assert (=> b!834248 (= e!465413 lt!378481)))

(assert (=> b!834248 (= lt!378481 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!378172) (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> b!834248 (isDefined!312 (getValueByKey!417 (toList!4469 lt!378172) (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!834249 () Bool)

(declare-fun Unit!28568 () Unit!28510)

(assert (=> b!834249 (= e!465413 Unit!28568)))

(declare-fun b!834250 () Bool)

(assert (=> b!834250 (= e!465414 (isDefined!312 (getValueByKey!417 (toList!4469 lt!378172) (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (= (and d!107587 c!91060) b!834248))

(assert (= (and d!107587 (not c!91060)) b!834249))

(assert (= (and d!107587 (not res!567035)) b!834250))

(declare-fun m!779389 () Bool)

(assert (=> d!107587 m!779389))

(declare-fun m!779391 () Bool)

(assert (=> b!834248 m!779391))

(assert (=> b!834248 m!777949))

(assert (=> b!834248 m!777949))

(declare-fun m!779393 () Bool)

(assert (=> b!834248 m!779393))

(assert (=> b!834250 m!777949))

(assert (=> b!834250 m!777949))

(assert (=> b!834250 m!779393))

(assert (=> d!106861 d!107587))

(declare-fun d!107589 () Bool)

(declare-fun c!91061 () Bool)

(assert (=> d!107589 (= c!91061 (and ((_ is Cons!15848) lt!378171) (= (_1!5052 (h!16984 lt!378171)) (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun e!465415 () Option!423)

(assert (=> d!107589 (= (getValueByKey!417 lt!378171 (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) e!465415)))

(declare-fun b!834253 () Bool)

(declare-fun e!465416 () Option!423)

(assert (=> b!834253 (= e!465416 (getValueByKey!417 (t!22212 lt!378171) (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!834254 () Bool)

(assert (=> b!834254 (= e!465416 None!421)))

(declare-fun b!834252 () Bool)

(assert (=> b!834252 (= e!465415 e!465416)))

(declare-fun c!91062 () Bool)

(assert (=> b!834252 (= c!91062 (and ((_ is Cons!15848) lt!378171) (not (= (_1!5052 (h!16984 lt!378171)) (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!834251 () Bool)

(assert (=> b!834251 (= e!465415 (Some!422 (_2!5052 (h!16984 lt!378171))))))

(assert (= (and d!107589 c!91061) b!834251))

(assert (= (and d!107589 (not c!91061)) b!834252))

(assert (= (and b!834252 c!91062) b!834253))

(assert (= (and b!834252 (not c!91062)) b!834254))

(declare-fun m!779395 () Bool)

(assert (=> b!834253 m!779395))

(assert (=> d!106861 d!107589))

(declare-fun d!107591 () Bool)

(assert (=> d!107591 (= (getValueByKey!417 lt!378171 (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!422 (_2!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!378483 () Unit!28510)

(assert (=> d!107591 (= lt!378483 (choose!1429 lt!378171 (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun e!465417 () Bool)

(assert (=> d!107591 e!465417))

(declare-fun res!567036 () Bool)

(assert (=> d!107591 (=> (not res!567036) (not e!465417))))

(assert (=> d!107591 (= res!567036 (isStrictlySorted!430 lt!378171))))

(assert (=> d!107591 (= (lemmaContainsTupThenGetReturnValue!231 lt!378171 (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!378483)))

(declare-fun b!834255 () Bool)

(declare-fun res!567037 () Bool)

(assert (=> b!834255 (=> (not res!567037) (not e!465417))))

(assert (=> b!834255 (= res!567037 (containsKey!402 lt!378171 (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!834256 () Bool)

(assert (=> b!834256 (= e!465417 (contains!4190 lt!378171 (tuple2!10083 (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (= (and d!107591 res!567036) b!834255))

(assert (= (and b!834255 res!567037) b!834256))

(assert (=> d!107591 m!777943))

(declare-fun m!779397 () Bool)

(assert (=> d!107591 m!779397))

(declare-fun m!779399 () Bool)

(assert (=> d!107591 m!779399))

(declare-fun m!779401 () Bool)

(assert (=> b!834255 m!779401))

(declare-fun m!779403 () Bool)

(assert (=> b!834256 m!779403))

(assert (=> d!106861 d!107591))

(declare-fun call!36541 () List!15852)

(declare-fun c!91063 () Bool)

(declare-fun e!465419 () List!15852)

(declare-fun bm!36537 () Bool)

(assert (=> bm!36537 (= call!36541 ($colon$colon!534 e!465419 (ite c!91063 (h!16984 (toList!4469 call!36434)) (tuple2!10083 (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun c!91066 () Bool)

(assert (=> bm!36537 (= c!91066 c!91063)))

(declare-fun bm!36538 () Bool)

(declare-fun call!36542 () List!15852)

(assert (=> bm!36538 (= call!36542 call!36541)))

(declare-fun bm!36539 () Bool)

(declare-fun call!36540 () List!15852)

(assert (=> bm!36539 (= call!36540 call!36542)))

(declare-fun b!834257 () Bool)

(declare-fun c!91064 () Bool)

(assert (=> b!834257 (= c!91064 (and ((_ is Cons!15848) (toList!4469 call!36434)) (bvsgt (_1!5052 (h!16984 (toList!4469 call!36434))) (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun e!465418 () List!15852)

(declare-fun e!465421 () List!15852)

(assert (=> b!834257 (= e!465418 e!465421)))

(declare-fun b!834258 () Bool)

(assert (=> b!834258 (= e!465421 call!36540)))

(declare-fun b!834259 () Bool)

(assert (=> b!834259 (= e!465419 (insertStrictlySorted!270 (t!22212 (toList!4469 call!36434)) (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!834260 () Bool)

(declare-fun e!465420 () List!15852)

(assert (=> b!834260 (= e!465420 call!36541)))

(declare-fun b!834261 () Bool)

(declare-fun e!465422 () Bool)

(declare-fun lt!378484 () List!15852)

(assert (=> b!834261 (= e!465422 (contains!4190 lt!378484 (tuple2!10083 (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun c!91065 () Bool)

(declare-fun b!834262 () Bool)

(assert (=> b!834262 (= e!465419 (ite c!91065 (t!22212 (toList!4469 call!36434)) (ite c!91064 (Cons!15848 (h!16984 (toList!4469 call!36434)) (t!22212 (toList!4469 call!36434))) Nil!15849)))))

(declare-fun b!834263 () Bool)

(assert (=> b!834263 (= e!465420 e!465418)))

(assert (=> b!834263 (= c!91065 (and ((_ is Cons!15848) (toList!4469 call!36434)) (= (_1!5052 (h!16984 (toList!4469 call!36434))) (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!834264 () Bool)

(assert (=> b!834264 (= e!465418 call!36542)))

(declare-fun b!834265 () Bool)

(declare-fun res!567039 () Bool)

(assert (=> b!834265 (=> (not res!567039) (not e!465422))))

(assert (=> b!834265 (= res!567039 (containsKey!402 lt!378484 (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun d!107593 () Bool)

(assert (=> d!107593 e!465422))

(declare-fun res!567038 () Bool)

(assert (=> d!107593 (=> (not res!567038) (not e!465422))))

(assert (=> d!107593 (= res!567038 (isStrictlySorted!430 lt!378484))))

(assert (=> d!107593 (= lt!378484 e!465420)))

(assert (=> d!107593 (= c!91063 (and ((_ is Cons!15848) (toList!4469 call!36434)) (bvslt (_1!5052 (h!16984 (toList!4469 call!36434))) (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!107593 (isStrictlySorted!430 (toList!4469 call!36434))))

(assert (=> d!107593 (= (insertStrictlySorted!270 (toList!4469 call!36434) (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!378484)))

(declare-fun b!834266 () Bool)

(assert (=> b!834266 (= e!465421 call!36540)))

(assert (= (and d!107593 c!91063) b!834260))

(assert (= (and d!107593 (not c!91063)) b!834263))

(assert (= (and b!834263 c!91065) b!834264))

(assert (= (and b!834263 (not c!91065)) b!834257))

(assert (= (and b!834257 c!91064) b!834258))

(assert (= (and b!834257 (not c!91064)) b!834266))

(assert (= (or b!834258 b!834266) bm!36539))

(assert (= (or b!834264 bm!36539) bm!36538))

(assert (= (or b!834260 bm!36538) bm!36537))

(assert (= (and bm!36537 c!91066) b!834259))

(assert (= (and bm!36537 (not c!91066)) b!834262))

(assert (= (and d!107593 res!567038) b!834265))

(assert (= (and b!834265 res!567039) b!834261))

(declare-fun m!779405 () Bool)

(assert (=> bm!36537 m!779405))

(declare-fun m!779407 () Bool)

(assert (=> b!834261 m!779407))

(declare-fun m!779409 () Bool)

(assert (=> b!834259 m!779409))

(declare-fun m!779411 () Bool)

(assert (=> b!834265 m!779411))

(declare-fun m!779413 () Bool)

(assert (=> d!107593 m!779413))

(declare-fun m!779415 () Bool)

(assert (=> d!107593 m!779415))

(assert (=> d!106861 d!107593))

(declare-fun d!107595 () Bool)

(declare-fun res!567040 () Bool)

(declare-fun e!465423 () Bool)

(assert (=> d!107595 (=> res!567040 e!465423)))

(assert (=> d!107595 (= res!567040 (= (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!377836))))

(assert (=> d!107595 (= (arrayContainsKey!0 _keys!976 lt!377836 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!465423)))

(declare-fun b!834267 () Bool)

(declare-fun e!465424 () Bool)

(assert (=> b!834267 (= e!465423 e!465424)))

(declare-fun res!567041 () Bool)

(assert (=> b!834267 (=> (not res!567041) (not e!465424))))

(assert (=> b!834267 (= res!567041 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22751 _keys!976)))))

(declare-fun b!834268 () Bool)

(assert (=> b!834268 (= e!465424 (arrayContainsKey!0 _keys!976 lt!377836 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!107595 (not res!567040)) b!834267))

(assert (= (and b!834267 res!567041) b!834268))

(assert (=> d!107595 m!777463))

(declare-fun m!779417 () Bool)

(assert (=> b!834268 m!779417))

(assert (=> b!833215 d!107595))

(assert (=> b!833166 d!107415))

(assert (=> b!833166 d!106851))

(declare-fun d!107597 () Bool)

(declare-fun c!91067 () Bool)

(assert (=> d!107597 (= c!91067 ((_ is Nil!15849) (toList!4469 lt!377819)))))

(declare-fun e!465425 () (InoxSet tuple2!10082))

(assert (=> d!107597 (= (content!388 (toList!4469 lt!377819)) e!465425)))

(declare-fun b!834269 () Bool)

(assert (=> b!834269 (= e!465425 ((as const (Array tuple2!10082 Bool)) false))))

(declare-fun b!834270 () Bool)

(assert (=> b!834270 (= e!465425 ((_ map or) (store ((as const (Array tuple2!10082 Bool)) false) (h!16984 (toList!4469 lt!377819)) true) (content!388 (t!22212 (toList!4469 lt!377819)))))))

(assert (= (and d!107597 c!91067) b!834269))

(assert (= (and d!107597 (not c!91067)) b!834270))

(declare-fun m!779419 () Bool)

(assert (=> b!834270 m!779419))

(assert (=> b!834270 m!778875))

(assert (=> d!106769 d!107597))

(declare-fun d!107599 () Bool)

(assert (=> d!107599 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377947) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!378485 () Unit!28510)

(assert (=> d!107599 (= lt!378485 (choose!1433 (toList!4469 lt!377947) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!465426 () Bool)

(assert (=> d!107599 e!465426))

(declare-fun res!567042 () Bool)

(assert (=> d!107599 (=> (not res!567042) (not e!465426))))

(assert (=> d!107599 (= res!567042 (isStrictlySorted!430 (toList!4469 lt!377947)))))

(assert (=> d!107599 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377947) #b0000000000000000000000000000000000000000000000000000000000000000) lt!378485)))

(declare-fun b!834271 () Bool)

(assert (=> b!834271 (= e!465426 (containsKey!402 (toList!4469 lt!377947) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!107599 res!567042) b!834271))

(assert (=> d!107599 m!777749))

(assert (=> d!107599 m!777749))

(assert (=> d!107599 m!777751))

(declare-fun m!779421 () Bool)

(assert (=> d!107599 m!779421))

(assert (=> d!107599 m!778603))

(assert (=> b!834271 m!777745))

(assert (=> b!833125 d!107599))

(assert (=> b!833125 d!107009))

(assert (=> b!833125 d!107011))

(declare-fun d!107601 () Bool)

(declare-fun e!465428 () Bool)

(assert (=> d!107601 e!465428))

(declare-fun res!567043 () Bool)

(assert (=> d!107601 (=> res!567043 e!465428)))

(declare-fun lt!378486 () Bool)

(assert (=> d!107601 (= res!567043 (not lt!378486))))

(declare-fun lt!378489 () Bool)

(assert (=> d!107601 (= lt!378486 lt!378489)))

(declare-fun lt!378487 () Unit!28510)

(declare-fun e!465427 () Unit!28510)

(assert (=> d!107601 (= lt!378487 e!465427)))

(declare-fun c!91068 () Bool)

(assert (=> d!107601 (= c!91068 lt!378489)))

(assert (=> d!107601 (= lt!378489 (containsKey!402 (toList!4469 lt!378080) (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!107601 (= (contains!4189 lt!378080 (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!378486)))

(declare-fun b!834272 () Bool)

(declare-fun lt!378488 () Unit!28510)

(assert (=> b!834272 (= e!465427 lt!378488)))

(assert (=> b!834272 (= lt!378488 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!378080) (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!834272 (isDefined!312 (getValueByKey!417 (toList!4469 lt!378080) (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!834273 () Bool)

(declare-fun Unit!28569 () Unit!28510)

(assert (=> b!834273 (= e!465427 Unit!28569)))

(declare-fun b!834274 () Bool)

(assert (=> b!834274 (= e!465428 (isDefined!312 (getValueByKey!417 (toList!4469 lt!378080) (select (arr!22331 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))))

(assert (= (and d!107601 c!91068) b!834272))

(assert (= (and d!107601 (not c!91068)) b!834273))

(assert (= (and d!107601 (not res!567043)) b!834274))

(assert (=> d!107601 m!777463))

(declare-fun m!779423 () Bool)

(assert (=> d!107601 m!779423))

(assert (=> b!834272 m!777463))

(declare-fun m!779425 () Bool)

(assert (=> b!834272 m!779425))

(assert (=> b!834272 m!777463))

(assert (=> b!834272 m!779111))

(assert (=> b!834272 m!779111))

(declare-fun m!779427 () Bool)

(assert (=> b!834272 m!779427))

(assert (=> b!834274 m!777463))

(assert (=> b!834274 m!779111))

(assert (=> b!834274 m!779111))

(assert (=> b!834274 m!779427))

(assert (=> b!833082 d!107601))

(declare-fun d!107603 () Bool)

(assert (=> d!107603 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377854) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!378490 () Unit!28510)

(assert (=> d!107603 (= lt!378490 (choose!1433 (toList!4469 lt!377854) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!465429 () Bool)

(assert (=> d!107603 e!465429))

(declare-fun res!567044 () Bool)

(assert (=> d!107603 (=> (not res!567044) (not e!465429))))

(assert (=> d!107603 (= res!567044 (isStrictlySorted!430 (toList!4469 lt!377854)))))

(assert (=> d!107603 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377854) #b0000000000000000000000000000000000000000000000000000000000000000) lt!378490)))

(declare-fun b!834275 () Bool)

(assert (=> b!834275 (= e!465429 (containsKey!402 (toList!4469 lt!377854) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!107603 res!567044) b!834275))

(assert (=> d!107603 m!777459))

(assert (=> d!107603 m!777459))

(assert (=> d!107603 m!777461))

(declare-fun m!779429 () Bool)

(assert (=> d!107603 m!779429))

(assert (=> d!107603 m!778367))

(assert (=> b!834275 m!777455))

(assert (=> b!833009 d!107603))

(assert (=> b!833009 d!107039))

(assert (=> b!833009 d!107041))

(declare-fun d!107605 () Bool)

(declare-fun res!567045 () Bool)

(declare-fun e!465430 () Bool)

(assert (=> d!107605 (=> res!567045 e!465430)))

(assert (=> d!107605 (= res!567045 (and ((_ is Cons!15848) lt!378213) (= (_1!5052 (h!16984 lt!378213)) (_1!5052 lt!377756))))))

(assert (=> d!107605 (= (containsKey!402 lt!378213 (_1!5052 lt!377756)) e!465430)))

(declare-fun b!834276 () Bool)

(declare-fun e!465431 () Bool)

(assert (=> b!834276 (= e!465430 e!465431)))

(declare-fun res!567046 () Bool)

(assert (=> b!834276 (=> (not res!567046) (not e!465431))))

(assert (=> b!834276 (= res!567046 (and (or (not ((_ is Cons!15848) lt!378213)) (bvsle (_1!5052 (h!16984 lt!378213)) (_1!5052 lt!377756))) ((_ is Cons!15848) lt!378213) (bvslt (_1!5052 (h!16984 lt!378213)) (_1!5052 lt!377756))))))

(declare-fun b!834277 () Bool)

(assert (=> b!834277 (= e!465431 (containsKey!402 (t!22212 lt!378213) (_1!5052 lt!377756)))))

(assert (= (and d!107605 (not res!567045)) b!834276))

(assert (= (and b!834276 res!567046) b!834277))

(declare-fun m!779431 () Bool)

(assert (=> b!834277 m!779431))

(assert (=> b!833320 d!107605))

(declare-fun lt!378491 () Bool)

(declare-fun d!107607 () Bool)

(assert (=> d!107607 (= lt!378491 (select (content!388 (toList!4469 lt!378060)) (tuple2!10083 lt!377935 zeroValueBefore!34)))))

(declare-fun e!465433 () Bool)

(assert (=> d!107607 (= lt!378491 e!465433)))

(declare-fun res!567048 () Bool)

(assert (=> d!107607 (=> (not res!567048) (not e!465433))))

(assert (=> d!107607 (= res!567048 ((_ is Cons!15848) (toList!4469 lt!378060)))))

(assert (=> d!107607 (= (contains!4190 (toList!4469 lt!378060) (tuple2!10083 lt!377935 zeroValueBefore!34)) lt!378491)))

(declare-fun b!834278 () Bool)

(declare-fun e!465432 () Bool)

(assert (=> b!834278 (= e!465433 e!465432)))

(declare-fun res!567047 () Bool)

(assert (=> b!834278 (=> res!567047 e!465432)))

(assert (=> b!834278 (= res!567047 (= (h!16984 (toList!4469 lt!378060)) (tuple2!10083 lt!377935 zeroValueBefore!34)))))

(declare-fun b!834279 () Bool)

(assert (=> b!834279 (= e!465432 (contains!4190 (t!22212 (toList!4469 lt!378060)) (tuple2!10083 lt!377935 zeroValueBefore!34)))))

(assert (= (and d!107607 res!567048) b!834278))

(assert (= (and b!834278 (not res!567047)) b!834279))

(declare-fun m!779433 () Bool)

(assert (=> d!107607 m!779433))

(declare-fun m!779435 () Bool)

(assert (=> d!107607 m!779435))

(declare-fun m!779437 () Bool)

(assert (=> b!834279 m!779437))

(assert (=> b!833053 d!107607))

(declare-fun d!107609 () Bool)

(declare-fun res!567049 () Bool)

(declare-fun e!465434 () Bool)

(assert (=> d!107609 (=> res!567049 e!465434)))

(assert (=> d!107609 (= res!567049 (and ((_ is Cons!15848) (toList!4469 lt!377925)) (= (_1!5052 (h!16984 (toList!4469 lt!377925))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107609 (= (containsKey!402 (toList!4469 lt!377925) #b1000000000000000000000000000000000000000000000000000000000000000) e!465434)))

(declare-fun b!834280 () Bool)

(declare-fun e!465435 () Bool)

(assert (=> b!834280 (= e!465434 e!465435)))

(declare-fun res!567050 () Bool)

(assert (=> b!834280 (=> (not res!567050) (not e!465435))))

(assert (=> b!834280 (= res!567050 (and (or (not ((_ is Cons!15848) (toList!4469 lt!377925))) (bvsle (_1!5052 (h!16984 (toList!4469 lt!377925))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15848) (toList!4469 lt!377925)) (bvslt (_1!5052 (h!16984 (toList!4469 lt!377925))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!834281 () Bool)

(assert (=> b!834281 (= e!465435 (containsKey!402 (t!22212 (toList!4469 lt!377925)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!107609 (not res!567049)) b!834280))

(assert (= (and b!834280 res!567050) b!834281))

(declare-fun m!779439 () Bool)

(assert (=> b!834281 m!779439))

(assert (=> d!106803 d!107609))

(declare-fun d!107611 () Bool)

(declare-fun lt!378492 () Bool)

(assert (=> d!107611 (= lt!378492 (select (content!388 (t!22212 (toList!4469 lt!377823))) lt!377761))))

(declare-fun e!465437 () Bool)

(assert (=> d!107611 (= lt!378492 e!465437)))

(declare-fun res!567052 () Bool)

(assert (=> d!107611 (=> (not res!567052) (not e!465437))))

(assert (=> d!107611 (= res!567052 ((_ is Cons!15848) (t!22212 (toList!4469 lt!377823))))))

(assert (=> d!107611 (= (contains!4190 (t!22212 (toList!4469 lt!377823)) lt!377761) lt!378492)))

(declare-fun b!834282 () Bool)

(declare-fun e!465436 () Bool)

(assert (=> b!834282 (= e!465437 e!465436)))

(declare-fun res!567051 () Bool)

(assert (=> b!834282 (=> res!567051 e!465436)))

(assert (=> b!834282 (= res!567051 (= (h!16984 (t!22212 (toList!4469 lt!377823))) lt!377761))))

(declare-fun b!834283 () Bool)

(assert (=> b!834283 (= e!465436 (contains!4190 (t!22212 (t!22212 (toList!4469 lt!377823))) lt!377761))))

(assert (= (and d!107611 res!567052) b!834282))

(assert (= (and b!834282 (not res!567051)) b!834283))

(assert (=> d!107611 m!778479))

(declare-fun m!779441 () Bool)

(assert (=> d!107611 m!779441))

(declare-fun m!779443 () Bool)

(assert (=> b!834283 m!779443))

(assert (=> b!833062 d!107611))

(assert (=> d!106747 d!106727))

(assert (=> d!106747 d!106729))

(declare-fun d!107613 () Bool)

(declare-fun e!465439 () Bool)

(assert (=> d!107613 e!465439))

(declare-fun res!567053 () Bool)

(assert (=> d!107613 (=> res!567053 e!465439)))

(declare-fun lt!378493 () Bool)

(assert (=> d!107613 (= res!567053 (not lt!378493))))

(declare-fun lt!378496 () Bool)

(assert (=> d!107613 (= lt!378493 lt!378496)))

(declare-fun lt!378494 () Unit!28510)

(declare-fun e!465438 () Unit!28510)

(assert (=> d!107613 (= lt!378494 e!465438)))

(declare-fun c!91069 () Bool)

(assert (=> d!107613 (= c!91069 lt!378496)))

(assert (=> d!107613 (= lt!378496 (containsKey!402 (toList!4469 lt!377934) lt!377937))))

(assert (=> d!107613 (= (contains!4189 lt!377934 lt!377937) lt!378493)))

(declare-fun b!834284 () Bool)

(declare-fun lt!378495 () Unit!28510)

(assert (=> b!834284 (= e!465438 lt!378495)))

(assert (=> b!834284 (= lt!378495 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377934) lt!377937))))

(assert (=> b!834284 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377934) lt!377937))))

(declare-fun b!834285 () Bool)

(declare-fun Unit!28570 () Unit!28510)

(assert (=> b!834285 (= e!465438 Unit!28570)))

(declare-fun b!834286 () Bool)

(assert (=> b!834286 (= e!465439 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377934) lt!377937)))))

(assert (= (and d!107613 c!91069) b!834284))

(assert (= (and d!107613 (not c!91069)) b!834285))

(assert (= (and d!107613 (not res!567053)) b!834286))

(declare-fun m!779445 () Bool)

(assert (=> d!107613 m!779445))

(declare-fun m!779447 () Bool)

(assert (=> b!834284 m!779447))

(assert (=> b!834284 m!777537))

(assert (=> b!834284 m!777537))

(declare-fun m!779449 () Bool)

(assert (=> b!834284 m!779449))

(assert (=> b!834286 m!777537))

(assert (=> b!834286 m!777537))

(assert (=> b!834286 m!779449))

(assert (=> d!106747 d!107613))

(assert (=> d!106747 d!106731))

(declare-fun d!107615 () Bool)

(assert (=> d!107615 (= (apply!373 (+!1991 lt!377934 (tuple2!10083 lt!377928 minValue!754)) lt!377937) (apply!373 lt!377934 lt!377937))))

(assert (=> d!107615 true))

(declare-fun _$34!1154 () Unit!28510)

(assert (=> d!107615 (= (choose!1430 lt!377934 lt!377928 minValue!754 lt!377937) _$34!1154)))

(declare-fun bs!23345 () Bool)

(assert (= bs!23345 d!107615))

(assert (=> bs!23345 m!777203))

(assert (=> bs!23345 m!777203))

(assert (=> bs!23345 m!777205))

(assert (=> bs!23345 m!777221))

(assert (=> d!106747 d!107615))

(declare-fun c!91070 () Bool)

(declare-fun d!107617 () Bool)

(assert (=> d!107617 (= c!91070 (and ((_ is Cons!15848) (toList!4469 lt!378200)) (= (_1!5052 (h!16984 (toList!4469 lt!378200))) (_1!5052 (tuple2!10083 lt!377863 lt!377867)))))))

(declare-fun e!465440 () Option!423)

(assert (=> d!107617 (= (getValueByKey!417 (toList!4469 lt!378200) (_1!5052 (tuple2!10083 lt!377863 lt!377867))) e!465440)))

(declare-fun b!834289 () Bool)

(declare-fun e!465441 () Option!423)

(assert (=> b!834289 (= e!465441 (getValueByKey!417 (t!22212 (toList!4469 lt!378200)) (_1!5052 (tuple2!10083 lt!377863 lt!377867))))))

(declare-fun b!834290 () Bool)

(assert (=> b!834290 (= e!465441 None!421)))

(declare-fun b!834288 () Bool)

(assert (=> b!834288 (= e!465440 e!465441)))

(declare-fun c!91071 () Bool)

(assert (=> b!834288 (= c!91071 (and ((_ is Cons!15848) (toList!4469 lt!378200)) (not (= (_1!5052 (h!16984 (toList!4469 lt!378200))) (_1!5052 (tuple2!10083 lt!377863 lt!377867))))))))

(declare-fun b!834287 () Bool)

(assert (=> b!834287 (= e!465440 (Some!422 (_2!5052 (h!16984 (toList!4469 lt!378200)))))))

(assert (= (and d!107617 c!91070) b!834287))

(assert (= (and d!107617 (not c!91070)) b!834288))

(assert (= (and b!834288 c!91071) b!834289))

(assert (= (and b!834288 (not c!91071)) b!834290))

(declare-fun m!779451 () Bool)

(assert (=> b!834289 m!779451))

(assert (=> b!833280 d!107617))

(declare-fun d!107619 () Bool)

(declare-fun lt!378497 () Bool)

(assert (=> d!107619 (= lt!378497 (select (content!388 lt!377814) (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))))))

(declare-fun e!465443 () Bool)

(assert (=> d!107619 (= lt!378497 e!465443)))

(declare-fun res!567055 () Bool)

(assert (=> d!107619 (=> (not res!567055) (not e!465443))))

(assert (=> d!107619 (= res!567055 ((_ is Cons!15848) lt!377814))))

(assert (=> d!107619 (= (contains!4190 lt!377814 (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))) lt!378497)))

(declare-fun b!834291 () Bool)

(declare-fun e!465442 () Bool)

(assert (=> b!834291 (= e!465443 e!465442)))

(declare-fun res!567054 () Bool)

(assert (=> b!834291 (=> res!567054 e!465442)))

(assert (=> b!834291 (= res!567054 (= (h!16984 lt!377814) (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))))))

(declare-fun b!834292 () Bool)

(assert (=> b!834292 (= e!465442 (contains!4190 (t!22212 lt!377814) (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))))))

(assert (= (and d!107619 res!567055) b!834291))

(assert (= (and b!834291 (not res!567054)) b!834292))

(declare-fun m!779453 () Bool)

(assert (=> d!107619 m!779453))

(declare-fun m!779455 () Bool)

(assert (=> d!107619 m!779455))

(declare-fun m!779457 () Bool)

(assert (=> b!834292 m!779457))

(assert (=> b!833292 d!107619))

(declare-fun bm!36540 () Bool)

(declare-fun c!91072 () Bool)

(declare-fun e!465445 () List!15852)

(declare-fun call!36544 () List!15852)

(assert (=> bm!36540 (= call!36544 ($colon$colon!534 e!465445 (ite c!91072 (h!16984 (t!22212 (toList!4469 lt!377759))) (tuple2!10083 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun c!91075 () Bool)

(assert (=> bm!36540 (= c!91075 c!91072)))

(declare-fun bm!36541 () Bool)

(declare-fun call!36545 () List!15852)

(assert (=> bm!36541 (= call!36545 call!36544)))

(declare-fun bm!36542 () Bool)

(declare-fun call!36543 () List!15852)

(assert (=> bm!36542 (= call!36543 call!36545)))

(declare-fun b!834293 () Bool)

(declare-fun c!91073 () Bool)

(assert (=> b!834293 (= c!91073 (and ((_ is Cons!15848) (t!22212 (toList!4469 lt!377759))) (bvsgt (_1!5052 (h!16984 (t!22212 (toList!4469 lt!377759)))) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!465444 () List!15852)

(declare-fun e!465447 () List!15852)

(assert (=> b!834293 (= e!465444 e!465447)))

(declare-fun b!834294 () Bool)

(assert (=> b!834294 (= e!465447 call!36543)))

(declare-fun b!834295 () Bool)

(assert (=> b!834295 (= e!465445 (insertStrictlySorted!270 (t!22212 (t!22212 (toList!4469 lt!377759))) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!834296 () Bool)

(declare-fun e!465446 () List!15852)

(assert (=> b!834296 (= e!465446 call!36544)))

(declare-fun b!834297 () Bool)

(declare-fun e!465448 () Bool)

(declare-fun lt!378498 () List!15852)

(assert (=> b!834297 (= e!465448 (contains!4190 lt!378498 (tuple2!10083 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!834298 () Bool)

(declare-fun c!91074 () Bool)

(assert (=> b!834298 (= e!465445 (ite c!91074 (t!22212 (t!22212 (toList!4469 lt!377759))) (ite c!91073 (Cons!15848 (h!16984 (t!22212 (toList!4469 lt!377759))) (t!22212 (t!22212 (toList!4469 lt!377759)))) Nil!15849)))))

(declare-fun b!834299 () Bool)

(assert (=> b!834299 (= e!465446 e!465444)))

(assert (=> b!834299 (= c!91074 (and ((_ is Cons!15848) (t!22212 (toList!4469 lt!377759))) (= (_1!5052 (h!16984 (t!22212 (toList!4469 lt!377759)))) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!834300 () Bool)

(assert (=> b!834300 (= e!465444 call!36545)))

(declare-fun b!834301 () Bool)

(declare-fun res!567057 () Bool)

(assert (=> b!834301 (=> (not res!567057) (not e!465448))))

(assert (=> b!834301 (= res!567057 (containsKey!402 lt!378498 (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun d!107621 () Bool)

(assert (=> d!107621 e!465448))

(declare-fun res!567056 () Bool)

(assert (=> d!107621 (=> (not res!567056) (not e!465448))))

(assert (=> d!107621 (= res!567056 (isStrictlySorted!430 lt!378498))))

(assert (=> d!107621 (= lt!378498 e!465446)))

(assert (=> d!107621 (= c!91072 (and ((_ is Cons!15848) (t!22212 (toList!4469 lt!377759))) (bvslt (_1!5052 (h!16984 (t!22212 (toList!4469 lt!377759)))) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!107621 (isStrictlySorted!430 (t!22212 (toList!4469 lt!377759)))))

(assert (=> d!107621 (= (insertStrictlySorted!270 (t!22212 (toList!4469 lt!377759)) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!378498)))

(declare-fun b!834302 () Bool)

(assert (=> b!834302 (= e!465447 call!36543)))

(assert (= (and d!107621 c!91072) b!834296))

(assert (= (and d!107621 (not c!91072)) b!834299))

(assert (= (and b!834299 c!91074) b!834300))

(assert (= (and b!834299 (not c!91074)) b!834293))

(assert (= (and b!834293 c!91073) b!834294))

(assert (= (and b!834293 (not c!91073)) b!834302))

(assert (= (or b!834294 b!834302) bm!36542))

(assert (= (or b!834300 bm!36542) bm!36541))

(assert (= (or b!834296 bm!36541) bm!36540))

(assert (= (and bm!36540 c!91075) b!834295))

(assert (= (and bm!36540 (not c!91075)) b!834298))

(assert (= (and d!107621 res!567056) b!834301))

(assert (= (and b!834301 res!567057) b!834297))

(declare-fun m!779459 () Bool)

(assert (=> bm!36540 m!779459))

(declare-fun m!779461 () Bool)

(assert (=> b!834297 m!779461))

(declare-fun m!779463 () Bool)

(assert (=> b!834295 m!779463))

(declare-fun m!779465 () Bool)

(assert (=> b!834301 m!779465))

(declare-fun m!779467 () Bool)

(assert (=> d!107621 m!779467))

(assert (=> d!107621 m!778735))

(assert (=> b!833143 d!107621))

(assert (=> b!833204 d!107433))

(assert (=> b!833204 d!107435))

(declare-fun d!107623 () Bool)

(declare-fun res!567058 () Bool)

(declare-fun e!465449 () Bool)

(assert (=> d!107623 (=> res!567058 e!465449)))

(assert (=> d!107623 (= res!567058 (and ((_ is Cons!15848) lt!377826) (= (_1!5052 (h!16984 lt!377826)) (_1!5052 lt!377756))))))

(assert (=> d!107623 (= (containsKey!402 lt!377826 (_1!5052 lt!377756)) e!465449)))

(declare-fun b!834303 () Bool)

(declare-fun e!465450 () Bool)

(assert (=> b!834303 (= e!465449 e!465450)))

(declare-fun res!567059 () Bool)

(assert (=> b!834303 (=> (not res!567059) (not e!465450))))

(assert (=> b!834303 (= res!567059 (and (or (not ((_ is Cons!15848) lt!377826)) (bvsle (_1!5052 (h!16984 lt!377826)) (_1!5052 lt!377756))) ((_ is Cons!15848) lt!377826) (bvslt (_1!5052 (h!16984 lt!377826)) (_1!5052 lt!377756))))))

(declare-fun b!834304 () Bool)

(assert (=> b!834304 (= e!465450 (containsKey!402 (t!22212 lt!377826) (_1!5052 lt!377756)))))

(assert (= (and d!107623 (not res!567058)) b!834303))

(assert (= (and b!834303 res!567059) b!834304))

(declare-fun m!779469 () Bool)

(assert (=> b!834304 m!779469))

(assert (=> b!833171 d!107623))

(declare-fun d!107625 () Bool)

(declare-fun c!91076 () Bool)

(assert (=> d!107625 (= c!91076 (and ((_ is Cons!15848) (toList!4469 lt!378172)) (= (_1!5052 (h!16984 (toList!4469 lt!378172))) (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun e!465451 () Option!423)

(assert (=> d!107625 (= (getValueByKey!417 (toList!4469 lt!378172) (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) e!465451)))

(declare-fun b!834307 () Bool)

(declare-fun e!465452 () Option!423)

(assert (=> b!834307 (= e!465452 (getValueByKey!417 (t!22212 (toList!4469 lt!378172)) (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!834308 () Bool)

(assert (=> b!834308 (= e!465452 None!421)))

(declare-fun b!834306 () Bool)

(assert (=> b!834306 (= e!465451 e!465452)))

(declare-fun c!91077 () Bool)

(assert (=> b!834306 (= c!91077 (and ((_ is Cons!15848) (toList!4469 lt!378172)) (not (= (_1!5052 (h!16984 (toList!4469 lt!378172))) (_1!5052 (tuple2!10083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!834305 () Bool)

(assert (=> b!834305 (= e!465451 (Some!422 (_2!5052 (h!16984 (toList!4469 lt!378172)))))))

(assert (= (and d!107625 c!91076) b!834305))

(assert (= (and d!107625 (not c!91076)) b!834306))

(assert (= (and b!834306 c!91077) b!834307))

(assert (= (and b!834306 (not c!91077)) b!834308))

(declare-fun m!779471 () Bool)

(assert (=> b!834307 m!779471))

(assert (=> b!833261 d!107625))

(assert (=> b!832926 d!107423))

(assert (=> b!832926 d!106713))

(declare-fun d!107627 () Bool)

(assert (=> d!107627 (= (get!11827 (getValueByKey!417 (toList!4469 lt!377854) (select (arr!22331 _keys!976) #b00000000000000000000000000000000))) (v!10101 (getValueByKey!417 (toList!4469 lt!377854) (select (arr!22331 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!106721 d!107627))

(assert (=> d!106721 d!107037))

(assert (=> b!833015 d!107013))

(declare-fun d!107629 () Bool)

(declare-fun c!91078 () Bool)

(assert (=> d!107629 (= c!91078 (and ((_ is Cons!15848) (t!22212 lt!377818)) (= (_1!5052 (h!16984 (t!22212 lt!377818))) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!465453 () Option!423)

(assert (=> d!107629 (= (getValueByKey!417 (t!22212 lt!377818) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!465453)))

(declare-fun b!834311 () Bool)

(declare-fun e!465454 () Option!423)

(assert (=> b!834311 (= e!465454 (getValueByKey!417 (t!22212 (t!22212 lt!377818)) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!834312 () Bool)

(assert (=> b!834312 (= e!465454 None!421)))

(declare-fun b!834310 () Bool)

(assert (=> b!834310 (= e!465453 e!465454)))

(declare-fun c!91079 () Bool)

(assert (=> b!834310 (= c!91079 (and ((_ is Cons!15848) (t!22212 lt!377818)) (not (= (_1!5052 (h!16984 (t!22212 lt!377818))) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun b!834309 () Bool)

(assert (=> b!834309 (= e!465453 (Some!422 (_2!5052 (h!16984 (t!22212 lt!377818)))))))

(assert (= (and d!107629 c!91078) b!834309))

(assert (= (and d!107629 (not c!91078)) b!834310))

(assert (= (and b!834310 c!91079) b!834311))

(assert (= (and b!834310 (not c!91079)) b!834312))

(declare-fun m!779473 () Bool)

(assert (=> b!834311 m!779473))

(assert (=> b!833137 d!107629))

(declare-fun d!107631 () Bool)

(declare-fun e!465456 () Bool)

(assert (=> d!107631 e!465456))

(declare-fun res!567060 () Bool)

(assert (=> d!107631 (=> res!567060 e!465456)))

(declare-fun lt!378499 () Bool)

(assert (=> d!107631 (= res!567060 (not lt!378499))))

(declare-fun lt!378502 () Bool)

(assert (=> d!107631 (= lt!378499 lt!378502)))

(declare-fun lt!378500 () Unit!28510)

(declare-fun e!465455 () Unit!28510)

(assert (=> d!107631 (= lt!378500 e!465455)))

(declare-fun c!91080 () Bool)

(assert (=> d!107631 (= c!91080 lt!378502)))

(assert (=> d!107631 (= lt!378502 (containsKey!402 (toList!4469 lt!378080) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!107631 (= (contains!4189 lt!378080 #b1000000000000000000000000000000000000000000000000000000000000000) lt!378499)))

(declare-fun b!834313 () Bool)

(declare-fun lt!378501 () Unit!28510)

(assert (=> b!834313 (= e!465455 lt!378501)))

(assert (=> b!834313 (= lt!378501 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!378080) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!834313 (isDefined!312 (getValueByKey!417 (toList!4469 lt!378080) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!834314 () Bool)

(declare-fun Unit!28571 () Unit!28510)

(assert (=> b!834314 (= e!465455 Unit!28571)))

(declare-fun b!834315 () Bool)

(assert (=> b!834315 (= e!465456 (isDefined!312 (getValueByKey!417 (toList!4469 lt!378080) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!107631 c!91080) b!834313))

(assert (= (and d!107631 (not c!91080)) b!834314))

(assert (= (and d!107631 (not res!567060)) b!834315))

(declare-fun m!779475 () Bool)

(assert (=> d!107631 m!779475))

(declare-fun m!779477 () Bool)

(assert (=> b!834313 m!779477))

(declare-fun m!779479 () Bool)

(assert (=> b!834313 m!779479))

(assert (=> b!834313 m!779479))

(declare-fun m!779481 () Bool)

(assert (=> b!834313 m!779481))

(assert (=> b!834315 m!779479))

(assert (=> b!834315 m!779479))

(assert (=> b!834315 m!779481))

(assert (=> b!833089 d!107631))

(declare-fun d!107633 () Bool)

(assert (=> d!107633 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377819) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!378503 () Unit!28510)

(assert (=> d!107633 (= lt!378503 (choose!1433 (toList!4469 lt!377819) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun e!465457 () Bool)

(assert (=> d!107633 e!465457))

(declare-fun res!567061 () Bool)

(assert (=> d!107633 (=> (not res!567061) (not e!465457))))

(assert (=> d!107633 (= res!567061 (isStrictlySorted!430 (toList!4469 lt!377819)))))

(assert (=> d!107633 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377819) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!378503)))

(declare-fun b!834316 () Bool)

(assert (=> b!834316 (= e!465457 (containsKey!402 (toList!4469 lt!377819) (_1!5052 (tuple2!10083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and d!107633 res!567061) b!834316))

(assert (=> d!107633 m!777065))

(assert (=> d!107633 m!777065))

(assert (=> d!107633 m!777759))

(declare-fun m!779483 () Bool)

(assert (=> d!107633 m!779483))

(declare-fun m!779485 () Bool)

(assert (=> d!107633 m!779485))

(assert (=> b!834316 m!777755))

(assert (=> b!833132 d!107633))

(assert (=> b!833132 d!107059))

(assert (=> b!833132 d!106841))

(declare-fun d!107635 () Bool)

(declare-fun res!567062 () Bool)

(declare-fun e!465458 () Bool)

(assert (=> d!107635 (=> res!567062 e!465458)))

(assert (=> d!107635 (= res!567062 (and ((_ is Cons!15848) (toList!4469 lt!377871)) (= (_1!5052 (h!16984 (toList!4469 lt!377871))) (_1!5052 lt!377761))))))

(assert (=> d!107635 (= (containsKey!402 (toList!4469 lt!377871) (_1!5052 lt!377761)) e!465458)))

(declare-fun b!834317 () Bool)

(declare-fun e!465459 () Bool)

(assert (=> b!834317 (= e!465458 e!465459)))

(declare-fun res!567063 () Bool)

(assert (=> b!834317 (=> (not res!567063) (not e!465459))))

(assert (=> b!834317 (= res!567063 (and (or (not ((_ is Cons!15848) (toList!4469 lt!377871))) (bvsle (_1!5052 (h!16984 (toList!4469 lt!377871))) (_1!5052 lt!377761))) ((_ is Cons!15848) (toList!4469 lt!377871)) (bvslt (_1!5052 (h!16984 (toList!4469 lt!377871))) (_1!5052 lt!377761))))))

(declare-fun b!834318 () Bool)

(assert (=> b!834318 (= e!465459 (containsKey!402 (t!22212 (toList!4469 lt!377871)) (_1!5052 lt!377761)))))

(assert (= (and d!107635 (not res!567062)) b!834317))

(assert (= (and b!834317 res!567063) b!834318))

(declare-fun m!779487 () Bool)

(assert (=> b!834318 m!779487))

(assert (=> d!106757 d!107635))

(declare-fun d!107637 () Bool)

(assert (=> d!107637 (= (get!11827 (getValueByKey!417 (toList!4469 lt!377925) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!10101 (getValueByKey!417 (toList!4469 lt!377925) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106693 d!107637))

(assert (=> d!106693 d!106921))

(declare-fun d!107639 () Bool)

(declare-fun c!91081 () Bool)

(assert (=> d!107639 (= c!91081 (and ((_ is Cons!15848) (t!22212 lt!377874)) (= (_1!5052 (h!16984 (t!22212 lt!377874))) (_1!5052 lt!377756))))))

(declare-fun e!465460 () Option!423)

(assert (=> d!107639 (= (getValueByKey!417 (t!22212 lt!377874) (_1!5052 lt!377756)) e!465460)))

(declare-fun b!834321 () Bool)

(declare-fun e!465461 () Option!423)

(assert (=> b!834321 (= e!465461 (getValueByKey!417 (t!22212 (t!22212 lt!377874)) (_1!5052 lt!377756)))))

(declare-fun b!834322 () Bool)

(assert (=> b!834322 (= e!465461 None!421)))

(declare-fun b!834320 () Bool)

(assert (=> b!834320 (= e!465460 e!465461)))

(declare-fun c!91082 () Bool)

(assert (=> b!834320 (= c!91082 (and ((_ is Cons!15848) (t!22212 lt!377874)) (not (= (_1!5052 (h!16984 (t!22212 lt!377874))) (_1!5052 lt!377756)))))))

(declare-fun b!834319 () Bool)

(assert (=> b!834319 (= e!465460 (Some!422 (_2!5052 (h!16984 (t!22212 lt!377874)))))))

(assert (= (and d!107639 c!91081) b!834319))

(assert (= (and d!107639 (not c!91081)) b!834320))

(assert (= (and b!834320 c!91082) b!834321))

(assert (= (and b!834320 (not c!91082)) b!834322))

(declare-fun m!779489 () Bool)

(assert (=> b!834321 m!779489))

(assert (=> b!833108 d!107639))

(declare-fun d!107641 () Bool)

(declare-fun c!91083 () Bool)

(assert (=> d!107641 (= c!91083 ((_ is Nil!15849) (toList!4469 lt!377875)))))

(declare-fun e!465462 () (InoxSet tuple2!10082))

(assert (=> d!107641 (= (content!388 (toList!4469 lt!377875)) e!465462)))

(declare-fun b!834323 () Bool)

(assert (=> b!834323 (= e!465462 ((as const (Array tuple2!10082 Bool)) false))))

(declare-fun b!834324 () Bool)

(assert (=> b!834324 (= e!465462 ((_ map or) (store ((as const (Array tuple2!10082 Bool)) false) (h!16984 (toList!4469 lt!377875)) true) (content!388 (t!22212 (toList!4469 lt!377875)))))))

(assert (= (and d!107641 c!91083) b!834323))

(assert (= (and d!107641 (not c!91083)) b!834324))

(declare-fun m!779491 () Bool)

(assert (=> b!834324 m!779491))

(declare-fun m!779493 () Bool)

(assert (=> b!834324 m!779493))

(assert (=> d!106661 d!107641))

(declare-fun d!107643 () Bool)

(assert (=> d!107643 (= (apply!373 (+!1991 lt!377943 (tuple2!10083 lt!377955 minValue!754)) lt!377946) (apply!373 lt!377943 lt!377946))))

(assert (=> d!107643 true))

(declare-fun _$34!1155 () Unit!28510)

(assert (=> d!107643 (= (choose!1430 lt!377943 lt!377955 minValue!754 lt!377946) _$34!1155)))

(declare-fun bs!23346 () Bool)

(assert (= bs!23346 d!107643))

(assert (=> bs!23346 m!777245))

(assert (=> bs!23346 m!777245))

(assert (=> bs!23346 m!777247))

(assert (=> bs!23346 m!777257))

(assert (=> d!106689 d!107643))

(assert (=> d!106689 d!106667))

(declare-fun d!107645 () Bool)

(declare-fun e!465464 () Bool)

(assert (=> d!107645 e!465464))

(declare-fun res!567064 () Bool)

(assert (=> d!107645 (=> res!567064 e!465464)))

(declare-fun lt!378504 () Bool)

(assert (=> d!107645 (= res!567064 (not lt!378504))))

(declare-fun lt!378507 () Bool)

(assert (=> d!107645 (= lt!378504 lt!378507)))

(declare-fun lt!378505 () Unit!28510)

(declare-fun e!465463 () Unit!28510)

(assert (=> d!107645 (= lt!378505 e!465463)))

(declare-fun c!91084 () Bool)

(assert (=> d!107645 (= c!91084 lt!378507)))

(assert (=> d!107645 (= lt!378507 (containsKey!402 (toList!4469 lt!377943) lt!377946))))

(assert (=> d!107645 (= (contains!4189 lt!377943 lt!377946) lt!378504)))

(declare-fun b!834325 () Bool)

(declare-fun lt!378506 () Unit!28510)

(assert (=> b!834325 (= e!465463 lt!378506)))

(assert (=> b!834325 (= lt!378506 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!377943) lt!377946))))

(assert (=> b!834325 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377943) lt!377946))))

(declare-fun b!834326 () Bool)

(declare-fun Unit!28572 () Unit!28510)

(assert (=> b!834326 (= e!465463 Unit!28572)))

(declare-fun b!834327 () Bool)

(assert (=> b!834327 (= e!465464 (isDefined!312 (getValueByKey!417 (toList!4469 lt!377943) lt!377946)))))

(assert (= (and d!107645 c!91084) b!834325))

(assert (= (and d!107645 (not c!91084)) b!834326))

(assert (= (and d!107645 (not res!567064)) b!834327))

(declare-fun m!779495 () Bool)

(assert (=> d!107645 m!779495))

(declare-fun m!779497 () Bool)

(assert (=> b!834325 m!779497))

(assert (=> b!834325 m!777425))

(assert (=> b!834325 m!777425))

(declare-fun m!779499 () Bool)

(assert (=> b!834325 m!779499))

(assert (=> b!834327 m!777425))

(assert (=> b!834327 m!777425))

(assert (=> b!834327 m!779499))

(assert (=> d!106689 d!107645))

(assert (=> d!106689 d!106673))

(assert (=> d!106689 d!106691))

(declare-fun d!107647 () Bool)

(declare-fun lt!378508 () Bool)

(assert (=> d!107647 (= lt!378508 (select (content!388 (toList!4469 lt!377996)) (tuple2!10083 lt!377950 minValue!754)))))

(declare-fun e!465466 () Bool)

(assert (=> d!107647 (= lt!378508 e!465466)))

(declare-fun res!567066 () Bool)

(assert (=> d!107647 (=> (not res!567066) (not e!465466))))

(assert (=> d!107647 (= res!567066 ((_ is Cons!15848) (toList!4469 lt!377996)))))

(assert (=> d!107647 (= (contains!4190 (toList!4469 lt!377996) (tuple2!10083 lt!377950 minValue!754)) lt!378508)))

(declare-fun b!834328 () Bool)

(declare-fun e!465465 () Bool)

(assert (=> b!834328 (= e!465466 e!465465)))

(declare-fun res!567065 () Bool)

(assert (=> b!834328 (=> res!567065 e!465465)))

(assert (=> b!834328 (= res!567065 (= (h!16984 (toList!4469 lt!377996)) (tuple2!10083 lt!377950 minValue!754)))))

(declare-fun b!834329 () Bool)

(assert (=> b!834329 (= e!465465 (contains!4190 (t!22212 (toList!4469 lt!377996)) (tuple2!10083 lt!377950 minValue!754)))))

(assert (= (and d!107647 res!567066) b!834328))

(assert (= (and b!834328 (not res!567065)) b!834329))

(declare-fun m!779501 () Bool)

(assert (=> d!107647 m!779501))

(declare-fun m!779503 () Bool)

(assert (=> d!107647 m!779503))

(declare-fun m!779505 () Bool)

(assert (=> b!834329 m!779505))

(assert (=> b!832982 d!107647))

(declare-fun d!107649 () Bool)

(declare-fun res!567067 () Bool)

(declare-fun e!465467 () Bool)

(assert (=> d!107649 (=> res!567067 e!465467)))

(assert (=> d!107649 (= res!567067 (and ((_ is Cons!15848) (toList!4469 lt!377947)) (= (_1!5052 (h!16984 (toList!4469 lt!377947))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107649 (= (containsKey!402 (toList!4469 lt!377947) #b0000000000000000000000000000000000000000000000000000000000000000) e!465467)))

(declare-fun b!834330 () Bool)

(declare-fun e!465468 () Bool)

(assert (=> b!834330 (= e!465467 e!465468)))

(declare-fun res!567068 () Bool)

(assert (=> b!834330 (=> (not res!567068) (not e!465468))))

(assert (=> b!834330 (= res!567068 (and (or (not ((_ is Cons!15848) (toList!4469 lt!377947))) (bvsle (_1!5052 (h!16984 (toList!4469 lt!377947))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15848) (toList!4469 lt!377947)) (bvslt (_1!5052 (h!16984 (toList!4469 lt!377947))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!834331 () Bool)

(assert (=> b!834331 (= e!465468 (containsKey!402 (t!22212 (toList!4469 lt!377947)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!107649 (not res!567067)) b!834330))

(assert (= (and b!834330 res!567068) b!834331))

(declare-fun m!779507 () Bool)

(assert (=> b!834331 m!779507))

(assert (=> d!106787 d!107649))

(declare-fun call!36547 () List!15852)

(declare-fun e!465470 () List!15852)

(declare-fun bm!36543 () Bool)

(declare-fun c!91085 () Bool)

(assert (=> bm!36543 (= call!36547 ($colon$colon!534 e!465470 (ite c!91085 (h!16984 (t!22212 (toList!4469 lt!377759))) (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756)))))))

(declare-fun c!91088 () Bool)

(assert (=> bm!36543 (= c!91088 c!91085)))

(declare-fun bm!36544 () Bool)

(declare-fun call!36548 () List!15852)

(assert (=> bm!36544 (= call!36548 call!36547)))

(declare-fun bm!36545 () Bool)

(declare-fun call!36546 () List!15852)

(assert (=> bm!36545 (= call!36546 call!36548)))

(declare-fun b!834332 () Bool)

(declare-fun c!91086 () Bool)

(assert (=> b!834332 (= c!91086 (and ((_ is Cons!15848) (t!22212 (toList!4469 lt!377759))) (bvsgt (_1!5052 (h!16984 (t!22212 (toList!4469 lt!377759)))) (_1!5052 lt!377756))))))

(declare-fun e!465469 () List!15852)

(declare-fun e!465472 () List!15852)

(assert (=> b!834332 (= e!465469 e!465472)))

(declare-fun b!834333 () Bool)

(assert (=> b!834333 (= e!465472 call!36546)))

(declare-fun b!834334 () Bool)

(assert (=> b!834334 (= e!465470 (insertStrictlySorted!270 (t!22212 (t!22212 (toList!4469 lt!377759))) (_1!5052 lt!377756) (_2!5052 lt!377756)))))

(declare-fun b!834335 () Bool)

(declare-fun e!465471 () List!15852)

(assert (=> b!834335 (= e!465471 call!36547)))

(declare-fun b!834336 () Bool)

(declare-fun e!465473 () Bool)

(declare-fun lt!378509 () List!15852)

(assert (=> b!834336 (= e!465473 (contains!4190 lt!378509 (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))))))

(declare-fun b!834337 () Bool)

(declare-fun c!91087 () Bool)

(assert (=> b!834337 (= e!465470 (ite c!91087 (t!22212 (t!22212 (toList!4469 lt!377759))) (ite c!91086 (Cons!15848 (h!16984 (t!22212 (toList!4469 lt!377759))) (t!22212 (t!22212 (toList!4469 lt!377759)))) Nil!15849)))))

(declare-fun b!834338 () Bool)

(assert (=> b!834338 (= e!465471 e!465469)))

(assert (=> b!834338 (= c!91087 (and ((_ is Cons!15848) (t!22212 (toList!4469 lt!377759))) (= (_1!5052 (h!16984 (t!22212 (toList!4469 lt!377759)))) (_1!5052 lt!377756))))))

(declare-fun b!834339 () Bool)

(assert (=> b!834339 (= e!465469 call!36548)))

(declare-fun b!834340 () Bool)

(declare-fun res!567070 () Bool)

(assert (=> b!834340 (=> (not res!567070) (not e!465473))))

(assert (=> b!834340 (= res!567070 (containsKey!402 lt!378509 (_1!5052 lt!377756)))))

(declare-fun d!107651 () Bool)

(assert (=> d!107651 e!465473))

(declare-fun res!567069 () Bool)

(assert (=> d!107651 (=> (not res!567069) (not e!465473))))

(assert (=> d!107651 (= res!567069 (isStrictlySorted!430 lt!378509))))

(assert (=> d!107651 (= lt!378509 e!465471)))

(assert (=> d!107651 (= c!91085 (and ((_ is Cons!15848) (t!22212 (toList!4469 lt!377759))) (bvslt (_1!5052 (h!16984 (t!22212 (toList!4469 lt!377759)))) (_1!5052 lt!377756))))))

(assert (=> d!107651 (isStrictlySorted!430 (t!22212 (toList!4469 lt!377759)))))

(assert (=> d!107651 (= (insertStrictlySorted!270 (t!22212 (toList!4469 lt!377759)) (_1!5052 lt!377756) (_2!5052 lt!377756)) lt!378509)))

(declare-fun b!834341 () Bool)

(assert (=> b!834341 (= e!465472 call!36546)))

(assert (= (and d!107651 c!91085) b!834335))

(assert (= (and d!107651 (not c!91085)) b!834338))

(assert (= (and b!834338 c!91087) b!834339))

(assert (= (and b!834338 (not c!91087)) b!834332))

(assert (= (and b!834332 c!91086) b!834333))

(assert (= (and b!834332 (not c!91086)) b!834341))

(assert (= (or b!834333 b!834341) bm!36545))

(assert (= (or b!834339 bm!36545) bm!36544))

(assert (= (or b!834335 bm!36544) bm!36543))

(assert (= (and bm!36543 c!91088) b!834334))

(assert (= (and bm!36543 (not c!91088)) b!834337))

(assert (= (and d!107651 res!567069) b!834340))

(assert (= (and b!834340 res!567070) b!834336))

(declare-fun m!779509 () Bool)

(assert (=> bm!36543 m!779509))

(declare-fun m!779511 () Bool)

(assert (=> b!834336 m!779511))

(declare-fun m!779513 () Bool)

(assert (=> b!834334 m!779513))

(declare-fun m!779515 () Bool)

(assert (=> b!834340 m!779515))

(declare-fun m!779517 () Bool)

(assert (=> d!107651 m!779517))

(assert (=> d!107651 m!778735))

(assert (=> b!833114 d!107651))

(declare-fun d!107653 () Bool)

(declare-fun lt!378510 () Bool)

(assert (=> d!107653 (= lt!378510 (select (content!388 (t!22212 (toList!4469 lt!377875))) lt!377756))))

(declare-fun e!465475 () Bool)

(assert (=> d!107653 (= lt!378510 e!465475)))

(declare-fun res!567072 () Bool)

(assert (=> d!107653 (=> (not res!567072) (not e!465475))))

(assert (=> d!107653 (= res!567072 ((_ is Cons!15848) (t!22212 (toList!4469 lt!377875))))))

(assert (=> d!107653 (= (contains!4190 (t!22212 (toList!4469 lt!377875)) lt!377756) lt!378510)))

(declare-fun b!834342 () Bool)

(declare-fun e!465474 () Bool)

(assert (=> b!834342 (= e!465475 e!465474)))

(declare-fun res!567071 () Bool)

(assert (=> b!834342 (=> res!567071 e!465474)))

(assert (=> b!834342 (= res!567071 (= (h!16984 (t!22212 (toList!4469 lt!377875))) lt!377756))))

(declare-fun b!834343 () Bool)

(assert (=> b!834343 (= e!465474 (contains!4190 (t!22212 (t!22212 (toList!4469 lt!377875))) lt!377756))))

(assert (= (and d!107653 res!567072) b!834342))

(assert (= (and b!834342 (not res!567071)) b!834343))

(assert (=> d!107653 m!779493))

(declare-fun m!779519 () Bool)

(assert (=> d!107653 m!779519))

(declare-fun m!779521 () Bool)

(assert (=> b!834343 m!779521))

(assert (=> b!832980 d!107653))

(declare-fun d!107655 () Bool)

(declare-fun res!567073 () Bool)

(declare-fun e!465476 () Bool)

(assert (=> d!107655 (=> res!567073 e!465476)))

(assert (=> d!107655 (= res!567073 (and ((_ is Cons!15848) (toList!4469 lt!377854)) (= (_1!5052 (h!16984 (toList!4469 lt!377854))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107655 (= (containsKey!402 (toList!4469 lt!377854) #b0000000000000000000000000000000000000000000000000000000000000000) e!465476)))

(declare-fun b!834344 () Bool)

(declare-fun e!465477 () Bool)

(assert (=> b!834344 (= e!465476 e!465477)))

(declare-fun res!567074 () Bool)

(assert (=> b!834344 (=> (not res!567074) (not e!465477))))

(assert (=> b!834344 (= res!567074 (and (or (not ((_ is Cons!15848) (toList!4469 lt!377854))) (bvsle (_1!5052 (h!16984 (toList!4469 lt!377854))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15848) (toList!4469 lt!377854)) (bvslt (_1!5052 (h!16984 (toList!4469 lt!377854))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!834345 () Bool)

(assert (=> b!834345 (= e!465477 (containsKey!402 (t!22212 (toList!4469 lt!377854)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!107655 (not res!567073)) b!834344))

(assert (= (and b!834344 res!567074) b!834345))

(declare-fun m!779523 () Bool)

(assert (=> b!834345 m!779523))

(assert (=> d!106707 d!107655))

(assert (=> b!832985 d!107459))

(assert (=> b!832985 d!107461))

(declare-fun d!107657 () Bool)

(declare-fun lt!378511 () Bool)

(assert (=> d!107657 (= lt!378511 (select (content!388 lt!378207) (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))))))

(declare-fun e!465479 () Bool)

(assert (=> d!107657 (= lt!378511 e!465479)))

(declare-fun res!567076 () Bool)

(assert (=> d!107657 (=> (not res!567076) (not e!465479))))

(assert (=> d!107657 (= res!567076 ((_ is Cons!15848) lt!378207))))

(assert (=> d!107657 (= (contains!4190 lt!378207 (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))) lt!378511)))

(declare-fun b!834346 () Bool)

(declare-fun e!465478 () Bool)

(assert (=> b!834346 (= e!465479 e!465478)))

(declare-fun res!567075 () Bool)

(assert (=> b!834346 (=> res!567075 e!465478)))

(assert (=> b!834346 (= res!567075 (= (h!16984 lt!378207) (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))))))

(declare-fun b!834347 () Bool)

(assert (=> b!834347 (= e!465478 (contains!4190 (t!22212 lt!378207) (tuple2!10083 (_1!5052 lt!377756) (_2!5052 lt!377756))))))

(assert (= (and d!107657 res!567076) b!834346))

(assert (= (and b!834346 (not res!567075)) b!834347))

(declare-fun m!779525 () Bool)

(assert (=> d!107657 m!779525))

(declare-fun m!779527 () Bool)

(assert (=> d!107657 m!779527))

(declare-fun m!779529 () Bool)

(assert (=> b!834347 m!779529))

(assert (=> b!833297 d!107657))

(declare-fun d!107659 () Bool)

(assert (=> d!107659 (= (get!11827 (getValueByKey!417 (toList!4469 lt!377947) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!10101 (getValueByKey!417 (toList!4469 lt!377947) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106843 d!107659))

(assert (=> d!106843 d!107011))

(declare-fun d!107661 () Bool)

(declare-fun e!465481 () Bool)

(assert (=> d!107661 e!465481))

(declare-fun res!567077 () Bool)

(assert (=> d!107661 (=> res!567077 e!465481)))

(declare-fun lt!378512 () Bool)

(assert (=> d!107661 (= res!567077 (not lt!378512))))

(declare-fun lt!378515 () Bool)

(assert (=> d!107661 (= lt!378512 lt!378515)))

(declare-fun lt!378513 () Unit!28510)

(declare-fun e!465480 () Unit!28510)

(assert (=> d!107661 (= lt!378513 e!465480)))

(declare-fun c!91089 () Bool)

(assert (=> d!107661 (= c!91089 lt!378515)))

(assert (=> d!107661 (= lt!378515 (containsKey!402 (toList!4469 lt!378060) (_1!5052 (tuple2!10083 lt!377935 zeroValueBefore!34))))))

(assert (=> d!107661 (= (contains!4189 lt!378060 (_1!5052 (tuple2!10083 lt!377935 zeroValueBefore!34))) lt!378512)))

(declare-fun b!834348 () Bool)

(declare-fun lt!378514 () Unit!28510)

(assert (=> b!834348 (= e!465480 lt!378514)))

(assert (=> b!834348 (= lt!378514 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4469 lt!378060) (_1!5052 (tuple2!10083 lt!377935 zeroValueBefore!34))))))

(assert (=> b!834348 (isDefined!312 (getValueByKey!417 (toList!4469 lt!378060) (_1!5052 (tuple2!10083 lt!377935 zeroValueBefore!34))))))

(declare-fun b!834349 () Bool)

(declare-fun Unit!28573 () Unit!28510)

(assert (=> b!834349 (= e!465480 Unit!28573)))

(declare-fun b!834350 () Bool)

(assert (=> b!834350 (= e!465481 (isDefined!312 (getValueByKey!417 (toList!4469 lt!378060) (_1!5052 (tuple2!10083 lt!377935 zeroValueBefore!34)))))))

(assert (= (and d!107661 c!91089) b!834348))

(assert (= (and d!107661 (not c!91089)) b!834349))

(assert (= (and d!107661 (not res!567077)) b!834350))

(declare-fun m!779531 () Bool)

(assert (=> d!107661 m!779531))

(declare-fun m!779533 () Bool)

(assert (=> b!834348 m!779533))

(assert (=> b!834348 m!777565))

(assert (=> b!834348 m!777565))

(declare-fun m!779535 () Bool)

(assert (=> b!834348 m!779535))

(assert (=> b!834350 m!777565))

(assert (=> b!834350 m!777565))

(assert (=> b!834350 m!779535))

(assert (=> d!106735 d!107661))

(declare-fun d!107663 () Bool)

(declare-fun c!91090 () Bool)

(assert (=> d!107663 (= c!91090 (and ((_ is Cons!15848) lt!378059) (= (_1!5052 (h!16984 lt!378059)) (_1!5052 (tuple2!10083 lt!377935 zeroValueBefore!34)))))))

(declare-fun e!465482 () Option!423)

(assert (=> d!107663 (= (getValueByKey!417 lt!378059 (_1!5052 (tuple2!10083 lt!377935 zeroValueBefore!34))) e!465482)))

(declare-fun b!834353 () Bool)

(declare-fun e!465483 () Option!423)

(assert (=> b!834353 (= e!465483 (getValueByKey!417 (t!22212 lt!378059) (_1!5052 (tuple2!10083 lt!377935 zeroValueBefore!34))))))

(declare-fun b!834354 () Bool)

(assert (=> b!834354 (= e!465483 None!421)))

(declare-fun b!834352 () Bool)

(assert (=> b!834352 (= e!465482 e!465483)))

(declare-fun c!91091 () Bool)

(assert (=> b!834352 (= c!91091 (and ((_ is Cons!15848) lt!378059) (not (= (_1!5052 (h!16984 lt!378059)) (_1!5052 (tuple2!10083 lt!377935 zeroValueBefore!34))))))))

(declare-fun b!834351 () Bool)

(assert (=> b!834351 (= e!465482 (Some!422 (_2!5052 (h!16984 lt!378059))))))

(assert (= (and d!107663 c!91090) b!834351))

(assert (= (and d!107663 (not c!91090)) b!834352))

(assert (= (and b!834352 c!91091) b!834353))

(assert (= (and b!834352 (not c!91091)) b!834354))

(declare-fun m!779537 () Bool)

(assert (=> b!834353 m!779537))

(assert (=> d!106735 d!107663))

(declare-fun d!107665 () Bool)

(assert (=> d!107665 (= (getValueByKey!417 lt!378059 (_1!5052 (tuple2!10083 lt!377935 zeroValueBefore!34))) (Some!422 (_2!5052 (tuple2!10083 lt!377935 zeroValueBefore!34))))))

(declare-fun lt!378516 () Unit!28510)

(assert (=> d!107665 (= lt!378516 (choose!1429 lt!378059 (_1!5052 (tuple2!10083 lt!377935 zeroValueBefore!34)) (_2!5052 (tuple2!10083 lt!377935 zeroValueBefore!34))))))

(declare-fun e!465484 () Bool)

(assert (=> d!107665 e!465484))

(declare-fun res!567078 () Bool)

(assert (=> d!107665 (=> (not res!567078) (not e!465484))))

(assert (=> d!107665 (= res!567078 (isStrictlySorted!430 lt!378059))))

(assert (=> d!107665 (= (lemmaContainsTupThenGetReturnValue!231 lt!378059 (_1!5052 (tuple2!10083 lt!377935 zeroValueBefore!34)) (_2!5052 (tuple2!10083 lt!377935 zeroValueBefore!34))) lt!378516)))

(declare-fun b!834355 () Bool)

(declare-fun res!567079 () Bool)

(assert (=> b!834355 (=> (not res!567079) (not e!465484))))

(assert (=> b!834355 (= res!567079 (containsKey!402 lt!378059 (_1!5052 (tuple2!10083 lt!377935 zeroValueBefore!34))))))

(declare-fun b!834356 () Bool)

(assert (=> b!834356 (= e!465484 (contains!4190 lt!378059 (tuple2!10083 (_1!5052 (tuple2!10083 lt!377935 zeroValueBefore!34)) (_2!5052 (tuple2!10083 lt!377935 zeroValueBefore!34)))))))

(assert (= (and d!107665 res!567078) b!834355))

(assert (= (and b!834355 res!567079) b!834356))

(assert (=> d!107665 m!777559))

(declare-fun m!779539 () Bool)

(assert (=> d!107665 m!779539))

(declare-fun m!779541 () Bool)

(assert (=> d!107665 m!779541))

(declare-fun m!779543 () Bool)

(assert (=> b!834355 m!779543))

(declare-fun m!779545 () Bool)

(assert (=> b!834356 m!779545))

(assert (=> d!106735 d!107665))

(declare-fun bm!36546 () Bool)

(declare-fun call!36550 () List!15852)

(declare-fun c!91092 () Bool)

(declare-fun e!465486 () List!15852)

(assert (=> bm!36546 (= call!36550 ($colon$colon!534 e!465486 (ite c!91092 (h!16984 (toList!4469 lt!377936)) (tuple2!10083 (_1!5052 (tuple2!10083 lt!377935 zeroValueBefore!34)) (_2!5052 (tuple2!10083 lt!377935 zeroValueBefore!34))))))))

(declare-fun c!91095 () Bool)

(assert (=> bm!36546 (= c!91095 c!91092)))

(declare-fun bm!36547 () Bool)

(declare-fun call!36551 () List!15852)

(assert (=> bm!36547 (= call!36551 call!36550)))

(declare-fun bm!36548 () Bool)

(declare-fun call!36549 () List!15852)

(assert (=> bm!36548 (= call!36549 call!36551)))

(declare-fun c!91093 () Bool)

(declare-fun b!834357 () Bool)

(assert (=> b!834357 (= c!91093 (and ((_ is Cons!15848) (toList!4469 lt!377936)) (bvsgt (_1!5052 (h!16984 (toList!4469 lt!377936))) (_1!5052 (tuple2!10083 lt!377935 zeroValueBefore!34)))))))

(declare-fun e!465485 () List!15852)

(declare-fun e!465488 () List!15852)

(assert (=> b!834357 (= e!465485 e!465488)))

(declare-fun b!834358 () Bool)

(assert (=> b!834358 (= e!465488 call!36549)))

(declare-fun b!834359 () Bool)

(assert (=> b!834359 (= e!465486 (insertStrictlySorted!270 (t!22212 (toList!4469 lt!377936)) (_1!5052 (tuple2!10083 lt!377935 zeroValueBefore!34)) (_2!5052 (tuple2!10083 lt!377935 zeroValueBefore!34))))))

(declare-fun b!834360 () Bool)

(declare-fun e!465487 () List!15852)

(assert (=> b!834360 (= e!465487 call!36550)))

(declare-fun lt!378517 () List!15852)

(declare-fun e!465489 () Bool)

(declare-fun b!834361 () Bool)

(assert (=> b!834361 (= e!465489 (contains!4190 lt!378517 (tuple2!10083 (_1!5052 (tuple2!10083 lt!377935 zeroValueBefore!34)) (_2!5052 (tuple2!10083 lt!377935 zeroValueBefore!34)))))))

(declare-fun b!834362 () Bool)

(declare-fun c!91094 () Bool)

(assert (=> b!834362 (= e!465486 (ite c!91094 (t!22212 (toList!4469 lt!377936)) (ite c!91093 (Cons!15848 (h!16984 (toList!4469 lt!377936)) (t!22212 (toList!4469 lt!377936))) Nil!15849)))))

(declare-fun b!834363 () Bool)

(assert (=> b!834363 (= e!465487 e!465485)))

(assert (=> b!834363 (= c!91094 (and ((_ is Cons!15848) (toList!4469 lt!377936)) (= (_1!5052 (h!16984 (toList!4469 lt!377936))) (_1!5052 (tuple2!10083 lt!377935 zeroValueBefore!34)))))))

(declare-fun b!834364 () Bool)

(assert (=> b!834364 (= e!465485 call!36551)))

(declare-fun b!834365 () Bool)

(declare-fun res!567081 () Bool)

(assert (=> b!834365 (=> (not res!567081) (not e!465489))))

(assert (=> b!834365 (= res!567081 (containsKey!402 lt!378517 (_1!5052 (tuple2!10083 lt!377935 zeroValueBefore!34))))))

(declare-fun d!107667 () Bool)

(assert (=> d!107667 e!465489))

(declare-fun res!567080 () Bool)

(assert (=> d!107667 (=> (not res!567080) (not e!465489))))

(assert (=> d!107667 (= res!567080 (isStrictlySorted!430 lt!378517))))

(assert (=> d!107667 (= lt!378517 e!465487)))

(assert (=> d!107667 (= c!91092 (and ((_ is Cons!15848) (toList!4469 lt!377936)) (bvslt (_1!5052 (h!16984 (toList!4469 lt!377936))) (_1!5052 (tuple2!10083 lt!377935 zeroValueBefore!34)))))))

(assert (=> d!107667 (isStrictlySorted!430 (toList!4469 lt!377936))))

(assert (=> d!107667 (= (insertStrictlySorted!270 (toList!4469 lt!377936) (_1!5052 (tuple2!10083 lt!377935 zeroValueBefore!34)) (_2!5052 (tuple2!10083 lt!377935 zeroValueBefore!34))) lt!378517)))

(declare-fun b!834366 () Bool)

(assert (=> b!834366 (= e!465488 call!36549)))

(assert (= (and d!107667 c!91092) b!834360))

(assert (= (and d!107667 (not c!91092)) b!834363))

(assert (= (and b!834363 c!91094) b!834364))

(assert (= (and b!834363 (not c!91094)) b!834357))

(assert (= (and b!834357 c!91093) b!834358))

(assert (= (and b!834357 (not c!91093)) b!834366))

(assert (= (or b!834358 b!834366) bm!36548))

(assert (= (or b!834364 bm!36548) bm!36547))

(assert (= (or b!834360 bm!36547) bm!36546))

(assert (= (and bm!36546 c!91095) b!834359))

(assert (= (and bm!36546 (not c!91095)) b!834362))

(assert (= (and d!107667 res!567080) b!834365))

(assert (= (and b!834365 res!567081) b!834361))

(declare-fun m!779547 () Bool)

(assert (=> bm!36546 m!779547))

(declare-fun m!779549 () Bool)

(assert (=> b!834361 m!779549))

(declare-fun m!779551 () Bool)

(assert (=> b!834359 m!779551))

(declare-fun m!779553 () Bool)

(assert (=> b!834365 m!779553))

(declare-fun m!779555 () Bool)

(assert (=> d!107667 m!779555))

(declare-fun m!779557 () Bool)

(assert (=> d!107667 m!779557))

(assert (=> d!106735 d!107667))

(declare-fun mapNonEmpty!24485 () Bool)

(declare-fun mapRes!24485 () Bool)

(declare-fun tp!47312 () Bool)

(declare-fun e!465491 () Bool)

(assert (=> mapNonEmpty!24485 (= mapRes!24485 (and tp!47312 e!465491))))

(declare-fun mapValue!24485 () ValueCell!7190)

(declare-fun mapKey!24485 () (_ BitVec 32))

(declare-fun mapRest!24485 () (Array (_ BitVec 32) ValueCell!7190))

(assert (=> mapNonEmpty!24485 (= mapRest!24484 (store mapRest!24485 mapKey!24485 mapValue!24485))))

(declare-fun mapIsEmpty!24485 () Bool)

(assert (=> mapIsEmpty!24485 mapRes!24485))

(declare-fun b!834367 () Bool)

(assert (=> b!834367 (= e!465491 tp_is_empty!15211)))

(declare-fun b!834368 () Bool)

(declare-fun e!465490 () Bool)

(assert (=> b!834368 (= e!465490 tp_is_empty!15211)))

(declare-fun condMapEmpty!24485 () Bool)

(declare-fun mapDefault!24485 () ValueCell!7190)

(assert (=> mapNonEmpty!24484 (= condMapEmpty!24485 (= mapRest!24484 ((as const (Array (_ BitVec 32) ValueCell!7190)) mapDefault!24485)))))

(assert (=> mapNonEmpty!24484 (= tp!47311 (and e!465490 mapRes!24485))))

(assert (= (and mapNonEmpty!24484 condMapEmpty!24485) mapIsEmpty!24485))

(assert (= (and mapNonEmpty!24484 (not condMapEmpty!24485)) mapNonEmpty!24485))

(assert (= (and mapNonEmpty!24485 ((_ is ValueCellFull!7190) mapValue!24485)) b!834367))

(assert (= (and mapNonEmpty!24484 ((_ is ValueCellFull!7190) mapDefault!24485)) b!834368))

(declare-fun m!779559 () Bool)

(assert (=> mapNonEmpty!24485 m!779559))

(declare-fun b_lambda!11465 () Bool)

(assert (= b_lambda!11457 (or (and start!71746 b_free!13501) b_lambda!11465)))

(declare-fun b_lambda!11467 () Bool)

(assert (= b_lambda!11463 (or (and start!71746 b_free!13501) b_lambda!11467)))

(declare-fun b_lambda!11469 () Bool)

(assert (= b_lambda!11461 (or (and start!71746 b_free!13501) b_lambda!11469)))

(declare-fun b_lambda!11471 () Bool)

(assert (= b_lambda!11459 (or (and start!71746 b_free!13501) b_lambda!11471)))

(check-sat (not d!107633) (not b!833697) (not b!833962) (not d!107269) (not d!107427) (not d!107405) (not d!107121) (not b!833492) (not b!834159) (not b!833443) (not b!833721) (not b!833995) (not b!834150) (not b!833773) (not b!834062) (not d!107089) (not mapNonEmpty!24485) (not b_lambda!11433) (not d!107393) (not d!107603) (not b!833568) (not b!833518) (not d!107189) (not d!107541) (not d!106901) (not b!834334) (not b!833365) (not d!107029) (not b!833490) (not d!107289) (not b!833668) (not b!833903) (not b!834253) (not b!833608) (not b!833882) (not d!107293) (not d!107119) (not d!107611) (not b!833525) (not b!833357) (not b!833860) (not b!833516) (not b!833674) (not b!834343) (not bm!36531) (not d!107141) (not b!834311) (not b!834112) (not b!834043) (not d!107023) (not b!833769) (not b!834324) (not b!834027) (not b!834087) (not b!833942) (not b!833376) (not b!833457) (not b!833664) (not b!833870) (not d!107351) (not b!833852) (not d!106955) (not b!834270) (not bm!36480) (not b!833905) (not d!107081) (not b!834166) (not d!107341) (not b!833479) (not d!107547) (not b!834255) (not d!107321) (not b_lambda!11469) (not b!833939) (not d!107593) (not d!107417) (not b!833333) (not b!833580) (not d!107449) (not b!834028) (not d!107357) (not d!107515) (not b!834188) (not b!834304) (not b!833510) (not b_lambda!11453) (not b!833438) (not b!834355) (not d!107039) (not d!107413) (not d!107591) (not bm!36510) (not bm!36513) (not b!833410) (not b!834295) (not d!107359) (not b!834238) (not d!106927) (not b!833370) (not b!833521) (not b!834340) (not b!833408) (not d!107601) (not b!834209) (not b!833782) (not b!833868) (not d!107423) (not b!834194) (not b!833373) (not d!106957) (not d!106903) (not b!833601) (not bm!36504) (not b!833453) (not b!833944) (not b!833610) (not d!107053) (not b!834182) (not b!834232) (not bm!36473) (not b!834246) (not d!107445) (not d!107033) (not b!833930) (not b!834279) (not b!833681) (not b!833771) (not d!107367) (not b!833867) (not d!107187) (not b!834086) (not b!833386) (not b!833825) (not b!834272) (not b!833778) (not b!833604) (not b!833466) (not d!107369) (not bm!36540) tp_is_empty!15211 (not d!107425) (not b!833509) (not b!833618) (not b!834133) (not b!833671) (not b!833701) (not b!833538) (not d!106915) (not d!107529) (not b!833402) (not b!833559) (not d!107619) (not b!834205) (not d!106973) (not d!107511) (not b!833389) (not bm!36501) (not b!833717) (not b!834010) (not b!833445) (not b!834155) (not b!834347) (not d!106993) (not d!107451) (not bm!36488) (not b!833692) (not bm!36525) (not b!834325) (not b!834068) (not b!833914) (not b!833515) (not b!833889) (not b!834307) (not b!833544) (not b!833827) (not b!834131) (not b!833876) (not b!833449) (not b!834353) (not b!834021) (not d!107409) (not d!107229) (not d!107531) (not bm!36522) (not b!833719) (not b!833660) (not b!834216) (not b!834185) (not b!834359) (not b!834169) (not b!833651) (not b!833754) (not b!833396) (not b!834329) (not b!833891) (not b!834327) (not b!834292) (not b!833964) (not b!833582) (not b!833839) (not b!834248) (not b!833620) (not b!833500) (not b!834225) (not bm!36528) (not b!833416) (not b!833354) (not b!833895) (not b!833413) (not b!833666) (not d!107243) (not b!833440) (not d!106933) (not b!833850) (not b!834013) (not d!107313) (not d!107307) (not d!107555) (not b!833830) (not b!834142) (not b!833496) (not b!834348) (not b!834184) (not b!834079) (not d!107193) (not b!834045) (not d!107205) (not b!833684) (not d!107281) (not b!833927) (not d!107411) (not b!834052) (not bm!36546) (not b!833710) (not d!107217) (not d!107201) (not b!833331) (not d!106937) (not d!107457) (not b!833460) (not b!834236) (not b!833884) (not b!833833) (not b!833807) (not b!834190) (not d!107051) (not b!833866) (not d!107155) (not b!833775) (not d!107323) (not b!833493) (not b!834136) (not d!106941) (not b!834019) (not d!107443) (not d!107397) (not d!107221) (not b!834259) (not b_lambda!11429) (not b!833823) (not b!833973) (not d!107581) (not b!833662) (not d!107573) (not b!833415) (not b!833469) (not b!833616) (not d!107103) (not b!833798) (not b!833382) (not b!833836) (not d!107129) (not b!833474) (not b!834031) (not b!834056) (not b_lambda!11437) (not b!833922) (not b!833535) (not b!833841) (not d!107225) (not b!833394) (not d!107249) (not b_lambda!11439) (not b!833920) (not b!834281) (not b!833984) (not b!833433) (not d!107657) (not b!834067) (not d!107433) (not b!833864) (not d!107299) (not b!833661) (not b!833656) (not d!107219) (not b!833504) (not d!106909) (not b!833766) (not b!833817) (not b!833800) (not b!834015) (not b!833594) (not b!833536) (not b!834261) (not d!107049) (not b!834114) (not b!833584) (not b!833462) (not b!834283) (not d!107303) (not b!833578) (not b!833758) (not bm!36534) (not b!833658) (not b!834331) (not d!107171) (not d!107651) (not b!834313) (not b!833400) (not d!107227) (not d!107213) (not d!107505) (not b!833406) (not d!107021) (not b!833663) (not d!106943) (not b!833419) (not d!107115) (not bm!36497) (not b!834035) (not b!833795) (not bm!36477) (not b!834124) (not b!833982) (not b!833901) (not b_lambda!11465) (not b_next!13501) (not b!833543) (not b!834289) (not b!834242) (not b!833726) (not b!834284) (not b!834143) (not b!834177) (not b_lambda!11467) (not d!107275) (not b!833768) (not b!833507) (not d!107507) (not b!834090) (not d!107283) (not d!107607) (not b!834078) (not d!107459) (not b!833675) (not b!833828) (not b!833966) (not b!834318) (not b!834146) (not d!107113) (not d!107047) (not b!833813) (not b!833547) (not b!833916) (not b!834121) (not b!833947) (not d!107207) (not b!833845) (not bm!36500) (not b!833549) (not bm!36507) (not b!833712) (not d!107291) (not d!107579) (not bm!36516) (not b!833971) (not b!834092) (not b!834345) (not d!107329) (not b!834275) (not b!834162) (not b!833929) (not b!833523) (not b!833614) (not b!833631) (not b!833626) (not d!107319) (not d!107583) (not b!834050) (not b!834071) (not d!107009) (not b!833764) (not b!833368) (not b!834247) (not d!106949) (not b!833391) (not b!833979) (not d!107491) (not d!107477) (not bm!36491) (not b_lambda!11449) (not b!834286) (not b!833485) (not b!834148) (not b_lambda!11431) (not b!834118) (not b!833436) (not d!107645) (not d!107031) (not b!833788) (not b!833366) (not b!833397) (not b!833600) (not d!107263) (not b!834058) (not b!834139) (not b!834230) (not b_lambda!11435) (not b!833566) (not b!834009) (not d!107631) (not b!833728) (not d!107471) (not b!833414) (not d!106917) (not b!833820) (not b!834222) (not b!833873) (not d!107345) (not b!834101) (not b!834047) (not d!107545) (not b!833678) (not b!833426) (not d!107167) (not b!833862) (not b!834000) (not b!833364) (not d!107577) (not d!107653) (not b!833953) (not b!833464) (not d!106963) (not d!107415) (not b!833723) (not b!833487) (not b!834099) (not b!833908) (not b!834025) (not d!107373) (not b!833472) (not b!833715) (not b!833976) (not b!834164) (not b!834081) (not d!107585) (not b!834065) (not b!833805) (not d!107349) (not b!834024) (not d!106997) (not b!833557) (not d!107191) (not b!833886) (not bm!36481) (not b!834250) (not b!833707) (not b!833411) (not d!107305) (not b!833988) (not d!107215) (not b!833857) (not d!107231) (not d!107647) (not b_lambda!11471) (not b!833695) (not b!834244) (not d!106985) (not d!107063) (not b!834107) (not b!834039) (not b!833513) (not d!107177) (not d!107279) (not b!834176) (not b!833429) (not b!833897) (not b!833607) (not b!833482) (not d!107509) (not d!107475) (not b!834227) (not b!833949) (not b!833587) (not d!107519) (not b!833532) (not d!107059) (not b!833528) (not b!833541) (not d!107087) (not d!107587) (not b!834271) (not d!107093) (not b_lambda!11451) (not bm!36474) (not b!833892) (not d!106983) (not b!833553) (not d!106919) (not b!833997) (not d!107061) (not b!834140) (not b!833378) (not b!833957) (not b!833835) (not b!834096) (not d!106961) (not b!834128) (not b!834256) (not b!834084) (not d!107125) (not b!834103) (not b!833512) (not d!107421) (not d!107419) (not b!833879) (not d!106947) (not b!834301) (not b!833992) (not d!107431) (not d!107085) (not d!107489) (not b!834224) (not d!107139) (not d!107665) (not b!833589) (not d!107327) (not d!107181) (not d!107067) (not b!833680) (not b!834316) (not d!107353) (not b!833380) (not bm!36487) (not b!833623) (not b!833628) (not b!833340) (not b!834152) (not b!833698) (not d!107567) (not b!833690) (not d!107223) (not b!833729) (not b!834179) (not b_lambda!11455) (not b!833761) (not d!106929) (not d!107127) (not d!107175) (not bm!36543) (not d!107035) (not b!833808) (not b!834265) (not b!833570) (not d!107643) (not d!107661) (not b!833802) (not d!107613) (not b!833417) (not d!107387) (not b!833793) (not b!833592) (not d!107401) (not b!833727) (not b!833418) (not bm!36519) (not b!834075) (not b!834233) (not b!834274) (not b!834002) (not d!107015) (not b!834297) (not b!833349) (not d!107365) (not d!106991) (not b!834200) (not b!833960) (not d!106969) (not b!833423) (not b!833361) (not bm!36537) (not d!107667) (not d!107251) (not d!107295) (not b!833848) (not d!106999) (not b!834007) (not b!833811) (not b!834361) (not b!834022) (not b!833854) (not d!106905) (not b!833969) (not d!107391) (not b!834365) (not b!834105) (not b!833784) (not b!833933) (not b!834336) (not b!834198) (not b!834053) (not b!833335) (not b!833363) (not b!834203) (not d!107621) (not d!106965) (not d!107005) b_and!22601 (not b!833576) (not bm!36494) (not d!107017) (not b!833714) (not d!107147) (not b!833635) (not d!107183) (not b!834004) (not d!107137) (not b!834321) (not b!833910) (not b!833791) (not b!833924) (not b!833477) (not b!834268) (not d!107253) (not d!107599) (not b!833374) (not d!106995) (not b!833672) (not b!834315) (not b!833978) (not b!833337) (not bm!36484) (not b!833347) (not b!833563) (not b!833911) (not d!107615) (not b!834356) (not d!107361) (not b!834213) (not b!833688) (not d!107559) (not b!834219) (not b!833703) (not d!107135) (not b!834277) (not b!834350) (not b!833351) (not b!833725) (not b!833612) (not b!833935) (not b!834173) (not b!834109) (not b!833597))
(check-sat b_and!22601 (not b_next!13501))
