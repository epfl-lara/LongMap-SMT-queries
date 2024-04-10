; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70712 () Bool)

(assert start!70712)

(declare-fun b_free!12985 () Bool)

(declare-fun b_next!12985 () Bool)

(assert (=> start!70712 (= b_free!12985 (not b_next!12985))))

(declare-fun tp!45697 () Bool)

(declare-fun b_and!21847 () Bool)

(assert (=> start!70712 (= tp!45697 b_and!21847)))

(declare-fun b!821337 () Bool)

(declare-fun e!456449 () Bool)

(assert (=> b!821337 (= e!456449 true)))

(declare-datatypes ((V!24595 0))(
  ( (V!24596 (val!7395 Int)) )
))
(declare-fun zeroValueBefore!34 () V!24595)

(declare-datatypes ((array!45586 0))(
  ( (array!45587 (arr!21844 (Array (_ BitVec 32) (_ BitVec 64))) (size!22265 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45586)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!24595)

(declare-datatypes ((ValueCell!6932 0))(
  ( (ValueCellFull!6932 (v!9826 V!24595)) (EmptyCell!6932) )
))
(declare-datatypes ((array!45588 0))(
  ( (array!45589 (arr!21845 (Array (_ BitVec 32) ValueCell!6932)) (size!22266 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45588)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-datatypes ((tuple2!9756 0))(
  ( (tuple2!9757 (_1!4889 (_ BitVec 64)) (_2!4889 V!24595)) )
))
(declare-datatypes ((List!15574 0))(
  ( (Nil!15571) (Cons!15570 (h!16699 tuple2!9756) (t!21909 List!15574)) )
))
(declare-datatypes ((ListLongMap!8579 0))(
  ( (ListLongMap!8580 (toList!4305 List!15574)) )
))
(declare-fun lt!369173 () ListLongMap!8579)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2474 (array!45586 array!45588 (_ BitVec 32) (_ BitVec 32) V!24595 V!24595 (_ BitVec 32) Int) ListLongMap!8579)

(assert (=> b!821337 (= lt!369173 (getCurrentListMap!2474 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821338 () Bool)

(declare-fun e!456448 () Bool)

(assert (=> b!821338 (= e!456448 (not e!456449))))

(declare-fun res!560297 () Bool)

(assert (=> b!821338 (=> res!560297 e!456449)))

(assert (=> b!821338 (= res!560297 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!369171 () ListLongMap!8579)

(declare-fun lt!369170 () ListLongMap!8579)

(assert (=> b!821338 (= lt!369171 lt!369170)))

(declare-fun zeroValueAfter!34 () V!24595)

(declare-datatypes ((Unit!28087 0))(
  ( (Unit!28088) )
))
(declare-fun lt!369172 () Unit!28087)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!441 (array!45586 array!45588 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24595 V!24595 V!24595 V!24595 (_ BitVec 32) Int) Unit!28087)

(assert (=> b!821338 (= lt!369172 (lemmaNoChangeToArrayThenSameMapNoExtras!441 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2331 (array!45586 array!45588 (_ BitVec 32) (_ BitVec 32) V!24595 V!24595 (_ BitVec 32) Int) ListLongMap!8579)

(assert (=> b!821338 (= lt!369170 (getCurrentListMapNoExtraKeys!2331 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821338 (= lt!369171 (getCurrentListMapNoExtraKeys!2331 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821339 () Bool)

(declare-fun res!560293 () Bool)

(assert (=> b!821339 (=> (not res!560293) (not e!456448))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45586 (_ BitVec 32)) Bool)

(assert (=> b!821339 (= res!560293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!821340 () Bool)

(declare-fun e!456447 () Bool)

(declare-fun e!456450 () Bool)

(declare-fun mapRes!23650 () Bool)

(assert (=> b!821340 (= e!456447 (and e!456450 mapRes!23650))))

(declare-fun condMapEmpty!23650 () Bool)

(declare-fun mapDefault!23650 () ValueCell!6932)

