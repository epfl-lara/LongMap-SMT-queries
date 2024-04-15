; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40942 () Bool)

(assert start!40942)

(declare-fun b_free!10891 () Bool)

(declare-fun b_next!10891 () Bool)

(assert (=> start!40942 (= b_free!10891 (not b_next!10891))))

(declare-fun tp!38499 () Bool)

(declare-fun b_and!19007 () Bool)

(assert (=> start!40942 (= tp!38499 b_and!19007)))

(declare-fun b!455402 () Bool)

(declare-fun res!271624 () Bool)

(declare-fun e!266200 () Bool)

(assert (=> b!455402 (=> (not res!271624) (not e!266200))))

(declare-datatypes ((array!28253 0))(
  ( (array!28254 (arr!13570 (Array (_ BitVec 32) (_ BitVec 64))) (size!13923 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28253)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28253 (_ BitVec 32)) Bool)

(assert (=> b!455402 (= res!271624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!455403 () Bool)

(declare-fun e!266202 () Bool)

(assert (=> b!455403 (= e!266200 e!266202)))

(declare-fun res!271632 () Bool)

(assert (=> b!455403 (=> (not res!271632) (not e!266202))))

(declare-fun lt!206149 () array!28253)

(assert (=> b!455403 (= res!271632 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206149 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!455403 (= lt!206149 (array!28254 (store (arr!13570 _keys!709) i!563 k0!794) (size!13923 _keys!709)))))

(declare-fun b!455404 () Bool)

(declare-fun res!271625 () Bool)

(assert (=> b!455404 (=> (not res!271625) (not e!266200))))

(assert (=> b!455404 (= res!271625 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13923 _keys!709))))))

(declare-fun b!455405 () Bool)

(assert (=> b!455405 (= e!266202 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!17411 0))(
  ( (V!17412 (val!6159 Int)) )
))
(declare-fun minValue!515 () V!17411)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5771 0))(
  ( (ValueCellFull!5771 (v!8419 V!17411)) (EmptyCell!5771) )
))
(declare-datatypes ((array!28255 0))(
  ( (array!28256 (arr!13571 (Array (_ BitVec 32) ValueCell!5771)) (size!13924 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28255)

(declare-fun zeroValue!515 () V!17411)

(declare-fun v!412 () V!17411)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!8130 0))(
  ( (tuple2!8131 (_1!4076 (_ BitVec 64)) (_2!4076 V!17411)) )
))
(declare-datatypes ((List!8190 0))(
  ( (Nil!8187) (Cons!8186 (h!9042 tuple2!8130) (t!14009 List!8190)) )
))
(declare-datatypes ((ListLongMap!7033 0))(
  ( (ListLongMap!7034 (toList!3532 List!8190)) )
))
(declare-fun lt!206150 () ListLongMap!7033)

(declare-fun getCurrentListMapNoExtraKeys!1727 (array!28253 array!28255 (_ BitVec 32) (_ BitVec 32) V!17411 V!17411 (_ BitVec 32) Int) ListLongMap!7033)

(assert (=> b!455405 (= lt!206150 (getCurrentListMapNoExtraKeys!1727 lt!206149 (array!28256 (store (arr!13571 _values!549) i!563 (ValueCellFull!5771 v!412)) (size!13924 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206148 () ListLongMap!7033)

(assert (=> b!455405 (= lt!206148 (getCurrentListMapNoExtraKeys!1727 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!455406 () Bool)

(declare-fun e!266199 () Bool)

(declare-fun e!266203 () Bool)

(declare-fun mapRes!19984 () Bool)

(assert (=> b!455406 (= e!266199 (and e!266203 mapRes!19984))))

(declare-fun condMapEmpty!19984 () Bool)

(declare-fun mapDefault!19984 () ValueCell!5771)

(assert (=> b!455406 (= condMapEmpty!19984 (= (arr!13571 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5771)) mapDefault!19984)))))

(declare-fun b!455407 () Bool)

(declare-fun res!271630 () Bool)

(assert (=> b!455407 (=> (not res!271630) (not e!266202))))

(assert (=> b!455407 (= res!271630 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!19984 () Bool)

(declare-fun tp!38500 () Bool)

(declare-fun e!266198 () Bool)

(assert (=> mapNonEmpty!19984 (= mapRes!19984 (and tp!38500 e!266198))))

(declare-fun mapRest!19984 () (Array (_ BitVec 32) ValueCell!5771))

(declare-fun mapKey!19984 () (_ BitVec 32))

(declare-fun mapValue!19984 () ValueCell!5771)

(assert (=> mapNonEmpty!19984 (= (arr!13571 _values!549) (store mapRest!19984 mapKey!19984 mapValue!19984))))

(declare-fun b!455408 () Bool)

(declare-fun res!271629 () Bool)

(assert (=> b!455408 (=> (not res!271629) (not e!266200))))

(declare-datatypes ((List!8191 0))(
  ( (Nil!8188) (Cons!8187 (h!9043 (_ BitVec 64)) (t!14010 List!8191)) )
))
(declare-fun arrayNoDuplicates!0 (array!28253 (_ BitVec 32) List!8191) Bool)

(assert (=> b!455408 (= res!271629 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8188))))

(declare-fun b!455409 () Bool)

(declare-fun res!271634 () Bool)

(assert (=> b!455409 (=> (not res!271634) (not e!266200))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!455409 (= res!271634 (validKeyInArray!0 k0!794))))

(declare-fun b!455410 () Bool)

(declare-fun res!271627 () Bool)

(assert (=> b!455410 (=> (not res!271627) (not e!266202))))

(assert (=> b!455410 (= res!271627 (arrayNoDuplicates!0 lt!206149 #b00000000000000000000000000000000 Nil!8188))))

(declare-fun b!455411 () Bool)

(declare-fun tp_is_empty!12229 () Bool)

(assert (=> b!455411 (= e!266198 tp_is_empty!12229)))

(declare-fun mapIsEmpty!19984 () Bool)

(assert (=> mapIsEmpty!19984 mapRes!19984))

(declare-fun res!271628 () Bool)

(assert (=> start!40942 (=> (not res!271628) (not e!266200))))

(assert (=> start!40942 (= res!271628 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13923 _keys!709))))))

(assert (=> start!40942 e!266200))

(assert (=> start!40942 tp_is_empty!12229))

(assert (=> start!40942 tp!38499))

(assert (=> start!40942 true))

(declare-fun array_inv!9890 (array!28255) Bool)

(assert (=> start!40942 (and (array_inv!9890 _values!549) e!266199)))

(declare-fun array_inv!9891 (array!28253) Bool)

(assert (=> start!40942 (array_inv!9891 _keys!709)))

(declare-fun b!455401 () Bool)

(declare-fun res!271633 () Bool)

(assert (=> b!455401 (=> (not res!271633) (not e!266200))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!455401 (= res!271633 (validMask!0 mask!1025))))

(declare-fun b!455412 () Bool)

(declare-fun res!271626 () Bool)

(assert (=> b!455412 (=> (not res!271626) (not e!266200))))

(assert (=> b!455412 (= res!271626 (or (= (select (arr!13570 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13570 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!455413 () Bool)

(declare-fun res!271631 () Bool)

(assert (=> b!455413 (=> (not res!271631) (not e!266200))))

(assert (=> b!455413 (= res!271631 (and (= (size!13924 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13923 _keys!709) (size!13924 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!455414 () Bool)

(assert (=> b!455414 (= e!266203 tp_is_empty!12229)))

(declare-fun b!455415 () Bool)

(declare-fun res!271623 () Bool)

(assert (=> b!455415 (=> (not res!271623) (not e!266200))))

(declare-fun arrayContainsKey!0 (array!28253 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!455415 (= res!271623 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!40942 res!271628) b!455401))

(assert (= (and b!455401 res!271633) b!455413))

(assert (= (and b!455413 res!271631) b!455402))

(assert (= (and b!455402 res!271624) b!455408))

(assert (= (and b!455408 res!271629) b!455404))

(assert (= (and b!455404 res!271625) b!455409))

(assert (= (and b!455409 res!271634) b!455412))

(assert (= (and b!455412 res!271626) b!455415))

(assert (= (and b!455415 res!271623) b!455403))

(assert (= (and b!455403 res!271632) b!455410))

(assert (= (and b!455410 res!271627) b!455407))

(assert (= (and b!455407 res!271630) b!455405))

(assert (= (and b!455406 condMapEmpty!19984) mapIsEmpty!19984))

(assert (= (and b!455406 (not condMapEmpty!19984)) mapNonEmpty!19984))

(get-info :version)

(assert (= (and mapNonEmpty!19984 ((_ is ValueCellFull!5771) mapValue!19984)) b!455411))

(assert (= (and b!455406 ((_ is ValueCellFull!5771) mapDefault!19984)) b!455414))

(assert (= start!40942 b!455406))

(declare-fun m!438647 () Bool)

(assert (=> b!455409 m!438647))

(declare-fun m!438649 () Bool)

(assert (=> b!455401 m!438649))

(declare-fun m!438651 () Bool)

(assert (=> b!455415 m!438651))

(declare-fun m!438653 () Bool)

(assert (=> b!455405 m!438653))

(declare-fun m!438655 () Bool)

(assert (=> b!455405 m!438655))

(declare-fun m!438657 () Bool)

(assert (=> b!455405 m!438657))

(declare-fun m!438659 () Bool)

(assert (=> b!455412 m!438659))

(declare-fun m!438661 () Bool)

(assert (=> b!455408 m!438661))

(declare-fun m!438663 () Bool)

(assert (=> start!40942 m!438663))

(declare-fun m!438665 () Bool)

(assert (=> start!40942 m!438665))

(declare-fun m!438667 () Bool)

(assert (=> b!455402 m!438667))

(declare-fun m!438669 () Bool)

(assert (=> b!455410 m!438669))

(declare-fun m!438671 () Bool)

(assert (=> b!455403 m!438671))

(declare-fun m!438673 () Bool)

(assert (=> b!455403 m!438673))

(declare-fun m!438675 () Bool)

(assert (=> mapNonEmpty!19984 m!438675))

(check-sat (not b!455415) (not b!455405) (not start!40942) b_and!19007 (not mapNonEmpty!19984) (not b!455410) tp_is_empty!12229 (not b!455403) (not b_next!10891) (not b!455401) (not b!455408) (not b!455402) (not b!455409))
(check-sat b_and!19007 (not b_next!10891))
