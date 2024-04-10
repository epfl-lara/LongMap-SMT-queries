; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70314 () Bool)

(assert start!70314)

(declare-fun b_free!12689 () Bool)

(declare-fun b_next!12689 () Bool)

(assert (=> start!70314 (= b_free!12689 (not b_next!12689))))

(declare-fun tp!44791 () Bool)

(declare-fun b_and!21489 () Bool)

(assert (=> start!70314 (= tp!44791 b_and!21489)))

(declare-fun b!816895 () Bool)

(declare-fun e!453222 () Bool)

(declare-fun tp_is_empty!14399 () Bool)

(assert (=> b!816895 (= e!453222 tp_is_empty!14399)))

(declare-fun b!816896 () Bool)

(declare-fun e!453225 () Bool)

(assert (=> b!816896 (= e!453225 tp_is_empty!14399)))

(declare-fun mapNonEmpty!23188 () Bool)

(declare-fun mapRes!23188 () Bool)

(declare-fun tp!44790 () Bool)

(assert (=> mapNonEmpty!23188 (= mapRes!23188 (and tp!44790 e!453222))))

(declare-datatypes ((V!24199 0))(
  ( (V!24200 (val!7247 Int)) )
))
(declare-datatypes ((ValueCell!6784 0))(
  ( (ValueCellFull!6784 (v!9675 V!24199)) (EmptyCell!6784) )
))
(declare-fun mapRest!23188 () (Array (_ BitVec 32) ValueCell!6784))

(declare-datatypes ((array!44996 0))(
  ( (array!44997 (arr!21555 (Array (_ BitVec 32) ValueCell!6784)) (size!21976 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44996)

(declare-fun mapValue!23188 () ValueCell!6784)

(declare-fun mapKey!23188 () (_ BitVec 32))

(assert (=> mapNonEmpty!23188 (= (arr!21555 _values!788) (store mapRest!23188 mapKey!23188 mapValue!23188))))

(declare-fun res!557690 () Bool)

(declare-fun e!453224 () Bool)

(assert (=> start!70314 (=> (not res!557690) (not e!453224))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70314 (= res!557690 (validMask!0 mask!1312))))

(assert (=> start!70314 e!453224))

(assert (=> start!70314 tp_is_empty!14399))

(declare-datatypes ((array!44998 0))(
  ( (array!44999 (arr!21556 (Array (_ BitVec 32) (_ BitVec 64))) (size!21977 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44998)

(declare-fun array_inv!17245 (array!44998) Bool)

(assert (=> start!70314 (array_inv!17245 _keys!976)))

(assert (=> start!70314 true))

(declare-fun e!453221 () Bool)

(declare-fun array_inv!17246 (array!44996) Bool)

(assert (=> start!70314 (and (array_inv!17246 _values!788) e!453221)))

(assert (=> start!70314 tp!44791))

(declare-fun b!816897 () Bool)

(declare-fun res!557688 () Bool)

(assert (=> b!816897 (=> (not res!557688) (not e!453224))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!816897 (= res!557688 (and (= (size!21976 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21977 _keys!976) (size!21976 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!816898 () Bool)

(declare-fun res!557687 () Bool)

(assert (=> b!816898 (=> (not res!557687) (not e!453224))))

(declare-datatypes ((List!15352 0))(
  ( (Nil!15349) (Cons!15348 (h!16477 (_ BitVec 64)) (t!21675 List!15352)) )
))
(declare-fun arrayNoDuplicates!0 (array!44998 (_ BitVec 32) List!15352) Bool)

(assert (=> b!816898 (= res!557687 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15349))))

(declare-fun b!816899 () Bool)

(declare-fun e!453223 () Bool)

(assert (=> b!816899 (= e!453223 true)))

(declare-fun zeroValueAfter!34 () V!24199)

(declare-fun minValue!754 () V!24199)

(declare-datatypes ((tuple2!9524 0))(
  ( (tuple2!9525 (_1!4773 (_ BitVec 64)) (_2!4773 V!24199)) )
))
(declare-datatypes ((List!15353 0))(
  ( (Nil!15350) (Cons!15349 (h!16478 tuple2!9524) (t!21676 List!15353)) )
))
(declare-datatypes ((ListLongMap!8347 0))(
  ( (ListLongMap!8348 (toList!4189 List!15353)) )
))
(declare-fun lt!365958 () ListLongMap!8347)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2413 (array!44998 array!44996 (_ BitVec 32) (_ BitVec 32) V!24199 V!24199 (_ BitVec 32) Int) ListLongMap!8347)

(assert (=> b!816899 (= lt!365958 (getCurrentListMap!2413 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24199)

(declare-fun lt!365959 () ListLongMap!8347)

(declare-fun +!1819 (ListLongMap!8347 tuple2!9524) ListLongMap!8347)

(assert (=> b!816899 (= lt!365959 (+!1819 (getCurrentListMap!2413 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9525 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun mapIsEmpty!23188 () Bool)

(assert (=> mapIsEmpty!23188 mapRes!23188))

(declare-fun b!816900 () Bool)

(declare-fun res!557691 () Bool)

(assert (=> b!816900 (=> (not res!557691) (not e!453224))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44998 (_ BitVec 32)) Bool)

(assert (=> b!816900 (= res!557691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!816901 () Bool)

(assert (=> b!816901 (= e!453221 (and e!453225 mapRes!23188))))

(declare-fun condMapEmpty!23188 () Bool)

(declare-fun mapDefault!23188 () ValueCell!6784)

