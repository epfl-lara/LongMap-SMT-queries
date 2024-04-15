; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36810 () Bool)

(assert start!36810)

(declare-fun b_free!7951 () Bool)

(declare-fun b_next!7951 () Bool)

(assert (=> start!36810 (= b_free!7951 (not b_next!7951))))

(declare-fun tp!28569 () Bool)

(declare-fun b_and!15167 () Bool)

(assert (=> start!36810 (= tp!28569 b_and!15167)))

(declare-fun b!367813 () Bool)

(declare-fun e!224998 () Bool)

(assert (=> b!367813 (= e!224998 false)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12571 0))(
  ( (V!12572 (val!4344 Int)) )
))
(declare-datatypes ((ValueCell!3956 0))(
  ( (ValueCellFull!3956 (v!6535 V!12571)) (EmptyCell!3956) )
))
(declare-datatypes ((array!21137 0))(
  ( (array!21138 (arr!10037 (Array (_ BitVec 32) ValueCell!3956)) (size!10390 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21137)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5724 0))(
  ( (tuple2!5725 (_1!2873 (_ BitVec 64)) (_2!2873 V!12571)) )
))
(declare-datatypes ((List!5554 0))(
  ( (Nil!5551) (Cons!5550 (h!6406 tuple2!5724) (t!10695 List!5554)) )
))
(declare-datatypes ((ListLongMap!4627 0))(
  ( (ListLongMap!4628 (toList!2329 List!5554)) )
))
(declare-fun lt!169241 () ListLongMap!4627)

(declare-fun zeroValue!472 () V!12571)

(declare-datatypes ((array!21139 0))(
  ( (array!21140 (arr!10038 (Array (_ BitVec 32) (_ BitVec 64))) (size!10391 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21139)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!12571)

(declare-fun getCurrentListMapNoExtraKeys!620 (array!21139 array!21137 (_ BitVec 32) (_ BitVec 32) V!12571 V!12571 (_ BitVec 32) Int) ListLongMap!4627)

(assert (=> b!367813 (= lt!169241 (getCurrentListMapNoExtraKeys!620 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!367814 () Bool)

(declare-fun e!224994 () Bool)

(assert (=> b!367814 (= e!224994 e!224998)))

(declare-fun res!206090 () Bool)

(assert (=> b!367814 (=> (not res!206090) (not e!224998))))

(declare-fun lt!169242 () array!21139)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21139 (_ BitVec 32)) Bool)

(assert (=> b!367814 (= res!206090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169242 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!367814 (= lt!169242 (array!21140 (store (arr!10038 _keys!658) i!548 k0!778) (size!10391 _keys!658)))))

(declare-fun b!367815 () Bool)

(declare-fun res!206085 () Bool)

(assert (=> b!367815 (=> (not res!206085) (not e!224994))))

(assert (=> b!367815 (= res!206085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!14463 () Bool)

(declare-fun mapRes!14463 () Bool)

(assert (=> mapIsEmpty!14463 mapRes!14463))

(declare-fun b!367816 () Bool)

(declare-fun res!206083 () Bool)

(assert (=> b!367816 (=> (not res!206083) (not e!224998))))

(declare-datatypes ((List!5555 0))(
  ( (Nil!5552) (Cons!5551 (h!6407 (_ BitVec 64)) (t!10696 List!5555)) )
))
(declare-fun arrayNoDuplicates!0 (array!21139 (_ BitVec 32) List!5555) Bool)

(assert (=> b!367816 (= res!206083 (arrayNoDuplicates!0 lt!169242 #b00000000000000000000000000000000 Nil!5552))))

(declare-fun res!206082 () Bool)

(assert (=> start!36810 (=> (not res!206082) (not e!224994))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36810 (= res!206082 (validMask!0 mask!970))))

(assert (=> start!36810 e!224994))

(assert (=> start!36810 true))

(declare-fun e!224999 () Bool)

(declare-fun array_inv!7440 (array!21137) Bool)

(assert (=> start!36810 (and (array_inv!7440 _values!506) e!224999)))

(assert (=> start!36810 tp!28569))

(declare-fun tp_is_empty!8599 () Bool)

(assert (=> start!36810 tp_is_empty!8599))

(declare-fun array_inv!7441 (array!21139) Bool)

(assert (=> start!36810 (array_inv!7441 _keys!658)))

(declare-fun b!367817 () Bool)

(declare-fun e!224995 () Bool)

(assert (=> b!367817 (= e!224995 tp_is_empty!8599)))

(declare-fun b!367818 () Bool)

(declare-fun res!206081 () Bool)

(assert (=> b!367818 (=> (not res!206081) (not e!224994))))

(assert (=> b!367818 (= res!206081 (or (= (select (arr!10038 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10038 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!367819 () Bool)

(declare-fun res!206086 () Bool)

(assert (=> b!367819 (=> (not res!206086) (not e!224994))))

(assert (=> b!367819 (= res!206086 (and (= (size!10390 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10391 _keys!658) (size!10390 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!367820 () Bool)

(declare-fun res!206084 () Bool)

(assert (=> b!367820 (=> (not res!206084) (not e!224994))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!367820 (= res!206084 (validKeyInArray!0 k0!778))))

(declare-fun b!367821 () Bool)

(declare-fun e!224997 () Bool)

(assert (=> b!367821 (= e!224999 (and e!224997 mapRes!14463))))

(declare-fun condMapEmpty!14463 () Bool)

(declare-fun mapDefault!14463 () ValueCell!3956)

(assert (=> b!367821 (= condMapEmpty!14463 (= (arr!10037 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3956)) mapDefault!14463)))))

(declare-fun b!367822 () Bool)

(declare-fun res!206088 () Bool)

(assert (=> b!367822 (=> (not res!206088) (not e!224994))))

(assert (=> b!367822 (= res!206088 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5552))))

(declare-fun mapNonEmpty!14463 () Bool)

(declare-fun tp!28568 () Bool)

(assert (=> mapNonEmpty!14463 (= mapRes!14463 (and tp!28568 e!224995))))

(declare-fun mapRest!14463 () (Array (_ BitVec 32) ValueCell!3956))

(declare-fun mapKey!14463 () (_ BitVec 32))

(declare-fun mapValue!14463 () ValueCell!3956)

(assert (=> mapNonEmpty!14463 (= (arr!10037 _values!506) (store mapRest!14463 mapKey!14463 mapValue!14463))))

(declare-fun b!367823 () Bool)

(assert (=> b!367823 (= e!224997 tp_is_empty!8599)))

(declare-fun b!367824 () Bool)

(declare-fun res!206087 () Bool)

(assert (=> b!367824 (=> (not res!206087) (not e!224994))))

(declare-fun arrayContainsKey!0 (array!21139 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!367824 (= res!206087 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!367825 () Bool)

(declare-fun res!206089 () Bool)

(assert (=> b!367825 (=> (not res!206089) (not e!224994))))

(assert (=> b!367825 (= res!206089 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10391 _keys!658))))))

(assert (= (and start!36810 res!206082) b!367819))

(assert (= (and b!367819 res!206086) b!367815))

(assert (= (and b!367815 res!206085) b!367822))

(assert (= (and b!367822 res!206088) b!367825))

(assert (= (and b!367825 res!206089) b!367820))

(assert (= (and b!367820 res!206084) b!367818))

(assert (= (and b!367818 res!206081) b!367824))

(assert (= (and b!367824 res!206087) b!367814))

(assert (= (and b!367814 res!206090) b!367816))

(assert (= (and b!367816 res!206083) b!367813))

(assert (= (and b!367821 condMapEmpty!14463) mapIsEmpty!14463))

(assert (= (and b!367821 (not condMapEmpty!14463)) mapNonEmpty!14463))

(get-info :version)

(assert (= (and mapNonEmpty!14463 ((_ is ValueCellFull!3956) mapValue!14463)) b!367817))

(assert (= (and b!367821 ((_ is ValueCellFull!3956) mapDefault!14463)) b!367823))

(assert (= start!36810 b!367821))

(declare-fun m!364121 () Bool)

(assert (=> start!36810 m!364121))

(declare-fun m!364123 () Bool)

(assert (=> start!36810 m!364123))

(declare-fun m!364125 () Bool)

(assert (=> start!36810 m!364125))

(declare-fun m!364127 () Bool)

(assert (=> b!367816 m!364127))

(declare-fun m!364129 () Bool)

(assert (=> b!367818 m!364129))

(declare-fun m!364131 () Bool)

(assert (=> b!367820 m!364131))

(declare-fun m!364133 () Bool)

(assert (=> b!367824 m!364133))

(declare-fun m!364135 () Bool)

(assert (=> b!367822 m!364135))

(declare-fun m!364137 () Bool)

(assert (=> b!367815 m!364137))

(declare-fun m!364139 () Bool)

(assert (=> b!367813 m!364139))

(declare-fun m!364141 () Bool)

(assert (=> mapNonEmpty!14463 m!364141))

(declare-fun m!364143 () Bool)

(assert (=> b!367814 m!364143))

(declare-fun m!364145 () Bool)

(assert (=> b!367814 m!364145))

(check-sat (not b_next!7951) (not b!367820) b_and!15167 tp_is_empty!8599 (not b!367815) (not start!36810) (not b!367813) (not b!367816) (not mapNonEmpty!14463) (not b!367814) (not b!367824) (not b!367822))
(check-sat b_and!15167 (not b_next!7951))
