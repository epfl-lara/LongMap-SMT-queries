; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97044 () Bool)

(assert start!97044)

(declare-fun b!1103848 () Bool)

(declare-fun res!736427 () Bool)

(declare-fun e!630126 () Bool)

(assert (=> b!1103848 (=> (not res!736427) (not e!630126))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!71587 0))(
  ( (array!71588 (arr!34450 (Array (_ BitVec 32) (_ BitVec 64))) (size!34986 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71587)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71587 (_ BitVec 32)) Bool)

(assert (=> b!1103848 (= res!736427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!71588 (store (arr!34450 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34986 _keys!1208)) mask!1564))))

(declare-fun b!1103849 () Bool)

(declare-fun res!736430 () Bool)

(assert (=> b!1103849 (=> (not res!736430) (not e!630126))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1103849 (= res!736430 (validMask!0 mask!1564))))

(declare-fun b!1103850 () Bool)

(declare-fun res!736429 () Bool)

(assert (=> b!1103850 (=> (not res!736429) (not e!630126))))

(assert (=> b!1103850 (= res!736429 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!34986 _keys!1208))))))

(declare-fun b!1103851 () Bool)

(declare-fun e!630122 () Bool)

(declare-fun tp_is_empty!27333 () Bool)

(assert (=> b!1103851 (= e!630122 tp_is_empty!27333)))

(declare-fun b!1103852 () Bool)

(declare-fun e!630125 () Bool)

(assert (=> b!1103852 (= e!630125 tp_is_empty!27333)))

(declare-fun b!1103853 () Bool)

(assert (=> b!1103853 (= e!630126 (bvsgt #b00000000000000000000000000000000 (size!34986 _keys!1208)))))

(declare-fun b!1103854 () Bool)

(declare-fun res!736424 () Bool)

(assert (=> b!1103854 (=> (not res!736424) (not e!630126))))

(assert (=> b!1103854 (= res!736424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!42805 () Bool)

(declare-fun mapRes!42805 () Bool)

(declare-fun tp!81725 () Bool)

(assert (=> mapNonEmpty!42805 (= mapRes!42805 (and tp!81725 e!630125))))

(declare-datatypes ((V!41571 0))(
  ( (V!41572 (val!13723 Int)) )
))
(declare-datatypes ((ValueCell!12957 0))(
  ( (ValueCellFull!12957 (v!16355 V!41571)) (EmptyCell!12957) )
))
(declare-fun mapValue!42805 () ValueCell!12957)

(declare-fun mapKey!42805 () (_ BitVec 32))

(declare-datatypes ((array!71589 0))(
  ( (array!71590 (arr!34451 (Array (_ BitVec 32) ValueCell!12957)) (size!34987 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71589)

(declare-fun mapRest!42805 () (Array (_ BitVec 32) ValueCell!12957))

(assert (=> mapNonEmpty!42805 (= (arr!34451 _values!996) (store mapRest!42805 mapKey!42805 mapValue!42805))))

(declare-fun b!1103855 () Bool)

(declare-fun res!736425 () Bool)

(assert (=> b!1103855 (=> (not res!736425) (not e!630126))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1103855 (= res!736425 (validKeyInArray!0 k0!934))))

(declare-fun b!1103856 () Bool)

(declare-fun res!736428 () Bool)

(assert (=> b!1103856 (=> (not res!736428) (not e!630126))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1103856 (= res!736428 (and (= (size!34987 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34986 _keys!1208) (size!34987 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1103857 () Bool)

(declare-fun res!736423 () Bool)

(assert (=> b!1103857 (=> (not res!736423) (not e!630126))))

(declare-datatypes ((List!24048 0))(
  ( (Nil!24045) (Cons!24044 (h!25253 (_ BitVec 64)) (t!34313 List!24048)) )
))
(declare-fun arrayNoDuplicates!0 (array!71587 (_ BitVec 32) List!24048) Bool)

(assert (=> b!1103857 (= res!736423 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24045))))

(declare-fun b!1103847 () Bool)

(declare-fun res!736431 () Bool)

(assert (=> b!1103847 (=> (not res!736431) (not e!630126))))

(assert (=> b!1103847 (= res!736431 (= (select (arr!34450 _keys!1208) i!673) k0!934))))

(declare-fun res!736426 () Bool)

(assert (=> start!97044 (=> (not res!736426) (not e!630126))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97044 (= res!736426 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34986 _keys!1208))))))

(assert (=> start!97044 e!630126))

(declare-fun array_inv!26526 (array!71587) Bool)

(assert (=> start!97044 (array_inv!26526 _keys!1208)))

(assert (=> start!97044 true))

(declare-fun e!630123 () Bool)

(declare-fun array_inv!26527 (array!71589) Bool)

(assert (=> start!97044 (and (array_inv!26527 _values!996) e!630123)))

(declare-fun mapIsEmpty!42805 () Bool)

(assert (=> mapIsEmpty!42805 mapRes!42805))

(declare-fun b!1103858 () Bool)

(assert (=> b!1103858 (= e!630123 (and e!630122 mapRes!42805))))

(declare-fun condMapEmpty!42805 () Bool)

(declare-fun mapDefault!42805 () ValueCell!12957)

(assert (=> b!1103858 (= condMapEmpty!42805 (= (arr!34451 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12957)) mapDefault!42805)))))

(assert (= (and start!97044 res!736426) b!1103849))

(assert (= (and b!1103849 res!736430) b!1103856))

(assert (= (and b!1103856 res!736428) b!1103854))

(assert (= (and b!1103854 res!736424) b!1103857))

(assert (= (and b!1103857 res!736423) b!1103850))

(assert (= (and b!1103850 res!736429) b!1103855))

(assert (= (and b!1103855 res!736425) b!1103847))

(assert (= (and b!1103847 res!736431) b!1103848))

(assert (= (and b!1103848 res!736427) b!1103853))

(assert (= (and b!1103858 condMapEmpty!42805) mapIsEmpty!42805))

(assert (= (and b!1103858 (not condMapEmpty!42805)) mapNonEmpty!42805))

(get-info :version)

(assert (= (and mapNonEmpty!42805 ((_ is ValueCellFull!12957) mapValue!42805)) b!1103852))

(assert (= (and b!1103858 ((_ is ValueCellFull!12957) mapDefault!42805)) b!1103851))

(assert (= start!97044 b!1103858))

(declare-fun m!1023821 () Bool)

(assert (=> b!1103848 m!1023821))

(declare-fun m!1023823 () Bool)

(assert (=> b!1103848 m!1023823))

(declare-fun m!1023825 () Bool)

(assert (=> start!97044 m!1023825))

(declare-fun m!1023827 () Bool)

(assert (=> start!97044 m!1023827))

(declare-fun m!1023829 () Bool)

(assert (=> b!1103847 m!1023829))

(declare-fun m!1023831 () Bool)

(assert (=> b!1103849 m!1023831))

(declare-fun m!1023833 () Bool)

(assert (=> b!1103857 m!1023833))

(declare-fun m!1023835 () Bool)

(assert (=> b!1103854 m!1023835))

(declare-fun m!1023837 () Bool)

(assert (=> b!1103855 m!1023837))

(declare-fun m!1023839 () Bool)

(assert (=> mapNonEmpty!42805 m!1023839))

(check-sat (not b!1103848) (not b!1103849) (not b!1103855) (not b!1103854) (not start!97044) (not b!1103857) (not mapNonEmpty!42805) tp_is_empty!27333)
(check-sat)
