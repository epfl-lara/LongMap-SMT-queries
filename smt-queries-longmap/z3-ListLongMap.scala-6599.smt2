; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83460 () Bool)

(assert start!83460)

(declare-fun b_free!19465 () Bool)

(declare-fun b_next!19465 () Bool)

(assert (=> start!83460 (= b_free!19465 (not b_next!19465))))

(declare-fun tp!67684 () Bool)

(declare-fun b_and!31041 () Bool)

(assert (=> start!83460 (= tp!67684 b_and!31041)))

(declare-fun b!974888 () Bool)

(declare-fun e!549447 () Bool)

(assert (=> b!974888 (= e!549447 false)))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34809 0))(
  ( (V!34810 (val!11235 Int)) )
))
(declare-datatypes ((ValueCell!10703 0))(
  ( (ValueCellFull!10703 (v!13793 V!34809)) (EmptyCell!10703) )
))
(declare-datatypes ((array!60698 0))(
  ( (array!60699 (arr!29213 (Array (_ BitVec 32) ValueCell!10703)) (size!29694 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60698)

(declare-datatypes ((tuple2!14510 0))(
  ( (tuple2!14511 (_1!7266 (_ BitVec 64)) (_2!7266 V!34809)) )
))
(declare-datatypes ((List!20316 0))(
  ( (Nil!20313) (Cons!20312 (h!21474 tuple2!14510) (t!28784 List!20316)) )
))
(declare-datatypes ((ListLongMap!13197 0))(
  ( (ListLongMap!13198 (toList!6614 List!20316)) )
))
(declare-fun lt!432597 () ListLongMap!13197)

(declare-fun zeroValue!1367 () V!34809)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34809)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60700 0))(
  ( (array!60701 (arr!29214 (Array (_ BitVec 32) (_ BitVec 64))) (size!29695 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60700)

(declare-fun getCurrentListMap!3776 (array!60700 array!60698 (_ BitVec 32) (_ BitVec 32) V!34809 V!34809 (_ BitVec 32) Int) ListLongMap!13197)

(assert (=> b!974888 (= lt!432597 (getCurrentListMap!3776 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapIsEmpty!35563 () Bool)

(declare-fun mapRes!35563 () Bool)

(assert (=> mapIsEmpty!35563 mapRes!35563))

(declare-fun b!974889 () Bool)

(declare-fun res!652655 () Bool)

(assert (=> b!974889 (=> (not res!652655) (not e!549447))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5646 (ListLongMap!13197 (_ BitVec 64)) Bool)

(assert (=> b!974889 (= res!652655 (contains!5646 (getCurrentListMap!3776 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29214 _keys!1717) i!822)))))

(declare-fun res!652652 () Bool)

(assert (=> start!83460 (=> (not res!652652) (not e!549447))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83460 (= res!652652 (validMask!0 mask!2147))))

(assert (=> start!83460 e!549447))

(assert (=> start!83460 true))

(declare-fun e!549444 () Bool)

(declare-fun array_inv!22643 (array!60698) Bool)

(assert (=> start!83460 (and (array_inv!22643 _values!1425) e!549444)))

(declare-fun tp_is_empty!22369 () Bool)

(assert (=> start!83460 tp_is_empty!22369))

(assert (=> start!83460 tp!67684))

(declare-fun array_inv!22644 (array!60700) Bool)

(assert (=> start!83460 (array_inv!22644 _keys!1717)))

(declare-fun b!974890 () Bool)

(declare-fun res!652654 () Bool)

(assert (=> b!974890 (=> (not res!652654) (not e!549447))))

(assert (=> b!974890 (= res!652654 (and (= (size!29694 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29695 _keys!1717) (size!29694 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!974891 () Bool)

(declare-fun res!652651 () Bool)

(assert (=> b!974891 (=> (not res!652651) (not e!549447))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!974891 (= res!652651 (validKeyInArray!0 (select (arr!29214 _keys!1717) i!822)))))

(declare-fun b!974892 () Bool)

(declare-fun res!652656 () Bool)

(assert (=> b!974892 (=> (not res!652656) (not e!549447))))

(declare-datatypes ((List!20317 0))(
  ( (Nil!20314) (Cons!20313 (h!21475 (_ BitVec 64)) (t!28785 List!20317)) )
))
(declare-fun arrayNoDuplicates!0 (array!60700 (_ BitVec 32) List!20317) Bool)

(assert (=> b!974892 (= res!652656 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20314))))

(declare-fun b!974893 () Bool)

(declare-fun res!652653 () Bool)

(assert (=> b!974893 (=> (not res!652653) (not e!549447))))

(assert (=> b!974893 (= res!652653 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29695 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29695 _keys!1717))))))

(declare-fun b!974894 () Bool)

(declare-fun e!549443 () Bool)

(assert (=> b!974894 (= e!549444 (and e!549443 mapRes!35563))))

(declare-fun condMapEmpty!35563 () Bool)

(declare-fun mapDefault!35563 () ValueCell!10703)

(assert (=> b!974894 (= condMapEmpty!35563 (= (arr!29213 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10703)) mapDefault!35563)))))

(declare-fun mapNonEmpty!35563 () Bool)

(declare-fun tp!67683 () Bool)

(declare-fun e!549446 () Bool)

(assert (=> mapNonEmpty!35563 (= mapRes!35563 (and tp!67683 e!549446))))

(declare-fun mapRest!35563 () (Array (_ BitVec 32) ValueCell!10703))

(declare-fun mapValue!35563 () ValueCell!10703)

(declare-fun mapKey!35563 () (_ BitVec 32))

(assert (=> mapNonEmpty!35563 (= (arr!29213 _values!1425) (store mapRest!35563 mapKey!35563 mapValue!35563))))

(declare-fun b!974895 () Bool)

(declare-fun res!652657 () Bool)

(assert (=> b!974895 (=> (not res!652657) (not e!549447))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60700 (_ BitVec 32)) Bool)

(assert (=> b!974895 (= res!652657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!974896 () Bool)

(assert (=> b!974896 (= e!549446 tp_is_empty!22369)))

(declare-fun b!974897 () Bool)

(assert (=> b!974897 (= e!549443 tp_is_empty!22369)))

(assert (= (and start!83460 res!652652) b!974890))

(assert (= (and b!974890 res!652654) b!974895))

(assert (= (and b!974895 res!652657) b!974892))

(assert (= (and b!974892 res!652656) b!974893))

(assert (= (and b!974893 res!652653) b!974891))

(assert (= (and b!974891 res!652651) b!974889))

(assert (= (and b!974889 res!652655) b!974888))

(assert (= (and b!974894 condMapEmpty!35563) mapIsEmpty!35563))

(assert (= (and b!974894 (not condMapEmpty!35563)) mapNonEmpty!35563))

(get-info :version)

(assert (= (and mapNonEmpty!35563 ((_ is ValueCellFull!10703) mapValue!35563)) b!974896))

(assert (= (and b!974894 ((_ is ValueCellFull!10703) mapDefault!35563)) b!974897))

(assert (= start!83460 b!974894))

(declare-fun m!901697 () Bool)

(assert (=> b!974891 m!901697))

(assert (=> b!974891 m!901697))

(declare-fun m!901699 () Bool)

(assert (=> b!974891 m!901699))

(declare-fun m!901701 () Bool)

(assert (=> mapNonEmpty!35563 m!901701))

(declare-fun m!901703 () Bool)

(assert (=> b!974892 m!901703))

(declare-fun m!901705 () Bool)

(assert (=> b!974888 m!901705))

(declare-fun m!901707 () Bool)

(assert (=> b!974889 m!901707))

(assert (=> b!974889 m!901697))

(assert (=> b!974889 m!901707))

(assert (=> b!974889 m!901697))

(declare-fun m!901709 () Bool)

(assert (=> b!974889 m!901709))

(declare-fun m!901711 () Bool)

(assert (=> b!974895 m!901711))

(declare-fun m!901713 () Bool)

(assert (=> start!83460 m!901713))

(declare-fun m!901715 () Bool)

(assert (=> start!83460 m!901715))

(declare-fun m!901717 () Bool)

(assert (=> start!83460 m!901717))

(check-sat (not b!974889) (not start!83460) (not b!974892) b_and!31041 (not mapNonEmpty!35563) (not b!974891) (not b!974895) (not b_next!19465) (not b!974888) tp_is_empty!22369)
(check-sat b_and!31041 (not b_next!19465))
