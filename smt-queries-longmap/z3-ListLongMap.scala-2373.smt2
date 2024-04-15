; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37686 () Bool)

(assert start!37686)

(declare-fun b_free!8803 () Bool)

(declare-fun b_next!8803 () Bool)

(assert (=> start!37686 (= b_free!8803 (not b_next!8803))))

(declare-fun tp!31161 () Bool)

(declare-fun b_and!16019 () Bool)

(assert (=> start!37686 (= tp!31161 b_and!16019)))

(declare-fun b!386092 () Bool)

(declare-fun e!234224 () Bool)

(declare-fun e!234220 () Bool)

(declare-fun mapRes!15777 () Bool)

(assert (=> b!386092 (= e!234224 (and e!234220 mapRes!15777))))

(declare-fun condMapEmpty!15777 () Bool)

(declare-datatypes ((V!13739 0))(
  ( (V!13740 (val!4782 Int)) )
))
(declare-datatypes ((ValueCell!4394 0))(
  ( (ValueCellFull!4394 (v!6973 V!13739)) (EmptyCell!4394) )
))
(declare-datatypes ((array!22833 0))(
  ( (array!22834 (arr!10885 (Array (_ BitVec 32) ValueCell!4394)) (size!11238 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22833)

(declare-fun mapDefault!15777 () ValueCell!4394)

(assert (=> b!386092 (= condMapEmpty!15777 (= (arr!10885 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4394)) mapDefault!15777)))))

(declare-fun b!386093 () Bool)

(declare-fun e!234221 () Bool)

(declare-fun tp_is_empty!9475 () Bool)

(assert (=> b!386093 (= e!234221 tp_is_empty!9475)))

(declare-fun b!386094 () Bool)

(declare-fun res!220418 () Bool)

(declare-fun e!234222 () Bool)

(assert (=> b!386094 (=> (not res!220418) (not e!234222))))

(declare-datatypes ((array!22835 0))(
  ( (array!22836 (arr!10886 (Array (_ BitVec 32) (_ BitVec 64))) (size!11239 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22835)

(declare-datatypes ((List!6244 0))(
  ( (Nil!6241) (Cons!6240 (h!7096 (_ BitVec 64)) (t!11385 List!6244)) )
))
(declare-fun arrayNoDuplicates!0 (array!22835 (_ BitVec 32) List!6244) Bool)

(assert (=> b!386094 (= res!220418 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6241))))

(declare-fun b!386095 () Bool)

(assert (=> b!386095 (= e!234220 tp_is_empty!9475)))

(declare-fun mapIsEmpty!15777 () Bool)

(assert (=> mapIsEmpty!15777 mapRes!15777))

(declare-fun res!220427 () Bool)

(assert (=> start!37686 (=> (not res!220427) (not e!234222))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37686 (= res!220427 (validMask!0 mask!970))))

(assert (=> start!37686 e!234222))

(declare-fun array_inv!8008 (array!22833) Bool)

(assert (=> start!37686 (and (array_inv!8008 _values!506) e!234224)))

(assert (=> start!37686 tp!31161))

(assert (=> start!37686 true))

(assert (=> start!37686 tp_is_empty!9475))

(declare-fun array_inv!8009 (array!22835) Bool)

(assert (=> start!37686 (array_inv!8009 _keys!658)))

(declare-fun b!386096 () Bool)

(declare-fun res!220421 () Bool)

(declare-fun e!234219 () Bool)

(assert (=> b!386096 (=> (not res!220421) (not e!234219))))

(declare-fun lt!181555 () array!22835)

(assert (=> b!386096 (= res!220421 (arrayNoDuplicates!0 lt!181555 #b00000000000000000000000000000000 Nil!6241))))

(declare-fun b!386097 () Bool)

(declare-fun res!220426 () Bool)

(assert (=> b!386097 (=> (not res!220426) (not e!234222))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!386097 (= res!220426 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11239 _keys!658))))))

(declare-fun b!386098 () Bool)

(declare-fun res!220420 () Bool)

(assert (=> b!386098 (=> (not res!220420) (not e!234222))))

(assert (=> b!386098 (= res!220420 (or (= (select (arr!10886 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10886 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!386099 () Bool)

(declare-fun res!220422 () Bool)

(assert (=> b!386099 (=> (not res!220422) (not e!234222))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22835 (_ BitVec 32)) Bool)

(assert (=> b!386099 (= res!220422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!386100 () Bool)

(assert (=> b!386100 (= e!234219 false)))

(declare-datatypes ((tuple2!6412 0))(
  ( (tuple2!6413 (_1!3217 (_ BitVec 64)) (_2!3217 V!13739)) )
))
(declare-datatypes ((List!6245 0))(
  ( (Nil!6242) (Cons!6241 (h!7097 tuple2!6412) (t!11386 List!6245)) )
))
(declare-datatypes ((ListLongMap!5315 0))(
  ( (ListLongMap!5316 (toList!2673 List!6245)) )
))
(declare-fun lt!181557 () ListLongMap!5315)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13739)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13739)

(declare-fun minValue!472 () V!13739)

(declare-fun getCurrentListMapNoExtraKeys!913 (array!22835 array!22833 (_ BitVec 32) (_ BitVec 32) V!13739 V!13739 (_ BitVec 32) Int) ListLongMap!5315)

(assert (=> b!386100 (= lt!181557 (getCurrentListMapNoExtraKeys!913 lt!181555 (array!22834 (store (arr!10885 _values!506) i!548 (ValueCellFull!4394 v!373)) (size!11238 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181556 () ListLongMap!5315)

(assert (=> b!386100 (= lt!181556 (getCurrentListMapNoExtraKeys!913 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!386101 () Bool)

(assert (=> b!386101 (= e!234222 e!234219)))

(declare-fun res!220423 () Bool)

(assert (=> b!386101 (=> (not res!220423) (not e!234219))))

(assert (=> b!386101 (= res!220423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181555 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!386101 (= lt!181555 (array!22836 (store (arr!10886 _keys!658) i!548 k0!778) (size!11239 _keys!658)))))

(declare-fun b!386102 () Bool)

(declare-fun res!220425 () Bool)

(assert (=> b!386102 (=> (not res!220425) (not e!234222))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!386102 (= res!220425 (validKeyInArray!0 k0!778))))

(declare-fun b!386103 () Bool)

(declare-fun res!220424 () Bool)

(assert (=> b!386103 (=> (not res!220424) (not e!234222))))

(assert (=> b!386103 (= res!220424 (and (= (size!11238 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11239 _keys!658) (size!11238 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!386104 () Bool)

(declare-fun res!220419 () Bool)

(assert (=> b!386104 (=> (not res!220419) (not e!234222))))

(declare-fun arrayContainsKey!0 (array!22835 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!386104 (= res!220419 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15777 () Bool)

(declare-fun tp!31160 () Bool)

(assert (=> mapNonEmpty!15777 (= mapRes!15777 (and tp!31160 e!234221))))

(declare-fun mapValue!15777 () ValueCell!4394)

(declare-fun mapRest!15777 () (Array (_ BitVec 32) ValueCell!4394))

(declare-fun mapKey!15777 () (_ BitVec 32))

(assert (=> mapNonEmpty!15777 (= (arr!10885 _values!506) (store mapRest!15777 mapKey!15777 mapValue!15777))))

(assert (= (and start!37686 res!220427) b!386103))

(assert (= (and b!386103 res!220424) b!386099))

(assert (= (and b!386099 res!220422) b!386094))

(assert (= (and b!386094 res!220418) b!386097))

(assert (= (and b!386097 res!220426) b!386102))

(assert (= (and b!386102 res!220425) b!386098))

(assert (= (and b!386098 res!220420) b!386104))

(assert (= (and b!386104 res!220419) b!386101))

(assert (= (and b!386101 res!220423) b!386096))

(assert (= (and b!386096 res!220421) b!386100))

(assert (= (and b!386092 condMapEmpty!15777) mapIsEmpty!15777))

(assert (= (and b!386092 (not condMapEmpty!15777)) mapNonEmpty!15777))

(get-info :version)

(assert (= (and mapNonEmpty!15777 ((_ is ValueCellFull!4394) mapValue!15777)) b!386093))

(assert (= (and b!386092 ((_ is ValueCellFull!4394) mapDefault!15777)) b!386095))

(assert (= start!37686 b!386092))

(declare-fun m!382001 () Bool)

(assert (=> b!386104 m!382001))

(declare-fun m!382003 () Bool)

(assert (=> b!386099 m!382003))

(declare-fun m!382005 () Bool)

(assert (=> b!386100 m!382005))

(declare-fun m!382007 () Bool)

(assert (=> b!386100 m!382007))

(declare-fun m!382009 () Bool)

(assert (=> b!386100 m!382009))

(declare-fun m!382011 () Bool)

(assert (=> b!386096 m!382011))

(declare-fun m!382013 () Bool)

(assert (=> b!386094 m!382013))

(declare-fun m!382015 () Bool)

(assert (=> b!386102 m!382015))

(declare-fun m!382017 () Bool)

(assert (=> start!37686 m!382017))

(declare-fun m!382019 () Bool)

(assert (=> start!37686 m!382019))

(declare-fun m!382021 () Bool)

(assert (=> start!37686 m!382021))

(declare-fun m!382023 () Bool)

(assert (=> b!386098 m!382023))

(declare-fun m!382025 () Bool)

(assert (=> mapNonEmpty!15777 m!382025))

(declare-fun m!382027 () Bool)

(assert (=> b!386101 m!382027))

(declare-fun m!382029 () Bool)

(assert (=> b!386101 m!382029))

(check-sat (not mapNonEmpty!15777) b_and!16019 tp_is_empty!9475 (not start!37686) (not b!386094) (not b!386100) (not b!386099) (not b!386101) (not b!386102) (not b!386096) (not b!386104) (not b_next!8803))
(check-sat b_and!16019 (not b_next!8803))
