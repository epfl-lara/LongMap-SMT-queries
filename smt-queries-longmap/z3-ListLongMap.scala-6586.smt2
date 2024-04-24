; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83568 () Bool)

(assert start!83568)

(declare-fun b_free!19393 () Bool)

(declare-fun b_next!19393 () Bool)

(assert (=> start!83568 (= b_free!19393 (not b_next!19393))))

(declare-fun tp!67459 () Bool)

(declare-fun b_and!31005 () Bool)

(assert (=> start!83568 (= tp!67459 b_and!31005)))

(declare-fun b!974887 () Bool)

(declare-fun res!652316 () Bool)

(declare-fun e!549580 () Bool)

(assert (=> b!974887 (=> (not res!652316) (not e!549580))))

(declare-datatypes ((array!60654 0))(
  ( (array!60655 (arr!29186 (Array (_ BitVec 32) (_ BitVec 64))) (size!29666 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60654)

(declare-datatypes ((List!20237 0))(
  ( (Nil!20234) (Cons!20233 (h!21401 (_ BitVec 64)) (t!28706 List!20237)) )
))
(declare-fun arrayNoDuplicates!0 (array!60654 (_ BitVec 32) List!20237) Bool)

(assert (=> b!974887 (= res!652316 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20234))))

(declare-fun b!974888 () Bool)

(declare-fun e!549579 () Bool)

(declare-fun tp_is_empty!22291 () Bool)

(assert (=> b!974888 (= e!549579 tp_is_empty!22291)))

(declare-fun b!974889 () Bool)

(declare-fun res!652313 () Bool)

(assert (=> b!974889 (=> (not res!652313) (not e!549580))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34705 0))(
  ( (V!34706 (val!11196 Int)) )
))
(declare-datatypes ((ValueCell!10664 0))(
  ( (ValueCellFull!10664 (v!13752 V!34705)) (EmptyCell!10664) )
))
(declare-datatypes ((array!60656 0))(
  ( (array!60657 (arr!29187 (Array (_ BitVec 32) ValueCell!10664)) (size!29667 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60656)

(declare-fun zeroValue!1367 () V!34705)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34705)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14390 0))(
  ( (tuple2!14391 (_1!7206 (_ BitVec 64)) (_2!7206 V!34705)) )
))
(declare-datatypes ((List!20238 0))(
  ( (Nil!20235) (Cons!20234 (h!21402 tuple2!14390) (t!28707 List!20238)) )
))
(declare-datatypes ((ListLongMap!13089 0))(
  ( (ListLongMap!13090 (toList!6560 List!20238)) )
))
(declare-fun contains!5665 (ListLongMap!13089 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3793 (array!60654 array!60656 (_ BitVec 32) (_ BitVec 32) V!34705 V!34705 (_ BitVec 32) Int) ListLongMap!13089)

(assert (=> b!974889 (= res!652313 (contains!5665 (getCurrentListMap!3793 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29186 _keys!1717) i!822)))))

(declare-fun b!974890 () Bool)

(assert (=> b!974890 (= e!549580 false)))

(declare-fun lt!433086 () ListLongMap!13089)

(assert (=> b!974890 (= lt!433086 (getCurrentListMap!3793 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!974891 () Bool)

(declare-fun res!652315 () Bool)

(assert (=> b!974891 (=> (not res!652315) (not e!549580))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!974891 (= res!652315 (validKeyInArray!0 (select (arr!29186 _keys!1717) i!822)))))

(declare-fun b!974892 () Bool)

(declare-fun e!549582 () Bool)

(assert (=> b!974892 (= e!549582 tp_is_empty!22291)))

(declare-fun b!974893 () Bool)

(declare-fun res!652317 () Bool)

(assert (=> b!974893 (=> (not res!652317) (not e!549580))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60654 (_ BitVec 32)) Bool)

(assert (=> b!974893 (= res!652317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!974894 () Bool)

(declare-fun e!549583 () Bool)

(declare-fun mapRes!35446 () Bool)

(assert (=> b!974894 (= e!549583 (and e!549582 mapRes!35446))))

(declare-fun condMapEmpty!35446 () Bool)

(declare-fun mapDefault!35446 () ValueCell!10664)

(assert (=> b!974894 (= condMapEmpty!35446 (= (arr!29187 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10664)) mapDefault!35446)))))

(declare-fun b!974895 () Bool)

(declare-fun res!652314 () Bool)

(assert (=> b!974895 (=> (not res!652314) (not e!549580))))

(assert (=> b!974895 (= res!652314 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29666 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29666 _keys!1717))))))

(declare-fun b!974896 () Bool)

(declare-fun res!652319 () Bool)

(assert (=> b!974896 (=> (not res!652319) (not e!549580))))

(assert (=> b!974896 (= res!652319 (and (= (size!29667 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29666 _keys!1717) (size!29667 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun res!652318 () Bool)

(assert (=> start!83568 (=> (not res!652318) (not e!549580))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83568 (= res!652318 (validMask!0 mask!2147))))

(assert (=> start!83568 e!549580))

(assert (=> start!83568 true))

(declare-fun array_inv!22629 (array!60656) Bool)

(assert (=> start!83568 (and (array_inv!22629 _values!1425) e!549583)))

(assert (=> start!83568 tp_is_empty!22291))

(assert (=> start!83568 tp!67459))

(declare-fun array_inv!22630 (array!60654) Bool)

(assert (=> start!83568 (array_inv!22630 _keys!1717)))

(declare-fun mapIsEmpty!35446 () Bool)

(assert (=> mapIsEmpty!35446 mapRes!35446))

(declare-fun mapNonEmpty!35446 () Bool)

(declare-fun tp!67458 () Bool)

(assert (=> mapNonEmpty!35446 (= mapRes!35446 (and tp!67458 e!549579))))

(declare-fun mapRest!35446 () (Array (_ BitVec 32) ValueCell!10664))

(declare-fun mapKey!35446 () (_ BitVec 32))

(declare-fun mapValue!35446 () ValueCell!10664)

(assert (=> mapNonEmpty!35446 (= (arr!29187 _values!1425) (store mapRest!35446 mapKey!35446 mapValue!35446))))

(assert (= (and start!83568 res!652318) b!974896))

(assert (= (and b!974896 res!652319) b!974893))

(assert (= (and b!974893 res!652317) b!974887))

(assert (= (and b!974887 res!652316) b!974895))

(assert (= (and b!974895 res!652314) b!974891))

(assert (= (and b!974891 res!652315) b!974889))

(assert (= (and b!974889 res!652313) b!974890))

(assert (= (and b!974894 condMapEmpty!35446) mapIsEmpty!35446))

(assert (= (and b!974894 (not condMapEmpty!35446)) mapNonEmpty!35446))

(get-info :version)

(assert (= (and mapNonEmpty!35446 ((_ is ValueCellFull!10664) mapValue!35446)) b!974888))

(assert (= (and b!974894 ((_ is ValueCellFull!10664) mapDefault!35446)) b!974892))

(assert (= start!83568 b!974894))

(declare-fun m!902921 () Bool)

(assert (=> b!974889 m!902921))

(declare-fun m!902923 () Bool)

(assert (=> b!974889 m!902923))

(assert (=> b!974889 m!902921))

(assert (=> b!974889 m!902923))

(declare-fun m!902925 () Bool)

(assert (=> b!974889 m!902925))

(declare-fun m!902927 () Bool)

(assert (=> b!974890 m!902927))

(declare-fun m!902929 () Bool)

(assert (=> b!974887 m!902929))

(declare-fun m!902931 () Bool)

(assert (=> start!83568 m!902931))

(declare-fun m!902933 () Bool)

(assert (=> start!83568 m!902933))

(declare-fun m!902935 () Bool)

(assert (=> start!83568 m!902935))

(declare-fun m!902937 () Bool)

(assert (=> mapNonEmpty!35446 m!902937))

(declare-fun m!902939 () Bool)

(assert (=> b!974893 m!902939))

(assert (=> b!974891 m!902923))

(assert (=> b!974891 m!902923))

(declare-fun m!902941 () Bool)

(assert (=> b!974891 m!902941))

(check-sat (not start!83568) tp_is_empty!22291 (not b!974893) (not b!974891) (not b!974889) b_and!31005 (not b!974887) (not b_next!19393) (not b!974890) (not mapNonEmpty!35446))
(check-sat b_and!31005 (not b_next!19393))
