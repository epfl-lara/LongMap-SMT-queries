; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34984 () Bool)

(assert start!34984)

(declare-fun b_free!7687 () Bool)

(declare-fun b_next!7687 () Bool)

(assert (=> start!34984 (= b_free!7687 (not b_next!7687))))

(declare-fun tp!26639 () Bool)

(declare-fun b_and!14891 () Bool)

(assert (=> start!34984 (= tp!26639 b_and!14891)))

(declare-fun b!350304 () Bool)

(declare-fun e!214563 () Bool)

(declare-fun e!214561 () Bool)

(declare-fun mapRes!12930 () Bool)

(assert (=> b!350304 (= e!214563 (and e!214561 mapRes!12930))))

(declare-fun condMapEmpty!12930 () Bool)

(declare-datatypes ((V!11163 0))(
  ( (V!11164 (val!3864 Int)) )
))
(declare-datatypes ((ValueCell!3476 0))(
  ( (ValueCellFull!3476 (v!6045 V!11163)) (EmptyCell!3476) )
))
(declare-datatypes ((array!18845 0))(
  ( (array!18846 (arr!8928 (Array (_ BitVec 32) ValueCell!3476)) (size!9281 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18845)

(declare-fun mapDefault!12930 () ValueCell!3476)

(assert (=> b!350304 (= condMapEmpty!12930 (= (arr!8928 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3476)) mapDefault!12930)))))

(declare-fun b!350305 () Bool)

(declare-fun res!194171 () Bool)

(declare-fun e!214560 () Bool)

(assert (=> b!350305 (=> (not res!194171) (not e!214560))))

(declare-datatypes ((array!18847 0))(
  ( (array!18848 (arr!8929 (Array (_ BitVec 32) (_ BitVec 64))) (size!9282 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18847)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18847 (_ BitVec 32)) Bool)

(assert (=> b!350305 (= res!194171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12930 () Bool)

(assert (=> mapIsEmpty!12930 mapRes!12930))

(declare-fun b!350306 () Bool)

(declare-fun res!194170 () Bool)

(assert (=> b!350306 (=> (not res!194170) (not e!214560))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!350306 (= res!194170 (validKeyInArray!0 k0!1348))))

(declare-fun b!350307 () Bool)

(declare-fun e!214562 () Bool)

(assert (=> b!350307 (= e!214562 false)))

(declare-fun lt!164372 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18847 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!350307 (= lt!164372 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun res!194169 () Bool)

(assert (=> start!34984 (=> (not res!194169) (not e!214560))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34984 (= res!194169 (validMask!0 mask!2385))))

(assert (=> start!34984 e!214560))

(assert (=> start!34984 true))

(declare-fun tp_is_empty!7639 () Bool)

(assert (=> start!34984 tp_is_empty!7639))

(assert (=> start!34984 tp!26639))

(declare-fun array_inv!6618 (array!18845) Bool)

(assert (=> start!34984 (and (array_inv!6618 _values!1525) e!214563)))

(declare-fun array_inv!6619 (array!18847) Bool)

(assert (=> start!34984 (array_inv!6619 _keys!1895)))

(declare-fun b!350308 () Bool)

(declare-fun res!194174 () Bool)

(assert (=> b!350308 (=> (not res!194174) (not e!214560))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!350308 (= res!194174 (and (= (size!9281 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9282 _keys!1895) (size!9281 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!350309 () Bool)

(assert (=> b!350309 (= e!214561 tp_is_empty!7639)))

(declare-fun b!350310 () Bool)

(declare-fun res!194173 () Bool)

(assert (=> b!350310 (=> (not res!194173) (not e!214562))))

(declare-fun arrayContainsKey!0 (array!18847 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!350310 (= res!194173 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!350311 () Bool)

(assert (=> b!350311 (= e!214560 e!214562)))

(declare-fun res!194168 () Bool)

(assert (=> b!350311 (=> (not res!194168) (not e!214562))))

(declare-datatypes ((SeekEntryResult!3440 0))(
  ( (MissingZero!3440 (index!15939 (_ BitVec 32))) (Found!3440 (index!15940 (_ BitVec 32))) (Intermediate!3440 (undefined!4252 Bool) (index!15941 (_ BitVec 32)) (x!34891 (_ BitVec 32))) (Undefined!3440) (MissingVacant!3440 (index!15942 (_ BitVec 32))) )
))
(declare-fun lt!164373 () SeekEntryResult!3440)

(get-info :version)

(assert (=> b!350311 (= res!194168 (and (not ((_ is Found!3440) lt!164373)) (not ((_ is MissingZero!3440) lt!164373)) ((_ is MissingVacant!3440) lt!164373)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18847 (_ BitVec 32)) SeekEntryResult!3440)

(assert (=> b!350311 (= lt!164373 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!350312 () Bool)

(declare-fun res!194175 () Bool)

(assert (=> b!350312 (=> (not res!194175) (not e!214560))))

(declare-fun zeroValue!1467 () V!11163)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11163)

(declare-datatypes ((tuple2!5548 0))(
  ( (tuple2!5549 (_1!2785 (_ BitVec 64)) (_2!2785 V!11163)) )
))
(declare-datatypes ((List!5161 0))(
  ( (Nil!5158) (Cons!5157 (h!6013 tuple2!5548) (t!10290 List!5161)) )
))
(declare-datatypes ((ListLongMap!4451 0))(
  ( (ListLongMap!4452 (toList!2241 List!5161)) )
))
(declare-fun contains!2321 (ListLongMap!4451 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1746 (array!18847 array!18845 (_ BitVec 32) (_ BitVec 32) V!11163 V!11163 (_ BitVec 32) Int) ListLongMap!4451)

(assert (=> b!350312 (= res!194175 (not (contains!2321 (getCurrentListMap!1746 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!350313 () Bool)

(declare-fun e!214564 () Bool)

(assert (=> b!350313 (= e!214564 tp_is_empty!7639)))

(declare-fun b!350314 () Bool)

(declare-fun res!194172 () Bool)

(assert (=> b!350314 (=> (not res!194172) (not e!214560))))

(declare-datatypes ((List!5162 0))(
  ( (Nil!5159) (Cons!5158 (h!6014 (_ BitVec 64)) (t!10291 List!5162)) )
))
(declare-fun arrayNoDuplicates!0 (array!18847 (_ BitVec 32) List!5162) Bool)

(assert (=> b!350314 (= res!194172 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5159))))

(declare-fun mapNonEmpty!12930 () Bool)

(declare-fun tp!26640 () Bool)

(assert (=> mapNonEmpty!12930 (= mapRes!12930 (and tp!26640 e!214564))))

(declare-fun mapValue!12930 () ValueCell!3476)

(declare-fun mapKey!12930 () (_ BitVec 32))

(declare-fun mapRest!12930 () (Array (_ BitVec 32) ValueCell!3476))

(assert (=> mapNonEmpty!12930 (= (arr!8928 _values!1525) (store mapRest!12930 mapKey!12930 mapValue!12930))))

(assert (= (and start!34984 res!194169) b!350308))

(assert (= (and b!350308 res!194174) b!350305))

(assert (= (and b!350305 res!194171) b!350314))

(assert (= (and b!350314 res!194172) b!350306))

(assert (= (and b!350306 res!194170) b!350312))

(assert (= (and b!350312 res!194175) b!350311))

(assert (= (and b!350311 res!194168) b!350310))

(assert (= (and b!350310 res!194173) b!350307))

(assert (= (and b!350304 condMapEmpty!12930) mapIsEmpty!12930))

(assert (= (and b!350304 (not condMapEmpty!12930)) mapNonEmpty!12930))

(assert (= (and mapNonEmpty!12930 ((_ is ValueCellFull!3476) mapValue!12930)) b!350313))

(assert (= (and b!350304 ((_ is ValueCellFull!3476) mapDefault!12930)) b!350309))

(assert (= start!34984 b!350304))

(declare-fun m!350007 () Bool)

(assert (=> b!350310 m!350007))

(declare-fun m!350009 () Bool)

(assert (=> mapNonEmpty!12930 m!350009))

(declare-fun m!350011 () Bool)

(assert (=> b!350314 m!350011))

(declare-fun m!350013 () Bool)

(assert (=> b!350311 m!350013))

(declare-fun m!350015 () Bool)

(assert (=> b!350305 m!350015))

(declare-fun m!350017 () Bool)

(assert (=> start!34984 m!350017))

(declare-fun m!350019 () Bool)

(assert (=> start!34984 m!350019))

(declare-fun m!350021 () Bool)

(assert (=> start!34984 m!350021))

(declare-fun m!350023 () Bool)

(assert (=> b!350312 m!350023))

(assert (=> b!350312 m!350023))

(declare-fun m!350025 () Bool)

(assert (=> b!350312 m!350025))

(declare-fun m!350027 () Bool)

(assert (=> b!350307 m!350027))

(declare-fun m!350029 () Bool)

(assert (=> b!350306 m!350029))

(check-sat (not b!350314) (not b!350306) (not b!350310) tp_is_empty!7639 (not b!350305) b_and!14891 (not b_next!7687) (not mapNonEmpty!12930) (not b!350312) (not b!350311) (not b!350307) (not start!34984))
(check-sat b_and!14891 (not b_next!7687))
