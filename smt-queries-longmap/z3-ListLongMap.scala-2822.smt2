; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40898 () Bool)

(assert start!40898)

(declare-fun b_free!10833 () Bool)

(declare-fun b_next!10833 () Bool)

(assert (=> start!40898 (= b_free!10833 (not b_next!10833))))

(declare-fun tp!38326 () Bool)

(declare-fun b_and!18975 () Bool)

(assert (=> start!40898 (= tp!38326 b_and!18975)))

(declare-fun b!454367 () Bool)

(declare-fun e!265850 () Bool)

(declare-fun e!265854 () Bool)

(assert (=> b!454367 (= e!265850 e!265854)))

(declare-fun res!270714 () Bool)

(assert (=> b!454367 (=> (not res!270714) (not e!265854))))

(declare-datatypes ((array!28147 0))(
  ( (array!28148 (arr!13517 (Array (_ BitVec 32) (_ BitVec 64))) (size!13869 (_ BitVec 32))) )
))
(declare-fun lt!206123 () array!28147)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28147 (_ BitVec 32)) Bool)

(assert (=> b!454367 (= res!270714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206123 mask!1025))))

(declare-fun _keys!709 () array!28147)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!454367 (= lt!206123 (array!28148 (store (arr!13517 _keys!709) i!563 k0!794) (size!13869 _keys!709)))))

(declare-fun b!454368 () Bool)

(declare-fun res!270713 () Bool)

(assert (=> b!454368 (=> (not res!270713) (not e!265850))))

(assert (=> b!454368 (= res!270713 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13869 _keys!709))))))

(declare-fun b!454369 () Bool)

(declare-fun res!270717 () Bool)

(assert (=> b!454369 (=> (not res!270717) (not e!265850))))

