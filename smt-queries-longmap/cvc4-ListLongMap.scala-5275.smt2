; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70804 () Bool)

(assert start!70804)

(declare-fun b_free!13061 () Bool)

(declare-fun b_next!13061 () Bool)

(assert (=> start!70804 (= b_free!13061 (not b_next!13061))))

(declare-fun tp!45928 () Bool)

(declare-fun b_and!21933 () Bool)

(assert (=> start!70804 (= tp!45928 b_and!21933)))

(declare-fun b!822406 () Bool)

(declare-fun e!457239 () Bool)

(assert (=> b!822406 (= e!457239 true)))

(declare-datatypes ((V!24695 0))(
  ( (V!24696 (val!7433 Int)) )
))
(declare-datatypes ((tuple2!9816 0))(
  ( (tuple2!9817 (_1!4919 (_ BitVec 64)) (_2!4919 V!24695)) )
))
(declare-datatypes ((List!15631 0))(
  ( (Nil!15628) (Cons!15627 (h!16756 tuple2!9816) (t!21968 List!15631)) )
))
(declare-datatypes ((ListLongMap!8639 0))(
  ( (ListLongMap!8640 (toList!4335 List!15631)) )
))
(declare-fun lt!370074 () ListLongMap!8639)

(declare-fun lt!370073 () ListLongMap!8639)

(declare-fun lt!370076 () tuple2!9816)

(declare-fun +!1885 (ListLongMap!8639 tuple2!9816) ListLongMap!8639)

(assert (=> b!822406 (= lt!370074 (+!1885 lt!370073 lt!370076))))

(declare-datatypes ((Unit!28134 0))(
  ( (Unit!28135) )
))
(declare-fun lt!370069 () Unit!28134)

(declare-fun lt!370075 () ListLongMap!8639)

(declare-fun zeroValueAfter!34 () V!24695)

(declare-fun minValue!754 () V!24695)

(declare-fun addCommutativeForDiffKeys!448 (ListLongMap!8639 (_ BitVec 64) V!24695 (_ BitVec 64) V!24695) Unit!28134)

(assert (=> b!822406 (= lt!370069 (addCommutativeForDiffKeys!448 lt!370075 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!370070 () ListLongMap!8639)

(assert (=> b!822406 (= lt!370070 lt!370074)))

(declare-fun lt!370068 () tuple2!9816)

(assert (=> b!822406 (= lt!370074 (+!1885 (+!1885 lt!370075 lt!370076) lt!370068))))

(assert (=> b!822406 (= lt!370076 (tuple2!9817 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!370071 () ListLongMap!8639)

(assert (=> b!822406 (= lt!370071 lt!370073)))

(assert (=> b!822406 (= lt!370073 (+!1885 lt!370075 lt!370068))))

(assert (=> b!822406 (= lt!370068 (tuple2!9817 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-datatypes ((array!45734 0))(
  ( (array!45735 (arr!21917 (Array (_ BitVec 32) (_ BitVec 64))) (size!22338 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45734)

(declare-datatypes ((ValueCell!6970 0))(
  ( (ValueCellFull!6970 (v!9864 V!24695)) (EmptyCell!6970) )
))
(declare-datatypes ((array!45736 0))(
  ( (array!45737 (arr!21918 (Array (_ BitVec 32) ValueCell!6970)) (size!22339 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45736)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2499 (array!45734 array!45736 (_ BitVec 32) (_ BitVec 32) V!24695 V!24695 (_ BitVec 32) Int) ListLongMap!8639)

(assert (=> b!822406 (= lt!370070 (getCurrentListMap!2499 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24695)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!822406 (= lt!370071 (getCurrentListMap!2499 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822407 () Bool)

(declare-fun res!560933 () Bool)

(declare-fun e!457234 () Bool)

(assert (=> b!822407 (=> (not res!560933) (not e!457234))))

(declare-datatypes ((List!15632 0))(
  ( (Nil!15629) (Cons!15628 (h!16757 (_ BitVec 64)) (t!21969 List!15632)) )
))
(declare-fun arrayNoDuplicates!0 (array!45734 (_ BitVec 32) List!15632) Bool)

(assert (=> b!822407 (= res!560933 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15629))))

(declare-fun res!560931 () Bool)

(assert (=> start!70804 (=> (not res!560931) (not e!457234))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70804 (= res!560931 (validMask!0 mask!1312))))

(assert (=> start!70804 e!457234))

(declare-fun tp_is_empty!14771 () Bool)

(assert (=> start!70804 tp_is_empty!14771))

(declare-fun array_inv!17505 (array!45734) Bool)

(assert (=> start!70804 (array_inv!17505 _keys!976)))

(assert (=> start!70804 true))

(declare-fun e!457235 () Bool)

(declare-fun array_inv!17506 (array!45736) Bool)

(assert (=> start!70804 (and (array_inv!17506 _values!788) e!457235)))

(assert (=> start!70804 tp!45928))

(declare-fun b!822408 () Bool)

(declare-fun res!560932 () Bool)

(assert (=> b!822408 (=> (not res!560932) (not e!457234))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45734 (_ BitVec 32)) Bool)

(assert (=> b!822408 (= res!560932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!822409 () Bool)

(assert (=> b!822409 (= e!457234 (not e!457239))))

(declare-fun res!560934 () Bool)

(assert (=> b!822409 (=> res!560934 e!457239)))

(assert (=> b!822409 (= res!560934 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!370072 () ListLongMap!8639)

(assert (=> b!822409 (= lt!370075 lt!370072)))

(declare-fun lt!370077 () Unit!28134)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!464 (array!45734 array!45736 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24695 V!24695 V!24695 V!24695 (_ BitVec 32) Int) Unit!28134)

(assert (=> b!822409 (= lt!370077 (lemmaNoChangeToArrayThenSameMapNoExtras!464 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2354 (array!45734 array!45736 (_ BitVec 32) (_ BitVec 32) V!24695 V!24695 (_ BitVec 32) Int) ListLongMap!8639)

(assert (=> b!822409 (= lt!370072 (getCurrentListMapNoExtraKeys!2354 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822409 (= lt!370075 (getCurrentListMapNoExtraKeys!2354 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822410 () Bool)

(declare-fun e!457238 () Bool)

(declare-fun mapRes!23767 () Bool)

(assert (=> b!822410 (= e!457235 (and e!457238 mapRes!23767))))

(declare-fun condMapEmpty!23767 () Bool)

(declare-fun mapDefault!23767 () ValueCell!6970)

