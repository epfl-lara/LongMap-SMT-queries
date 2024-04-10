; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70996 () Bool)

(assert start!70996)

(declare-fun b_free!13199 () Bool)

(declare-fun b_next!13199 () Bool)

(assert (=> start!70996 (= b_free!13199 (not b_next!13199))))

(declare-fun tp!46350 () Bool)

(declare-fun b_and!22103 () Bool)

(assert (=> start!70996 (= tp!46350 b_and!22103)))

(declare-fun b!824428 () Bool)

(declare-fun e!458676 () Bool)

(declare-fun e!458677 () Bool)

(assert (=> b!824428 (= e!458676 (not e!458677))))

(declare-fun res!562076 () Bool)

(assert (=> b!824428 (=> res!562076 e!458677)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!824428 (= res!562076 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!24879 0))(
  ( (V!24880 (val!7502 Int)) )
))
(declare-datatypes ((tuple2!9928 0))(
  ( (tuple2!9929 (_1!4975 (_ BitVec 64)) (_2!4975 V!24879)) )
))
(declare-datatypes ((List!15740 0))(
  ( (Nil!15737) (Cons!15736 (h!16865 tuple2!9928) (t!22083 List!15740)) )
))
(declare-datatypes ((ListLongMap!8751 0))(
  ( (ListLongMap!8752 (toList!4391 List!15740)) )
))
(declare-fun lt!371822 () ListLongMap!8751)

(declare-fun lt!371820 () ListLongMap!8751)

(assert (=> b!824428 (= lt!371822 lt!371820)))

(declare-fun zeroValueBefore!34 () V!24879)

(declare-datatypes ((array!46006 0))(
  ( (array!46007 (arr!22050 (Array (_ BitVec 32) (_ BitVec 64))) (size!22471 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46006)

(declare-fun zeroValueAfter!34 () V!24879)

(declare-fun minValue!754 () V!24879)

(declare-datatypes ((ValueCell!7039 0))(
  ( (ValueCellFull!7039 (v!9935 V!24879)) (EmptyCell!7039) )
))
(declare-datatypes ((array!46008 0))(
  ( (array!46009 (arr!22051 (Array (_ BitVec 32) ValueCell!7039)) (size!22472 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46008)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28250 0))(
  ( (Unit!28251) )
))
(declare-fun lt!371821 () Unit!28250)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!516 (array!46006 array!46008 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24879 V!24879 V!24879 V!24879 (_ BitVec 32) Int) Unit!28250)

(assert (=> b!824428 (= lt!371821 (lemmaNoChangeToArrayThenSameMapNoExtras!516 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2406 (array!46006 array!46008 (_ BitVec 32) (_ BitVec 32) V!24879 V!24879 (_ BitVec 32) Int) ListLongMap!8751)

(assert (=> b!824428 (= lt!371820 (getCurrentListMapNoExtraKeys!2406 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824428 (= lt!371822 (getCurrentListMapNoExtraKeys!2406 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23983 () Bool)

(declare-fun mapRes!23983 () Bool)

(assert (=> mapIsEmpty!23983 mapRes!23983))

(declare-fun b!824429 () Bool)

(declare-fun res!562074 () Bool)

(assert (=> b!824429 (=> (not res!562074) (not e!458676))))

(declare-datatypes ((List!15741 0))(
  ( (Nil!15738) (Cons!15737 (h!16866 (_ BitVec 64)) (t!22084 List!15741)) )
))
(declare-fun arrayNoDuplicates!0 (array!46006 (_ BitVec 32) List!15741) Bool)

(assert (=> b!824429 (= res!562074 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15738))))

(declare-fun res!562077 () Bool)

(assert (=> start!70996 (=> (not res!562077) (not e!458676))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70996 (= res!562077 (validMask!0 mask!1312))))

(assert (=> start!70996 e!458676))

(declare-fun tp_is_empty!14909 () Bool)

(assert (=> start!70996 tp_is_empty!14909))

(declare-fun array_inv!17593 (array!46006) Bool)

(assert (=> start!70996 (array_inv!17593 _keys!976)))

(assert (=> start!70996 true))

(declare-fun e!458679 () Bool)

(declare-fun array_inv!17594 (array!46008) Bool)

(assert (=> start!70996 (and (array_inv!17594 _values!788) e!458679)))

(assert (=> start!70996 tp!46350))

(declare-fun b!824430 () Bool)

(declare-fun e!458680 () Bool)

(assert (=> b!824430 (= e!458680 tp_is_empty!14909)))

(declare-fun b!824431 () Bool)

(declare-fun res!562073 () Bool)

(assert (=> b!824431 (=> (not res!562073) (not e!458676))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46006 (_ BitVec 32)) Bool)

(assert (=> b!824431 (= res!562073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!824432 () Bool)

(assert (=> b!824432 (= e!458677 true)))

(declare-fun lt!371819 () ListLongMap!8751)

(declare-fun getCurrentListMap!2532 (array!46006 array!46008 (_ BitVec 32) (_ BitVec 32) V!24879 V!24879 (_ BitVec 32) Int) ListLongMap!8751)

(assert (=> b!824432 (= lt!371819 (getCurrentListMap!2532 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824433 () Bool)

(declare-fun res!562075 () Bool)

(assert (=> b!824433 (=> (not res!562075) (not e!458676))))

(assert (=> b!824433 (= res!562075 (and (= (size!22472 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22471 _keys!976) (size!22472 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!824434 () Bool)

(assert (=> b!824434 (= e!458679 (and e!458680 mapRes!23983))))

(declare-fun condMapEmpty!23983 () Bool)

(declare-fun mapDefault!23983 () ValueCell!7039)

