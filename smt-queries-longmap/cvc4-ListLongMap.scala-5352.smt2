; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71690 () Bool)

(assert start!71690)

(declare-fun b_free!13523 () Bool)

(declare-fun b_next!13523 () Bool)

(assert (=> start!71690 (= b_free!13523 (not b_next!13523))))

(declare-fun tp!47365 () Bool)

(declare-fun b_and!22609 () Bool)

(assert (=> start!71690 (= tp!47365 b_and!22609)))

(declare-fun b!833735 () Bool)

(declare-fun res!566922 () Bool)

(declare-fun e!465127 () Bool)

(assert (=> b!833735 (=> (not res!566922) (not e!465127))))

(declare-datatypes ((array!46640 0))(
  ( (array!46641 (arr!22354 (Array (_ BitVec 32) (_ BitVec 64))) (size!22775 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46640)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!25311 0))(
  ( (V!25312 (val!7664 Int)) )
))
(declare-datatypes ((ValueCell!7201 0))(
  ( (ValueCellFull!7201 (v!10112 V!25311)) (EmptyCell!7201) )
))
(declare-datatypes ((array!46642 0))(
  ( (array!46643 (arr!22355 (Array (_ BitVec 32) ValueCell!7201)) (size!22776 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46642)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!833735 (= res!566922 (and (= (size!22776 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22775 _keys!976) (size!22776 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!833736 () Bool)

(declare-fun e!465124 () Bool)

(assert (=> b!833736 (= e!465127 (not e!465124))))

(declare-fun res!566921 () Bool)

(assert (=> b!833736 (=> res!566921 e!465124)))

(assert (=> b!833736 (= res!566921 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!10176 0))(
  ( (tuple2!10177 (_1!5099 (_ BitVec 64)) (_2!5099 V!25311)) )
))
(declare-datatypes ((List!15967 0))(
  ( (Nil!15964) (Cons!15963 (h!17094 tuple2!10176) (t!22338 List!15967)) )
))
(declare-datatypes ((ListLongMap!8999 0))(
  ( (ListLongMap!9000 (toList!4515 List!15967)) )
))
(declare-fun lt!378513 () ListLongMap!8999)

(declare-fun lt!378514 () ListLongMap!8999)

(assert (=> b!833736 (= lt!378513 lt!378514)))

(declare-fun zeroValueBefore!34 () V!25311)

(declare-fun zeroValueAfter!34 () V!25311)

(declare-fun minValue!754 () V!25311)

(declare-datatypes ((Unit!28573 0))(
  ( (Unit!28574) )
))
(declare-fun lt!378510 () Unit!28573)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!601 (array!46640 array!46642 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25311 V!25311 V!25311 V!25311 (_ BitVec 32) Int) Unit!28573)

(assert (=> b!833736 (= lt!378510 (lemmaNoChangeToArrayThenSameMapNoExtras!601 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2513 (array!46640 array!46642 (_ BitVec 32) (_ BitVec 32) V!25311 V!25311 (_ BitVec 32) Int) ListLongMap!8999)

(assert (=> b!833736 (= lt!378514 (getCurrentListMapNoExtraKeys!2513 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!833736 (= lt!378513 (getCurrentListMapNoExtraKeys!2513 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!24512 () Bool)

(declare-fun mapRes!24512 () Bool)

(declare-fun tp!47366 () Bool)

(declare-fun e!465128 () Bool)

(assert (=> mapNonEmpty!24512 (= mapRes!24512 (and tp!47366 e!465128))))

(declare-fun mapRest!24512 () (Array (_ BitVec 32) ValueCell!7201))

(declare-fun mapKey!24512 () (_ BitVec 32))

(declare-fun mapValue!24512 () ValueCell!7201)

(assert (=> mapNonEmpty!24512 (= (arr!22355 _values!788) (store mapRest!24512 mapKey!24512 mapValue!24512))))

(declare-fun e!465123 () Bool)

(declare-fun lt!378507 () tuple2!10176)

(declare-fun lt!378503 () tuple2!10176)

(declare-fun b!833737 () Bool)

(declare-fun lt!378504 () ListLongMap!8999)

(declare-fun +!1993 (ListLongMap!8999 tuple2!10176) ListLongMap!8999)

(assert (=> b!833737 (= e!465123 (= lt!378504 (+!1993 (+!1993 lt!378514 lt!378503) lt!378507)))))

(declare-fun b!833738 () Bool)

(declare-fun res!566924 () Bool)

(assert (=> b!833738 (=> (not res!566924) (not e!465127))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46640 (_ BitVec 32)) Bool)

(assert (=> b!833738 (= res!566924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!833739 () Bool)

(declare-fun e!465129 () Bool)

(declare-fun e!465126 () Bool)

(assert (=> b!833739 (= e!465129 (and e!465126 mapRes!24512))))

(declare-fun condMapEmpty!24512 () Bool)

(declare-fun mapDefault!24512 () ValueCell!7201)

