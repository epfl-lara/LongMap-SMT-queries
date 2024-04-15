; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40662 () Bool)

(assert start!40662)

(declare-fun b_free!10687 () Bool)

(declare-fun b_next!10687 () Bool)

(assert (=> start!40662 (= b_free!10687 (not b_next!10687))))

(declare-fun tp!37881 () Bool)

(declare-fun b_and!18669 () Bool)

(assert (=> start!40662 (= tp!37881 b_and!18669)))

(declare-fun b!449356 () Bool)

(declare-fun res!267358 () Bool)

(declare-fun e!263428 () Bool)

(assert (=> b!449356 (=> (not res!267358) (not e!263428))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!449356 (= res!267358 (validKeyInArray!0 k0!794))))

(declare-fun b!449357 () Bool)

(declare-fun e!263432 () Bool)

(declare-fun tp_is_empty!12025 () Bool)

(assert (=> b!449357 (= e!263432 tp_is_empty!12025)))

(declare-fun b!449358 () Bool)

(declare-fun res!267363 () Bool)

(declare-fun e!263430 () Bool)

(assert (=> b!449358 (=> (not res!267363) (not e!263430))))

(declare-datatypes ((array!27855 0))(
  ( (array!27856 (arr!13373 (Array (_ BitVec 32) (_ BitVec 64))) (size!13726 (_ BitVec 32))) )
))
(declare-fun lt!204171 () array!27855)

(declare-datatypes ((List!8027 0))(
  ( (Nil!8024) (Cons!8023 (h!8879 (_ BitVec 64)) (t!13780 List!8027)) )
))
(declare-fun arrayNoDuplicates!0 (array!27855 (_ BitVec 32) List!8027) Bool)

