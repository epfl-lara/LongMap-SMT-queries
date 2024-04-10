; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108066 () Bool)

(assert start!108066)

(declare-fun b_free!27779 () Bool)

(declare-fun b_next!27779 () Bool)

(assert (=> start!108066 (= b_free!27779 (not b_next!27779))))

(declare-fun tp!98291 () Bool)

(declare-fun b_and!45835 () Bool)

(assert (=> start!108066 (= tp!98291 b_and!45835)))

(declare-fun b!1276250 () Bool)

(declare-fun e!728749 () Bool)

(assert (=> b!1276250 (= e!728749 false)))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun defaultEntry!1195 () Int)

(declare-datatypes ((V!49541 0))(
  ( (V!49542 (val!16739 Int)) )
))
(declare-fun minValue!1129 () V!49541)

(declare-fun k!1053 () (_ BitVec 64))

(declare-fun lt!575461 () Bool)

(declare-datatypes ((ValueCell!15766 0))(
  ( (ValueCellFull!15766 (v!19336 V!49541)) (EmptyCell!15766) )
))
(declare-datatypes ((array!83754 0))(
  ( (array!83755 (arr!40388 (Array (_ BitVec 32) ValueCell!15766)) (size!40938 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83754)

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun zeroValue!1129 () V!49541)

(declare-datatypes ((array!83756 0))(
  ( (array!83757 (arr!40389 (Array (_ BitVec 32) (_ BitVec 64))) (size!40939 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83756)

(declare-datatypes ((tuple2!21470 0))(
  ( (tuple2!21471 (_1!10746 (_ BitVec 64)) (_2!10746 V!49541)) )
))
(declare-datatypes ((List!28642 0))(
  ( (Nil!28639) (Cons!28638 (h!29847 tuple2!21470) (t!42178 List!28642)) )
))
(declare-datatypes ((ListLongMap!19127 0))(
  ( (ListLongMap!19128 (toList!9579 List!28642)) )
))
(declare-fun contains!7688 (ListLongMap!19127 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4663 (array!83756 array!83754 (_ BitVec 32) (_ BitVec 32) V!49541 V!49541 (_ BitVec 32) Int) ListLongMap!19127)

(assert (=> b!1276250 (= lt!575461 (contains!7688 (getCurrentListMap!4663 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k!1053))))

(declare-fun b!1276251 () Bool)

(declare-fun e!728750 () Bool)

(declare-fun tp_is_empty!33329 () Bool)

(assert (=> b!1276251 (= e!728750 tp_is_empty!33329)))

(declare-fun b!1276252 () Bool)

(declare-fun e!728747 () Bool)

(declare-fun e!728751 () Bool)

(declare-fun mapRes!51524 () Bool)

(assert (=> b!1276252 (= e!728747 (and e!728751 mapRes!51524))))

(declare-fun condMapEmpty!51524 () Bool)

(declare-fun mapDefault!51524 () ValueCell!15766)

