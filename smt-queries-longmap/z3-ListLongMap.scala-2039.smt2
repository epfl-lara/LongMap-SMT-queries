; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35404 () Bool)

(assert start!35404)

(declare-fun res!196471 () Bool)

(declare-fun e!217223 () Bool)

(assert (=> start!35404 (=> (not res!196471) (not e!217223))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35404 (= res!196471 (validMask!0 mask!1842))))

(assert (=> start!35404 e!217223))

(assert (=> start!35404 true))

(declare-datatypes ((V!11453 0))(
  ( (V!11454 (val!3973 Int)) )
))
(declare-datatypes ((ValueCell!3585 0))(
  ( (ValueCellFull!3585 (v!6167 V!11453)) (EmptyCell!3585) )
))
(declare-datatypes ((array!19297 0))(
  ( (array!19298 (arr!9142 (Array (_ BitVec 32) ValueCell!3585)) (size!9494 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19297)

(declare-fun e!217225 () Bool)

(declare-fun array_inv!6722 (array!19297) Bool)

(assert (=> start!35404 (and (array_inv!6722 _values!1208) e!217225)))

(declare-datatypes ((array!19299 0))(
  ( (array!19300 (arr!9143 (Array (_ BitVec 32) (_ BitVec 64))) (size!9495 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19299)

(declare-fun array_inv!6723 (array!19299) Bool)

(assert (=> start!35404 (array_inv!6723 _keys!1456)))

(declare-fun b!354422 () Bool)

(declare-fun res!196470 () Bool)

(assert (=> b!354422 (=> (not res!196470) (not e!217223))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19299 (_ BitVec 32)) Bool)

(assert (=> b!354422 (= res!196470 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapIsEmpty!13293 () Bool)

(declare-fun mapRes!13293 () Bool)

(assert (=> mapIsEmpty!13293 mapRes!13293))

(declare-fun b!354423 () Bool)

(assert (=> b!354423 (= e!217223 false)))

(declare-fun lt!165701 () Bool)

(declare-datatypes ((List!5296 0))(
  ( (Nil!5293) (Cons!5292 (h!6148 (_ BitVec 64)) (t!10446 List!5296)) )
))
(declare-fun arrayNoDuplicates!0 (array!19299 (_ BitVec 32) List!5296) Bool)

(assert (=> b!354423 (= lt!165701 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5293))))

(declare-fun mapNonEmpty!13293 () Bool)

(declare-fun tp!27189 () Bool)

(declare-fun e!217226 () Bool)

(assert (=> mapNonEmpty!13293 (= mapRes!13293 (and tp!27189 e!217226))))

(declare-fun mapRest!13293 () (Array (_ BitVec 32) ValueCell!3585))

(declare-fun mapKey!13293 () (_ BitVec 32))

(declare-fun mapValue!13293 () ValueCell!3585)

(assert (=> mapNonEmpty!13293 (= (arr!9142 _values!1208) (store mapRest!13293 mapKey!13293 mapValue!13293))))

(declare-fun b!354424 () Bool)

(declare-fun res!196469 () Bool)

(assert (=> b!354424 (=> (not res!196469) (not e!217223))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!354424 (= res!196469 (and (= (size!9494 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9495 _keys!1456) (size!9494 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!354425 () Bool)

(declare-fun tp_is_empty!7857 () Bool)

(assert (=> b!354425 (= e!217226 tp_is_empty!7857)))

(declare-fun b!354426 () Bool)

(declare-fun e!217222 () Bool)

(assert (=> b!354426 (= e!217225 (and e!217222 mapRes!13293))))

(declare-fun condMapEmpty!13293 () Bool)

(declare-fun mapDefault!13293 () ValueCell!3585)

(assert (=> b!354426 (= condMapEmpty!13293 (= (arr!9142 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3585)) mapDefault!13293)))))

(declare-fun b!354427 () Bool)

(assert (=> b!354427 (= e!217222 tp_is_empty!7857)))

(assert (= (and start!35404 res!196471) b!354424))

(assert (= (and b!354424 res!196469) b!354422))

(assert (= (and b!354422 res!196470) b!354423))

(assert (= (and b!354426 condMapEmpty!13293) mapIsEmpty!13293))

(assert (= (and b!354426 (not condMapEmpty!13293)) mapNonEmpty!13293))

(get-info :version)

(assert (= (and mapNonEmpty!13293 ((_ is ValueCellFull!3585) mapValue!13293)) b!354425))

(assert (= (and b!354426 ((_ is ValueCellFull!3585) mapDefault!13293)) b!354427))

(assert (= start!35404 b!354426))

(declare-fun m!353443 () Bool)

(assert (=> start!35404 m!353443))

(declare-fun m!353445 () Bool)

(assert (=> start!35404 m!353445))

(declare-fun m!353447 () Bool)

(assert (=> start!35404 m!353447))

(declare-fun m!353449 () Bool)

(assert (=> b!354422 m!353449))

(declare-fun m!353451 () Bool)

(assert (=> b!354423 m!353451))

(declare-fun m!353453 () Bool)

(assert (=> mapNonEmpty!13293 m!353453))

(check-sat tp_is_empty!7857 (not start!35404) (not b!354423) (not mapNonEmpty!13293) (not b!354422))
(check-sat)
