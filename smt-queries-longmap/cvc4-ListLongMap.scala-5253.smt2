; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70642 () Bool)

(assert start!70642)

(declare-fun b_free!12929 () Bool)

(declare-fun b_next!12929 () Bool)

(assert (=> start!70642 (= b_free!12929 (not b_next!12929))))

(declare-fun tp!45525 () Bool)

(declare-fun b_and!21783 () Bool)

(assert (=> start!70642 (= tp!45525 b_and!21783)))

(declare-fun b!820635 () Bool)

(declare-fun res!559898 () Bool)

(declare-fun e!455945 () Bool)

(assert (=> b!820635 (=> (not res!559898) (not e!455945))))

(declare-datatypes ((array!45472 0))(
  ( (array!45473 (arr!21788 (Array (_ BitVec 32) (_ BitVec 64))) (size!22209 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45472)

(declare-datatypes ((List!15526 0))(
  ( (Nil!15523) (Cons!15522 (h!16651 (_ BitVec 64)) (t!21859 List!15526)) )
))
(declare-fun arrayNoDuplicates!0 (array!45472 (_ BitVec 32) List!15526) Bool)

(assert (=> b!820635 (= res!559898 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15523))))

(declare-fun b!820636 () Bool)

(declare-fun res!559899 () Bool)

(assert (=> b!820636 (=> (not res!559899) (not e!455945))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45472 (_ BitVec 32)) Bool)

(assert (=> b!820636 (= res!559899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!820637 () Bool)

(assert (=> b!820637 (= e!455945 (not true))))

(declare-datatypes ((V!24519 0))(
  ( (V!24520 (val!7367 Int)) )
))
(declare-datatypes ((tuple2!9706 0))(
  ( (tuple2!9707 (_1!4864 (_ BitVec 64)) (_2!4864 V!24519)) )
))
(declare-datatypes ((List!15527 0))(
  ( (Nil!15524) (Cons!15523 (h!16652 tuple2!9706) (t!21860 List!15527)) )
))
(declare-datatypes ((ListLongMap!8529 0))(
  ( (ListLongMap!8530 (toList!4280 List!15527)) )
))
(declare-fun lt!368851 () ListLongMap!8529)

(declare-fun lt!368850 () ListLongMap!8529)

(assert (=> b!820637 (= lt!368851 lt!368850)))

(declare-fun zeroValueBefore!34 () V!24519)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24519)

(declare-fun minValue!754 () V!24519)

(declare-datatypes ((ValueCell!6904 0))(
  ( (ValueCellFull!6904 (v!9798 V!24519)) (EmptyCell!6904) )
))
(declare-datatypes ((array!45474 0))(
  ( (array!45475 (arr!21789 (Array (_ BitVec 32) ValueCell!6904)) (size!22210 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45474)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28037 0))(
  ( (Unit!28038) )
))
(declare-fun lt!368849 () Unit!28037)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!416 (array!45472 array!45474 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24519 V!24519 V!24519 V!24519 (_ BitVec 32) Int) Unit!28037)

(assert (=> b!820637 (= lt!368849 (lemmaNoChangeToArrayThenSameMapNoExtras!416 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2306 (array!45472 array!45474 (_ BitVec 32) (_ BitVec 32) V!24519 V!24519 (_ BitVec 32) Int) ListLongMap!8529)

(assert (=> b!820637 (= lt!368850 (getCurrentListMapNoExtraKeys!2306 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820637 (= lt!368851 (getCurrentListMapNoExtraKeys!2306 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23563 () Bool)

(declare-fun mapRes!23563 () Bool)

(declare-fun tp!45526 () Bool)

(declare-fun e!455943 () Bool)

(assert (=> mapNonEmpty!23563 (= mapRes!23563 (and tp!45526 e!455943))))

(declare-fun mapRest!23563 () (Array (_ BitVec 32) ValueCell!6904))

(declare-fun mapKey!23563 () (_ BitVec 32))

(declare-fun mapValue!23563 () ValueCell!6904)

(assert (=> mapNonEmpty!23563 (= (arr!21789 _values!788) (store mapRest!23563 mapKey!23563 mapValue!23563))))

(declare-fun b!820638 () Bool)

(declare-fun tp_is_empty!14639 () Bool)

(assert (=> b!820638 (= e!455943 tp_is_empty!14639)))

(declare-fun res!559900 () Bool)

(assert (=> start!70642 (=> (not res!559900) (not e!455945))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70642 (= res!559900 (validMask!0 mask!1312))))

(assert (=> start!70642 e!455945))

(assert (=> start!70642 tp_is_empty!14639))

(declare-fun array_inv!17413 (array!45472) Bool)

(assert (=> start!70642 (array_inv!17413 _keys!976)))

(assert (=> start!70642 true))

(declare-fun e!455947 () Bool)

(declare-fun array_inv!17414 (array!45474) Bool)

(assert (=> start!70642 (and (array_inv!17414 _values!788) e!455947)))

(assert (=> start!70642 tp!45525))

(declare-fun b!820639 () Bool)

(declare-fun res!559897 () Bool)

(assert (=> b!820639 (=> (not res!559897) (not e!455945))))

(assert (=> b!820639 (= res!559897 (and (= (size!22210 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22209 _keys!976) (size!22210 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!820640 () Bool)

(declare-fun e!455944 () Bool)

(assert (=> b!820640 (= e!455947 (and e!455944 mapRes!23563))))

(declare-fun condMapEmpty!23563 () Bool)

(declare-fun mapDefault!23563 () ValueCell!6904)

