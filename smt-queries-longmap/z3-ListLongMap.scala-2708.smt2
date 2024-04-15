; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40052 () Bool)

(assert start!40052)

(declare-fun b_free!10333 () Bool)

(declare-fun b_next!10333 () Bool)

(assert (=> start!40052 (= b_free!10333 (not b_next!10333))))

(declare-fun tp!36527 () Bool)

(declare-fun b_and!18275 () Bool)

(assert (=> start!40052 (= tp!36527 b_and!18275)))

(declare-fun res!257866 () Bool)

(declare-fun e!257969 () Bool)

(assert (=> start!40052 (=> (not res!257866) (not e!257969))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!26791 0))(
  ( (array!26792 (arr!12845 (Array (_ BitVec 32) (_ BitVec 64))) (size!13198 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26791)

(assert (=> start!40052 (= res!257866 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13198 _keys!709))))))

(assert (=> start!40052 e!257969))

(declare-fun tp_is_empty!11485 () Bool)

(assert (=> start!40052 tp_is_empty!11485))

(assert (=> start!40052 tp!36527))

(assert (=> start!40052 true))

(declare-datatypes ((V!16419 0))(
  ( (V!16420 (val!5787 Int)) )
))
(declare-datatypes ((ValueCell!5399 0))(
  ( (ValueCellFull!5399 (v!8028 V!16419)) (EmptyCell!5399) )
))
(declare-datatypes ((array!26793 0))(
  ( (array!26794 (arr!12846 (Array (_ BitVec 32) ValueCell!5399)) (size!13199 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26793)

(declare-fun e!257965 () Bool)

(declare-fun array_inv!9382 (array!26793) Bool)

(assert (=> start!40052 (and (array_inv!9382 _values!549) e!257965)))

(declare-fun array_inv!9383 (array!26791) Bool)

(assert (=> start!40052 (array_inv!9383 _keys!709)))

(declare-fun mapNonEmpty!18849 () Bool)

(declare-fun mapRes!18849 () Bool)

(declare-fun tp!36528 () Bool)

(declare-fun e!257970 () Bool)

(assert (=> mapNonEmpty!18849 (= mapRes!18849 (and tp!36528 e!257970))))

(declare-fun mapRest!18849 () (Array (_ BitVec 32) ValueCell!5399))

(declare-fun mapValue!18849 () ValueCell!5399)

(declare-fun mapKey!18849 () (_ BitVec 32))

(assert (=> mapNonEmpty!18849 (= (arr!12846 _values!549) (store mapRest!18849 mapKey!18849 mapValue!18849))))

(declare-fun mapIsEmpty!18849 () Bool)

(assert (=> mapIsEmpty!18849 mapRes!18849))

(declare-fun b!437077 () Bool)

(declare-fun res!257865 () Bool)

(assert (=> b!437077 (=> (not res!257865) (not e!257969))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!437077 (= res!257865 (validMask!0 mask!1025))))

(declare-fun b!437078 () Bool)

(declare-fun res!257868 () Bool)

(assert (=> b!437078 (=> (not res!257868) (not e!257969))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!437078 (= res!257868 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13198 _keys!709))))))

(declare-fun b!437079 () Bool)

(assert (=> b!437079 (= e!257970 tp_is_empty!11485)))

(declare-fun b!437080 () Bool)

(declare-fun res!257864 () Bool)

(assert (=> b!437080 (=> (not res!257864) (not e!257969))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26791 (_ BitVec 32)) Bool)

(assert (=> b!437080 (= res!257864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!437081 () Bool)

(declare-fun res!257861 () Bool)

(assert (=> b!437081 (=> (not res!257861) (not e!257969))))

(declare-datatypes ((List!7672 0))(
  ( (Nil!7669) (Cons!7668 (h!8524 (_ BitVec 64)) (t!13419 List!7672)) )
))
(declare-fun arrayNoDuplicates!0 (array!26791 (_ BitVec 32) List!7672) Bool)

(assert (=> b!437081 (= res!257861 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7669))))

(declare-fun b!437082 () Bool)

(declare-fun e!257966 () Bool)

(assert (=> b!437082 (= e!257966 (not true))))

(declare-fun lt!201384 () array!26791)

(declare-fun minValue!515 () V!16419)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16419)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!201385 () array!26793)

