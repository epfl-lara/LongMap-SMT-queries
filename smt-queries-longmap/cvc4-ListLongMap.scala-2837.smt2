; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40990 () Bool)

(assert start!40990)

(declare-fun b_free!10925 () Bool)

(declare-fun b_next!10925 () Bool)

(assert (=> start!40990 (= b_free!10925 (not b_next!10925))))

(declare-fun tp!38602 () Bool)

(declare-fun b_and!19067 () Bool)

(assert (=> start!40990 (= tp!38602 b_and!19067)))

(declare-fun b!456445 () Bool)

(declare-fun res!272382 () Bool)

(declare-fun e!266692 () Bool)

(assert (=> b!456445 (=> (not res!272382) (not e!266692))))

(declare-datatypes ((array!28329 0))(
  ( (array!28330 (arr!13608 (Array (_ BitVec 32) (_ BitVec 64))) (size!13960 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28329)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28329 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!456445 (= res!272382 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!456446 () Bool)

(declare-fun res!272377 () Bool)

(assert (=> b!456446 (=> (not res!272377) (not e!266692))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28329 (_ BitVec 32)) Bool)

(assert (=> b!456446 (= res!272377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!20035 () Bool)

(declare-fun mapRes!20035 () Bool)

(declare-fun tp!38601 () Bool)

(declare-fun e!266686 () Bool)

(assert (=> mapNonEmpty!20035 (= mapRes!20035 (and tp!38601 e!266686))))

(declare-datatypes ((V!17455 0))(
  ( (V!17456 (val!6176 Int)) )
))
(declare-datatypes ((ValueCell!5788 0))(
  ( (ValueCellFull!5788 (v!8442 V!17455)) (EmptyCell!5788) )
))
(declare-fun mapRest!20035 () (Array (_ BitVec 32) ValueCell!5788))

(declare-datatypes ((array!28331 0))(
  ( (array!28332 (arr!13609 (Array (_ BitVec 32) ValueCell!5788)) (size!13961 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28331)

(declare-fun mapValue!20035 () ValueCell!5788)

(declare-fun mapKey!20035 () (_ BitVec 32))

(assert (=> mapNonEmpty!20035 (= (arr!13609 _values!549) (store mapRest!20035 mapKey!20035 mapValue!20035))))

(declare-fun b!456447 () Bool)

(declare-fun e!266691 () Bool)

(declare-fun tp_is_empty!12263 () Bool)

(assert (=> b!456447 (= e!266691 tp_is_empty!12263)))

(declare-fun b!456448 () Bool)

(declare-fun res!272380 () Bool)

(assert (=> b!456448 (=> (not res!272380) (not e!266692))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!456448 (= res!272380 (validMask!0 mask!1025))))

(declare-fun b!456449 () Bool)

(declare-fun e!266688 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!456449 (= e!266688 (not (bvslt from!863 (size!13960 _keys!709))))))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!206552 () array!28329)

(declare-fun zeroValue!515 () V!17455)

(declare-fun v!412 () V!17455)

(declare-fun minValue!515 () V!17455)

(declare-fun lt!206554 () array!28331)

(declare-datatypes ((tuple2!8138 0))(
  ( (tuple2!8139 (_1!4080 (_ BitVec 64)) (_2!4080 V!17455)) )
))
(declare-datatypes ((List!8210 0))(
  ( (Nil!8207) (Cons!8206 (h!9062 tuple2!8138) (t!14038 List!8210)) )
))
(declare-datatypes ((ListLongMap!7051 0))(
  ( (ListLongMap!7052 (toList!3541 List!8210)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1724 (array!28329 array!28331 (_ BitVec 32) (_ BitVec 32) V!17455 V!17455 (_ BitVec 32) Int) ListLongMap!7051)

(declare-fun +!1578 (ListLongMap!7051 tuple2!8138) ListLongMap!7051)

(assert (=> b!456449 (= (getCurrentListMapNoExtraKeys!1724 lt!206552 lt!206554 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1578 (getCurrentListMapNoExtraKeys!1724 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8139 k!794 v!412)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!13278 0))(
  ( (Unit!13279) )
))
(declare-fun lt!206551 () Unit!13278)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!738 (array!28329 array!28331 (_ BitVec 32) (_ BitVec 32) V!17455 V!17455 (_ BitVec 32) (_ BitVec 64) V!17455 (_ BitVec 32) Int) Unit!13278)

(assert (=> b!456449 (= lt!206551 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!738 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!456450 () Bool)

(declare-fun e!266689 () Bool)

(assert (=> b!456450 (= e!266692 e!266689)))

(declare-fun res!272372 () Bool)

(assert (=> b!456450 (=> (not res!272372) (not e!266689))))

(assert (=> b!456450 (= res!272372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206552 mask!1025))))

(assert (=> b!456450 (= lt!206552 (array!28330 (store (arr!13608 _keys!709) i!563 k!794) (size!13960 _keys!709)))))

(declare-fun b!456451 () Bool)

(assert (=> b!456451 (= e!266686 tp_is_empty!12263)))

(declare-fun mapIsEmpty!20035 () Bool)

(assert (=> mapIsEmpty!20035 mapRes!20035))

(declare-fun b!456452 () Bool)

(declare-fun res!272383 () Bool)

(assert (=> b!456452 (=> (not res!272383) (not e!266692))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!456452 (= res!272383 (validKeyInArray!0 k!794))))

(declare-fun b!456454 () Bool)

(declare-fun res!272381 () Bool)

(assert (=> b!456454 (=> (not res!272381) (not e!266692))))

(assert (=> b!456454 (= res!272381 (or (= (select (arr!13608 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13608 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!456455 () Bool)

(assert (=> b!456455 (= e!266689 e!266688)))

(declare-fun res!272378 () Bool)

(assert (=> b!456455 (=> (not res!272378) (not e!266688))))

(assert (=> b!456455 (= res!272378 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!206555 () ListLongMap!7051)

(assert (=> b!456455 (= lt!206555 (getCurrentListMapNoExtraKeys!1724 lt!206552 lt!206554 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!456455 (= lt!206554 (array!28332 (store (arr!13609 _values!549) i!563 (ValueCellFull!5788 v!412)) (size!13961 _values!549)))))

(declare-fun lt!206553 () ListLongMap!7051)

(assert (=> b!456455 (= lt!206553 (getCurrentListMapNoExtraKeys!1724 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!456456 () Bool)

(declare-fun e!266687 () Bool)

(assert (=> b!456456 (= e!266687 (and e!266691 mapRes!20035))))

(declare-fun condMapEmpty!20035 () Bool)

(declare-fun mapDefault!20035 () ValueCell!5788)

