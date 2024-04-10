; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83498 () Bool)

(assert start!83498)

(declare-fun b_free!19485 () Bool)

(declare-fun b_next!19485 () Bool)

(assert (=> start!83498 (= b_free!19485 (not b_next!19485))))

(declare-fun tp!67743 () Bool)

(declare-fun b_and!31087 () Bool)

(assert (=> start!83498 (= tp!67743 b_and!31087)))

(declare-fun b!975427 () Bool)

(declare-fun e!549745 () Bool)

(declare-fun e!549744 () Bool)

(declare-fun mapRes!35593 () Bool)

(assert (=> b!975427 (= e!549745 (and e!549744 mapRes!35593))))

(declare-fun condMapEmpty!35593 () Bool)

(declare-datatypes ((V!34835 0))(
  ( (V!34836 (val!11245 Int)) )
))
(declare-datatypes ((ValueCell!10713 0))(
  ( (ValueCellFull!10713 (v!13804 V!34835)) (EmptyCell!10713) )
))
(declare-datatypes ((array!60809 0))(
  ( (array!60810 (arr!29268 (Array (_ BitVec 32) ValueCell!10713)) (size!29747 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60809)

(declare-fun mapDefault!35593 () ValueCell!10713)

(assert (=> b!975427 (= condMapEmpty!35593 (= (arr!29268 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10713)) mapDefault!35593)))))

(declare-fun b!975428 () Bool)

(declare-fun e!549741 () Bool)

(assert (=> b!975428 (= e!549741 false)))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun zeroValue!1367 () V!34835)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34835)

