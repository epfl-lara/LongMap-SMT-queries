; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83764 () Bool)

(assert start!83764)

(declare-fun b_free!19573 () Bool)

(declare-fun b_next!19573 () Bool)

(assert (=> start!83764 (= b_free!19573 (not b_next!19573))))

(declare-fun tp!68160 () Bool)

(declare-fun b_and!31235 () Bool)

(assert (=> start!83764 (= tp!68160 b_and!31235)))

(declare-fun b!978141 () Bool)

(declare-fun e!551481 () Bool)

(declare-fun tp_is_empty!22567 () Bool)

(assert (=> b!978141 (= e!551481 tp_is_empty!22567)))

(declare-fun b!978142 () Bool)

(declare-fun res!654596 () Bool)

(declare-fun e!551478 () Bool)

(assert (=> b!978142 (=> (not res!654596) (not e!551478))))

(declare-datatypes ((array!61161 0))(
  ( (array!61162 (arr!29438 (Array (_ BitVec 32) (_ BitVec 64))) (size!29917 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61161)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!978142 (= res!654596 (validKeyInArray!0 (select (arr!29438 _keys!1544) from!1932)))))

(declare-fun res!654601 () Bool)

(assert (=> start!83764 (=> (not res!654601) (not e!551478))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83764 (= res!654601 (validMask!0 mask!1948))))

(assert (=> start!83764 e!551478))

(assert (=> start!83764 true))

(assert (=> start!83764 tp_is_empty!22567))

(declare-datatypes ((V!35073 0))(
  ( (V!35074 (val!11334 Int)) )
))
(declare-datatypes ((ValueCell!10802 0))(
  ( (ValueCellFull!10802 (v!13896 V!35073)) (EmptyCell!10802) )
))
(declare-datatypes ((array!61163 0))(
  ( (array!61164 (arr!29439 (Array (_ BitVec 32) ValueCell!10802)) (size!29918 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61163)

(declare-fun e!551479 () Bool)

(declare-fun array_inv!22755 (array!61163) Bool)

(assert (=> start!83764 (and (array_inv!22755 _values!1278) e!551479)))

(assert (=> start!83764 tp!68160))

(declare-fun array_inv!22756 (array!61161) Bool)

(assert (=> start!83764 (array_inv!22756 _keys!1544)))

(declare-fun b!978143 () Bool)

(declare-fun res!654602 () Bool)

(assert (=> b!978143 (=> (not res!654602) (not e!551478))))

(declare-datatypes ((List!20400 0))(
  ( (Nil!20397) (Cons!20396 (h!21558 (_ BitVec 64)) (t!28929 List!20400)) )
))
(declare-fun arrayNoDuplicates!0 (array!61161 (_ BitVec 32) List!20400) Bool)

(assert (=> b!978143 (= res!654602 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20397))))

(declare-fun b!978144 () Bool)

(declare-fun res!654597 () Bool)

(assert (=> b!978144 (=> (not res!654597) (not e!551478))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!978144 (= res!654597 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!978145 () Bool)

(assert (=> b!978145 (= e!551478 (not true))))

(declare-datatypes ((tuple2!14528 0))(
  ( (tuple2!14529 (_1!7275 (_ BitVec 64)) (_2!7275 V!35073)) )
))
(declare-datatypes ((List!20401 0))(
  ( (Nil!20398) (Cons!20397 (h!21559 tuple2!14528) (t!28930 List!20401)) )
))
(declare-datatypes ((ListLongMap!13225 0))(
  ( (ListLongMap!13226 (toList!6628 List!20401)) )
))
(declare-fun lt!433634 () ListLongMap!13225)

(declare-fun lt!433633 () tuple2!14528)

(declare-fun lt!433632 () tuple2!14528)

(declare-fun +!2933 (ListLongMap!13225 tuple2!14528) ListLongMap!13225)

(assert (=> b!978145 (= (+!2933 (+!2933 lt!433634 lt!433633) lt!433632) (+!2933 (+!2933 lt!433634 lt!433632) lt!433633))))

(declare-fun lt!433630 () V!35073)

(assert (=> b!978145 (= lt!433632 (tuple2!14529 (select (arr!29438 _keys!1544) from!1932) lt!433630))))

(declare-fun minValue!1220 () V!35073)

(assert (=> b!978145 (= lt!433633 (tuple2!14529 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32505 0))(
  ( (Unit!32506) )
))
(declare-fun lt!433631 () Unit!32505)

(declare-fun addCommutativeForDiffKeys!561 (ListLongMap!13225 (_ BitVec 64) V!35073 (_ BitVec 64) V!35073) Unit!32505)

(assert (=> b!978145 (= lt!433631 (addCommutativeForDiffKeys!561 lt!433634 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29438 _keys!1544) from!1932) lt!433630))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15238 (ValueCell!10802 V!35073) V!35073)

(declare-fun dynLambda!1721 (Int (_ BitVec 64)) V!35073)

(assert (=> b!978145 (= lt!433630 (get!15238 (select (arr!29439 _values!1278) from!1932) (dynLambda!1721 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35073)

(declare-fun getCurrentListMapNoExtraKeys!3335 (array!61161 array!61163 (_ BitVec 32) (_ BitVec 32) V!35073 V!35073 (_ BitVec 32) Int) ListLongMap!13225)

(assert (=> b!978145 (= lt!433634 (+!2933 (getCurrentListMapNoExtraKeys!3335 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!978146 () Bool)

(declare-fun res!654598 () Bool)

(assert (=> b!978146 (=> (not res!654598) (not e!551478))))

(assert (=> b!978146 (= res!654598 (and (= (size!29918 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29917 _keys!1544) (size!29918 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!35879 () Bool)

(declare-fun mapRes!35879 () Bool)

(assert (=> mapIsEmpty!35879 mapRes!35879))

(declare-fun mapNonEmpty!35879 () Bool)

(declare-fun tp!68161 () Bool)

(assert (=> mapNonEmpty!35879 (= mapRes!35879 (and tp!68161 e!551481))))

(declare-fun mapRest!35879 () (Array (_ BitVec 32) ValueCell!10802))

(declare-fun mapValue!35879 () ValueCell!10802)

(declare-fun mapKey!35879 () (_ BitVec 32))

(assert (=> mapNonEmpty!35879 (= (arr!29439 _values!1278) (store mapRest!35879 mapKey!35879 mapValue!35879))))

(declare-fun b!978147 () Bool)

(declare-fun e!551480 () Bool)

(assert (=> b!978147 (= e!551479 (and e!551480 mapRes!35879))))

(declare-fun condMapEmpty!35879 () Bool)

(declare-fun mapDefault!35879 () ValueCell!10802)

