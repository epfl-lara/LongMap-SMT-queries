; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40608 () Bool)

(assert start!40608)

(declare-fun b_free!10633 () Bool)

(declare-fun b_next!10633 () Bool)

(assert (=> start!40608 (= b_free!10633 (not b_next!10633))))

(declare-fun tp!37718 () Bool)

(declare-fun b_and!18655 () Bool)

(assert (=> start!40608 (= tp!37718 b_and!18655)))

(declare-fun b!448363 () Bool)

(declare-fun e!263084 () Bool)

(declare-fun e!263086 () Bool)

(assert (=> b!448363 (= e!263084 e!263086)))

(declare-fun res!266512 () Bool)

(assert (=> b!448363 (=> (not res!266512) (not e!263086))))

(declare-datatypes ((array!27746 0))(
  ( (array!27747 (arr!13318 (Array (_ BitVec 32) (_ BitVec 64))) (size!13670 (_ BitVec 32))) )
))
(declare-fun lt!204180 () array!27746)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27746 (_ BitVec 32)) Bool)

(assert (=> b!448363 (= res!266512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204180 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun _keys!709 () array!27746)

(assert (=> b!448363 (= lt!204180 (array!27747 (store (arr!13318 _keys!709) i!563 k0!794) (size!13670 _keys!709)))))

(declare-fun b!448364 () Bool)

(declare-fun res!266519 () Bool)

(assert (=> b!448364 (=> (not res!266519) (not e!263084))))

(assert (=> b!448364 (= res!266519 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13670 _keys!709))))))

(declare-fun b!448365 () Bool)

(declare-fun res!266509 () Bool)

(assert (=> b!448365 (=> (not res!266509) (not e!263084))))

