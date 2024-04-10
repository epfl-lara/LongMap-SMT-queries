; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33452 () Bool)

(assert start!33452)

(declare-fun b!332055 () Bool)

(declare-fun e!203823 () Bool)

(declare-fun tp_is_empty!6705 () Bool)

(assert (=> b!332055 (= e!203823 tp_is_empty!6705)))

(declare-fun b!332056 () Bool)

(declare-fun e!203826 () Bool)

(assert (=> b!332056 (= e!203826 tp_is_empty!6705)))

(declare-fun b!332057 () Bool)

(declare-fun e!203825 () Bool)

(declare-fun mapRes!11442 () Bool)

(assert (=> b!332057 (= e!203825 (and e!203823 mapRes!11442))))

(declare-fun condMapEmpty!11442 () Bool)

(declare-datatypes ((V!9917 0))(
  ( (V!9918 (val!3397 Int)) )
))
(declare-datatypes ((ValueCell!3009 0))(
  ( (ValueCellFull!3009 (v!5556 V!9917)) (EmptyCell!3009) )
))
(declare-datatypes ((array!17007 0))(
  ( (array!17008 (arr!8038 (Array (_ BitVec 32) ValueCell!3009)) (size!8390 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17007)

(declare-fun mapDefault!11442 () ValueCell!3009)

(assert (=> b!332057 (= condMapEmpty!11442 (= (arr!8038 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3009)) mapDefault!11442)))))

(declare-fun b!332058 () Bool)

(declare-fun res!182942 () Bool)

(declare-fun e!203822 () Bool)

(assert (=> b!332058 (=> (not res!182942) (not e!203822))))

(declare-datatypes ((array!17009 0))(
  ( (array!17010 (arr!8039 (Array (_ BitVec 32) (_ BitVec 64))) (size!8391 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17009)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17009 (_ BitVec 32)) Bool)

(assert (=> b!332058 (= res!182942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!11442 () Bool)

(declare-fun tp!23817 () Bool)

(assert (=> mapNonEmpty!11442 (= mapRes!11442 (and tp!23817 e!203826))))

(declare-fun mapRest!11442 () (Array (_ BitVec 32) ValueCell!3009))

(declare-fun mapKey!11442 () (_ BitVec 32))

(declare-fun mapValue!11442 () ValueCell!3009)

(assert (=> mapNonEmpty!11442 (= (arr!8038 _values!1525) (store mapRest!11442 mapKey!11442 mapValue!11442))))

(declare-fun res!182940 () Bool)

(assert (=> start!33452 (=> (not res!182940) (not e!203822))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33452 (= res!182940 (validMask!0 mask!2385))))

(assert (=> start!33452 e!203822))

(assert (=> start!33452 true))

(declare-fun array_inv!5986 (array!17007) Bool)

(assert (=> start!33452 (and (array_inv!5986 _values!1525) e!203825)))

(declare-fun array_inv!5987 (array!17009) Bool)

(assert (=> start!33452 (array_inv!5987 _keys!1895)))

(declare-fun b!332059 () Bool)

(declare-fun res!182941 () Bool)

(assert (=> b!332059 (=> (not res!182941) (not e!203822))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!332059 (= res!182941 (and (= (size!8390 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8391 _keys!1895) (size!8390 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!332060 () Bool)

(assert (=> b!332060 (= e!203822 false)))

(declare-fun lt!158953 () Bool)

(declare-datatypes ((List!4580 0))(
  ( (Nil!4577) (Cons!4576 (h!5432 (_ BitVec 64)) (t!9662 List!4580)) )
))
(declare-fun arrayNoDuplicates!0 (array!17009 (_ BitVec 32) List!4580) Bool)

(assert (=> b!332060 (= lt!158953 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4577))))

(declare-fun mapIsEmpty!11442 () Bool)

(assert (=> mapIsEmpty!11442 mapRes!11442))

(assert (= (and start!33452 res!182940) b!332059))

(assert (= (and b!332059 res!182941) b!332058))

(assert (= (and b!332058 res!182942) b!332060))

(assert (= (and b!332057 condMapEmpty!11442) mapIsEmpty!11442))

(assert (= (and b!332057 (not condMapEmpty!11442)) mapNonEmpty!11442))

(get-info :version)

(assert (= (and mapNonEmpty!11442 ((_ is ValueCellFull!3009) mapValue!11442)) b!332056))

(assert (= (and b!332057 ((_ is ValueCellFull!3009) mapDefault!11442)) b!332055))

(assert (= start!33452 b!332057))

(declare-fun m!336705 () Bool)

(assert (=> b!332058 m!336705))

(declare-fun m!336707 () Bool)

(assert (=> mapNonEmpty!11442 m!336707))

(declare-fun m!336709 () Bool)

(assert (=> start!33452 m!336709))

(declare-fun m!336711 () Bool)

(assert (=> start!33452 m!336711))

(declare-fun m!336713 () Bool)

(assert (=> start!33452 m!336713))

(declare-fun m!336715 () Bool)

(assert (=> b!332060 m!336715))

(check-sat (not b!332058) (not b!332060) tp_is_empty!6705 (not start!33452) (not mapNonEmpty!11442))
(check-sat)
