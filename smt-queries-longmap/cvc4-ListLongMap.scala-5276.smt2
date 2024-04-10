; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70810 () Bool)

(assert start!70810)

(declare-fun b_free!13067 () Bool)

(declare-fun b_next!13067 () Bool)

(assert (=> start!70810 (= b_free!13067 (not b_next!13067))))

(declare-fun tp!45946 () Bool)

(declare-fun b_and!21939 () Bool)

(assert (=> start!70810 (= tp!45946 b_and!21939)))

(declare-fun res!560979 () Bool)

(declare-fun e!457290 () Bool)

(assert (=> start!70810 (=> (not res!560979) (not e!457290))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70810 (= res!560979 (validMask!0 mask!1312))))

(assert (=> start!70810 e!457290))

(declare-fun tp_is_empty!14777 () Bool)

(assert (=> start!70810 tp_is_empty!14777))

(declare-datatypes ((array!45746 0))(
  ( (array!45747 (arr!21923 (Array (_ BitVec 32) (_ BitVec 64))) (size!22344 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45746)

(declare-fun array_inv!17511 (array!45746) Bool)

(assert (=> start!70810 (array_inv!17511 _keys!976)))

(assert (=> start!70810 true))

(declare-datatypes ((V!24703 0))(
  ( (V!24704 (val!7436 Int)) )
))
(declare-datatypes ((ValueCell!6973 0))(
  ( (ValueCellFull!6973 (v!9867 V!24703)) (EmptyCell!6973) )
))
(declare-datatypes ((array!45748 0))(
  ( (array!45749 (arr!21924 (Array (_ BitVec 32) ValueCell!6973)) (size!22345 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45748)

(declare-fun e!457292 () Bool)

(declare-fun array_inv!17512 (array!45748) Bool)

(assert (=> start!70810 (and (array_inv!17512 _values!788) e!457292)))

(assert (=> start!70810 tp!45946))

(declare-fun b!822478 () Bool)

(declare-fun res!560976 () Bool)

(assert (=> b!822478 (=> (not res!560976) (not e!457290))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45746 (_ BitVec 32)) Bool)

(assert (=> b!822478 (= res!560976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!822479 () Bool)

(declare-fun res!560978 () Bool)

(assert (=> b!822479 (=> (not res!560978) (not e!457290))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!822479 (= res!560978 (and (= (size!22345 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22344 _keys!976) (size!22345 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!822480 () Bool)

(declare-fun e!457288 () Bool)

(assert (=> b!822480 (= e!457288 tp_is_empty!14777)))

(declare-fun b!822481 () Bool)

(declare-fun e!457291 () Bool)

(assert (=> b!822481 (= e!457290 (not e!457291))))

(declare-fun res!560975 () Bool)

(assert (=> b!822481 (=> res!560975 e!457291)))

(assert (=> b!822481 (= res!560975 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9822 0))(
  ( (tuple2!9823 (_1!4922 (_ BitVec 64)) (_2!4922 V!24703)) )
))
(declare-datatypes ((List!15637 0))(
  ( (Nil!15634) (Cons!15633 (h!16762 tuple2!9822) (t!21974 List!15637)) )
))
(declare-datatypes ((ListLongMap!8645 0))(
  ( (ListLongMap!8646 (toList!4338 List!15637)) )
))
(declare-fun lt!370162 () ListLongMap!8645)

(declare-fun lt!370167 () ListLongMap!8645)

(assert (=> b!822481 (= lt!370162 lt!370167)))

(declare-datatypes ((Unit!28140 0))(
  ( (Unit!28141) )
))
(declare-fun lt!370165 () Unit!28140)

(declare-fun zeroValueBefore!34 () V!24703)

(declare-fun zeroValueAfter!34 () V!24703)

(declare-fun minValue!754 () V!24703)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!467 (array!45746 array!45748 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24703 V!24703 V!24703 V!24703 (_ BitVec 32) Int) Unit!28140)

(assert (=> b!822481 (= lt!370165 (lemmaNoChangeToArrayThenSameMapNoExtras!467 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2357 (array!45746 array!45748 (_ BitVec 32) (_ BitVec 32) V!24703 V!24703 (_ BitVec 32) Int) ListLongMap!8645)

(assert (=> b!822481 (= lt!370167 (getCurrentListMapNoExtraKeys!2357 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822481 (= lt!370162 (getCurrentListMapNoExtraKeys!2357 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822482 () Bool)

(assert (=> b!822482 (= e!457291 true)))

(declare-fun lt!370163 () ListLongMap!8645)

(declare-fun lt!370161 () ListLongMap!8645)

(declare-fun lt!370158 () tuple2!9822)

(declare-fun +!1888 (ListLongMap!8645 tuple2!9822) ListLongMap!8645)

(assert (=> b!822482 (= lt!370163 (+!1888 lt!370161 lt!370158))))

(declare-fun lt!370166 () Unit!28140)

(declare-fun addCommutativeForDiffKeys!451 (ListLongMap!8645 (_ BitVec 64) V!24703 (_ BitVec 64) V!24703) Unit!28140)

(assert (=> b!822482 (= lt!370166 (addCommutativeForDiffKeys!451 lt!370162 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!370160 () ListLongMap!8645)

(assert (=> b!822482 (= lt!370160 lt!370163)))

(declare-fun lt!370164 () tuple2!9822)

(assert (=> b!822482 (= lt!370163 (+!1888 (+!1888 lt!370162 lt!370158) lt!370164))))

(assert (=> b!822482 (= lt!370158 (tuple2!9823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!370159 () ListLongMap!8645)

(assert (=> b!822482 (= lt!370159 lt!370161)))

(assert (=> b!822482 (= lt!370161 (+!1888 lt!370162 lt!370164))))

(assert (=> b!822482 (= lt!370164 (tuple2!9823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun getCurrentListMap!2502 (array!45746 array!45748 (_ BitVec 32) (_ BitVec 32) V!24703 V!24703 (_ BitVec 32) Int) ListLongMap!8645)

(assert (=> b!822482 (= lt!370160 (getCurrentListMap!2502 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822482 (= lt!370159 (getCurrentListMap!2502 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23776 () Bool)

(declare-fun mapRes!23776 () Bool)

(assert (=> mapIsEmpty!23776 mapRes!23776))

(declare-fun b!822483 () Bool)

(declare-fun e!457289 () Bool)

(assert (=> b!822483 (= e!457292 (and e!457289 mapRes!23776))))

(declare-fun condMapEmpty!23776 () Bool)

(declare-fun mapDefault!23776 () ValueCell!6973)

