; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37638 () Bool)

(assert start!37638)

(declare-fun b!385445 () Bool)

(declare-fun res!219892 () Bool)

(declare-fun e!233948 () Bool)

(assert (=> b!385445 (=> (not res!219892) (not e!233948))))

(declare-datatypes ((array!22744 0))(
  ( (array!22745 (arr!10840 (Array (_ BitVec 32) (_ BitVec 64))) (size!11192 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22744)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22744 (_ BitVec 32)) Bool)

(assert (=> b!385445 (= res!219892 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!385446 () Bool)

(declare-fun e!233947 () Bool)

(declare-fun e!233945 () Bool)

(declare-fun mapRes!15705 () Bool)

(assert (=> b!385446 (= e!233947 (and e!233945 mapRes!15705))))

(declare-fun condMapEmpty!15705 () Bool)

(declare-datatypes ((V!13675 0))(
  ( (V!13676 (val!4758 Int)) )
))
(declare-datatypes ((ValueCell!4370 0))(
  ( (ValueCellFull!4370 (v!6956 V!13675)) (EmptyCell!4370) )
))
(declare-datatypes ((array!22746 0))(
  ( (array!22747 (arr!10841 (Array (_ BitVec 32) ValueCell!4370)) (size!11193 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22746)

(declare-fun mapDefault!15705 () ValueCell!4370)

(assert (=> b!385446 (= condMapEmpty!15705 (= (arr!10841 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4370)) mapDefault!15705)))))

(declare-fun res!219891 () Bool)

(assert (=> start!37638 (=> (not res!219891) (not e!233948))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37638 (= res!219891 (validMask!0 mask!970))))

(assert (=> start!37638 e!233948))

(assert (=> start!37638 true))

(declare-fun array_inv!8016 (array!22746) Bool)

(assert (=> start!37638 (and (array_inv!8016 _values!506) e!233947)))

(declare-fun array_inv!8017 (array!22744) Bool)

(assert (=> start!37638 (array_inv!8017 _keys!658)))

(declare-fun b!385447 () Bool)

(declare-fun tp_is_empty!9427 () Bool)

(assert (=> b!385447 (= e!233945 tp_is_empty!9427)))

(declare-fun b!385448 () Bool)

(declare-fun res!219893 () Bool)

(assert (=> b!385448 (=> (not res!219893) (not e!233948))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!385448 (= res!219893 (and (= (size!11193 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11192 _keys!658) (size!11193 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!385449 () Bool)

(declare-fun e!233949 () Bool)

(assert (=> b!385449 (= e!233949 tp_is_empty!9427)))

(declare-fun b!385450 () Bool)

(assert (=> b!385450 (= e!233948 false)))

(declare-fun lt!181642 () Bool)

(declare-datatypes ((List!6115 0))(
  ( (Nil!6112) (Cons!6111 (h!6967 (_ BitVec 64)) (t!11257 List!6115)) )
))
(declare-fun arrayNoDuplicates!0 (array!22744 (_ BitVec 32) List!6115) Bool)

(assert (=> b!385450 (= lt!181642 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6112))))

(declare-fun mapIsEmpty!15705 () Bool)

(assert (=> mapIsEmpty!15705 mapRes!15705))

(declare-fun mapNonEmpty!15705 () Bool)

(declare-fun tp!31032 () Bool)

(assert (=> mapNonEmpty!15705 (= mapRes!15705 (and tp!31032 e!233949))))

(declare-fun mapKey!15705 () (_ BitVec 32))

(declare-fun mapRest!15705 () (Array (_ BitVec 32) ValueCell!4370))

(declare-fun mapValue!15705 () ValueCell!4370)

(assert (=> mapNonEmpty!15705 (= (arr!10841 _values!506) (store mapRest!15705 mapKey!15705 mapValue!15705))))

(assert (= (and start!37638 res!219891) b!385448))

(assert (= (and b!385448 res!219893) b!385445))

(assert (= (and b!385445 res!219892) b!385450))

(assert (= (and b!385446 condMapEmpty!15705) mapIsEmpty!15705))

(assert (= (and b!385446 (not condMapEmpty!15705)) mapNonEmpty!15705))

(get-info :version)

(assert (= (and mapNonEmpty!15705 ((_ is ValueCellFull!4370) mapValue!15705)) b!385449))

(assert (= (and b!385446 ((_ is ValueCellFull!4370) mapDefault!15705)) b!385447))

(assert (= start!37638 b!385446))

(declare-fun m!382337 () Bool)

(assert (=> b!385445 m!382337))

(declare-fun m!382339 () Bool)

(assert (=> start!37638 m!382339))

(declare-fun m!382341 () Bool)

(assert (=> start!37638 m!382341))

(declare-fun m!382343 () Bool)

(assert (=> start!37638 m!382343))

(declare-fun m!382345 () Bool)

(assert (=> b!385450 m!382345))

(declare-fun m!382347 () Bool)

(assert (=> mapNonEmpty!15705 m!382347))

(check-sat tp_is_empty!9427 (not mapNonEmpty!15705) (not start!37638) (not b!385445) (not b!385450))
(check-sat)
