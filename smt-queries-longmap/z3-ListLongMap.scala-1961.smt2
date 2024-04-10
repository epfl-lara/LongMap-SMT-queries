; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34514 () Bool)

(assert start!34514)

(declare-fun b_free!7437 () Bool)

(declare-fun b_next!7437 () Bool)

(assert (=> start!34514 (= b_free!7437 (not b_next!7437))))

(declare-fun tp!25856 () Bool)

(declare-fun b_and!14645 () Bool)

(assert (=> start!34514 (= tp!25856 b_and!14645)))

(declare-fun mapNonEmpty!12522 () Bool)

(declare-fun mapRes!12522 () Bool)

(declare-fun tp!25857 () Bool)

(declare-fun e!211432 () Bool)

(assert (=> mapNonEmpty!12522 (= mapRes!12522 (and tp!25857 e!211432))))

(declare-datatypes ((V!10829 0))(
  ( (V!10830 (val!3739 Int)) )
))
(declare-datatypes ((ValueCell!3351 0))(
  ( (ValueCellFull!3351 (v!5915 V!10829)) (EmptyCell!3351) )
))
(declare-fun mapValue!12522 () ValueCell!3351)

(declare-datatypes ((array!18361 0))(
  ( (array!18362 (arr!8697 (Array (_ BitVec 32) ValueCell!3351)) (size!9049 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18361)

(declare-fun mapKey!12522 () (_ BitVec 32))

(declare-fun mapRest!12522 () (Array (_ BitVec 32) ValueCell!3351))

(assert (=> mapNonEmpty!12522 (= (arr!8697 _values!1525) (store mapRest!12522 mapKey!12522 mapValue!12522))))

(declare-fun b!344947 () Bool)

(declare-fun tp_is_empty!7389 () Bool)

(assert (=> b!344947 (= e!211432 tp_is_empty!7389)))

(declare-fun b!344948 () Bool)

(declare-fun e!211433 () Bool)

(declare-fun e!211431 () Bool)

(assert (=> b!344948 (= e!211433 (and e!211431 mapRes!12522))))

(declare-fun condMapEmpty!12522 () Bool)

(declare-fun mapDefault!12522 () ValueCell!3351)

(assert (=> b!344948 (= condMapEmpty!12522 (= (arr!8697 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3351)) mapDefault!12522)))))

(declare-fun b!344949 () Bool)

(declare-fun res!190824 () Bool)

(declare-fun e!211434 () Bool)

(assert (=> b!344949 (=> (not res!190824) (not e!211434))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((array!18363 0))(
  ( (array!18364 (arr!8698 (Array (_ BitVec 32) (_ BitVec 64))) (size!9050 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18363)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!344949 (= res!190824 (and (= (size!9049 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9050 _keys!1895) (size!9049 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!344950 () Bool)

(assert (=> b!344950 (= e!211434 false)))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3352 0))(
  ( (MissingZero!3352 (index!15587 (_ BitVec 32))) (Found!3352 (index!15588 (_ BitVec 32))) (Intermediate!3352 (undefined!4164 Bool) (index!15589 (_ BitVec 32)) (x!34362 (_ BitVec 32))) (Undefined!3352) (MissingVacant!3352 (index!15590 (_ BitVec 32))) )
))
(declare-fun lt!162730 () SeekEntryResult!3352)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18363 (_ BitVec 32)) SeekEntryResult!3352)

(assert (=> b!344950 (= lt!162730 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun res!190827 () Bool)

(assert (=> start!34514 (=> (not res!190827) (not e!211434))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34514 (= res!190827 (validMask!0 mask!2385))))

(assert (=> start!34514 e!211434))

(assert (=> start!34514 true))

(assert (=> start!34514 tp_is_empty!7389))

(assert (=> start!34514 tp!25856))

(declare-fun array_inv!6438 (array!18361) Bool)

(assert (=> start!34514 (and (array_inv!6438 _values!1525) e!211433)))

(declare-fun array_inv!6439 (array!18363) Bool)

(assert (=> start!34514 (array_inv!6439 _keys!1895)))

(declare-fun b!344951 () Bool)

(declare-fun res!190825 () Bool)

(assert (=> b!344951 (=> (not res!190825) (not e!211434))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344951 (= res!190825 (validKeyInArray!0 k0!1348))))

(declare-fun b!344952 () Bool)

(assert (=> b!344952 (= e!211431 tp_is_empty!7389)))

(declare-fun b!344953 () Bool)

(declare-fun res!190826 () Bool)

(assert (=> b!344953 (=> (not res!190826) (not e!211434))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18363 (_ BitVec 32)) Bool)

(assert (=> b!344953 (= res!190826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12522 () Bool)

(assert (=> mapIsEmpty!12522 mapRes!12522))

(declare-fun b!344954 () Bool)

(declare-fun res!190829 () Bool)

(assert (=> b!344954 (=> (not res!190829) (not e!211434))))

(declare-datatypes ((List!5029 0))(
  ( (Nil!5026) (Cons!5025 (h!5881 (_ BitVec 64)) (t!10145 List!5029)) )
))
(declare-fun arrayNoDuplicates!0 (array!18363 (_ BitVec 32) List!5029) Bool)

(assert (=> b!344954 (= res!190829 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5026))))

(declare-fun b!344955 () Bool)

(declare-fun res!190828 () Bool)

(assert (=> b!344955 (=> (not res!190828) (not e!211434))))

(declare-fun zeroValue!1467 () V!10829)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10829)

(declare-datatypes ((tuple2!5406 0))(
  ( (tuple2!5407 (_1!2714 (_ BitVec 64)) (_2!2714 V!10829)) )
))
(declare-datatypes ((List!5030 0))(
  ( (Nil!5027) (Cons!5026 (h!5882 tuple2!5406) (t!10146 List!5030)) )
))
(declare-datatypes ((ListLongMap!4319 0))(
  ( (ListLongMap!4320 (toList!2175 List!5030)) )
))
(declare-fun contains!2233 (ListLongMap!4319 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1696 (array!18363 array!18361 (_ BitVec 32) (_ BitVec 32) V!10829 V!10829 (_ BitVec 32) Int) ListLongMap!4319)

(assert (=> b!344955 (= res!190828 (not (contains!2233 (getCurrentListMap!1696 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(assert (= (and start!34514 res!190827) b!344949))

(assert (= (and b!344949 res!190824) b!344953))

(assert (= (and b!344953 res!190826) b!344954))

(assert (= (and b!344954 res!190829) b!344951))

(assert (= (and b!344951 res!190825) b!344955))

(assert (= (and b!344955 res!190828) b!344950))

(assert (= (and b!344948 condMapEmpty!12522) mapIsEmpty!12522))

(assert (= (and b!344948 (not condMapEmpty!12522)) mapNonEmpty!12522))

(get-info :version)

(assert (= (and mapNonEmpty!12522 ((_ is ValueCellFull!3351) mapValue!12522)) b!344947))

(assert (= (and b!344948 ((_ is ValueCellFull!3351) mapDefault!12522)) b!344952))

(assert (= start!34514 b!344948))

(declare-fun m!346437 () Bool)

(assert (=> b!344955 m!346437))

(assert (=> b!344955 m!346437))

(declare-fun m!346439 () Bool)

(assert (=> b!344955 m!346439))

(declare-fun m!346441 () Bool)

(assert (=> b!344953 m!346441))

(declare-fun m!346443 () Bool)

(assert (=> b!344950 m!346443))

(declare-fun m!346445 () Bool)

(assert (=> mapNonEmpty!12522 m!346445))

(declare-fun m!346447 () Bool)

(assert (=> b!344951 m!346447))

(declare-fun m!346449 () Bool)

(assert (=> start!34514 m!346449))

(declare-fun m!346451 () Bool)

(assert (=> start!34514 m!346451))

(declare-fun m!346453 () Bool)

(assert (=> start!34514 m!346453))

(declare-fun m!346455 () Bool)

(assert (=> b!344954 m!346455))

(check-sat tp_is_empty!7389 (not b!344955) b_and!14645 (not b!344953) (not b!344950) (not b!344951) (not b!344954) (not b_next!7437) (not mapNonEmpty!12522) (not start!34514))
(check-sat b_and!14645 (not b_next!7437))
