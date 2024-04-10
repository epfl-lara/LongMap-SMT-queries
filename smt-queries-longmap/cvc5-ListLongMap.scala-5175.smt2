; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70036 () Bool)

(assert start!70036)

(declare-fun b_free!12457 () Bool)

(declare-fun b_next!12457 () Bool)

(assert (=> start!70036 (= b_free!12457 (not b_next!12457))))

(declare-fun tp!44085 () Bool)

(declare-fun b_and!21229 () Bool)

(assert (=> start!70036 (= tp!44085 b_and!21229)))

(declare-fun mapIsEmpty!22831 () Bool)

(declare-fun mapRes!22831 () Bool)

(assert (=> mapIsEmpty!22831 mapRes!22831))

(declare-fun b!813953 () Bool)

(declare-fun res!556002 () Bool)

(declare-fun e!451110 () Bool)

(assert (=> b!813953 (=> (not res!556002) (not e!451110))))

(declare-datatypes ((array!44540 0))(
  ( (array!44541 (arr!21330 (Array (_ BitVec 32) (_ BitVec 64))) (size!21751 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44540)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!23891 0))(
  ( (V!23892 (val!7131 Int)) )
))
(declare-datatypes ((ValueCell!6668 0))(
  ( (ValueCellFull!6668 (v!9558 V!23891)) (EmptyCell!6668) )
))
(declare-datatypes ((array!44542 0))(
  ( (array!44543 (arr!21331 (Array (_ BitVec 32) ValueCell!6668)) (size!21752 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44542)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!813953 (= res!556002 (and (= (size!21752 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21751 _keys!976) (size!21752 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!813954 () Bool)

(declare-fun e!451112 () Bool)

(declare-fun tp_is_empty!14167 () Bool)

(assert (=> b!813954 (= e!451112 tp_is_empty!14167)))

(declare-fun b!813955 () Bool)

(assert (=> b!813955 (= e!451110 false)))

(declare-datatypes ((tuple2!9342 0))(
  ( (tuple2!9343 (_1!4682 (_ BitVec 64)) (_2!4682 V!23891)) )
))
(declare-datatypes ((List!15176 0))(
  ( (Nil!15173) (Cons!15172 (h!16301 tuple2!9342) (t!21493 List!15176)) )
))
(declare-datatypes ((ListLongMap!8165 0))(
  ( (ListLongMap!8166 (toList!4098 List!15176)) )
))
(declare-fun lt!364442 () ListLongMap!8165)

(declare-fun zeroValueAfter!34 () V!23891)

(declare-fun minValue!754 () V!23891)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2148 (array!44540 array!44542 (_ BitVec 32) (_ BitVec 32) V!23891 V!23891 (_ BitVec 32) Int) ListLongMap!8165)

(assert (=> b!813955 (= lt!364442 (getCurrentListMapNoExtraKeys!2148 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!23891)

(declare-fun lt!364443 () ListLongMap!8165)

(assert (=> b!813955 (= lt!364443 (getCurrentListMapNoExtraKeys!2148 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!813956 () Bool)

(declare-fun e!451113 () Bool)

(assert (=> b!813956 (= e!451113 tp_is_empty!14167)))

(declare-fun b!813957 () Bool)

(declare-fun e!451111 () Bool)

(assert (=> b!813957 (= e!451111 (and e!451112 mapRes!22831))))

(declare-fun condMapEmpty!22831 () Bool)

(declare-fun mapDefault!22831 () ValueCell!6668)

