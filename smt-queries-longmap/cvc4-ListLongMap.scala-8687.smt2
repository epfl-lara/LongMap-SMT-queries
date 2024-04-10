; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105524 () Bool)

(assert start!105524)

(declare-fun b_free!27161 () Bool)

(declare-fun b_next!27161 () Bool)

(assert (=> start!105524 (= b_free!27161 (not b_next!27161))))

(declare-fun tp!95000 () Bool)

(declare-fun b_and!45017 () Bool)

(assert (=> start!105524 (= tp!95000 b_and!45017)))

(declare-fun b!1257247 () Bool)

(declare-fun e!714887 () Bool)

(declare-fun tp_is_empty!32063 () Bool)

(assert (=> b!1257247 (= e!714887 tp_is_empty!32063)))

(declare-fun b!1257248 () Bool)

(declare-fun e!714885 () Bool)

(declare-fun e!714886 () Bool)

(assert (=> b!1257248 (= e!714885 e!714886)))

(declare-fun res!838111 () Bool)

(assert (=> b!1257248 (=> res!838111 e!714886)))

(declare-datatypes ((V!48115 0))(
  ( (V!48116 (val!16094 Int)) )
))
(declare-datatypes ((tuple2!20794 0))(
  ( (tuple2!20795 (_1!10408 (_ BitVec 64)) (_2!10408 V!48115)) )
))
(declare-datatypes ((List!28008 0))(
  ( (Nil!28005) (Cons!28004 (h!29213 tuple2!20794) (t!41497 List!28008)) )
))
(declare-datatypes ((ListLongMap!18667 0))(
  ( (ListLongMap!18668 (toList!9349 List!28008)) )
))
(declare-fun lt!568607 () ListLongMap!18667)

(declare-fun contains!7565 (ListLongMap!18667 (_ BitVec 64)) Bool)

(assert (=> b!1257248 (= res!838111 (contains!7565 lt!568607 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48115)

(declare-datatypes ((array!81760 0))(
  ( (array!81761 (arr!39438 (Array (_ BitVec 32) (_ BitVec 64))) (size!39974 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81760)

(declare-datatypes ((ValueCell!15268 0))(
  ( (ValueCellFull!15268 (v!18795 V!48115)) (EmptyCell!15268) )
))
(declare-datatypes ((array!81762 0))(
  ( (array!81763 (arr!39439 (Array (_ BitVec 32) ValueCell!15268)) (size!39975 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81762)

(declare-fun minValueBefore!43 () V!48115)

(declare-fun getCurrentListMap!4570 (array!81760 array!81762 (_ BitVec 32) (_ BitVec 32) V!48115 V!48115 (_ BitVec 32) Int) ListLongMap!18667)

(assert (=> b!1257248 (= lt!568607 (getCurrentListMap!4570 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1257249 () Bool)

(declare-fun e!714890 () Bool)

(declare-fun e!714891 () Bool)

(declare-fun mapRes!49882 () Bool)

(assert (=> b!1257249 (= e!714890 (and e!714891 mapRes!49882))))

(declare-fun condMapEmpty!49882 () Bool)

(declare-fun mapDefault!49882 () ValueCell!15268)

