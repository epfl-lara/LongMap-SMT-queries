; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71096 () Bool)

(assert start!71096)

(declare-fun b_free!13283 () Bool)

(declare-fun b_next!13283 () Bool)

(assert (=> start!71096 (= b_free!13283 (not b_next!13283))))

(declare-fun tp!46605 () Bool)

(declare-fun b_and!22197 () Bool)

(assert (=> start!71096 (= tp!46605 b_and!22197)))

(declare-fun b!825708 () Bool)

(declare-fun e!459653 () Bool)

(declare-fun tp_is_empty!14993 () Bool)

(assert (=> b!825708 (= e!459653 tp_is_empty!14993)))

(declare-datatypes ((V!24991 0))(
  ( (V!24992 (val!7544 Int)) )
))
(declare-datatypes ((tuple2!9988 0))(
  ( (tuple2!9989 (_1!5005 (_ BitVec 64)) (_2!5005 V!24991)) )
))
(declare-datatypes ((List!15791 0))(
  ( (Nil!15788) (Cons!15787 (h!16916 tuple2!9988) (t!22136 List!15791)) )
))
(declare-datatypes ((ListLongMap!8811 0))(
  ( (ListLongMap!8812 (toList!4421 List!15791)) )
))
(declare-fun lt!373061 () ListLongMap!8811)

(declare-fun b!825709 () Bool)

(declare-fun zeroValueAfter!34 () V!24991)

(declare-fun lt!373057 () ListLongMap!8811)

(declare-fun lt!373055 () tuple2!9988)

(declare-fun e!459652 () Bool)

(declare-fun +!1928 (ListLongMap!8811 tuple2!9988) ListLongMap!8811)

(assert (=> b!825709 (= e!459652 (= lt!373061 (+!1928 (+!1928 lt!373057 (tuple2!9989 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!373055)))))

(declare-fun b!825710 () Bool)

(declare-fun res!562886 () Bool)

(declare-fun e!459650 () Bool)

(assert (=> b!825710 (=> (not res!562886) (not e!459650))))

(declare-datatypes ((array!46168 0))(
  ( (array!46169 (arr!22130 (Array (_ BitVec 32) (_ BitVec 64))) (size!22551 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46168)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46168 (_ BitVec 32)) Bool)

(assert (=> b!825710 (= res!562886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!24112 () Bool)

(declare-fun mapRes!24112 () Bool)

(declare-fun tp!46606 () Bool)

(assert (=> mapNonEmpty!24112 (= mapRes!24112 (and tp!46606 e!459653))))

(declare-datatypes ((ValueCell!7081 0))(
  ( (ValueCellFull!7081 (v!9977 V!24991)) (EmptyCell!7081) )
))
(declare-fun mapRest!24112 () (Array (_ BitVec 32) ValueCell!7081))

(declare-fun mapKey!24112 () (_ BitVec 32))

(declare-datatypes ((array!46170 0))(
  ( (array!46171 (arr!22131 (Array (_ BitVec 32) ValueCell!7081)) (size!22552 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46170)

(declare-fun mapValue!24112 () ValueCell!7081)

(assert (=> mapNonEmpty!24112 (= (arr!22131 _values!788) (store mapRest!24112 mapKey!24112 mapValue!24112))))

(declare-fun b!825711 () Bool)

(declare-fun e!459657 () Bool)

(assert (=> b!825711 (= e!459657 tp_is_empty!14993)))

(declare-fun lt!373058 () tuple2!9988)

(declare-fun e!459654 () Bool)

(declare-fun b!825712 () Bool)

(assert (=> b!825712 (= e!459654 (= lt!373061 (+!1928 (+!1928 lt!373057 lt!373055) lt!373058)))))

(declare-fun b!825713 () Bool)

(declare-fun e!459655 () Bool)

(assert (=> b!825713 (= e!459650 (not e!459655))))

(declare-fun res!562885 () Bool)

(assert (=> b!825713 (=> res!562885 e!459655)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!825713 (= res!562885 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!373062 () ListLongMap!8811)

(assert (=> b!825713 (= lt!373062 lt!373057)))

(declare-fun zeroValueBefore!34 () V!24991)

(declare-fun minValue!754 () V!24991)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28303 0))(
  ( (Unit!28304) )
))
(declare-fun lt!373052 () Unit!28303)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!541 (array!46168 array!46170 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24991 V!24991 V!24991 V!24991 (_ BitVec 32) Int) Unit!28303)

(assert (=> b!825713 (= lt!373052 (lemmaNoChangeToArrayThenSameMapNoExtras!541 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2431 (array!46168 array!46170 (_ BitVec 32) (_ BitVec 32) V!24991 V!24991 (_ BitVec 32) Int) ListLongMap!8811)

(assert (=> b!825713 (= lt!373057 (getCurrentListMapNoExtraKeys!2431 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825713 (= lt!373062 (getCurrentListMapNoExtraKeys!2431 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!562888 () Bool)

(assert (=> start!71096 (=> (not res!562888) (not e!459650))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71096 (= res!562888 (validMask!0 mask!1312))))

(assert (=> start!71096 e!459650))

(assert (=> start!71096 tp_is_empty!14993))

(declare-fun array_inv!17643 (array!46168) Bool)

(assert (=> start!71096 (array_inv!17643 _keys!976)))

(assert (=> start!71096 true))

(declare-fun e!459651 () Bool)

(declare-fun array_inv!17644 (array!46170) Bool)

(assert (=> start!71096 (and (array_inv!17644 _values!788) e!459651)))

(assert (=> start!71096 tp!46605))

(declare-fun mapIsEmpty!24112 () Bool)

(assert (=> mapIsEmpty!24112 mapRes!24112))

(declare-fun b!825714 () Bool)

(assert (=> b!825714 (= e!459651 (and e!459657 mapRes!24112))))

(declare-fun condMapEmpty!24112 () Bool)

(declare-fun mapDefault!24112 () ValueCell!7081)

