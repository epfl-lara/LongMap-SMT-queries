; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36040 () Bool)

(assert start!36040)

(declare-fun b!361705 () Bool)

(declare-fun e!221530 () Bool)

(assert (=> b!361705 (= e!221530 false)))

(declare-fun lt!166370 () Bool)

(declare-datatypes ((array!20365 0))(
  ( (array!20366 (arr!9667 (Array (_ BitVec 32) (_ BitVec 64))) (size!10020 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20365)

(declare-datatypes ((List!5487 0))(
  ( (Nil!5484) (Cons!5483 (h!6339 (_ BitVec 64)) (t!10628 List!5487)) )
))
(declare-fun arrayNoDuplicates!0 (array!20365 (_ BitVec 32) List!5487) Bool)

(assert (=> b!361705 (= lt!166370 (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5484))))

(declare-fun b!361706 () Bool)

(declare-fun e!221533 () Bool)

(declare-fun tp_is_empty!8413 () Bool)

(assert (=> b!361706 (= e!221533 tp_is_empty!8413)))

(declare-fun mapIsEmpty!14154 () Bool)

(declare-fun mapRes!14154 () Bool)

(assert (=> mapIsEmpty!14154 mapRes!14154))

(declare-fun res!201252 () Bool)

(assert (=> start!36040 (=> (not res!201252) (not e!221530))))

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36040 (= res!201252 (validMask!0 mask!1943))))

(assert (=> start!36040 e!221530))

(assert (=> start!36040 true))

(declare-datatypes ((V!12195 0))(
  ( (V!12196 (val!4251 Int)) )
))
(declare-datatypes ((ValueCell!3863 0))(
  ( (ValueCellFull!3863 (v!6440 V!12195)) (EmptyCell!3863) )
))
(declare-datatypes ((array!20367 0))(
  ( (array!20368 (arr!9668 (Array (_ BitVec 32) ValueCell!3863)) (size!10021 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20367)

(declare-fun e!221532 () Bool)

(declare-fun array_inv!7122 (array!20367) Bool)

(assert (=> start!36040 (and (array_inv!7122 _values!1277) e!221532)))

(declare-fun array_inv!7123 (array!20365) Bool)

(assert (=> start!36040 (array_inv!7123 _keys!1541)))

(declare-fun mapNonEmpty!14154 () Bool)

(declare-fun tp!28230 () Bool)

(declare-fun e!221529 () Bool)

(assert (=> mapNonEmpty!14154 (= mapRes!14154 (and tp!28230 e!221529))))

(declare-fun mapKey!14154 () (_ BitVec 32))

(declare-fun mapValue!14154 () ValueCell!3863)

(declare-fun mapRest!14154 () (Array (_ BitVec 32) ValueCell!3863))

(assert (=> mapNonEmpty!14154 (= (arr!9668 _values!1277) (store mapRest!14154 mapKey!14154 mapValue!14154))))

(declare-fun b!361707 () Bool)

(assert (=> b!361707 (= e!221532 (and e!221533 mapRes!14154))))

(declare-fun condMapEmpty!14154 () Bool)

(declare-fun mapDefault!14154 () ValueCell!3863)

(assert (=> b!361707 (= condMapEmpty!14154 (= (arr!9668 _values!1277) ((as const (Array (_ BitVec 32) ValueCell!3863)) mapDefault!14154)))))

(declare-fun b!361708 () Bool)

(declare-fun res!201253 () Bool)

(assert (=> b!361708 (=> (not res!201253) (not e!221530))))

(declare-fun extraKeys!1198 () (_ BitVec 32))

(assert (=> b!361708 (= res!201253 (and (= (size!10021 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!10020 _keys!1541) (size!10021 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun b!361709 () Bool)

(declare-fun res!201254 () Bool)

(assert (=> b!361709 (=> (not res!201254) (not e!221530))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20365 (_ BitVec 32)) Bool)

(assert (=> b!361709 (= res!201254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun b!361710 () Bool)

(assert (=> b!361710 (= e!221529 tp_is_empty!8413)))

(assert (= (and start!36040 res!201252) b!361708))

(assert (= (and b!361708 res!201253) b!361709))

(assert (= (and b!361709 res!201254) b!361705))

(assert (= (and b!361707 condMapEmpty!14154) mapIsEmpty!14154))

(assert (= (and b!361707 (not condMapEmpty!14154)) mapNonEmpty!14154))

(get-info :version)

(assert (= (and mapNonEmpty!14154 ((_ is ValueCellFull!3863) mapValue!14154)) b!361710))

(assert (= (and b!361707 ((_ is ValueCellFull!3863) mapDefault!14154)) b!361706))

(assert (= start!36040 b!361707))

(declare-fun m!357853 () Bool)

(assert (=> b!361705 m!357853))

(declare-fun m!357855 () Bool)

(assert (=> start!36040 m!357855))

(declare-fun m!357857 () Bool)

(assert (=> start!36040 m!357857))

(declare-fun m!357859 () Bool)

(assert (=> start!36040 m!357859))

(declare-fun m!357861 () Bool)

(assert (=> mapNonEmpty!14154 m!357861))

(declare-fun m!357863 () Bool)

(assert (=> b!361709 m!357863))

(check-sat (not b!361705) tp_is_empty!8413 (not mapNonEmpty!14154) (not b!361709) (not start!36040))
(check-sat)
