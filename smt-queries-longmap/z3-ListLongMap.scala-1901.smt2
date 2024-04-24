; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33882 () Bool)

(assert start!33882)

(declare-fun b_free!7075 () Bool)

(declare-fun b_next!7075 () Bool)

(assert (=> start!33882 (= b_free!7075 (not b_next!7075))))

(declare-fun tp!24737 () Bool)

(declare-fun b_and!14275 () Bool)

(assert (=> start!33882 (= tp!24737 b_and!14275)))

(declare-fun mapNonEmpty!11946 () Bool)

(declare-fun mapRes!11946 () Bool)

(declare-fun tp!24738 () Bool)

(declare-fun e!207097 () Bool)

(assert (=> mapNonEmpty!11946 (= mapRes!11946 (and tp!24738 e!207097))))

(declare-datatypes ((V!10347 0))(
  ( (V!10348 (val!3558 Int)) )
))
(declare-datatypes ((ValueCell!3170 0))(
  ( (ValueCellFull!3170 (v!5724 V!10347)) (EmptyCell!3170) )
))
(declare-datatypes ((array!17632 0))(
  ( (array!17633 (arr!8343 (Array (_ BitVec 32) ValueCell!3170)) (size!8695 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17632)

(declare-fun mapRest!11946 () (Array (_ BitVec 32) ValueCell!3170))

(declare-fun mapKey!11946 () (_ BitVec 32))

(declare-fun mapValue!11946 () ValueCell!3170)

(assert (=> mapNonEmpty!11946 (= (arr!8343 _values!1525) (store mapRest!11946 mapKey!11946 mapValue!11946))))

(declare-fun res!186479 () Bool)

(declare-fun e!207096 () Bool)

(assert (=> start!33882 (=> (not res!186479) (not e!207096))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33882 (= res!186479 (validMask!0 mask!2385))))

(assert (=> start!33882 e!207096))

(assert (=> start!33882 true))

(declare-fun tp_is_empty!7027 () Bool)

(assert (=> start!33882 tp_is_empty!7027))

(assert (=> start!33882 tp!24737))

(declare-fun e!207095 () Bool)

(declare-fun array_inv!6200 (array!17632) Bool)

(assert (=> start!33882 (and (array_inv!6200 _values!1525) e!207095)))

(declare-datatypes ((array!17634 0))(
  ( (array!17635 (arr!8344 (Array (_ BitVec 32) (_ BitVec 64))) (size!8696 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17634)

(declare-fun array_inv!6201 (array!17634) Bool)

(assert (=> start!33882 (array_inv!6201 _keys!1895)))

(declare-fun b!337504 () Bool)

(declare-fun res!186478 () Bool)

(assert (=> b!337504 (=> (not res!186478) (not e!207096))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17634 (_ BitVec 32)) Bool)

(assert (=> b!337504 (= res!186478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!337505 () Bool)

(declare-fun res!186482 () Bool)

(declare-fun e!207093 () Bool)

(assert (=> b!337505 (=> (not res!186482) (not e!207093))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17634 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!337505 (= res!186482 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!337506 () Bool)

(declare-fun e!207094 () Bool)

(assert (=> b!337506 (= e!207095 (and e!207094 mapRes!11946))))

(declare-fun condMapEmpty!11946 () Bool)

(declare-fun mapDefault!11946 () ValueCell!3170)

(assert (=> b!337506 (= condMapEmpty!11946 (= (arr!8343 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3170)) mapDefault!11946)))))

(declare-fun b!337507 () Bool)

(assert (=> b!337507 (= e!207097 tp_is_empty!7027)))

(declare-fun b!337508 () Bool)

(assert (=> b!337508 (= e!207094 tp_is_empty!7027)))

(declare-fun b!337509 () Bool)

(assert (=> b!337509 (= e!207096 e!207093)))

(declare-fun res!186483 () Bool)

(assert (=> b!337509 (=> (not res!186483) (not e!207093))))

(declare-datatypes ((SeekEntryResult!3184 0))(
  ( (MissingZero!3184 (index!14915 (_ BitVec 32))) (Found!3184 (index!14916 (_ BitVec 32))) (Intermediate!3184 (undefined!3996 Bool) (index!14917 (_ BitVec 32)) (x!33601 (_ BitVec 32))) (Undefined!3184) (MissingVacant!3184 (index!14918 (_ BitVec 32))) )
))
(declare-fun lt!160473 () SeekEntryResult!3184)

(get-info :version)

(assert (=> b!337509 (= res!186483 (and (not ((_ is Found!3184) lt!160473)) ((_ is MissingZero!3184) lt!160473)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17634 (_ BitVec 32)) SeekEntryResult!3184)

(assert (=> b!337509 (= lt!160473 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!337510 () Bool)

(assert (=> b!337510 (= e!207093 false)))

(declare-fun lt!160474 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17634 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!337510 (= lt!160474 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!337511 () Bool)

(declare-fun res!186484 () Bool)

(assert (=> b!337511 (=> (not res!186484) (not e!207096))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!337511 (= res!186484 (validKeyInArray!0 k0!1348))))

(declare-fun mapIsEmpty!11946 () Bool)

(assert (=> mapIsEmpty!11946 mapRes!11946))

(declare-fun b!337512 () Bool)

(declare-fun res!186481 () Bool)

(assert (=> b!337512 (=> (not res!186481) (not e!207096))))

(declare-datatypes ((List!4691 0))(
  ( (Nil!4688) (Cons!4687 (h!5543 (_ BitVec 64)) (t!9777 List!4691)) )
))
(declare-fun arrayNoDuplicates!0 (array!17634 (_ BitVec 32) List!4691) Bool)

(assert (=> b!337512 (= res!186481 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4688))))

(declare-fun b!337513 () Bool)

(declare-fun res!186485 () Bool)

(assert (=> b!337513 (=> (not res!186485) (not e!207096))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!337513 (= res!186485 (and (= (size!8695 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8696 _keys!1895) (size!8695 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!337514 () Bool)

(declare-fun res!186480 () Bool)

(assert (=> b!337514 (=> (not res!186480) (not e!207096))))

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10347)

(declare-fun zeroValue!1467 () V!10347)

(declare-datatypes ((tuple2!5080 0))(
  ( (tuple2!5081 (_1!2551 (_ BitVec 64)) (_2!2551 V!10347)) )
))
(declare-datatypes ((List!4692 0))(
  ( (Nil!4689) (Cons!4688 (h!5544 tuple2!5080) (t!9778 List!4692)) )
))
(declare-datatypes ((ListLongMap!3995 0))(
  ( (ListLongMap!3996 (toList!2013 List!4692)) )
))
(declare-fun contains!2079 (ListLongMap!3995 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1542 (array!17634 array!17632 (_ BitVec 32) (_ BitVec 32) V!10347 V!10347 (_ BitVec 32) Int) ListLongMap!3995)

(assert (=> b!337514 (= res!186480 (not (contains!2079 (getCurrentListMap!1542 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(assert (= (and start!33882 res!186479) b!337513))

(assert (= (and b!337513 res!186485) b!337504))

(assert (= (and b!337504 res!186478) b!337512))

(assert (= (and b!337512 res!186481) b!337511))

(assert (= (and b!337511 res!186484) b!337514))

(assert (= (and b!337514 res!186480) b!337509))

(assert (= (and b!337509 res!186483) b!337505))

(assert (= (and b!337505 res!186482) b!337510))

(assert (= (and b!337506 condMapEmpty!11946) mapIsEmpty!11946))

(assert (= (and b!337506 (not condMapEmpty!11946)) mapNonEmpty!11946))

(assert (= (and mapNonEmpty!11946 ((_ is ValueCellFull!3170) mapValue!11946)) b!337507))

(assert (= (and b!337506 ((_ is ValueCellFull!3170) mapDefault!11946)) b!337508))

(assert (= start!33882 b!337506))

(declare-fun m!341275 () Bool)

(assert (=> mapNonEmpty!11946 m!341275))

(declare-fun m!341277 () Bool)

(assert (=> b!337512 m!341277))

(declare-fun m!341279 () Bool)

(assert (=> b!337511 m!341279))

(declare-fun m!341281 () Bool)

(assert (=> b!337509 m!341281))

(declare-fun m!341283 () Bool)

(assert (=> b!337504 m!341283))

(declare-fun m!341285 () Bool)

(assert (=> b!337510 m!341285))

(declare-fun m!341287 () Bool)

(assert (=> b!337505 m!341287))

(declare-fun m!341289 () Bool)

(assert (=> start!33882 m!341289))

(declare-fun m!341291 () Bool)

(assert (=> start!33882 m!341291))

(declare-fun m!341293 () Bool)

(assert (=> start!33882 m!341293))

(declare-fun m!341295 () Bool)

(assert (=> b!337514 m!341295))

(assert (=> b!337514 m!341295))

(declare-fun m!341297 () Bool)

(assert (=> b!337514 m!341297))

(check-sat (not b!337509) (not b!337504) (not b_next!7075) (not b!337511) tp_is_empty!7027 (not b!337512) (not mapNonEmpty!11946) (not b!337510) (not start!33882) (not b!337514) (not b!337505) b_and!14275)
(check-sat b_and!14275 (not b_next!7075))
