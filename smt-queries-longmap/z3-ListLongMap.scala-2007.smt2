; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35008 () Bool)

(assert start!35008)

(declare-fun b_free!7711 () Bool)

(declare-fun b_next!7711 () Bool)

(assert (=> start!35008 (= b_free!7711 (not b_next!7711))))

(declare-fun tp!26711 () Bool)

(declare-fun b_and!14955 () Bool)

(assert (=> start!35008 (= tp!26711 b_and!14955)))

(declare-fun b!350922 () Bool)

(declare-fun res!194582 () Bool)

(declare-fun e!214921 () Bool)

(assert (=> b!350922 (=> (not res!194582) (not e!214921))))

(declare-datatypes ((array!18902 0))(
  ( (array!18903 (arr!8956 (Array (_ BitVec 32) (_ BitVec 64))) (size!9308 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18902)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18902 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!350922 (= res!194582 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!350923 () Bool)

(assert (=> b!350923 (= e!214921 false)))

(declare-fun lt!164697 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18902 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!350923 (= lt!164697 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!350924 () Bool)

(declare-fun res!194583 () Bool)

(declare-fun e!214919 () Bool)

(assert (=> b!350924 (=> (not res!194583) (not e!214919))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!350924 (= res!194583 (validKeyInArray!0 k0!1348))))

(declare-fun mapIsEmpty!12966 () Bool)

(declare-fun mapRes!12966 () Bool)

(assert (=> mapIsEmpty!12966 mapRes!12966))

(declare-fun b!350925 () Bool)

(declare-fun e!214920 () Bool)

(declare-fun e!214918 () Bool)

(assert (=> b!350925 (= e!214920 (and e!214918 mapRes!12966))))

(declare-fun condMapEmpty!12966 () Bool)

(declare-datatypes ((V!11195 0))(
  ( (V!11196 (val!3876 Int)) )
))
(declare-datatypes ((ValueCell!3488 0))(
  ( (ValueCellFull!3488 (v!6064 V!11195)) (EmptyCell!3488) )
))
(declare-datatypes ((array!18904 0))(
  ( (array!18905 (arr!8957 (Array (_ BitVec 32) ValueCell!3488)) (size!9309 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18904)

(declare-fun mapDefault!12966 () ValueCell!3488)

(assert (=> b!350925 (= condMapEmpty!12966 (= (arr!8957 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3488)) mapDefault!12966)))))

(declare-fun res!194589 () Bool)

(assert (=> start!35008 (=> (not res!194589) (not e!214919))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35008 (= res!194589 (validMask!0 mask!2385))))

(assert (=> start!35008 e!214919))

(assert (=> start!35008 true))

(declare-fun tp_is_empty!7663 () Bool)

(assert (=> start!35008 tp_is_empty!7663))

(assert (=> start!35008 tp!26711))

(declare-fun array_inv!6614 (array!18904) Bool)

(assert (=> start!35008 (and (array_inv!6614 _values!1525) e!214920)))

(declare-fun array_inv!6615 (array!18902) Bool)

(assert (=> start!35008 (array_inv!6615 _keys!1895)))

(declare-fun mapNonEmpty!12966 () Bool)

(declare-fun tp!26712 () Bool)

(declare-fun e!214923 () Bool)

(assert (=> mapNonEmpty!12966 (= mapRes!12966 (and tp!26712 e!214923))))

(declare-fun mapRest!12966 () (Array (_ BitVec 32) ValueCell!3488))

(declare-fun mapKey!12966 () (_ BitVec 32))

(declare-fun mapValue!12966 () ValueCell!3488)

(assert (=> mapNonEmpty!12966 (= (arr!8957 _values!1525) (store mapRest!12966 mapKey!12966 mapValue!12966))))

(declare-fun b!350926 () Bool)

(declare-fun res!194585 () Bool)

(assert (=> b!350926 (=> (not res!194585) (not e!214919))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18902 (_ BitVec 32)) Bool)

(assert (=> b!350926 (= res!194585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!350927 () Bool)

(declare-fun res!194588 () Bool)

(assert (=> b!350927 (=> (not res!194588) (not e!214919))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!350927 (= res!194588 (and (= (size!9309 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9308 _keys!1895) (size!9309 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!350928 () Bool)

(declare-fun res!194586 () Bool)

(assert (=> b!350928 (=> (not res!194586) (not e!214919))))

(declare-datatypes ((List!5116 0))(
  ( (Nil!5113) (Cons!5112 (h!5968 (_ BitVec 64)) (t!10246 List!5116)) )
))
(declare-fun arrayNoDuplicates!0 (array!18902 (_ BitVec 32) List!5116) Bool)

(assert (=> b!350928 (= res!194586 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5113))))

(declare-fun b!350929 () Bool)

(declare-fun res!194584 () Bool)

(assert (=> b!350929 (=> (not res!194584) (not e!214919))))

(declare-fun zeroValue!1467 () V!11195)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11195)

(declare-datatypes ((tuple2!5510 0))(
  ( (tuple2!5511 (_1!2766 (_ BitVec 64)) (_2!2766 V!11195)) )
))
(declare-datatypes ((List!5117 0))(
  ( (Nil!5114) (Cons!5113 (h!5969 tuple2!5510) (t!10247 List!5117)) )
))
(declare-datatypes ((ListLongMap!4425 0))(
  ( (ListLongMap!4426 (toList!2228 List!5117)) )
))
(declare-fun contains!2316 (ListLongMap!4425 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1756 (array!18902 array!18904 (_ BitVec 32) (_ BitVec 32) V!11195 V!11195 (_ BitVec 32) Int) ListLongMap!4425)

(assert (=> b!350929 (= res!194584 (not (contains!2316 (getCurrentListMap!1756 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!350930 () Bool)

(assert (=> b!350930 (= e!214918 tp_is_empty!7663)))

(declare-fun b!350931 () Bool)

(assert (=> b!350931 (= e!214923 tp_is_empty!7663)))

(declare-fun b!350932 () Bool)

(assert (=> b!350932 (= e!214919 e!214921)))

(declare-fun res!194587 () Bool)

(assert (=> b!350932 (=> (not res!194587) (not e!214921))))

(declare-datatypes ((SeekEntryResult!3404 0))(
  ( (MissingZero!3404 (index!15795 (_ BitVec 32))) (Found!3404 (index!15796 (_ BitVec 32))) (Intermediate!3404 (undefined!4216 Bool) (index!15797 (_ BitVec 32)) (x!34889 (_ BitVec 32))) (Undefined!3404) (MissingVacant!3404 (index!15798 (_ BitVec 32))) )
))
(declare-fun lt!164698 () SeekEntryResult!3404)

(get-info :version)

(assert (=> b!350932 (= res!194587 (and (not ((_ is Found!3404) lt!164698)) (not ((_ is MissingZero!3404) lt!164698)) ((_ is MissingVacant!3404) lt!164698)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18902 (_ BitVec 32)) SeekEntryResult!3404)

(assert (=> b!350932 (= lt!164698 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(assert (= (and start!35008 res!194589) b!350927))

(assert (= (and b!350927 res!194588) b!350926))

(assert (= (and b!350926 res!194585) b!350928))

(assert (= (and b!350928 res!194586) b!350924))

(assert (= (and b!350924 res!194583) b!350929))

(assert (= (and b!350929 res!194584) b!350932))

(assert (= (and b!350932 res!194587) b!350922))

(assert (= (and b!350922 res!194582) b!350923))

(assert (= (and b!350925 condMapEmpty!12966) mapIsEmpty!12966))

(assert (= (and b!350925 (not condMapEmpty!12966)) mapNonEmpty!12966))

(assert (= (and mapNonEmpty!12966 ((_ is ValueCellFull!3488) mapValue!12966)) b!350931))

(assert (= (and b!350925 ((_ is ValueCellFull!3488) mapDefault!12966)) b!350930))

(assert (= start!35008 b!350925))

(declare-fun m!351249 () Bool)

(assert (=> start!35008 m!351249))

(declare-fun m!351251 () Bool)

(assert (=> start!35008 m!351251))

(declare-fun m!351253 () Bool)

(assert (=> start!35008 m!351253))

(declare-fun m!351255 () Bool)

(assert (=> mapNonEmpty!12966 m!351255))

(declare-fun m!351257 () Bool)

(assert (=> b!350922 m!351257))

(declare-fun m!351259 () Bool)

(assert (=> b!350926 m!351259))

(declare-fun m!351261 () Bool)

(assert (=> b!350924 m!351261))

(declare-fun m!351263 () Bool)

(assert (=> b!350928 m!351263))

(declare-fun m!351265 () Bool)

(assert (=> b!350923 m!351265))

(declare-fun m!351267 () Bool)

(assert (=> b!350932 m!351267))

(declare-fun m!351269 () Bool)

(assert (=> b!350929 m!351269))

(assert (=> b!350929 m!351269))

(declare-fun m!351271 () Bool)

(assert (=> b!350929 m!351271))

(check-sat (not b!350929) b_and!14955 (not b!350924) (not start!35008) (not b!350928) (not b_next!7711) tp_is_empty!7663 (not b!350932) (not b!350922) (not b!350923) (not mapNonEmpty!12966) (not b!350926))
(check-sat b_and!14955 (not b_next!7711))
