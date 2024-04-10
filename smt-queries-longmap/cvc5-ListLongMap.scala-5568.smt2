; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73192 () Bool)

(assert start!73192)

(declare-fun b_free!14107 () Bool)

(declare-fun b_next!14107 () Bool)

(assert (=> start!73192 (= b_free!14107 (not b_next!14107))))

(declare-fun tp!49825 () Bool)

(declare-fun b_and!23373 () Bool)

(assert (=> start!73192 (= tp!49825 b_and!23373)))

(declare-fun b!852669 () Bool)

(declare-fun res!579129 () Bool)

(declare-fun e!475551 () Bool)

(assert (=> b!852669 (=> (not res!579129) (not e!475551))))

(declare-datatypes ((array!48684 0))(
  ( (array!48685 (arr!23373 (Array (_ BitVec 32) (_ BitVec 64))) (size!23813 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48684)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48684 (_ BitVec 32)) Bool)

(assert (=> b!852669 (= res!579129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!25964 () Bool)

(declare-fun mapRes!25964 () Bool)

(assert (=> mapIsEmpty!25964 mapRes!25964))

(declare-fun b!852670 () Bool)

(declare-fun e!475552 () Bool)

(declare-fun e!475545 () Bool)

(assert (=> b!852670 (= e!475552 (not e!475545))))

(declare-fun res!579128 () Bool)

(assert (=> b!852670 (=> res!579128 e!475545)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!852670 (= res!579128 (not (validKeyInArray!0 (select (arr!23373 _keys!868) from!1053))))))

(declare-fun e!475548 () Bool)

(assert (=> b!852670 e!475548))

(declare-fun c!91831 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!852670 (= c!91831 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((V!26705 0))(
  ( (V!26706 (val!8169 Int)) )
))
(declare-fun v!557 () V!26705)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((ValueCell!7682 0))(
  ( (ValueCellFull!7682 (v!10594 V!26705)) (EmptyCell!7682) )
))
(declare-datatypes ((array!48686 0))(
  ( (array!48687 (arr!23374 (Array (_ BitVec 32) ValueCell!7682)) (size!23814 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48686)

(declare-fun minValue!654 () V!26705)

(declare-fun zeroValue!654 () V!26705)

(declare-datatypes ((Unit!29105 0))(
  ( (Unit!29106) )
))
(declare-fun lt!384248 () Unit!29105)

(declare-fun defaultEntry!696 () Int)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!391 (array!48684 array!48686 (_ BitVec 32) (_ BitVec 32) V!26705 V!26705 (_ BitVec 32) (_ BitVec 64) V!26705 (_ BitVec 32) Int) Unit!29105)

(assert (=> b!852670 (= lt!384248 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!391 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!25964 () Bool)

(declare-fun tp!49824 () Bool)

(declare-fun e!475550 () Bool)

(assert (=> mapNonEmpty!25964 (= mapRes!25964 (and tp!49824 e!475550))))

(declare-fun mapKey!25964 () (_ BitVec 32))

(declare-fun mapRest!25964 () (Array (_ BitVec 32) ValueCell!7682))

(declare-fun mapValue!25964 () ValueCell!7682)

(assert (=> mapNonEmpty!25964 (= (arr!23374 _values!688) (store mapRest!25964 mapKey!25964 mapValue!25964))))

(declare-fun b!852671 () Bool)

(declare-fun res!579133 () Bool)

(assert (=> b!852671 (=> (not res!579133) (not e!475551))))

(declare-datatypes ((List!16561 0))(
  ( (Nil!16558) (Cons!16557 (h!17688 (_ BitVec 64)) (t!23114 List!16561)) )
))
(declare-fun arrayNoDuplicates!0 (array!48684 (_ BitVec 32) List!16561) Bool)

(assert (=> b!852671 (= res!579133 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16558))))

(declare-fun b!852672 () Bool)

(declare-datatypes ((tuple2!10730 0))(
  ( (tuple2!10731 (_1!5376 (_ BitVec 64)) (_2!5376 V!26705)) )
))
(declare-datatypes ((List!16562 0))(
  ( (Nil!16559) (Cons!16558 (h!17689 tuple2!10730) (t!23115 List!16562)) )
))
(declare-datatypes ((ListLongMap!9499 0))(
  ( (ListLongMap!9500 (toList!4765 List!16562)) )
))
(declare-fun call!38177 () ListLongMap!9499)

(declare-fun call!38176 () ListLongMap!9499)

(assert (=> b!852672 (= e!475548 (= call!38177 call!38176))))

(declare-fun b!852673 () Bool)

(declare-fun e!475547 () Bool)

(declare-fun e!475549 () Bool)

(assert (=> b!852673 (= e!475547 (and e!475549 mapRes!25964))))

(declare-fun condMapEmpty!25964 () Bool)

(declare-fun mapDefault!25964 () ValueCell!7682)

