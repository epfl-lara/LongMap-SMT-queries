; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37698 () Bool)

(assert start!37698)

(declare-fun b_free!8815 () Bool)

(declare-fun b_next!8815 () Bool)

(assert (=> start!37698 (= b_free!8815 (not b_next!8815))))

(declare-fun tp!31196 () Bool)

(declare-fun b_and!16031 () Bool)

(assert (=> start!37698 (= tp!31196 b_and!16031)))

(declare-fun b!386326 () Bool)

(declare-fun e!234327 () Bool)

(declare-fun tp_is_empty!9487 () Bool)

(assert (=> b!386326 (= e!234327 tp_is_empty!9487)))

(declare-fun res!220598 () Bool)

(declare-fun e!234331 () Bool)

(assert (=> start!37698 (=> (not res!220598) (not e!234331))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37698 (= res!220598 (validMask!0 mask!970))))

(assert (=> start!37698 e!234331))

(declare-datatypes ((V!13755 0))(
  ( (V!13756 (val!4788 Int)) )
))
(declare-datatypes ((ValueCell!4400 0))(
  ( (ValueCellFull!4400 (v!6979 V!13755)) (EmptyCell!4400) )
))
(declare-datatypes ((array!22857 0))(
  ( (array!22858 (arr!10897 (Array (_ BitVec 32) ValueCell!4400)) (size!11250 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22857)

(declare-fun e!234330 () Bool)

(declare-fun array_inv!8020 (array!22857) Bool)

(assert (=> start!37698 (and (array_inv!8020 _values!506) e!234330)))

(assert (=> start!37698 tp!31196))

(assert (=> start!37698 true))

(assert (=> start!37698 tp_is_empty!9487))

(declare-datatypes ((array!22859 0))(
  ( (array!22860 (arr!10898 (Array (_ BitVec 32) (_ BitVec 64))) (size!11251 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22859)

(declare-fun array_inv!8021 (array!22859) Bool)

(assert (=> start!37698 (array_inv!8021 _keys!658)))

(declare-fun b!386327 () Bool)

(declare-fun e!234328 () Bool)

(assert (=> b!386327 (= e!234331 e!234328)))

(declare-fun res!220604 () Bool)

(assert (=> b!386327 (=> (not res!220604) (not e!234328))))

(declare-fun lt!181611 () array!22859)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22859 (_ BitVec 32)) Bool)

(assert (=> b!386327 (= res!220604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181611 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!386327 (= lt!181611 (array!22860 (store (arr!10898 _keys!658) i!548 k0!778) (size!11251 _keys!658)))))

(declare-fun mapIsEmpty!15795 () Bool)

(declare-fun mapRes!15795 () Bool)

(assert (=> mapIsEmpty!15795 mapRes!15795))

(declare-fun b!386328 () Bool)

(declare-fun res!220601 () Bool)

(assert (=> b!386328 (=> (not res!220601) (not e!234331))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!386328 (= res!220601 (and (= (size!11250 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11251 _keys!658) (size!11250 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!386329 () Bool)

(declare-fun e!234329 () Bool)

(assert (=> b!386329 (= e!234330 (and e!234329 mapRes!15795))))

(declare-fun condMapEmpty!15795 () Bool)

(declare-fun mapDefault!15795 () ValueCell!4400)

(assert (=> b!386329 (= condMapEmpty!15795 (= (arr!10897 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4400)) mapDefault!15795)))))

(declare-fun b!386330 () Bool)

(declare-fun res!220602 () Bool)

(assert (=> b!386330 (=> (not res!220602) (not e!234331))))

(assert (=> b!386330 (= res!220602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!386331 () Bool)

(declare-fun res!220605 () Bool)

(assert (=> b!386331 (=> (not res!220605) (not e!234328))))

(declare-datatypes ((List!6254 0))(
  ( (Nil!6251) (Cons!6250 (h!7106 (_ BitVec 64)) (t!11395 List!6254)) )
))
(declare-fun arrayNoDuplicates!0 (array!22859 (_ BitVec 32) List!6254) Bool)

(assert (=> b!386331 (= res!220605 (arrayNoDuplicates!0 lt!181611 #b00000000000000000000000000000000 Nil!6251))))

(declare-fun b!386332 () Bool)

(assert (=> b!386332 (= e!234329 tp_is_empty!9487)))

(declare-fun b!386333 () Bool)

(declare-fun res!220600 () Bool)

(assert (=> b!386333 (=> (not res!220600) (not e!234331))))

(declare-fun arrayContainsKey!0 (array!22859 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!386333 (= res!220600 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15795 () Bool)

(declare-fun tp!31197 () Bool)

(assert (=> mapNonEmpty!15795 (= mapRes!15795 (and tp!31197 e!234327))))

(declare-fun mapValue!15795 () ValueCell!4400)

(declare-fun mapRest!15795 () (Array (_ BitVec 32) ValueCell!4400))

(declare-fun mapKey!15795 () (_ BitVec 32))

(assert (=> mapNonEmpty!15795 (= (arr!10897 _values!506) (store mapRest!15795 mapKey!15795 mapValue!15795))))

(declare-fun b!386334 () Bool)

(declare-fun res!220606 () Bool)

(assert (=> b!386334 (=> (not res!220606) (not e!234331))))

(assert (=> b!386334 (= res!220606 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11251 _keys!658))))))

(declare-fun b!386335 () Bool)

(declare-fun res!220607 () Bool)

(assert (=> b!386335 (=> (not res!220607) (not e!234331))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!386335 (= res!220607 (validKeyInArray!0 k0!778))))

(declare-fun b!386336 () Bool)

(declare-fun res!220599 () Bool)

(assert (=> b!386336 (=> (not res!220599) (not e!234331))))

(assert (=> b!386336 (= res!220599 (or (= (select (arr!10898 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10898 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!386337 () Bool)

(assert (=> b!386337 (= e!234328 false)))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13755)

(declare-datatypes ((tuple2!6422 0))(
  ( (tuple2!6423 (_1!3222 (_ BitVec 64)) (_2!3222 V!13755)) )
))
(declare-datatypes ((List!6255 0))(
  ( (Nil!6252) (Cons!6251 (h!7107 tuple2!6422) (t!11396 List!6255)) )
))
(declare-datatypes ((ListLongMap!5325 0))(
  ( (ListLongMap!5326 (toList!2678 List!6255)) )
))
(declare-fun lt!181609 () ListLongMap!5325)

(declare-fun v!373 () V!13755)

(declare-fun minValue!472 () V!13755)

(declare-fun getCurrentListMapNoExtraKeys!918 (array!22859 array!22857 (_ BitVec 32) (_ BitVec 32) V!13755 V!13755 (_ BitVec 32) Int) ListLongMap!5325)

(assert (=> b!386337 (= lt!181609 (getCurrentListMapNoExtraKeys!918 lt!181611 (array!22858 (store (arr!10897 _values!506) i!548 (ValueCellFull!4400 v!373)) (size!11250 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181610 () ListLongMap!5325)

(assert (=> b!386337 (= lt!181610 (getCurrentListMapNoExtraKeys!918 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!386338 () Bool)

(declare-fun res!220603 () Bool)

(assert (=> b!386338 (=> (not res!220603) (not e!234331))))

(assert (=> b!386338 (= res!220603 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6251))))

(assert (= (and start!37698 res!220598) b!386328))

(assert (= (and b!386328 res!220601) b!386330))

(assert (= (and b!386330 res!220602) b!386338))

(assert (= (and b!386338 res!220603) b!386334))

(assert (= (and b!386334 res!220606) b!386335))

(assert (= (and b!386335 res!220607) b!386336))

(assert (= (and b!386336 res!220599) b!386333))

(assert (= (and b!386333 res!220600) b!386327))

(assert (= (and b!386327 res!220604) b!386331))

(assert (= (and b!386331 res!220605) b!386337))

(assert (= (and b!386329 condMapEmpty!15795) mapIsEmpty!15795))

(assert (= (and b!386329 (not condMapEmpty!15795)) mapNonEmpty!15795))

(get-info :version)

(assert (= (and mapNonEmpty!15795 ((_ is ValueCellFull!4400) mapValue!15795)) b!386326))

(assert (= (and b!386329 ((_ is ValueCellFull!4400) mapDefault!15795)) b!386332))

(assert (= start!37698 b!386329))

(declare-fun m!382181 () Bool)

(assert (=> b!386327 m!382181))

(declare-fun m!382183 () Bool)

(assert (=> b!386327 m!382183))

(declare-fun m!382185 () Bool)

(assert (=> start!37698 m!382185))

(declare-fun m!382187 () Bool)

(assert (=> start!37698 m!382187))

(declare-fun m!382189 () Bool)

(assert (=> start!37698 m!382189))

(declare-fun m!382191 () Bool)

(assert (=> b!386336 m!382191))

(declare-fun m!382193 () Bool)

(assert (=> b!386335 m!382193))

(declare-fun m!382195 () Bool)

(assert (=> mapNonEmpty!15795 m!382195))

(declare-fun m!382197 () Bool)

(assert (=> b!386338 m!382197))

(declare-fun m!382199 () Bool)

(assert (=> b!386337 m!382199))

(declare-fun m!382201 () Bool)

(assert (=> b!386337 m!382201))

(declare-fun m!382203 () Bool)

(assert (=> b!386337 m!382203))

(declare-fun m!382205 () Bool)

(assert (=> b!386331 m!382205))

(declare-fun m!382207 () Bool)

(assert (=> b!386333 m!382207))

(declare-fun m!382209 () Bool)

(assert (=> b!386330 m!382209))

(check-sat (not b!386333) (not b!386330) (not b!386338) (not start!37698) (not b_next!8815) (not mapNonEmpty!15795) (not b!386331) (not b!386327) (not b!386335) tp_is_empty!9487 (not b!386337) b_and!16031)
(check-sat b_and!16031 (not b_next!8815))
