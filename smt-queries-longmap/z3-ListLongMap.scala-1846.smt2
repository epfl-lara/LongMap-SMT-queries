; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33430 () Bool)

(assert start!33430)

(declare-fun mapNonEmpty!11430 () Bool)

(declare-fun mapRes!11430 () Bool)

(declare-fun tp!23805 () Bool)

(declare-fun e!203589 () Bool)

(assert (=> mapNonEmpty!11430 (= mapRes!11430 (and tp!23805 e!203589))))

(declare-datatypes ((V!9907 0))(
  ( (V!9908 (val!3393 Int)) )
))
(declare-datatypes ((ValueCell!3005 0))(
  ( (ValueCellFull!3005 (v!5546 V!9907)) (EmptyCell!3005) )
))
(declare-datatypes ((array!16981 0))(
  ( (array!16982 (arr!8025 (Array (_ BitVec 32) ValueCell!3005)) (size!8378 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!16981)

(declare-fun mapRest!11430 () (Array (_ BitVec 32) ValueCell!3005))

(declare-fun mapKey!11430 () (_ BitVec 32))

(declare-fun mapValue!11430 () ValueCell!3005)

(assert (=> mapNonEmpty!11430 (= (arr!8025 _values!1525) (store mapRest!11430 mapKey!11430 mapValue!11430))))

(declare-fun b!331708 () Bool)

(declare-fun res!182777 () Bool)

(declare-fun e!203588 () Bool)

(assert (=> b!331708 (=> (not res!182777) (not e!203588))))

(declare-datatypes ((array!16983 0))(
  ( (array!16984 (arr!8026 (Array (_ BitVec 32) (_ BitVec 64))) (size!8379 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!16983)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16983 (_ BitVec 32)) Bool)

(assert (=> b!331708 (= res!182777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!331709 () Bool)

(declare-fun res!182776 () Bool)

(assert (=> b!331709 (=> (not res!182776) (not e!203588))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!331709 (= res!182776 (and (= (size!8378 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8379 _keys!1895) (size!8378 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!331710 () Bool)

(declare-fun tp_is_empty!6697 () Bool)

(assert (=> b!331710 (= e!203589 tp_is_empty!6697)))

(declare-fun b!331711 () Bool)

(assert (=> b!331711 (= e!203588 false)))

(declare-fun lt!158706 () Bool)

(declare-datatypes ((List!4546 0))(
  ( (Nil!4543) (Cons!4542 (h!5398 (_ BitVec 64)) (t!9619 List!4546)) )
))
(declare-fun arrayNoDuplicates!0 (array!16983 (_ BitVec 32) List!4546) Bool)

(assert (=> b!331711 (= lt!158706 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4543))))

(declare-fun b!331712 () Bool)

(declare-fun e!203590 () Bool)

(declare-fun e!203587 () Bool)

(assert (=> b!331712 (= e!203590 (and e!203587 mapRes!11430))))

(declare-fun condMapEmpty!11430 () Bool)

(declare-fun mapDefault!11430 () ValueCell!3005)

(assert (=> b!331712 (= condMapEmpty!11430 (= (arr!8025 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3005)) mapDefault!11430)))))

(declare-fun res!182775 () Bool)

(assert (=> start!33430 (=> (not res!182775) (not e!203588))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33430 (= res!182775 (validMask!0 mask!2385))))

(assert (=> start!33430 e!203588))

(assert (=> start!33430 true))

(declare-fun array_inv!5990 (array!16981) Bool)

(assert (=> start!33430 (and (array_inv!5990 _values!1525) e!203590)))

(declare-fun array_inv!5991 (array!16983) Bool)

(assert (=> start!33430 (array_inv!5991 _keys!1895)))

(declare-fun b!331713 () Bool)

(assert (=> b!331713 (= e!203587 tp_is_empty!6697)))

(declare-fun mapIsEmpty!11430 () Bool)

(assert (=> mapIsEmpty!11430 mapRes!11430))

(assert (= (and start!33430 res!182775) b!331709))

(assert (= (and b!331709 res!182776) b!331708))

(assert (= (and b!331708 res!182777) b!331711))

(assert (= (and b!331712 condMapEmpty!11430) mapIsEmpty!11430))

(assert (= (and b!331712 (not condMapEmpty!11430)) mapNonEmpty!11430))

(get-info :version)

(assert (= (and mapNonEmpty!11430 ((_ is ValueCellFull!3005) mapValue!11430)) b!331710))

(assert (= (and b!331712 ((_ is ValueCellFull!3005) mapDefault!11430)) b!331713))

(assert (= start!33430 b!331712))

(declare-fun m!335927 () Bool)

(assert (=> mapNonEmpty!11430 m!335927))

(declare-fun m!335929 () Bool)

(assert (=> b!331708 m!335929))

(declare-fun m!335931 () Bool)

(assert (=> b!331711 m!335931))

(declare-fun m!335933 () Bool)

(assert (=> start!33430 m!335933))

(declare-fun m!335935 () Bool)

(assert (=> start!33430 m!335935))

(declare-fun m!335937 () Bool)

(assert (=> start!33430 m!335937))

(check-sat (not start!33430) tp_is_empty!6697 (not mapNonEmpty!11430) (not b!331711) (not b!331708))
(check-sat)
