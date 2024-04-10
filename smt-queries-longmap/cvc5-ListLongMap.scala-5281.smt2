; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70856 () Bool)

(assert start!70856)

(declare-fun b_free!13093 () Bool)

(declare-fun b_next!13093 () Bool)

(assert (=> start!70856 (= b_free!13093 (not b_next!13093))))

(declare-fun tp!46027 () Bool)

(declare-fun b_and!21977 () Bool)

(assert (=> start!70856 (= tp!46027 b_and!21977)))

(declare-fun b!822971 () Bool)

(declare-fun e!457640 () Bool)

(declare-fun tp_is_empty!14803 () Bool)

(assert (=> b!822971 (= e!457640 tp_is_empty!14803)))

(declare-fun b!822972 () Bool)

(declare-fun res!561249 () Bool)

(declare-fun e!457639 () Bool)

(assert (=> b!822972 (=> (not res!561249) (not e!457639))))

(declare-datatypes ((array!45800 0))(
  ( (array!45801 (arr!21949 (Array (_ BitVec 32) (_ BitVec 64))) (size!22370 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45800)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45800 (_ BitVec 32)) Bool)

(assert (=> b!822972 (= res!561249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!23818 () Bool)

(declare-fun mapRes!23818 () Bool)

(declare-fun tp!46026 () Bool)

(assert (=> mapNonEmpty!23818 (= mapRes!23818 (and tp!46026 e!457640))))

(declare-datatypes ((V!24739 0))(
  ( (V!24740 (val!7449 Int)) )
))
(declare-datatypes ((ValueCell!6986 0))(
  ( (ValueCellFull!6986 (v!9881 V!24739)) (EmptyCell!6986) )
))
(declare-datatypes ((array!45802 0))(
  ( (array!45803 (arr!21950 (Array (_ BitVec 32) ValueCell!6986)) (size!22371 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45802)

(declare-fun mapKey!23818 () (_ BitVec 32))

(declare-fun mapValue!23818 () ValueCell!6986)

(declare-fun mapRest!23818 () (Array (_ BitVec 32) ValueCell!6986))

(assert (=> mapNonEmpty!23818 (= (arr!21950 _values!788) (store mapRest!23818 mapKey!23818 mapValue!23818))))

(declare-fun b!822973 () Bool)

(declare-fun e!457637 () Bool)

(assert (=> b!822973 (= e!457637 true)))

(declare-datatypes ((tuple2!9844 0))(
  ( (tuple2!9845 (_1!4933 (_ BitVec 64)) (_2!4933 V!24739)) )
))
(declare-datatypes ((List!15658 0))(
  ( (Nil!15655) (Cons!15654 (h!16783 tuple2!9844) (t!21997 List!15658)) )
))
(declare-datatypes ((ListLongMap!8667 0))(
  ( (ListLongMap!8668 (toList!4349 List!15658)) )
))
(declare-fun lt!370709 () ListLongMap!8667)

(declare-fun lt!370708 () ListLongMap!8667)

(declare-fun lt!370705 () tuple2!9844)

(declare-fun +!1898 (ListLongMap!8667 tuple2!9844) ListLongMap!8667)

(assert (=> b!822973 (= lt!370709 (+!1898 lt!370708 lt!370705))))

(declare-datatypes ((Unit!28164 0))(
  ( (Unit!28165) )
))
(declare-fun lt!370704 () Unit!28164)

(declare-fun zeroValueAfter!34 () V!24739)

(declare-fun minValue!754 () V!24739)

(declare-fun lt!370710 () ListLongMap!8667)

(declare-fun addCommutativeForDiffKeys!461 (ListLongMap!8667 (_ BitVec 64) V!24739 (_ BitVec 64) V!24739) Unit!28164)

(assert (=> b!822973 (= lt!370704 (addCommutativeForDiffKeys!461 lt!370710 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!370707 () ListLongMap!8667)

(assert (=> b!822973 (= lt!370707 lt!370709)))

(declare-fun lt!370706 () tuple2!9844)

(assert (=> b!822973 (= lt!370709 (+!1898 (+!1898 lt!370710 lt!370705) lt!370706))))

(assert (=> b!822973 (= lt!370705 (tuple2!9845 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!370711 () ListLongMap!8667)

(assert (=> b!822973 (= lt!370711 lt!370708)))

(assert (=> b!822973 (= lt!370708 (+!1898 lt!370710 lt!370706))))

(assert (=> b!822973 (= lt!370706 (tuple2!9845 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2512 (array!45800 array!45802 (_ BitVec 32) (_ BitVec 32) V!24739 V!24739 (_ BitVec 32) Int) ListLongMap!8667)

(assert (=> b!822973 (= lt!370707 (getCurrentListMap!2512 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24739)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!822973 (= lt!370711 (getCurrentListMap!2512 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822974 () Bool)

(declare-fun e!457636 () Bool)

(declare-fun e!457635 () Bool)

(assert (=> b!822974 (= e!457636 (and e!457635 mapRes!23818))))

(declare-fun condMapEmpty!23818 () Bool)

(declare-fun mapDefault!23818 () ValueCell!6986)

