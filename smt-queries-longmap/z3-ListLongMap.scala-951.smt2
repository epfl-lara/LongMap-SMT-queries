; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20806 () Bool)

(assert start!20806)

(declare-fun b_free!5455 () Bool)

(declare-fun b_next!5455 () Bool)

(assert (=> start!20806 (= b_free!5455 (not b_next!5455))))

(declare-fun tp!19406 () Bool)

(declare-fun b_and!12215 () Bool)

(assert (=> start!20806 (= tp!19406 b_and!12215)))

(declare-fun b!208537 () Bool)

(declare-fun res!101456 () Bool)

(declare-fun e!135996 () Bool)

(assert (=> b!208537 (=> (not res!101456) (not e!135996))))

(declare-datatypes ((array!9831 0))(
  ( (array!9832 (arr!4666 (Array (_ BitVec 32) (_ BitVec 64))) (size!4991 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9831)

(declare-datatypes ((List!2923 0))(
  ( (Nil!2920) (Cons!2919 (h!3561 (_ BitVec 64)) (t!7846 List!2923)) )
))
(declare-fun arrayNoDuplicates!0 (array!9831 (_ BitVec 32) List!2923) Bool)

(assert (=> b!208537 (= res!101456 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2920))))

(declare-fun b!208538 () Bool)

(declare-fun res!101452 () Bool)

(assert (=> b!208538 (=> (not res!101452) (not e!135996))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!208538 (= res!101452 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4991 _keys!825))))))

(declare-fun b!208539 () Bool)

(declare-fun res!101454 () Bool)

(assert (=> b!208539 (=> (not res!101454) (not e!135996))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9831 (_ BitVec 32)) Bool)

