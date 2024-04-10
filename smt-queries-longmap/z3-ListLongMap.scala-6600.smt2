; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83486 () Bool)

(assert start!83486)

(declare-fun b_free!19473 () Bool)

(declare-fun b_next!19473 () Bool)

(assert (=> start!83486 (= b_free!19473 (not b_next!19473))))

(declare-fun tp!67707 () Bool)

(declare-fun b_and!31075 () Bool)

(assert (=> start!83486 (= tp!67707 b_and!31075)))

(declare-fun mapNonEmpty!35575 () Bool)

(declare-fun mapRes!35575 () Bool)

(declare-fun tp!67706 () Bool)

(declare-fun e!549653 () Bool)

(assert (=> mapNonEmpty!35575 (= mapRes!35575 (and tp!67706 e!549653))))

(declare-datatypes ((V!34819 0))(
  ( (V!34820 (val!11239 Int)) )
))
(declare-datatypes ((ValueCell!10707 0))(
  ( (ValueCellFull!10707 (v!13798 V!34819)) (EmptyCell!10707) )
))
(declare-fun mapValue!35575 () ValueCell!10707)

(declare-fun mapKey!35575 () (_ BitVec 32))

(declare-fun mapRest!35575 () (Array (_ BitVec 32) ValueCell!10707))

