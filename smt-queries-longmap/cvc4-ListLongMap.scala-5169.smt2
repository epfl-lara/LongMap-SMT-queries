; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70004 () Bool)

(assert start!70004)

(declare-fun b_free!12425 () Bool)

(declare-fun b_next!12425 () Bool)

(assert (=> start!70004 (= b_free!12425 (not b_next!12425))))

(declare-fun tp!43990 () Bool)

(declare-fun b_and!21197 () Bool)

(assert (=> start!70004 (= tp!43990 b_and!21197)))

(declare-fun mapNonEmpty!22783 () Bool)

(declare-fun mapRes!22783 () Bool)

(declare-fun tp!43989 () Bool)

(declare-fun e!450870 () Bool)

(assert (=> mapNonEmpty!22783 (= mapRes!22783 (and tp!43989 e!450870))))

(declare-fun mapKey!22783 () (_ BitVec 32))

(declare-datatypes ((V!23847 0))(
  ( (V!23848 (val!7115 Int)) )
))
(declare-datatypes ((ValueCell!6652 0))(
  ( (ValueCellFull!6652 (v!9542 V!23847)) (EmptyCell!6652) )
))
(declare-datatypes ((array!44478 0))(
  ( (array!44479 (arr!21299 (Array (_ BitVec 32) ValueCell!6652)) (size!21720 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44478)

(declare-fun mapRest!22783 () (Array (_ BitVec 32) ValueCell!6652))

(declare-fun mapValue!22783 () ValueCell!6652)

(assert (=> mapNonEmpty!22783 (= (arr!21299 _values!788) (store mapRest!22783 mapKey!22783 mapValue!22783))))

(declare-fun b!813617 () Bool)

(declare-fun e!450871 () Bool)

(declare-fun tp_is_empty!14135 () Bool)

(assert (=> b!813617 (= e!450871 tp_is_empty!14135)))

(declare-fun b!813618 () Bool)

(assert (=> b!813618 (= e!450870 tp_is_empty!14135)))

(declare-fun mapIsEmpty!22783 () Bool)

(assert (=> mapIsEmpty!22783 mapRes!22783))

(declare-fun b!813620 () Bool)

(declare-fun e!450873 () Bool)

(assert (=> b!813620 (= e!450873 false)))

(declare-datatypes ((array!44480 0))(
  ( (array!44481 (arr!21300 (Array (_ BitVec 32) (_ BitVec 64))) (size!21721 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44480)

(declare-fun zeroValueAfter!34 () V!23847)

(declare-fun minValue!754 () V!23847)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((tuple2!9318 0))(
  ( (tuple2!9319 (_1!4670 (_ BitVec 64)) (_2!4670 V!23847)) )
))
(declare-datatypes ((List!15150 0))(
  ( (Nil!15147) (Cons!15146 (h!16275 tuple2!9318) (t!21467 List!15150)) )
))
(declare-datatypes ((ListLongMap!8141 0))(
  ( (ListLongMap!8142 (toList!4086 List!15150)) )
))
(declare-fun lt!364346 () ListLongMap!8141)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2136 (array!44480 array!44478 (_ BitVec 32) (_ BitVec 32) V!23847 V!23847 (_ BitVec 32) Int) ListLongMap!8141)

(assert (=> b!813620 (= lt!364346 (getCurrentListMapNoExtraKeys!2136 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!364347 () ListLongMap!8141)

(declare-fun zeroValueBefore!34 () V!23847)

(assert (=> b!813620 (= lt!364347 (getCurrentListMapNoExtraKeys!2136 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!813621 () Bool)

(declare-fun res!555807 () Bool)

(assert (=> b!813621 (=> (not res!555807) (not e!450873))))

(declare-datatypes ((List!15151 0))(
  ( (Nil!15148) (Cons!15147 (h!16276 (_ BitVec 64)) (t!21468 List!15151)) )
))
(declare-fun arrayNoDuplicates!0 (array!44480 (_ BitVec 32) List!15151) Bool)

(assert (=> b!813621 (= res!555807 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15148))))

(declare-fun b!813619 () Bool)

(declare-fun e!450872 () Bool)

(assert (=> b!813619 (= e!450872 (and e!450871 mapRes!22783))))

(declare-fun condMapEmpty!22783 () Bool)

(declare-fun mapDefault!22783 () ValueCell!6652)

