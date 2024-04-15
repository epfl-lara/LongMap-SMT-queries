; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83214 () Bool)

(assert start!83214)

(declare-fun b_free!19225 () Bool)

(declare-fun b_next!19225 () Bool)

(assert (=> start!83214 (= b_free!19225 (not b_next!19225))))

(declare-fun tp!66955 () Bool)

(declare-fun b_and!30687 () Bool)

(assert (=> start!83214 (= tp!66955 b_and!30687)))

(declare-fun b!970940 () Bool)

(declare-fun res!649926 () Bool)

(declare-fun e!547337 () Bool)

(assert (=> b!970940 (=> (not res!649926) (not e!547337))))

(declare-datatypes ((array!60230 0))(
  ( (array!60231 (arr!28979 (Array (_ BitVec 32) (_ BitVec 64))) (size!29460 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60230)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!970940 (= res!649926 (validKeyInArray!0 (select (arr!28979 _keys!1717) i!822)))))

(declare-fun b!970941 () Bool)

(declare-fun res!649925 () Bool)

(assert (=> b!970941 (=> (not res!649925) (not e!547337))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34481 0))(
  ( (V!34482 (val!11112 Int)) )
))
(declare-datatypes ((ValueCell!10580 0))(
  ( (ValueCellFull!10580 (v!13670 V!34481)) (EmptyCell!10580) )
))
(declare-datatypes ((array!60232 0))(
  ( (array!60233 (arr!28980 (Array (_ BitVec 32) ValueCell!10580)) (size!29461 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60232)

(declare-fun zeroValue!1367 () V!34481)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34481)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14326 0))(
  ( (tuple2!14327 (_1!7174 (_ BitVec 64)) (_2!7174 V!34481)) )
))
(declare-datatypes ((List!20144 0))(
  ( (Nil!20141) (Cons!20140 (h!21302 tuple2!14326) (t!28498 List!20144)) )
))
(declare-datatypes ((ListLongMap!13013 0))(
  ( (ListLongMap!13014 (toList!6522 List!20144)) )
))
(declare-fun contains!5569 (ListLongMap!13013 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3684 (array!60230 array!60232 (_ BitVec 32) (_ BitVec 32) V!34481 V!34481 (_ BitVec 32) Int) ListLongMap!13013)

(assert (=> b!970941 (= res!649925 (contains!5569 (getCurrentListMap!3684 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28979 _keys!1717) i!822)))))

(declare-fun b!970942 () Bool)

(declare-fun e!547338 () Bool)

(declare-fun tp_is_empty!22123 () Bool)

(assert (=> b!970942 (= e!547338 tp_is_empty!22123)))

(declare-fun b!970943 () Bool)

(declare-fun res!649928 () Bool)

(assert (=> b!970943 (=> (not res!649928) (not e!547337))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60230 (_ BitVec 32)) Bool)

(assert (=> b!970943 (= res!649928 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!970944 () Bool)

(declare-fun res!649930 () Bool)

(assert (=> b!970944 (=> (not res!649930) (not e!547337))))

(assert (=> b!970944 (= res!649930 (and (= (size!29461 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29460 _keys!1717) (size!29461 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!35194 () Bool)

(declare-fun mapRes!35194 () Bool)

(assert (=> mapIsEmpty!35194 mapRes!35194))

(declare-fun b!970945 () Bool)

(declare-fun res!649924 () Bool)

(assert (=> b!970945 (=> (not res!649924) (not e!547337))))

(declare-datatypes ((List!20145 0))(
  ( (Nil!20142) (Cons!20141 (h!21303 (_ BitVec 64)) (t!28499 List!20145)) )
))
(declare-fun arrayNoDuplicates!0 (array!60230 (_ BitVec 32) List!20145) Bool)

(assert (=> b!970945 (= res!649924 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20142))))

(declare-fun b!970946 () Bool)

(declare-fun res!649929 () Bool)

(assert (=> b!970946 (=> (not res!649929) (not e!547337))))

(assert (=> b!970946 (= res!649929 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29460 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29460 _keys!1717))))))

(declare-fun b!970947 () Bool)

(assert (=> b!970947 (= e!547337 false)))

(declare-fun lt!431571 () ListLongMap!13013)

(assert (=> b!970947 (= lt!431571 (getCurrentListMap!3684 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun res!649927 () Bool)

(assert (=> start!83214 (=> (not res!649927) (not e!547337))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83214 (= res!649927 (validMask!0 mask!2147))))

(assert (=> start!83214 e!547337))

(assert (=> start!83214 true))

(declare-fun e!547340 () Bool)

(declare-fun array_inv!22493 (array!60232) Bool)

(assert (=> start!83214 (and (array_inv!22493 _values!1425) e!547340)))

(assert (=> start!83214 tp_is_empty!22123))

(assert (=> start!83214 tp!66955))

(declare-fun array_inv!22494 (array!60230) Bool)

(assert (=> start!83214 (array_inv!22494 _keys!1717)))

(declare-fun mapNonEmpty!35194 () Bool)

(declare-fun tp!66954 () Bool)

(assert (=> mapNonEmpty!35194 (= mapRes!35194 (and tp!66954 e!547338))))

(declare-fun mapKey!35194 () (_ BitVec 32))

(declare-fun mapRest!35194 () (Array (_ BitVec 32) ValueCell!10580))

(declare-fun mapValue!35194 () ValueCell!10580)

(assert (=> mapNonEmpty!35194 (= (arr!28980 _values!1425) (store mapRest!35194 mapKey!35194 mapValue!35194))))

(declare-fun b!970948 () Bool)

(declare-fun e!547339 () Bool)

(assert (=> b!970948 (= e!547339 tp_is_empty!22123)))

(declare-fun b!970949 () Bool)

(assert (=> b!970949 (= e!547340 (and e!547339 mapRes!35194))))

(declare-fun condMapEmpty!35194 () Bool)

(declare-fun mapDefault!35194 () ValueCell!10580)

(assert (=> b!970949 (= condMapEmpty!35194 (= (arr!28980 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10580)) mapDefault!35194)))))

(assert (= (and start!83214 res!649927) b!970944))

(assert (= (and b!970944 res!649930) b!970943))

(assert (= (and b!970943 res!649928) b!970945))

(assert (= (and b!970945 res!649924) b!970946))

(assert (= (and b!970946 res!649929) b!970940))

(assert (= (and b!970940 res!649926) b!970941))

(assert (= (and b!970941 res!649925) b!970947))

(assert (= (and b!970949 condMapEmpty!35194) mapIsEmpty!35194))

(assert (= (and b!970949 (not condMapEmpty!35194)) mapNonEmpty!35194))

(get-info :version)

(assert (= (and mapNonEmpty!35194 ((_ is ValueCellFull!10580) mapValue!35194)) b!970942))

(assert (= (and b!970949 ((_ is ValueCellFull!10580) mapDefault!35194)) b!970948))

(assert (= start!83214 b!970949))

(declare-fun m!897947 () Bool)

(assert (=> b!970940 m!897947))

(assert (=> b!970940 m!897947))

(declare-fun m!897949 () Bool)

(assert (=> b!970940 m!897949))

(declare-fun m!897951 () Bool)

(assert (=> b!970945 m!897951))

(declare-fun m!897953 () Bool)

(assert (=> mapNonEmpty!35194 m!897953))

(declare-fun m!897955 () Bool)

(assert (=> b!970941 m!897955))

(assert (=> b!970941 m!897947))

(assert (=> b!970941 m!897955))

(assert (=> b!970941 m!897947))

(declare-fun m!897957 () Bool)

(assert (=> b!970941 m!897957))

(declare-fun m!897959 () Bool)

(assert (=> b!970947 m!897959))

(declare-fun m!897961 () Bool)

(assert (=> b!970943 m!897961))

(declare-fun m!897963 () Bool)

(assert (=> start!83214 m!897963))

(declare-fun m!897965 () Bool)

(assert (=> start!83214 m!897965))

(declare-fun m!897967 () Bool)

(assert (=> start!83214 m!897967))

(check-sat (not mapNonEmpty!35194) (not b!970945) (not b_next!19225) (not b!970941) (not b!970943) (not start!83214) tp_is_empty!22123 b_and!30687 (not b!970940) (not b!970947))
(check-sat b_and!30687 (not b_next!19225))