(declare-fun v!412 () V!16419)

(declare-datatypes ((tuple2!7686 0))(
  ( (tuple2!7687 (_1!3854 (_ BitVec 64)) (_2!3854 V!16419)) )
))
(declare-datatypes ((List!7673 0))(
  ( (Nil!7670) (Cons!7669 (h!8525 tuple2!7686) (t!13420 List!7673)) )
))
(declare-datatypes ((ListLongMap!6589 0))(
  ( (ListLongMap!6590 (toList!3310 List!7673)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1509 (array!26791 array!26793 (_ BitVec 32) (_ BitVec 32) V!16419 V!16419 (_ BitVec 32) Int) ListLongMap!6589)

(declare-fun +!1483 (ListLongMap!6589 tuple2!7686) ListLongMap!6589)

(assert (=> b!437082 (= (getCurrentListMapNoExtraKeys!1509 lt!201384 lt!201385 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1483 (getCurrentListMapNoExtraKeys!1509 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7687 k0!794 v!412)))))

(declare-datatypes ((Unit!12983 0))(
  ( (Unit!12984) )
))
(declare-fun lt!201386 () Unit!12983)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!621 (array!26791 array!26793 (_ BitVec 32) (_ BitVec 32) V!16419 V!16419 (_ BitVec 32) (_ BitVec 64) V!16419 (_ BitVec 32) Int) Unit!12983)

(assert (=> b!437082 (= lt!201386 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!621 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!437083 () Bool)

(declare-fun res!257863 () Bool)

(declare-fun e!257967 () Bool)

(assert (=> b!437083 (=> (not res!257863) (not e!257967))))

(assert (=> b!437083 (= res!257863 (bvsle from!863 i!563))))

(declare-fun b!437084 () Bool)

(declare-fun res!257862 () Bool)

(assert (=> b!437084 (=> (not res!257862) (not e!257967))))

(assert (=> b!437084 (= res!257862 (arrayNoDuplicates!0 lt!201384 #b00000000000000000000000000000000 Nil!7669))))

(declare-fun b!437085 () Bool)

(declare-fun res!257856 () Bool)

(assert (=> b!437085 (=> (not res!257856) (not e!257969))))

(declare-fun arrayContainsKey!0 (array!26791 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!437085 (= res!257856 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!437086 () Bool)

(declare-fun e!257968 () Bool)

(assert (=> b!437086 (= e!257968 tp_is_empty!11485)))

(declare-fun b!437087 () Bool)

(declare-fun res!257859 () Bool)

(assert (=> b!437087 (=> (not res!257859) (not e!257969))))

(assert (=> b!437087 (= res!257859 (and (= (size!13199 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13198 _keys!709) (size!13199 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!437088 () Bool)

(declare-fun res!257867 () Bool)

(assert (=> b!437088 (=> (not res!257867) (not e!257969))))

(assert (=> b!437088 (= res!257867 (or (= (select (arr!12845 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12845 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!437089 () Bool)

(declare-fun res!257857 () Bool)

(assert (=> b!437089 (=> (not res!257857) (not e!257969))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!437089 (= res!257857 (validKeyInArray!0 k0!794))))

(declare-fun b!437090 () Bool)

(assert (=> b!437090 (= e!257969 e!257967)))

(declare-fun res!257860 () Bool)

(assert (=> b!437090 (=> (not res!257860) (not e!257967))))

(assert (=> b!437090 (= res!257860 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201384 mask!1025))))

(assert (=> b!437090 (= lt!201384 (array!26792 (store (arr!12845 _keys!709) i!563 k0!794) (size!13198 _keys!709)))))

(declare-fun b!437091 () Bool)

(assert (=> b!437091 (= e!257967 e!257966)))

(declare-fun res!257858 () Bool)

(assert (=> b!437091 (=> (not res!257858) (not e!257966))))

(assert (=> b!437091 (= res!257858 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!201383 () ListLongMap!6589)

(assert (=> b!437091 (= lt!201383 (getCurrentListMapNoExtraKeys!1509 lt!201384 lt!201385 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!437091 (= lt!201385 (array!26794 (store (arr!12846 _values!549) i!563 (ValueCellFull!5399 v!412)) (size!13199 _values!549)))))

(declare-fun lt!201382 () ListLongMap!6589)

(assert (=> b!437091 (= lt!201382 (getCurrentListMapNoExtraKeys!1509 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!437092 () Bool)

(assert (=> b!437092 (= e!257965 (and e!257968 mapRes!18849))))

(declare-fun condMapEmpty!18849 () Bool)

(declare-fun mapDefault!18849 () ValueCell!5399)

(assert (=> b!437092 (= condMapEmpty!18849 (= (arr!12846 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5399)) mapDefault!18849)))))

(assert (= (and start!40052 res!257866) b!437077))

(assert (= (and b!437077 res!257865) b!437087))

(assert (= (and b!437087 res!257859) b!437080))

(assert (= (and b!437080 res!257864) b!437081))

(assert (= (and b!437081 res!257861) b!437078))

(assert (= (and b!437078 res!257868) b!437089))

(assert (= (and b!437089 res!257857) b!437088))

(assert (= (and b!437088 res!257867) b!437085))

(assert (= (and b!437085 res!257856) b!437090))

(assert (= (and b!437090 res!257860) b!437084))

(assert (= (and b!437084 res!257862) b!437083))

(assert (= (and b!437083 res!257863) b!437091))

(assert (= (and b!437091 res!257858) b!437082))

(assert (= (and b!437092 condMapEmpty!18849) mapIsEmpty!18849))

(assert (= (and b!437092 (not condMapEmpty!18849)) mapNonEmpty!18849))

(get-info :version)

(assert (= (and mapNonEmpty!18849 ((_ is ValueCellFull!5399) mapValue!18849)) b!437079))

(assert (= (and b!437092 ((_ is ValueCellFull!5399) mapDefault!18849)) b!437086))

(assert (= start!40052 b!437092))

(declare-fun m!424305 () Bool)

(assert (=> b!437088 m!424305))

(declare-fun m!424307 () Bool)

(assert (=> mapNonEmpty!18849 m!424307))

(declare-fun m!424309 () Bool)

(assert (=> b!437084 m!424309))

(declare-fun m!424311 () Bool)

(assert (=> b!437077 m!424311))

(declare-fun m!424313 () Bool)

(assert (=> b!437089 m!424313))

(declare-fun m!424315 () Bool)

(assert (=> b!437085 m!424315))

(declare-fun m!424317 () Bool)

(assert (=> b!437081 m!424317))

(declare-fun m!424319 () Bool)

(assert (=> b!437091 m!424319))

(declare-fun m!424321 () Bool)

(assert (=> b!437091 m!424321))

(declare-fun m!424323 () Bool)

(assert (=> b!437091 m!424323))

(declare-fun m!424325 () Bool)

(assert (=> b!437080 m!424325))

(declare-fun m!424327 () Bool)

(assert (=> start!40052 m!424327))

(declare-fun m!424329 () Bool)

(assert (=> start!40052 m!424329))

(declare-fun m!424331 () Bool)

(assert (=> b!437090 m!424331))

(declare-fun m!424333 () Bool)

(assert (=> b!437090 m!424333))

(declare-fun m!424335 () Bool)

(assert (=> b!437082 m!424335))

(declare-fun m!424337 () Bool)

(assert (=> b!437082 m!424337))

(assert (=> b!437082 m!424337))

(declare-fun m!424339 () Bool)

(assert (=> b!437082 m!424339))

(declare-fun m!424341 () Bool)

(assert (=> b!437082 m!424341))

(check-sat (not b!437077) (not start!40052) (not b!437091) (not b!437082) (not b_next!10333) (not b!437080) (not b!437081) (not b!437090) (not b!437085) (not b!437089) tp_is_empty!11485 b_and!18275 (not b!437084) (not mapNonEmpty!18849))
(check-sat b_and!18275 (not b_next!10333))
