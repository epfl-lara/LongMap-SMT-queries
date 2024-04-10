; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33482 () Bool)

(assert start!33482)

(declare-fun b!332325 () Bool)

(declare-fun e!204050 () Bool)

(assert (=> b!332325 (= e!204050 false)))

(declare-fun lt!158998 () Bool)

(declare-datatypes ((array!17065 0))(
  ( (array!17066 (arr!8067 (Array (_ BitVec 32) (_ BitVec 64))) (size!8419 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17065)

(declare-datatypes ((List!4590 0))(
  ( (Nil!4587) (Cons!4586 (h!5442 (_ BitVec 64)) (t!9672 List!4590)) )
))
(declare-fun arrayNoDuplicates!0 (array!17065 (_ BitVec 32) List!4590) Bool)

(assert (=> b!332325 (= lt!158998 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4587))))

(declare-fun res!183076 () Bool)

(assert (=> start!33482 (=> (not res!183076) (not e!204050))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33482 (= res!183076 (validMask!0 mask!2385))))

(assert (=> start!33482 e!204050))

(assert (=> start!33482 true))

(declare-datatypes ((V!9957 0))(
  ( (V!9958 (val!3412 Int)) )
))
(declare-datatypes ((ValueCell!3024 0))(
  ( (ValueCellFull!3024 (v!5571 V!9957)) (EmptyCell!3024) )
))
(declare-datatypes ((array!17067 0))(
  ( (array!17068 (arr!8068 (Array (_ BitVec 32) ValueCell!3024)) (size!8420 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17067)

(declare-fun e!204047 () Bool)

(declare-fun array_inv!6010 (array!17067) Bool)

(assert (=> start!33482 (and (array_inv!6010 _values!1525) e!204047)))

(declare-fun array_inv!6011 (array!17065) Bool)

(assert (=> start!33482 (array_inv!6011 _keys!1895)))

(declare-fun b!332326 () Bool)

(declare-fun e!204048 () Bool)

(declare-fun tp_is_empty!6735 () Bool)

(assert (=> b!332326 (= e!204048 tp_is_empty!6735)))

(declare-fun b!332327 () Bool)

(declare-fun e!204049 () Bool)

(declare-fun mapRes!11487 () Bool)

(assert (=> b!332327 (= e!204047 (and e!204049 mapRes!11487))))

(declare-fun condMapEmpty!11487 () Bool)

(declare-fun mapDefault!11487 () ValueCell!3024)

(assert (=> b!332327 (= condMapEmpty!11487 (= (arr!8068 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3024)) mapDefault!11487)))))

(declare-fun mapNonEmpty!11487 () Bool)

(declare-fun tp!23862 () Bool)

(assert (=> mapNonEmpty!11487 (= mapRes!11487 (and tp!23862 e!204048))))

(declare-fun mapKey!11487 () (_ BitVec 32))

(declare-fun mapRest!11487 () (Array (_ BitVec 32) ValueCell!3024))

(declare-fun mapValue!11487 () ValueCell!3024)

(assert (=> mapNonEmpty!11487 (= (arr!8068 _values!1525) (store mapRest!11487 mapKey!11487 mapValue!11487))))

(declare-fun b!332328 () Bool)

(assert (=> b!332328 (= e!204049 tp_is_empty!6735)))

(declare-fun mapIsEmpty!11487 () Bool)

(assert (=> mapIsEmpty!11487 mapRes!11487))

(declare-fun b!332329 () Bool)

(declare-fun res!183075 () Bool)

(assert (=> b!332329 (=> (not res!183075) (not e!204050))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!332329 (= res!183075 (and (= (size!8420 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8419 _keys!1895) (size!8420 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!332330 () Bool)

(declare-fun res!183077 () Bool)

(assert (=> b!332330 (=> (not res!183077) (not e!204050))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17065 (_ BitVec 32)) Bool)

(assert (=> b!332330 (= res!183077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!33482 res!183076) b!332329))

(assert (= (and b!332329 res!183075) b!332330))

(assert (= (and b!332330 res!183077) b!332325))

(assert (= (and b!332327 condMapEmpty!11487) mapIsEmpty!11487))

(assert (= (and b!332327 (not condMapEmpty!11487)) mapNonEmpty!11487))

(get-info :version)

(assert (= (and mapNonEmpty!11487 ((_ is ValueCellFull!3024) mapValue!11487)) b!332326))

(assert (= (and b!332327 ((_ is ValueCellFull!3024) mapDefault!11487)) b!332328))

(assert (= start!33482 b!332327))

(declare-fun m!336885 () Bool)

(assert (=> b!332325 m!336885))

(declare-fun m!336887 () Bool)

(assert (=> start!33482 m!336887))

(declare-fun m!336889 () Bool)

(assert (=> start!33482 m!336889))

(declare-fun m!336891 () Bool)

(assert (=> start!33482 m!336891))

(declare-fun m!336893 () Bool)

(assert (=> mapNonEmpty!11487 m!336893))

(declare-fun m!336895 () Bool)

(assert (=> b!332330 m!336895))

(check-sat (not b!332325) (not b!332330) (not mapNonEmpty!11487) (not start!33482) tp_is_empty!6735)
(check-sat)
