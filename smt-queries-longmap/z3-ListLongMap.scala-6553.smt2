; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83204 () Bool)

(assert start!83204)

(declare-fun b_free!19197 () Bool)

(declare-fun b_next!19197 () Bool)

(assert (=> start!83204 (= b_free!19197 (not b_next!19197))))

(declare-fun tp!66870 () Bool)

(declare-fun b_and!30685 () Bool)

(assert (=> start!83204 (= tp!66870 b_and!30685)))

(declare-fun b!970763 () Bool)

(declare-fun res!649745 () Bool)

(declare-fun e!547279 () Bool)

(assert (=> b!970763 (=> (not res!649745) (not e!547279))))

(declare-datatypes ((array!60245 0))(
  ( (array!60246 (arr!28986 (Array (_ BitVec 32) (_ BitVec 64))) (size!29465 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60245)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!970763 (= res!649745 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29465 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29465 _keys!1717))))))

(declare-fun b!970764 () Bool)

(declare-fun res!649744 () Bool)

(assert (=> b!970764 (=> (not res!649744) (not e!547279))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!970764 (= res!649744 (validKeyInArray!0 (select (arr!28986 _keys!1717) i!822)))))

(declare-fun b!970765 () Bool)

(assert (=> b!970765 (= e!547279 false)))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34443 0))(
  ( (V!34444 (val!11098 Int)) )
))
(declare-datatypes ((ValueCell!10566 0))(
  ( (ValueCellFull!10566 (v!13657 V!34443)) (EmptyCell!10566) )
))
(declare-datatypes ((array!60247 0))(
  ( (array!60248 (arr!28987 (Array (_ BitVec 32) ValueCell!10566)) (size!29466 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60247)

(declare-fun zeroValue!1367 () V!34443)

(declare-fun lt!431774 () Bool)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34443)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14222 0))(
  ( (tuple2!14223 (_1!7122 (_ BitVec 64)) (_2!7122 V!34443)) )
))
(declare-datatypes ((List!20092 0))(
  ( (Nil!20089) (Cons!20088 (h!21250 tuple2!14222) (t!28455 List!20092)) )
))
(declare-datatypes ((ListLongMap!12919 0))(
  ( (ListLongMap!12920 (toList!6475 List!20092)) )
))
(declare-fun contains!5579 (ListLongMap!12919 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3708 (array!60245 array!60247 (_ BitVec 32) (_ BitVec 32) V!34443 V!34443 (_ BitVec 32) Int) ListLongMap!12919)

(assert (=> b!970765 (= lt!431774 (contains!5579 (getCurrentListMap!3708 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28986 _keys!1717) i!822)))))

(declare-fun res!649749 () Bool)

(assert (=> start!83204 (=> (not res!649749) (not e!547279))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83204 (= res!649749 (validMask!0 mask!2147))))

(assert (=> start!83204 e!547279))

(assert (=> start!83204 true))

(declare-fun e!547277 () Bool)

(declare-fun array_inv!22433 (array!60247) Bool)

(assert (=> start!83204 (and (array_inv!22433 _values!1425) e!547277)))

(declare-fun tp_is_empty!22095 () Bool)

(assert (=> start!83204 tp_is_empty!22095))

(assert (=> start!83204 tp!66870))

(declare-fun array_inv!22434 (array!60245) Bool)

(assert (=> start!83204 (array_inv!22434 _keys!1717)))

(declare-fun b!970766 () Bool)

(declare-fun e!547276 () Bool)

(assert (=> b!970766 (= e!547276 tp_is_empty!22095)))

(declare-fun mapNonEmpty!35152 () Bool)

(declare-fun mapRes!35152 () Bool)

(declare-fun tp!66869 () Bool)

(assert (=> mapNonEmpty!35152 (= mapRes!35152 (and tp!66869 e!547276))))

(declare-fun mapRest!35152 () (Array (_ BitVec 32) ValueCell!10566))

(declare-fun mapValue!35152 () ValueCell!10566)

