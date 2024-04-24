; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33700 () Bool)

(assert start!33700)

(declare-fun b_free!6949 () Bool)

(declare-fun b_next!6949 () Bool)

(assert (=> start!33700 (= b_free!6949 (not b_next!6949))))

(declare-fun tp!24350 () Bool)

(declare-fun b_and!14143 () Bool)

(assert (=> start!33700 (= tp!24350 b_and!14143)))

(declare-fun res!184904 () Bool)

(declare-fun e!205699 () Bool)

(assert (=> start!33700 (=> (not res!184904) (not e!205699))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33700 (= res!184904 (validMask!0 mask!2385))))

(assert (=> start!33700 e!205699))

(assert (=> start!33700 true))

(declare-fun tp_is_empty!6901 () Bool)

(assert (=> start!33700 tp_is_empty!6901))

(assert (=> start!33700 tp!24350))

(declare-datatypes ((V!10179 0))(
  ( (V!10180 (val!3495 Int)) )
))
(declare-datatypes ((ValueCell!3107 0))(
  ( (ValueCellFull!3107 (v!5658 V!10179)) (EmptyCell!3107) )
))
(declare-datatypes ((array!17386 0))(
  ( (array!17387 (arr!8223 (Array (_ BitVec 32) ValueCell!3107)) (size!8575 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17386)

(declare-fun e!205698 () Bool)

(declare-fun array_inv!6120 (array!17386) Bool)

(assert (=> start!33700 (and (array_inv!6120 _values!1525) e!205698)))

(declare-datatypes ((array!17388 0))(
  ( (array!17389 (arr!8224 (Array (_ BitVec 32) (_ BitVec 64))) (size!8576 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17388)

(declare-fun array_inv!6121 (array!17388) Bool)

(assert (=> start!33700 (array_inv!6121 _keys!1895)))

(declare-fun b!335110 () Bool)

(declare-fun res!184899 () Bool)

(assert (=> b!335110 (=> (not res!184899) (not e!205699))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17388 (_ BitVec 32)) Bool)

(assert (=> b!335110 (= res!184899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!335111 () Bool)

(declare-fun e!205695 () Bool)

(declare-fun e!205697 () Bool)

(assert (=> b!335111 (= e!205695 e!205697)))

(declare-fun res!184901 () Bool)

(assert (=> b!335111 (=> (not res!184901) (not e!205697))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3144 0))(
  ( (MissingZero!3144 (index!14755 (_ BitVec 32))) (Found!3144 (index!14756 (_ BitVec 32))) (Intermediate!3144 (undefined!3956 Bool) (index!14757 (_ BitVec 32)) (x!33363 (_ BitVec 32))) (Undefined!3144) (MissingVacant!3144 (index!14758 (_ BitVec 32))) )
))
(declare-fun lt!159749 () SeekEntryResult!3144)

(get-info :version)

(assert (=> b!335111 (= res!184901 (and ((_ is Found!3144) lt!159749) (= (select (arr!8224 _keys!1895) (index!14756 lt!159749)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17388 (_ BitVec 32)) SeekEntryResult!3144)

(assert (=> b!335111 (= lt!159749 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!11748 () Bool)

(declare-fun mapRes!11748 () Bool)

(assert (=> mapIsEmpty!11748 mapRes!11748))

(declare-fun b!335112 () Bool)

(declare-fun e!205700 () Bool)

(assert (=> b!335112 (= e!205700 tp_is_empty!6901)))

(declare-fun b!335113 () Bool)

(assert (=> b!335113 (= e!205699 e!205695)))

(declare-fun res!184903 () Bool)

(assert (=> b!335113 (=> (not res!184903) (not e!205695))))

(declare-datatypes ((tuple2!4996 0))(
  ( (tuple2!4997 (_1!2509 (_ BitVec 64)) (_2!2509 V!10179)) )
))
(declare-datatypes ((List!4614 0))(
  ( (Nil!4611) (Cons!4610 (h!5466 tuple2!4996) (t!9694 List!4614)) )
))
(declare-datatypes ((ListLongMap!3911 0))(
  ( (ListLongMap!3912 (toList!1971 List!4614)) )
))
(declare-fun lt!159751 () ListLongMap!3911)

(declare-fun contains!2034 (ListLongMap!3911 (_ BitVec 64)) Bool)

(assert (=> b!335113 (= res!184903 (not (contains!2034 lt!159751 k0!1348)))))

(declare-fun zeroValue!1467 () V!10179)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10179)

(declare-fun getCurrentListMap!1502 (array!17388 array!17386 (_ BitVec 32) (_ BitVec 32) V!10179 V!10179 (_ BitVec 32) Int) ListLongMap!3911)

(assert (=> b!335113 (= lt!159751 (getCurrentListMap!1502 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!335114 () Bool)

(declare-fun res!184898 () Bool)

(assert (=> b!335114 (=> (not res!184898) (not e!205699))))

(assert (=> b!335114 (= res!184898 (and (= (size!8575 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8576 _keys!1895) (size!8575 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!335115 () Bool)

(declare-fun res!184900 () Bool)

(assert (=> b!335115 (=> (not res!184900) (not e!205697))))

(declare-fun arrayContainsKey!0 (array!17388 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!335115 (= res!184900 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14756 lt!159749)))))

(declare-fun mapNonEmpty!11748 () Bool)

(declare-fun tp!24351 () Bool)

(assert (=> mapNonEmpty!11748 (= mapRes!11748 (and tp!24351 e!205700))))

(declare-fun mapValue!11748 () ValueCell!3107)

(declare-fun mapRest!11748 () (Array (_ BitVec 32) ValueCell!3107))

(declare-fun mapKey!11748 () (_ BitVec 32))

(assert (=> mapNonEmpty!11748 (= (arr!8223 _values!1525) (store mapRest!11748 mapKey!11748 mapValue!11748))))

(declare-fun b!335116 () Bool)

(assert (=> b!335116 (= e!205697 (not true))))

(assert (=> b!335116 (contains!2034 lt!159751 (select (arr!8224 _keys!1895) (index!14756 lt!159749)))))

(declare-datatypes ((Unit!10407 0))(
  ( (Unit!10408) )
))
(declare-fun lt!159750 () Unit!10407)

(declare-fun lemmaValidKeyInArrayIsInListMap!161 (array!17388 array!17386 (_ BitVec 32) (_ BitVec 32) V!10179 V!10179 (_ BitVec 32) Int) Unit!10407)

(assert (=> b!335116 (= lt!159750 (lemmaValidKeyInArrayIsInListMap!161 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!14756 lt!159749) defaultEntry!1528))))

(assert (=> b!335116 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!159748 () Unit!10407)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17388 (_ BitVec 64) (_ BitVec 32)) Unit!10407)

(assert (=> b!335116 (= lt!159748 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14756 lt!159749)))))

(declare-fun b!335117 () Bool)

(declare-fun e!205694 () Bool)

(assert (=> b!335117 (= e!205694 tp_is_empty!6901)))

(declare-fun b!335118 () Bool)

(declare-fun res!184897 () Bool)

(assert (=> b!335118 (=> (not res!184897) (not e!205699))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!335118 (= res!184897 (validKeyInArray!0 k0!1348))))

(declare-fun b!335119 () Bool)

(assert (=> b!335119 (= e!205698 (and e!205694 mapRes!11748))))

(declare-fun condMapEmpty!11748 () Bool)

(declare-fun mapDefault!11748 () ValueCell!3107)

(assert (=> b!335119 (= condMapEmpty!11748 (= (arr!8223 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3107)) mapDefault!11748)))))

(declare-fun b!335120 () Bool)

(declare-fun res!184902 () Bool)

(assert (=> b!335120 (=> (not res!184902) (not e!205699))))

(declare-datatypes ((List!4615 0))(
  ( (Nil!4612) (Cons!4611 (h!5467 (_ BitVec 64)) (t!9695 List!4615)) )
))
(declare-fun arrayNoDuplicates!0 (array!17388 (_ BitVec 32) List!4615) Bool)

(assert (=> b!335120 (= res!184902 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4612))))

(assert (= (and start!33700 res!184904) b!335114))

(assert (= (and b!335114 res!184898) b!335110))

(assert (= (and b!335110 res!184899) b!335120))

(assert (= (and b!335120 res!184902) b!335118))

(assert (= (and b!335118 res!184897) b!335113))

(assert (= (and b!335113 res!184903) b!335111))

(assert (= (and b!335111 res!184901) b!335115))

(assert (= (and b!335115 res!184900) b!335116))

(assert (= (and b!335119 condMapEmpty!11748) mapIsEmpty!11748))

(assert (= (and b!335119 (not condMapEmpty!11748)) mapNonEmpty!11748))

(assert (= (and mapNonEmpty!11748 ((_ is ValueCellFull!3107) mapValue!11748)) b!335112))

(assert (= (and b!335119 ((_ is ValueCellFull!3107) mapDefault!11748)) b!335117))

(assert (= start!33700 b!335119))

(declare-fun m!339389 () Bool)

(assert (=> b!335111 m!339389))

(declare-fun m!339391 () Bool)

(assert (=> b!335111 m!339391))

(declare-fun m!339393 () Bool)

(assert (=> b!335120 m!339393))

(declare-fun m!339395 () Bool)

(assert (=> b!335115 m!339395))

(declare-fun m!339397 () Bool)

(assert (=> mapNonEmpty!11748 m!339397))

(declare-fun m!339399 () Bool)

(assert (=> start!33700 m!339399))

(declare-fun m!339401 () Bool)

(assert (=> start!33700 m!339401))

(declare-fun m!339403 () Bool)

(assert (=> start!33700 m!339403))

(declare-fun m!339405 () Bool)

(assert (=> b!335113 m!339405))

(declare-fun m!339407 () Bool)

(assert (=> b!335113 m!339407))

(declare-fun m!339409 () Bool)

(assert (=> b!335116 m!339409))

(assert (=> b!335116 m!339389))

(declare-fun m!339411 () Bool)

(assert (=> b!335116 m!339411))

(declare-fun m!339413 () Bool)

(assert (=> b!335116 m!339413))

(assert (=> b!335116 m!339389))

(declare-fun m!339415 () Bool)

(assert (=> b!335116 m!339415))

(declare-fun m!339417 () Bool)

(assert (=> b!335110 m!339417))

(declare-fun m!339419 () Bool)

(assert (=> b!335118 m!339419))

(check-sat (not b!335116) (not b!335110) b_and!14143 (not b!335115) (not b!335118) (not start!33700) (not b!335113) (not b!335120) (not mapNonEmpty!11748) tp_is_empty!6901 (not b!335111) (not b_next!6949))
(check-sat b_and!14143 (not b_next!6949))