(assert (=> b!454369 (= res!270717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!454370 () Bool)

(declare-fun res!270712 () Bool)

(assert (=> b!454370 (=> (not res!270712) (not e!265850))))

(assert (=> b!454370 (= res!270712 (or (= (select (arr!13517 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13517 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!454371 () Bool)

(assert (=> b!454371 (= e!265854 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!17333 0))(
  ( (V!17334 (val!6130 Int)) )
))
(declare-fun minValue!515 () V!17333)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5742 0))(
  ( (ValueCellFull!5742 (v!8396 V!17333)) (EmptyCell!5742) )
))
(declare-datatypes ((array!28149 0))(
  ( (array!28150 (arr!13518 (Array (_ BitVec 32) ValueCell!5742)) (size!13870 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28149)

(declare-fun v!412 () V!17333)

(declare-datatypes ((tuple2!8074 0))(
  ( (tuple2!8075 (_1!4048 (_ BitVec 64)) (_2!4048 V!17333)) )
))
(declare-datatypes ((List!8135 0))(
  ( (Nil!8132) (Cons!8131 (h!8987 tuple2!8074) (t!13963 List!8135)) )
))
(declare-datatypes ((ListLongMap!6987 0))(
  ( (ListLongMap!6988 (toList!3509 List!8135)) )
))
(declare-fun lt!206121 () ListLongMap!6987)

(declare-fun zeroValue!515 () V!17333)

(declare-fun getCurrentListMapNoExtraKeys!1692 (array!28147 array!28149 (_ BitVec 32) (_ BitVec 32) V!17333 V!17333 (_ BitVec 32) Int) ListLongMap!6987)

(assert (=> b!454371 (= lt!206121 (getCurrentListMapNoExtraKeys!1692 lt!206123 (array!28150 (store (arr!13518 _values!549) i!563 (ValueCellFull!5742 v!412)) (size!13870 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206122 () ListLongMap!6987)

(assert (=> b!454371 (= lt!206122 (getCurrentListMapNoExtraKeys!1692 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!454372 () Bool)

(declare-fun res!270715 () Bool)

(assert (=> b!454372 (=> (not res!270715) (not e!265850))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!454372 (= res!270715 (validMask!0 mask!1025))))

(declare-fun b!454373 () Bool)

(declare-fun e!265851 () Bool)

(declare-fun tp_is_empty!12171 () Bool)

(assert (=> b!454373 (= e!265851 tp_is_empty!12171)))

(declare-fun res!270716 () Bool)

(assert (=> start!40898 (=> (not res!270716) (not e!265850))))

(assert (=> start!40898 (= res!270716 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13869 _keys!709))))))

(assert (=> start!40898 e!265850))

(assert (=> start!40898 tp_is_empty!12171))

(assert (=> start!40898 tp!38326))

(assert (=> start!40898 true))

(declare-fun e!265852 () Bool)

(declare-fun array_inv!9790 (array!28149) Bool)

(assert (=> start!40898 (and (array_inv!9790 _values!549) e!265852)))

(declare-fun array_inv!9791 (array!28147) Bool)

(assert (=> start!40898 (array_inv!9791 _keys!709)))

(declare-fun b!454374 () Bool)

(declare-fun res!270719 () Bool)

(assert (=> b!454374 (=> (not res!270719) (not e!265854))))

(declare-datatypes ((List!8136 0))(
  ( (Nil!8133) (Cons!8132 (h!8988 (_ BitVec 64)) (t!13964 List!8136)) )
))
(declare-fun arrayNoDuplicates!0 (array!28147 (_ BitVec 32) List!8136) Bool)

(assert (=> b!454374 (= res!270719 (arrayNoDuplicates!0 lt!206123 #b00000000000000000000000000000000 Nil!8133))))

(declare-fun b!454375 () Bool)

(declare-fun e!265853 () Bool)

(declare-fun mapRes!19897 () Bool)

(assert (=> b!454375 (= e!265852 (and e!265853 mapRes!19897))))

(declare-fun condMapEmpty!19897 () Bool)

(declare-fun mapDefault!19897 () ValueCell!5742)

(assert (=> b!454375 (= condMapEmpty!19897 (= (arr!13518 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5742)) mapDefault!19897)))))

(declare-fun b!454376 () Bool)

(declare-fun res!270708 () Bool)

(assert (=> b!454376 (=> (not res!270708) (not e!265850))))

(assert (=> b!454376 (= res!270708 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8133))))

(declare-fun mapIsEmpty!19897 () Bool)

(assert (=> mapIsEmpty!19897 mapRes!19897))

(declare-fun b!454377 () Bool)

(declare-fun res!270710 () Bool)

(assert (=> b!454377 (=> (not res!270710) (not e!265850))))

(declare-fun arrayContainsKey!0 (array!28147 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!454377 (= res!270710 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!454378 () Bool)

(declare-fun res!270711 () Bool)

(assert (=> b!454378 (=> (not res!270711) (not e!265850))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!454378 (= res!270711 (validKeyInArray!0 k0!794))))

(declare-fun b!454379 () Bool)

(declare-fun res!270709 () Bool)

(assert (=> b!454379 (=> (not res!270709) (not e!265854))))

(assert (=> b!454379 (= res!270709 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!19897 () Bool)

(declare-fun tp!38325 () Bool)

(assert (=> mapNonEmpty!19897 (= mapRes!19897 (and tp!38325 e!265851))))

(declare-fun mapRest!19897 () (Array (_ BitVec 32) ValueCell!5742))

(declare-fun mapValue!19897 () ValueCell!5742)

(declare-fun mapKey!19897 () (_ BitVec 32))

(assert (=> mapNonEmpty!19897 (= (arr!13518 _values!549) (store mapRest!19897 mapKey!19897 mapValue!19897))))

(declare-fun b!454380 () Bool)

(declare-fun res!270718 () Bool)

(assert (=> b!454380 (=> (not res!270718) (not e!265850))))

(assert (=> b!454380 (= res!270718 (and (= (size!13870 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13869 _keys!709) (size!13870 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!454381 () Bool)

(assert (=> b!454381 (= e!265853 tp_is_empty!12171)))

(assert (= (and start!40898 res!270716) b!454372))

(assert (= (and b!454372 res!270715) b!454380))

(assert (= (and b!454380 res!270718) b!454369))

(assert (= (and b!454369 res!270717) b!454376))

(assert (= (and b!454376 res!270708) b!454368))

(assert (= (and b!454368 res!270713) b!454378))

(assert (= (and b!454378 res!270711) b!454370))

(assert (= (and b!454370 res!270712) b!454377))

(assert (= (and b!454377 res!270710) b!454367))

(assert (= (and b!454367 res!270714) b!454374))

(assert (= (and b!454374 res!270719) b!454379))

(assert (= (and b!454379 res!270709) b!454371))

(assert (= (and b!454375 condMapEmpty!19897) mapIsEmpty!19897))

(assert (= (and b!454375 (not condMapEmpty!19897)) mapNonEmpty!19897))

(get-info :version)

(assert (= (and mapNonEmpty!19897 ((_ is ValueCellFull!5742) mapValue!19897)) b!454373))

(assert (= (and b!454375 ((_ is ValueCellFull!5742) mapDefault!19897)) b!454381))

(assert (= start!40898 b!454375))

(declare-fun m!438511 () Bool)

(assert (=> b!454371 m!438511))

(declare-fun m!438513 () Bool)

(assert (=> b!454371 m!438513))

(declare-fun m!438515 () Bool)

(assert (=> b!454371 m!438515))

(declare-fun m!438517 () Bool)

(assert (=> b!454378 m!438517))

(declare-fun m!438519 () Bool)

(assert (=> b!454376 m!438519))

(declare-fun m!438521 () Bool)

(assert (=> mapNonEmpty!19897 m!438521))

(declare-fun m!438523 () Bool)

(assert (=> b!454377 m!438523))

(declare-fun m!438525 () Bool)

(assert (=> b!454372 m!438525))

(declare-fun m!438527 () Bool)

(assert (=> b!454370 m!438527))

(declare-fun m!438529 () Bool)

(assert (=> b!454369 m!438529))

(declare-fun m!438531 () Bool)

(assert (=> b!454367 m!438531))

(declare-fun m!438533 () Bool)

(assert (=> b!454367 m!438533))

(declare-fun m!438535 () Bool)

(assert (=> start!40898 m!438535))

(declare-fun m!438537 () Bool)

(assert (=> start!40898 m!438537))

(declare-fun m!438539 () Bool)

(assert (=> b!454374 m!438539))

(check-sat (not b!454371) (not b!454378) (not mapNonEmpty!19897) (not b!454367) b_and!18975 (not b!454372) (not b!454376) tp_is_empty!12171 (not b!454374) (not b_next!10833) (not b!454377) (not start!40898) (not b!454369))
(check-sat b_and!18975 (not b_next!10833))
