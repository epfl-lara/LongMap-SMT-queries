; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40806 () Bool)

(assert start!40806)

(declare-fun b_free!10795 () Bool)

(declare-fun b_next!10795 () Bool)

(assert (=> start!40806 (= b_free!10795 (not b_next!10795))))

(declare-fun tp!38208 () Bool)

(declare-fun b_and!18877 () Bool)

(assert (=> start!40806 (= tp!38208 b_and!18877)))

(declare-fun b!452825 () Bool)

(declare-fun e!265090 () Bool)

(declare-fun e!265093 () Bool)

(assert (=> b!452825 (= e!265090 (not e!265093))))

(declare-fun res!269767 () Bool)

(assert (=> b!452825 (=> res!269767 e!265093)))

(declare-datatypes ((array!28073 0))(
  ( (array!28074 (arr!13481 (Array (_ BitVec 32) (_ BitVec 64))) (size!13833 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28073)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!452825 (= res!269767 (validKeyInArray!0 (select (arr!13481 _keys!709) from!863)))))

(declare-fun e!265091 () Bool)

(assert (=> b!452825 e!265091))

(declare-fun c!56141 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!452825 (= c!56141 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!17283 0))(
  ( (V!17284 (val!6111 Int)) )
))
(declare-fun minValue!515 () V!17283)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5723 0))(
  ( (ValueCellFull!5723 (v!8370 V!17283)) (EmptyCell!5723) )
))
(declare-datatypes ((array!28075 0))(
  ( (array!28076 (arr!13482 (Array (_ BitVec 32) ValueCell!5723)) (size!13834 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28075)

(declare-fun zeroValue!515 () V!17283)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((Unit!13240 0))(
  ( (Unit!13241) )
))
(declare-fun lt!205454 () Unit!13240)

(declare-fun defaultEntry!557 () Int)

(declare-fun v!412 () V!17283)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!734 (array!28073 array!28075 (_ BitVec 32) (_ BitVec 32) V!17283 V!17283 (_ BitVec 32) (_ BitVec 64) V!17283 (_ BitVec 32) Int) Unit!13240)

(assert (=> b!452825 (= lt!205454 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!734 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452826 () Bool)

(declare-fun res!269764 () Bool)

(declare-fun e!265092 () Bool)

(assert (=> b!452826 (=> (not res!269764) (not e!265092))))

(assert (=> b!452826 (= res!269764 (and (= (size!13834 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13833 _keys!709) (size!13834 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!452827 () Bool)

(declare-fun res!269760 () Bool)

(declare-fun e!265089 () Bool)

(assert (=> b!452827 (=> (not res!269760) (not e!265089))))

(declare-fun lt!205453 () array!28073)

(declare-datatypes ((List!8105 0))(
  ( (Nil!8102) (Cons!8101 (h!8957 (_ BitVec 64)) (t!13923 List!8105)) )
))
(declare-fun arrayNoDuplicates!0 (array!28073 (_ BitVec 32) List!8105) Bool)

(assert (=> b!452827 (= res!269760 (arrayNoDuplicates!0 lt!205453 #b00000000000000000000000000000000 Nil!8102))))

(declare-fun b!452828 () Bool)

(assert (=> b!452828 (= e!265092 e!265089)))

(declare-fun res!269770 () Bool)

(assert (=> b!452828 (=> (not res!269770) (not e!265089))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28073 (_ BitVec 32)) Bool)

(assert (=> b!452828 (= res!269770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!205453 mask!1025))))

(assert (=> b!452828 (= lt!205453 (array!28074 (store (arr!13481 _keys!709) i!563 k!794) (size!13833 _keys!709)))))

(declare-fun b!452829 () Bool)

(declare-fun res!269771 () Bool)

(assert (=> b!452829 (=> (not res!269771) (not e!265092))))

(declare-fun arrayContainsKey!0 (array!28073 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!452829 (= res!269771 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun lt!205460 () array!28075)

(declare-fun bm!29995 () Bool)

(declare-datatypes ((tuple2!8048 0))(
  ( (tuple2!8049 (_1!4035 (_ BitVec 64)) (_2!4035 V!17283)) )
))
(declare-datatypes ((List!8106 0))(
  ( (Nil!8103) (Cons!8102 (h!8958 tuple2!8048) (t!13924 List!8106)) )
))
(declare-datatypes ((ListLongMap!6961 0))(
  ( (ListLongMap!6962 (toList!3496 List!8106)) )
))
(declare-fun call!29998 () ListLongMap!6961)

(declare-fun getCurrentListMapNoExtraKeys!1679 (array!28073 array!28075 (_ BitVec 32) (_ BitVec 32) V!17283 V!17283 (_ BitVec 32) Int) ListLongMap!6961)

(assert (=> bm!29995 (= call!29998 (getCurrentListMapNoExtraKeys!1679 (ite c!56141 lt!205453 _keys!709) (ite c!56141 lt!205460 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452830 () Bool)

(declare-fun call!29999 () ListLongMap!6961)

(assert (=> b!452830 (= e!265091 (= call!29999 call!29998))))

(declare-fun bm!29996 () Bool)

(assert (=> bm!29996 (= call!29999 (getCurrentListMapNoExtraKeys!1679 (ite c!56141 _keys!709 lt!205453) (ite c!56141 _values!549 lt!205460) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452831 () Bool)

(declare-fun +!1572 (ListLongMap!6961 tuple2!8048) ListLongMap!6961)

(assert (=> b!452831 (= e!265091 (= call!29998 (+!1572 call!29999 (tuple2!8049 k!794 v!412))))))

(declare-fun res!269769 () Bool)

(assert (=> start!40806 (=> (not res!269769) (not e!265092))))

(assert (=> start!40806 (= res!269769 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13833 _keys!709))))))

(assert (=> start!40806 e!265092))

(declare-fun tp_is_empty!12133 () Bool)

(assert (=> start!40806 tp_is_empty!12133))

(assert (=> start!40806 tp!38208))

(assert (=> start!40806 true))

(declare-fun e!265088 () Bool)

(declare-fun array_inv!9764 (array!28075) Bool)

(assert (=> start!40806 (and (array_inv!9764 _values!549) e!265088)))

(declare-fun array_inv!9765 (array!28073) Bool)

(assert (=> start!40806 (array_inv!9765 _keys!709)))

(declare-fun b!452832 () Bool)

(declare-fun res!269761 () Bool)

(assert (=> b!452832 (=> (not res!269761) (not e!265092))))

(assert (=> b!452832 (= res!269761 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13833 _keys!709))))))

(declare-fun b!452833 () Bool)

(declare-fun e!265094 () Bool)

(declare-fun mapRes!19836 () Bool)

(assert (=> b!452833 (= e!265088 (and e!265094 mapRes!19836))))

(declare-fun condMapEmpty!19836 () Bool)

(declare-fun mapDefault!19836 () ValueCell!5723)

