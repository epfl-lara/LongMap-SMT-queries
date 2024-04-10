; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34708 () Bool)

(assert start!34708)

(declare-fun b_free!7515 () Bool)

(declare-fun b_next!7515 () Bool)

(assert (=> start!34708 (= b_free!7515 (not b_next!7515))))

(declare-fun tp!26109 () Bool)

(declare-fun b_and!14735 () Bool)

(assert (=> start!34708 (= tp!26109 b_and!14735)))

(declare-fun b!346914 () Bool)

(declare-fun res!191948 () Bool)

(declare-fun e!212596 () Bool)

(assert (=> b!346914 (=> (not res!191948) (not e!212596))))

(declare-datatypes ((SeekEntryResult!3386 0))(
  ( (MissingZero!3386 (index!15723 (_ BitVec 32))) (Found!3386 (index!15724 (_ BitVec 32))) (Intermediate!3386 (undefined!4198 Bool) (index!15725 (_ BitVec 32)) (x!34560 (_ BitVec 32))) (Undefined!3386) (MissingVacant!3386 (index!15726 (_ BitVec 32))) )
))
(declare-fun lt!163455 () SeekEntryResult!3386)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!18527 0))(
  ( (array!18528 (arr!8774 (Array (_ BitVec 32) (_ BitVec 64))) (size!9126 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18527)

(declare-fun arrayContainsKey!0 (array!18527 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!346914 (= res!191948 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15724 lt!163455)))))

(declare-fun b!346915 () Bool)

(assert (=> b!346915 (= e!212596 (not true))))

(assert (=> b!346915 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10771 0))(
  ( (Unit!10772) )
))
(declare-fun lt!163456 () Unit!10771)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18527 (_ BitVec 64) (_ BitVec 32)) Unit!10771)

(assert (=> b!346915 (= lt!163456 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15724 lt!163455)))))

(declare-fun b!346916 () Bool)

(declare-fun e!212594 () Bool)

(assert (=> b!346916 (= e!212594 e!212596)))

(declare-fun res!191951 () Bool)

(assert (=> b!346916 (=> (not res!191951) (not e!212596))))

(get-info :version)

