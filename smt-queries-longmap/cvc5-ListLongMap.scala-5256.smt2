; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70656 () Bool)

(assert start!70656)

(declare-fun b_free!12943 () Bool)

(declare-fun b_next!12943 () Bool)

(assert (=> start!70656 (= b_free!12943 (not b_next!12943))))

(declare-fun tp!45567 () Bool)

(declare-fun b_and!21797 () Bool)

(assert (=> start!70656 (= tp!45567 b_and!21797)))

(declare-fun b!820782 () Bool)

(declare-fun res!559984 () Bool)

(declare-fun e!456049 () Bool)

(assert (=> b!820782 (=> (not res!559984) (not e!456049))))

(declare-datatypes ((array!45500 0))(
  ( (array!45501 (arr!21802 (Array (_ BitVec 32) (_ BitVec 64))) (size!22223 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45500)

(declare-datatypes ((V!24539 0))(
  ( (V!24540 (val!7374 Int)) )
))
(declare-datatypes ((ValueCell!6911 0))(
  ( (ValueCellFull!6911 (v!9805 V!24539)) (EmptyCell!6911) )
))
(declare-datatypes ((array!45502 0))(
  ( (array!45503 (arr!21803 (Array (_ BitVec 32) ValueCell!6911)) (size!22224 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45502)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!820782 (= res!559984 (and (= (size!22224 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22223 _keys!976) (size!22224 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!23584 () Bool)

(declare-fun mapRes!23584 () Bool)

(assert (=> mapIsEmpty!23584 mapRes!23584))

(declare-fun b!820783 () Bool)

(assert (=> b!820783 (= e!456049 (not true))))

(declare-datatypes ((tuple2!9718 0))(
  ( (tuple2!9719 (_1!4870 (_ BitVec 64)) (_2!4870 V!24539)) )
))
(declare-datatypes ((List!15538 0))(
  ( (Nil!15535) (Cons!15534 (h!16663 tuple2!9718) (t!21871 List!15538)) )
))
(declare-datatypes ((ListLongMap!8541 0))(
  ( (ListLongMap!8542 (toList!4286 List!15538)) )
))
(declare-fun lt!368912 () ListLongMap!8541)

(declare-fun lt!368913 () ListLongMap!8541)

(assert (=> b!820783 (= lt!368912 lt!368913)))

(declare-fun zeroValueBefore!34 () V!24539)

(declare-fun zeroValueAfter!34 () V!24539)

(declare-fun minValue!754 () V!24539)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28049 0))(
  ( (Unit!28050) )
))
(declare-fun lt!368914 () Unit!28049)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!422 (array!45500 array!45502 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24539 V!24539 V!24539 V!24539 (_ BitVec 32) Int) Unit!28049)

(assert (=> b!820783 (= lt!368914 (lemmaNoChangeToArrayThenSameMapNoExtras!422 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2312 (array!45500 array!45502 (_ BitVec 32) (_ BitVec 32) V!24539 V!24539 (_ BitVec 32) Int) ListLongMap!8541)

(assert (=> b!820783 (= lt!368913 (getCurrentListMapNoExtraKeys!2312 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820783 (= lt!368912 (getCurrentListMapNoExtraKeys!2312 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!820784 () Bool)

(declare-fun res!559981 () Bool)

(assert (=> b!820784 (=> (not res!559981) (not e!456049))))

(declare-datatypes ((List!15539 0))(
  ( (Nil!15536) (Cons!15535 (h!16664 (_ BitVec 64)) (t!21872 List!15539)) )
))
(declare-fun arrayNoDuplicates!0 (array!45500 (_ BitVec 32) List!15539) Bool)

(assert (=> b!820784 (= res!559981 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15536))))

(declare-fun b!820786 () Bool)

(declare-fun res!559983 () Bool)

(assert (=> b!820786 (=> (not res!559983) (not e!456049))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45500 (_ BitVec 32)) Bool)

(assert (=> b!820786 (= res!559983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!820787 () Bool)

(declare-fun e!456048 () Bool)

(declare-fun tp_is_empty!14653 () Bool)

(assert (=> b!820787 (= e!456048 tp_is_empty!14653)))

(declare-fun b!820785 () Bool)

(declare-fun e!456052 () Bool)

(assert (=> b!820785 (= e!456052 (and e!456048 mapRes!23584))))

(declare-fun condMapEmpty!23584 () Bool)

(declare-fun mapDefault!23584 () ValueCell!6911)

