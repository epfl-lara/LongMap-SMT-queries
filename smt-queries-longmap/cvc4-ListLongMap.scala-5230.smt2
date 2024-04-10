; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70448 () Bool)

(assert start!70448)

(declare-fun b_free!12791 () Bool)

(declare-fun b_next!12791 () Bool)

(assert (=> start!70448 (= b_free!12791 (not b_next!12791))))

(declare-fun tp!45103 () Bool)

(declare-fun b_and!21611 () Bool)

(assert (=> start!70448 (= tp!45103 b_and!21611)))

(declare-fun b!818307 () Bool)

(declare-fun res!558485 () Bool)

(declare-fun e!454224 () Bool)

(assert (=> b!818307 (=> (not res!558485) (not e!454224))))

(declare-datatypes ((array!45202 0))(
  ( (array!45203 (arr!21656 (Array (_ BitVec 32) (_ BitVec 64))) (size!22077 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45202)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45202 (_ BitVec 32)) Bool)

(assert (=> b!818307 (= res!558485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!818308 () Bool)

(declare-fun e!454228 () Bool)

(declare-fun tp_is_empty!14501 () Bool)

(assert (=> b!818308 (= e!454228 tp_is_empty!14501)))

(declare-fun mapIsEmpty!23347 () Bool)

(declare-fun mapRes!23347 () Bool)

(assert (=> mapIsEmpty!23347 mapRes!23347))

(declare-fun b!818309 () Bool)

(declare-fun e!454225 () Bool)

(assert (=> b!818309 (= e!454224 (not e!454225))))

(declare-fun res!558487 () Bool)

(assert (=> b!818309 (=> res!558487 e!454225)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!818309 (= res!558487 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!24335 0))(
  ( (V!24336 (val!7298 Int)) )
))
(declare-datatypes ((tuple2!9594 0))(
  ( (tuple2!9595 (_1!4808 (_ BitVec 64)) (_2!4808 V!24335)) )
))
(declare-datatypes ((List!15425 0))(
  ( (Nil!15422) (Cons!15421 (h!16550 tuple2!9594) (t!21752 List!15425)) )
))
(declare-datatypes ((ListLongMap!8417 0))(
  ( (ListLongMap!8418 (toList!4224 List!15425)) )
))
(declare-fun lt!366661 () ListLongMap!8417)

(declare-fun lt!366662 () ListLongMap!8417)

(assert (=> b!818309 (= lt!366661 lt!366662)))

(declare-fun zeroValueBefore!34 () V!24335)

(declare-fun zeroValueAfter!34 () V!24335)

(declare-fun minValue!754 () V!24335)

(declare-datatypes ((ValueCell!6835 0))(
  ( (ValueCellFull!6835 (v!9727 V!24335)) (EmptyCell!6835) )
))
(declare-datatypes ((array!45204 0))(
  ( (array!45205 (arr!21657 (Array (_ BitVec 32) ValueCell!6835)) (size!22078 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45204)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27930 0))(
  ( (Unit!27931) )
))
(declare-fun lt!366664 () Unit!27930)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!374 (array!45202 array!45204 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24335 V!24335 V!24335 V!24335 (_ BitVec 32) Int) Unit!27930)

(assert (=> b!818309 (= lt!366664 (lemmaNoChangeToArrayThenSameMapNoExtras!374 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2264 (array!45202 array!45204 (_ BitVec 32) (_ BitVec 32) V!24335 V!24335 (_ BitVec 32) Int) ListLongMap!8417)

(assert (=> b!818309 (= lt!366662 (getCurrentListMapNoExtraKeys!2264 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818309 (= lt!366661 (getCurrentListMapNoExtraKeys!2264 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818310 () Bool)

(declare-fun e!454227 () Bool)

(assert (=> b!818310 (= e!454227 tp_is_empty!14501)))

(declare-fun res!558486 () Bool)

(assert (=> start!70448 (=> (not res!558486) (not e!454224))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70448 (= res!558486 (validMask!0 mask!1312))))

(assert (=> start!70448 e!454224))

(assert (=> start!70448 tp_is_empty!14501))

(declare-fun array_inv!17321 (array!45202) Bool)

(assert (=> start!70448 (array_inv!17321 _keys!976)))

(assert (=> start!70448 true))

(declare-fun e!454226 () Bool)

(declare-fun array_inv!17322 (array!45204) Bool)

(assert (=> start!70448 (and (array_inv!17322 _values!788) e!454226)))

(assert (=> start!70448 tp!45103))

(declare-fun b!818311 () Bool)

(declare-fun res!558484 () Bool)

(assert (=> b!818311 (=> (not res!558484) (not e!454224))))

(declare-datatypes ((List!15426 0))(
  ( (Nil!15423) (Cons!15422 (h!16551 (_ BitVec 64)) (t!21753 List!15426)) )
))
(declare-fun arrayNoDuplicates!0 (array!45202 (_ BitVec 32) List!15426) Bool)

(assert (=> b!818311 (= res!558484 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15423))))

(declare-fun b!818312 () Bool)

(assert (=> b!818312 (= e!454226 (and e!454228 mapRes!23347))))

(declare-fun condMapEmpty!23347 () Bool)

(declare-fun mapDefault!23347 () ValueCell!6835)

