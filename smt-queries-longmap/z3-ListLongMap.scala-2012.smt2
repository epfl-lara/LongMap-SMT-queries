; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35082 () Bool)

(assert start!35082)

(declare-fun b_free!7741 () Bool)

(declare-fun b_next!7741 () Bool)

(assert (=> start!35082 (= b_free!7741 (not b_next!7741))))

(declare-fun tp!26808 () Bool)

(declare-fun b_and!14949 () Bool)

(assert (=> start!35082 (= tp!26808 b_and!14949)))

(declare-fun b!351484 () Bool)

(declare-fun res!194931 () Bool)

(declare-fun e!215239 () Bool)

(assert (=> b!351484 (=> (not res!194931) (not e!215239))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!351484 (= res!194931 (validKeyInArray!0 k0!1348))))

(declare-fun b!351485 () Bool)

(declare-fun e!215241 () Bool)

(declare-fun tp_is_empty!7693 () Bool)

(assert (=> b!351485 (= e!215241 tp_is_empty!7693)))

(declare-fun b!351486 () Bool)

(declare-fun res!194936 () Bool)

(assert (=> b!351486 (=> (not res!194936) (not e!215239))))

(declare-datatypes ((array!18957 0))(
  ( (array!18958 (arr!8982 (Array (_ BitVec 32) (_ BitVec 64))) (size!9335 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18957)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18957 (_ BitVec 32)) Bool)

(assert (=> b!351486 (= res!194936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!351487 () Bool)

(declare-fun e!215240 () Bool)

(assert (=> b!351487 (= e!215240 tp_is_empty!7693)))

(declare-fun b!351488 () Bool)

(declare-fun res!194933 () Bool)

(assert (=> b!351488 (=> (not res!194933) (not e!215239))))

(declare-datatypes ((V!11235 0))(
  ( (V!11236 (val!3891 Int)) )
))
(declare-fun zeroValue!1467 () V!11235)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3503 0))(
  ( (ValueCellFull!3503 (v!6074 V!11235)) (EmptyCell!3503) )
))
(declare-datatypes ((array!18959 0))(
  ( (array!18960 (arr!8983 (Array (_ BitVec 32) ValueCell!3503)) (size!9336 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18959)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11235)

(declare-datatypes ((tuple2!5590 0))(
  ( (tuple2!5591 (_1!2806 (_ BitVec 64)) (_2!2806 V!11235)) )
))
(declare-datatypes ((List!5204 0))(
  ( (Nil!5201) (Cons!5200 (h!6056 tuple2!5590) (t!10337 List!5204)) )
))
(declare-datatypes ((ListLongMap!4493 0))(
  ( (ListLongMap!4494 (toList!2262 List!5204)) )
))
(declare-fun contains!2344 (ListLongMap!4493 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1767 (array!18957 array!18959 (_ BitVec 32) (_ BitVec 32) V!11235 V!11235 (_ BitVec 32) Int) ListLongMap!4493)

(assert (=> b!351488 (= res!194933 (not (contains!2344 (getCurrentListMap!1767 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!351489 () Bool)

(declare-fun e!215238 () Bool)

(declare-fun mapRes!13017 () Bool)

(assert (=> b!351489 (= e!215238 (and e!215240 mapRes!13017))))

(declare-fun condMapEmpty!13017 () Bool)

(declare-fun mapDefault!13017 () ValueCell!3503)

(assert (=> b!351489 (= condMapEmpty!13017 (= (arr!8983 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3503)) mapDefault!13017)))))

(declare-fun b!351490 () Bool)

(declare-fun e!215237 () Bool)

(assert (=> b!351490 (= e!215237 (not true))))

(assert (=> b!351490 false))

(declare-datatypes ((Unit!10855 0))(
  ( (Unit!10856) )
))
(declare-fun lt!164732 () Unit!10855)

(declare-fun lemmaArrayContainsKeyThenInListMap!329 (array!18957 array!18959 (_ BitVec 32) (_ BitVec 32) V!11235 V!11235 (_ BitVec 64) (_ BitVec 32) Int) Unit!10855)

(declare-fun arrayScanForKey!0 (array!18957 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!351490 (= lt!164732 (lemmaArrayContainsKeyThenInListMap!329 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(declare-fun b!351491 () Bool)

(declare-fun res!194934 () Bool)

(assert (=> b!351491 (=> (not res!194934) (not e!215239))))

(declare-datatypes ((List!5205 0))(
  ( (Nil!5202) (Cons!5201 (h!6057 (_ BitVec 64)) (t!10338 List!5205)) )
))
(declare-fun arrayNoDuplicates!0 (array!18957 (_ BitVec 32) List!5205) Bool)

(assert (=> b!351491 (= res!194934 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5202))))

(declare-fun mapNonEmpty!13017 () Bool)

(declare-fun tp!26807 () Bool)

(assert (=> mapNonEmpty!13017 (= mapRes!13017 (and tp!26807 e!215241))))

(declare-fun mapRest!13017 () (Array (_ BitVec 32) ValueCell!3503))

(declare-fun mapKey!13017 () (_ BitVec 32))

(declare-fun mapValue!13017 () ValueCell!3503)

(assert (=> mapNonEmpty!13017 (= (arr!8983 _values!1525) (store mapRest!13017 mapKey!13017 mapValue!13017))))

(declare-fun res!194930 () Bool)

(assert (=> start!35082 (=> (not res!194930) (not e!215239))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35082 (= res!194930 (validMask!0 mask!2385))))

(assert (=> start!35082 e!215239))

(assert (=> start!35082 true))

(assert (=> start!35082 tp_is_empty!7693))

(assert (=> start!35082 tp!26808))

(declare-fun array_inv!6656 (array!18959) Bool)

(assert (=> start!35082 (and (array_inv!6656 _values!1525) e!215238)))

(declare-fun array_inv!6657 (array!18957) Bool)

(assert (=> start!35082 (array_inv!6657 _keys!1895)))

(declare-fun b!351492 () Bool)

(assert (=> b!351492 (= e!215239 e!215237)))

(declare-fun res!194932 () Bool)

(assert (=> b!351492 (=> (not res!194932) (not e!215237))))

(declare-datatypes ((SeekEntryResult!3459 0))(
  ( (MissingZero!3459 (index!16015 (_ BitVec 32))) (Found!3459 (index!16016 (_ BitVec 32))) (Intermediate!3459 (undefined!4271 Bool) (index!16017 (_ BitVec 32)) (x!35002 (_ BitVec 32))) (Undefined!3459) (MissingVacant!3459 (index!16018 (_ BitVec 32))) )
))
(declare-fun lt!164733 () SeekEntryResult!3459)

(get-info :version)

(assert (=> b!351492 (= res!194932 (and (not ((_ is Found!3459) lt!164733)) (not ((_ is MissingZero!3459) lt!164733)) ((_ is MissingVacant!3459) lt!164733)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18957 (_ BitVec 32)) SeekEntryResult!3459)

(assert (=> b!351492 (= lt!164733 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!13017 () Bool)

(assert (=> mapIsEmpty!13017 mapRes!13017))

(declare-fun b!351493 () Bool)

(declare-fun res!194929 () Bool)

(assert (=> b!351493 (=> (not res!194929) (not e!215239))))

(assert (=> b!351493 (= res!194929 (and (= (size!9336 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9335 _keys!1895) (size!9336 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!351494 () Bool)

(declare-fun res!194935 () Bool)

(assert (=> b!351494 (=> (not res!194935) (not e!215237))))

(declare-fun arrayContainsKey!0 (array!18957 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!351494 (= res!194935 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(assert (= (and start!35082 res!194930) b!351493))

(assert (= (and b!351493 res!194929) b!351486))

(assert (= (and b!351486 res!194936) b!351491))

(assert (= (and b!351491 res!194934) b!351484))

(assert (= (and b!351484 res!194931) b!351488))

(assert (= (and b!351488 res!194933) b!351492))

(assert (= (and b!351492 res!194932) b!351494))

(assert (= (and b!351494 res!194935) b!351490))

(assert (= (and b!351489 condMapEmpty!13017) mapIsEmpty!13017))

(assert (= (and b!351489 (not condMapEmpty!13017)) mapNonEmpty!13017))

(assert (= (and mapNonEmpty!13017 ((_ is ValueCellFull!3503) mapValue!13017)) b!351485))

(assert (= (and b!351489 ((_ is ValueCellFull!3503) mapDefault!13017)) b!351487))

(assert (= start!35082 b!351489))

(declare-fun m!350865 () Bool)

(assert (=> b!351488 m!350865))

(assert (=> b!351488 m!350865))

(declare-fun m!350867 () Bool)

(assert (=> b!351488 m!350867))

(declare-fun m!350869 () Bool)

(assert (=> b!351494 m!350869))

(declare-fun m!350871 () Bool)

(assert (=> b!351486 m!350871))

(declare-fun m!350873 () Bool)

(assert (=> mapNonEmpty!13017 m!350873))

(declare-fun m!350875 () Bool)

(assert (=> b!351490 m!350875))

(assert (=> b!351490 m!350875))

(declare-fun m!350877 () Bool)

(assert (=> b!351490 m!350877))

(declare-fun m!350879 () Bool)

(assert (=> b!351484 m!350879))

(declare-fun m!350881 () Bool)

(assert (=> start!35082 m!350881))

(declare-fun m!350883 () Bool)

(assert (=> start!35082 m!350883))

(declare-fun m!350885 () Bool)

(assert (=> start!35082 m!350885))

(declare-fun m!350887 () Bool)

(assert (=> b!351491 m!350887))

(declare-fun m!350889 () Bool)

(assert (=> b!351492 m!350889))

(check-sat (not b!351492) (not b!351494) b_and!14949 (not b!351484) (not mapNonEmpty!13017) (not b_next!7741) tp_is_empty!7693 (not b!351488) (not b!351486) (not start!35082) (not b!351490) (not b!351491))
(check-sat b_and!14949 (not b_next!7741))
