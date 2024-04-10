; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83482 () Bool)

(assert start!83482)

(declare-fun b_free!19469 () Bool)

(declare-fun b_next!19469 () Bool)

(assert (=> start!83482 (= b_free!19469 (not b_next!19469))))

(declare-fun tp!67694 () Bool)

(declare-fun b_and!31071 () Bool)

(assert (=> start!83482 (= tp!67694 b_and!31071)))

(declare-fun b!975187 () Bool)

(declare-fun res!652806 () Bool)

(declare-fun e!549624 () Bool)

(assert (=> b!975187 (=> (not res!652806) (not e!549624))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34813 0))(
  ( (V!34814 (val!11237 Int)) )
))
(declare-datatypes ((ValueCell!10705 0))(
  ( (ValueCellFull!10705 (v!13796 V!34813)) (EmptyCell!10705) )
))
(declare-datatypes ((array!60777 0))(
  ( (array!60778 (arr!29252 (Array (_ BitVec 32) ValueCell!10705)) (size!29731 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60777)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60779 0))(
  ( (array!60780 (arr!29253 (Array (_ BitVec 32) (_ BitVec 64))) (size!29732 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60779)

(assert (=> b!975187 (= res!652806 (and (= (size!29731 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29732 _keys!1717) (size!29731 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!975188 () Bool)

(declare-fun e!549625 () Bool)

(declare-fun tp_is_empty!22373 () Bool)

(assert (=> b!975188 (= e!549625 tp_is_empty!22373)))

(declare-fun mapIsEmpty!35569 () Bool)

(declare-fun mapRes!35569 () Bool)

(assert (=> mapIsEmpty!35569 mapRes!35569))

(declare-fun res!652803 () Bool)

(assert (=> start!83482 (=> (not res!652803) (not e!549624))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83482 (= res!652803 (validMask!0 mask!2147))))

(assert (=> start!83482 e!549624))

(assert (=> start!83482 true))

(declare-fun e!549623 () Bool)

(declare-fun array_inv!22621 (array!60777) Bool)

(assert (=> start!83482 (and (array_inv!22621 _values!1425) e!549623)))

(assert (=> start!83482 tp_is_empty!22373))

(assert (=> start!83482 tp!67694))

(declare-fun array_inv!22622 (array!60779) Bool)

(assert (=> start!83482 (array_inv!22622 _keys!1717)))

(declare-fun mapNonEmpty!35569 () Bool)

(declare-fun tp!67695 () Bool)

(declare-fun e!549622 () Bool)

(assert (=> mapNonEmpty!35569 (= mapRes!35569 (and tp!67695 e!549622))))

(declare-fun mapRest!35569 () (Array (_ BitVec 32) ValueCell!10705))

(declare-fun mapKey!35569 () (_ BitVec 32))

(declare-fun mapValue!35569 () ValueCell!10705)

(assert (=> mapNonEmpty!35569 (= (arr!29252 _values!1425) (store mapRest!35569 mapKey!35569 mapValue!35569))))

(declare-fun b!975189 () Bool)

(assert (=> b!975189 (= e!549624 false)))

(declare-fun zeroValue!1367 () V!34813)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34813)

(declare-datatypes ((tuple2!14446 0))(
  ( (tuple2!14447 (_1!7234 (_ BitVec 64)) (_2!7234 V!34813)) )
))
(declare-datatypes ((List!20298 0))(
  ( (Nil!20295) (Cons!20294 (h!21456 tuple2!14446) (t!28775 List!20298)) )
))
(declare-datatypes ((ListLongMap!13143 0))(
  ( (ListLongMap!13144 (toList!6587 List!20298)) )
))
(declare-fun lt!432839 () ListLongMap!13143)

(declare-fun getCurrentListMap!3820 (array!60779 array!60777 (_ BitVec 32) (_ BitVec 32) V!34813 V!34813 (_ BitVec 32) Int) ListLongMap!13143)

(assert (=> b!975189 (= lt!432839 (getCurrentListMap!3820 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!975190 () Bool)

(declare-fun res!652805 () Bool)

(assert (=> b!975190 (=> (not res!652805) (not e!549624))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!975190 (= res!652805 (validKeyInArray!0 (select (arr!29253 _keys!1717) i!822)))))

(declare-fun b!975191 () Bool)

(declare-fun res!652804 () Bool)

(assert (=> b!975191 (=> (not res!652804) (not e!549624))))

(declare-datatypes ((List!20299 0))(
  ( (Nil!20296) (Cons!20295 (h!21457 (_ BitVec 64)) (t!28776 List!20299)) )
))
(declare-fun arrayNoDuplicates!0 (array!60779 (_ BitVec 32) List!20299) Bool)

(assert (=> b!975191 (= res!652804 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20296))))

(declare-fun b!975192 () Bool)

(assert (=> b!975192 (= e!549622 tp_is_empty!22373)))

(declare-fun b!975193 () Bool)

(declare-fun res!652809 () Bool)

(assert (=> b!975193 (=> (not res!652809) (not e!549624))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60779 (_ BitVec 32)) Bool)

(assert (=> b!975193 (= res!652809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!975194 () Bool)

(declare-fun res!652807 () Bool)

(assert (=> b!975194 (=> (not res!652807) (not e!549624))))

(assert (=> b!975194 (= res!652807 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29732 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29732 _keys!1717))))))

(declare-fun b!975195 () Bool)

(declare-fun res!652808 () Bool)

(assert (=> b!975195 (=> (not res!652808) (not e!549624))))

(declare-fun contains!5669 (ListLongMap!13143 (_ BitVec 64)) Bool)

(assert (=> b!975195 (= res!652808 (contains!5669 (getCurrentListMap!3820 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29253 _keys!1717) i!822)))))

(declare-fun b!975196 () Bool)

(assert (=> b!975196 (= e!549623 (and e!549625 mapRes!35569))))

(declare-fun condMapEmpty!35569 () Bool)

(declare-fun mapDefault!35569 () ValueCell!10705)

