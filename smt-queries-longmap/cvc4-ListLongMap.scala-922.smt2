; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20632 () Bool)

(assert start!20632)

(declare-fun b_free!5291 () Bool)

(declare-fun b_next!5291 () Bool)

(assert (=> start!20632 (= b_free!5291 (not b_next!5291))))

(declare-fun tp!18905 () Bool)

(declare-fun b_and!12037 () Bool)

(assert (=> start!20632 (= tp!18905 b_and!12037)))

(declare-fun b!205884 () Bool)

(declare-fun res!99591 () Bool)

(declare-fun e!134603 () Bool)

(assert (=> b!205884 (=> (not res!99591) (not e!134603))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!205884 (= res!99591 (validKeyInArray!0 k!843))))

(declare-fun b!205885 () Bool)

(declare-fun e!134607 () Bool)

(assert (=> b!205885 (= e!134607 true)))

(declare-datatypes ((V!6509 0))(
  ( (V!6510 (val!2618 Int)) )
))
(declare-datatypes ((tuple2!3972 0))(
  ( (tuple2!3973 (_1!1997 (_ BitVec 64)) (_2!1997 V!6509)) )
))
(declare-datatypes ((List!2867 0))(
  ( (Nil!2864) (Cons!2863 (h!3505 tuple2!3972) (t!7798 List!2867)) )
))
(declare-datatypes ((ListLongMap!2885 0))(
  ( (ListLongMap!2886 (toList!1458 List!2867)) )
))
(declare-fun lt!105016 () ListLongMap!2885)

(declare-fun lt!105019 () ListLongMap!2885)

(declare-fun lt!105018 () tuple2!3972)

(declare-fun +!485 (ListLongMap!2885 tuple2!3972) ListLongMap!2885)

(assert (=> b!205885 (= lt!105016 (+!485 lt!105019 lt!105018))))

(declare-datatypes ((Unit!6260 0))(
  ( (Unit!6261) )
))
(declare-fun lt!105026 () Unit!6260)

(declare-fun minValue!615 () V!6509)

(declare-fun v!520 () V!6509)

(declare-fun lt!105022 () ListLongMap!2885)

(declare-fun addCommutativeForDiffKeys!184 (ListLongMap!2885 (_ BitVec 64) V!6509 (_ BitVec 64) V!6509) Unit!6260)

(assert (=> b!205885 (= lt!105026 (addCommutativeForDiffKeys!184 lt!105022 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205886 () Bool)

(declare-fun e!134606 () Bool)

(assert (=> b!205886 (= e!134603 (not e!134606))))

(declare-fun res!99598 () Bool)

(assert (=> b!205886 (=> res!99598 e!134606)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!205886 (= res!99598 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((ValueCell!2230 0))(
  ( (ValueCellFull!2230 (v!4588 V!6509)) (EmptyCell!2230) )
))
(declare-datatypes ((array!9505 0))(
  ( (array!9506 (arr!4503 (Array (_ BitVec 32) ValueCell!2230)) (size!4828 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9505)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun lt!105017 () ListLongMap!2885)

(declare-fun zeroValue!615 () V!6509)

(declare-datatypes ((array!9507 0))(
  ( (array!9508 (arr!4504 (Array (_ BitVec 32) (_ BitVec 64))) (size!4829 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9507)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1028 (array!9507 array!9505 (_ BitVec 32) (_ BitVec 32) V!6509 V!6509 (_ BitVec 32) Int) ListLongMap!2885)

(assert (=> b!205886 (= lt!105017 (getCurrentListMap!1028 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105023 () array!9505)

(declare-fun lt!105020 () ListLongMap!2885)

(assert (=> b!205886 (= lt!105020 (getCurrentListMap!1028 _keys!825 lt!105023 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105027 () ListLongMap!2885)

(declare-fun lt!105024 () ListLongMap!2885)

(assert (=> b!205886 (and (= lt!105027 lt!105024) (= lt!105024 lt!105027))))

(assert (=> b!205886 (= lt!105024 (+!485 lt!105022 lt!105018))))

(assert (=> b!205886 (= lt!105018 (tuple2!3973 k!843 v!520))))

(declare-fun lt!105025 () Unit!6260)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!141 (array!9507 array!9505 (_ BitVec 32) (_ BitVec 32) V!6509 V!6509 (_ BitVec 32) (_ BitVec 64) V!6509 (_ BitVec 32) Int) Unit!6260)

(assert (=> b!205886 (= lt!105025 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!141 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!402 (array!9507 array!9505 (_ BitVec 32) (_ BitVec 32) V!6509 V!6509 (_ BitVec 32) Int) ListLongMap!2885)

(assert (=> b!205886 (= lt!105027 (getCurrentListMapNoExtraKeys!402 _keys!825 lt!105023 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205886 (= lt!105023 (array!9506 (store (arr!4503 _values!649) i!601 (ValueCellFull!2230 v!520)) (size!4828 _values!649)))))

(assert (=> b!205886 (= lt!105022 (getCurrentListMapNoExtraKeys!402 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!205887 () Bool)

(declare-fun res!99596 () Bool)

(assert (=> b!205887 (=> (not res!99596) (not e!134603))))

(assert (=> b!205887 (= res!99596 (and (= (size!4828 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4829 _keys!825) (size!4828 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!205888 () Bool)

(assert (=> b!205888 (= e!134606 e!134607)))

(declare-fun res!99593 () Bool)

(assert (=> b!205888 (=> res!99593 e!134607)))

(assert (=> b!205888 (= res!99593 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!205888 (= lt!105017 lt!105019)))

(declare-fun lt!105021 () tuple2!3972)

(assert (=> b!205888 (= lt!105019 (+!485 lt!105022 lt!105021))))

(assert (=> b!205888 (= lt!105020 lt!105016)))

(assert (=> b!205888 (= lt!105016 (+!485 lt!105024 lt!105021))))

(assert (=> b!205888 (= lt!105020 (+!485 lt!105027 lt!105021))))

(assert (=> b!205888 (= lt!105021 (tuple2!3973 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205889 () Bool)

(declare-fun res!99595 () Bool)

(assert (=> b!205889 (=> (not res!99595) (not e!134603))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9507 (_ BitVec 32)) Bool)

(assert (=> b!205889 (= res!99595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!8789 () Bool)

(declare-fun mapRes!8789 () Bool)

(assert (=> mapIsEmpty!8789 mapRes!8789))

(declare-fun b!205890 () Bool)

(declare-fun e!134605 () Bool)

(declare-fun tp_is_empty!5147 () Bool)

(assert (=> b!205890 (= e!134605 tp_is_empty!5147)))

(declare-fun b!205891 () Bool)

(declare-fun e!134608 () Bool)

(assert (=> b!205891 (= e!134608 (and e!134605 mapRes!8789))))

(declare-fun condMapEmpty!8789 () Bool)

(declare-fun mapDefault!8789 () ValueCell!2230)

