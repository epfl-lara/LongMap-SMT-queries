; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37674 () Bool)

(assert start!37674)

(declare-fun b_free!8791 () Bool)

(declare-fun b_next!8791 () Bool)

(assert (=> start!37674 (= b_free!8791 (not b_next!8791))))

(declare-fun tp!31124 () Bool)

(declare-fun b_and!16047 () Bool)

(assert (=> start!37674 (= tp!31124 b_and!16047)))

(declare-fun b!386080 () Bool)

(declare-fun e!234253 () Bool)

(declare-fun tp_is_empty!9463 () Bool)

(assert (=> b!386080 (= e!234253 tp_is_empty!9463)))

(declare-fun b!386081 () Bool)

(declare-fun res!220372 () Bool)

(declare-fun e!234258 () Bool)

(assert (=> b!386081 (=> (not res!220372) (not e!234258))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!386081 (= res!220372 (validKeyInArray!0 k0!778))))

(declare-fun b!386082 () Bool)

(declare-fun res!220364 () Bool)

(assert (=> b!386082 (=> (not res!220364) (not e!234258))))

(declare-datatypes ((array!22814 0))(
  ( (array!22815 (arr!10875 (Array (_ BitVec 32) (_ BitVec 64))) (size!11227 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22814)

(declare-fun arrayContainsKey!0 (array!22814 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!386082 (= res!220364 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!386083 () Bool)

(declare-fun res!220371 () Bool)

(assert (=> b!386083 (=> (not res!220371) (not e!234258))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22814 (_ BitVec 32)) Bool)

(assert (=> b!386083 (= res!220371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!386084 () Bool)

(declare-fun res!220366 () Bool)

(declare-fun e!234256 () Bool)

(assert (=> b!386084 (=> (not res!220366) (not e!234256))))

(declare-fun lt!181755 () array!22814)

(declare-datatypes ((List!6136 0))(
  ( (Nil!6133) (Cons!6132 (h!6988 (_ BitVec 64)) (t!11278 List!6136)) )
))
(declare-fun arrayNoDuplicates!0 (array!22814 (_ BitVec 32) List!6136) Bool)

(assert (=> b!386084 (= res!220366 (arrayNoDuplicates!0 lt!181755 #b00000000000000000000000000000000 Nil!6133))))

(declare-fun b!386085 () Bool)

(declare-fun res!220365 () Bool)

(assert (=> b!386085 (=> (not res!220365) (not e!234258))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13723 0))(
  ( (V!13724 (val!4776 Int)) )
))
(declare-datatypes ((ValueCell!4388 0))(
  ( (ValueCellFull!4388 (v!6974 V!13723)) (EmptyCell!4388) )
))
(declare-datatypes ((array!22816 0))(
  ( (array!22817 (arr!10876 (Array (_ BitVec 32) ValueCell!4388)) (size!11228 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22816)

(assert (=> b!386085 (= res!220365 (and (= (size!11228 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11227 _keys!658) (size!11228 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!15759 () Bool)

(declare-fun mapRes!15759 () Bool)

(declare-fun tp!31125 () Bool)

(assert (=> mapNonEmpty!15759 (= mapRes!15759 (and tp!31125 e!234253))))

(declare-fun mapKey!15759 () (_ BitVec 32))

(declare-fun mapRest!15759 () (Array (_ BitVec 32) ValueCell!4388))

(declare-fun mapValue!15759 () ValueCell!4388)

(assert (=> mapNonEmpty!15759 (= (arr!10876 _values!506) (store mapRest!15759 mapKey!15759 mapValue!15759))))

(declare-fun b!386086 () Bool)

(assert (=> b!386086 (= e!234258 e!234256)))

(declare-fun res!220373 () Bool)

(assert (=> b!386086 (=> (not res!220373) (not e!234256))))

(assert (=> b!386086 (= res!220373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181755 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!386086 (= lt!181755 (array!22815 (store (arr!10875 _keys!658) i!548 k0!778) (size!11227 _keys!658)))))

(declare-fun mapIsEmpty!15759 () Bool)

(assert (=> mapIsEmpty!15759 mapRes!15759))

(declare-fun b!386088 () Bool)

(declare-fun e!234257 () Bool)

(declare-fun e!234255 () Bool)

(assert (=> b!386088 (= e!234257 (and e!234255 mapRes!15759))))

(declare-fun condMapEmpty!15759 () Bool)

(declare-fun mapDefault!15759 () ValueCell!4388)

(assert (=> b!386088 (= condMapEmpty!15759 (= (arr!10876 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4388)) mapDefault!15759)))))

(declare-fun b!386089 () Bool)

(declare-fun res!220368 () Bool)

(assert (=> b!386089 (=> (not res!220368) (not e!234258))))

(assert (=> b!386089 (= res!220368 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11227 _keys!658))))))

(declare-fun b!386090 () Bool)

(declare-fun res!220369 () Bool)

(assert (=> b!386090 (=> (not res!220369) (not e!234258))))

(assert (=> b!386090 (= res!220369 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6133))))

(declare-fun b!386091 () Bool)

(assert (=> b!386091 (= e!234255 tp_is_empty!9463)))

(declare-fun b!386092 () Bool)

(declare-fun res!220367 () Bool)

(assert (=> b!386092 (=> (not res!220367) (not e!234258))))

(assert (=> b!386092 (= res!220367 (or (= (select (arr!10875 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10875 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!386087 () Bool)

(assert (=> b!386087 (= e!234256 false)))

(declare-datatypes ((tuple2!6288 0))(
  ( (tuple2!6289 (_1!3155 (_ BitVec 64)) (_2!3155 V!13723)) )
))
(declare-datatypes ((List!6137 0))(
  ( (Nil!6134) (Cons!6133 (h!6989 tuple2!6288) (t!11279 List!6137)) )
))
(declare-datatypes ((ListLongMap!5203 0))(
  ( (ListLongMap!5204 (toList!2617 List!6137)) )
))
(declare-fun lt!181756 () ListLongMap!5203)

(declare-fun zeroValue!472 () V!13723)

(declare-fun v!373 () V!13723)

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13723)

(declare-fun getCurrentListMapNoExtraKeys!892 (array!22814 array!22816 (_ BitVec 32) (_ BitVec 32) V!13723 V!13723 (_ BitVec 32) Int) ListLongMap!5203)

(assert (=> b!386087 (= lt!181756 (getCurrentListMapNoExtraKeys!892 lt!181755 (array!22817 (store (arr!10876 _values!506) i!548 (ValueCellFull!4388 v!373)) (size!11228 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181754 () ListLongMap!5203)

(assert (=> b!386087 (= lt!181754 (getCurrentListMapNoExtraKeys!892 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun res!220370 () Bool)

(assert (=> start!37674 (=> (not res!220370) (not e!234258))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37674 (= res!220370 (validMask!0 mask!970))))

(assert (=> start!37674 e!234258))

(declare-fun array_inv!8038 (array!22816) Bool)

(assert (=> start!37674 (and (array_inv!8038 _values!506) e!234257)))

(assert (=> start!37674 tp!31124))

(assert (=> start!37674 true))

(assert (=> start!37674 tp_is_empty!9463))

(declare-fun array_inv!8039 (array!22814) Bool)

(assert (=> start!37674 (array_inv!8039 _keys!658)))

(assert (= (and start!37674 res!220370) b!386085))

(assert (= (and b!386085 res!220365) b!386083))

(assert (= (and b!386083 res!220371) b!386090))

(assert (= (and b!386090 res!220369) b!386089))

(assert (= (and b!386089 res!220368) b!386081))

(assert (= (and b!386081 res!220372) b!386092))

(assert (= (and b!386092 res!220367) b!386082))

(assert (= (and b!386082 res!220364) b!386086))

(assert (= (and b!386086 res!220373) b!386084))

(assert (= (and b!386084 res!220366) b!386087))

(assert (= (and b!386088 condMapEmpty!15759) mapIsEmpty!15759))

(assert (= (and b!386088 (not condMapEmpty!15759)) mapNonEmpty!15759))

(get-info :version)

(assert (= (and mapNonEmpty!15759 ((_ is ValueCellFull!4388) mapValue!15759)) b!386080))

(assert (= (and b!386088 ((_ is ValueCellFull!4388) mapDefault!15759)) b!386091))

(assert (= start!37674 b!386088))

(declare-fun m!382775 () Bool)

(assert (=> b!386087 m!382775))

(declare-fun m!382777 () Bool)

(assert (=> b!386087 m!382777))

(declare-fun m!382779 () Bool)

(assert (=> b!386087 m!382779))

(declare-fun m!382781 () Bool)

(assert (=> mapNonEmpty!15759 m!382781))

(declare-fun m!382783 () Bool)

(assert (=> b!386090 m!382783))

(declare-fun m!382785 () Bool)

(assert (=> b!386082 m!382785))

(declare-fun m!382787 () Bool)

(assert (=> b!386083 m!382787))

(declare-fun m!382789 () Bool)

(assert (=> b!386092 m!382789))

(declare-fun m!382791 () Bool)

(assert (=> b!386084 m!382791))

(declare-fun m!382793 () Bool)

(assert (=> b!386086 m!382793))

(declare-fun m!382795 () Bool)

(assert (=> b!386086 m!382795))

(declare-fun m!382797 () Bool)

(assert (=> b!386081 m!382797))

(declare-fun m!382799 () Bool)

(assert (=> start!37674 m!382799))

(declare-fun m!382801 () Bool)

(assert (=> start!37674 m!382801))

(declare-fun m!382803 () Bool)

(assert (=> start!37674 m!382803))

(check-sat (not start!37674) (not b!386086) b_and!16047 (not b_next!8791) (not b!386090) (not mapNonEmpty!15759) (not b!386081) tp_is_empty!9463 (not b!386083) (not b!386082) (not b!386087) (not b!386084))
(check-sat b_and!16047 (not b_next!8791))
