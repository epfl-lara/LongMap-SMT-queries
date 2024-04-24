; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20140 () Bool)

(assert start!20140)

(declare-fun b_free!4795 () Bool)

(declare-fun b_next!4795 () Bool)

(assert (=> start!20140 (= b_free!4795 (not b_next!4795))))

(declare-fun tp!17417 () Bool)

(declare-fun b_and!11555 () Bool)

(assert (=> start!20140 (= tp!17417 b_and!11555)))

(declare-fun b!197521 () Bool)

(declare-fun e!129967 () Bool)

(declare-fun tp_is_empty!4651 () Bool)

(assert (=> b!197521 (= e!129967 tp_is_empty!4651)))

(declare-fun b!197522 () Bool)

(declare-fun res!93436 () Bool)

(declare-fun e!129968 () Bool)

(assert (=> b!197522 (=> (not res!93436) (not e!129968))))

(declare-datatypes ((array!8547 0))(
  ( (array!8548 (arr!4024 (Array (_ BitVec 32) (_ BitVec 64))) (size!4349 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8547)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!197522 (= res!93436 (= (select (arr!4024 _keys!825) i!601) k0!843))))

(declare-fun b!197523 () Bool)

(assert (=> b!197523 (= e!129968 false)))

(declare-datatypes ((V!5849 0))(
  ( (V!5850 (val!2370 Int)) )
))
(declare-datatypes ((ValueCell!1982 0))(
  ( (ValueCellFull!1982 (v!4341 V!5849)) (EmptyCell!1982) )
))
(declare-datatypes ((array!8549 0))(
  ( (array!8550 (arr!4025 (Array (_ BitVec 32) ValueCell!1982)) (size!4350 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8549)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((tuple2!3552 0))(
  ( (tuple2!3553 (_1!1787 (_ BitVec 64)) (_2!1787 V!5849)) )
))
(declare-datatypes ((List!2470 0))(
  ( (Nil!2467) (Cons!2466 (h!3108 tuple2!3552) (t!7393 List!2470)) )
))
(declare-datatypes ((ListLongMap!2467 0))(
  ( (ListLongMap!2468 (toList!1249 List!2470)) )
))
(declare-fun lt!97784 () ListLongMap!2467)

(declare-fun v!520 () V!5849)

(declare-fun zeroValue!615 () V!5849)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5849)

(declare-fun getCurrentListMapNoExtraKeys!239 (array!8547 array!8549 (_ BitVec 32) (_ BitVec 32) V!5849 V!5849 (_ BitVec 32) Int) ListLongMap!2467)

(assert (=> b!197523 (= lt!97784 (getCurrentListMapNoExtraKeys!239 _keys!825 (array!8550 (store (arr!4025 _values!649) i!601 (ValueCellFull!1982 v!520)) (size!4350 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97783 () ListLongMap!2467)

(assert (=> b!197523 (= lt!97783 (getCurrentListMapNoExtraKeys!239 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!197524 () Bool)

(declare-fun res!93439 () Bool)

(assert (=> b!197524 (=> (not res!93439) (not e!129968))))

(declare-datatypes ((List!2471 0))(
  ( (Nil!2468) (Cons!2467 (h!3109 (_ BitVec 64)) (t!7394 List!2471)) )
))
(declare-fun arrayNoDuplicates!0 (array!8547 (_ BitVec 32) List!2471) Bool)

(assert (=> b!197524 (= res!93439 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2468))))

(declare-fun mapIsEmpty!8045 () Bool)

(declare-fun mapRes!8045 () Bool)

(assert (=> mapIsEmpty!8045 mapRes!8045))

(declare-fun b!197525 () Bool)

(declare-fun res!93434 () Bool)

(assert (=> b!197525 (=> (not res!93434) (not e!129968))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8547 (_ BitVec 32)) Bool)

(assert (=> b!197525 (= res!93434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun res!93438 () Bool)

(assert (=> start!20140 (=> (not res!93438) (not e!129968))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20140 (= res!93438 (validMask!0 mask!1149))))

(assert (=> start!20140 e!129968))

(declare-fun e!129964 () Bool)

(declare-fun array_inv!2621 (array!8549) Bool)

(assert (=> start!20140 (and (array_inv!2621 _values!649) e!129964)))

(assert (=> start!20140 true))

(assert (=> start!20140 tp_is_empty!4651))

(declare-fun array_inv!2622 (array!8547) Bool)

(assert (=> start!20140 (array_inv!2622 _keys!825)))

(assert (=> start!20140 tp!17417))

(declare-fun b!197526 () Bool)

(declare-fun res!93433 () Bool)

(assert (=> b!197526 (=> (not res!93433) (not e!129968))))

(assert (=> b!197526 (= res!93433 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4349 _keys!825))))))

(declare-fun b!197527 () Bool)

(declare-fun e!129966 () Bool)

(assert (=> b!197527 (= e!129966 tp_is_empty!4651)))

(declare-fun b!197528 () Bool)

(declare-fun res!93435 () Bool)

(assert (=> b!197528 (=> (not res!93435) (not e!129968))))

(assert (=> b!197528 (= res!93435 (and (= (size!4350 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4349 _keys!825) (size!4350 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!197529 () Bool)

(assert (=> b!197529 (= e!129964 (and e!129967 mapRes!8045))))

(declare-fun condMapEmpty!8045 () Bool)

(declare-fun mapDefault!8045 () ValueCell!1982)

(assert (=> b!197529 (= condMapEmpty!8045 (= (arr!4025 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1982)) mapDefault!8045)))))

(declare-fun mapNonEmpty!8045 () Bool)

(declare-fun tp!17416 () Bool)

(assert (=> mapNonEmpty!8045 (= mapRes!8045 (and tp!17416 e!129966))))

(declare-fun mapRest!8045 () (Array (_ BitVec 32) ValueCell!1982))

(declare-fun mapKey!8045 () (_ BitVec 32))

(declare-fun mapValue!8045 () ValueCell!1982)

(assert (=> mapNonEmpty!8045 (= (arr!4025 _values!649) (store mapRest!8045 mapKey!8045 mapValue!8045))))

(declare-fun b!197530 () Bool)

(declare-fun res!93437 () Bool)

(assert (=> b!197530 (=> (not res!93437) (not e!129968))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197530 (= res!93437 (validKeyInArray!0 k0!843))))

(assert (= (and start!20140 res!93438) b!197528))

(assert (= (and b!197528 res!93435) b!197525))

(assert (= (and b!197525 res!93434) b!197524))

(assert (= (and b!197524 res!93439) b!197526))

(assert (= (and b!197526 res!93433) b!197530))

(assert (= (and b!197530 res!93437) b!197522))

(assert (= (and b!197522 res!93436) b!197523))

(assert (= (and b!197529 condMapEmpty!8045) mapIsEmpty!8045))

(assert (= (and b!197529 (not condMapEmpty!8045)) mapNonEmpty!8045))

(get-info :version)

(assert (= (and mapNonEmpty!8045 ((_ is ValueCellFull!1982) mapValue!8045)) b!197527))

(assert (= (and b!197529 ((_ is ValueCellFull!1982) mapDefault!8045)) b!197521))

(assert (= start!20140 b!197529))

(declare-fun m!224523 () Bool)

(assert (=> b!197524 m!224523))

(declare-fun m!224525 () Bool)

(assert (=> b!197522 m!224525))

(declare-fun m!224527 () Bool)

(assert (=> start!20140 m!224527))

(declare-fun m!224529 () Bool)

(assert (=> start!20140 m!224529))

(declare-fun m!224531 () Bool)

(assert (=> start!20140 m!224531))

(declare-fun m!224533 () Bool)

(assert (=> b!197525 m!224533))

(declare-fun m!224535 () Bool)

(assert (=> b!197523 m!224535))

(declare-fun m!224537 () Bool)

(assert (=> b!197523 m!224537))

(declare-fun m!224539 () Bool)

(assert (=> b!197523 m!224539))

(declare-fun m!224541 () Bool)

(assert (=> mapNonEmpty!8045 m!224541))

(declare-fun m!224543 () Bool)

(assert (=> b!197530 m!224543))

(check-sat (not b!197524) (not start!20140) (not b_next!4795) (not b!197525) tp_is_empty!4651 (not mapNonEmpty!8045) b_and!11555 (not b!197523) (not b!197530))
(check-sat b_and!11555 (not b_next!4795))
