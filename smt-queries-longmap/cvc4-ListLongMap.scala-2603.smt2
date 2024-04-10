; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39440 () Bool)

(assert start!39440)

(declare-fun b_free!9707 () Bool)

(declare-fun b_next!9707 () Bool)

(assert (=> start!39440 (= b_free!9707 (not b_next!9707))))

(declare-fun tp!34649 () Bool)

(declare-fun b_and!17289 () Bool)

(assert (=> start!39440 (= tp!34649 b_and!17289)))

(declare-fun mapNonEmpty!17910 () Bool)

(declare-fun mapRes!17910 () Bool)

(declare-fun tp!34650 () Bool)

(declare-fun e!250296 () Bool)

(assert (=> mapNonEmpty!17910 (= mapRes!17910 (and tp!34650 e!250296))))

(declare-datatypes ((V!15583 0))(
  ( (V!15584 (val!5474 Int)) )
))
(declare-datatypes ((ValueCell!5086 0))(
  ( (ValueCellFull!5086 (v!7721 V!15583)) (EmptyCell!5086) )
))
(declare-fun mapValue!17910 () ValueCell!5086)

(declare-fun mapRest!17910 () (Array (_ BitVec 32) ValueCell!5086))

(declare-fun mapKey!17910 () (_ BitVec 32))

