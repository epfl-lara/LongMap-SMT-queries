; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35094 () Bool)

(assert start!35094)

(declare-fun b_free!7753 () Bool)

(declare-fun b_next!7753 () Bool)

(assert (=> start!35094 (= b_free!7753 (not b_next!7753))))

(declare-fun tp!26843 () Bool)

(declare-fun b_and!15001 () Bool)

(assert (=> start!35094 (= tp!26843 b_and!15001)))

(declare-fun b!351915 () Bool)

(declare-fun res!195189 () Bool)

(declare-fun e!215501 () Bool)

(assert (=> b!351915 (=> (not res!195189) (not e!215501))))

(declare-datatypes ((array!18988 0))(
  ( (array!18989 (arr!8997 (Array (_ BitVec 32) (_ BitVec 64))) (size!9349 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18988)

(declare-datatypes ((List!5142 0))(
  ( (Nil!5139) (Cons!5138 (h!5994 (_ BitVec 64)) (t!10276 List!5142)) )
))
(declare-fun arrayNoDuplicates!0 (array!18988 (_ BitVec 32) List!5142) Bool)

(assert (=> b!351915 (= res!195189 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5139))))

(declare-fun b!351916 () Bool)

(declare-fun res!195194 () Bool)

(assert (=> b!351916 (=> (not res!195194) (not e!215501))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!351916 (= res!195194 (validKeyInArray!0 k0!1348))))

(declare-fun mapIsEmpty!13035 () Bool)

(declare-fun mapRes!13035 () Bool)

(assert (=> mapIsEmpty!13035 mapRes!13035))

(declare-fun b!351917 () Bool)

(declare-fun res!195193 () Bool)

(assert (=> b!351917 (=> (not res!195193) (not e!215501))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!11251 0))(
  ( (V!11252 (val!3897 Int)) )
))
(declare-fun zeroValue!1467 () V!11251)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3509 0))(
  ( (ValueCellFull!3509 (v!6087 V!11251)) (EmptyCell!3509) )
))
(declare-datatypes ((array!18990 0))(
  ( (array!18991 (arr!8998 (Array (_ BitVec 32) ValueCell!3509)) (size!9350 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18990)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11251)

(declare-datatypes ((tuple2!5540 0))(
  ( (tuple2!5541 (_1!2781 (_ BitVec 64)) (_2!2781 V!11251)) )
))
(declare-datatypes ((List!5143 0))(
  ( (Nil!5140) (Cons!5139 (h!5995 tuple2!5540) (t!10277 List!5143)) )
))
(declare-datatypes ((ListLongMap!4455 0))(
  ( (ListLongMap!4456 (toList!2243 List!5143)) )
))
(declare-fun contains!2333 (ListLongMap!4455 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1771 (array!18988 array!18990 (_ BitVec 32) (_ BitVec 32) V!11251 V!11251 (_ BitVec 32) Int) ListLongMap!4455)

(assert (=> b!351917 (= res!195193 (not (contains!2333 (getCurrentListMap!1771 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!351919 () Bool)

(declare-datatypes ((Unit!10853 0))(
  ( (Unit!10854) )
))
(declare-fun e!215498 () Unit!10853)

(declare-fun Unit!10855 () Unit!10853)

(assert (=> b!351919 (= e!215498 Unit!10855)))

(declare-fun b!351920 () Bool)

(declare-fun e!215500 () Bool)

(declare-fun tp_is_empty!7705 () Bool)

(assert (=> b!351920 (= e!215500 tp_is_empty!7705)))

(declare-fun b!351921 () Bool)

(declare-fun e!215502 () Bool)

(assert (=> b!351921 (= e!215502 tp_is_empty!7705)))

(declare-fun b!351922 () Bool)

(declare-fun e!215504 () Bool)

(assert (=> b!351922 (= e!215504 (and e!215502 mapRes!13035))))

(declare-fun condMapEmpty!13035 () Bool)

(declare-fun mapDefault!13035 () ValueCell!3509)

(assert (=> b!351922 (= condMapEmpty!13035 (= (arr!8998 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3509)) mapDefault!13035)))))

(declare-fun mapNonEmpty!13035 () Bool)

(declare-fun tp!26844 () Bool)

(assert (=> mapNonEmpty!13035 (= mapRes!13035 (and tp!26844 e!215500))))

(declare-fun mapRest!13035 () (Array (_ BitVec 32) ValueCell!3509))

(declare-fun mapValue!13035 () ValueCell!3509)

(declare-fun mapKey!13035 () (_ BitVec 32))

(assert (=> mapNonEmpty!13035 (= (arr!8998 _values!1525) (store mapRest!13035 mapKey!13035 mapValue!13035))))

(declare-fun b!351923 () Bool)

(declare-fun e!215499 () Bool)

(assert (=> b!351923 (= e!215501 e!215499)))

(declare-fun res!195190 () Bool)

(assert (=> b!351923 (=> (not res!195190) (not e!215499))))

(declare-datatypes ((SeekEntryResult!3416 0))(
  ( (MissingZero!3416 (index!15843 (_ BitVec 32))) (Found!3416 (index!15844 (_ BitVec 32))) (Intermediate!3416 (undefined!4228 Bool) (index!15845 (_ BitVec 32)) (x!34977 (_ BitVec 32))) (Undefined!3416) (MissingVacant!3416 (index!15846 (_ BitVec 32))) )
))
(declare-fun lt!165041 () SeekEntryResult!3416)

(get-info :version)

(assert (=> b!351923 (= res!195190 (and (not ((_ is Found!3416) lt!165041)) (not ((_ is MissingZero!3416) lt!165041)) ((_ is MissingVacant!3416) lt!165041)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18988 (_ BitVec 32)) SeekEntryResult!3416)

(assert (=> b!351923 (= lt!165041 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!351924 () Bool)

(declare-fun Unit!10856 () Unit!10853)

(assert (=> b!351924 (= e!215498 Unit!10856)))

(declare-fun lt!165043 () Unit!10853)

(declare-fun lemmaArrayContainsKeyThenInListMap!339 (array!18988 array!18990 (_ BitVec 32) (_ BitVec 32) V!11251 V!11251 (_ BitVec 64) (_ BitVec 32) Int) Unit!10853)

(declare-fun arrayScanForKey!0 (array!18988 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!351924 (= lt!165043 (lemmaArrayContainsKeyThenInListMap!339 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!351924 false))

(declare-fun b!351918 () Bool)

(declare-fun res!195192 () Bool)

(assert (=> b!351918 (=> (not res!195192) (not e!215501))))

(assert (=> b!351918 (= res!195192 (and (= (size!9350 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9349 _keys!1895) (size!9350 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!195191 () Bool)

(assert (=> start!35094 (=> (not res!195191) (not e!215501))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35094 (= res!195191 (validMask!0 mask!2385))))

(assert (=> start!35094 e!215501))

(assert (=> start!35094 true))

(assert (=> start!35094 tp_is_empty!7705))

(assert (=> start!35094 tp!26843))

(declare-fun array_inv!6646 (array!18990) Bool)

(assert (=> start!35094 (and (array_inv!6646 _values!1525) e!215504)))

(declare-fun array_inv!6647 (array!18988) Bool)

(assert (=> start!35094 (array_inv!6647 _keys!1895)))

(declare-fun b!351925 () Bool)

(assert (=> b!351925 (= e!215499 false)))

(declare-fun lt!165042 () Unit!10853)

(assert (=> b!351925 (= lt!165042 e!215498)))

(declare-fun c!53483 () Bool)

(declare-fun arrayContainsKey!0 (array!18988 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!351925 (= c!53483 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!351926 () Bool)

(declare-fun res!195188 () Bool)

(assert (=> b!351926 (=> (not res!195188) (not e!215501))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18988 (_ BitVec 32)) Bool)

(assert (=> b!351926 (= res!195188 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!35094 res!195191) b!351918))

(assert (= (and b!351918 res!195192) b!351926))

(assert (= (and b!351926 res!195188) b!351915))

(assert (= (and b!351915 res!195189) b!351916))

(assert (= (and b!351916 res!195194) b!351917))

(assert (= (and b!351917 res!195193) b!351923))

(assert (= (and b!351923 res!195190) b!351925))

(assert (= (and b!351925 c!53483) b!351924))

(assert (= (and b!351925 (not c!53483)) b!351919))

(assert (= (and b!351922 condMapEmpty!13035) mapIsEmpty!13035))

(assert (= (and b!351922 (not condMapEmpty!13035)) mapNonEmpty!13035))

(assert (= (and mapNonEmpty!13035 ((_ is ValueCellFull!3509) mapValue!13035)) b!351920))

(assert (= (and b!351922 ((_ is ValueCellFull!3509) mapDefault!13035)) b!351921))

(assert (= start!35094 b!351922))

(declare-fun m!351975 () Bool)

(assert (=> start!35094 m!351975))

(declare-fun m!351977 () Bool)

(assert (=> start!35094 m!351977))

(declare-fun m!351979 () Bool)

(assert (=> start!35094 m!351979))

(declare-fun m!351981 () Bool)

(assert (=> b!351926 m!351981))

(declare-fun m!351983 () Bool)

(assert (=> b!351917 m!351983))

(assert (=> b!351917 m!351983))

(declare-fun m!351985 () Bool)

(assert (=> b!351917 m!351985))

(declare-fun m!351987 () Bool)

(assert (=> b!351915 m!351987))

(declare-fun m!351989 () Bool)

(assert (=> b!351924 m!351989))

(assert (=> b!351924 m!351989))

(declare-fun m!351991 () Bool)

(assert (=> b!351924 m!351991))

(declare-fun m!351993 () Bool)

(assert (=> b!351923 m!351993))

(declare-fun m!351995 () Bool)

(assert (=> b!351916 m!351995))

(declare-fun m!351997 () Bool)

(assert (=> mapNonEmpty!13035 m!351997))

(declare-fun m!351999 () Bool)

(assert (=> b!351925 m!351999))

(check-sat (not mapNonEmpty!13035) (not b!351915) (not start!35094) (not b_next!7753) (not b!351926) (not b!351925) b_and!15001 (not b!351923) (not b!351916) (not b!351917) (not b!351924) tp_is_empty!7705)
(check-sat b_and!15001 (not b_next!7753))
