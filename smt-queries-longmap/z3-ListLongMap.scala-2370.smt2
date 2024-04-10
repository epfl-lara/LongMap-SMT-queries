; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37684 () Bool)

(assert start!37684)

(declare-fun b_free!8787 () Bool)

(declare-fun b_next!8787 () Bool)

(assert (=> start!37684 (= b_free!8787 (not b_next!8787))))

(declare-fun tp!31112 () Bool)

(declare-fun b_and!16029 () Bool)

(assert (=> start!37684 (= tp!31112 b_and!16029)))

(declare-fun b!386051 () Bool)

(declare-fun e!234252 () Bool)

(declare-fun e!234254 () Bool)

(assert (=> b!386051 (= e!234252 e!234254)))

(declare-fun res!220308 () Bool)

(assert (=> b!386051 (=> (not res!220308) (not e!234254))))

(declare-datatypes ((array!22817 0))(
  ( (array!22818 (arr!10877 (Array (_ BitVec 32) (_ BitVec 64))) (size!11229 (_ BitVec 32))) )
))
(declare-fun lt!181718 () array!22817)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22817 (_ BitVec 32)) Bool)

(assert (=> b!386051 (= res!220308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181718 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!22817)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!386051 (= lt!181718 (array!22818 (store (arr!10877 _keys!658) i!548 k0!778) (size!11229 _keys!658)))))

(declare-fun b!386052 () Bool)

(declare-fun res!220309 () Bool)

(assert (=> b!386052 (=> (not res!220309) (not e!234252))))

