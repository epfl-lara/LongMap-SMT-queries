; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70484 () Bool)

(assert start!70484)

(declare-fun b_free!12811 () Bool)

(declare-fun b_next!12811 () Bool)

(assert (=> start!70484 (= b_free!12811 (not b_next!12811))))

(declare-fun tp!45166 () Bool)

(declare-fun b_and!21641 () Bool)

(assert (=> start!70484 (= tp!45166 b_and!21641)))

(declare-fun b!818706 () Bool)

(declare-fun e!454510 () Bool)

(declare-fun tp_is_empty!14521 () Bool)

(assert (=> b!818706 (= e!454510 tp_is_empty!14521)))

(declare-fun b!818707 () Bool)

(declare-fun e!454512 () Bool)

(assert (=> b!818707 (= e!454512 true)))

(declare-datatypes ((V!24363 0))(
  ( (V!24364 (val!7308 Int)) )
))
(declare-datatypes ((tuple2!9604 0))(
  ( (tuple2!9605 (_1!4813 (_ BitVec 64)) (_2!4813 V!24363)) )
))
(declare-datatypes ((List!15438 0))(
  ( (Nil!15435) (Cons!15434 (h!16563 tuple2!9604) (t!21767 List!15438)) )
))
(declare-datatypes ((ListLongMap!8427 0))(
  ( (ListLongMap!8428 (toList!4229 List!15438)) )
))
(declare-fun lt!366960 () ListLongMap!8427)

(declare-fun lt!366962 () tuple2!9604)

(declare-fun lt!366961 () ListLongMap!8427)

(declare-fun lt!366956 () tuple2!9604)

(declare-fun +!1826 (ListLongMap!8427 tuple2!9604) ListLongMap!8427)

(assert (=> b!818707 (= lt!366961 (+!1826 (+!1826 lt!366960 lt!366956) lt!366962))))

(declare-fun lt!366959 () ListLongMap!8427)

(declare-fun lt!366958 () ListLongMap!8427)

(assert (=> b!818707 (= (+!1826 lt!366959 lt!366962) (+!1826 lt!366958 lt!366962))))

(declare-fun zeroValueBefore!34 () V!24363)

(declare-fun zeroValueAfter!34 () V!24363)

(declare-datatypes ((Unit!27939 0))(
  ( (Unit!27940) )
))
(declare-fun lt!366954 () Unit!27939)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!167 (ListLongMap!8427 (_ BitVec 64) V!24363 V!24363) Unit!27939)

(assert (=> b!818707 (= lt!366954 (addSameAsAddTwiceSameKeyDiffValues!167 lt!366959 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!818707 (= lt!366962 (tuple2!9605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!454508 () Bool)

(assert (=> b!818707 e!454508))

(declare-fun res!558708 () Bool)

(assert (=> b!818707 (=> (not res!558708) (not e!454508))))

(declare-fun lt!366955 () ListLongMap!8427)

(assert (=> b!818707 (= res!558708 (= lt!366955 lt!366958))))

(assert (=> b!818707 (= lt!366958 (+!1826 lt!366959 lt!366956))))

(assert (=> b!818707 (= lt!366956 (tuple2!9605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((array!45240 0))(
  ( (array!45241 (arr!21674 (Array (_ BitVec 32) (_ BitVec 64))) (size!22095 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45240)

(declare-fun minValue!754 () V!24363)

(declare-datatypes ((ValueCell!6845 0))(
  ( (ValueCellFull!6845 (v!9737 V!24363)) (EmptyCell!6845) )
))
(declare-datatypes ((array!45242 0))(
  ( (array!45243 (arr!21675 (Array (_ BitVec 32) ValueCell!6845)) (size!22096 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45242)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lt!366953 () ListLongMap!8427)

(declare-fun getCurrentListMap!2433 (array!45240 array!45242 (_ BitVec 32) (_ BitVec 32) V!24363 V!24363 (_ BitVec 32) Int) ListLongMap!8427)

(assert (=> b!818707 (= lt!366953 (getCurrentListMap!2433 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!818707 (= lt!366955 (getCurrentListMap!2433 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23380 () Bool)

(declare-fun mapRes!23380 () Bool)

(assert (=> mapIsEmpty!23380 mapRes!23380))

(declare-fun res!558703 () Bool)

(declare-fun e!454509 () Bool)

(assert (=> start!70484 (=> (not res!558703) (not e!454509))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70484 (= res!558703 (validMask!0 mask!1312))))

(assert (=> start!70484 e!454509))

(assert (=> start!70484 tp_is_empty!14521))

(declare-fun array_inv!17331 (array!45240) Bool)

(assert (=> start!70484 (array_inv!17331 _keys!976)))

(assert (=> start!70484 true))

(declare-fun e!454513 () Bool)

(declare-fun array_inv!17332 (array!45242) Bool)

(assert (=> start!70484 (and (array_inv!17332 _values!788) e!454513)))

(assert (=> start!70484 tp!45166))

(declare-fun mapNonEmpty!23380 () Bool)

(declare-fun tp!45165 () Bool)

(declare-fun e!454514 () Bool)

(assert (=> mapNonEmpty!23380 (= mapRes!23380 (and tp!45165 e!454514))))

(declare-fun mapValue!23380 () ValueCell!6845)

(declare-fun mapRest!23380 () (Array (_ BitVec 32) ValueCell!6845))

(declare-fun mapKey!23380 () (_ BitVec 32))

(assert (=> mapNonEmpty!23380 (= (arr!21675 _values!788) (store mapRest!23380 mapKey!23380 mapValue!23380))))

(declare-fun b!818708 () Bool)

(assert (=> b!818708 (= e!454514 tp_is_empty!14521)))

(declare-fun b!818709 () Bool)

(assert (=> b!818709 (= e!454513 (and e!454510 mapRes!23380))))

(declare-fun condMapEmpty!23380 () Bool)

(declare-fun mapDefault!23380 () ValueCell!6845)