(assert (=> b!346916 (= res!191951 (and ((_ is Found!3386) lt!163455) (= (select (arr!8774 _keys!1895) (index!15724 lt!163455)) k0!1348)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18527 (_ BitVec 32)) SeekEntryResult!3386)

(assert (=> b!346916 (= lt!163455 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!346917 () Bool)

(declare-fun res!191950 () Bool)

(assert (=> b!346917 (=> (not res!191950) (not e!212594))))

(declare-datatypes ((V!10933 0))(
  ( (V!10934 (val!3778 Int)) )
))
(declare-datatypes ((ValueCell!3390 0))(
  ( (ValueCellFull!3390 (v!5960 V!10933)) (EmptyCell!3390) )
))
(declare-datatypes ((array!18529 0))(
  ( (array!18530 (arr!8775 (Array (_ BitVec 32) ValueCell!3390)) (size!9127 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18529)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!346917 (= res!191950 (and (= (size!9127 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9126 _keys!1895) (size!9127 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!346918 () Bool)

(declare-fun e!212593 () Bool)

(declare-fun e!212595 () Bool)

(declare-fun mapRes!12657 () Bool)

(assert (=> b!346918 (= e!212593 (and e!212595 mapRes!12657))))

(declare-fun condMapEmpty!12657 () Bool)

(declare-fun mapDefault!12657 () ValueCell!3390)

(assert (=> b!346918 (= condMapEmpty!12657 (= (arr!8775 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3390)) mapDefault!12657)))))

(declare-fun b!346919 () Bool)

(declare-fun res!191947 () Bool)

(assert (=> b!346919 (=> (not res!191947) (not e!212594))))

(declare-datatypes ((List!5092 0))(
  ( (Nil!5089) (Cons!5088 (h!5944 (_ BitVec 64)) (t!10220 List!5092)) )
))
(declare-fun arrayNoDuplicates!0 (array!18527 (_ BitVec 32) List!5092) Bool)

(assert (=> b!346919 (= res!191947 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5089))))

(declare-fun mapNonEmpty!12657 () Bool)

(declare-fun tp!26108 () Bool)

(declare-fun e!212597 () Bool)

(assert (=> mapNonEmpty!12657 (= mapRes!12657 (and tp!26108 e!212597))))

(declare-fun mapValue!12657 () ValueCell!3390)

(declare-fun mapRest!12657 () (Array (_ BitVec 32) ValueCell!3390))

(declare-fun mapKey!12657 () (_ BitVec 32))

(assert (=> mapNonEmpty!12657 (= (arr!8775 _values!1525) (store mapRest!12657 mapKey!12657 mapValue!12657))))

(declare-fun b!346920 () Bool)

(declare-fun tp_is_empty!7467 () Bool)

(assert (=> b!346920 (= e!212595 tp_is_empty!7467)))

(declare-fun res!191952 () Bool)

(assert (=> start!34708 (=> (not res!191952) (not e!212594))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34708 (= res!191952 (validMask!0 mask!2385))))

(assert (=> start!34708 e!212594))

(assert (=> start!34708 true))

(assert (=> start!34708 tp_is_empty!7467))

(assert (=> start!34708 tp!26109))

(declare-fun array_inv!6500 (array!18529) Bool)

(assert (=> start!34708 (and (array_inv!6500 _values!1525) e!212593)))

(declare-fun array_inv!6501 (array!18527) Bool)

(assert (=> start!34708 (array_inv!6501 _keys!1895)))

(declare-fun b!346913 () Bool)

(assert (=> b!346913 (= e!212597 tp_is_empty!7467)))

(declare-fun b!346921 () Bool)

(declare-fun res!191949 () Bool)

(assert (=> b!346921 (=> (not res!191949) (not e!212594))))

(declare-fun zeroValue!1467 () V!10933)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10933)

(declare-datatypes ((tuple2!5470 0))(
  ( (tuple2!5471 (_1!2746 (_ BitVec 64)) (_2!2746 V!10933)) )
))
(declare-datatypes ((List!5093 0))(
  ( (Nil!5090) (Cons!5089 (h!5945 tuple2!5470) (t!10221 List!5093)) )
))
(declare-datatypes ((ListLongMap!4383 0))(
  ( (ListLongMap!4384 (toList!2207 List!5093)) )
))
(declare-fun contains!2271 (ListLongMap!4383 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1728 (array!18527 array!18529 (_ BitVec 32) (_ BitVec 32) V!10933 V!10933 (_ BitVec 32) Int) ListLongMap!4383)

(assert (=> b!346921 (= res!191949 (not (contains!2271 (getCurrentListMap!1728 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!346922 () Bool)

(declare-fun res!191954 () Bool)

(assert (=> b!346922 (=> (not res!191954) (not e!212594))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18527 (_ BitVec 32)) Bool)

(assert (=> b!346922 (= res!191954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12657 () Bool)

(assert (=> mapIsEmpty!12657 mapRes!12657))

(declare-fun b!346923 () Bool)

(declare-fun res!191953 () Bool)

(assert (=> b!346923 (=> (not res!191953) (not e!212594))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!346923 (= res!191953 (validKeyInArray!0 k0!1348))))

(assert (= (and start!34708 res!191952) b!346917))

(assert (= (and b!346917 res!191950) b!346922))

(assert (= (and b!346922 res!191954) b!346919))

(assert (= (and b!346919 res!191947) b!346923))

(assert (= (and b!346923 res!191953) b!346921))

(assert (= (and b!346921 res!191949) b!346916))

(assert (= (and b!346916 res!191951) b!346914))

(assert (= (and b!346914 res!191948) b!346915))

(assert (= (and b!346918 condMapEmpty!12657) mapIsEmpty!12657))

(assert (= (and b!346918 (not condMapEmpty!12657)) mapNonEmpty!12657))

(assert (= (and mapNonEmpty!12657 ((_ is ValueCellFull!3390) mapValue!12657)) b!346913))

(assert (= (and b!346918 ((_ is ValueCellFull!3390) mapDefault!12657)) b!346920))

(assert (= start!34708 b!346918))

(declare-fun m!347923 () Bool)

(assert (=> b!346921 m!347923))

(assert (=> b!346921 m!347923))

(declare-fun m!347925 () Bool)

(assert (=> b!346921 m!347925))

(declare-fun m!347927 () Bool)

(assert (=> b!346915 m!347927))

(declare-fun m!347929 () Bool)

(assert (=> b!346915 m!347929))

(declare-fun m!347931 () Bool)

(assert (=> start!34708 m!347931))

(declare-fun m!347933 () Bool)

(assert (=> start!34708 m!347933))

(declare-fun m!347935 () Bool)

(assert (=> start!34708 m!347935))

(declare-fun m!347937 () Bool)

(assert (=> b!346919 m!347937))

(declare-fun m!347939 () Bool)

(assert (=> b!346914 m!347939))

(declare-fun m!347941 () Bool)

(assert (=> b!346916 m!347941))

(declare-fun m!347943 () Bool)

(assert (=> b!346916 m!347943))

(declare-fun m!347945 () Bool)

(assert (=> b!346922 m!347945))

(declare-fun m!347947 () Bool)

(assert (=> mapNonEmpty!12657 m!347947))

(declare-fun m!347949 () Bool)

(assert (=> b!346923 m!347949))

(check-sat (not b!346916) (not b!346921) (not start!34708) (not mapNonEmpty!12657) b_and!14735 (not b_next!7515) (not b!346922) tp_is_empty!7467 (not b!346915) (not b!346914) (not b!346923) (not b!346919))
(check-sat b_and!14735 (not b_next!7515))
