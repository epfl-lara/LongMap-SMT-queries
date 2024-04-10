; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33524 () Bool)

(assert start!33524)

(declare-fun b_free!6813 () Bool)

(declare-fun b_next!6813 () Bool)

(assert (=> start!33524 (= b_free!6813 (not b_next!6813))))

(declare-fun tp!23934 () Bool)

(declare-fun b_and!13987 () Bool)

(assert (=> start!33524 (= tp!23934 b_and!13987)))

(declare-fun b!332699 () Bool)

(declare-fun e!204299 () Bool)

(declare-fun e!204302 () Bool)

(declare-fun mapRes!11535 () Bool)

(assert (=> b!332699 (= e!204299 (and e!204302 mapRes!11535))))

(declare-fun condMapEmpty!11535 () Bool)

(declare-datatypes ((V!9997 0))(
  ( (V!9998 (val!3427 Int)) )
))
(declare-datatypes ((ValueCell!3039 0))(
  ( (ValueCellFull!3039 (v!5586 V!9997)) (EmptyCell!3039) )
))
(declare-datatypes ((array!17127 0))(
  ( (array!17128 (arr!8097 (Array (_ BitVec 32) ValueCell!3039)) (size!8449 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17127)

(declare-fun mapDefault!11535 () ValueCell!3039)

(assert (=> b!332699 (= condMapEmpty!11535 (= (arr!8097 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3039)) mapDefault!11535)))))

(declare-fun b!332700 () Bool)

(declare-fun e!204303 () Bool)

(declare-datatypes ((array!17129 0))(
  ( (array!17130 (arr!8098 (Array (_ BitVec 32) (_ BitVec 64))) (size!8450 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17129)

(declare-fun mask!2385 () (_ BitVec 32))

(assert (=> b!332700 (= e!204303 (not (= (size!8450 _keys!1895) (bvadd #b00000000000000000000000000000001 mask!2385))))))

(declare-fun b!332701 () Bool)

(declare-fun res!183297 () Bool)

(assert (=> b!332701 (=> (not res!183297) (not e!204303))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!332701 (= res!183297 (validKeyInArray!0 k0!1348))))

(declare-fun b!332702 () Bool)

(declare-fun res!183299 () Bool)

(assert (=> b!332702 (=> (not res!183299) (not e!204303))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17129 (_ BitVec 32)) Bool)

(assert (=> b!332702 (= res!183299 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!11535 () Bool)

(assert (=> mapIsEmpty!11535 mapRes!11535))

(declare-fun b!332703 () Bool)

(declare-fun e!204300 () Bool)

(declare-fun tp_is_empty!6765 () Bool)

(assert (=> b!332703 (= e!204300 tp_is_empty!6765)))

(declare-fun mapNonEmpty!11535 () Bool)

(declare-fun tp!23933 () Bool)

(assert (=> mapNonEmpty!11535 (= mapRes!11535 (and tp!23933 e!204300))))

(declare-fun mapKey!11535 () (_ BitVec 32))

(declare-fun mapValue!11535 () ValueCell!3039)

(declare-fun mapRest!11535 () (Array (_ BitVec 32) ValueCell!3039))

(assert (=> mapNonEmpty!11535 (= (arr!8097 _values!1525) (store mapRest!11535 mapKey!11535 mapValue!11535))))

(declare-fun b!332705 () Bool)

(assert (=> b!332705 (= e!204302 tp_is_empty!6765)))

(declare-fun res!183296 () Bool)

(assert (=> start!33524 (=> (not res!183296) (not e!204303))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33524 (= res!183296 (validMask!0 mask!2385))))

(assert (=> start!33524 e!204303))

(assert (=> start!33524 true))

(assert (=> start!33524 tp_is_empty!6765))

(assert (=> start!33524 tp!23934))

(declare-fun array_inv!6032 (array!17127) Bool)

(assert (=> start!33524 (and (array_inv!6032 _values!1525) e!204299)))

(declare-fun array_inv!6033 (array!17129) Bool)

(assert (=> start!33524 (array_inv!6033 _keys!1895)))

(declare-fun b!332704 () Bool)

(declare-fun res!183295 () Bool)

(assert (=> b!332704 (=> (not res!183295) (not e!204303))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!332704 (= res!183295 (and (= (size!8449 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8450 _keys!1895) (size!8449 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!332706 () Bool)

(declare-fun res!183298 () Bool)

(assert (=> b!332706 (=> (not res!183298) (not e!204303))))

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!9997)

(declare-fun zeroValue!1467 () V!9997)

(declare-datatypes ((tuple2!4992 0))(
  ( (tuple2!4993 (_1!2507 (_ BitVec 64)) (_2!2507 V!9997)) )
))
(declare-datatypes ((List!4607 0))(
  ( (Nil!4604) (Cons!4603 (h!5459 tuple2!4992) (t!9689 List!4607)) )
))
(declare-datatypes ((ListLongMap!3905 0))(
  ( (ListLongMap!3906 (toList!1968 List!4607)) )
))
(declare-fun contains!2009 (ListLongMap!3905 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1496 (array!17129 array!17127 (_ BitVec 32) (_ BitVec 32) V!9997 V!9997 (_ BitVec 32) Int) ListLongMap!3905)

(assert (=> b!332706 (= res!183298 (not (contains!2009 (getCurrentListMap!1496 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!332707 () Bool)

(declare-fun res!183294 () Bool)

(assert (=> b!332707 (=> (not res!183294) (not e!204303))))

(declare-datatypes ((List!4608 0))(
  ( (Nil!4605) (Cons!4604 (h!5460 (_ BitVec 64)) (t!9690 List!4608)) )
))
(declare-fun arrayNoDuplicates!0 (array!17129 (_ BitVec 32) List!4608) Bool)

(assert (=> b!332707 (= res!183294 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4605))))

(assert (= (and start!33524 res!183296) b!332704))

(assert (= (and b!332704 res!183295) b!332702))

(assert (= (and b!332702 res!183299) b!332707))

(assert (= (and b!332707 res!183294) b!332701))

(assert (= (and b!332701 res!183297) b!332706))

(assert (= (and b!332706 res!183298) b!332700))

(assert (= (and b!332699 condMapEmpty!11535) mapIsEmpty!11535))

(assert (= (and b!332699 (not condMapEmpty!11535)) mapNonEmpty!11535))

(get-info :version)

(assert (= (and mapNonEmpty!11535 ((_ is ValueCellFull!3039) mapValue!11535)) b!332703))

(assert (= (and b!332699 ((_ is ValueCellFull!3039) mapDefault!11535)) b!332705))

(assert (= start!33524 b!332699))

(declare-fun m!337131 () Bool)

(assert (=> b!332702 m!337131))

(declare-fun m!337133 () Bool)

(assert (=> start!33524 m!337133))

(declare-fun m!337135 () Bool)

(assert (=> start!33524 m!337135))

(declare-fun m!337137 () Bool)

(assert (=> start!33524 m!337137))

(declare-fun m!337139 () Bool)

(assert (=> b!332707 m!337139))

(declare-fun m!337141 () Bool)

(assert (=> b!332706 m!337141))

(assert (=> b!332706 m!337141))

(declare-fun m!337143 () Bool)

(assert (=> b!332706 m!337143))

(declare-fun m!337145 () Bool)

(assert (=> b!332701 m!337145))

(declare-fun m!337147 () Bool)

(assert (=> mapNonEmpty!11535 m!337147))

(check-sat (not start!33524) b_and!13987 (not b_next!6813) (not b!332706) tp_is_empty!6765 (not b!332707) (not b!332701) (not b!332702) (not mapNonEmpty!11535))
(check-sat b_and!13987 (not b_next!6813))
