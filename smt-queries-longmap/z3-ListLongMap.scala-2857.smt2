; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41158 () Bool)

(assert start!41158)

(declare-fun b_free!11041 () Bool)

(declare-fun b_next!11041 () Bool)

(assert (=> start!41158 (= b_free!11041 (not b_next!11041))))

(declare-fun tp!38958 () Bool)

(declare-fun b_and!19331 () Bool)

(assert (=> start!41158 (= tp!38958 b_and!19331)))

(declare-fun b!460000 () Bool)

(declare-fun res!275016 () Bool)

(declare-fun e!268404 () Bool)

(assert (=> b!460000 (=> (not res!275016) (not e!268404))))

(declare-datatypes ((array!28552 0))(
  ( (array!28553 (arr!13716 (Array (_ BitVec 32) (_ BitVec 64))) (size!14068 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28552)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((V!17611 0))(
  ( (V!17612 (val!6234 Int)) )
))
(declare-datatypes ((ValueCell!5846 0))(
  ( (ValueCellFull!5846 (v!8513 V!17611)) (EmptyCell!5846) )
))
(declare-datatypes ((array!28554 0))(
  ( (array!28555 (arr!13717 (Array (_ BitVec 32) ValueCell!5846)) (size!14069 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28554)

(assert (=> b!460000 (= res!275016 (and (= (size!14069 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14068 _keys!709) (size!14069 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!460001 () Bool)

(declare-datatypes ((Unit!13371 0))(
  ( (Unit!13372) )
))
(declare-fun e!268407 () Unit!13371)

(declare-fun Unit!13373 () Unit!13371)

(assert (=> b!460001 (= e!268407 Unit!13373)))

(declare-fun b!460002 () Bool)

(declare-fun res!275008 () Bool)

(declare-fun e!268409 () Bool)

(assert (=> b!460002 (=> (not res!275008) (not e!268409))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!460002 (= res!275008 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!20218 () Bool)

(declare-fun mapRes!20218 () Bool)

(declare-fun tp!38959 () Bool)

(declare-fun e!268401 () Bool)

(assert (=> mapNonEmpty!20218 (= mapRes!20218 (and tp!38959 e!268401))))

(declare-fun mapRest!20218 () (Array (_ BitVec 32) ValueCell!5846))

(declare-fun mapValue!20218 () ValueCell!5846)

(declare-fun mapKey!20218 () (_ BitVec 32))

(assert (=> mapNonEmpty!20218 (= (arr!13717 _values!549) (store mapRest!20218 mapKey!20218 mapValue!20218))))

(declare-fun b!460003 () Bool)

(declare-fun e!268403 () Bool)

(declare-fun e!268402 () Bool)

(assert (=> b!460003 (= e!268403 e!268402)))

(declare-fun res!275018 () Bool)

(assert (=> b!460003 (=> res!275018 e!268402)))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!460003 (= res!275018 (= k0!794 (select (arr!13716 _keys!709) from!863)))))

(assert (=> b!460003 (not (= (select (arr!13716 _keys!709) from!863) k0!794))))

(declare-fun lt!208240 () Unit!13371)

(assert (=> b!460003 (= lt!208240 e!268407)))

(declare-fun c!56483 () Bool)

(assert (=> b!460003 (= c!56483 (= (select (arr!13716 _keys!709) from!863) k0!794))))

(declare-datatypes ((tuple2!8146 0))(
  ( (tuple2!8147 (_1!4084 (_ BitVec 64)) (_2!4084 V!17611)) )
))
(declare-datatypes ((List!8211 0))(
  ( (Nil!8208) (Cons!8207 (h!9063 tuple2!8146) (t!14123 List!8211)) )
))
(declare-datatypes ((ListLongMap!7061 0))(
  ( (ListLongMap!7062 (toList!3546 List!8211)) )
))
(declare-fun lt!208248 () ListLongMap!7061)

(declare-fun lt!208244 () ListLongMap!7061)

(assert (=> b!460003 (= lt!208248 lt!208244)))

(declare-fun lt!208239 () ListLongMap!7061)

(declare-fun lt!208245 () tuple2!8146)

(declare-fun +!1622 (ListLongMap!7061 tuple2!8146) ListLongMap!7061)

(assert (=> b!460003 (= lt!208244 (+!1622 lt!208239 lt!208245))))

(declare-fun lt!208247 () V!17611)

(assert (=> b!460003 (= lt!208245 (tuple2!8147 (select (arr!13716 _keys!709) from!863) lt!208247))))

(declare-fun defaultEntry!557 () Int)

(declare-fun get!6772 (ValueCell!5846 V!17611) V!17611)

(declare-fun dynLambda!898 (Int (_ BitVec 64)) V!17611)

(assert (=> b!460003 (= lt!208247 (get!6772 (select (arr!13717 _values!549) from!863) (dynLambda!898 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460004 () Bool)

(assert (=> b!460004 (= e!268404 e!268409)))

(declare-fun res!275017 () Bool)

(assert (=> b!460004 (=> (not res!275017) (not e!268409))))

(declare-fun lt!208253 () array!28552)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28552 (_ BitVec 32)) Bool)

(assert (=> b!460004 (= res!275017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!208253 mask!1025))))

(assert (=> b!460004 (= lt!208253 (array!28553 (store (arr!13716 _keys!709) i!563 k0!794) (size!14068 _keys!709)))))

(declare-fun b!460005 () Bool)

(declare-fun res!275007 () Bool)

(assert (=> b!460005 (=> (not res!275007) (not e!268404))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!460005 (= res!275007 (validMask!0 mask!1025))))

(declare-fun b!460006 () Bool)

(declare-fun e!268408 () Bool)

(assert (=> b!460006 (= e!268409 e!268408)))

(declare-fun res!275009 () Bool)

(assert (=> b!460006 (=> (not res!275009) (not e!268408))))

(assert (=> b!460006 (= res!275009 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!208251 () array!28554)

(declare-fun minValue!515 () V!17611)

(declare-fun zeroValue!515 () V!17611)

(declare-fun getCurrentListMapNoExtraKeys!1774 (array!28552 array!28554 (_ BitVec 32) (_ BitVec 32) V!17611 V!17611 (_ BitVec 32) Int) ListLongMap!7061)

(assert (=> b!460006 (= lt!208248 (getCurrentListMapNoExtraKeys!1774 lt!208253 lt!208251 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17611)

(assert (=> b!460006 (= lt!208251 (array!28555 (store (arr!13717 _values!549) i!563 (ValueCellFull!5846 v!412)) (size!14069 _values!549)))))

(declare-fun lt!208246 () ListLongMap!7061)

(assert (=> b!460006 (= lt!208246 (getCurrentListMapNoExtraKeys!1774 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!460007 () Bool)

(declare-fun tp_is_empty!12379 () Bool)

(assert (=> b!460007 (= e!268401 tp_is_empty!12379)))

(declare-fun b!460008 () Bool)

(declare-fun res!275015 () Bool)

(assert (=> b!460008 (=> (not res!275015) (not e!268404))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!460008 (= res!275015 (validKeyInArray!0 k0!794))))

(declare-fun b!460009 () Bool)

(assert (=> b!460009 (= e!268402 (bvslt i!563 (size!14069 _values!549)))))

(declare-fun lt!208249 () ListLongMap!7061)

(declare-fun lt!208242 () tuple2!8146)

(assert (=> b!460009 (= lt!208244 (+!1622 (+!1622 lt!208249 lt!208245) lt!208242))))

(declare-fun lt!208241 () Unit!13371)

(declare-fun addCommutativeForDiffKeys!421 (ListLongMap!7061 (_ BitVec 64) V!17611 (_ BitVec 64) V!17611) Unit!13371)

(assert (=> b!460009 (= lt!208241 (addCommutativeForDiffKeys!421 lt!208249 k0!794 v!412 (select (arr!13716 _keys!709) from!863) lt!208247))))

(declare-fun b!460010 () Bool)

(declare-fun Unit!13374 () Unit!13371)

(assert (=> b!460010 (= e!268407 Unit!13374)))

(declare-fun lt!208250 () Unit!13371)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28552 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13371)

(assert (=> b!460010 (= lt!208250 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!460010 false))

(declare-fun b!460011 () Bool)

(declare-fun res!275010 () Bool)

(assert (=> b!460011 (=> (not res!275010) (not e!268409))))

(declare-datatypes ((List!8212 0))(
  ( (Nil!8209) (Cons!8208 (h!9064 (_ BitVec 64)) (t!14124 List!8212)) )
))
(declare-fun arrayNoDuplicates!0 (array!28552 (_ BitVec 32) List!8212) Bool)

(assert (=> b!460011 (= res!275010 (arrayNoDuplicates!0 lt!208253 #b00000000000000000000000000000000 Nil!8209))))

(declare-fun b!460012 () Bool)

(assert (=> b!460012 (= e!268408 (not e!268403))))

(declare-fun res!275019 () Bool)

(assert (=> b!460012 (=> res!275019 e!268403)))

(assert (=> b!460012 (= res!275019 (not (validKeyInArray!0 (select (arr!13716 _keys!709) from!863))))))

(declare-fun lt!208243 () ListLongMap!7061)

(assert (=> b!460012 (= lt!208243 lt!208239)))

(assert (=> b!460012 (= lt!208239 (+!1622 lt!208249 lt!208242))))

(assert (=> b!460012 (= lt!208243 (getCurrentListMapNoExtraKeys!1774 lt!208253 lt!208251 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!460012 (= lt!208242 (tuple2!8147 k0!794 v!412))))

(assert (=> b!460012 (= lt!208249 (getCurrentListMapNoExtraKeys!1774 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!208252 () Unit!13371)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!778 (array!28552 array!28554 (_ BitVec 32) (_ BitVec 32) V!17611 V!17611 (_ BitVec 32) (_ BitVec 64) V!17611 (_ BitVec 32) Int) Unit!13371)

(assert (=> b!460012 (= lt!208252 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!778 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!275006 () Bool)

(assert (=> start!41158 (=> (not res!275006) (not e!268404))))

(assert (=> start!41158 (= res!275006 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14068 _keys!709))))))

(assert (=> start!41158 e!268404))

(assert (=> start!41158 tp_is_empty!12379))

(assert (=> start!41158 tp!38958))

(assert (=> start!41158 true))

(declare-fun e!268406 () Bool)

(declare-fun array_inv!10002 (array!28554) Bool)

(assert (=> start!41158 (and (array_inv!10002 _values!549) e!268406)))

(declare-fun array_inv!10003 (array!28552) Bool)

(assert (=> start!41158 (array_inv!10003 _keys!709)))

(declare-fun b!460013 () Bool)

(declare-fun res!275012 () Bool)

(assert (=> b!460013 (=> (not res!275012) (not e!268404))))

(assert (=> b!460013 (= res!275012 (or (= (select (arr!13716 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13716 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!20218 () Bool)

(assert (=> mapIsEmpty!20218 mapRes!20218))

(declare-fun b!460014 () Bool)

(declare-fun e!268405 () Bool)

(assert (=> b!460014 (= e!268405 tp_is_empty!12379)))

(declare-fun b!460015 () Bool)

(declare-fun res!275013 () Bool)

(assert (=> b!460015 (=> (not res!275013) (not e!268404))))

(assert (=> b!460015 (= res!275013 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14068 _keys!709))))))

(declare-fun b!460016 () Bool)

(declare-fun res!275014 () Bool)

(assert (=> b!460016 (=> (not res!275014) (not e!268404))))

(assert (=> b!460016 (= res!275014 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!460017 () Bool)

(declare-fun res!275005 () Bool)

(assert (=> b!460017 (=> (not res!275005) (not e!268404))))

(declare-fun arrayContainsKey!0 (array!28552 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!460017 (= res!275005 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!460018 () Bool)

(declare-fun res!275011 () Bool)

(assert (=> b!460018 (=> (not res!275011) (not e!268404))))

(assert (=> b!460018 (= res!275011 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8209))))

(declare-fun b!460019 () Bool)

(assert (=> b!460019 (= e!268406 (and e!268405 mapRes!20218))))

(declare-fun condMapEmpty!20218 () Bool)

(declare-fun mapDefault!20218 () ValueCell!5846)

(assert (=> b!460019 (= condMapEmpty!20218 (= (arr!13717 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5846)) mapDefault!20218)))))

(assert (= (and start!41158 res!275006) b!460005))

(assert (= (and b!460005 res!275007) b!460000))

(assert (= (and b!460000 res!275016) b!460016))

(assert (= (and b!460016 res!275014) b!460018))

(assert (= (and b!460018 res!275011) b!460015))

(assert (= (and b!460015 res!275013) b!460008))

(assert (= (and b!460008 res!275015) b!460013))

(assert (= (and b!460013 res!275012) b!460017))

(assert (= (and b!460017 res!275005) b!460004))

(assert (= (and b!460004 res!275017) b!460011))

(assert (= (and b!460011 res!275010) b!460002))

(assert (= (and b!460002 res!275008) b!460006))

(assert (= (and b!460006 res!275009) b!460012))

(assert (= (and b!460012 (not res!275019)) b!460003))

(assert (= (and b!460003 c!56483) b!460010))

(assert (= (and b!460003 (not c!56483)) b!460001))

(assert (= (and b!460003 (not res!275018)) b!460009))

(assert (= (and b!460019 condMapEmpty!20218) mapIsEmpty!20218))

(assert (= (and b!460019 (not condMapEmpty!20218)) mapNonEmpty!20218))

(get-info :version)

(assert (= (and mapNonEmpty!20218 ((_ is ValueCellFull!5846) mapValue!20218)) b!460007))

(assert (= (and b!460019 ((_ is ValueCellFull!5846) mapDefault!20218)) b!460014))

(assert (= start!41158 b!460019))

(declare-fun b_lambda!9889 () Bool)

(assert (=> (not b_lambda!9889) (not b!460003)))

(declare-fun t!14122 () Bool)

(declare-fun tb!3869 () Bool)

(assert (=> (and start!41158 (= defaultEntry!557 defaultEntry!557) t!14122) tb!3869))

(declare-fun result!7291 () Bool)

(assert (=> tb!3869 (= result!7291 tp_is_empty!12379)))

(assert (=> b!460003 t!14122))

(declare-fun b_and!19333 () Bool)

(assert (= b_and!19331 (and (=> t!14122 result!7291) b_and!19333)))

(declare-fun m!443459 () Bool)

(assert (=> b!460010 m!443459))

(declare-fun m!443461 () Bool)

(assert (=> mapNonEmpty!20218 m!443461))

(declare-fun m!443463 () Bool)

(assert (=> start!41158 m!443463))

(declare-fun m!443465 () Bool)

(assert (=> start!41158 m!443465))

(declare-fun m!443467 () Bool)

(assert (=> b!460011 m!443467))

(declare-fun m!443469 () Bool)

(assert (=> b!460018 m!443469))

(declare-fun m!443471 () Bool)

(assert (=> b!460013 m!443471))

(declare-fun m!443473 () Bool)

(assert (=> b!460003 m!443473))

(declare-fun m!443475 () Bool)

(assert (=> b!460003 m!443475))

(declare-fun m!443477 () Bool)

(assert (=> b!460003 m!443477))

(declare-fun m!443479 () Bool)

(assert (=> b!460003 m!443479))

(assert (=> b!460003 m!443479))

(assert (=> b!460003 m!443475))

(declare-fun m!443481 () Bool)

(assert (=> b!460003 m!443481))

(declare-fun m!443483 () Bool)

(assert (=> b!460004 m!443483))

(declare-fun m!443485 () Bool)

(assert (=> b!460004 m!443485))

(declare-fun m!443487 () Bool)

(assert (=> b!460009 m!443487))

(assert (=> b!460009 m!443487))

(declare-fun m!443489 () Bool)

(assert (=> b!460009 m!443489))

(assert (=> b!460009 m!443473))

(assert (=> b!460009 m!443473))

(declare-fun m!443491 () Bool)

(assert (=> b!460009 m!443491))

(declare-fun m!443493 () Bool)

(assert (=> b!460016 m!443493))

(declare-fun m!443495 () Bool)

(assert (=> b!460005 m!443495))

(declare-fun m!443497 () Bool)

(assert (=> b!460008 m!443497))

(declare-fun m!443499 () Bool)

(assert (=> b!460017 m!443499))

(assert (=> b!460012 m!443473))

(declare-fun m!443501 () Bool)

(assert (=> b!460012 m!443501))

(declare-fun m!443503 () Bool)

(assert (=> b!460012 m!443503))

(declare-fun m!443505 () Bool)

(assert (=> b!460012 m!443505))

(assert (=> b!460012 m!443473))

(declare-fun m!443507 () Bool)

(assert (=> b!460012 m!443507))

(declare-fun m!443509 () Bool)

(assert (=> b!460012 m!443509))

(declare-fun m!443511 () Bool)

(assert (=> b!460006 m!443511))

(declare-fun m!443513 () Bool)

(assert (=> b!460006 m!443513))

(declare-fun m!443515 () Bool)

(assert (=> b!460006 m!443515))

(check-sat (not b_next!11041) (not b!460010) (not b!460016) (not b!460006) (not mapNonEmpty!20218) (not start!41158) (not b!460018) (not b!460003) (not b!460017) b_and!19333 (not b!460011) tp_is_empty!12379 (not b!460004) (not b!460005) (not b!460008) (not b!460012) (not b_lambda!9889) (not b!460009))
(check-sat b_and!19333 (not b_next!11041))
