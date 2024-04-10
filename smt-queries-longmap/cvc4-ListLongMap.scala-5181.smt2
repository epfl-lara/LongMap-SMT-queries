; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70076 () Bool)

(assert start!70076)

(declare-fun b_free!12497 () Bool)

(declare-fun b_next!12497 () Bool)

(assert (=> start!70076 (= b_free!12497 (not b_next!12497))))

(declare-fun tp!44205 () Bool)

(declare-fun b_and!21269 () Bool)

(assert (=> start!70076 (= tp!44205 b_and!21269)))

(declare-fun b!814373 () Bool)

(declare-fun res!556239 () Bool)

(declare-fun e!451411 () Bool)

(assert (=> b!814373 (=> (not res!556239) (not e!451411))))

(declare-datatypes ((array!44618 0))(
  ( (array!44619 (arr!21369 (Array (_ BitVec 32) (_ BitVec 64))) (size!21790 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44618)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44618 (_ BitVec 32)) Bool)

(assert (=> b!814373 (= res!556239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!814374 () Bool)

(declare-fun e!451413 () Bool)

(declare-fun tp_is_empty!14207 () Bool)

(assert (=> b!814374 (= e!451413 tp_is_empty!14207)))

(declare-fun res!556241 () Bool)

(assert (=> start!70076 (=> (not res!556241) (not e!451411))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70076 (= res!556241 (validMask!0 mask!1312))))

(assert (=> start!70076 e!451411))

(assert (=> start!70076 tp_is_empty!14207))

(declare-fun array_inv!17099 (array!44618) Bool)

(assert (=> start!70076 (array_inv!17099 _keys!976)))

(assert (=> start!70076 true))

(declare-datatypes ((V!23943 0))(
  ( (V!23944 (val!7151 Int)) )
))
(declare-datatypes ((ValueCell!6688 0))(
  ( (ValueCellFull!6688 (v!9578 V!23943)) (EmptyCell!6688) )
))
(declare-datatypes ((array!44620 0))(
  ( (array!44621 (arr!21370 (Array (_ BitVec 32) ValueCell!6688)) (size!21791 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44620)

(declare-fun e!451410 () Bool)

(declare-fun array_inv!17100 (array!44620) Bool)

(assert (=> start!70076 (and (array_inv!17100 _values!788) e!451410)))

(assert (=> start!70076 tp!44205))

(declare-fun b!814375 () Bool)

(declare-fun res!556242 () Bool)

(assert (=> b!814375 (=> (not res!556242) (not e!451411))))

(declare-datatypes ((List!15205 0))(
  ( (Nil!15202) (Cons!15201 (h!16330 (_ BitVec 64)) (t!21522 List!15205)) )
))
(declare-fun arrayNoDuplicates!0 (array!44618 (_ BitVec 32) List!15205) Bool)

(assert (=> b!814375 (= res!556242 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15202))))

(declare-fun b!814376 () Bool)

(declare-fun e!451409 () Bool)

(assert (=> b!814376 (= e!451409 tp_is_empty!14207)))

(declare-fun b!814377 () Bool)

(assert (=> b!814377 (= e!451411 (not true))))

(declare-datatypes ((tuple2!9372 0))(
  ( (tuple2!9373 (_1!4697 (_ BitVec 64)) (_2!4697 V!23943)) )
))
(declare-datatypes ((List!15206 0))(
  ( (Nil!15203) (Cons!15202 (h!16331 tuple2!9372) (t!21523 List!15206)) )
))
(declare-datatypes ((ListLongMap!8195 0))(
  ( (ListLongMap!8196 (toList!4113 List!15206)) )
))
(declare-fun lt!364589 () ListLongMap!8195)

(declare-fun lt!364588 () ListLongMap!8195)

(assert (=> b!814377 (= lt!364589 lt!364588)))

(declare-fun zeroValueBefore!34 () V!23943)

(declare-datatypes ((Unit!27724 0))(
  ( (Unit!27725) )
))
(declare-fun lt!364590 () Unit!27724)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!23943)

(declare-fun minValue!754 () V!23943)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!273 (array!44618 array!44620 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!23943 V!23943 V!23943 V!23943 (_ BitVec 32) Int) Unit!27724)

(assert (=> b!814377 (= lt!364590 (lemmaNoChangeToArrayThenSameMapNoExtras!273 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2163 (array!44618 array!44620 (_ BitVec 32) (_ BitVec 32) V!23943 V!23943 (_ BitVec 32) Int) ListLongMap!8195)

(assert (=> b!814377 (= lt!364588 (getCurrentListMapNoExtraKeys!2163 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!814377 (= lt!364589 (getCurrentListMapNoExtraKeys!2163 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!22891 () Bool)

(declare-fun mapRes!22891 () Bool)

(assert (=> mapIsEmpty!22891 mapRes!22891))

(declare-fun b!814378 () Bool)

(assert (=> b!814378 (= e!451410 (and e!451413 mapRes!22891))))

(declare-fun condMapEmpty!22891 () Bool)

(declare-fun mapDefault!22891 () ValueCell!6688)

