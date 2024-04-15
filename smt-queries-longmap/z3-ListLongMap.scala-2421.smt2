; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38240 () Bool)

(assert start!38240)

(declare-fun b!394429 () Bool)

(declare-fun res!226115 () Bool)

(declare-fun e!238770 () Bool)

(assert (=> b!394429 (=> (not res!226115) (not e!238770))))

(declare-datatypes ((array!23419 0))(
  ( (array!23420 (arr!11166 (Array (_ BitVec 32) (_ BitVec 64))) (size!11519 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23419)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23419 (_ BitVec 32)) Bool)

(assert (=> b!394429 (= res!226115 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!394430 () Bool)

(declare-fun res!226116 () Bool)

(assert (=> b!394430 (=> (not res!226116) (not e!238770))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!394430 (= res!226116 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!16245 () Bool)

(declare-fun mapRes!16245 () Bool)

(declare-fun tp!32040 () Bool)

(declare-fun e!238768 () Bool)

(assert (=> mapNonEmpty!16245 (= mapRes!16245 (and tp!32040 e!238768))))

(declare-datatypes ((V!14123 0))(
  ( (V!14124 (val!4926 Int)) )
))
(declare-datatypes ((ValueCell!4538 0))(
  ( (ValueCellFull!4538 (v!7165 V!14123)) (EmptyCell!4538) )
))
(declare-datatypes ((array!23421 0))(
  ( (array!23422 (arr!11167 (Array (_ BitVec 32) ValueCell!4538)) (size!11520 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23421)

(declare-fun mapRest!16245 () (Array (_ BitVec 32) ValueCell!4538))

(declare-fun mapKey!16245 () (_ BitVec 32))

(declare-fun mapValue!16245 () ValueCell!4538)

(assert (=> mapNonEmpty!16245 (= (arr!11167 _values!549) (store mapRest!16245 mapKey!16245 mapValue!16245))))

(declare-fun b!394431 () Bool)

(declare-fun res!226118 () Bool)

(assert (=> b!394431 (=> (not res!226118) (not e!238770))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!394431 (= res!226118 (and (= (size!11520 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11519 _keys!709) (size!11520 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!394432 () Bool)

(declare-fun tp_is_empty!9763 () Bool)

(assert (=> b!394432 (= e!238768 tp_is_empty!9763)))

(declare-fun mapIsEmpty!16245 () Bool)

(assert (=> mapIsEmpty!16245 mapRes!16245))

(declare-fun b!394433 () Bool)

(declare-fun e!238771 () Bool)

(declare-fun e!238772 () Bool)

(assert (=> b!394433 (= e!238771 (and e!238772 mapRes!16245))))

(declare-fun condMapEmpty!16245 () Bool)

(declare-fun mapDefault!16245 () ValueCell!4538)

(assert (=> b!394433 (= condMapEmpty!16245 (= (arr!11167 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4538)) mapDefault!16245)))))

(declare-fun b!394434 () Bool)

(assert (=> b!394434 (= e!238770 (bvsgt #b00000000000000000000000000000000 (size!11519 _keys!709)))))

(declare-fun b!394435 () Bool)

(assert (=> b!394435 (= e!238772 tp_is_empty!9763)))

(declare-fun res!226117 () Bool)

(assert (=> start!38240 (=> (not res!226117) (not e!238770))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38240 (= res!226117 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11519 _keys!709))))))

(assert (=> start!38240 e!238770))

(assert (=> start!38240 true))

(declare-fun array_inv!8198 (array!23421) Bool)

(assert (=> start!38240 (and (array_inv!8198 _values!549) e!238771)))

(declare-fun array_inv!8199 (array!23419) Bool)

(assert (=> start!38240 (array_inv!8199 _keys!709)))

(assert (= (and start!38240 res!226117) b!394430))

(assert (= (and b!394430 res!226116) b!394431))

(assert (= (and b!394431 res!226118) b!394429))

(assert (= (and b!394429 res!226115) b!394434))

(assert (= (and b!394433 condMapEmpty!16245) mapIsEmpty!16245))

(assert (= (and b!394433 (not condMapEmpty!16245)) mapNonEmpty!16245))

(get-info :version)

(assert (= (and mapNonEmpty!16245 ((_ is ValueCellFull!4538) mapValue!16245)) b!394432))

(assert (= (and b!394433 ((_ is ValueCellFull!4538) mapDefault!16245)) b!394435))

(assert (= start!38240 b!394433))

(declare-fun m!390363 () Bool)

(assert (=> b!394429 m!390363))

(declare-fun m!390365 () Bool)

(assert (=> b!394430 m!390365))

(declare-fun m!390367 () Bool)

(assert (=> mapNonEmpty!16245 m!390367))

(declare-fun m!390369 () Bool)

(assert (=> start!38240 m!390369))

(declare-fun m!390371 () Bool)

(assert (=> start!38240 m!390371))

(check-sat (not mapNonEmpty!16245) (not b!394430) tp_is_empty!9763 (not start!38240) (not b!394429))
(check-sat)
