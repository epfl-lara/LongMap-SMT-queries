; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37654 () Bool)

(assert start!37654)

(declare-fun mapNonEmpty!15708 () Bool)

(declare-fun mapRes!15708 () Bool)

(declare-fun tp!31035 () Bool)

(declare-fun e!233996 () Bool)

(assert (=> mapNonEmpty!15708 (= mapRes!15708 (and tp!31035 e!233996))))

(declare-fun mapKey!15708 () (_ BitVec 32))

(declare-datatypes ((V!13677 0))(
  ( (V!13678 (val!4759 Int)) )
))
(declare-datatypes ((ValueCell!4371 0))(
  ( (ValueCellFull!4371 (v!6956 V!13677)) (EmptyCell!4371) )
))
(declare-datatypes ((array!22757 0))(
  ( (array!22758 (arr!10847 (Array (_ BitVec 32) ValueCell!4371)) (size!11199 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22757)

(declare-fun mapRest!15708 () (Array (_ BitVec 32) ValueCell!4371))

(declare-fun mapValue!15708 () ValueCell!4371)

(assert (=> mapNonEmpty!15708 (= (arr!10847 _values!506) (store mapRest!15708 mapKey!15708 mapValue!15708))))

(declare-fun b!385513 () Bool)

(declare-fun e!233994 () Bool)

(declare-fun tp_is_empty!9429 () Bool)

(assert (=> b!385513 (= e!233994 tp_is_empty!9429)))

(declare-fun b!385514 () Bool)

(declare-fun e!233992 () Bool)

(assert (=> b!385514 (= e!233992 false)))

(declare-fun lt!181626 () Bool)

(declare-datatypes ((array!22759 0))(
  ( (array!22760 (arr!10848 (Array (_ BitVec 32) (_ BitVec 64))) (size!11200 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22759)

(declare-datatypes ((List!6245 0))(
  ( (Nil!6242) (Cons!6241 (h!7097 (_ BitVec 64)) (t!11395 List!6245)) )
))
(declare-fun arrayNoDuplicates!0 (array!22759 (_ BitVec 32) List!6245) Bool)

(assert (=> b!385514 (= lt!181626 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6242))))

(declare-fun mapIsEmpty!15708 () Bool)

(assert (=> mapIsEmpty!15708 mapRes!15708))

(declare-fun b!385515 () Bool)

(assert (=> b!385515 (= e!233996 tp_is_empty!9429)))

(declare-fun b!385516 () Bool)

(declare-fun e!233995 () Bool)

(assert (=> b!385516 (= e!233995 (and e!233994 mapRes!15708))))

(declare-fun condMapEmpty!15708 () Bool)

(declare-fun mapDefault!15708 () ValueCell!4371)

(assert (=> b!385516 (= condMapEmpty!15708 (= (arr!10847 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4371)) mapDefault!15708)))))

(declare-fun b!385517 () Bool)

(declare-fun res!219905 () Bool)

(assert (=> b!385517 (=> (not res!219905) (not e!233992))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22759 (_ BitVec 32)) Bool)

(assert (=> b!385517 (= res!219905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!219903 () Bool)

(assert (=> start!37654 (=> (not res!219903) (not e!233992))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37654 (= res!219903 (validMask!0 mask!970))))

(assert (=> start!37654 e!233992))

(assert (=> start!37654 true))

(declare-fun array_inv!7984 (array!22757) Bool)

(assert (=> start!37654 (and (array_inv!7984 _values!506) e!233995)))

(declare-fun array_inv!7985 (array!22759) Bool)

(assert (=> start!37654 (array_inv!7985 _keys!658)))

(declare-fun b!385512 () Bool)

(declare-fun res!219904 () Bool)

(assert (=> b!385512 (=> (not res!219904) (not e!233992))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!385512 (= res!219904 (and (= (size!11199 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11200 _keys!658) (size!11199 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(assert (= (and start!37654 res!219903) b!385512))

(assert (= (and b!385512 res!219904) b!385517))

(assert (= (and b!385517 res!219905) b!385514))

(assert (= (and b!385516 condMapEmpty!15708) mapIsEmpty!15708))

(assert (= (and b!385516 (not condMapEmpty!15708)) mapNonEmpty!15708))

(get-info :version)

(assert (= (and mapNonEmpty!15708 ((_ is ValueCellFull!4371) mapValue!15708)) b!385515))

(assert (= (and b!385516 ((_ is ValueCellFull!4371) mapDefault!15708)) b!385513))

(assert (= start!37654 b!385516))

(declare-fun m!382119 () Bool)

(assert (=> mapNonEmpty!15708 m!382119))

(declare-fun m!382121 () Bool)

(assert (=> b!385514 m!382121))

(declare-fun m!382123 () Bool)

(assert (=> b!385517 m!382123))

(declare-fun m!382125 () Bool)

(assert (=> start!37654 m!382125))

(declare-fun m!382127 () Bool)

(assert (=> start!37654 m!382127))

(declare-fun m!382129 () Bool)

(assert (=> start!37654 m!382129))

(check-sat (not start!37654) tp_is_empty!9429 (not b!385517) (not mapNonEmpty!15708) (not b!385514))
(check-sat)
