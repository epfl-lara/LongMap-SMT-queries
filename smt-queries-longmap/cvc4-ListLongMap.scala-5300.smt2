; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71008 () Bool)

(assert start!71008)

(declare-fun b_free!13211 () Bool)

(declare-fun b_next!13211 () Bool)

(assert (=> start!71008 (= b_free!13211 (not b_next!13211))))

(declare-fun tp!46386 () Bool)

(declare-fun b_and!22115 () Bool)

(assert (=> start!71008 (= tp!46386 b_and!22115)))

(declare-fun mapIsEmpty!24001 () Bool)

(declare-fun mapRes!24001 () Bool)

(assert (=> mapIsEmpty!24001 mapRes!24001))

(declare-fun res!562163 () Bool)

(declare-fun e!458785 () Bool)

(assert (=> start!71008 (=> (not res!562163) (not e!458785))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71008 (= res!562163 (validMask!0 mask!1312))))

(assert (=> start!71008 e!458785))

(declare-fun tp_is_empty!14921 () Bool)

(assert (=> start!71008 tp_is_empty!14921))

(declare-datatypes ((array!46030 0))(
  ( (array!46031 (arr!22062 (Array (_ BitVec 32) (_ BitVec 64))) (size!22483 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46030)

(declare-fun array_inv!17601 (array!46030) Bool)

(assert (=> start!71008 (array_inv!17601 _keys!976)))

(assert (=> start!71008 true))

(declare-datatypes ((V!24895 0))(
  ( (V!24896 (val!7508 Int)) )
))
(declare-datatypes ((ValueCell!7045 0))(
  ( (ValueCellFull!7045 (v!9941 V!24895)) (EmptyCell!7045) )
))
(declare-datatypes ((array!46032 0))(
  ( (array!46033 (arr!22063 (Array (_ BitVec 32) ValueCell!7045)) (size!22484 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46032)

(declare-fun e!458787 () Bool)

(declare-fun array_inv!17602 (array!46032) Bool)

(assert (=> start!71008 (and (array_inv!17602 _values!788) e!458787)))

(assert (=> start!71008 tp!46386))

(declare-fun b!824572 () Bool)

(declare-fun e!458788 () Bool)

(assert (=> b!824572 (= e!458788 tp_is_empty!14921)))

(declare-fun b!824573 () Bool)

(declare-fun res!562166 () Bool)

(assert (=> b!824573 (=> (not res!562166) (not e!458785))))

(declare-datatypes ((List!15748 0))(
  ( (Nil!15745) (Cons!15744 (h!16873 (_ BitVec 64)) (t!22091 List!15748)) )
))
(declare-fun arrayNoDuplicates!0 (array!46030 (_ BitVec 32) List!15748) Bool)

(assert (=> b!824573 (= res!562166 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15745))))

(declare-fun b!824574 () Bool)

(declare-fun e!458784 () Bool)

(assert (=> b!824574 (= e!458784 true)))

(declare-fun zeroValueBefore!34 () V!24895)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!24895)

(declare-datatypes ((tuple2!9938 0))(
  ( (tuple2!9939 (_1!4980 (_ BitVec 64)) (_2!4980 V!24895)) )
))
(declare-datatypes ((List!15749 0))(
  ( (Nil!15746) (Cons!15745 (h!16874 tuple2!9938) (t!22092 List!15749)) )
))
(declare-datatypes ((ListLongMap!8761 0))(
  ( (ListLongMap!8762 (toList!4396 List!15749)) )
))
(declare-fun lt!371891 () ListLongMap!8761)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2535 (array!46030 array!46032 (_ BitVec 32) (_ BitVec 32) V!24895 V!24895 (_ BitVec 32) Int) ListLongMap!8761)

(assert (=> b!824574 (= lt!371891 (getCurrentListMap!2535 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824575 () Bool)

(declare-fun res!562167 () Bool)

(assert (=> b!824575 (=> (not res!562167) (not e!458785))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!824575 (= res!562167 (and (= (size!22484 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22483 _keys!976) (size!22484 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!24001 () Bool)

(declare-fun tp!46387 () Bool)

(assert (=> mapNonEmpty!24001 (= mapRes!24001 (and tp!46387 e!458788))))

(declare-fun mapRest!24001 () (Array (_ BitVec 32) ValueCell!7045))

(declare-fun mapKey!24001 () (_ BitVec 32))

(declare-fun mapValue!24001 () ValueCell!7045)

(assert (=> mapNonEmpty!24001 (= (arr!22063 _values!788) (store mapRest!24001 mapKey!24001 mapValue!24001))))

(declare-fun b!824576 () Bool)

(declare-fun e!458789 () Bool)

(assert (=> b!824576 (= e!458787 (and e!458789 mapRes!24001))))

(declare-fun condMapEmpty!24001 () Bool)

(declare-fun mapDefault!24001 () ValueCell!7045)

