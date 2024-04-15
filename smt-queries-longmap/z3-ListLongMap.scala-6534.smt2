; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83070 () Bool)

(assert start!83070)

(declare-fun b!968997 () Bool)

(declare-fun e!546258 () Bool)

(declare-fun e!546261 () Bool)

(declare-fun mapRes!34978 () Bool)

(assert (=> b!968997 (= e!546258 (and e!546261 mapRes!34978))))

(declare-fun condMapEmpty!34978 () Bool)

(declare-datatypes ((V!34289 0))(
  ( (V!34290 (val!11040 Int)) )
))
(declare-datatypes ((ValueCell!10508 0))(
  ( (ValueCellFull!10508 (v!13598 V!34289)) (EmptyCell!10508) )
))
(declare-datatypes ((array!59960 0))(
  ( (array!59961 (arr!28844 (Array (_ BitVec 32) ValueCell!10508)) (size!29325 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59960)

(declare-fun mapDefault!34978 () ValueCell!10508)

(assert (=> b!968997 (= condMapEmpty!34978 (= (arr!28844 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10508)) mapDefault!34978)))))

(declare-fun b!968998 () Bool)

(declare-fun tp_is_empty!21979 () Bool)

(assert (=> b!968998 (= e!546261 tp_is_empty!21979)))

(declare-fun b!968999 () Bool)

(declare-fun e!546260 () Bool)

(assert (=> b!968999 (= e!546260 tp_is_empty!21979)))

(declare-fun mapIsEmpty!34978 () Bool)

(assert (=> mapIsEmpty!34978 mapRes!34978))

(declare-fun b!969000 () Bool)

(declare-fun res!648631 () Bool)

(declare-fun e!546259 () Bool)

(assert (=> b!969000 (=> (not res!648631) (not e!546259))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!59962 0))(
  ( (array!59963 (arr!28845 (Array (_ BitVec 32) (_ BitVec 64))) (size!29326 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59962)

(assert (=> b!969000 (= res!648631 (and (= (size!29325 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29326 _keys!1717) (size!29325 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!969001 () Bool)

(assert (=> b!969001 (= e!546259 false)))

(declare-fun lt!431382 () Bool)

(declare-datatypes ((List!20053 0))(
  ( (Nil!20050) (Cons!20049 (h!21211 (_ BitVec 64)) (t!28407 List!20053)) )
))
(declare-fun arrayNoDuplicates!0 (array!59962 (_ BitVec 32) List!20053) Bool)

(assert (=> b!969001 (= lt!431382 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20050))))

(declare-fun b!969002 () Bool)

(declare-fun res!648629 () Bool)

(assert (=> b!969002 (=> (not res!648629) (not e!546259))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59962 (_ BitVec 32)) Bool)

(assert (=> b!969002 (= res!648629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun res!648630 () Bool)

(assert (=> start!83070 (=> (not res!648630) (not e!546259))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83070 (= res!648630 (validMask!0 mask!2147))))

(assert (=> start!83070 e!546259))

(assert (=> start!83070 true))

(declare-fun array_inv!22393 (array!59960) Bool)

(assert (=> start!83070 (and (array_inv!22393 _values!1425) e!546258)))

(declare-fun array_inv!22394 (array!59962) Bool)

(assert (=> start!83070 (array_inv!22394 _keys!1717)))

(declare-fun mapNonEmpty!34978 () Bool)

(declare-fun tp!66547 () Bool)

(assert (=> mapNonEmpty!34978 (= mapRes!34978 (and tp!66547 e!546260))))

(declare-fun mapValue!34978 () ValueCell!10508)

(declare-fun mapRest!34978 () (Array (_ BitVec 32) ValueCell!10508))

(declare-fun mapKey!34978 () (_ BitVec 32))

(assert (=> mapNonEmpty!34978 (= (arr!28844 _values!1425) (store mapRest!34978 mapKey!34978 mapValue!34978))))

(assert (= (and start!83070 res!648630) b!969000))

(assert (= (and b!969000 res!648631) b!969002))

(assert (= (and b!969002 res!648629) b!969001))

(assert (= (and b!968997 condMapEmpty!34978) mapIsEmpty!34978))

(assert (= (and b!968997 (not condMapEmpty!34978)) mapNonEmpty!34978))

(get-info :version)

(assert (= (and mapNonEmpty!34978 ((_ is ValueCellFull!10508) mapValue!34978)) b!968999))

(assert (= (and b!968997 ((_ is ValueCellFull!10508) mapDefault!34978)) b!968998))

(assert (= start!83070 b!968997))

(declare-fun m!896549 () Bool)

(assert (=> b!969001 m!896549))

(declare-fun m!896551 () Bool)

(assert (=> b!969002 m!896551))

(declare-fun m!896553 () Bool)

(assert (=> start!83070 m!896553))

(declare-fun m!896555 () Bool)

(assert (=> start!83070 m!896555))

(declare-fun m!896557 () Bool)

(assert (=> start!83070 m!896557))

(declare-fun m!896559 () Bool)

(assert (=> mapNonEmpty!34978 m!896559))

(check-sat (not b!969001) tp_is_empty!21979 (not mapNonEmpty!34978) (not b!969002) (not start!83070))
(check-sat)
