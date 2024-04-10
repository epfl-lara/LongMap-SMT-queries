; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39784 () Bool)

(assert start!39784)

(declare-fun b_free!10051 () Bool)

(declare-fun b_next!10051 () Bool)

(assert (=> start!39784 (= b_free!10051 (not b_next!10051))))

(declare-fun tp!35681 () Bool)

(declare-fun b_and!17761 () Bool)

(assert (=> start!39784 (= tp!35681 b_and!17761)))

(declare-fun b!428843 () Bool)

(declare-fun e!254091 () Bool)

(assert (=> b!428843 (= e!254091 true)))

(declare-datatypes ((array!26243 0))(
  ( (array!26244 (arr!12571 (Array (_ BitVec 32) (_ BitVec 64))) (size!12923 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26243)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!428843 (not (= (select (arr!12571 _keys!709) from!863) k!794))))

(declare-datatypes ((Unit!12596 0))(
  ( (Unit!12597) )
))
(declare-fun lt!195957 () Unit!12596)

(declare-fun e!254087 () Unit!12596)

(assert (=> b!428843 (= lt!195957 e!254087)))

(declare-fun c!55412 () Bool)

(assert (=> b!428843 (= c!55412 (= (select (arr!12571 _keys!709) from!863) k!794))))

(declare-datatypes ((V!16043 0))(
  ( (V!16044 (val!5646 Int)) )
))
(declare-datatypes ((tuple2!7434 0))(
  ( (tuple2!7435 (_1!3728 (_ BitVec 64)) (_2!3728 V!16043)) )
))
(declare-datatypes ((List!7448 0))(
  ( (Nil!7445) (Cons!7444 (h!8300 tuple2!7434) (t!12948 List!7448)) )
))
(declare-datatypes ((ListLongMap!6347 0))(
  ( (ListLongMap!6348 (toList!3189 List!7448)) )
))
(declare-fun lt!195959 () ListLongMap!6347)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5258 0))(
  ( (ValueCellFull!5258 (v!7893 V!16043)) (EmptyCell!5258) )
))
(declare-datatypes ((array!26245 0))(
  ( (array!26246 (arr!12572 (Array (_ BitVec 32) ValueCell!5258)) (size!12924 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26245)

(declare-fun lt!195963 () ListLongMap!6347)

(declare-fun +!1340 (ListLongMap!6347 tuple2!7434) ListLongMap!6347)

(declare-fun get!6232 (ValueCell!5258 V!16043) V!16043)

(declare-fun dynLambda!767 (Int (_ BitVec 64)) V!16043)

(assert (=> b!428843 (= lt!195959 (+!1340 lt!195963 (tuple2!7435 (select (arr!12571 _keys!709) from!863) (get!6232 (select (arr!12572 _values!549) from!863) (dynLambda!767 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!428844 () Bool)

(declare-fun res!251789 () Bool)

(declare-fun e!254090 () Bool)

(assert (=> b!428844 (=> (not res!251789) (not e!254090))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!428844 (= res!251789 (validKeyInArray!0 k!794))))

(declare-fun b!428845 () Bool)

(declare-fun e!254085 () Bool)

(declare-fun tp_is_empty!11203 () Bool)

(assert (=> b!428845 (= e!254085 tp_is_empty!11203)))

(declare-fun b!428846 () Bool)

(declare-fun res!251788 () Bool)

(assert (=> b!428846 (=> (not res!251788) (not e!254090))))

(declare-datatypes ((List!7449 0))(
  ( (Nil!7446) (Cons!7445 (h!8301 (_ BitVec 64)) (t!12949 List!7449)) )
))
(declare-fun arrayNoDuplicates!0 (array!26243 (_ BitVec 32) List!7449) Bool)

(assert (=> b!428846 (= res!251788 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7446))))

(declare-fun b!428847 () Bool)

(declare-fun res!251779 () Bool)

(assert (=> b!428847 (=> (not res!251779) (not e!254090))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!428847 (= res!251779 (and (= (size!12924 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12923 _keys!709) (size!12924 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!428848 () Bool)

(declare-fun res!251780 () Bool)

(assert (=> b!428848 (=> (not res!251780) (not e!254090))))

(declare-fun arrayContainsKey!0 (array!26243 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!428848 (= res!251780 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun res!251786 () Bool)

(assert (=> start!39784 (=> (not res!251786) (not e!254090))))

(assert (=> start!39784 (= res!251786 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12923 _keys!709))))))

(assert (=> start!39784 e!254090))

(assert (=> start!39784 tp_is_empty!11203))

(assert (=> start!39784 tp!35681))

(assert (=> start!39784 true))

(declare-fun e!254084 () Bool)

(declare-fun array_inv!9162 (array!26245) Bool)

(assert (=> start!39784 (and (array_inv!9162 _values!549) e!254084)))

(declare-fun array_inv!9163 (array!26243) Bool)

(assert (=> start!39784 (array_inv!9163 _keys!709)))

(declare-fun mapNonEmpty!18426 () Bool)

(declare-fun mapRes!18426 () Bool)

(declare-fun tp!35682 () Bool)

(declare-fun e!254088 () Bool)

(assert (=> mapNonEmpty!18426 (= mapRes!18426 (and tp!35682 e!254088))))

(declare-fun mapValue!18426 () ValueCell!5258)

(declare-fun mapRest!18426 () (Array (_ BitVec 32) ValueCell!5258))

(declare-fun mapKey!18426 () (_ BitVec 32))

(assert (=> mapNonEmpty!18426 (= (arr!12572 _values!549) (store mapRest!18426 mapKey!18426 mapValue!18426))))

(declare-fun b!428849 () Bool)

(declare-fun res!251787 () Bool)

(assert (=> b!428849 (=> (not res!251787) (not e!254090))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!428849 (= res!251787 (or (= (select (arr!12571 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12571 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!428850 () Bool)

(declare-fun e!254089 () Bool)

(declare-fun e!254083 () Bool)

(assert (=> b!428850 (= e!254089 e!254083)))

(declare-fun res!251790 () Bool)

(assert (=> b!428850 (=> (not res!251790) (not e!254083))))

(assert (=> b!428850 (= res!251790 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!195961 () array!26245)

(declare-fun minValue!515 () V!16043)

(declare-fun lt!195964 () array!26243)

(declare-fun zeroValue!515 () V!16043)

(declare-fun getCurrentListMapNoExtraKeys!1391 (array!26243 array!26245 (_ BitVec 32) (_ BitVec 32) V!16043 V!16043 (_ BitVec 32) Int) ListLongMap!6347)

(assert (=> b!428850 (= lt!195959 (getCurrentListMapNoExtraKeys!1391 lt!195964 lt!195961 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16043)

(assert (=> b!428850 (= lt!195961 (array!26246 (store (arr!12572 _values!549) i!563 (ValueCellFull!5258 v!412)) (size!12924 _values!549)))))

(declare-fun lt!195960 () ListLongMap!6347)

(assert (=> b!428850 (= lt!195960 (getCurrentListMapNoExtraKeys!1391 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!428851 () Bool)

(assert (=> b!428851 (= e!254084 (and e!254085 mapRes!18426))))

(declare-fun condMapEmpty!18426 () Bool)

(declare-fun mapDefault!18426 () ValueCell!5258)

