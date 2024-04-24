; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34698 () Bool)

(assert start!34698)

(declare-fun b_free!7519 () Bool)

(declare-fun b_next!7519 () Bool)

(assert (=> start!34698 (= b_free!7519 (not b_next!7519))))

(declare-fun tp!26121 () Bool)

(declare-fun b_and!14753 () Bool)

(assert (=> start!34698 (= tp!26121 b_and!14753)))

(declare-fun b!346926 () Bool)

(declare-fun res!191997 () Bool)

(declare-fun e!212598 () Bool)

(assert (=> b!346926 (=> (not res!191997) (not e!212598))))

(declare-datatypes ((array!18528 0))(
  ( (array!18529 (arr!8774 (Array (_ BitVec 32) (_ BitVec 64))) (size!9126 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18528)

(declare-datatypes ((List!4992 0))(
  ( (Nil!4989) (Cons!4988 (h!5844 (_ BitVec 64)) (t!10112 List!4992)) )
))
(declare-fun arrayNoDuplicates!0 (array!18528 (_ BitVec 32) List!4992) Bool)

(assert (=> b!346926 (= res!191997 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4989))))

(declare-fun b!346927 () Bool)

(declare-fun res!191994 () Bool)

(assert (=> b!346927 (=> (not res!191994) (not e!212598))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10939 0))(
  ( (V!10940 (val!3780 Int)) )
))
(declare-datatypes ((ValueCell!3392 0))(
  ( (ValueCellFull!3392 (v!5963 V!10939)) (EmptyCell!3392) )
))
(declare-datatypes ((array!18530 0))(
  ( (array!18531 (arr!8775 (Array (_ BitVec 32) ValueCell!3392)) (size!9127 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18530)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!346927 (= res!191994 (and (= (size!9127 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9126 _keys!1895) (size!9127 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!346928 () Bool)

(declare-fun res!191992 () Bool)

(assert (=> b!346928 (=> (not res!191992) (not e!212598))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!346928 (= res!191992 (validKeyInArray!0 k0!1348))))

(declare-fun mapIsEmpty!12663 () Bool)

(declare-fun mapRes!12663 () Bool)

(assert (=> mapIsEmpty!12663 mapRes!12663))

(declare-fun res!191998 () Bool)

(assert (=> start!34698 (=> (not res!191998) (not e!212598))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34698 (= res!191998 (validMask!0 mask!2385))))

(assert (=> start!34698 e!212598))

(assert (=> start!34698 true))

(declare-fun tp_is_empty!7471 () Bool)

(assert (=> start!34698 tp_is_empty!7471))

(assert (=> start!34698 tp!26121))

(declare-fun e!212600 () Bool)

(declare-fun array_inv!6486 (array!18530) Bool)

(assert (=> start!34698 (and (array_inv!6486 _values!1525) e!212600)))

(declare-fun array_inv!6487 (array!18528) Bool)

(assert (=> start!34698 (array_inv!6487 _keys!1895)))

(declare-fun b!346929 () Bool)

(declare-fun res!191999 () Bool)

(assert (=> b!346929 (=> (not res!191999) (not e!212598))))

(declare-fun zeroValue!1467 () V!10939)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10939)

(declare-datatypes ((tuple2!5386 0))(
  ( (tuple2!5387 (_1!2704 (_ BitVec 64)) (_2!2704 V!10939)) )
))
(declare-datatypes ((List!4993 0))(
  ( (Nil!4990) (Cons!4989 (h!5845 tuple2!5386) (t!10113 List!4993)) )
))
(declare-datatypes ((ListLongMap!4301 0))(
  ( (ListLongMap!4302 (toList!2166 List!4993)) )
))
(declare-fun contains!2249 (ListLongMap!4301 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1695 (array!18528 array!18530 (_ BitVec 32) (_ BitVec 32) V!10939 V!10939 (_ BitVec 32) Int) ListLongMap!4301)

(assert (=> b!346929 (= res!191999 (not (contains!2249 (getCurrentListMap!1695 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapNonEmpty!12663 () Bool)

(declare-fun tp!26120 () Bool)

(declare-fun e!212599 () Bool)

(assert (=> mapNonEmpty!12663 (= mapRes!12663 (and tp!26120 e!212599))))

(declare-fun mapRest!12663 () (Array (_ BitVec 32) ValueCell!3392))

(declare-fun mapKey!12663 () (_ BitVec 32))

(declare-fun mapValue!12663 () ValueCell!3392)

(assert (=> mapNonEmpty!12663 (= (arr!8775 _values!1525) (store mapRest!12663 mapKey!12663 mapValue!12663))))

(declare-fun b!346930 () Bool)

(declare-fun res!191995 () Bool)

(declare-fun e!212596 () Bool)

(assert (=> b!346930 (=> (not res!191995) (not e!212596))))

(declare-datatypes ((SeekEntryResult!3339 0))(
  ( (MissingZero!3339 (index!15535 (_ BitVec 32))) (Found!3339 (index!15536 (_ BitVec 32))) (Intermediate!3339 (undefined!4151 Bool) (index!15537 (_ BitVec 32)) (x!34518 (_ BitVec 32))) (Undefined!3339) (MissingVacant!3339 (index!15538 (_ BitVec 32))) )
))
(declare-fun lt!163485 () SeekEntryResult!3339)

(declare-fun arrayContainsKey!0 (array!18528 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!346930 (= res!191995 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15536 lt!163485)))))

(declare-fun b!346931 () Bool)

(assert (=> b!346931 (= e!212599 tp_is_empty!7471)))

(declare-fun b!346932 () Bool)

(declare-fun res!191996 () Bool)

(assert (=> b!346932 (=> (not res!191996) (not e!212598))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18528 (_ BitVec 32)) Bool)

(assert (=> b!346932 (= res!191996 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!346933 () Bool)

(declare-fun e!212595 () Bool)

(assert (=> b!346933 (= e!212600 (and e!212595 mapRes!12663))))

(declare-fun condMapEmpty!12663 () Bool)

(declare-fun mapDefault!12663 () ValueCell!3392)

(assert (=> b!346933 (= condMapEmpty!12663 (= (arr!8775 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3392)) mapDefault!12663)))))

(declare-fun b!346934 () Bool)

(assert (=> b!346934 (= e!212595 tp_is_empty!7471)))

(declare-fun b!346935 () Bool)

(assert (=> b!346935 (= e!212596 (not true))))

(assert (=> b!346935 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10739 0))(
  ( (Unit!10740) )
))
(declare-fun lt!163486 () Unit!10739)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18528 (_ BitVec 64) (_ BitVec 32)) Unit!10739)

(assert (=> b!346935 (= lt!163486 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15536 lt!163485)))))

(declare-fun b!346936 () Bool)

(assert (=> b!346936 (= e!212598 e!212596)))

(declare-fun res!191993 () Bool)

(assert (=> b!346936 (=> (not res!191993) (not e!212596))))

(get-info :version)

(assert (=> b!346936 (= res!191993 (and ((_ is Found!3339) lt!163485) (= (select (arr!8774 _keys!1895) (index!15536 lt!163485)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18528 (_ BitVec 32)) SeekEntryResult!3339)

(assert (=> b!346936 (= lt!163485 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(assert (= (and start!34698 res!191998) b!346927))

(assert (= (and b!346927 res!191994) b!346932))

(assert (= (and b!346932 res!191996) b!346926))

(assert (= (and b!346926 res!191997) b!346928))

(assert (= (and b!346928 res!191992) b!346929))

(assert (= (and b!346929 res!191999) b!346936))

(assert (= (and b!346936 res!191993) b!346930))

(assert (= (and b!346930 res!191995) b!346935))

(assert (= (and b!346933 condMapEmpty!12663) mapIsEmpty!12663))

(assert (= (and b!346933 (not condMapEmpty!12663)) mapNonEmpty!12663))

(assert (= (and mapNonEmpty!12663 ((_ is ValueCellFull!3392) mapValue!12663)) b!346931))

(assert (= (and b!346933 ((_ is ValueCellFull!3392) mapDefault!12663)) b!346934))

(assert (= start!34698 b!346933))

(declare-fun m!348203 () Bool)

(assert (=> b!346928 m!348203))

(declare-fun m!348205 () Bool)

(assert (=> b!346930 m!348205))

(declare-fun m!348207 () Bool)

(assert (=> b!346932 m!348207))

(declare-fun m!348209 () Bool)

(assert (=> start!34698 m!348209))

(declare-fun m!348211 () Bool)

(assert (=> start!34698 m!348211))

(declare-fun m!348213 () Bool)

(assert (=> start!34698 m!348213))

(declare-fun m!348215 () Bool)

(assert (=> mapNonEmpty!12663 m!348215))

(declare-fun m!348217 () Bool)

(assert (=> b!346936 m!348217))

(declare-fun m!348219 () Bool)

(assert (=> b!346936 m!348219))

(declare-fun m!348221 () Bool)

(assert (=> b!346926 m!348221))

(declare-fun m!348223 () Bool)

(assert (=> b!346935 m!348223))

(declare-fun m!348225 () Bool)

(assert (=> b!346935 m!348225))

(declare-fun m!348227 () Bool)

(assert (=> b!346929 m!348227))

(assert (=> b!346929 m!348227))

(declare-fun m!348229 () Bool)

(assert (=> b!346929 m!348229))

(check-sat (not mapNonEmpty!12663) (not b_next!7519) (not b!346928) (not b!346936) (not b!346929) (not start!34698) b_and!14753 tp_is_empty!7471 (not b!346932) (not b!346926) (not b!346935) (not b!346930))
(check-sat b_and!14753 (not b_next!7519))
