; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70866 () Bool)

(assert start!70866)

(declare-fun b_free!13103 () Bool)

(declare-fun b_next!13103 () Bool)

(assert (=> start!70866 (= b_free!13103 (not b_next!13103))))

(declare-fun tp!46057 () Bool)

(declare-fun b_and!21987 () Bool)

(assert (=> start!70866 (= tp!46057 b_and!21987)))

(declare-fun b!823091 () Bool)

(declare-fun e!457726 () Bool)

(assert (=> b!823091 (= e!457726 true)))

(declare-datatypes ((V!24751 0))(
  ( (V!24752 (val!7454 Int)) )
))
(declare-datatypes ((tuple2!9854 0))(
  ( (tuple2!9855 (_1!4938 (_ BitVec 64)) (_2!4938 V!24751)) )
))
(declare-datatypes ((List!15667 0))(
  ( (Nil!15664) (Cons!15663 (h!16792 tuple2!9854) (t!22006 List!15667)) )
))
(declare-datatypes ((ListLongMap!8677 0))(
  ( (ListLongMap!8678 (toList!4354 List!15667)) )
))
(declare-fun lt!370854 () ListLongMap!8677)

(declare-fun lt!370857 () ListLongMap!8677)

(declare-fun lt!370856 () tuple2!9854)

(declare-fun +!1903 (ListLongMap!8677 tuple2!9854) ListLongMap!8677)

(assert (=> b!823091 (= lt!370854 (+!1903 lt!370857 lt!370856))))

(declare-datatypes ((Unit!28174 0))(
  ( (Unit!28175) )
))
(declare-fun lt!370853 () Unit!28174)

(declare-fun lt!370859 () ListLongMap!8677)

(declare-fun zeroValueAfter!34 () V!24751)

(declare-fun minValue!754 () V!24751)

(declare-fun addCommutativeForDiffKeys!466 (ListLongMap!8677 (_ BitVec 64) V!24751 (_ BitVec 64) V!24751) Unit!28174)

(assert (=> b!823091 (= lt!370853 (addCommutativeForDiffKeys!466 lt!370859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!370860 () ListLongMap!8677)

(assert (=> b!823091 (= lt!370860 lt!370854)))

(declare-fun lt!370858 () tuple2!9854)

(assert (=> b!823091 (= lt!370854 (+!1903 (+!1903 lt!370859 lt!370856) lt!370858))))

(assert (=> b!823091 (= lt!370856 (tuple2!9855 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!370861 () ListLongMap!8677)

(assert (=> b!823091 (= lt!370861 lt!370857)))

(assert (=> b!823091 (= lt!370857 (+!1903 lt!370859 lt!370858))))

(assert (=> b!823091 (= lt!370858 (tuple2!9855 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-datatypes ((array!45820 0))(
  ( (array!45821 (arr!21959 (Array (_ BitVec 32) (_ BitVec 64))) (size!22380 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45820)

(declare-datatypes ((ValueCell!6991 0))(
  ( (ValueCellFull!6991 (v!9886 V!24751)) (EmptyCell!6991) )
))
(declare-datatypes ((array!45822 0))(
  ( (array!45823 (arr!21960 (Array (_ BitVec 32) ValueCell!6991)) (size!22381 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45822)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2517 (array!45820 array!45822 (_ BitVec 32) (_ BitVec 32) V!24751 V!24751 (_ BitVec 32) Int) ListLongMap!8677)

(assert (=> b!823091 (= lt!370860 (getCurrentListMap!2517 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24751)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!823091 (= lt!370861 (getCurrentListMap!2517 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823092 () Bool)

(declare-fun e!457725 () Bool)

(declare-fun tp_is_empty!14813 () Bool)

(assert (=> b!823092 (= e!457725 tp_is_empty!14813)))

(declare-fun mapNonEmpty!23833 () Bool)

(declare-fun mapRes!23833 () Bool)

(declare-fun tp!46056 () Bool)

(assert (=> mapNonEmpty!23833 (= mapRes!23833 (and tp!46056 e!457725))))

(declare-fun mapKey!23833 () (_ BitVec 32))

(declare-fun mapValue!23833 () ValueCell!6991)

(declare-fun mapRest!23833 () (Array (_ BitVec 32) ValueCell!6991))

(assert (=> mapNonEmpty!23833 (= (arr!21960 _values!788) (store mapRest!23833 mapKey!23833 mapValue!23833))))

(declare-fun b!823093 () Bool)

(declare-fun res!561326 () Bool)

(declare-fun e!457727 () Bool)

(assert (=> b!823093 (=> (not res!561326) (not e!457727))))

(declare-datatypes ((List!15668 0))(
  ( (Nil!15665) (Cons!15664 (h!16793 (_ BitVec 64)) (t!22007 List!15668)) )
))
(declare-fun arrayNoDuplicates!0 (array!45820 (_ BitVec 32) List!15668) Bool)

(assert (=> b!823093 (= res!561326 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15665))))

(declare-fun b!823094 () Bool)

(declare-fun e!457728 () Bool)

(assert (=> b!823094 (= e!457728 tp_is_empty!14813)))

(declare-fun b!823095 () Bool)

(declare-fun e!457730 () Bool)

(assert (=> b!823095 (= e!457730 (and e!457728 mapRes!23833))))

(declare-fun condMapEmpty!23833 () Bool)

(declare-fun mapDefault!23833 () ValueCell!6991)

