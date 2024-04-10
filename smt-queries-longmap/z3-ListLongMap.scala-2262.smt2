; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37036 () Bool)

(assert start!37036)

(declare-fun b_free!8163 () Bool)

(declare-fun b_next!8163 () Bool)

(assert (=> start!37036 (= b_free!8163 (not b_next!8163))))

(declare-fun tp!29204 () Bool)

(declare-fun b_and!15405 () Bool)

(assert (=> start!37036 (= tp!29204 b_and!15405)))

(declare-fun b!372218 () Bool)

(declare-fun res!209399 () Bool)

(declare-fun e!227076 () Bool)

(assert (=> b!372218 (=> (not res!209399) (not e!227076))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12853 0))(
  ( (V!12854 (val!4450 Int)) )
))
(declare-datatypes ((ValueCell!4062 0))(
  ( (ValueCellFull!4062 (v!6647 V!12853)) (EmptyCell!4062) )
))
(declare-datatypes ((array!21563 0))(
  ( (array!21564 (arr!10250 (Array (_ BitVec 32) ValueCell!4062)) (size!10602 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21563)

(declare-datatypes ((array!21565 0))(
  ( (array!21566 (arr!10251 (Array (_ BitVec 32) (_ BitVec 64))) (size!10603 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21565)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!372218 (= res!209399 (and (= (size!10602 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10603 _keys!658) (size!10602 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!372219 () Bool)

(declare-fun res!209396 () Bool)

(assert (=> b!372219 (=> (not res!209396) (not e!227076))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!372219 (= res!209396 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10603 _keys!658))))))

(declare-fun b!372220 () Bool)

(declare-fun res!209397 () Bool)

(assert (=> b!372220 (=> (not res!209397) (not e!227076))))

(declare-datatypes ((List!5748 0))(
  ( (Nil!5745) (Cons!5744 (h!6600 (_ BitVec 64)) (t!10898 List!5748)) )
))
(declare-fun arrayNoDuplicates!0 (array!21565 (_ BitVec 32) List!5748) Bool)

(assert (=> b!372220 (= res!209397 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5745))))

(declare-fun b!372221 () Bool)

(declare-fun e!227078 () Bool)

(declare-fun tp_is_empty!8811 () Bool)

(assert (=> b!372221 (= e!227078 tp_is_empty!8811)))

(declare-fun b!372222 () Bool)

(declare-fun e!227080 () Bool)

(assert (=> b!372222 (= e!227076 e!227080)))

(declare-fun res!209398 () Bool)

(assert (=> b!372222 (=> (not res!209398) (not e!227080))))

(declare-fun lt!170632 () array!21565)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21565 (_ BitVec 32)) Bool)

(assert (=> b!372222 (= res!209398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170632 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!372222 (= lt!170632 (array!21566 (store (arr!10251 _keys!658) i!548 k0!778) (size!10603 _keys!658)))))

(declare-fun res!209393 () Bool)

(assert (=> start!37036 (=> (not res!209393) (not e!227076))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37036 (= res!209393 (validMask!0 mask!970))))

(assert (=> start!37036 e!227076))

(declare-fun e!227079 () Bool)

(declare-fun array_inv!7562 (array!21563) Bool)

(assert (=> start!37036 (and (array_inv!7562 _values!506) e!227079)))

(assert (=> start!37036 tp!29204))

(assert (=> start!37036 true))

(assert (=> start!37036 tp_is_empty!8811))

(declare-fun array_inv!7563 (array!21565) Bool)

(assert (=> start!37036 (array_inv!7563 _keys!658)))

(declare-fun b!372223 () Bool)

(declare-fun res!209395 () Bool)

(assert (=> b!372223 (=> (not res!209395) (not e!227076))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!372223 (= res!209395 (validKeyInArray!0 k0!778))))

(declare-fun b!372224 () Bool)

(declare-fun res!209390 () Bool)

(assert (=> b!372224 (=> (not res!209390) (not e!227076))))

(assert (=> b!372224 (= res!209390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!14781 () Bool)

(declare-fun mapRes!14781 () Bool)

(declare-fun tp!29205 () Bool)

(assert (=> mapNonEmpty!14781 (= mapRes!14781 (and tp!29205 e!227078))))

(declare-fun mapKey!14781 () (_ BitVec 32))

(declare-fun mapValue!14781 () ValueCell!4062)

(declare-fun mapRest!14781 () (Array (_ BitVec 32) ValueCell!4062))

(assert (=> mapNonEmpty!14781 (= (arr!10250 _values!506) (store mapRest!14781 mapKey!14781 mapValue!14781))))

(declare-fun mapIsEmpty!14781 () Bool)

(assert (=> mapIsEmpty!14781 mapRes!14781))

(declare-fun b!372225 () Bool)

(declare-fun res!209391 () Bool)

(assert (=> b!372225 (=> (not res!209391) (not e!227076))))

(assert (=> b!372225 (= res!209391 (or (= (select (arr!10251 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10251 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!372226 () Bool)

(declare-fun e!227077 () Bool)

(assert (=> b!372226 (= e!227079 (and e!227077 mapRes!14781))))

(declare-fun condMapEmpty!14781 () Bool)

(declare-fun mapDefault!14781 () ValueCell!4062)

(assert (=> b!372226 (= condMapEmpty!14781 (= (arr!10250 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4062)) mapDefault!14781)))))

(declare-fun b!372227 () Bool)

(declare-fun res!209392 () Bool)

(assert (=> b!372227 (=> (not res!209392) (not e!227076))))

(declare-fun arrayContainsKey!0 (array!21565 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!372227 (= res!209392 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!372228 () Bool)

(assert (=> b!372228 (= e!227077 tp_is_empty!8811)))

(declare-fun b!372229 () Bool)

(assert (=> b!372229 (= e!227080 (not true))))

(declare-fun lt!170635 () array!21563)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5904 0))(
  ( (tuple2!5905 (_1!2963 (_ BitVec 64)) (_2!2963 V!12853)) )
))
(declare-datatypes ((List!5749 0))(
  ( (Nil!5746) (Cons!5745 (h!6601 tuple2!5904) (t!10899 List!5749)) )
))
(declare-datatypes ((ListLongMap!4817 0))(
  ( (ListLongMap!4818 (toList!2424 List!5749)) )
))
(declare-fun lt!170634 () ListLongMap!4817)

(declare-fun zeroValue!472 () V!12853)

(declare-fun minValue!472 () V!12853)

(declare-fun getCurrentListMap!1867 (array!21565 array!21563 (_ BitVec 32) (_ BitVec 32) V!12853 V!12853 (_ BitVec 32) Int) ListLongMap!4817)

(assert (=> b!372229 (= lt!170634 (getCurrentListMap!1867 lt!170632 lt!170635 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170631 () ListLongMap!4817)

(declare-fun lt!170633 () ListLongMap!4817)

(assert (=> b!372229 (and (= lt!170631 lt!170633) (= lt!170633 lt!170631))))

(declare-fun lt!170636 () ListLongMap!4817)

(declare-fun v!373 () V!12853)

(declare-fun +!770 (ListLongMap!4817 tuple2!5904) ListLongMap!4817)

(assert (=> b!372229 (= lt!170633 (+!770 lt!170636 (tuple2!5905 k0!778 v!373)))))

(declare-datatypes ((Unit!11446 0))(
  ( (Unit!11447) )
))
(declare-fun lt!170637 () Unit!11446)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!25 (array!21565 array!21563 (_ BitVec 32) (_ BitVec 32) V!12853 V!12853 (_ BitVec 32) (_ BitVec 64) V!12853 (_ BitVec 32) Int) Unit!11446)

(assert (=> b!372229 (= lt!170637 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!25 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!701 (array!21565 array!21563 (_ BitVec 32) (_ BitVec 32) V!12853 V!12853 (_ BitVec 32) Int) ListLongMap!4817)

(assert (=> b!372229 (= lt!170631 (getCurrentListMapNoExtraKeys!701 lt!170632 lt!170635 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!372229 (= lt!170635 (array!21564 (store (arr!10250 _values!506) i!548 (ValueCellFull!4062 v!373)) (size!10602 _values!506)))))

(assert (=> b!372229 (= lt!170636 (getCurrentListMapNoExtraKeys!701 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!372230 () Bool)

(declare-fun res!209394 () Bool)

(assert (=> b!372230 (=> (not res!209394) (not e!227080))))

(assert (=> b!372230 (= res!209394 (arrayNoDuplicates!0 lt!170632 #b00000000000000000000000000000000 Nil!5745))))

(assert (= (and start!37036 res!209393) b!372218))

(assert (= (and b!372218 res!209399) b!372224))

(assert (= (and b!372224 res!209390) b!372220))

(assert (= (and b!372220 res!209397) b!372219))

(assert (= (and b!372219 res!209396) b!372223))

(assert (= (and b!372223 res!209395) b!372225))

(assert (= (and b!372225 res!209391) b!372227))

(assert (= (and b!372227 res!209392) b!372222))

(assert (= (and b!372222 res!209398) b!372230))

(assert (= (and b!372230 res!209394) b!372229))

(assert (= (and b!372226 condMapEmpty!14781) mapIsEmpty!14781))

(assert (= (and b!372226 (not condMapEmpty!14781)) mapNonEmpty!14781))

(get-info :version)

(assert (= (and mapNonEmpty!14781 ((_ is ValueCellFull!4062) mapValue!14781)) b!372221))

(assert (= (and b!372226 ((_ is ValueCellFull!4062) mapDefault!14781)) b!372228))

(assert (= start!37036 b!372226))

(declare-fun m!368103 () Bool)

(assert (=> b!372227 m!368103))

(declare-fun m!368105 () Bool)

(assert (=> b!372230 m!368105))

(declare-fun m!368107 () Bool)

(assert (=> start!37036 m!368107))

(declare-fun m!368109 () Bool)

(assert (=> start!37036 m!368109))

(declare-fun m!368111 () Bool)

(assert (=> start!37036 m!368111))

(declare-fun m!368113 () Bool)

(assert (=> b!372225 m!368113))

(declare-fun m!368115 () Bool)

(assert (=> mapNonEmpty!14781 m!368115))

(declare-fun m!368117 () Bool)

(assert (=> b!372220 m!368117))

(declare-fun m!368119 () Bool)

(assert (=> b!372224 m!368119))

(declare-fun m!368121 () Bool)

(assert (=> b!372229 m!368121))

(declare-fun m!368123 () Bool)

(assert (=> b!372229 m!368123))

(declare-fun m!368125 () Bool)

(assert (=> b!372229 m!368125))

(declare-fun m!368127 () Bool)

(assert (=> b!372229 m!368127))

(declare-fun m!368129 () Bool)

(assert (=> b!372229 m!368129))

(declare-fun m!368131 () Bool)

(assert (=> b!372229 m!368131))

(declare-fun m!368133 () Bool)

(assert (=> b!372222 m!368133))

(declare-fun m!368135 () Bool)

(assert (=> b!372222 m!368135))

(declare-fun m!368137 () Bool)

(assert (=> b!372223 m!368137))

(check-sat (not b!372223) (not b!372222) (not b!372220) (not b!372230) (not mapNonEmpty!14781) tp_is_empty!8811 (not start!37036) b_and!15405 (not b_next!8163) (not b!372224) (not b!372227) (not b!372229))
(check-sat b_and!15405 (not b_next!8163))
