; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70496 () Bool)

(assert start!70496)

(declare-fun b_free!12823 () Bool)

(declare-fun b_next!12823 () Bool)

(assert (=> start!70496 (= b_free!12823 (not b_next!12823))))

(declare-fun tp!45201 () Bool)

(declare-fun b_and!21653 () Bool)

(assert (=> start!70496 (= tp!45201 b_and!21653)))

(declare-fun b!818868 () Bool)

(declare-fun e!454638 () Bool)

(assert (=> b!818868 (= e!454638 true)))

(declare-datatypes ((V!24379 0))(
  ( (V!24380 (val!7314 Int)) )
))
(declare-datatypes ((tuple2!9616 0))(
  ( (tuple2!9617 (_1!4819 (_ BitVec 64)) (_2!4819 V!24379)) )
))
(declare-fun lt!367136 () tuple2!9616)

(declare-fun lt!367140 () tuple2!9616)

(declare-datatypes ((List!15447 0))(
  ( (Nil!15444) (Cons!15443 (h!16572 tuple2!9616) (t!21776 List!15447)) )
))
(declare-datatypes ((ListLongMap!8439 0))(
  ( (ListLongMap!8440 (toList!4235 List!15447)) )
))
(declare-fun lt!367138 () ListLongMap!8439)

(declare-fun lt!367139 () ListLongMap!8439)

(declare-fun +!1832 (ListLongMap!8439 tuple2!9616) ListLongMap!8439)

(assert (=> b!818868 (= lt!367138 (+!1832 (+!1832 lt!367139 lt!367136) lt!367140))))

(declare-fun lt!367137 () ListLongMap!8439)

(declare-fun lt!367133 () ListLongMap!8439)

(assert (=> b!818868 (= (+!1832 lt!367137 lt!367140) (+!1832 lt!367133 lt!367140))))

(declare-fun zeroValueBefore!34 () V!24379)

(declare-fun zeroValueAfter!34 () V!24379)

(declare-datatypes ((Unit!27951 0))(
  ( (Unit!27952) )
))
(declare-fun lt!367141 () Unit!27951)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!173 (ListLongMap!8439 (_ BitVec 64) V!24379 V!24379) Unit!27951)

(assert (=> b!818868 (= lt!367141 (addSameAsAddTwiceSameKeyDiffValues!173 lt!367137 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!818868 (= lt!367140 (tuple2!9617 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!454635 () Bool)

(assert (=> b!818868 e!454635))

(declare-fun res!558814 () Bool)

(assert (=> b!818868 (=> (not res!558814) (not e!454635))))

(declare-fun lt!367135 () ListLongMap!8439)

(assert (=> b!818868 (= res!558814 (= lt!367135 lt!367133))))

(assert (=> b!818868 (= lt!367133 (+!1832 lt!367137 lt!367136))))

(assert (=> b!818868 (= lt!367136 (tuple2!9617 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((array!45264 0))(
  ( (array!45265 (arr!21686 (Array (_ BitVec 32) (_ BitVec 64))) (size!22107 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45264)

(declare-fun minValue!754 () V!24379)

(declare-datatypes ((ValueCell!6851 0))(
  ( (ValueCellFull!6851 (v!9743 V!24379)) (EmptyCell!6851) )
))
(declare-datatypes ((array!45266 0))(
  ( (array!45267 (arr!21687 (Array (_ BitVec 32) ValueCell!6851)) (size!22108 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45266)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lt!367134 () ListLongMap!8439)

(declare-fun getCurrentListMap!2439 (array!45264 array!45266 (_ BitVec 32) (_ BitVec 32) V!24379 V!24379 (_ BitVec 32) Int) ListLongMap!8439)

(assert (=> b!818868 (= lt!367134 (getCurrentListMap!2439 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!818868 (= lt!367135 (getCurrentListMap!2439 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818869 () Bool)

(declare-fun res!558812 () Bool)

(declare-fun e!454636 () Bool)

(assert (=> b!818869 (=> (not res!558812) (not e!454636))))

(declare-datatypes ((List!15448 0))(
  ( (Nil!15445) (Cons!15444 (h!16573 (_ BitVec 64)) (t!21777 List!15448)) )
))
(declare-fun arrayNoDuplicates!0 (array!45264 (_ BitVec 32) List!15448) Bool)

(assert (=> b!818869 (= res!558812 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15445))))

(declare-fun b!818870 () Bool)

(declare-fun e!454634 () Bool)

(declare-fun tp_is_empty!14533 () Bool)

(assert (=> b!818870 (= e!454634 tp_is_empty!14533)))

(declare-fun b!818871 () Bool)

(declare-fun e!454640 () Bool)

(declare-fun e!454639 () Bool)

(declare-fun mapRes!23398 () Bool)

(assert (=> b!818871 (= e!454640 (and e!454639 mapRes!23398))))

(declare-fun condMapEmpty!23398 () Bool)

(declare-fun mapDefault!23398 () ValueCell!6851)

