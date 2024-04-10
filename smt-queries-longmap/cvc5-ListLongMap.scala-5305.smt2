; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71034 () Bool)

(assert start!71034)

(declare-fun b_free!13237 () Bool)

(declare-fun b_next!13237 () Bool)

(assert (=> start!71034 (= b_free!13237 (not b_next!13237))))

(declare-fun tp!46465 () Bool)

(declare-fun b_and!22141 () Bool)

(assert (=> start!71034 (= tp!46465 b_and!22141)))

(declare-fun b!824884 () Bool)

(declare-fun res!562359 () Bool)

(declare-fun e!459019 () Bool)

(assert (=> b!824884 (=> (not res!562359) (not e!459019))))

(declare-datatypes ((array!46082 0))(
  ( (array!46083 (arr!22088 (Array (_ BitVec 32) (_ BitVec 64))) (size!22509 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46082)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46082 (_ BitVec 32)) Bool)

(assert (=> b!824884 (= res!562359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!824885 () Bool)

(declare-fun e!459018 () Bool)

(assert (=> b!824885 (= e!459019 (not e!459018))))

(declare-fun res!562362 () Bool)

(assert (=> b!824885 (=> res!562362 e!459018)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!824885 (= res!562362 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!24931 0))(
  ( (V!24932 (val!7521 Int)) )
))
(declare-datatypes ((tuple2!9956 0))(
  ( (tuple2!9957 (_1!4989 (_ BitVec 64)) (_2!4989 V!24931)) )
))
(declare-datatypes ((List!15763 0))(
  ( (Nil!15760) (Cons!15759 (h!16888 tuple2!9956) (t!22106 List!15763)) )
))
(declare-datatypes ((ListLongMap!8779 0))(
  ( (ListLongMap!8780 (toList!4405 List!15763)) )
))
(declare-fun lt!372048 () ListLongMap!8779)

(declare-fun lt!372049 () ListLongMap!8779)

(assert (=> b!824885 (= lt!372048 lt!372049)))

(declare-fun zeroValueBefore!34 () V!24931)

(declare-fun zeroValueAfter!34 () V!24931)

(declare-fun minValue!754 () V!24931)

(declare-datatypes ((ValueCell!7058 0))(
  ( (ValueCellFull!7058 (v!9954 V!24931)) (EmptyCell!7058) )
))
(declare-datatypes ((array!46084 0))(
  ( (array!46085 (arr!22089 (Array (_ BitVec 32) ValueCell!7058)) (size!22510 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46084)

(declare-fun defaultEntry!796 () Int)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28274 0))(
  ( (Unit!28275) )
))
(declare-fun lt!372050 () Unit!28274)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!528 (array!46082 array!46084 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24931 V!24931 V!24931 V!24931 (_ BitVec 32) Int) Unit!28274)

(assert (=> b!824885 (= lt!372050 (lemmaNoChangeToArrayThenSameMapNoExtras!528 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2418 (array!46082 array!46084 (_ BitVec 32) (_ BitVec 32) V!24931 V!24931 (_ BitVec 32) Int) ListLongMap!8779)

(assert (=> b!824885 (= lt!372049 (getCurrentListMapNoExtraKeys!2418 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824885 (= lt!372048 (getCurrentListMapNoExtraKeys!2418 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!24040 () Bool)

(declare-fun mapRes!24040 () Bool)

(assert (=> mapIsEmpty!24040 mapRes!24040))

(declare-fun b!824886 () Bool)

(declare-fun e!459023 () Bool)

(declare-fun e!459021 () Bool)

(assert (=> b!824886 (= e!459023 (and e!459021 mapRes!24040))))

(declare-fun condMapEmpty!24040 () Bool)

(declare-fun mapDefault!24040 () ValueCell!7058)

