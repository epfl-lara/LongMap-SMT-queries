; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71680 () Bool)

(assert start!71680)

(declare-fun b_free!13513 () Bool)

(declare-fun b_next!13513 () Bool)

(assert (=> start!71680 (= b_free!13513 (not b_next!13513))))

(declare-fun tp!47336 () Bool)

(declare-fun b_and!22599 () Bool)

(assert (=> start!71680 (= tp!47336 b_and!22599)))

(declare-fun b!833585 () Bool)

(declare-fun e!465009 () Bool)

(declare-fun e!465005 () Bool)

(assert (=> b!833585 (= e!465009 (not e!465005))))

(declare-fun res!566817 () Bool)

(assert (=> b!833585 (=> res!566817 e!465005)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!833585 (= res!566817 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!25299 0))(
  ( (V!25300 (val!7659 Int)) )
))
(declare-datatypes ((tuple2!10166 0))(
  ( (tuple2!10167 (_1!5094 (_ BitVec 64)) (_2!5094 V!25299)) )
))
(declare-datatypes ((List!15958 0))(
  ( (Nil!15955) (Cons!15954 (h!17085 tuple2!10166) (t!22329 List!15958)) )
))
(declare-datatypes ((ListLongMap!8989 0))(
  ( (ListLongMap!8990 (toList!4510 List!15958)) )
))
(declare-fun lt!378309 () ListLongMap!8989)

(declare-fun lt!378312 () ListLongMap!8989)

(assert (=> b!833585 (= lt!378309 lt!378312)))

(declare-fun zeroValueBefore!34 () V!25299)

(declare-datatypes ((array!46620 0))(
  ( (array!46621 (arr!22344 (Array (_ BitVec 32) (_ BitVec 64))) (size!22765 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46620)

(declare-fun zeroValueAfter!34 () V!25299)

(declare-fun minValue!754 () V!25299)

(declare-datatypes ((ValueCell!7196 0))(
  ( (ValueCellFull!7196 (v!10107 V!25299)) (EmptyCell!7196) )
))
(declare-datatypes ((array!46622 0))(
  ( (array!46623 (arr!22345 (Array (_ BitVec 32) ValueCell!7196)) (size!22766 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46622)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28563 0))(
  ( (Unit!28564) )
))
(declare-fun lt!378313 () Unit!28563)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!597 (array!46620 array!46622 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25299 V!25299 V!25299 V!25299 (_ BitVec 32) Int) Unit!28563)

(assert (=> b!833585 (= lt!378313 (lemmaNoChangeToArrayThenSameMapNoExtras!597 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2509 (array!46620 array!46622 (_ BitVec 32) (_ BitVec 32) V!25299 V!25299 (_ BitVec 32) Int) ListLongMap!8989)

(assert (=> b!833585 (= lt!378312 (getCurrentListMapNoExtraKeys!2509 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!833585 (= lt!378309 (getCurrentListMapNoExtraKeys!2509 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!24497 () Bool)

(declare-fun mapRes!24497 () Bool)

(declare-fun tp!47335 () Bool)

(declare-fun e!465008 () Bool)

(assert (=> mapNonEmpty!24497 (= mapRes!24497 (and tp!47335 e!465008))))

(declare-fun mapRest!24497 () (Array (_ BitVec 32) ValueCell!7196))

(declare-fun mapKey!24497 () (_ BitVec 32))

(declare-fun mapValue!24497 () ValueCell!7196)

(assert (=> mapNonEmpty!24497 (= (arr!22345 _values!788) (store mapRest!24497 mapKey!24497 mapValue!24497))))

(declare-fun res!566818 () Bool)

(assert (=> start!71680 (=> (not res!566818) (not e!465009))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71680 (= res!566818 (validMask!0 mask!1312))))

(assert (=> start!71680 e!465009))

(declare-fun tp_is_empty!15223 () Bool)

(assert (=> start!71680 tp_is_empty!15223))

(declare-fun array_inv!17797 (array!46620) Bool)

(assert (=> start!71680 (array_inv!17797 _keys!976)))

(assert (=> start!71680 true))

(declare-fun e!465003 () Bool)

(declare-fun array_inv!17798 (array!46622) Bool)

(assert (=> start!71680 (and (array_inv!17798 _values!788) e!465003)))

(assert (=> start!71680 tp!47336))

(declare-fun b!833586 () Bool)

(declare-fun res!566816 () Bool)

(assert (=> b!833586 (=> (not res!566816) (not e!465009))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46620 (_ BitVec 32)) Bool)

(assert (=> b!833586 (= res!566816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!833587 () Bool)

(declare-fun e!465002 () Bool)

(assert (=> b!833587 (= e!465002 tp_is_empty!15223)))

(declare-fun b!833588 () Bool)

(assert (=> b!833588 (= e!465008 tp_is_empty!15223)))

(declare-fun mapIsEmpty!24497 () Bool)

(assert (=> mapIsEmpty!24497 mapRes!24497))

(declare-fun b!833589 () Bool)

(declare-fun res!566813 () Bool)

(assert (=> b!833589 (=> (not res!566813) (not e!465009))))

(declare-datatypes ((List!15959 0))(
  ( (Nil!15956) (Cons!15955 (h!17086 (_ BitVec 64)) (t!22330 List!15959)) )
))
(declare-fun arrayNoDuplicates!0 (array!46620 (_ BitVec 32) List!15959) Bool)

(assert (=> b!833589 (= res!566813 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15956))))

(declare-fun lt!378310 () ListLongMap!8989)

(declare-fun lt!378307 () tuple2!10166)

(declare-fun e!465006 () Bool)

(declare-fun b!833590 () Bool)

(declare-fun +!1988 (ListLongMap!8989 tuple2!10166) ListLongMap!8989)

(assert (=> b!833590 (= e!465006 (= lt!378310 (+!1988 (+!1988 lt!378312 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!378307)))))

(declare-fun b!833591 () Bool)

(assert (=> b!833591 (= e!465003 (and e!465002 mapRes!24497))))

(declare-fun condMapEmpty!24497 () Bool)

(declare-fun mapDefault!24497 () ValueCell!7196)

