; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83394 () Bool)

(assert start!83394)

(declare-fun b_free!19405 () Bool)

(declare-fun b_next!19405 () Bool)

(assert (=> start!83394 (= b_free!19405 (not b_next!19405))))

(declare-fun tp!67495 () Bool)

(declare-fun b_and!30981 () Bool)

(assert (=> start!83394 (= tp!67495 b_and!30981)))

(declare-fun b!973925 () Bool)

(declare-fun res!651988 () Bool)

(declare-fun e!548940 () Bool)

(assert (=> b!973925 (=> (not res!651988) (not e!548940))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34721 0))(
  ( (V!34722 (val!11202 Int)) )
))
(declare-datatypes ((ValueCell!10670 0))(
  ( (ValueCellFull!10670 (v!13760 V!34721)) (EmptyCell!10670) )
))
(declare-datatypes ((array!60574 0))(
  ( (array!60575 (arr!29151 (Array (_ BitVec 32) ValueCell!10670)) (size!29632 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60574)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60576 0))(
  ( (array!60577 (arr!29152 (Array (_ BitVec 32) (_ BitVec 64))) (size!29633 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60576)

(assert (=> b!973925 (= res!651988 (and (= (size!29632 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29633 _keys!1717) (size!29632 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!973926 () Bool)

(declare-fun res!651990 () Bool)

(assert (=> b!973926 (=> (not res!651990) (not e!548940))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!973926 (= res!651990 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29633 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29633 _keys!1717))))))

(declare-fun b!973927 () Bool)

(declare-fun res!651985 () Bool)

(assert (=> b!973927 (=> (not res!651985) (not e!548940))))

(declare-fun zeroValue!1367 () V!34721)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34721)

(declare-datatypes ((tuple2!14466 0))(
  ( (tuple2!14467 (_1!7244 (_ BitVec 64)) (_2!7244 V!34721)) )
))
(declare-datatypes ((List!20270 0))(
  ( (Nil!20267) (Cons!20266 (h!21428 tuple2!14466) (t!28738 List!20270)) )
))
(declare-datatypes ((ListLongMap!13153 0))(
  ( (ListLongMap!13154 (toList!6592 List!20270)) )
))
(declare-fun contains!5631 (ListLongMap!13153 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3754 (array!60576 array!60574 (_ BitVec 32) (_ BitVec 32) V!34721 V!34721 (_ BitVec 32) Int) ListLongMap!13153)

(assert (=> b!973927 (= res!651985 (contains!5631 (getCurrentListMap!3754 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29152 _keys!1717) i!822)))))

(declare-fun b!973928 () Bool)

(declare-fun e!548942 () Bool)

(declare-fun tp_is_empty!22303 () Bool)

(assert (=> b!973928 (= e!548942 tp_is_empty!22303)))

(declare-fun b!973929 () Bool)

(assert (=> b!973929 (= e!548940 false)))

(declare-fun lt!432507 () ListLongMap!13153)

(assert (=> b!973929 (= lt!432507 (getCurrentListMap!3754 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973930 () Bool)

(declare-fun res!651989 () Bool)

(assert (=> b!973930 (=> (not res!651989) (not e!548940))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973930 (= res!651989 (validKeyInArray!0 (select (arr!29152 _keys!1717) i!822)))))

(declare-fun b!973931 () Bool)

(declare-fun e!548941 () Bool)

(assert (=> b!973931 (= e!548941 tp_is_empty!22303)))

(declare-fun b!973932 () Bool)

(declare-fun e!548943 () Bool)

(declare-fun mapRes!35464 () Bool)

(assert (=> b!973932 (= e!548943 (and e!548941 mapRes!35464))))

(declare-fun condMapEmpty!35464 () Bool)

(declare-fun mapDefault!35464 () ValueCell!10670)

(assert (=> b!973932 (= condMapEmpty!35464 (= (arr!29151 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10670)) mapDefault!35464)))))

(declare-fun res!651987 () Bool)

(assert (=> start!83394 (=> (not res!651987) (not e!548940))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83394 (= res!651987 (validMask!0 mask!2147))))

(assert (=> start!83394 e!548940))

(assert (=> start!83394 true))

(declare-fun array_inv!22601 (array!60574) Bool)

(assert (=> start!83394 (and (array_inv!22601 _values!1425) e!548943)))

(assert (=> start!83394 tp_is_empty!22303))

(assert (=> start!83394 tp!67495))

(declare-fun array_inv!22602 (array!60576) Bool)

(assert (=> start!83394 (array_inv!22602 _keys!1717)))

(declare-fun mapIsEmpty!35464 () Bool)

(assert (=> mapIsEmpty!35464 mapRes!35464))

(declare-fun b!973933 () Bool)

(declare-fun res!651991 () Bool)

(assert (=> b!973933 (=> (not res!651991) (not e!548940))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60576 (_ BitVec 32)) Bool)

(assert (=> b!973933 (= res!651991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!973934 () Bool)

(declare-fun res!651986 () Bool)

(assert (=> b!973934 (=> (not res!651986) (not e!548940))))

(declare-datatypes ((List!20271 0))(
  ( (Nil!20268) (Cons!20267 (h!21429 (_ BitVec 64)) (t!28739 List!20271)) )
))
(declare-fun arrayNoDuplicates!0 (array!60576 (_ BitVec 32) List!20271) Bool)

(assert (=> b!973934 (= res!651986 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20268))))

(declare-fun mapNonEmpty!35464 () Bool)

(declare-fun tp!67494 () Bool)

(assert (=> mapNonEmpty!35464 (= mapRes!35464 (and tp!67494 e!548942))))

(declare-fun mapValue!35464 () ValueCell!10670)

(declare-fun mapRest!35464 () (Array (_ BitVec 32) ValueCell!10670))

(declare-fun mapKey!35464 () (_ BitVec 32))

(assert (=> mapNonEmpty!35464 (= (arr!29151 _values!1425) (store mapRest!35464 mapKey!35464 mapValue!35464))))

(assert (= (and start!83394 res!651987) b!973925))

(assert (= (and b!973925 res!651988) b!973933))

(assert (= (and b!973933 res!651991) b!973934))

(assert (= (and b!973934 res!651986) b!973926))

(assert (= (and b!973926 res!651990) b!973930))

(assert (= (and b!973930 res!651989) b!973927))

(assert (= (and b!973927 res!651985) b!973929))

(assert (= (and b!973932 condMapEmpty!35464) mapIsEmpty!35464))

(assert (= (and b!973932 (not condMapEmpty!35464)) mapNonEmpty!35464))

(get-info :version)

(assert (= (and mapNonEmpty!35464 ((_ is ValueCellFull!10670) mapValue!35464)) b!973928))

(assert (= (and b!973932 ((_ is ValueCellFull!10670) mapDefault!35464)) b!973931))

(assert (= start!83394 b!973932))

(declare-fun m!901001 () Bool)

(assert (=> b!973929 m!901001))

(declare-fun m!901003 () Bool)

(assert (=> b!973933 m!901003))

(declare-fun m!901005 () Bool)

(assert (=> b!973930 m!901005))

(assert (=> b!973930 m!901005))

(declare-fun m!901007 () Bool)

(assert (=> b!973930 m!901007))

(declare-fun m!901009 () Bool)

(assert (=> b!973927 m!901009))

(assert (=> b!973927 m!901005))

(assert (=> b!973927 m!901009))

(assert (=> b!973927 m!901005))

(declare-fun m!901011 () Bool)

(assert (=> b!973927 m!901011))

(declare-fun m!901013 () Bool)

(assert (=> start!83394 m!901013))

(declare-fun m!901015 () Bool)

(assert (=> start!83394 m!901015))

(declare-fun m!901017 () Bool)

(assert (=> start!83394 m!901017))

(declare-fun m!901019 () Bool)

(assert (=> mapNonEmpty!35464 m!901019))

(declare-fun m!901021 () Bool)

(assert (=> b!973934 m!901021))

(check-sat (not b_next!19405) (not b!973933) (not b!973929) (not b!973930) (not b!973934) (not b!973927) tp_is_empty!22303 (not mapNonEmpty!35464) (not start!83394) b_and!30981)
(check-sat b_and!30981 (not b_next!19405))
