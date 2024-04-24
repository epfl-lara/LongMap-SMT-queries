; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83706 () Bool)

(assert start!83706)

(declare-fun b_free!19525 () Bool)

(declare-fun b_next!19525 () Bool)

(assert (=> start!83706 (= b_free!19525 (not b_next!19525))))

(declare-fun tp!67864 () Bool)

(declare-fun b_and!31155 () Bool)

(assert (=> start!83706 (= tp!67864 b_and!31155)))

(declare-fun b!976986 () Bool)

(declare-fun res!653774 () Bool)

(declare-fun e!550666 () Bool)

(assert (=> b!976986 (=> (not res!653774) (not e!550666))))

(declare-datatypes ((array!60926 0))(
  ( (array!60927 (arr!29322 (Array (_ BitVec 32) (_ BitVec 64))) (size!29802 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60926)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!976986 (= res!653774 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29802 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29802 _keys!1717))))))

(declare-fun b!976987 () Bool)

(declare-fun res!653779 () Bool)

(assert (=> b!976987 (=> (not res!653779) (not e!550666))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60926 (_ BitVec 32)) Bool)

(assert (=> b!976987 (= res!653779 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!976988 () Bool)

(declare-fun e!550662 () Bool)

(assert (=> b!976988 (= e!550666 e!550662)))

(declare-fun res!653777 () Bool)

(assert (=> b!976988 (=> (not res!653777) (not e!550662))))

(declare-fun lt!433344 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!976988 (= res!653777 (validKeyInArray!0 lt!433344))))

(assert (=> b!976988 (= lt!433344 (select (arr!29322 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-datatypes ((V!34889 0))(
  ( (V!34890 (val!11265 Int)) )
))
(declare-datatypes ((ValueCell!10733 0))(
  ( (ValueCellFull!10733 (v!13821 V!34889)) (EmptyCell!10733) )
))
(declare-datatypes ((array!60928 0))(
  ( (array!60929 (arr!29323 (Array (_ BitVec 32) ValueCell!10733)) (size!29803 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60928)

(declare-fun zeroValue!1367 () V!34889)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34889)

(declare-datatypes ((tuple2!14498 0))(
  ( (tuple2!14499 (_1!7260 (_ BitVec 64)) (_2!7260 V!34889)) )
))
(declare-datatypes ((List!20342 0))(
  ( (Nil!20339) (Cons!20338 (h!21506 tuple2!14498) (t!28831 List!20342)) )
))
(declare-datatypes ((ListLongMap!13197 0))(
  ( (ListLongMap!13198 (toList!6614 List!20342)) )
))
(declare-fun lt!433342 () ListLongMap!13197)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3847 (array!60926 array!60928 (_ BitVec 32) (_ BitVec 32) V!34889 V!34889 (_ BitVec 32) Int) ListLongMap!13197)

(assert (=> b!976988 (= lt!433342 (getCurrentListMap!3847 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!976989 () Bool)

(declare-fun e!550661 () Bool)

(declare-fun tp_is_empty!22429 () Bool)

(assert (=> b!976989 (= e!550661 tp_is_empty!22429)))

(declare-fun b!976990 () Bool)

(assert (=> b!976990 (= e!550662 (not true))))

(declare-fun +!2932 (ListLongMap!13197 tuple2!14498) ListLongMap!13197)

(declare-fun get!15201 (ValueCell!10733 V!34889) V!34889)

(declare-fun dynLambda!1729 (Int (_ BitVec 64)) V!34889)

(assert (=> b!976990 (= lt!433342 (+!2932 (getCurrentListMap!3847 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14499 lt!433344 (get!15201 (select (arr!29323 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1729 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32428 0))(
  ( (Unit!32429) )
))
(declare-fun lt!433343 () Unit!32428)

(declare-fun lemmaListMapRecursiveValidKeyArray!288 (array!60926 array!60928 (_ BitVec 32) (_ BitVec 32) V!34889 V!34889 (_ BitVec 32) Int) Unit!32428)

(assert (=> b!976990 (= lt!433343 (lemmaListMapRecursiveValidKeyArray!288 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!976991 () Bool)

(declare-fun e!550665 () Bool)

(assert (=> b!976991 (= e!550665 tp_is_empty!22429)))

(declare-fun b!976992 () Bool)

(declare-fun res!653775 () Bool)

(assert (=> b!976992 (=> (not res!653775) (not e!550666))))

(declare-fun contains!5712 (ListLongMap!13197 (_ BitVec 64)) Bool)

(assert (=> b!976992 (= res!653775 (contains!5712 (getCurrentListMap!3847 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29322 _keys!1717) i!822)))))

(declare-fun b!976993 () Bool)

(declare-fun res!653776 () Bool)

(assert (=> b!976993 (=> (not res!653776) (not e!550666))))

(assert (=> b!976993 (= res!653776 (and (= (size!29803 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29802 _keys!1717) (size!29803 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!976994 () Bool)

(declare-fun e!550663 () Bool)

(declare-fun mapRes!35653 () Bool)

(assert (=> b!976994 (= e!550663 (and e!550661 mapRes!35653))))

(declare-fun condMapEmpty!35653 () Bool)

(declare-fun mapDefault!35653 () ValueCell!10733)

(assert (=> b!976994 (= condMapEmpty!35653 (= (arr!29323 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10733)) mapDefault!35653)))))

(declare-fun b!976995 () Bool)

(declare-fun res!653773 () Bool)

(assert (=> b!976995 (=> (not res!653773) (not e!550666))))

(assert (=> b!976995 (= res!653773 (validKeyInArray!0 (select (arr!29322 _keys!1717) i!822)))))

(declare-fun res!653780 () Bool)

(assert (=> start!83706 (=> (not res!653780) (not e!550666))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83706 (= res!653780 (validMask!0 mask!2147))))

(assert (=> start!83706 e!550666))

(assert (=> start!83706 true))

(declare-fun array_inv!22731 (array!60928) Bool)

(assert (=> start!83706 (and (array_inv!22731 _values!1425) e!550663)))

(assert (=> start!83706 tp_is_empty!22429))

(assert (=> start!83706 tp!67864))

(declare-fun array_inv!22732 (array!60926) Bool)

(assert (=> start!83706 (array_inv!22732 _keys!1717)))

(declare-fun mapNonEmpty!35653 () Bool)

(declare-fun tp!67863 () Bool)

(assert (=> mapNonEmpty!35653 (= mapRes!35653 (and tp!67863 e!550665))))

(declare-fun mapRest!35653 () (Array (_ BitVec 32) ValueCell!10733))

(declare-fun mapKey!35653 () (_ BitVec 32))

(declare-fun mapValue!35653 () ValueCell!10733)

(assert (=> mapNonEmpty!35653 (= (arr!29323 _values!1425) (store mapRest!35653 mapKey!35653 mapValue!35653))))

(declare-fun b!976996 () Bool)

(declare-fun res!653778 () Bool)

(assert (=> b!976996 (=> (not res!653778) (not e!550666))))

(declare-datatypes ((List!20343 0))(
  ( (Nil!20340) (Cons!20339 (h!21507 (_ BitVec 64)) (t!28832 List!20343)) )
))
(declare-fun arrayNoDuplicates!0 (array!60926 (_ BitVec 32) List!20343) Bool)

(assert (=> b!976996 (= res!653778 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20340))))

(declare-fun mapIsEmpty!35653 () Bool)

(assert (=> mapIsEmpty!35653 mapRes!35653))

(assert (= (and start!83706 res!653780) b!976993))

(assert (= (and b!976993 res!653776) b!976987))

(assert (= (and b!976987 res!653779) b!976996))

(assert (= (and b!976996 res!653778) b!976986))

(assert (= (and b!976986 res!653774) b!976995))

(assert (= (and b!976995 res!653773) b!976992))

(assert (= (and b!976992 res!653775) b!976988))

(assert (= (and b!976988 res!653777) b!976990))

(assert (= (and b!976994 condMapEmpty!35653) mapIsEmpty!35653))

(assert (= (and b!976994 (not condMapEmpty!35653)) mapNonEmpty!35653))

(get-info :version)

(assert (= (and mapNonEmpty!35653 ((_ is ValueCellFull!10733) mapValue!35653)) b!976991))

(assert (= (and b!976994 ((_ is ValueCellFull!10733) mapDefault!35653)) b!976989))

(assert (= start!83706 b!976994))

(declare-fun b_lambda!14577 () Bool)

(assert (=> (not b_lambda!14577) (not b!976990)))

(declare-fun t!28830 () Bool)

(declare-fun tb!6339 () Bool)

(assert (=> (and start!83706 (= defaultEntry!1428 defaultEntry!1428) t!28830) tb!6339))

(declare-fun result!12663 () Bool)

(assert (=> tb!6339 (= result!12663 tp_is_empty!22429)))

(assert (=> b!976990 t!28830))

(declare-fun b_and!31157 () Bool)

(assert (= b_and!31155 (and (=> t!28830 result!12663) b_and!31157)))

(declare-fun m!904565 () Bool)

(assert (=> b!976987 m!904565))

(declare-fun m!904567 () Bool)

(assert (=> b!976992 m!904567))

(declare-fun m!904569 () Bool)

(assert (=> b!976992 m!904569))

(assert (=> b!976992 m!904567))

(assert (=> b!976992 m!904569))

(declare-fun m!904571 () Bool)

(assert (=> b!976992 m!904571))

(declare-fun m!904573 () Bool)

(assert (=> mapNonEmpty!35653 m!904573))

(assert (=> b!976995 m!904569))

(assert (=> b!976995 m!904569))

(declare-fun m!904575 () Bool)

(assert (=> b!976995 m!904575))

(declare-fun m!904577 () Bool)

(assert (=> b!976988 m!904577))

(declare-fun m!904579 () Bool)

(assert (=> b!976988 m!904579))

(declare-fun m!904581 () Bool)

(assert (=> b!976988 m!904581))

(declare-fun m!904583 () Bool)

(assert (=> start!83706 m!904583))

(declare-fun m!904585 () Bool)

(assert (=> start!83706 m!904585))

(declare-fun m!904587 () Bool)

(assert (=> start!83706 m!904587))

(declare-fun m!904589 () Bool)

(assert (=> b!976990 m!904589))

(declare-fun m!904591 () Bool)

(assert (=> b!976990 m!904591))

(declare-fun m!904593 () Bool)

(assert (=> b!976990 m!904593))

(assert (=> b!976990 m!904591))

(declare-fun m!904595 () Bool)

(assert (=> b!976990 m!904595))

(assert (=> b!976990 m!904589))

(assert (=> b!976990 m!904593))

(declare-fun m!904597 () Bool)

(assert (=> b!976990 m!904597))

(declare-fun m!904599 () Bool)

(assert (=> b!976990 m!904599))

(declare-fun m!904601 () Bool)

(assert (=> b!976996 m!904601))

(check-sat (not b!976990) (not b!976996) (not b_next!19525) (not mapNonEmpty!35653) (not b!976992) (not b!976987) (not b!976995) (not b_lambda!14577) (not start!83706) (not b!976988) tp_is_empty!22429 b_and!31157)
(check-sat b_and!31157 (not b_next!19525))