(declare-fun arrayContainsKey!0 (array!27746 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!448365 (= res!266509 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!448366 () Bool)

(declare-fun res!266517 () Bool)

(assert (=> b!448366 (=> (not res!266517) (not e!263084))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!448366 (= res!266517 (validKeyInArray!0 k0!794))))

(declare-fun b!448367 () Bool)

(declare-fun res!266518 () Bool)

(assert (=> b!448367 (=> (not res!266518) (not e!263084))))

(assert (=> b!448367 (= res!266518 (or (= (select (arr!13318 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13318 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!448368 () Bool)

(declare-fun res!266511 () Bool)

(assert (=> b!448368 (=> (not res!266511) (not e!263084))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17067 0))(
  ( (V!17068 (val!6030 Int)) )
))
(declare-datatypes ((ValueCell!5642 0))(
  ( (ValueCellFull!5642 (v!8286 V!17067)) (EmptyCell!5642) )
))
(declare-datatypes ((array!27748 0))(
  ( (array!27749 (arr!13319 (Array (_ BitVec 32) ValueCell!5642)) (size!13671 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27748)

(assert (=> b!448368 (= res!266511 (and (= (size!13671 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13670 _keys!709) (size!13671 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!448369 () Bool)

(declare-fun e!263088 () Bool)

(declare-fun tp_is_empty!11971 () Bool)

(assert (=> b!448369 (= e!263088 tp_is_empty!11971)))

(declare-fun b!448370 () Bool)

(declare-fun res!266510 () Bool)

(assert (=> b!448370 (=> (not res!266510) (not e!263084))))

(assert (=> b!448370 (= res!266510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!266514 () Bool)

(assert (=> start!40608 (=> (not res!266514) (not e!263084))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40608 (= res!266514 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13670 _keys!709))))))

(assert (=> start!40608 e!263084))

(assert (=> start!40608 tp_is_empty!11971))

(assert (=> start!40608 tp!37718))

(assert (=> start!40608 true))

(declare-fun e!263085 () Bool)

(declare-fun array_inv!9730 (array!27748) Bool)

(assert (=> start!40608 (and (array_inv!9730 _values!549) e!263085)))

(declare-fun array_inv!9731 (array!27746) Bool)

(assert (=> start!40608 (array_inv!9731 _keys!709)))

(declare-fun mapIsEmpty!19590 () Bool)

(declare-fun mapRes!19590 () Bool)

(assert (=> mapIsEmpty!19590 mapRes!19590))

(declare-fun b!448371 () Bool)

(declare-fun e!263087 () Bool)

(assert (=> b!448371 (= e!263087 tp_is_empty!11971)))

(declare-fun b!448372 () Bool)

(declare-fun res!266513 () Bool)

(assert (=> b!448372 (=> (not res!266513) (not e!263084))))

(declare-datatypes ((List!7890 0))(
  ( (Nil!7887) (Cons!7886 (h!8742 (_ BitVec 64)) (t!13644 List!7890)) )
))
(declare-fun arrayNoDuplicates!0 (array!27746 (_ BitVec 32) List!7890) Bool)

(assert (=> b!448372 (= res!266513 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7887))))

(declare-fun b!448373 () Bool)

(assert (=> b!448373 (= e!263085 (and e!263088 mapRes!19590))))

(declare-fun condMapEmpty!19590 () Bool)

(declare-fun mapDefault!19590 () ValueCell!5642)

(assert (=> b!448373 (= condMapEmpty!19590 (= (arr!13319 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5642)) mapDefault!19590)))))

(declare-fun b!448374 () Bool)

(declare-fun res!266520 () Bool)

(assert (=> b!448374 (=> (not res!266520) (not e!263084))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!448374 (= res!266520 (validMask!0 mask!1025))))

(declare-fun b!448375 () Bool)

(declare-fun res!266515 () Bool)

(assert (=> b!448375 (=> (not res!266515) (not e!263086))))

(assert (=> b!448375 (= res!266515 (bvsle from!863 i!563))))

(declare-fun b!448376 () Bool)

(declare-fun res!266516 () Bool)

(assert (=> b!448376 (=> (not res!266516) (not e!263086))))

(assert (=> b!448376 (= res!266516 (arrayNoDuplicates!0 lt!204180 #b00000000000000000000000000000000 Nil!7887))))

(declare-fun b!448377 () Bool)

(assert (=> b!448377 (= e!263086 false)))

(declare-fun minValue!515 () V!17067)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7818 0))(
  ( (tuple2!7819 (_1!3920 (_ BitVec 64)) (_2!3920 V!17067)) )
))
(declare-datatypes ((List!7891 0))(
  ( (Nil!7888) (Cons!7887 (h!8743 tuple2!7818) (t!13645 List!7891)) )
))
(declare-datatypes ((ListLongMap!6733 0))(
  ( (ListLongMap!6734 (toList!3382 List!7891)) )
))
(declare-fun lt!204181 () ListLongMap!6733)

(declare-fun zeroValue!515 () V!17067)

(declare-fun v!412 () V!17067)

(declare-fun getCurrentListMapNoExtraKeys!1612 (array!27746 array!27748 (_ BitVec 32) (_ BitVec 32) V!17067 V!17067 (_ BitVec 32) Int) ListLongMap!6733)

(assert (=> b!448377 (= lt!204181 (getCurrentListMapNoExtraKeys!1612 lt!204180 (array!27749 (store (arr!13319 _values!549) i!563 (ValueCellFull!5642 v!412)) (size!13671 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204179 () ListLongMap!6733)

(assert (=> b!448377 (= lt!204179 (getCurrentListMapNoExtraKeys!1612 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!19590 () Bool)

(declare-fun tp!37719 () Bool)

(assert (=> mapNonEmpty!19590 (= mapRes!19590 (and tp!37719 e!263087))))

(declare-fun mapValue!19590 () ValueCell!5642)

(declare-fun mapKey!19590 () (_ BitVec 32))

(declare-fun mapRest!19590 () (Array (_ BitVec 32) ValueCell!5642))

(assert (=> mapNonEmpty!19590 (= (arr!13319 _values!549) (store mapRest!19590 mapKey!19590 mapValue!19590))))

(assert (= (and start!40608 res!266514) b!448374))

(assert (= (and b!448374 res!266520) b!448368))

(assert (= (and b!448368 res!266511) b!448370))

(assert (= (and b!448370 res!266510) b!448372))

(assert (= (and b!448372 res!266513) b!448364))

(assert (= (and b!448364 res!266519) b!448366))

(assert (= (and b!448366 res!266517) b!448367))

(assert (= (and b!448367 res!266518) b!448365))

(assert (= (and b!448365 res!266509) b!448363))

(assert (= (and b!448363 res!266512) b!448376))

(assert (= (and b!448376 res!266516) b!448375))

(assert (= (and b!448375 res!266515) b!448377))

(assert (= (and b!448373 condMapEmpty!19590) mapIsEmpty!19590))

(assert (= (and b!448373 (not condMapEmpty!19590)) mapNonEmpty!19590))

(get-info :version)

(assert (= (and mapNonEmpty!19590 ((_ is ValueCellFull!5642) mapValue!19590)) b!448371))

(assert (= (and b!448373 ((_ is ValueCellFull!5642) mapDefault!19590)) b!448369))

(assert (= start!40608 b!448373))

(declare-fun m!433191 () Bool)

(assert (=> b!448365 m!433191))

(declare-fun m!433193 () Bool)

(assert (=> start!40608 m!433193))

(declare-fun m!433195 () Bool)

(assert (=> start!40608 m!433195))

(declare-fun m!433197 () Bool)

(assert (=> b!448363 m!433197))

(declare-fun m!433199 () Bool)

(assert (=> b!448363 m!433199))

(declare-fun m!433201 () Bool)

(assert (=> b!448370 m!433201))

(declare-fun m!433203 () Bool)

(assert (=> b!448372 m!433203))

(declare-fun m!433205 () Bool)

(assert (=> b!448366 m!433205))

(declare-fun m!433207 () Bool)

(assert (=> b!448376 m!433207))

(declare-fun m!433209 () Bool)

(assert (=> mapNonEmpty!19590 m!433209))

(declare-fun m!433211 () Bool)

(assert (=> b!448374 m!433211))

(declare-fun m!433213 () Bool)

(assert (=> b!448367 m!433213))

(declare-fun m!433215 () Bool)

(assert (=> b!448377 m!433215))

(declare-fun m!433217 () Bool)

(assert (=> b!448377 m!433217))

(declare-fun m!433219 () Bool)

(assert (=> b!448377 m!433219))

(check-sat (not start!40608) (not b!448365) (not b!448372) (not b!448376) (not b_next!10633) tp_is_empty!11971 (not b!448370) (not b!448363) b_and!18655 (not b!448366) (not b!448377) (not mapNonEmpty!19590) (not b!448374))
(check-sat b_and!18655 (not b_next!10633))
