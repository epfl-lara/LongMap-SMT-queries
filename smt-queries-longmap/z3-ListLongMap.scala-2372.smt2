; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37680 () Bool)

(assert start!37680)

(declare-fun b_free!8797 () Bool)

(declare-fun b_next!8797 () Bool)

(assert (=> start!37680 (= b_free!8797 (not b_next!8797))))

(declare-fun tp!31142 () Bool)

(declare-fun b_and!16053 () Bool)

(assert (=> start!37680 (= tp!31142 b_and!16053)))

(declare-fun b!386197 () Bool)

(declare-fun res!220455 () Bool)

(declare-fun e!234311 () Bool)

(assert (=> b!386197 (=> (not res!220455) (not e!234311))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!386197 (= res!220455 (validKeyInArray!0 k0!778))))

(declare-fun b!386198 () Bool)

(declare-fun res!220456 () Bool)

(declare-fun e!234309 () Bool)

(assert (=> b!386198 (=> (not res!220456) (not e!234309))))

(declare-datatypes ((array!22826 0))(
  ( (array!22827 (arr!10881 (Array (_ BitVec 32) (_ BitVec 64))) (size!11233 (_ BitVec 32))) )
))
(declare-fun lt!181782 () array!22826)

(declare-datatypes ((List!6140 0))(
  ( (Nil!6137) (Cons!6136 (h!6992 (_ BitVec 64)) (t!11282 List!6140)) )
))
(declare-fun arrayNoDuplicates!0 (array!22826 (_ BitVec 32) List!6140) Bool)