(assert (=> b!449358 (= res!267363 (arrayNoDuplicates!0 lt!204171 #b00000000000000000000000000000000 Nil!8024))))

(declare-fun b!449359 () Bool)

(declare-fun res!267355 () Bool)

(assert (=> b!449359 (=> (not res!267355) (not e!263428))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun _keys!709 () array!27855)

(assert (=> b!449359 (= res!267355 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13726 _keys!709))))))

(declare-fun b!449360 () Bool)

(declare-fun res!267366 () Bool)

(assert (=> b!449360 (=> (not res!267366) (not e!263428))))

(assert (=> b!449360 (= res!267366 (or (= (select (arr!13373 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13373 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!449361 () Bool)

(declare-fun e!263429 () Bool)

(declare-fun e!263427 () Bool)

(declare-fun mapRes!19671 () Bool)

(assert (=> b!449361 (= e!263429 (and e!263427 mapRes!19671))))

(declare-fun condMapEmpty!19671 () Bool)

(declare-datatypes ((V!17139 0))(
  ( (V!17140 (val!6057 Int)) )
))
(declare-datatypes ((ValueCell!5669 0))(
  ( (ValueCellFull!5669 (v!8306 V!17139)) (EmptyCell!5669) )
))
(declare-datatypes ((array!27857 0))(
  ( (array!27858 (arr!13374 (Array (_ BitVec 32) ValueCell!5669)) (size!13727 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27857)

(declare-fun mapDefault!19671 () ValueCell!5669)

(assert (=> b!449361 (= condMapEmpty!19671 (= (arr!13374 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5669)) mapDefault!19671)))))

(declare-fun res!267357 () Bool)

(assert (=> start!40662 (=> (not res!267357) (not e!263428))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40662 (= res!267357 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13726 _keys!709))))))

(assert (=> start!40662 e!263428))

(assert (=> start!40662 tp_is_empty!12025))

(assert (=> start!40662 tp!37881))

(assert (=> start!40662 true))

(declare-fun array_inv!9750 (array!27857) Bool)

(assert (=> start!40662 (and (array_inv!9750 _values!549) e!263429)))

(declare-fun array_inv!9751 (array!27855) Bool)

(assert (=> start!40662 (array_inv!9751 _keys!709)))

(declare-fun b!449362 () Bool)

(declare-fun res!267364 () Bool)

(assert (=> b!449362 (=> (not res!267364) (not e!263428))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!449362 (= res!267364 (validMask!0 mask!1025))))

(declare-fun b!449363 () Bool)

(declare-fun res!267362 () Bool)

(assert (=> b!449363 (=> (not res!267362) (not e!263428))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27855 (_ BitVec 32)) Bool)

(assert (=> b!449363 (= res!267362 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!449364 () Bool)

(assert (=> b!449364 (= e!263427 tp_is_empty!12025)))

(declare-fun mapIsEmpty!19671 () Bool)

(assert (=> mapIsEmpty!19671 mapRes!19671))

(declare-fun b!449365 () Bool)

(declare-fun res!267365 () Bool)

(assert (=> b!449365 (=> (not res!267365) (not e!263428))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!449365 (= res!267365 (and (= (size!13727 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13726 _keys!709) (size!13727 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!449366 () Bool)

(declare-fun res!267359 () Bool)

(assert (=> b!449366 (=> (not res!267359) (not e!263428))))

(assert (=> b!449366 (= res!267359 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8024))))

(declare-fun b!449367 () Bool)

(assert (=> b!449367 (= e!263428 e!263430)))

(declare-fun res!267361 () Bool)

(assert (=> b!449367 (=> (not res!267361) (not e!263430))))

(assert (=> b!449367 (= res!267361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204171 mask!1025))))

(assert (=> b!449367 (= lt!204171 (array!27856 (store (arr!13373 _keys!709) i!563 k0!794) (size!13726 _keys!709)))))

(declare-fun b!449368 () Bool)

(declare-fun res!267360 () Bool)

(assert (=> b!449368 (=> (not res!267360) (not e!263430))))

(assert (=> b!449368 (= res!267360 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!19671 () Bool)

(declare-fun tp!37880 () Bool)

(assert (=> mapNonEmpty!19671 (= mapRes!19671 (and tp!37880 e!263432))))

(declare-fun mapKey!19671 () (_ BitVec 32))

(declare-fun mapRest!19671 () (Array (_ BitVec 32) ValueCell!5669))

(declare-fun mapValue!19671 () ValueCell!5669)

(assert (=> mapNonEmpty!19671 (= (arr!13374 _values!549) (store mapRest!19671 mapKey!19671 mapValue!19671))))

(declare-fun b!449369 () Bool)

(assert (=> b!449369 (= e!263430 false)))

(declare-fun minValue!515 () V!17139)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7964 0))(
  ( (tuple2!7965 (_1!3993 (_ BitVec 64)) (_2!3993 V!17139)) )
))
(declare-datatypes ((List!8028 0))(
  ( (Nil!8025) (Cons!8024 (h!8880 tuple2!7964) (t!13781 List!8028)) )
))
(declare-datatypes ((ListLongMap!6867 0))(
  ( (ListLongMap!6868 (toList!3449 List!8028)) )
))
(declare-fun lt!204169 () ListLongMap!6867)

(declare-fun zeroValue!515 () V!17139)

(declare-fun v!412 () V!17139)

(declare-fun getCurrentListMapNoExtraKeys!1647 (array!27855 array!27857 (_ BitVec 32) (_ BitVec 32) V!17139 V!17139 (_ BitVec 32) Int) ListLongMap!6867)

(assert (=> b!449369 (= lt!204169 (getCurrentListMapNoExtraKeys!1647 lt!204171 (array!27858 (store (arr!13374 _values!549) i!563 (ValueCellFull!5669 v!412)) (size!13727 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204170 () ListLongMap!6867)

(assert (=> b!449369 (= lt!204170 (getCurrentListMapNoExtraKeys!1647 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!449370 () Bool)

(declare-fun res!267356 () Bool)

(assert (=> b!449370 (=> (not res!267356) (not e!263428))))

(declare-fun arrayContainsKey!0 (array!27855 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!449370 (= res!267356 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!40662 res!267357) b!449362))

(assert (= (and b!449362 res!267364) b!449365))

(assert (= (and b!449365 res!267365) b!449363))

(assert (= (and b!449363 res!267362) b!449366))

(assert (= (and b!449366 res!267359) b!449359))

(assert (= (and b!449359 res!267355) b!449356))

(assert (= (and b!449356 res!267358) b!449360))

(assert (= (and b!449360 res!267366) b!449370))

(assert (= (and b!449370 res!267356) b!449367))

(assert (= (and b!449367 res!267361) b!449358))

(assert (= (and b!449358 res!267363) b!449368))

(assert (= (and b!449368 res!267360) b!449369))

(assert (= (and b!449361 condMapEmpty!19671) mapIsEmpty!19671))

(assert (= (and b!449361 (not condMapEmpty!19671)) mapNonEmpty!19671))

(get-info :version)

(assert (= (and mapNonEmpty!19671 ((_ is ValueCellFull!5669) mapValue!19671)) b!449357))

(assert (= (and b!449361 ((_ is ValueCellFull!5669) mapDefault!19671)) b!449364))

(assert (= start!40662 b!449361))

(declare-fun m!433051 () Bool)

(assert (=> b!449363 m!433051))

(declare-fun m!433053 () Bool)

(assert (=> b!449366 m!433053))

(declare-fun m!433055 () Bool)

(assert (=> b!449362 m!433055))

(declare-fun m!433057 () Bool)

(assert (=> start!40662 m!433057))

(declare-fun m!433059 () Bool)

(assert (=> start!40662 m!433059))

(declare-fun m!433061 () Bool)

(assert (=> b!449358 m!433061))

(declare-fun m!433063 () Bool)

(assert (=> b!449367 m!433063))

(declare-fun m!433065 () Bool)

(assert (=> b!449367 m!433065))

(declare-fun m!433067 () Bool)

(assert (=> b!449360 m!433067))

(declare-fun m!433069 () Bool)

(assert (=> b!449369 m!433069))

(declare-fun m!433071 () Bool)

(assert (=> b!449369 m!433071))

(declare-fun m!433073 () Bool)

(assert (=> b!449369 m!433073))

(declare-fun m!433075 () Bool)

(assert (=> b!449370 m!433075))

(declare-fun m!433077 () Bool)

(assert (=> b!449356 m!433077))

(declare-fun m!433079 () Bool)

(assert (=> mapNonEmpty!19671 m!433079))

(check-sat (not b!449356) (not b!449358) (not b!449363) tp_is_empty!12025 (not b!449362) (not b_next!10687) (not start!40662) (not b!449367) b_and!18669 (not b!449369) (not mapNonEmpty!19671) (not b!449370) (not b!449366))
(check-sat b_and!18669 (not b_next!10687))
