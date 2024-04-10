; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71486 () Bool)

(assert start!71486)

(declare-fun b_free!13495 () Bool)

(declare-fun b_next!13495 () Bool)

(assert (=> start!71486 (= b_free!13495 (not b_next!13495))))

(declare-fun tp!47271 () Bool)

(declare-fun b_and!22525 () Bool)

(assert (=> start!71486 (= tp!47271 b_and!22525)))

(declare-fun mapNonEmpty!24460 () Bool)

(declare-fun mapRes!24460 () Bool)

(declare-fun tp!47272 () Bool)

(declare-fun e!462835 () Bool)

(assert (=> mapNonEmpty!24460 (= mapRes!24460 (and tp!47272 e!462835))))

(declare-datatypes ((V!25275 0))(
  ( (V!25276 (val!7650 Int)) )
))
(declare-datatypes ((ValueCell!7187 0))(
  ( (ValueCellFull!7187 (v!10092 V!25275)) (EmptyCell!7187) )
))
(declare-fun mapRest!24460 () (Array (_ BitVec 32) ValueCell!7187))

(declare-datatypes ((array!46580 0))(
  ( (array!46581 (arr!22326 (Array (_ BitVec 32) ValueCell!7187)) (size!22747 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46580)

(declare-fun mapKey!24460 () (_ BitVec 32))

(declare-fun mapValue!24460 () ValueCell!7187)

(assert (=> mapNonEmpty!24460 (= (arr!22326 _values!788) (store mapRest!24460 mapKey!24460 mapValue!24460))))

(declare-fun b!830172 () Bool)

(declare-fun res!565427 () Bool)

(declare-fun e!462838 () Bool)

(assert (=> b!830172 (=> (not res!565427) (not e!462838))))

(declare-datatypes ((array!46582 0))(
  ( (array!46583 (arr!22327 (Array (_ BitVec 32) (_ BitVec 64))) (size!22748 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46582)

(declare-datatypes ((List!15942 0))(
  ( (Nil!15939) (Cons!15938 (h!17067 (_ BitVec 64)) (t!22307 List!15942)) )
))
(declare-fun arrayNoDuplicates!0 (array!46582 (_ BitVec 32) List!15942) Bool)

(assert (=> b!830172 (= res!565427 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15939))))

(declare-fun b!830173 () Bool)

(declare-fun e!462834 () Bool)

(assert (=> b!830173 (= e!462838 (not e!462834))))

(declare-fun res!565425 () Bool)

(assert (=> b!830173 (=> res!565425 e!462834)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!830173 (= res!565425 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!10148 0))(
  ( (tuple2!10149 (_1!5085 (_ BitVec 64)) (_2!5085 V!25275)) )
))
(declare-datatypes ((List!15943 0))(
  ( (Nil!15940) (Cons!15939 (h!17068 tuple2!10148) (t!22308 List!15943)) )
))
(declare-datatypes ((ListLongMap!8971 0))(
  ( (ListLongMap!8972 (toList!4501 List!15943)) )
))
(declare-fun lt!376661 () ListLongMap!8971)

(declare-fun lt!376662 () ListLongMap!8971)

(assert (=> b!830173 (= lt!376661 lt!376662)))

(declare-fun zeroValueBefore!34 () V!25275)

(declare-datatypes ((Unit!28427 0))(
  ( (Unit!28428) )
))
(declare-fun lt!376658 () Unit!28427)

(declare-fun zeroValueAfter!34 () V!25275)

(declare-fun minValue!754 () V!25275)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!588 (array!46582 array!46580 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25275 V!25275 V!25275 V!25275 (_ BitVec 32) Int) Unit!28427)

(assert (=> b!830173 (= lt!376658 (lemmaNoChangeToArrayThenSameMapNoExtras!588 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2500 (array!46582 array!46580 (_ BitVec 32) (_ BitVec 32) V!25275 V!25275 (_ BitVec 32) Int) ListLongMap!8971)

(assert (=> b!830173 (= lt!376662 (getCurrentListMapNoExtraKeys!2500 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!830173 (= lt!376661 (getCurrentListMapNoExtraKeys!2500 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!24460 () Bool)

(assert (=> mapIsEmpty!24460 mapRes!24460))

(declare-fun b!830174 () Bool)

(declare-fun e!462840 () Bool)

(declare-fun tp_is_empty!15205 () Bool)

(assert (=> b!830174 (= e!462840 tp_is_empty!15205)))

(declare-fun lt!376659 () tuple2!10148)

(declare-fun b!830175 () Bool)

(declare-fun lt!376656 () ListLongMap!8971)

(declare-fun e!462839 () Bool)

(declare-fun +!1979 (ListLongMap!8971 tuple2!10148) ListLongMap!8971)

(assert (=> b!830175 (= e!462839 (= lt!376656 (+!1979 (+!1979 lt!376662 (tuple2!10149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!376659)))))

(declare-fun res!565426 () Bool)

(assert (=> start!71486 (=> (not res!565426) (not e!462838))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71486 (= res!565426 (validMask!0 mask!1312))))

(assert (=> start!71486 e!462838))

(assert (=> start!71486 tp_is_empty!15205))

(declare-fun array_inv!17781 (array!46582) Bool)

(assert (=> start!71486 (array_inv!17781 _keys!976)))

(assert (=> start!71486 true))

(declare-fun e!462836 () Bool)

(declare-fun array_inv!17782 (array!46580) Bool)

(assert (=> start!71486 (and (array_inv!17782 _values!788) e!462836)))

(assert (=> start!71486 tp!47271))

(declare-fun b!830176 () Bool)

(assert (=> b!830176 (= e!462835 tp_is_empty!15205)))

(declare-fun b!830177 () Bool)

(declare-fun res!565423 () Bool)

(assert (=> b!830177 (=> (not res!565423) (not e!462838))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46582 (_ BitVec 32)) Bool)

(assert (=> b!830177 (= res!565423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!830178 () Bool)

(declare-fun lt!376660 () ListLongMap!8971)

(declare-fun lt!376657 () tuple2!10148)

(assert (=> b!830178 (= e!462834 (= lt!376660 (+!1979 (+!1979 lt!376661 lt!376659) lt!376657)))))

(assert (=> b!830178 e!462839))

(declare-fun res!565428 () Bool)

(assert (=> b!830178 (=> (not res!565428) (not e!462839))))

(assert (=> b!830178 (= res!565428 (= lt!376660 (+!1979 (+!1979 lt!376661 lt!376657) lt!376659)))))

(assert (=> b!830178 (= lt!376659 (tuple2!10149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!830178 (= lt!376657 (tuple2!10149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2597 (array!46582 array!46580 (_ BitVec 32) (_ BitVec 32) V!25275 V!25275 (_ BitVec 32) Int) ListLongMap!8971)

(assert (=> b!830178 (= lt!376656 (getCurrentListMap!2597 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!830178 (= lt!376660 (getCurrentListMap!2597 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!830179 () Bool)

(assert (=> b!830179 (= e!462836 (and e!462840 mapRes!24460))))

(declare-fun condMapEmpty!24460 () Bool)

(declare-fun mapDefault!24460 () ValueCell!7187)

