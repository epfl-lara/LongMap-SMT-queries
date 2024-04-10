; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83558 () Bool)

(assert start!83558)

(declare-fun b_free!19545 () Bool)

(declare-fun b_next!19545 () Bool)

(assert (=> start!83558 (= b_free!19545 (not b_next!19545))))

(declare-fun tp!67922 () Bool)

(declare-fun b_and!31183 () Bool)

(assert (=> start!83558 (= tp!67922 b_and!31183)))

(declare-fun b!976431 () Bool)

(declare-fun e!550279 () Bool)

(declare-fun e!550278 () Bool)

(assert (=> b!976431 (= e!550279 e!550278)))

(declare-fun res!653676 () Bool)

(assert (=> b!976431 (=> (not res!653676) (not e!550278))))

(declare-datatypes ((array!60925 0))(
  ( (array!60926 (arr!29326 (Array (_ BitVec 32) (_ BitVec 64))) (size!29805 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60925)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!976431 (= res!653676 (not (validKeyInArray!0 (select (arr!29326 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34915 0))(
  ( (V!34916 (val!11275 Int)) )
))
(declare-datatypes ((tuple2!14510 0))(
  ( (tuple2!14511 (_1!7266 (_ BitVec 64)) (_2!7266 V!34915)) )
))
(declare-datatypes ((List!20360 0))(
  ( (Nil!20357) (Cons!20356 (h!21518 tuple2!14510) (t!28873 List!20360)) )
))
(declare-datatypes ((ListLongMap!13207 0))(
  ( (ListLongMap!13208 (toList!6619 List!20360)) )
))
(declare-fun lt!433133 () ListLongMap!13207)

(declare-datatypes ((ValueCell!10743 0))(
  ( (ValueCellFull!10743 (v!13834 V!34915)) (EmptyCell!10743) )
))
(declare-datatypes ((array!60927 0))(
  ( (array!60928 (arr!29327 (Array (_ BitVec 32) ValueCell!10743)) (size!29806 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60927)

(declare-fun zeroValue!1367 () V!34915)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34915)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3852 (array!60925 array!60927 (_ BitVec 32) (_ BitVec 32) V!34915 V!34915 (_ BitVec 32) Int) ListLongMap!13207)

(assert (=> b!976431 (= lt!433133 (getCurrentListMap!3852 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun res!653675 () Bool)

(assert (=> start!83558 (=> (not res!653675) (not e!550279))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83558 (= res!653675 (validMask!0 mask!2147))))

(assert (=> start!83558 e!550279))

(assert (=> start!83558 true))

(declare-fun e!550282 () Bool)

(declare-fun array_inv!22673 (array!60927) Bool)

(assert (=> start!83558 (and (array_inv!22673 _values!1425) e!550282)))

(declare-fun tp_is_empty!22449 () Bool)

(assert (=> start!83558 tp_is_empty!22449))

(assert (=> start!83558 tp!67922))

(declare-fun array_inv!22674 (array!60925) Bool)

(assert (=> start!83558 (array_inv!22674 _keys!1717)))

(declare-fun b!976432 () Bool)

(declare-fun e!550280 () Bool)

(assert (=> b!976432 (= e!550280 tp_is_empty!22449)))

(declare-fun b!976433 () Bool)

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!976433 (= e!550278 (bvslt i!822 #b00000000000000000000000000000000))))

(declare-fun b!976434 () Bool)

(declare-fun e!550281 () Bool)

(assert (=> b!976434 (= e!550281 tp_is_empty!22449)))

(declare-fun b!976435 () Bool)

(declare-fun res!653673 () Bool)

(assert (=> b!976435 (=> (not res!653673) (not e!550279))))

(declare-datatypes ((List!20361 0))(
  ( (Nil!20358) (Cons!20357 (h!21519 (_ BitVec 64)) (t!28874 List!20361)) )
))
(declare-fun arrayNoDuplicates!0 (array!60925 (_ BitVec 32) List!20361) Bool)

(assert (=> b!976435 (= res!653673 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20358))))

(declare-fun b!976436 () Bool)

(declare-fun res!653671 () Bool)

(assert (=> b!976436 (=> (not res!653671) (not e!550279))))

(declare-fun contains!5697 (ListLongMap!13207 (_ BitVec 64)) Bool)

(assert (=> b!976436 (= res!653671 (contains!5697 (getCurrentListMap!3852 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29326 _keys!1717) i!822)))))

(declare-fun mapIsEmpty!35683 () Bool)

(declare-fun mapRes!35683 () Bool)

(assert (=> mapIsEmpty!35683 mapRes!35683))

(declare-fun b!976437 () Bool)

(declare-fun res!653672 () Bool)

(assert (=> b!976437 (=> (not res!653672) (not e!550279))))

(assert (=> b!976437 (= res!653672 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29805 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29805 _keys!1717))))))

(declare-fun b!976438 () Bool)

(declare-fun res!653669 () Bool)

(assert (=> b!976438 (=> (not res!653669) (not e!550279))))

(assert (=> b!976438 (= res!653669 (and (= (size!29806 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29805 _keys!1717) (size!29806 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!976439 () Bool)

(declare-fun res!653670 () Bool)

(assert (=> b!976439 (=> (not res!653670) (not e!550279))))

(assert (=> b!976439 (= res!653670 (validKeyInArray!0 (select (arr!29326 _keys!1717) i!822)))))

(declare-fun b!976440 () Bool)

(declare-fun res!653674 () Bool)

(assert (=> b!976440 (=> (not res!653674) (not e!550279))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60925 (_ BitVec 32)) Bool)

(assert (=> b!976440 (= res!653674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapNonEmpty!35683 () Bool)

(declare-fun tp!67923 () Bool)

(assert (=> mapNonEmpty!35683 (= mapRes!35683 (and tp!67923 e!550281))))

(declare-fun mapKey!35683 () (_ BitVec 32))

(declare-fun mapRest!35683 () (Array (_ BitVec 32) ValueCell!10743))

(declare-fun mapValue!35683 () ValueCell!10743)

(assert (=> mapNonEmpty!35683 (= (arr!29327 _values!1425) (store mapRest!35683 mapKey!35683 mapValue!35683))))

(declare-fun b!976441 () Bool)

(assert (=> b!976441 (= e!550282 (and e!550280 mapRes!35683))))

(declare-fun condMapEmpty!35683 () Bool)

(declare-fun mapDefault!35683 () ValueCell!10743)

(assert (=> b!976441 (= condMapEmpty!35683 (= (arr!29327 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10743)) mapDefault!35683)))))

(assert (= (and start!83558 res!653675) b!976438))

(assert (= (and b!976438 res!653669) b!976440))

(assert (= (and b!976440 res!653674) b!976435))

(assert (= (and b!976435 res!653673) b!976437))

(assert (= (and b!976437 res!653672) b!976439))

(assert (= (and b!976439 res!653670) b!976436))

(assert (= (and b!976436 res!653671) b!976431))

(assert (= (and b!976431 res!653676) b!976433))

(assert (= (and b!976441 condMapEmpty!35683) mapIsEmpty!35683))

(assert (= (and b!976441 (not condMapEmpty!35683)) mapNonEmpty!35683))

(get-info :version)

(assert (= (and mapNonEmpty!35683 ((_ is ValueCellFull!10743) mapValue!35683)) b!976434))

(assert (= (and b!976441 ((_ is ValueCellFull!10743) mapDefault!35683)) b!976432))

(assert (= start!83558 b!976441))

(declare-fun m!903681 () Bool)

(assert (=> b!976439 m!903681))

(assert (=> b!976439 m!903681))

(declare-fun m!903683 () Bool)

(assert (=> b!976439 m!903683))

(declare-fun m!903685 () Bool)

(assert (=> b!976435 m!903685))

(declare-fun m!903687 () Bool)

(assert (=> b!976436 m!903687))

(assert (=> b!976436 m!903681))

(assert (=> b!976436 m!903687))

(assert (=> b!976436 m!903681))

(declare-fun m!903689 () Bool)

(assert (=> b!976436 m!903689))

(declare-fun m!903691 () Bool)

(assert (=> mapNonEmpty!35683 m!903691))

(declare-fun m!903693 () Bool)

(assert (=> b!976440 m!903693))

(declare-fun m!903695 () Bool)

(assert (=> b!976431 m!903695))

(assert (=> b!976431 m!903695))

(declare-fun m!903697 () Bool)

(assert (=> b!976431 m!903697))

(declare-fun m!903699 () Bool)

(assert (=> b!976431 m!903699))

(declare-fun m!903701 () Bool)

(assert (=> start!83558 m!903701))

(declare-fun m!903703 () Bool)

(assert (=> start!83558 m!903703))

(declare-fun m!903705 () Bool)

(assert (=> start!83558 m!903705))

(check-sat (not b!976439) (not b!976440) tp_is_empty!22449 b_and!31183 (not mapNonEmpty!35683) (not b!976436) (not start!83558) (not b!976431) (not b!976435) (not b_next!19545))
(check-sat b_and!31183 (not b_next!19545))