(assert (=> b!386052 (= res!220309 (or (= (select (arr!10877 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10877 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15753 () Bool)

(declare-fun mapRes!15753 () Bool)

(assert (=> mapIsEmpty!15753 mapRes!15753))

(declare-fun b!386053 () Bool)

(declare-fun res!220316 () Bool)

(assert (=> b!386053 (=> (not res!220316) (not e!234254))))

(declare-datatypes ((List!6264 0))(
  ( (Nil!6261) (Cons!6260 (h!7116 (_ BitVec 64)) (t!11414 List!6264)) )
))
(declare-fun arrayNoDuplicates!0 (array!22817 (_ BitVec 32) List!6264) Bool)

(assert (=> b!386053 (= res!220316 (arrayNoDuplicates!0 lt!181718 #b00000000000000000000000000000000 Nil!6261))))

(declare-fun b!386054 () Bool)

(declare-fun res!220312 () Bool)

(assert (=> b!386054 (=> (not res!220312) (not e!234252))))

(assert (=> b!386054 (= res!220312 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6261))))

(declare-fun b!386055 () Bool)

(assert (=> b!386055 (= e!234254 false)))

(declare-datatypes ((V!13717 0))(
  ( (V!13718 (val!4774 Int)) )
))
(declare-datatypes ((ValueCell!4386 0))(
  ( (ValueCellFull!4386 (v!6971 V!13717)) (EmptyCell!4386) )
))
(declare-datatypes ((array!22819 0))(
  ( (array!22820 (arr!10878 (Array (_ BitVec 32) ValueCell!4386)) (size!11230 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22819)

(declare-datatypes ((tuple2!6418 0))(
  ( (tuple2!6419 (_1!3220 (_ BitVec 64)) (_2!3220 V!13717)) )
))
(declare-datatypes ((List!6265 0))(
  ( (Nil!6262) (Cons!6261 (h!7117 tuple2!6418) (t!11415 List!6265)) )
))
(declare-datatypes ((ListLongMap!5331 0))(
  ( (ListLongMap!5332 (toList!2681 List!6265)) )
))
(declare-fun lt!181717 () ListLongMap!5331)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13717)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13717)

(declare-fun minValue!472 () V!13717)

(declare-fun getCurrentListMapNoExtraKeys!910 (array!22817 array!22819 (_ BitVec 32) (_ BitVec 32) V!13717 V!13717 (_ BitVec 32) Int) ListLongMap!5331)

(assert (=> b!386055 (= lt!181717 (getCurrentListMapNoExtraKeys!910 lt!181718 (array!22820 (store (arr!10878 _values!506) i!548 (ValueCellFull!4386 v!373)) (size!11230 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181719 () ListLongMap!5331)

(assert (=> b!386055 (= lt!181719 (getCurrentListMapNoExtraKeys!910 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!386056 () Bool)

(declare-fun res!220314 () Bool)

(assert (=> b!386056 (=> (not res!220314) (not e!234252))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!386056 (= res!220314 (validKeyInArray!0 k0!778))))

(declare-fun b!386057 () Bool)

(declare-fun res!220311 () Bool)

(assert (=> b!386057 (=> (not res!220311) (not e!234252))))

(assert (=> b!386057 (= res!220311 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!386058 () Bool)

(declare-fun e!234251 () Bool)

(declare-fun e!234253 () Bool)

(assert (=> b!386058 (= e!234251 (and e!234253 mapRes!15753))))

(declare-fun condMapEmpty!15753 () Bool)

(declare-fun mapDefault!15753 () ValueCell!4386)

(assert (=> b!386058 (= condMapEmpty!15753 (= (arr!10878 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4386)) mapDefault!15753)))))

(declare-fun mapNonEmpty!15753 () Bool)

(declare-fun tp!31113 () Bool)

(declare-fun e!234250 () Bool)

(assert (=> mapNonEmpty!15753 (= mapRes!15753 (and tp!31113 e!234250))))

(declare-fun mapValue!15753 () ValueCell!4386)

(declare-fun mapRest!15753 () (Array (_ BitVec 32) ValueCell!4386))

(declare-fun mapKey!15753 () (_ BitVec 32))

(assert (=> mapNonEmpty!15753 (= (arr!10878 _values!506) (store mapRest!15753 mapKey!15753 mapValue!15753))))

(declare-fun b!386060 () Bool)

(declare-fun tp_is_empty!9459 () Bool)

(assert (=> b!386060 (= e!234250 tp_is_empty!9459)))

(declare-fun b!386061 () Bool)

(declare-fun res!220313 () Bool)

(assert (=> b!386061 (=> (not res!220313) (not e!234252))))

(declare-fun arrayContainsKey!0 (array!22817 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!386061 (= res!220313 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun res!220307 () Bool)

(assert (=> start!37684 (=> (not res!220307) (not e!234252))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37684 (= res!220307 (validMask!0 mask!970))))

(assert (=> start!37684 e!234252))

(declare-fun array_inv!8006 (array!22819) Bool)

(assert (=> start!37684 (and (array_inv!8006 _values!506) e!234251)))

(assert (=> start!37684 tp!31112))

(assert (=> start!37684 true))

(assert (=> start!37684 tp_is_empty!9459))

(declare-fun array_inv!8007 (array!22817) Bool)

(assert (=> start!37684 (array_inv!8007 _keys!658)))

(declare-fun b!386059 () Bool)

(declare-fun res!220310 () Bool)

(assert (=> b!386059 (=> (not res!220310) (not e!234252))))

(assert (=> b!386059 (= res!220310 (and (= (size!11230 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11229 _keys!658) (size!11230 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!386062 () Bool)

(declare-fun res!220315 () Bool)

(assert (=> b!386062 (=> (not res!220315) (not e!234252))))

(assert (=> b!386062 (= res!220315 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11229 _keys!658))))))

(declare-fun b!386063 () Bool)

(assert (=> b!386063 (= e!234253 tp_is_empty!9459)))

(assert (= (and start!37684 res!220307) b!386059))

(assert (= (and b!386059 res!220310) b!386057))

(assert (= (and b!386057 res!220311) b!386054))

(assert (= (and b!386054 res!220312) b!386062))

(assert (= (and b!386062 res!220315) b!386056))

(assert (= (and b!386056 res!220314) b!386052))

(assert (= (and b!386052 res!220309) b!386061))

(assert (= (and b!386061 res!220313) b!386051))

(assert (= (and b!386051 res!220308) b!386053))

(assert (= (and b!386053 res!220316) b!386055))

(assert (= (and b!386058 condMapEmpty!15753) mapIsEmpty!15753))

(assert (= (and b!386058 (not condMapEmpty!15753)) mapNonEmpty!15753))

(get-info :version)

(assert (= (and mapNonEmpty!15753 ((_ is ValueCellFull!4386) mapValue!15753)) b!386060))

(assert (= (and b!386058 ((_ is ValueCellFull!4386) mapDefault!15753)) b!386063))

(assert (= start!37684 b!386058))

(declare-fun m!382485 () Bool)

(assert (=> b!386055 m!382485))

(declare-fun m!382487 () Bool)

(assert (=> b!386055 m!382487))

(declare-fun m!382489 () Bool)

(assert (=> b!386055 m!382489))

(declare-fun m!382491 () Bool)

(assert (=> b!386054 m!382491))

(declare-fun m!382493 () Bool)

(assert (=> start!37684 m!382493))

(declare-fun m!382495 () Bool)

(assert (=> start!37684 m!382495))

(declare-fun m!382497 () Bool)

(assert (=> start!37684 m!382497))

(declare-fun m!382499 () Bool)

(assert (=> b!386052 m!382499))

(declare-fun m!382501 () Bool)

(assert (=> b!386061 m!382501))

(declare-fun m!382503 () Bool)

(assert (=> b!386053 m!382503))

(declare-fun m!382505 () Bool)

(assert (=> b!386057 m!382505))

(declare-fun m!382507 () Bool)

(assert (=> mapNonEmpty!15753 m!382507))

(declare-fun m!382509 () Bool)

(assert (=> b!386051 m!382509))

(declare-fun m!382511 () Bool)

(assert (=> b!386051 m!382511))

(declare-fun m!382513 () Bool)

(assert (=> b!386056 m!382513))

(check-sat tp_is_empty!9459 (not b!386057) (not b!386056) (not b!386051) (not mapNonEmpty!15753) (not b!386053) (not b!386054) (not b!386061) (not b!386055) (not start!37684) (not b_next!8787) b_and!16029)
(check-sat b_and!16029 (not b_next!8787))