(assert (=> b!386198 (= res!220456 (arrayNoDuplicates!0 lt!181782 #b00000000000000000000000000000000 Nil!6137))))

(declare-fun res!220460 () Bool)

(assert (=> start!37680 (=> (not res!220460) (not e!234311))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37680 (= res!220460 (validMask!0 mask!970))))

(assert (=> start!37680 e!234311))

(declare-datatypes ((V!13731 0))(
  ( (V!13732 (val!4779 Int)) )
))
(declare-datatypes ((ValueCell!4391 0))(
  ( (ValueCellFull!4391 (v!6977 V!13731)) (EmptyCell!4391) )
))
(declare-datatypes ((array!22828 0))(
  ( (array!22829 (arr!10882 (Array (_ BitVec 32) ValueCell!4391)) (size!11234 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22828)

(declare-fun e!234310 () Bool)

(declare-fun array_inv!8044 (array!22828) Bool)

(assert (=> start!37680 (and (array_inv!8044 _values!506) e!234310)))

(assert (=> start!37680 tp!31142))

(assert (=> start!37680 true))

(declare-fun tp_is_empty!9469 () Bool)

(assert (=> start!37680 tp_is_empty!9469))

(declare-fun _keys!658 () array!22826)

(declare-fun array_inv!8045 (array!22826) Bool)

(assert (=> start!37680 (array_inv!8045 _keys!658)))

(declare-fun mapNonEmpty!15768 () Bool)

(declare-fun mapRes!15768 () Bool)

(declare-fun tp!31143 () Bool)

(declare-fun e!234312 () Bool)

(assert (=> mapNonEmpty!15768 (= mapRes!15768 (and tp!31143 e!234312))))

(declare-fun mapRest!15768 () (Array (_ BitVec 32) ValueCell!4391))

(declare-fun mapKey!15768 () (_ BitVec 32))

(declare-fun mapValue!15768 () ValueCell!4391)

(assert (=> mapNonEmpty!15768 (= (arr!10882 _values!506) (store mapRest!15768 mapKey!15768 mapValue!15768))))

(declare-fun b!386199 () Bool)

(declare-fun res!220462 () Bool)

(assert (=> b!386199 (=> (not res!220462) (not e!234311))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!386199 (= res!220462 (or (= (select (arr!10881 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10881 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!386200 () Bool)

(declare-fun res!220454 () Bool)

(assert (=> b!386200 (=> (not res!220454) (not e!234311))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!386200 (= res!220454 (and (= (size!11234 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11233 _keys!658) (size!11234 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!386201 () Bool)

(assert (=> b!386201 (= e!234311 e!234309)))

(declare-fun res!220459 () Bool)

(assert (=> b!386201 (=> (not res!220459) (not e!234309))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22826 (_ BitVec 32)) Bool)

(assert (=> b!386201 (= res!220459 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181782 mask!970))))

(assert (=> b!386201 (= lt!181782 (array!22827 (store (arr!10881 _keys!658) i!548 k0!778) (size!11233 _keys!658)))))

(declare-fun b!386202 () Bool)

(declare-fun e!234307 () Bool)

(assert (=> b!386202 (= e!234310 (and e!234307 mapRes!15768))))

(declare-fun condMapEmpty!15768 () Bool)

(declare-fun mapDefault!15768 () ValueCell!4391)

(assert (=> b!386202 (= condMapEmpty!15768 (= (arr!10882 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4391)) mapDefault!15768)))))

(declare-fun b!386203 () Bool)

(assert (=> b!386203 (= e!234312 tp_is_empty!9469)))

(declare-fun b!386204 () Bool)

(declare-fun res!220458 () Bool)

(assert (=> b!386204 (=> (not res!220458) (not e!234311))))

(declare-fun arrayContainsKey!0 (array!22826 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!386204 (= res!220458 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!386205 () Bool)

(declare-fun res!220457 () Bool)

(assert (=> b!386205 (=> (not res!220457) (not e!234311))))

(assert (=> b!386205 (= res!220457 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6137))))

(declare-fun mapIsEmpty!15768 () Bool)

(assert (=> mapIsEmpty!15768 mapRes!15768))

(declare-fun b!386206 () Bool)

(declare-fun res!220463 () Bool)

(assert (=> b!386206 (=> (not res!220463) (not e!234311))))

(assert (=> b!386206 (= res!220463 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11233 _keys!658))))))

(declare-fun b!386207 () Bool)

(declare-fun res!220461 () Bool)

(assert (=> b!386207 (=> (not res!220461) (not e!234311))))

(assert (=> b!386207 (= res!220461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!386208 () Bool)

(assert (=> b!386208 (= e!234307 tp_is_empty!9469)))

(declare-fun b!386209 () Bool)

(assert (=> b!386209 (= e!234309 false)))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6290 0))(
  ( (tuple2!6291 (_1!3156 (_ BitVec 64)) (_2!3156 V!13731)) )
))
(declare-datatypes ((List!6141 0))(
  ( (Nil!6138) (Cons!6137 (h!6993 tuple2!6290) (t!11283 List!6141)) )
))
(declare-datatypes ((ListLongMap!5205 0))(
  ( (ListLongMap!5206 (toList!2618 List!6141)) )
))
(declare-fun lt!181781 () ListLongMap!5205)

(declare-fun zeroValue!472 () V!13731)

(declare-fun v!373 () V!13731)

(declare-fun minValue!472 () V!13731)

(declare-fun getCurrentListMapNoExtraKeys!893 (array!22826 array!22828 (_ BitVec 32) (_ BitVec 32) V!13731 V!13731 (_ BitVec 32) Int) ListLongMap!5205)

(assert (=> b!386209 (= lt!181781 (getCurrentListMapNoExtraKeys!893 lt!181782 (array!22829 (store (arr!10882 _values!506) i!548 (ValueCellFull!4391 v!373)) (size!11234 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181783 () ListLongMap!5205)

(assert (=> b!386209 (= lt!181783 (getCurrentListMapNoExtraKeys!893 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and start!37680 res!220460) b!386200))

(assert (= (and b!386200 res!220454) b!386207))

(assert (= (and b!386207 res!220461) b!386205))

(assert (= (and b!386205 res!220457) b!386206))

(assert (= (and b!386206 res!220463) b!386197))

(assert (= (and b!386197 res!220455) b!386199))

(assert (= (and b!386199 res!220462) b!386204))

(assert (= (and b!386204 res!220458) b!386201))

(assert (= (and b!386201 res!220459) b!386198))

(assert (= (and b!386198 res!220456) b!386209))

(assert (= (and b!386202 condMapEmpty!15768) mapIsEmpty!15768))

(assert (= (and b!386202 (not condMapEmpty!15768)) mapNonEmpty!15768))

(get-info :version)

(assert (= (and mapNonEmpty!15768 ((_ is ValueCellFull!4391) mapValue!15768)) b!386203))

(assert (= (and b!386202 ((_ is ValueCellFull!4391) mapDefault!15768)) b!386208))

(assert (= start!37680 b!386202))

(declare-fun m!382865 () Bool)

(assert (=> b!386205 m!382865))

(declare-fun m!382867 () Bool)

(assert (=> b!386201 m!382867))

(declare-fun m!382869 () Bool)

(assert (=> b!386201 m!382869))

(declare-fun m!382871 () Bool)

(assert (=> b!386204 m!382871))

(declare-fun m!382873 () Bool)

(assert (=> b!386198 m!382873))

(declare-fun m!382875 () Bool)

(assert (=> b!386209 m!382875))

(declare-fun m!382877 () Bool)

(assert (=> b!386209 m!382877))

(declare-fun m!382879 () Bool)

(assert (=> b!386209 m!382879))

(declare-fun m!382881 () Bool)

(assert (=> b!386207 m!382881))

(declare-fun m!382883 () Bool)

(assert (=> b!386197 m!382883))

(declare-fun m!382885 () Bool)

(assert (=> b!386199 m!382885))

(declare-fun m!382887 () Bool)

(assert (=> mapNonEmpty!15768 m!382887))

(declare-fun m!382889 () Bool)

(assert (=> start!37680 m!382889))

(declare-fun m!382891 () Bool)

(assert (=> start!37680 m!382891))

(declare-fun m!382893 () Bool)

(assert (=> start!37680 m!382893))

(check-sat (not b_next!8797) b_and!16053 (not b!386201) (not b!386198) (not start!37680) tp_is_empty!9469 (not b!386205) (not mapNonEmpty!15768) (not b!386207) (not b!386204) (not b!386209) (not b!386197))
(check-sat b_and!16053 (not b_next!8797))