(declare-datatypes ((array!60785 0))(
  ( (array!60786 (arr!29256 (Array (_ BitVec 32) ValueCell!10707)) (size!29735 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60785)

(assert (=> mapNonEmpty!35575 (= (arr!29256 _values!1425) (store mapRest!35575 mapKey!35575 mapValue!35575))))

(declare-fun b!975247 () Bool)

(declare-fun res!652851 () Bool)

(declare-fun e!549655 () Bool)

(assert (=> b!975247 (=> (not res!652851) (not e!549655))))

(declare-datatypes ((array!60787 0))(
  ( (array!60788 (arr!29257 (Array (_ BitVec 32) (_ BitVec 64))) (size!29736 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60787)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!975247 (= res!652851 (validKeyInArray!0 (select (arr!29257 _keys!1717) i!822)))))

(declare-fun b!975248 () Bool)

(declare-fun res!652849 () Bool)

(assert (=> b!975248 (=> (not res!652849) (not e!549655))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!975248 (= res!652849 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29736 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29736 _keys!1717))))))

(declare-fun b!975249 () Bool)

(declare-fun res!652848 () Bool)

(assert (=> b!975249 (=> (not res!652848) (not e!549655))))

(declare-datatypes ((List!20302 0))(
  ( (Nil!20299) (Cons!20298 (h!21460 (_ BitVec 64)) (t!28779 List!20302)) )
))
(declare-fun arrayNoDuplicates!0 (array!60787 (_ BitVec 32) List!20302) Bool)

(assert (=> b!975249 (= res!652848 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20299))))

(declare-fun b!975250 () Bool)

(declare-fun res!652846 () Bool)

(assert (=> b!975250 (=> (not res!652846) (not e!549655))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!975250 (= res!652846 (and (= (size!29735 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29736 _keys!1717) (size!29735 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!35575 () Bool)

(assert (=> mapIsEmpty!35575 mapRes!35575))

(declare-fun b!975251 () Bool)

(assert (=> b!975251 (= e!549655 false)))

(declare-fun zeroValue!1367 () V!34819)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34819)

(declare-datatypes ((tuple2!14450 0))(
  ( (tuple2!14451 (_1!7236 (_ BitVec 64)) (_2!7236 V!34819)) )
))
(declare-datatypes ((List!20303 0))(
  ( (Nil!20300) (Cons!20299 (h!21461 tuple2!14450) (t!28780 List!20303)) )
))
(declare-datatypes ((ListLongMap!13147 0))(
  ( (ListLongMap!13148 (toList!6589 List!20303)) )
))
(declare-fun lt!432845 () ListLongMap!13147)

(declare-fun getCurrentListMap!3822 (array!60787 array!60785 (_ BitVec 32) (_ BitVec 32) V!34819 V!34819 (_ BitVec 32) Int) ListLongMap!13147)

(assert (=> b!975251 (= lt!432845 (getCurrentListMap!3822 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!975252 () Bool)

(declare-fun res!652845 () Bool)

(assert (=> b!975252 (=> (not res!652845) (not e!549655))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60787 (_ BitVec 32)) Bool)

(assert (=> b!975252 (= res!652845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!975254 () Bool)

(declare-fun e!549651 () Bool)

(declare-fun e!549654 () Bool)

(assert (=> b!975254 (= e!549651 (and e!549654 mapRes!35575))))

(declare-fun condMapEmpty!35575 () Bool)

(declare-fun mapDefault!35575 () ValueCell!10707)

(assert (=> b!975254 (= condMapEmpty!35575 (= (arr!29256 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10707)) mapDefault!35575)))))

(declare-fun b!975255 () Bool)

(declare-fun tp_is_empty!22377 () Bool)

(assert (=> b!975255 (= e!549653 tp_is_empty!22377)))

(declare-fun b!975256 () Bool)

(assert (=> b!975256 (= e!549654 tp_is_empty!22377)))

(declare-fun res!652847 () Bool)

(assert (=> start!83486 (=> (not res!652847) (not e!549655))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83486 (= res!652847 (validMask!0 mask!2147))))

(assert (=> start!83486 e!549655))

(assert (=> start!83486 true))

(declare-fun array_inv!22625 (array!60785) Bool)

(assert (=> start!83486 (and (array_inv!22625 _values!1425) e!549651)))

(assert (=> start!83486 tp_is_empty!22377))

(assert (=> start!83486 tp!67707))

(declare-fun array_inv!22626 (array!60787) Bool)

(assert (=> start!83486 (array_inv!22626 _keys!1717)))

(declare-fun b!975253 () Bool)

(declare-fun res!652850 () Bool)

(assert (=> b!975253 (=> (not res!652850) (not e!549655))))

(declare-fun contains!5671 (ListLongMap!13147 (_ BitVec 64)) Bool)

(assert (=> b!975253 (= res!652850 (contains!5671 (getCurrentListMap!3822 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29257 _keys!1717) i!822)))))

(assert (= (and start!83486 res!652847) b!975250))

(assert (= (and b!975250 res!652846) b!975252))

(assert (= (and b!975252 res!652845) b!975249))

(assert (= (and b!975249 res!652848) b!975248))

(assert (= (and b!975248 res!652849) b!975247))

(assert (= (and b!975247 res!652851) b!975253))

(assert (= (and b!975253 res!652850) b!975251))

(assert (= (and b!975254 condMapEmpty!35575) mapIsEmpty!35575))

(assert (= (and b!975254 (not condMapEmpty!35575)) mapNonEmpty!35575))

(get-info :version)

(assert (= (and mapNonEmpty!35575 ((_ is ValueCellFull!10707) mapValue!35575)) b!975255))

(assert (= (and b!975254 ((_ is ValueCellFull!10707) mapDefault!35575)) b!975256))

(assert (= start!83486 b!975254))

(declare-fun m!902543 () Bool)

(assert (=> b!975252 m!902543))

(declare-fun m!902545 () Bool)

(assert (=> b!975253 m!902545))

(declare-fun m!902547 () Bool)

(assert (=> b!975253 m!902547))

(assert (=> b!975253 m!902545))

(assert (=> b!975253 m!902547))

(declare-fun m!902549 () Bool)

(assert (=> b!975253 m!902549))

(assert (=> b!975247 m!902547))

(assert (=> b!975247 m!902547))

(declare-fun m!902551 () Bool)

(assert (=> b!975247 m!902551))

(declare-fun m!902553 () Bool)

(assert (=> b!975251 m!902553))

(declare-fun m!902555 () Bool)

(assert (=> b!975249 m!902555))

(declare-fun m!902557 () Bool)

(assert (=> start!83486 m!902557))

(declare-fun m!902559 () Bool)

(assert (=> start!83486 m!902559))

(declare-fun m!902561 () Bool)

(assert (=> start!83486 m!902561))

(declare-fun m!902563 () Bool)

(assert (=> mapNonEmpty!35575 m!902563))

(check-sat b_and!31075 tp_is_empty!22377 (not b!975249) (not mapNonEmpty!35575) (not b!975251) (not b!975252) (not b_next!19473) (not start!83486) (not b!975247) (not b!975253))
(check-sat b_and!31075 (not b_next!19473))