(declare-fun mapKey!35152 () (_ BitVec 32))

(assert (=> mapNonEmpty!35152 (= (arr!28987 _values!1425) (store mapRest!35152 mapKey!35152 mapValue!35152))))

(declare-fun b!970767 () Bool)

(declare-fun res!649747 () Bool)

(assert (=> b!970767 (=> (not res!649747) (not e!547279))))

(assert (=> b!970767 (= res!649747 (and (= (size!29466 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29465 _keys!1717) (size!29466 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!970768 () Bool)

(declare-fun e!547275 () Bool)

(assert (=> b!970768 (= e!547275 tp_is_empty!22095)))

(declare-fun b!970769 () Bool)

(declare-fun res!649746 () Bool)

(assert (=> b!970769 (=> (not res!649746) (not e!547279))))

(declare-datatypes ((List!20093 0))(
  ( (Nil!20090) (Cons!20089 (h!21251 (_ BitVec 64)) (t!28456 List!20093)) )
))
(declare-fun arrayNoDuplicates!0 (array!60245 (_ BitVec 32) List!20093) Bool)

(assert (=> b!970769 (= res!649746 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20090))))

(declare-fun b!970770 () Bool)

(declare-fun res!649748 () Bool)

(assert (=> b!970770 (=> (not res!649748) (not e!547279))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60245 (_ BitVec 32)) Bool)

(assert (=> b!970770 (= res!649748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapIsEmpty!35152 () Bool)

(assert (=> mapIsEmpty!35152 mapRes!35152))

(declare-fun b!970771 () Bool)

(assert (=> b!970771 (= e!547277 (and e!547275 mapRes!35152))))

(declare-fun condMapEmpty!35152 () Bool)

(declare-fun mapDefault!35152 () ValueCell!10566)

(assert (=> b!970771 (= condMapEmpty!35152 (= (arr!28987 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10566)) mapDefault!35152)))))

(assert (= (and start!83204 res!649749) b!970767))

(assert (= (and b!970767 res!649747) b!970770))

(assert (= (and b!970770 res!649748) b!970769))

(assert (= (and b!970769 res!649746) b!970763))

(assert (= (and b!970763 res!649745) b!970764))

(assert (= (and b!970764 res!649744) b!970765))

(assert (= (and b!970771 condMapEmpty!35152) mapIsEmpty!35152))

(assert (= (and b!970771 (not condMapEmpty!35152)) mapNonEmpty!35152))

(get-info :version)

(assert (= (and mapNonEmpty!35152 ((_ is ValueCellFull!10566) mapValue!35152)) b!970766))

(assert (= (and b!970771 ((_ is ValueCellFull!10566) mapDefault!35152)) b!970768))

(assert (= start!83204 b!970771))

(declare-fun m!898407 () Bool)

(assert (=> b!970770 m!898407))

(declare-fun m!898409 () Bool)

(assert (=> mapNonEmpty!35152 m!898409))

(declare-fun m!898411 () Bool)

(assert (=> b!970765 m!898411))

(declare-fun m!898413 () Bool)

(assert (=> b!970765 m!898413))

(assert (=> b!970765 m!898411))

(assert (=> b!970765 m!898413))

(declare-fun m!898415 () Bool)

(assert (=> b!970765 m!898415))

(assert (=> b!970764 m!898413))

(assert (=> b!970764 m!898413))

(declare-fun m!898417 () Bool)

(assert (=> b!970764 m!898417))

(declare-fun m!898419 () Bool)

(assert (=> b!970769 m!898419))

(declare-fun m!898421 () Bool)

(assert (=> start!83204 m!898421))

(declare-fun m!898423 () Bool)

(assert (=> start!83204 m!898423))

(declare-fun m!898425 () Bool)

(assert (=> start!83204 m!898425))

(check-sat (not b_next!19197) (not b!970769) (not b!970764) (not mapNonEmpty!35152) (not b!970770) tp_is_empty!22095 (not b!970765) (not start!83204) b_and!30685)
(check-sat b_and!30685 (not b_next!19197))
