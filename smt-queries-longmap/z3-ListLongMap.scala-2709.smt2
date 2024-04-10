; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40074 () Bool)

(assert start!40074)

(declare-fun b_free!10341 () Bool)

(declare-fun b_next!10341 () Bool)

(assert (=> start!40074 (= b_free!10341 (not b_next!10341))))

(declare-fun tp!36551 () Bool)

(declare-fun b_and!18309 () Bool)

(assert (=> start!40074 (= tp!36551 b_and!18309)))

(declare-fun b!437540 () Bool)

(declare-fun res!258148 () Bool)

(declare-fun e!258223 () Bool)

(assert (=> b!437540 (=> (not res!258148) (not e!258223))))

(declare-datatypes ((array!26805 0))(
  ( (array!26806 (arr!12852 (Array (_ BitVec 32) (_ BitVec 64))) (size!13204 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26805)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26805 (_ BitVec 32)) Bool)

(assert (=> b!437540 (= res!258148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!437541 () Bool)

(declare-fun res!258152 () Bool)

(assert (=> b!437541 (=> (not res!258152) (not e!258223))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!437541 (= res!258152 (validKeyInArray!0 k0!794))))

(declare-fun b!437542 () Bool)

(declare-fun res!258141 () Bool)

(declare-fun e!258228 () Bool)

(assert (=> b!437542 (=> (not res!258141) (not e!258228))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!437542 (= res!258141 (bvsle from!863 i!563))))

(declare-fun b!437543 () Bool)

(declare-fun e!258224 () Bool)

(declare-fun tp_is_empty!11493 () Bool)

(assert (=> b!437543 (= e!258224 tp_is_empty!11493)))

(declare-fun b!437544 () Bool)

(declare-fun e!258227 () Bool)

(declare-fun mapRes!18861 () Bool)

(assert (=> b!437544 (= e!258227 (and e!258224 mapRes!18861))))

(declare-fun condMapEmpty!18861 () Bool)

(declare-datatypes ((V!16429 0))(
  ( (V!16430 (val!5791 Int)) )
))
(declare-datatypes ((ValueCell!5403 0))(
  ( (ValueCellFull!5403 (v!8038 V!16429)) (EmptyCell!5403) )
))
(declare-datatypes ((array!26807 0))(
  ( (array!26808 (arr!12853 (Array (_ BitVec 32) ValueCell!5403)) (size!13205 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26807)

(declare-fun mapDefault!18861 () ValueCell!5403)

(assert (=> b!437544 (= condMapEmpty!18861 (= (arr!12853 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5403)) mapDefault!18861)))))

(declare-fun b!437545 () Bool)

(declare-fun res!258144 () Bool)

(assert (=> b!437545 (=> (not res!258144) (not e!258228))))

(declare-fun lt!201677 () array!26805)

(declare-datatypes ((List!7674 0))(
  ( (Nil!7671) (Cons!7670 (h!8526 (_ BitVec 64)) (t!13430 List!7674)) )
))
(declare-fun arrayNoDuplicates!0 (array!26805 (_ BitVec 32) List!7674) Bool)

(assert (=> b!437545 (= res!258144 (arrayNoDuplicates!0 lt!201677 #b00000000000000000000000000000000 Nil!7671))))

(declare-fun b!437546 () Bool)

(declare-fun e!258226 () Bool)

(assert (=> b!437546 (= e!258228 e!258226)))

(declare-fun res!258146 () Bool)

(assert (=> b!437546 (=> (not res!258146) (not e!258226))))

(assert (=> b!437546 (= res!258146 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16429)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!201680 () array!26807)

(declare-fun zeroValue!515 () V!16429)

(declare-datatypes ((tuple2!7674 0))(
  ( (tuple2!7675 (_1!3848 (_ BitVec 64)) (_2!3848 V!16429)) )
))
(declare-datatypes ((List!7675 0))(
  ( (Nil!7672) (Cons!7671 (h!8527 tuple2!7674) (t!13431 List!7675)) )
))
(declare-datatypes ((ListLongMap!6587 0))(
  ( (ListLongMap!6588 (toList!3309 List!7675)) )
))
(declare-fun lt!201676 () ListLongMap!6587)

(declare-fun getCurrentListMapNoExtraKeys!1498 (array!26805 array!26807 (_ BitVec 32) (_ BitVec 32) V!16429 V!16429 (_ BitVec 32) Int) ListLongMap!6587)

(assert (=> b!437546 (= lt!201676 (getCurrentListMapNoExtraKeys!1498 lt!201677 lt!201680 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16429)

(assert (=> b!437546 (= lt!201680 (array!26808 (store (arr!12853 _values!549) i!563 (ValueCellFull!5403 v!412)) (size!13205 _values!549)))))

(declare-fun lt!201678 () ListLongMap!6587)

(assert (=> b!437546 (= lt!201678 (getCurrentListMapNoExtraKeys!1498 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!437547 () Bool)

(declare-fun res!258151 () Bool)

(assert (=> b!437547 (=> (not res!258151) (not e!258223))))

(declare-fun arrayContainsKey!0 (array!26805 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!437547 (= res!258151 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!437548 () Bool)

(declare-fun res!258142 () Bool)

(assert (=> b!437548 (=> (not res!258142) (not e!258223))))

(assert (=> b!437548 (= res!258142 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7671))))

(declare-fun mapIsEmpty!18861 () Bool)

(assert (=> mapIsEmpty!18861 mapRes!18861))

(declare-fun mapNonEmpty!18861 () Bool)

(declare-fun tp!36552 () Bool)

(declare-fun e!258225 () Bool)

(assert (=> mapNonEmpty!18861 (= mapRes!18861 (and tp!36552 e!258225))))

(declare-fun mapValue!18861 () ValueCell!5403)

(declare-fun mapRest!18861 () (Array (_ BitVec 32) ValueCell!5403))

(declare-fun mapKey!18861 () (_ BitVec 32))

(assert (=> mapNonEmpty!18861 (= (arr!12853 _values!549) (store mapRest!18861 mapKey!18861 mapValue!18861))))

(declare-fun b!437550 () Bool)

(declare-fun res!258153 () Bool)

(assert (=> b!437550 (=> (not res!258153) (not e!258223))))

(assert (=> b!437550 (= res!258153 (or (= (select (arr!12852 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12852 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!437551 () Bool)

(assert (=> b!437551 (= e!258226 (not true))))

(declare-fun +!1453 (ListLongMap!6587 tuple2!7674) ListLongMap!6587)

(assert (=> b!437551 (= (getCurrentListMapNoExtraKeys!1498 lt!201677 lt!201680 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1453 (getCurrentListMapNoExtraKeys!1498 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7675 k0!794 v!412)))))

(declare-datatypes ((Unit!13010 0))(
  ( (Unit!13011) )
))
(declare-fun lt!201679 () Unit!13010)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!622 (array!26805 array!26807 (_ BitVec 32) (_ BitVec 32) V!16429 V!16429 (_ BitVec 32) (_ BitVec 64) V!16429 (_ BitVec 32) Int) Unit!13010)

(assert (=> b!437551 (= lt!201679 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!622 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!437552 () Bool)

(declare-fun res!258150 () Bool)

(assert (=> b!437552 (=> (not res!258150) (not e!258223))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!437552 (= res!258150 (validMask!0 mask!1025))))

(declare-fun b!437553 () Bool)

(assert (=> b!437553 (= e!258223 e!258228)))

(declare-fun res!258145 () Bool)

(assert (=> b!437553 (=> (not res!258145) (not e!258228))))

(assert (=> b!437553 (= res!258145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201677 mask!1025))))

(assert (=> b!437553 (= lt!201677 (array!26806 (store (arr!12852 _keys!709) i!563 k0!794) (size!13204 _keys!709)))))

(declare-fun b!437554 () Bool)

(assert (=> b!437554 (= e!258225 tp_is_empty!11493)))

(declare-fun b!437555 () Bool)

(declare-fun res!258143 () Bool)

(assert (=> b!437555 (=> (not res!258143) (not e!258223))))

(assert (=> b!437555 (= res!258143 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13204 _keys!709))))))

(declare-fun b!437549 () Bool)

(declare-fun res!258147 () Bool)

(assert (=> b!437549 (=> (not res!258147) (not e!258223))))

(assert (=> b!437549 (= res!258147 (and (= (size!13205 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13204 _keys!709) (size!13205 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!258149 () Bool)

(assert (=> start!40074 (=> (not res!258149) (not e!258223))))

(assert (=> start!40074 (= res!258149 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13204 _keys!709))))))

(assert (=> start!40074 e!258223))

(assert (=> start!40074 tp_is_empty!11493))

(assert (=> start!40074 tp!36551))

(assert (=> start!40074 true))

(declare-fun array_inv!9336 (array!26807) Bool)

(assert (=> start!40074 (and (array_inv!9336 _values!549) e!258227)))

(declare-fun array_inv!9337 (array!26805) Bool)

(assert (=> start!40074 (array_inv!9337 _keys!709)))

(assert (= (and start!40074 res!258149) b!437552))

(assert (= (and b!437552 res!258150) b!437549))

(assert (= (and b!437549 res!258147) b!437540))

(assert (= (and b!437540 res!258148) b!437548))

(assert (= (and b!437548 res!258142) b!437555))

(assert (= (and b!437555 res!258143) b!437541))

(assert (= (and b!437541 res!258152) b!437550))

(assert (= (and b!437550 res!258153) b!437547))

(assert (= (and b!437547 res!258151) b!437553))

(assert (= (and b!437553 res!258145) b!437545))

(assert (= (and b!437545 res!258144) b!437542))

(assert (= (and b!437542 res!258141) b!437546))

(assert (= (and b!437546 res!258146) b!437551))

(assert (= (and b!437544 condMapEmpty!18861) mapIsEmpty!18861))

(assert (= (and b!437544 (not condMapEmpty!18861)) mapNonEmpty!18861))

(get-info :version)

(assert (= (and mapNonEmpty!18861 ((_ is ValueCellFull!5403) mapValue!18861)) b!437554))

(assert (= (and b!437544 ((_ is ValueCellFull!5403) mapDefault!18861)) b!437543))

(assert (= start!40074 b!437544))

(declare-fun m!425189 () Bool)

(assert (=> b!437540 m!425189))

(declare-fun m!425191 () Bool)

(assert (=> b!437548 m!425191))

(declare-fun m!425193 () Bool)

(assert (=> b!437552 m!425193))

(declare-fun m!425195 () Bool)

(assert (=> mapNonEmpty!18861 m!425195))

(declare-fun m!425197 () Bool)

(assert (=> b!437541 m!425197))

(declare-fun m!425199 () Bool)

(assert (=> b!437545 m!425199))

(declare-fun m!425201 () Bool)

(assert (=> b!437553 m!425201))

(declare-fun m!425203 () Bool)

(assert (=> b!437553 m!425203))

(declare-fun m!425205 () Bool)

(assert (=> b!437550 m!425205))

(declare-fun m!425207 () Bool)

(assert (=> start!40074 m!425207))

(declare-fun m!425209 () Bool)

(assert (=> start!40074 m!425209))

(declare-fun m!425211 () Bool)

(assert (=> b!437551 m!425211))

(declare-fun m!425213 () Bool)

(assert (=> b!437551 m!425213))

(assert (=> b!437551 m!425213))

(declare-fun m!425215 () Bool)

(assert (=> b!437551 m!425215))

(declare-fun m!425217 () Bool)

(assert (=> b!437551 m!425217))

(declare-fun m!425219 () Bool)

(assert (=> b!437546 m!425219))

(declare-fun m!425221 () Bool)

(assert (=> b!437546 m!425221))

(declare-fun m!425223 () Bool)

(assert (=> b!437546 m!425223))

(declare-fun m!425225 () Bool)

(assert (=> b!437547 m!425225))

(check-sat (not b!437540) b_and!18309 (not mapNonEmpty!18861) (not b_next!10341) tp_is_empty!11493 (not b!437546) (not start!40074) (not b!437553) (not b!437547) (not b!437545) (not b!437548) (not b!437541) (not b!437552) (not b!437551))
(check-sat b_and!18309 (not b_next!10341))
