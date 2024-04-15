; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110530 () Bool)

(assert start!110530)

(declare-fun b_free!29365 () Bool)

(declare-fun b_next!29365 () Bool)

(assert (=> start!110530 (= b_free!29365 (not b_next!29365))))

(declare-fun tp!103417 () Bool)

(declare-fun b_and!47555 () Bool)

(assert (=> start!110530 (= tp!103417 b_and!47555)))

(declare-fun mapIsEmpty!54271 () Bool)

(declare-fun mapRes!54271 () Bool)

(assert (=> mapIsEmpty!54271 mapRes!54271))

(declare-fun b!1307449 () Bool)

(declare-fun res!867895 () Bool)

(declare-fun e!746065 () Bool)

(assert (=> b!1307449 (=> (not res!867895) (not e!746065))))

(declare-datatypes ((array!87107 0))(
  ( (array!87108 (arr!42034 (Array (_ BitVec 32) (_ BitVec 64))) (size!42586 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87107)

(declare-datatypes ((List!29891 0))(
  ( (Nil!29888) (Cons!29887 (h!31096 (_ BitVec 64)) (t!43489 List!29891)) )
))
(declare-fun arrayNoDuplicates!0 (array!87107 (_ BitVec 32) List!29891) Bool)

(assert (=> b!1307449 (= res!867895 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29888))))

(declare-fun mapNonEmpty!54271 () Bool)

(declare-fun tp!103418 () Bool)

(declare-fun e!746066 () Bool)

(assert (=> mapNonEmpty!54271 (= mapRes!54271 (and tp!103418 e!746066))))

(declare-datatypes ((V!51897 0))(
  ( (V!51898 (val!17622 Int)) )
))
(declare-datatypes ((ValueCell!16649 0))(
  ( (ValueCellFull!16649 (v!20248 V!51897)) (EmptyCell!16649) )
))
(declare-fun mapValue!54271 () ValueCell!16649)

(declare-fun mapRest!54271 () (Array (_ BitVec 32) ValueCell!16649))

(declare-fun mapKey!54271 () (_ BitVec 32))

(declare-datatypes ((array!87109 0))(
  ( (array!87110 (arr!42035 (Array (_ BitVec 32) ValueCell!16649)) (size!42587 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87109)

(assert (=> mapNonEmpty!54271 (= (arr!42035 _values!1354) (store mapRest!54271 mapKey!54271 mapValue!54271))))

(declare-fun b!1307451 () Bool)

(declare-fun e!746067 () Bool)

(declare-fun e!746068 () Bool)

(assert (=> b!1307451 (= e!746067 (and e!746068 mapRes!54271))))

(declare-fun condMapEmpty!54271 () Bool)

(declare-fun mapDefault!54271 () ValueCell!16649)

(assert (=> b!1307451 (= condMapEmpty!54271 (= (arr!42035 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16649)) mapDefault!54271)))))

(declare-fun b!1307452 () Bool)

(declare-fun res!867894 () Bool)

(assert (=> b!1307452 (=> (not res!867894) (not e!746065))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1307452 (= res!867894 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42586 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1307453 () Bool)

(declare-fun res!867893 () Bool)

(assert (=> b!1307453 (=> (not res!867893) (not e!746065))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87107 (_ BitVec 32)) Bool)

(assert (=> b!1307453 (= res!867893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1307454 () Bool)

(declare-fun res!867892 () Bool)

(assert (=> b!1307454 (=> (not res!867892) (not e!746065))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1307454 (= res!867892 (and (= (size!42587 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42586 _keys!1628) (size!42587 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1307455 () Bool)

(declare-fun tp_is_empty!35095 () Bool)

(assert (=> b!1307455 (= e!746066 tp_is_empty!35095)))

(declare-fun b!1307456 () Bool)

(assert (=> b!1307456 (= e!746068 tp_is_empty!35095)))

(declare-fun b!1307450 () Bool)

(assert (=> b!1307450 (= e!746065 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!584880 () Bool)

(declare-fun minValue!1296 () V!51897)

(declare-fun zeroValue!1296 () V!51897)

(declare-datatypes ((tuple2!22766 0))(
  ( (tuple2!22767 (_1!11394 (_ BitVec 64)) (_2!11394 V!51897)) )
))
(declare-datatypes ((List!29892 0))(
  ( (Nil!29889) (Cons!29888 (h!31097 tuple2!22766) (t!43490 List!29892)) )
))
(declare-datatypes ((ListLongMap!20423 0))(
  ( (ListLongMap!20424 (toList!10227 List!29892)) )
))
(declare-fun contains!8304 (ListLongMap!20423 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5122 (array!87107 array!87109 (_ BitVec 32) (_ BitVec 32) V!51897 V!51897 (_ BitVec 32) Int) ListLongMap!20423)

(assert (=> b!1307450 (= lt!584880 (contains!8304 (getCurrentListMap!5122 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun res!867891 () Bool)

(assert (=> start!110530 (=> (not res!867891) (not e!746065))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110530 (= res!867891 (validMask!0 mask!2040))))

(assert (=> start!110530 e!746065))

(assert (=> start!110530 tp!103417))

(declare-fun array_inv!31969 (array!87107) Bool)

(assert (=> start!110530 (array_inv!31969 _keys!1628)))

(assert (=> start!110530 true))

(assert (=> start!110530 tp_is_empty!35095))

(declare-fun array_inv!31970 (array!87109) Bool)

(assert (=> start!110530 (and (array_inv!31970 _values!1354) e!746067)))

(assert (= (and start!110530 res!867891) b!1307454))

(assert (= (and b!1307454 res!867892) b!1307453))

(assert (= (and b!1307453 res!867893) b!1307449))

(assert (= (and b!1307449 res!867895) b!1307452))

(assert (= (and b!1307452 res!867894) b!1307450))

(assert (= (and b!1307451 condMapEmpty!54271) mapIsEmpty!54271))

(assert (= (and b!1307451 (not condMapEmpty!54271)) mapNonEmpty!54271))

(get-info :version)

(assert (= (and mapNonEmpty!54271 ((_ is ValueCellFull!16649) mapValue!54271)) b!1307455))

(assert (= (and b!1307451 ((_ is ValueCellFull!16649) mapDefault!54271)) b!1307456))

(assert (= start!110530 b!1307451))

(declare-fun m!1197669 () Bool)

(assert (=> b!1307453 m!1197669))

(declare-fun m!1197671 () Bool)

(assert (=> b!1307449 m!1197671))

(declare-fun m!1197673 () Bool)

(assert (=> mapNonEmpty!54271 m!1197673))

(declare-fun m!1197675 () Bool)

(assert (=> b!1307450 m!1197675))

(assert (=> b!1307450 m!1197675))

(declare-fun m!1197677 () Bool)

(assert (=> b!1307450 m!1197677))

(declare-fun m!1197679 () Bool)

(assert (=> start!110530 m!1197679))

(declare-fun m!1197681 () Bool)

(assert (=> start!110530 m!1197681))

(declare-fun m!1197683 () Bool)

(assert (=> start!110530 m!1197683))

(check-sat (not b!1307453) (not start!110530) (not mapNonEmpty!54271) (not b_next!29365) (not b!1307449) (not b!1307450) tp_is_empty!35095 b_and!47555)
(check-sat b_and!47555 (not b_next!29365))
