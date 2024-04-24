; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34402 () Bool)

(assert start!34402)

(declare-fun b_free!7339 () Bool)

(declare-fun b_next!7339 () Bool)

(assert (=> start!34402 (= b_free!7339 (not b_next!7339))))

(declare-fun tp!25563 () Bool)

(declare-fun b_and!14561 () Bool)

(assert (=> start!34402 (= tp!25563 b_and!14561)))

(declare-fun b!343571 () Bool)

(declare-fun res!189941 () Bool)

(declare-fun e!210662 () Bool)

(assert (=> b!343571 (=> (not res!189941) (not e!210662))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10699 0))(
  ( (V!10700 (val!3690 Int)) )
))
(declare-fun zeroValue!1467 () V!10699)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3302 0))(
  ( (ValueCellFull!3302 (v!5867 V!10699)) (EmptyCell!3302) )
))
(declare-datatypes ((array!18172 0))(
  ( (array!18173 (arr!8602 (Array (_ BitVec 32) ValueCell!3302)) (size!8954 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18172)

(declare-datatypes ((array!18174 0))(
  ( (array!18175 (arr!8603 (Array (_ BitVec 32) (_ BitVec 64))) (size!8955 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18174)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10699)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((tuple2!5264 0))(
  ( (tuple2!5265 (_1!2643 (_ BitVec 64)) (_2!2643 V!10699)) )
))
(declare-datatypes ((List!4867 0))(
  ( (Nil!4864) (Cons!4863 (h!5719 tuple2!5264) (t!9975 List!4867)) )
))
(declare-datatypes ((ListLongMap!4179 0))(
  ( (ListLongMap!4180 (toList!2105 List!4867)) )
))
(declare-fun contains!2182 (ListLongMap!4179 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1634 (array!18174 array!18172 (_ BitVec 32) (_ BitVec 32) V!10699 V!10699 (_ BitVec 32) Int) ListLongMap!4179)

(assert (=> b!343571 (= res!189941 (not (contains!2182 (getCurrentListMap!1634 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!343572 () Bool)

(declare-fun res!189944 () Bool)

(assert (=> b!343572 (=> (not res!189944) (not e!210662))))

(declare-datatypes ((List!4868 0))(
  ( (Nil!4865) (Cons!4864 (h!5720 (_ BitVec 64)) (t!9976 List!4868)) )
))
(declare-fun arrayNoDuplicates!0 (array!18174 (_ BitVec 32) List!4868) Bool)

(assert (=> b!343572 (= res!189944 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4865))))

(declare-fun b!343573 () Bool)

(declare-fun res!189940 () Bool)

(assert (=> b!343573 (=> (not res!189940) (not e!210662))))

(assert (=> b!343573 (= res!189940 (and (= (size!8954 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8955 _keys!1895) (size!8954 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!343574 () Bool)

(declare-fun res!189942 () Bool)

(assert (=> b!343574 (=> (not res!189942) (not e!210662))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!343574 (= res!189942 (validKeyInArray!0 k0!1348))))

(declare-fun mapIsEmpty!12375 () Bool)

(declare-fun mapRes!12375 () Bool)

(assert (=> mapIsEmpty!12375 mapRes!12375))

(declare-fun b!343576 () Bool)

(declare-fun res!189939 () Bool)

(assert (=> b!343576 (=> (not res!189939) (not e!210662))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18174 (_ BitVec 32)) Bool)

(assert (=> b!343576 (= res!189939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!343577 () Bool)

(assert (=> b!343577 (= e!210662 false)))

(declare-datatypes ((SeekEntryResult!3270 0))(
  ( (MissingZero!3270 (index!15259 (_ BitVec 32))) (Found!3270 (index!15260 (_ BitVec 32))) (Intermediate!3270 (undefined!4082 Bool) (index!15261 (_ BitVec 32)) (x!34149 (_ BitVec 32))) (Undefined!3270) (MissingVacant!3270 (index!15262 (_ BitVec 32))) )
))
(declare-fun lt!162601 () SeekEntryResult!3270)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18174 (_ BitVec 32)) SeekEntryResult!3270)

(assert (=> b!343577 (= lt!162601 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!343578 () Bool)

(declare-fun e!210664 () Bool)

(declare-fun tp_is_empty!7291 () Bool)

(assert (=> b!343578 (= e!210664 tp_is_empty!7291)))

(declare-fun mapNonEmpty!12375 () Bool)

(declare-fun tp!25562 () Bool)

(declare-fun e!210663 () Bool)

(assert (=> mapNonEmpty!12375 (= mapRes!12375 (and tp!25562 e!210663))))

(declare-fun mapKey!12375 () (_ BitVec 32))

(declare-fun mapRest!12375 () (Array (_ BitVec 32) ValueCell!3302))

(declare-fun mapValue!12375 () ValueCell!3302)

(assert (=> mapNonEmpty!12375 (= (arr!8602 _values!1525) (store mapRest!12375 mapKey!12375 mapValue!12375))))

(declare-fun b!343579 () Bool)

(assert (=> b!343579 (= e!210663 tp_is_empty!7291)))

(declare-fun res!189943 () Bool)

(assert (=> start!34402 (=> (not res!189943) (not e!210662))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34402 (= res!189943 (validMask!0 mask!2385))))

(assert (=> start!34402 e!210662))

(assert (=> start!34402 true))

(assert (=> start!34402 tp_is_empty!7291))

(assert (=> start!34402 tp!25563))

(declare-fun e!210665 () Bool)

(declare-fun array_inv!6356 (array!18172) Bool)

(assert (=> start!34402 (and (array_inv!6356 _values!1525) e!210665)))

(declare-fun array_inv!6357 (array!18174) Bool)

(assert (=> start!34402 (array_inv!6357 _keys!1895)))

(declare-fun b!343575 () Bool)

(assert (=> b!343575 (= e!210665 (and e!210664 mapRes!12375))))

(declare-fun condMapEmpty!12375 () Bool)

(declare-fun mapDefault!12375 () ValueCell!3302)

(assert (=> b!343575 (= condMapEmpty!12375 (= (arr!8602 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3302)) mapDefault!12375)))))

(assert (= (and start!34402 res!189943) b!343573))

(assert (= (and b!343573 res!189940) b!343576))

(assert (= (and b!343576 res!189939) b!343572))

(assert (= (and b!343572 res!189944) b!343574))

(assert (= (and b!343574 res!189942) b!343571))

(assert (= (and b!343571 res!189941) b!343577))

(assert (= (and b!343575 condMapEmpty!12375) mapIsEmpty!12375))

(assert (= (and b!343575 (not condMapEmpty!12375)) mapNonEmpty!12375))

(get-info :version)

(assert (= (and mapNonEmpty!12375 ((_ is ValueCellFull!3302) mapValue!12375)) b!343579))

(assert (= (and b!343575 ((_ is ValueCellFull!3302) mapDefault!12375)) b!343578))

(assert (= start!34402 b!343575))

(declare-fun m!345681 () Bool)

(assert (=> b!343577 m!345681))

(declare-fun m!345683 () Bool)

(assert (=> b!343572 m!345683))

(declare-fun m!345685 () Bool)

(assert (=> b!343574 m!345685))

(declare-fun m!345687 () Bool)

(assert (=> b!343576 m!345687))

(declare-fun m!345689 () Bool)

(assert (=> b!343571 m!345689))

(assert (=> b!343571 m!345689))

(declare-fun m!345691 () Bool)

(assert (=> b!343571 m!345691))

(declare-fun m!345693 () Bool)

(assert (=> start!34402 m!345693))

(declare-fun m!345695 () Bool)

(assert (=> start!34402 m!345695))

(declare-fun m!345697 () Bool)

(assert (=> start!34402 m!345697))

(declare-fun m!345699 () Bool)

(assert (=> mapNonEmpty!12375 m!345699))

(check-sat (not b_next!7339) (not b!343571) (not b!343576) (not mapNonEmpty!12375) (not start!34402) (not b!343577) (not b!343574) tp_is_empty!7291 b_and!14561 (not b!343572))
(check-sat b_and!14561 (not b_next!7339))
