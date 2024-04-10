; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74170 () Bool)

(assert start!74170)

(declare-fun b!872488 () Bool)

(declare-fun res!592982 () Bool)

(declare-fun e!485875 () Bool)

(assert (=> b!872488 (=> (not res!592982) (not e!485875))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50552 0))(
  ( (array!50553 (arr!24306 (Array (_ BitVec 32) (_ BitVec 64))) (size!24746 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50552)

(declare-datatypes ((V!27993 0))(
  ( (V!27994 (val!8652 Int)) )
))
(declare-datatypes ((ValueCell!8165 0))(
  ( (ValueCellFull!8165 (v!11077 V!27993)) (EmptyCell!8165) )
))
(declare-datatypes ((array!50554 0))(
  ( (array!50555 (arr!24307 (Array (_ BitVec 32) ValueCell!8165)) (size!24747 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50554)

(assert (=> b!872488 (= res!592982 (and (= (size!24747 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24746 _keys!868) (size!24747 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!872489 () Bool)

(declare-fun e!485873 () Bool)

(declare-fun tp_is_empty!17209 () Bool)

(assert (=> b!872489 (= e!485873 tp_is_empty!17209)))

(declare-fun b!872490 () Bool)

(declare-fun res!592983 () Bool)

(assert (=> b!872490 (=> (not res!592983) (not e!485875))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50552 (_ BitVec 32)) Bool)

(assert (=> b!872490 (= res!592983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!872491 () Bool)

(assert (=> b!872491 (= e!485875 false)))

(declare-fun lt!395629 () Bool)

(declare-datatypes ((List!17264 0))(
  ( (Nil!17261) (Cons!17260 (h!18391 (_ BitVec 64)) (t!24301 List!17264)) )
))
(declare-fun arrayNoDuplicates!0 (array!50552 (_ BitVec 32) List!17264) Bool)

(assert (=> b!872491 (= lt!395629 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17261))))

(declare-fun mapIsEmpty!27416 () Bool)

(declare-fun mapRes!27416 () Bool)

(assert (=> mapIsEmpty!27416 mapRes!27416))

(declare-fun b!872492 () Bool)

(declare-fun res!592984 () Bool)

(assert (=> b!872492 (=> (not res!592984) (not e!485875))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872492 (= res!592984 (validMask!0 mask!1196))))

(declare-fun b!872493 () Bool)

(declare-fun e!485874 () Bool)

(declare-fun e!485871 () Bool)

(assert (=> b!872493 (= e!485874 (and e!485871 mapRes!27416))))

(declare-fun condMapEmpty!27416 () Bool)

(declare-fun mapDefault!27416 () ValueCell!8165)

