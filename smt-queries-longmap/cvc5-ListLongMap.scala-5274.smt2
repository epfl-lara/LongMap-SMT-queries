; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70794 () Bool)

(assert start!70794)

(declare-fun b_free!13051 () Bool)

(declare-fun b_next!13051 () Bool)

(assert (=> start!70794 (= b_free!13051 (not b_next!13051))))

(declare-fun tp!45898 () Bool)

(declare-fun b_and!21923 () Bool)

(assert (=> start!70794 (= tp!45898 b_and!21923)))

(declare-fun b!822286 () Bool)

(declare-fun res!560859 () Bool)

(declare-fun e!457149 () Bool)

(assert (=> b!822286 (=> (not res!560859) (not e!457149))))

(declare-datatypes ((array!45714 0))(
  ( (array!45715 (arr!21907 (Array (_ BitVec 32) (_ BitVec 64))) (size!22328 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45714)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24683 0))(
  ( (V!24684 (val!7428 Int)) )
))
(declare-datatypes ((ValueCell!6965 0))(
  ( (ValueCellFull!6965 (v!9859 V!24683)) (EmptyCell!6965) )
))
(declare-datatypes ((array!45716 0))(
  ( (array!45717 (arr!21908 (Array (_ BitVec 32) ValueCell!6965)) (size!22329 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45716)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(assert (=> b!822286 (= res!560859 (and (= (size!22329 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22328 _keys!976) (size!22329 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!822287 () Bool)

(declare-fun e!457145 () Bool)

(assert (=> b!822287 (= e!457149 (not e!457145))))

(declare-fun res!560857 () Bool)

(assert (=> b!822287 (=> res!560857 e!457145)))

(assert (=> b!822287 (= res!560857 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9806 0))(
  ( (tuple2!9807 (_1!4914 (_ BitVec 64)) (_2!4914 V!24683)) )
))
(declare-datatypes ((List!15622 0))(
  ( (Nil!15619) (Cons!15618 (h!16747 tuple2!9806) (t!21959 List!15622)) )
))
(declare-datatypes ((ListLongMap!8629 0))(
  ( (ListLongMap!8630 (toList!4330 List!15622)) )
))
(declare-fun lt!369922 () ListLongMap!8629)

(declare-fun lt!369925 () ListLongMap!8629)

(assert (=> b!822287 (= lt!369922 lt!369925)))

(declare-fun zeroValueBefore!34 () V!24683)

(declare-fun zeroValueAfter!34 () V!24683)

(declare-fun minValue!754 () V!24683)

(declare-datatypes ((Unit!28124 0))(
  ( (Unit!28125) )
))
(declare-fun lt!369921 () Unit!28124)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!459 (array!45714 array!45716 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24683 V!24683 V!24683 V!24683 (_ BitVec 32) Int) Unit!28124)

(assert (=> b!822287 (= lt!369921 (lemmaNoChangeToArrayThenSameMapNoExtras!459 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2349 (array!45714 array!45716 (_ BitVec 32) (_ BitVec 32) V!24683 V!24683 (_ BitVec 32) Int) ListLongMap!8629)

(assert (=> b!822287 (= lt!369925 (getCurrentListMapNoExtraKeys!2349 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822287 (= lt!369922 (getCurrentListMapNoExtraKeys!2349 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822288 () Bool)

(assert (=> b!822288 (= e!457145 true)))

(declare-fun lt!369923 () ListLongMap!8629)

(declare-fun lt!369927 () ListLongMap!8629)

(declare-fun lt!369924 () tuple2!9806)

(declare-fun +!1881 (ListLongMap!8629 tuple2!9806) ListLongMap!8629)

(assert (=> b!822288 (= lt!369923 (+!1881 lt!369927 lt!369924))))

(declare-fun lt!369926 () Unit!28124)

(declare-fun addCommutativeForDiffKeys!444 (ListLongMap!8629 (_ BitVec 64) V!24683 (_ BitVec 64) V!24683) Unit!28124)

(assert (=> b!822288 (= lt!369926 (addCommutativeForDiffKeys!444 lt!369922 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!369919 () ListLongMap!8629)

(assert (=> b!822288 (= lt!369919 lt!369923)))

(declare-fun lt!369918 () tuple2!9806)

(assert (=> b!822288 (= lt!369923 (+!1881 (+!1881 lt!369922 lt!369924) lt!369918))))

(assert (=> b!822288 (= lt!369924 (tuple2!9807 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!369920 () ListLongMap!8629)

(assert (=> b!822288 (= lt!369920 lt!369927)))

(assert (=> b!822288 (= lt!369927 (+!1881 lt!369922 lt!369918))))

(assert (=> b!822288 (= lt!369918 (tuple2!9807 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun getCurrentListMap!2495 (array!45714 array!45716 (_ BitVec 32) (_ BitVec 32) V!24683 V!24683 (_ BitVec 32) Int) ListLongMap!8629)

(assert (=> b!822288 (= lt!369919 (getCurrentListMap!2495 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822288 (= lt!369920 (getCurrentListMap!2495 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822289 () Bool)

(declare-fun res!560855 () Bool)

(assert (=> b!822289 (=> (not res!560855) (not e!457149))))

(declare-datatypes ((List!15623 0))(
  ( (Nil!15620) (Cons!15619 (h!16748 (_ BitVec 64)) (t!21960 List!15623)) )
))
(declare-fun arrayNoDuplicates!0 (array!45714 (_ BitVec 32) List!15623) Bool)

(assert (=> b!822289 (= res!560855 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15620))))

(declare-fun res!560858 () Bool)

(assert (=> start!70794 (=> (not res!560858) (not e!457149))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70794 (= res!560858 (validMask!0 mask!1312))))

(assert (=> start!70794 e!457149))

(declare-fun tp_is_empty!14761 () Bool)

(assert (=> start!70794 tp_is_empty!14761))

(declare-fun array_inv!17499 (array!45714) Bool)

(assert (=> start!70794 (array_inv!17499 _keys!976)))

(assert (=> start!70794 true))

(declare-fun e!457147 () Bool)

(declare-fun array_inv!17500 (array!45716) Bool)

(assert (=> start!70794 (and (array_inv!17500 _values!788) e!457147)))

(assert (=> start!70794 tp!45898))

(declare-fun b!822290 () Bool)

(declare-fun e!457144 () Bool)

(assert (=> b!822290 (= e!457144 tp_is_empty!14761)))

(declare-fun mapIsEmpty!23752 () Bool)

(declare-fun mapRes!23752 () Bool)

(assert (=> mapIsEmpty!23752 mapRes!23752))

(declare-fun b!822291 () Bool)

(declare-fun res!560856 () Bool)

(assert (=> b!822291 (=> (not res!560856) (not e!457149))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45714 (_ BitVec 32)) Bool)

(assert (=> b!822291 (= res!560856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!822292 () Bool)

(assert (=> b!822292 (= e!457147 (and e!457144 mapRes!23752))))

(declare-fun condMapEmpty!23752 () Bool)

(declare-fun mapDefault!23752 () ValueCell!6965)

