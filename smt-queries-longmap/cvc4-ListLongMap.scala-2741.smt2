; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40268 () Bool)

(assert start!40268)

(declare-fun b_free!10529 () Bool)

(declare-fun b_next!10529 () Bool)

(assert (=> start!40268 (= b_free!10529 (not b_next!10529))))

(declare-fun tp!37125 () Bool)

(declare-fun b_and!18497 () Bool)

(assert (=> start!40268 (= tp!37125 b_and!18497)))

(declare-fun b!442185 () Bool)

(declare-fun res!261905 () Bool)

(declare-fun e!260263 () Bool)

(assert (=> b!442185 (=> (not res!261905) (not e!260263))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!442185 (= res!261905 (validMask!0 mask!1025))))

(declare-fun res!261908 () Bool)

(assert (=> start!40268 (=> (not res!261908) (not e!260263))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!27185 0))(
  ( (array!27186 (arr!13042 (Array (_ BitVec 32) (_ BitVec 64))) (size!13394 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27185)

(assert (=> start!40268 (= res!261908 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13394 _keys!709))))))

(assert (=> start!40268 e!260263))

(declare-fun tp_is_empty!11687 () Bool)

(assert (=> start!40268 tp_is_empty!11687))

(assert (=> start!40268 tp!37125))

(assert (=> start!40268 true))

