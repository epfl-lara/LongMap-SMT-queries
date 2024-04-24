; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83604 () Bool)

(assert start!83604)

(declare-fun b_free!19429 () Bool)

(declare-fun b_next!19429 () Bool)

(assert (=> start!83604 (= b_free!19429 (not b_next!19429))))

(declare-fun tp!67566 () Bool)

(declare-fun b_and!31041 () Bool)

(assert (=> start!83604 (= tp!67566 b_and!31041)))

(declare-fun b!975429 () Bool)

(declare-fun res!652694 () Bool)

(declare-fun e!549856 () Bool)

(assert (=> b!975429 (=> (not res!652694) (not e!549856))))

(declare-datatypes ((array!60722 0))(
  ( (array!60723 (arr!29220 (Array (_ BitVec 32) (_ BitVec 64))) (size!29700 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60722)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!975429 (= res!652694 (validKeyInArray!0 (select (arr!29220 _keys!1717) i!822)))))

(declare-fun b!975430 () Bool)

(declare-fun res!652700 () Bool)

(assert (=> b!975430 (=> (not res!652700) (not e!549856))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60722 (_ BitVec 32)) Bool)

(assert (=> b!975430 (= res!652700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!975431 () Bool)

(declare-fun res!652695 () Bool)

(assert (=> b!975431 (=> (not res!652695) (not e!549856))))

(declare-datatypes ((V!34753 0))(
  ( (V!34754 (val!11214 Int)) )
))
(declare-datatypes ((ValueCell!10682 0))(
  ( (ValueCellFull!10682 (v!13770 V!34753)) (EmptyCell!10682) )
))
(declare-datatypes ((array!60724 0))(
  ( (array!60725 (arr!29221 (Array (_ BitVec 32) ValueCell!10682)) (size!29701 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60724)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!975431 (= res!652695 (and (= (size!29701 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29700 _keys!1717) (size!29701 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!975432 () Bool)

(declare-fun res!652693 () Bool)

(assert (=> b!975432 (=> (not res!652693) (not e!549856))))

(declare-fun zeroValue!1367 () V!34753)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34753)

(declare-datatypes ((tuple2!14420 0))(
  ( (tuple2!14421 (_1!7221 (_ BitVec 64)) (_2!7221 V!34753)) )
))
(declare-datatypes ((List!20265 0))(
  ( (Nil!20262) (Cons!20261 (h!21429 tuple2!14420) (t!28734 List!20265)) )
))
(declare-datatypes ((ListLongMap!13119 0))(
  ( (ListLongMap!13120 (toList!6575 List!20265)) )
))
(declare-fun contains!5680 (ListLongMap!13119 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3808 (array!60722 array!60724 (_ BitVec 32) (_ BitVec 32) V!34753 V!34753 (_ BitVec 32) Int) ListLongMap!13119)

(assert (=> b!975432 (= res!652693 (contains!5680 (getCurrentListMap!3808 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29220 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35500 () Bool)

(declare-fun mapRes!35500 () Bool)

(declare-fun tp!67567 () Bool)

(declare-fun e!549851 () Bool)

(assert (=> mapNonEmpty!35500 (= mapRes!35500 (and tp!67567 e!549851))))

(declare-fun mapKey!35500 () (_ BitVec 32))

(declare-fun mapRest!35500 () (Array (_ BitVec 32) ValueCell!10682))

(declare-fun mapValue!35500 () ValueCell!10682)

(assert (=> mapNonEmpty!35500 (= (arr!29221 _values!1425) (store mapRest!35500 mapKey!35500 mapValue!35500))))

(declare-fun b!975434 () Bool)

(declare-fun e!549852 () Bool)

(declare-fun e!549855 () Bool)

(assert (=> b!975434 (= e!549852 (and e!549855 mapRes!35500))))

(declare-fun condMapEmpty!35500 () Bool)

(declare-fun mapDefault!35500 () ValueCell!10682)

(assert (=> b!975434 (= condMapEmpty!35500 (= (arr!29221 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10682)) mapDefault!35500)))))

(declare-fun b!975435 () Bool)

(declare-fun res!652699 () Bool)

(assert (=> b!975435 (=> (not res!652699) (not e!549856))))

(declare-datatypes ((List!20266 0))(
  ( (Nil!20263) (Cons!20262 (h!21430 (_ BitVec 64)) (t!28735 List!20266)) )
))
(declare-fun arrayNoDuplicates!0 (array!60722 (_ BitVec 32) List!20266) Bool)

(assert (=> b!975435 (= res!652699 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20263))))

(declare-fun b!975436 () Bool)

(declare-fun tp_is_empty!22327 () Bool)

(assert (=> b!975436 (= e!549855 tp_is_empty!22327)))

(declare-fun b!975437 () Bool)

(declare-fun e!549853 () Bool)

(assert (=> b!975437 (= e!549856 e!549853)))

(declare-fun res!652697 () Bool)

(assert (=> b!975437 (=> (not res!652697) (not e!549853))))

(assert (=> b!975437 (= res!652697 (not (validKeyInArray!0 (select (arr!29220 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))))

(declare-fun lt!433140 () ListLongMap!13119)

(assert (=> b!975437 (= lt!433140 (getCurrentListMap!3808 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!975438 () Bool)

(declare-fun res!652696 () Bool)

(assert (=> b!975438 (=> (not res!652696) (not e!549856))))

(assert (=> b!975438 (= res!652696 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29700 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29700 _keys!1717))))))

(declare-fun b!975439 () Bool)

(assert (=> b!975439 (= e!549853 (bvsgt (bvsub from!2118 #b00000000000000000000000000000001) (size!29700 _keys!1717)))))

(declare-fun mapIsEmpty!35500 () Bool)

(assert (=> mapIsEmpty!35500 mapRes!35500))

(declare-fun res!652698 () Bool)

(assert (=> start!83604 (=> (not res!652698) (not e!549856))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83604 (= res!652698 (validMask!0 mask!2147))))

(assert (=> start!83604 e!549856))

(assert (=> start!83604 true))

(declare-fun array_inv!22647 (array!60724) Bool)

(assert (=> start!83604 (and (array_inv!22647 _values!1425) e!549852)))

(assert (=> start!83604 tp_is_empty!22327))

(assert (=> start!83604 tp!67566))

(declare-fun array_inv!22648 (array!60722) Bool)

(assert (=> start!83604 (array_inv!22648 _keys!1717)))

(declare-fun b!975433 () Bool)

(assert (=> b!975433 (= e!549851 tp_is_empty!22327)))

(assert (= (and start!83604 res!652698) b!975431))

(assert (= (and b!975431 res!652695) b!975430))

(assert (= (and b!975430 res!652700) b!975435))

(assert (= (and b!975435 res!652699) b!975438))

(assert (= (and b!975438 res!652696) b!975429))

(assert (= (and b!975429 res!652694) b!975432))

(assert (= (and b!975432 res!652693) b!975437))

(assert (= (and b!975437 res!652697) b!975439))

(assert (= (and b!975434 condMapEmpty!35500) mapIsEmpty!35500))

(assert (= (and b!975434 (not condMapEmpty!35500)) mapNonEmpty!35500))

(get-info :version)

(assert (= (and mapNonEmpty!35500 ((_ is ValueCellFull!10682) mapValue!35500)) b!975433))

(assert (= (and b!975434 ((_ is ValueCellFull!10682) mapDefault!35500)) b!975436))

(assert (= start!83604 b!975434))

(declare-fun m!903317 () Bool)

(assert (=> start!83604 m!903317))

(declare-fun m!903319 () Bool)

(assert (=> start!83604 m!903319))

(declare-fun m!903321 () Bool)

(assert (=> start!83604 m!903321))

(declare-fun m!903323 () Bool)

(assert (=> mapNonEmpty!35500 m!903323))

(declare-fun m!903325 () Bool)

(assert (=> b!975435 m!903325))

(declare-fun m!903327 () Bool)

(assert (=> b!975429 m!903327))

(assert (=> b!975429 m!903327))

(declare-fun m!903329 () Bool)

(assert (=> b!975429 m!903329))

(declare-fun m!903331 () Bool)

(assert (=> b!975432 m!903331))

(assert (=> b!975432 m!903327))

(assert (=> b!975432 m!903331))

(assert (=> b!975432 m!903327))

(declare-fun m!903333 () Bool)

(assert (=> b!975432 m!903333))

(declare-fun m!903335 () Bool)

(assert (=> b!975437 m!903335))

(assert (=> b!975437 m!903335))

(declare-fun m!903337 () Bool)

(assert (=> b!975437 m!903337))

(declare-fun m!903339 () Bool)

(assert (=> b!975437 m!903339))

(declare-fun m!903341 () Bool)

(assert (=> b!975430 m!903341))

(check-sat (not b!975430) (not mapNonEmpty!35500) b_and!31041 (not b!975435) (not b!975437) (not b!975429) tp_is_empty!22327 (not start!83604) (not b_next!19429) (not b!975432))
(check-sat b_and!31041 (not b_next!19429))