(assert (=> b!208539 (= res!101454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!208540 () Bool)

(declare-fun e!135998 () Bool)

(declare-fun tp_is_empty!5317 () Bool)

(assert (=> b!208540 (= e!135998 tp_is_empty!5317)))

(declare-fun b!208541 () Bool)

(assert (=> b!208541 (= e!135996 false)))

(declare-datatypes ((V!6737 0))(
  ( (V!6738 (val!2703 Int)) )
))
(declare-datatypes ((ValueCell!2315 0))(
  ( (ValueCellFull!2315 (v!4674 V!6737)) (EmptyCell!2315) )
))
(declare-datatypes ((array!9833 0))(
  ( (array!9834 (arr!4667 (Array (_ BitVec 32) ValueCell!2315)) (size!4992 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9833)

(declare-fun v!520 () V!6737)

(declare-datatypes ((tuple2!4034 0))(
  ( (tuple2!4035 (_1!2028 (_ BitVec 64)) (_2!2028 V!6737)) )
))
(declare-datatypes ((List!2924 0))(
  ( (Nil!2921) (Cons!2920 (h!3562 tuple2!4034) (t!7847 List!2924)) )
))
(declare-datatypes ((ListLongMap!2949 0))(
  ( (ListLongMap!2950 (toList!1490 List!2924)) )
))
(declare-fun lt!106855 () ListLongMap!2949)

(declare-fun zeroValue!615 () V!6737)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6737)

(declare-fun getCurrentListMapNoExtraKeys!453 (array!9831 array!9833 (_ BitVec 32) (_ BitVec 32) V!6737 V!6737 (_ BitVec 32) Int) ListLongMap!2949)

(assert (=> b!208541 (= lt!106855 (getCurrentListMapNoExtraKeys!453 _keys!825 (array!9834 (store (arr!4667 _values!649) i!601 (ValueCellFull!2315 v!520)) (size!4992 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106856 () ListLongMap!2949)

(assert (=> b!208541 (= lt!106856 (getCurrentListMapNoExtraKeys!453 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun res!101453 () Bool)

(assert (=> start!20806 (=> (not res!101453) (not e!135996))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20806 (= res!101453 (validMask!0 mask!1149))))

(assert (=> start!20806 e!135996))

(declare-fun e!135995 () Bool)

(declare-fun array_inv!3061 (array!9833) Bool)

(assert (=> start!20806 (and (array_inv!3061 _values!649) e!135995)))

(assert (=> start!20806 true))

(assert (=> start!20806 tp_is_empty!5317))

(declare-fun array_inv!3062 (array!9831) Bool)

(assert (=> start!20806 (array_inv!3062 _keys!825)))

(assert (=> start!20806 tp!19406))

(declare-fun b!208542 () Bool)

(declare-fun res!101457 () Bool)

(assert (=> b!208542 (=> (not res!101457) (not e!135996))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!208542 (= res!101457 (validKeyInArray!0 k0!843))))

(declare-fun b!208543 () Bool)

(declare-fun res!101458 () Bool)

(assert (=> b!208543 (=> (not res!101458) (not e!135996))))

(assert (=> b!208543 (= res!101458 (and (= (size!4992 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4991 _keys!825) (size!4992 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!9044 () Bool)

(declare-fun mapRes!9044 () Bool)

(assert (=> mapIsEmpty!9044 mapRes!9044))

(declare-fun b!208544 () Bool)

(declare-fun e!135994 () Bool)

(assert (=> b!208544 (= e!135995 (and e!135994 mapRes!9044))))

(declare-fun condMapEmpty!9044 () Bool)

(declare-fun mapDefault!9044 () ValueCell!2315)

(assert (=> b!208544 (= condMapEmpty!9044 (= (arr!4667 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2315)) mapDefault!9044)))))

(declare-fun b!208545 () Bool)

(declare-fun res!101455 () Bool)

(assert (=> b!208545 (=> (not res!101455) (not e!135996))))

(assert (=> b!208545 (= res!101455 (= (select (arr!4666 _keys!825) i!601) k0!843))))

(declare-fun mapNonEmpty!9044 () Bool)

(declare-fun tp!19405 () Bool)

(assert (=> mapNonEmpty!9044 (= mapRes!9044 (and tp!19405 e!135998))))

(declare-fun mapKey!9044 () (_ BitVec 32))

(declare-fun mapRest!9044 () (Array (_ BitVec 32) ValueCell!2315))

(declare-fun mapValue!9044 () ValueCell!2315)

(assert (=> mapNonEmpty!9044 (= (arr!4667 _values!649) (store mapRest!9044 mapKey!9044 mapValue!9044))))

(declare-fun b!208546 () Bool)

(assert (=> b!208546 (= e!135994 tp_is_empty!5317)))

(assert (= (and start!20806 res!101453) b!208543))

(assert (= (and b!208543 res!101458) b!208539))

(assert (= (and b!208539 res!101454) b!208537))

(assert (= (and b!208537 res!101456) b!208538))

(assert (= (and b!208538 res!101452) b!208542))

(assert (= (and b!208542 res!101457) b!208545))

(assert (= (and b!208545 res!101455) b!208541))

(assert (= (and b!208544 condMapEmpty!9044) mapIsEmpty!9044))

(assert (= (and b!208544 (not condMapEmpty!9044)) mapNonEmpty!9044))

(get-info :version)

(assert (= (and mapNonEmpty!9044 ((_ is ValueCellFull!2315) mapValue!9044)) b!208540))

(assert (= (and b!208544 ((_ is ValueCellFull!2315) mapDefault!9044)) b!208546))

(assert (= start!20806 b!208544))

(declare-fun m!236289 () Bool)

(assert (=> b!208541 m!236289))

(declare-fun m!236291 () Bool)

(assert (=> b!208541 m!236291))

(declare-fun m!236293 () Bool)

(assert (=> b!208541 m!236293))

(declare-fun m!236295 () Bool)

(assert (=> b!208537 m!236295))

(declare-fun m!236297 () Bool)

(assert (=> b!208539 m!236297))

(declare-fun m!236299 () Bool)

(assert (=> b!208545 m!236299))

(declare-fun m!236301 () Bool)

(assert (=> start!20806 m!236301))

(declare-fun m!236303 () Bool)

(assert (=> start!20806 m!236303))

(declare-fun m!236305 () Bool)

(assert (=> start!20806 m!236305))

(declare-fun m!236307 () Bool)

(assert (=> b!208542 m!236307))

(declare-fun m!236309 () Bool)

(assert (=> mapNonEmpty!9044 m!236309))

(check-sat (not b!208542) (not mapNonEmpty!9044) b_and!12215 (not b!208539) (not start!20806) tp_is_empty!5317 (not b!208541) (not b_next!5455) (not b!208537))
(check-sat b_and!12215 (not b_next!5455))
