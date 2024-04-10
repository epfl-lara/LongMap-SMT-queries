; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83794 () Bool)

(assert start!83794)

(declare-fun b_free!19603 () Bool)

(declare-fun b_next!19603 () Bool)

(assert (=> start!83794 (= b_free!19603 (not b_next!19603))))

(declare-fun tp!68251 () Bool)

(declare-fun b_and!31295 () Bool)

(assert (=> start!83794 (= tp!68251 b_and!31295)))

(declare-fun b!978621 () Bool)

(declare-fun e!551702 () Bool)

(assert (=> b!978621 (= e!551702 (not true))))

(declare-datatypes ((V!35113 0))(
  ( (V!35114 (val!11349 Int)) )
))
(declare-datatypes ((tuple2!14554 0))(
  ( (tuple2!14555 (_1!7288 (_ BitVec 64)) (_2!7288 V!35113)) )
))
(declare-datatypes ((List!20425 0))(
  ( (Nil!20422) (Cons!20421 (h!21583 tuple2!14554) (t!28984 List!20425)) )
))
(declare-datatypes ((ListLongMap!13251 0))(
  ( (ListLongMap!13252 (toList!6641 List!20425)) )
))
(declare-fun lt!433858 () ListLongMap!13251)

(declare-fun lt!433856 () tuple2!14554)

(declare-fun lt!433855 () tuple2!14554)

(declare-fun +!2946 (ListLongMap!13251 tuple2!14554) ListLongMap!13251)

(assert (=> b!978621 (= (+!2946 (+!2946 lt!433858 lt!433856) lt!433855) (+!2946 (+!2946 lt!433858 lt!433855) lt!433856))))

(declare-fun lt!433857 () V!35113)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61219 0))(
  ( (array!61220 (arr!29467 (Array (_ BitVec 32) (_ BitVec 64))) (size!29946 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61219)

(assert (=> b!978621 (= lt!433855 (tuple2!14555 (select (arr!29467 _keys!1544) from!1932) lt!433857))))

(declare-fun minValue!1220 () V!35113)

(assert (=> b!978621 (= lt!433856 (tuple2!14555 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32531 0))(
  ( (Unit!32532) )
))
(declare-fun lt!433859 () Unit!32531)

(declare-fun addCommutativeForDiffKeys!574 (ListLongMap!13251 (_ BitVec 64) V!35113 (_ BitVec 64) V!35113) Unit!32531)

(assert (=> b!978621 (= lt!433859 (addCommutativeForDiffKeys!574 lt!433858 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29467 _keys!1544) from!1932) lt!433857))))

(declare-datatypes ((ValueCell!10817 0))(
  ( (ValueCellFull!10817 (v!13911 V!35113)) (EmptyCell!10817) )
))
(declare-datatypes ((array!61221 0))(
  ( (array!61222 (arr!29468 (Array (_ BitVec 32) ValueCell!10817)) (size!29947 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61221)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15261 (ValueCell!10817 V!35113) V!35113)

(declare-fun dynLambda!1734 (Int (_ BitVec 64)) V!35113)

(assert (=> b!978621 (= lt!433857 (get!15261 (select (arr!29468 _values!1278) from!1932) (dynLambda!1734 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35113)

(declare-fun getCurrentListMapNoExtraKeys!3348 (array!61219 array!61221 (_ BitVec 32) (_ BitVec 32) V!35113 V!35113 (_ BitVec 32) Int) ListLongMap!13251)

(assert (=> b!978621 (= lt!433858 (+!2946 (getCurrentListMapNoExtraKeys!3348 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14555 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!978622 () Bool)

(declare-fun res!654915 () Bool)

(assert (=> b!978622 (=> (not res!654915) (not e!551702))))

(assert (=> b!978622 (= res!654915 (and (= (size!29947 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29946 _keys!1544) (size!29947 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!978623 () Bool)

(declare-fun e!551703 () Bool)

(declare-fun tp_is_empty!22597 () Bool)

(assert (=> b!978623 (= e!551703 tp_is_empty!22597)))

(declare-fun b!978624 () Bool)

(declare-fun res!654916 () Bool)

(assert (=> b!978624 (=> (not res!654916) (not e!551702))))

(declare-datatypes ((List!20426 0))(
  ( (Nil!20423) (Cons!20422 (h!21584 (_ BitVec 64)) (t!28985 List!20426)) )
))
(declare-fun arrayNoDuplicates!0 (array!61219 (_ BitVec 32) List!20426) Bool)

(assert (=> b!978624 (= res!654916 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20423))))

(declare-fun b!978625 () Bool)

(declare-fun e!551704 () Bool)

(declare-fun mapRes!35924 () Bool)

(assert (=> b!978625 (= e!551704 (and e!551703 mapRes!35924))))

(declare-fun condMapEmpty!35924 () Bool)

(declare-fun mapDefault!35924 () ValueCell!10817)

