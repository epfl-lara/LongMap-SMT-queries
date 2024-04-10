; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70740 () Bool)

(assert start!70740)

(declare-fun b_free!13013 () Bool)

(declare-fun b_next!13013 () Bool)

(assert (=> start!70740 (= b_free!13013 (not b_next!13013))))

(declare-fun tp!45781 () Bool)

(declare-fun b_and!21875 () Bool)

(assert (=> start!70740 (= tp!45781 b_and!21875)))

(declare-fun b!821673 () Bool)

(declare-fun res!560503 () Bool)

(declare-fun e!456704 () Bool)

(assert (=> b!821673 (=> (not res!560503) (not e!456704))))

(declare-datatypes ((array!45642 0))(
  ( (array!45643 (arr!21872 (Array (_ BitVec 32) (_ BitVec 64))) (size!22293 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45642)

(declare-datatypes ((List!15594 0))(
  ( (Nil!15591) (Cons!15590 (h!16719 (_ BitVec 64)) (t!21929 List!15594)) )
))
(declare-fun arrayNoDuplicates!0 (array!45642 (_ BitVec 32) List!15594) Bool)

(assert (=> b!821673 (= res!560503 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15591))))

(declare-fun b!821674 () Bool)

(declare-fun e!456702 () Bool)

(assert (=> b!821674 (= e!456704 (not e!456702))))

(declare-fun res!560504 () Bool)

(assert (=> b!821674 (=> res!560504 e!456702)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!821674 (= res!560504 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!24631 0))(
  ( (V!24632 (val!7409 Int)) )
))
(declare-datatypes ((tuple2!9778 0))(
  ( (tuple2!9779 (_1!4900 (_ BitVec 64)) (_2!4900 V!24631)) )
))
(declare-datatypes ((List!15595 0))(
  ( (Nil!15592) (Cons!15591 (h!16720 tuple2!9778) (t!21930 List!15595)) )
))
(declare-datatypes ((ListLongMap!8601 0))(
  ( (ListLongMap!8602 (toList!4316 List!15595)) )
))
(declare-fun lt!369340 () ListLongMap!8601)

(declare-fun lt!369339 () ListLongMap!8601)

(assert (=> b!821674 (= lt!369340 lt!369339)))

(declare-fun zeroValueBefore!34 () V!24631)

(declare-datatypes ((Unit!28099 0))(
  ( (Unit!28100) )
))
(declare-fun lt!369338 () Unit!28099)

(declare-fun zeroValueAfter!34 () V!24631)

(declare-fun minValue!754 () V!24631)

(declare-datatypes ((ValueCell!6946 0))(
  ( (ValueCellFull!6946 (v!9840 V!24631)) (EmptyCell!6946) )
))
(declare-datatypes ((array!45644 0))(
  ( (array!45645 (arr!21873 (Array (_ BitVec 32) ValueCell!6946)) (size!22294 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45644)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!447 (array!45642 array!45644 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24631 V!24631 V!24631 V!24631 (_ BitVec 32) Int) Unit!28099)

(assert (=> b!821674 (= lt!369338 (lemmaNoChangeToArrayThenSameMapNoExtras!447 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2337 (array!45642 array!45644 (_ BitVec 32) (_ BitVec 32) V!24631 V!24631 (_ BitVec 32) Int) ListLongMap!8601)

(assert (=> b!821674 (= lt!369339 (getCurrentListMapNoExtraKeys!2337 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821674 (= lt!369340 (getCurrentListMapNoExtraKeys!2337 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821675 () Bool)

(declare-fun e!456699 () Bool)

(declare-fun tp_is_empty!14723 () Bool)

(assert (=> b!821675 (= e!456699 tp_is_empty!14723)))

(declare-fun b!821677 () Bool)

(declare-fun res!560506 () Bool)

(assert (=> b!821677 (=> (not res!560506) (not e!456704))))

(assert (=> b!821677 (= res!560506 (and (= (size!22294 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22293 _keys!976) (size!22294 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!821678 () Bool)

(declare-fun e!456700 () Bool)

(declare-fun e!456703 () Bool)

(declare-fun mapRes!23692 () Bool)

(assert (=> b!821678 (= e!456700 (and e!456703 mapRes!23692))))

(declare-fun condMapEmpty!23692 () Bool)

(declare-fun mapDefault!23692 () ValueCell!6946)

