; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33904 () Bool)

(assert start!33904)

(declare-fun b_free!7083 () Bool)

(declare-fun b_next!7083 () Bool)

(assert (=> start!33904 (= b_free!7083 (not b_next!7083))))

(declare-fun tp!24762 () Bool)

(declare-fun b_and!14269 () Bool)

(assert (=> start!33904 (= tp!24762 b_and!14269)))

(declare-fun b!337694 () Bool)

(declare-fun res!186578 () Bool)

(declare-fun e!207209 () Bool)

(assert (=> b!337694 (=> (not res!186578) (not e!207209))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!10357 0))(
  ( (V!10358 (val!3562 Int)) )
))
(declare-fun zeroValue!1467 () V!10357)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3174 0))(
  ( (ValueCellFull!3174 (v!5727 V!10357)) (EmptyCell!3174) )
))
(declare-datatypes ((array!17663 0))(
  ( (array!17664 (arr!8359 (Array (_ BitVec 32) ValueCell!3174)) (size!8711 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17663)

(declare-datatypes ((array!17665 0))(
  ( (array!17666 (arr!8360 (Array (_ BitVec 32) (_ BitVec 64))) (size!8712 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17665)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10357)

(declare-datatypes ((tuple2!5172 0))(
  ( (tuple2!5173 (_1!2597 (_ BitVec 64)) (_2!2597 V!10357)) )
))
(declare-datatypes ((List!4788 0))(
  ( (Nil!4785) (Cons!4784 (h!5640 tuple2!5172) (t!9882 List!4788)) )
))
(declare-datatypes ((ListLongMap!4085 0))(
  ( (ListLongMap!4086 (toList!2058 List!4788)) )
))
(declare-fun contains!2105 (ListLongMap!4085 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1579 (array!17665 array!17663 (_ BitVec 32) (_ BitVec 32) V!10357 V!10357 (_ BitVec 32) Int) ListLongMap!4085)

(assert (=> b!337694 (= res!186578 (not (contains!2105 (getCurrentListMap!1579 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapIsEmpty!11958 () Bool)

(declare-fun mapRes!11958 () Bool)

(assert (=> mapIsEmpty!11958 mapRes!11958))

(declare-fun b!337695 () Bool)

(declare-fun res!186572 () Bool)

(assert (=> b!337695 (=> (not res!186572) (not e!207209))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17665 (_ BitVec 32)) Bool)

(assert (=> b!337695 (= res!186572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!337696 () Bool)

(declare-fun res!186577 () Bool)

(assert (=> b!337696 (=> (not res!186577) (not e!207209))))

(assert (=> b!337696 (= res!186577 (and (= (size!8711 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8712 _keys!1895) (size!8711 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!186575 () Bool)

(assert (=> start!33904 (=> (not res!186575) (not e!207209))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33904 (= res!186575 (validMask!0 mask!2385))))

(assert (=> start!33904 e!207209))

(assert (=> start!33904 true))

(declare-fun tp_is_empty!7035 () Bool)

(assert (=> start!33904 tp_is_empty!7035))

(assert (=> start!33904 tp!24762))

(declare-fun e!207207 () Bool)

(declare-fun array_inv!6206 (array!17663) Bool)

(assert (=> start!33904 (and (array_inv!6206 _values!1525) e!207207)))

(declare-fun array_inv!6207 (array!17665) Bool)

(assert (=> start!33904 (array_inv!6207 _keys!1895)))

(declare-fun b!337697 () Bool)

(declare-fun res!186574 () Bool)

(assert (=> b!337697 (=> (not res!186574) (not e!207209))))

(declare-datatypes ((List!4789 0))(
  ( (Nil!4786) (Cons!4785 (h!5641 (_ BitVec 64)) (t!9883 List!4789)) )
))
(declare-fun arrayNoDuplicates!0 (array!17665 (_ BitVec 32) List!4789) Bool)

(assert (=> b!337697 (= res!186574 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4786))))

(declare-fun b!337698 () Bool)

(declare-fun e!207208 () Bool)

(assert (=> b!337698 (= e!207208 false)))

(declare-datatypes ((Unit!10467 0))(
  ( (Unit!10468) )
))
(declare-fun lt!160485 () Unit!10467)

(declare-fun e!207205 () Unit!10467)

(assert (=> b!337698 (= lt!160485 e!207205)))

(declare-fun c!52308 () Bool)

(declare-fun arrayContainsKey!0 (array!17665 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!337698 (= c!52308 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!337699 () Bool)

(declare-fun e!207206 () Bool)

(assert (=> b!337699 (= e!207207 (and e!207206 mapRes!11958))))

(declare-fun condMapEmpty!11958 () Bool)

(declare-fun mapDefault!11958 () ValueCell!3174)

(assert (=> b!337699 (= condMapEmpty!11958 (= (arr!8359 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3174)) mapDefault!11958)))))

(declare-fun mapNonEmpty!11958 () Bool)

(declare-fun tp!24761 () Bool)

(declare-fun e!207210 () Bool)

(assert (=> mapNonEmpty!11958 (= mapRes!11958 (and tp!24761 e!207210))))

(declare-fun mapKey!11958 () (_ BitVec 32))

(declare-fun mapRest!11958 () (Array (_ BitVec 32) ValueCell!3174))

(declare-fun mapValue!11958 () ValueCell!3174)

(assert (=> mapNonEmpty!11958 (= (arr!8359 _values!1525) (store mapRest!11958 mapKey!11958 mapValue!11958))))

(declare-fun b!337700 () Bool)

(assert (=> b!337700 (= e!207209 e!207208)))

(declare-fun res!186576 () Bool)

(assert (=> b!337700 (=> (not res!186576) (not e!207208))))

(declare-datatypes ((SeekEntryResult!3229 0))(
  ( (MissingZero!3229 (index!15095 (_ BitVec 32))) (Found!3229 (index!15096 (_ BitVec 32))) (Intermediate!3229 (undefined!4041 Bool) (index!15097 (_ BitVec 32)) (x!33657 (_ BitVec 32))) (Undefined!3229) (MissingVacant!3229 (index!15098 (_ BitVec 32))) )
))
(declare-fun lt!160484 () SeekEntryResult!3229)

(get-info :version)

(assert (=> b!337700 (= res!186576 (and (not ((_ is Found!3229) lt!160484)) ((_ is MissingZero!3229) lt!160484)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17665 (_ BitVec 32)) SeekEntryResult!3229)

(assert (=> b!337700 (= lt!160484 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!337701 () Bool)

(declare-fun Unit!10469 () Unit!10467)

(assert (=> b!337701 (= e!207205 Unit!10469)))

(declare-fun lt!160486 () Unit!10467)

(declare-fun lemmaArrayContainsKeyThenInListMap!263 (array!17665 array!17663 (_ BitVec 32) (_ BitVec 32) V!10357 V!10357 (_ BitVec 64) (_ BitVec 32) Int) Unit!10467)

(declare-fun arrayScanForKey!0 (array!17665 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!337701 (= lt!160486 (lemmaArrayContainsKeyThenInListMap!263 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!337701 false))

(declare-fun b!337702 () Bool)

(declare-fun Unit!10470 () Unit!10467)

(assert (=> b!337702 (= e!207205 Unit!10470)))

(declare-fun b!337703 () Bool)

(assert (=> b!337703 (= e!207206 tp_is_empty!7035)))

(declare-fun b!337704 () Bool)

(declare-fun res!186573 () Bool)

(assert (=> b!337704 (=> (not res!186573) (not e!207209))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!337704 (= res!186573 (validKeyInArray!0 k0!1348))))

(declare-fun b!337705 () Bool)

(assert (=> b!337705 (= e!207210 tp_is_empty!7035)))

(assert (= (and start!33904 res!186575) b!337696))

(assert (= (and b!337696 res!186577) b!337695))

(assert (= (and b!337695 res!186572) b!337697))

(assert (= (and b!337697 res!186574) b!337704))

(assert (= (and b!337704 res!186573) b!337694))

(assert (= (and b!337694 res!186578) b!337700))

(assert (= (and b!337700 res!186576) b!337698))

(assert (= (and b!337698 c!52308) b!337701))

(assert (= (and b!337698 (not c!52308)) b!337702))

(assert (= (and b!337699 condMapEmpty!11958) mapIsEmpty!11958))

(assert (= (and b!337699 (not condMapEmpty!11958)) mapNonEmpty!11958))

(assert (= (and mapNonEmpty!11958 ((_ is ValueCellFull!3174) mapValue!11958)) b!337705))

(assert (= (and b!337699 ((_ is ValueCellFull!3174) mapDefault!11958)) b!337703))

(assert (= start!33904 b!337699))

(declare-fun m!341149 () Bool)

(assert (=> b!337695 m!341149))

(declare-fun m!341151 () Bool)

(assert (=> b!337697 m!341151))

(declare-fun m!341153 () Bool)

(assert (=> b!337698 m!341153))

(declare-fun m!341155 () Bool)

(assert (=> mapNonEmpty!11958 m!341155))

(declare-fun m!341157 () Bool)

(assert (=> start!33904 m!341157))

(declare-fun m!341159 () Bool)

(assert (=> start!33904 m!341159))

(declare-fun m!341161 () Bool)

(assert (=> start!33904 m!341161))

(declare-fun m!341163 () Bool)

(assert (=> b!337700 m!341163))

(declare-fun m!341165 () Bool)

(assert (=> b!337694 m!341165))

(assert (=> b!337694 m!341165))

(declare-fun m!341167 () Bool)

(assert (=> b!337694 m!341167))

(declare-fun m!341169 () Bool)

(assert (=> b!337701 m!341169))

(assert (=> b!337701 m!341169))

(declare-fun m!341171 () Bool)

(assert (=> b!337701 m!341171))

(declare-fun m!341173 () Bool)

(assert (=> b!337704 m!341173))

(check-sat (not b!337697) (not b!337695) (not start!33904) (not b!337698) (not b!337701) tp_is_empty!7035 b_and!14269 (not b!337694) (not mapNonEmpty!11958) (not b_next!7083) (not b!337700) (not b!337704))
(check-sat b_and!14269 (not b_next!7083))