(declare-datatypes ((array!25567 0))(
  ( (array!25568 (arr!12233 (Array (_ BitVec 32) ValueCell!5086)) (size!12585 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25567)

(assert (=> mapNonEmpty!17910 (= (arr!12233 _values!549) (store mapRest!17910 mapKey!17910 mapValue!17910))))

(declare-fun b!420144 () Bool)

(declare-fun e!250297 () Bool)

(assert (=> b!420144 (= e!250297 true)))

(declare-datatypes ((tuple2!7170 0))(
  ( (tuple2!7171 (_1!3596 (_ BitVec 64)) (_2!3596 V!15583)) )
))
(declare-fun lt!192742 () tuple2!7170)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun lt!192748 () V!15583)

(declare-datatypes ((List!7178 0))(
  ( (Nil!7175) (Cons!7174 (h!8030 tuple2!7170) (t!12550 List!7178)) )
))
(declare-datatypes ((ListLongMap!6083 0))(
  ( (ListLongMap!6084 (toList!3057 List!7178)) )
))
(declare-fun lt!192749 () ListLongMap!6083)

(declare-fun +!1254 (ListLongMap!6083 tuple2!7170) ListLongMap!6083)

(assert (=> b!420144 (= (+!1254 lt!192749 lt!192742) (+!1254 (+!1254 lt!192749 (tuple2!7171 k!794 lt!192748)) lt!192742))))

(declare-fun lt!192747 () V!15583)

(assert (=> b!420144 (= lt!192742 (tuple2!7171 k!794 lt!192747))))

(declare-datatypes ((Unit!12412 0))(
  ( (Unit!12413) )
))
(declare-fun lt!192739 () Unit!12412)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!51 (ListLongMap!6083 (_ BitVec 64) V!15583 V!15583) Unit!12412)

(assert (=> b!420144 (= lt!192739 (addSameAsAddTwiceSameKeyDiffValues!51 lt!192749 k!794 lt!192748 lt!192747))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!192741 () V!15583)

(declare-fun get!6071 (ValueCell!5086 V!15583) V!15583)

(assert (=> b!420144 (= lt!192748 (get!6071 (select (arr!12233 _values!549) from!863) lt!192741))))

(declare-fun lt!192740 () ListLongMap!6083)

(declare-datatypes ((array!25569 0))(
  ( (array!25570 (arr!12234 (Array (_ BitVec 32) (_ BitVec 64))) (size!12586 (_ BitVec 32))) )
))
(declare-fun lt!192743 () array!25569)

(assert (=> b!420144 (= lt!192740 (+!1254 lt!192749 (tuple2!7171 (select (arr!12234 lt!192743) from!863) lt!192747)))))

(declare-fun v!412 () V!15583)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!420144 (= lt!192747 (get!6071 (select (store (arr!12233 _values!549) i!563 (ValueCellFull!5086 v!412)) from!863) lt!192741))))

(declare-fun defaultEntry!557 () Int)

(declare-fun dynLambda!722 (Int (_ BitVec 64)) V!15583)

(assert (=> b!420144 (= lt!192741 (dynLambda!722 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun minValue!515 () V!15583)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15583)

(declare-fun lt!192745 () array!25567)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1262 (array!25569 array!25567 (_ BitVec 32) (_ BitVec 32) V!15583 V!15583 (_ BitVec 32) Int) ListLongMap!6083)

(assert (=> b!420144 (= lt!192749 (getCurrentListMapNoExtraKeys!1262 lt!192743 lt!192745 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun e!250299 () Bool)

(declare-fun call!29299 () ListLongMap!6083)

(declare-fun b!420145 () Bool)

(declare-fun call!29300 () ListLongMap!6083)

(assert (=> b!420145 (= e!250299 (= call!29300 (+!1254 call!29299 (tuple2!7171 k!794 v!412))))))

(declare-fun b!420146 () Bool)

(declare-fun e!250295 () Bool)

(declare-fun e!250301 () Bool)

(assert (=> b!420146 (= e!250295 e!250301)))

(declare-fun res!245035 () Bool)

(assert (=> b!420146 (=> (not res!245035) (not e!250301))))

(assert (=> b!420146 (= res!245035 (= from!863 i!563))))

(assert (=> b!420146 (= lt!192740 (getCurrentListMapNoExtraKeys!1262 lt!192743 lt!192745 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!420146 (= lt!192745 (array!25568 (store (arr!12233 _values!549) i!563 (ValueCellFull!5086 v!412)) (size!12585 _values!549)))))

(declare-fun lt!192744 () ListLongMap!6083)

(declare-fun _keys!709 () array!25569)

(assert (=> b!420146 (= lt!192744 (getCurrentListMapNoExtraKeys!1262 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!420147 () Bool)

(declare-fun res!245036 () Bool)

(declare-fun e!250300 () Bool)

(assert (=> b!420147 (=> (not res!245036) (not e!250300))))

(assert (=> b!420147 (= res!245036 (and (= (size!12585 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12586 _keys!709) (size!12585 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun c!55274 () Bool)

(declare-fun bm!29296 () Bool)

(assert (=> bm!29296 (= call!29299 (getCurrentListMapNoExtraKeys!1262 (ite c!55274 _keys!709 lt!192743) (ite c!55274 _values!549 lt!192745) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420148 () Bool)

(assert (=> b!420148 (= e!250300 e!250295)))

(declare-fun res!245030 () Bool)

(assert (=> b!420148 (=> (not res!245030) (not e!250295))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25569 (_ BitVec 32)) Bool)

(assert (=> b!420148 (= res!245030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!192743 mask!1025))))

(assert (=> b!420148 (= lt!192743 (array!25570 (store (arr!12234 _keys!709) i!563 k!794) (size!12586 _keys!709)))))

(declare-fun b!420149 () Bool)

(declare-fun res!245033 () Bool)

(assert (=> b!420149 (=> (not res!245033) (not e!250295))))

(assert (=> b!420149 (= res!245033 (bvsle from!863 i!563))))

(declare-fun b!420150 () Bool)

(declare-fun e!250298 () Bool)

(declare-fun tp_is_empty!10859 () Bool)

(assert (=> b!420150 (= e!250298 tp_is_empty!10859)))

(declare-fun b!420151 () Bool)

(declare-fun e!250302 () Bool)

(assert (=> b!420151 (= e!250302 (and e!250298 mapRes!17910))))

(declare-fun condMapEmpty!17910 () Bool)

(declare-fun mapDefault!17910 () ValueCell!5086)

