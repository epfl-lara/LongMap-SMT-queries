; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71674 () Bool)

(assert start!71674)

(declare-fun b_free!13507 () Bool)

(declare-fun b_next!13507 () Bool)

(assert (=> start!71674 (= b_free!13507 (not b_next!13507))))

(declare-fun tp!47317 () Bool)

(declare-fun b_and!22593 () Bool)

(assert (=> start!71674 (= tp!47317 b_and!22593)))

(declare-datatypes ((V!25291 0))(
  ( (V!25292 (val!7656 Int)) )
))
(declare-fun zeroValueAfter!34 () V!25291)

(declare-datatypes ((tuple2!10160 0))(
  ( (tuple2!10161 (_1!5091 (_ BitVec 64)) (_2!5091 V!25291)) )
))
(declare-fun lt!378200 () tuple2!10160)

(declare-datatypes ((List!15953 0))(
  ( (Nil!15950) (Cons!15949 (h!17080 tuple2!10160) (t!22324 List!15953)) )
))
(declare-datatypes ((ListLongMap!8983 0))(
  ( (ListLongMap!8984 (toList!4507 List!15953)) )
))
(declare-fun lt!378202 () ListLongMap!8983)

(declare-fun b!833495 () Bool)

(declare-fun e!464931 () Bool)

(declare-fun lt!378199 () ListLongMap!8983)

(declare-fun +!1985 (ListLongMap!8983 tuple2!10160) ListLongMap!8983)

(assert (=> b!833495 (= e!464931 (= lt!378199 (+!1985 (+!1985 lt!378202 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!378200)))))

(declare-fun mapIsEmpty!24488 () Bool)

(declare-fun mapRes!24488 () Bool)

(assert (=> mapIsEmpty!24488 mapRes!24488))

(declare-fun res!566755 () Bool)

(declare-fun e!464934 () Bool)

(assert (=> start!71674 (=> (not res!566755) (not e!464934))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71674 (= res!566755 (validMask!0 mask!1312))))

(assert (=> start!71674 e!464934))

(declare-fun tp_is_empty!15217 () Bool)

(assert (=> start!71674 tp_is_empty!15217))

(declare-datatypes ((array!46608 0))(
  ( (array!46609 (arr!22338 (Array (_ BitVec 32) (_ BitVec 64))) (size!22759 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46608)

(declare-fun array_inv!17791 (array!46608) Bool)

(assert (=> start!71674 (array_inv!17791 _keys!976)))

(assert (=> start!71674 true))

(declare-datatypes ((ValueCell!7193 0))(
  ( (ValueCellFull!7193 (v!10104 V!25291)) (EmptyCell!7193) )
))
(declare-datatypes ((array!46610 0))(
  ( (array!46611 (arr!22339 (Array (_ BitVec 32) ValueCell!7193)) (size!22760 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46610)

(declare-fun e!464935 () Bool)

(declare-fun array_inv!17792 (array!46610) Bool)

(assert (=> start!71674 (and (array_inv!17792 _values!788) e!464935)))

(assert (=> start!71674 tp!47317))

(declare-fun b!833496 () Bool)

(declare-fun e!464932 () Bool)

(assert (=> b!833496 (= e!464932 tp_is_empty!15217)))

(declare-fun b!833497 () Bool)

(declare-fun res!566756 () Bool)

(assert (=> b!833497 (=> (not res!566756) (not e!464934))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!833497 (= res!566756 (and (= (size!22760 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22759 _keys!976) (size!22760 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!833498 () Bool)

(declare-fun e!464937 () Bool)

(assert (=> b!833498 (= e!464934 (not e!464937))))

(declare-fun res!566754 () Bool)

(assert (=> b!833498 (=> res!566754 e!464937)))

(assert (=> b!833498 (= res!566754 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!378190 () ListLongMap!8983)

(assert (=> b!833498 (= lt!378190 lt!378202)))

(declare-fun zeroValueBefore!34 () V!25291)

(declare-datatypes ((Unit!28557 0))(
  ( (Unit!28558) )
))
(declare-fun lt!378194 () Unit!28557)

(declare-fun minValue!754 () V!25291)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!594 (array!46608 array!46610 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25291 V!25291 V!25291 V!25291 (_ BitVec 32) Int) Unit!28557)

(assert (=> b!833498 (= lt!378194 (lemmaNoChangeToArrayThenSameMapNoExtras!594 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2506 (array!46608 array!46610 (_ BitVec 32) (_ BitVec 32) V!25291 V!25291 (_ BitVec 32) Int) ListLongMap!8983)

(assert (=> b!833498 (= lt!378202 (getCurrentListMapNoExtraKeys!2506 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!833498 (= lt!378190 (getCurrentListMapNoExtraKeys!2506 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!833499 () Bool)

(declare-fun e!464933 () Bool)

(assert (=> b!833499 (= e!464933 tp_is_empty!15217)))

(declare-fun b!833500 () Bool)

(assert (=> b!833500 (= e!464935 (and e!464932 mapRes!24488))))

(declare-fun condMapEmpty!24488 () Bool)

(declare-fun mapDefault!24488 () ValueCell!7193)

