; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37734 () Bool)

(assert start!37734)

(declare-fun b_free!8851 () Bool)

(declare-fun b_next!8851 () Bool)

(assert (=> start!37734 (= b_free!8851 (not b_next!8851))))

(declare-fun tp!31304 () Bool)

(declare-fun b_and!16067 () Bool)

(assert (=> start!37734 (= tp!31304 b_and!16067)))

(declare-fun mapNonEmpty!15849 () Bool)

(declare-fun mapRes!15849 () Bool)

(declare-fun tp!31305 () Bool)

(declare-fun e!234653 () Bool)

(assert (=> mapNonEmpty!15849 (= mapRes!15849 (and tp!31305 e!234653))))

(declare-datatypes ((V!13803 0))(
  ( (V!13804 (val!4806 Int)) )
))
(declare-datatypes ((ValueCell!4418 0))(
  ( (ValueCellFull!4418 (v!6997 V!13803)) (EmptyCell!4418) )
))
(declare-datatypes ((array!22927 0))(
  ( (array!22928 (arr!10932 (Array (_ BitVec 32) ValueCell!4418)) (size!11285 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22927)

(declare-fun mapKey!15849 () (_ BitVec 32))

(declare-fun mapRest!15849 () (Array (_ BitVec 32) ValueCell!4418))

(declare-fun mapValue!15849 () ValueCell!4418)

(assert (=> mapNonEmpty!15849 (= (arr!10932 _values!506) (store mapRest!15849 mapKey!15849 mapValue!15849))))

(declare-fun b!387028 () Bool)

(declare-fun res!221138 () Bool)

(declare-fun e!234652 () Bool)

(assert (=> b!387028 (=> (not res!221138) (not e!234652))))

(declare-datatypes ((array!22929 0))(
  ( (array!22930 (arr!10933 (Array (_ BitVec 32) (_ BitVec 64))) (size!11286 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22929)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!387028 (= res!221138 (or (= (select (arr!10933 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10933 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!387029 () Bool)

(declare-fun res!221140 () Bool)

(declare-fun e!234654 () Bool)

(assert (=> b!387029 (=> (not res!221140) (not e!234654))))

(declare-fun lt!181773 () array!22929)

(declare-datatypes ((List!6277 0))(
  ( (Nil!6274) (Cons!6273 (h!7129 (_ BitVec 64)) (t!11418 List!6277)) )
))
(declare-fun arrayNoDuplicates!0 (array!22929 (_ BitVec 32) List!6277) Bool)

(assert (=> b!387029 (= res!221140 (arrayNoDuplicates!0 lt!181773 #b00000000000000000000000000000000 Nil!6274))))

(declare-fun b!387030 () Bool)

(declare-fun res!221147 () Bool)

(assert (=> b!387030 (=> (not res!221147) (not e!234652))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22929 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!387030 (= res!221147 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!387031 () Bool)

(declare-fun e!234651 () Bool)

(declare-fun e!234656 () Bool)

(assert (=> b!387031 (= e!234651 (and e!234656 mapRes!15849))))

(declare-fun condMapEmpty!15849 () Bool)

(declare-fun mapDefault!15849 () ValueCell!4418)

(assert (=> b!387031 (= condMapEmpty!15849 (= (arr!10932 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4418)) mapDefault!15849)))))

(declare-fun res!221141 () Bool)

(assert (=> start!37734 (=> (not res!221141) (not e!234652))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37734 (= res!221141 (validMask!0 mask!970))))

(assert (=> start!37734 e!234652))

(declare-fun array_inv!8042 (array!22927) Bool)

(assert (=> start!37734 (and (array_inv!8042 _values!506) e!234651)))

(assert (=> start!37734 tp!31304))

(assert (=> start!37734 true))

(declare-fun tp_is_empty!9523 () Bool)

(assert (=> start!37734 tp_is_empty!9523))

(declare-fun array_inv!8043 (array!22929) Bool)

(assert (=> start!37734 (array_inv!8043 _keys!658)))

(declare-fun mapIsEmpty!15849 () Bool)

(assert (=> mapIsEmpty!15849 mapRes!15849))

(declare-fun b!387032 () Bool)

(assert (=> b!387032 (= e!234654 false)))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13803)

(declare-datatypes ((tuple2!6440 0))(
  ( (tuple2!6441 (_1!3231 (_ BitVec 64)) (_2!3231 V!13803)) )
))
(declare-datatypes ((List!6278 0))(
  ( (Nil!6275) (Cons!6274 (h!7130 tuple2!6440) (t!11419 List!6278)) )
))
(declare-datatypes ((ListLongMap!5343 0))(
  ( (ListLongMap!5344 (toList!2687 List!6278)) )
))
(declare-fun lt!181771 () ListLongMap!5343)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13803)

(declare-fun minValue!472 () V!13803)

(declare-fun getCurrentListMapNoExtraKeys!927 (array!22929 array!22927 (_ BitVec 32) (_ BitVec 32) V!13803 V!13803 (_ BitVec 32) Int) ListLongMap!5343)

(assert (=> b!387032 (= lt!181771 (getCurrentListMapNoExtraKeys!927 lt!181773 (array!22928 (store (arr!10932 _values!506) i!548 (ValueCellFull!4418 v!373)) (size!11285 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181772 () ListLongMap!5343)

(assert (=> b!387032 (= lt!181772 (getCurrentListMapNoExtraKeys!927 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!387033 () Bool)

(assert (=> b!387033 (= e!234656 tp_is_empty!9523)))

(declare-fun b!387034 () Bool)

(declare-fun res!221143 () Bool)

(assert (=> b!387034 (=> (not res!221143) (not e!234652))))

(assert (=> b!387034 (= res!221143 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6274))))

(declare-fun b!387035 () Bool)

(declare-fun res!221144 () Bool)

(assert (=> b!387035 (=> (not res!221144) (not e!234652))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!387035 (= res!221144 (validKeyInArray!0 k0!778))))

(declare-fun b!387036 () Bool)

(declare-fun res!221139 () Bool)

(assert (=> b!387036 (=> (not res!221139) (not e!234652))))

(assert (=> b!387036 (= res!221139 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11286 _keys!658))))))

(declare-fun b!387037 () Bool)

(declare-fun res!221146 () Bool)

(assert (=> b!387037 (=> (not res!221146) (not e!234652))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22929 (_ BitVec 32)) Bool)

(assert (=> b!387037 (= res!221146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!387038 () Bool)

(assert (=> b!387038 (= e!234653 tp_is_empty!9523)))

(declare-fun b!387039 () Bool)

(declare-fun res!221145 () Bool)

(assert (=> b!387039 (=> (not res!221145) (not e!234652))))

(assert (=> b!387039 (= res!221145 (and (= (size!11285 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11286 _keys!658) (size!11285 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!387040 () Bool)

(assert (=> b!387040 (= e!234652 e!234654)))

(declare-fun res!221142 () Bool)

(assert (=> b!387040 (=> (not res!221142) (not e!234654))))

(assert (=> b!387040 (= res!221142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181773 mask!970))))

(assert (=> b!387040 (= lt!181773 (array!22930 (store (arr!10933 _keys!658) i!548 k0!778) (size!11286 _keys!658)))))

(assert (= (and start!37734 res!221141) b!387039))

(assert (= (and b!387039 res!221145) b!387037))

(assert (= (and b!387037 res!221146) b!387034))

(assert (= (and b!387034 res!221143) b!387036))

(assert (= (and b!387036 res!221139) b!387035))

(assert (= (and b!387035 res!221144) b!387028))

(assert (= (and b!387028 res!221138) b!387030))

(assert (= (and b!387030 res!221147) b!387040))

(assert (= (and b!387040 res!221142) b!387029))

(assert (= (and b!387029 res!221140) b!387032))

(assert (= (and b!387031 condMapEmpty!15849) mapIsEmpty!15849))

(assert (= (and b!387031 (not condMapEmpty!15849)) mapNonEmpty!15849))

(get-info :version)

(assert (= (and mapNonEmpty!15849 ((_ is ValueCellFull!4418) mapValue!15849)) b!387038))

(assert (= (and b!387031 ((_ is ValueCellFull!4418) mapDefault!15849)) b!387033))

(assert (= start!37734 b!387031))

(declare-fun m!382721 () Bool)

(assert (=> mapNonEmpty!15849 m!382721))

(declare-fun m!382723 () Bool)

(assert (=> start!37734 m!382723))

(declare-fun m!382725 () Bool)

(assert (=> start!37734 m!382725))

(declare-fun m!382727 () Bool)

(assert (=> start!37734 m!382727))

(declare-fun m!382729 () Bool)

(assert (=> b!387030 m!382729))

(declare-fun m!382731 () Bool)

(assert (=> b!387037 m!382731))

(declare-fun m!382733 () Bool)

(assert (=> b!387028 m!382733))

(declare-fun m!382735 () Bool)

(assert (=> b!387035 m!382735))

(declare-fun m!382737 () Bool)

(assert (=> b!387032 m!382737))

(declare-fun m!382739 () Bool)

(assert (=> b!387032 m!382739))

(declare-fun m!382741 () Bool)

(assert (=> b!387032 m!382741))

(declare-fun m!382743 () Bool)

(assert (=> b!387040 m!382743))

(declare-fun m!382745 () Bool)

(assert (=> b!387040 m!382745))

(declare-fun m!382747 () Bool)

(assert (=> b!387029 m!382747))

(declare-fun m!382749 () Bool)

(assert (=> b!387034 m!382749))

(check-sat (not b!387040) tp_is_empty!9523 (not b!387037) (not b!387029) b_and!16067 (not b!387032) (not b!387030) (not b!387034) (not b!387035) (not mapNonEmpty!15849) (not b_next!8851) (not start!37734))
(check-sat b_and!16067 (not b_next!8851))
