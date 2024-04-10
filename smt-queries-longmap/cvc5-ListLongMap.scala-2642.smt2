; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39670 () Bool)

(assert start!39670)

(declare-fun b_free!9937 () Bool)

(declare-fun b_next!9937 () Bool)

(assert (=> start!39670 (= b_free!9937 (not b_next!9937))))

(declare-fun tp!35340 () Bool)

(declare-fun b_and!17593 () Bool)

(assert (=> start!39670 (= tp!35340 b_and!17593)))

(declare-fun b!425903 () Bool)

(declare-fun e!252768 () Bool)

(declare-fun tp_is_empty!11089 () Bool)

(assert (=> b!425903 (= e!252768 tp_is_empty!11089)))

(declare-fun b!425904 () Bool)

(declare-fun res!249466 () Bool)

(declare-fun e!252771 () Bool)

(assert (=> b!425904 (=> (not res!249466) (not e!252771))))

(declare-datatypes ((array!26017 0))(
  ( (array!26018 (arr!12458 (Array (_ BitVec 32) (_ BitVec 64))) (size!12810 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26017)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26017 (_ BitVec 32)) Bool)

(assert (=> b!425904 (= res!249466 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!425905 () Bool)

(declare-fun res!249469 () Bool)

(assert (=> b!425905 (=> (not res!249469) (not e!252771))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!425905 (= res!249469 (or (= (select (arr!12458 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12458 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18255 () Bool)

(declare-fun mapRes!18255 () Bool)

(declare-fun tp!35339 () Bool)

(assert (=> mapNonEmpty!18255 (= mapRes!18255 (and tp!35339 e!252768))))

(declare-datatypes ((V!15891 0))(
  ( (V!15892 (val!5589 Int)) )
))
(declare-datatypes ((ValueCell!5201 0))(
  ( (ValueCellFull!5201 (v!7836 V!15891)) (EmptyCell!5201) )
))
(declare-fun mapValue!18255 () ValueCell!5201)

(declare-datatypes ((array!26019 0))(
  ( (array!26020 (arr!12459 (Array (_ BitVec 32) ValueCell!5201)) (size!12811 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26019)

(declare-fun mapRest!18255 () (Array (_ BitVec 32) ValueCell!5201))

(declare-fun mapKey!18255 () (_ BitVec 32))

(assert (=> mapNonEmpty!18255 (= (arr!12459 _values!549) (store mapRest!18255 mapKey!18255 mapValue!18255))))

(declare-fun b!425906 () Bool)

(declare-fun res!249462 () Bool)

(assert (=> b!425906 (=> (not res!249462) (not e!252771))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!425906 (= res!249462 (and (= (size!12811 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12810 _keys!709) (size!12811 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!425907 () Bool)

(declare-fun res!249471 () Bool)

(assert (=> b!425907 (=> (not res!249471) (not e!252771))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26017 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!425907 (= res!249471 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!425908 () Bool)

(declare-fun res!249474 () Bool)

(declare-fun e!252770 () Bool)

(assert (=> b!425908 (=> (not res!249474) (not e!252770))))

(declare-fun lt!194797 () array!26017)

(declare-datatypes ((List!7354 0))(
  ( (Nil!7351) (Cons!7350 (h!8206 (_ BitVec 64)) (t!12798 List!7354)) )
))
(declare-fun arrayNoDuplicates!0 (array!26017 (_ BitVec 32) List!7354) Bool)

(assert (=> b!425908 (= res!249474 (arrayNoDuplicates!0 lt!194797 #b00000000000000000000000000000000 Nil!7351))))

(declare-fun b!425909 () Bool)

(declare-fun res!249464 () Bool)

(assert (=> b!425909 (=> (not res!249464) (not e!252770))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!425909 (= res!249464 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!18255 () Bool)

(assert (=> mapIsEmpty!18255 mapRes!18255))

(declare-fun b!425910 () Bool)

(declare-fun res!249473 () Bool)

(assert (=> b!425910 (=> (not res!249473) (not e!252771))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!425910 (= res!249473 (validKeyInArray!0 k!794))))

(declare-fun res!249465 () Bool)

(assert (=> start!39670 (=> (not res!249465) (not e!252771))))

(assert (=> start!39670 (= res!249465 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12810 _keys!709))))))

(assert (=> start!39670 e!252771))

(assert (=> start!39670 tp_is_empty!11089))

(assert (=> start!39670 tp!35340))

(assert (=> start!39670 true))

(declare-fun e!252766 () Bool)

(declare-fun array_inv!9080 (array!26019) Bool)

(assert (=> start!39670 (and (array_inv!9080 _values!549) e!252766)))

(declare-fun array_inv!9081 (array!26017) Bool)

(assert (=> start!39670 (array_inv!9081 _keys!709)))

(declare-fun b!425911 () Bool)

(declare-fun e!252769 () Bool)

(assert (=> b!425911 (= e!252769 (not true))))

(declare-fun minValue!515 () V!15891)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15891)

(declare-fun lt!194796 () array!26019)

(declare-fun v!412 () V!15891)

(declare-datatypes ((tuple2!7342 0))(
  ( (tuple2!7343 (_1!3682 (_ BitVec 64)) (_2!3682 V!15891)) )
))
(declare-datatypes ((List!7355 0))(
  ( (Nil!7352) (Cons!7351 (h!8207 tuple2!7342) (t!12799 List!7355)) )
))
(declare-datatypes ((ListLongMap!6255 0))(
  ( (ListLongMap!6256 (toList!3143 List!7355)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1347 (array!26017 array!26019 (_ BitVec 32) (_ BitVec 32) V!15891 V!15891 (_ BitVec 32) Int) ListLongMap!6255)

(declare-fun +!1301 (ListLongMap!6255 tuple2!7342) ListLongMap!6255)

(assert (=> b!425911 (= (getCurrentListMapNoExtraKeys!1347 lt!194797 lt!194796 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1301 (getCurrentListMapNoExtraKeys!1347 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7343 k!794 v!412)))))

(declare-datatypes ((Unit!12504 0))(
  ( (Unit!12505) )
))
(declare-fun lt!194795 () Unit!12504)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!496 (array!26017 array!26019 (_ BitVec 32) (_ BitVec 32) V!15891 V!15891 (_ BitVec 32) (_ BitVec 64) V!15891 (_ BitVec 32) Int) Unit!12504)

(assert (=> b!425911 (= lt!194795 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!496 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!425912 () Bool)

(declare-fun res!249467 () Bool)

(assert (=> b!425912 (=> (not res!249467) (not e!252771))))

(assert (=> b!425912 (= res!249467 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7351))))

(declare-fun b!425913 () Bool)

(declare-fun e!252767 () Bool)

(assert (=> b!425913 (= e!252767 tp_is_empty!11089)))

(declare-fun b!425914 () Bool)

(declare-fun res!249463 () Bool)

(assert (=> b!425914 (=> (not res!249463) (not e!252771))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!425914 (= res!249463 (validMask!0 mask!1025))))

(declare-fun b!425915 () Bool)

(assert (=> b!425915 (= e!252771 e!252770)))

(declare-fun res!249470 () Bool)

(assert (=> b!425915 (=> (not res!249470) (not e!252770))))

(assert (=> b!425915 (= res!249470 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194797 mask!1025))))

(assert (=> b!425915 (= lt!194797 (array!26018 (store (arr!12458 _keys!709) i!563 k!794) (size!12810 _keys!709)))))

(declare-fun b!425916 () Bool)

(assert (=> b!425916 (= e!252766 (and e!252767 mapRes!18255))))

(declare-fun condMapEmpty!18255 () Bool)

(declare-fun mapDefault!18255 () ValueCell!5201)