(declare-datatypes ((V!16687 0))(
  ( (V!16688 (val!5888 Int)) )
))
(declare-datatypes ((ValueCell!5500 0))(
  ( (ValueCellFull!5500 (v!8135 V!16687)) (EmptyCell!5500) )
))
(declare-datatypes ((array!27187 0))(
  ( (array!27188 (arr!13043 (Array (_ BitVec 32) ValueCell!5500)) (size!13395 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27187)

(declare-fun e!260265 () Bool)

(declare-fun array_inv!9464 (array!27187) Bool)

(assert (=> start!40268 (and (array_inv!9464 _values!549) e!260265)))

(declare-fun array_inv!9465 (array!27185) Bool)

(assert (=> start!40268 (array_inv!9465 _keys!709)))

(declare-fun b!442186 () Bool)

(declare-fun res!261901 () Bool)

(assert (=> b!442186 (=> (not res!261901) (not e!260263))))

(declare-datatypes ((List!7833 0))(
  ( (Nil!7830) (Cons!7829 (h!8685 (_ BitVec 64)) (t!13589 List!7833)) )
))
(declare-fun arrayNoDuplicates!0 (array!27185 (_ BitVec 32) List!7833) Bool)

(assert (=> b!442186 (= res!261901 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7830))))

(declare-fun b!442187 () Bool)

(declare-fun res!261902 () Bool)

(assert (=> b!442187 (=> (not res!261902) (not e!260263))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27185 (_ BitVec 32)) Bool)

(assert (=> b!442187 (= res!261902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!19152 () Bool)

(declare-fun mapRes!19152 () Bool)

(assert (=> mapIsEmpty!19152 mapRes!19152))

(declare-fun b!442188 () Bool)

(declare-fun e!260262 () Bool)

(assert (=> b!442188 (= e!260263 e!260262)))

(declare-fun res!261899 () Bool)

(assert (=> b!442188 (=> (not res!261899) (not e!260262))))

(declare-fun lt!203105 () array!27185)

(assert (=> b!442188 (= res!261899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203105 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!442188 (= lt!203105 (array!27186 (store (arr!13042 _keys!709) i!563 k!794) (size!13394 _keys!709)))))

(declare-fun b!442189 () Bool)

(declare-fun res!261907 () Bool)

(assert (=> b!442189 (=> (not res!261907) (not e!260263))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!442189 (= res!261907 (validKeyInArray!0 k!794))))

(declare-fun b!442190 () Bool)

(declare-fun res!261909 () Bool)

(assert (=> b!442190 (=> (not res!261909) (not e!260262))))

(assert (=> b!442190 (= res!261909 (bvsle from!863 i!563))))

(declare-fun minValue!515 () V!16687)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16687)

(declare-fun bm!29530 () Bool)

(declare-fun c!55805 () Bool)

(declare-fun lt!203107 () array!27187)

(declare-datatypes ((tuple2!7836 0))(
  ( (tuple2!7837 (_1!3929 (_ BitVec 64)) (_2!3929 V!16687)) )
))
(declare-datatypes ((List!7834 0))(
  ( (Nil!7831) (Cons!7830 (h!8686 tuple2!7836) (t!13590 List!7834)) )
))
(declare-datatypes ((ListLongMap!6749 0))(
  ( (ListLongMap!6750 (toList!3390 List!7834)) )
))
(declare-fun call!29534 () ListLongMap!6749)

(declare-fun getCurrentListMapNoExtraKeys!1579 (array!27185 array!27187 (_ BitVec 32) (_ BitVec 32) V!16687 V!16687 (_ BitVec 32) Int) ListLongMap!6749)

(assert (=> bm!29530 (= call!29534 (getCurrentListMapNoExtraKeys!1579 (ite c!55805 _keys!709 lt!203105) (ite c!55805 _values!549 lt!203107) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!442191 () Bool)

(declare-fun e!260260 () Bool)

(declare-fun call!29533 () ListLongMap!6749)

(assert (=> b!442191 (= e!260260 (= call!29534 call!29533))))

(declare-fun bm!29531 () Bool)

(assert (=> bm!29531 (= call!29533 (getCurrentListMapNoExtraKeys!1579 (ite c!55805 lt!203105 _keys!709) (ite c!55805 lt!203107 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!442192 () Bool)

(declare-fun res!261898 () Bool)

(assert (=> b!442192 (=> (not res!261898) (not e!260263))))

(assert (=> b!442192 (= res!261898 (and (= (size!13395 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13394 _keys!709) (size!13395 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!442193 () Bool)

(declare-fun e!260261 () Bool)

(assert (=> b!442193 (= e!260261 (not (not (validKeyInArray!0 (select (arr!13042 _keys!709) from!863)))))))

(assert (=> b!442193 e!260260))

(assert (=> b!442193 (= c!55805 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun v!412 () V!16687)

(declare-datatypes ((Unit!13152 0))(
  ( (Unit!13153) )
))
(declare-fun lt!203106 () Unit!13152)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!693 (array!27185 array!27187 (_ BitVec 32) (_ BitVec 32) V!16687 V!16687 (_ BitVec 32) (_ BitVec 64) V!16687 (_ BitVec 32) Int) Unit!13152)

(assert (=> b!442193 (= lt!203106 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!693 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!442194 () Bool)

(declare-fun res!261903 () Bool)

(assert (=> b!442194 (=> (not res!261903) (not e!260263))))

(assert (=> b!442194 (= res!261903 (or (= (select (arr!13042 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13042 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19152 () Bool)

(declare-fun tp!37124 () Bool)

(declare-fun e!260259 () Bool)

(assert (=> mapNonEmpty!19152 (= mapRes!19152 (and tp!37124 e!260259))))

(declare-fun mapKey!19152 () (_ BitVec 32))

(declare-fun mapRest!19152 () (Array (_ BitVec 32) ValueCell!5500))

(declare-fun mapValue!19152 () ValueCell!5500)

(assert (=> mapNonEmpty!19152 (= (arr!13043 _values!549) (store mapRest!19152 mapKey!19152 mapValue!19152))))

(declare-fun b!442195 () Bool)

(assert (=> b!442195 (= e!260259 tp_is_empty!11687)))

(declare-fun b!442196 () Bool)

(assert (=> b!442196 (= e!260262 e!260261)))

(declare-fun res!261897 () Bool)

(assert (=> b!442196 (=> (not res!261897) (not e!260261))))

(assert (=> b!442196 (= res!261897 (= from!863 i!563))))

(declare-fun lt!203104 () ListLongMap!6749)

(assert (=> b!442196 (= lt!203104 (getCurrentListMapNoExtraKeys!1579 lt!203105 lt!203107 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!442196 (= lt!203107 (array!27188 (store (arr!13043 _values!549) i!563 (ValueCellFull!5500 v!412)) (size!13395 _values!549)))))

(declare-fun lt!203108 () ListLongMap!6749)

(assert (=> b!442196 (= lt!203108 (getCurrentListMapNoExtraKeys!1579 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!442197 () Bool)

(declare-fun e!260264 () Bool)

(assert (=> b!442197 (= e!260264 tp_is_empty!11687)))

(declare-fun b!442198 () Bool)

(declare-fun res!261906 () Bool)

(assert (=> b!442198 (=> (not res!261906) (not e!260263))))

(assert (=> b!442198 (= res!261906 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13394 _keys!709))))))

(declare-fun b!442199 () Bool)

(declare-fun res!261900 () Bool)

(assert (=> b!442199 (=> (not res!261900) (not e!260263))))

(declare-fun arrayContainsKey!0 (array!27185 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!442199 (= res!261900 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!442200 () Bool)

(assert (=> b!442200 (= e!260265 (and e!260264 mapRes!19152))))

(declare-fun condMapEmpty!19152 () Bool)

(declare-fun mapDefault!19152 () ValueCell!5500)

