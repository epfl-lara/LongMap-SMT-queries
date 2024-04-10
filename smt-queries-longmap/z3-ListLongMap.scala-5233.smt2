; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70480 () Bool)

(assert start!70480)

(declare-fun b_free!12807 () Bool)

(declare-fun b_next!12807 () Bool)

(assert (=> start!70480 (= b_free!12807 (not b_next!12807))))

(declare-fun tp!45153 () Bool)

(declare-fun b_and!21637 () Bool)

(assert (=> start!70480 (= tp!45153 b_and!21637)))

(declare-fun res!558668 () Bool)

(declare-fun e!454467 () Bool)

(assert (=> start!70480 (=> (not res!558668) (not e!454467))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70480 (= res!558668 (validMask!0 mask!1312))))

(assert (=> start!70480 e!454467))

(declare-fun tp_is_empty!14517 () Bool)

(assert (=> start!70480 tp_is_empty!14517))

(declare-datatypes ((array!45232 0))(
  ( (array!45233 (arr!21670 (Array (_ BitVec 32) (_ BitVec 64))) (size!22091 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45232)

(declare-fun array_inv!17327 (array!45232) Bool)

(assert (=> start!70480 (array_inv!17327 _keys!976)))

(assert (=> start!70480 true))

(declare-datatypes ((V!24357 0))(
  ( (V!24358 (val!7306 Int)) )
))
(declare-datatypes ((ValueCell!6843 0))(
  ( (ValueCellFull!6843 (v!9735 V!24357)) (EmptyCell!6843) )
))
(declare-datatypes ((array!45234 0))(
  ( (array!45235 (arr!21671 (Array (_ BitVec 32) ValueCell!6843)) (size!22092 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45234)

(declare-fun e!454472 () Bool)

(declare-fun array_inv!17328 (array!45234) Bool)

(assert (=> start!70480 (and (array_inv!17328 _values!788) e!454472)))

(assert (=> start!70480 tp!45153))

(declare-fun b!818652 () Bool)

(declare-fun res!558669 () Bool)

(assert (=> b!818652 (=> (not res!558669) (not e!454467))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!818652 (= res!558669 (and (= (size!22092 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22091 _keys!976) (size!22092 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!818653 () Bool)

(declare-fun e!454466 () Bool)

(assert (=> b!818653 (= e!454466 tp_is_empty!14517)))

(declare-fun b!818654 () Bool)

(declare-fun e!454468 () Bool)

(declare-fun mapRes!23374 () Bool)

(assert (=> b!818654 (= e!454472 (and e!454468 mapRes!23374))))

(declare-fun condMapEmpty!23374 () Bool)

(declare-fun mapDefault!23374 () ValueCell!6843)

(assert (=> b!818654 (= condMapEmpty!23374 (= (arr!21671 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6843)) mapDefault!23374)))))

(declare-fun mapNonEmpty!23374 () Bool)

(declare-fun tp!45154 () Bool)

(assert (=> mapNonEmpty!23374 (= mapRes!23374 (and tp!45154 e!454466))))

(declare-fun mapValue!23374 () ValueCell!6843)

(declare-fun mapKey!23374 () (_ BitVec 32))

(declare-fun mapRest!23374 () (Array (_ BitVec 32) ValueCell!6843))

(assert (=> mapNonEmpty!23374 (= (arr!21671 _values!788) (store mapRest!23374 mapKey!23374 mapValue!23374))))

(declare-fun mapIsEmpty!23374 () Bool)

(assert (=> mapIsEmpty!23374 mapRes!23374))

(declare-fun b!818655 () Bool)

(assert (=> b!818655 (= e!454468 tp_is_empty!14517)))

(declare-fun b!818656 () Bool)

(declare-fun res!558671 () Bool)

(assert (=> b!818656 (=> (not res!558671) (not e!454467))))

(declare-datatypes ((List!15434 0))(
  ( (Nil!15431) (Cons!15430 (h!16559 (_ BitVec 64)) (t!21763 List!15434)) )
))
(declare-fun arrayNoDuplicates!0 (array!45232 (_ BitVec 32) List!15434) Bool)

(assert (=> b!818656 (= res!558671 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15431))))

(declare-fun b!818657 () Bool)

(declare-fun e!454469 () Bool)

(assert (=> b!818657 (= e!454469 true)))

(declare-datatypes ((tuple2!9600 0))(
  ( (tuple2!9601 (_1!4811 (_ BitVec 64)) (_2!4811 V!24357)) )
))
(declare-fun lt!366897 () tuple2!9600)

(declare-fun lt!366902 () tuple2!9600)

(declare-datatypes ((List!15435 0))(
  ( (Nil!15432) (Cons!15431 (h!16560 tuple2!9600) (t!21764 List!15435)) )
))
(declare-datatypes ((ListLongMap!8423 0))(
  ( (ListLongMap!8424 (toList!4227 List!15435)) )
))
(declare-fun lt!366895 () ListLongMap!8423)

(declare-fun lt!366896 () ListLongMap!8423)

(declare-fun +!1824 (ListLongMap!8423 tuple2!9600) ListLongMap!8423)

(assert (=> b!818657 (= lt!366896 (+!1824 (+!1824 lt!366895 lt!366902) lt!366897))))

(declare-fun lt!366901 () ListLongMap!8423)

(declare-fun lt!366900 () ListLongMap!8423)

(assert (=> b!818657 (= (+!1824 lt!366901 lt!366897) (+!1824 lt!366900 lt!366897))))

(declare-fun zeroValueBefore!34 () V!24357)

(declare-fun zeroValueAfter!34 () V!24357)

(declare-datatypes ((Unit!27937 0))(
  ( (Unit!27938) )
))
(declare-fun lt!366898 () Unit!27937)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!166 (ListLongMap!8423 (_ BitVec 64) V!24357 V!24357) Unit!27937)

(assert (=> b!818657 (= lt!366898 (addSameAsAddTwiceSameKeyDiffValues!166 lt!366901 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!818657 (= lt!366897 (tuple2!9601 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!454470 () Bool)

(assert (=> b!818657 e!454470))

(declare-fun res!558672 () Bool)

(assert (=> b!818657 (=> (not res!558672) (not e!454470))))

(declare-fun lt!366893 () ListLongMap!8423)

(assert (=> b!818657 (= res!558672 (= lt!366893 lt!366900))))

(assert (=> b!818657 (= lt!366900 (+!1824 lt!366901 lt!366902))))

(assert (=> b!818657 (= lt!366902 (tuple2!9601 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun lt!366894 () ListLongMap!8423)

(declare-fun minValue!754 () V!24357)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2432 (array!45232 array!45234 (_ BitVec 32) (_ BitVec 32) V!24357 V!24357 (_ BitVec 32) Int) ListLongMap!8423)

(assert (=> b!818657 (= lt!366894 (getCurrentListMap!2432 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818657 (= lt!366893 (getCurrentListMap!2432 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818658 () Bool)

(declare-fun res!558667 () Bool)

(assert (=> b!818658 (=> (not res!558667) (not e!454467))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45232 (_ BitVec 32)) Bool)

(assert (=> b!818658 (= res!558667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!818659 () Bool)

(assert (=> b!818659 (= e!454467 (not e!454469))))

(declare-fun res!558670 () Bool)

(assert (=> b!818659 (=> res!558670 e!454469)))

(assert (=> b!818659 (= res!558670 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!818659 (= lt!366901 lt!366895)))

(declare-fun lt!366899 () Unit!27937)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!377 (array!45232 array!45234 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24357 V!24357 V!24357 V!24357 (_ BitVec 32) Int) Unit!27937)

(assert (=> b!818659 (= lt!366899 (lemmaNoChangeToArrayThenSameMapNoExtras!377 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2267 (array!45232 array!45234 (_ BitVec 32) (_ BitVec 32) V!24357 V!24357 (_ BitVec 32) Int) ListLongMap!8423)

(assert (=> b!818659 (= lt!366895 (getCurrentListMapNoExtraKeys!2267 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818659 (= lt!366901 (getCurrentListMapNoExtraKeys!2267 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818660 () Bool)

(assert (=> b!818660 (= e!454470 (= lt!366894 (+!1824 lt!366895 (tuple2!9601 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and start!70480 res!558668) b!818652))

(assert (= (and b!818652 res!558669) b!818658))

(assert (= (and b!818658 res!558667) b!818656))

(assert (= (and b!818656 res!558671) b!818659))

(assert (= (and b!818659 (not res!558670)) b!818657))

(assert (= (and b!818657 res!558672) b!818660))

(assert (= (and b!818654 condMapEmpty!23374) mapIsEmpty!23374))

(assert (= (and b!818654 (not condMapEmpty!23374)) mapNonEmpty!23374))

(get-info :version)

(assert (= (and mapNonEmpty!23374 ((_ is ValueCellFull!6843) mapValue!23374)) b!818653))

(assert (= (and b!818654 ((_ is ValueCellFull!6843) mapDefault!23374)) b!818655))

(assert (= start!70480 b!818654))

(declare-fun m!760033 () Bool)

(assert (=> b!818657 m!760033))

(declare-fun m!760035 () Bool)

(assert (=> b!818657 m!760035))

(declare-fun m!760037 () Bool)

(assert (=> b!818657 m!760037))

(declare-fun m!760039 () Bool)

(assert (=> b!818657 m!760039))

(declare-fun m!760041 () Bool)

(assert (=> b!818657 m!760041))

(declare-fun m!760043 () Bool)

(assert (=> b!818657 m!760043))

(declare-fun m!760045 () Bool)

(assert (=> b!818657 m!760045))

(assert (=> b!818657 m!760037))

(declare-fun m!760047 () Bool)

(assert (=> b!818657 m!760047))

(declare-fun m!760049 () Bool)

(assert (=> mapNonEmpty!23374 m!760049))

(declare-fun m!760051 () Bool)

(assert (=> b!818659 m!760051))

(declare-fun m!760053 () Bool)

(assert (=> b!818659 m!760053))

(declare-fun m!760055 () Bool)

(assert (=> b!818659 m!760055))

(declare-fun m!760057 () Bool)

(assert (=> b!818660 m!760057))

(declare-fun m!760059 () Bool)

(assert (=> start!70480 m!760059))

(declare-fun m!760061 () Bool)

(assert (=> start!70480 m!760061))

(declare-fun m!760063 () Bool)

(assert (=> start!70480 m!760063))

(declare-fun m!760065 () Bool)

(assert (=> b!818656 m!760065))

(declare-fun m!760067 () Bool)

(assert (=> b!818658 m!760067))

(check-sat tp_is_empty!14517 (not start!70480) (not b!818656) (not b!818658) (not b!818660) (not mapNonEmpty!23374) (not b_next!12807) (not b!818659) b_and!21637 (not b!818657))
(check-sat b_and!21637 (not b_next!12807))