(declare-datatypes ((tuple2!14460 0))(
  ( (tuple2!14461 (_1!7241 (_ BitVec 64)) (_2!7241 V!34835)) )
))
(declare-datatypes ((List!20312 0))(
  ( (Nil!20309) (Cons!20308 (h!21470 tuple2!14460) (t!28789 List!20312)) )
))
(declare-datatypes ((ListLongMap!13157 0))(
  ( (ListLongMap!13158 (toList!6594 List!20312)) )
))
(declare-fun lt!432863 () ListLongMap!13157)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60811 0))(
  ( (array!60812 (arr!29269 (Array (_ BitVec 32) (_ BitVec 64))) (size!29748 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60811)

(declare-fun getCurrentListMap!3827 (array!60811 array!60809 (_ BitVec 32) (_ BitVec 32) V!34835 V!34835 (_ BitVec 32) Int) ListLongMap!13157)

(assert (=> b!975428 (= lt!432863 (getCurrentListMap!3827 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!975429 () Bool)

(declare-fun res!652972 () Bool)

(assert (=> b!975429 (=> (not res!652972) (not e!549741))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60811 (_ BitVec 32)) Bool)

(assert (=> b!975429 (= res!652972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapIsEmpty!35593 () Bool)

(assert (=> mapIsEmpty!35593 mapRes!35593))

(declare-fun b!975430 () Bool)

(declare-fun res!652973 () Bool)

(assert (=> b!975430 (=> (not res!652973) (not e!549741))))

(assert (=> b!975430 (= res!652973 (and (= (size!29747 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29748 _keys!1717) (size!29747 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!975431 () Bool)

(declare-fun res!652976 () Bool)

(assert (=> b!975431 (=> (not res!652976) (not e!549741))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!975431 (= res!652976 (validKeyInArray!0 (select (arr!29269 _keys!1717) i!822)))))

(declare-fun b!975432 () Bool)

(declare-fun res!652977 () Bool)

(assert (=> b!975432 (=> (not res!652977) (not e!549741))))

(declare-fun contains!5676 (ListLongMap!13157 (_ BitVec 64)) Bool)

(assert (=> b!975432 (= res!652977 (contains!5676 (getCurrentListMap!3827 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29269 _keys!1717) i!822)))))

(declare-fun res!652974 () Bool)

(assert (=> start!83498 (=> (not res!652974) (not e!549741))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83498 (= res!652974 (validMask!0 mask!2147))))

(assert (=> start!83498 e!549741))

(assert (=> start!83498 true))

(declare-fun array_inv!22633 (array!60809) Bool)

(assert (=> start!83498 (and (array_inv!22633 _values!1425) e!549745)))

(declare-fun tp_is_empty!22389 () Bool)

(assert (=> start!83498 tp_is_empty!22389))

(assert (=> start!83498 tp!67743))

(declare-fun array_inv!22634 (array!60811) Bool)

(assert (=> start!83498 (array_inv!22634 _keys!1717)))

(declare-fun b!975433 () Bool)

(declare-fun res!652971 () Bool)

(assert (=> b!975433 (=> (not res!652971) (not e!549741))))

(declare-datatypes ((List!20313 0))(
  ( (Nil!20310) (Cons!20309 (h!21471 (_ BitVec 64)) (t!28790 List!20313)) )
))
(declare-fun arrayNoDuplicates!0 (array!60811 (_ BitVec 32) List!20313) Bool)

(assert (=> b!975433 (= res!652971 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20310))))

(declare-fun mapNonEmpty!35593 () Bool)

(declare-fun tp!67742 () Bool)

(declare-fun e!549743 () Bool)

(assert (=> mapNonEmpty!35593 (= mapRes!35593 (and tp!67742 e!549743))))

(declare-fun mapValue!35593 () ValueCell!10713)

(declare-fun mapKey!35593 () (_ BitVec 32))

(declare-fun mapRest!35593 () (Array (_ BitVec 32) ValueCell!10713))

(assert (=> mapNonEmpty!35593 (= (arr!29268 _values!1425) (store mapRest!35593 mapKey!35593 mapValue!35593))))

(declare-fun b!975434 () Bool)

(declare-fun res!652975 () Bool)

(assert (=> b!975434 (=> (not res!652975) (not e!549741))))

(assert (=> b!975434 (= res!652975 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29748 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29748 _keys!1717))))))

(declare-fun b!975435 () Bool)

(assert (=> b!975435 (= e!549743 tp_is_empty!22389)))

(declare-fun b!975436 () Bool)

(assert (=> b!975436 (= e!549744 tp_is_empty!22389)))

(assert (= (and start!83498 res!652974) b!975430))

(assert (= (and b!975430 res!652973) b!975429))

(assert (= (and b!975429 res!652972) b!975433))

(assert (= (and b!975433 res!652971) b!975434))

(assert (= (and b!975434 res!652975) b!975431))

(assert (= (and b!975431 res!652976) b!975432))

(assert (= (and b!975432 res!652977) b!975428))

(assert (= (and b!975427 condMapEmpty!35593) mapIsEmpty!35593))

(assert (= (and b!975427 (not condMapEmpty!35593)) mapNonEmpty!35593))

(get-info :version)

(assert (= (and mapNonEmpty!35593 ((_ is ValueCellFull!10713) mapValue!35593)) b!975435))

(assert (= (and b!975427 ((_ is ValueCellFull!10713) mapDefault!35593)) b!975436))

(assert (= start!83498 b!975427))

(declare-fun m!902675 () Bool)

(assert (=> b!975428 m!902675))

(declare-fun m!902677 () Bool)

(assert (=> b!975431 m!902677))

(assert (=> b!975431 m!902677))

(declare-fun m!902679 () Bool)

(assert (=> b!975431 m!902679))

(declare-fun m!902681 () Bool)

(assert (=> b!975432 m!902681))

(assert (=> b!975432 m!902677))

(assert (=> b!975432 m!902681))

(assert (=> b!975432 m!902677))

(declare-fun m!902683 () Bool)

(assert (=> b!975432 m!902683))

(declare-fun m!902685 () Bool)

(assert (=> start!83498 m!902685))

(declare-fun m!902687 () Bool)

(assert (=> start!83498 m!902687))

(declare-fun m!902689 () Bool)

(assert (=> start!83498 m!902689))

(declare-fun m!902691 () Bool)

(assert (=> b!975429 m!902691))

(declare-fun m!902693 () Bool)

(assert (=> b!975433 m!902693))

(declare-fun m!902695 () Bool)

(assert (=> mapNonEmpty!35593 m!902695))

(check-sat (not b!975433) (not b!975429) b_and!31087 tp_is_empty!22389 (not start!83498) (not b!975432) (not b!975431) (not b_next!19485) (not b!975428) (not mapNonEmpty!35593))
(check-sat b_and!31087 (not b_next!19485))
