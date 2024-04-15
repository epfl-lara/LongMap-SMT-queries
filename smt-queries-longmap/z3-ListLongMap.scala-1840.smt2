; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33350 () Bool)

(assert start!33350)

(declare-fun b!331272 () Bool)

(declare-fun e!203222 () Bool)

(declare-fun e!203225 () Bool)

(declare-fun mapRes!11361 () Bool)

(assert (=> b!331272 (= e!203222 (and e!203225 mapRes!11361))))

(declare-fun condMapEmpty!11361 () Bool)

(declare-datatypes ((V!9859 0))(
  ( (V!9860 (val!3375 Int)) )
))
(declare-datatypes ((ValueCell!2987 0))(
  ( (ValueCellFull!2987 (v!5527 V!9859)) (EmptyCell!2987) )
))
(declare-datatypes ((array!16905 0))(
  ( (array!16906 (arr!7992 (Array (_ BitVec 32) ValueCell!2987)) (size!8345 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!16905)

(declare-fun mapDefault!11361 () ValueCell!2987)

(assert (=> b!331272 (= condMapEmpty!11361 (= (arr!7992 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!2987)) mapDefault!11361)))))

(declare-fun b!331273 () Bool)

(declare-fun e!203223 () Bool)

(declare-fun tp_is_empty!6661 () Bool)

(assert (=> b!331273 (= e!203223 tp_is_empty!6661)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun b!331274 () Bool)

(declare-datatypes ((array!16907 0))(
  ( (array!16908 (arr!7993 (Array (_ BitVec 32) (_ BitVec 64))) (size!8346 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!16907)

(declare-fun e!203224 () Bool)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!331274 (= e!203224 (and (= (size!8345 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8346 _keys!1895) (size!8345 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011) (not (= (size!8346 _keys!1895) (bvadd #b00000000000000000000000000000001 mask!2385)))))))

(declare-fun b!331275 () Bool)

(assert (=> b!331275 (= e!203225 tp_is_empty!6661)))

(declare-fun mapIsEmpty!11361 () Bool)

(assert (=> mapIsEmpty!11361 mapRes!11361))

(declare-fun res!182565 () Bool)

(assert (=> start!33350 (=> (not res!182565) (not e!203224))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33350 (= res!182565 (validMask!0 mask!2385))))

(assert (=> start!33350 e!203224))

(assert (=> start!33350 true))

(declare-fun array_inv!5964 (array!16905) Bool)

(assert (=> start!33350 (and (array_inv!5964 _values!1525) e!203222)))

(declare-fun array_inv!5965 (array!16907) Bool)

(assert (=> start!33350 (array_inv!5965 _keys!1895)))

(declare-fun mapNonEmpty!11361 () Bool)

(declare-fun tp!23736 () Bool)

(assert (=> mapNonEmpty!11361 (= mapRes!11361 (and tp!23736 e!203223))))

(declare-fun mapValue!11361 () ValueCell!2987)

(declare-fun mapKey!11361 () (_ BitVec 32))

(declare-fun mapRest!11361 () (Array (_ BitVec 32) ValueCell!2987))

(assert (=> mapNonEmpty!11361 (= (arr!7992 _values!1525) (store mapRest!11361 mapKey!11361 mapValue!11361))))

(assert (= (and start!33350 res!182565) b!331274))

(assert (= (and b!331272 condMapEmpty!11361) mapIsEmpty!11361))

(assert (= (and b!331272 (not condMapEmpty!11361)) mapNonEmpty!11361))

(get-info :version)

(assert (= (and mapNonEmpty!11361 ((_ is ValueCellFull!2987) mapValue!11361)) b!331273))

(assert (= (and b!331272 ((_ is ValueCellFull!2987) mapDefault!11361)) b!331275))

(assert (= start!33350 b!331272))

(declare-fun m!335659 () Bool)

(assert (=> start!33350 m!335659))

(declare-fun m!335661 () Bool)

(assert (=> start!33350 m!335661))

(declare-fun m!335663 () Bool)

(assert (=> start!33350 m!335663))

(declare-fun m!335665 () Bool)

(assert (=> mapNonEmpty!11361 m!335665))

(check-sat (not start!33350) (not mapNonEmpty!11361) tp_is_empty!6661)
(check-sat)
