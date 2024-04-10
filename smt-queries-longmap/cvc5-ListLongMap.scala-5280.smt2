; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70850 () Bool)

(assert start!70850)

(declare-fun b_free!13087 () Bool)

(declare-fun b_next!13087 () Bool)

(assert (=> start!70850 (= b_free!13087 (not b_next!13087))))

(declare-fun tp!46009 () Bool)

(declare-fun b_and!21971 () Bool)

(assert (=> start!70850 (= tp!46009 b_and!21971)))

(declare-fun b!822899 () Bool)

(declare-fun res!561207 () Bool)

(declare-fun e!457583 () Bool)

(assert (=> b!822899 (=> (not res!561207) (not e!457583))))

(declare-datatypes ((array!45788 0))(
  ( (array!45789 (arr!21943 (Array (_ BitVec 32) (_ BitVec 64))) (size!22364 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45788)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24731 0))(
  ( (V!24732 (val!7446 Int)) )
))
(declare-datatypes ((ValueCell!6983 0))(
  ( (ValueCellFull!6983 (v!9878 V!24731)) (EmptyCell!6983) )
))
(declare-datatypes ((array!45790 0))(
  ( (array!45791 (arr!21944 (Array (_ BitVec 32) ValueCell!6983)) (size!22365 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45790)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!822899 (= res!561207 (and (= (size!22365 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22364 _keys!976) (size!22365 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!822900 () Bool)

(declare-fun e!457586 () Bool)

(assert (=> b!822900 (= e!457583 (not e!457586))))

(declare-fun res!561208 () Bool)

(assert (=> b!822900 (=> res!561208 e!457586)))

(assert (=> b!822900 (= res!561208 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9838 0))(
  ( (tuple2!9839 (_1!4930 (_ BitVec 64)) (_2!4930 V!24731)) )
))
(declare-datatypes ((List!15652 0))(
  ( (Nil!15649) (Cons!15648 (h!16777 tuple2!9838) (t!21991 List!15652)) )
))
(declare-datatypes ((ListLongMap!8661 0))(
  ( (ListLongMap!8662 (toList!4346 List!15652)) )
))
(declare-fun lt!370614 () ListLongMap!8661)

(declare-fun lt!370615 () ListLongMap!8661)

(assert (=> b!822900 (= lt!370614 lt!370615)))

(declare-fun zeroValueBefore!34 () V!24731)

(declare-fun zeroValueAfter!34 () V!24731)

(declare-fun minValue!754 () V!24731)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28158 0))(
  ( (Unit!28159) )
))
(declare-fun lt!370619 () Unit!28158)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!474 (array!45788 array!45790 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24731 V!24731 V!24731 V!24731 (_ BitVec 32) Int) Unit!28158)

(assert (=> b!822900 (= lt!370619 (lemmaNoChangeToArrayThenSameMapNoExtras!474 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2364 (array!45788 array!45790 (_ BitVec 32) (_ BitVec 32) V!24731 V!24731 (_ BitVec 32) Int) ListLongMap!8661)

(assert (=> b!822900 (= lt!370615 (getCurrentListMapNoExtraKeys!2364 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822900 (= lt!370614 (getCurrentListMapNoExtraKeys!2364 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23809 () Bool)

(declare-fun mapRes!23809 () Bool)

(assert (=> mapIsEmpty!23809 mapRes!23809))

(declare-fun b!822901 () Bool)

(declare-fun res!561206 () Bool)

(assert (=> b!822901 (=> (not res!561206) (not e!457583))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45788 (_ BitVec 32)) Bool)

(assert (=> b!822901 (= res!561206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!23809 () Bool)

(declare-fun tp!46008 () Bool)

(declare-fun e!457585 () Bool)

(assert (=> mapNonEmpty!23809 (= mapRes!23809 (and tp!46008 e!457585))))

(declare-fun mapKey!23809 () (_ BitVec 32))

(declare-fun mapRest!23809 () (Array (_ BitVec 32) ValueCell!6983))

(declare-fun mapValue!23809 () ValueCell!6983)

(assert (=> mapNonEmpty!23809 (= (arr!21944 _values!788) (store mapRest!23809 mapKey!23809 mapValue!23809))))

(declare-fun b!822902 () Bool)

(assert (=> b!822902 (= e!457586 true)))

(declare-fun lt!370620 () ListLongMap!8661)

(declare-fun lt!370617 () ListLongMap!8661)

(declare-fun lt!370621 () tuple2!9838)

(declare-fun +!1895 (ListLongMap!8661 tuple2!9838) ListLongMap!8661)

(assert (=> b!822902 (= lt!370620 (+!1895 lt!370617 lt!370621))))

(declare-fun lt!370613 () Unit!28158)

(declare-fun addCommutativeForDiffKeys!458 (ListLongMap!8661 (_ BitVec 64) V!24731 (_ BitVec 64) V!24731) Unit!28158)

(assert (=> b!822902 (= lt!370613 (addCommutativeForDiffKeys!458 lt!370614 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!370622 () ListLongMap!8661)

(assert (=> b!822902 (= lt!370622 lt!370620)))

(declare-fun lt!370616 () tuple2!9838)

(assert (=> b!822902 (= lt!370620 (+!1895 (+!1895 lt!370614 lt!370621) lt!370616))))

(assert (=> b!822902 (= lt!370621 (tuple2!9839 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!370618 () ListLongMap!8661)

(assert (=> b!822902 (= lt!370618 lt!370617)))

(assert (=> b!822902 (= lt!370617 (+!1895 lt!370614 lt!370616))))

(assert (=> b!822902 (= lt!370616 (tuple2!9839 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun getCurrentListMap!2509 (array!45788 array!45790 (_ BitVec 32) (_ BitVec 32) V!24731 V!24731 (_ BitVec 32) Int) ListLongMap!8661)

(assert (=> b!822902 (= lt!370622 (getCurrentListMap!2509 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822902 (= lt!370618 (getCurrentListMap!2509 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!561205 () Bool)

(assert (=> start!70850 (=> (not res!561205) (not e!457583))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70850 (= res!561205 (validMask!0 mask!1312))))

(assert (=> start!70850 e!457583))

(declare-fun tp_is_empty!14797 () Bool)

(assert (=> start!70850 tp_is_empty!14797))

(declare-fun array_inv!17527 (array!45788) Bool)

(assert (=> start!70850 (array_inv!17527 _keys!976)))

(assert (=> start!70850 true))

(declare-fun e!457582 () Bool)

(declare-fun array_inv!17528 (array!45790) Bool)

(assert (=> start!70850 (and (array_inv!17528 _values!788) e!457582)))

(assert (=> start!70850 tp!46009))

(declare-fun b!822903 () Bool)

(declare-fun e!457581 () Bool)

(assert (=> b!822903 (= e!457581 tp_is_empty!14797)))

(declare-fun b!822904 () Bool)

(declare-fun res!561204 () Bool)

(assert (=> b!822904 (=> (not res!561204) (not e!457583))))

(declare-datatypes ((List!15653 0))(
  ( (Nil!15650) (Cons!15649 (h!16778 (_ BitVec 64)) (t!21992 List!15653)) )
))
(declare-fun arrayNoDuplicates!0 (array!45788 (_ BitVec 32) List!15653) Bool)

(assert (=> b!822904 (= res!561204 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15650))))

(declare-fun b!822905 () Bool)

(assert (=> b!822905 (= e!457582 (and e!457581 mapRes!23809))))

(declare-fun condMapEmpty!23809 () Bool)

(declare-fun mapDefault!23809 () ValueCell!6983)

